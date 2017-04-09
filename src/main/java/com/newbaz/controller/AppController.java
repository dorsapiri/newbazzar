package com.newbaz.controller;


import com.newbaz.dao.FileUploadDao;
import com.newbaz.model.*;
import com.newbaz.service.*;
import com.newbaz.util.FileValidator;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
//import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by dorsa on 1/15/17.
 */
@Controller
//@RequestMapping("/")
@SessionAttributes("roles")
public class AppController {

    @Autowired
    UserService userService;
    @Autowired
    UserProfileService userProfileService;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    @Autowired
    MessageSource messageSource;

    @Autowired
    WorkService workService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FileUploadDao fileUploadDao;

    @Autowired
    private SlideService slideService;

    @Autowired
    private FileValidator fileValidator;

    private static String UPLOAD_LOCATION="/home/dorsa/testfile/";

    @RequestMapping(value = {"list","admin/users"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        List<User> users = userService.findAllUsers();
        for(User user:users){
            user.setUserRole(user.getUserProfiles().toString().split("\\[")[2].split("=")[2].split("\\]")[0]);
        }
        model.addAttribute("users", users);
        model.addAttribute("loggedinuser", getPrincipal());
        return "users";
    }

    @RequestMapping(value = { "newuser","admin/newuser" }, method = RequestMethod.GET)
    public String newUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "registration";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * saving user in database. It also validates the user input
     */
    @RequestMapping(value = { "newuser","admin/newuser" }, method = RequestMethod.POST)
    public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

        // Get select element string and set userProfiles
        String[] mm = user.getUserRole().split(",");
        Set<UserProfile> us=new HashSet<>();
        us.add(userProfileService.findById(Integer.parseInt(mm[0])));
        user.setUserProfiles(us);

        if (result.hasErrors()) {
            System.out.println("There are errors");
            return "registration";
        }

        /*
         * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation
         * and applying it on field [sso] of Model class [User].
         *
         * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
         * framework as well while still using internationalized messages.
         *
         */
        if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
            FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
            result.addError(ssoError);
            return "registration";
        }

        userService.saveUser(user);

        model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        //return "success";
        return "login";
    }

    /**
     * This method will provide the medium to update an existing user.
     */
    @RequestMapping(value = { "admin/edit-user-{ssoId}" }, method = RequestMethod.GET)
    public String editUser(@PathVariable String ssoId, ModelMap model) {
        User user = userService.findBySSO(ssoId);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        model.addAttribute("loggedinuser", getPrincipal());
        return "registration";
    }

    /**
     * This method will be called on form submission, handling POST request for
     * updating user in database. It also validates the user input
     */
    @RequestMapping(value = { "edit-user-{ssoId}" }, method = RequestMethod.POST)
    public String updateUser(@Valid User user, BindingResult result,
                             ModelMap model, @PathVariable String ssoId) {

        if (result.hasErrors()) {
            return "registration";
        }
        userService.updateUser(user);
        model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
        model.addAttribute("loggedinuser", getPrincipal());
        return "login";
    }


    /**
     * This method will delete an user by it's SSOID value.
     */
    @RequestMapping(value = { "delete-user-{ssoId}" }, method = RequestMethod.GET)
    public String deleteUser(@PathVariable String ssoId) {
        userService.deleteUserBySSO(ssoId);
        return "redirect:admin";
    }

    /**
     * This method will provide UserProfile list to views
     */
    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

    @RequestMapping(value = "Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("loggedinuser", getPrincipal());
        return "accessDenied";
    }

    /**
     * This method handles login GET requests.
     * If users is already logged-in and tries to goto login page again, will be redirected to list page.
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage() {
        if (isCurrentAuthenticationAnonymous()) {
            return "login";
        } else {
            return "redirect:admin";
        }
    }

    /**
     * This method handles logout requests.
     * Toggle the handlers if you are RememberMe functionality is useless in your app.
     */
    @RequestMapping(value="logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
//            new SecurityContextLogoutHandler().logout(request, response, auth);
            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect: login?logout";
    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
    /**
     * This method returns true if users is already authenticated [logged-in], else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

    /**
     * Home
     * @param model
     * @return
     */
    String imag;
    @RequestMapping(value = {"/","home"},method = {RequestMethod.GET,RequestMethod.POST})
    public String viewHome(ModelMap model){

        List<Category> children = rootsOfCategory();
        Map<Category,List<Category>> allChildren = new HashMap<>();
        for (Category category: children){
            allChildren.put(category,categoryService.findByParent(category.getId()));
        }
        model.addAttribute("allChildren",allChildren);
        List<Work> works = workService.findAll();
        for (Work w: works){
            appendPics(w);
        }
        model.addAttribute("edit",false);
        model.addAttribute("works",works);
        model.addAttribute("loggedinuser", getPrincipal());
        return "home";
    }

    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String adminPage(ModelMap map){
        map.addAttribute("loggedinuser", getPrincipal());
        return "admin";
    }


    /**
     * About us page
     * @return
     */
    @RequestMapping(value = "about-us", method = RequestMethod.GET)
    public String aboutUs(){
        return "about-us";
    }

    /**
     * Contact us page
     * @return
     */
    @RequestMapping(value = "contact-us",method = RequestMethod.GET)
    public String contactUs(){
        return "contact-us";
    }


    @ModelAttribute("rootCategories")
    public List<Category> rootsOfCategory(){
        return categoryService.findByParent(0);
    }

    
    @RequestMapping(value = {"admin/new-work","new-work"}, method = RequestMethod.GET)
    public String newWork(ModelMap map,HttpServletRequest request){
        Work work =new Work();
        map.addAttribute("work",work);
        List<Category> parentCategories = categoryService.findByParent(0);
        List<Category> categories = categoryService.findAllCategory();
        map.addAttribute("categories",categories);
        map.addAttribute("pcat",parentCategories);
        map.addAttribute("loggedinuser", getPrincipal());
        return "new-work";
    }
    @RequestMapping(value = {"admin/new-work","new-work"}, method = RequestMethod.POST,headers = "Content-Type=multipart/form-data")
    public String saveWork(@Valid Work work,BindingResult result, ModelMap model,
                           @RequestParam CommonsMultipartFile[] uploadFile) throws Exception{

        work.setOwner(userService.findBySSO(getPrincipal()));
        work.setCreateDate(new Date());

        String[] catitem = work.getCategoryItem();
        Set<Category> ca=new HashSet<>();
        ca.add(categoryService.findById(Integer.parseInt(catitem[0])));
        work.setCategories(ca);
        work.setUploadFile(uploadImage(uploadFile));
        workService.insertW(work,work.getId());

        /*if (uploadFile != null && uploadFile.length > 0) {
            for (CommonsMultipartFile aFile : uploadFile){

                System.out.println("Saving file: " + aFile.getOriginalFilename());

                UploadFile upload_File = new UploadFile();
                upload_File.setFileName(aFile.getOriginalFilename());
                upload_File.setData(aFile.getBytes());
//                upload_File.setStuff(work);
                fileUploadDao.save(upload_File);
            }
        }*/
//        work.setUploadFile(uploadFile);
        return "new-work";
    }

    @RequestMapping(value = {"work-list","admin/work-list"},method = RequestMethod.GET)
    public String workList(ModelMap model){

        List<Work> works = workService.findAll();
        model.addAttribute("edit",false);
        model.addAttribute("works",works);
        return "works";
    }

    /**
     * Add product page
     * @return
     */
    @RequestMapping(value = "admin/new-product", method = RequestMethod.GET)
    public String addProduct(ModelMap model){
        model.addAttribute("loggedinuser", getPrincipal());
        return "new-product";
    }

    @RequestMapping(value = "admin/products",method = RequestMethod.GET)
    public String productsPage(){
        return "products";
    }


    @RequestMapping(value = "product",method = RequestMethod.GET)
    public String newProduct(ModelMap model){
        model.addAttribute("loggedinuser", getPrincipal());
        return "new-product";
    }

    @RequestMapping(value = {"admin/new-category"},method = RequestMethod.GET)
    public String newCategory(ModelMap model){
        /*Node<Category> root=makeTree(categoryService.findAllCategory());
        model.addAttribute("treeCategoriesL",root.travelsDLRList());*/

        Category category = new Category();
        model.addAttribute("category", category);
        model.addAttribute("edit", false);
        model.addAttribute("loggedinuser", getPrincipal());
        return "new-category";
    }
    @RequestMapping(value = {"admin/new-category","admin/category-list"},method = RequestMethod.POST)
    public String saveCategory(@Valid Category category, BindingResult result, ModelMap model){
        categoryService.insertCategory(category);
        model.addAttribute("category",category);
        return "redirect:/admin/";
    }


    @RequestMapping(value = "admin/category-list", method = RequestMethod.GET)
    public String categoryList(ModelMap model){
        List<Category> allCategories = categoryService.findAllCategory();
        model.addAttribute("allCategories",allCategories);
        if(categoryService.findAllCategory().size()!=0){
            Node<Category> root=makeTree(categoryService.findAllCategory());
            model.addAttribute("treeCategories",root.travelsDLR());
        }
        Category category = new Category();
        model.addAttribute("category", category);
        return "category-list";
    }
    /*@ModelAttribute("mycategories")
    public String allCategories(){
        Node<Category> root=makeTree(categoryService.findAllCategory());
        return root.travelsDLR();
    }*/
    public Node<Category> makeTree(List<Category> cats){
        Map<Integer,Node<Category>> map=new HashMap<>();
        Node<Category> root=null;
        for (Category cat :cats) {
            Node<Category> parent=map.get(cat.getParentId());
            if(parent==null){
                Category parentCat= new Category();
                parentCat.setCategoryName("");
                parent=new Node<Category>(parentCat);
                map.put(cat.getParentId(),parent);
                root=parent;
            }

            Node<Category> node=parent.addChild(cat);
            map.put(cat.getId(),node);

        }
        return root;
    }

    @RequestMapping(value = "admin/category-edit-{categoryId}",method = RequestMethod.GET)
    public String editCategory(@PathVariable Integer categoryId, ModelMap model){
        model.addAttribute("editcat",categoryService.findById(categoryId));
        return "new-category";
    }
    @RequestMapping(value = "admin/category-edit-{categoryId}",method = RequestMethod.POST)
    public String updateCategory(@Valid Category category,ModelMap model){

        return "new-category";
    }
    @RequestMapping(value = "information-{ssoId}", method = RequestMethod.GET)
    public String showCompleteInfo(@PathVariable String ssoId, ModelMap model){
        User user = userService.findBySSO(ssoId);
        model.addAttribute("user",user);
        return "user-form-info";
    }
    @RequestMapping(value = "information-{ssoId}", method = RequestMethod.POST)
    public String saveCompleteInfo(){
        return "user-form-info";
    }

    @InitBinder("fileBucket")
    protected void initBinderFileBucket(WebDataBinder binder) {
        binder.setValidator(fileValidator);
    }
    @RequestMapping(value = "admin/new-slideshow", method = RequestMethod.GET)
    public String newSlide(ModelMap model,HttpServletRequest request, HttpServletResponse response){
//        FileBucket fileModel = new FileBucket();
//        model.addAttribute("fileBucket", fileModel);
        Slide slide = new Slide();
        model.addAttribute("slide",slide);
        model.addAttribute("edit", false);
        return "new-slideshow";
    }
//
    @RequestMapping(value = "admin/new-slideshow",method = RequestMethod.POST)
    public String saveSlideshow(@Valid Slide slide, BindingResult result, ModelMap model) throws Exception{
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "new-slideshow";
        } else {
            FileBucket fileb = new FileBucket();
            fileb.setAddress(UPLOAD_LOCATION+slide.getFile().getOriginalFilename());
            slide.setSlideImage(fileb);
            slideService.insertSlide(slide,fileb);

            System.out.println("Fetching file");
            MultipartFile multipartFile = slide.getFile();
            //Now do something with file...
            FileCopyUtils.copy(slide.getFile().getBytes(), new File(UPLOAD_LOCATION + slide.getFile().getOriginalFilename()));
            String fileName = multipartFile.getOriginalFilename();
            model.addAttribute("fileName", fileName);

            return "redirect:/admin/";
        }

    }

    @RequestMapping(value = "admin/slideshow", method = RequestMethod.GET)
    public String slideshows(ModelMap model){
//        model.addAttribute("slide",slideshow);
        model.addAttribute("edit", false);
        return "slideshows";
    }

    private void appendPics(Stuff stuff){
        List<UploadFile> uploadFiles = fileUploadDao.findAll();
        String[] ms = new String[3];
        int i= 0;
        for (UploadFile uf: uploadFiles){
            if (stuff.getUploadFile()!=null){
                imag = Base64.encode(uf.getData());
                ms[i] = imag;
                stuff.setImages(ms);
                i++;
            }

        }
    }

    private Set<UploadFile> uploadImage(CommonsMultipartFile[] uploadFile){
        Set<UploadFile> uploadFiles = new HashSet<>();
        if (uploadFile != null && uploadFile.length > 0) {
            for (CommonsMultipartFile aFile : uploadFile){

                System.out.println("Saving file: " + aFile.getOriginalFilename());

                UploadFile upload_File = new UploadFile();
                upload_File.setFileName(aFile.getOriginalFilename());
                upload_File.setData(aFile.getBytes());
//                upload_File.setSlideshow(slideshow);
                fileUploadDao.save(upload_File);
                uploadFiles.add(upload_File);
            }
        }
        return uploadFiles;
    }
}