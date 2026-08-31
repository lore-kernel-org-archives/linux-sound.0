Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102CC3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152883; cv=fail; b=kGrPDI/2rEFqP5xUcG7uC5/+VdQ9B+ZlYglOJRwekooa2qGD6pumKFTe8jS2aES1+JhWHlMMCLL1ujfdAEHiuBuPpBbxg4Rk3JSuLHc1kqZm5PcKxPrh5xb3//7Of5YjFVSx48qcK4/qxtaRFtyPpqfZzCmTUN1rhP0TDWbffKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152883; c=relaxed/simple;
	bh=PAwpytvvoTu0KwzQjsHuzb6IzRYvl/p13N209K0NyvA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ev7WSY0m+Xdeac2dli2LGqGbisaWzlCCUU1yIddckAJnW0qnhpxx3ur+V0iCaMA7k5DCelwqChvBjRr6UfjUZBVJWdm9iqU7Xazp9c492mZxeOT/UyZkkdTzdVzxw5QeKBhvw7Q0ZXJKHIJap9F/NX71cNVxQVUUEDx2rvueFFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dGUpYqeH; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dGUpYqeH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hB1aIrUN3KOQSk32v4anOybZpgFn1N6Oq4GMMMOtVDfmO785HX7crh0Mf0QErRQtHAavjC8Z7QTNjVWX3cs82pstUJDsfPcGpcKg9+a4Ii6eragy9KgUmf50kd8lCmQ2S4gaa5urFS7iVbJ/5l4dJmfRaJASJx5g5+UYj/KIfh3KbZOodMTnClmznoxqYSJzxCJWS6ccEm9wly1gmlUcVioZ9M/Lmy4iqhDis60kZ/9pLNvKy7TAmYPjZKxoM2DtxmJrZvipTXGRJxDOxRK0C8sqrSTvH2HVtOQU7IFFJ7wilbAwV2xdmE/YLTHHMI+1CgQEBhGjtrHLBI+5fojZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=GxwvL4IWfi4gQBCv4P1gh6oeCFhjXUVg9zfPzsQ6na+BhEqfShnxHYl4gvir/ExPOlVkxN981/bXMliAMZkYh7o+NpGIVD3n0usLULQgVZIBqH6+/9EvrAGo4rziziBbxWjCaBkRswayw4bB79Kocw4VEZ2s6Hc7QaOVNTXAFHae+WUs49cf8hGMWDVzLxwxzfVc9HyHATwJFqN/nwOMWl+RrLEuwl2fTZxpQb7wJeFX/YIjOXWbH/rFUXsH6PKa7VEAHpJ5pME8euzRrF5Q3t4ZJ7EfI0wvroXYWOerZbPdr1Xt/xwFcoeKntfk6l5aJ3SbNnj7EFUJrCwdZ/zcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=dGUpYqeHlwYoU74QhJzdxxJBcZqrHtpgNkb7LvcVTQxGkVgQGG4o9blKKt7AcsZNzzfxphUSbGxg2pYoViVBeFUin9LJ1ySc6HoD2jdUzn/IFj0q8TS7lNiR7fk3hdznXv+iFKUFL3PFA+zrlmRojSRyUgRtgC2k/jedHDSuMYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:00 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:00 +0000
Message-ID: <871pbevpw0.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 16/39] ASoC: codecs: isabelle: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:59 +0000
X-ClientProxiedBy: TYCP301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::16) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: c76c6cad-c4f3-43f7-ed26-08df071dd3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EsUUbdUe2uvO+YPaiSlCPMyh9/nGBmaQVN6ybJfl6eP8Yi4zaei4QaDs8K6wIyaJD+ybm5JRUBBsMspwt4J+JbaT44Eu1rclKFBjNHd2sryNhEoobRbdkdgoKkI72+o2MsvkV8vup30Q0VI2D5Fvy36SiUbSakWDluDjtAPEu8seWMIBwG8krq7s+fIeWXE5P835zaE4EQFoB5H9nU+sGXAMZx7AcEeuLy8Y9Kj6q5YtPxT2+HP0r4qggQutlQkcPeve/zoxpjDynblzvB8pBcITEoczr5ovp+hT/gxpXXVU/V+QM39KKjN6RjaeU+D2eJovbq+eMM0NMUIBKMF0VWXsd1TRClugAxzBiE8HCEh7fT7uQ+oromL0+Eqodh2e3mY1AfVBM09kXrFRPeT2fgxU2IYuWxKcsVT74l3JvDjOMWvM6t/5CFTOjLtxzJOvvq7+wPZ4smeMpobZJOgomCrFKVfY7L7lqKygvYkpvgI9RSvGsWgGWEYv31Gy/cm3QsSL35wsORybVuK5am1Py0DrJGNj6ljOixfefPN38lXzGRqHI/zjdNxo2s123pxmEr2D2zJkXlbZCX22xRg/6Bn9hrbPYbSQc8C/B1b9wmaGxVZbTrnpJcP8wpbsNLz1GkPC1j1qYCm9EiFGfN02fFh7j0ujdkFrR1uzewIM/stNqBRkmBVaWtCIhhEm1lCClduLN3inFUfCd94gKBek8jhhePR1qvoHsV9a8JYE2nM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HkDHODuDX1/dZ/YyjPBSYwCyZsrDB9htgHtG6mZX9is4RjsfW8vDmp/d3Y86?=
 =?us-ascii?Q?j7X/GREytNEbGd7/jzy+Yh0G7dE5kFzD+pO13Ty/wcMBV1ZAi97XciMSWN88?=
 =?us-ascii?Q?lIlSF6LybU5xhDuDxbt9ZCVQTRTe8bCXekERo+YBSHu0pmj6NCG2t8R7spNj?=
 =?us-ascii?Q?RCy0YZNsJusOONHtloxQ2AYsJQfl0mtguQxHa6Gldb4kzPFXNcRZSV+3wJ4Q?=
 =?us-ascii?Q?2gVN4G0nHggrbeDTtFvyfZHsEjlUfUkMB3LWgH1Pt+I23+i3FMcpLWivQm5p?=
 =?us-ascii?Q?K9bVDQDs3KxHhT/D/zyIVSlnAumbOTaoCeu74ZHlgSpvQQM/aLbq+IsttzYn?=
 =?us-ascii?Q?6pVaDnvRHp2/fD446bn4eWVDyxhwjyYNC1nIJsZwx/b4eTSyqwqIPNRWDLCE?=
 =?us-ascii?Q?iSjrPhC90lUb7vi+l+w6IXCuMTGkUqj0eTN/eilDHqPK+asNcsWS7VZysdma?=
 =?us-ascii?Q?pYqdbOcJFEtzgWXppmoH//Q1gc6OHFLcTQo9tJwrCJhxZKltwi7JT0McpFHk?=
 =?us-ascii?Q?9wIVKVo7HpR9hPtbElkImPqoY9AylEQ+m0UyI8FPYgjJra2s8ZH5T87e8Us3?=
 =?us-ascii?Q?oDvc3bV7OWnar5MJnZZfByrJ3ZhnhvVrMrIfA1kKLsc9tSUXe2PZQ7FGch/1?=
 =?us-ascii?Q?z6vyygGb7vFPtoy9hZbT1vs7yLTY1+P5I8kbX+OUvpWCd/BJY7wah8zZ3hNH?=
 =?us-ascii?Q?5XIDOqc9om/H+fyh2VH9HOHTNdT+m5pB+2hag80SpIffk+XFs+wjBU5eP1YY?=
 =?us-ascii?Q?dp1jXKO+YfEAb84qrJZ/xL2TSMPTQ7MjUGtm8RbFyVKvJ/vuQbWD+TBERUFA?=
 =?us-ascii?Q?PM5kwsKJBKrY6gMtP9amAXsS75pAg99y5YP+qJFw+4wL8/ZCWAZajYtw01GJ?=
 =?us-ascii?Q?5B4nLFv2ku/6dhZkC5VWLUApY62945qNvHMFYo05+5ySRWgWZxWP/PYbCd9p?=
 =?us-ascii?Q?U/0P0OfYOdb5K33Lx2fX6/gctQ3d2MQTtyKwDEl+2GqUv680Fl07RD3vHiMj?=
 =?us-ascii?Q?ejvb+nOePvDYxREqt+ThhpT8Thhv/PDA8lTvPdjO+EKqcv/s+vPI0w8p2uff?=
 =?us-ascii?Q?5170SUbdLDPdz09SlQJ8K1GEZmm3ei2VaTSHR4ZUY0rB5U9Pbc5vpl4/i+Nx?=
 =?us-ascii?Q?wnMfrywJgq65Rk6Mnhaa03yJ0t8n0L9KhxQyT9bc93ltBUpfJ8jLgeTKV9Oo?=
 =?us-ascii?Q?nhKgwGjezztJAMIPoHQQrmtnI73nsEwPqG98pqXlRBjPYkv7TW4FpN/TfpOR?=
 =?us-ascii?Q?SafaSztwOaG4P0pzp1llvp4l6qt2BvLt5DyYIvflbO1+XoWpBpzmxtgrKOxM?=
 =?us-ascii?Q?GxRl29d+XiisrKTab9sJXxUgla9dKcHE29OCyLfplnaKbe1chbQTNp0qpuMA?=
 =?us-ascii?Q?CsaanfrEKIN7nSGryoACn6ryD3shejM1efZ1yvtnY9Vkx29X3EhC+w083LUa?=
 =?us-ascii?Q?6XQ2AId2MP47rECD2UBqjrMUvzNvxDp7peMiiTvg+WsDYxYDiL5dGzdRX03w?=
 =?us-ascii?Q?05NugE4j1qF+J0KE6JNQSJL4Q986+Buyo3igL+w1rpfNLtvov10HL3r9Lxhm?=
 =?us-ascii?Q?9j9YfqeyfSvNiDz3jla0LIsRiqYG0C5SbN1+90TqxjPbY9Diwc5kS82/tgRD?=
 =?us-ascii?Q?N9CZ6fdzpIf5FPyy8yISdlSqEr4Km1zrgyBKgfWoEson1SznYyLLKafWvogA?=
 =?us-ascii?Q?2XQUUSHWXLtfkbl/M3eHOopSogh2/jZjlBTroUmhspX1mlLNssHDbaLD6bFg?=
 =?us-ascii?Q?sHzizagT7APzESB2iKUwsxsl/NLD9Fky13TIkxr4Y5fcpR5nImur?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c6cad-c4f3-43f7-ed26-08df071dd3b5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:59.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCMQHVPzo/sT91TUvIG5POt/06+JywqqFhIpiPAH6ZEx5kJxHIYP7KJP5YBvG+JUjK+VImP1qZc32OA/bz9pw6tZY6di4LNwQCpsNkoAFfQduZXt9Jm5zUjD8+b1BbrS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

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

