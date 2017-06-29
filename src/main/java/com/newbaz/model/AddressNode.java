package com.newbaz.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 4/22/17.
 */
public class AddressNode<T extends Address> {

    protected T data;
    protected List<AddressNode<T>> children=new ArrayList<AddressNode<T>>();

    public AddressNode(T data) {
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<AddressNode<T>> getChildren() {
        return children;
    }

    public AddressNode<T> addChild(T nodeData){
        AddressNode<T> node = new AddressNode<>(nodeData);
        children.add(node);
        return node;
    }
    public void addChild(AddressNode<T> node){
        children.add(node);
    }

    public String travelsDLR() {

        return travelsDLR(this);
    }

    int depth=0;
    public String travelsDLR(AddressNode<T> addressNode){
        depth++;
        String r;
        if(addressNode.children.isEmpty() && addressNode.data.getParentId()!=0){

            r= String.format("<tr class='d-%d'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                            "<td><a href='edit-state-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+
                            "<td><a href='delete-state-%s' class='btn btn-danger custom-width'>حذف</a></td>"+"</tr>"
                    ,depth,addressNode.data.getId(),addressNode.data.getState(),addressNode.data.getParentId(),addressNode.data.getId(),addressNode.data.getId());


        }else {
            String chdStr="";
            for (AddressNode<T> child :
                    addressNode.children) {
                chdStr += travelsDLR(child);
            }

            r=String.format("<tr class='d-%d'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                            "<td><a href='edit-state-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+
                            "<td><a href='delete-state-%s' class='btn btn-danger custom-width'>حذف</a></td>"+
                            "</tr>%s",
                    depth,addressNode.data.getId(),addressNode.data.getState(),addressNode.data.getParentId(),addressNode.data.getId(),addressNode.data.getId(),chdStr);
        }

        depth--;
        return r;
    }

    public String travelsDLR(AddressNode<T> addressNode,int depth){

        String r;
        if(addressNode.children.isEmpty() && addressNode.data.getParentId()!=0){

            r= String.format("<tr class='d-%d'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                            "<td><a href='edit-work-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+"</tr>"
                    ,depth,addressNode.data.getId(),addressNode.data.getState(),addressNode.data.getParentId(),addressNode.data.getId());


        }else {
            String chdStr="";
            for (AddressNode<T> child :
                    addressNode.children) {
                chdStr += travelsDLR(child,depth+1);
            }

            r=String.format("<tr class='d-%d'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                            "<td><a href='edit-work-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+
                            "</tr>%s",
                    depth,addressNode.data.getId(),addressNode.data.getState(),addressNode.data.getParentId(),addressNode.data.getId(),chdStr);
        }


        return r;
    }

    public String travelsDLRList() {

        return travelsDLR(this);
    }

    public String travelsDLRList(AddressNode<T> addressNode){

        if(addressNode.children.isEmpty() && addressNode.data.getParentId()!=0){
            return String.format("<li>-%s</li>",addressNode.data);

        }else {
            String chdStr="";
            for (AddressNode<T> child :
                    addressNode.children) {
                chdStr += travelsDLR(child);
            }

            return String.format("<li>%s</li><ul class='tree-category'>%s</ul>",addressNode.data,chdStr);

        }
    }

    public String travelsDLRSelect(){
        return travelsDLRSelect(this);
    }

    public String travelsDLRSelect(AddressNode<T> addressNode){
        depth++;
        String r;
        if(addressNode.children.isEmpty() && addressNode.data.getParentId()!=0){
            r= String.format("<option class='d-%d' value='%s'><div class='d-%d'></div>%s</option>"
                    ,depth,addressNode.data.getId(),depth,addressNode.data.getState());


        }else {
            String chdStr="";
            for (AddressNode<T> child :
                    addressNode.children) {
                chdStr += travelsDLRSelect(child);
            }
            r= String.format("<option class='d-%d' value='%s'><div class='d-%d'></div>%s</option>%s"
                    ,depth,addressNode.data.getId(),depth,addressNode.data.getState(),chdStr);

        }
        depth--;
        return r;
    }

    @Override
    public String toString() {
        return data.toString();
    }
}
