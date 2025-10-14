Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA1309DC1
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415786; cv=fail; b=ZHUw6KsIAcNw6JVfmkAqm8DhXHhVp76dLPMihZrEby0sEKiZvpa0wRHFA8vO9oLCbScT3MNM2dQlTnBqIwJsYEADZjjyLml0E9OqEUT54YmkXBeDidzATOOcTYLI4i8mT6hB+ikaSKnaA0kHSponYncMcUI32fnRilc5SvM94TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415786; c=relaxed/simple;
	bh=YDX3cPOW1p9Z4nsy47FYH09Sr3p5d1jyNpxalCZpKSs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t+65sVZVmhDhZGX8QAM/Kn22ovsCiq1zuOKUwQz5iIt3QQR4yZVhKglY99mUl0QYFmJE011Uas5U3CqTx91MpC/6Zxzge3kronbwWxcVscMJyTNKxIL1i3VK3ADS6mWMC2mVkFcwCyDpeHWITWhMWdH2DjJ0f+cStvBFW6yAzxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZzlNEUTD; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZzlNEUTD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zolqm08cwRZAxr3vD1TxnDXZ2/TwilCM5Q82p4udpmjYzKo2c26snFnpUGgW87RVidz0tQJNy7/UoCekmvkCil7UINGabqpIRkJxPyM/dnnh38yIoyt86D3tsK5ou3TDuzRtS+9xV8Zqn0jUG7BNyNWzf3PkSOGWoQdSEdxhorwlspF9jmalE1C5vJTLiOQzaBLqFFgrfKxoM6qObBl5IXDBlk9q4ePJfZzrJggyOfmptcFfFWOSd/OhXaFCe12NqQPYmlK3Uaj/dZ8COoVYRj0vQWvZxjm/wM/UBULOuPCLZzZ3FwdaWhSiS/BArUcNuBTk6ubAWTckV8bclNDzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaiBLouqPQ5oagRFExutx9TOkE1bO9k+GXFvJNBpIyM=;
 b=bFsccAaK1f04M+f5sBg2zh2UNVYPBAZPdsY6hb6viKQhSt8fTSk7wl9Tr3x0LNEQB3qlIFieRnPBJ/BIbuM4DL6CkwpnZqvKluZLajkRo8Lm/l1Z3cboWwlSDNnK2QYFP7Ez70FCRE33OBFa2Vgrt6Pj8DSf/ioL4ov2iliRPRtv3CimSEStBXHMmx8aHG6jD5mNEK5B8fMsQXXp1TeFcNOX2GJg1zBgAhrnuLOtIGZofYRBvp0yZgJsYHmS3usAEm/IaM10do0nZhk7jIN0pyoJhlJuitlyWkgifsHJl8H4WLc5ZvLK977DT6J2z/I+ge5k4uEW0SoOykHAZT1s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaiBLouqPQ5oagRFExutx9TOkE1bO9k+GXFvJNBpIyM=;
 b=ZzlNEUTDrod3usoUy7DW5uNxREqxeN49GysjJqfEENLeq4Sjt6klyd+yvweR9ydplpc9oB+loVaorwIzzVHghN4ypFY7xF2icjiN+NM2lkNLvL9SnSI64OhCvSwuhNaqLrwHw38a/+mAbL4zY906Wi5oWxlqh5gpwayUryBevmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:02 +0000
Message-ID: <87ms5uqfh6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 056/139] ASoC: codecs: mt6660: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:02 +0000
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e0781bf3-d14a-44e6-e12e-08de0ad95d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KoLWeraCFdgQxZdl2ya2UtGTS3gU923EqOFQPbFIqLKtRcx4QfAb7gPNjNur?=
 =?us-ascii?Q?3vGIzMhoG+lkGrvgVqjTVOOebjy/TlTF6FHJvZihUGcBT/7g5FATmQE/4gMK?=
 =?us-ascii?Q?ZtMapFIPuBDd1tt4/J87J0eN5ofFbzI6nX98rWeG87in4Kfp/IoGBIgDUAMj?=
 =?us-ascii?Q?zjsMiVt+iBhladKuUXXXCLvCqkM9vY+oZsvzuT7XtpC+iK7Z/JzFNSSMRRin?=
 =?us-ascii?Q?cwHl+6g/d0MMVs+2+rMTLSwpFsgaPw8zKRrXBMgf0jz4v+Dhp6kUc9gOG75y?=
 =?us-ascii?Q?BtmM1IghdHrIF1fFLvfvIf9PQbBw+wxHdi0kIv1qhwrNs6bvC7gLe/GqaHVu?=
 =?us-ascii?Q?BbNrcwDFgKoCMKf+4/PkFjnm+Mnolbmg39OnvbppECjG7Ofp9CopwLaAuc/4?=
 =?us-ascii?Q?L4RxAsGfRMIpEkyPf68LLyPNBrBMYnhlgFOFrA1gz03XfHxXxk2/8lmFkIny?=
 =?us-ascii?Q?I02RKZ+o1sOMovGv7sTMxsN6fcobJ7IzE1r3V3Oaxmu3p/u221KD5mHUeuXP?=
 =?us-ascii?Q?VUVHS8ETaDbgZAsBU2r+Ck5wb3ccmyoZhOwbU8q1ydHtiW6k4jY4v1eU6p/n?=
 =?us-ascii?Q?/HPymRIw3s1Oxpdp39pC01uLU/61wYAQnjYa9fyAuV3PYLrm0rvuxCYdnJMT?=
 =?us-ascii?Q?CQmKRadnnMABZK5bYVzcGeYY3W1qkmSkBYwgugMvxof4aTocdkkwhBWBtnBx?=
 =?us-ascii?Q?55wsbrLFqUkYjoOUcb2p03otbBSmj3ALgSuTla3+FdG/UiRNWs4f5OW9cRZ6?=
 =?us-ascii?Q?dMgRcCeAyZBebx7WqIIdKakQXhbTsikBkMAIeRoVDUJ2nAhXtVC0DvwK0OKZ?=
 =?us-ascii?Q?AgG06rSW0YcJwGiBQ9gt7PtfmEtcyxLNkxfG1EDRgmVZNzoWCYrCS1ATFjuN?=
 =?us-ascii?Q?7oMXWvr+pAvd+J7XPNQgJbLld/iTxhqq6L+3S7UByAQFMowBqXvvK1oPJAew?=
 =?us-ascii?Q?hoUmo7WHVfyN491AFCa4J1W/VqOSgHmQV8hQAE9EbwsLLzRuPfkPr8HF06of?=
 =?us-ascii?Q?WPY43PWnMo32prwUR3kfLSa/xq3IHd0nNoRS9+WhgdcmowZKp88zdlK3NLiI?=
 =?us-ascii?Q?o1aPlEbIf/i7AHMLW8S0NQCVgROfamjZfzXRa1QLTKwtMp8Ntkbvn5rdLEce?=
 =?us-ascii?Q?JbN3JLf8nn4NYuCxSJAdfLms70vonSc3FwvNAtGFnnqWo3iiLaHeD2ssFQ2u?=
 =?us-ascii?Q?7EtlGi/js7Qnc1ShOYmajnLh2jfZAIdN/VNyCnJOyXj9hYONCKDVyxH0AOuU?=
 =?us-ascii?Q?d24ER9rFYxjwPmU/U2Kvwo88isJuuDBiqxmad/igVb0PrNbDIkUrJFxNlz+T?=
 =?us-ascii?Q?q1IDqKpsiHEFYrfOgphTiVHD5HQJB5i9dm1q5BQm5rtWe3Q6uFxQcyC1+0qV?=
 =?us-ascii?Q?iMR/u9aIB2SKBrOv86gYrxGJJQ+I7neSeJeDI9ZOeoPii49YCuOnjbXz3zhF?=
 =?us-ascii?Q?3aIOhupx/FA+pR8wJraFIHQLL9xSa9XWFji9fqcu+9hMU81FSUZ8Bng++tWc?=
 =?us-ascii?Q?BmRx1UN6DDXIa8moA6BmlxKuDEnUEYJLzHBW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uy27aBtp1fP0JWla1qot0Hbm/ez9EA72ytSE50on701gO9xOYFLlktWLzsBU?=
 =?us-ascii?Q?Wzni5FJJCUEKpTI0w4zuxwFePLNdicDy3fib0Mq6N7ZKbyofICvUs7clXTPk?=
 =?us-ascii?Q?bcJgm2FMDEt5udWluri0CFsXIt1nErxxr77q+SYkwqR5fHQUDVzRSnZ6xIPB?=
 =?us-ascii?Q?0ZQkjcgMYVVrNh/q1dGRhdG8/h4eO1OpdsIaQQFvDJFsgWOSIkgpnBwkZCRZ?=
 =?us-ascii?Q?efsmpd4Fki7muC1MaUb9kiVvIItuElzu8zMNvyBg2XKPfwiuOQLkMnxpQ99L?=
 =?us-ascii?Q?DdJk3iztHvLN+EP1n6JsReC87Oi6OkXBSbLUkxoCohiLUng9JCqVagKjSmMy?=
 =?us-ascii?Q?CczDRKApOlXnde8OEoMzf0FH8a8Pspr++8lpapZnuydXuNb8230CwGHFWurP?=
 =?us-ascii?Q?KMksHwpfji4hZdwuP+oXoxoBZpx6XYt7RBGVZgTkvo4m/e9pPoNbE1OQn+pE?=
 =?us-ascii?Q?22IbuJOVyozpBENM+qeANF8GTfHohLCKwu/cTBB/uEq7dH9NrPyM0U+V2qS0?=
 =?us-ascii?Q?F0Jo2Fa65+qCmSPL2YjNPSCWzN+2PSx3NjHXQ03zl/BbYoasKkECx+WhHOXl?=
 =?us-ascii?Q?0VamTuuf1/iZUa6jzPCtEfa87Z88SEgK4ZzHdM9C8K3ojjAq9jmS6bvkxHaj?=
 =?us-ascii?Q?azWEDFzorhSlQOiJWHX109wF8fcfSehVFAXVgYvHgaBD1vpTC2w8rCQZAufs?=
 =?us-ascii?Q?vaP+xMbA7WGrJ7YIopFO3mtL7VDpjwDNQtev+YOqw5VbcxzXKcfBcJO+AeO2?=
 =?us-ascii?Q?wHfIrd+Mh7ujjVKaqHmEaDXwi/ot79zYKRZMpoWtFB4y6KTI3KrwkIYC66vW?=
 =?us-ascii?Q?JSR/b68I6Z2NF4TWUY2YzMkQSkG5hJlGHelYrbdMlPpmlIlId6G0YuXfJoBr?=
 =?us-ascii?Q?pZMVhLEBPkCRu8vzWCG9DLP2w1Ip6n4ZGcLP3EHmNC5NYChlTcBFF4Nveed2?=
 =?us-ascii?Q?1H3NA6cr0JA1/VGNAFy5ChuIlParvBis1WzRLmQcR89vDhvznsEeFmLXJKX/?=
 =?us-ascii?Q?Fdt4M4FTjOM7n/icPqjqo+6dVNkMij8jXHuAUCFm3Mk00NcQC1pO/dG75jXM?=
 =?us-ascii?Q?VN1JOv7oxloOWJ/VNJxbMMNXSVKu7oBT4M2ZU4NACFn6BEYLpFufrgoJCLnb?=
 =?us-ascii?Q?AAB9d8WcGltqNVnmG6SGfvDs33YXcgo87Jr0Y5vQMKgtpvjU+ObRyj9VQqex?=
 =?us-ascii?Q?gs2bFRJxWevtinFRjKelik0R6XWpZru2dEinFySGmvkOpCguqGyyCEzzDa7e?=
 =?us-ascii?Q?b1NDBCyOFCnmS/WZMLtduGsM04xPKYInD6A8803nNekvaZ4jRURVYdBlpKDa?=
 =?us-ascii?Q?eQ+UoNz3CGKiYI8Ricpn6JRcdt1A/F/4MUvlXVlX5A8JX2x6feAiiMwY4RGT?=
 =?us-ascii?Q?epHMBuXuD86sci54gbUhxyCut0oB1tsLvuo1gfAN7tf1EU5Pag3WNI43sIz2?=
 =?us-ascii?Q?h18brLHExX0vzLaErLBmOcWZb1x4jRh6U3c1au5u8j5cfoO8uV5WHPQEUazu?=
 =?us-ascii?Q?wApV7w/feLNMLYUVprd2lAHd6KSL1eQBwePHiXaj9Uy2yTZIN2clEMsONlaG?=
 =?us-ascii?Q?eP0dEAgVsh3mHNSNNi/GJhW1qilCBVUwSE7KK6lG6iGJHO0GIkJ+oLA43HAt?=
 =?us-ascii?Q?nG3dvCMSsl9290ElWvSAdHo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0781bf3-d14a-44e6-e12e-08de0ad95d49
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:02.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTEGqZV4t9p5WRLua+U58cII7HkxkBXJ7FxPE3SKHpfuqj3iOM05Oct+Ko67hc7ceWQJl+TiinALqPrqMm7NMKlD4HbhfqbpzXKVGe3fXh8dV2fJmfCLkMKa8eN//BcF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mt6660.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index d16bccebae52a..ef63fd113cb73 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -187,8 +187,7 @@ static const struct snd_soc_dapm_route mt6660_component_dapm_routes[] = {
 static int mt6660_component_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mt6660_chip *chip = (struct mt6660_chip *)
 		snd_soc_component_get_drvdata(component);
 
-- 
2.43.0

