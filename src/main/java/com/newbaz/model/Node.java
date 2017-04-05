package com.newbaz.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dorsa on 3/23/17.
 */
public class Node<T extends Category> {
    protected T data;
    protected List<Node<T>> children=new ArrayList<Node<T>>();

    public Node(T data) {
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<Node<T>> getChildren() {
        return children;
    }

    public Node<T> addChild(T nodeData){
        Node<T> node = new Node<>(nodeData);
        children.add(node);
        return node;
    }
    public void addChild(Node<T> node){
        children.add(node);
    }

    public String travelsDLR() {

        return travelsDLR(this);
    }
    public String travelsDLR(Node<T> node){

        if(node.children.isEmpty() && node.data.getParentId()!=0){
            return String.format("<tr class='tree-child'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                    "<td><a href='edit-work-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+"</tr>"
                    ,node.data.getId(),node.data.getCategoryName(),node.data.getParentId(),node.data.getId());
        }else {
            String chdStr="";
            for (Node<T> child :
                    node.children) {
                chdStr += travelsDLR(child);
            }

            return String.format("<tr class='tree-parent'><td>%s</td><td class='cat-name'>%s</td><td>%s</td>"+
                    "<td><a href='edit-work-%s' class='btn btn-success custom-width'>ویرایش</a></td>"+
                            "</tr>%s",
                    node.data.getId(),node.data.getCategoryName(),node.data.getParentId(),node.data.getId(),chdStr);
        }
    }

    public String travelsDLRList() {

        return travelsDLR(this);
    }

    public String travelsDLRList(Node<T> node){

        if(node.children.isEmpty() && node.data.getParentId()!=0){
            return String.format("<li>-%s</li>",node.data);

        }else {
            String chdStr="";
            for (Node<T> child :
                    node.children) {
                chdStr += travelsDLR(child);
            }

            return String.format("<li>%s</li><ul class='tree-category'>%s</ul>",node.data,chdStr);

        }
    }
    @Override
    public String toString() {
        return data.toString();
    }
}
