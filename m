Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077718DF6B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533586; cv=fail; b=u2XucWlm1fB6yD4kvY9iogH+Eii+Em7SljtsIPJveQWxN4lXBG1RikwiNfRouQTlEsUk10nnyry4OQxnwJCLWxxkheg+9fJDYNtj1jDriz7zyOoQ+b/AOblYt9RRwmN5ruZ9y0RUYIK+PdSj15zc/uJHTHsdL6M6aZAJEP+QgR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533586; c=relaxed/simple;
	bh=0LCmbSRjdsJf8F8hMBM/E0vzHcAA490/kukyyHLuaI8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AUvzU5Lotxl1ZuuSRmjbPYW2i/5+PZHLanJMeHd/RgSRFe7j13g44+lb+4QRDKxacJ0/6Rl8p596TtnEiRFaQApqczcLxrign9IkmMY9gdWvhngAQdgymucbRNpqgpqEWBy0MjIFf9uTeXs/0gB0zKjsONVpjetvXYeqYqCpMg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RXkv2Mpv; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RXkv2Mpv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2ioN235G55usTY5NyNfAaMLDnROz3CfysrDf6xyQYkLiymf1pDMt+c21K1Hizv43fU8KJfkskEmdys4zYvQX3B44w6qQfgq6gXR/S51xiIKVBipsFkqxPvioxoOneRKbkqIc8N60Nz1y5gB90Dl8qX+8fVl+eDdaX+1F9o+lXzI+39tT66BXFsFHEWQb1TQBLyOwuqTRbRhI1c1d3NAIUXNvYcWiDERcL467VqK2A9xN8fD/d9arb08R4PPeyySGRWVGk34lOzFgzyYykErB7asd80dxGYenRwjZ9+bc+Vdb2ArlrLh2xmx5BVrHOUqUkcT66nXX0QIi2joGnfjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdK3oGs6t3Vh46cvqTBqA5a7B9029SBeeYpHVoMJYu0=;
 b=UOep1dH9BrqhZcQXEectuD6UK3eCwss9ZdvX5HAPqm05uupcbScWz8hY4byYbn1/SwoGy9Ur9QCkRfD8PQ2f10h56fcJ63ZQ8APed11tNAYyTY9tKc3tiSNaDT5/Swf+Z153FtztrPcaOU6UsxTRwLauRVFUGHWzBL+3gqN/rgiGHFFIZUJsIO0dwpIgYA2jQkx+MGgHTfeM5YVnhKmNWox1cUAx4CRLIc4SVCy4Ze3q51AAOH+HkEtQZjFYc5BmEubUf1zXwFounBum51HfZ1LvCQuIdzR2U63Hpe5om281W9YBWJqdDsPBba8Y0lPb7vYVAhcLmS+k8DKXOvsF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdK3oGs6t3Vh46cvqTBqA5a7B9029SBeeYpHVoMJYu0=;
 b=RXkv2MpvFH/5ZjjTIkGaadM70PVZzlCdZ7V32ev+vLdBuc5nYp6PkpSIem6rNtHTZK9RZIPBj1JvTDY7HzgCNpTcgEj6yZdONfYzMGXOJbxwt28sVdt08xvXoDXcf3dCB6jILRyoHRMgqi7OuUf60GJq3ulf1Mcv+nFnjmM43oQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:33:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:03 +0000
Message-ID: <87ldttebhs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 046/157] ASoC: codec: rt1011: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:03 +0000
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c697a4f-fdc2-4c9b-8375-08dd5605835a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7uX/PvfdTzGJWPRbYRrmJl+ECN5CZdD8UaBXUboFDwbkN6O/QPMwl/Zb5WF3?=
 =?us-ascii?Q?GQY7vOvHNNnS3bcWfLjDA9yeHEt9x8s7z3L9p8VosKGSEVW0/2fWKvUfjRzO?=
 =?us-ascii?Q?wBNoKdFNs3wy8JL1LISJvG5n2WbI6wMm1MYILHzfkJXj2HHjbpSYRZvZY1ax?=
 =?us-ascii?Q?Xm8PSLYDm2YJnN037+qjKF45P18/R7i43mgxDSfB+YciICX/spBBV3gjP2uw?=
 =?us-ascii?Q?jR4kMzggpSZONJ7eSPzc2lmV+n2/+QWcCjtJdEMX/tUtt0vzdQKiuBdfUklp?=
 =?us-ascii?Q?kjb3bhYIOzeeP1kkOiNHxjq2pVToqEeDEr7fGV+uYGR+HF55/rO1phAyAVbQ?=
 =?us-ascii?Q?nwn0PhljpxF+F0NoJJt2Q4hPcfNYguPEc93u9Ufo+rJFZeASbVI2CxRHq69g?=
 =?us-ascii?Q?muLdWLzwK1RMybrKtIcR53kwzuZZdH7frQHFFDE0MWf4k5UDz9LX3kPgC8Fa?=
 =?us-ascii?Q?p8Qik84wYDiiBvrcDjSiG9JHCAq2kYptc4xMI6hjwyLXx6HXcWTST+e2zf6v?=
 =?us-ascii?Q?ob8LmU+d+UTCrBLbXn/wfCHVTDltvUcwII4HoBUNCJf9p9JYb5YaXIi+IcZI?=
 =?us-ascii?Q?0rFhngy9CRxixMmLYBznqwS5w1m/ZVZytdIDUHqYPYrGnGBWKURGJicuclnU?=
 =?us-ascii?Q?um0S6HV9oHQUDhj5TW0Cb5OX5U80RpEKUB2S1N8+s/WZoiLo7AhHw9dpoEuG?=
 =?us-ascii?Q?oqkCUartgnQ5ok+6IzZ8qQOUhaOZY+pZNyU2ARGVKg6t3F5Z/X75rqP0ONMi?=
 =?us-ascii?Q?SSpn0KD1qgq9cN9CI4vVoOiuh2q7UBODgVbR9yLNhrHabWqDEwFGXWKHvCgU?=
 =?us-ascii?Q?ut0kAt5kkwEEMP2hHxdr30pU+XzgyZu/t7r/7HHApR8ZFVIlvwYz8JCb9MpJ?=
 =?us-ascii?Q?QpiPDzf5ZQjL4rvyf6Js6bRhpKtlqnocXfnxHclE8Q3rePQpmZdA/gO3U9dH?=
 =?us-ascii?Q?cKNKF/dodJyhBJVJpZ/GrtujL5dOycziULKdNiRE/bh7/nKEIcq4n3xRTn1x?=
 =?us-ascii?Q?owQvkLJBUDgxCZmlvpVW6yfMxDYf2SrT9UCSCG7zZnJxIu+YXCU3FfgoDhY9?=
 =?us-ascii?Q?HTdwMbgzYMZXllB8FsI97xN3qx75p+DLtw2aDTa3ict/9CexxdrKNoCN20l0?=
 =?us-ascii?Q?jM6Pto+PP3LhYhbm+xnbINJ3ZHMsBuKLLsnmWaVeQzQbTSgO0SS7S9R70U+X?=
 =?us-ascii?Q?SSBHxduSCqPkoFG5pYYgjNMlrC+6Qin60g5WgBZrp+FlLe7SwflHbb0a47HR?=
 =?us-ascii?Q?JAmAr7n04e5j0nWXX2m+bMGK0nCrWHml+WIIYOr3Oba/oJg9zRjWv58FCYJL?=
 =?us-ascii?Q?l+eHqP1vn7/e75v9PpBIkJAXSscoiRbAa/3bYVvWtC62nNAtGwMJbE9KGpxz?=
 =?us-ascii?Q?Nh205yKhK64mdR8vA20PAaZ8D0yWg0bmJ8P47LryBi+VQGuvdBSrPZri4sus?=
 =?us-ascii?Q?1dnvsD4pjmiZcSk06BD4jepUX3eMiJIO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xbdWUqDTUxCydPvKThyK7039iTjqTI76Adm/GFRtw+EDBqp+lGe6F01EA7fh?=
 =?us-ascii?Q?DOyi5+IkSOo4j06NdRt0hI/iblKAdPKsieSOPPSgko/wjwfypXkrRmdPV72H?=
 =?us-ascii?Q?30HOObOlmf5W1NuyWb/xyDRkCAns/DVCu6ei4rmeMeYzPUj2+1hmlIVOzgEn?=
 =?us-ascii?Q?4yKt6RkJ9dmhyP1yBrTIu/SHDXS3FcTqf9zm85tMjHstqZNWKLJcx22OPjUg?=
 =?us-ascii?Q?QZPLTOe+7je5nczOC7hYntU6H+OG16x9UbDHUDZ7bwv2ZerVTQRqnJOa+0YS?=
 =?us-ascii?Q?KwErqE19lm39a1vuujclSak4oBkumSPxEKgjVHdBQot/0fJjAkB0t7JYfoqM?=
 =?us-ascii?Q?ByQkaS0m7BdlSEjiWZrD0yaKM8L1OLkA6i6de32qv3gRs2sqybwmeF7mlkFK?=
 =?us-ascii?Q?72Be5kPPs23h/d1D4XDRJGMlhCKF63tYjPLHA+Lak+SUJ4cGyKoL6fJkuy2W?=
 =?us-ascii?Q?YjOw4ryGwtNLPo9iKvqR3ENoPiwWDE0TRZUQAjGW6ZNqfliTjVLn1B4if5Q0?=
 =?us-ascii?Q?mrUeBJUjATN3ed/Uoc47UC5n9vt5Z3ZaIGXsyMnoZ41L3x7mp3Xc/+AdDt4h?=
 =?us-ascii?Q?DsppChHeAPHwdzHTCwI7i0+8jJph1fkaozFJKrJ63HTi1BACFWIl+kEyToZF?=
 =?us-ascii?Q?LZo47lCEoxK6bLqCxVs4KR2+PkiUQU/F7Bikw6iR6H43hjRabIr8V+6oU8hs?=
 =?us-ascii?Q?iEPUFFik9/fz/AU4UAf3vC2UhhmmJi43XUJs/aMiUvGfwRHjnB5StmW5O1yr?=
 =?us-ascii?Q?B7tbCqJuaTKBYzaI7tBXjQEPY4gXzM92CovYXH6IHoP8coV1DEW/t7IfJC+C?=
 =?us-ascii?Q?xKLKNko25R6XJPhqGOGBgO/wYLokYn6nwuL3OpSi8nZWmvUkQreOhsYeuxv6?=
 =?us-ascii?Q?9S1yxga2h5pXO5vH9ovl9bMoFn7VYg7wCPZTSNsMPH68GyovScVSYuFulB1y?=
 =?us-ascii?Q?L8h9KECUeIy4BiwGKvkE8VdILXaplmivWDGhPh50MQSmukTz04G09T/2p+FF?=
 =?us-ascii?Q?+4dfSJcMuWUrUUcie4WiD3/zw6A5Lm39vvR/rIEDPkp1GMdonPfD9iR50W2v?=
 =?us-ascii?Q?5A+bf7iIZtiflyFhhBjAqooeBMnKtSKJsiSnLBfV3iOrht+EBfQLW0i4ONQc?=
 =?us-ascii?Q?TBm5wNLYnjDWeIuSGUloLe8x5Si/4YbIV0C9jMmpqwl4QAUP2GfPn+uIUVNI?=
 =?us-ascii?Q?83ZppLGTL8lSN6Yrxip3PbT55A+bPJdNwF+Yggpz6hDqH6j1+IBUPQXeNeL4?=
 =?us-ascii?Q?97RDYLiwSF6hdQlGIahaPb4dokLlSwZw6STK6Da5UMv4mLWHbmtZAAfPq3qj?=
 =?us-ascii?Q?Y27mQyHIrwvC9tFyIh0bBADmi+ALSeXgvGUvnMUj99qZqGBcyp8ggetapQBW?=
 =?us-ascii?Q?FEg5ZJA4IIKekbV5nT+IAqhyCKTAzslq5zP0IlaCA5rSKnxMIO5S15OnxkZr?=
 =?us-ascii?Q?n3RKfC5yJ9YGTJRibSYmVo000P/boDSLhgw1+PtOKNYcua9vwElij3nMYH+y?=
 =?us-ascii?Q?f+ElupB337as+qlgeaGN4IiKckMoFg3zXOTaMx9tcEj23ahV5CwFR3hioaKY?=
 =?us-ascii?Q?LwwT8IdaEGx+JOvdwp8SYYoF+0/xyBjk87MzaJEVDiajOQsFqo6D+0IXu83k?=
 =?us-ascii?Q?tYPLxdXBBv3rCuSZunfErlE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c697a4f-fdc2-4c9b-8375-08dd5605835a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:03.6200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQDdu+qBFqnxms5ScmMRsn908LtpEJst1GwVuB0N8t5up9D1S1BhUC3SOEUz7TB2XJzDb8N58R3/Mc8m4UCJq6MLJvfCMIlogcnDRB9Oz62HT5+Zp18C74OKM59XPwh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index a0e75b03e9dc..93ad078cdd25 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1671,7 +1671,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	snd_soc_dapm_mutex_lock(dapm);
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT1011_I2S_TDM_MS_S;
 		break;
 	default:
-- 
2.43.0

