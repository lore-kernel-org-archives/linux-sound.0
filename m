Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B75185955
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533439; cv=fail; b=PFzLGCIl0amEp4tWvx/QAjd1wR9gWV4IDSDAsXH8eyq3rxySvPwnqotFbw1LzKbXJaL/IwY/oO9OnNGGFDniBrIhTSvXQf3txx/3vxglDSJFTIQ0zuVRh8tXyHEo1HxuqmXdlqAZxz38XkAsEAVuNYW6zxYeWgJQGghFYkF7gOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533439; c=relaxed/simple;
	bh=pdfPjhDCSEWJ59S+Rq2ZiflSXKTPXPmkvm3+U/aTOZ4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rxFl7LPKiMB8zWSN16JPgya2eM9PaIGfLE+1IPjt3dUOPjOTh9Y1sAsPuh+K+GIx8R9mmg9ZukTBjUioPSpJ5vjCvLcwUxJ5gQUo+mvu18thGii/PycrqWkIACsw37R4XMKZciDP/kSmd4eoN9AY4h/oC6T89zGqNpyQS6KuuEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Avq6IbeD; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Avq6IbeD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz4UUVQzDejbx8al84NifQCFuZ72lL0sd+f7qsqYDLQCZr/9o5PQjD83VJ9Lmb30zALVTKNEnvv+pFp+I567g0tflbKcCyuMairAAKLUhYgSf/fkHY8PvpSP581ywo4GCYsAxLuU96P9PeyV6Pl/G68fk7o/6pKGw5JGzgmoQ9Sh8lzKfMdUF1aoMsmRI5lxcnCcSaCt2jmkSyVuilSTT84U7Y73hmR1lavNfNXvX/+8SGSIFeyHywU1qPwDc0jUYQ5R4gT1ciTrQW1ea6IrYHN/BsGZ7+P1KGdpnEUR9u1ZU+UrtXGEeCUw6jVuJ3nlw0leIE34t2Et7hoxCKv5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgitZBSjmkFFkz/3ZVvPH9Nmg9XQjISusxK+95NwL30=;
 b=shrceYFirf/ZcrQ4NhQDAVmKOk0d7nYuoSelbfF5H+v7CMLcbFZr4f+CdcRjxS/EkhHeqoU8ypzClbHy3/KzeqMUlcJRugqL9eg0TL4IDrd4xeZR7S2V+IW8qLx3osfhYWzEpLznCHq3DritQRJfTewM6sVImRBOQZB1AMKYGZSHVSlfh0qYw6O24CwwVhncIsurqnK5IUEPm5w+MSaoDIKVep3ty9Z1RWB/yq+EMAtEZrAMU4rUUBzwHPpM8qlPmz/HKb/c9sRGy+Kk46mWk/KlwqG85SX9vlajdZjWif3F8g6ODbyZ6CHKy0i+LAA3/yexMTqZJi2k+gdeYPDKNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgitZBSjmkFFkz/3ZVvPH9Nmg9XQjISusxK+95NwL30=;
 b=Avq6IbeDRZIwZqlp2DlWgI/hIzUOui67DRMV6yrSmPgu8BxIDI1lLmGCmJYymKwszhwE02sInNOFyNpatwMbxL3zNL6uk1rk+ZJNn72cHsLEdB18CzHzCY3JtazmpD83RlMdz+5364NmZ3VMISukry4dnPCMv375Z+lBYRl6rQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:36 +0000
Message-ID: <871pvlh4qs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 010/157] ASoC: fsl: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:35 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba41d55-5821-4e66-743f-08dd56052b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G3uZ0fQywm533Hk3PM09okjAnsa6+TtgOtToyJPK0fZRlIwfwqs9rHjqdzK5?=
 =?us-ascii?Q?l2ibf4wRpWTTk3c2kDMh+LuWSF6rro5VwJgXj6oE2FN7eRzu7x6c1aSEUB5d?=
 =?us-ascii?Q?82Aou+lf/TiUldVjPPRrTtjtfoMmb8S5MBST/eufWzRyHEkJrZFvKc31pNJl?=
 =?us-ascii?Q?mXVBAxuFYheU+0VrNUQIK6zaT2SSJE/JmI0hWyKk7Xdri3/QlSHoagrGu05X?=
 =?us-ascii?Q?uXAkYRtPEG7HZ0Uz/URmil+ft7XMDpUD97KBCWzPWFYmJQMG2ebuoeCIdIRg?=
 =?us-ascii?Q?uVGs5JCgUFs78THk8KhvgE4++6QdHkVsYjTgxCwlnRjlZJuqTrO/zLZTTb71?=
 =?us-ascii?Q?c2FiMEnQtYWMmyHJbSBBKqBUsCZIQlajvDlg3xNAa9x9aEbjkPd/3XO8aoaP?=
 =?us-ascii?Q?hsrDiik2Y53h09WlvPs4KnQkYc5BMaVC2YUEThcj6XqnmAHNrxS6PIB6D1+v?=
 =?us-ascii?Q?kycT+QuMttsZaHVnDu+yj1/zOFJPCh/2S7ckikxaDtQcrdDwK87ssLWnvZBV?=
 =?us-ascii?Q?iwk5LyPEPRvRPsgGgyq+Vt96mBVSJvMQp8VzIo9LIxcNy24zPKUx7ueeq9nY?=
 =?us-ascii?Q?VEUJ3oTYR4cW6PfWSc8wn+ZD2bhLgCxS10yo5nw8Br+OZ1XglyZEs4YbHpEz?=
 =?us-ascii?Q?6Y9yaJE2KNmybyZQ9oUQ/1I3eXjyw8hFoSIJRM+HtVCP6nueBAInsPZzYfyl?=
 =?us-ascii?Q?imY4gjg9XtUyfAq7oYbveWTTdFmuoucQS+URwV2niyvUHOlYFFhYGVIMUK1T?=
 =?us-ascii?Q?MAZdqZsvF0KPGb6qwBENXMlAtKyYVOKoJhAFxHQY597/XKiXp6MZCP0JVZzf?=
 =?us-ascii?Q?eWZnEmA4Ov0FtPUxsNjd1hvyO7iQNovN7atsvi+QFpqbJIehPf1l4nqih5Mu?=
 =?us-ascii?Q?umLWQX8XMJ0TMNYq6Hd4dhmMpSQA+rpc6s9e6HJOr6wNb0+bBnXmXctHIEkM?=
 =?us-ascii?Q?/goOkPjh25oX55zMfVVHIeF554N87DJiF+VgG1Is8gBIl5Ip7GXDtLVs9hzt?=
 =?us-ascii?Q?fByCzhYAz+m9xdicKoX3HNWjMc3MuoCW7AfJst8wWgHZjIIU6V1GNKm9P71t?=
 =?us-ascii?Q?YpKOx7UlrR8mabVKf+Ay+TG2lquhqOVcFvnlYKpXtAWFocPeKjfChT9QH4Vt?=
 =?us-ascii?Q?Z0VR2K2gMdHddOra9q+uaIDY4T8VMRxbH4fQJvgEw8F0hHJB5h+q7ko5GQ6z?=
 =?us-ascii?Q?9Pbr8/7hStNw/O0Y4BPPLjSa4NeYr2vTIsli6lA3xBTs/b7Qt6xy+sWg0Lrf?=
 =?us-ascii?Q?R/ACJe8pFX3LOMh/eKj9uxxEMvaQvAD9TIjpDJbixIoDtRRd+kkdTQpXwQzJ?=
 =?us-ascii?Q?9SiIdD9HsoQLGcWfzdiPCKGckCa40dxgN1vs+wjb9TZmBKjASxYLhm3TFEJm?=
 =?us-ascii?Q?eZd/UuJt+cx7i0jkvIOtgvnlRPtlEAFhv7RsKA98mH72LFlwS5F2/5dGaTTY?=
 =?us-ascii?Q?tohwh+TIcMq24QVW7OI6uF8T3nzIr3BJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MhhFRyooWoqgQjOUDHUvt5A1+m44JBO2nrMv4VEvQ9Uzkxi3H1wU9/G4+cn1?=
 =?us-ascii?Q?6BiXsnZWvZ5j00FhvYk8f9LxMnvhhA9X8YoyOmAdJH/GVsNkeKoNFlZunL/r?=
 =?us-ascii?Q?NZDWI0GxOqnCO56eZJ836VGtWVZ/1obbTIKRSz1rL28aAxpfWMw5awmItb8m?=
 =?us-ascii?Q?0Pe73PNSSKpnaGZqbH8+uwLRmD9TPI+s5xo4Xr7yFscepJ22jkBbvFs+OiTO?=
 =?us-ascii?Q?qEU655KUoFZkYj/35zQYFBkmT7ULXFzfvGsGgm5gDqBEj1Vs9RfL8UeDxlUv?=
 =?us-ascii?Q?cLCatunDRMBcgXHAwzUO6bCLSK7u44ccB2xa09YXUtPaWNNDFWlOBLnfnGC9?=
 =?us-ascii?Q?jBg+PV6uGL8du0m4Goff8pfq56c3DZYXA99u+ipv6aBlk+zn3y+ozBGaxPpf?=
 =?us-ascii?Q?VrKvk/WHnEoMx5pEcIfbjQ4+/WrrI6Cy1HEj1ntjeKpruZpBnyyP90c4PIVQ?=
 =?us-ascii?Q?zqwQtN/qjekIYju4eVzbjyAWBTXbR+VlAlOJgzFU5jvcfhMqAFSqcgYlCNIB?=
 =?us-ascii?Q?egyxsnC/5oc4NoIdHcKwIASEPqrFni98PdCqubxN1a4yQGMWM0ShQz6dD4H0?=
 =?us-ascii?Q?CS8rAIRk6QO4F9PEwxDBhxFiIzxMPJPrroh4J2Tzm/f90O28+E8UK8GKGHP8?=
 =?us-ascii?Q?ow9bCP8YSMC9ZVwenAjDWakzvI1fMiooQI/ahTZ7IMsh8FP3N2/rQnwAuG3Q?=
 =?us-ascii?Q?KIQLYJBoN/1yRsP8Wb5blMirAzOp8KgJhLmC+PcpjE2N8HqorGO6g4FilMip?=
 =?us-ascii?Q?Kl9vL8xJyVeXzvXeLS5+YHH1N5nvHP45pKvb5xTsEKStwWV9SrbD8MQcWD+L?=
 =?us-ascii?Q?qeZGq4s8oVKGdgzrPsgmiPEuRrdEA/cSEVpQck5QEg7l+Z0vRX8AupIJ4hUi?=
 =?us-ascii?Q?18qBc6rGjoCOneAnNDKWIuTwkB5+p30upd/+0SKS0H0LneSjsNS6ht3cmfex?=
 =?us-ascii?Q?SKFqPBRwMOCT0/gU8sDRqaJTIbmky4jNlLK8LirwHZE/FvGPRabPOzWiznKa?=
 =?us-ascii?Q?q/OSMr364bG5Pip8ots6l9DMrA+/jbQp5GPrpsnttb6IMV2oPXw2dBtgK8Jv?=
 =?us-ascii?Q?YzX/6KTsoxOxbCHnT74Cec92CEbdIR5YHI6Y0H73t8N83KVlFrU5gN7VlPtL?=
 =?us-ascii?Q?YhofQkpmgRsABbpPhLt3jeeyvV4IutWI9zJ4Bna/gCNav9+wEWie4m4BD5wK?=
 =?us-ascii?Q?LOgjDd8Y39gM5b3+5wXYZX0CqgIa46E+5LNwzrj11zxGHd/uRwxI5RrdPEGp?=
 =?us-ascii?Q?QGOyVtV6go2GtJz+6+A+CZGn6mbWe50pyzQw1IoVSb3q2PIfCsoI6iMogx4y?=
 =?us-ascii?Q?CDRIIg8sPWQF84v2UJbSVBEpygdKrMa8xy4qYHTDf4ktzBO12NPG/aQmTEJ/?=
 =?us-ascii?Q?euEFpu6BMzbkp1mDPCbkqPil4JvKItmT2hMncxBROejtFjNquIfMZj1xCmuA?=
 =?us-ascii?Q?268vFTN7AmdbxCvVLGRjCBjAO8HwCOSvUmLjxAL7VE0sSEwI8Dbom82rx+Es?=
 =?us-ascii?Q?ZWB9rNzT6wLzAOUbaVMVV9N5GbN3BuAuco+CjxuumwO7eGY9xiQPK6woCoK0?=
 =?us-ascii?Q?2tx5SAaKXuGutmXpP06Et5alpqb6zj5EbyLchTRK3YSj+yO/tOVzyD/PF2L9?=
 =?us-ascii?Q?KafsevkcAjNHooRLs2AZW3Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba41d55-5821-4e66-743f-08dd56052b65
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:36.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9abBaZKH2V31cJ3M5D8QqtcPrYKNAsKatmIY9yHe7jILnxS93hhJZkkMUYxWAp968DKZOZMxjynsslOiznxm9r/Ifz6PFpwExA5PMsVOZgdy/i3MsUMVQXKk8YudR+cr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 2bad9cb1daaf..ab583b432c60 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -759,7 +759,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 		priv->dai_link[1].playback_only = 1;
 		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
@@ -818,7 +818,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->codec_priv[0].mclk_id = NAU8822_CLK_MCLK;
 		priv->codec_priv[0].fll_id = NAU8822_CLK_PLL;
 		priv->codec_priv[0].pll_id = NAU8822_CLK_PLL;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 		if (codec_dev[0])
 			priv->codec_priv[0].mclk = devm_clk_get(codec_dev[0], NULL);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8904")) {
-- 
2.43.0

