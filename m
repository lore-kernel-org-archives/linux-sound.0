Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84019CC3C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533921; cv=fail; b=fMch925bl5nThUL10sqKRdiBbfbJKAgoi6H+LNLuzSFsg/9SfVz1HRqNdRZX5XCrZUL4D9hbuRj7OG8yw1W0lSN8QB5mQyV2pmhFSFI82KVGwFgaMk7DqspaOdYbr1xwByZunALNJIUUAtSzKnm1h4NSs/Y0Rgyhpe2assYapUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533921; c=relaxed/simple;
	bh=KAZKn2DjS46EzbISiGyzFZB5KLaQ6KzfA5Qs3hCxMh0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IvNswdP8ryiLxicxboniQxNWvN3DsApKG2jnmp4BNSJM6eLrDgaKVLJjDGN24F29VBMUPQPFQ+sNqNrB1goEiehNNyaZDI/1kOTnn66P9xj/ciBwiKZrWTUA625c9BoYwHQW4eNnV4j/Dxr4uwND8lKYOu15CDYS9iJdY+qFST0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dnAFIcIT; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dnAFIcIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqdFa/Wq4zsDHmhdloZrXtAmvSQXk+O98zN9pDk/ivu7pxzfZBd303mtXYsvXdlgU8rS4FKMbo3EeZa2JdOnbqHa6gJauZz5ZtVf9vpWgLUM+ZOKiB/THmP4XdZz/5kVi1hGv4MRmpCEoy//ikjMx0oAvALaaoQlxQrodXMt+UP6mgKh1fV/zJjK9SKQ4LHpB/o65XJPphPMd5ZlHqP6ioe02cO333cK5rutUXUlR1q1ay4lgYTqjLBKsdYdYmv5haK9LLjNorbbkWuBy1wUXnLk7gVwgiRue5Oi+4Y6YfixOP7GilxQtBjHFe2edSA/CS1JkaTGRHjWN945B2hlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFitnKNpmv0lLc+etB9x1YPFPQtb7aHeNiI4+S77oZY=;
 b=wxf0xF4jWUdPUdU+PpzXxYtcRST3qh5pudSLNBfkus4iLAmzdLDPCngZPzskW1hWXe/p0xdj1BUPgh2SnqvslodyALtn+qvn34kLPzdQXHeR8voy8uYsX+65nNoDYfFKaNZKCQfweLaOwvlQV+e+QeMoxpuKGBysBw8jcO0GtpZBLddzjHQMa59ojVGo2tKNlfClT01tlf3gOwFlM0lWh0qfUIh41VDaPCfrwQK57Wf5S1g/0Qa5hrmXDasxZUGshD2HQBZEKjDWLQy8q8MK5KRsM71dGB1HvT2adiZgWM9qEON6A3YmuK/yYcyQsksKb9qlp4ev8WtKeCwAqHAfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFitnKNpmv0lLc+etB9x1YPFPQtb7aHeNiI4+S77oZY=;
 b=dnAFIcIT66+GP1D3nsTJ0Mq/LhVFlRIPMnE2IIZXOYJanY5P6z8cBNh1FFEq8/CoL81zKn9RrSSn9o60ZZRVX9vaLT/Wrlulkemw9v2ueW5f9e2MBS/ysa8+o3V+T0GXQuBsUIkUXfwPm2CGKBaGyEMGSH5sppmg5vwPtyqmZHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:38 +0000
Message-ID: <87wmdd8oyp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 138/157] ASoC: mediatek: mt2701-cs42448: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:38 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: affd337c-a73e-4ef5-7c5e-08dd56064b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H8F2LzVvPpDJjD9loQTb/MU+JKbhShv8Ln1jfaWJIaLvM2DxCUx6PbEm1qef?=
 =?us-ascii?Q?W6tr4dQ/fTJ9RQ3d/IirCtk2BzN0wdXIbXAD3ACjHzB/+QOeGqjopPo2jR41?=
 =?us-ascii?Q?VL9jTgYE+stt1E9zYSjtLckxlEiYpicBuCtqtYStSasFV6YBWBwH54UpajOQ?=
 =?us-ascii?Q?gAxxtEjkXN+txZJSHBa78hyJt3KYlH5czz4LEboNler6Et3PVFrwp1MFWNWS?=
 =?us-ascii?Q?pPrD1iC7wgnSZix0cptFuvD4wov1OThCEiUnsB0wfPnV2OthunikMV5Sp2mL?=
 =?us-ascii?Q?vhRzYUd4nkSxjCA73o2aPaBw/S+yrWGVcXVqGYn2Hzu11c/NpP5RbHMqI9lp?=
 =?us-ascii?Q?z5n7gQGU8UtNuY3YPS7zmEQrCAfVtx7NOxcDMBdFBdtIA/NYqnT7GQy8Zmmy?=
 =?us-ascii?Q?U7ol7MXaMypLicuSv97suHNDg9SudjDFQH+UlPqMps6oNePycG9RI0PH9m9R?=
 =?us-ascii?Q?cI30GDRGFvVV9MD6yEa+E2B5zRfaLgdRW6KWNkFaMcUqTdkBusNpxmzKHR4h?=
 =?us-ascii?Q?F7606jyxEf1mLfT24+QVdGWeMckDYULw4DYukt+y6z29+vzoxr97jLdzPXYy?=
 =?us-ascii?Q?my30T9XZeounXHujbQB88C3542m4EYfezwIC5r7PD8U09mySVjrvEF5XTw/A?=
 =?us-ascii?Q?JLFycoDqvBC5a8ROA/So1U+KygnmW4LvsUmoio2VnloMbuZ2NvAW9Ua5sY2t?=
 =?us-ascii?Q?jBhhpZUK/D21vySaZdNHb1Q3R71H/MZsjsbcn6Ue6cuDw41dHlhbTFBkzVF9?=
 =?us-ascii?Q?6FuwbhP4CzOOALynAwhw60oejujSoFZP+d5dKx8460KrBXT2a9X3OlDXoB+k?=
 =?us-ascii?Q?2oL+OdwHQ9ohvwPD1+eiOWrCiXqXqRkaBbVQbmVuM70a4hBiS/J8QNrIcQQE?=
 =?us-ascii?Q?WtJEyxljUqOJNxe0m9UR8shQurITyea34mKm4d+qmtIOr84L4rLdREUToGin?=
 =?us-ascii?Q?UsDfs36ITGnaD/dLIoBn/4MijMa+EDYfJmk+QLlRsrFhVX5xWHoA958fUPgz?=
 =?us-ascii?Q?T87TwOaUkSjoP129dzHp57V0MDKdc77nEKKErIIumT7vgvLmH79EOt1/GvKE?=
 =?us-ascii?Q?S4ejdXr1DVBabiNDvVZ6Crgwjjds19z2ULuseRYDBz6+2KSh58LkZf8d4QAB?=
 =?us-ascii?Q?O53wRivzTvNknPSiMwggRBTDy6uVP9mTSjshlcTxjRoomxNjCGLEr7kyC3ch?=
 =?us-ascii?Q?kfTjGTZEKqsli5joc85+K4zGWfyTBWbk+nnqFPJv2YO1n6CZk/voM9U7Eqt3?=
 =?us-ascii?Q?U7ED/299wkvS4JtJviVks7UoXzHU0AjT9h3Ouopfo5pEXuBZtjqQZfkNhd27?=
 =?us-ascii?Q?a/NrHcImJjp/9K/1g1q1+djtLLqkUSaww/SVEPisY8Z57Mfid+MUe5EUO4fo?=
 =?us-ascii?Q?l/qSihFEsDhEWonE7ytDYqk+bc0hV+7ikWCsj4RbP7UGeSlquc003i5GN/Gr?=
 =?us-ascii?Q?hgXmKd8aeTqFG+L0gcpWabk8Qhz/1ghs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wwk2YCOOHIpiybZSMzrjrw/MlSqaLart8uSvlfljM1g4Ag4IlHt9N9Wi0uA?=
 =?us-ascii?Q?JetnULYUKellYeqlJBwbD5NqHWIN16uwKAo+8FVQvL1vQJTzMs5w2V014aO/?=
 =?us-ascii?Q?eobHi+2rboeBgl4ejumOdPkk6MeQ90MTHoEu8qcvg++vfPwfjY07QsIZEQHt?=
 =?us-ascii?Q?fZks4mvz80D2KCuwHMpsB2ZYi4a5SCG6BloFXpx5xbp4gG+ug87u0Pz0j0vh?=
 =?us-ascii?Q?h3/vcfHKyScwEE8J006tZCP9mv6CpPvKHJuBK9A+X4+eLNCJrLh/Fiiy5CW5?=
 =?us-ascii?Q?EnQ37quCYICuD3V551nVROTglassiswIo/wLx6Zomj72IGoTeQv/kJOZodlP?=
 =?us-ascii?Q?qHYO8IkidJML4KZXmhGMpK7xNRJtH+/hFb3gMXjNI964izyz6IgY6BdFznGL?=
 =?us-ascii?Q?XkYEE6DASZ05u9hKqtwyZ6LM5G3ePq2VIDhdGYSlQTp0nXReug0/8Rg0QGaQ?=
 =?us-ascii?Q?/+179XlgRLXVs373oiqSX6Epzd9G3yiG/evbqgYDpCl3bLBOFpROSGjME8nl?=
 =?us-ascii?Q?6zCEEVjamDaxsr98o8UkyFoGT9pPiDgYJpQVH4qIDO/YP+2f3Q11bFvsbHNi?=
 =?us-ascii?Q?2EeJKAFsH0z+A5ZQwHvY6jherZWHJsHVrzMNcntom40snaVez+Mtt3v3FNcO?=
 =?us-ascii?Q?aLzGcGDRfIkFp0TnLZoXh61DEV0jNKj/5JrCobp9bqu4tyNAmGetALRSH52Y?=
 =?us-ascii?Q?zvcbz+QjG9IDyemYJbkNvALTDt1ggQgP6KgvIwyY6y++77KKGzZOmnXJC2J4?=
 =?us-ascii?Q?9c7gEuk80x3tOdqhycI66QfldyLh2jueI5Z84EPVfXajv6zs+xtRSravTnV9?=
 =?us-ascii?Q?Tb/xjHKLygJ+RSfp1+onj+WL8ZDtqD69vCi7NfnqzlsRVOzvZ+kGOyiENlgI?=
 =?us-ascii?Q?z+dDLGuXzw4qy6cbuyk6VEqgWBqhW84kErB+nH9d+Pybhxc3IYqGJ4ZbUNsQ?=
 =?us-ascii?Q?/dj6PkOQ1I/8eRaOF5j/g+TG6siUBEj39cERtg9+GjZnUiLa1qX1DrgKX6I3?=
 =?us-ascii?Q?nKQ/zgqHvRkhOkwhTpg6DWnIThXgLadifaRJ6Z8anqpUQ0RqeJxTheSdQ/kr?=
 =?us-ascii?Q?Hgm5acOk2aXyhgYOuAhQgZLkPROnvLQuKg0Tw+Rzf5WOJrHhKUV+fw3DnnA2?=
 =?us-ascii?Q?Ef1Ek9YO9Jk7qsTNFNipfBwSu3WQIL6gJD0vUUFSdltYM6xTgIY9pciOywhi?=
 =?us-ascii?Q?dUwK2xv+zR8wlLTwZuOIfvWlBnbpkk7xdopiVTxFN3JSwc4Z6Fxh6cmpbZmQ?=
 =?us-ascii?Q?/43/hyVicW4r3MCQh1t/902D1aGSOrb9ZLid0XrGNc1eR977Mx/CIJrZ80US?=
 =?us-ascii?Q?H8oF+ANbWllgEiKpGQ43aZ48vZpED+yBpwew26Fo/KdYXoByPVku/YfYV6cG?=
 =?us-ascii?Q?n83redxdrd0qknuCMZGravOItZxhKQYWsQxtSv2pfWSaYTiZk+dZ93DQrHbr?=
 =?us-ascii?Q?c5RA+2Bf8QAAy/iwDTVTKcA7oRVGf9GSPq4y4SB7syUFUGV9x/F1+r/ixkde?=
 =?us-ascii?Q?skK9o1jmVQezYuV95A3s5cT9yflSYhjew3QO49bHU/a5W3IbARg5fcutZ33c?=
 =?us-ascii?Q?+Ejav1D0D4eW6pO5mg8Ff+aWtUV/EhV8Y5JW/s5bfr2AmGbW8PN+ER4tINfs?=
 =?us-ascii?Q?W7Z+QTevIGrFYTQqPqPCZxo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affd337c-a73e-4ef5-7c5e-08dd56064b10
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:38.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuTs5qkWXJ9VulktIczzsfKVHz6XmaPqDW1HyNZCRo4zSOdRq6XgHs4uXK2QvWM+88KC7LL3xDrs87+U2PLVtlK6rLGnUnFCX4ceI0CdimaUE7h5M0YHvdo46FuuA1p4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 00a79867235d..778a9dccfcaa 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -266,7 +266,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 	[DAI_LINK_BE_I2S0] = {
 		.name = "mt2701-cs42448-I2S0",
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		SND_SOC_DAILINK_REG(be_i2s0),
@@ -274,7 +274,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 	[DAI_LINK_BE_I2S1] = {
 		.name = "mt2701-cs42448-I2S1",
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		SND_SOC_DAILINK_REG(be_i2s1),
@@ -282,7 +282,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 	[DAI_LINK_BE_I2S2] = {
 		.name = "mt2701-cs42448-I2S2",
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		SND_SOC_DAILINK_REG(be_i2s2),
@@ -290,7 +290,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 	[DAI_LINK_BE_I2S3] = {
 		.name = "mt2701-cs42448-I2S3",
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
 		SND_SOC_DAILINK_REG(be_i2s3),
-- 
2.43.0

