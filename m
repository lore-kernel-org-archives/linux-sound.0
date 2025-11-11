Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969051891A9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820583; cv=fail; b=S8FQRa4lJ2N+mqz/hNwCYpd2umMydyXBnECBCiQ9cjvUGwANao0GG/bootx202grE3ZI5vl0eTGNFsfpuyDDJAedYlkOhpAc/GgFh+KUrYQSf7zzMLF1daF26osXXo1WtQOvJDfxQoo7VmMdqnHspg7IkWac0hqqYsTu/s0uN1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820583; c=relaxed/simple;
	bh=RwPUq9P8RvrOnynwodzaDeSPvh8FQlUZy/t3KpCfezw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d1nU3ZHG7+XdIsrn4GJg6Q5iFzTp0V7TCNsEQicPdIS9CrjLP27phBPFwjlm32N1iMnoSDZFt/gDfRkbLK9Y7pM1I8ecqWGK8Sskcf9Za5MKt7e/Z3pWFQJoZdLXrLsYnWkGlBWt1e7HXLD8vbiQcnmcNtesAsu60bhH8viS+vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TKMWFQnW; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TKMWFQnW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGF8sdyHUqQG4LHbBGYokqiTVAfQP793aedZy9JOXKfVCYsjoLgLatxN3Kc6/bohuN+wr8q5m/+i6cbUy7CcvkUlcbWBmNRe5G06yWrldQTaoN38Bk1P3MwpgXo6hL9xQmX38LIrZuK/n7YxndJ7N2ONQ7QXoYjjno6VEg/7FkKeTymkbTS4oXnzcvwce+Tu3hREW5b/Fb99DE7ya/LzwdlxQI20ZMJKtA26iwmT3YK9o+hXhnFNSKretEh3e7m7Mvb72TQ9u/My/t3L0GnjGFso79ICeYEXnuMOeiCHxfXk07JZALllNcxzZfk6OP9kVvqq5s6I9E1RSZKgUbX7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMn6oafMBjCD11Agm9TXZrqLA5kmBAX99GYiUn3pCgI=;
 b=h4p7rjPmltLruBjMlzJ6M5F1mUEZIz981vLAWqF4Pa2MWoxrEdOs+emf+u81WhnT2mGyHLqV2+KP3KZ4KUIkz/A/9SyiUPbG22QRX5a/6SDafpyqzQf6ePNeWH8/gPGF7ElW98YH5DYXFtuELUaf1R7gr4F26030jDOJoW8PUrRAHkmalovH+zS7QUtXKcgfnWgXyg0WYj4vTogF2prRAFPyduPUIOeU066Q8jg545fpBPVQiUY64m0QjQF4PbtN7wZdpR8vqhj6tuZzxXwjGeNYwjUkg1uoNqHpGzaF9RanTHCxD+wIyVSBXnybu1WleGNh0Do8Nn8yScHAd6oe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMn6oafMBjCD11Agm9TXZrqLA5kmBAX99GYiUn3pCgI=;
 b=TKMWFQnWBxzsFgSEEObEStBPi0mU1kxGWIdLQKkLEF9oEzH/jhFiR2f2J9WEPkoiY/GP3Jfwqlln38BfSCX5vfnqPyeklpn/qOHzxvgNUaSZnZKUBIQ/AeCU6sFqKl0507DHHpDDM1VDhZeyDYKHbwK39E02lyHyds8sL/n3C2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:57 +0000
Message-ID: <87cy5p5sf2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 074/292] ASoC: codecs: lpass-rx-macro: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:57 +0000
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1ee48f-b045-4043-2fb6-08de20b8770c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekFBt61Vrl8i48H6c74AopOAkDiSEw/Illsp+mF4l09bAMXD/MgFPEmB4v0M?=
 =?us-ascii?Q?l8/H8cSCKQR5xlG9SyVnE83jdwQxp82A498g93B1XGOB5RTXXR1uLoyeunyE?=
 =?us-ascii?Q?1KUYmtf0X57xrpv5zJxxtjNxBY4ELpeLj7m9hxmgogh0/wGhJ3TVoWkfDBOU?=
 =?us-ascii?Q?T/arxpsV+xqiXnmtNZ9YiCfV97b1yMgpXmPG8QNG8wfd3LIdPixiuUKOMM++?=
 =?us-ascii?Q?7G5OaGMMK1Bc7cifdtLRBepjGMLaUY4yHmiJ1jDYeTTUKe+ASf4cHbCnmB2h?=
 =?us-ascii?Q?HEbA0xgWYAbLeDlTox5/7ymQE9gQn0UW1eurtJ1tIdX0eu2W7jdGprtKn6/k?=
 =?us-ascii?Q?8N9MrHxxedpQ+UeZWoLkYq/h4GGrSjnC95v4VTDUIHpKACgkzeFVMI7y+IVV?=
 =?us-ascii?Q?cIpgNO5scoSHpGvimE/6AhNemGsYnvSKZ6+zqPJqAza2/9wh1FOtV0nf3/MD?=
 =?us-ascii?Q?h1B56gXIBBCzlK2kEbpZu/4reoCWMOVBLmmiYYbvyJRc7S/QFDiy3UHnUnzx?=
 =?us-ascii?Q?H7yq3VbgMdkg7TRxMdq5eRlQ3U5XngqiNvSknSdceqdUmUZ5gimpeFvdk+eM?=
 =?us-ascii?Q?CQ/1P8fFHEVX73JCyg3ixFhXYV4ZEsSAs8beFQOR7Oi5TaJFP3zFsluPWEKp?=
 =?us-ascii?Q?oV+AoYc8dA7A9jfAKpxoWNcYzfrpa8scY6tbj9rpcm1Uv/IP3yForpUvS3yN?=
 =?us-ascii?Q?X4qkrlv3NRLaYLn0Jyacss9meTrpbAWcCD4qoGugFFq7qNLAR5dnTTygDnof?=
 =?us-ascii?Q?x+r5Hw5dXjIlwArNkLWDqrKzKDuY9OspLc2+Mua+ISLjv6IBYNMX/27P9NHN?=
 =?us-ascii?Q?hgyPON/OWQlQX1xbT30+VZ/hmzT6tufIdu1uU3n1Fg2Nu0PzO8adV0XJQKI1?=
 =?us-ascii?Q?JfxhdvfyQeVo+sPaWfcBJw0QjzlwYUqUMzYt8GZDe9WpQip3ARjWAxJGVl6b?=
 =?us-ascii?Q?mktgR+pLqGGGXbK3VQN4Z2DUxQZqpj8kSni7h4wIOjdJMVMxVm4mzLvK0uGx?=
 =?us-ascii?Q?4/6qE06+kf+IBrmePOHadYlcLuCrmFCVvtH6gliixtQrpHQXi6FDo+Yz/Tf0?=
 =?us-ascii?Q?wgkR6tshxzPkHGXDfRp7avK+2TrRZSrTndFbI600t8ENo8Sg6vdmqa1dXKhz?=
 =?us-ascii?Q?KI1iUWMMaUaQis3RS0SN5vUtTXQV2j6THtpN4JWrHAvAOTACFJuue6iAyGOw?=
 =?us-ascii?Q?101mt/mVUhBqreacOy4WHugDrpzXI63mYkqyutSUNN1nr7dBAWcPwjrKzmkd?=
 =?us-ascii?Q?IOwgxe78pjNuxwWsV0RCrm0CG617Ezdrg6ELvfi52YOHzmbeTpaE+cvaeecM?=
 =?us-ascii?Q?iiNG3XQZbUUhIhpSdsR64YaYzov84aMeyPyIZakPp4+B+Jo8WHjD3/6PSWhy?=
 =?us-ascii?Q?JZ/Vru1pIoKCCr+npANGtgByqQ8YnwDR3teSq9EoedWze8A9dlgp7uu/pXju?=
 =?us-ascii?Q?cuwgwdPMJxISVJfsNIKl6hZ7xzKpT3pyK1tiUak9GdihgE4NofIUjq+WDI/Y?=
 =?us-ascii?Q?yKXeYrJ95d6yK05KmQmPZTdoPsqJwq4o7UKV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5DsSY9D6EnBjinYfINjTmwNzCKYSkRP1bmjzKgZDil/9Y4UvTsqwm7R9C+sv?=
 =?us-ascii?Q?HELsvUheXXc+WBL+6rCJFr6RbNkIWQ1b7TnkluJ0ro/Kt4X3GcUd7fY2vjEr?=
 =?us-ascii?Q?afPyAJTDzOnYot1m1PzAEK5E6GGOWH0f4YVyTMKq7ars0Yx7/1z5j7BCsDtJ?=
 =?us-ascii?Q?zhAfkQShCkiZ6T8rcQmO/QjYhImKJqZi4l3W+fyNUDhfyPfZM59eW3T2PVK3?=
 =?us-ascii?Q?6YW5ELpiO9q0TnH0RXl/mMsu88WK1b15cGFfXLAj9Kv8O514myeu9qepZa6x?=
 =?us-ascii?Q?J16pK4Lv04z05GhZqRldFnhOCWyub3Rd+SsN6loj4nwgH3CRyb/voX2wsNOo?=
 =?us-ascii?Q?J8hT0LaUI8sMPxaSJg4zrtJnnr7Ca0ReIYS+KWA7mSQ7tNfGX2eKvsKnv7gE?=
 =?us-ascii?Q?edUkfjX9W4zN0AJzf2SRYrECbBnh4yiIHFzPdtZLUQgTXvE4kkcxG9l1NsQD?=
 =?us-ascii?Q?z5dTe200O2OEiNcYzdefpyIEh4WPviRttUOF1LJlu7/AoX94HjodR9F4DNN4?=
 =?us-ascii?Q?AF15aNY/NrRIDTc7YDHw/GEvCGz0u6vXVmGNVo0csgUl19Qkt/kfW+JnxCfS?=
 =?us-ascii?Q?e23OgtpRMCiezahdeVf1EFyw4GAzYYjiz8EdhOjv/IQPDIS8u+Ajr3sN0OV2?=
 =?us-ascii?Q?Rjd0QMS9ti7J/SVvJNn0a7/4+ipGIGqFJO1TRzUVvojjYEGmlAS0mZQ/tfQ9?=
 =?us-ascii?Q?x7GaOoJe+ipIsBH4DalnqIKY+r7pluJBUrIuDJoaKg3oiXCeJYCwQI87XLZz?=
 =?us-ascii?Q?aLK3CcOqapuytJeEeIybLxRYSPsSOMQQ56i03U+aaSmlptN3iTee2Mrf94za?=
 =?us-ascii?Q?uHSPRV3MRVSaUExawI9f1FLr8j0J/tp+H0F0FWlpt8FuEueJjRYlBnND+71y?=
 =?us-ascii?Q?UZN6pcdXyLvhJBSSZTohzkahIPwClwW3bHTsKjhcmhGvdyqV9L3uVw2Yv7E3?=
 =?us-ascii?Q?SeLZSuFK+f5EX6PGW1QDqfIKYgR82mb0XyKx4BaQ7iTA2xOrNPlWlYL4rzcY?=
 =?us-ascii?Q?SUbLBTjjaAxKiyYxqCYHWCeNyl3r5yd1irHu4hKtmgN0fM+dfJ89yOYJQrhM?=
 =?us-ascii?Q?yb2WEgQxa5630FX/I3YNLaVjFDKu2o5YB15WBvpnUpnZa6hTY76YqxDW+UHf?=
 =?us-ascii?Q?WXdcYrj8VBbMWMj77C4S/mMoeRb/ch8CkWjM1r8RuQSKQ1q1a7v8/L8etHMK?=
 =?us-ascii?Q?C0Yjt7MDONZ2UYNYxrf6Ehew5e4D3LR8JagZVGNe7uqksqYI8pNsfnI+8Gmd?=
 =?us-ascii?Q?7duLw146t2YiAjh0nTLk/msJuZPKINkS35904QuxtiqH43gm52nzj5yK9+h4?=
 =?us-ascii?Q?gm+HtHfjGrKKeCM39qif5lEUgJy+6ZgN1k2qDjC01mTg5HcqJKQSLFqb+xjd?=
 =?us-ascii?Q?7ySqbWrhPcNM3edzo61/IePwM25nS0pCXxLBL0SC4q6qOYQT0GG9tIltXKGE?=
 =?us-ascii?Q?Etf8CS/GCJgsuZdY64pLOEdQs7F21LU2s8vI1kf8eeGQvocfLRhAB2KO0fex?=
 =?us-ascii?Q?hvSXumgvhbEHY5EstHndPEPKLcmuGPI67lLKz0KsNHJ8sgZQsooxR7q9H80P?=
 =?us-ascii?Q?qUT3wdI5puo1n4KmBZNdXcYJ6jIZ7IVkLItNOYpPlKKeq1kfaM01xcCj+NUZ?=
 =?us-ascii?Q?hSQBrmGfZjOcV1GkG0YEltg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1ee48f-b045-4043-2fb6-08de20b8770c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:57.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbFYs/DLaDedtrjXMbqjlWQHpMw49K69YGT7AO8Fue21br+TikFlElFy+Oa0prIkMaNfSp7vsFrN2C1Vu4wKKSv+Cj/AtFPL1tBLx6wgvXsOC2olMD6ZzDqeHKKQDWDs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9053c93bd44c5..4450fe00573e1 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1682,7 +1682,7 @@ static const struct regmap_config rx_regmap_config = {
 static int rx_macro_int_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -2458,7 +2458,7 @@ static int rx_macro_set_compander(struct snd_kcontrol *kcontrol,
 static int rx_macro_mux_get(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
@@ -2470,7 +2470,7 @@ static int rx_macro_mux_get(struct snd_kcontrol *kcontrol,
 static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_update *update = NULL;
@@ -3609,7 +3609,7 @@ static const struct snd_soc_dapm_route rx_audio_map[] = {
 
 static int rx_macro_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-- 
2.43.0

