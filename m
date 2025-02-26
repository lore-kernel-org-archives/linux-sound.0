Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D61922DD
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533725; cv=fail; b=WtHZ4VRhU8Lxj4/zdje7cAAbPMeHDI+8JNJOvaYWhlkJEwVFFMU98CGfXxrNxJExg+GLN8POzTJLfWFuhMA6Q+XPJLAU4spln1uP+y8iYzXnYCKZdAOVd0qsMVwH+072iP5nPC1wpsbdkd6Nth11HKCx8WVLrbzB40P88wLVzvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533725; c=relaxed/simple;
	bh=5N3GEQ9iBzyJt4a8UT00lULZJPeU3tFshsS+56CVhPA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EO23JhxykyK8Ev1aLwogO6Kq/0jFPDqspVjj8Se/sej/1d04vLjKPcSMQF7uPfWl6c73C0iznUoNu7Np7Xt4DOGo8WZQOzU21m4y2dDKjfGqUP5fq9IeWi2DuEooQUTXETr76AGuRQAMxqX4ImMZtJp8D5mdRIwJtfNXuP4yuO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ne0LBwi9; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ne0LBwi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU85vla1dX9Bt1cw35omK2PgPqw91GCpLHcXbOQtWw6y1aVy8wxmLAVtG6uqqnXM2OprvT6dSZlyEpUCeYBQSaXQb1GU2/bN/r0KSL7mNs0NOHHUUfjEKKlwzDMqrvj854jL3qua3tqYPAkP4J03aPX7NmROtTPjLlbXD9VK6Kaj2DroRSKWmEMU/xurwejUnoaIkt3LWFftZYKeMOqPutm7pRPKvANsoI8o4NrP8Q1thJhiUQNXx+ejV2nRF4/m5LecSW0kLrYPzUBHWEevZraPZtEiBAxtC9Vijv2cPtswyduy+RMXgglmI3GWUGwxbRvfircxUBS4upquSWyF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOHBlRNTir+MWizPWEZzBEima/95+8LQY0wsumircbc=;
 b=q0zN4HE0nX3cTqEMdheUUVYIoZToZJTzrdRnyHQBiVK6Qvo9yHVx0IEexkXy7N0DIs7aaplEfVqVQuLfcO8Ik5exx6r+jIQtvvxtOzjNiq1DvDLcow/BccBtmRqxkV8UWenAsQaB80hQEXusg69TvTcOwg9AZ5GT0fSMJzGYS3iDB3C9vxVNVCCOl/3eQ2qorDKRqWX0z4IKDgdOF6htno3LCT+0ygTvZQ6prPZ9GWdUwVZeVIdg3wpaGlut1tjk+d0x38LiRx2AT9MakDjt4pj7Hq7aoDsXWWYXfQ7iZZzKhXGHwK4rHFAbQV/+0mLyROA3tr40jvZSHEv5uo4bUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOHBlRNTir+MWizPWEZzBEima/95+8LQY0wsumircbc=;
 b=Ne0LBwi9owjlBhrVqC4l2B2zWry0pLGAndod6qfcZc3YO0Uf4aj/g0wTRBCE+B9tGsFMwLvJweDsvX2ZRtwC/z21m75cg6yPCHppUTSuUI+Yo5klXIZaIHmMkjVyjmhSp4+pk+23V9sfKzyFjQ9TN6YIbHfpRmZaJbRIhpuM61k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:22 +0000
Message-ID: <8734g1cwti.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 084/157] ASoC: codec: wm8904: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:21 +0000
X-ClientProxiedBy: TYCP286CA0231.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: b9092e93-2ff2-46f5-2dfa-08dd5605d5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AAXmDDJUlagU4h9i9v2D5+ulnDyDNzpDOvgT+T3gS6ls+X7HB2fPNIYsCkGX?=
 =?us-ascii?Q?q6GMS8T2KWoss4A2wUFCqsBwHTUv9NBWvFtHaFJwMTLirqnkHYqVYHJxTFoe?=
 =?us-ascii?Q?OyU1zrMDoNFoz+ihYRmhgDXW9AceIMftD5zzoYvhCWR62q31jrjnPSxHf9GZ?=
 =?us-ascii?Q?QiMRg1usqCa4rBwWgC1qRLEiwSbeg0HOV2+hBgHsh3y9l/cCCJA4ahS9SEAm?=
 =?us-ascii?Q?MFvbnCfhW+Z3KAzFDkRaIg/4kHKEFZi+WOI/wkoLTGSFA0j/h645WkcMbYDq?=
 =?us-ascii?Q?azlRF6HNUr0ZPgY9EdjLOffM6RPmB7kgLUsUtPJwKn/MKV4OnRQI55kI+n+R?=
 =?us-ascii?Q?hdse8w/lgcOhKnjSTjMsUk4PWi/IVxITUd7NqihOAnIU8QAGWtfL/iS8uPt/?=
 =?us-ascii?Q?wjP1W+h94IaeRsxEzYrqkZQhiRd/LHLlHUIDwqIwJa69q6a4TXkIZDyEvzm/?=
 =?us-ascii?Q?ipTcYkKmizjtLoSxWyvvEoOfnJFsbv0LXPj0L4lcDXw4OQNkkqOycslMpEnq?=
 =?us-ascii?Q?rtpfrkw5hxIB6D+9h8I3EBWg3NLJTJhuc8qB0vXfWSbGvE3BLRxa/dcmqGZt?=
 =?us-ascii?Q?8UQU6enjjcdid0imSoeTMdqtUtMABUOeNjjIbSKc3nR+1/cULcbbuhAOZ02J?=
 =?us-ascii?Q?+HVlgHD3OfTOU06vRSDLw8xzkH33mV2VCOwJgenRCEUU2SsJHQs/Oge1wdNZ?=
 =?us-ascii?Q?McucBSBjATJIqX6qpqscDsRyPaiL5hFAkXn+caG/Sw7S79x7VRHhbkthA1T+?=
 =?us-ascii?Q?nPazJZDvW605vrITK7t0GXjsyDPJ4IIr3reIkHEexlxcPI3AvSnC/VdZrw5t?=
 =?us-ascii?Q?R9O9H38ny/2K2CBCCAkNZg1JjZCgY9hfx1jAYgBd83JCDXFBznmi1a2Trk+K?=
 =?us-ascii?Q?Ra1BxekkQMb9joq53C5/effxWAj+yRnBd+RRhpIiR5s0TuzDfouSI0vmqsKy?=
 =?us-ascii?Q?7pzPotzsM1+MBGPcshqYwHWc7IYqL1H604pHhHqfEfxLmVpYeMUXKNUruYvJ?=
 =?us-ascii?Q?lxvYFpAo7WMl9Xi4VOn7uZG3Gelncuxrd0ELOxY5idGfC3QepwmE4oApnagB?=
 =?us-ascii?Q?T8/Tl94iFw0kk7KzblDdFRwyT9rvBkHmEfYOXCtgxGBC+6K2X4/idzVi3umt?=
 =?us-ascii?Q?tFeJh8BV8woKOHQLCFmTVV/hz2zNHHhImm29Pj/Gy3n3FqqxiyTesXLzlyT7?=
 =?us-ascii?Q?TXtY5sJQBsdrvDik8Gm5ObouGcImqZxRd/JYjzbQNNHqBmwx85xCvvngcdKy?=
 =?us-ascii?Q?gTILRGJFmdUSl+E0YM2sYkOCCBDyPDMOaQ85yErIJVYIsZjjT412c3Ys+sdd?=
 =?us-ascii?Q?WdExWnJj6VMw/TIs6gUS3kouOii4TlkwWp6TZOGXl5ItirHh+es9DJhpyUUA?=
 =?us-ascii?Q?plwKYXBcXaDYYYbL5N6/MxAQwCsj+yCTkdK83sPCv71MnkQexKxvDm27FXZI?=
 =?us-ascii?Q?69q2//Hzs1x8qSbKQ1nF8NB9g3xiaF/J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzLTQgEIWi2ADeqYFndm8O738UDIux7tJpmtV9JqN2TDilXJGuG4ItRjlTAJ?=
 =?us-ascii?Q?kQwrWm466uw/0l2kF/jKEzhIxcZ2lVqWbiXyY77srYY2mH4CyxFZ46j4SdUt?=
 =?us-ascii?Q?Yyi74P7e5feGhJAsaH4tpgDIpTUQvpCyodiAjC60iz2nXIDfg6E7c1qFR2sx?=
 =?us-ascii?Q?9FDLdDxaH/SpJcpDcdjSfBAYuGSvlNlB+otltoHvUSs/XSkrmoer4++n0+L9?=
 =?us-ascii?Q?r/+uChA7Ysgivv6zmaioo6dHT1NfYr2dN/n5ialnf/ZW/WgaNcriVswxtwKy?=
 =?us-ascii?Q?0SyEC1Ry1sZ5xix/kITY4PFYuZ1LgJ0p2Ck/Hk1H0vY+wfu3yLuPOzWCbudq?=
 =?us-ascii?Q?7JewgmmRlhdX5PAhnToRo8C6AyYTCA4JZSeS9YpPu+Jcq+lcJsBqGBhclkGO?=
 =?us-ascii?Q?XVxpMETNFdEjzLhR2Y92S4CUF2dNQlvCkVIFIaJSs2dROOk5jVpgySmnQgq/?=
 =?us-ascii?Q?W9esP1mTUgk6yvfINGb4RcuTYA2naJ6JSW5+E4x/LlxYQz9sAkZgAsd6kBUY?=
 =?us-ascii?Q?nGlfeQChmSCkILx3ULW0dg+9oTNXeTrHtCT6i7RQE+xr+KvwKtxv7r1orO3L?=
 =?us-ascii?Q?1LTBjRC6my6J3UqZdPmzXvJp+BnbotoFFMLzdu7933h+fh82vCizhz+vF/1Q?=
 =?us-ascii?Q?KcpoFKOi+MwHQ1bevGGSrjZV482WeUz2NZRyCn7f7FUNoahU3JVBS0zpJQ7J?=
 =?us-ascii?Q?SdoGfklMkoUONISfoLqYc4t5xpuXeiZOtYCrtfpOdLGGicKL9UPCYDZWNwQQ?=
 =?us-ascii?Q?h8PA2UdwlYKxsY6luHn9tp+dx14ZtyHS0y9RgSWrLozt9Wsad5IVkoaiebRS?=
 =?us-ascii?Q?7FY1elnTxd4YOha8kPy/bc6Z3Q71APNSIhx14SYKflEoC0mxHzUDJdbQv0D6?=
 =?us-ascii?Q?aUpPO/WZ76xCI8wHDzuf2FhPJXdRrd/VjX8/NOnTQOkEV9YRs4IHU3FIxfZ+?=
 =?us-ascii?Q?S6yyNN908QSlU4vhGmtgd53S+X+caddfgauZ+4gSI2Njjvwb8/TVYjer5NYU?=
 =?us-ascii?Q?rmqDf1GdSc1HxSPOi0YmO+BbXTciCBYkVl7B3FR2TLkcppk6S4uiPcq2M5u9?=
 =?us-ascii?Q?t8JBxmk8b30UGSDFttS8LtI/Vi9dY6qYSoSBuYrNEAwL+cCfUwOKVGu0k4/d?=
 =?us-ascii?Q?7/AE/JCSlTTiMK0ru1hCLMwM/yr0LqUIi//Cvl3pbpeeo6Acc/HrPqwqkPfN?=
 =?us-ascii?Q?ZHsYP/dI+9s0dUcmJw8ztQu4FZ4Wdgo5DEQVFJ0Wzi+4w5wMH1VIL9RAJlJL?=
 =?us-ascii?Q?c9FO7ZmyaCswPiknOQJiFR+CfT2EHPbNZyEV+ojJT+9CtuJvJ/5z/778Cj1f?=
 =?us-ascii?Q?VxnrKpmiU8xaUVZPjVKdaI4tnNGMm/S1IZnvurCDI8skJLhbZUg9L2bK53rV?=
 =?us-ascii?Q?CRuHIipJJsJirS78nf4xR3Z8+prXTXfcpCwdyMw5y2H7Ldp2KkXCwuH9YHsp?=
 =?us-ascii?Q?facewPl7x1RAuoMQlOQzYjcyYEKyLVpmwS54WvRHjMRDx7i0oHER2vJH+nmD?=
 =?us-ascii?Q?cLlkxnLWI/WZGQswnvBJMETShlRyn+TA3OI51ic7lEgiYdI67l1sDwtbCryx?=
 =?us-ascii?Q?vPDt8NuhNIT0knswuBjXqE6ndwSqJj0JcHpfKWQQ3e74qHqeTX7ohBNCgbDk?=
 =?us-ascii?Q?kBdVv5qWm6gT7/hiakgXss0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9092e93-2ff2-46f5-2dfa-08dd5605d5df
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:22.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BG3IhXDQi13dXSW8JkonrjbKgqIIjjU/5saPpwgnEmS0ztIx4BOSuxEuBAFRFlS7F+THyvzhmyAdiZGhevx9waC7NGbiQrsYf4KdwKoKDl7rVhu4RHX24zxCxJrxypb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8904.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index aef82532f8cf..207d3bd2e729 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1424,15 +1424,15 @@ static int wm8904_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int aif3 = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aif3 |= WM8904_LRCLK_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aif1 |= WM8904_BCLK_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif1 |= WM8904_BCLK_DIR;
 		aif3 |= WM8904_LRCLK_DIR;
 		break;
-- 
2.43.0

