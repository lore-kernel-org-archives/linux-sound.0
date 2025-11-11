Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFD1A073F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820620; cv=fail; b=ERf5wbUfRL5gEmpNmip6uYmSDk3RlnoZaWmgs7PYq26/ZZq0sXLzz7gbwf7c/oarYWiRbiRuAllM9sMRdsg40+Y2NKctn60b/4Rrymj2kYhovqwd8FtRlaXRVC3M8pkyOYAyeCHTjVpuDiYbZXscUwYqz0iS6yrpDvw86+SfJVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820620; c=relaxed/simple;
	bh=L7Ljh/fm5AFpBZ1QPBebJIqLk8iY0+sUQfr3pZH0/MM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AdLZSrsQo1KezFmftxfDy1q69tdL1eeK5/6crihabDAUo43NuUlnDzdjiK0H9MykFySPYKta3QQB0OArlkabacNeN9E07zAhmqkSHEjxt8/7zIs9R8D6NganujTvt5VVVrPtKOHiklP8W7PyhL7P0rwKDTkR+m199trAqwhN9nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lpYOWSat; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lpYOWSat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhXJtWbf6h72vOuMHI1ZhW95kNXFgqbV+s9ZTfSLHfzTJ+Aad/Dvf5aU4RqjtYkBxQUkzy3BkTjIEDX6Ip5rKAaN+rog9c25JR62bO/kDzh62jjVniamH7JzeJxIHGiDhGbqxIH3fJvH6Ct3FZvy8/MtWdKReMziQXrdI6SwBhWc1h5VOHAKVQPCQ3pEmKUeRi235xykxC/nT32fy9BHaLNMp7cw/hEqJOVAJJnf1eA4BV8KkErGCKG5Pa4GThEO1ZSbBOzX5eH4Lb/2qyxqqVOfsqRzHxdXZgPeWlCjwQ6pVY7HpiQ8g2CtIs+HAPEMAisi2ZtEe9Xc8vgmeATqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqU6GU0wW7gMBQUnZ7a58rN3B5US5aIqrhlw87BZEPM=;
 b=pGV2bOfGTgjfv5Ggu8es0C9xKpXzRnFpFhhbEAzLtVTyONhjf8g3/a/xiRHa2qnPy3Zu+y/x8dbTG0LFGZb5YidhJZFUMfCMaD5NKpCKjJN0Gi6Yb2WjAFFAqDy64F6rMteyM9nNxBYh/nMwhnEgSxBDgWzFnRtn25zroUnFDPBT+JjPLW6bp8p5f8KNm7U/3J0jadiJ/y34e8wsuQ1NLvP75FgjLHtjA6X67Yd3sBLtHEfHuS6B3R4frcsEK0WpkYV2NXhIcghjJLnd+wt2bZgNv1sKDg//rwMUsaHHZX6DkwUF2Oy/AgDmCPkKTCMXSHFoejGx+K9DAGYb+RqyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqU6GU0wW7gMBQUnZ7a58rN3B5US5aIqrhlw87BZEPM=;
 b=lpYOWSaty1mOIYL0MWBPKDC85JAvWyUv5DFo3dUPWIucA/NGI2E4OKB09NWRzjLZpl+kyW935Bz2896SMBsbbt1cDpXq0i72YxEDIwZOXYUvgjmRZmFEAPrrDZpAEwc56ZfusZZYqz7y7n1Ni2dLEZpYD5scgTmv7RG7zZ6uJ8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:37 +0000
Message-ID: <87wm3x4dtj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 085/292] ASoC: codecs: max9850: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:37 +0000
X-ClientProxiedBy: TY4P286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cef7b4-f932-43fb-b587-08de20b88e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c5a2wEl8vKrtgbA/q+Ktc9UPXbkrasNH00p0Jqu8rjefXazRwEXb6FsydF2I?=
 =?us-ascii?Q?cEbwYZY5h1xEgX/v4UEQbIr7Tq41/xqosgzfi8Bt+WNIMc5LMrEr1yeVK2wT?=
 =?us-ascii?Q?P/3KLKvxPtNFOFIVEWWAO4gOWnt1mtZ3TdPYgJFw2XuzVDWos8KOsU2cEIKy?=
 =?us-ascii?Q?f7RsDWwQPmJm1pdWusgfNMBwTvkIJu5Y4e08T54BPZNlRYh1pOq9P1eQFkSa?=
 =?us-ascii?Q?dgtt86E3jSSPSc0AMHoiMUSvIs8sSGul/vE93VR3modXz4RZuS6rxCC2OuSp?=
 =?us-ascii?Q?Mmf062hRCKNGhoPrXNYFozE6wOMu0J7j/IglSwt90Z3yc5bXPJXEoknVcBV6?=
 =?us-ascii?Q?cNNMV2MUfWGd7Ou2BWGGlIsfFsorFrcwcpcn9QaiAmgIXOcGA8vj1tQvmyQF?=
 =?us-ascii?Q?JuDo9wPrUBN3/+A6Q0hjQpLum+r0Nl+39MI5ygLBsF+ehiZ/3BLk5WMB1Jnz?=
 =?us-ascii?Q?yIslJW8+z1r6/Jfy7bMu/qMYGGXWadPRqojhbODBoE0JYgSt7XSUX3+Io1NZ?=
 =?us-ascii?Q?RHor+apDkdVOsA9XcaU6rypEhQbX3SVrImaIfoqB+f4wZzGro60dwXLLZJEo?=
 =?us-ascii?Q?Gcz3KiYEMSGAgWfUq4tBvLZjtsBK/9G5ZYRCKvkTyhRYoRk196J0qwO3MrH2?=
 =?us-ascii?Q?ibrVmsJiCFVukxehmfNAKjohmrHbUK28SpF7YwASO7mQklAxIZl3YUFIH52p?=
 =?us-ascii?Q?4BfSsketk9wJOeKQtez5YNCe3xygnchWW1RIzcZ+9JgFbs4OzxskIqmzsn6t?=
 =?us-ascii?Q?b1Mglz4/Sg7HQgQJUMLaJXabixhuyNITv04cxYbW9FhvyQdUFzx2p8iWRb0R?=
 =?us-ascii?Q?hyu9r/kZ15ydeCgt9XaLB55WkYsB4gI4Rj4XW/1/Gz9lNNJChFXaSPgRhmga?=
 =?us-ascii?Q?F5/GguuyMMl+V3BcuU7yFBDuhNyc0QFyx+okTsJNAP6dxrHSbJaOjegArMaX?=
 =?us-ascii?Q?RQgOxmE/0WBAB6JqWsg5xst6C3w8aJAL66oAezY7N+iRUWecidHDwgfphXeX?=
 =?us-ascii?Q?U/qCM6xXp0k05bD8dmkNKsanhQH80ibFHXMlYq5fdrJvEi4C22dvvcUETGbk?=
 =?us-ascii?Q?VySpCquQs8fmDj4b3JFk0hM9GtNy60JtAgALcjuYrfE78Yj3Vam7UpUZlFBC?=
 =?us-ascii?Q?TDIebOFk+n65/TLrsiPp2zFkvSp4iURsCGyLL89ibEgowgCltnrupjO7sw6C?=
 =?us-ascii?Q?oCr3Y05779gtsWtS3k1sHocfrEY9eMy5ftPoiMy3uLYI+e9Unm47PbRPNeAV?=
 =?us-ascii?Q?GRfmFUrVsLgoD8vZfr1EjITIiVFUfyV0CFgo5T154KwpO+SmyFmWZDUyeu0Q?=
 =?us-ascii?Q?9YFYhhHDu9QADEXE8GrI19l4kT9axE3KJoC1HL6wiYB4prOTz7gY8X4mC5ly?=
 =?us-ascii?Q?HVD7t6gvoWLmJyn17llLVARvDLI1CTsQc31bBNDPGMGE4kmhA2zXUikJrAcs?=
 =?us-ascii?Q?arjiB8bVDYV3bGusq0cXqHoavXcowenWhqSSrlksTi26uRetz9UwCGf5tneO?=
 =?us-ascii?Q?bezUPrfvQx45m89vtFF9kpCd4QyK32Vsa+fE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6PQTiL+/KPHRLly1WOTI7IJkGB/GaO3KXWSYs+l71eUdtUYO+LC2JlMRJJqX?=
 =?us-ascii?Q?HUnnTpOeKtWehDfWiI8fJWvBrbafHs2zHJFejg9GrQX2Uh5te3B2rd6ktgqO?=
 =?us-ascii?Q?XRULqoJs7A2OoZYGd9vCDctsWRkvyVcngkhRsspNEtxJv+Espg0uiAkRYx9P?=
 =?us-ascii?Q?b4fxnUQzApnrLF9J1ljbRbj4XBZP/jQM7dEJcxa+XZ1wMQhWim5yYZISFEjB?=
 =?us-ascii?Q?2uWOvAi55ws1nw5kryGELLv6gWQmZrRXb9Xq5K1oj5Uifp41VgLGF6/Ek327?=
 =?us-ascii?Q?bA9SZUXNIVLY7G4hGTo2DmUXsikA1y5vQIPFwCOAz8XVIU4z8C2a3eTnUTJa?=
 =?us-ascii?Q?EUbshnJVS5VLFUQRSPME+1VmOG7aIM+wJwhGxnE4L8qwb+mTG8Dw0rr72OP1?=
 =?us-ascii?Q?uKPJJXo1NxwPXmw1m0agowt8aDoBtKVWdZxDPVPH1sSbgtHFItBt6FAQ+Tnk?=
 =?us-ascii?Q?uofrKuh2AM9qXTnp+bvNLqygVK+1tm3LdbDiF/NhjeBy9YFrvMPzTgfpUgir?=
 =?us-ascii?Q?i5s3/n/RMWrU+9a1Lyx2E1JvG4zhakNDcLxyYw/zp+AwGzCvQSzHRCIlOlHY?=
 =?us-ascii?Q?5BwVKTgZTzyk39gjlm2DLLkoqu7l0G/JEtdv4JTGEh3P/Xghmew3wV5VTqRd?=
 =?us-ascii?Q?jO4yW8ml8/1kaDAmLFln5oI1WUqmmtYEGPOAO9MBR9CZ1abp1Yiaq8ZA3Vhu?=
 =?us-ascii?Q?mDDo4jJ/WVBmkxlDHe1ZiRCDC4eGUj4wLWUcFE1CGRvmibbNqupgUaDwWKFo?=
 =?us-ascii?Q?bI7OiSmYwR45TMSAHm6mb6VlTFo+0/Zicv56y/OBStnSBt5y/FL3pGnnf2sF?=
 =?us-ascii?Q?j6D5ffKgYqCi+tksX6tXenu6smeVNvibNDvzFwvyOPteKj0GSkn7O9JzS03A?=
 =?us-ascii?Q?Nq3AmgDZd0Rq+XvZ0MK5qUGiECoCylgvqWYqY7PrUI5Ozsm2g/+R5GDlt3ds?=
 =?us-ascii?Q?R40CNWgdqmM0CN44N4oJ6JJUzo5HEWsDv2D7TOeypihcw4ufyUbE8ScZpFpn?=
 =?us-ascii?Q?8A4qXHVqwoHXsL10AHs1bOhba2t6et9tP54OuQQPdhiVSZ52Nk30UIkKOv2D?=
 =?us-ascii?Q?UazhFv8J6m29yJT6rTlKTuB1IwYqXqzmuR8Fm8UTxRO6weXlj77LqphysbDW?=
 =?us-ascii?Q?2B7AKenEVNekZnytj68qxkX8xAPhCjsCmtiWxxYviCEKZDCj1FS19StRs9v1?=
 =?us-ascii?Q?m8mpCdg/xbFcpGyivLyDmOKywrLG6Um1VFQd0a3FgTxyqwG6cMxuyAyWORVW?=
 =?us-ascii?Q?GJ79B1X221SfO9jR6OJFyG1ta9PcUbNTRgBc5JyOUXVqzpUTyFNWUlf5SEAm?=
 =?us-ascii?Q?UMu8IG0gAmRRmMy66hMrEkOAhkPoJXiYtUAfesZ+TUzfW9+XWMFHkxbSLCem?=
 =?us-ascii?Q?7DC4v5XUTGSoCowmEP/xeyCwAGSwPOfh4OMbLw5D73E4/ritGDl2yfVGu1JP?=
 =?us-ascii?Q?OjSP2E7lzRZUmvNHjKETnbYrCOi7rMAHgsdyR/EfcIF6k2v5iETXc01Yf5r4?=
 =?us-ascii?Q?TtKKHzrcq5JKBaBahGCfJ3hm5tcHj3PHoO59uTjNh104Aq9y/Wc5lL/ysXFs?=
 =?us-ascii?Q?hAa32Zy6c1t/RwjpB68tGXtRyhsTaOoWL0u2jxVAbbp46YLd6QfdjDjSakcu?=
 =?us-ascii?Q?IRDBAFkynpS8MjOEZ3Vn2ds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cef7b4-f932-43fb-b587-08de20b88e98
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:37.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEujI5HAxry75dmheypKumoP4lKNUobITstw4zFfXZBuCYDPw5G1qJ7UZyzNbG3DfWkr3DgteOd9s+8mD+yamj7Op4jbV5/hLQhuZGap5Q0xMUnxmwclad0NsqzP5w4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

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
 sound/soc/codecs/max9850.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index c395132689b4e..1fcbc64a27711 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -225,6 +225,7 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct max9850_priv *max9850 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -233,7 +234,7 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(max9850->regmap);
 			if (ret) {
 				dev_err(component->dev,
-- 
2.43.0

