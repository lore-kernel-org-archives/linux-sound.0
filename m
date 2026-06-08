Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18074A59
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880277; cv=fail; b=mN3EnvcURjmix+mYUzXMPlKWBEYvaE41/nYxk7bRsIeRoYe7PKyXuUmq4y2emgwwgvAWmbccBiY8kpLRVcdDw43Yvc526KDoNrxWLeDBZnWHoJEKeTrI3j4UhhKaAfgQ+dNK7w9u1cGJXXwZmi8W0/rXi3il3jOMJdeGHiABS1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880277; c=relaxed/simple;
	bh=9oiQhOWzTGu9EgDfvfvyURePKvpIpCDNVFheBeXvS/U=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gGvg8gzg3w5E7lnqZi7K/KWalDFGdXXfzdhZcH0w+gzmqTzsz28DAmzADXbWjOA3OB++UVaLib1Jxn0a2KzGqCvDp9zvvfcYJyu8YvJibgUz3lYo5xDhlq2UohyuVYpjpW1LABHydA2xDG6u+6ZHejvqgE9Zc5V5+3ssZfc0iOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pPb6H5Y7; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pPb6H5Y7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP60fSdC1Mp2h4bXxIgN42ABlVkG41xluAqipBl+vDayaB/CHFFR4L9lBGrwCNI3ussmaitCBFV50GtJTRmJt7+hMjhGQd9sBG6XkSIgu4fUs7GYKXAlrje6tX3loYGp+/Ovsg3hg3wseAvV579QCCp64Crut2XhRM0fv/yhdkmJYpMaT0v9Eodnx2atelHqbLeqfOkpJALoIN80TWEi9L6xEJwnW7S0cY0l4b+EgkodwwKn2xNx8cW4ZWJT+/HYTHzzMDqIN//b9RKlgdsWhiPs3179AF8dIIS1kVnS4CFaFCoF+x7Cmv/6XcL2TcXjVrWkPxlO/90ZHbSA4JI7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko/aR1P9zjKJkoFNOMfiXBW3kmCuwjb3tEtCBvbg8BQ=;
 b=COadeb8+gIJvGvvEKoDO05P+EtqxYSxO4y5nIfpl5VdwHwFkKBDNHiSsI7MQSUA2mbRuQbTdR4+7kXLW8jzRlPgVJfBt3nLSa8xnBwHG96wtcFJmx6Gphqi16NR58ARtjwPHQLFkVekpq0Z9E1N3QCF1rZJyRdZGTNi84D89oMyihb3A0qEZ9914oQjS2swRXqZ0aoA1kKXjr0kYh6qsM1hZ20PHQ8Bz7sX6pAsvB3X38jh0Dt+0Bf36gWgPldHswI9ycbxAfqwu+9Acxpp77j7LlfGaT2o/syMot6kmAulRmz9X+qZJdh/Bt5RSp0GYJgiCPKljAac+VgqBTLP9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko/aR1P9zjKJkoFNOMfiXBW3kmCuwjb3tEtCBvbg8BQ=;
 b=pPb6H5Y7eWis/F/0OLsWvaTXa0VA+xcJs3hCAYqRUawyAYby2v9UZw0yaWewDFZH5aVO+dJ8+dnvET26u1qqZ/YBYm7RwW58H+39MC1PfGP/jSe5q7d1OsShFe3SRUL1qVncrSi1PPApfkUO7YzG4GusjKhX64YKFrrZeHuMs/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:57:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:57:53 +0000
Message-ID: <87tsrdetm7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/9] ASoC: codecs: framer-codec: don't use array if single pattarn
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:57:53 +0000
X-ClientProxiedBy: TYCP286CA0366.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad2bec5-4b73-4e35-82a5-08dec4f8f884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B43T+kM95Z5ZQO3/eQ+GFQ36VcOSGIhch2ripUJe3hxml+jDOE1lIHW9xnQ4z4wwXZojfMMphATYUapiA6dHtHSkcnE3VhVGS9TucmsbebWmVgj3PAY5QXHfJptIwOYPErWBZXoMcUVwAH/4l7/9qN2LehOjM0GKQQ0Iv08lolFlgYx5kQwpYvqAD/IjuoBhAXR5bRLpD//GF9F9YDv+Wk41PZiyxCtYOeX6fLityaScmhbB8Xl9dOxvwKQdhA0gMRyJBjtL88Xy/uGP9kNrqvDURiBDVQ2QC3ZlczTtNOBvwR1a/mCDnRPUMQC8LlFoetL7VL1gL5OT6jsEy49i9nzBPWT4g5bKWYhe69NqrDIg8cHtaAHlrxHAKj/yvfX5puxqARYZUtDgvaFl3Q3znsj3MxDyPgA4sqtdv+l8SVkaiS2I50nfYxppKAyu2B8olBLgl6fAqrsE0pNc8p6tkYOE1DEJcA6yOG74y7U5tfzGlhGrJdGOXalyU+yAVTdQHQPkL6EZyDQZNshczMmnrnf2Ig5c2Ea6syd0GN4SnjujL3Hzj8GIf+CQnI9XNb4T8sX8HEXtWDjMkMcCIUEclRU6to/M3ITDv5qXTB3L5BXuJJossIMxfb8mgGgVfx4ZD1P/A1FWhHHgzgnKPpAkleKmhw/o2JmGGfH4syEz/XhNghgnSxLvJ/tQOTNoeDNNnFsf5hDGM25rOi9DUtwzQDw1TiysFefHtlmL2HfyRrjcoyd7BVA4PsWjLUZSyxkViC/fGYBHlD5a8wXA2zY4xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JYr3WbWiRBkUmL0Kp/4L7OlGW6BfOR4ZEEUCEg2hPwL+BEgbjXcNNmv6c0CC?=
 =?us-ascii?Q?EFMk7pHl1d6nOLv7ZwWknobAsUcw/yZ9l2oSeyHzzTILVwSPFv4bkanCLVul?=
 =?us-ascii?Q?59C7ce2pSKudufxi+eMegdki4zoWBSOw+y6hcVjNfr9GhKD3W8nn0IUO5Kr9?=
 =?us-ascii?Q?/F5u18bYbR4sRxu4rBcBt49VwtbjgAVR5oUkv3hKb6PbJRGIp314zWTKt/UP?=
 =?us-ascii?Q?smq10g5OgvTzn6y3kaIAseVfBxLYICz9wBn8g/ceuavsDkFDSAViOqZZW1kN?=
 =?us-ascii?Q?EPEipNpSEsFqhEQPqwcK+zjD8530MfLpy6tlPHWmPNsf0HoRWHEGdGdcab89?=
 =?us-ascii?Q?8Liabj4hpLFnVkfvKwMjs4tHhbTOGPuhYfIULbBCDEszRAULxnw0Ux2ElFYO?=
 =?us-ascii?Q?EWurx83Vfq+GbSuigyzREJILk6fsA/Vl71/zOWuvvgj3VbBbwgFiYvgGk9Cc?=
 =?us-ascii?Q?w0XOrbxn6hRDYR/maZD3zeVwjF3dm+UIPdb2ab2ucwEGror8e0ZaH6dF6Yr8?=
 =?us-ascii?Q?mYJyZaLnE1zPVnxAfwncTawX1vlHfhNH49FKzV9Ob4I6XUG1xfpxEOiGGdDI?=
 =?us-ascii?Q?9a2w2poFQWVTn6k7zLtNQlkjBawhux3WO117/8IeLrbNS4CHHqkwxlu0NQnh?=
 =?us-ascii?Q?MFq4S4C6QBV1lJCUeknpa3KwmB/DyRUesOJzKpX1E8/9RZDsh4OUIcXmPMqx?=
 =?us-ascii?Q?DUxU5UvlDHAH0oyPaC1HsaaAE4rJ8cM11CUvf0JLIi+o8xW756y6KoKBxmwV?=
 =?us-ascii?Q?1tDUBiBLaDLl4V+zEatINMkD9w1MrRYtGLrHjFsIFpPHS0kMSxascFVlB8P4?=
 =?us-ascii?Q?yuhsMYOkSnaD0F8EGOL7jP3C/rWYxcBx5bnb8lAlwDuGA7i/qhWBcNpxfUkl?=
 =?us-ascii?Q?KW4jW8FRdPADCimw+jLKZqq01rU+edPNqlpByZU8eMqNXJeCK2rLtJNRQgB1?=
 =?us-ascii?Q?JVGbYHesxceDWGUWk78eDawXkRrhREjM+y/aUDXgtJD/TNIF7WyeC/eOhgJj?=
 =?us-ascii?Q?y29pXx3ejZcW8PDkFxFAQhB67mSLWQIP0VQFv1nFhTJR8feXOH6Lqgj+GZzv?=
 =?us-ascii?Q?W9E5BypRo3Wo1LfC8d3U8aQZfcIDa6VEM4PRW20A5JZ0kzAp4rVC8gpkJxWL?=
 =?us-ascii?Q?w0eU72fftovGwP7Z0UNQhudSxpZEzjucsK1hZ4f0GdW6lHuWPVKpSNtGsNUN?=
 =?us-ascii?Q?905dQubZfaZi41oBQYyPbzH0bZYARFOw3G6DfUiaWr5HYpCvBsHbizPlzzl/?=
 =?us-ascii?Q?BzYK18/M6JOVYbEF+LpP+U3HCW/yLzY7rJKJKyjXUVYLT/M89q1onQHJQTBF?=
 =?us-ascii?Q?Xua6uqCxiQKEKdjKi3awHUVJX+ydDedwvCouopolnSbk79wG7xNzQyY4q+Qb?=
 =?us-ascii?Q?9riJtkSQlPM2V9z4QmKHtZXzKmECx9EtXVXtMS7sv4FJqxG+EHms/2vZe3R1?=
 =?us-ascii?Q?n3DLjVLtRtx2uaDGY8UvZKAaVyCp+rKLN54Bzj1jiVn/6Y/UeHgEs7xU6ObR?=
 =?us-ascii?Q?OUMTDK1jeBeccxOwj+lkGUdpJU7aIQLiFDVDoBKwcYlZwcLs9E6yKsTl834X?=
 =?us-ascii?Q?pTU++Tn1WUixgtsGKhUaawtPL4vIqjIQfgUApKNLm3sUe51uoCLgankmlh+o?=
 =?us-ascii?Q?2BV3mltkbeiq37tNZDr7B+sep6lR1KdOHKhWc9h/XoSbxdAsPdlnL+3vSXUc?=
 =?us-ascii?Q?KGHKZ/3bNQb8sfX5qtnSJgq6ealLaMNo6zI4gcOzYE85XogWMy5AIWIAWkZQ?=
 =?us-ascii?Q?aRoWQGLVVDjmroq9Q9xaeA4lmid8Mmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad2bec5-4b73-4e35-82a5-08dec4f8f884
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:57:53.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QMjMgosMALjyA8uau6SWZBMdgtVSlgSyRAhfueCtUFPt9DyO8UWoCrMH8sZA6UKocn5S+y4O+Xy+zWaMKxwo1wFyt+jqpUJyjkMf67QfcrcX6JwIy2VIgIH+rkibT0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/framer-codec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index 6f57a3aeecc89..a87a78390172d 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -238,15 +238,13 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 framer_dai_formats[] = {
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+static const u64 framer_dai_formats = SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops framer_dai_ops = {
 	.startup	= framer_dai_startup,
 	.set_tdm_slot	= framer_dai_set_tdm_slot,
-	.auto_selectable_formats     = framer_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(framer_dai_formats),
+	.auto_selectable_formats     = &framer_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver framer_dai_driver = {
-- 
2.53.0

