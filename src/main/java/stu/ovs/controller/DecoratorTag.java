package stu.ovs.controller;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

/**
 * 自定义标签
 * Created by Alcott Hawk on 4/2/2017.
 */
public class DecoratorTag implements TagRuleBundle {

    public void install(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
        defaultState.addRule("css",new ExportTagToContentRule(siteMeshContext,contentProperty.getChild("css"),false));
        defaultState.addRule("js",new ExportTagToContentRule(siteMeshContext,contentProperty.getChild("js"),false));
    }

    public void cleanUp(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {

    }
}
