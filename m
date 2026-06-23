Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCC379C2F
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179646; cv=fail; b=EwKutHcYCEpc9BDmezoF3Z1uNQK1QkxuZTikVT5EXNpeDSDCEaJoO3ZwqEGqFrErlWC5+D8sUoQSH+zYtlApfobQo2BxsN6xr43tvJS7N3wzR/VjXK0SN2R4iqs3weEMzn4E63c1iCOO7XoxEltL62XXStDf/Z52VsTMlemMO10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179646; c=relaxed/simple;
	bh=VVDk5aMV59YJ0F/NavUxEcMD30laF5H1Eg0x2c1rPwE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UrASKMUR2cCOXb8SLQEpFSNl0MB7av4nYySGUAYM788oHLdT06pskWF0wGw/BWsaS786w4M/YoUg9y0VtaOpTJfewjs07/kaKPnamnqgIuxfQji1RNTcnYDosoPTqDjzfLN60HkWTKaQPxYmP4E4yD+C4NDpM59zdtOH9CMxhc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HWB2vscH; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HWB2vscH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpKS9TtZB6924hSjESPSG0HO780sIKfoRt3V4aV1/OLgnjbCJ7e4qRDfmKl/D3uQDa+exABXMA4a2qBqd1xqh9j+DQCBEhmsvPuIOxeXSSN3HGjoxoxecdTF9C1WyrQ5iRDavwZZMtAdBjyhEymFnT84Va2PHNO2maChX/oGi0plh1oLR78Hpk6WH4JjbpwNPVKU5tYJhFtt4py+HUD7tp7oi2rfcBitSRGgVxu+OpjpLdsNaVhSJNMtBNiTckyiiKtjHCGGMMqPx1vj88FUIZ9/7tkEy4yZFnS9rvSPJ1+whbZWNg/hsSsnJ2bNAwIkobQHf/J/NKm/Ga7RnVirFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=731Mv5HJurzljhUs0FtmwuNtLshde22nlhJJ6XerzZc=;
 b=kBtwk2xylYKaDnNKGMtC+5041DBMbS80otx66HBYWevi+nfBkVXJBgoK7Qej4ss+5hJLGk8+c5I32YpGipQv70PL7ik105rGXFP3t9rVjvnmTyJQzHXrXHZa60PsC901aUzz/nVAfhmnmpqFYN1t8fmIVygx3yjghcrkcJUOFFu7xhs3SKb/yOaqW2m5dUpoX8Cszz1gYc2Eh/Hi05hlk6I8bT52ohTwPJU3mI32R7lC28P0paHShCL1eD0nEx6jqqjDR2GTki9AYdAFSQCpzWGegbQ3qHVYQqjDOO1UVh3PFX2ykAmFk3gTToCthzIJm++jOxFuip03Pc399ca48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=731Mv5HJurzljhUs0FtmwuNtLshde22nlhJJ6XerzZc=;
 b=HWB2vscHfsujD7PMsW9C/eTnSRWv+TPwjoQWrXknpTc4Hn5uBbAM6mRj55BktqJfkHJGI4JihovoIYxo6F+4edbkxa6OaoqZvDksg3/rlCmRzqZqymOBLh7ikv1inKtFGM7AO/F8vf35j4lq//Ru9eQ5AceMwxzG1sZj0nG+TQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17101.jpnprd01.prod.outlook.com (2603:1096:604:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 01:54:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 01:54:02 +0000
Message-ID: <87jyrqhvid.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] ASoC: codecs: pcm*: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jun 2026 01:54:02 +0000
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17101:EE_
X-MS-Office365-Filtering-Correlation-Id: d5dc8ecd-b165-4c7e-eb38-08ded0ca4ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|22082099003|38350700014|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	lflIi0mEUxmAKfMSXGLF2Ot28XDzTs70H5m/cA8vYI9QThrQZ8EG8jHvuitLyctjxq7qeBmZnV0XMrW89aALRHbnGpmpdrqXRkjdYOSUTJY4ZVpKDM6oR0fnqPfZEfPDpBYw4MOSDJvJyf/Q8ahgnLsT3EJC9i09upk0lRUSL/BR+cuzvQFujwoqIMnQ0DE/fPb4mCRdAS9p2lHocf+S4POKVonvzXKUWjBel3uKcPpLofS0jxKEwolrgb6qswAk+asKuBNwAeLtktClr3NTKXgJea8R6nz4XW9/pNUnRXE+rSHlTzUwXOFJtRyw6yW+nil8P5t1YjL2poDmLmQTfPyPyA/MfaXsa56CIX1Z/ejyTuf9pWmGn6Ch0Z9i/20nt5PAq4VMxn3QkD1Lo/zFuswIvaMsf7UN1aG+s6oduET8gZKBmkvfJ84mdyJrnjyEMVlC2K99NkH4j3TMq3oRqFwTK0YnoArRzW//wEaxpVWWCi2j5Aa4gAMSk20y1U+fJZ0xE/SVJGHoxDY/YpG2gQ/pRt0B0SHkKCoXL+QyO9D2xHri7dU5ZspmgogRs3Z5HidHICd/eygbhvy1b9YETgpBUCLAIqXtKt/SOco69E0B9emcnoVSLyc1fj5CqPNvoRJr3fExZbpwjqOcFIQkxzEqYVKJsRxOoy2FYrYwUQOBX9QzCrtbA57Iny90tpsgeflwq4Drzz8b/eOCv6MKYdQu1ol5BiGq+6Lhq/pFQBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(22082099003)(38350700014)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZvG1cTRYNZvKOPUUUEI4RD+y2/1QhgYzI5/dxNKh4PIDweuXPa2J0gS3aGu?=
 =?us-ascii?Q?dKQLQWrn4byMxVsWsW51dJWhZ2xTn3OEL/z+qEs5X6DgKjr3txmgGaICsTyi?=
 =?us-ascii?Q?7hAqPYHf3zSs0zW/w8ptbEm7J4FsCPb9uqEizEiNM+3hks1YNWiMYWeuVwX/?=
 =?us-ascii?Q?vR5wGdS6hmhms7ciJS1GwSYJkmacU6xZ2o1WsXLpcl9ACEXGxvZhebyqFoQ0?=
 =?us-ascii?Q?vTw/EdDD5LrA7VyY1GJ2JZ+/vUuTw34n9n6RF2wuBRK/V9GCfecd7Zyc5tZq?=
 =?us-ascii?Q?3M4X/R7F4u8waWqkTh5/5+AKW2RRvv2cG+2gmNbELxfr9rHiSneIZ1Lq1xJ2?=
 =?us-ascii?Q?ybSEegiYpyvoj0y+JlVZJYQj8Q9YNGwVyrnEu3NZouXYc1nxSd/pnbYAHgTV?=
 =?us-ascii?Q?+noCEJF6DFvGuUp5TMhH0SxbGAGwbqTkNU0QsNo+wE92H8jYDj5yufrcGaW3?=
 =?us-ascii?Q?+sKGfRziD4Xp2dQOOH0fEFz3NxR1+9t+lo0CNlJvNLpHnqA8Q48A4jqbolBA?=
 =?us-ascii?Q?OlG8ptCvh46rcVeyCp8x5maeHpgQxnsxHeCBuWzJo08WD1w/ElwWRP7oSBU7?=
 =?us-ascii?Q?57vg+A4/iW/HN/jOUjCB042VKSz3ZBYWhXNIedfZpIBmE9XouYGW7vDg7U2M?=
 =?us-ascii?Q?CfXhraASDfl/nvJHslKj+5uqoNY02y3ants/+wIFGxtK67D4cZOEK+OGQFDL?=
 =?us-ascii?Q?t2tq3LQVg8K8rXEscuNBzN5xLqN3yXWOcMvMcwgoIacBBf9C23rJDo5rHddN?=
 =?us-ascii?Q?UVfmy85Cw5rE3yrDZ06s1py0nPwXsLyv5LLrW+PV5ykth9G+2QIkXDDRGCML?=
 =?us-ascii?Q?4RkudyzLCTQzdAAFtqvM096RrbaBBrWs3SHRaKtIhEuQxe0EloXBeRcpREZ4?=
 =?us-ascii?Q?E0jHT/39FIPOkJHkdCrrdMg7I9IqmkP8R7JWO1ytjM83EFnjl2DvqU02CbYN?=
 =?us-ascii?Q?gdxsh8OWlBNcWcqpYnJaMaxxfYshSyO2YgsYq63tMZ3Vsfc8I/DC9zXxyhBw?=
 =?us-ascii?Q?Os7sS+v6SLOO1poJ6f/gIKOUT9siZIjiDyyQKtRen0aQq2G0sfmFJkyYkOEM?=
 =?us-ascii?Q?m1iFlog4qx97W9EDaSJhSLNS9Q0HhYfM9U4cntrgWgx7AAQWFQaURWqD3345?=
 =?us-ascii?Q?sKvB+dxFT11HiQ2ZCYtz06FXn/sIVb113CBdoeJJJfFDVyWFSpcb0rRwp4Ng?=
 =?us-ascii?Q?ij9E7FxsBcCKL/qNLmkhK8MCrg98Xedc8iJdteUfd3zWBnfsYw6BePWL4mgX?=
 =?us-ascii?Q?NBr0lBFg4iDyqLvtHTei1S9yQMbkXWHNFi/6iuJNynEfv5tSo8uV0rUDWqic?=
 =?us-ascii?Q?QWftHUEyJ37kieMGQpZllgVhPLRVA/RuPIrvFrBUcXjAOySO+5fmLQBdjpCZ?=
 =?us-ascii?Q?oyp74zPlqXdwcFFg0gYwmOvmUMWwOSsA0Cl5nWoYV2shRbbT/hjCPExyo1ja?=
 =?us-ascii?Q?sBzwz43qxNwe4KPeetrkTVxWP3KHfm4UUfD1Z0rfO2efaxLHHcWjiIGL5XLj?=
 =?us-ascii?Q?p3yyBuuEC8uLVzdR8FFWslzyc9kVVx6+iCsYE3eTOLPigZpKnQ+ViiLCw6g2?=
 =?us-ascii?Q?lClL+s588CDMxgnAzO7NMjJ392tcDV4LnwEh1SG0O9iS8S8x/CvLhy9iNFQW?=
 =?us-ascii?Q?+I7kcKOSKEpNrYhqF9r/1Z2WYUKQz/iT8TXLCGwMnc8XLJNR+tJqxhhv8NWt?=
 =?us-ascii?Q?kcOscPDpkck7zRTXoMdIXNcioEcIif/1vVWlvRoN9yMKbP4CAWL75Z4VoEG8?=
 =?us-ascii?Q?h9SJqex3HfHD+HNdq7IvFENOqPnlh00XtjPmNxnduy8Pc+B64wMH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dc8ecd-b165-4c7e-eb38-08ded0ca4ce9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 01:54:02.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L1bOxJNCCcnvIT3BRGjvJar7DRpiGjH6dgfikL8UgiIPCrnBGXbB2UuTO/Yb764qkfb2lg/HfnVlbUI38oENx7bBoDm2/WhyrQGahYtSlO+jTwat1rUvVIDMaK6jtmV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17101

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Kirill Marinushkin <k.marinushkin@gmail.com>
---
 sound/soc/codecs/pcm1681.c | 7 +++++++
 sound/soc/codecs/pcm1754.c | 6 ++++++
 sound/soc/codecs/pcm1789.c | 7 +++++++
 sound/soc/codecs/pcm179x.c | 6 ++++++
 sound/soc/codecs/pcm186x.c | 9 +++++++++
 sound/soc/codecs/pcm3060.c | 8 ++++++++
 sound/soc/codecs/pcm512x.c | 9 +++++++++
 7 files changed, 52 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index cb923cecb47fc..60fdbe5c4e054 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -199,10 +199,17 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	return pcm1681_set_deemph(component);
 }
 
+static const u64 pcm1681_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,
 	.hw_params	= pcm1681_hw_params,
 	.mute_stream	= pcm1681_mute,
+	.auto_selectable_formats	= &pcm1681_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
index b68a528000be8..bb15da1c24aa2 100644
--- a/sound/soc/codecs/pcm1754.c
+++ b/sound/soc/codecs/pcm1754.c
@@ -78,10 +78,16 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 pcm1754_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm1754_dai_ops = {
 	.set_fmt = pcm1754_set_dai_fmt,
 	.hw_params = pcm1754_hw_params,
 	.mute_stream = pcm1754_mute_stream,
+	.auto_selectable_formats = &pcm1754_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_driver pcm1754_dai = {
diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
index 3ab381e9a8566..f06e353743aaa 100644
--- a/sound/soc/codecs/pcm1789.c
+++ b/sound/soc/codecs/pcm1789.c
@@ -164,11 +164,18 @@ static int pcm1789_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
+static const u64 pcm1789_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1789_dai_ops = {
 	.set_fmt	= pcm1789_set_dai_fmt,
 	.hw_params	= pcm1789_hw_params,
 	.mute_stream	= pcm1789_mute,
 	.trigger	= pcm1789_trigger,
+	.auto_selectable_formats	= &pcm1789_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index f52ff66b6e644..cb70927872aa0 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -142,10 +142,16 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm179x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {
 	.set_fmt	= pcm179x_set_dai_fmt,
 	.hw_params	= pcm179x_hw_params,
 	.mute_stream	= pcm179x_mute,
+	.auto_selectable_formats	= &pcm179x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 0d1103fe4e04d..461ec74e87521 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -473,11 +473,20 @@ static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static const u64 pcm186x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops pcm186x_dai_ops = {
 	.set_sysclk = pcm186x_set_dai_sysclk,
 	.set_tdm_slot = pcm186x_set_tdm_slot,
 	.set_fmt = pcm186x_set_fmt,
 	.hw_params = pcm186x_hw_params,
+	.auto_selectable_formats = &pcm186x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver pcm1863_dai = {
diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 8974200652e7e..f01c46583e897 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -164,10 +164,18 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm3060_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops pcm3060_dai_ops = {
 	.set_sysclk = pcm3060_set_sysclk,
 	.set_fmt = pcm3060_set_fmt,
 	.hw_params = pcm3060_hw_params,
+	.auto_selectable_formats = &pcm3060_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define PCM3060_DAI_RATES_ADC	(SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f19..12163ca7899a7 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1505,12 +1505,21 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return ret;
 }
 
+static const u64 pcm512x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops pcm512x_dai_ops = {
 	.startup = pcm512x_dai_startup,
 	.hw_params = pcm512x_hw_params,
 	.set_fmt = pcm512x_set_fmt,
 	.mute_stream = pcm512x_mute,
 	.set_bclk_ratio = pcm512x_set_bclk_ratio,
+	.auto_selectable_formats = &pcm512x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

