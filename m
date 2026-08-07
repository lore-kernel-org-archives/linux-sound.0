Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75828248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064179; cv=fail; b=CmkoQWZmT7WOjSzYW6DJxyicHNJs3CZVXcL5UDd35akE2UhmqduP0E9Ivcp6bAFItlTaBstR8OoxwBYWCYclb/Qp4aqV0+Q7z5kDjxMZUAfSjKasWz6p9xImHzBxQBAEXKkT2icSBRdyE79eLEbpGRNsvflrnDaBPP9J3aYUHe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064179; c=relaxed/simple;
	bh=1YdKWJxWExjNYuTAzjUYEsQfW+IDB3gAK1nd0xr156k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l2bGisqhy6+em8/M9sH/NZiN8bMlBUfm2U6f1+j7X1X8GWZwZXyFVYXIWZcdrVTPSVlPX+MeQmVdMUY1mk8/iBhwhYnXYJAlzSeyLwujF0z+E3X8YV0y1vv1qfr54Co+J6OaMgsokDBcHVs2nECVIRu2j+g2ZtzQ4+EdpwxIw3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XqjqhvOd; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XqjqhvOd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nzd/oVjdD6NPAvaCNgXcvePvKGIqa9/nw/Ttq24wF6uh31qw1Gf82740VOBF0Puj1tQh18zv7by3R52SljrazV8R93vAqa3fJBeJbvX4XuZANkxharIQ3fHB16Gzgs9CgxcaMShqBMFgGcEif4WVtkLjCi3XbSjyHvcqAhh5If541cSt0/gFldTQzWu0ox16AkLphZLsl8gsS2YfOAtljSvIFULqqIpoyvwrBPz4hanbOHtoBwWjYhp7JDBgD42TAq7FbDf2AqnxXfL+a3sWXOxF/wV2xfw//CRHgyumV9EHo2T40/6wz7LGCykW3pkSUesMSvhfXI+puZwUZ2U/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7DwjHHLzTy+LGfEXkAi+Ew3iSJgUVYq5KPUN17cczU=;
 b=sunmBK+IfneYJcIiQ647CDJX2Oe4InGA4YHx7Gnj4DLT44auvGfUo5LPzrKKoQuEETdSvgXuDrV4dCfFdgrghgzDdDRH4LcdYtUJR35PfFJwMBqkUnJkyB+ZszQa46gXvilAal0z/0rtOpWzeFKvSwPyYdYM2Vi+A0WixNXjOnSUHPV7JlAgcuC/0Xhvops/M4BTw4UywVUWUPWLiyW9ctvUwqP+18wEgV0LukEpPzTpr7QSCJ+B3exR4/sxl8/8wByL5EOOsyjbPl/kPcN5+S1Ei5nqkmtgqee7LuZb40Rco1TT/e2vW3J1vvExi5+OS/44Wrl5002rI4IfuEP7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7DwjHHLzTy+LGfEXkAi+Ew3iSJgUVYq5KPUN17cczU=;
 b=XqjqhvOdbHC33fDQmFMiEuOQ/Tgu9soj+eWA/H8pzyJ+ud9uyrC0Fx+Zbfr0bkp+0sJGN5eh34YLgDOr0YyQOhdWBmDtKijzsVaGsL0SqcbDP2AVKiQzodw3NCVEy5K4fpEibygwIDZPFOuRood+O8pIqb42aJi937EozTS8feg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:16 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:16 +0000
Message-ID: <87y0eisq8g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 31/44] ASoC: codecs: sgtl5000: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:15 +0000
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9d6231-3207-4737-9855-08def41eaf45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DICPsowhgJOgetSBXrfOnBdPFpXCaZqoeoqaUhberuVqMlPVTa42guHWc0xRqIE94PYXPudpP0zlbYOUeuz/5YQvhh7Mjhfap9YdTOoybp7iOh3jmJNUYXSlRkbhgKcfAWJOdjqWoccFPSuU4hAsBUO3SX1010kB+7U31IDOxhjttypc9Yh4I2uoL7bTilHb4qdeG3RQh7LjYi4+3RxK9Ei8DgEYywROc445ahNFM6L4vjRWhEIUtslKb8LxWwBjY2Plyqni+5YRFWk2SHk0KXALcWIq2+lVFH2DDnKbEPFvqRbQa5WIMgC7JPuF+/i1iEJlYb48oPTaEdEyquCR15v1o/It3Wfb/Fe5NFxYXGKq2US7c5jv/Ie5+17GCGQ0fpaj2CxhEhfl2jmJIWH2zDg/b7X4qYQrGJcI480fNE2EETMZHEtZRoQuImw+rUM+c6gA9TuCM7qonTz5Ufcl68cEPDsG8m6YOAvv72w3x01E41JTfxvjpkkeZNb4E5irBaMObzeZKDsoWBuhduSOHfTpT+HnqNJC7yZEkDV2muHnljrRK3H+VEJEc6D0Zmidy5jbXRQH+GSEviqB0FrXr+RIoxhFLoXTtTl/O+4Z9EF25FUXUWsFGIhxF7IfNzx+ZuVEw8xMXcBW/7MkhbXiuX2rq6JlFsvnFT/3mlLszPnFnv8UrzQd1MqAMogX1mdS8eM6fZv24IaOnoYQKM5yAICc+4tEpJ6nea9I7Ie/h9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZUWBrwelCc9wioYcgI/+jcQidVFZ0g4nmFUjWi6/sQuaCeOfGOkTvV/6HhwB?=
 =?us-ascii?Q?MlSsrrhHg+rpOqqd6LCZbS0iMN6EqdoF/iOz/3lFPlqh2hac1Zq1DRQcLZgI?=
 =?us-ascii?Q?kUqZpQ7Y7WKe+p4EjyM+aJVrMXr40qNFtzHO9bP8qhJcZQCVjjoFTZ94SmUF?=
 =?us-ascii?Q?cWXGXwTTG+hCxwRlaVpHOmTdwZ/zxTal5J7mGMP3uKsA3IaSDu3be+O8ZTRo?=
 =?us-ascii?Q?dKp8liqPRo5n16yFiIfjk5rfJZ2uIWs8CTKvc7jnufOky1dwBNxHGwNck0NN?=
 =?us-ascii?Q?/itE6qwE968cwkxWTSgGvdJIoKgzA+65l+dz5LamwYVsQMizbmruskeZEXJK?=
 =?us-ascii?Q?+nuCz7twPqQUxdLhidPrFocmVPD31VJcGyVSvZcOpN1W1gqNfJCBzEhujXuu?=
 =?us-ascii?Q?2IqhAUhq8+T/5Vyj86rUoOaxrKMwBt3EfwySkzwQZ4Qv8Km7xmd8NcQ8tBd1?=
 =?us-ascii?Q?vZaegDGfpxxxrAh2BDodH5/gYg6jlwrplCBwAOKqIJhqEGSZAMcPZ42oDm8E?=
 =?us-ascii?Q?bIXCIsQswrll9J/l2vOaFcLUWgvlivCwfbQovmVnSqD4uRpfBICW0Ubqupn6?=
 =?us-ascii?Q?kAJUswBV6ZmXFsc8tIKQhv76Qf2ouwqmvkmDZdGUanJelGkQcL1q+VWAf02z?=
 =?us-ascii?Q?ta8CDmG+9XIwaFZI2QekrizFk1DiZ83fApsArVFinvsza13HkKYF5LdRGdFK?=
 =?us-ascii?Q?nB6ewt23WumNTS7KLcLVv7hPp/pnxBcpRLdGfum8ndz5BHju+pyvdj7/kpqW?=
 =?us-ascii?Q?aPnKBBnf0PvoeejUvynKEt18gHKOIcYJQeqh9y2n1iZFPxwYTe+snoFe+Lud?=
 =?us-ascii?Q?SpuaE4m3D3LK7mWbocKK7Kv9G9DCDYUy2jaCEVBKoFfpY3MjpY/OPtO8cZyW?=
 =?us-ascii?Q?kr/mV6c+YdZZW62dtH0UgUwifjgythVneXuKrVr469qlXET5WIQNsfiYmnow?=
 =?us-ascii?Q?mC3FoDuG4T+wjTjzl7NKduIshqqXA0THZG6Vxl/STt9gSTp1D7cMFP/AeKTO?=
 =?us-ascii?Q?gB9v8TlMpuXsquKmZfxqc/bpKd5+Ko1vvLewNEqx5rxjfFUw6UjQYzkMbd/B?=
 =?us-ascii?Q?uWqXSd8p7G3zEZh7bSCtutjBGwh3Xhm75fT1R5hhFmspym9LLh6LKI1n34aV?=
 =?us-ascii?Q?rqoI0EVGi7/l3hmH3+eg3WrkHwa8lO/lqxsiFllKogv2Iw6io/Nol+Z4zLPt?=
 =?us-ascii?Q?vjQHvFrSxFYXzd1m0b8Llprb/3P/q3wd2eZzebSLFiOqtYOruWiT2vQQuppV?=
 =?us-ascii?Q?q2BCgFdG5GlPHiTdFtKo67ehIiSx9L7Rz7s3vGZkNotRVLow8C5hx9baSz9c?=
 =?us-ascii?Q?bQNyqJib768cVDTovzRsQydBLUF0CuCLl16JLqxhUWi5/9O3/33gw3Fw5XxU?=
 =?us-ascii?Q?0UaqjyotQfR05bpe0jqGlUnTN1rhLJVpapf2o88lO5Bn9uiAVEJXdwQ79JZQ?=
 =?us-ascii?Q?ixaRY4EWMamjjYtBn5uZAf6+vH/GdFB0/ocdHbrVJ/AcCbXfblmVZdTOuTQt?=
 =?us-ascii?Q?xlGpsy9HHoGFNOlARU5pJezzDhzvlMdPwPJTU7ZwhbQlN+zqdlb9mlY/yEcF?=
 =?us-ascii?Q?o7bz5cgPaS+XgxZMiICz/AQLsUXmwJ3iHudFkOiuh2BIFqnobDOrj0BqJeh8?=
 =?us-ascii?Q?pv9zjOE9LLxTGXppGS/69pBCL2peRVcCeQN7oLrItswE9OED+nfOKIbkEhpa?=
 =?us-ascii?Q?2g/nZFTIR0TH8i/vg8oT02UIj7RyUczun3LVldsRETEd/tgJ/m1+/ntkjtL1?=
 =?us-ascii?Q?oZX/Iscx+Q72ChjYt8MszNlPkFtjjWo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9d6231-3207-4737-9855-08def41eaf45
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:16.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMcrhiyuq8e1a3X5y2riIgJCU+kclnMh2ieF4TAoC2tu+lq1v3DZaPikJ11elpLeaeebIiZfRZ8A1zhzTCyXKrQblhCzXWfzTiFwl343akk99MvH8DRrOoIV5l7kLuXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 59642673b4cbe..70ebbac34e061 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1158,12 +1158,23 @@ static int sgtl5000_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 sgtl5000_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops sgtl5000_ops = {
 	.hw_params = sgtl5000_pcm_hw_params,
 	.mute_stream = sgtl5000_mute_stream,
 	.set_fmt = sgtl5000_set_dai_fmt,
 	.set_sysclk = sgtl5000_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &sgtl5000_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sgtl5000_dai = {
-- 
2.53.0

