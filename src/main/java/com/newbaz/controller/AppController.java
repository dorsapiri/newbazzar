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
import org.springframework.ui.Model;
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

    @Autowired
    private ProductService productService;

    private static String UPLOAD_LOCATION="/home/dorsa/IdeaProjects/spring/newbazzar/src/main/webapp/resources/img/";
//    private static String UPLOAD_LOCATION="/home/dorsa/IntelliJIDEAProjects/spring project/newbazzar/src/main/webapp/resources/img/";
//    private static String DOWNLOAD_LOCATION="/resources/img/";

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
        Set<UserProfile> us=new HashSet<>();
        if (user.getUserProfiles().size()==0){
            us.add(userProfileService.findByType("USER"));
            user.setUserProfiles(us);
        }else {
            String[] mm = user.getUserRole().split(",");
            us.add(userProfileService.findById(Integer.parseInt(mm[0])));
            user.setUserProfiles(us);
        }

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

        List<Category> grandParent = rootsOfCategory();
        Map<Category,List<Category>> allParent = new HashMap<>();
        Map<Category,List<Category>> allChildren = new HashMap<>();
        for (Category category: grandParent){
            allParent.put(category,categoryService.findByParent(category.getId()));
            for (Category ch:categoryService.findByParent(category.getId())){
                allChildren.put(ch,categoryService.findByParent(ch.getId()));
            }
        }
        model.addAttribute("allChildren",allChildren);
        model.addAttribute("allParent",allParent);

        List<Work> works = workService.findAll();

        model.addAttribute("edit",false);
        model.addAttribute("works",works);
        model.addAttribute("loggedinuser", getPrincipal());

        model.addAttribute("slides",slideService.findAllSlides());
        return "home";
    }

    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String adminPage(ModelMap map){
        map.addAttribute("loggedinuser", getPrincipal());
        return "admin";
    }


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam("srch") String serviceName,Model model){
        List<Work> sr = searchResult(serviceName);
        List<String> professions = new ArrayList<String>();
        for (Work w: sr){
//            appendPics(w);
            if (professions.size()==0){
                professions.add(w.getProfession());
            }
            if (!professions.contains(w.getProfession())){
                professions.add(w.getProfession());
            }

        }
        model.addAttribute("professions",professions);

        model.addAttribute("shj",sr);
        return "search";
    }
    private List<Work> searchResult(String name){
//        List<Work> result = workService.findByName(name);
        List<Work> result = workService.searchWork(name);
       /* for (Work se : works){
            if (se.getServiceName().contains(name)){
                result.add(se);
            }
        }*/
        return result;
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

    @ModelAttribute("allCategories")
    public List<Category> allCategories(){
        return categoryService.findAllCategory();
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
    static <T> T[] append(T[] arr, T element) {
        final int N = arr.length;
        arr = Arrays.copyOf(arr, N + 1);
        arr[N] = element;
        return arr;
    }
    @RequestMapping(value = {"admin/new-work","new-work"}, method = RequestMethod.POST,headers = "Content-Type=multipart/form-data")
    public String saveWork(@Valid Work work,BindingResult result, ModelMap model) throws Exception{

        work.setOwner(userService.findBySSO(getPrincipal()));
        work.setCreateDate(new Date());

        String[] catitem = work.getCategoryItem();
        if (catitem.length==2){
            catitem= append(catitem,"0");
        }
        Set<Category> ca=new HashSet<>();
        if(!catitem[2].equals("0")){
            ca.add(categoryService.findById(Integer.parseInt(catitem[2])));
        } else if (!catitem[1].equals("0")){
            ca.add(categoryService.findById(Integer.parseInt(catitem[1])));
        }else {
            ca.add(categoryService.findById(Integer.parseInt(catitem[0])));
        }
        work.setCategories(ca);
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "new-work";
        }else {
            /*List<FileBucket> fileBuckets = new ArrayList<FileBucket>();
            for (MultipartFile multipartFile:work.getFiles()) {
                FileBucket fileBucket = new FileBucket();
                fileBucket.setPath(multipartFile.getOriginalFilename());
                fileBuckets.add(fileBucket);
                FileCopyUtils.copy(multipartFile.getBytes(), new File(UPLOAD_LOCATION + multipartFile.getOriginalFilename()));
            }
            work.setImages(fileBuckets);*/
            work.setImages(getFiles(work.getFiles()));
        }
        workService.insertW(work,work.getId());
        return "redirect:/admin/";
    }

    @RequestMapping(value = {"admin/load_selct","load_selct"},method = RequestMethod.GET)
    public @ResponseBody List<Category> orgCat(@RequestParam("catId") Integer catId){
        return categoryService.findByParent(catId);
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

    @RequestMapping(value = "admin/products",method = RequestMethod.GET)
    public String productsPage(){
        return "products";
    }


    @RequestMapping(value = {"{ssoId}/new-product", "admin/new-product"},method = RequestMethod.GET)
    public String newProduct(@PathVariable String ssoId,ModelMap model,HttpServletRequest request){

        model.addAttribute("loggedinuser", getPrincipal());
        if (getPrincipal().equals(ssoId)){
            Product product = new Product();
            model.addAttribute("product",product);
            return "new-product";
        }else {
            return "redirect:/Access_Denied/";
        }

    }

    @RequestMapping(value = {"{ssoId}/new-product", "admin/new-product"},method = RequestMethod.POST,headers = "Content-Type=multipart/form-data")
    public String saveProduct(@Valid Product product, BindingResult result,ModelMap model,@PathVariable String ssoId)throws Exception{
        User user = userService.findBySSO(ssoId);
        product.setOwner(user);
        product.setCreateDate(new Date());
        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "new-product";
        }else {

            product.setImages(getFiles(product.getFiles()));
        }
        productService.insertP(product);
        model.addAttribute("product",product);
        return "new-product";
    }
    public List<FileBucket> getFiles(List<MultipartFile> formFile)throws Exception{
        List<FileBucket> fileBuckets = new ArrayList<FileBucket>();
        for (MultipartFile multipartFile:formFile) {
            FileBucket fileBucket = new FileBucket();
            fileBucket.setPath(multipartFile.getOriginalFilename());
            fileBuckets.add(fileBucket);
            FileCopyUtils.copy(multipartFile.getBytes(), new File(UPLOAD_LOCATION + multipartFile.getOriginalFilename()));
        }
        return fileBuckets;
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

        if(allCategories.size()!=0){
            Node<Category> root=makeTree(categoryService.findAllCategory());
//            Node<Category> root=makeTree(sorted);
            model.addAttribute("treeCategories",root.travelsDLR());
        }
        Category category = new Category();
        model.addAttribute("category", category);
        return "category-list";
    }
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
                if(cat.getParentId()==0)
                    root=parent;
            }
            Node<Category> node= map.get(cat.getId());

            if(node==null)
                node=parent.addChild(cat);
            else {
                node.setData(cat);
                parent.addChild(node);
            }
            map.put(cat.getId(),node);

        }
        return root;
    }

    @RequestMapping(value = "admin/edit-category-{categoryId}",method = RequestMethod.GET)
    public String editCategory(@PathVariable Integer categoryId, ModelMap model){
        model.addAttribute("category",categoryService.findById(categoryId));
        model.addAttribute("edit", true);
        return "new-category";
    }
    @RequestMapping(value = "admin/edit-category-{categoryId}",method = RequestMethod.POST)
    public String updateCategory(@Valid Category category,ModelMap model, BindingResult result,
                                 @PathVariable Integer categoryId){
        if (result.hasErrors()) {
            return "new-category";
        }
        categoryService.updateCat(category);
        return "redirect:/admin/";
    }
    @RequestMapping(value = "admin/delete-category-{categoryId}", method = RequestMethod.GET)
    public String deleteCategory(@PathVariable Integer categoryId){
        Category category = categoryService.findById(categoryId);
        if(categoryService.findByParent(categoryId)!=null){
            List<Category> categories = categoryService.findByParent(categoryId);
            for (Category catItem: categories){
                catItem.setParentId(category.getParentId());
                categoryService.updateCat(catItem);
            }
        }
        categoryService.delete(category);
        return "redirect:/admin/";
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
            fileb.setPath(slide.getFile().getOriginalFilename());
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
        List<Slide> slides=slideService.findAllSlides();
        model.addAttribute("slides",slides);
        model.addAttribute("edit", false);
        return "slideshows";
    }
    @RequestMapping(value = "admin/remove-slide-{slideId}", method = RequestMethod.GET)
    public String deleteSlide(@PathVariable Integer slideId){
        slideService.deleteSlide(slideId);
        return "redirect:/admin/#slideshow";
    }

    String str;
    @RequestMapping(value = "user-panel/{ssoId}", method = RequestMethod.GET)
    public String userProfile(@PathVariable String ssoId,ModelMap model){
        User user = userService.findBySSO(ssoId);
        User currentUser = userService.findBySSO(getPrincipal());
        str=currentUser.getUserProfiles().toString().split("\\[")[2].split("=")[2].split("\\]")[0];
        model.addAttribute("loggedinuser",getPrincipal());
        List<Work> works = workService.findByOwner(currentUser);
        List<Product> products = productService.findByOwner(currentUser);
        if (ssoId.equals(getPrincipal()) || str.equals("ADMIN")){
            model.addAttribute("user",user);
            model.addAttribute("works",works);
            model.addAttribute("products",products);
            return "user-panel";
        }else {
            return "accessDenied";
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