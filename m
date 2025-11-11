Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA9185955
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820546; cv=fail; b=lyJpwKlhGS1ZUIVJ/FXu42RtJChGNyyGfN+kC/SfXfKm8GGQeWP7RleHY9p+s8qNxm+rhmB/P6KBy3riMaqhsEte5TQIspLQGkwP70pni3zxUa4hfH9KyNaxRfaC0fI7n4mViZzY4DU2MCD2x3zY1SwRTuT4wPQZK/WBA9u9Kfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820546; c=relaxed/simple;
	bh=g+kLWG7v8JsCgrRoi3NRXbYqQ2+IfkctkhpSWk75dr0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gTfkNEDIV2ELBaoUisdnh9UUHKuWhXaaamS5e1ZpbjdEO7CrXfnPeb+DedFq6t209EoraNhU6a0le1K+7qDanslk9WVs/MFdOmLhGi1wAT5vLcH/G5nJWpxZSkcfX/fuINYbsYlLrpP/HrhutT86qXat+5jnkOCQGV525OYTBjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y+efw1iF; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y+efw1iF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lf0xZGf+6GtqUJjS7xDJczQgpPiCuR63FUhJ2N+UschdKm651rVBJ35BFgoVtgC8/SSR0q2wcix0PHM3Y/KAqgftt5KTtaiQCGupqlvs0ja0Fw/px9yhzp13ffIOqLknfIehoBX5OkFvbQN175VldUAzk1+ARUs9GcYvsDNOwPWKxXgCizN7EJV5v5cdufn37x0ffN/2UnjyRabCixICctLCVYQbFV8yCX855tq8SLo0WXu2teL/vdnwhkF1a6bo5d1X2pJb92/8NOuF2qmUgK4KnTyDloXcLM8GE530/PLMVxzm69+tN9w1KIwCliRk/DfeEbs0EqfgoJJTCIeBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PqB9dTQqJOPMSkkGOOAxsPNH4yEFs71tDqGcSpquPU=;
 b=mgCUE0wwZDz8sd5OISO0cyeTDjmaJnR9IaaeTs79LDV0JwySgPdBWChuQYwTICl1VqDA5+NkT30AmQB0AklzfObGgGLOVSnVh7tCy8x68TPuFdahXkV4LZn6Zy10XuBnd++NyaULQ3sJf6G/LyOh7lvTMK2FZaW1/v4nm4NQyMFpOHjGmyiBph7XdCJO8QIdrVkRoy1waWLiKW5z5hI78gEvCkQkN4pGc/ep8AwY9vlubl/WiqeFKnNa7sjddg+LEkOt4UlghIbh3Fy1qleEMdJdRallWExdCdtOFsTElSbftj8Lb/Lbj4JV/W8EQMqcTj51aTnP2MMf0zqshxYyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PqB9dTQqJOPMSkkGOOAxsPNH4yEFs71tDqGcSpquPU=;
 b=Y+efw1iF67baLvEIsq4qYCsitDHGT5u96FMK4E0xYrVjwR0RsIOaxniqLFGfxOQV449/X4jL5qH+UNOcZCT1ZpuDy+c90N2FJN+iEV4/FOjakfL/tM8B1g8xofvfa+bpF4OOJFJNzl2PhS9c6phw5nYZbCt6GotLV9769p3sOpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:23 +0000
Message-ID: <87qzu55sg1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 064/292] ASoC: codecs: es8328: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:22 +0000
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: b49824aa-9ba8-43f7-75c9-08de20b86255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GCGHZ4qSH6PGhlKnw+0+M2tgUObMoUuc7BbMt+FbFbu1dvpOGWjhONHUjJMn?=
 =?us-ascii?Q?W4jWmkfWrxD/4FwDvpgNMCnwvBo+DBAeMxvXUkdnDQGeFDVlP8BYZUP5gHJP?=
 =?us-ascii?Q?dnuWTgOOoGrud1JhxZxio9dyAOX0Sm64NJV5b6GSSZRiHpf1S+C0qqZzDCmG?=
 =?us-ascii?Q?s7yR8cmF5t2mIjS/f17wjPgwazTEgvI3Vo3AWRlGLoy+Pp3+PRJLUgotSidW?=
 =?us-ascii?Q?CkPbowI32g5arGu99oLrJY+vr1gJtT7iIO8Zn7tIOg4mAqYy2Jq8AK5BZOqa?=
 =?us-ascii?Q?c+1a7T0Lzr+pw5OfV1x25abSUBGsP1JN0v1+YTHMMxIPRg3yHe+Kumh8wQQG?=
 =?us-ascii?Q?Hvi3uVYHl3yz+ZkRs2nEHL9gTo4OVSVbQ96TRFKJiaJDr9eK6WU3aJZTJ/rN?=
 =?us-ascii?Q?+uPMMrXKf9B4hiQFayoCV0+XgyQfW6159ntQEhzea8qGzYrpl+pRH7xaHSp6?=
 =?us-ascii?Q?2Azw9hnrVHgOZoQG1mP0+GYrbM4lJzHCjrydR8StPg/GBwLc/jlmYPTlKGGg?=
 =?us-ascii?Q?YQQzCxr9tsd2l6bcGoNSgI+h6Y3udPsyPlreynjDMVjw4vHWJ1KMUIRtTF0+?=
 =?us-ascii?Q?F4JI6WWh7fAM2Aq6VRWI6cIuupZ/pnkU9npCzax6ErCdWAZELDO1s1Mfxjcw?=
 =?us-ascii?Q?2mRYvPbFzs+w3AD151Jc+yJPSCCSfq3hbbKaNImuQWfwm5FtUo/OSKUqPu69?=
 =?us-ascii?Q?qN4u9iY4CxupmmNBAbF8v4iDVBI6vlWSZvoWuECASBIQGAenAoYF4lmseYVn?=
 =?us-ascii?Q?A99yB9GLGON1XPKWT9yeRzD+0c+wh1sZTDi19NY88tJKZ2HrtSdIAA/554ZB?=
 =?us-ascii?Q?yY3QWlsTaSoJg0kqSHgz240Sv+7PGEuv/3Ph+tx1uRiYnyuSi5edOuGljrar?=
 =?us-ascii?Q?3vYddu2f1UvTVZKK9gaRgOLxKLclrRvwlhdcL1MroN/aYpaxhPGiILUSzvb2?=
 =?us-ascii?Q?saQ0fxPSvVNFJhA0F7e84LP93xjUjVV1OAKOQmJwfg5KC2v5LsfmM9Qh2RF5?=
 =?us-ascii?Q?rnUNv9GYe6xUkLf5vUxcSzLf67Vrd1hLQymukJTXLWDrU3i5gqZErh80Uxle?=
 =?us-ascii?Q?nUIdoPfqJ7+5ffM2BWV0NiTOLWPT0QNozsLBqXCenT6jZCOpumF7diVG+90Z?=
 =?us-ascii?Q?EEXOLoINP6XiSR8J1ls8Y0VYhiRaOz995ftedPdw6vhdqrppKbVI+TaQQUo0?=
 =?us-ascii?Q?xZEmGlWgEaFi2TbhrukpSYeIwkx/n0349jHWlrh1m7/kGvjNsqVsJx6Rku42?=
 =?us-ascii?Q?vgavi9nl1NL2dcoBurnc4vzTDXkC+443pOKVkEUErpGf748PurUFItZc+Erq?=
 =?us-ascii?Q?e5+utqRVyNgYJY6rpqydrzxZJvd6KaezXDFVnEwHgK+SBfXs8EmxJNyRbArO?=
 =?us-ascii?Q?o0TIdMVU4Sbi/8caeN75nQ9QJA9shDefz9/zGCEgWHteqyeHBgDhLnPQAfGQ?=
 =?us-ascii?Q?KOY/CRFccQjJ4qyijUN8fOaSYjKq2QI3tAjuqDFVQSzNTRllJfe0xfIPQUDV?=
 =?us-ascii?Q?ECUR1m3PbtRVitSQ48RKLC6OiTwwOL7XcYxw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U0oQvRxwfN6LEeuPZoYXXuhgxcy7uYYR7SX73JnyunVku/x1cY+zgFSToCBW?=
 =?us-ascii?Q?a4Emz3ExkbGQNDc8QzFB+AASqfSKzIbeN/ThF7j3WmEDgh3owUbcgNmcbqvr?=
 =?us-ascii?Q?ox+hWS+OBBbH4zvVXLN3T3xgzMGKhHdGAFjqkACp0m56Umx6A4Yo/bfFFRIm?=
 =?us-ascii?Q?mZecY6HX+N0vECHkryhi6YWW7E6PcXRHY5zcMmBkAeXaySH9BwHDXX+mCQvu?=
 =?us-ascii?Q?3ql03247AS996qUDSdkJFfE0kLP+x5NV2WYB5DTdwIHbF6QH+LFo21vZvq8y?=
 =?us-ascii?Q?EAGngKo0fseWf1iao1nIcBcxS6ZDWOjjKAL7Tif4AdxvRvOpq/e4uNK7cVRK?=
 =?us-ascii?Q?ONyLK0O2qrA/3qcbU3Y4D5OgjucICUT7WWv1iCKabFI7owizRuaubG4OVNAB?=
 =?us-ascii?Q?nG09NEPnuHGPL6tUORYKhgo33wqRdSw5fygqPmrIhwgqEtGqbtcyQmvhi2Xw?=
 =?us-ascii?Q?E+CJ8unQoENyTr/nFU+RGlu/Ipt87eQ1woVBqppkiJYOP99zBNAa9O9YRzmC?=
 =?us-ascii?Q?PgWObec0WcU8a5UiLGZt26/bILF3iHV48K9upmgaViBa/lUFBPqIr4MAo6MR?=
 =?us-ascii?Q?fnJQU+UEZW77Lzi0pwoLChmdIhg3N2RMxaHslolIUdg5vJUGCcfiaS9PEQ5r?=
 =?us-ascii?Q?VXGz2uWuWU0sK/8OIqUGl+DZ6n78OZ2CrL+8fzAx+CdfPWSU3KXQRgcprbU+?=
 =?us-ascii?Q?0To3eMlORSBUee69UkzGId8hosMo2KSLOMjGRPjkGnyCwEF5RCYhqT10maRW?=
 =?us-ascii?Q?hfAaq4uY5m1rmknRcdKUZvkTI51IaSNzQSQfYalovplNRahHtMC86kqvr6Br?=
 =?us-ascii?Q?TLqaly5xmFdVJB91zRhk9hezT0k3vAdSBpmphVnO/9liMYKj1kScMTTHrXx3?=
 =?us-ascii?Q?fBe5s6SE/xvmM1PyMDN/flIfk5Ku03s1QuAE7vmBv2MG1cGqfWjmklRE/l6H?=
 =?us-ascii?Q?w37rUw3L80Zqrrc83e/E0Rb//cDreCsWKz7zFQE1Xv4plYzOeqwVPiyIj8Fl?=
 =?us-ascii?Q?0b/zFrSHhpwHvf1lnuB+aPol342Llouo8z7kDqp1e71yiGE2yxPRCxYzKeem?=
 =?us-ascii?Q?Q0UWGjew1AwZOJoPmTYuqpoNybUgH1qzAqPVJsaVGXqtYLAfYgHEs7A4Esq+?=
 =?us-ascii?Q?BlPKi5trkDBDgHryB/wj7HHo9AVKxWQHSCD6qefQsq1PfchphnyDD0T8iAKe?=
 =?us-ascii?Q?4/W63Q8mv7hQaUXfti5pDlGD2CLRdRcAD9ziOv2dydEt3ktZHGCBMtNMD/cq?=
 =?us-ascii?Q?VzsYx1WKxX4CXX3dVUuohbNsDhrXhmGVzbzCaAtHi0oY85TpZ0MGm7twkH6w?=
 =?us-ascii?Q?+K4T2/LQyxoki6lV9lA5Am8Z8BzIVFZupvUXbmBc1qqMN/IU20hBPZRxBbhp?=
 =?us-ascii?Q?JTEQEC0j724/rVqF7/HLgdbID02AU5VA1hqoIHr2ZOySHandyGIzW95bf+am?=
 =?us-ascii?Q?IAW8Ng2KwqTB1FBBybew55kXlNK80q5QfONaWNCiY5c8dCmOCfP4A9S1tFBv?=
 =?us-ascii?Q?KIKQG/FUkT0YuHkkoKm1mUqO/ayJNuQIONK7tG3Am2ckMG2h0if7SRoWwGnB?=
 =?us-ascii?Q?ggfxttHG07CEa/rec/G226D44E8X7+6IRSNp2sdEci/or5dLJ7x2MK4Vrk7j?=
 =?us-ascii?Q?xTuAlH4crWPZ2w7bjxbb+cA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49824aa-9ba8-43f7-75c9-08de20b86255
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:22.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUoaXWj4q652gPz3XKZoSM79D+/iMYtW6yimx9V/Fptfad3sUjzgQwzC8uDMpMC1nw2jTbxJD8DWK/SAToE3CBXiPbUkLSPto0NI8ncaM69oo4hfnaR36DALdqJawB8N
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
 sound/soc/codecs/es8328.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index e5762c6e56e66..1e11175cfbbbf 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -643,6 +643,8 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 static int es8328_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
@@ -658,7 +660,7 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, ES8328_CONTROL1,
 					ES8328_CONTROL1_VMIDSEL_MASK |
 					ES8328_CONTROL1_ENREF,
-- 
2.43.0

