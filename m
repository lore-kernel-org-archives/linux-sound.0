Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948A23B607
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821445; cv=fail; b=NUop3GF3MSKZq6LxRcsZETOE5P7BeTILQOvBfPUbZYd+ua8Q/Pg/J58wV3Em7vFa6lJNbxsK0YKFZvDN7NgRIZaz3XqQTbapj5nXNL8kg2nwUw82nLoAi8IVlvpbHSTEE/yWUvdO2o0EPtuDufAFn62qCESJtUemYd4/wbxb7O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821445; c=relaxed/simple;
	bh=vMp8MgGgMGOsRDgp2rzx2kZT9xBGT7MqYM6xl/DY/IQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I0VUa/oGS2Lua/CMoj8LFk5tGe/JIjVvPySN/arfjD+NqJ7UE5aMFRAX1EtvjBOuDF4gdrEDgQbJv+pxzgtstB6CQreW5Hki09xw/8yX2BCRl0RthGjGtb93fjufEdtkWx8fOSMuEVcHSY7NEgi/CaGNwoP+DfICd/3TKja+pZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mgpx+xwD; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mgpx+xwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wge+wUUCRNSq81M3C5c7lJUvGv8bUKcB0KA3K4N04fWLj+dSrb8Ca88vqCRihlNKcKgupGZxG3wpfBCszF6Mlq1KL5hP2rd3EO3bVoWnhbya+kjXXLKWBcRrYQn9hY9lVMwzDyLp5strgxuiWaoFNoQOY6OgH4SrRhoJxj5GHoV11tZBpPKR6+RbjYrr/JkaSliB0pSrBy2i4ChaSRfhqkVI8f27UzLqUq5HwDZDJXdwHIVbZl0l+DEnZ05FeDHBAt1m39Iu5NdzmHHRMTnsDm+5I86Ze7HLnDt87U1iG8XyGpTAQ4bhfoTjcDirmTC1zPoNtp+nU9DmgOBc9t3adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4doWj2ueKDjfIzdchtl5jpv/xagWZrMHyoUXOZBUAHc=;
 b=EwW+9Z418V7y7rNnwezalvFU2yHdabQetRO47VOQwSprhEBPq6JedHP7b8Rjq4lP/gxRyDBDZBmhmlkR6A5gbMiD2jOQWIu+4PL7aBKPZ3wfwGStGOX2P9DdiYFhUfLvqceR+luOtTVUGEFL1xL/w+88eJTXRRp8CtKb2nxPsft/K1/DyugCpfwNwIuXJojyB4HtQGyuGihvziOSL12LYjceAuBZmUG4vkNnHAXuK7JLJaMlC8VsD+eWFCNg0rxW1h+Ize8+nSeivGuYbKD7N0Hnq1ddJE005dSnX6/KYOryox1cRtmA7ZJCJaY0cD56LRn9kKlJ0ZFx9EUTFWWlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4doWj2ueKDjfIzdchtl5jpv/xagWZrMHyoUXOZBUAHc=;
 b=mgpx+xwDHFWWL4WGFoOsWSAcAP2/ZIRj0bNH2x8SxvjPHkhFyuRzk8ZDE51nA9Mfigd4I9qSc9qcaCHl8lRqo5dbBxHPU9yWFynQoWpZQSUAY6ZXd5aFLGMUy+WKobqPPcCht1xMN1GxFiFGYT7uigcIhvJrgHYYLtrEaAfZH/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:37:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:21 +0000
Message-ID: <87o6p9s8u8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 291/292] ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:20 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f6618b-1e8c-4531-c39c-08de20ba798c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qyBFHgvMQgYpuoo8B4f5UurJPpvjqUJSy1XbYVbJHmeL6blSvdUYS/YnJM2x?=
 =?us-ascii?Q?b/FWrAOnbieMaM3uWWyKMHCnoh7rkO1Mgyy2wBSVNRqYK/DVV0ezf1EnCl83?=
 =?us-ascii?Q?DTKn8mvc26UVuUhcGNYv/t9oelOfIxDdRkPhplyWpUoOv+7chM/sQJ5YNPQo?=
 =?us-ascii?Q?gs+o5Tzjnmz7vodhQD01eEHsoHOWky+H3bO+oEsFM/eCIor0/CuAYFPeBZf7?=
 =?us-ascii?Q?Gh+kX8kJcJzfY6eQWaQZMiIvkwKkhcqF2bJe/v/Hujc30x1WVX1AWKwWSDgT?=
 =?us-ascii?Q?WK0t3cdZfTpeU3XvqlW/tVxGj2Eq+VG7nFe4gKxJIW8ZcMycAOMBTpNkQSxI?=
 =?us-ascii?Q?4AjpQkFF7STSG5u86ved8Qxsl9XkDFs1Izbe3aWzh+klgYS94JQv8zee9aj7?=
 =?us-ascii?Q?2yo3nr873eMckrsq5IG00E7TtcxVb48GYtPchUnJ0tARNn6l88emKDbC2ouK?=
 =?us-ascii?Q?udxpmcvrru/DYyVIHECxZw/qgXCOmFpI14Ew839OpasRDooIYut9PdtC5T7T?=
 =?us-ascii?Q?LU9hr5bEzGYPw1VvyVCNTiWgbhygYosPWbHIRe9hzNe/VlODrdJccPCbP+gE?=
 =?us-ascii?Q?mFBgBYHyGPdM+SJNG9cPp+Tzx27aOldmsY56hiF7bqnb8N2e7DkuLylRnUig?=
 =?us-ascii?Q?1EyyfysgJFEF0J/vE4ZJM3e4DrbHNI4E8W3ceiMci0CPmlvpW4CAB97D2cYJ?=
 =?us-ascii?Q?TZqW4IxKq0DM5fVZoZRZP0gFxEQEB7CHcOf55vD+TY1lJtDEfyrRE1onVq7O?=
 =?us-ascii?Q?tf7oG8OwbxICB0MKluJnvyWh3Yz+1ak6+K3o9QmDW3T4HIT1qniq5Z3e7Gyz?=
 =?us-ascii?Q?zVPI9I3+qnT/H9UufCQzEHjQQ0rFRKLobzr+/detEOqDf8hzyLBybb3SshDi?=
 =?us-ascii?Q?0r9QIcp0vfO/4zbLh1TU7pRQkl+EEZPI2fO/9tQnKMNTJycGuhkJ1OKGf/D7?=
 =?us-ascii?Q?FyswW3hFYm3vWBrRjwqGkcZn6JfDSMjpw6yn9Mc1CvoSEwEQKeyyDsZE9iPe?=
 =?us-ascii?Q?YajyQKlcAcV22XdoGfj+LABX+2KxwWjZI1cINWwr8ReRbJNRMuDgH8EM51z1?=
 =?us-ascii?Q?ScThsuYevJ+4/AlCybn3M1oEzDiu0VOGeDZKWBRE3ogHbFr/CNrSI6unefi9?=
 =?us-ascii?Q?w8C953PPnyaXrYoULYQkiCJ0yBg/ZwdN7OpCeExF+rFDcFUTsJzb10NxzDdr?=
 =?us-ascii?Q?C4gK7DJvZpJgRrBcpEl7LTAjbEqhQGz8ParYAN8BdTTRMzxdLuSPQcs5wFqq?=
 =?us-ascii?Q?2CwT2WrUb3w98YBeiGcLe4jX1DkfF8kRGk/ACy8z1DOthLfbGk6hIK02in0/?=
 =?us-ascii?Q?PsucdIZm4wrk7I5i7+noAuQa3TCEdZewZPPeAUlbU04FMayvQfIoMD+VmsAu?=
 =?us-ascii?Q?5UtW5eN1tdyE6t7lAve6qRJVRTfBtYU3+EI9zfFgtbUoGKbQn90dVJKBYKka?=
 =?us-ascii?Q?wWxW+5QjmVcwEH+q3NCdfOQCxu8uiNO5dXWK2TNwtHtqQAKxlcFF52hIchuO?=
 =?us-ascii?Q?nJ1llIN/Y+JX+3wGkdM7j0NBkJ49NfqiKH51?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F6F0iuRsGeGg/yOQ1DWA0knVmbJ2GnPKcAEjP+Wayt6Wdsfo4I65m+ynTKlz?=
 =?us-ascii?Q?xOxn551AdcBzaDoSOaPuluQXr8nceJOmrcUcTb2kH6UAzEZ0uDFrYyDhJKys?=
 =?us-ascii?Q?s/qUhM4+KsLtfZ/0+vLcEeasrlW/y8q44SUstj8c29CRRTOsnZdBnqh8oGUI?=
 =?us-ascii?Q?1wvyFWuivUXBs4+wPU/RO43lRy9v/xteVwKOo5/t5KlS6HxP03Xg7EU5zU02?=
 =?us-ascii?Q?4CL93lvyNZGweIYXmnt8BrjZ/n/OdujH1cnPV3YX04hHtCTYzrbevFJDUIHa?=
 =?us-ascii?Q?FdpI0gnQr57ucaciNrEacZ3CxLDn6K8QA+IG4sAbz/bwwgsajHF1niHyguBh?=
 =?us-ascii?Q?+gd0A0EC+B5wO1k1VivH0C7+HJfoWZyCIDBTCBFWjWva3KsVH250zjnNTOHf?=
 =?us-ascii?Q?qy9CvNbzHlSp12khdbp8/3ltuA6pYWmDAsb1Wh3Ufc8JbLSaeN0FUQ3Al6Zv?=
 =?us-ascii?Q?vrdyFufWrIAKb/MHuHTuvC+zIpeeXc/qMtK+TMOM5hs640UOiFyQPfnzwb+1?=
 =?us-ascii?Q?HkLmthqrsIKHycmtl2fyzfThMKnE/OFTT3rJvbBfUtROnKcodTwxQI2xnWr0?=
 =?us-ascii?Q?Wi3B64S7J+uKYX2BrSMZ9tVthrHKIUrxS6QFlWPosJURirmZrvsU4ek8hO3k?=
 =?us-ascii?Q?Sb1SkZKfNBFns7fHpj2aHKKPnFoBDawhaN3HeWuE92YVFslchHLF/RQ+cx+z?=
 =?us-ascii?Q?e+NfitvojtHZ2UHWJeaSbQLlhUuULdG20JNQsjzdZpa3i7fYcMqnqHKH5FBy?=
 =?us-ascii?Q?WiptgDY2M1bH3lDumyGrxv0fqcokRP1ydq1dqgJecXTrrDHzs3aAEFSrvaSp?=
 =?us-ascii?Q?r+TU41lF+i8eVhVHFa5CuQ7HJoattT5cX/m/AMIuZ/UahDkPjn7skCZf/pGw?=
 =?us-ascii?Q?sJ7/XrZ2aZuRjGo/BWDrIowD177uHGW8W0HEuRs3rFTun9CG4YpooTt5dJ8i?=
 =?us-ascii?Q?z93bLpqlTjwMliyoHaGku1hRnKjAH0eYnWSpmtT2f+C01kp+JW7SG92p55h1?=
 =?us-ascii?Q?sqkStRnOwNHnO7yLc2gCfsEtlommHBi3ssrhRx7mMFkh57KbxYjcfL1qq7BW?=
 =?us-ascii?Q?gbzkIAcVHHisz36cEWtZghNCiWQLOpF4NFx6LYI0+VeqBmlFgu6taLEDqyrI?=
 =?us-ascii?Q?I0u5kOQvgxL1Q7bOCvbIWDJm/2ZFa7OIMGWhN0IKkppy9tjX3tC8MVdMztPW?=
 =?us-ascii?Q?HyRsOZdQf/jd/PLscTtTeMlRQgSa34ky8Lg37WXVTg7JqnpMFxvracqoCU8j?=
 =?us-ascii?Q?3EEvLQPM7nqbEd/ZSoTZs89BXtAe4SqCQzriGGFz8ws1Nw+Vd87gVTnL2a6A?=
 =?us-ascii?Q?Idu7jw8uYnXx+KJJ+iyxmdLCC8DleXS2PzOLueWTxCUk/PiPkdcIsCfsVvB/?=
 =?us-ascii?Q?70l8Bhg4D3C5A7OfXA8vD93m0aepgsLFYaj7ELlBEFx4uE2FIwXj2JBuOOf3?=
 =?us-ascii?Q?Imcg4qAA1/sS5QxeJCFeZ6r0D6BRmfmjKoj0cNNwD5ts5NYFIhgfjUb+kaNX?=
 =?us-ascii?Q?Pr83ZqCHBc+qSncnW6FKr00ZZTlowUCCzDIcTTjCTYOTXBB/UBNvnk0SKMJa?=
 =?us-ascii?Q?fwK5qzyVpqhivTo4Hj+h4PuzOCYgNVyBEXw2hNkv9pOII/hzE13CzUMDi4K8?=
 =?us-ascii?Q?sw28ohHJgM+D0wABB3OkcDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f6618b-1e8c-4531-c39c-08de20ba798c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:20.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzEsm5vJRP5T2QK4Lf8WlcfpwB3hFaWoIlSDfJEA8xpst1l36SYTj5uklfj0fNoIalu6+ANv6euSxZY8JxVT//quJQ2Ev0rjyIK99ZJbm5dMPZYLDdzBytI3vzI9DKDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/ti/rx51.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index e969031657e9a..7eeb12e5066c4 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -42,7 +42,7 @@ static int rx51_jack_func;
 
 static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
 {
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 	int hp = 0, hs = 0, tvout = 0;
 
@@ -89,10 +89,10 @@ static int rx51_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 0;
 }
@@ -125,12 +125,13 @@ static int rx51_set_spk(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_spk_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_spk_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
@@ -139,7 +140,7 @@ static int rx51_spk_event(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 
 	gpiod_set_raw_value_cansleep(pdata->speaker_amp_gpio,
@@ -160,12 +161,13 @@ static int rx51_set_input(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_dmic_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_dmic_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
@@ -182,12 +184,13 @@ static int rx51_set_jack(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (rx51_jack_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	rx51_jack_func = ucontrol->value.enumerated.item[0];
-	rx51_ext_control(&card->dapm);
+	rx51_ext_control(dapm);
 
 	return 1;
 }
-- 
2.43.0

