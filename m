Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABD36A03F
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595585; cv=fail; b=HggVH/6XZjKFcg1V60Ohq60GnfaO/FFiRnwKgLsgBPsOu+LcUO+HHZajjLlnWFYNunkidif9wMeyLXFcDI5Okkq5fnbYgcjUXgfmycu3zNRJvkEsX+nE10EOcNCANWv+WU/ju/Dq18FyxRPdHTt47qIGW6lau1rjRZrSTcxBaV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595585; c=relaxed/simple;
	bh=KmqMWdu5mhgw1fqmUmxMvfECjwL8MmUXuiXoc+bLvOg=;
	h=Message-ID:To:Cc:Subject:From:Content-Type:Date:MIME-Version; b=GbVMeiXVsmDPdfUdpg58NEQPpFW0h+SCF8vqLUD6jYa/duiNEbOGUNQtXYKnkUxHgCHqba7+g7UivHmbquEFn6jVDTGqq9TJHnUObUOKMkfkVhncG0HJDSObPcuqViE22KDiQiEjd6S2WMabJAuaqS/tFIbHrVYRKJ7Z3sJAqDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JiUEgzbp; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JiUEgzbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUxf8cBH2pdyXsSxoXyTw5Dzx9GpQt2ru+gcVPx7C1Xxf9fHvvq4G835lolaHI1gsdHrSvJTqht94/vFbnZDFATY86xrZ+DPSP0rx0OQAB1TOWxGSNtv0VDmLaV+Is6NUKr19vR6DEwrAsvdTGKGv8R9VvErJ9oz21jdhRDZfrcjy2FHwS7steshXkeZFRi1METOQ1N3WAo4jtL2GGmVL746MmJ4Gj8d4oV2/T62s5u1jhsvhMHA6DZTacr4uigPHsmjP2Fb42fT9bHCNDw8NBPeEKw3C7acQf7fzVThZFjn0NEKtVSJVov/JVhlRtokiycwomqOgx4gn5s7I1b0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEIPL+X4oANf9Fdhv4aJ8ye4LbZyUJz+KmIcwxZxSeU=;
 b=bxL4nJhRJLG7sG4h/GwJgACtErNCWc/GcJ+k2IXkUIxukOkKtoyFNwOoV3n+npmFRBilUGNBE1n+E20mQd0eGCEH+OI2dPr9SxYOFmZxOOfhnNnThJ97KWHJysHt8gsXbDjcUgZrLTa9Rg64tJgvmV2toAolp9iyXC09ylQyh0zxSnu8SFgJhdJH5aXGgtLayRlqTAeor2PZOp0AnSeRXWaFC9zf7UiJe5bl+3r33yjWQpPTNyQjFgNozfI3Nq76E0XqyaVSyjmJ8uvfO9waS0CvB+dAYKqPycKLAFVcpCkgbveUUtFkNBpvdUgPZ3cmA7c+aC3T2F9pga2NayYhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEIPL+X4oANf9Fdhv4aJ8ye4LbZyUJz+KmIcwxZxSeU=;
 b=JiUEgzbpRqRc9q8BZJWRjZTrPx6DQ3nDYQP0ySomZyuDvPrZ+SSOLHsHYXgQQf9DoCs03GAwkifLO1XCshX4cTs198/kbV6qgzHvrzjL8jSgYHM1OwSqFBKormE8gj38yOHyLwlaOABKoqCPuwp1Zc2iP27t5KXui9KqgNsMjFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 00:59:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 00:59:37 +0000
Message-ID: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v3 0/5] ASoC: use .auto_selectable_formats
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 00:59:37 +0000
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: c243d804-1363-4b0b-fd2a-08dee6c3564d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Mi4//27fyWpXJPFj7fgnW5FjbPbZFJdtrXxIAR77h9z+OoUqMeIfX1MTBr/FbEDOGgMJldsFu3+zL+SdtKKUMdj62fAkL2eUVL9R6EMOoq8fQE/AykHzfSqEf71er93fHHVE3Hq4/RPlb79Ctx/zAQbfyxqGwjiEUtQUKa7lOF4WbUpKH787TPFKA8ej8YCSO/gw/RuWdExQy6MDrN3LvcDESi6BZHnhup8BqgLCT5Gg4gKMbC3X7rc/d5ZkOADjQjXm85VAqXrAzsk7nmg/59+Z8kuJhWEU8O8UQvHh7kWqKkArMNWb4mVcbrL/E6LvhHcmfXoi+/4EnTOQDeTFlIMilR1t0iLPZjOESMmnSnQ1yiQQ5YyXCfDVkQQRdF7cOAOXr2//paqOWu6YIK2p4ccCSy+Jgxa2Y7ICftkkC/XcrWNUuvfZ3Hyrm9aP5ArMjFmLMnEiu8Q2RN7Hc5Rz0fxxI/tgQ23Gq9UzPYV+pR9N7Ho+djkCAriuF3OtjfuRPXmaJFTiCaS4r5SMmdSjAWffWIRJx+JpUoknC4Ak7DKkvgd7QR0ZrX39DJJhoevUoWwG+dm/2crknV5UqPOb1SS6BVQn+K85zgymsIRod6Af81emAjRSsC3KYFWM2dbBxMWvRUAuCmDOzIM7i0dN41uvhvO+cU5KK0TfPgduL7pRzE+O9ZybwlHZdvmaPG5jGdmVfSfWRP3KPoMQg06DzJBz+5oczTv8+yfsDwCszd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KV0Y3D0eeORlVoaE4fhDvMtfXpqc2GPIlMm1hs36SpB1Lwv/eEapMDXqMaqd?=
 =?us-ascii?Q?KmFU9S7aHseLxcgczxuwV6yFEHlK61iNVJbCbT+moVoJLki6wA5gLSWO3qjm?=
 =?us-ascii?Q?JFfbyJOFankaj1pRiZq/Wd7nWsQVOHi2PSlT0Fl03rcoqwJ99y3Vo/8IWaC+?=
 =?us-ascii?Q?NDwlhOIS+QEP/TWL84wrBvsuC2ZsQjCek/mzAql313xRGa9tnLKsgtCAiB8l?=
 =?us-ascii?Q?ssYALqaf42yVUZWz3vSNIl77ZmmEzsTVPWuLUjahlH1fmVALLfoahjAfUYwa?=
 =?us-ascii?Q?56pjMLTfxuLXuE4+EZw6K5rTCkW61gP00fjqNeXtlMNbmOiacHgTWvpSfPpQ?=
 =?us-ascii?Q?uWq0qgq9IBsbQNslNxlOVQndRikGuom5njLaPCiqCGcU60fRKq62WkA5nCgr?=
 =?us-ascii?Q?5y4go8nTai2egVk8wRAMrLLVPj1vjzmpY/OWu74WzAaLZdyef3knagibeWMv?=
 =?us-ascii?Q?0fFuIM3T0H5koHAj7wsbeHaqgIwjCEwOKACKq3wTtRfqc5Ps+0JO226FJQLL?=
 =?us-ascii?Q?in+s5vETuI6gMCyEjx1VYHJriVvKf16Lnmgm/a29V4lD09m9UMrr4WT4SnR2?=
 =?us-ascii?Q?DW8djaQKuTAligmFUh9SVcRRXJ6rmaVQl7qCrZuQ1rkzu4phW6cEuYmJdKuP?=
 =?us-ascii?Q?BMVOYVZDa1Dyue+5ri+BoCoBkXJBwzv4D7f1OK5VNNncgRkXvZuwLXGtlK3o?=
 =?us-ascii?Q?6o4d3RC6zCWyi+0R7NvH+dsgspsURFoOGz8z/ezTdINEUyDXtTfo25E/ajjR?=
 =?us-ascii?Q?47dGe02Xxnp3YmqK9WHGUOg5qQ77nizPpINZC5VlNezrxRfXkatQic/ueZB+?=
 =?us-ascii?Q?LvPt84FJvS2WXcTWDxldTI1zvb3VEqsGb3EavxJWuAbtKZ8zwL2Gx5rnN5TV?=
 =?us-ascii?Q?Pvd5WEPvQkbSBhizPD/WX6ZbSpy5nXs546j6GJt6DZ2nKQqPHJ8VJcfeN2w9?=
 =?us-ascii?Q?e/XAHVMM/BKu8OmRI1064VHb/Fm6fMYEtgV61bnNYw/b/Ikqs+DYW4bqlnPa?=
 =?us-ascii?Q?5i4Z86eza9LKDma5DiFCN/+OiHXO2Pz8znjqg2syNWF2aznoj9XxDIEhxFC3?=
 =?us-ascii?Q?meKykrhP1caNQ4tYg1xKHmDEgY5Dp5oduMBVtMZR1F+5o1uXLQ+CvKn6VYjo?=
 =?us-ascii?Q?05Ox2JV4ZHMTen9948ZtOg3cEY1duDMw65Tslq8dNZDwx6+g7++FJ4ScDb0i?=
 =?us-ascii?Q?lO1xUWpgCGvihn1roBG6fn2h1ZP6DNmimYrna98FoafjJJXDB3wNtndDD5hh?=
 =?us-ascii?Q?pNE3/AZHYx9TXdmTS4JnaX2kbJh83RonztAoUjz25PPUGyRCsP4n97C/JJ5w?=
 =?us-ascii?Q?Wm2s9q7UgKDxjQnaq6astDCzvo56m2psGyDtsRZI/7fNW6oI9DuQ1jeC9OTX?=
 =?us-ascii?Q?MbTBrQcIfJLcKHdTERNT45OmNqJqvWDOO/iETjdSwyzAYcHqtlRBd3NKUtDk?=
 =?us-ascii?Q?rli96TB/T8+5z8Z/Kn5BBUxItgS0fzmveyo/VqYoao6chwY6eth2sMOj4o4j?=
 =?us-ascii?Q?x2TzlMKCrFlecBRFz4Z7wnlivKoyuhKra6lCzVWGcbb54LLrCgb1J4v3G36q?=
 =?us-ascii?Q?LMeqWthPQkg6twd9Z4ybX4db7fEz7UJ9/ewbE4E7jFjI+VegZwG4T+hMbYsg?=
 =?us-ascii?Q?C0SAjcNaMR008HS+1qD+Twlu2xwRMHVQOSJqapPq+Q+bnCgQM0az01h1BBZ/?=
 =?us-ascii?Q?XizE1tWMvTI8EBG1Z7iTrluY87uVfjdqlc9yBSj3tPP6l3r6hBm06lcM0AS7?=
 =?us-ascii?Q?9NgnSSKRCj2hB3dhYmOSIMJCYz77a+Z5rYmHKYjAcwuGwSx43/xO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c243d804-1363-4b0b-fd2a-08dee6c3564d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 00:59:37.7820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KON6FPSnux2yENTQAAQB+rC81kwiWdnrTP3jeF2HN60Laqe3xlbQ1PleQBAbstRFJ0s8PYEIUtam7t+IbW0KWJbiSHgtuWZPeyOEgC8hNxbBWzMXV5h6M45BTyBTQXyI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382


Hi Mark, all

This is v3 of "ASoC: use .auto_selectable_formats", but separated into
small blocks. It is Step1, and it will be Step4 in total.

x: this patch-set

	[x] Step1: ASoC: a to b
	[ ] Step2: ASoC: codec: ...
	[ ] Step3: ASoC: d to r
	[ ] Step4: ASoC: r to x

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.

v2 -> v3
	- tidyup apple format

v1 -> v2
	- patch was separated

Link: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (5):
  ASoC: apple: use .auto_selectable_formats
  ASoC: atmel: use .auto_selectable_formats
  ASoC: au1x: use .auto_selectable_formats
  ASoC: bcm: use .auto_selectable_formats
  ASoC: cirrus: use .auto_selectable_formats

 sound/soc/apple/mca.c           | 15 +++++++++++++++
 sound/soc/atmel/atmel-i2s.c     |  4 ++++
 sound/soc/atmel/atmel_ssc_dai.c |  7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c  |  9 +++++++++
 sound/soc/atmel/mchp-pdmc.c     |  4 ++++
 sound/soc/au1x/i2sc.c           | 11 +++++++++++
 sound/soc/au1x/psc-i2s.c        | 11 +++++++++++
 sound/soc/bcm/bcm2835-i2s.c     | 13 +++++++++++++
 sound/soc/bcm/cygnus-ssp.c      |  7 +++++++
 sound/soc/cirrus/ep93xx-i2s.c   | 11 +++++++++++
 10 files changed, 92 insertions(+)

-- 
2.53.0

