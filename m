Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E91922F3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533752; cv=fail; b=QSD6bwNWC2eyR5dH1hP8LcRmGPYf4hKYDxGSDbqGyH0s0NlJOixHHyIZqAV8UFvzdoJK3eU6c5NADffVPQ1VKGUNb6nKdLHEsuq8eQATJ06P6TAL4MGEKnqCPBkYSITO4QqY/z66wXQm0ND0ImgY1djqDH0gf7JAiWt9JVx6YlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533752; c=relaxed/simple;
	bh=iM1fDT590mAQnVe2Y+p12GbbXXn2akPXVZc1/OtAilE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LDGQSP7ubKUgMoIF6Uu1+xLESsRWdx3BEVtvVvdc8EquvCx0FT/DvieXz9NX6JHbZTMYusUT+UKDvRqEiUqvqAQYU/by6m3eXHuXndG632GfCBXwU6PKeNHZLXKa3qEQl7Lahm87FQMdKO8mujjprZPKWp6Q3TZhkeDr4zfl/3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NvUBvWF6; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NvUBvWF6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad2k5Dhk2CXDrmQZO6kESD0KIejlrTNEmIRutS3uT4yWZiu6tQFq9vciS1P8I2ZReUTHMg2Ulea4B3FmbgUSNRwftXsBzifOgB8s/qIWsnn32+TqHUcWAJppqm/TBHHSldpB1OejkqivqUYjLs6CGNmJIH9NvsEMoPP16g9pC3H4KqQNReTYexB2FJ1Ll/Bm97nW0/m8+Oma1T/2qeyv2Bb+DEjPxiICqZrX6YoyB6uV/0JkdY7zaBOns8ovnG9MhHXny0elYkVREZ64XVLXra34pKHacQsThTHc4ijC2MdbXLldGaLvg1n467Y39JL5x1RITNsCsq/YfK0B0LX+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZCNkVL1Djo6Ldr5wz5GNSN2zWBd/X5S/aacQEBDLn8=;
 b=DXcoxN8ojQtghLD+J6HzW7kGmCJyrw/t4ASUtlsccLTgNCQHCnTkZMUARhtc358qfpEZ06u7EM9aMZsFoS3k/Y/NBCvZ49hxwL//vkqDM7/m2AG5IdD5RQEsaZwo96b1O5u8ds9RKRbLmBo22DUH69KNkpUWv0oflGRLTPcUUhltfJ/MQ1fHH/QcruccK7J/cRLGK1tXzmRayu4Gb8Y46pecap3jyCO6+MqCecF1YpdosUotcPtGZyckWsckuCuLcfXoI+mYEY7EoHfmoXuoSD7xho8WWc99QeTjpNSS+NR6Uig6tv8NaE5VTL+YWFD2l+87mC5JoL/OWWw8USs6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZCNkVL1Djo6Ldr5wz5GNSN2zWBd/X5S/aacQEBDLn8=;
 b=NvUBvWF6jxaUkgEwSKHO/73eh8HnHw1NcY44CMwueXXDN9KEGPTjmToVdGDFuR2OU3Zgu3ORFZhyGQXj2mivytg1zvVtxCuhSq/7aoyNIzJ1wMxTFTKbR1Jj9xAZQkryxQj7aBa2efjkcBnky3ZiaaOs8iq4vfQRN04uGawW0SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:48 +0000
Message-ID: <87seo1bi8b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 091/157] ASoC: codec: wm8974: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:48 +0000
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fb83bf-8968-4c87-b500-08dd5605e588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DRBn4YGoaXnGnZhKLsb980/WaowpiP6tXQcgkaUywOPMCkyRBSHm2wag96fc?=
 =?us-ascii?Q?/IE4Ju4kmtTajUKTuXCgxePPl9BNbWcYB6uVZfYcURpUurcjILQSGhE71Rfh?=
 =?us-ascii?Q?/40o8QA8tDXapvHXWffj1Ne5/1iD+cWzouy9M5yPC3DJenI0CD6WG29YqR1N?=
 =?us-ascii?Q?dBuQtexFpGhakce0/J0uDk0irTYTCrjjO9hN4PT1pjMPehAda0pLJjGsPel0?=
 =?us-ascii?Q?j/XAaZzXiznbjeMptmePn41t6hygz/D28pBsas/XKIE3Civ8IQL8Mp/owBoq?=
 =?us-ascii?Q?1fp9dS82J65KTSgGUptapcL97DiKE7wtBKGFtVMmQU5Bv6lkzAMlxlwibYBY?=
 =?us-ascii?Q?Om0glB2w9+1aIpI3X62Gt8MmVzul05jPCR8pchfTh0ZbWCzwTKndJB8sOy/z?=
 =?us-ascii?Q?C9hUmvdVBe9M6p+p3rwmu3FwLXDfhhwA77NzcQ0xa5OMlLj1IRGNaKSwBH6Q?=
 =?us-ascii?Q?D1SJdbbTez0ekThboa5vIKWw8Jvt02jxbQgA5D8XVYt6DK1Y7PrLTlwHkK61?=
 =?us-ascii?Q?PgT4RwSdEnLyAO86q6ZPUaZPtjx0EjR9vQhnTepdIWezj9EbWd6MEtcKjWqu?=
 =?us-ascii?Q?FFUZeP1WnKugi7VvEtmyDdDFVpN3mI+fPQ12F1sxTATwtNIdDgL++JKbGdMD?=
 =?us-ascii?Q?3HWagx2WxIssjlw8zPEO2Z6Y6Z8z93HmSF6wJACY40lY34tP/D5KEbYzsC6r?=
 =?us-ascii?Q?Wrn4sjRybWujecSFHPnmCuvq8OWal0zUuh6v5ufq+nERGWLmdyFpBfPziUlO?=
 =?us-ascii?Q?lp4Qgxy7CJInGnzjRulFWOAkO7eFopBQfZpnxhMbXzOpa/xvqGTZSsKbCOD2?=
 =?us-ascii?Q?0zE4YGqtm0Ksmp6BgPRpBGAvWMgunwGfJh2U46cig75x9ex0c54qkmTUs4/5?=
 =?us-ascii?Q?Wp5YNI/yy1ajZdaHFTFmMOdlTbaO5gjfTSU3brt4npjaaF5l+vM4J2U6kzm5?=
 =?us-ascii?Q?6sY0DHwW3P40EPibZsNpquvTNfNmSZQOmZi6yVIkekGCUqsek5b3yC6NHhRl?=
 =?us-ascii?Q?P7k7saDm2FAMOf0U4U8xKA3z88odNTfgkc4lbgl9/ToETaOXjn+CsLoO2VQ3?=
 =?us-ascii?Q?pqnnTinNP2nqKBY7xApWd2fnMXRTjDdz/bkoE7LVBD1Z1tvCwT37yLXUxw54?=
 =?us-ascii?Q?W98vKU5s8JDpr/+Ijvz6qFb0AeAmbEK3CsMR5hNnL3W7RG56hX4gultKBoJQ?=
 =?us-ascii?Q?lBIcTrXjFueHuKT2eZJCi5tBMGH/4xTeQaEPlTDYBOkbNpegtZpGqSv4kbeW?=
 =?us-ascii?Q?8IvBliTqMJXDLW7CgSbCd7AyLfuM3lupq2a3yzqzGFZn3oKJu/RNXQ0yRgj8?=
 =?us-ascii?Q?Mr3+atsPQ3k1PTviD1w2W2wZU2lGuDDGEcwPVyc1eewKBWsVGsQxryKNGllJ?=
 =?us-ascii?Q?4Mj2SvPLg6LOicFZEHYl2zRm2YcJpdibfF/NTQ4VqIDKyDTK4lxPFhjf3sEz?=
 =?us-ascii?Q?u1qwyuyU9xOy/APiVqFPyl3xPF3USb7W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAfFZFJ6EDts6y9OghFnav8LX4UUDncjXQen/TX8ACJ1TERgxQLWGGiOI/ry?=
 =?us-ascii?Q?CJ8tLzJYoU1Lg9bJfg+VvIOMVCLSt5fA8gjusC+82erQdGoLIiII3Dg8Yo3h?=
 =?us-ascii?Q?JvRV8pkz24dNpjxRGIfBIU9fMxiFwv9QMCKQNUOcqxEKaAszZzbsCLnZ1Keg?=
 =?us-ascii?Q?oEOFHUfjRE73h3MIZFe10ByASzElKmsgxqmVlqqXOyh77h/mbNMNoFvJb2Y5?=
 =?us-ascii?Q?9zY+FjyRMEnKNtfhXfdqEAQAIcfBhXIIbm61hYtm1/lO5HrjPCTCvWnMEWZ3?=
 =?us-ascii?Q?dY53poOcbeetfvb/SPANpLhGRmiXphMLdRmEL+CAjd1jMQbGFdq6jV8Iuc28?=
 =?us-ascii?Q?hxXtXRZqjz2Xw5MZfpR8CJ5KAcJbN5VhHjyrwqzxZIw+U4OHH1Nnv2oo9HFX?=
 =?us-ascii?Q?DziseYlqVjeS5YgozP2zVLdMHt5kBCSYBr/HGIwidN8PxULrw/H9Qn3/BEmJ?=
 =?us-ascii?Q?+rhXsyFLdzKu99kRk7CvdBJ2CqSQNVHFWsA3yQKtoDwKPwDytDfS8Q8qkWTs?=
 =?us-ascii?Q?L4M2vT5VsVki7XRTwDmYeFtVXGWac4mZSc+IPSLQW0Wjp4/aUGDLLAp5m8Iq?=
 =?us-ascii?Q?qfDmoyQN5QVioAk/6wXuNBzpkeTTmtHblWjUdEloIBg2JNOwnej/U4ZO2dHg?=
 =?us-ascii?Q?n+mb/YVTrKXj3peDXuw66ctAKksp7y+JeYi+SYGInfM6mTCNk8zhndvxaiUE?=
 =?us-ascii?Q?mC+CzCfVud9YkjMOX/iFjSK/yYx/eKTahlnO2a1c/zaa7VjJJyMQy4I3oF5G?=
 =?us-ascii?Q?8FhgQhfpY/jkjM99W4Y+a+HzIVOhSdSmaoBT923MACsOp+mUOMsiw7kF952g?=
 =?us-ascii?Q?ks/RUVy479v9gzogMdj9dIRw0vZCMm9rWCOsDLZQ86u8vd6G51pGClcQWrTd?=
 =?us-ascii?Q?8OyQeg5xLdz66DCtatdzSqHw+dVFSDTJlBp5V1oNQTgPMUgJq4NaZa4i3617?=
 =?us-ascii?Q?ORDAZ0vE7uDal6omyGtZnMhZgNlSH+O/bb43wu/ia6QTssi5qxKUs9MkI/N8?=
 =?us-ascii?Q?pX2iA49ucnIO/F4gxgEd7rWaCmKTIe39aQtLNSYT77vOPzuVs47QleVfQhHo?=
 =?us-ascii?Q?fFlD66td5qnYZbcs6KEA6mwku5FjiridhjtNg9Xb56E4AFxhYdImBDe2JrEr?=
 =?us-ascii?Q?QfcPVotd4H4jft2pqGdOqAVUn5UU/JyAEk3ztWoqORMbB61qNnMU3Unge3Zd?=
 =?us-ascii?Q?7JDC/CZkvGPDPD0YhZGedVD0IXVEsY29d/t20uT2fbDLG6TaFY3mx+V9Dif3?=
 =?us-ascii?Q?Exa+A6gilBwpyiq7k/BhMg4ZaSrrHPSIojPFIhp2zJB8RS4xZzW/qlBZBkFa?=
 =?us-ascii?Q?10LOMVQ7/nsgJcJkf8+xFhjSb+GgyT8SC+l1Vrpo1uBrQpS3PDZ+Ty0zZ2IJ?=
 =?us-ascii?Q?GP+kjLmihYekn1rqPp1OdxfVOLERUaAwyLGk21s6URSMTr74Yb3Q7XKaMxlK?=
 =?us-ascii?Q?7GKst5v2WGE1VfEclRJNEjoQkpK8JDPpdgR5Re5hetY4+ZgOT8WnnIcMWbdi?=
 =?us-ascii?Q?iQ9oFJVFuRXypwFQ4S/hnM2pO1jUAi24sBapF2OIn5Q1Gq0tn0UREk5dAQPs?=
 =?us-ascii?Q?M5d4CD0w5ksTkv/uVpLo7age5FWrArGAQlyzlDUAxEgwT8y4AOXY4NWeaVrS?=
 =?us-ascii?Q?OBadGZ5Ih4FBVSKZyzQ7pBo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fb83bf-8968-4c87-b500-08dd5605e588
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:48.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZgguhwqVoiwzIVTSisZQ2EZZvvtWPceC+OZlfTgDc0PbYkKGSszx3ZINaiP7ibNjP1oVve1tvnX3djEZZoi3aPYfvAZivnZ1an7si0jlZ/GUgHjyWr7P9e7ulj/FuaR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8974.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index 0ee3655cad01..bdf437a5403f 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -454,10 +454,10 @@ static int wm8974_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clk |= 0x0001;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

