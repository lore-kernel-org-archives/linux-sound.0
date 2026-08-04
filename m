Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136725B084
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804183; cv=fail; b=IHpcwG1XWJKjMDblDtutNSxbzWk3kOXThIfxxTXaZOEWp7VBUDj1HgN+Sai9o3SnHSUTW5CkVw4NOrwTHWG/dhJuVqGs6tSe3+7jhzyQBiOJ5pHzquvK9WeCyE6ToI/l3aRIJ9iN94I90i2D6McqI1HFXG7QMI0jltTNWGBKSCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804183; c=relaxed/simple;
	bh=/J9qsfjMKy6pb8cJVAQb0Eg3zNJG0IoqyQnpuIyZmqg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MososkeG4JMMAR+3UFmcGH+FelaY40vGyuSELgVIeNHvyKQAQSxDlb3u/FkDFuRDwjibF42mu35TWxnQX7NBlJVmg9r2j0Erw6aOyklyJUIhzeXxAWu+4eZxIo96gvSwQs6jHC5dglFNMWrOyUznn47MXlMtqNpRhWXJNB2te5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q3id+3l7; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q3id+3l7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZXSFCTHT3J6Z/4o89F40lOkNNEVFt7c/m2yfX4mjlu5I5X4me+doFnJlhUaPwaO+CGx5t71+QY0N7ITMOw+6o0vPHXM1EtZz45IKRe7Sn5/K5NPMUYMU2UtkwIkT/eXUOHpYGprqpq/YefqUCJ6LTmfp14KUAqpb8v4+G09WHmIMmWal9QWtklW6jykh9sytPK8m4rzvBGWiXg+mqHAqcUUpEVU5t/4jD76+m3bRCcIAJjclrdVLVJCIQxFSoZXdXnC49UrJBKkPPSPwcTm9BhBBpSX7lQ4oKN/aOytjiHP9yKRfYvOmpbufO904s5TGq+QIvB+mL2Ar518VgCTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=CBuF9ArJzNkzP9VKZXEZhPqBS2ihkANrm/iDNAbpoFWfea/IpN9JFAyTZ61egU6n5gE0XVy9IsVEydIQpZ/D1nF22esFIUHX9rPZNI0JaYlWnd0IvH9d3ca1AESs9z1CaEZePnDyrUEfVXdcasfA4OWM3lLXzKucsGaSpFR+DpssTlkGglLIUuYKwy3SZpW4iZ9dDA+nhpmYsWuSxgZCU4nhv/NVOwz15UyuaCyLSi2qAR+Tk/IzvRq/z8lssXTic3rYnt0z09CbJ0kay0c8EqqgaYkJurDQ1FUtJOtmsjcenDxXMwqy9sADaHP6DpXrwY/p+n1WvTO/OP969tXGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=Q3id+3l7hW1ChN6jKSLnp2jNLGde4axvIroxsPc7gDA61dk33/5hYTbHLx3L5m933xhZ/YjlNVyZ1Ww/V8bJghZsuPg8O8iMEUhC4AyhWQ1IZuWnGRiGiqqyVvq7+lFiCk857dov17S/UHm4uLLQTeL9L1gaUTZ8OAkfYHcqOwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:58 +0000
Message-ID: <878q6mwwa6.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22C=E1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: "=?ISO-8859-1?Q?C=E1ssio?= Gabriel" <cassiogabrielcontato@gmail.com>,
 linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 28/44] ASoC: codecs: rk33*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:57 +0000
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecfb5aa-e810-4c0a-cddd-08def1c1545f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FXs9DyZ26/Z0SR+tsY6ZQ5WyJUeCKBAHUjqZzCjRT7m3MVBY21MPQes4IymOw+KEojWDB28FV0A8oqwO51vYjPRJgFscoMyyiAdgPqNNNufv/ovrTYylu1pQRqLX3IaHaQrKahfyDWzWov/ouwOfYs9knccaQ4F3yOuFdyX6IA6txzBrS0iRtNjSTyqnHh/nef81na9qpfNzTjjSS1AjCeby1d/JAj/F3msVVI7ZjK3bD+GPfh4Iika8Sx+gIZRO6CNyLuap+p86BG4knYz3wKquDM8iooMiZYIJst7U5onMF5qkwDa6pKduDqe7ONyjn+v/+GsootEIbumMvSe1FzacjQonrdYox2onkni+TEP0r7PMwLCqeiGIiyRfLUP4qj4zvEKJdeA/LxztwdmUCBmoWnz4FdrKnoaw86ImsmExLOR2E7atEqwi+sMGpWpslalBXWOkoQUfMzuFzS+8LX/5tPuIhhzuoMZhAFG+EDegRw9wnKNWOrdcrN7pBqgKbuUw4uvrrSyni5WRqj6bu0VSCMuTRFEH1lo/Wwte7PKucTMXEaMIWSH2H/dQGJ0jV4ZiXft4Xc45cmzqw2SnCo7642G724+9CEoEvLvDP9iRIZsuXux2uyDvT6ym5VAjPUEAdgLesJdSFeUdJPCkDxmGMDccOa203CsU4rCeICLrT4QZkT4RXlhmoGjZFCPZQtCU2X9SfBfc05vnJsWT4IAKBbvj9lSHxPWCeJhcBnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3kXX3q+YlqQoCRjbvzBR5dcHvb4lUqXZ7Osl8Sbg1LH1Q9BE4155AWgfOKAl?=
 =?us-ascii?Q?vIcvRswCXpQ80m/Nc7ZPkl5g0dIDCyfo2qeufmW1Be24jTPLpTrZFXbGc0rq?=
 =?us-ascii?Q?xLa74R+UuH8JeKv+i8X0+iAbQwl29IgJ8gMMVMrYfo30e2S4UkmVNxE3aioP?=
 =?us-ascii?Q?QYc4XtNbvMAt2pAEB0bAOZ4IhMHacYH7cT19G+/iwyWFzS37qnCrwWYCo3va?=
 =?us-ascii?Q?gefV3mDVpva4PqgjehoXjWhDysP0muaebwhk9SnCAMUdysLYcBduLDzeXbQU?=
 =?us-ascii?Q?3l0PYbn/qXeZx4M8min/P4mZWyGuNiWyUt5TQZHtjG3UAWdnwzNn7j9YH4Kf?=
 =?us-ascii?Q?SemJj1uKOuLimdVkf/95qF4/pDyD1NE8cdhxEBcPcNah0tq2uLVSau0dU55m?=
 =?us-ascii?Q?ttFMOC4Fj2ecwyLupcgsKfyBcHLmbCyyXIg3OeqkK+lghNyiF0dd8+gJcYq1?=
 =?us-ascii?Q?+Kz953PRRco/rKf/k2ebdKqvRIDj1LlBkcH6Jk4d0/9KGKJl4muUT0kdxUph?=
 =?us-ascii?Q?YtAb12mYnmdtxlKqMOWcDVEzLGYOw99+jES3dWz+Bu5ywV5Kyv4Ut+LhjpDn?=
 =?us-ascii?Q?jibA2P2Tld3tfQiOXUBbjxOhIT05in8mcMNwUuqkr9r62gZRprv6x4DZZTMZ?=
 =?us-ascii?Q?lSAF5yZtOqsf10FJ0KutJ1mXBbgco1Q2YcG0ffl7ah5PiMOKyfNiytziYsMZ?=
 =?us-ascii?Q?Kb2CNhCq5mFWE3J2zvBaG62gAWxpTpN61hf3W4x2SKp47d2XunMfncv5LBHO?=
 =?us-ascii?Q?kzjldoYijBGaBr4O92VqLXiDNbHiXPgX8WGkmwBks/Q4QVOQ1bhqfYalF6oL?=
 =?us-ascii?Q?zW5DqvI3N2n0f0RlEGd96Ik285ZTP/XXpv2kUmeHD3gJu+Lk8pno/47MQrWa?=
 =?us-ascii?Q?cujeevDgoChsZGewWFaJ+2TUl1NajB6bnXDeOrVmHBCXYSWjM5B+5fGp1jlW?=
 =?us-ascii?Q?TQ5e9VLw0OFCYGvCjRQ2CPxAV7BlUiVPL58Lu1NUC20Q7R+uDdnP+xOf6vaT?=
 =?us-ascii?Q?8P5Ov/EGQGmM9u/dz8n/Z6ajQEei4HNhUBShmUUI1D3FYQ3M9IGVDvxeHf8j?=
 =?us-ascii?Q?mGmnEDHY987FcK/WdYeCZjse9ck01KI0bRSmF/s4sDT7cTacLfagtHN2egiw?=
 =?us-ascii?Q?SgG9iSWObVRY7XbnXeUdmj8WLmYKCmJ7wFZys4pX1+gv7CNjxKSJWaqbfY4A?=
 =?us-ascii?Q?cHYgOgZqwB13AasFOuQCvi9+Srqxs3g0KabT3IIu8KBz7Ffn5bFBhxjoJpti?=
 =?us-ascii?Q?2cBraPHpkejV0YkoKVlXFso/QFqgNs2+Lgy0jeXGJ5SE2QwLeyb3oKn82S3u?=
 =?us-ascii?Q?Tvc3fhd/xJ76flMvACWqnSrSget1c0rN/XZEL+6RGpgen7odck4yV5XogJGI?=
 =?us-ascii?Q?dcGx6Q3YYvwMEIHf82uxBdNxFH4NA6WzEqwOcsBqH0R3PFIIHYLNkTQ6h20L?=
 =?us-ascii?Q?M3q9OQxXtynfkqCwsTTy9QVI0hNuLmM0HrROEPVIalEq9NzTx1Lmi4T5+LKC?=
 =?us-ascii?Q?TRtexpLG5q1YrSny1hzLoVHqIn81BpKR2wCGGYIPfxzSPDNrwevw82YfoV93?=
 =?us-ascii?Q?tB9GYtmdJdClYJ9iz7Q9tw5kZH8A2rNXiFBS7ljjJbyz4ohkEgp8N8foIJfI?=
 =?us-ascii?Q?zR9dPGEY73TmiRyhpGQWffqi4fprlgFNhK4iGS///c5yyP5AfqxECZloTqVD?=
 =?us-ascii?Q?EWeOBu6cD2EDKxTW805jnj0Zev4F28K7nZuX9SrB3k2TSeNrfcFipw4C0lDI?=
 =?us-ascii?Q?Qr+KiCBJGoOKj6XieVd16pTnDIoCc/gj8rixthJWs+96NYyxnz4O?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecfb5aa-e810-4c0a-cddd-08def1c1545f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:58.0606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/vnfxlDD8URd1uRRJ8lHthqUWgNXSEenIMe4A6tIPwyAe7j1TJ7mLJLIlyu50wvRkeeN/ILkUKLqK7V3NuWF3O2alvUVI0unSEU86FSvrfDZ97jcShUPy0nIRKfTfPA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rk3308_codec.c | 11 +++++++++++
 sound/soc/codecs/rk3328_codec.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 60befe9d37f05..abed31ba660c8 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -679,9 +679,20 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
 
+static const u64 rk3308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3308_codec_dai_ops = {
 	.hw_params = rk3308_codec_hw_params,
 	.set_fmt = rk3308_codec_set_dai_fmt,
+	.auto_selectable_formats = &rk3308_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rk3308_codec_dai_driver = {
diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 5871b5a819757..c2798ee940593 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -312,12 +312,21 @@ static void rk3328_pcm_shutdown(struct snd_pcm_substream *substream,
 	rk3328_codec_close_playback(rk3328);
 }
 
+static const u64 rk3328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rk3328_dai_ops = {
 	.hw_params = rk3328_hw_params,
 	.set_fmt = rk3328_set_dai_fmt,
 	.mute_stream = rk3328_mute_stream,
 	.startup = rk3328_pcm_startup,
 	.shutdown = rk3328_pcm_shutdown,
+	.auto_selectable_formats = &rk3328_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

