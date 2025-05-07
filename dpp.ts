import {
	BaseConfig,
	type ConfigArguments,
	type ConfigReturn,
} from "jsr:@shougo/dpp-vim/config";
import { type Toml } from "jsr:@shougo/dpp-ext-toml";
import { expand } from "jsr:@denops/std/function";


export class Config extends BaseConfig {
	override async config(args: ConfigArguments): Promise<ConfigReturn> {
		args.contextBuilder.setGlobal({
			protocols: ["git"],
		});

		const [context, options] = await args.contextBuilder.get(args.denops);
		const dotfilesDir = "~/.config/vim/";

		const toml: Toml = await args.dpp.extAction(
			args.denops,
			context,
			options,
			"toml",
			"load",
			{
				path: await expand(args.denops, dotfilesDir + "plugins.toml")
			}
		);

		const tomlHooksFiles: string[] | undefined = [];
		if (toml.hooks_file !== undefined) {
			tomlHooksFiles.push(toml.hooks_file)
		}

		console.log(toml);

		return {
			plugins: toml.plugins ?? [],
			ftplugins: toml.ftplugins,
			hooksFiles: tomlHooksFiles,
			multipleHooks: toml.multiple_hooks,
		}
	}
}

