Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70238238C
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804219; cv=fail; b=T5kftgKCv2i/PU3cbCZlWgTeYIBOpOzzEksNnK7LCkmZz3IBgYdwA0g5Imjg7RjvN4H4AF2vwN/KZVdU6oS0niEVmqzz9B6fOzMYoe14fnW7vWGIMdszc9f0DJ9hhK0M3DqcO6aw6TUBQKUKgk7gLpXw5eOQ2pDrhZlDeQwoTpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804219; c=relaxed/simple;
	bh=F3weATu/KJU0PlEYuh9qbqjvoZHyY8XLg1b9JHYe3Vw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DiM+2wl5BDnXT7OlxWgHNs87Bo9F/g+C2v3YwEzuVyAS9ZDgoWYt9EbtDD1Vauugud6TnM5FODDu7l3Cf/JoRRtbmbXHGsa2T7kb/8EakkDlphwM3OTE9qkus363xUemjjIj9F0/iCh96OiQjHXCNJ8tJyYRgeM5MmoMEQMHRhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CMYjfzNH; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CMYjfzNH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byVq0vDSPN8KDsZ6ex5E5jpzmHmiMwRC9st4wNp3gj3+21N43XVVPz+knAPXPEp9Xz6M99hMIyOFPxlCnxtiDPBlec73X85gkBlz5CC4Owmnm5sX/HaL1n8pf2SbuVxPF97W8Z7wa1doaTXPGJ8vSu2bKQGuo0h97lwoEOCnPiAdnmGAerDIcV6f9H5wEtpkwdwAzQRkQjTpXq19fetBpQ3mLZDRmVVlc4X1A8foyfFbQYb/scPQ5eR8VASeMdHn6q9IXFg6UKH7ezR0kBSJZoRTnmSHndkv9YKUvo16WlQ2/EIBpLeRIgcg7iT6QWi3G6oepu25OJg44jSjvpSrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=BTk3HL1szq80BD+HmucsYh0uEM7LTsil5w4jmCi2YWON2JVDB+tRqfn1gl+teVMiF1Zz7PFvTv6+y2hn7tE+vQU6zx4uMjdpQhmqZbJx+1gnUO6oa1GVajWej+A/14B8TLPaDE1nII84OJ7S8w3HFaTkMNXN27uX1VXBY13dadNg6NsvnLVJT93B17xAa20yR1VW44xPYvyY4GDbf2xS4ADNkMft2NKJNeEzvnzlSktoN81gwW94exs9WuQ4OfYOhd1lp84nho+TBar3ywoeiSjSZzKLvAX4dNwvc8Xco6Ozy8kbZTJlm/NoDIOpRXMf6SC2wh+FsXzXm6/21794Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=CMYjfzNH3qE4w40FCOlUZqPhqQ73nW53zDl39zDTl0dFL8YlZiGIFpAcMUKGfzJTjb0eKXWCyaBnt9avGAJWMhRRrs99IbEHfqdzgEI8Dta1WUSHJ6mk9YywOokmMJ4KZctwHWWpka/q9i27o+fr3nfnvOaqgEeFAv2z/WHYnLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:36 +0000
Message-ID: <87wlu6vhoo.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 36/44] ASoC: codecs: sta*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:36 +0000
X-ClientProxiedBy: TYCP286CA0233.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f0aecb-9738-4926-7092-08def1c16b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5gWuUbEV5qKffBEjhyURChAacQ+6d5UqnKtFq7WJ/xsuX/UujNMoPMZivoQ2dY3UeCS+Flv/mfapkuCLkOlt7Xf8PPyXGN/zbcHn1nR4svgY89HXjx3dMAjQ+rc05QG90q2PKkPsP7AQJpexQoDDm/kMdiQKSmJ67UV6ziP5UozUHsC63R4nwP4jqBTYCwtmgD35LZVEmtAPt4J3uwqx2B5yHA2CSt4J3m0FkimBwEnN4fmdyDGwQHVr1tLhxfqsuo0J+g9pAf0rFObgd12OKwPFyNugz47Y+nN25x5rcJJwWLhST6GdclyuIUD2Rh5XbKPbABNCd/aVZfD2kJMp3CuhFBJl3K6OXtYkWSPwu7c3nUMJ7LZs3OnLDepGF64hvVpwItC/HOMZhYdIuYPnI3v/DrWQw1WzUiXSSm1NIh+MjDjBN/U9vF4lCaAt1sfVN9TRZ4tLEiK1OZDpDT/OM4CTwOqlLceiI57CYnV4Ubx4h/200QEiehiEp6GIJP7X4d2V0F7fB3THgMTcrvlqNYZJSN/te3DaK5wMeZAN2FDwQRiMPZgQyHeGzvzlbNzFWfaZqQCxKYgjew+dokwTrJRlpUIdqdxO2ClzLVBa1WCR4gdgcghliJRZBfG2I7sA2Ca81IKaBYDIHESreAshiHgCuOfOnqC0ZNE8AMbwPby/PGS43Cs4Io/azqUJ1bUUofDEqsJbdMgs3M0h1spYFGLM6c3wqpyV5cWmAeGXAAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q7C+rTGlR1QAZFyCI4mW0vsAXe7g6pMimyTXE7e6ViRB/YgxVA53Fx5uXpSI?=
 =?us-ascii?Q?mLQTjG2nVX0Ly0dQcOZHkZ7KY2D/7MLMlIk9CMYqJNRBDxsnN4XnJKTPjNRL?=
 =?us-ascii?Q?g4o30oTrrj1fabd160F90LqRoGiaE6K4BSTkA+Qq3ODzl4FfifbS0S/a42bi?=
 =?us-ascii?Q?0kAeWXCjgqHOrCxmp5kijSxufLHX0kAZw0c1mSjnh3g1vfrWX5CnW92m13tx?=
 =?us-ascii?Q?f4Whck8AiOnc/GY2bPeg2g31Len4xjDJsIHNor3neidCMxiwT9GQf1ggXbDq?=
 =?us-ascii?Q?aYOB3VrCiltNrm1X13amSQ3TlAgJg1vYfenXrRGeWvfMX0uZp5oAIoN/GzCf?=
 =?us-ascii?Q?ipILKW+esR/paCR/Hb6mLERnPxmGGvSidi7PNjuIujl5IrlY/GQ/SIYdTzJP?=
 =?us-ascii?Q?AKTrRgBIVEVRJZLs/zalU6F71HSn3AzTgscZyPe/hfRnusT9NauBjRp32pWS?=
 =?us-ascii?Q?6kIUgVdERHqhWuyRb/5oZOH1M51XsTzGgVeBit7HiHjSgix2m7QO5oNUO70d?=
 =?us-ascii?Q?ATfqHwHmaGiQZQEOd/5OCobd4FmKCISoZalWL7y1YIM/vpvixGDGgzeu3QQo?=
 =?us-ascii?Q?xrf9uagURwF5HGJQcncQFB83HkNHhKlMRHCTgIPMPtMvJ8XwmHgz4FVhly6A?=
 =?us-ascii?Q?FthYYJUKbUdI3v6wtC48WOnSraEPduLdFHHAv0UKUSWMvbdulgQYXWzP5Co3?=
 =?us-ascii?Q?bowCZ/FVB5eGQ9Z7zcWI9kAl6Cidl5j4CiMQLVZ7PEjhogDEpiHoJ13x3Zw9?=
 =?us-ascii?Q?sBtAEVHIiznGVqHR7m52lTd8Rsr3tA+9cbhCHffQ/peD2EyEawQn4xPjBS+W?=
 =?us-ascii?Q?z9bjfq6ISvOg9V6d66H2UsT3nOA7Wnsnhst18q0s/jZsgepM5u3ITmX32IHc?=
 =?us-ascii?Q?zVvWG61MYTnxOLtHM7AOJq4VQJrA/hNU6KM7l6/njY74cUSuCGXoi6SakiFg?=
 =?us-ascii?Q?7xVZqK/+bDnlW79dpGA2Uh21LLyQobt327f/XhlisS/JNNyE/QJMUzOl9wky?=
 =?us-ascii?Q?uvIt5Ecc3tHJIqDyi9f1S0emSB7XwcwMnLmUNBQSlvilvpQBMETQWYr6TvXv?=
 =?us-ascii?Q?bcGzziVhi9wPm/KCy1VVnGoEMOAHCF8KGUw4PSs0gSXlPRybLOahOoAW4MWi?=
 =?us-ascii?Q?tX6/XIff8SiILG3wClA6+DWDqowHFGmcmsajTwDQC0llDbpdNFV2UFbbZta3?=
 =?us-ascii?Q?mAMEVR6Dn05rn8QOMVMlTRwllCXNBOuot7aO8wltPpbOifv/L8qwQEA+vWmA?=
 =?us-ascii?Q?fTeoumdKnn6xTDD2ppfjuAZqEfeTHScClmeLhkadU0ApwyZSSXOvZCRnJWuK?=
 =?us-ascii?Q?mboKNUkF/RLMqVP1h8jaEWZaCphhWJ6p/oo8lQLqlhUc+Er+JUL/afl81hoR?=
 =?us-ascii?Q?8Es04Uv2Hu52LVODhmQae9gmm1yFm1kF9H7fE1DZfhSrIJu4g6uPjTou1+ov?=
 =?us-ascii?Q?aNAudaIO+Np04+URU/SU4Rgh9Kx8BMuX8HJI/RO4PxopxuxbcuhBqfNwQ5tD?=
 =?us-ascii?Q?NX0mxDEIRxWxeeAyu6IKGhLEAEcHoPZfHdlgPfRwe3c0krGC5ZXU8CDMM5yT?=
 =?us-ascii?Q?YkIVi0QN8wynPe6zSWDFbnXFHwJcbaHODz0s9aXu0TeiYbgVHvKi+MqBapDc?=
 =?us-ascii?Q?p5eXfGCvQR4AqTAvnd0aDz6mv4SbCbC14BNpvDs8VDm4hfDZV/Z9dWSt85Cv?=
 =?us-ascii?Q?kge8RVpUgiFvIUcmoI0QCi68arhcozhD5wMx+VbQiR3tqs/cBaDxW2iMxqXK?=
 =?us-ascii?Q?AwowUncQ2W2GsM8EGjv2P1gvgqg+41s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f0aecb-9738-4926-7092-08def1c16b16
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:36.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mnM1XhcVmuJMlLPf+8NcamWXNfafx/0hLlUlSmUT+AchrdlNVb8Zjqg0ERmgN2tlffTVDzMJPPH1pQf8VMkF/ASQjO1kgzUD5cLu9s7gI7mWy4WgVtx3PIxEjNroxdo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sta32x.c | 9 +++++++++
 sound/soc/codecs/sta350.c | 9 +++++++++
 sound/soc/codecs/sta529.c | 7 +++++++
 3 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index d6de739212f92..9a9a68c722cd9 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -848,10 +848,19 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta32x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta32x_dai_ops = {
 	.hw_params	= sta32x_hw_params,
 	.set_sysclk	= sta32x_set_dai_sysclk,
 	.set_fmt	= sta32x_set_dai_fmt,
+	.auto_selectable_formats	= &sta32x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta32x_dai = {
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 2ba35076732b0..d6d29d291081f 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -882,10 +882,19 @@ static int sta350_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta350_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta350_dai_ops = {
 	.hw_params	= sta350_hw_params,
 	.set_sysclk	= sta350_set_dai_sysclk,
 	.set_fmt	= sta350_set_dai_fmt,
+	.auto_selectable_formats	= &sta350_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta350_dai = {
diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 7d57999f9cb13..0faf439ffee9b 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -286,10 +286,17 @@ static int sta529_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
 	return 0;
 }
 
+static const u64 sta529_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops sta529_dai_ops = {
 	.hw_params	=	sta529_hw_params,
 	.set_fmt	=	sta529_set_dai_fmt,
 	.mute_stream	=	sta529_mute,
+	.auto_selectable_formats	= &sta529_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

