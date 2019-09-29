import { Env, I18n, Validators } from "loco-js";

class Vulgarity extends Validators.Base {
  static identity = "Vulgarity";

  constructor() {
    super();
  }

  validate() {
    if (this.val == null) return;
    switch (typeof this.val) {
      case "string": {
        const vulgarWord = this._getVulgarWord();
        const match = new RegExp(`${vulgarWord}`, ["i"]).exec(this.val);
        if (match) this._addErrorMessage();
        else return;
        break;
      }
      default:
        throw new TypeError(
          `Vulgarity validator is applicable only for strings and ${this.attr} isn't.`
        );
    }
  }

  _addErrorMessage() {
    const message = I18n[Env.loco.getLocale()].errors.messages.vulgarity;
    this.obj.addErrorMessage(message, { for: this.attr });
  }

  _getVulgarWord() {
    switch (Env.loco.getLocale()) {
      case "pl":
        return "kurwa";
      case "en":
        return "fuck";
    }
  }
}

export default Vulgarity;
