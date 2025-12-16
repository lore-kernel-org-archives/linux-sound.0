Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034141A8F
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851288; cv=fail; b=NjzImHpNuwyS0R9hQV/h5U5+cpttxqbhaZA+GBLEMBclHQ5MYBuXDGgnicGGhJcw/4jDqld8LTXHFR/OENf1aFMairj/hGenRuS40B9novd1I+hsfxzg3Qzt0WY9fjffzf+Ig00knlp6MNskqBL5CcejTyCBi4TmaxL18I+5jgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851288; c=relaxed/simple;
	bh=tLTkT5A1j1ZNePPib3fZ81RvB55viQAWfxPVQ3CXOmY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GrACOT3FxWPaPYrze8m+vGrmKOEW/TfnaG1XrjiNtvlHy2b6BMWhVZUWEWOTRQrpFLZE4f985AsH+DyhR8iwQMm+17uvg23ZTw5MkU19D4i+PtiOfKaVSr+6bNGYsFFy2qEnRs0+1N1zbwMECh8R3RF3ghOgGACgRmh2+0NvVYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mVNOTHhU; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mVNOTHhU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAEuH0dVsOwMkpFc6C/Mh7tRs6qyMKSqM3de5U+6sP7/kftO0g1RmAlSRhz4KutvS7CF0xU/N/T5eucYQerzLoTOp2zGIvGuxu587RBxsjUR5nDcc1D3c45iVVeeHIkNWWBDFHXbZpXZax1+tdHiKY40/O8OmVLsGx0pDgnFa4tf0iEgouKy4NzncAzldFnPYYkvgzx/lfrfgeiqG7C83p1LS996t8ft99gSWxg/JY/AVV0pPIva2kW9VNY7ThMIwjxRTlj2RFds8jXAifi869bgdQdNXsX0xcwj+50lzpOSOmnUAzLazg7yfqVs/pcV2510fl0yh88QRqjPcgSqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X331dC6+VGJGC06rr3NknblDcz5z3LPGtLGpInFY58=;
 b=qlkK2JsgGuK/ilOYNEIOynAbE5FDWEjR0ldFEjeyJOfjbrpKFxJdMKXfRW6hLJBk+qmGDJZR+slLLL2t5l8fG/8bkEKDd5wxide7onLADct513cOpq9g6to/cDCrIeht6CwaQFswMT8cCxSOsAlK9ej82mKGChBylR9xJXxSAU4IafvnpsC+5Vds5XzDS2tS/CC+NcNZYmV6UCoRLpywod/tNfdEJPLyEmWcX+znJ0JikEi+srFudr4lLQuvHpQTPDqrWomDzdCfaFitxj354l+kll+cBYGJQAnV38++AA4pqmCoUleNPnBydyiOYN5DqPJx6nMViAO1MpuLZ7XTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X331dC6+VGJGC06rr3NknblDcz5z3LPGtLGpInFY58=;
 b=mVNOTHhUdqmNPRB/e1kRmsvrBZqdScbEkOQXYz+AjhLvGXD+tppMdjYpdxs0DdjUPQzKQnL+1OPEt7sPkYjRG931A1y8jWZmQdmaWqTL4Kal16MYnC8UWHklYonidIs+VW7dPxfJRGfpfJP/LlkS5FUxpqJ3hW/N/7U8ky/23uY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:14:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:14:40 +0000
Message-ID: <87y0n3rx4g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:14:40 +0000
X-ClientProxiedBy: TY4P301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 996a325a-d207-419d-7b52-08de3c48de9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ov6u5fKbY+9kO+DMO2ERazJI4LIQctZ+vBTQyC2u0ZLLZGOf/boLxMocNkcQ?=
 =?us-ascii?Q?chuF71IyJ7ZPs2NZyh6SxI8vIq04oCJTNDkEBICekOmYFGoo6TZTYfGKrOcR?=
 =?us-ascii?Q?TlP9R25o33B9Ow8wRvuy9hTtTwSxUku9jluBE5F12/56GPG8wETUYxBV43xT?=
 =?us-ascii?Q?bo1U8/UezY+R5p6YvvPWLbSo6SOfNulwGfaelhqaUMct6ZkorxmBoWLoGaLf?=
 =?us-ascii?Q?kfnwfOnlKHKx3ph9u6qyu1iTBgghdfvAN/3T9x4ECToJYjPiyniUU5cmowuv?=
 =?us-ascii?Q?WQLUQU7xn+2WZUvDsfnVifsucyvAwDDSvqdLKFOkQ9xHclRgJOZZ1ngMs4rv?=
 =?us-ascii?Q?g98zeNpSRpfWtGp9XGgD2Ywfl0lpEJo/s3qKoXnC9HEVMxEUsbQN1rLnE8p2?=
 =?us-ascii?Q?kQH5EtTlRWPQ9z3j/DOEgNMMLSpU1gKLtn5/C9181UbHI9PjJipDqE78Ozft?=
 =?us-ascii?Q?IuJMIJCBHGVOehBrlRyOnGdZ1woxrnAskquMZ3YVvN8PTvqNRYVS6R+aI811?=
 =?us-ascii?Q?tagQRuDnT/SBhT+rrpRxkICkB7ReSdEJqBDYdxICnVcpaZ7y/SY97NK8KdGc?=
 =?us-ascii?Q?w3ubIQ4tYvgxpucyOB8mDA+h0vyNTvFmh6XIM5IatfGwQV9rp2BgwvSLbRij?=
 =?us-ascii?Q?L4PlEYpbPpAHWmTb23x3F24YdRb4CbhzkMPQdFzYaoTNaSVtFCfcs9X3/g9t?=
 =?us-ascii?Q?Q0ORXKZO0RWbl3OcY1mSXI+nUy0eds9q9pC/Ia3DmAjI4kViLe4HN7xcMKpO?=
 =?us-ascii?Q?KfcxKSLho361ByTHSszHGciSpy7lV8lw+UL2/EEUoLV0uVkIRber7Qb7KS3l?=
 =?us-ascii?Q?NBZ5ivW2iB8TfNfRJPAA05SvWF5JQum8E14IgTT1LDPXCqboQwgw7smaTRuT?=
 =?us-ascii?Q?8Dr2TN9Zon3SxagSFRd5c6L7a/WdBU1UzBSyBBFJO26FGvR9zrctxYxYQybE?=
 =?us-ascii?Q?P8S6XK+WnBXrts3MqU/vqsqSozIC8KgSZyM0IRJn80aGiFUqFAABOv+ojm2w?=
 =?us-ascii?Q?J5CuGlvIWgZQqI0Q2mnLW4qFrAs6OAVdF/+59z40k79Mw9QtbTxfWzR7jdI1?=
 =?us-ascii?Q?kGCiwKEp5XefI5U9ysDuv4qHl6UoWoj/f/m19V164GyrmneQYaIooPM18cl0?=
 =?us-ascii?Q?xPgmUB8Wo755fBh+voVPHDtvKwT+5cmxzunKK88q1p0f13AKImP2tSDz4AEa?=
 =?us-ascii?Q?5iviu1AiCTa1kSDtPyDUZMSL/6U3PDDFkux/jkb38HVsgvXhA+EuCO2El2yk?=
 =?us-ascii?Q?UTyxXD4uKIJwBT5Z/mGB7aYlUIOy7aeGzydVp+i8Y659OczWIohyQyCtDBor?=
 =?us-ascii?Q?VoZE6291lKEpKBCDZFnshAXaGFO1bJsIRr28bstVlPQmXhHm5qvCoRD6R0bu?=
 =?us-ascii?Q?z1R/vEvnk+Xiv9gluMSJRQRvHjITqPHCyWkdlj4cuttreVbUVS1kdn9JuvJk?=
 =?us-ascii?Q?Y6VCgG/q2S8dWQ/kcF8oaHx7kVZ/CSKm89d9ARU8/ONKmJvz4fMvm0NFt/ty?=
 =?us-ascii?Q?c4OwzLtfyilwTTQlRosUd50fpiarTkfF6SwE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rejP7e1sfse9J4zZgpIlGIEuducTCiT7VrIQwfAo0cO9+U477NvpDvfjuTcb?=
 =?us-ascii?Q?72bHMi6QGsX+xtXkLbYvW9TwITFMb5xiX1GST1V2gS0Ydt+c2WCsBc4Cefd3?=
 =?us-ascii?Q?G0sPVvdXauiWWKAhDOrSvf7GKmvHG9kBfm6hhtP9LDIebJoBdAShWnPS54Ri?=
 =?us-ascii?Q?rGiheXIUiPXh1qo4maTDDAbdiXr0eY0yyPmcy7Tz5neOpSyyG3ALReDQ3yr+?=
 =?us-ascii?Q?VcFYcholmBYSh7eKAnL639+mC4NFNL17WVQgsi08yTYJQXGbg/bg8zSFZOe6?=
 =?us-ascii?Q?0qUo/W23S8ByC/zrqmdxr3Wvtrot4Do2WvMW6xlUUsd55mu0Y8Fz25Tp9i6V?=
 =?us-ascii?Q?aawCQUNO7vqd0P/5XUjHZud/dYQYmKuqymbVkmQX6Zg8CpCs/SONe6jMscD8?=
 =?us-ascii?Q?wngW7jnGiIPqWdlRYlqsQznKLPW2P5FnRpiK61aNVHI5dRgBV990XJz3PVbP?=
 =?us-ascii?Q?FsfIbFVxhAGmyg1cn3aWtg9dJmFhkD85/zUwYZIB3uFMiPF8AUdvRTi3ELn3?=
 =?us-ascii?Q?e1Y9AA8QpeEkyRetR96e5YDNv1vHk+T4L5MLX2yN5LdY6kUPrIK8JyFFC1S/?=
 =?us-ascii?Q?A64/V2afG6pxmK9B8F1RZ222vFpWh/HXQhbp4iGPwTX7jf5fxJgCBFpna7ty?=
 =?us-ascii?Q?zJyRlNzgJph6Shl7JDxPnDB0oK0xTF41btQWB5R1P6zP36yPf+dw0Bwxea/T?=
 =?us-ascii?Q?0bGJwEy223EIi2MkjsFKihFh9FSX4mXrLLXQZO+rYyoTiTtrbji7UlSyIA3v?=
 =?us-ascii?Q?Z8W3glcDz33j1zdlMsxgyV9RmSsSRneuMwm4VZLhPPN8topwRCKzlPB8ky+X?=
 =?us-ascii?Q?OpTjqMxIqk9H7dTihQxe1kQ+0yacBaXfCE1wbRb7JJiDwBAiktXBv80Rs0Jw?=
 =?us-ascii?Q?/pQpu0or/p92i4viqaZxmlIub6wuO/vv6jpLq9KJRjjy6hVMZWUKEUVvASja?=
 =?us-ascii?Q?3mw4ip1iqqn2A6QN1nicm7wbzNBQdPV6I6dzmuGCZ6aZwy+448z6hGA8acTm?=
 =?us-ascii?Q?GWpbwr++JPaiSPE/VwKDiJm1bfPeGldakh5h4av5W6NaLZmeVFyqXGNUt0Zt?=
 =?us-ascii?Q?8NKBTQchh+0T5rHOMD+CxF0xqgb27H7Aa8u1whlJlSaNk7rixmGRYT4T4XIR?=
 =?us-ascii?Q?KnCG+di2TbpId4B85/olMdInLG9PGrjQWgyWv5rI3XcjagjaqmcbQlsoBBr7?=
 =?us-ascii?Q?S6/OR8maQrHk/yVcNvSGa2YGlCX3eRiddRedIDxOkZDrOMnv0AvWtrjXOltE?=
 =?us-ascii?Q?CtCrDJRVlhMgyBWjsw+ytMiRtR2iX/eOtfEnK/q/1iJ+46yR4QHgBk5MwE60?=
 =?us-ascii?Q?Z9BNv2gN2HdPDjUgydjrf/JY5yY3+aql6Tx7do8lEog54Bf6z5WASintgIH4?=
 =?us-ascii?Q?Qoxor9T1/M71YLcJ04QcBUNv80KNv3oAp6mVSz27UaQAXcit7U6Jswkxkf+c?=
 =?us-ascii?Q?FFhIKiGQPZipjhQXklsAosZzZ3VotFoTeK81jX1GvNOypapLibJLgAAn6+0L?=
 =?us-ascii?Q?zTANTlhpCRXPiEJyCJKinv8i9osAoYqIcr8sko39x/uFxv0o4MQ5KJ+fttZa?=
 =?us-ascii?Q?ca5H2J02c21V5x4aAQSsxcIejPovX1Jy9AF2IlxGsILnvoWbz/56ZGLPe2D8?=
 =?us-ascii?Q?1y/K3qMgEJfHfTddlQpeXXs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996a325a-d207-419d-7b52-08de3c48de9a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:14:40.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf3gWm+6zFauloblm8Wh7xM7yDWbsVPgEENnbQmevGfVb+fpdrGCG21spHtKtalsAkYbPrrC+vbgy5ZGMshdPbzaYrpQJh7RlhT6enYzswJRc6NzVmqyYnh5a10pr7er
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

We should get dapm via snd_soc_card_to_dapm(card), and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-nau8825.c b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
index 5ef15ec988be7..e849e7a649bc3 100644
--- a/sound/soc/mediatek/mt8189/mt8189-nau8825.c
+++ b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
@@ -342,9 +342,10 @@ static const struct snd_soc_ops mt8189_es8326_ops = {
 static int mt8189_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8189_dumb_spk_widgets,
 					ARRAY_SIZE(mt8189_dumb_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
@@ -418,10 +419,11 @@ static int mt8189_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8189_JACK_HEADSET];
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 	int type;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_headset_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8189_headset_widgets,
 					ARRAY_SIZE(mt8189_headset_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add nau8825 card widget, ret %d\n", ret);
-- 
2.43.0

