Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E2B344DBB
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055010; cv=fail; b=Ca3DzUoA9Yo3W9+DtJ0jq1ghASVA1ZnvZrvLTrz/8mpFSbLBgLpJ6zQuWCHiK9ScQ0OyxqZ+ljng3RmoK3QCAyGgNLi3I9pqF58tcljqkdv5bsgHPbUhV1rzR7SwKsGtbbpugZFDv+7WC4KZC+Mg3KHkG3kOll3byQFXrLD4Os4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055010; c=relaxed/simple;
	bh=My6QuwEUCkb/weXFWk8UWDQ1GY54EqrK0dQ52NJTM0k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KPwYBGZARvtsXXsUBqOfajBr7d//2PloH2azmy3P4SLWuck1C+TaSiFOSL7fhTMk8nI4WfwZDh0k99MCX52fI8KDAnAwwScyqqbMFQFBcavouYoSXe/KhR1j7u1fwf3U7qy0v4KrKJb1i23dsE7Ok+7ciWYvdU/lPIDsqIGm0u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wa97hmT3; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wa97hmT3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wx8Laf0Fh5Z3PSwZ9Ao4lBik8nWY7B/waLE7DRJPUZK9T5Z8og5EJJUkyY7VtirNBtWjf4rp3RLg3TWARIQVhOQ9F7GgvQRPRJjE9+XBPJ9la0KLm0wF+1hxr99wANuqSJodCVi4uBJXqYuViaw+3/VdLdVZc8KbMOAUDzlxOpT/jf+sDccwGYL6ESsHvsGHQfH58f1w2lpIlg2+TRftMZId0/6kWJWjBpPn/roaoeVbbNK4+vBS6gJhJBBWZDPF2rojxhXRbGybSKP7QBJyaBBTnHhmBdqq/4o6BYC/DhJM3cy4YLJMqyq7w/Oi4Rs/y/8WA/IwzJDDwIbMar5Jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDM0puS7JSaIXfmlvnLTwyp0DiK0z56VJe7Lx+EPz14=;
 b=C/bWcdnAhwxutXCAjnJrimBs5wN+oOqfoIv2ogpZOuDv3vBomwBkF3NLGzx7Y1/DyE1ZxAxnZ2lLXe797TQ8i5kkMMbOIjAZj0X0lrpM9h0KjGljhI3uzfxHnY7Ct9zFLuGlsOTzSJWWsz8bLC2dZaB0sfJD25FymHGgfscFWidvC7KDCBWMsUWJjCf10pZ3CKck5Ny98RtN/vT6Bb7iUfRspZnHEv2mmMX7dbNVQx1e2x9KKkm1ObInVvGOxaVsRVSuvEo2lxQ2T7h9nRaUgUt1GkWG9cHAb/bOl/hF3XuqM8c0CtLKWTHOOcI7M8ujUOl7LUU9CPBxlG+4bR2z6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDM0puS7JSaIXfmlvnLTwyp0DiK0z56VJe7Lx+EPz14=;
 b=Wa97hmT3wLxQ+x9OtH4NGB9ukmK83O8hdVnDVBw7YZs1WivM3iUXmXYhsIvBpjILSpDNMy+kYOanMDoRbcu2gWDgB+Pqlynzi2x4C1UHm1JaPyfg/GZy3/ljRl/WLGDUInPLqBAPWtB7C3sfkvXD1iTQPxRoPJBQyMAmHISQt04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10018.jpnprd01.prod.outlook.com (2603:1096:400:1e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 05:03:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 05:03:13 +0000
Message-ID: <87v7aw64xb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood
 <lgirdwood@gmail.com>,<linux-sound@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 0/8] ASoC: add [devm_]snd_soc_register_component_with_name()
In-Reply-To: <64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>	<64a890c1-5db9-4bfe-bf28-4ab5e4d1b1af@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Jul 2026 05:03:13 +0000
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10018:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf91135-79e6-44d2-4047-08ded8c06293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|23010399003|38350700014|18002099003|22082099003|3023799007|56012099006|6133799003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	APUsVBDYd/pk4TbGsaKjPMe2sqqwmbheKoU1Wp7uaTaFt6ZloFH+8UxgZ/9JftQOR9Q/LxRK3E/kCH0kTq+6KjTN9KJPoLk25eQtBgYUH8D4+zWL99tplg6IFkt/QQMD8do3kM2gEtpU0MXfhlCUI/bilfV122OVXkH0KiumuK2Y7Ic20S5pNsFJIEgIayPUlbQlCF7x67W383EfQxWYRMg3tarnzFKHi6obEuaIv7rjxnl/tDj9ibgg8CVg5ETpveengO7CkZbwVnm51IjSPtFw6zROTFP07B/8LLA3Jpde1sYopxb/+t6MSoQHuTqFo/PSucqZgG7lxAoWQzY7sy/RK949BPGouxM3I3FHvl4uOaglPAHRvU4VSmYvGkkg1ou4ymeUXNmfDAxLyY4+yBOLS9Es5r+3cuk3gdASR3XoczGudvNH7sDfbtXXPDUWnJWqfEEo3R+gQHJhxU7MLGwpu/EsJwcqPHHWkz3VfkNiP3cqDbi1GOlW/l2+LIqMunGg8js1PnKACVnHQRR01TquX/CSqaCob4DUgarEu5KDTqeq94rUGRVH8n7J0PuKtE3uojg7EKf6aXYUgzhS99KSx34+7LKKD2VYs7f7pTjruYuXR7Hh4E5YxfwceGYMlLCv81T7qiTKmACAZ9wGotviHpr8rRRCozZNtCFqYPcIhkw72AKa1i4x+f70WmieMGP5FeE3ZPK+PCgnUJCz8/TMTnGilHOi/Sg3LZHMe4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(23010399003)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fggM+nmRT3xQO+8bGIHiuOp6TvxdtaXdoKUxI0fuH3oCeA+5cchi0PbVKFP5?=
 =?us-ascii?Q?LyCu5RcEdHOJW4eo+g8wTF6i2RyHrTavuiT/X6tY6xQAjOhA/G705PGPlEjB?=
 =?us-ascii?Q?Ql1QUEHTO/9yGjKUxqtJ92nDKYjSEp6lyk0jqp9+BhgLus+LRmfWZkbjRqJb?=
 =?us-ascii?Q?Ykpoj0Zv8XlVXs/9JruZFhZUDk4kjf9jT4Rtf8mczca1tItPO+Jew7cVT+/a?=
 =?us-ascii?Q?dNMHHE6XOaMlJnGPhYA6zCg/O9TafZdFqxUIttNkWLBQqCsdShrySY2me0yN?=
 =?us-ascii?Q?PGm75rSZpRMEO28NBfwZPFEyAfngNbxwhkwqXCWIqSzoLV4Mub/BpZIhVvj3?=
 =?us-ascii?Q?ugRlZRta3N/c1+zgd8ftN5h9zoI8Ei9moFsYk5WN47x0Z9lEnM9NL2OSYTW+?=
 =?us-ascii?Q?CHtDGY4cd0OjjO+MfyyFeo2uOXanZPjWmhkQ0mSx/2VDfJl/i90KPmnVlSc0?=
 =?us-ascii?Q?o0WoKEbI4mDBKZAkHDGVsbk5g5oogU5Y1+X3rdFaaYBOu6BL3v/tbWW60FbF?=
 =?us-ascii?Q?Y8B2kclXi7wbcbbbxhdNl5ccRbvkqMAgmETkqLFzZYJ+W4ivlEcKdb7aMaOA?=
 =?us-ascii?Q?G1Jz/Ti3/qMe9ONRd5T3McioOfoaQoxwhyZhKMEyHnaHr0hTi7dnlHKwf0pp?=
 =?us-ascii?Q?f2/Ux8+H6N6GCWiMUw1OuwLgfnqsmDrUzqaWhivxPtw6er7uD2fM1qBfw9vQ?=
 =?us-ascii?Q?OIubKbZVm+GT/Xf5ibBk2UzXGXpGdXiDrwIMGfX0msHIljWRpN6anCGI9tLx?=
 =?us-ascii?Q?6zkgRkUJ1TxeErHkyzM5G3EPvX2bB3mE+KH3xO1WuRYFyDzn3slgSA4XWA/4?=
 =?us-ascii?Q?/G5MgrcS487jhZ5W2jnQc/Ik4NxROSW7sKWLc+SI8+Xei67b/c9z0aG/6se6?=
 =?us-ascii?Q?gS/iUn6f+joU6JhjC9hNd5p5k0z7SpzskcTeNS7R0am1xg6obcXe6vnZ/jPQ?=
 =?us-ascii?Q?kwPAUXw68P3IeAySAx4kllScx1cgBSIQKSCdwIhPvroZ4O8hu2YYw6ByWZTB?=
 =?us-ascii?Q?fX2fJeUwuW7QzDXaASZr6s+ME+v+v/CeGSvMXjdoAQJkqWggV/4NG+AlnYLX?=
 =?us-ascii?Q?A1NC3h84fXVCzIoSfv9syTa2UrwfUFCUv/qjMBz1brDPi1XSKOxhOz02pEE2?=
 =?us-ascii?Q?xvWHVgzgCZM35mGf+KdcK7KH6eGw0k04IpP6ZRRJO8tVHUsN6GK5Lrvx5pW5?=
 =?us-ascii?Q?PGGmGxf25qxX4aiZODkT4HRZFG6s1jldsfc94ye+GcV5+3b4NA0Mj2ikEwkl?=
 =?us-ascii?Q?IPS58WPUpNSckbCZIL4r4P5ri6Im70LDIcIH8LqQt3DXvAWpDmbcMKm6/vWf?=
 =?us-ascii?Q?ezmYxyxakY/HgW2ejJiOhh+lgkiQtg7iDQ/i7E5PtVy3EF7XZSh2k9X2wB+D?=
 =?us-ascii?Q?SrafvAMHyLPBPSEqcXjxLyUsx9y1CMc35jRX1ri8liLUEtOa9Ik1PHJEZKcf?=
 =?us-ascii?Q?ab4aV5LAT6fb19DvtCEwXVCn+mPfhVrGYTWouO1KxE3ZyjxwR5EUfHl6orGo?=
 =?us-ascii?Q?SXllTrXmICMKgGvl7Urd/DxYJ+oC6Kan+9jR8kK6U+RlmYBxtj7TNYq5p/Yx?=
 =?us-ascii?Q?xLW8PtwRpZu+hjK7SNWFOu+1Z30712am1gFgkg2bySdX3N+JGvzBo45g2yHa?=
 =?us-ascii?Q?xMLfVl+IFBs0zNxK7C4UxLPqU7cNwldng02cnLRz9/bcsuZ6oS/sSJuEGzaY?=
 =?us-ascii?Q?WtGvGJ37VKTREbTmesyNb6gV/aJDMkiHGhgQaex+Yss2ikkiRtCpTBxoVYl8?=
 =?us-ascii?Q?h4ipwPWOHFm4UCvpUuuj0SyPV4cFm7eFhs+dWPbxZgj66p9LrO3g?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf91135-79e6-44d2-4047-08ded8c06293
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:03:13.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsoT2V8GGP8QOi8yRU5E5gy8cd5qZHUwnoHDB2eVGK1qaJAysZJy/rWqKxqZkPeaO7lBtmIEk4S2+q2if4jHeXWxvfLkawlPoXF82Gdkg4N++X2Xakkbat5DG4kC3BYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10018


Hi Cezary

> > Current component has component->name, to setup it, user need to use
> > snd_soc_component_initialize() / snd_soc_add_component() directly
> > instead of using snd_soc_register_component().
> 
> While I'd prefer the trio (init/add/register) to be left as is, with the 
> register function getting updated with "name" parameter, all 
> snd_soc_component_initialize/add() users could be moved to 
> snd_soc_register_component().

My plan is like this

	component = snd_soc_component_alloc(dev);

	snd_soc_component_attach_name(component, xxx);
	snd_soc_component_attach_xxxx(component, xxx);
	snd_soc_component_attach_xxxx(component, xxx);

	snd_soc_component_register(component, ...); // = initialize() + add()

> I've came to conclusion that perhaps seeing the offending driver will 
> help me better understand the need for all of this.  Could you point me 
> to driver (or drivers) which triggered the entire notion of privatizing 
> struct snd_soc_component ?

Not only Component but DAI/Card, too.
And I forgot detail driver names, because I'm cleanuping all ASoC drivers
(= it is over 200). But basically, from general theory.

I have talked this topic with Mark before working. And he have agreed,
and mentioned that he had been received such request from other ASoC core
member (I forgot who he is).

But I remember that some driver updated xx->id which is set by ASoC, and
driver is only allowed to reference it, it shouldn't update it, but did it.
And/or, there was a case that if you want to update some member of them,
it requires to call some function after updating. And this must be done
in a specific order. But, not all drivers did it, etc, etc, etc.
These issues are already solved. But there may still exist which is not yet
discovered.

If people access to member freely without any restrictions, issues cannot
be detected at compile time, and makes cleanup and/or updates difficult.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
