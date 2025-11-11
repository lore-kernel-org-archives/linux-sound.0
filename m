Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C81F418F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821413; cv=fail; b=t8ntuOyclxgzq9Tsb+cpVjgthiZPAihBOFpEifKUoeVYsSvSFMAL/ABU6Ln8wvXUpmTpG+danDRpoKUIHMtH2thWuoyUSgky2oPHXzuKU3VNreuN+fWFucrW1ouO9GvcgLWDCtEP7hgPBaXazD+zPlrqDBIT6LdDRKLOZM1SQ5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821413; c=relaxed/simple;
	bh=elvi60B19rxhQ33USIHELGZcAcXMlx9BNn7KdphYSGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K7miF64BOSq8AM+ZVRtz/wJDSRlHXePjuRU2ou7ZFZBFhFx0qYBkKpUW9KXYAlY2MIwM1zUH4cHCdogqagAvAgEo/Zz1e1x42pqWiOQAglJ1MVhUV9ONlPzNMzk00IFqtHOZVimkw3orm4iA7AJa7W83R905PDxLUVCjSZ5U6Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YhcQWegL; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YhcQWegL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaES7eYdI5FRReMHdFvhrGjSVXxWIhFyncGfTmwY7V7AfqGxHNV/P/8BZ33F7bZU5nFHdGf8Ho5tcv+3uyLeEzd133H2dwXeeY8ZNdg8nUtYqwj4IXJFmT4H3z7A56nvCoSHoJXAqZmqFBAHp5IxHLQIhI0Epr0S/F2a3GiN6i8F6byII9FRN16q9+ky41Jy7+ZprQx91FTbymk/bh028Pa9RtPJiz1KqiUVRpcHl/GCcebvmdyLyiQ2CS9q9o3fPC9tym+tJfH/w4qOCvQ+tsyL20vNSpAt0dGE/2cYykzAqa8Xf4DPMxtfL+pvDXSij0F7MOYKwax1Lyo/eASf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls+g0AzyPt9Yu9utwTfpDh+FmYIblaEclI5WZGaOXgI=;
 b=MgQ/D8BX4aHnrdmbINaKq0uoPKtE1PzA9IhEfdKr7HALs0cGSUE/2AdW4Qk/oPhrcsbo9jN7CY4QBIYrIvWjTPRYXcAPPlUDF6HzfvagcrNkWS7wBCXPlxHSuyb8J5yVk+uZ4orrpJH5Gs5OZIMKM6DK4dA68GlGhaujg7NqqvPlf+J1m1MkBoGTIW2dDIbfP/tWsFFojzA8QR9rNnGnZCF5zCapBQXmuLHgeTkLWYgM355W5bh9p3N9+eG0/xGtnM3mEEdrwDccgkweCR9xc800elz4CizvgwOYMJiRRAUF1JPshrjXpPlMXdUW5zY28w814C0pGrkj7UGElwE5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ls+g0AzyPt9Yu9utwTfpDh+FmYIblaEclI5WZGaOXgI=;
 b=YhcQWegL7okeQcbtJX2I14zaOx4jsr9IG/gkSHULFvjs4+anShV/PAsCnUJQKReelzrNgzl2pC6iGaseXcGwnur1avwJc3+s4D2XaJotvV793u7QAGtEixXuP/l/Heyhd+Wd7iIMjUPsKdNuRA67SWEMI9Gz2+V1Yt3a/TQQSJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:48 +0000
Message-ID: <87346ltnfk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 281/292] ASoC: tegra: tegra210_ahub: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:48 +0000
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: e58af66c-ee6d-4d9b-a6f2-08de20ba6613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZFMcxOQtXRk8i1If8OK4rTtWeN1MvMCVpMranlkxeJjkORJMceiG5WHEnkTw?=
 =?us-ascii?Q?r6HwcHEF4Xis0CXlLq54bILGW/KG/UfqexjIbIOs5lLoA9gFkiAoGDCilksM?=
 =?us-ascii?Q?9kSk/5ZXLAvooVhkTD9dM935DOw0WaqRgKPBkCW2/3D5+14rCDXyqt08EuNP?=
 =?us-ascii?Q?BqqfLZRjmDU3omH5ZSDPVJRGt+HD+5bd1exjBc9IjuEn7PS7+2UDg4/RFjXU?=
 =?us-ascii?Q?SUP4KzqgSL1rKBB409/uEKnXCKEOKEMDN0gtkMq3+8e7Akhuhme+HE96JsdV?=
 =?us-ascii?Q?bAK7yOupfSEuTK2/Ki8d9iIkd/48jmr8S8ex3Y03vmF/Lcl4o+e+HSGjHa3r?=
 =?us-ascii?Q?Y2JAUokLmwsaye5zThLnZLOI2g2nXuOmEEIYjLn51BqrZHISNatVrkkd6KzR?=
 =?us-ascii?Q?hgTrQlp+adf/jQNjQsVJruka8coTIAbSEhbOsp53nglSx3T7QSpOrIbJjqs8?=
 =?us-ascii?Q?HXXpbD/KRO9SEHjgjJrYUM81Zrbe4k7wVKW/rmWVDnWEOOcU+GcYij56a9Al?=
 =?us-ascii?Q?XZMNSiSDKAS35iEZRHzjjOeSuA6BYUVPMRgYLvdxdu/h8lzfSZaN/Trz59UR?=
 =?us-ascii?Q?Mc8/rEwpMQ/PdsSJfK/eI7rKU5zgk/Mg5HL4xhxbvigmXu1YnGeMCyUVT3HN?=
 =?us-ascii?Q?rnp+Zffxry5ELIoWBXupZ0fZSE7hHt92f6EPmSD166oPD+OMVLwVPN1o13yd?=
 =?us-ascii?Q?y26dSk7h6GOGcIhJf95ZGPo1tADLjb5mTHeXPsA79ruUVqZOSsMGM+lnv/1p?=
 =?us-ascii?Q?YOOu4eYforEH9LvO9Voqve5OuzAlcqVq0rGsXQL0sesssteJWeyYKlm5zwmn?=
 =?us-ascii?Q?CXouSm6pmN/PgRVwgrCDzoYtPsapGHsu2iSFxgA24L2fFz6PSc2TPJYhUngj?=
 =?us-ascii?Q?iRk6lKnWCSbAKpycgbUgPsnWDFf4vFkTwgW58gYAaPhSkgSmapt0JCx/88u9?=
 =?us-ascii?Q?Z3zxPN8+HKGTYUax1NehtNJ3ufc4rgf5O/KqQ5GMuLOk1ykQLbdW+bSRnE2s?=
 =?us-ascii?Q?xiFCHS/2qe81ZepDtPJC/pDNVQOHRWMmCkdiGftlKou0StqsSkmZdTHCbSgE?=
 =?us-ascii?Q?7APDMe9u4w0XrzB+rd9J37jDrsItfoLCvWrRDmpJXij1JM8vJFKwl+/Vj3UP?=
 =?us-ascii?Q?sM6xLyakHCOpDW+AWpCRvTBzc0Ie84a+izd83DkHZxraCCk61JHyAIGxRY9i?=
 =?us-ascii?Q?ZOjyeYOU3iS3w47XZF9nMIMCyb7FozMHcJ3ZSfRsW3ZpcE46JRdGdlSJ+KE+?=
 =?us-ascii?Q?uD64wMSxoLtuY71aADBlqvzeyt5KaiKMyjPiPq4DWw1reUwUOqOG//FlwbsS?=
 =?us-ascii?Q?eFtJr1fEM6k9kVp4HJEBnh7zZWv3oUykW+A7Sd282AHtwfyGPg+nZdgKrWh+?=
 =?us-ascii?Q?5wRxxEI3HWH7y3LQxFBcSX4cqEC/tB97aX7oH9kiylKENF88tU9cy9KC5YaN?=
 =?us-ascii?Q?D4lQ5L5oaW095N25WNIG/KEc1GiAshLWuGnwFOP4g9CwFEk+QHgpLVF6eefX?=
 =?us-ascii?Q?nXkABBSP21T/0rqcxyp1Fye1fOW+5EKpXWT4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q71MS/sj3ksKspHTbBnsw5cdeT+rlez0QCbJRvDwVzkz8R9VrkhfYL+bPBuK?=
 =?us-ascii?Q?nRfrRez/ToBu6qolnWmJSWvFO2/CagRDEGkOCzK3D/PbFAd2FmNYNPRu+Vs8?=
 =?us-ascii?Q?3aVqOvkK0NSATKgQF6InpKwKdkOmwP/rIfttbQAZKDcjrEzKwJYb11FqmUGl?=
 =?us-ascii?Q?LRJPX4+XbTJLzBrOeDFJJ3IXeM8ldyapfVWn82JxKbUtDMUfZcHcViYql5sX?=
 =?us-ascii?Q?wDdhPipNfAmTkk00e+kjAVn7pEkv1NkKoGFgLSlN60QQ/a3S8tynPU5Nw1XD?=
 =?us-ascii?Q?OnjICMDPTQqcKbIg9E5alXNjqoCqjId7R4Byyp0hlmmIF0ropPGaX+m0wh4K?=
 =?us-ascii?Q?bSEc22nsDUqOBtWOj3QFbbR1zdOgh0knIwR4CQB5t1Yk/OMQYhK+o+eumQCM?=
 =?us-ascii?Q?FXmYFeBBxLi1eOdPLUHy91mgckrl8W2ydB/OeLNrtA77rjNnUM4Jv7518b8u?=
 =?us-ascii?Q?oivD7UBSQtLPDPiH7PySSaM1gb3K9R1hnNGyNWTtWv7F9mVh/hCbsM8mstgW?=
 =?us-ascii?Q?VohjgNrMGmEDZXph0VPNKd6pqpHxMjJLGmKI6x6pPCr23HU5Q8c5rrx7aD0Q?=
 =?us-ascii?Q?vl/iYxGJKuOd56BSBC7Qqo8jXW7K+Y/DUP5V5RdgVbzbZQJsst7qbigeEHHX?=
 =?us-ascii?Q?Nas46uxIN2rXCIZXWRaytBr84s9755/CcwG/XfS0X+7VUHj69URH+DT3p+C5?=
 =?us-ascii?Q?fRcywM8veMAqu3bEyFG8g1PGf/4H6l516LyykWZcTAyoM6jyxjCPFYLJsfkg?=
 =?us-ascii?Q?gvLCd3IISJzuH6qA14odWHVOLKNV2h5P8G6Tw7J0X5RYegyXtRBA5jQjNhXT?=
 =?us-ascii?Q?cOiXR9+o39o388XWfSyN3nau8mWAGKRp9FJhBhaLrDOHy3/v/Nq97dnPscKp?=
 =?us-ascii?Q?Pt0mK+jKWZgALO8YNtX5H2KehoDZ4Qi5Pf1GjnHfRG392lBXG/D5fCnjvZ5J?=
 =?us-ascii?Q?PFMBwnb9jC7m4gijavWH09+r3GA1uLeR+GEpL77Yqllj+RO5lZrjxWMZ/ZYa?=
 =?us-ascii?Q?nCkXW2C14Sq/k/Iwgb9fWzBMvP6YeqprHJ2jT4Ds+Q8mSEPdppe3wfGlnfeR?=
 =?us-ascii?Q?IGLo8siWe9z/sd0ey7rjHEhiKCYqKq28Cq7LcSHfthGeFl0scqQghj+Xr3rs?=
 =?us-ascii?Q?TFgQLlbOOUzLdtXUi7KsIsXw1XVAxgSq7Xi/Ohfl5stU6C6uQ3XvY4Co5MEf?=
 =?us-ascii?Q?FS1pB5+mxzD9zFnjyiNYNXmKwNzlxY5t5lVaKcqnujudY43tSxiK6GIacdGq?=
 =?us-ascii?Q?RYhb7tdXoGHKL5zBNFMnwmP9wgiSh+9kTrM0PtwZNAqNIaY1XU0T3d392kch?=
 =?us-ascii?Q?5Rg0zJNaHF3aQvkYmZaYg6jCPCxSCP/jII2pvAJ2pDZB5qj7UkCXaOFIYJXZ?=
 =?us-ascii?Q?/3hsVIOwE8AOrqwxAcekImuGhtBn495jk9AoLXNVfiRC7qkgEACF/4SVq0Ei?=
 =?us-ascii?Q?fQiRKhgmu+WDSkCRxOPoYuSfa8TQkqlm/uzaC2SbMnrKuZmCRSMIAGHV8k86?=
 =?us-ascii?Q?HOfbFm58E0ax7ndF2n6pFzmyM4iK81QHfckgDk3Swe/tZ9KYBUiE9l5j/x24?=
 =?us-ascii?Q?IeSwKQ3Fp1zc/DjNk/7XwKixNDHzY1GP5pSxOYO97HtwJm1jr6EdUGFjpnLc?=
 =?us-ascii?Q?0w6RSrLu6+hIzt8cPo98RNY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58af66c-ee6d-4d9b-a6f2-08de20ba6613
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:48.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak2xLax1lu9DlTmCdyuuHmjK58huADiEuSrumYQcrP3vOvUznE9dtXfj/SJ3/J9fnx+0WK+7nf/w9rZGKUkqpo3XyGQ9sFfjBKjZCOLiPAAF9E1Xk56hsczRgL9GIpXR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/tegra/tegra210_ahub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 21aeaeba0b107..e795907a3963a 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -17,7 +17,7 @@
 static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
 				     struct snd_ctl_elem_value *uctl)
 {
-	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_component(kctl);
+	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_to_component(kctl);
 	struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
 	unsigned int reg, i, bit_pos = 0;
@@ -54,9 +54,9 @@ static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
 static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 				     struct snd_ctl_elem_value *uctl)
 {
-	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_component(kctl);
+	struct snd_soc_component *cmpnt = snd_soc_dapm_kcontrol_to_component(kctl);
 	struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctl);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctl);
 	struct soc_enum *e = (struct soc_enum *)kctl->private_value;
 	struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] = { };
 	unsigned int *item = uctl->value.enumerated.item;
-- 
2.43.0

