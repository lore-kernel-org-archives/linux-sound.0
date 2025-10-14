Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43ED24BBFD
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415746; cv=fail; b=GUJQfVxgaBSdJku03PKIIalcOTpXQyI3Kuj9EHOOCB0tneNUMFYgnTYM5iZBF66p9AVMThu14IlZQ3onCgUqRe3x7fs5QJX+cvQ5Gos4/ewIQTiApoq7/x3upUZMX4HpSTAOxXnkFmG9NFSWI6umTwCI8NLuxEib2Prfkr9E/0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415746; c=relaxed/simple;
	bh=dN+HwFaN3qTMTMCOgyWQ48E0IyrbuFLRmMMdW7VwjMQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QlI0RLBzOhWkczJUDLem5CLbg86mRO1xMTcgTmRF5L5CtBdTSuiuHdVe3lNaE/bZ3b/loG9hSWofIIhJvEJ3Dh9FBV99uX5j1h5aOASfo2dfJTSIOIP2jSCPbM1Xdbg12y+sWOXLT2EJqaOPMQrIkiedB1gm+OeAoD0mOiPdPZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TH+9s+oV; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TH+9s+oV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAorTxg5qUH+GEEGnxlZQvbUVrCFdOPRfXN5U8cuMKOs/67D8LCdtV8tGtumZTJqIq0PqWVSD8TFr7Opl+3rxsZ8G5VlzzeXDpCWtQd5cQU5xjK2NXnY86M6pQG7w/8lhclgvy2B0lcMSYOvsRZljmzKXjdhDDl68w3aEhLhRrPXgyGSIDzCiTmdlDW+W2h3Ibf/lw4Lr4I6Jo0TqzuSi/J0GH7oKfstnRJNuRiBWZwyNfgmT2EjU47wvrq0XqBpfaWwzzfjMhGU7TxnvJBl9AYBCiIDhtX8JMpMu2p6M/Zg8trDRP21X4qzsRbKrEL12gqkdwpy+L7O8puFdFCpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfUBgSqSlHn9t3AupdZO+07HBNHor9wv4TYO10JHsfo=;
 b=MLxIGOamtTAiwZw6n4papX5+Iiumq+DZIvIcErWnp6S2jBZX/ufReYBI0AmKWAlguUmwx1jMIZyFM+Pz2KqRbrVTvp1bIMO3ewhNOkz3a9gYX7Mr58YDRCEykbmX2SFr5LB4sv6nrBaUSh5TVQ0TgJ89xbTTRFJnTfxQXlzwpkuhdLrttktPhvo097nZHFhKnJiyryAlOaOOCGMCeBs6Fuy/xHAA0v80Wl0gn7eEXHhV6bBcStCg/LOUV9WRSWA4AVAld2OCrEP09nzUvR/K523+tM7FefeaNOYkGqUr2bSZ6AzdTDOtw/NQIy/OCMV4rpX4BYfLQ0VlsbP6Ke3zaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfUBgSqSlHn9t3AupdZO+07HBNHor9wv4TYO10JHsfo=;
 b=TH+9s+oVOuCfycrEN1FjM+SAkkh9c6Elg5iiv5gwohtWTKGJi9GFsxiCySm8X/zLzEBbXDWGkaKIm7bKK2NA9AlbfzvH0Kd24GLbRQmOmE9KWaK47pTBxBI9nXhogaDzCXhkdeAIGwSQ4F02CNMJ8h/AydOXvydxGUa6fBv72Es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:22 +0000
Message-ID: <871pn6ru2q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 046/139] ASoC: codecs: max9768: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:21 +0000
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: ff78745b-21b6-4de8-305a-08de0ad9452d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IaGlRY5gcEmjZOwo+qA7rmcpSJmlr3nK8sjkiDhmUF3K34daCsN3gRpOQfJI?=
 =?us-ascii?Q?Iu8O5lQo1ckxb+NvBD/dEGfClB1Qot3MHPU5fo5Xal40e2+g25UXZS6kfSqQ?=
 =?us-ascii?Q?lo89+5aRvRlpROWl6/sb1n+lnbqRzuJBWbBrwXJtLstgLMCbem1JcAqgEYTh?=
 =?us-ascii?Q?9wQCgBYe0HlgVun4IwYyanVnZPGSlv5bTSnNAEXXXBswgwuP2yULSn+2M0en?=
 =?us-ascii?Q?tQanvq4noDb80DzTUfK7sfEQmN/82T3mCwoXICTw5/udY0Vu0n+YuJr11hBF?=
 =?us-ascii?Q?Dk5Umkr8psTZYV6WvY3IBRAUX8FShUiKwr4M93Bvl//u/76EgGN8Z/MSsJG5?=
 =?us-ascii?Q?vfdVHN2TCI1tJuq1qMJ6EFI6R4COtHCz3gMmYRM9dlqnRnG7L0V/kq06u4u3?=
 =?us-ascii?Q?RoEUa2I93x9z9OOlcs9tcz0BlQc1ueOhjpGQAEu3g72nJVKeO7oiiafKhc7m?=
 =?us-ascii?Q?DtFsjNRgVeLB/LqAdv1U/mlR9FFeyP7/UbI51az3wAt6+P00lLLcW8ZYSuK0?=
 =?us-ascii?Q?2DHcBl2ZshnqcdBop5flCM5+G7W30tGLlRYGMU1Xl7g2QhyoVHLdZNvdBdd1?=
 =?us-ascii?Q?qr/n2Zk3Gp+vcSVJvSGoKD+f+Yg8GnqIoRFQNr0vS932thSlbAvBBGPb1FWB?=
 =?us-ascii?Q?58pqsaLQIQtW3MDYoHdcxzXBhZN3J21SeHA7oceOXI3quhwzfqZ+pcI28Gei?=
 =?us-ascii?Q?k6nq0ws127jfIJ1N0MGemKfoIVSqR4de0kFuvnJJ7soAUaXRHqaBHafomUMB?=
 =?us-ascii?Q?2JPyZ1xg/HOwlhNhI0bX43d5hIQD7b9KBiPWeuoGNpM7HyVPSbgXq7r5NBSM?=
 =?us-ascii?Q?Mx8WfbXInkUI/aBxse+8gmKhnYut/3vtB3Us61p9J3SDC03hAsSCTL7Dbl/l?=
 =?us-ascii?Q?U9o1iBYeYK+iW4NPh3lClsUaNtZgYRlHqo1swzxmuKpsNvqKwNJzcCsCOxgv?=
 =?us-ascii?Q?XMEG/G3RXdgd8BeI0obXcHbKrqmBU3O+g7/cWQ2OHptKcwWaVk6g0ICy1DUX?=
 =?us-ascii?Q?blY73iC7jaA7OX4Im+7t+cLAB3sDW6RcrhkprfdqK+ZfHIFMl36A5MbNSt8b?=
 =?us-ascii?Q?gFsljtMcMrBAo0ll1z4RkNsVy80pjY6AeKGb4e1aWbCq440DwRhp4d3AEWke?=
 =?us-ascii?Q?G5PNQWyNxC/qHQUKNVTxWy4dP3ktC4zgm2p+avvKWzefbc0SWwFqQ7HdKbTG?=
 =?us-ascii?Q?tyxv6YarBr5/xXvcqwOeXXzqjIgQytT13R0foLXwyMM+G/tqAkK9IwQAXtdZ?=
 =?us-ascii?Q?1OdUCgKfBh1HhDU/GRZ3GQwyO0VyQC0rocHLKlYkNcw+P1iO3TzFDn2Ckr/p?=
 =?us-ascii?Q?geHcdxaormIqkxrcTi382bVQgyGuQWZTxz1+I068KYKHaxc8MUNaGdSphw8z?=
 =?us-ascii?Q?5jejq4mMyXaKF2g9EXavDpYmwNxVMLJYi6EuZCA3a35AXTOEdaj/8/clm5Iz?=
 =?us-ascii?Q?PnUyE5+aFSelw5E+NIa36aSzIQ0WdPWMOqiQoz3mBSikAc6HzcllOKO5wOhc?=
 =?us-ascii?Q?IreynPMGhW9KiWdhAw8NU9fYuLD2rd2uG7cY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MxX6k5X1zVivwEzhAN6/9MxOtWt8GdMhNOfAygduOJ+cwMnXcYvkyl394FKi?=
 =?us-ascii?Q?m9M01WYE/aGMkSsHbuMC3e+2mvErevYc2KBpgjVauZqJnhCQXK03OWpaMgTm?=
 =?us-ascii?Q?Y0dE+8Fz9v/CzwYrPomXTmtd8kl9Tf80zaTTgRehgHH138wQzl3ECbcgK9tn?=
 =?us-ascii?Q?1mZwulzQpWTdsveajar3pFJ/Hcfp+FeVgNP7pW40PHKw1QgBeeQJj9pEYwuc?=
 =?us-ascii?Q?wV5xebxe/3BW7zKRkE7kus9jBgqXsjwyuUuN8utwPEP2gcP63QJOpEwy2uOR?=
 =?us-ascii?Q?IIkEdxODCYK7QGeiFK4HTlzNs29S6OzWnpRhzJVcwWET/Olfih/tip8dh18C?=
 =?us-ascii?Q?F+SMgeUGr15LzsyHtfJGPNw+JhZFQaGod8yb0kxYY2EqHEJTmrv2OX/ijG+k?=
 =?us-ascii?Q?TWUm4F1QPzvWXqOttDu26tX1yVr28IJZQtDXWC3ojnR/l0kV3txwVX1rmg3B?=
 =?us-ascii?Q?KiCtuRGcekGbI4HImiz6qcUxYhziUsM33XPMZmqoJyy36bPGEABv3fL09G/G?=
 =?us-ascii?Q?A3XIPDaV0DxH50ZtVNU4m+2IIVV/ZRB0cy/8a9jvdipdKqT6Pzg2fWEEWHsI?=
 =?us-ascii?Q?pIHMILW6V5TvdxJUv0nCfj6aWP2nMWNOsEYZim0QT/u2hMwunylh/ndWapXg?=
 =?us-ascii?Q?sQ6+ISUMEbKxoeEKL5cWbB/gfopR6IW7DoYi50ktbuIzLm9K1cvLlIwPDvKC?=
 =?us-ascii?Q?2JKwt+UmmInUMW8EZXIG4uaMHDErPd3t2wAgYmpzpJqyS/8G/E2d5Ajd7swL?=
 =?us-ascii?Q?MOE8MSts2cL9fGDVZQoAq/91+NR3WMbJP0XmOO+Oci3tXVRrCDpqUj4n0Dn0?=
 =?us-ascii?Q?V9Qn6DWrFxzXpaSQ/BiGPb/g7YB52XJVGCESIfJpYyIXZ0sYjtdyMpcEhIfS?=
 =?us-ascii?Q?W1Z3rbLggtshBk0UouCxxs9+IQsXkqpTVpLO718fpyge4lujFXe2upMEfbnC?=
 =?us-ascii?Q?Llh8dvyNGgSqjn/TqMthRsNk78fQtqtoP++XsLP+mN3RZLe5DEtF3H4G+8Gp?=
 =?us-ascii?Q?avf6tAF55bBrh7RM9dz1ZQihsmyagztWLXgcAFHNfl36tWMszSAcMTRjs6ob?=
 =?us-ascii?Q?L2uhoDUp2kDFISoEP5BxEZttmNWJW4BVGS8OKICTyos+o8sEtB4CvrBLyy9N?=
 =?us-ascii?Q?4WHgkk8MB8846YwxU8fxip7k+UrDfue/jN9bGawqNonvrv2R4pAi9p0nbtj+?=
 =?us-ascii?Q?SZ6a1qR2dmmu1tlhQymWHWHoCQh5stSd2Q4JOzqSvKzB2H2JvUHdtSzNGXBR?=
 =?us-ascii?Q?xJdYG1QLjE7UeHkcmrAxcijxQzL292sfF/MXynH872KxNfUQ8jJO3iaSio4w?=
 =?us-ascii?Q?zebKJnQVh2F5Y7HxGVLFTRa10UBAGnOAZeb3tTgXjPIvjk/ZNLrASKrKQd8q?=
 =?us-ascii?Q?taNCoOEX5jEl6B7N7QiZbsAef0c/i6QVC8K4oSYXuovE7dSqo6XtamNp+P0T?=
 =?us-ascii?Q?LGVYLbfjd8YZ2AcbJ7aIf/znL1RtGw9M5nECGv8/KTC+F8jt9lNr1gZDLr/G?=
 =?us-ascii?Q?RYm7vEOTa94q3sHD8skJy0iCA9bNf0xJAaKVRN/PK+uglXpfM/RXaZKWIJnk?=
 =?us-ascii?Q?k45mObJaQYK6eW5GwrURon/tXIe7ckpLuAbqrK63HdWr0P02rJh9EA2VcyDn?=
 =?us-ascii?Q?Pi3sxP5CW6t8117kIQ6ZuN8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff78745b-21b6-4de8-305a-08de0ad9452d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:21.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTZRVgHsMhiqY24vE9+7m8zI7IwHukfnga26Z2bEL2dl7gPxGNnohU9TE9Yj/SchNN6vQAW6pGhSicma1dfdhWef49Ddk+RRN2/+4CtzdpnX4Z3KmKvaeBn6gU+niCDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max9768.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max9768.c b/sound/soc/codecs/max9768.c
index 8af3c7e5317fb..7ad7a9fb72551 100644
--- a/sound/soc/codecs/max9768.c
+++ b/sound/soc/codecs/max9768.c
@@ -40,7 +40,7 @@ static const struct reg_default max9768_default_regs[] = {
 static int max9768_get_gpio(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9768 *max9768 = snd_soc_component_get_drvdata(c);
 	int val = gpiod_get_value_cansleep(max9768->mute);
 
@@ -52,7 +52,7 @@ static int max9768_get_gpio(struct snd_kcontrol *kcontrol,
 static int max9768_set_gpio(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9768 *max9768 = snd_soc_component_get_drvdata(c);
 	bool val = !ucontrol->value.integer.value[0];
 	int ret;
-- 
2.43.0

