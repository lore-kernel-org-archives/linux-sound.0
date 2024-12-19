Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28507C2FB
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568663; cv=fail; b=OJ0i8TzCqyRQ4KKPwtOZURLGhj3+hsiUG3QSTVeVFG42GGR6zg35iorcQ1zEk0uwVBvF8SiAsUkvX21ItcI44paG8mPKWQImE/BEesw+kBI80TBh79VZmJVk+qkAOEKoYhsfiuPxVCggRJ8+yiUKKxahs/ArnzUccwPnn1OwXwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568663; c=relaxed/simple;
	bh=pRbTGcSm5rddqHecM7IXKGnezLPGwIITVeC+h6bFU2A=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dkv0TgbQNyYyAoXdszxyQY0xZ2Wo4JU/Zvm2F/AfjqkbAWt+JfdgfIBMs13SdZr1uGg9YGLSetnaKoZuZDmF/eAPyiMbevqtcnnd1Fc1hkcc/JYSWgke2xvnm0G7xVxPuMSIL1dQt+YXVIdNj3rCu40nQhCDfaeL4QBfqhaTd9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=er4BuZWn; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="er4BuZWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERkEh1JRurLOTkIToUEeMBgsdxZ1G6jpt/HI8jZEH6Geue6Q58+ALcb8WN1kgNmMD9hyZfTibgsM4VlsdmGXh/v/qrqrtbmG/zLuvppRzJgx1W+BL0Mq9Ch0tE9cvBBVhpL1M4XNhMsHweRZjYwZTEjgBB/WrUxCgePhgTsuWWtJd1Km3rNE4Rsa0jGk5FYV8e72aWstvUjH52l19j6lR6DySx/2+glHotEr9LktQytKubj1bONvWnuQj+ZeAsrsAcnOWjRKUfXtL7yJEn+kdzGV9vyuOT8bSjFesJi/hZ8IMV7Gdd9WgzHmJHRf+SSdmBBDS5cxmYS0pN4XD5cTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSNjPtcWX+jCz/gCjSabvmvvADSdyr1pqMnpVZultEY=;
 b=Oeqais1zbCGpVBlDel5HOvFMMwHcoH21OzVZzCPwuD3/w2SJ7YHa1q++oUPij79dlWICYTDn7guqxoaOChz4OC4q2exWH6W/Ew5RNJ/1DomB/enAF246pmnIvTyiPA1oBAQWy4cMjvPEroC7kdz5adulZIyiVJBKJN4LkD1TQC/5oBhhxhmiv2luvaVgyo6MXmxt8GmAJLD/L4nctYsulLR2O7PZrKh4Sf4jnq9s4tBhPhuIMaXP5Ju/XS4//FKS9Me2jZ26vn/z3NvVAc8BbBnJQ4cs24XlFAr+9weuyonL6xhU+skCDgFIDGkSayRw33rrZ7SQWE0jxxwXuE0l7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSNjPtcWX+jCz/gCjSabvmvvADSdyr1pqMnpVZultEY=;
 b=er4BuZWnQVlGSAs7LgRTbZknn7aa++Ko2cSPSMKZ6c7Ebu4KV6GR5KbcpueyA1mksYgH+KWH4Tr24UQgMlqchuVU81mYP3WVTsL+PqsV6aQ7Lj+gd5mATPz0yN2TfcgN0rLmfqRfY2ChZVihbzWr4y3vHP5cj3o87HgO/+RFuqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13794.jpnprd01.prod.outlook.com
 (2603:1096:604:36c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 00:37:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:37:36 +0000
Message-ID: <87h670cxtc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Gordon <gordoste@iinet.net.au>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: audio-graph-card2: Use extra format on each DAI
In-Reply-To: <10b19dc9-c113-4f72-94d6-c729ee88862c@sirena.org.uk>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
	<87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
	<20241218000652.197e8b7a@rpi5>
	<87zfktpkpt.wl-kuninori.morimoto.gx@renesas.com>
	<10b19dc9-c113-4f72-94d6-c729ee88862c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:37:35 +0000
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13794:EE_
X-MS-Office365-Filtering-Correlation-Id: d02b7243-71b7-478f-8f33-08dd1fc55577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pEHZZNNS7yigRy22Z6clVXVdTqKD7Sjw41/aOM3vPXRbzQsfVqPsfSXUgA/z?=
 =?us-ascii?Q?wbu1E99AWqKZ+MUI5yMgtRAk3QpCtYOy4jY1piiW7zE4W32yd5Hl7jQWfIdD?=
 =?us-ascii?Q?P4ohqwiQkSF1mI6qoyC/S+oxNWMDDr1BIKwoq3qEYlV4qqRnh0SfT1+yjvNP?=
 =?us-ascii?Q?sq+QWBycOLDvQ5XsnFBreF/9hLRF/xqx902uASN7oQTz+yUdSa51DtfvfVQl?=
 =?us-ascii?Q?kzFmWHuNs0kGU0ONLjleBrqUg1fzgdc4m3j9q40CJR5EGPRSoPeX0yHrNavd?=
 =?us-ascii?Q?+af7zzpjiEn9rcBHulJMlJiTynpa5Zx7RsDLUrGH7aVZdgr40Arfed+vOvQ7?=
 =?us-ascii?Q?SJfJFfd0ZIUYXMMX6z2e0zVZ5DiuPvslQRfTpC8/LuPmGJLlTDmy+oujg8wj?=
 =?us-ascii?Q?n4cIhZi14i+aJvqhHa8St+o5xo9hi/jKcLfRK8r+LSQH8lOSsn/QZ7LtmTAm?=
 =?us-ascii?Q?noVuMSuWf12ApJXIZCl9LuJI3FTml/findA1GeYM7mNh8bxdanEzzAkRqUuy?=
 =?us-ascii?Q?88PwnjuqTyA7HOKLeamHb4eDU+YpLjr/oP2YkExpm8hm9WkFGgcGO/THeWS2?=
 =?us-ascii?Q?mBoedqJycFei9wBVWMjqLSHsvdg1eCMKMKM/nLfiOqHziBpuX5VdJUsgcy+z?=
 =?us-ascii?Q?Czb6pvsYIRoePE0lEL/CdbRVOZ4hgUNSgyCFjtUdxRUjjrgkYcABBnTsQ6Qa?=
 =?us-ascii?Q?FbN4ZYwFs3tahIxYBFJLTgbmTOQT2drUWePu6WFyaJB1q6u4w8bVHt8VC1Hi?=
 =?us-ascii?Q?5fJycCiq+4xKSTofzShtlu3BTSA88cYg3llmTqpPNfjFVl7Mjsx9OxQaCkZm?=
 =?us-ascii?Q?s8WxnP+32gTEJXngMdOuhOUfUt9Thh00VC5cofqzwKxyAlQ12OrjzglJhyMQ?=
 =?us-ascii?Q?Hyyk/e0xWfMdWfHll4f2OjFAj2JtER8sw1O0XXQjSQ7lGCiEFJILIJOS82+o?=
 =?us-ascii?Q?8WS3RTSldq59s3PnUbfHDXJgpf79S2CgaVJV9TllKe78fBt2JxN5/vziREZm?=
 =?us-ascii?Q?6JAONMmrrlhIAIY4Mg+36cBQXkbnEdn3V5lSUiwniS16BkRCNaXHkmC0vD2n?=
 =?us-ascii?Q?WMit63QGTy8XnwHs4Azty/KXWIdiPMjSzabyoNNvpgysn9Mo2lUQVbUSyG+V?=
 =?us-ascii?Q?8W47LUfIv5AXGB9OccTBPxsiNmtZbjpEosVrQzTzUFEXLM9w0x+xQ84i8tv1?=
 =?us-ascii?Q?Takc/ZozJodty4buWNnNl8gge/iFD/YZmXU8Zp9CcTchhI2fwJ8KJLqSt/z4?=
 =?us-ascii?Q?taM2EU8W0XPDTsh/p8UrO+mTEKzI540B5s+I+d2evmNr3R/plfmCPLtB6CB5?=
 =?us-ascii?Q?ZE3TYg4590mlS7KT8gQcg1jBzAmaIcgXsLpoCOhJpa3dJdqww6ssuXAy+SJ3?=
 =?us-ascii?Q?EICTpWekjFwKQ4RtCACKl8I27czEmuv0b1wjGiF26i1uaPKCCw0DAn8sPq5t?=
 =?us-ascii?Q?HwUjZoGOHoB+NZwfPuP6WRPL58BLxtQq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GNtzF257Tir4GyvnYYXgHkLDaP2p1owDK/xrj4QVQdoZTtuYQStjfrg3So5?=
 =?us-ascii?Q?f6uR46vAdhG0ImskgEeQd/e8KEwmZ6+zUS0e7IS4cTfJIS1rZenGrixw0LND?=
 =?us-ascii?Q?199vyZfxl0WSAMupdte52pOm40ZGqH0iO1fEototyKWRRbVZIPJENkQQzQw8?=
 =?us-ascii?Q?WZ00BrbxYPMsiNWUXkae9btoFRHMDxdKOdwOhZSOxQo9hxOH65zSuhhs6JZF?=
 =?us-ascii?Q?uJusHo2pdXH/ePrF+XfZRo8xg3Qy/WUT7URbIa+i3YOpmfA544LSpC5AOWkh?=
 =?us-ascii?Q?/LRP4EZqQ4laJRwWWQ2gFUocvTmXIgX0XSm5nFP+fH49etBYEA92jFDtuAqC?=
 =?us-ascii?Q?ARJg5BAb1Oph/X8wGe1bgYn+9y3MOuJUv5wDI3s03cxL/9WiG7WPM0aBQroF?=
 =?us-ascii?Q?AhkZy/z0DNVVW+d/PuRGIk1r/LDd9U0PEnrab27lpG9vNhuGZjXKPoaJEgAV?=
 =?us-ascii?Q?+UzOMKCV7fdw8ngPtODuwcMLXrt+yk5IZ1JfC+EuC4UfhVJYKxl0/0x0/PSr?=
 =?us-ascii?Q?7ciFXFwRpMH/2vH6SxlGt6O3tuCddPFuK/1svFYlBjooC3eehjVuOpc/KG+m?=
 =?us-ascii?Q?/XV3lWWMKXJWXZJLPzmqaV63mw3S/rMpiSoIjKSUv7UEKvkJkE+YI1Z28KlM?=
 =?us-ascii?Q?mRH+3GExhv1rB7VOvqGMfm65j3lr9C1ogedlkXARExvTvNsXememoIO4qdPW?=
 =?us-ascii?Q?Iha5HDQvueMT5R4A7yYAv5032I556BhFXP+Zlit1fty/8QOhqe0KoDktwYYI?=
 =?us-ascii?Q?fcs/tjuczrHAPUmdrwOCPWCI/qszg3C0nVzJUa6xV3NMorlTewkWyGq7MeKh?=
 =?us-ascii?Q?RpYylVyayr6/yTKk5n2fFWzg8+B+J3G+HSWi5TbtIRyf9pxTxnzvHW8bnFfl?=
 =?us-ascii?Q?WN7/7rmwGaCvognANqGjPLJw8anXMzoxo3cHey8d3YikcWWmicfqMtS+2ZY2?=
 =?us-ascii?Q?sdRoOb4ECcd5S1u+Wfidb76it2DemQSNyJRe2Y84nRAtFrlt9riIy5sqD+gh?=
 =?us-ascii?Q?TXFFR9t/cGhbwjygOC/6lANv8G86llsUaykSpj7tM7+DUNTbsR4icn2AG3cC?=
 =?us-ascii?Q?51ekTtAAKH3r3iGCJAX/s04+zkfp7hZYrZfUFDEByGgCdhWRWOamm5AUr6fe?=
 =?us-ascii?Q?OC1GmWkEO7IR7YeF7oB8c5JLUZriTdNq8IdirToxCwAO2tpJ1/8zISVveaF7?=
 =?us-ascii?Q?g/Kt3sSXHZyapdyV2ZSjA/NvHN1Zu/o19pycK9aJ9IMx2eHkXpo9TB4ndUuu?=
 =?us-ascii?Q?Ga7tfbFB3eE3VUx5hOzehN49oW1G6jaxzUXuhldZvJ52u9bETlulad0lRAul?=
 =?us-ascii?Q?JVnDyQnLHbfUiOY4MQ9xq6ldE0TMGVlae4PkxTtGJp4jNvokKEQFOt2jn73y?=
 =?us-ascii?Q?5u5MfG1N9UDjFKCwtlsHGaFH6EO1fvY33Ute3YQ0ZLIz0FPJrWa1eIjCIZNJ?=
 =?us-ascii?Q?xw75L1E2FttdFc1EDfH3eF+ljZJoSH1vFxfpx8zMzzENtFbkLwC58PDT8rpj?=
 =?us-ascii?Q?cmSdLjvuDam1tX3yaslLSq7G3utdtaGlCqd/EaBIFArJF6Ai8CwIfKwe++vg?=
 =?us-ascii?Q?E4+w9LbKfL3BvQcnGIb18uO0+t++CbG2yKwGUwio7LSPBWT55bnE1uZ+9ZQ4?=
 =?us-ascii?Q?PKY2AnU08mClG3CQqW4B1pc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02b7243-71b7-478f-8f33-08dd1fc55577
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:37:36.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQpJv+AIv9VnFPVxt2d9eS6DK/jPOmJKdXBO8hrI0TtrOA8xN/ZdeR3Z27wjWtQWv/sM/R2qrHcMNQr1rKKXWvcPe4besLO2I9koiT4KkkeWBjtShl9gnoR1WXzzhEmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13794


Hi Mark

> > 	asoc/for-6.13 :     included
> > 	asoc/for-6.14 : not included
> 
> > Mark, is it possible to merge for-6.13 into for-6.14 ?
> > It can ignore conflict issue. I can post v2 patch-set on top of it.
> 
> Yes, I tend to do that if there's dependency issues.  Just base on
> for-next for now, I'll do a merge into for-6.14 before applying if I've
> not already merged up mainline (I'm holding off on doing the latter for
> now since the KVM people broke things again).

Thanks a lot !
I have updated based on for-next branch, and pushed.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
