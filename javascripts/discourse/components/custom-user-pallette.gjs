import Component from "@glimmer/component";
import { array } from "@ember/helper";
import DButton from "discourse/components/d-button";
import icon from "discourse-common/helpers/d-icon";
import DMenu from "float-kit/components/d-menu";
import CustomPalletteCreator from "./custom-pallette-creator";
import SitePallette from "./site-pallette";
import {
  listColorSchemes,
  loadColorSchemeStylesheet,
  updateColorSchemeCookie,
} from "discourse/lib/color-scheme-picker";
import { service } from "@ember/service";


export default class CustomUserPallette extends Component {
  @service site;

  get userSelectableColorSchemes() {
    return listColorSchemes(this.site);
  }

  <template>
    <DMenu
    @identifier="user-color-pallette"
    @triggers={{array "click"}}
    @placementStrategy="fixed"
    class="btn-flat user-color-pallette sidebar-footer-actions-button"
    @inline={{true}}
    >
      <:trigger>
        {{icon "paint-brush"}}
      </:trigger>
      <:content>
      <div class="color-pallette-menu">
        <div class="color-pallette-menu__content">
          {{#each this.userSelectableColorSchemes as |colorScheme|}}
            <SitePallette
              @colorScheme={{colorScheme}}
            />
          {{/each}}
        </div>
      </div>
      </:content>
    </DMenu>
  </template>
}
