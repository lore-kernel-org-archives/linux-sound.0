Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7CC3803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804130; cv=fail; b=g86G9EcWGR7hgSH5rqwulY6WKnfC5d6SPZDAwE7TPi/bzOREwlhXCXczM3QfZhC7r7bkVQDc0xV8vTg9aAtsf3zDscSPRYGtSC1iarkS/qo92OS/Fe3w1rdX044zHQH4MQbNiYvuq2wutQYEIaXMi+EL/gUs3mMvZkkGDifRK1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804130; c=relaxed/simple;
	bh=PAwpytvvoTu0KwzQjsHuzb6IzRYvl/p13N209K0NyvA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YrenO3rJkZHiS0xpbu8D+n++seLe0rF2jHTevCCFg3CQvuTy5Cr/rbQCGdxH5QXvMqwJ22WNO6BXlgvm8CkTN+DCJ8fwiAn4ojpBUZNIdRwGE4YqemJURAqAyrDtQHwxzACnlptxpgmBy4lM2HcgEfXP2uNHCAs8IcMpumeOQx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xo2bmu28; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xo2bmu28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv72YN/EVguJT5OqpfabVYj3JQYVvoi6uYQYkq4v/GQAOpfO/PTkXR9rIvnjYSSepkr/XbGG6No6/WyGLyCh8itWE84vwwvZAsqrX62ymFpSbtFLJJBx78MY/PGugGGWSmg5YjCGfvA6yb0H1FI/I+XAbMFwJklCgk8dPcgLWOeUaNwwv/NuMBFusdweBIjw79WHVrAPahS/Ie/u4mYxREFOxRQHautvoYiGCJL5+pn7/ye8CtUB4Gpl+BOtGMYimn2ffYrVOfC1wnirbelrgay707hs8kdIL5yw0DmuXDaNijc7cTw5HKR7hW7t3wa9cHr+JxXgjf75CEfHksH66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=Faot5QVaGB0IX8NzOE/c8uIKonjBawGLywdCdDbphsIFjNr1DsGJ72wKKfM3Q3P+0Ryzl7dezdsCOJ6SokLrNHIHr2cBB3BBMpmzyILEqwe2Ei1TULJUONE+JmJUu+75lid3V1G/LF7cvJzVinXaaVqewjEpJR4yCrYPk3AVewBI5zKbe/s9tKe2+ogqFhm+DZmIEIfpb+lAK6A2sCVnWcWka7G6QOwAZkvbx/YGaF/TiooX7yrbhvkdAkStwJJOj2ewjuTsYPNEVOotZh8b9WjnjFwK1LCIbFtMNUVaC2+uSVZFKbozRL2S62Z1hd6g11yNw6Buv0LNJwlfH+aucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=Xo2bmu28PC+Jq7p/+/YqCCvFqw8EWl6W1e/op6XkfNMz6zNFbD60PT12D8MFLQSSagIZgB8qoNxMC0bersmHHXulL+cKfaJyS8Oj6nUSwuxFJNmjD64z+i4oRmVWMOe3k2GSCQMsdPMMNKXGbqaGTPPltD3EdOagEtdNNWi9Uy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:06 +0000
Message-ID: <87ldamwwbm.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/44] ASoC: codecs: isabelle: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:05 +0000
X-ClientProxiedBy: TY4P286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cf4fc0-da11-43ad-aa19-08def1c13569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	cDVY/pxq4SstmO+fledqO4+/8us2Rd+5gtdE+/eJje1HmwOQpmMaTHzib4narAZiI0bj+GglPTKCOkj+9Z8uHr6N43WMWJOoWZG9mVUj//MAaLsXN+HxO+lNsLoeUfHLPrsP42HIIE1ueVUl5fBQPA+Y+4HiptYIjXI8QcWqb8jJP8jy8LJaz1JwIFiRW1EIJRJjfkLaEnXeSbWsMTbFAsskLgBDghc6MTTDXr/s74Hy66e7kjZ159BI7TS6181dOtfwPMMlOk78u/7Q8gscKUfT+81SWmqc5TX4VsHAFvc7T2PeF7hJmSGsz1Og4NEBhoUAZnIcCiIm29hM86G6ghzx4c9iIUG3L3g8ia7Srm6FCmZgRT7cHv01aVgQ+qi1F7vT0b/AdlQJn1v/i2WYuFmUtVAmrF5xUUANFcwrbIvOkmg33ZDRyNI2Gzdwr/HWmhK/t2a/d3IgwgWRoWX24nzKQFFHA+sk5PE0N8YIBnoDnJ+ACym4IRTz/ne3TNvM+XsCFa/D/hSpWAxfOYtQJir9XQEv5IPgW010XYnuKoWpZTs+Ukw9lXf1K/TnBxXSSLMRZtyhXcF7KFogvZbnotqiAfZ2a/4/FGRkGutGE9FiOarQQ3yOxCafRfIzaCW2BsF6+hLFRmjww8+W1OzuZ3sHVT42GriktQn1jAC5SyiVJ+/GbA/8hvvWPtWXS9eC3GHAYkq9n3DCZuEAdVQTvqMKUZGDFuiz4KKNXSLCnxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Zblb9FLGwQb73iMataJx/3rTF9NVtMq/3GmXBnxiGwQpAQICbmj0uHAXeDO?=
 =?us-ascii?Q?9Ys48/TlBehUcF8o+KQNM4FssTkFGjNOouR0QMchJPJ7WMUYkscyZL4ENZ4z?=
 =?us-ascii?Q?sX7bzHG/Mz41MiU8PHTTblFU0My+O9I7fXYlbjSbV351A1m8o5Qr/cqDWjpb?=
 =?us-ascii?Q?m0jOcNWNQvpAwf4tyIOD7fZ5a6DBR+8XnTrQv+t1GpMLgyoCKP4yqpqx4aBG?=
 =?us-ascii?Q?EJzwE4uvc3LbVEratHZlSOucSAx8ksYMNd960av2GBEQVQWjWp2olGpLqBFq?=
 =?us-ascii?Q?qZWsRDqWPq/nV+StYSLwoyPNHQ3Jcoi3aEHKRReE5VyQo7m9Pzul+WpS7OJz?=
 =?us-ascii?Q?LW7hqAgJS0sNAFQxnfhvv3V3V9QHttdD3iS53w367p7YnKpJqHIMCeL2Q9H/?=
 =?us-ascii?Q?gOzG1lwRRvFZtPkXoZVcKqO/Qw9gNVE4pJU9sVpkkNe4sKLBQYvIkdJ+ak/b?=
 =?us-ascii?Q?aW+fF6/yrPL+nSG2imXi/dIpsP14NknEYFC7yau6nblit8EvkX+X+2Kvsmmj?=
 =?us-ascii?Q?1iw9RrCfSfzJeFHWZc3pS10d74Hax/mZW5DoNp91Y0aT3T+pS1MNH7ZuvooF?=
 =?us-ascii?Q?+zIYS/AMZ+veJMXWzK4KzYTSYbnkwYTpnVVm9WO8Nsp1nkltoGuqYHHLGv3C?=
 =?us-ascii?Q?3cx71KPQXv5IRBS3mmTmTviGYcSn08mXnePw1VccFSq0m1La3Vpe+ULErF24?=
 =?us-ascii?Q?HuOp8xngTNXYf6FsgbaR6/C0qBBab6DTxGAEp0n3JFj6/M1O7EO7ASpacBjl?=
 =?us-ascii?Q?NVLkoQzO92sFLzVe9StRalT3+/JhjPrbo7VH/7+3FzA4hxF5lA/BbsMge1h5?=
 =?us-ascii?Q?kY0y0HNPq4u9Lqz4zetit7jcM0Vr6yZqf0AqKEOTmXxvPWK/nRy/dHOKW1vq?=
 =?us-ascii?Q?7gM7/MYwEz9MkriTrsRo+f5tL0IVor40m22e4Zsk4Ua0D16hNVBXPb7QwJ4E?=
 =?us-ascii?Q?6B5VjEa6ZtiuKVwvg5Luya8Fi8QzAbgL+TatFsdJruf8Fk92BHfbSJojANUL?=
 =?us-ascii?Q?5FUwS6pBem/pz6GIc05lFHTMZuHy6YgWy71Jdn0zRB0hHi0UNj1640lPY8vY?=
 =?us-ascii?Q?kdrB105BQWTQ/MNfqcDKG0LWmyG5r65tuYil6MTVFxEBu2SpNPCRXwUv7Vyu?=
 =?us-ascii?Q?/01HaIiSgAfCOgw26Q+UaiNddb55pjTdngVchL46wLgCCR9L/hh+Nh0BQxsJ?=
 =?us-ascii?Q?g+8vWSrwNPYc3e7mjQ3Xl1gcM3eZyF2Q0sWYgKJ1EsHX21sb5APBYZoqPOSh?=
 =?us-ascii?Q?diV+rte7ePbWzTm9bkIuspHZaMIAI3Vx1t6Y3Oy5uKJ/dxsC4EvUZkAPxCE/?=
 =?us-ascii?Q?PhyG2rDG6b9K0CDc+Kn1e369ifcLGn4Apt/rBqcyeTje+eUQbnC01IYH/mn8?=
 =?us-ascii?Q?uBy66SrAvT4iu58Rny+UpgkxZCInQmhB8XMKHwWChn3YiwU1E1czCHg3To7H?=
 =?us-ascii?Q?vF9sHFbIJIpHVAOc7S1YBWiaLnuaeWJ1BXzVBCpbsdxdrmB22yAufkgfU4sj?=
 =?us-ascii?Q?Gqcr+p7ymLWOTGondMW0bPQyU5Y16J1Cx+Qq3+QpivxJjJfl9kKo3uFYURiQ?=
 =?us-ascii?Q?tRbskvzqGLM5d8GgLnVVUp6RNttfQgFdM5JlQnMBpyxFMG2Bq4Tc5mJLB1og?=
 =?us-ascii?Q?aTe/2ZIYbhib943H4449OJNRgtiSqQsA52WAnIrmbLNPwoZpU4JeLAfVQYcf?=
 =?us-ascii?Q?VXqOnAr39gXSHv9WZUApqi241gMgBc+MbLTYNQxmOhmah0k5EIV+uhQGImSp?=
 =?us-ascii?Q?r/CtPJUq2N8N4PigOvLJEoIPAGqqo8YYvQO7gS2f/yYNduruw2Pu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cf4fc0-da11-43ad-aa19-08def1c13569
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:06.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U8WUozBZKEVaIGg6sJ7RD32h8lDjr6ZEltUNjSigF7MsmfjRd7E7w/El+cNtrRPByZcUC616Hy9Vtb9VKlUnGvA8cnvSuvBxEl+9n4bvA87SFZCHIYWaLrQxpUNJIDW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/isabelle.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index fa1c23dda4eb6..7e8dde79b11a8 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -1011,10 +1011,17 @@ static int isabelle_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define ISABELLE_FORMATS (SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 isabelle_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops isabelle_hs_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hs_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1022,6 +1029,8 @@ static const struct snd_soc_dai_ops isabelle_hf_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hf_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1029,12 +1038,16 @@ static const struct snd_soc_dai_ops isabelle_line_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_line_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
 static const struct snd_soc_dai_ops isabelle_ul_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* ISABELLE dai structure */
-- 
2.53.0

