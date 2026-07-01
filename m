Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BD93563FA
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873387; cv=fail; b=hDCEnT+XSokfCqsbtyy+m7vjfbU597AjyIOGcUPKF1fae3nXFXQReDu92MvDwK6vaopK0pd+YrVUdsGcxwFGoi/cmWO6uOAGVPvft7yeiB//zMMa8xw5xAJV3qFC4BDgZZHcOEvqgKxg35HmE1Ezy81QOGDVshEm+SWKR4m9bU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873387; c=relaxed/simple;
	bh=om6R3WaFbhgv1uh398OBdz0whdHhSeSMiC4K51u9xt8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Usal2DFyeth+GLvPHO2EMtj4CZL4oTFUfZbP9ZGwYsvaEVSa0rgO4zJoPUgpuGnhNF2Y8Vi9HEE+ZvxEgDJUSf29s21Fr5xE/v0dTAjFed6dqI9BgMREiCmNI9ywQrfrbs7QOcidd0KA5nsahh4xvzgQCGC0sgrbPWZLXiqbLDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k+QvFfnM; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k+QvFfnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTRMJKCEnIZb1Gqk8pvZbA3//G8dpLr1fXhlpijp57rWaev1VnyVD2UV67TxilqSZIgClLQfAAnU/WX68OSF0MRpIIMeof5BohEbqVBrJ3BLSQlMSB+nhL2nIbgnKwb+57WORb3Lb7yJLhno90t72ZTly0TN/FLV0xjO5qu/egBiy9cWPHm/jAcMQwJcpzxjMFcA4gaPUf547SMpYJAQS98aORk8XK1qT+VmG7XJo48dpyZnN21wImIyaAB//Ldu5hGnz5bE6gLFdgZZ5fdb0OW1D1ZC2WuwamvD8UaB1UzWSc3y13mqCqW7NGCu/m2LfQPFfxbVS+n3TU64WC5QJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24F8lcuwm6XM6uQCthe0sSKZjj8Swvvf3m7M4Go/KoQ=;
 b=RfqdR4qr4+gYLtKRJfJCadqHoA+aBUZdcF1jwigXMmr/DERJto/01WT8S5wosmqu8txfx6jrWNYwrFOqxX5Zhhgt0o1viUn9w2n/LEBGQHnnWmFnHNEAjqPSMrCLMJFrxxS10yc6qYyDLftnxdCmyrGQiVKMW+9WbST1HTHlU+yqd9H1x2zo92gWRoqsIgVq2KEqyLe5riSikbCLJFzC3Os/DaBTaPzGmAWZzJ+FjdVGaj+4tHyphZPZAFAttaNU9S763FYT9Lxscmd91nivhvsYl7+MxJ5bjQXKc/JsZbYWiBVlNVFS5a/XHCIi8hONavsx7UEx/CXWtkMx/7jfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24F8lcuwm6XM6uQCthe0sSKZjj8Swvvf3m7M4Go/KoQ=;
 b=k+QvFfnMk/uNBvYU9iqwUgtybYL1ROiId2u4U/46+qthX/h4AI8PnkYQ3vKjxmAv/DGmf6PlDzTCfeaaJ+QHO/qFzg0JvodCNN8XkxX9VFv154rRfdiDi+VGLseD70LZx6oBjGNh82HzDIG3KrGsVsk61STtOIDmmXaNVsxwhMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14320.jpnprd01.prod.outlook.com (2603:1096:405:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:36:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 02:36:23 +0000
Message-ID: <87fr23cu6w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/2] ASoC: sof: nocodec: tidyup sof_nocodec_setup()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 02:36:23 +0000
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14320:EE_
X-MS-Office365-Filtering-Correlation-Id: b152ffe3-33f1-481b-68fd-08ded7198ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|52116014|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5xcm6xvUIxT8JR5aBBpU4rkSSRm3H4qHKr6Kh1DwifJbzT51ifXV/nFfcJAXZ2D5qDvN1Qu1GDkL7BiATUOyMrDYEsd0me9XXG5W7n2+9foiLPPO6jZi1m6IsHIY04BHb6PsYm+OB65GF3zf6HDKezg5cT+3Yy1eE7k6GJOF8SBvTSLdwSg9PgcAkH+zb7XH3z8y+/7bnlW8aXvcMeM+YA2vo6SCJcRDgvPlNCsGzhtSYn965MG0snFQoCfUskE2FVfC3ZRN5/ZsL7MdrAHpgGbUM+G/I0pE7+1mdeCNYu6h7v07nPdJFdnqzJy62DztJMRJXy98OXDLTL3P5iiHqSi3rzuaLanzMGlZLb8wQ1kVqD5XL8ATjlYLY2R1jnUJLkJXmH2mjRjFL//kejN/6ojpCbddmsxRiHBt6UyARGdyWEcSXw/xytSK/g0lWRfijSj3zlkcTkIPNV6sOnTOaeY/c1MznbF1bKa7DJ1TPQdYC/6eH7Rv1cW5iL85LjmcFTdIApgibmfQMpNNKKo8stFG9sBGtKHEnNAbFwGHaXvV4/hjSFcmDBqvBg/OJ6I+SetSmDUp82KeS1BNmo+uJBdR2vjwDxc8Qg0C2sudeI9muV+opQNpNOuou2AYxe/28QPbcCz+8G16DoQYHiMtsylTfym0LEPCBRipYJRTKTzrGrjNYqkwStNQd4TlGBn2ni98TP7F90ilHvk6QCvTyc8tUMbmVxwZGBDBOgsy+6kuAYOMx0ct4LQrHtfryApj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SLEo4yNdty5E584iBpu1d7c3zeP9bn04/yVyS1ReUE281xbeWcAc07bHxuF8?=
 =?us-ascii?Q?Dd9GI0CfbMKQs1yrx6iMlbRedEwiYEn7vcTt6DLV14tYM4N3bwM9pHjq4b0S?=
 =?us-ascii?Q?XI9yPoUphGgduoD9pR+Zkzov3uG8Veb0RP9hmIo01Q1hPTezpB3SYIH6pdg1?=
 =?us-ascii?Q?5bJ+/KMMPL6lPhoY4N6GTu4BtfFXPKDvUQjj5o4qREST5nHZfw0lJ/agltOt?=
 =?us-ascii?Q?jsZYJ4PDlhG+rVxqYSNkPlUkiRX89P2duR42cumqFpdWEap2NDDqyJVviIas?=
 =?us-ascii?Q?Tz62DPhH60a1+Tj81FXZvG7KM0zhB/+MBlgStG4lxRXtPrPxLtH5o2kEzFBH?=
 =?us-ascii?Q?1ar+WFZwAS58t987P9fBw+febwiO+YFAr5ySadVk1DkSVu6ZidK4as+kuvZY?=
 =?us-ascii?Q?ooMZdhyXwcMhwU7raY5dAfFKrOTG/XK0PcrcB2OND/eFZyvzdAfbBhJAdgVc?=
 =?us-ascii?Q?EauZeVt3fX1WMph6P0Hvf+7OJTaLTFXmE5Pb5K0mPz4AIABc5zQwJ0KfSXci?=
 =?us-ascii?Q?O8T2hBzBjK6BWbKYum7Afbmu0gRg/bimOBmVah1FILRWLC9e44gJzpzXxjiw?=
 =?us-ascii?Q?FYGogWB5Sbz3mHs2hlx2VPoKFzuY6zM+rFFxG/VTPjJDsw4wuMcmrhWI9V8O?=
 =?us-ascii?Q?AgB0T1m+/dZAL/zLcPceh2auVxWiA8ZegihPLaFMvcyAQ8dFapOX8kg7BNJK?=
 =?us-ascii?Q?yH4GHyxx9ePq20DNFfodJjG4d0ZZ4c8GrmLDbp9/MJCiDxf6hd7hjA7RA3ND?=
 =?us-ascii?Q?xAO0Rl0FB7LMPoNwuOy6viqM5ABKuXToYqK7LqXaTXUXGk/R0ClnwM5zw13E?=
 =?us-ascii?Q?Yh+MUncNWBgBJIXNS9/8mQ188yZO+jvc5NoQIetmSgl1WxDR1/VqlHUR1WMm?=
 =?us-ascii?Q?ghRILHL50NJsipiWQGrug3oQnRFpSqy172rwOAmIcn7/C+wCkP3qXtf6/B5Q?=
 =?us-ascii?Q?5NHlqciOpLbtuYZjFjL2dgpv6+Uj7QVevTMb9C24WJ9o0t6bEL7eK7rfVrtk?=
 =?us-ascii?Q?nxushLJ6e82dm/t86RAPOUAPteukdbuQmohs0TrO3iN8+CKZLXO7mddNHttQ?=
 =?us-ascii?Q?htr6YzdmCcKRlbxEHmynSE+pPt4KSHLC4Xfwjp702VSx2F69Yk5vZoqHZikf?=
 =?us-ascii?Q?PCPF0Q2Q2fnV+5wxybGJHIdYk8wozVGKQO9tyCKSjo9GHmI9h21Zfb+HBf0t?=
 =?us-ascii?Q?rycan8hS0DrtDwV0mSDqwazrD9IVStCxANSqWO7yZQLVXpn6Dhg4eKZo9QwL?=
 =?us-ascii?Q?sjqGUG6qu+2UHSDUeTqCceGffEVs5yLVVX5viRy/Gv9gG0lRNQ3htNMgoRrW?=
 =?us-ascii?Q?5GZ1yoOVIwG5TiTiY2cC9nggy08tilZsgYP65lHSRL65Sm6ml3ZRkacrc6zB?=
 =?us-ascii?Q?X/Sv5JjBZQEPb7O28azkHnqR7hZ6N7iHgmvOoZfeIcWVMxXTiDRV08Thd5/B?=
 =?us-ascii?Q?bD4VlZk/PwCr6zjUYU+dUXBcMl6Dg3CV2y4zofJ3xz6z9YBNUinSur2Ng7gr?=
 =?us-ascii?Q?iHcmwuuym+0hO6eS+rbW5bszZAxByw1pACU43LQTSAauLl3y4Vj9TN+ogLb2?=
 =?us-ascii?Q?pDiSiKv4CI3stRjO4S9/Z1zLajx2Kdyu9GmiCruGlxQnu1aLCAA0Mq1i2BWG?=
 =?us-ascii?Q?hYSGvT+fntqWyHF7hXj6e9yAOF3rxdL9xG3W2MssFQRqy2yXhWWBwgu0tvZ1?=
 =?us-ascii?Q?y3scgSCV/sWb4rRJlozSHneCb0P/9FOkpFLhzNZIEYauP6q7ZwgeZ45bLJbx?=
 =?us-ascii?Q?Q3AeC33hS3ODNlPp+ll2sGGyUBB9em8eounrbqqXUCjhjYnc92f8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b152ffe3-33f1-481b-68fd-08ded7198ad1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 02:36:23.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c7ZwOsdN+SqXCpDD9LXLm9LDAUxpCIYPMe4LTK2RuYR2C2m2YDBywqImtgJD8ZDuVG5iyjuTs1UNzOTZm5358yD8V2ism1t/y8AgyfYzjwIrescmW+84HGEHbytRTz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14320

We can get necessary info from mach. Let's cleanup sof_nocodec_setup().

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index fae36595b81aa..34744f8ae34a7 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -68,10 +68,10 @@ static int sof_nocodec_bes_setup(struct device *dev,
 	return 0;
 }
 
-static int sof_nocodec_setup(struct device *dev,
-			     u32 num_dai_drivers,
-			     struct snd_soc_dai_driver *dai_drivers)
+static int sof_nocodec_setup(struct device *dev, struct snd_soc_acpi_mach *mach)
 {
+	u32 num_dai_drivers = mach->mach_params.num_dai_drivers;
+	struct snd_soc_dai_driver *dai_drivers = mach->mach_params.dai_drivers;
 	struct snd_soc_dai_link *links;
 
 	/* create dummy BE dai_links */
@@ -93,8 +93,7 @@ static int sof_nocodec_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_topology_name(card, "sof");
 
-	ret = sof_nocodec_setup(card->dev, mach->mach_params.num_dai_drivers,
-				mach->mach_params.dai_drivers);
+	ret = sof_nocodec_setup(card->dev, mach);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

