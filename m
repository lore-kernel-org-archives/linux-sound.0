Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8A389116
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804257; cv=fail; b=kyjjQ7W1pf/4WEFiGTmhW+3IhyUkrzJCLiBwX9CUqKR+0d/5qxkKWQZ5DWIbkcXihKDrjie6V523oVCw/xD2rhqBY5qpLhJGaqkwZueTd7hIRZF2KbPOoVecQlKrCCBx/X6tdmYL+XvZ314ISntO+Qke56qPuHpjHM08JcvMkm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804257; c=relaxed/simple;
	bh=k4j8jGJvtZmjMFgvIRpkkd9nycThkdgYmaSMcSXspb4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rc2hj3aX4pa23WcigV6oUeBbZsYA1ecwg/to8fYR0JTWstZiE07mR3UgbpPzPg51PPEjPwUQcRalpywFwc3bA7hudY+l6XlxJPXRRSch7IeuNebrJ2DBkCvfS5qh/GhzVE/OZiasb1mhjvnbl5m7dFWZl8SkKaCjGF1WWy4babo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c65RuRUH; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c65RuRUH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6y/QgX8JtYRXMZ57jRprNNpc/Kjo9yEtVAmrvsourmCueO2AwLOHjdrLiwPVo9eAC77PWdraeh01N+0G+NyzguUW/2fT/cu1PCaVBHQgPie66NDfO16p44vBj4TBsVbT5y6bkn+qfBYU5cxNNDky3L2+K5dSWZUF2VEqgJ1Y4yyFEXSEEHChOTKrHMmywSwNuTl1pV8FwwIr4ZSwRRuU/8kDRwJT4EB6/WJAzqLJvZscr982dHS4p+SGBs2j/eBSyCq4SV0F18aDkoXtcZuBiyjRkvL0Qh/PukpGmpg8rNmqEUueDQuSju91+Ak4SFuciblpiO+CiBuqJERLt0uFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HEbEaL/NmHfUjNdidDhWz9j9lKStrvJoEMnZY2fYKE=;
 b=In/1iG2nvQet35T7YoPVJXC7v6z1v197WuRJ5b4cczg87wnJ8AnIJGZXOnABuD57AdjQ2y8UuO0/aR+39paEzGED7DyyIlzKx/vk0JcbONFNWefY3g/4SKPhHnvCvQj+b9YIul3EciZZFUP240UunzCEvsCc2vnXEyfj+a8gZ9i3n9eA6UufXHtwlSDhuqFsdPUDkb6XmHPTkZNA/7zEgfQJ2eucqM+1NXg5lS2rOcAe8hpapoJ7+CLrfdwJPrjXTv9bvlYr6p/yD9PH8T36TYAvRjHxWH/TJsiSdbIoJ/cbYl+aL247P2zAQNAD+4gTRocJm5AoLMYrLaugh3/7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HEbEaL/NmHfUjNdidDhWz9j9lKStrvJoEMnZY2fYKE=;
 b=c65RuRUHJteE0XEndJDLJtxib8jp1E7Pi8ud1EIQMEmIL03Pao6oFxJ/4cr+Abfrlb/ZX4nEHvH+APU1J3UFGoEWP6ozrbXeJvpwh2X/c9t/3nOSDJDeSBpGSIB1GuYYsbiAc0BJcBAMhDQQLDauiewqoZ9TyyBUul1gXlakOHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:44:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:44:14 +0000
Message-ID: <87ldamvhnl.wl-kuninori.morimoto.gx@renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 44/44] ASoC: codecs: zl38060: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:44:14 +0000
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: d67a8245-d857-47e9-bed8-08def1c18200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mVTT7BuVLI7cznRuRQnw0vtWpX5xhid7JU2kOL9JOcpnuKOIzFVt+WStF4nXY9eU42WCPlG1KyEdLyOSZGS9kTJgx0/X93JBesC42daoYwuikuy9APFb6IHvz90e3mUULNUxsZ8aRQu8xZ28baL25SbJkVO06HmPmVMw6YMxdxHklkciYxi8HIshd0LH41wvZif8z0++3ncTPvNNw1pezbt2oXigofvxwGwh7XB/nmf9HjOP0JVuBkVJlihJoXUdc0KawKS6d8u3I2YRey+vj2e66yFRhIZ5Dx4cSSW7kONaxbS+FqYrDDR+V8R481pujGXx3Z4wgbyveFuo/u8sig/krg40+tisryUGm8LiLzA1drw4mjbwPIxUfHwr9n6NZHekiC8b3oBOmH90Xoi0qOMJXmC1CozrnUy4v0Vp2Evu2UpixcwfEDq8Y9wfflKKnFXgdLOghVO+2apzTVJCnG1sRZ8GsBnPy5OQWH+Sh5fikSaoJ5bZuGwzhCvL7OS4Y/dOUHApFqc0vkIyVjdjxn7WRFy+LyFjkTi8OXOO8ierBbNsCjUSaPQQRvtiam7Fn/W6eLUpq8ZFdTaxj6xRg6suP3psXAbJg7dQ9AetPxDKtXGk2kn/I4U+1K55L76AtGeKQTtbYim4qm2LI8L3xLZ78/KkvHCqZPocaNrfANhZVr9E0eoTo+yeNyC4pMPQqU91TCF8nzNuhBxS/MIAHI6Gc/dbp+xtFFm5kUHrR2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rib621PCZE0KP8BWot0VNdSaiBsAjItJGvBPf2d+r7wXn5So2IZX/CFUN0W5?=
 =?us-ascii?Q?gQnVy2xv4QoSmUk+mPkUgMauI9PFHWDkz2Gb9cAGuNOnj3cFdzrtYSNuT6rM?=
 =?us-ascii?Q?jR76t0eiQjQMTNi8NZWa14TwRRP+aPE570V5umnVpeX7NPmqnL2TD29zvN7K?=
 =?us-ascii?Q?sZVjVMJBKqtIRGqGe2nN24dsHv1+dRe5/CEGLI+L25n6zT3idNGZFxQtdrP/?=
 =?us-ascii?Q?9tyDYJqdnkx9dHJSGGk/TIA4nswAZKDqyzuLCcJ8N3wZ+OQfhb91YoN305UT?=
 =?us-ascii?Q?GdVWYBUf7jSuFtAUMTtAyKxsE7acAyiF/5bKvNp+hlWoUz1B8TP+huntWoIG?=
 =?us-ascii?Q?g1osv+WTrX2IPtYRz1tC0vGQuHv6eSAR83rpFpTqJR/zAd+die3fJOz2s4nZ?=
 =?us-ascii?Q?/edwy9ZuBL/OpLDasmpIDC11x+1ZGY42Vg8jKBnE+kM3UvCr8mL9MCymZeDk?=
 =?us-ascii?Q?JfPuP1uBxK6VCYdrYdWMLq8TdTDomwSUIHJOUkDVZZT8hnkslmboD3PTT/jr?=
 =?us-ascii?Q?ruCO9eBVsrC41IH4xK0SH3aMScgXrsQy5flUUCaXMWTwcqlRvx+9umBeihEo?=
 =?us-ascii?Q?kOLEAV/QDI97OiF7nhyuSOTDU6BeXL3HL8udphkveLhphUxOAlSbyL/aX2X7?=
 =?us-ascii?Q?YbzGABNsANzEMfBsuqespb2GXICQ1DtjRhAEan0VQnqbSAA4WYo9nN2VK3gv?=
 =?us-ascii?Q?5YbTQNx6Bn6dwGiRX1eTqMQRdjWlwIfAxzmMnBGe0VyEqkQBc1222tuimAtE?=
 =?us-ascii?Q?29YqjjA1aBxY+N/Q1bRUQUO7SVxm84mo0oKfSM88wOsXZP5xXy+s8V1YZFh3?=
 =?us-ascii?Q?P0VyU4VEbNp0HdoN2+096gLAdfsjklTcemXYbJNjSCtL42ZEYWAKv36b59GK?=
 =?us-ascii?Q?Ktk7IOHYRhkD/vFi2L84GvgaXm5atHShoix7UC9eZoi1zZFjhVwSCQbFXLed?=
 =?us-ascii?Q?5s45N9lavgC63Rb/aG9zt/aCaXRYPLiwTDG+8nd9qspaIVkThhmMPKhn8EHW?=
 =?us-ascii?Q?5u/AfyCY3hidEWFin5Rvr1caMmjSL1WGzplTo+WHQbRvEvymq0fOMbIEyvVu?=
 =?us-ascii?Q?Yqv5TWryWXNV+xYMJUCvae2+xhiMXeYTRFQQoHoBh+/97i5an/YjCZqiEtWh?=
 =?us-ascii?Q?azgwd1t1ov5r2S34N9MughC7C7kkQJ7Ih5pFgEzFCfIXYXFxc2tkgxsQJpxc?=
 =?us-ascii?Q?jwHpIC0GlgnKPlBKQBtg1Hj3c5FQYux6UwhJFWHzPcI+/1IOUbVTmlAxaaOw?=
 =?us-ascii?Q?MPTCsCd4X0keU19MZft+CkqXME/X6AZ/+PToWFjFDXVllPOVxhz+nI3eWMse?=
 =?us-ascii?Q?7eh0gy809Ovim1i88+WQ7Bs04t4o/cXLBtSG1CDTZmjU1/ZPweA/D1EdeD6V?=
 =?us-ascii?Q?bHsL+pgDz1cyBJp9xJfPiuB9DHnLxCKK/srwD/vvZKhTM318q5YfEcWtSniO?=
 =?us-ascii?Q?hxHFGCMgqmuz+evbWKHsgAzicbaKLS3minjoiQzb0NPWZ4DzG/nxfRtAYEwh?=
 =?us-ascii?Q?Em2GGVy3qz26oqQLr5t/+EoqKDDpaedn/fd/Kea4PhSUWf7wmunJ62slAykw?=
 =?us-ascii?Q?ERwFGSOqZ/ayJSZsM2FTOnLeb1gFaGgRiC8OIXFSPuZJU0xHQhiIMSfgVD4m?=
 =?us-ascii?Q?4mSxLiluUjz1HkX7qn/F7r0Z6Lgi4IWxZWDDDtSoz99TSNOIMOTFN+HJ+MRj?=
 =?us-ascii?Q?2lWqBxhSDHy18mN5TNQ+Ps6AhgNVEEihFCzc9NUg+2CScP5mC8q8rb5awXFS?=
 =?us-ascii?Q?7njFfbuG7uLjhcuOXMCcw0z+1V1oxGEB7qQTPnI97HCpvT4ZRLTP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67a8245-d857-47e9-bed8-08def1c18200
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:44:14.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwL2e9vo/1HIaFgXxc/0DE5KqAtFk9kVZZjLIlfwkj8AAjn258sKjrjbbFNz+YjIDX6rVCOAwHBhM8UPSDDR7Cu6wfM0SI3zPUK98PoTByl9ufYNsIA8hPux7Um8TnLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/zl38060.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 7de4014e626d2..aa563cf6756a8 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -337,10 +337,16 @@ static const struct reg_sequence cp_config_stereo_bypass[] = {
 	{ 0x0202, 0x000F },	/* enable I2S1 + DAC   */
 };
 
+static const u64 zl38_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops zl38_dai_ops = {
 	.set_fmt = zl38_set_fmt,
 	.hw_params = zl38_hw_params,
 	.hw_free = zl38_hw_free,
+	.auto_selectable_formats = &zl38_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver zl38_dai = {
-- 
2.53.0

