Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3232B194C8B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533817; cv=fail; b=NAbU+T22864zzrUMSeQjSgOVOorZ3QEvwy6UqzehB197TCQEOaTwaE5xO5tgr3WIvbKv3nSeJ8IKcMuu5LCl+hbcSsfljqeABwuoEZ74ZiSd+wkfsADm96VvOV2sUwg6pOKAEzMDWV/wTE6LqzETSO9L5l1WAXIUat/RttnmwSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533817; c=relaxed/simple;
	bh=XAp8GEshTg/Pro9bBu91qGuojbZRw9hXJfl8IknOXNw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hJtZcxrdZzrvKAxpRwYnTUSNWcwtrDPO4MdyxnRSKXarAHJNYsNouCXFfYkGDCQeeXcMigGk6NOY4uoO2/QNwmt3LIFV2WptQu3VMTQgHo1MM+hkbMl7vYKJiNZJuZi5dyJu1QubG2KqMhNb0N/0y7zXftGzbc9Fr6BPaf3TXOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Yv22C6zM; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Yv22C6zM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVyVwRel5xNuzgUak6krbyteLYaFbm2P89jMS0JgIgP05IytyWUZl9mHjp73dI7aCoWcjq9PnlDYjfCfbzzflv0MCpTsAtCPgl7EhhZdyPMLDZUV1gcXDxTcMVCjTY6AtbaV+xseyEAQHX+x0QoZ1fuKMnJzXS8rGLJhzC+Qss5PdfEI/cXMBxmiVgrmNdNVvNjK0pjDt8Q4rnZ8Df2oWQRrz6iDYuHQFe3eAzYITh3I3M/F3H7neZwQ76BuVrluujiquwLl5CC1sezfJO576KSKGJsbH51eHd2bSM+NYoS6lRtaGBVLfOCgyB24AHiLJq1+L6upWEg3058E85cX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTQPSGG6f6I6mh9cdVDyFXNPt+szZGPQq/HYhLtfg3I=;
 b=hjeimvMbP4qCRqA2DeLbIS8v2miDMf53qG9XCQIenjgUOQIfpXq2TDsjnUc3dqLbPFQnvdsSX3aGxGwpUey2EGKQcJaVEa6dbFbhl3jENUM505d3sXHxL76W4uk54nfb1us5p5atDp7U/iKr7LmqkKRSvQ39uPWspsXnIkIZySvRUyltVRRdMVZUEHsOIqkaZl5H07l1ZqlxhkFjQEec24tKF6yGWzIEisUrSIpLdTXipDbJ80GFw5KJoEvztdu2JtsbByLANob4lH9y5z8b4C6zbwN3jBGmq497t3uxafUF3/754hEARLOANoTBrb1e4dLaDSUDOtcMR74crxKlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTQPSGG6f6I6mh9cdVDyFXNPt+szZGPQq/HYhLtfg3I=;
 b=Yv22C6zMI8LkedPqz+Avb+yZc8T8R445ttYc4b5V79VKhCkGPgbPXGSefoxqPxKSCDgS9Su/wNU7EdTn/qqGKxSmrI4Ncc7I0v1HEebjuMgLqKMWKWDMHPAXPF30JcPUOGA60e66dGpQkKgyHYqZwQOHOMyfnZDIo7EeGJfS8IQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:55 +0000
Message-ID: <871pvlbi6h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 110/157] ASoC: ux500: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:55 +0000
X-ClientProxiedBy: TYCPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:4::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a3b7fd-df11-4402-d6a5-08dd56060d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0eFFFvluBbh2FHy+xjwDXfUeqSbcrtKLgxbdvB0caWKXeAdh7xV8581NTIY2?=
 =?us-ascii?Q?fpVW7Zs4Lim04mhD4kRpXvxAk5dMTwHqFLt1+ApmsGPW/Avk4/3h5BvwVtrg?=
 =?us-ascii?Q?AkYWL8j8BrR+gbS04vxmd3diRT+BJTvb7naN48jiL8toS99f39n5S8AitPxl?=
 =?us-ascii?Q?5jsn0Tg68a1qQUjYFMOaTAaRB3qgiqyQk4X+n3R79eqSnPNycMnGZoNGSzuY?=
 =?us-ascii?Q?6HPyGQgdRWFjxT7vb9Bwpue4unaCeK1MFLLe0ULgZUJhyDLXnusXO7iA7CYf?=
 =?us-ascii?Q?tOi3vVLoSljpfklkrqSw0pFez6yJeX56rhwmvaM+8rbqMcXHwKfVmB2uXd2V?=
 =?us-ascii?Q?aEmBDLr7M162uiii41hR6Jrsy9I3KPH8JVZBfoawgbvaB/soxigH1dm9npxH?=
 =?us-ascii?Q?YOwXLVj01ULxTlIcUKJeSiAcJXzRhKZRp8MnUNS/gamuw431qvUvLJ+1DpJT?=
 =?us-ascii?Q?Lrv5Fipz5FfjioOFXCaqdUuFPxnBS9rvDFPGRirYvfePXLyZf8HESZf5jh+V?=
 =?us-ascii?Q?h0hbjLzhH3nHQWrFDFCN9R5nv5TdWb3fikwD10/5ERr6v+WlTivK9+TtPnm3?=
 =?us-ascii?Q?Gh8MW1H9N1PY0HwnvyVnptJr9d+iDqukEkxo33vQTstqhCRnDTnhY0MCjio4?=
 =?us-ascii?Q?sGquCWckWS9RvwbdiJpvS5ROXpMo8FLJ0I3yC1ynZhyq/aDvymNzwv/VPzh7?=
 =?us-ascii?Q?cLvyw0HILinvkgvLGTB4R/HztsL2gQ/aqckaFTzTwibYKcoqbONoKZVNENYN?=
 =?us-ascii?Q?/tFNMceKh3hPCa4Nr6HkBZj7B7m8orXDDIDBK5I8F1Bh4lopZZYuQ9yfS4wz?=
 =?us-ascii?Q?SgH0d7cPTxmT4lAWSbD4rDN15LhES11OfgpWfKnau8hC2pzkT+gweOkN4Mnu?=
 =?us-ascii?Q?SZu14NYyzTzPPCUcmjOInrTyCq4QYp0sW2n3rf84bHBsfMLky1wlosTETY2j?=
 =?us-ascii?Q?8da6NMFdzsTx33vyUaG70ZxSMIScFa1myVvuqVEfowJ2RaoxS9FhdWygmkyT?=
 =?us-ascii?Q?H25HCr8WnxEO9KbC19z+IEJ8FIFlCp64HPDwk/gridPjWA3oFPRzTGzbRrEt?=
 =?us-ascii?Q?WjYrtGUOhwNbMyxY1w53y5GT9Ng6hEtcU6a+9Kw+5ROJmpYgrtuoF9w4jSF0?=
 =?us-ascii?Q?wMQWx5NzptkjkVYGPNInnRx3VftAiO77UkgNszvNwqX+VryYLCEtN+Wb6/Mq?=
 =?us-ascii?Q?MNaKaWEvAMJ58nbfWSMvb9D7IiAQiG06xzkyVf2S5o/6VUKPHxYu10S4m5XJ?=
 =?us-ascii?Q?T19/uSDKeImobdQSF6MExm4B3TwaWtsgvInyE0j8yf3UDjKrLWESjILGTZMU?=
 =?us-ascii?Q?TlXzPkNz4kf7IvlDOfMCe5cinoi9mM9tZmi84H2SGaoa+BKCnYd02pVbDQPk?=
 =?us-ascii?Q?6mZZxQ5oonY52b46W/VdmjwZTVNq0xx5CZ5Slppr7wKHPyxb5ah2ZS7FcwFz?=
 =?us-ascii?Q?CukVbxQQUiD67ijbGr2RetO1whz1S3JP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0EpaDt0ijgldfnxyFbhrxhzyNUhRNhncMZzhWChP6fuFkHaCrjw5wHaPcvNL?=
 =?us-ascii?Q?imtYLrpu6VlIwulPZ+89dggN7WGc+sy6wumnJ9U+cg8MkPk+cZQjd85owab+?=
 =?us-ascii?Q?gZzVXOqDI+GFzmkFZZaFkKvnmFSCkjBInsiXCjfyD+k/lA4p68nyfzTp4arX?=
 =?us-ascii?Q?a1mPFHF+uIrcuknf55HNFGqrqIadeO2IsQqeDxU49HHB/aURWGM5JRRpfDZm?=
 =?us-ascii?Q?ZGGZnj7v/L29x6ES7/IlJ4rl9grLT+iP7LGp6wHhmd84sAxkBIiCfvVm1zXf?=
 =?us-ascii?Q?MKGLJ499VnPslOMzoXjzqJUiNEMl9gIo8zMrLXI/cotU6w/HEcOQ6a1vHuuJ?=
 =?us-ascii?Q?3qNWG1ss6+yuxXRIylv+tY8DYOcdHpe3FdvuzlXMSjCnbMOvqxQo4m5Dyrwe?=
 =?us-ascii?Q?ftT/Utst6SsKhFDCFjpif0rYNbxsPTKIrz3uRZepb2x63CY3R5r2bop4366j?=
 =?us-ascii?Q?N1aoZXcNW7kj9juSXLCA9nZ/Q0Mo2Djg6Q4z5w8NzXxFFFTk6xPUkf1fA88O?=
 =?us-ascii?Q?QbqE4QYwgJ5g2tzovFNs6s23nI+YEYf1KJHbPjx1J4HQiOXNiHVbxNVHwNwp?=
 =?us-ascii?Q?luk+7yJTgowsDUv1BPNvq4jrEswz8N4DEJBJlFJQQGtEPE2+uiLw+i/dJ4bd?=
 =?us-ascii?Q?E35Y9JcbcYHffmHi5FLVdweXkSjkqeNrviOMFDKGEGSoXQUgck7UZ5pVyZoa?=
 =?us-ascii?Q?WjkmZxpdq232Y6Mpk4ZPSiKB4GTbr5UikNMcFlBSpxr4bPoztGsoHL5+iLL/?=
 =?us-ascii?Q?1UwwqBnaxjriN1S0Tl/PfE7eG5RQ9fo+Bmxl+tn1N7ry4tUOqbuD3aE7lJO+?=
 =?us-ascii?Q?4+uOOF90W07VkqYiIAo3bFfv+UpI3iUBttZqeJizXtImN7L85BEaBIK7d4d7?=
 =?us-ascii?Q?ybYgqOIPZDseMkCkBfBmkAMNKuOfL3omJxoaJ9unrRZgc++toee87S3W8vv3?=
 =?us-ascii?Q?/p2lZgv0BJ9qEYsIG1EH+xqysEh6L19Gff0VATrKd2XRHhxFGX4SzRMEdUXf?=
 =?us-ascii?Q?26cjOhV3xNfDrRepKsdYWxaDu13CTfdqS5vHUjuvWUlk2eFZWpFXHKJ+psoO?=
 =?us-ascii?Q?Q7tA2tC7BzJgb0nJSEVy4bGuoOhQ6RmRvD8x5msX1V3TK54zrpL2K6wO3HJ8?=
 =?us-ascii?Q?NQKnP4VrtO5B+9S8AQfzxtjMwKeZAwXc/uv5MXwhg74MeKsa9Xgru10ndJRw?=
 =?us-ascii?Q?uh2VaWW0uHuTOUls0AEzSi49ek8Etf973M3F2DnuUgZaJt8X+PT+4oBC3d8n?=
 =?us-ascii?Q?yAtqFsZt7rXxweOcTbA/Xc73KbCpvDM5eaItatVNf4lvJ/12mnj67s165CJA?=
 =?us-ascii?Q?ThZuc6h74SN2sgbfk+KSXlWVUGYDKyai/xakL1X+y761Hv9ROAaonidZoZdj?=
 =?us-ascii?Q?1tfjDYu6KxmE99TFq8RZWjMTXeqEwFVGt8/aUjyn4ORFZ2aoAT9Tc8vSSzG8?=
 =?us-ascii?Q?Ef5Xqh6RuLtR+6u+Q6uKRnkI9fHesQJKsf1vjgPRN04noTVF5ZaRN9xkrlmh?=
 =?us-ascii?Q?l6nMSp33R5PKsc5xwIfo2EZOcOrFrTHF19ZqPVoKsObHY2Lb/nU9by+GFWmH?=
 =?us-ascii?Q?8bZv0zM9Da++bn1hRFCHQg6lu3H0Ls2yxvb1qk/NycTdYrsiL1kYha3UL8sM?=
 =?us-ascii?Q?yd6mHTzLlk0vPmC0L1NdIVo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a3b7fd-df11-4402-d6a5-08dd56060d78
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:55.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTE6TQRJ512yeT4eO4OvUFCySbz40TWSZR4Kzp3qnmQ1g6WkOYaz6AZiDHQ9uuw9P7as7qqH2eFLErTqv8nhjwW0IbiQWFDaeWNEC2WI9XZxXQcLvpI1OKXeo9LSa+nm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/mop500_ab8500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 710b6744e013..5246f73ef12e 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -275,12 +275,12 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 
 	if (driver_mode == DRIVERMODE_NORMAL) {
 		fmt = SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_CBM_CFM |
+			SND_SOC_DAIFMT_CBP_CFP |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CONT;
 	} else {
 		fmt = SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_CBM_CFM |
+			SND_SOC_DAIFMT_CBP_CFP |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_GATED;
 	}
-- 
2.43.0

