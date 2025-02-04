Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63C1E7C3A
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647436; cv=fail; b=OfX53N4b/7nYGFgSB/QvaHMcSmZqbk50562DzyLID5ElocFZKr+i1D5yKtya3HhGeWLdump3Vdy/+fjcLut6vC0dvWwobNow7lAVl+cRaNX3vHoQ1AuMbPu2mFR0+e8oESKKOS/hZm14cuP+guZIgtgTn9w57uebIlWkCzEXrhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647436; c=relaxed/simple;
	bh=fyzoG0UPXd1N91or1+Teqcr1w2Uatjh5K4c/W0DxfLk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=p6pKSyQu5HplH5BWUk0zCCf79zicMV2cVXV5tLgPIvskw7F4qTjmrTsNAI7UzKSFQHMhPPusKYE+HDytpFgQWwW/au+IplaHNkSiADLh7dZkXzeWTCXdyXldGngWvQKoawos3DyUyaSPULLNQlxN7kKJA9v412/uiad9RQ0ALIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Bw9+g2E3; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Bw9+g2E3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu36M12E2BKICrL2vqJm0fJZobZ/GD+Y6fKSeF69ROCGOcxb3yzC4bIRDVdfsjdZkGRc6IbOn3VXxX5HJoXqpXaCFzCIlqmUrJfmLg1GucQFycHU8miH0yPEACNJhrBLMFJm1ahHVfW8RhyckXoZ0vf49XwpynrlUYQqmPpl1fW2j8NzcxDVJRBT2imQ7/RqLHdmHIiNvoaU7534mv+lHND001K+Y3cRttQejEkL8lpxaH05+x604CWHC4RdeqA1x0o850sePP1l5t1SRp+39lBttsvqYG+Ydvd0TJPC0m+Nlj7HVEDPBQYz6nBP/bYJE/kC4cQSViT6GLdu55BXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MTeKC0grmViOTLTGWlxW+U/UsUCqHydBq7UQUCsFIc=;
 b=eplJ9kPA/4M/fH/qoD543kIwHG4VJfqyY07fnpMWE87+woJ4opLfNR2C5vgyrHleIyVnHT6mUdqYHoIry8lW0GO8g85pFi7IlHmjxzhWtmnSG17+7cbvG42VrVmNw947/tXtVY/X+ZFhSQjozQ0ecALDLSjdnrr8DrDVaZZBE/MO2Sg3mYOVaIRFj1oWWYJseOEBgINzOuxmMNhkFvxPU9r7pE841ueCntpi8WBmTEbE9mcA146AbEYe8VoUpNzzXcEAwtdq8Kcb7yacjUu80HJ7S+/aBV6P/RHHtbnHWDXnQLmh8DpsQnjIPl8A0ev5bfZiRXUSsqXwkjKUg3Q/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MTeKC0grmViOTLTGWlxW+U/UsUCqHydBq7UQUCsFIc=;
 b=Bw9+g2E3z4GuIalGezA9CcnIHJAz5QoLKRS3htIeEftIMvMSdUIYWtX4PBJJHtRwBodlPM0bdgCVX0OTwtbXTFaBd+SeuYfenrJU6zOGVggmc2gIfawkHu5GttDgzO8Qs4kQk0be2AwzsPGM+tNP/t6VcXeH7mIhLiayUrdlU+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14724.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 05:37:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 05:37:09 +0000
Message-ID: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 05:37:09 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14724:EE_
X-MS-Office365-Filtering-Correlation-Id: 9275c30c-b7a3-4cd6-4fcb-08dd44ddf7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aTGBz/Aq3itDpIW2gUYLBLl2nPqQUXZQOPdFCMVrwmM9b84l+ZoYP1WKSnl3?=
 =?us-ascii?Q?8SpatOxby1euVMdqyfsrXjKFKN8TqGZKa3zP6sQlJx9iGOjiwrCzihPAYQ6y?=
 =?us-ascii?Q?Z9E65kSl8W1+IffY5tDJVJbgzT5PCPyS6jGqPAsNJIH1Yr4xjO34aOXlEfob?=
 =?us-ascii?Q?WcfiFQJhj1MwszR7SxZaY2o7eyVdBH6CfKBVGwfg79LCGdGJPTFcrgd+G+qp?=
 =?us-ascii?Q?TJqEQUjiDZDd0n6OmJx2gUnZ15JutPxEcTZ+azle3IdvK4pkeINNKYXmyTHH?=
 =?us-ascii?Q?UEQfnI4Ivh/yD+cz3CcIRR8YHI//GzlkQ2vebSHtBGGFp8DIBdYoQ7uWwdo0?=
 =?us-ascii?Q?TZMvcGUqV+orIYSyKM4UrFD+mLzeUv75e9y9Hu5jWpUjIXzyyIeoAi89W5Fk?=
 =?us-ascii?Q?McPaZdiAvQArt2bFLTYXY7LBBd0RbPY0Xf9fDgJUxGKwYIfAPPRHHi1kNjcD?=
 =?us-ascii?Q?4FJcw5gchMhHqfesaZMeuQpXbr8rWgzyDa7zcFPx9usd7YatSozYNDQ1KQ1E?=
 =?us-ascii?Q?+osLDWZmDWkXsrFq3gW4CGEzeTkvN3Tq08EQDaoOEfjCqStzARukszQ3BrGB?=
 =?us-ascii?Q?EUGCA7kpGBZF4joHQGgL7PXJ54keci0S3RslV44vNgwUR18Glq4FMa3zpyo5?=
 =?us-ascii?Q?R7Mf6qC6RxiwzUYs250nc6BmlMOWqLFeeh6rt2t7pWfVZ4u3MnBFswefoHYx?=
 =?us-ascii?Q?FQSFAFYPJjSbFoYGM0ohQXlzmGB6UsxVBgM3/34NQ0qXTvJyOw1thLjXy/8I?=
 =?us-ascii?Q?74tOK0q/TKDlBYShbh8UwU2kneh/GGsBcyhubGUHyyhVTsufiTnswr5B5Chw?=
 =?us-ascii?Q?+FiglmFIg4mu/b9TGPdorv+0JDRw6lWcyRFbevhSp7j+I92mMMBkoaS1cT3+?=
 =?us-ascii?Q?WIQX8/ciaTTInm49HwW1W6lgsQ+Ss7PUFg1GuNuaPqt/syWnUh4yizgPgtXs?=
 =?us-ascii?Q?bK0ieI5JtObfIcfRdX4qw0Oylvr2oeiSpHYE1dHyEFIcn+NojupIll4W2Jmo?=
 =?us-ascii?Q?7KS6vsBC5SYynFl5RPz0cm41t1ctmmJLQejYAdwfwrhdATLUJkdaQAWha8YO?=
 =?us-ascii?Q?S6d4XiJmFYG+aOxsTP0vbzvaL6EgJ4bHRPNCo4FMFwcTols+SBGYf0o4hHOX?=
 =?us-ascii?Q?Ym5fEy0Rttsht1sbSU7FXMnDFisMsvQOPIftvGFl+kDWQ9hmuhfHVEXyaj8p?=
 =?us-ascii?Q?UZUAL9UZDf7Eb8Iknq7ni6GiUDQc38BN+Py+zSSuJTY74KR1o8a6xhhTksMJ?=
 =?us-ascii?Q?aQxyKoudFNQD75DkvHXPqhbdwd7zfxkmPUMhPs3qOy+bYAD0tSjKgrYkMEo2?=
 =?us-ascii?Q?XawUHKxFqADRTh+VKxcG0nAX6Nsr3YDhxUyfUz7bby345hKIrW8Ge1uoCYbN?=
 =?us-ascii?Q?cvyB8S+bu8kPysQ1XNut9KFD4rvcTUdqZGGze0L7Bav91KQCTVjyfvuVkn/e?=
 =?us-ascii?Q?OgwEhUpXw8rVVhJteQfut6aU6f+7YtwD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DpFT68rnG+FO78I/NRLVifgrw9JK9ODpyrjhgusYf/zBXfFySevMZE3IL/LH?=
 =?us-ascii?Q?ryuFTDzmEYDbwLYrsE14UIt5wOZGkSun+bILKne1zYGDoMV8EJxSi3OXMYQY?=
 =?us-ascii?Q?YVVK4YnjyKLW8mb79nZQDK/3N5/c/iGEykVrrxY6UrbQEkbRYNELxcvFiMhP?=
 =?us-ascii?Q?30vKckjBEpNMx9F9sVJlcXFl40nmWNHORrAo5SuVlTJiR8U7fzW1vQhtFMyi?=
 =?us-ascii?Q?nOLwWozdMZ/iVzajaHEf3KcjqFiOvkNsb0aVw4ypIWUA24IS5RzxpJZ1DDKa?=
 =?us-ascii?Q?ApPBXFbxZdrn0702K1jIVR3p4h5pNb5kKl2+no4DA3XVPcgPJ81mtTQlCmss?=
 =?us-ascii?Q?ZzcFgTPM52EyPa8+juaGNDHu2n2x1LOWTO7YIVzfRULUdUPmcCE6E5JBN+lw?=
 =?us-ascii?Q?ackf9kvWFfOgk2Dwsov4N9oUgwJun5E1GzSHWTv7j8WcPRjAhfsXQZnzYIso?=
 =?us-ascii?Q?mz+roPFwbdBW/9ON5HT8lCY33RN93r7Vsr/x3ou5JveydztwCgMSz608ChkX?=
 =?us-ascii?Q?qiCQXaLSLE8C1M1PpqYX8vvi8QnXqMOfT31pZ2TEMB1w51xhfSciR2skSSgs?=
 =?us-ascii?Q?a1tYA3yWnxFIIcHt5RHhLF3lL9d32OXRFN5FGmrYJQ/drRnWASxZPzUWH2xJ?=
 =?us-ascii?Q?To3E1bJZ5qzonLoCRq6XK7I3FBMpPM2kmszNnojndY4wFRsKm0WJzfF+sn3i?=
 =?us-ascii?Q?zy+cYPonU3+SOtoImp/u+jAGJ7QYrRS+nHkd7VnPW1PV9XWOMitRy31S8TR3?=
 =?us-ascii?Q?nPaM+/CLTturhiGFIUt+1+RfXDLJGH72sRIElPfomR/ZgxstfZsR9UvO4uET?=
 =?us-ascii?Q?kBigJvA8G7SC6/u8vqc7jeVXLvF+nDCpg8kJQMhNEao05wpZIqAiqwCuBwFL?=
 =?us-ascii?Q?cs8E6IsrxH4gtu5CBvqdsKnkfmtYsFNRxxYy1ZQfp/5KIz4bzPn9kCU3psLb?=
 =?us-ascii?Q?HrGiGg5i1nrxbQYNg0U983aIc6P8b7slm4Iu9RlzNzRrJHVu1YRvxr3RY/R7?=
 =?us-ascii?Q?jpFHlj6EKynoHKveJz4c9GMmTFaMCYTAHz1amaPwoMychVZJ7jzaBaiQCJSq?=
 =?us-ascii?Q?RTiRUelMlw4kJD+3YVEt9NbyeM5UXweatGv6KjukKS+bDyHa0sz/3ZPl+vVZ?=
 =?us-ascii?Q?pE3NtMaR+KbOq4/BeUJI0sXfgjJf6qxrm2/fDpRSEnnrUqty4lKy/fN0uyuM?=
 =?us-ascii?Q?h9TVYiEYwztpdlrpAWb5SmMjairy9IvnP+vcNIEqUR8MIPGoM7qdelYb5Ign?=
 =?us-ascii?Q?y6Kym5OfbjyRDEFa/XK5+uVKkE6nltuvHEZlWsmDSRJxcut7xpKcqJ473qSa?=
 =?us-ascii?Q?FeavUHPip+w5Rnp0ZyqHWIpfqJfN3HVzgz+8bqDB6a533fr70V5n9b5zyNQm?=
 =?us-ascii?Q?OLVxyJRT5CSshBJ7TNGOJN6vMa/dwNMCjgfsXm3WRFj2EwYApzlYp9BF8U4V?=
 =?us-ascii?Q?XF3RvuuJNlx9LkoSgKyeFohBQt8sgCenqYBVH0Ko42EmsjU9aVa753aVMU4y?=
 =?us-ascii?Q?hWl2FsLGR2QTYyal7JjqvuYJqjMmS+QRNCmG333Mtnjr+kZDkFgUUO7+TrzK?=
 =?us-ascii?Q?eKekHpY98DKHUqly8wvcm78tNM7ZCvZb9fYYF6qz2/1dClZqv94nYmiK3KEK?=
 =?us-ascii?Q?eXV3QPPThleJGaGf9pzUPLc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9275c30c-b7a3-4cd6-4fcb-08dd44ddf7fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 05:37:09.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26viV7EX0IiVllryo1cyeED4pMWL4+zd602R0qyOLHJmN/vTVBU0h+7ZA03s9FyMKbAcIBNUjvBRJOcxNtCg173FQk0PguadaKm35U/CnQ5EkNXanays5bBKV15ziWJO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14724

commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
support") added muiti Component support, but was missing to add
dlc->of_node. Because of it, Sound device list will indicates strange
name if it was DPCM connection and driver supports dai->driver->dai_args,
like below

	> aplay -l
	card X: sndulcbmix [xxxx], device 0: fe.(null).rsnd-dai.0 (*) []
	...                                     ^^^^^^

It will be fixed by this patch

	> aplay -l
	card X: sndulcbmix [xxxx], device 0: fe.sound@ec500000.rsnd-dai.0 (*) []
	...                                     ^^^^^^^^^^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index eec6b8b5c4d8b..51e0e434514d1 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1119,6 +1119,7 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
 		ret = -ENOMEM;
+		dlc->of_node  = node;
 		dlc->dai_name = snd_soc_dai_name_get(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
-- 
2.43.0

