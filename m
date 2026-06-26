Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB9389E13
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452532; cv=fail; b=kx2jGgEs4Tmxy8sD1OaA/qSFVgfadySGqbAPg3HiUej+X+bMYPRID6FmyZ6L6Yrt7x3hWjVUfq83Td2AtCZQCSDMUfn2BXXsKm/TWErVmhqq/1WSum5Ls4DznvIHMocJCljg/015z+vtl0V4Xn/THG6ic9crSaQLXVMRRypO0j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452532; c=relaxed/simple;
	bh=3vHCtkqi5eDNH3C3d/oMDb1G54yVcUYACtN9XTh8Gjs=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=bRvDKDjbgadLIhTzp3/hzE2lNWSmFlX+p0Mn4QVumROwuvKReCxgXj2bJYXxcLed3l55xgMok586cO7q5f55dNl1Q6F9TBiyGanv5hgm7Gjef/dwIVW/JXaHV2bWIjaU11vqUq+ZXzHSf7jYMThc0H9WYIzLbrY1+X9iBizdgx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b+ONKggZ; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b+ONKggZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIEbcRyeKoFuReUOkvveGZyfTnIKBnXRs+rOa03nP5HoYod/skYrXbSS3wrZjlhUlUmT6+CuEskMwmMm4y9EgggOyhU9lPlZOBFeWm6cZRXtU7qidQsofHO54hxCGBr+9BRtmsH5OI6vV13mEsJl8UnMwNtcCmuf0PH3n/W4vZdW7SHdik7peBeiDrWjiEEy6dUNdysTj8ukewWIibJ3p825QdzNtnB5hZ//alqCVSkzjQGQf4uqTvC0XpUlHqX2tNKXlwNwzcZ23pjCH6XK/XOfhdwbIV79yGRtP+DtJh4DkG3eqiS+pZiiODsILcy7dNRYTMFT0lWeX8qOK5MACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAFWqtY9222yNausTSvsYeBhjcV2mVIAIM5G9IxoFR0=;
 b=xTG8I7ObBZw2K4S6y5xraSSMW6AZAAj86nYoGH+vDSkThly+OalNjp6WIecUVZ/TR3hfZGaLBqxQH2/oNudfnPHIrJUZ7BNMLPCcuYrG9U8rqOcCj2uiV5PVNeu5OB2I/j/DB5TeYdy+bJX5+hNpvudVhHrGvy4dNv/gf1Q+WxbTIcxC2vCUcWbG8nKUnirm6n0LSWl7StB0wvsRpY56tLv9JGGg9dYjap2chA2a9adZbNDuah/zAlM5cmb8o8aBJo8c7TLClwqdF4cqqcglPs87mNf4ADgv0gTcJjPu0bSjYWX8Ai8Z/j14xLPnoJ10aY7zqPmqjiLpCooqpbBnJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAFWqtY9222yNausTSvsYeBhjcV2mVIAIM5G9IxoFR0=;
 b=b+ONKggZI1KA4Do4nmxqYVu4DaLtIyNSTT57NEYIVN0qa8R9HltkG0JlXOKJaLancrcpNmfCB3lZWqrCzMHuIkZ/RbBCUPuEXK+eBS0+Y2X2IdUAP7efauv2kiuicQb3h+tJYcqDxQAMtYcXH7ChInxdnE5++UyZEhACXyWksxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB15104.jpnprd01.prod.outlook.com (2603:1096:405:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 05:42:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:42:09 +0000
Message-ID: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: sof: nocodec: tidyup sof_nocodec_xxx_setup()
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:42:08 +0000
X-ClientProxiedBy: OS7PR01CA0295.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB15104:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f912f4-73f6-484a-e36b-08ded345a9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|52116014|921020|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	B/m6H2P1paaM3ogOCEdV2UVv3YWwd4VqvIqXydfHs4Z4rgP6I+MsLOXvVC4gak7GcyLld98OZ7gdgjlWtTPZgxPwkJpHQu/c3ZQu6RJRIm8H02d2V3kwibH2Gk0GlAXj6NBwYDlHLRFDxFuuyrOE+4L7AXPt0EinTWmQxrfq8DAK2k3IqJujYHSrQHLmK6jI3/9TD2dLInIJ3E/F1q/xDk7GRGEIC7sbff8H3t6T0/mfdJbbMJzsEXAf1rnS3apXHYlNbuqP2/lu1l4ZXxyy+dg8rCKvWRm6QnrE5dQSVPe3VFuM4UeCTG9uaiVQItutWLZXj7w5mRYa2MzcKbCNxZAXJJR2i+XlPZjvDK/eDZE5pM7SfUS/mNpgDpLjpcVFLKInfZoCGRvja4/N1eGemxG9o0MQsWMXeW8/JTPyxB0MdIL/Hml3msDPe3uKVBQIR0vNG9vOiRFT8KWyiu9n+bBNc4xAGRbAYgihFu0S6UezP3YOFmIjPBxLvRuyzFZE/LteAR4FodpGMx++cj8QbLD/+t868aPt9/EkVUczJ084u2G/SIU7rR9WykCK/RYcfVZuYoZoC+I17UeipRMwIwqpETz0ZoCedh8Hq7+sKuUgKPXaXz6al9Z3EKk42c/yXQs/JrjJYB0SC+MT/yy4bnm5ZNcFBSFgpIhSGv1Ra7lP4h7aM8t2lPB2Mddi7GycON7seDWlu3l8oWRE5VDSeulSh0odIH795gCS5xSgM2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(52116014)(921020)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C/aJXuQotC9QcM6ClG691GaOXl013NNgjOgV02NGndhYQ6o4qFXXL8Jk14LK?=
 =?us-ascii?Q?FeFk2MPNpqlYGf/5ZUWVQLUSrHyz7zAuM6nSUn91uQOwb6gCkTkZuFiAMCor?=
 =?us-ascii?Q?vy0IbrDmCtJyI5SzZ0z29bNg2yPWjzuCKOwEfSA6JejBOU813ZOjtZG5eBU+?=
 =?us-ascii?Q?qpAbDJ65fVuGthlPJ1Aj97FPfmkDKmOEUegHY//gaIG/Z0+W4/pAVZFWhuqy?=
 =?us-ascii?Q?9YBiqh48jG56c7uLNYrm2PaPJOrY4xS3hUcWb1pXeszMed/UAebAQAfSX4Nt?=
 =?us-ascii?Q?F1HyHyeApJDM3+0FJ9pUX67baatvTBeWS/YAsX6xL15QMWZ+FlZW1FNb6l2g?=
 =?us-ascii?Q?aYz60mO2xtVJjRvJFsMomaA4q8ubUm+CUGpfIhs85+sEDnnwrGC/S3mIWDcu?=
 =?us-ascii?Q?Rm90OngHDFnU+E8fl40cMTg4WM9NHtZbNqCWB6iA0Z2ON0VM+4XJLw7IoxPq?=
 =?us-ascii?Q?7Z3P5pMcP9UbSXb47bJKGOcj05OVA+Esq5KEvG++cLarPSLGCfYt2DvotaJS?=
 =?us-ascii?Q?WfO8nJJ8KqnejVLbfrxZn4ayJTcicN8QR6S/AcZt9aVrW9s02+7yhJpFZgaN?=
 =?us-ascii?Q?e7m39IvgxL5L0hTSXLcbpdkUWm2qIi/m3qdtwEaJysOwUPyLMCC04P3GcvWT?=
 =?us-ascii?Q?jYRECu3e52MQWFxH61FNCJL/966gthmk3Vb6dEB+Uvryhhu6Dfz59mdQLwea?=
 =?us-ascii?Q?k5AC7ZWVwTl3kN93tLb/wyDVKi785usfMiEEg44kws1TfTi9ptqNOV1vt4oo?=
 =?us-ascii?Q?Uhwc6EhTDGThucmdLl/wZSsA69TgbMIaZ8DvkwYOko57DBSznrrT7bgQZHjf?=
 =?us-ascii?Q?FElUad6bwv7gcHJnEwuEMfH4x/uTcUrHIConMp7X6V3+IzLI0e3K/qaYcfIY?=
 =?us-ascii?Q?qL/PLJCFRQLK9H0pos/H2pvDgEM0eJDpQgxDeVg07f5xFB1NEDQyYlptSMV4?=
 =?us-ascii?Q?PHnOCwVA/0jYieyrn7AwoUr6vV5HkJow5xuLNmD+6QdIpTlgZHEnyR4DmeNR?=
 =?us-ascii?Q?b3057ocDPnEuqaCISSIryPhCWqwJAN7zntwZGSvglGut8f96MIrwOa/PMBip?=
 =?us-ascii?Q?LwN+4QKAzNyRLwieM52Jbl8ZuZfoCUkD1CXCiNnHrxPjV2N328ASLxGRIPCV?=
 =?us-ascii?Q?G7fyMSuoU2uiCSfLbMI/Pj8eyEeXpPgv1/7Y6kp6YrRJ1jszMyZR3yPIqIFT?=
 =?us-ascii?Q?wJ67IsewgrD/w3+9y7LVlUpgD7tSeCHeDN7y+h/7U3rzaAiAybvXbn6ce/j7?=
 =?us-ascii?Q?UqTSCfXvcZkdtue4D8E1KH5w5fw1cxBG47uyOLQP7YaORX24HcqVG0CKNBFI?=
 =?us-ascii?Q?Gn1zq3cnt8LFEvg1Ug4JBf0ouaPa08zFVpG/VF/pPjwFWq6UNSBUOTxEmZJ0?=
 =?us-ascii?Q?pB4ub1/MSlLL3l3OAwd0fs2yOJ8UJfwCZjxyOpS/gB3vRBQeM07vKvJswjvX?=
 =?us-ascii?Q?wCne3Pw3h4WtX3jXYN2j22KzBoHMzU9O9Dopf/t0GyhRxGi+hobKn86MOY0+?=
 =?us-ascii?Q?XG9sjzFRMKnDqZDcCU2+ArpTYTAjnP36ffmhgbXVQFONUV2uzDJ5HckHCDvO?=
 =?us-ascii?Q?6py0MRazkFiZDeC3eZH9pwT8baco+5pKRI/ddv3uV5Lsr+wGi8nPTvx3KjKb?=
 =?us-ascii?Q?t+TngyfhJHHpLa4yYaQvNbZa3Khz4oraacZnSfooghRKiCuNZfYOOvHdArMk?=
 =?us-ascii?Q?BInnl059gAAM4CUVj/B6P1EvMq/plUt42XKHz2SiWQVtIEGjf5UyCVQAPISW?=
 =?us-ascii?Q?MNkntI7nniejl4503Fc+zr9kNlQYTgbMOVlJJTGfK+uP7mWTZPtt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f912f4-73f6-484a-e36b-08ded345a9cf
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:42:08.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UptwAO/V9sn+GLOI2t5/hLXHv+oofu4rKtigWLAgsmSEsbD1FcCZYPlzVxEfIjvzNYZA4q481Ib63c+XAAiv6OMGbOLnHcfdKu6byCCPf9qVF9lTfyZnQZVHCf3+/IC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15104


Hi

I will post DAI/Component/Card capsuling patch, but
current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Kuninori Morimoto (2):
  ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
  ASoC: sof: nocodec: tidyup sof_nocodec_setup()

 sound/soc/sof/nocodec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0

