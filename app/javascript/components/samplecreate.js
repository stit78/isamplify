const sampleCreateForm = (event) => {
  const input = document.getElementById("aaaaaaa");
  const text = `<br><div class="form-group string required dose_description">\n
<label class="form-control-label string required" for="dose_description">Description <abbr title="required">*</abbr></label>\n
<input class="form-control string required" type="text" name="dose[description]" id="dose_description">\n
</div> \n
<div class="form-group select required dose_ingredient">\n
<label class="form-control-label select required" for="dose_ingredient_id">Ingredient <abbr title="required">*</abbr></label>\n
<select class="form-control select required" name="dose[ingredient_id]" id="dose_ingredient_id">\n
<option value=""></option>\n
<option value="2">ice</option>\n
<option value="1">lemon</option>\n
<option value="3">mint leaves</option></select></div>\n
<input type="submit" name="commit" value="Add your first dose" class="btn btn-success" id="create" data-disable-with="Add your first dose">
`;
  input.insertAdjacentHTML('beforeend', text);
};




export { sampleCreateForm };
