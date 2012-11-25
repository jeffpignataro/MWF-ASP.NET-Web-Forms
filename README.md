# Using MWF with ASP.NET Web Forms

Since __Mobile Web Framework (MWF)__ is platform-agnostic, the framework
can be consumed within any environment (PHP, raw HTML, Coldfusion, etc.). This also
includes __ASP.NET Web Forms__. 

However, a lot of the functionality within the ASP.NET Web Forms framework is enabled by placing
Server Controls within a `form` element. Unfortunately, this can cause issues
with MWF's default styling, which expects that only standard form elements will be included within
`form` elements.

This repository contains two major components:

* An __override stylesheet__ to correct these styling issues
* __Guidelines__ for restructuring ASP.NET Web Forms pages to avoid these issues

## Override Stylesheet

To apply the override stylesheet, simply add the `.webform` CSS class to the ASP.NET form containing
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
MWF styling, add the `.webform` to the containing `form` element and switch the inner `form` with
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

The following guidelines provide some advice for...

### Restrict Form Scope

Many of the Server Controls do not actually require a wrapping `form` element. For example,
the controls that do not require user state, including `Label`, `Image`,
and `Hyperlink`) can exist outside of a form.

TODO

## Disclaimer

This project is neither endorsed by nor affiliated with the main UCLA Mobile Web Framework Project.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.