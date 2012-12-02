# Using MWF with ASP.NET Web Forms

Since __Mobile Web Framework (MWF)__ is platform-agnostic, the framework
can be consumed within any environment (PHP, raw HTML, Coldfusion, etc.). This also
includes __ASP.NET Web Forms__. 

However, a lot of the functionality within the ASP.NET Web Forms framework is enabled by placing
Server Controls within a `form` element. Unfortunately, this can cause issues
with MWF's default styling, which expects that only standard form entities will be included within
the `form` element.

This repository contains two major components:

* A set of __override styles__ to correct these styling issues
* __Guidelines__ for restructuring ASP.NET Web Forms pages to avoid these issues

## Override Styles

### Including the Stylesheets

To apply the override styles, you need to create a directory underneath the `mwf/root/assets/css`
directory (for example `aspnetoverride`), that includes the three stylesheets, and then reference this
directory in the `mwf/config/css.ini` configuration file:

```
custom[]="aspnetoverride"
```

Alternatively, you could include the stylesheets
[via the CSS handler](https://github.com/ucla/mwf/wiki/API%3A-Script%3A-CSS-Handler):

```
<link rel="stylesheet" href="http://{MOBILE_DOMAIN}/assets/css.php?basic={PATH_TO_BASIC.CSS}&standard={PATH_TO_STANDARD.CSS}&full={PATH_TO_FULL.CSS}" type="text/css">
```

### Applying the Styles

Next, simply add the `.webform` CSS class to the ASP.NET form containing
the web page's elements. For forms within this containing form, use a `div` element with an
`.inner-form` CSS class instead of a form.

For example, imagine we have the following standard MWF page with a form:

```html
<h1 id="header">
	<a href="/"><img src="/img/logo.png" alt="Home" /></a>
	<span>Web Forms Example Page</span>
</h1>
          
<form>
	<label>
		<span>Name</span>
		<input type="text" name="name-input" required="required" placeholder="Input Name" />
		<span class="invalid">Name value was invalid</span>
	</label>
</form>
```

Now, imagine this page was wrapped in a form element. To force the styling to match the default
MWF styling, add `.webform` to the containing `form` element and switch the inner `form` with
a `div` with the `.inner-form` CSS class.

```html
<form id="mainForm" runat="server" class="webform">

	<h1 id="header">
		<a href="/"><img src="/img/logo.png" alt="Home" /></a>
		<span>Web Forms Example Page</span>
	</h1>
          
	<div class="inner-form">
		<label>
			<span>Name</span>
			<input type="text" name="name-input" required="required" placeholder="Input Name" />
			<span class="invalid">Name value was invalid</span>
		</label>
	</div>

</form>
```

## Guidelines

The following guidelines provide some general advice for avoiding the issues described above:

### Restrict Form Scope

Many of the Server Controls do not actually require a wrapping `form` element. For example,
the controls that do not require user state, including `Label`, `Image`,
and `Hyperlink`) can exist outside of a form.

### Don't Include a Wrapping Form on the MasterPage

As noted above, since many Server Controls do not require a wrapping `form` element, not
including this `form` element on a MasterPage will allow consumers of the MasterPage to
only use a containing `form` when necessary.

### Don't Use Unnecessary Server Controls

Although ASP.NET Web Forms development encourages the use of Server Controls, they are not
always necessary. For example, the following:

```html
<asp:HyperLink Text="About Me" NavigateUrl="~/About.aspx" runat="server"></asp:HyperLink>
```

Could easily be replaced with the following:

```html
<a href="~/About.aspx" runat="server">About Me</a>
```

Furthermore, if application URL resolving is unnecessary, this could be further reduced to:

```html
<a href="About.aspx">About Me</a>
```

## Disclaimer

This project is neither endorsed by nor affiliated with the main UCLA Mobile Web Framework Project.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.