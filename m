Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79B37F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605414; cv=fail; b=nTOvyoAkDVb/cYr49loQgvWcxdlwxL2FKhT6W9kId3/SHM4W0w8VZdlv9wyOrO1mhdnDMAipXPEQXsqtgQwjsdcXeZP/N3oKwgjC7d5nyz0FtlJ9/H1SHD8wHZHu/1HA+pW5jUANESM/lSQj0tffklBdhCT/Y22Kiv2MCEgGFZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605414; c=relaxed/simple;
	bh=XjBzag0RIzKktYFi9C3PgREUgoGJth3kXXKLfkBHbrQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NzQVRogy/uoS1qDAKHY1Oep/C3v3sP0zB5NEFqBzvGvUEAC10sS6DYVO3xl5chsKE6luTzQ3kgX7iunoxnIa3jyJAkAeCIp/PbH4z5tid+PVhqzuK2WCvAk4Ob5SlrDNSlYSbdfboHW0zmcLDrMYi14fKt4h61tr9AKLFVufqQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wlv9IrnY; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wlv9IrnY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n71fPWmxxaAxIHKO6laJX8iSi/TOu7pFO4PSqj/8qjtMSP2nLr0XgSwuid7d2lF45frjxBnZYV34rZ8bLlaagh2UMUJ4TSe0VoCqNLrigFdTQ4p8KpfNDqQzXYLHN17C/Fsvs00XowEH4PuTfStoGiwWo8PgThT+QuD+XMHtucWD58Fz+LMsEqRn/LzsA48YzD4EKVUy2kUE+/pLUJFDnrH4dqvjQKFxNW2cL3AC6YmRzedChxKpe0bGDFHknyyk2bkN9u19Dc/Avu77uAAXsNRExHUQaq8CWlMSuLfWWZu36oBol/skwVVUl2WviBhn3x8Qbhg5kY6pJNrEX/5YWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBwTQ0kU7Jlv3AGSkXQdYv4J/o6yQA7hFRxofX+fPgg=;
 b=DftdLPGMUXkjeatnwkmJtRSX+XePynku3eG3+Vw4g/PWu6n0pIAkijpdYcLfHI0kcgloiEAazLb9qrQJUA2/zAFJretUHt06Mw4c/aPGmc4VFnBN+xiGW+5RQ6ycKlBJJgF0rKDlXarHHSdpQ5JSzPMbgEGJZTtuHGPhxhBjrPJ9CygcJlQ9Q3NeJgvltGzD9sRT5Lafg/F90ZQ0W/ZJ9p3fKrUOOQdvaNMxwXRs6NjjCO992XkkJkDaqHXWowr7UoiEtljwAKdyvlzv6hyI+jGvARmk93Git/eQsKSGFxSF2Way0vkx5b2CSx6q198v5QL3WlFTpJ1hT6gdSXPQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBwTQ0kU7Jlv3AGSkXQdYv4J/o6yQA7hFRxofX+fPgg=;
 b=Wlv9IrnYyU3hvye70PCHWO4xq3g58BeR/klq4Ibtwn00FDg3PxT11/BSU/ApUTxZCZkWpoEU/oNPLImvM3PgMqxZkLHTVMb/7mJ+xh9/p1E6Q2ylbfYXioOS8n2pU9ynMwMoqteIyuhHLF83QYI0zexduMcglYSYPTZeTwnGTDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:31 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:31 +0000
Message-ID: <87a4wop0yl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/29] ASoC: loongson: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:30 +0000
X-ClientProxiedBy: OS7PR01CA0216.jpnprd01.prod.outlook.com
 (2603:1096:604:252::9) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d0f0af-7cde-4769-3e31-08de79b68e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	8EKFprCY1eKw1+mDJEGwOpHEmL3ZnUBKeez8K+AMQvykRg/DEuvml20Qb63MXDnqpfd2JSH0TBv1frMwAS7pIuKn6OU1OCmx54fa0fJ6OmaDbzar3g5FFKlo4EQif+rFzrGZ393vfkcdUTurJHUhJ274us0n0IuQPh9/E27zCsRceGyxZ98/ai9s7zsChjgk4uRJY0IHBqDhk+boiHvGiHAJ9OvLwX/KTEjbXBu+MBPgdx0np8qrZwilqS+EmBeF0+CpuHq+QX5Xwhfeji9RPJy6xK7PDcir+e9lEQ2COhGsQ90559D74ftvvzciRF8RQetVXHGB9DkU/rh9N17+k4uWsEMyGWrKQy29lCyrc0VqgR90Y53LsZUrj2jgUjmhCdPolgIzl643xDgtDDFZB72UqQXEMxrB+Q7m9X6v3WexgyrAGNtDpPAkz2rvETnuazDTp6Vn/0mu7n91K53dM3LtTjwiL/LdYaUvsPqdg26rUkKzsyV8gHTHkNXElX7igqBGbXVnFh3c5c9iw2OmrncUb0+bCnTokgGvjS7P4DMpql+UtKJDwMkU4TGyGpC0a140bzE5rgBTXJNkm7zpWPCyKifhKHiQCFHxjAQ0ScS9SF/ez+RXPohQAC2Mvq8F8nu4wqFnegKs6eTk/24d2hY4rojghgi8/wUoUueaky149P0xl2iyP8jUpadZ/KQZOh7CvHYeU8MHXuQZrH4xA7ax7sczOLOivDiEzoHUZzgJCY6lHl8P+Tj3iJ05kbWv0O9h1P8i1l7lINvmpJzcBLyxf1zFta5I1FAGvg7u6hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ndRoyk122Dagw8Gctt9sJOjCE7GElpnPHh5Mo/td/WpV2+IP3OSbhPKaRpxT?=
 =?us-ascii?Q?gVz5g3iOuu8Xa/dISUxc/7OmOP6kozPLnFuT/WC8yXuMiLt4P27wieZQiYn/?=
 =?us-ascii?Q?4HZ7NKnrlUuwsm7DXTfyImxmVT5gjQ5QmLHskEBYrE959mkv7Nh3xyMfcSzK?=
 =?us-ascii?Q?3xzEsmh3eQy1MaMZYfwSes1Ht1QDORtf4JDkAqvTIjyCIBpkLCbigW4l3Ltg?=
 =?us-ascii?Q?Uk7hl+Ip7BQbUWHU7BBBf71889neD+WXC1ddm+HYydxLH3ipJoZolFJq2xxC?=
 =?us-ascii?Q?3cXLATg1Qx926eEQIbzHLjKcm54vgENAJHRovg693hPgdxJk9guurmRRwNFe?=
 =?us-ascii?Q?VOrEFnDg46HYA2rOh/xw0cymTYQ3XnHK5faJsv8Udt9XcHSXtmvCYCPVYBHG?=
 =?us-ascii?Q?f8YeFtJQkUFxhIXz7LG6EV5GI6NTgpXcob3jepMXD6pefGR3CeZzEMq69pVs?=
 =?us-ascii?Q?tOUMGqAMQSlOzXM/Yl0oeNwNPi3FvfQ1LNMhrqWHyZ4d7nqtX956ulvVu8GD?=
 =?us-ascii?Q?ONULixgej/5ZReT5VzrBEMudQTLgVYrl2q6U0CCeTCGyiTEoWDmqW3LJXH2b?=
 =?us-ascii?Q?WWP0He0ERVKGRS6WZtYM9xid278MLZn5AZYFfLNxy9HWXH5MTC3CCzRriHlD?=
 =?us-ascii?Q?7pubgRkLuia9Kcy3dAlI6hgdrryaVBPUG7tOaaiJ6E+Hpnk3EBhaw5pRgql+?=
 =?us-ascii?Q?frTF4oR8KRkBivE8esX0Twosas9YUpkRbBNrdaIkCiQmk8XevbIpGoBgzue3?=
 =?us-ascii?Q?GmhYrJG6TMPXxFzuADBVNR4BijvoQioRKXY7H6bX/lu7EhpU6SXtw6n3esuu?=
 =?us-ascii?Q?TjE143Gv7F3y5ISupe/zC0+sVUvSwrvrmH7M701OGj9K+vg+p2QKnNfPvNg7?=
 =?us-ascii?Q?pdL5hII5gg9V4enL8vX/wePExyOxC7i3Sza3jF7HPWprGrXur9OaAnHNbJvh?=
 =?us-ascii?Q?3Ta3647QVDVDf6FigvgfqCFEP8jI3mBDh0aGd7UOV8f8yBktAAX7A3YQbHDv?=
 =?us-ascii?Q?Wxh34nmCIc0bSFVJVVGLrzGBbV7jYlmdLmv/t+EuJ1NWiWoL9EBaPHGkQdpe?=
 =?us-ascii?Q?jfa9cv95HRLPPEjKrfQkMpJThgpd+LDjBZlubetZe7qu21vJXINMfnOhKruJ?=
 =?us-ascii?Q?g0g6SHLiuq9io0ARjLN+iGiU20fYNZDdDZYQ0vPKfiq2JLCDduGt5xkWbGjp?=
 =?us-ascii?Q?HTlO5Qv+BfEKhSLE+LE8hhnGhX54ELn41ppyFTjOJlDZkH4fW7+EvWzM+vkB?=
 =?us-ascii?Q?/3GadnnM0Xnk7J8HjBEFCJIrAIkXuwGjPq7cpjKvfKRyjxjfqZ3JoSmP61N2?=
 =?us-ascii?Q?P4tOWI9V5sj3tj4jmj1nZEE1idkztG666ZwIHaZVilpRt6krhJWeizXa06Pn?=
 =?us-ascii?Q?vWXBjGuBaeKiuLy+stLjm+OCdMaXnvjWe3Swchrn4GNOGV1ZMvgRkPkWgXG3?=
 =?us-ascii?Q?k59IpwLGVAQ5zSE5ge4DxOKRje39De0ag5+pYnZ/CAFTQ0PEne/HKWSlr0Vg?=
 =?us-ascii?Q?o/Oigjgz3POs51CZJOgmdvVbtejysylTZQyYVADu9I83dK2to7r2pilTglcz?=
 =?us-ascii?Q?tmu1mXy3rnikRn8Bsb5MOp4uJ2/MZyj/hYiZxtEQdHeVW1gtl0WRWNXX41QG?=
 =?us-ascii?Q?zoDxktMi/XS+BJvNKX3x2wCX2vs8pUXQjgKrkSL9wTWxNcXTmQ1KpxkkD2ad?=
 =?us-ascii?Q?KI5jxw8PyEB8q4zWOVBDsGu31vY4kJ+GvW8Fa0ukSYfE2rki+kb9FQwaf5Ms?=
 =?us-ascii?Q?ZPUeU1Nr+BvIG86gWZjsV3ZFs27jS+Srui3Y+uCHpzoJZZUa98eR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d0f0af-7cde-4769-3e31-08de79b68e37
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:31.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +n5iAFLzdqPPv4xRcn4o4jS7rPzfd/QjDtBTyFpJz8uCjEYd/G8gsS6MrEEUTLkx7PdQiXK0kENc3cGZkMS79lN5NCwLENKSkQTnOp9yQJ4zfODw9OftNM/sGM7hB4h1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index f26b2951bc9c0..a149b643175c0 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -341,5 +341,5 @@ const struct snd_soc_component_driver loongson_i2s_component = {
 	.trigger	= loongson_pcm_trigger,
 	.pointer	= loongson_pcm_pointer,
 	.mmap		= loongson_pcm_mmap,
-	.pcm_construct	= loongson_pcm_new,
+	.pcm_new	= loongson_pcm_new,
 };
-- 
2.43.0

