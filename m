Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55318C33B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533511; cv=fail; b=sGzMy5KMhRiTn0UNluWzXhhyCF39dgg+GBw3XWpTCmY2yZ6uEl+kvAiR39n8HpHwSgpMbPsRGgQMLAMlNnFIVEYUKMdRTa5QHn/AIYmmHHPRjgQWgPkTFDEDUTTcSuK8VZ9LyOoUNuXaYCwvB5lOsedVWOqiQ3nvgvOoP203/dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533511; c=relaxed/simple;
	bh=3rO01zNoD9QKqifm2eadsD3TTR56CFXNoXd+CSpOJcE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rEwYe2/vY2+eec+HY1z+OGQ3LBaGKEFYLWlsMGjExwDCUnA2T6ZoZElR2m3EsHRN5wWzecONodnIidtlyMJAg2M1DeEAiOTObMUmvavXXBhhuoIjQ2DOSxEd0wWkEvsjQYhivS3Ygtrq9JMusB/+F8/TCdahbKfa/+bvZexk8pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GW6jyCEo; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GW6jyCEo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7EnA7hOQCZvjNknJAjtmO165MC/1x0oIoWj2KBWuxUtvhsnfuccX1Pm0URO3C4/8ri18xcyTuH1DTccbnG40ptPjLaSlb53SlKTWaDiql21PQuQ35STCp5GdUqUlyELnP8BFOhfvpx0WrYQatxk0WDvs8F3OSM6Dw6ARD3CFmsdaivwempcJkiA0aFFRfn3FG5bjJj0M53dBttEWuNUrB6FPbCDjuwJIqI1kzabCTXT2JuKgAUFVLe8xzyKY3oEPRhMHzjjUE9kFJsn9CyWFXArgZa0GPknzNQxwWNZ5qiNfa29p9Kdiw2bRjpIFuMRgCiLPk7PuqNWfTx0dlUheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyB249nkT5Amk0ygYvSNGVEn8M8YRujtmvex+Om7Z48=;
 b=rIf+g0P1y6baUJ85dLCgQhxO0tF8whZCi7R9HGq5LRYT4Ll5j2jgyiU0Z8Kb5Vx4Y+F0bixqDUzreBIT/Lzk5IvAhqNklGgunaWiCOk0isnEioURWuZf47YUdhUfgEgfVaSLUpmDWrxiiREFYzYr2Yiv4hOCmxD6CHa0cQb+yigj2mdxZdk+hFFBRAuN2T9UCQ6xzuCr6XwOGxAam7yf0yv/M/OgMg2nHtiFezMpY5gp6A5J1tUo1gUX6ES/qZsDt872NictYyA5WFH+8gSeBprCvEQRZIz2UkuAZrsARbJ0m6iDFmSJNkw+UJdsN0QOkqf7kfJB//GA7OTI4anblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyB249nkT5Amk0ygYvSNGVEn8M8YRujtmvex+Om7Z48=;
 b=GW6jyCEo7VspVAW4hvaVCQVpO/kVRCtmEu90N3593Z5wuzRNRJGKcgnvMqeTG1i5UY4rAKXMhH5rXuM6bBGab4qbQgoXgswdFN/ReHbBVnDyuKP9MPx6OgEcdiOgUCLZrTmyu98Na7M1FRY2XtIQcUgn3Q2SI+DUnyZBjubKuB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:48 +0000
Message-ID: <87cyf5fq4b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 027/157] ASoC: codec: cs42l56: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:48 +0000
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 763d4972-4f1c-4eb9-a696-08dd56055685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sMLxm/azJ1hgzPronRXtbM2/kayjgsgA6qAoDhBD98AzSq5mzkVxnKWJvojB?=
 =?us-ascii?Q?eJOLSI+UIYjQ0kR7f4M1RGr5rPKjLHUWdbXD7mhEDz6M6b9LXyExDvL2d7n+?=
 =?us-ascii?Q?yHynXWHHDM1F9gZNhAvfmFwiCgAQs9vq2kiFzzI+nn23RfKU3vMKwPnS8Qd3?=
 =?us-ascii?Q?pcheii7c06RnDgHlBsE81TV1zHuE2mnHXQ1KpS0mFDmkb+4Md5NHTJNqEeO0?=
 =?us-ascii?Q?Yy85hIn019M31ss41GWSRZVQ16VtuHvKYBwt/NlrsOix6HDuMVzgHLB7aDsB?=
 =?us-ascii?Q?zZBGK9mZ0UksVCNfN9yTOon+vNn8gUI0E5EJU9HCDPg7rnwT2g5FjBlVtdn+?=
 =?us-ascii?Q?6fx/wGG51wHblRxEGdWGqG6RR7/GFNouUBvl7xmVL8dghp4cM7eaLV0zbG22?=
 =?us-ascii?Q?prTUlBFeXi6MCwW5sarJYhYBKmpUHx/PMufcGhpR3C9kRH+LFooUrMUdBRl/?=
 =?us-ascii?Q?s7ZF0jPLj2obsS08jMVyJQH5UN0ow8zTSVlrlQSFFI/PVj8Xm3hzAVTxgC5a?=
 =?us-ascii?Q?tVHxtKXcHKg6G4TZUSE7xlsJXN9kdnfdLSSb8+6NeWu0jFLaq8Vw7PzKe1zg?=
 =?us-ascii?Q?cnWLjMmpFuYFNCMYfG0OJ1LdVcp2/XCj1j/VejGBDoFHLU/dvuWsAG++WI+r?=
 =?us-ascii?Q?FMohRwRCo0D9WfAErReTUkeb1LR88M0jFJXwEeGn96tSvGD8zygUyz1LHqwp?=
 =?us-ascii?Q?xel7u3CxO+8ObPVGzO/emhjHWXR6/KOh3MBoUg4ghdDj29aW021wxpBsLZCK?=
 =?us-ascii?Q?xD9l3uprf0Q/W2Sf5ta3SMz1bacbO+QLgbYZzXtS5CEEP2xrPvpr/45vU2lp?=
 =?us-ascii?Q?l9wP3EyvkXsYjlV5wRJiAA+rKo8qQto6a+bcHmKVxrC1EeGMtXmvgGesDr0W?=
 =?us-ascii?Q?QkLDXkrRR63Yu1LfXgCiYKZS4zrFcD/+v8cOD49a8SfmyzZ0z/j35DEkD0Xu?=
 =?us-ascii?Q?3rW0d2qdzRnKTmPqEdS9jJm3VvZEdCTfCidUnwMUDblMz3Y+1sgbrXjESB49?=
 =?us-ascii?Q?Cnk7cLiq+cmyYQfUYOO5h2sPg5nN2FkdFZdPU+wr74ENscTQJf0qqI7asYl8?=
 =?us-ascii?Q?nQn1nOotTlfiKQjCRMts3UkhDzxNpZbLcJTACZCQKJ6n2mUy81/8gWaaOKGE?=
 =?us-ascii?Q?Tv0IMF9vZTyUHak+DusEYH9imhpUnmCbBYTgskwEwQp2W6iMf5WEdnCgXIoh?=
 =?us-ascii?Q?xCoinpmCOHYMOEaqI02POGR0fkGRDAzqvQu1lKOJzNWfC9a81u6My2kiZFwK?=
 =?us-ascii?Q?tgarpJxs6KpZXUDnsiW8q4j2FKdDIqkT6LZxuigbyo9glG1TJZVRHy6edz9O?=
 =?us-ascii?Q?GUxD4/F3Q/avv5EU1k6A5C0MXor8165aldtdTGOz7t1s6ixNTc0GIn/bmA1s?=
 =?us-ascii?Q?NORGNWhOqbfSplycbbUG5+WimmoB5HR0smDHfQsq5zqXPoskCTdoEyIXXoTZ?=
 =?us-ascii?Q?Cxfqoz7eaJOa5LZ6BbI/5Pk/nnufTUCN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zm6wNbdAk37GMU06K0ayJu1Zi2MFf/lZhQWfAKTT+38yaK//CMhGBfz2HpnA?=
 =?us-ascii?Q?rXDshW7qJFm82v7943d7ZMWrziCFBmbW7EmVj8qcRtSyBe+tmq+FJ5YhGMf/?=
 =?us-ascii?Q?ks8qE0FfPagtUsSL3+vC/N2UjBdf4W3NnuSOuYPvz+Iy7PRpoJ/lYdTw7yfX?=
 =?us-ascii?Q?PbTRDLOmxMuVgcJZbFohai9FRSf04fz0hS3aTGElhPmNLZ5BtOs1VzEm596f?=
 =?us-ascii?Q?tycfvTTs6F/x03x/JrziKEN9t2xJRBQM1eiPJurKpzLpZ6PDxIEjNcXydxIa?=
 =?us-ascii?Q?eaBOkKML/s9fWwEF3m8tkFm/8+VzdYwRSkR91hFp3Zi9Xe7Un1tRyCB0ELHz?=
 =?us-ascii?Q?dqmxKAuCVTQQQMYURbJFRFddBil50hcZQbY8gZlrCI4T7yGvIcfcr2aynFig?=
 =?us-ascii?Q?WZXHTvzs7MV1/5jDwoFjEcCVHTjvf1wjCcqSkNevadtJ80ww2MgTql0c+bmi?=
 =?us-ascii?Q?nQuVwOR4JWl6Tu7U1YHfY72yKLp28owDN0bCGGa5QcDql/+Gxt3quS+EgGwa?=
 =?us-ascii?Q?c38AfhyJ3RHgxKjh2BYKWjjWL740576mxrbKmVZKZoVueCsPJMoNqcxH9y0s?=
 =?us-ascii?Q?4H+NwsIzhbbCXlUC6SEuPMoMecdaG2VqRwN9t6fp00pgvbf7AvP0eIC+6CbD?=
 =?us-ascii?Q?PHHJ8v3vE9aJObVx1cwzfVvIY83M/Q0V4IjIz8W75oibd9Q0ZDLcvRRC1Yfc?=
 =?us-ascii?Q?uyhg0nK239oyhxJ0+zPv7CWP7dzuQQhtqyRJ5O6WOuxQAfNWLNVD4Xg295fO?=
 =?us-ascii?Q?OxwqtIbIIGLRlQFT8G9J9GdwAHSU1NpXIMI4bvDf0Z+d8VzqOT4Snzzrta1h?=
 =?us-ascii?Q?Ic/oxrK/4N5iKe43O1f5tecmOY9d6m8e8ZunAmMQbkzHpRSB5Edp2KACBkh2?=
 =?us-ascii?Q?0G55utA2Kzq9ggbYW0ks8z9455SPQ1b1l88gGRH6ZK76jtiwxuSIpKEqjhoA?=
 =?us-ascii?Q?W+DS4lFGE5t8u3o+9NU0kXTzSHAc8GGZ5Vp3EU/XvZvDBdtMjFyI4ZJf/8w2?=
 =?us-ascii?Q?aNhIAEbm6IU7QfjB/1LHb1UkWT2YvpH0QYGNat3qOSS5g1f8lqQ3QQbOq/xV?=
 =?us-ascii?Q?LaMF/7E7x24rqjicaPJVKFeuBExybCLHtPIymxu7Hg3qurcvSYoGAjBcvGBw?=
 =?us-ascii?Q?yPazSIt/uMUV3xtREdaSSPkt+lqTBWEyQKEQmyYuZ6UGS341rh1NvKrzzwal?=
 =?us-ascii?Q?h5Y7BQn3GWupWpA5IEHFNyKQYrBHgghr6rNoXtQAzmXld6ZDnTr5IPURR9xC?=
 =?us-ascii?Q?TcOHu+I6NTOztvTRfKW9IlJQGfzCppoPjesJamdvcFEfS/kq1FbBEV7oj8/x?=
 =?us-ascii?Q?5SqtNYvwHmPVXiMIPmoYH7Y7i7+u6T0B+mA1waSgWu5xSXAfRve8UtHSzgt/?=
 =?us-ascii?Q?KgjPewSMW2asZ81XJHPDyOLwSaPLxVaMTOgapkoyg4FWxQkIpf18r5ABerLm?=
 =?us-ascii?Q?iOI83IMpxfgzGAT8dkJLXBr4A5HNnvZT1MtVlFLEMmIfT+IvG7Y8BgsG9U2x?=
 =?us-ascii?Q?6IEHExyXIKFX6gEjEfc3Rjg9DhHfWxCm/yc773Kk0HWEP3aZQx29+aIoTSlQ?=
 =?us-ascii?Q?agnEllGeU35RYnxA9Y9h5uNlQKoY0m+DNamToFf19Ck8NpOvbg8QG3T8vC0G?=
 =?us-ascii?Q?R3138ZFS/D48+st+Tpul7vg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763d4972-4f1c-4eb9-a696-08dd56055685
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:48.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB0x9X1WxtiHWLLH3RmfpXPMA1YSrA+2075tWH4wlKKzen0mbmyCgF3MaFxTKUdIz6Uam6g+9+4RKN/jdjNC/kOALbga4v8Y2bJ+ycYt+uS6/nmCkwl6DOks5bVoTU9F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l56.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index aaa10c459b52..aaf90c8b7339 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -757,10 +757,10 @@ static int cs42l56_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct cs42l56_private *cs42l56 = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		cs42l56->iface = CS42L56_MASTER_MODE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		cs42l56->iface = CS42L56_SLAVE_MODE;
 		break;
 	default:
-- 
2.43.0

