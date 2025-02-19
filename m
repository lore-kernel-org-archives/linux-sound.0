Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D322097
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927993; cv=fail; b=XsPNsfxGRCofR85y5S808XaDho9zRBNDnNXl1PQVS+zbwNxV3exSgk9A+oh2B721Ywj5rVCpp5YbUEOdAjg2ToI5n983O5wF/mBenD67719sgwic4HCMOpoz88Hh+vKDbRQiD3d7uejj18LULgvRRoykocII7TZbgJvKpbGKR4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927993; c=relaxed/simple;
	bh=sy4rkJOlXutPPZn/msPTA10/QgdhR847bEvjdYmooYw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XDIF7jJpDtoDMgjDRaFGlP9PFwud4RHURK5l9MlVE7ChUJaIHtRjf0mimvhIegYCQdFBIhlITTQZ+xDDOlE7TT3I8ReNQGwDWiyorIQTRLKb5gT48oooxeRmjKtBXkpx/nOFSA5A5oNH52dEjS3G4x6NK2VQUKyOcmCJL8hb8Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gukpnE83; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gukpnE83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtccWeMLy64Kg69lUHdEdWJMA2UuNkD82n1pn8mWJ4EWtAkCHz5gE7KAl4RiFHBIV+4V5IJ4ZVrYbV7YStHuv3BE3oBWEFqB0UFV7BI5acIk182EznLRG7svnvmss5kKzR9eVcFKrgmBDncAO4nUmdgNduSlnp5F/qfEBKgXmmJij/IYcOPxSTE++i++VmXI9O99791YXN1DVC+JhYhMmOm8ih2t7RMLR0zBz+z8tpTWcHqqnEG4FAgO/al6V8DHsXPKnU9X0dcpiY/VpP8UaMXeVvxthMgkRJsP30mhutPeBnWUs9lTovg/QNUutqqCNUHerrtsji66wc1CxHYBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIkg/k9dHWe6SXSpoin+YfuQrbYiRlNbGtJByDH3NwQ=;
 b=dV7Sqq4WSkHhuiFBRNIbUA6CG9ijknvvkwDxgbXelUSt8a3jxvnfT1Ns6ypf4AZFM9AMSPFFgAnM1UGRz7vRtdaPeIgdiU5VTzSIz8FVIUpZuyePJ+yb4/1JjLTJHWvgauktmIjsyrTASI9m5tPIdk+BV5xXM+qMSpFh3k35zFjzteRuqqBLxhqrfeoH6XVdaZcDfgELyyoKBUhWygN7sWXji/FXKZuGGWR6a2jLseEqnxOsQwUATdarQ5GLFlTkLX1ndSBoUohlCdKrDIKegFM5giMCcIHvUmeKMhmrVb5RQfmtTSygmxwjuwow97yYHexsm1SEmUFxc3tg5tr9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIkg/k9dHWe6SXSpoin+YfuQrbYiRlNbGtJByDH3NwQ=;
 b=gukpnE83stGlJWie/EMLG3vxnz93iE4/Zk7U1a1rTDxiN2w2wMgsGnsnWqg+pY7pBAa6891+SDBj/dOCp3s1dceCeiYm8PaLLwsJLfrgLUpsbCn5hFkv1C0RNZ3zIpnanY3y89Gs600t7zgJ4wqiCftgoKgPY0rzkEyNUCfh77Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6754.jpnprd01.prod.outlook.com
 (2603:1096:400:b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 01:19:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:19:49 +0000
Message-ID: <87eczuvih7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: kirkwood: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:19:48 +0000
X-ClientProxiedBy: TYWPR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fd8543-ee9d-4233-80c6-08dd508380c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?icgH+BfAjMEpmdEzXTI0wGammHq290ej6+EU+hmnJEDLSiLSwgkPL5j6iopR?=
 =?us-ascii?Q?yhj7/Hin0wBRD2invEX30LaOejv1M7gOPEPekUF5TgQj8KqRfSMBXWxjkBDo?=
 =?us-ascii?Q?I7ljDptRByViC0ac6Y/vT2z9GHQm4jwMp5RVbnBv0OebDE8x2xnCoZePPP1c?=
 =?us-ascii?Q?glZHAzwxhab2POlIiEnerinOJNzj/cQycMCTOBRXAGduf+r4WCOv8EYTkqS6?=
 =?us-ascii?Q?B0qVGIn+orhYGOrfcXcWuaOBORdQHAnfvJiJ2klDYb4aJOiq/oeq/+/zYKPB?=
 =?us-ascii?Q?nSuQRISwBTOTe5zmGBNPakIlMlNgVo6yFgYG1EiGGik9R0ltXtaJUIjw7AJM?=
 =?us-ascii?Q?lJFn5WQ+oJozZhd7hvIbraZRdIDWwwu/sAXNbuzqMBZ3lZdJ530VXaPuVjFu?=
 =?us-ascii?Q?6mRn/KtTwcVDk3oBOL8UmqISGN8Vlx8z4TjoRqvSegq4uzSIUWlGb2eiE7rm?=
 =?us-ascii?Q?9qxFUPqe5JzRPJ+Yc1PNOyGcMrz5L61BF1FVsM1+x93i6gZjFxWdy7lwTaep?=
 =?us-ascii?Q?eyYk53e5VOnYu8Yss0iOBpkQCsmROzms4J1CgkzHA1IKlLoyOzZeJ5O0APST?=
 =?us-ascii?Q?gIsjlwKjH+hG5nqQ7Ff3EGp25x2RHvE+fW+KPHhcQM2morBVffbcVyHC+8oD?=
 =?us-ascii?Q?3l0/cJ63xxd1tsffTCs9p1PZfhplXdD/PbcYxVzywLSDS2fs2AtHVBqRyFTS?=
 =?us-ascii?Q?+nJZugvQAnM05VU9CRmKbKa5zsACsEYktkLL4qCPRRRHbFMMpEct5ZqzaEec?=
 =?us-ascii?Q?zEcyfhH5Cndem6Nwtjzf6IpXvbfFlLoVAlQGhSZfZFm00eoqNE7pZoEGaTQF?=
 =?us-ascii?Q?ZkKXcLDAviiFTfVx4elmyLeqFKY0Xve4beGaDlABvIWsuvo8bd6JDzHUVGQ1?=
 =?us-ascii?Q?xxeXxUyg+bat+62/w4ZckWRLXq7KaAXIPp6fV3DW0sJlSr1KNvhWj7UZLiW3?=
 =?us-ascii?Q?kHZDhx15x3RvuR/oVsNHVmcczGvF8CGTRvELb4gyWEZ1kZLx3rKuvk/qrwtT?=
 =?us-ascii?Q?AJPZ6FnITZJawPTyt6hXWr9+iMq5J/PGdwhDHsJJq/guJlDgVmYmwB2z7hHN?=
 =?us-ascii?Q?Ai/mEFhm+hJzXitzx4Jc/d6wObXL7jq4fWK9GQMu7Gzl2SqslogOXSfXU3+j?=
 =?us-ascii?Q?aO/6oRqUlyOVq9OfPKbTjc8KG/rIGnSBvSKocPHDKjco3NYEPJGyphe7fvyP?=
 =?us-ascii?Q?fSUBcWAAmHTsZiMixvHloNyn695JrADbdIpj5vR1t5GnUrEY9tPQTkRsdVK1?=
 =?us-ascii?Q?Bqu33cVm+1EGmENRCd+GH1qmzb+ossSHE3oM2uJryQ2d9iuAsBmZQiNEelQR?=
 =?us-ascii?Q?RXuN2AnXK7F7JINxo5wV5nNTMRHYl3nDL2MTHKpPSaWtyttz4Wb4WfEEIAcJ?=
 =?us-ascii?Q?exLZLbMm2DOs06X0E0vNoPnAyVcIkjAgvcNL9oQqFNWE2x5xyWIDcs5XQQP0?=
 =?us-ascii?Q?UlnRoQJ0e2FLAb2ZusaoBNKrJ7G5P25a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCwRt/TN5iDWfrZ7Mt2dEfbYut+1rIU0SYc0pnI+d2sbmPcKsnZ296WcPin9?=
 =?us-ascii?Q?yom82137MxvPDvx6F6AzyVcYBPtJ8aOUmsfxDRTDVFS0dVR3H7muKX0tuk0C?=
 =?us-ascii?Q?yxZVmh+77Lk78VPTCjwsp5evAtqymrytlDuqfQaNIRXUuT9GY76a4tRhafjF?=
 =?us-ascii?Q?JnrwBXF08D0qLPczs8ppxI4FjqELg08BTmmp7fOJlojDdvjGyiE7pX2Qeu/b?=
 =?us-ascii?Q?cDghPFtzZO445LJnzqbJMlo0uXbjxWTMV/YTCZv05fJZspi7PVkA3Fg9pgzc?=
 =?us-ascii?Q?l0teVTZbsF35354ph5flkgdJo26qgxqbloaxrVuDadNI6GPMroPpZNfPdA6i?=
 =?us-ascii?Q?qjNcpct/jEs5k2c41496MAxxILTzbWKgEbHef8fM1cY0UlSxr5LOUqB8+oPm?=
 =?us-ascii?Q?q7a34xVLQTSq/HT7NzFdU8jytMgnvxDWGqp1QNhxRDWaX0VI87VmHtOtH/9e?=
 =?us-ascii?Q?KaIpHEWNn4TsHIH/rm7oK+NiTHdfMu43L35p/JBpgocadRyrc2me3zaSF1sZ?=
 =?us-ascii?Q?3AEfL5dJoZM9sxKxDi05vhIWZtNY3/8FzdNvkoAv1IOB73BJs6TQo5FTBuFs?=
 =?us-ascii?Q?vk/aeSSdbmHUe5vaUbnv6N/Z7NoJrrNRLb7t7b8QEjrvs2Iw8EPM5IM33u4e?=
 =?us-ascii?Q?bBtoyOQAVLIHFStyJJek2Oh6NdHw6inyzhMbwNfcvjVYlsCBDRJkGv5jzVYt?=
 =?us-ascii?Q?cTJ0/ZCupnwUJdYaGwcr3wYvV2gQlJN5jrgwvfnhYiuQ9OOiMlZ3NctuQNfp?=
 =?us-ascii?Q?oaWQkiS3t3S9aLtmqQ2zkUcv0nmjyu6BWAqb+Oc1nYocNyNLZFwkcrKPqRtJ?=
 =?us-ascii?Q?A1rhf5OsvxERQ6JICQkrcLdsTOOLGDHSQFPSHEyqarR+WkChATBathlU5d9G?=
 =?us-ascii?Q?gI+7QzHaJ+bWnT0oQQ1cXo0kYi99mi4H91CgdlkVxBZZS/ZFTjLPEaP8LoEk?=
 =?us-ascii?Q?DvQurVAhjAOKACN2NGlPgwizzY/bKmwEbran35Tgsx6AfiKXUza/xmjDuUPl?=
 =?us-ascii?Q?eBQcDE5GynvMo3bdqil5mPjCHMP1r03PzaXsYXRvXohiuXzPlq+plenJQqmU?=
 =?us-ascii?Q?vnLV7Q5GCHGr9A8PCerctmqeYcE21mJ+I0zGeM3qqMz1jsuVVJdWZ/pQuL0f?=
 =?us-ascii?Q?dswykYLB1aQp+9RF8yE4ZkECXknTurFUtqDR49b2tVxFPI+x+znk1BdiXrZG?=
 =?us-ascii?Q?JOM7KZKJlBUZYmQMfoJCf9djKv2Bnaxfn6HauJ4PAmpxJwlgyFiC/+I44zHK?=
 =?us-ascii?Q?GMQBGZCxbiY89bvo4d9jEOKlX0enWB4m4IDF+mrZ9tprLTdvW+l80QIUoMTN?=
 =?us-ascii?Q?/psUhKKpeQ84EDZYFRwJKL/slTR3qJuLthTLAzeMItyYs7S4ukV9B/1zBsIT?=
 =?us-ascii?Q?b44cVNBQWkBr/F5XXjW9vWG+ACWALZvZA7z3lREzju4E4AiJW90Jn/EuPK9U?=
 =?us-ascii?Q?9rpUVMukJQUcALD35wFQJKPxhxskVYewKTWJ3dMq6ho5mXUwwzACXWcxrPM0?=
 =?us-ascii?Q?0NGp886O+QfWhAcMQ3nbYuwrjuTYTOX0iGsSTOaWwu4h1WwEtbP4mROvLE1G?=
 =?us-ascii?Q?lwIccI08CI5w0AN+b8C61MYMAZHD+frEC9ectyhmeDwmRb4SPKIYsSV2gajq?=
 =?us-ascii?Q?dzATJ7POnJLiihfTaIw3Lo8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fd8543-ee9d-4233-80c6-08dd508380c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:19:48.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7V1FzPTqY1XBbfiFpUrNv2UwBIcPtFBqf/IXGO0r4m1b4YRI9BFlcLn/G78A+MaNiyQVGFMPxHw/3vzCK+tEp6MBAtytFzSXz10Jhu95ciI+JR45MeyOY6FKZ4chRwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6754

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/kirkwood/armada-370-db.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index 79ee7599f06a9..77a5f440364e4 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -73,20 +73,20 @@ static struct snd_soc_dai_link a370db_dai[] = {
 {
 	.name = "CS42L51",
 	.stream_name = "analog",
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS,
+	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC,
 	.ops = &a370db_ops,
 	SND_SOC_DAILINK_REG(analog),
 },
 {
 	.name = "S/PDIF out",
 	.stream_name = "spdif-out",
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS,
+	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(spdif_out),
 },
 {
 	.name = "S/PDIF in",
 	.stream_name = "spdif-in",
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS,
+	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(spdif_in),
 },
 };
-- 
2.43.0

