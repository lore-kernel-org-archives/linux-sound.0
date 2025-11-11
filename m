Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897811B394F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820751; cv=fail; b=XraB3Z99TnG6HdjMl15huFdV3ZpeKLfJJqkN71iFtSt8YTR5BNidTnAwGRinp+7oy3zqG3JjppoayemKYwsQulTtfki/tRkKsROl6AZT7h17Gah86hFGWsi80nBxAsGBZM3kNcLRtujOkNrFYXnxeOT50UsDQx9yl/eIi7EwKUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820751; c=relaxed/simple;
	bh=qLl/1NlUYJsMak9dPJjQxUxLor3ghlbxClwTSmRRxRE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aA3fTOi+txaw1KQdFUs+r6kkoAE7/0sKDO/Xw2actD0md+VimQKPXAZPnQWTFGpkE2PeAevWZMhuPjvqqgHgUxTB5fhC1Ngr6mkLb/4ERMta2BDz2svh8WCLiBQGhGxww194Fz8mQ5F+r2gyvmzvr7d68/aY9+9zIHsPqoVcuoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bv2OxHcx; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bv2OxHcx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tACuA5Ksm7w6erdpcxLpz+p47JT6CBC6Ph3XNojWjham6gMxYPwaHUpv4qLo851UHk3jFyqER3drA/RkD2PazINMOUWwP3LD57rlAj6JenV0T/PyGs7eO9HDPf3Sj/TMWlsm6YvbIkznssrFiJ1jez4cWagjQNthOykS+bMvZKyxy6s0g0hS2tPl338pKRZNNyrYRG/hDawnXKrQbjsfW3J9uKq7I93IacPdFjEqIQ4UnmYVYYuCZ1pavHQdGmH2V2MANqNUHRoVYgyfsoTaLrcndFumqLVDkOP+wLDGbFLwogHpTgSNMoKU2soyes8VfK93m84lBODFf1avYbUjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgVSJxCfgAKOUIgQ+n8/SzEAVElCBVQYriV06LpSY0w=;
 b=o/82rZYX9TwfDz1iNJEz5RUd0/jVA7ABDT1bAyFfwVujWMLS9AgIeekQAugcjSaIJ5UV/cOmH72PmAP500Nh8J9FPJWlv2GPmXEH9QoHpKqZwDKKehp3neP2DEXNF6SneTSgdADsAcJlZQT4PrE3hQ//pejD5a2BlIZbh+c1OqJQEgxMq/ofZQUpiPtMHJYdc/s0HoRWiLjveMD96FrXRLA5+m9VWf8W0+TQl8VegMra0ryRaeU77vFc6iTtVe8/1PsYSSjBRxrIFX8CJxMt1U+x6kDWf9aWme60kes7dSBo1ki09JBM/NpRpXGksli5tIS1YdL6dnkKfx2CkxjoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgVSJxCfgAKOUIgQ+n8/SzEAVElCBVQYriV06LpSY0w=;
 b=bv2OxHcxfuU2k8w3u6LQyYQRpNliqW7wy2ept9ei7VLZn8xWBO6LB9mT7YADIRH2XBpXbDB8wbAdNq37jvM9bm+/uv3vbzbu0T2/AmNGZgO+ZFJ1hZpu1b2dcld8dNORIP1pb1Jr/kemWwDDtEdCn1XCxlklHO4peUaH0DSEj9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:46 +0000
Message-ID: <87ikfh2z5h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 120/292] ASoC: codecs: rt711-sdca: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:46 +0000
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df934a0-7685-4173-b184-08de20b8dba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Ob0t96ZDlP1i9lZ8x/prcq/VKpAKkqpYMQ/Ys2H4Ac8Ykwq7Sl5ZOitR2ZS?=
 =?us-ascii?Q?vnKqP03NM6N5rx8/U83H3xEVTGF/XfD4uXggQH0Yby3I8/gh5DlLEP3GoDfX?=
 =?us-ascii?Q?Qkbm4Kb2tKV+3AZZEJDrjNe+f7phF+jA90QLWbXo+Ezm6M9pUHcrhj9E37lK?=
 =?us-ascii?Q?6z9mzd+SFboiDgiPtC677XgmyE0mSVl/2jzwc9W+YBXvfWUasXq68lFCy1tB?=
 =?us-ascii?Q?+Y0973gqWgRUvQozXQX6iz3Nlkb64k5yqQjDa5ZYH1u0vg2/dTdB98Z/keZG?=
 =?us-ascii?Q?5fhcwMdK1oUNkUGSENYkYMbnH+ZTofNf8cApb0dKmxp/CC93bgnY9rn0FiA5?=
 =?us-ascii?Q?nkRG2V79NsSqIspqz/fuQx76gJNDjlFQfd5/SZJWrBevI7TAwZYdPrz0bG8N?=
 =?us-ascii?Q?uJbHdZ9v78TydnT7HxfD4Jbd5pXFLiHE8kyfZh2eHAtGgfbZZSyX02j+YrJq?=
 =?us-ascii?Q?ypjLGDNHEPc5BnjoS1dLbS041GbQHIUhE+3fcjIMidFLbtqIvtxuVdIQQUp+?=
 =?us-ascii?Q?qjH9Wgiowo2/oUTlAAmCCwcx+IcYSBNYlouY9VqD5+aPNU48HPPp/QbnpmHk?=
 =?us-ascii?Q?Vsz0BgISANzc0yBzGBsxcIK1XznW9K2Id4qv1ofNRblLqDPJ1HfP8VM2VKhf?=
 =?us-ascii?Q?gIyv8R4CdCIGFlrzuEULWQD6KySbdA3zV9L233R4//p1QhD8kuHKMxpzBc/i?=
 =?us-ascii?Q?vDCTljhotBvJx+no/Zausu0yq8/x6pJqH6GQd1KLwBOi33mcIc0GQvTqowAD?=
 =?us-ascii?Q?8iNI+tPfzcCFPdr67rr7e7rLBeZ+lsnS1NNOKk4cMtbnRmGk1oohfn1viDGN?=
 =?us-ascii?Q?52Odc2hGo41Za0MeeUKbG2ig8G8YwkWFSiLKOk1HLP3V+E5wLJafJwN+D554?=
 =?us-ascii?Q?uC0ib7e9sOWGlNYEqDFiTEi0ebeUI+iutGUa6XfpsSGw+RXFV527klnu1iYg?=
 =?us-ascii?Q?PbFPpas5X5vFO1WusJ4ufdKHyuhHunG3HjTt75XpAZxDuE8VF/Bnu9BIl3+1?=
 =?us-ascii?Q?W3byIhZOhI/A1XZOwCUVdzVn8E9Ovd+HTOSlu3V3Dl4wvak+dNvlsHhxXigH?=
 =?us-ascii?Q?iEMOtAGIxI0Bwbgc4LjRQFgTo/4+IT032nL7NYoQQ3/V8q/mSOaXOqsRetGm?=
 =?us-ascii?Q?5LswpmNAIb1uikkg4DL5s+aQzya2IUWwKks6l8lPGHPy91YQVJZjrd3f5isl?=
 =?us-ascii?Q?5LHpGAjaUHJJn9mYbOZO/nlhyNS3Ay5BRiccEVz3ELvnxMGxkUU29gTo8RLU?=
 =?us-ascii?Q?YSuXkTM8s8ulc7yLjVcN3p1UgApEcCPHyQEtSgQkW3cUGEUtekEUnEaNl7Fz?=
 =?us-ascii?Q?MFqSNMDrovVKULougJlrvdLL3ioXOZUF8Xu2hgutHFN3RmOXTixQCC9La5JY?=
 =?us-ascii?Q?Q9Di84HhqBR0spSOYcGqz903wc/SF8oap1IjUIlANE0urCcDjS5lflegr+Cz?=
 =?us-ascii?Q?Dz2s8VEZg5qIlZOeBQM+lPUuxiZRPu+T+NIPd9hQVmF2XqZCdT69n+y+TZfY?=
 =?us-ascii?Q?dnc/01b5L9INE8g992faFt/z3CiWhO6w4Unq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4QHtoX20CgWptzuXRjaxHf206tv8rGw42gb7lkhFRtrKLcODgoTjESGqx1i?=
 =?us-ascii?Q?WQ7tjeBnsM1DC/nAwEggK/qainDm33HCEKPVXiXK6AbNB6WNCEDE4Id7CneZ?=
 =?us-ascii?Q?JTYg6o2WXd790PuZnDCVq96x0u0Eo4Uox0PRLfVekqgfpBTTYxyaYYySRdWK?=
 =?us-ascii?Q?NYne4EPZBggkBmNjESMiIx6SrkUsXu2tY+dEtSFaW6XIEMkvEVLb9xOv9tCc?=
 =?us-ascii?Q?n4aoWwVhXr4v6i37K+4MWwh5YXrHDV2wBROFxzuCM43D6r5+U1khznIkpIHm?=
 =?us-ascii?Q?N40N8GO/8/hIlwjhfKT+F1tdlzYCTEhIE38USgHFpLo305M3t77PTkdxUtzb?=
 =?us-ascii?Q?A9eVMq7uGiIvlZJEhU1D+eeaXO2fwPdNuzRmDZWCvwn5StDGnf2g99UKt7Hn?=
 =?us-ascii?Q?BtrqJnY+FLEPNrWjzt6AFQWEN7HtToGkP5vKRFV02ACpczTktUcGjo7ZoXe3?=
 =?us-ascii?Q?tpbn1vmmkwPS3gccZOuAWp7oA9cNA2tHL7xsr+sSrTFGT2BR7xFHHLLeeE10?=
 =?us-ascii?Q?ucx8/NbHc0XIcFxToOWfQoWxrvnvj0esv/k+GXcEUdc7hFQsZ6YTnoOjMsB6?=
 =?us-ascii?Q?FUon/AxmksUAS69BAADh+xjCkLshNU46Z5o0kJlQa9gl1wRgmt0CfQUoqniW?=
 =?us-ascii?Q?H+t3K2Hx0Z0kJ122/fxUpaDqzHjoXcZQooVQIMMhAkT4WvMuaHClBkXKyza8?=
 =?us-ascii?Q?K4B2+OeK4rPDXEgBZHjXPo/PKnEhpBz8kVdguCv3gxI6bZWOW3LDictEeFCh?=
 =?us-ascii?Q?wLsOrsAbGAsIRdrojcl7BIwrWaiuxrj5DFH4Riyktb4Nta8BkylenrJ43N/B?=
 =?us-ascii?Q?1TodeLFqzAf4sCzDzPCO4RuKka15f+eR8tMhqMMprxgGPdnOjqaQyiSZtPDJ?=
 =?us-ascii?Q?w4UIsUMcwVYDTr7pMQaYSXpVxrwmZaeN6/Q+X8vX/WtCSER7XwUhsR7+Z1i2?=
 =?us-ascii?Q?XpztEQ/zpkWeyoJQFNKlBbUN0i2MEYESztDMbWNTfR7oiZqcVJzqOJNS69pa?=
 =?us-ascii?Q?SvYafZk2Exfl0DpBAggJxRuKlee5lwCOawUPkxXaTbZp7XNZvLGv/yBT1/n8?=
 =?us-ascii?Q?wct+B+74dTW6ogsmf0KB6nYQH3LbDpaQoJD070OGNd04vRwaP7SRlkE3fPx6?=
 =?us-ascii?Q?dXnI1H6GkZ98f8MCqt23I1rpTxTZpTdP3vnHrK5xlpi08qMTbs//Dn+P/7CB?=
 =?us-ascii?Q?AFh+TJrgs4MDkkf3BBGhvnjaFRpN/3Jnf8b8T5DggJKuLJH0U96MaTP387SW?=
 =?us-ascii?Q?eIX6L20vhO8VzZqTkj5Xrmz1RR77fewcVUo8EDZSEOct6dKf/fI/pc9gVgbH?=
 =?us-ascii?Q?D7+hg8OrEDsZWjoH8zXQDM1MuuDCnPqUiCpZ8tGFkcQnVcEbzZ4OKhYoevqZ?=
 =?us-ascii?Q?PPbYuTo4M7IAAPP3XU99MbLNrnV3FXefFJZaG1q08cVyF+pvrtS1ldyE2GK3?=
 =?us-ascii?Q?FcNwsnB/486Eu1XYr8f3JrMEkXp3VgbytWU1kfq0zoU2gWB40MPA/iZin+nS?=
 =?us-ascii?Q?vf9jHKjZUaA6hM3lr6yvyQkPRd0G3ixILL1JUUyeFROp1JzF/NFIdRRgqMZ+?=
 =?us-ascii?Q?ljrc2t0zdFQ7DFu+dVerPVjhBHZ5odpiEt2m1ZBcrrtzAD4RfQzFYsPUQizw?=
 =?us-ascii?Q?jDXEYNNJFnIqr7U/d7OygRc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df934a0-7685-4173-b184-08de20b8dba9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:46.5644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r84LtqmFFSqqSJVYhUQw4HQvFR/ZFN8oo0Q0dHQTHI5wIY+qwTdPEXhzPovmFYyoHkKBYB9t74wms3YGqjb1Du8Ydi0OQXebTr1WPqA1yNRdgAoipEE1bmHECGjIr9fn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt711-sdca.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 8212887a558ff..3a26c782d800a 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -900,8 +900,7 @@ static const struct snd_kcontrol_new rt711_sdca_snd_controls[] = {
 static int rt711_sdca_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0, mask_sft;
 
@@ -923,10 +922,8 @@ static int rt711_sdca_mux_get(struct snd_kcontrol *kcontrol,
 static int rt711_sdca_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-- 
2.43.0

