<!-- BEGIN: MAIN -->
<div id="confing-{CONFIG_NAME}">
    <template>

        <div class="uk-grid uk-grid-small uk-text-small uk-margin-bottom" uk-grid>
            <div class="uk-width-1-5@m">
                <label>{PHP.L.Module}</label>
            </div>
            <div class="uk-width-1-5@m">
                <label>{PHP.L.parent_category}</label>
            </div>
            <div class="uk-width-1-5@m">
                <label>{PHP.L.Parameter} (GET)</label>
            </div>
            <div class="uk-width-expand@m">
                <label>URL Regex</label>
            </div>
        </div>
        <div v-for="(item, idx) in items" :key="'config-' + idx" class="uk-margin-bottom">
            <div class="uk-grid uk-grid-small" uk-grid>
                <div class="uk-width-1-5@m">
                    <select v-model="item.module" class="uk-select">
                        <option :value="module.code" v-for="module in modules" :key="module.code">{{ module.code }}</option>
                        <option value="login">login</option>
                        <option value="login">message</option>
                        <option value="login">admin</option>
                        <option value="plug">plug</option>
                    </select>
                </div>
                <div class="uk-width-1-5@m">
                    <input type="text" v-model="item.start_at" class="uk-input" @input="update(items)">
                </div>
                <div class="uk-width-1-5@m">
                    <input type="text" v-model="item.params" class="uk-input" @input="update(items)">
                </div>
                <div class="uk-width-expand@m">
                    <input type="text" v-model="item.pattern" class="uk-input" @input="update(items)">
                </div>
                <div class="uk-width-auto@m">
                    <a href="javascript:void()" class="uk-icon-button uk-button-danger uk-button-small" @click="removeItem(idx)">-</a>
                </div>
            </div>
        </div>
        <div class="uk-text-right">
            <a href="javascript:void()" class="uk-icon-button uk-button-secondary uk-button-small" @click="addItem">+</a>
        </div>
    </template>
</div>
<script>
    $('[data-config-title]').hide();
    $('[name="{CONFIG_NAME}"]').hide();
    setTimeout(function () {
        $('[data-config-reset]').hide();
        var confing_{CONFIG_NAME} = new Vue({
            el: '#confing-{CONFIG_NAME}',
            data: {
                items: JSON.parse({CONFIG_VALUE}),
                modules: JSON.parse('{CONFIG_MODULES}'),
            },
            created(){
                // this.update(this.items);
            },
            methods: {
                addTag(newTag) {
                    const tag = newTag;
                    this.options.push(tag)
                    this.value.push(tag)
                },
                update(value) {
                    // console.log(value)
                    $('[name="{CONFIG_NAME}"]').val(JSON.stringify(value));
                },
                addItem: function () {
                    this.items.push({
                        module: '',
                    })
                },
                removeItem: function (idx) {
                    this.items.splice(idx, 1);
                }
            },
            watch: {
                items: function(value) {
                    this.update(this.items);
                }
            }
        });
    }, 100);
</script>
<!-- END: MAIN -->