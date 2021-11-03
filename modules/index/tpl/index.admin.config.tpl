<!-- BEGIN: MAIN -->
<div id="confing-{CONFIG_NAME}">
    <template>
        <ul class="uk-accordion" uk-accordion>
            <li v-for="(category, index) in items" :key="index" :class="index === 'main' ? 'uk-open' : ''">
                <a class="uk-accordion-title" href="#" v-text="category.title"></a>
                <div class="uk-accordion-content">
                    <div class="uk-grid" uk-grid v-for="item in category.values" :key="item.key">
                        <div class="uk-width-1-4@m" v-text="item.title"></div>
                        <div class="uk-width-expand@m">
                            <textarea v-model="item.value" id="" :placeholder="item.default" v-text="item.default" class="uk-textarea uk-width-1-1" v-if="item.type === 'text'" @input="input" rows="15"></textarea>
                            <input v-model="item.value" id="" :placeholder="item.default" v-text="item.default" class="uk-textarea uk-width-1-1" v-else-if="item.type === 'string'" @input="input"/>
                            <div v-else-if="item.type === 'radio'">
                                <label>{__('Yes')} <input v-model="item.value" type="radio" value="Y" @change="input" :checked="item.value === 'Y'"></label>
                                <label>{__('No')} <input v-model="item.value" type="radio" value="N" @change="input":checked="item.value === 'N'"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </template>
</div>
<script>
    $('[data-config-title]').hide();
    $('[name="{CONFIG_NAME}"]').hide();
    setTimeout(function () {
        var confing_{CONFIG_NAME} = new Vue({
            el: '#confing-{CONFIG_NAME}',
            data: {
                items: {CONFIG_ITEMS}
            },
            methods: {
                input(){
                $('[name="{CONFIG_NAME}"]').val(JSON.stringify(this.items));
                }
            },
        });
    }, 100);
</script>
<!-- END: MAIN -->