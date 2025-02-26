Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9314B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533468; cv=fail; b=Dpb8imM3jHPI/E6hriu8Dr8DDylnse/tkY+5MD8RBI0uM3LkOvsbgP+XBHE1490kaS44z61eHHlXs5w+UT+GBjF3PZVOJdvToJCl1jKeT0tY3ZWNvIMRcpmFaV+cOy5dUSPEwQIVx+an3N663vT1MVtkKE3xKvgYLvElB3XF7o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533468; c=relaxed/simple;
	bh=GITAEeCLHLbGRAu1bHz+bJmIHla0c7S6mgqXcsombAw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C0GEB66Jg6PaQ9H+KFr11ec6YCM/PXILkWc0pCkIPF7PIg3kN1q9Z8qbsncX+CorvkcbGjb4ZUth6k3/GHJO1fbX4iZ4ks0LQuJ7YisoF/ATk13ek2TlGV1ht+2pJiYmxp2F+hAB0AO5qn0rE7A6C/SD/4U6Z/GSXFt1eViihbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iLeh+1yz; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iLeh+1yz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7+TIPmkVsTdm455QQh60T3L7pLm4ByoLZuRwlAhGxQbiX4KoQPu3DZV7tPaKsGVY1xJ5p9GAgVlEmbFsbDBybbfLtHeE0BoDQRt6tV6t+uxO0PyUNS98EVndNXJqg+A6WtCuwXbyQJ8ZSSZnfpJVOmeQFJMnHBSGth/p7rm77YN2UaSwsg6OH1ybU3rY4YO2WyHSeT9spL5jGp7qcNAods7o0ugRMszXiBD/EghX6uNvA3EDTKcOiwPsUMJHDJbaz2YzgnKfFA16S6XauLo0GEmzWS2XanYD2kKlm/FRnj5ACkJdyuGvX5vyTrPkzMKCKZ374Dk7nLOE69qgtBvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTeq4ElXAL87ZZttzhk3QHQ3StvVGLTLh0BiHQsnwC4=;
 b=LhoPx7nkgwr149szICVf2hlv3cBSCcG/Z0lJvj4AHXQNWrPLMWpWZOptMEsJgoqxg48+AmjonQslomEJ21HbrKP97XSvb7saBQVunKy+QCUSqwLlaZFMm4eOL3gyQGx25tuhVa1sWRxftXphiMHhAq5UAPGe/7hG3Ubnp7VUDt+nv34Xyg2lmgbni07Cs3JTUbbLBHKSVoe3B4Ica8w1ZvPSrKNBZYklb4Jqp6z+mOGZDQfASVCbcERhHIOWbJ7L3Dx06QGhqSpXoHvABBwwtWTIROYhhmMeU3C1ZrEHywXuVdYUFCFxwmEKRTonhaT7QvyvxnpVcVWmdIbEGJSe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTeq4ElXAL87ZZttzhk3QHQ3StvVGLTLh0BiHQsnwC4=;
 b=iLeh+1yz0MlN4Ormh8AqpevpbZRtSF3+uQx/EG8WlTYHg1EvOPEnV2buGNmBC1MZspqA9MnsZmfgsDA5ChEl/BTt+cipUSrJKy51+YzbRv09BU10bywN+c2I89c+pJTIDS02nw6KVcfS5oblDqX2Sw+ZBNYctddAGtEkrhQ2tRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:05 +0000
Message-ID: <87r03lfq5j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 017/157] ASoC: codec: cs4270: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:04 +0000
X-ClientProxiedBy: TYAPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:404:28::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: e413b009-d83d-4ade-03e6-08dd56053cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WSyRHW8vvmcpkflODXHmF0itzTSyjtM+bcKgtGVafBRe9oBFz6WT6hfmUai4?=
 =?us-ascii?Q?72YLdzcjRjCpU6SXYfYVgsIRz6Lu82CH6Xo+HEw1JVV4ao5TuSOuWcIIcWJJ?=
 =?us-ascii?Q?Dh7ra9XBbNbXswlMIFNlVuwtuNcaddDXxONSJEPcb+XRfG0it48pX0oPZFqm?=
 =?us-ascii?Q?QUxxaSUiTqlk1hFEd500tEeIta5FVshw9VJ5aZ3iKJLzFMsZpjgJ1HctX7x7?=
 =?us-ascii?Q?Ct45bu5qfERYhC3SMuM8aqVH1Kbozt4S/KLM69/SzWTOWjZ6fHdSUYtJWg81?=
 =?us-ascii?Q?iK5wX/Qx+MDPYJK/FRgBrutXFZ3RtxgSgiOEGED1FL9KRmnlEQsjY6vZ5BS7?=
 =?us-ascii?Q?FhDMQJglfyOp+O1k7srZU3lIpezPtoAylX3kOj2W1M61vZ0U7XZ9iICuioq6?=
 =?us-ascii?Q?soosymqD7vAx/C6CJmnkSZmaddt49OY0AsY1gqsHfwn5O1JDFt1TA9rKjZIj?=
 =?us-ascii?Q?1utE/Uye7vDvLg2r+EchHa1zfU0ve5OI/3I3CBVSrVIASsvV0i31uOoX2GAY?=
 =?us-ascii?Q?MuqffQeHSuqk9zinK9K8xtHJUG1mKNs6Er6NCAE2fdW3GrRhtdxGFl0csZvN?=
 =?us-ascii?Q?MQNUUWEkxr/cKSctebhOs1x1bV3AXTrT0CThs1gnrZU53MgY1PvE2s/1Ok8u?=
 =?us-ascii?Q?AFiPf+wgwhuYbtX8Qbba/X414SsSwTrWqM6aGRZXlEqWn21CbQ29SvfdfukM?=
 =?us-ascii?Q?M7YzCatEPy+48qnH75st1QJjqeGxzVj1k3mOmPieaksy9aosypHUecbuZPF0?=
 =?us-ascii?Q?zyj2E2LyRSxIZputUP6msM+xjR+yYJNidniHmtq5TovodRmyN+ZEryqZwaUu?=
 =?us-ascii?Q?DPzSMOTk8DEoInlEgNzvpcp0cEj0g1kNJJSfgNfLHFvIsZDqpLFrv8hintDn?=
 =?us-ascii?Q?qwCIQ8Xo0NM/SoM70kNuwR2qh39g3HEOiiZZCc1oDABpJRWfDHvdHrb/MHMn?=
 =?us-ascii?Q?WvdBY4o3kvocJQQwUgfebVX7kIpiHW32gagBaOrnd81gp3oHLeIYqG3nHVSU?=
 =?us-ascii?Q?1gdtlVREieBJZg4+apQDmpuClSV4i4UpR9GewfrFRLLAcNjAuJoanR749Tew?=
 =?us-ascii?Q?H+MGWhiqYTj7SFTbTlh8WxlNpo2rBEysbngxiouodJXORPGGCPRXS/QnLakN?=
 =?us-ascii?Q?OrilmcBPa4C53pM9gMWtpDqfErPmbrrEZinAqafe/yhjIrsW7xnk3HQltJL5?=
 =?us-ascii?Q?qsW0CSXjigiFXFAYM/hr3H8kcIbphYUCPaS2reeRKP7GnBrPHyCxaD3WjjbA?=
 =?us-ascii?Q?nZh+2cFPixybtcPa8hm2FZlEYDdC08Ogqzg5C0rrodajmrsSiBQTz6NR9pov?=
 =?us-ascii?Q?+uf09VcjMOTcqLLEIj5XVqbMS16W5tjCnCeRPqnj/2E/GC3e3kzgUoy2zz1F?=
 =?us-ascii?Q?f6j3+FhTOEfIDbnuFxayzm+1OTiwrQX7SpuMkkpwlaNtp+OUlftr2vmB6UcE?=
 =?us-ascii?Q?MLBgXjO3HW0aBBCR1qlcpF0VhbI4LqPM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bI5Zddec+kMjuyllxQW8kIvQO8rhX1qsohLAD9ZtA6T1ImsbSd37U8VOGP7n?=
 =?us-ascii?Q?r1aDV1tjYDohcqO0jpNoqdNAqteTTdI6CGW0PjlNVLgfamS0eTJtKTgqtHrp?=
 =?us-ascii?Q?AzS9fY8yUZQ0ChtjbfwZW3Z7A6Q07dCEmkrawpRm9RRXj12LiO/WSApUbnb7?=
 =?us-ascii?Q?Cg/FMGRSkEbuiG53Y3atL/VZf4NwIyQMSAjtoOp0nxzKX1LnWzQ7zbTUbG2k?=
 =?us-ascii?Q?RjdGJbpNUB39C/2Z19HN25SQ6SUDXg02+bHOp7DZSYhkWQQMnD7k/Q9YLA/x?=
 =?us-ascii?Q?ElFRztA9b+7J89JoR/w6Q5xxCxBKffZMQwMi21QBEWPOpkWJqTQpz2/jXv9s?=
 =?us-ascii?Q?hi5nk+ykO5FgoKUxcNz1p1Zr1CegZZT83Vy6KitOVKW0l9n2fUp4VLVm2T25?=
 =?us-ascii?Q?UasVUDceYDBwZd3guqJ1fMD4JhKc8o9W9nKB3G7YqILOeQhS0MmZe2l+Yz0P?=
 =?us-ascii?Q?M2IMJCHt8HM5IfU+12XZeDEoP8InxYzlgFV9AcGgLLny81dk2TCRPWseZiQR?=
 =?us-ascii?Q?tS0R6UeaX8yZtUrQSgQ1RNTCL3SX39+r0vfERpaSlnigt5xYwV/orriPgGuf?=
 =?us-ascii?Q?0nQxlH+NgHXwaDkAeTXnN3rYN55dFYCYCWYh+S8iGmIQEvJzfD1GDFlNmWU6?=
 =?us-ascii?Q?Y2CBJ4Yf7lglcI3Q56JOZGOouavWb+I5ET/yfPHa10fqZHG2KAj9QdGUiFgR?=
 =?us-ascii?Q?yuT2Bi5WvqbP2u3J8byVPUBsnMJ69zacHf6b0XyGeoWFvDQOIK+428FYl4cR?=
 =?us-ascii?Q?phMFH9wMuX7Pq3wkptBQOhMLGuvmYznyN/BzP0T6cB/xIf14dokozb/NwR4v?=
 =?us-ascii?Q?Bt+M/DOCDbHVKbxH/50Odxx3urPMUjAMr24XYko88p9DkZD+Opl9k0AhtN64?=
 =?us-ascii?Q?8LPoIkr9BipQvabhaIoIue/46Zz35AdCKcKIcaVbapFNY5tYX69eZQ6DY4S4?=
 =?us-ascii?Q?34ovbGFfSsxMANqUL+WIYRJtsOxzNWdREKtVxr+0vj3suE0m5+jqnUoEbDqB?=
 =?us-ascii?Q?a+DLSz9jFmsYS5xh1NRv5TLFgPmtPBZVgDWWWsNiKeE33yefpCLX0j0GMbjA?=
 =?us-ascii?Q?SvvjRS6za4jM9dAP5SDaczD7KbKXZk8tbbhFJ66aRmzip0rQ2lDJtU+ctt75?=
 =?us-ascii?Q?TGFz9tuwcIc2GkTdF/dQyT0G9s4Nla3bP4uGslHg8N6w7VIIaRYNQa3o0XF0?=
 =?us-ascii?Q?C0ZavkKV46TbWea7xRIz8xoTb4sBrQmXmDfZBAho21N9FclXWfrtiaU24TPq?=
 =?us-ascii?Q?MlNo35cTl0av9bBxTvEWXYXDZmUvAK/M196+m8oXynv4khcsTVWt0xFXZJnG?=
 =?us-ascii?Q?aHOyrgNCKlkOO7S6pUZjN+z08MDTSlDowJqKKvjBn5AH5SLVJQ6TY6ykUvRl?=
 =?us-ascii?Q?Pmu8nTKCH3m3ta7CJaE+kSOWkzlGKHfnDmhYVM91mNsjQOaRieO1tC0nSCf2?=
 =?us-ascii?Q?QujqayYOqHF6+peA4RcHOxMCll6k1b/5AGboLEaSR3roo0pEdAXbL6KU5MpN?=
 =?us-ascii?Q?uPwP9N9vutfN0RU0TQhuD983qYmBX0NIaeObIt1WQDrcZWhARQyPDTp6U71d?=
 =?us-ascii?Q?pYN5xKX3BvOAO1fESaa4CBQU3YCYoeIJ5Eznoog10X0FGbfLuCZNvroQT1O/?=
 =?us-ascii?Q?ec/iPC8Jzr24W9J/rNdi+pM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e413b009-d83d-4ade-03e6-08dd56053cb4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:05.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/MIWtCN4a1j5V2JubAHpKR8Tk0tWlvNZ+DqNYeO1dUgMq662GC08fgoT5rGy2N5ciYivs1IeiQOnxIvMWXntERV0piT5ushOlFGc4jMpy2DpxMiPBJ19pkxunryxO3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs4270.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 67e92bfecb56..9f9dc8b017a3 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -287,10 +287,10 @@ static int cs4270_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		cs4270->slave_mode = 1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		cs4270->slave_mode = 0;
 		break;
 	default:
-- 
2.43.0

