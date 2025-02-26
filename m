Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8C18FC74
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533618; cv=fail; b=b+TxzgSZvygklwJLkqdeJ4KrkadxORQnLKzt0+Rh+iV60XywnmES1PHO/mxI2o6IQyhLTZYn8beLlxeF73vOnjVRLVBcya+99MhGRsHzMqmwYrRHxCLxsA2ZBXT8uggJ4BWGVTjXXoS1RKfxv/VVfOS6WF9CE6AU+afQoHw3jeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533618; c=relaxed/simple;
	bh=1aqp2SPZeEf0FZCZQTfwryAxsNvYwgeS2BIlotn1iLg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jC8tgCdne+XWKj+N+9nJO5GGNkcV0qkDURFVALBj8K5wk2a3ZipOwjrzDEUm5JhtL+Qziy0+jBfUVQea3jkToQX4YCXjdAuy8EFW1d7R5OAGuf8tjA1OpsJWx2R/69/WuYAAlH0qdsX5CGcnD3jhYja+QTbdN2SYdenmK8AOT6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MBldIR0R; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MBldIR0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1J8A66cVAp1ZBLB90FD63KK7ANex7Cma5y87xBj6R46olSL5Eqm+IutrU7Ks+X5Qkw47LqHAyrPY1Xr6WjE4j5n2OqgOeTc+cqPKypn/u8+ZOYl12odr8E0lwnO3K+S7qoC1kDGw+IuhELIbF9Ig5GkKhFW0GBS/mNwSu1YphuSbxIICYWJd9ctKZGJAuK9nqJais6fa9FubIECkwtdMKiG+C6XLGauGqujuDqLn2EcFI2IleOyj+pyVu5rSebzCZYjDBXjP0AIkEdQQcBapS2NpsUg1TYGXPsTuNZ7RDeMqnw7j6SV764Yj5wgjrOMGkJoa0F0RU5/4Pdv0MMdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6AkVAF8AlGdsDjTf3N7a5dArA7JbiJMN0Kvo8AwBdI=;
 b=qtcTFaaw1rCBdY+5wCHsCKnv1mcKRgwdg6UeAi7IdyThXVQvjewpqxiotOkCVCYhrXiKcn5B4WVWj6sySy/yWxqLaByob6qqxKE50bEoz2sKIzbMw9A2D2IY49M09XyCHjL9bu/C03jqbe4xw+L43Ay5yxXX+ObqBSlOCTohPmE5cWVwmS+TDyOmOxpC5t7GkZk86L4YOF9Y0HNtngPRDPTPWk8LIeMRxpJtypM27QgwZy9RJMOmuPKOXgtn9cYKMNibSY2sYvKPXgn95njxb0MwFWEBC9ETiSuhbMjg762uPlZvSqN977L/j5ZgWb2U/mdAnFWLwYyCfWqzuZ2CCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6AkVAF8AlGdsDjTf3N7a5dArA7JbiJMN0Kvo8AwBdI=;
 b=MBldIR0RBP4WLCdVxxiCv4Jsy04kD/owKdp9V/GTMFbqU8dMerlCsDTWH4t7sgpboj0yOea0moYYs03q9eeatRGDNldYKbf1WYNXFMTHzg8dbyUqmH8CFIwiWN+aVsDie2ik6y/hLoqZwnmCFI5OWWNdQ4HZQCvehanIZm3lHsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:33:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:35 +0000
Message-ID: <87a5a9ebgx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 054/157] ASoC: codec: rt5645: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:34 +0000
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9f6fea-ffb9-4bb2-90d8-08dd56059609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JlgtMT4Hrc5s91PrPU2e0wCx9qPN5cbCC9/Pu74J0GN/UxBYO7tCDUMLvFck?=
 =?us-ascii?Q?m3715ISklTMgA+1wRl3E9/XazZZdziQebIr5yhp2SLMD7Nzb0HJRha4wNcI6?=
 =?us-ascii?Q?2KFv6UGlVHy4dorXqrY2Mn99u3xn1FIugUPqtNFhIZ7x+tce/P0KQH98fvps?=
 =?us-ascii?Q?0bMpdSuJoXqhOjaMIDA4mNdOgLeOpGCSrK4VPa0WygqBw4bCjHqI6+c90/Tj?=
 =?us-ascii?Q?h2DuF2cPyjdxQigkrbRp/ZBjW0H0bojqB9PS94OIIfcFXKmVZSZ4DPvCVs0R?=
 =?us-ascii?Q?3dJkTdPSlks8tTJ3YW2b05vQyM+LQLjMxJIlkIxIC1nHzfghbs+es+/0VYtw?=
 =?us-ascii?Q?retXa43rSG8oy+0Qwx8iexzur7i5iBvOVXbhe3JrxKhGsVOEbkoYgHFbG1X9?=
 =?us-ascii?Q?D4qc/26UbM4fujyPRHAvFiPaJhm0s6ll4UNqoatsp63XcAHrUMM/Yaoc3uz8?=
 =?us-ascii?Q?nn2DzmPUdugq5UudIuab1rH0qBYRId6mO9a89TI6qAqq/Ar8Ik/VLcl1AFII?=
 =?us-ascii?Q?8iP0fzJ1NbJ3g4KtoyZfnWWpz/qTzm14GP6lz5XiePKlnLxBNsFIJ1JzY+fO?=
 =?us-ascii?Q?6xAtf3CVgGaTF8t7Cp90sIHb+D3kxYcJrktdpZ3xNjReqnZnQVM7FlYEeGJD?=
 =?us-ascii?Q?1m2ayfQgB73OzcNak7Nchrq15O4xwj0+pt8x3GSx4H3Xd2PkeVKOYwAA1Iny?=
 =?us-ascii?Q?XrDl7nAiHQsDAce6AjKY3918izQjO2+Ge5F6Q/vCAYggtsBpck+brM/QEdF4?=
 =?us-ascii?Q?l9OeBtS8bQStK5nqy19JvPlLs3xJC1+UMj7406XAxGXg0+qjXosMCPTHNesY?=
 =?us-ascii?Q?9a5o2/OWgyUn+q0/mWl3XcU31A3ogDvbvP1wGqonTtiwn7/gsW+QykS3Xxc3?=
 =?us-ascii?Q?FMPqBkJ6/yZo4BNxmnKDvYIMQs4rH6mu5jAm7yFNlZIf65ERVNQhrhI33xlW?=
 =?us-ascii?Q?ZM4/MwJzvo5Zi6DeRlBZfsRIaC1mEXDrWBmk5iRS924OBYYm0p+WvRv1vsEH?=
 =?us-ascii?Q?1jFQAbPE6zAHtS0opgp+siNUPb3RbItWQaKEeXkttso43oA4rB2P7f+zp0Kq?=
 =?us-ascii?Q?N3fFAtEzqTbM/CHXy/HAfKTgLXj0ELLqWp25+BYhkGxJpy1dMuRUNA2sdQmN?=
 =?us-ascii?Q?LvL4jtWU2Eve+++gZNsapuw7Iw4iRdmbJJAczCIF5IasHuvg3FZiA1wfQ/Cz?=
 =?us-ascii?Q?fqLnMr0f8PhuwYmUuFHxDtzZZdLlQSKJTb2l1KTvMMswOt02Yfe1CYZeWelD?=
 =?us-ascii?Q?F5KzyrtWmwV+vKcnAHoTqz1MZcdzM8rw2aRXGOEx9aGICBSju2dH5nOfay6s?=
 =?us-ascii?Q?+66IVUIXfEwUlgTiotdruZHv7mUrxSdrZ67OJYFUn8NxrcmIiLhsrjbZLoQa?=
 =?us-ascii?Q?cdPeGLYiqHHk+lc/4n9VZn9VQ0Lk0kRMyoVr88kMHB5xWJPom5/Bub1Xhs9A?=
 =?us-ascii?Q?77PH2m/BRbe4GhZ0ArrfL0lLqH0mtjoQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TD0zgOJvmOXpp02N29H1MPkyydrnbqVCOPF3epbstV7B5Q/pumAFXi0ptrbj?=
 =?us-ascii?Q?Q2TDLMjBhiw/KGGSATETky3RR5YadDX1k+ME/d4fvSZ6FXhNrAmWwrznOvEF?=
 =?us-ascii?Q?8sQOo1O5L5VH8qhIxoPvPD+r3D1izqP0OqSH11SIN/iTwuLxBbMzbF0SmerC?=
 =?us-ascii?Q?/aTw6toaZSEYZTcI9jAiPzf4sAYViI6EVxR26SXnGznMNWZ0RpCep+WRjkyl?=
 =?us-ascii?Q?CKtirwRRsLdZUFM4qWMunso6FwBjEd4D2XLoZI0Jv6sZ6ujw1t09J8NOAcCR?=
 =?us-ascii?Q?QAlnaf5DR8OchLyEaktZkZJtFjaYjfKprVU4yh8F6/WeFcRDfJeAzKI/rtMr?=
 =?us-ascii?Q?Ds5KtWYCPoevFLW5M3TRI3shQnkP99xRx5KMU9Vz5qYvZfNfS5YglBPjRUGp?=
 =?us-ascii?Q?ajR2BNuYU/h3IsdHRRoP0KGJ9tZpU1mWzvO9xBmHNZa5e4F4IvTC4dZSvIVA?=
 =?us-ascii?Q?V0kMqxebOIan2Zy9Yq4pSijTvYIr4xngoSsVSp51vbawBUIg2i8voKdUymm0?=
 =?us-ascii?Q?KmKfeHZATFLjVE2ItNA97ZSMj3omNSj4R/QTBYRTH1rhP9GOjR/E46fZXege?=
 =?us-ascii?Q?GH80wl63gsIytX6IddWIROIyv1kv+xnBDF1TpeQ6prw4WJ6VJ9B/Q9lvAbNi?=
 =?us-ascii?Q?NLCn4aKSAOcenc7twtIg5tg3Nqpai5lpbJPAP3eYMayLLnmORHw2ggVT1//7?=
 =?us-ascii?Q?n7iecYasu7PDZX3+scILaHlwoag0KWX9leh/O4Gy6/QeumeOPraWkEIeOCaL?=
 =?us-ascii?Q?TORzmWtrgp80pL7/4UcUhDSafG+R7lUAzGtCdhQsBfoiuYbUorXojVfVznsp?=
 =?us-ascii?Q?GGXf+626OxutwmOzIIvNjgs1jcgXHhVFPu3Mf/584Vk0+lEGT10NHMcH0VjL?=
 =?us-ascii?Q?Cz3F6mIvpJLzPiM2ENkK1cNkrB/6Hr2g/SidEESVwrDSC31TSYdpmFQEiKYJ?=
 =?us-ascii?Q?NR9KauNQhGoFgHG7FrjLujNaIc+1dNennPIlKI3O9g45B33v/FnFU3ERm5c2?=
 =?us-ascii?Q?PEOKO9nw8Wg08rylLRfo76UwA7zegiaBViJbluhueZ53WXjazoIzzUx1m9vW?=
 =?us-ascii?Q?aDST/s9Jxzbwd4qOMGOdRtQmlqKhZC4r5eeTCVC6IxRx2uMA6YcvW+YA0ktG?=
 =?us-ascii?Q?4gZGa3E+mAHnaojP1hQaa+1VdtnwoYjo/dIqKqv1qwyyrGolAuO1zm5TUOif?=
 =?us-ascii?Q?hQ8N0ZiPb5Hz5aqmGrmPIPs9Rxccqg+mglwCna3cKYhBElL9cTOIPAIdt7MS?=
 =?us-ascii?Q?SN7dqz5K19/qvKFu2OPBmDvv8Q0i0F3crVqQZVlKwq3XHyPj8hYPpZft/IyC?=
 =?us-ascii?Q?+1UTLZPyq+6lvs/QDInyH31Vz2dRdLakao1uY8zpekoweb86lrU3bHDPSoQE?=
 =?us-ascii?Q?n4bZSHe/fC1gTrnp9D4+wweQ3swNjlAAaKamgrd9rkecNVxohxYflLPD3dE4?=
 =?us-ascii?Q?DisNtQ2492SVWMLuTevufwCmXesoIU7gFxlW3GYpBaqJelDdGqLmp2Jk3anm?=
 =?us-ascii?Q?Hm7AG2t25bGp9ETnfENpouuG3dKIxEx4Rprjtck/B/nrunHQYAgGdf4UUI5u?=
 =?us-ascii?Q?KSCFH4ywhOf/FnoXYG/Ppv17zJxqSallJKdD0znxNrciwMGxwuzC8SQnJXg9?=
 =?us-ascii?Q?s8pYlEJdnBOulML1Zllq2HQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9f6fea-ffb9-4bb2-90d8-08dd56059609
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:35.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54ahcNoMozSXLmOyK4v0A5+MlPySvGLij0BIEc7kG0bgIY3mAq7HqvL9Fl9J9iG6bRFfpYDTt+vNt+phiuii1MD3RzleJh8PiHuewuCXM3/X6cUhxOcIXDosfg89/8D7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 51187b1e0ed2..2d4ad416c186 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -2841,10 +2841,10 @@ static int rt5645_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5645->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5645_I2S_MS_S;
 		rt5645->master[dai->id] = 0;
 		break;
-- 
2.43.0

