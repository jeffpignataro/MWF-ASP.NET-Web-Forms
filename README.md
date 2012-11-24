# Using MWF with ASP.NET Web Forms

Since __Mobile Web Framework (MWF)__ is platform-agnostic, the framework
can be consumed within any environment (PHP, raw HTML, Coldfusion, etc.). This also
includes __.NET Web Forms__. 

However, a lot of the functionality within the .NET Web Forms framework is enabled by placing
Server Controls within a `form` element. Unfortunately, this can cause issues
with MWF's default styling, which expects that only standard form elements will be included within
`form` elements.

This repository contains two major components:

* An __override stylesheet__ to correct these styling issues
* __Guidelines__ for restructuring ASP.NET Web Forms to avoid these issues

## Override Stylesheet

To apply the override stylesheet, simply add the `.webform` CSS class to the ASP.NET form containing
the web page's elements. For forms within this containing form, use a `div` element with an
`.inner-form` CSS class instead of a form.

For example, imagine we have the following standard MWF page with a form:

```html
<!-- Insert Example -->
```

Now, imagine this page was wrapped in a form element. To force the styling to match the...

```html
<!-- Insert Example -->
```

## Guidelines

The following guidelines provide some advice for addressing the complexities of...

### Restrict Form Scope

Many of the Server Controls do not actually require a wrapping `form` element. For example,
the controls that do not require user state, including `Label`, `Image`,
and `Hyperlink`) can exist outside of a form.

TODO