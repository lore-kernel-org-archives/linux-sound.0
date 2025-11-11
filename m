Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FA23313E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821303; cv=fail; b=XHczW15XcTb28ogobUu01JVJu5CIX9doByp94oOeGF3Z6crhFQos3jzBjd3ViGe/VsqXSYcbDgVtHnfSGlGpVdtM1eqa9xs63QrzHXbI33dOpxyeUyCRPbHSheKrv346a3OInvsK54Z73xByAulhnydiaTGKDOqr8fd/jkiZNxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821303; c=relaxed/simple;
	bh=hOmSPqddwWV4dO+MhdAc+uvqbaBwWAkzwHAwjZF5sNc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UnC+zi/7SuLV1H+JoiR+8pGU3tAp9elHQKzptDbd7GFpl1ELphwbwpJRVOgObpQOQUYseGpW4UYP/A7ae/1tAgjdStTUWZiv/rIh3vg/+/tZsrp73ImsbeUnrGhKy21l6FAKr778q6sP3AtzBnF92Ybe1p3PCVRDqoqozuv5U5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gw2zVer8; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gw2zVer8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHu1pvuLE2hcKMP8SBkfz7+XpNqzAmxVtrqmQDExtpryU4qdM9puMyiaEaBXIjpjj77cVOpMlwOE3tLwF5V2AFjw9Y+iVm/EILFd8sXkPQOxlrK0XDTj7QqzKiz6xf1tGUXKfrDYbpnkATXukCmX/LvmfvKUYa62/xcStdBtKrKFzQs/3rr2yAgckDl3O+XxxYqwe2vLKx7I3yuurFR7PMZcaTT+h1v69sszu1vrKra6L/Vs9tMZ7EAiuZ5kmcuE+yEl4I9J31tINCfgdJ75eYScnA94suBwgJ+QXP5218wZKFyT0+bvStyxeM8yUpaMbV4GV65mF8qHTNqP/MMRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PbwdD03YkcO8X3e262K//C5/5l6/u8Eup2ZlplLeRc=;
 b=VE2c742e6dNh+go0rZSJpkhi+CQB7y9bm/cBjCxgqkNHfXSQPTtVW1s3P3VSaRzV55jGCEdEC9x1cJ5erlQejbQ9qwBaudo+4g8u4Fdh0lb8771YfhYclhJp1OrGbOKiPTWWBDiHKzWSDGQqlMKiiil8DEKeZkJCokmtElf/tjeIenOITqKIiFYbhH2Nbnc0jaiUMw3KwTv5Y3ONHdgqjXbtprqZHPgUGQKUwfp/qOqE9zobAiyKaEhca3EY2eMxqCPnZgSmWoHk7AZzK4f9f1THxmSSxWZijqgnMZ+sAdsW01yn1bl1+yh4beE+n/n5/VBw/NxKAJfsXQF87gGgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PbwdD03YkcO8X3e262K//C5/5l6/u8Eup2ZlplLeRc=;
 b=gw2zVer8CM/SSwFC2k3WaQ4sePVzpAY7jL6nylD8DqnIWmzIXTNutoTA58BGSTGspkpIOyKtVgevjg0FlAym1DslvORSYb7JaWztOHd0LxvBxcmWyl/6HTUA6V+Z0I654Yxtka+EZUpuSz7pECdtpspLcgeLObj7UPz/KekouV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:58 +0000
Message-ID: <877bvxv232.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 253/292] ASoC: samsung: speyside: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:57 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbddae7-0a98-4860-76cf-08de20ba2467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iNs3fL+ynnx2x6gwbx6jvfdEXdt+oOHhOfjrssGdM9Kx85eJYLjkvPq+lroh?=
 =?us-ascii?Q?dsMCfvrh1YAz9Aecuh2GaF6WKHTdsiXmq934Y7481NMQAZoPn6fR/dgS7pZH?=
 =?us-ascii?Q?jsL9r77pI2l9grkpXCRjOkSgLbF7x9jsh4HMUmCNebfd5R3diNclHK+WQiYa?=
 =?us-ascii?Q?4GcMUM00aTKQkCpg5uh33qJZVOsjtiggC7Xfooh2w4VRdUAiodoL5D/2ETQS?=
 =?us-ascii?Q?qfKyE4VEkT0OYX1Iqg1T1jnoMjAWzSpSTn6ddAFJ9QK8eMlTN1AfJ9FAbzwJ?=
 =?us-ascii?Q?V6TX7TUYszwNB5PBZOYMOTeYL8Noyj5UwzOnDNmEJFPuHfhUPP+fpv0D+hrW?=
 =?us-ascii?Q?7aHlWH2BVD2Q1sJySELjC5WDHuw9Tt6H8+yJz200XXVEqt4tmAUYNSk6fGZk?=
 =?us-ascii?Q?ToRlxG07xeB94JewSp7+h8OBXr8Xt1IlIGexr46nQUbqBBFHQRod010Kq9EP?=
 =?us-ascii?Q?grJalCgkABvFDyCulkCE8MYm8tz/oArwOZ2ScjmkQlbKK4Q0E03YXpU5MRWf?=
 =?us-ascii?Q?JTbml8kMPIm7kKfIJYv82tSm4GqdL6JHQTlGbMKrdTyi/jgRumk9tSL/ESRQ?=
 =?us-ascii?Q?wfDGny1njddpo8C3xFaR/ArXnaoxR0A3nFfW9UEfAETN0IRN6I/QwMUFVf1j?=
 =?us-ascii?Q?pZr+XqU6HCWno40VQae38jKQx8czw9sgLz4j1qKXJjmUOYH99NaWG8/glfFl?=
 =?us-ascii?Q?NcCqFxoTNb6e0CockUR69y6EI7UqCGuOgZkdKumoC64AMISrmUXEDmGgc/aD?=
 =?us-ascii?Q?JpsTRmFttbyD9GAz2scCoywFSahDlOEy0WvDsejrWXzUAQqv+LXExoDxbMAI?=
 =?us-ascii?Q?vgrpK4IfS2OmAd7eXj4BDDTG9Izs03hJGFIYzmCnX3CXgdrM8GUq8s2502bn?=
 =?us-ascii?Q?OUyYYuHIv+1MtwYPOorSKC21B9hML3uf51m40CxG2O9Lb1g+licOnF+Ch3JR?=
 =?us-ascii?Q?+Zg9iBtZi8x3dAOYIz1mK+JTyIEkQyeI51XV5YhxfrG5CH4YSXCz3OPgWZw+?=
 =?us-ascii?Q?IU4GXhdoLOp6GeC+yWtM6eLB/KRtHZgWHJX7OpRYbfPXH6MzItbiQXb8Vq/A?=
 =?us-ascii?Q?QgpYTyBhOHtWyIkV9Mq/hFNobTVhTaggv2fRiHHTA9FrNfhnOvC4uSXa3w88?=
 =?us-ascii?Q?H+st0LJDkZnEP35tYJ+d/LeLjHLV4aNBTTTya4W04hB1tg9x4f52S27q5WrV?=
 =?us-ascii?Q?EkA2TIN9livX7d7OhFsfSRdCGpCrIcFq3XUSeZ1Mhu/4RGp36yM0CpXT82gz?=
 =?us-ascii?Q?cC6zgua//X0OpNcYAFxa6p/MwBSHmIYHMCYFT/Oeh/wNxxLiwcunZ+/Zez8j?=
 =?us-ascii?Q?jB9PvhO+hg/HtrKcblUOLTk3loUIGnVa/SAa010bADOtTPJJUz0yHlzGi5c6?=
 =?us-ascii?Q?8/tAfGwn+5O1eAqYIz15xgXqdvOdJiSetz6SpHXTeQSxh5LOGobSs0Ael8OO?=
 =?us-ascii?Q?lO8zoY7BzSZjpmVdRwPNxBPM8vHNye6GcZlw4GA7/nX4NF8ZuXA3wiigRpxz?=
 =?us-ascii?Q?afsny0po2EKooIDMKTrAnMNxmKPCogBoaKEh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F+OKIxKd3Z7SRMxdP1Q+MOs4UsmRFlSxUNAuTId9GtGRhu/rzI3uOSFU3kxm?=
 =?us-ascii?Q?0fx8lgM38dmBZOgsZHVZF+0iF/qB2ThBUTryg9g6TkMzwSkW4FRfY36qAbpU?=
 =?us-ascii?Q?WGAPDmUTbhzPG9fU8WFPI3uGwkAqSFJ5jlDU8mFxM+d1GfMWGBFCxblS1kU3?=
 =?us-ascii?Q?6XHx39KQzc4oJqO+KwErTa0BBKQa0y8CQ4viSV0mgINKrGNWyvQ7+43/hs3u?=
 =?us-ascii?Q?bi7e66OrpNgrscOOGHutMTaYcE+0wtpygcZkD8osnBnECw+g23JugtwDIMdp?=
 =?us-ascii?Q?fFbo2UuQIvhN4/GLMQnmcRbTY0glKSzdQqdEMBURTpyJGWbVx6mEAegJdMNt?=
 =?us-ascii?Q?Snd4lhLaPZbNpfhy+fTgDg/ursRBKaDJUtBcRkJ9aBvmV1N25r7dkP2AkAtq?=
 =?us-ascii?Q?tVQ6eS6Rk10+UdwndRL5HiXZ9V3RYgduTlCnreCtovkVtTdHRrJAEsih0m7a?=
 =?us-ascii?Q?brP+okkKrbEaLLM/O0r8P/gYhnbQmmHhY3vatDvcAPrTsEJmBCJhODE+Alq4?=
 =?us-ascii?Q?NroVzeY0592fLF9jrdyE2wQIGrSuC9ksUQFP/4SNxP6uaOFRrbmu5BNF+VXR?=
 =?us-ascii?Q?Hk8Wc7zGW6Tiz2wfXbVsmrl/pZKpArLJmqIpdoJ0j6YvjuSjM5czYneglje4?=
 =?us-ascii?Q?+yjCK9R9UlqCVxLZdOtG354Ixh39NivwRmOTdC/mKHwHndnVG0B4t5Fo1ogs?=
 =?us-ascii?Q?lNeMV8o/nx86rkBYK8TAgV2JrLoJ0mQu08pxF1D3dUN4OMYPZVmxrtnwXXw1?=
 =?us-ascii?Q?lJZsR2JUk0+lS4WQqdk7ItcvEIuRfMxiGDT/gH7giZwy4nPpIMiB6pbzwW80?=
 =?us-ascii?Q?mLSkHRXSEQR7JTETnX/ESZTlTtr3HjFcdmOmYdgW8mhfaz9qG8Evf1vG/2f3?=
 =?us-ascii?Q?zBeAhVK6vT/tUR5Uc7Q2JXzVjI345b4+0g5bhLjUmKEk9VzZvK7BKYKwXyVT?=
 =?us-ascii?Q?37l6xzIoW70Udl/6ZhfQSmFVNNqn3avHO8TkFIl0vrxe7RrPWIeFKD64altV?=
 =?us-ascii?Q?TbQfqOjx98LJoe1WOSF0SrNahSyd3NWB3CpMUr4p0zyLEzRFsQkDnDuKphIH?=
 =?us-ascii?Q?diH9shLuNAflWFpnUPmrfzKHuqoSJpOMrTddbvevlD3IIAtssuyv2nxqQXGJ?=
 =?us-ascii?Q?2val5pQnXy4UW6O5nyemZssfd6/EQ+BaeipLSk176UHHdRzBvfe3lUmfZYt+?=
 =?us-ascii?Q?8KtKDrnB9kvacnPxrtIfbgftfB1LtiNK8kD8375UL8M+nGduG5OCzs0IcYPx?=
 =?us-ascii?Q?WO9QAgQ80nPhqb0QGNGhYIgC12IWqhSAyTue8ak+m0WRUbPSiyRqbMMYFskH?=
 =?us-ascii?Q?oKsGvxT2UERRG/QsgbnH2z4Kb3WgNfqLUlyNhpyzZlfV9dHK7uzSpOEowux4?=
 =?us-ascii?Q?sUg8QKBIAcNrAaClboVZcj91lSJkTyoaWfKgOLCx6SL8egdYQ6SHF2Cbfv9i?=
 =?us-ascii?Q?SN6bEM1a6wVHmGvZ+nbcaNB+eTz/aUJ2uY60AwJt4FiSxnPqhrfTm56rQlEk?=
 =?us-ascii?Q?i5YkTEIIFXhbEc5hs14SP6RdctaB+CbVB8djWzTayvIVGbmSKFRKhAfR5vlW?=
 =?us-ascii?Q?OE+QtZ2W0cfEeFo1jnvchJVTUjOuEqMmHQirifaFL/K9/CGLEtVXSwFT3w12?=
 =?us-ascii?Q?nUR/N9CWQXhYBn3bmg992jo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbddae7-0a98-4860-76cf-08de20ba2467
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:58.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAHXq9dIdmLCW52i7B5bAPq/wkDcom8jLF9jJvFUoFVFL3YlUPxWFPWwRZYql0CSyMOkUJH/2Dx/jimHelZZL4O8PeM+GkHbujL7Dj3aSLkPPU3ZRS/FNz/09V0U5dYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/samsung/speyside.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index f4cc5684ef0ab..26701a55fe0af 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -27,7 +27,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
@@ -63,12 +63,12 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (card->dapm.bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			ret = snd_soc_dai_set_pll(codec_dai, 0,
 						  WM8996_FLL_MCLK2,
 						  32768, MCLK_AUDIO_RATE);
@@ -125,7 +125,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 	gpiod_direction_output(speyside_hpsel_gpio, speyside_jack_polarity);
 
 	/* Re-run DAPM to make sure we're using the correct mic bias */
-	snd_soc_dapm_sync(snd_soc_component_get_dapm(component));
+	snd_soc_dapm_sync(snd_soc_component_to_dapm(component));
 }
 
 static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
@@ -177,13 +177,15 @@ static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 
 static int speyside_late_probe(struct snd_soc_card *card)
 {
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Headset Mic");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Main AMIC");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Main DMIC");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Main Speaker");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "WM1250 Output");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "WM1250 Input");
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+
+	snd_soc_dapm_ignore_suspend(dapm, "Headphone");
+	snd_soc_dapm_ignore_suspend(dapm, "Headset Mic");
+	snd_soc_dapm_ignore_suspend(dapm, "Main AMIC");
+	snd_soc_dapm_ignore_suspend(dapm, "Main DMIC");
+	snd_soc_dapm_ignore_suspend(dapm, "Main Speaker");
+	snd_soc_dapm_ignore_suspend(dapm, "WM1250 Output");
+	snd_soc_dapm_ignore_suspend(dapm, "WM1250 Input");
 
 	return 0;
 }
-- 
2.43.0

