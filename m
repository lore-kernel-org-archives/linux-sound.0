Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3537646E
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158275; cv=fail; b=WLoXwbY1spHXk34Yktbpw9wAVQA1b2E8s3gUnKZFaFKPpjwPwFyW4eTUJ6soO0NLYpHuTCnIr/eoJqCtDulPGR/Vj5f6nFSwyCG/sfB9Bw3+1nfvzprsFEHe1LS5I8lGllF9HGI2HOj2hXVugnDhfUd37zCFyCLI+g/aSsAo6Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158275; c=relaxed/simple;
	bh=BRmhp54CVgfjeo5nX0xi8DwH+XcuMKHhWr5dPq8xgWk=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=mmAcSPHZORlYpeWwLXbmWDzYwZDDTuO1WfAYz7zgv720PrtxK3lS+Sb8e6ac+0OCtgLDVu+Cu98+t18whwflhbn64d2ytjWXqRFq2y/egudahrRuRnsnZqAsb8AXMQq1JhKKK1yXYxliUZbwMKVwLaN1wnurFGNBQ2bWNh24SXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lu5Yoimc; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lu5Yoimc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDvTZWZjnLXbSLckUptUeWmNt3xjwSylJfDQzNAd0hjD77xCDimo9PqRW+zWFj1J/PO4426qgpoLeNIJz9Aki4Ph36GFi7+SdxHIC1eV+CCHv1AJvMVNlGxdZY911DAKKeozTNyRDmFt/oREIAMf70pGQr38irSwLnBabJwJnufjDdNh6frAPTpdQ4dvx5mayyiUO/kmUUHi8/ryJG9M1U2PoWnpAwGcj5pbdcMYtGroeeZ/GrBKptAB+5Q3yOxF6bI//3FD+Ugu1Ew4FS5R92xBJzHOI26jTfUu3myhoVXDNk1TegGrL3A2h/0wsSyl8n4M6H4xEO5QVmpxEEVp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFC61VQ5lvid4ExlJZAl0nwI1cjiqEx/aJY4X1yg+nU=;
 b=m1Mvkcq6nGk/hTOgaTO6Jw/IuBxS4Z/2QltXlbzkVFVjFQOfjqilT5K8ovP9OFsvtrkULr8j9xr+KjfguI9//pY50ZxmMzNksvXYrm/F+7YdilV2bI29K+wfbg69RP2ke+lotMdMlziICo+1P41KLbGx77V6mSoPclJVjylb0szjVrJZYN6wKcYyaAmQxC+lCkwGFaa6xxj0bdxjMLIjTEtKAi2n/o21ctmjoiFNnxzwuj5OdTzAxt6XfnZTOtIPe+IkCfIEPgpk6H33eSPiBsER3slk/SSkussmsg6d5b798sBo2A3gqbLpYKv5YQR9xx/Qgi2I/s8G8IxjrYrN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFC61VQ5lvid4ExlJZAl0nwI1cjiqEx/aJY4X1yg+nU=;
 b=Lu5YoimcWCV3VmvTPMdM/tGR5tgtbeYo02+O6bB9M8bC0CXWiIOTq5Mf2p2d9Q+ZbMY6ITWn/itCjg5ZboXCKHv2vCP0GM21Xy1nyuvCTKJHAaB+m9IjjfiMdd9rTP1gDx69XjZZC5lW4cEUmXICwIMxro+InXrM1Dt6d7FPHk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:37:50 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:37:50 +0000
Message-ID: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/14] ASoC: soc-dai: move snd_soc_xx() to soc-dai.c
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:37:50 +0000
X-ClientProxiedBy: TY6P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: c87d4753-ea9c-4f70-58ee-08df072a60c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bZXrUWNlutY/5yD+plDCPuumspD8HX3c8TOAbTRJfx0YXPA4wBBj0KXszF7jjnv3Uuc8fEeItF63Xfesp15fTuqRF3ht2vjvxwcw32ToCmqYYNiyLrmqRIbo3Q0cOI2Pa45PxwAYsPGYCA5719WGbn/mzHvkI7HwYabX7zGLW/+TffshwywJABfbltT0fDn96c3ltz0lMhrnnMC1xS+32sVWGpP0PSbfTtPNbmpc0z8zPjtu3qVEwE2f0jltHw2F01GPAUEfZYEkWd9KBIo2iOfP++mx7Rc7mcXs3BSCKLaBP+y02lIhbH2PCiIeD0gafYhyB9sJJzKWCVKdphFJVSeAnZzalTGvubdURSC7Vv9kGNqbkEbO1MM6T8JVfvWmGQzd7O/luL2rEB7KLUYbgNv3P3Y4gt5OWnXQmiBBbSZe8KSn3MKxvEvbakIGyRVn6S+oOhzLEHTFnWT8gtS/vS9SRXzlKDn1cSVG0zHL15A3SbjgT5cweLZ+7wpHpTHdMJmUzMlgBytrxd3T58BE7olh2onrYw+k3OlxHR8tLBWpHvCfrrP8rrW8QIrNMJIUNJxGf6ODPbvc5cs9Os9NyeOcchfsKsm1mMVfzUbQZg9O6dKwIa0B0h6A1HwleS0kGqErtPslGQDQDrauANr3RYaDzY7+cD6qp59PKitvQm9XBZ8vZTzKIxVUPNA1uf4wIa8y4OM4+wmdQ/jS+tCHMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eAK6I5whWF9I+EkxkJtm83BOQu5NFgj2lR0ZTllLsBfSzJgR78YBSukx31kf?=
 =?us-ascii?Q?5fAWYhx1yZ5uK1DDOFT6odkKYCxamn0ZevkyRdfoqZK+AI4c0jcWIIEtf+z4?=
 =?us-ascii?Q?eBRtnauBghaGz+GN/9bGBjUNGbhqtrQFVtyrPwqnH2fvmLyGjPSLAkLxxhqf?=
 =?us-ascii?Q?J0YRh6iflUHUJO0YTH0jy5k4C0XHW8hWnnNnOagGTK3OIX6Pk1ZnKZmDtr8a?=
 =?us-ascii?Q?DJX5yfEPYzkGtG0RP3SMVIzPZnORNbXizdrBZWxp3R6Si92NsoiwxjBnKgTF?=
 =?us-ascii?Q?s/KpnHugpLZovOY4JrivgfscapLVF5SpdDv7kPDKWC5b36hZFkuBTaYQ+rj6?=
 =?us-ascii?Q?SFaYw6KZcREpSDqhL7/0enG9Fc/Tf0LRqFtt6hksaZWiySaJoEleGzUj/Le+?=
 =?us-ascii?Q?M/l7jz8K4novdwPw54y1vpjp9bMP8dhVN1ylFHTZEx2DeoAbnuzy3BekP7gg?=
 =?us-ascii?Q?Pel/E8mwsboYbrcUE5ObJ+91BUhm2qimXUNI+UVKJl2eYep+C/kkP3lONX2q?=
 =?us-ascii?Q?oeVlcCflysLtlKjpEg3lcwmw9NWPpD7ympFnlduHQXM7Yb3TcGBW9U0dBnnS?=
 =?us-ascii?Q?PbEg99WS41/MnbdHeZ1DC44MbSNf5xOG/5cNPgq2qlwxkoW34cQyClslpr6K?=
 =?us-ascii?Q?6GkfmHih8bGADM8lsY8bfQMUfwqOureupH8YSoDWFIsaypCr4Q/CVKrr0n7q?=
 =?us-ascii?Q?YXJTJWmSIc/NkC3/sI6QLziWq8e/OckPXeUKUHvunpoeoMmBhaMrvxHfuRQ2?=
 =?us-ascii?Q?QOErmBJnHueWXzNwnMERpZ6t7MGYwmgc9aajVu3xj5e+ZaJpCTLgYLZ/t439?=
 =?us-ascii?Q?v/URAyjZdc/Okq4Oq8kVZL7W3l1ETj2S+NlFuMrtem5OObAlk5WEr/hOHRFp?=
 =?us-ascii?Q?OfBh3EKNQsURgZjjNoPFJ8pdWlmYoU2+zuCeyghBqe2WfH5RaDqH/DVaiHA4?=
 =?us-ascii?Q?Cf/IeauH5Z2dGfNxdU38lTdiqwcNerwBySQ6jGtCi9fszJgGfdOog28MzoQr?=
 =?us-ascii?Q?F7E9rIZj90OZ+WgU6WX0XpT87DPQXAZleRJX8YH9QktnL7mtwmvfPrEvCpwe?=
 =?us-ascii?Q?Tkazzg4z7uYWiaP+IxesfG21Ra+ntAljOXBIU5X3fA8f8coiqbCP60D6qAw9?=
 =?us-ascii?Q?MnXnyQCmOaNd2uR3Nin1EePOky0L3Bv6brS8eEt0DXfR/4iENvFfDlgh/P/S?=
 =?us-ascii?Q?YWG8kyvH+AxG2YW/+Ly2Fy/F3eDZ18ZtQrw67+eSvoZ6rLi4zCniyKd5wUeg?=
 =?us-ascii?Q?BqZBo20g4F5c+jdM54Hom7Q52dbDk6gA3m2ttt+AnqI24nSPePmUIsLjLzBf?=
 =?us-ascii?Q?mLeH3B+rNkN3W3oxGParGx2sHH2kmZ2uAZ+6qYPsKaOQH5P3wusIRtRYyMZ8?=
 =?us-ascii?Q?v2Y9gm4S0KOmQmBfVuHSIv2czDF89id5mh0WREzqrAUOhjWX5mM3qVhARrcJ?=
 =?us-ascii?Q?cJUbEKThy5KaCtZaTSIH/qNCEEFPZEZyOBXpk1YfpyJ+IuYJKpFJNIlq5O4t?=
 =?us-ascii?Q?YCC++Y4ChFldPvD6NolLNpSsl0pOuU5WnJ/ezkVF1+7m31hphcz03NloH3be?=
 =?us-ascii?Q?Qc/PTz+7bcsKCxc5upc1JOdBPTqoOtmAkkZz667HhgSrELEyDaHcl2E380d1?=
 =?us-ascii?Q?QPzkMQLFqyjfhnHqptQS57NlLUDmH43vPhVdgKhSJYFOeON2h5pvrDPahML+?=
 =?us-ascii?Q?x5qnI3cFQvLFTHsKxtdTtTbXHJl1oh5mSCmRr2Tc7h7x4WpK/Ze63eR/2RI0?=
 =?us-ascii?Q?ZqcoaJvlIsoQjZoSoK8P6STZ20HBOU3g2AlRWclRPgng1nX+0pMp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87d4753-ea9c-4f70-58ee-08df072a60c1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:37:50.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2ozDjTSYmEvu8kvjO425uu4d8vW7wkDKplOElMoF4+xDtvItXtdR6kVRg/T7sY28cLw3Q+niM7XRjrqKEkYgwxD7zQcIFoOQ7/bkusqBLGp39tQvkOAh+DCgNGvfteR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

Hi Mark

This patch-set moves soc-dai related functions from soc-core.c to
soc-dai.c. We should have snd_soc_dai_xxx() functions on soc-dai.c.
No functional changes.

We have 2 type of function defines in include/sound/xx.h
	A is for ASoC drivers
	B is for ASoC framwork
I think include/sound/xx.h is only for drivers (A).
In other words, ASoC framework function (B) is not needed for drivers,
or *shouldn't* indicate to drivers.

This patch adds new sound/soc/soc-internal.h, and the functions
for ASoC framework will be moved to here.

Kuninori Morimoto (14):
  ASoC: soc-core: make fmt_{single/multiple}_name() non static
  ASoC: soc-dai: move snd_soc_add_dai_controls()
  ASoC: soc-dai: move snd_soc_dai_name_get()
  ASoC: soc-dai: move snd_soc_is_match_dai_args()
  ASoC: soc-dai: move snd_soc_is_matching_dai()
  ASoC: soc-dai: move snd_soc_{un}register_dai()
  ASoC: soc-dai: move soc_pcm_set_dai_params()
  ASoC: soc-dai: move soc_pcm_{apply/params/update}_symmetry()
  ASoC: soc-dai: move snd_soc_dai_get_pcm_stream() to soc-dai.c
  ASoC: soc-dai: move snd_soc_dai_{get/set}_widget() to soc-dai.c
  ASoC: soc-dai: move snd_soc_dai_dma_data_{get/set}() to soc-dai.c
  ASoC: soc-dai: move snd_soc_dai_tdm_mask_{get/set}() to soc-dai.c
  ASoC: soc-dai: move snd_soc_dai_stream_active() to soc-dai.c
  ASoC: soc-dai: move snd_soc_dai_{set/get}_stream() to soc-dai.c

 include/sound/soc-dai.h               | 166 ++++++-------
 include/sound/soc.h                   |  16 +-
 sound/soc/generic/simple-card-utils.c |   2 +-
 sound/soc/generic/simple-card.c       |   2 +-
 sound/soc/soc-compress.c              |   5 +-
 sound/soc/soc-core.c                  | 173 +------------
 sound/soc/soc-dai.c                   | 342 ++++++++++++++++++++++++++
 sound/soc/soc-internal.h              |  36 +++
 sound/soc/soc-pcm.c                   | 123 +--------
 9 files changed, 487 insertions(+), 378 deletions(-)
 create mode 100644 sound/soc/soc-internal.h

-- 
2.53.0

