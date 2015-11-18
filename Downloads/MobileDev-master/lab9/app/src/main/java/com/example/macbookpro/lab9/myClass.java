package com.example.macbookpro.lab9;

/**
 * Created by macbookpro on 12/11/15.
 */
public class myClass {
    private String id;
    private String Title;
    private String Completed;

    public myClass(String id, String Title, String Completed) {
        this.id = id;
        this.Title = Title;
        this.Completed = Completed;
    }

    public String getCompleted() {
        return Completed;
    }

    public void setCompleted(String completed) {
        Completed = completed;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
