Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A737F318
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804125; cv=fail; b=kDoLKS7FHoZlIZsXqe2M2HnFowsPkcGXxJNHfSMuObVikWQqzUPTojraUcVHOYGPtYCAV5ccaXeIlxQXCbDKQMP32DZKsBeI3Xxx6pntWs+xWIpRmogTbWUB+yw2NDFGpejl2Mib1WMY+wOVbmWDcdpQ/5trussCtofZaKAjr6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804125; c=relaxed/simple;
	bh=KBbNtTaU+PuKMWmrLoYMui8KPfJxXFBuWZ/gOEvJiiw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UtPzNL7OH7CWqelpCUGutEc0x6Fuy2nsvI6RHxLsEJh4CYNunn45AV2vVe0YKOZc6YsSlpZ5J5nOh5bko+XWM/GGgLdON3feIwgGJkhmud4xZEIsrGQGdTsEqaA9fTEuv9DtjDkxduKC0mmeAM8H1ebjQcIPBBvJFBcEsKhCTPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C7l4VlFZ; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C7l4VlFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOgi7uyyZHks76iF6IvG/6D0MHkOm4HEK97qUB61DlOL/9UmWka39s7Fu+4Ifyuu/h3GYOn254JYR0y5Lzo1vlS+atJ1xVaRqFUJB/lr8ree0NshoZcH3AZ4S1OTQRTGdiU0X3Yu+be+5gamFda2RmnW+LNnWG83089ZY7l/mSH0XMNCmwysUDLNa7qblbJDUn/ewLalsc9gUyhyWGi3VTHX954I+tkh90GfY39Rt1NGMu1OqzJOZ2G8V0mEem7l9Z0IsEJCTvhzz4d1QQLQhwKnTx/hIMNTIQH0l2kLDfH26bghyuR1evua5h3gRBSNhtjh3AZIToQEVS9YhH6iAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=O1fN1V3TzgUDySUU+/oEPoAFMlVmu1SP1AFuTheCAAPgeeVody0I1yYh2bXcLCcACsa0Jr7liw6KYfSO2lQLKCWcpiYqEjCmbkN/ZHjqDXEw5lhlmikNAVYgrx9nN1wMEp8e8ZkbFVJthOlbkLZEj4X2zbYTD1dYO4FIpYmdc/05XWjY7EJcrq/MvU+Of4Q+orE5P+qCNS4Ha9DeWl2HVtYIJTAhhS4WUokZT/gl9AWj9I4kxBtn5CtMeqsHtpm2SiTL4DjORHxfeip1TGqpNfzTIKuKJ5/lY1+Ifis7Ip1qP1iIH5XDOOURsf/CJNrgr8ZrhZ21CSF4vzdVhmFsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiwMZ5udDGJEIogDEBaBoIBi52F0sCzAwmEC1Tzql9Y=;
 b=C7l4VlFZ/M82WNYKr5LTLU1phEQFcW3g9gU51c5ASXhw38BTlzGU/V8iGAzo3VNZi6QnsVAoZm+JbXlsqUQhIU2pJnr9ZNX1ToLomUpV/mepg2DFRY/pxWw95TiTh/LAde7A8Oq64+NgzBlcYxJvB2+n2oBXACazgeisiIb2qmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:00 +0000
Message-ID: <87mrv2wwbs.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/44] ASoC: codecs: inno_rk3036: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:00 +0000
X-ClientProxiedBy: TY4P301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b5534f-dcb2-440a-15b5-08def1c131fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ul9MebmFShh96W0yZ1+wudNr3ILmqMhvKQ4rGWIeU2W+YJQFoZ5ui9YPh1+lJdera3mQJAFxrsOsKGglzHmlqocSY/XZqhABc5BXINLLDsBJgCg2cjKav7cQZNHPWtssA4R5jPdPKu2l6sdPTCmL4YvxCKHE7kp722/ErP9ahTdp4N/tdJVcm0sKSjFb8JbqYBRG0hzocPyt/VCv+UePs818qeGK8J0/308kv3uTGZ53/sIog37RuaQi7BspqSkQu9E6F3omkGaTODteziF2NXjsId+2PtTmrkn6krh8pq7nZxmSRjChk792+cmHLRohoO85Aaq9Tjy7haURgosNLGyk3VcwDJBuL5lk+j43FIv3AgE2/9zl3Qj4nHzklzePZjJyyX+NqFPRkP/lpvPogxU3w8Hvg8qEWUT9q3gmJUGR/Sq+oZu03oXX6n8HqQEy8/pvqb4Ls6N5O5oGVTfbvgVJNBjdmLGt/VVnJhcsv/sR6KiCwV+1xgpyRJ7OcjfGKs2TJpTpTEvG7h7oAtMvVKQO9qvVd0Oui59CtgluP6Fltize+l7D/5Kf9JtoEBoUDQO5IKTW90H531OY+hIdeOQDlfd9nlzqpZxu6KnG8XS9jtVPj/VMbwUrlvRvB8fP/A6k4xCAhELdLYQh6aYRgdrVrdnEqAcaxr2KSpISOlgck6eLzzjoApnybR1zvMY53yL8CmUpgFfN69iuwAnvoRLa2htgL3fs9vdnbi8xIuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kYBY9ZXJLGDbD5DNbaKuVQuwrN/SnMLRzdW0MC46s6jFHHS7P5Wu4OSoo4wB?=
 =?us-ascii?Q?AKGNAZS4pCn1o375lU4ZNh0SXxdl7KrUHgGdo31eqIaUR3XBLWfCbaOf651t?=
 =?us-ascii?Q?fSc6u+fgoKU2ppGeQQEUw4Umr3uzCXiYrI+erB+suzPItPJMRTCnW/X35Zea?=
 =?us-ascii?Q?4XeAA6QtoTDKJCtkHnNtnmcTqUEi8KdiyEEGtDgQAEaanobkJXWshQVcbbWS?=
 =?us-ascii?Q?F8qmjkVtdUAJWWIhtnLaPjw6mMTfZlFHMUptKx1BWte7OFTwnlnJpp8dsuWp?=
 =?us-ascii?Q?wZZh6H9FR2HnWOMqAjj58XSjWV3O4TPbV29LW30+NF98Rt026dAN9ZlDiCTM?=
 =?us-ascii?Q?mz0L6dtKGsQm0eoApXsu+Cu3exqwhRxmS4TljsUUc0wROr7tnEQAbqxjJFph?=
 =?us-ascii?Q?x+d3n+vyPk//TPtkL2lCd00qyybYPY1+hd8PlgW287LvjRF4RSNCl039g01U?=
 =?us-ascii?Q?hgH7Xh+qm4PafAX1V6dIxXbVTMOB5KST80ncDTk9aLO4RSJ67qODzYIofGCB?=
 =?us-ascii?Q?CQnJKnSIPH8QtmQKwIaOL+D3zU84o5eBQ1FdeuYgn5UUH1RvBy6PbehOCnD3?=
 =?us-ascii?Q?4+QEPBJ9cVXoySmzYulL/r4ttlCUs0qKb20ewEoIv1/mDqPvWSmiQTPU6OD0?=
 =?us-ascii?Q?lS6IUfXXPsxTG2eCAyc/IQpiInF1frlgWwbMqYlDnGMf/pIYYI+IwOKwAN2P?=
 =?us-ascii?Q?TbYFMTPSidv/V0QJ+Krg5WzXZe4YXdgqSSK8dUM2t1wy/klEmbZG3TEBMGH1?=
 =?us-ascii?Q?yLqdkPKI2sHD967m1J1+GFu7pQWkSAosghBePHuQrqkQFBqrifTm5ls7kWU6?=
 =?us-ascii?Q?OwXmm+akYF0TmgKMWu07eW08T2MCp/F9hLFDnFvHs3/LmqjMYkRRGukczf7D?=
 =?us-ascii?Q?Xk/yCumD26SzoBre6JWP5QQXB1CLPUj8pLen1GvSWMqJzzgf4cz1SRLu7qPi?=
 =?us-ascii?Q?BrazGaHrNOOj3fyznR5ynQxqqXC2oxD/ABIxvy3GcppRjnFvNwwUXj+ntqzr?=
 =?us-ascii?Q?4VUVNFTjdGxm6RiR0XPxd3JZX8Yz2djHSL1rjac0fJqGATR9etgFRHqbiI7Q?=
 =?us-ascii?Q?7OitEZMHDDZRLTZmaF+MVUC7WGKZUgps6KVDNCZdjJW8krZzB56ZoJ9NYf3w?=
 =?us-ascii?Q?1lk0h8a+xeYbTdtqJqJ5tq8JTSwFYM057Y9trfyTT3SrPgOH/tiafGSZi6SN?=
 =?us-ascii?Q?jbLJA6i+e4uyqlxTVByDVISXY6rQcr4DjZdJRGuIWrifbzhW4aYAEHuVx4VU?=
 =?us-ascii?Q?VELhjYbbxp/k6lqm9Hxdtrh35f2DzjlXJcgKsiiOGpdQs/MWA5RdqoXN6H6r?=
 =?us-ascii?Q?qMT+3QUxomlFiOvrzI3+p4UEfS18NaUqEpidGE0cPDPba4Buk4+TMnBKTu6g?=
 =?us-ascii?Q?MGLHus4ZkcN1Z9SQNSjYeygBPsgejqMJVgrKes0I3ZIY6VzbbCfdObxHpOm+?=
 =?us-ascii?Q?AnZ3sJSPbpFRmlINBVlQNzQsFf+smTbXkfIBcLeMgzVaRR1IC/ED6BDSi8xL?=
 =?us-ascii?Q?2WOgWmyN0sVogtvyg3ruCx5NGnfcrlXmHmB9GbA7Gb3gOXEISH6SpoaQ0c5E?=
 =?us-ascii?Q?gdfj85YsI5R74pDY4fjl7cJBvI7zx45PUI1NCA3H882Y/34gePZ09D9C8Wlb?=
 =?us-ascii?Q?6jmAMzg4x3Tt7MOTOuUww6uBlnm7MT84SeKxJAHY6OAz+O7QYEsQzKm6bkIn?=
 =?us-ascii?Q?qURJSVZ6rsnh1HOFEDQY0iSsYxzb+3AfA8W4vRWh5jJuFwNUI9ZTY6Xu5H7e?=
 =?us-ascii?Q?SQp4OkC+knfIDiZBCenOi8wXmI7ZCBEVJaBkWzvIyrLzrQEm3Njf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b5534f-dcb2-440a-15b5-08def1c131fa
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:00.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i8ui46v+nxP5OefT0pD3DGvxUqnfzibwXYMZKv7qQ7FXGi6h2UzUchsNiGTX7meN5vVC1USn3Q9+VgH4pa3zPZETuavgf2r5446OfbLYe1fKHrRUFTol7qYRC2AKVI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/inno_rk3036.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index fdd19f8e88640..aaf03f2281507 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -309,9 +309,21 @@ static int rk3036_codec_dai_hw_params(struct snd_pcm_substream *substream,
 			   SNDRV_PCM_FMTBIT_S24_LE  | \
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rk3036_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3036_codec_dai_ops = {
 	.set_fmt	= rk3036_codec_dai_set_fmt,
 	.hw_params	= rk3036_codec_dai_hw_params,
+	.auto_selectable_formats	= &rk3036_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rk3036_codec_dai_driver[] = {
-- 
2.53.0

