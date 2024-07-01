Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2063.outbound.protection.outlook.com [40.107.114.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5132566;
	Mon,  1 Jul 2024 00:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719794318; cv=fail; b=Eb8l4x/T8MkGrjKV9UUMysnbO0izTv0ZiPtTG9pMJgrL0Z2gWsSVTR7W8S086PhjWsc+bALbgs0kTWaWHjjqm0xQbeoQmpr7+WhEO4Xnm56hzXznyjfMZKTgKxT1CKrUY4H7EC9VlkcTHsPsICaP9g674yBOHa/tOKq/p9yfnvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719794318; c=relaxed/simple;
	bh=oTBlefgqAwzf4AEiLkBxMeXeBNgPnqHP3i6fwy1pGI4=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=Jj3C468jY60oCGQQLX9KXMIOdkHjbFp2/DbD/q94OIKkfgieezPVXRih4uktxRj4ZnA8YocQ0h4lXXsCf5XxAhM6la1/6VYS9PnAGFv31YxE7KNg0oEicQ0tt0V2b2q8Rxna5PPaJjpyaXW/0xPkw3Hu8Fvsgu1F1oxvWcPJDpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HYFsHvMr; arc=fail smtp.client-ip=40.107.114.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HYFsHvMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDMkkArwIdl8ug6EkGuR2VkB7Plgl0cZdFZdB3ZX3whDNuE1Zm9iBW7WdvKFLNW8KeXtF000JfhRKdzAUWndi4LyJWXNuuqnNBm6gK7DJO8I2Fd9wTiWla+e5MjACZdtYDcTS0HqoUNhGL4XhIcvVPNI0i19fgBzN3GRcQN0IvhxNNOeFZU41xVFs3R6J3gCHaSc2Qv4fvB+ReuZBCia6gD4xtY4804C4gRdF7qWqTwKRFcHu0jtwlnVmR51t31svKEAjn0SzhM0nk323E+Rn/MZpZXYQyFJU6vgjV95KCgqBr9ai1sYEgA4TjILsFoUV7BZE6/Y2VGOB0G7BPlNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZebVMWwg9zKIthh1fxEf8qSQc6nLV0/WsKSWICJOcw=;
 b=TZotyX4C1H8ZDhrdGUEcAA5ALUQuABiTEptn6e7J9hoqtPm6d2+Xh+cMC71WYk3WasUfuxde9IIhIsF8HYdS7/EMbRZyhJa8BPLbiISvhYIhhUOzKhslgvag8kS50xuTlBLIoIkoSFdVbZlUibYrrdOOT4aFP4rdNfucCZqK8h2mtY/kO1bhN5CJtWM3uf8iCjRbcG7Ux82y0P23B4PNHYa8/R8RUBy2qNg3VavzAz7PM78t/AB7zfKbqa7HIaNJDYe5HZ5LyDDD1LM3LO6EBuE4O3XpvRirWcHvv8VO8Ts0ZYum8LB8WNwj/C4wvkSTgqRbnkveGrrxhTCE24h9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZebVMWwg9zKIthh1fxEf8qSQc6nLV0/WsKSWICJOcw=;
 b=HYFsHvMrKWyBcdE/VYcDwqH9y8vkurT3s6L1ezg854gn34v42PNORZS0C1pYoG667TFZfAfx6auONBEQcLzUY7hyHMUvU1l6qdY2b3cS4i9TLpus8ZBWPK2IszdY5Myhk+FIWcTfi7+zTdtV0L9KktXbQ117I7Q1MNs+nov0vjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10788.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 00:38:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 00:38:31 +0000
Message-ID: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v5 0/2] ASoC: simple-audio-mux: add state-labels
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 00:38:31 +0000
X-ClientProxiedBy: TYCPR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:4::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10788:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ec6a81-dd00-4f5a-7d6f-08dc996621b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6EFyp0b8OZWa8RSD5XWDHzrMIZjQqMg9UHgigbGjJ08YOhWX4bU+e5IaMYzG?=
 =?us-ascii?Q?P3y14DU3yql5ihsi+44H6OekSM9RhF7+sYaDqzYEkqAYxc3JvHLU15IqCtdj?=
 =?us-ascii?Q?6xUZRBBAw0gIf0vTcz4AL7SDEf6t2iKzCrOWEPRl04QcFCvfKrrHgAJPUzkK?=
 =?us-ascii?Q?9K7CuRHEsCSq+ui+iP7IX1ulA48KkNgIxHPXVGzCRb1IThnwcR+gNo91+bif?=
 =?us-ascii?Q?ov3F0oZneNpXhdtPvGbzCkyLdqWYSIxnGWtJmwvzoQp7bJlKB67TA7+IV64i?=
 =?us-ascii?Q?zj5gxK6Ie/o3RN5e43qOa1OlUs1Gk0SVkYp5xYnnvE4EpwSqXY34ZOtYM9X7?=
 =?us-ascii?Q?90kQSw200t/+Db+hTQi+61fcnhgrMQ1Hpwt55S3nbskRllvTJYNL3ykZ9VRf?=
 =?us-ascii?Q?jQek+IP+YKkErpZzXl1sUJvbyqPHetK1LmwoFQH4B0cfGv/whv+8leIjCjIp?=
 =?us-ascii?Q?m9gxL7FrfeqV/dE8J42SWAgX+tc3siFSjPsKUYWqpaOon49PoanpySEKrfyU?=
 =?us-ascii?Q?yINE4tbDN0nzCB6FmImyddYC9y2xIT4x9p4gKjvlrGnX3DIio521l6Tb9il9?=
 =?us-ascii?Q?g1iFYxPpToLqiTEl21ETd2q7HQQb1gm+2FmBlvnMSYG9AGean0DK0rQu5E3r?=
 =?us-ascii?Q?vPuyGyjGVMPI3YugodVokamObz0CgcmDCtVNxdhk5eJs8azxUzd7MdjFn+ar?=
 =?us-ascii?Q?uAEDsVplCUDN9gfy8F4UqvDi8A0JLe1e/TqA5ouNKnKiowywUZcRK/lWTEzy?=
 =?us-ascii?Q?ePoGSLz5vceBoiPMCZ8Wsg9KY3E2iaGMbFWwXKPVqKw/LsOwsWDAA/OLuiyc?=
 =?us-ascii?Q?NilBF/Bt9p+nxEVWM63NrMI9nIMgGaLRXuI8w2a8muL10vj4HHg34Jt4U/y1?=
 =?us-ascii?Q?s0I1lB+XK15xtLS4+C3+pLH0aSsmbeV6+zIsNtMJOXE45ff0zx9pscPjNsLm?=
 =?us-ascii?Q?o9zgyt+YVnfe+HUcM6McxM9Y3gXGo1FofcUz4KvLmA8dTaYbOyZ7EnGkBpnh?=
 =?us-ascii?Q?sNoOJD2VpV6yUXX2P/+OdxA9JiagWVJmU+krRYN8LJ/A1qKzVBDC0i1vHCaD?=
 =?us-ascii?Q?lfYDNJrX4lwto0BWURFU5GQsDjtsppaBUowezk+llrbMW9aPdRXMzIrvAB6S?=
 =?us-ascii?Q?byH5sxXYeBB86QU+oztjnIwVWoIHCCHYZCfzfgowAycGNbssJtK6FoU+9wNR?=
 =?us-ascii?Q?vlel/EOikNCKtCVIidAg0hjBFGU4bICaDlFR8NGPqScRTIXpkDEawMMPiPoL?=
 =?us-ascii?Q?cNUlrXugMJcsAfpMo9SLpS8d7TCOnFFGv2aYTIpanJzRtpmdK+FJefCLT93b?=
 =?us-ascii?Q?B8GVX7ZIr+JmhuSg/Hn79gr31+yexjSKc6iV9GDE6pKEwOQX+/z0+M4CxJBJ?=
 =?us-ascii?Q?bkZqNyzJIeuEgpeiQy2+h7UOLqwb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wH3nM113930V0efOWHjYVstO8oJAMZfO73mYvQyZb/MctaxNLIeIl/cdM0lR?=
 =?us-ascii?Q?dLqCCRGq/NbI6XxrpYolEeHjekqBfSBlNPv6rO0YmAS1k4HXaSjwX8fwUnH5?=
 =?us-ascii?Q?YG8tlQ0u0CnCDU/DVbIgYk+NO7X5D7f+4+2w+ioWvWpZxL+slAsRU+P5MHXi?=
 =?us-ascii?Q?0aUWVaowjihTHWeIz0/d7UTsdeQe7mtjO7EZgVfmj9vH6lXD0kDHHBhORSQZ?=
 =?us-ascii?Q?GH8r7reBGliGYELCt5k2y5W6dClQtErcN45WepdziAI0VM6wddklhb83dpgl?=
 =?us-ascii?Q?ZLRq65wAEIrjEKr0RkFnriEekH0sgbXml/IaHML3WEkm9CxaanUqhC8u3m+/?=
 =?us-ascii?Q?GyR3m+eh2B3fuUXQL9b1f3cWPW8eTzaBeO1urbhkSJ/S73P2laF4KLHa29bb?=
 =?us-ascii?Q?gXGE552q8csR5rRpaY7CDB0wBM9Wj6RB71NuN5JkkG35jlZIUlFyC9WcSgL+?=
 =?us-ascii?Q?Nqetxi7XkMpEjEZPavzwLxAHlPqBajQtptQ0VmrTGJRkljohIxUlbTFnbsak?=
 =?us-ascii?Q?KdoILQ+xwLQHybfDwSTnZA9DFYTGoaM277lPNXmmWmenBJDyks3glt/IChvY?=
 =?us-ascii?Q?LcI/Yc6Ot2o7qaydCdvEA0cE0bctIcgP1+o/hPJaaMc9PUervN6fFKsFpRvk?=
 =?us-ascii?Q?qjug7bVwqGQ05yUkTzHx4nN56G8Z7u/+DJJbHUemmdKwe5loDQgK3vVC6AWY?=
 =?us-ascii?Q?rLVLK55+u6P6cYuoYNhoZl3DVLpSrHUzoWhHpNsPRpVLCtBLVBKAr9wjZ2xf?=
 =?us-ascii?Q?egeXFAE9cae5PdfSQK/dDS+D+kgGYhNivLeIPJOeuIFeZ8ls3RS5BYF9kCaf?=
 =?us-ascii?Q?Povu8oErEcVRlw8YKQkIc/4K6u986ljYYCky8l3GXtfOUQMLkDvPi95akoxf?=
 =?us-ascii?Q?ACQOgzu5InNVGo/n48gMkOrSBQATmILGNrEL0JNPfC1cV6a0gt2/Xxe2KL9m?=
 =?us-ascii?Q?ssAtqIrbfLVYnu3djrLiWnpjWC9/fwbrILAT7X3l5cjVKYSiJ/18qPNd7Vi+?=
 =?us-ascii?Q?hwyklvyL3c9JUtJXu1qS2p93U/4sj4zERixUfPOM8PpleaXmICg4IUAhhHG0?=
 =?us-ascii?Q?bLaiuM1QtDLH15NHY5z31EmFfyp08jd2Lyut7pWeQenTBA9E0Lns6F0p9jwu?=
 =?us-ascii?Q?6JbdYS4SV/CQujkqDwpcaNW3EQ8YE8kboYDGw4OIx1/dtDCiX5hyx4mzurKX?=
 =?us-ascii?Q?xCo09fqk2gWIQH9yYXi6S+PklwVu0Rf1Mk2XrRBtrEM827FIa+sVcP5OKT9Z?=
 =?us-ascii?Q?cCkh6e5OuRT1AHYjESDP+XC462CiisOYV/UAGg7dFiUCAHARrIv8rPfg9ut7?=
 =?us-ascii?Q?NJOPv0pHxV3/yyKKdQP+G0/a+SlBFKyDgxw1CS8PTcvPPk8K3DlDby14+IE2?=
 =?us-ascii?Q?WwTMDBs8NjEkmJjqHhXmiVzpkgM9tXID8U6HxiSHaffflla98Y3B49hSh61r?=
 =?us-ascii?Q?xGYLIQ1iw+i3v19bk9TuclUwqDUrH/2D6W9Ar5hxKpT/129qDGPJRmRs/aKU?=
 =?us-ascii?Q?mznyyWz//eXz3uGIdC8G1av55Xmgv+axjNS2BSZEgkLJWKk7Fcy2q7EtFOg5?=
 =?us-ascii?Q?ikShRyRZ1X7+VBFYCaaktQ1bjyhdGNmWojQAUN7DTNztMfEfC4ISjjNGzvcX?=
 =?us-ascii?Q?vNpO8LQ0w205JvytRSKBkro=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ec6a81-dd00-4f5a-7d6f-08dc996621b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 00:38:31.2398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4mwEITh/nm+hYVD1IA25nI9KQujdymxtRLVw1nw6LNMeKTsFnXbuWG+XeKkqfY9g9jQ5AVHLFCIcAeK1zMczMwm/UGuKky0+1p93/s3kspkQY6x/j0HsTN8eC0buFg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10788


Hi Mark

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would work,
but might be not user friendly in some case, for example in case of system
hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state names.

Original
	> amixer set "MUX" "Input 1"
	> amixer set "MUX" "Input 2"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
=>		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"
	> amixer set "MUX" "Label_B"

v4 -> v5
	- add maxItems
	- don't use "|" for description
	- tidyup patch Subject

v3 -> v4
	- add missing property type

v2 -> v3
	- expand example on Doc

v1 -> v2
	- update git-log explanation
	- update property description
	- change property name "mux-names" -> "state-labels"

Link: https://lore.kernel.org/r/87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87sewxapr5.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msn5apey.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87h6ddale3.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (2):
  ASoC: simple-audio-mux: enable to select MUX names
  ASoC: dt-bindings: simple-audio-mux: add state-labels property

 .../bindings/sound/simple-audio-mux.yaml      |  6 ++
 sound/soc/codecs/simple-mux.c                 | 55 ++++++++++++++-----
 2 files changed, 46 insertions(+), 15 deletions(-)

-- 
2.43.0

