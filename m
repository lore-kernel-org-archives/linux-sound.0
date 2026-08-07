Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315525B08D
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064228; cv=fail; b=UYSfhsQ5X0lHVqov/qDnwLeNztmS+NgNqQkd4axNkSvewUIVseDd0eKK6yoBEGgMFu5z9m/xY6KFXwT8XShMF/j8weCImpxIWYJy6mBUaS4IzT7lTpnh8jOFBenAb2i7OlOqe5kXWPj2Q46UOhVzeUER3hDKg/44jGWHQvdeMVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064228; c=relaxed/simple;
	bh=n0azm7X/WQeVhhAG/5HPkuaS0F8FZtad47pIWnSUXCg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jq+oQ/9MZnBh8/n8CX9jlRZAVcDj6/thl/as79IZ0BKvAXZ4ZZr1mC+AHlkeh9bi8ewp+cfwH7LICusWSzCb8IymU8jr8NsZbXgy//1j3yFqSUDbnLg7EbQlNXHb+8yM4QSd0bOHznpjMZnVWox5ms66VpXeiXKWYXznSXogesA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KGMnyLVb; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KGMnyLVb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnmLoFO3hLAIpcWsP467j7RStIKGKlf7xLw0VGNMIdaN6WCaqxDBgI+pIhjHh42nf+BDsexBW31IcpvC9+tH8EyqQs76LPHHnxW2W1tJHsOvj82VBKr98qwC51Sb0A7c/ps3z/SlLHlpBOtoE+Jq6YsriWRDupW2T3Yb38hMrJj9V51VaB+OFi6KeV06j6JTfbeo5QvkiQFoA6bMGB+u09jJkn2pvoq1XXZfKGG09mi+AQAZ7iBzu1qA3QYuekaNtpwd8xSFN9iVKPCgcTgUDOjsSu3f48Ps8H6vyXzl/vNvZO0CMynM++pOjyIF1Ycsamv32LkztxFzUYu2TmPUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=ucbVkgSK9i753btvxZhMz/baan7Oh6wleFIwf/lwq8AxGVGIoV73nA0fAm8jQAkhsTfVHuR26+X4zix14kYX+ScFKYcO0OQZX6gGZTajGVdrkcFkmIhoyudK3syAfggGdR9CIyU1hKCLBvGM2rFv0Ba7Fo4RAw437X151MMhM9IK7tnAVvkFcE8m9CQ+cmxo7vzOdbTtwtecbhABSwpV+FeENcEQHCaRb+H5D//swq/6yrs9glPhLT9ZuJ3tyqhnSzJoNY2qEZyWPMTw1aT8377aUt1sVW5pa+7PrbKSewx9Vz/mhBTtuEH0E2bq2j39mpvMXzUFyYBZjKY+SJgN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=KGMnyLVbjmjfSIwEL5o1ncjEizhivuSvK6OqyrQwR75WT/1uOX28g2tSpQzNYUzWGURg50bQCmCXH/noK7OHcrNpB8i3IkHFGLtZi9aT9iGnDlOjFZ0kU5/RqQWocUBUMh2ZsnJXnOO3M95aYS0rJxgOXxrtGTZz6CYz/VerCUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:57:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:57:05 +0000
Message-ID: <87jyq2sq73.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 41/44] ASoC: codecs: twl4030: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:57:05 +0000
X-ClientProxiedBy: TYCP286CA0306.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 0360dbb4-5954-4d15-902c-08def41ecc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GTobvJQAFcFQDFVLT93SMsT2koAl5awPTZB5PtcBacshQzZbFuR5vjh3EB0y3p3OAiFCXYu0EQwoYk99Qo+Md2f+0VyhcaFQM4FES9IYiHV2VtpOJ3PDWuOfJTaZvvPFmjo9ddElvJr4aOmmzuvQqQTt25OijwAYjPEE8mHO2QcaEPc99wL6iW3Euz58xEirqvPLPwAwGaxlwYqjqtnorQfvo6N2aeLrNGb1chAYFL6nP7MtnTsONzBJEQLFwfaJobA251Id8g4cek6xQ2c+FOJDMEX8e4kU9JFfQkxLvdz3plrD28bjXFPU7dGyEuLjfeBwu5x2fkhivFe0rLGDQKuj6pfV3CUPNqkVqbJDKX2uhxWLflCD2Z6PlO1YAQNSkK1D5vnH2O5pcbjKqGbz3bxqC5o0BvJ048xWaOOE9cNlQ7u8PSkkqf0Jj7gOAidcEhZui4Q/MZvaNRioSrH+pcEFg5aGXBVWbvyTtCenwvXw5+CqxpYQViTjwu5oiM39mu1DRHUQjT/ul65Qq67zHhJsptH6fLYtpno5ierVOcgwdnNWYEeY6IzRVVGxfER0dtSnpumt4+FfP7aqPRPiMLy58QgK/e7yNmPmgxdvrXROpe2f2kJveYvXwkId282B7CXMw6DSs/CB1NhjjPlA7J2yuRqYpm+lW7EmLZ0N3yWRcEE+drFPk1o/l/2iXYzHSgc7JZyAQ4bK5Gx6nXNLpabS9Q7p5QlnzI9AZanc4Zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NwyLkLpR6vYa+WNpsslpgUHWrBYMYHf2qx68hkDn4hcv3IVSKWGMUnegv9nu?=
 =?us-ascii?Q?m3vHWEJ+oWiUWgpzI8bl2lSj2LEAq7l7LRbQUNYANoQfhkvI9Ee+PBW7cgjU?=
 =?us-ascii?Q?owkHcfX9Orl0JpWP41p2sNQGnn0bJU9a1ZMnEWWhDw1OXDbkEN3Y7Kst71eR?=
 =?us-ascii?Q?ap5OCDmwAMWYfFrAc+hGuU9TLYhYKwjZmrd0j7PEcuZ83jklSFVBT6D+gjdj?=
 =?us-ascii?Q?6rezne5PUnrfKg8Bm7g42f9qurSK4LA6YrT1sC/j/iIr5o0wHrACJGPC0XoE?=
 =?us-ascii?Q?pBRITikw28/sBBWgi3VgkQ0vkOOkXc0VYGU21q6zenIjrLwIC+Vqof13hnAt?=
 =?us-ascii?Q?9YYeu0MfQk4sQGGtzYuAdJ5DMU1O188obFq+L5RAjnY192tV3VmwToi8BY6h?=
 =?us-ascii?Q?Na/cTMUOexwpqpzumw4RbnVOUJhroT36+a+/NyT0smYwSag6axNwEMDdNKNT?=
 =?us-ascii?Q?SSEI6nRWMgIA54XgLmb7fjVsuLTaSQbOBhU/Ao7LBZ4MCmWM1+cBs9RgUbI/?=
 =?us-ascii?Q?A6VTrxI1ULKBJBw4jEK8sskpLoAh+lLUqURyE4B25Ce8Kq4SG7e4TX1e4KCw?=
 =?us-ascii?Q?GgylcFXOqugykvsIMwWRE+3P6H3uVZtX8bqJ7LBNAJ8HSO8msaVbx2kqY63S?=
 =?us-ascii?Q?LvTO5BBaWBHald48Z5Th3oynfXJq5V1zjJBy3bgd7zkusogXvQ//9xlFp/Nq?=
 =?us-ascii?Q?4kXao8eybg63uxPo52ujLy6j4TnBtUvxNHsLeZjUdXWfXJ4IEAVaqJ9bxmPy?=
 =?us-ascii?Q?j5ab/E58Bkm1z+7owQPhuBM3U7PKXncGI1SouK2NkCtYp3rGjNNfcmwqIrM8?=
 =?us-ascii?Q?Bqi5wfz+O9nFa2mSPjk8tVNxKuG9a/ZCMi2kiCsMusVfacd3rm+32Xj3Gu+K?=
 =?us-ascii?Q?9sdDqVPiaMPmWfAI02yOTO+uos+jDMsPnAkUfUQd53JeCMad0eeXuDQLJb/9?=
 =?us-ascii?Q?6sYiC0mnRuD/oDlrBaEpRaRhIx5sT12N1pQM63CQ+aAyTxqlXStm48mwKyj5?=
 =?us-ascii?Q?cZ5al1HRnnAP6JmsPm243om+XPu8hXs1Uu6f5tQYGQTZ5ptoaYhHacUbR0Sf?=
 =?us-ascii?Q?f2U25G5aPvgULW7QwHKn0GOO/lR8mNdPWiEKh+1kLBeey0cLAkGh5tIGWDwg?=
 =?us-ascii?Q?A5+B5MntnuiVj7sRr5JUConGWB+mmTOLSGzDXcp4rmoGMcIOaUZ1wATfqn+h?=
 =?us-ascii?Q?q8aDSGCynIme8lkB7bdSspuZLVlttaKt+tIielKPyxLlRIIoO+F+WcQyE25h?=
 =?us-ascii?Q?KwKCnkTmP33bTHVY+cVlqHFmCPqeDWPQy2fuOwuLfSTDLMeW17RywjLL0dwq?=
 =?us-ascii?Q?Fw2q940SeUI5ZahkoxkGJG1u9MRo/ZXJOLDo0jmReOP9sQ9OmeZnYrO7Jmyq?=
 =?us-ascii?Q?zT2UTluoJ7XVIu/krRqPHaRiBRdAsZWehiMS54cTlYYs6vLUI4AAvRilUMA2?=
 =?us-ascii?Q?1ymk+GdwTOebiAArxNxEd7YTMIBY6csv+NoW6oZr4d8Tssuztku0og/+Fei3?=
 =?us-ascii?Q?HLHf1ih8D5ZPI4nEOp9xLruQsrJBDV4ve+y3mlhnDfs+J+M3x05FKRrTGOfW?=
 =?us-ascii?Q?4rsUZ+ZJRfHW3qsf8sOOiGk+OLmjn51eUi5fQEhERRVNKq1FLjie9HBEt4MW?=
 =?us-ascii?Q?Wv5NKeA2jIORqY32rhJ3utNRXtcf3JUc9bEIg/T0eluFAdTsf8wZSNeaWoPJ?=
 =?us-ascii?Q?8XdqhtClOClRloVCCRkt5aFBg/O0VhLLZieFFM5rhBxblPaGeOHa2dhLILP6?=
 =?us-ascii?Q?sesdiMVJFPvAoXMqE8cck8y+h7OeLGQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0360dbb4-5954-4d15-902c-08def41ecc93
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:57:05.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/SxyoE7bah6cHAAC64N15QXGyLiqtj5BMt6snPRCG4v7W9B/8yt+PoyMmlGGlbAJ731z1eLDClg6LzD5UdvynEStZ/vrLReChS0vHYhcja+1MsIf6SkRiNHR9Bp7Ii+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9476cdfd4dde9..345bb6243fb89 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -2097,6 +2097,10 @@ static int twl4030_voice_set_tristate(struct snd_soc_dai *dai, int tristate)
 #define TWL4030_RATES	 (SNDRV_PCM_RATE_8000_48000)
 #define TWL4030_FORMATS	 (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 twl4030_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.startup	= twl4030_startup,
 	.shutdown	= twl4030_shutdown,
@@ -2104,8 +2108,14 @@ static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.set_sysclk	= twl4030_set_dai_sysclk,
 	.set_fmt	= twl4030_set_dai_fmt,
 	.set_tristate	= twl4030_set_tristate,
+	.auto_selectable_formats	= &twl4030_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
+static const u64 twl4030_voice_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.startup	= twl4030_voice_startup,
 	.shutdown	= twl4030_voice_shutdown,
@@ -2113,6 +2123,8 @@ static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.set_sysclk	= twl4030_voice_set_dai_sysclk,
 	.set_fmt	= twl4030_voice_set_dai_fmt,
 	.set_tristate	= twl4030_voice_set_tristate,
+	.auto_selectable_formats	= &twl4030_voice_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver twl4030_dai[] = {
-- 
2.53.0

