import Component from "@glimmer/component";
import { ajax } from "discourse/lib/ajax";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import {
  loadColorSchemeStylesheet,
  updateColorSchemeCookie,
} from "discourse/lib/color-scheme-picker";


export default class SitePallette extends Component {
    @action
    handleInput() {
        loadColorSchemeStylesheet(this.args.colorScheme.id);
        updateColorSchemeCookie(this.args.colorScheme.id);
    }

    <template>
        <div class="color-pallette-menu__item">
        <input
            name="pallette"
            class="color-pallette-menu__item-choice"
            type="radio"
            value=""
            {{on "change" this.handleInput}}
        />
        <div
            class="color-pallette-menu__item-preview"
            style="background-color: {{this.bgColor}}"
        ></div>
        <span class="color-pallette-menu__item-name">{{@colorScheme.name}}</span>
        </div>
    </template>
}
