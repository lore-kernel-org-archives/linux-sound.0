Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1443F0BD
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 23:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784245540; cv=fail; b=DdU8qInjhzAbu7MTZ9f3TQ+uAxnUeMkgIZ/ecaj1r1g/GJLK4gSUFo3JzbaMfmyIg/skg9XvvnIy/oMVzMkJF93MubTpEMZvDsbkqlpKGjZydMeRSWniSrCx6nR3GT7ZxFqdmThzZrZq5OAKP8s4TOu9XqkkWyOWqcPEITtJDVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784245540; c=relaxed/simple;
	bh=9+XhtjC3khGj15PS/vZFyWd2liSbOrUqZgEE2cSuH0E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bB3PZeo8dCH7ZEuO4LyfQEByxoR/QJauqI81QiNzjEYBPZdmsvqHcLorQJbAobZjHsEvhR6IBQyDIxwTyNJAQyO/YGqSGgCqZ6+f6MdhEE3ZHew4TMguqNoix9Hw4ZylBkr+C6SGDfc6BKaXqRxD7BVba29IkfICXzqkzkczJ/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fKmRjU7V; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fKmRjU7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liB1GKhRGRW3cGcwjh3TY/2XF75Xs6nAYidI5qF6WomjaBZxT+Tb7rm8RTQJe37bZYXVRpulN4B4TpHaD0gd7r5+NMzdHMxu2/qdlKGQE2YwubpFxtmxxCrQ8FoWtOo8+36Nu8X1qB3/B3UxLyGEOkv+vDt2vunZga0Fbq/NfU4ZhYuLFwQzEc/0VF3/8hnIfAQ6fO5fLM/cwudL8P3pQDCI3KWCt62nI4Cn4GMdAGT0gfIR4A9YGm3FNCH7Yv8pT585uQ054MN17v37YjoTcNuDDcYOf9GbobLaOhPOYdHO4Q7EcShVVyRbQ9rPSRQvyjAQFFBHmIMcUsNxvUub9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2AJfPRCTEDIWkzwByrnFsyeE4h4akIz1TDVuVvoBlY=;
 b=I6957DURmIlddeh2cOMos9mN0IxVA4WEHYbnte/3drZAZg2SYsy5WgQ+kRHd4SmoCP/rK2dSQswSI7Nr9SEHDfl/wMzoI+TMCh8GH2Ln2bTbrdlp2hHAZ0TiJ25EXNEJAGKJ+yP8TeUzBMS14ov3m0pbjlCfSLjF+purNplTnh9yB8S4ikstzP9D5IKfGkUPMkyz34zCfhvOtZk7azZ/OkywRIhJLyAmTjHDFKhIrxK4M8n3sUOO2zgOWdlBMdQsr7TQB7BOxkUHab0rSCedSopY/TyyIclq1DaysS8C1DAkUVr6RQad4Mo3lVzt8dWf+eX3+1uH3jWnJNOxJ9YWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2AJfPRCTEDIWkzwByrnFsyeE4h4akIz1TDVuVvoBlY=;
 b=fKmRjU7VGvp0AQ1aBXM1t/G2ObrBVq4MXnmDVYH4rlGaMkdWhqGLOIdTcfLX2H1lceVJNZ2tAvCmsXAm6n66r3srcyq9HMbTaaqakcQLMq2SEQSyudcsQAW/Af0hPPejKBYRGZCqfUk2IX1XrBBUEF+cRnEiF5mOfj2pYlpHmF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13247.jpnprd01.prod.outlook.com (2603:1096:405:168::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Thu, 16 Jul
 2026 23:45:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 23:45:36 +0000
Message-ID: <87o6g6bisf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
In-Reply-To: <b26877f6-c22e-4dbd-964d-eb6fbeaa26fa@sirena.org.uk>
References: <87ech34o8b.wl-kuninori.morimoto.gx@renesas.com>
	<b26877f6-c22e-4dbd-964d-eb6fbeaa26fa@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 16 Jul 2026 23:45:36 +0000
X-ClientProxiedBy: TYCP286CA0341.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13247:EE_
X-MS-Office365-Filtering-Correlation-Id: 20308eaf-549c-40a8-0530-08dee39455a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|38350700014|18002099003|5023799004|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vBLxp7p/pq1wuKql80KkGZAiEqwtjqAukntt/yOxt/yJVmJtEv/ctbNV08P73pe7WrsmSw1f0zR46D69P3rq9qC96D2caHrrvidJX7U1/QXT7yklD3sTHjUDb/kEClKdCvi4DAf6Rzvw/BZ7A60acbn30YZ1pa/BNALoV555CmAsrrSsU3KrhK68PqRH3SPbt7S4kgjAth9Gh0ptbZWe11YLQM03XcrjZmchQ4MadBKujiscPrFGsQrhgF6bUC/b/RKdm3EmPUc75M7X1maIwZBZuD0ssV6L1NTRx0DusS57uJcuEjIjjsNsMOHDIXcie4T2730O1oYtBGfYU6RPcGyOI+NURKSTC/NNeiMe9c4cJXxR58h8Js89BfVSaR49Y85nPkXVh7hWAoh2NQwFQsN6xxsSa86tNqVlUeHVFYW6fLLdkFgU8/Lf9lqTjM2jpB26az7cLCRLTeqoj3Bc5ayHBmGTevVfj6SNpvzMWNUEghRKeH/ow1LwFpSJMi/QHYJKseGe+p7DIvc8ySjKlWI63SVzvUm7DYtoY4wgJcYTcTfUN+aoGwcG8mv7UouhgNvWIgS9z6RJdXeBDZAQKUTLXiN+0SE2TBF1uAB0OQerJcs99qOKglH5PN1aPxA0f/Vmg1HmBSMQXU3Jb9rySOfe8Tm8DiICIQi1IET/Sey7YaIQ4yCHSibFQW1RwcMEAlLrzn+W/SoZKXSznMGjRJo6/dcQb6I6ErJXHjLpdQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(38350700014)(18002099003)(5023799004)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tIJBECfWkyTP87s4OdiO2+vXcNXUemvgTUfic/Cc+yzZcjmBa5Yfkklu3IQ0?=
 =?us-ascii?Q?RM14wJTcdJoIMEVDdLI/JDiAXnKWZqZ6QC7pHGKRyfVx9c1cmb6n3i9QqNzA?=
 =?us-ascii?Q?nP3r5/d1KHiYh42IRwGVtljgIhFs87olPuFavEvj5fz4nazYWwX43TK/FDll?=
 =?us-ascii?Q?amtYCsa9VXHxxbApIv6IJPrkDpHvW/MdD71JFlThDMayAhJR1+sh2J0OS+8l?=
 =?us-ascii?Q?xWtAQLKeLVW4Oc1uAtrLZSaQChLSxwTBzPs3IkrQZNRFv6KhvxC88s9nZCTN?=
 =?us-ascii?Q?66FrgPUx67uaG2bShla3GQbeAIZVRUmrqWPBbVKq0EfXty+UcZFZctR7ijpi?=
 =?us-ascii?Q?jVfX9Imm+WqjKe7tcDduNmJjRYDSmXezBprE5HrYpPGlCX5h0r6xnNJSz356?=
 =?us-ascii?Q?3Z3i3z3zibltzYjc15gPjids7UioHie0NkWZb2iBUBhQY2CZYDXAW/1iktxr?=
 =?us-ascii?Q?8u+BrYIGDA6S9ojIJ3ut88rtxyfoSflgxLYIvJhcmgNz91gJeKWJI9ztym+u?=
 =?us-ascii?Q?uf+mjKvqiLaJLiALUX+yCUgfd4BqU/vOZPFLYkkPWwSQdmyBFaBXtYMHN33p?=
 =?us-ascii?Q?kOykEPx1RRLgDIS2u5AZyntSnLcaKXiWSAC06nCs9HA3Rb4o7xfIf/ArUA2X?=
 =?us-ascii?Q?/ckvJ6mKyvpaqwzQmxymndv/VRPmiqLPGRMaZGsLAjVmxje+cwAMQSknLcj+?=
 =?us-ascii?Q?1OxQiAcDp0mcP+oRYTOe63Ih2p5QaHWn6YvXABBNOUwoWJAKusl/WlmCeHvQ?=
 =?us-ascii?Q?p7vocQtH9of8IO+5hF56sDwaLhvSqAPnb+h9rmIjY2pPJ9JbVPhNCFZOxj8K?=
 =?us-ascii?Q?54LIIoIwltRaFv4BHsfqcCltVxoGl/fyZUX9GTibLey1qCAk4EcSdemjhWbi?=
 =?us-ascii?Q?fQroYmQR+X4xRzp5SV2fV5RNGpZto0IEYyIeFiLn9h9u0f8vHDFwST1P/DBY?=
 =?us-ascii?Q?gbIRsbBqijMbIJaVgn0k2hXw82X8GpTh+T5XJb9TB1D/aWjLyZV87705yIow?=
 =?us-ascii?Q?+55tKbOaeWzm46QQ2hNrNi4TYhexBt5DlJZj69nATLCFr/TdPPJvoc54diNR?=
 =?us-ascii?Q?imlZs1V/AuRX06paazf4PLbC8ORwxIJuw8jBGoND+TUyj04D1Dw1JaLMlSvl?=
 =?us-ascii?Q?bbRe7omTDfyFDQ1bnMeox4HcT3pyoCTv7i0JsFK7+qDkBWfvOcElguT1qX4G?=
 =?us-ascii?Q?WhCgTkRUWP9HTi/KcJJxyAjnclLHsmYCS8yJ9whFVrpglmOD6ysGzK5aRug7?=
 =?us-ascii?Q?Ys/PkwiFEE5+RvbDzN4Re6yb6PZrvMwDdQ5pn/kVWoXsyfKXHXkUYa73s2xx?=
 =?us-ascii?Q?0WMHDsPuGFeIpW5zxGOy3Peq9zAcowS+i/4ZimmOinixcpjCYzjGNHi7u7yw?=
 =?us-ascii?Q?gXeZ/27Nbp83wFqq7z8CxOpiY2an/OLspVIrAkBZq6tau/xfJvwHhelMrBfM?=
 =?us-ascii?Q?AleeITCkkQc8I6eDTOWeMfd1BrPIhI0TrFaLys467ofKW2JVeWUPJx87HOgj?=
 =?us-ascii?Q?Zqdm0UeZfTHMHzMHc1YzkCwA3iQv4l/kZQsRkp4+N4Lc3Hj6rMa4EMZPJIR5?=
 =?us-ascii?Q?eOVvNY2N+ybt4Nw4pF+qEkRT+gWT7eArZEKco+WrBvbRKpSYLh/5JR01SQ+A?=
 =?us-ascii?Q?1C7rEWLbBwdejhMqeXmvH1MdJiQQlZBIOTgdzJBvs7Xs72pS+aSN1ISjrOkY?=
 =?us-ascii?Q?qxnLudejnTeWJpRp91DcDwSo4VovF7ck/kYlHJGHdwxUv+nD4EkeMK5wxxpQ?=
 =?us-ascii?Q?xc7iGOLezsvBqk2lZj9XQBAs8dvlLFOL1G1QlP54bxsloMDJIwUE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20308eaf-549c-40a8-0530-08dee39455a6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 23:45:36.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhDkLZbHb5IN+Enb5XRzrhOeqW1feh2EjTzXx7PT+bRj09rpIXYMTfcR76wqXM+oLl6kBuR3rJJmT5kt3P2x5BMQFYhXUilO6F4UqOH/cqnbbEae5Mk92LNCYF1ZbS/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13247


Hi Mark

> > "tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
> > function call order. But simple_util_parse_card_name() should be called
> > after dai_link settings, because it might use dai_link->name as card->name.
> 
> Like I said I already applied v1 - if you could send an incremental
> version that'd be good.

OK, will post

Thank you for your help !!

Best regards
---
Kuninori Morimoto
