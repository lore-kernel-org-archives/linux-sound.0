Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A84718FC97
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820532; cv=fail; b=UeXqfTuDpRoE3U/WnASvOr3uozcvJCrEyxEKA4G7NEMjcNzj4jceOLHoNv3Dbg3gaupfWK1C3rsB6Jr0PCf9x7qjbHtqn1kipz+319UZP4EibwmzVJzRhHbaZqhR0PTRGFFTMRBqYWpaX65AIlYwQ2inSlvO/zA2AOLO+PsIrng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820532; c=relaxed/simple;
	bh=AUMGIa0lJ9ngB8YOgICLQftl7JIoEon35Ek7waDpqhQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=omvM9F3Ott8bky63JFPRxmi68/dBp3E33f02wjpwXtT9xBB8jhGordUYiHXMY0yZpewEjyacDiETH17FyIL2Wo8fTqwubiXoLt1zp5TwiXfw/NJe27YN0exK3OG8SukEmwJhU+ou6i2RVQyDV3AmaItL0eYAYFyybSwxyJWp0JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JAjxZ9g6; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JAjxZ9g6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yT9DDW4k5utZ6zFAJnwax5J/iBL+gkCKpygqA9TWXK0T9iUhtnugKP8xipbRqgzcIOsiwpX017h1/ucJWa2RSzcayBpH/XbYmowXawFKr+oR+4FQq7PPfXbeA/upIe3sLTo3FwwGnEvxhbVyKvVCUHI/6mOmLCygqRWrEBUvaGQfS3evZmqC3zGwW4Ao39CMojOH8pJ5DqJA/ato7yWeFGJDZUUZoMelid6Ne6l0jiGOe4LabAJFHj+hX1tzjdCGMnldxLWrDLO2TOrqVnFYe/E9JAE/UHbX8l+hpOlPBMGgHXxEaK3e/0Lzl9x+Zu/Z+WRfFI6n6kOJJK9IfNhb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbInQtwgYSfMdm5DT1QGFAOWXnHVR0M9iUKqOra4B24=;
 b=ZliTWUz3HNCG7MR4mGy5jflfIeMyPTtVtgB2s2TdUgmThoFxrg3B5hMszFhWcCStRxg2SulkETsE+zzY/hnRYytQwKuqxj+hUwugGTl2EtQyX/uEqk4FB1dZmUV1/ZWXFqpCf4LKNt8qcdHvaGQL5cb4GPP2VphTJezbmrNsaiyBGjzLa5Gt/IMJ+ic5RU06PQ7O3hVXn+keWfEoZYxuSm/OHuKUKFd+Npe+sak2MPcrM7axCC7KFDgKZMAR42bNP/4sNxJTbTc2ahJkSkBC6zUMYgRccmBF/wC1ykxA/w62ZxhZOuH7J7jOVXEgARzbfCMNNlc5zeFucrUmTb/PyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbInQtwgYSfMdm5DT1QGFAOWXnHVR0M9iUKqOra4B24=;
 b=JAjxZ9g6ZHHgCxzRMyd+ULw28ZhbTxuKWOR+E5nUeq0Nzq2egHPpDmeTmjhqc9MPBPuO8sUOsmgUgwlxNmgIui1u1gQzEXjZoLwcLvH5OrGv0pKyzGbxiUMWMYgwxSDARtR/DKB71bf5okqmYV1MwtRPyW2OyJ4uvPeZR5i3ER8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:08 +0000
Message-ID: <87wm3x5sgf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 060/292] ASoC: codecs: es7134: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:08 +0000
X-ClientProxiedBy: TYCP286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 00375673-c21b-4b08-af8d-08de20b859ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jvxs5sfLlqEh0ACedhZlKosIIiwx0iBeHrjICeOOmuvqw0moRX9yAEL577ol?=
 =?us-ascii?Q?3x0MrHPI2mlS0k21JsfcR0VFg+wXcQhVRbaGYL9fdIGAwrG7SVJcQLI1dGQO?=
 =?us-ascii?Q?X9MErQCBEEMeQCAUo9LO3dqlmLC/CMzJWVE16FitrIL1fXcbPsIgLZU8pUYt?=
 =?us-ascii?Q?Ppx0L0I5owFUlbTaprNzOOwlZLrpGJHqRCgbZyXugqaEHInvW/HaUZZASmv4?=
 =?us-ascii?Q?gBIPLOXFnhtua5maqjtLX78MtEey4fdgarBBgWZ+Xka+YrVr7qRfFEv0HovE?=
 =?us-ascii?Q?UVnTUPfewe8v9PO1Q0QUoFLCx8Tg4B/tabsG8Kkzni2gTT/Xg4i4D7ezZhao?=
 =?us-ascii?Q?3AtrRUAWfoLZgxSVGlC/RMV8DI6aNYQthJ5FweIHRpgCSzmUDuwY8dIBu3QR?=
 =?us-ascii?Q?lBF345jsgFy3MjakfeJ5h3awUS43xTRs5/ZqS5dzhXY6ZhwC5S1saCZIlDHh?=
 =?us-ascii?Q?AABb58bTz6PlR4oL0LRCbiYfT0C/3tLcep2nZ04j/qkeT45ylkxKOFGdvQNE?=
 =?us-ascii?Q?nsV63EPjVSjcE4xdorI4wYYcTmLN7q6tYVy4+5HuJoP20dgTaP1zqCOnRX31?=
 =?us-ascii?Q?fw6t01b3lMDeGpUDHpVbDtU2ydDGSQG4eKGcNOje4P0ezCEITzf4yIsfq2Yr?=
 =?us-ascii?Q?4KE6SscelRQdjtS6AID1xdzoRCEIy3r5yexos2m3Gf5w/qF1w7YW9z9y5wVv?=
 =?us-ascii?Q?ttbL+ozp6RDRYCqerUm4GSP84O2uOrk5y6+ro8Z0ELqAGyNnnwcsutrm3JCa?=
 =?us-ascii?Q?FT7yNPV3qiDG79le2zedAskjyki06g/LEKxQ/Up71SWrHsbvtdu8d+MqUej9?=
 =?us-ascii?Q?qaz8gZLT2k8OwajtiZM4LTxUE97S2Cl0K/h/SIryNkK09EOnOma07V3W2L1r?=
 =?us-ascii?Q?GAFvsHupiZlisMnQvO/kADdvu2n6EAqTFxbjNhx4vJyAABNI1wsAbOQLFIKp?=
 =?us-ascii?Q?oeOXo38LFEb/IcJX3OpZDM7ZdlrakA8yhIJZrvwdttzQHn1G+IcC6eZXRYLF?=
 =?us-ascii?Q?vwu7vu3Yt5eNvBf1X4Nyy8JVvFwAgmWIfAqpCEOoPcVaT/0+HjzZVZPo5vn6?=
 =?us-ascii?Q?7cRR2eKKQhQ3kta9Q1/7kUvF9Y1d71Z7eff1Svt0yr/z4Uz5S7fPaymN9S6a?=
 =?us-ascii?Q?ELnIU99fko4weql/d7QqM3gVRlas6ipAyms4c/WRkwx+UtTrnPAlSPXPAZ9g?=
 =?us-ascii?Q?ZShgubCvu7w3T7xQ1Bpc5JurQKZ6HrIlvn+vEYCFGkKc0oS3ZQDq6Ewrdp9n?=
 =?us-ascii?Q?Vbdq3xeIBCYVWvBGJtOAA4N3swR1eK7sbQ4Hd/Ag3iA//zPKxkc+HdKp0/3+?=
 =?us-ascii?Q?S2ln+9ce7ePktY6oRUi/RkWHSm5i/mznsLOtaVg0cdYwBmksQ0vHfe5EqgMd?=
 =?us-ascii?Q?n+XTvNYK83RxT9orRsiRHE3xWZWo56qnkfRyFvuwrVHeh8Pw6UiAi6h4R0ov?=
 =?us-ascii?Q?r0VKFSi05ha90Mt3zmtPWmNKHMCaKvAFxcM4qrtZXh8ABgVFOsQgbhVUluB+?=
 =?us-ascii?Q?QqDsDSaMP//GhCUlll+mUdU1++a2gaaQL7ko?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZSzTlveqS0XqONl1yIHzZCdeLDWy4ue9b1IBFcXmZP/kuVw+qwSc/R7ItlXo?=
 =?us-ascii?Q?X0Ty+HE51rUXwn7PFYPpNl2Ew822J5BepwzW0EhgOI3wQiyyHL+X/dzC/+H/?=
 =?us-ascii?Q?ycOx2pGxl0X2u5Mmt0WIND/PJpbLgaUGJm3K5pSShj3xkvzXp44BuruVa6TN?=
 =?us-ascii?Q?3UAnEcGO2lzqt9myDdw8wpwaR80/Pim6H+/IL7FDbnH+v34v6MxGQyTptA6c?=
 =?us-ascii?Q?QJ3SJRiD3sa9KX/Oi2DlVOQ8IbzMhL7TA2seFqOL0t8t62nz7FkHH97EKFDI?=
 =?us-ascii?Q?FDdVY3Oe+hDp5Lu9/GsLjqOLszZrQWhsN5QkTX++8PVCo2WJkHpI+EpXasIu?=
 =?us-ascii?Q?OSOVT9YhzhiIdBSl6sHhoqjJNQqtj1WP7E9F1Y9v1Jp7+Q6lqyHhy/++VJAH?=
 =?us-ascii?Q?s1K6fMk2exFjGdphdNSbrZOn14xouoeq7YffWen22U+quD1nGPuxVTEoBPwr?=
 =?us-ascii?Q?3A+GpE+rQj4PcNrBiLfrr8ATu6nGnEE7LvsMIUXcQGsctv+Bp3G9OkVeTf8v?=
 =?us-ascii?Q?mcCc9lusZsC3qGWsOQ03vQGrriNTAx73KgtKN62wuNgtgn3t6VPSQOcCndrE?=
 =?us-ascii?Q?3ebYOo1cuLlAI8WcMw797huy7mjmOptFxwowrIa8Z68jk266wVNMI+mROJye?=
 =?us-ascii?Q?pgevQLb+gn3zYYxQvK2sJNOqUgSHmL2CgewZaCWwHxKk4Z1GSz6czXjc78Ms?=
 =?us-ascii?Q?kamnCPmRNfBCqwB3eON6X5WqtkI4qm2f29axydE7sUePi8zud2oIp9+GsIhJ?=
 =?us-ascii?Q?r4eoIIRuZUpzSXJ/OpOl7XuLoB8/6rvnLcpXJKRB9Lme8QxiAnD+zJfDf96h?=
 =?us-ascii?Q?notNXDRibUALJriD9nnYXHZgfVyw7KTblVwl0GhF+XM34p0fpZA2ug3KItPg?=
 =?us-ascii?Q?B/zozmuUSlF4ENEHWkPSA57nuzc0KYugiK32IHO2l9QapnQpTC84pzblM+q2?=
 =?us-ascii?Q?LD9WG7D1vclyHK9AZyHcIWY92iwBpfEgFVi9Qv40Gg93GWX97dXCA/EHEWMC?=
 =?us-ascii?Q?JnM3BZIuqJ3+1We9AiFYvmpfdng8T2Ec+Rz5up5vW1jWUY5iF8VyYD2Agjvp?=
 =?us-ascii?Q?+UsY0RekriR41HMBxbX7fB8C5hw8hME93en3fUiOUoY6a5uYDG6uje0+WyEz?=
 =?us-ascii?Q?1LTrMEXnwYvdEFXnNkQrogvBd+cscI4/1HEFdQL50lZurrTHnwRfV3LsaKuN?=
 =?us-ascii?Q?ViRsveJI+WQF+uV45sG7IniFTTCGGoFLfpP6HIumVKwa5tCXZfZ/wltVjRK4?=
 =?us-ascii?Q?1rYV0GJ/aKll6s7d/oFYdzi4CCdObAIh6h4UVG9zOcgMVMYYBnBK582Flzo8?=
 =?us-ascii?Q?zdqZlz8G6CbNrSks2CZK2xKHvyU1Cly39SDG3fSjOMUoI1jL+3Gkb2vZ/6g6?=
 =?us-ascii?Q?3gOskV9UReY9IunGtivPRu4O4EpuYvZGzuYh9uv/rwJzhOOEp+dyGOI56+V7?=
 =?us-ascii?Q?w9MmfBRXbJs5qYo2NE6FsLy+iZ04DMLwZ4BPrm3GijWNYSl3bWmx+a1Kcfci?=
 =?us-ascii?Q?LllALSnPe4/HprCg09uTvxEVkA9NfOVWPYkJsa/ysDk4J7CC/lnivkGbr35G?=
 =?us-ascii?Q?p8zXCQ1HypAbKV404ITbpfenq8rqL0DKjriTIRJjciRo/hxxu0poNyAfSYx5?=
 =?us-ascii?Q?181RNTzahYZX0VAWt3lxils=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00375673-c21b-4b08-af8d-08de20b859ec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:08.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knm1fSXIanmKjjKGPkzDihHsqS+4rnz67GmfWe3zJ92Bthp6Z/pwxjXf9mWMaxJImM28X9fn7LGh7cs7cctSMtH+lwr20PWFlcDIHbW1v4DOu07tzusvn0WOxGI8tynn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/es7134.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index f5150d2f95da6..441df1523f1c9 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -104,7 +104,7 @@ static int es7134_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 static int es7134_component_probe(struct snd_soc_component *c)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(c);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(c);
 	struct es7134_data *priv = snd_soc_component_get_drvdata(c);
 	const struct es7134_chip *chip = priv->chip;
 	int ret;
-- 
2.43.0

