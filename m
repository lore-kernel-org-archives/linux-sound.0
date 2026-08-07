Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947924BBEE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064114; cv=fail; b=DRcKBAMlWTesNccT0NL8ZJ95hRSlFcDREzkoBj9BWcBt4ZwYLlDlI3+wLElywUu7IPOhbeFSkuYAkM46ozAAt1aCt2RyPUfNjh4aSNZoajz+BA6TYg8UcxfiBORPr58yLIRFM6PCAg6qVNZ7GNlOLOQrhcUpbHFu7NnP6Uc4I3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064114; c=relaxed/simple;
	bh=IUhitNq3abs4DqaxkzWcTKQsofm5uKbNPacugFHIY1o=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gQU1S2JWcQ1S+JLYX7CIoWQzy3M6/6gA3TcOe505+YVmuvfztEw5ZXEqRO88GcoKMSB/LUYIdb6ISM0b6Fjz2CrNJb9qzUOj1+A1RtzqyDhO+6rC7BfnlplYYBiQP3uLtbdz4OPLNjCryktj6+qC12x3ln6OynwAKd/82DRZEIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DDac5d52; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DDac5d52"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoWCe71MkUDJRfKLmIUoGdpdWxmuXtCxthiConZKaeHC//kYrqhpdNiHhuKfeZJPV+vZIf6hOWmj9tJtMeoJaGQ50u1TsmLnvksjOvEDETyEga1TwWA2ZsUqkT1azSbyT2TB5SwilPjon1Zj3dCH0ou0GCiYwUVrUYSjQNa6zCYp0e3bURzrKl3kd5FoeEBbhqrHkP5gWYk0WNORvGA6BmpbPEnq9DZnIU1ciyW4CM/5BS9iItEPYqFiWZHKwoWuHCUftJJ4XEnST+gQlyn5PIicmBQpdXX8+RDi4U16IUv5YMrkN093ysq5YcPzcg7Ja2/cnZp481zjP2ubbHjiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnqfxIz+foBlH649AApyLa0odrnRbeo2BkM9EgMMUeY=;
 b=hU611Ft/2YW6lBTiXCqK9yiE4LCcDsLB2uzdSFjXpK+zyT35ddR69ttmH5I7BGSGC0yVhs79nM8sVL3GFLDl1dnYrKqP9Dvj9EkdYClhOkdCPjWbjQsm3h1FxfKg2ON6QDVQ5CY0AU6dI0UupLFTdwhMcBgme3R9dv6rWczUU0va40jdp5PSZSXj55Ej4B0eU5AQt3z6Lgjl5CZpg2CTnLNxLFWrrU2NKxR/WCZtJ27PM+EEEFCTNceAt3hsF0QB+blu6cDcQtJXIv3TyMzWtPBCW8xLdIv+HQl0pvJGbRf3R95gQVfqMAsObfIcokdWDq8GIL9QqN+zW7+CdS8/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnqfxIz+foBlH649AApyLa0odrnRbeo2BkM9EgMMUeY=;
 b=DDac5d52HV75ExFJuDBtamudRd/k5BoUp7arhvaUo6XOA4QfSGjlaoTv4yFghm6r1bJD+Mxfu5tKtb0sSa5rWt+BZzCfR6UyA0R+ljgdq7yBKQusyLax0CiX31KRhOU1zIVolauf1mnTkETsLSRh4x6SmV0U3xgAW7MFhjzZaFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:04 +0000
Message-ID: <87cxvuu4uv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 21/44] ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:04 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dff6f3d-263b-4e31-0a51-08def41e84a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	gO/bXf6QaFscHmGHXVie+qHg28NjSJhfEZp5xjliChl2aRUVAailq3XkzSX78u0Je5TTjcWgcNIEWMc1vBU9tvoVJV9AMGMsetVTNBdQv8fEJDgjjKnV6+X0GEg4JVYbBrLrMqqjCoLQOEs44WD/GhAyXL1A7UPk59UQu46lsIO39VTn/SNnUs7FUVxSwGzccH9zeAjxyVPZIBRTh7M49FSiOfT3f7WVbkQNQtOUc5P0m6pr1AO5lyICDbLo8tgejPMp1xEOsIAuYg8HilF82BsmV5rlS9LTKJLFAYJw2q3xyNRy8rkfsFxVXv1rJiDfUvTTpOU9xFsdfd6xdmwrQUIqEXweO0aLmT+VgSOISb4MgZ4f6OKheHw6UObCmKndGkm02b0g2MWkDuW7jktqxOx36/RF+fgYbfyM1QGzzHqGgX2jSebRR4dMz56TQ2qeT+mWOMIanq44fOhWCC7q8Eq6Xtp+euGUuAK0u4W01LsVqpvmPcHCgcsUAMvuIDvotjqzF6hiE9PLLPd76zsWp0P9dJmVU/BwREts6TfuBCkySi45cNpgByDyF3oKKZbKq+YnGomNuRwTSU3Zek9CXYFAg1iea2OStZPfod4+x2eTETRV+rhAaRIhh1k6bTkDK79Qd9dIc9DDlVwrSEN5IQ9BsaFdwECwDjHBFb2CDsRvNLY960Mtir/KDVcxR5TB9c0EDvB071zvdd1BAtB6G+93G7McWYHZdvUU7Ah87iA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7O05edOXnNrZdoJMmruVcy1h+3OqaW1OEw59Pth84TEiVayuo558juQ6SQE/?=
 =?us-ascii?Q?HiPivD+4pBrCNj+nlIc6oFu4FRU3qe2YRWMnzdcDymXLZZhukV5L+jCrmfJK?=
 =?us-ascii?Q?9ZEhYuME0TmaKnkpyz/mwskFcVL68TP/Bd/WI7A2wQw7ol4sVCdd0c/8AORk?=
 =?us-ascii?Q?+e/4yA1Uq/llk3AzdWW9/eyYJuY8Di273NeQK12PfUOL2GxBAeiJUoDArqDm?=
 =?us-ascii?Q?EIyVDgjWd28aXvHu7HGbXh/nSxAw7VSH9qbCESVJyjsU/388J7G3UfpDnudq?=
 =?us-ascii?Q?7sOY351FA6zldcqn9ejNzOc38qodK2HQzQOiT3C0+h1BjdlDAcDY3Yg9OkWN?=
 =?us-ascii?Q?quLlaC+TsZZTPP4lvea1xkxRiy2yYfyNnnVufirLG/4Qu8IJHQaQEiVTzZJR?=
 =?us-ascii?Q?NGKUxRfnp+9I9UU/0DsoSdDRa1bRVwJgFMAOBr2Jc7CD7m9zH3tD6pKZysuc?=
 =?us-ascii?Q?LS/b2KPfcrbGWMIgxu+vyUn8zgppC77q7WZzQeyMXcTgAqsZyYtO9KKcJr+4?=
 =?us-ascii?Q?RYM9q3GW5/ugwiNvH9mGWlZRszk7eQNTROPTtzShgNGUqrNjExo/VQpdVGUZ?=
 =?us-ascii?Q?aZJF32QcdkPA5pnb0G19H7Y+M/9Iq96XQx1qzSXBImEYX9n9Euce4Hylv5TL?=
 =?us-ascii?Q?i8HJAZsWFgn4S9bIGli6hKtY/4NlOIkfnVFolNMym3a62WHKFFMfdl3fcEkQ?=
 =?us-ascii?Q?OoAvl178U5jtMOkh81aiblncM9d2ixLF3iGFKE+Qa0eQ2cpUnKEGOHP2qDPE?=
 =?us-ascii?Q?7Xk2DxoX9c8dYNtkNWmOxVuCfF2oRSTZQcTN2t9rV9Rv8rv6kyzz6Yaj+fxi?=
 =?us-ascii?Q?5kS9JX0KZks64qrEEpeg6N+MfA4peqBPYgevxqDVsjn5xRPZ9tCsqolGMXfe?=
 =?us-ascii?Q?/kzqYM05E1qDr7ZraLRO6E5cIjLXhIjfAAERGnLKqpW+0BOjZo/DdjooUXg8?=
 =?us-ascii?Q?ynSYrQ6w2feNiomsnG8d5XbGSMDP52zE5bzrH0v8jdQzrScCYL6Men2VepAx?=
 =?us-ascii?Q?bsPlAKBDd0THxJ/APgNAXN/C+RMzIm8wolYnINlHb1mqGANToZBagkUZBdWE?=
 =?us-ascii?Q?suKs4mBWVM7R84hGO/J0Drpqla9r2E8MKSR20lwkw3gDiPA1G9eExKVwUFjF?=
 =?us-ascii?Q?C/SgHa97JMD5UYa2n2ppeyORAG4cs+pdqVfkkr63Fj9yTgNqRgDEzpkwaK7X?=
 =?us-ascii?Q?ktW2HiIW3b5Na9LH7o3hP0zcEUO78/4KOY82tdaqd4Ubq+fAKOaLC2CwOstb?=
 =?us-ascii?Q?mov0QZ8W6CPEo+YsLVoxUILYr00d/f3LwFa1WbSiU1cNQktjD8oyIRlVOTXE?=
 =?us-ascii?Q?km+AjhyGvFlNlxrxQC6NGZFwSI0iYwE3wF3qfxREuo+MoVMnXEUh9XiQZB6D?=
 =?us-ascii?Q?SigVba4S+R8423I2d2yijbfEG1a61+AD0pDhiRV/4rfikk4I8cu56mxwBTSf?=
 =?us-ascii?Q?eigndkE9ehLp9dS1NeXR2wGeXlVuPzb7/B7HugmodSLgvq7yPrLK1vGR8Xfa?=
 =?us-ascii?Q?sQ75LMQv/6eP2JKQrkvEwFu+5T5gcDvQPT7h8c4//Waz8ezXIe8k2DRpTiaP?=
 =?us-ascii?Q?08yU3PPqYdMPKC34og3Ter/6yiHfsd0qzOC8maQSMFwAQpA825qolQ7JhLMs?=
 =?us-ascii?Q?uy/JFKNuEwzTLwe/b2DhnebUc2P2797Lylw6XILX0fYF8G+UY4ZfdVJwO7pG?=
 =?us-ascii?Q?NbyX1Zz1ad7ogRTJ9IeBRktXXR6GPVhghTwoBU+c/59UqTm5CxCFWxNdPiZ1?=
 =?us-ascii?Q?R/OjoUL+IjTUYC/h7mpTlLWhWec3/MVn/S0v5tNvlcjgTjx/URv6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dff6f3d-263b-4e31-0a51-08def41e84a4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:04.5935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRHa6l8Rqe6RKoZIe4+p7PHbO0v/zZCQXFmiJ2HoS6EUJCMvuOWjFxVdFL8NnPqEDiI4/xe4diMKnjmIPmGyvag38Y9RVrRoygfhnUkT1grIHIMqu0IfcZhGX4B4izJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lochnagar-sc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index a3d6318c90500..dadb4a6c287fb 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -137,15 +137,23 @@ static int lochnagar_sc_set_usb_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBP_CFP);
 }
 
+static const u64 lochnagar_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops lochnagar_sc_line_ops = {
 	.startup = lochnagar_sc_line_startup,
 	.shutdown = lochnagar_sc_line_shutdown,
 	.set_fmt = lochnagar_sc_set_line_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops lochnagar_sc_usb_ops = {
 	.startup = lochnagar_sc_startup,
 	.set_fmt = lochnagar_sc_set_usb_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver lochnagar_sc_dai[] = {
-- 
2.53.0

