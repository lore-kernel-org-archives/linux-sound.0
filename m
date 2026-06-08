Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98E2EA48F
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880306; cv=fail; b=SmxuXQWNZCPRwEhwSNwXJw5AOmV9WbgggoByXM8s8rfsUBweYVjMxP6DwRf1iZYCfJcGt0IruGE6bPd0M9zEG0BALGIzLN4bOd1TK+0zphNsshBtSn8DSu+ubFRYGlr4TpJt21kHVTL7bZRjimk2TfwgXwJXimRC79rvClBamxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880306; c=relaxed/simple;
	bh=U8NL15HWyBtMDrJw0hZx4E9zif1yQr4CxxdvUF3G50c=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NkfZSl2Z6+nPhassBpcnJEFLj3EqnGnhen9LHXoCGOcmwN5spgMnWg1KeD1mA2cFe4SXlH78/poJSKIVVbnVzNFvJ5P4egCQdCYhS41XqrlyQXeG/VzfH2xEcqoGjDFOevSuNBfDCkeVDx5xIHy2JPksdWyjcMeQyilFd1/MDNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c3zbOAdx; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c3zbOAdx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIdDGs5QdKiBeBA0IurDUWc65bWchb6ZG7bfT4M5I7ERRMHdDrK5Lq/vNqPy31fip9V9qcnLJ5IFD6ceDBSjB7+vNH0qO/7LB5qMDB31MK9mZ+ZNGBrNlNxuDsb1yKvL+1DmWAPbOPt2L1CfM9pzhu9pJQeifdRabyyBJGKhk67BdMxeBZ2QcyJc/eW+3QTrEWSMeAUFn8FGC13HBLU0H5sWSQsYoElgKvVbXB2UMRVFmWsojCcmp+K/ROonHeoXQutSwtKH0Pr6FPTWBlwUgPNTPtdJXTj+/XaP6wT6OI6RIjJWGhdLHiapWUQP45dwq6SWPJL+MTXTsJU5VFvgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UW6ReUJFMQJh0duEOnOi0NfiAeXC6xi1FdjMCLqDzk=;
 b=w2eyNAyw0+22F3q4qOy49QV3R0MT7vH46ME2HNBIqZnlVQeDvJaLL1zCbVb5mHLhVkXh194cK1E/qHi4enGzegIQtMegSj5kJ3puudE2LDnuKCWDg2lrJnBivlzHOD+sKyHsc7d96fH3v0KHQRoMcaY8qBRJctFYo02K6bxD7Nm7usKa2bUyigUmO7oXdyx34pcQ/y0/PPRwESpGMf+GxDVyTnjIX0FwQKfpvLTmEYsjr0MJ36dq4Ym2vqDQFHxMsjhoHlSg+RAqxSpGNSnlkdnGFhVY5ScfTw/maICOXjeO6Rgozv4pxX1MpgYmjMPVTFSHKMhK2mNaxLrnOqECxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UW6ReUJFMQJh0duEOnOi0NfiAeXC6xi1FdjMCLqDzk=;
 b=c3zbOAdxzmyVl4kn5KOkJR4N02I2SZlfL3tULPp3v2WVBuLFO5TZZ0cLYl6CLCU3I7k/EGyG7bPfCcMi1gFkA3cJ951X5YLooAlCasBUGkop9CbfH9FEvLWASkkFjiN4Uy2+Pv1/cQ+oh503UMkfdbOMR/qU7JYZutTRT4NCd4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:23 +0000
Message-ID: <87jys9etlc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 9/9] ASoC: audio-graph-card2: recommend to use auto select DAI format
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
Date: Mon, 8 Jun 2026 00:58:23 +0000
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8123d2fe-724a-4e4f-6d60-08dec4f90a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AfxqtYTZrkalLLhtW5CeDB5rXLhMwjBKTfBwR+DhBdtdwzvkWcKOfdGiegzOE/h75e+zZWzSjfQAvUo3YbNELl4CP2XrXHxINSjdYUUhqkVs0dLGbd2AgWEStyXT2V1A+BoulGaJdmHpnP3cS6o+I2JBJyWm+QVWkq1OaJh6SlfEU1GeydbLdXyHb/HjixX9DQLc8nzcE42bdNx2qhB7HrK9/GOOEGmQdCpuyFjTIteQYRXorBP1ziKx4huk3zyuCz5o83uM0kmtTeXN/mTYDoVdeFPd+Vfs+gpnplwMvy4Ubzu6+QMn5og+jOXY9+gbVhRLvQ4EJ6A+k1cz0ntG/KhPehIL/MVJLvx31DI5KKp6UhrUOIRgtk0E/FZZmGtC5BvgZW8ek8rxHfWF229K2iIwgWoHcpYWCkoLk/Ff+lIJA9sAkoFZ32sP0BBewXAvHYrDLY5PxtMzLjNPNcQSgt4YoSlfIomGZtnWO/1IOboYfbdVsMqdNsocVzulTcH9acZI/m6mKkUmfsTAgW5rYjfJRSAdUUKwS2NEDD8iNu7E2rza6t1b29PdkzaZSRfMRFmlevLpAtx3Vuln4lTCoDQRsMsl4UB5k+UBRq93/ATsftVcV/UjJQ9wBn4QGWDa/L5mYEwHNmy26zBpG2itWODiXyd3+W1VtKQLZGmltZ1pMBtP2Amh2U2yBMNEWg9lGSreTpzwmdKCiYiUKLgZgtT+rGmjx+V7e62THIQ+rYzvfPeUxijBI2UaBMX7yExSIT9/SBWuJHIwBbliG4M30Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vHX2xEJ4ICsl/4/DGAO2TjT7DngK9PG87RTqWPHEwYAHOdixq+1Wxugsdca2?=
 =?us-ascii?Q?3J5bxco5YfZWceNNn/pLlihW7Sx5OTgUxclMuTNvWcFuvyzz2dRTg9pbBJMx?=
 =?us-ascii?Q?5DAAPRF3zGB1OognSmt4zUy4rZ6C1nKE4nvgfjkgRG+rVTzEAoHr7i1jFy5R?=
 =?us-ascii?Q?dy9xRYLCdqpRZD6R8sK3cuzcTQL3zLOguEGXjsM3FMRqXs2hBQmeJZGPppii?=
 =?us-ascii?Q?YdI0rx7IjW2CR4MTzbZYj8lTvSR/NxPPIMIgG/otg1+qkGUhuQZDfod6zhzQ?=
 =?us-ascii?Q?JgsT/NogetEFkHwsIindVGULshkO62RRqUuvY0GLmbKtl8RhRVzgE44RD6Zv?=
 =?us-ascii?Q?HClhfIyVB/knpaxg5HZO8S0KU7KRYVUtVV1E8Iqgct3KbBXBBSHwXR7MSXD4?=
 =?us-ascii?Q?Pjw5hiDBeBPBobRPBdAP9/8sTrYmFpVT9CqWtkA1GtrDaijasHecmWYO83O1?=
 =?us-ascii?Q?yTYqxBWRcvnwPmXaokEFcvLfXlMrKS8L9Kpqr6sO2mQImKiDrvgT2kJLe6Uz?=
 =?us-ascii?Q?kMSG7Mg7z2d9HrIdjiWRnxPD2flwHhq6JLv8wv+0U8o2O5DxgYtNm9EjubFf?=
 =?us-ascii?Q?LEI0We8MCeXKXFUPtf6Znb5RBAn19Duw+VWuFnfxGZrx6RObLHCN/jYleOBR?=
 =?us-ascii?Q?VKmNr2/SFq8rLhvPf7sBomAI7KbH6ndSLEO5Tpf04DQQxh1TXm6tc1391XWQ?=
 =?us-ascii?Q?ftwactvjwhiFJOBbWlk6086o+AcuUGtEUTomvYdzmiCuDg0l0v6yy+RhERBz?=
 =?us-ascii?Q?pUrVHfjZzLzM4pHevhgKKyfXiaciHjEpAXyzWXnGu/ZK7p5hoEG1yI5gAuUy?=
 =?us-ascii?Q?f6JVzLN8MIxAmhb0e9qFdr4DcZtFnfyjV0imt74OA2tNDM2oyt4FU1DlF/fG?=
 =?us-ascii?Q?28yIGxpTEPtv7ZzXuYHoOr6QQ95FrrpHw8bQCRPB2VXOExyued31/I7BGbiQ?=
 =?us-ascii?Q?djRrbvw9H+YEhsL+yPhEueEYsn1zznAkAYjgAkoFPro6t9YG1NPcDTVop3nC?=
 =?us-ascii?Q?6Dwgnvy/zdxZ9CdwH2BgPNixuWGj30Ggwu8NxgMnH/8bhM18kenz2EEo53KI?=
 =?us-ascii?Q?QEOe1t/1oA4CpFxvQtCwjCPmzCg0/QVlBkVPZzq295Gv8c0J/yrCMIIkCHeQ?=
 =?us-ascii?Q?qasVmxz5tnwux9xZ+i8S5zFm+fR4QC1LCFf8ybkPy+10iu0UTef2Lew/WXUr?=
 =?us-ascii?Q?kR5xdNOp0FHk3xsk0zwxq6SshlYa6EeTjjhqv1TlHwu8gLAd7LyKM5z6Wv/G?=
 =?us-ascii?Q?NCJL///MeoWl5T53Jly5Ac9AfKhFuSOzjcqVCyikm+XvgBUo6h3EYD+hSpWi?=
 =?us-ascii?Q?+bHq6v0WkbJ8Vs8LNiZZOdcWJnoKhGbKePstvvwgivup4mqC835qa/aMq5Hm?=
 =?us-ascii?Q?iSY38CGQ7utZLTIZwX0oSpzS0swO3f3A+H3NItfFVQ0VGpe+eBGCLKAR1LPq?=
 =?us-ascii?Q?WuJoLbI3uXta+l8KYd7FYHWOiPN4c0dkPujCrOPEB3pEygMyS4P37RiQOAj7?=
 =?us-ascii?Q?PyPpeuytup0RBhYsjbtotROGrVoQoN71R5TxVO/GKAh3pewohm0Rw6sflYnR?=
 =?us-ascii?Q?vDUJR66xLdABAlJVLN0C4oglsLy+tfrGBgE6XbqlgSKqlQCDotTrNg16BRxd?=
 =?us-ascii?Q?49xuLsoLLRkp6Ek2qTrjgFkBreKmwYlxc9S/7ziT0M/cgK38cm/t00rxYT29?=
 =?us-ascii?Q?kCnkRLSd/gKoVNpgkMMajiLGYfbKuTdpv28R4OXtPY3KmEONLaf6lXxWKcx7?=
 =?us-ascii?Q?3gqyrENLB3P0lhiNJ3HsD63h3Bw4b8DIzKg0RfUDBP0FwAg2JpMR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8123d2fe-724a-4e4f-6d60-08dec4f90a6c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:23.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1S9OyhK7ugV06cLdILC2aZcPCoOqhqMn9twmgWJ8tIu1mo/DIFIARBHbIfngHTdm1rS0TkfJYbOQDbmXrgn2xZhMS27abFDYOZndn77noiRS1Wbgy6glIwpFks9xInv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

"Simple Audio Card", "Audio Graph Card", "Audio Graph Card2" are
possible to set DAI format via DT.

OTOH, ASoC is supporting .auto_selectable_formats to select DAI
format automatically. Let's recommend to use it on "Audio Graph Card2".
One note is that it keeps supporting DAI format setting via DT.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 0202ed0ee78e8..6894bb936cfd2 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -778,6 +778,18 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_parse_daifmt(ports_cpu,	&daifmt);
 	graph_parse_daifmt(ports_codec,	&daifmt);
 	graph_parse_daifmt(lnk,		&daifmt);
+	if (daifmt) {
+		struct device *dev = simple_priv_to_dev(priv);
+
+		/*
+		 * Recommend to use Auto Select by using .auto_selectable_formats.
+		 * linux/sound/soc/renesas/rcar/core.c can be good sample for it.
+		 *
+		 * One note is that Audio Graph Card2 still keeps compatible to set
+		 * DAI format via DT.
+		 */
+		dev_warn_once(dev, "use .auto_selectable_formats on each corresponding CPU/Codec driver");
+	}
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
-- 
2.53.0

