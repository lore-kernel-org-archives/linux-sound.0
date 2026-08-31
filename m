Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB553C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152921; cv=fail; b=SHhF8NlZrfg5Xup8yOwkCDmf2BYuMbGvEl1titqEPxH99fihrXXx4OHxJvzHf+p4V68fvqGz0hUK3kHtz/bOHIgYht34Wg7qCC96+fbNKHubhfxNq3SpC15yywSDN79c9Ytthla/7090QNTDWv1Mpcx14L9GP07kNnVzO2ko48w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152921; c=relaxed/simple;
	bh=88BEofkgh1ur2UTC4YJgUfLPHTwCAJg34ySfKR4exgQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YB13tM5Y7RiU423k9Vgd68QczLzqJuBhyszYW9kJ7nxbyarkqAXUPpDJYSFgz60GRgZDZ1fkEFywxHs4pNpWOHd1L5P/AYDVb1mkxiiaa/4P7ussBSP2Hco/8MWCpI/lxvKUUc95lycxQXb8VOok0q6Eafi6NjCL0IBbqGVVCk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VM/G5uLl; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VM/G5uLl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL8GllKJkF7cOaaH99SLGOxgMaif/uPRC7uITfjKpeq+c1PCiW4sSgbxJL3L+PPKRQC9XZfX1kQBERccIxxoPECpfps+EB6J+M8oH8FC7PRIuZQXOiOgT+68eL+RLDVi/ZSUPq3KQqj8AaJtKNgH2YUHQm4AG1KszeSd6FiFhqJ5QUAMoZyblFF6d+fyyujOi7GK/MpqOU7jOZBVLQKXIYmgvVFP/gbIOvytis+gKTgXV8vTMspSKs6nnKE0vC8wGhq2VuTPuJAC5IaOIV8nYyml/4rNKcIygryLprtwWTBwZAyWdt19mn7XkhZF6g3mQNfYAP4pHs1o71cL5GKzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=GSOSEHreNKjXrmrtC1dNMOnJFrWbH0eL//dTeSw0FJTp2MfCSXMTRbqCAfUEt7NH9VrSUL/HF8xaPA4C/VUHibste7IKpydaJnX4PNH56qPNCZ08UlbR6eWZbjCgb7JyTW5Gsa+PY9/pB+UiDFojUfPOigho3R4lTTxO35D+qxkQDHMHjUK1HmZrSQ9flxlEO5eQLfss5oBG7+R1KZWjCiw1oBpF84VfXceN820y472Qh//mm5l/2aRSb7EwkESrrRjGI93IIE2CoYeqq176fTm0GDO639mmvtQRh+BbtJv6UH4CKL/0y8XYn9WOjhNykXeWsoZyXTM3+9K+fDwHQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=VM/G5uLlNqXvaZ+fvNhDRibOtqU1NQTRID/2F/ajTd5UDamzseCr0+6kG1dMxqZ3dIV9PlFBnDBg1muLANzpb2yVBIwwslSRq8nxfj0QJZGRzgYQShlux/O2L/TPqOfbrUzXJoB0FoV+QOmTavHFLWjTQ89taSGwFixqZpMNStA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:38 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:38 +0000
Message-ID: <87pkyyubai.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 24/39] ASoC: codecs: rtq912*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:38 +0000
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: eada80e9-61df-4a65-119b-08df071deaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	a8CfOaqhBEGLwudD8XHojTWIGNzHoQQOFyB60DmmjUIKkKJzujCzWsDMBoqh6XMN9Kh/RDVObflaJC125IIsWzgZ+OVxY3ay7nG4Jt+dVw05V5ZypZiUIWPrjTB2s9Fgiq9GjUF3cQ+DR0r+YkEifWc1XXWIx7l81c7de7EV6IO/xIbwSIGzUeIDbF8z5esgBt3P1yVNmnaJ0AGhqEIlAYmse++oHDKIUVsrAf9GuLRNcyFxB+diW4AWSJxGqf84p7hG07xIq8nfLO+NR4qTJT1Caz/jXPYjlZ1qY4WqdaK+sD0Gf9CzwrPcuu7QOVccs5OgEWuX8ow+BtJmo/TwDmm/AUKFgUf4nhaYivxiyPO07YOoxUMUxMrtBM76aMVES6MJDfAa+2FH0ijfK30mLtfpCIOOBBqxd6oucY7Ksn3l9BEiUEt78s8QRqjyLVdgfdzzTKeCRNSNlzkK/uRkxHz4+E7UAx2ZIRGEi6UE50w3I8CHCMpamZYzyalV1GIpWAiAu97OZ5vr0dF3FCLcxrYC4IT/qloovnlPOZauTteBfMVRI7x23v/yiE2BDGC2MjOSHOrZiW45YBpEq66FGgy03rGHaYdgu9AdmM2zGZRcLD6aIsWqJcQleg3SbY7emHx++KYdiKTOziG7wdqUKqDvvZB00bHH5LxqBH7jnr1Bx1TZHk2wFUtXvaHXkPmRujX8vkZ2Y0qABq+cOm9DV7adiM7AoiMCMXSsEw7qHkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dL7l3y7L3KXntp9O06pZSqnO6cVb8d6Ka/5odEtcPREoWu/vstmkBhDmJCnU?=
 =?us-ascii?Q?VCdymitErSn3vEJxTfmYWtYB1LHlNDtDxcl8SOgpa2shBAnQ/vj2GqLneXtW?=
 =?us-ascii?Q?aoYLtn+JZ5QREvB9ow+oITVnbcIWs8/gt+osUxyldPRzEZP49Z+REYalAV7h?=
 =?us-ascii?Q?ld418R/4wUnBVmZskkfX9UQoYRHh1/pjjWcM5aESbi4GXuQFKvIEHw06YdCT?=
 =?us-ascii?Q?E6pzSwyw2LkOIq3uZU0/asegvH+m8SiK1Vy9DFeof2kjTdJ04XCckSegGKi/?=
 =?us-ascii?Q?uTVGdbWGckA7KSu5Bdq82et0E9o7He71MBE6mSoOQBOzTPQaAzECGUIlHbUd?=
 =?us-ascii?Q?r3xKM+76paaNxa0c9En8mlIIKN9awr80KQlOgMrVMM88p52WAOAGavzGutan?=
 =?us-ascii?Q?GWLEGkAzjld75DZUphPikW8FeLggIaOISiuAIMjPyDsM2TPW4NW2vuhPK5JG?=
 =?us-ascii?Q?Nug8D44SjrOHMMzhGyh6CP3bPCLs2vfwZAM9CPiSNewkiZ6wPd2rrpTU1Yvu?=
 =?us-ascii?Q?4k/uKDb7tVvVsUAy+Xg+6oDO59zOv8fajdtqrMcI1y3CTRZEfH0OfOo1T0fW?=
 =?us-ascii?Q?xx/pIQGKIGMjyxu8ssv5SEOMGaAw0nX4DfF846C+cxoxRPSukiDJweBr6V+7?=
 =?us-ascii?Q?d9j+XUNGPbPBssqEhg9Y1ygRfCYd7zw3SVPm5mLUdBphuu48rAfIeWPD5a5+?=
 =?us-ascii?Q?0WM9Slf2JWdPwvZYI9t9sMW00ouZkW6ffqUSfHBsEMo1HSNUXGPAxsRMzsTh?=
 =?us-ascii?Q?hdwNl9cjZi9PtjKjN3cA5TMiIdyGYRAdXO7XL7fqVyOPES+UdsRnCMjOTDuX?=
 =?us-ascii?Q?7gGEG+MmYy5bXPwMMvoiFLETjF2KN/0+nQN2KkeKdTNKOsBBQUkiXNMwYhZ+?=
 =?us-ascii?Q?VlRT/JRuEuq7OrPHrZixrlpSrvq+L/PPD7FmN9tUUJGnhe3kkViaSW17YcXe?=
 =?us-ascii?Q?N9J/asn4hZ8iFSk2b5I84SAp3sevJf5//+bDhBS2o0LJekW5CGtIdF1lFyfD?=
 =?us-ascii?Q?772aljQY0yiiwZmybkO6nyNfAqXN+PwlRcyRuCzPg29CZiVYMOJ6EBSj6/ta?=
 =?us-ascii?Q?0tGqLzO/LsQc7o/JRpuoOypAT1vqOIfyI/Tta85X8+aY3JqeQ8wQga4s+m84?=
 =?us-ascii?Q?Ush4Sf4C1OGJ8uQLNLL+S2v2+yng5/kLOw3ODCGqEEIMPt/VUN+wG0O9Byuj?=
 =?us-ascii?Q?JuYDSjnXC7u24/+Crfp03dRLHnp6TWDoUFhjIF4ptTKMsc9i5GQ2pSDOOake?=
 =?us-ascii?Q?N1T33rs+sF2T9q6ogNRY5hwOVoleCxmMdGdliVR5gYVX7LQdVjt4OywWoRIi?=
 =?us-ascii?Q?LIm5h6YCgVu1MesGEsLtFfQQwIBA6JfC7pBi3jDej/e9Vy9f+61rM4ZL5jkI?=
 =?us-ascii?Q?YUDcRq572U4BkyfuKbc9/4YwcS8yXXzsho1gUms+QNmwaMdwxDXmaxmWm32H?=
 =?us-ascii?Q?btYPlcFFQp7wtWvKMNgU4Z5Gc5Tr8Udd6SGasXHkAT6sBBm4TG1G3glZ+HFn?=
 =?us-ascii?Q?3egSLITmdcvu0BASS87H1rMAD3Dxc/eU3oSI/MAKEjk+vhar2nzhLxakUzD+?=
 =?us-ascii?Q?lJn40nCFl+fgz2AshQyXfDtCuwjo986MnBGgbcTUc/yr4EHqguXA54m3ZeHD?=
 =?us-ascii?Q?ufHQlBUu+IJpd9jbwBsxHWXnBjonhjaB0uyLQe8bTsTcruCjx9vtmm64Sitj?=
 =?us-ascii?Q?PfEhRJJt+gMzFC77nO54xIWw1lO8+4QtAnjtJILELcwOBabYEsj7EBvSm9Pn?=
 =?us-ascii?Q?FcnHmg1OTKqQMVNTn2QFzOib8x0v8TZMFStY+fuwqKMIiB1wHV8U?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eada80e9-61df-4a65-119b-08df071deaa0
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:38.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXGtknVTq/8W66ocMsZ7ZGns2nIEZZmxyP2S96tmagM49QN7htZZhuUWi8N2jvbeq95P8nE1htJ1pxr5CF7y4lGPO7Q1ihsD5CThDO2Z/AVymlrlv6/g3bfnA+JdnGrP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rtq9124.c | 9 +++++++++
 sound/soc/codecs/rtq9128.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/rtq9124.c b/sound/soc/codecs/rtq9124.c
index 2a041894bc0c9..cc1c68752fde4 100644
--- a/sound/soc/codecs/rtq9124.c
+++ b/sound/soc/codecs/rtq9124.c
@@ -286,10 +286,19 @@ static int rtq9124_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rtq9124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9124_dai_ops = {
 	.set_fmt	= rtq9124_dai_set_format,
 	.set_tdm_slot	= rtq9124_dai_set_tdm_slot,
 	.hw_params	= rtq9124_dai_hw_params,
+	.auto_selectable_formats	= &rtq9124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rtq9124_dai_driver = {
diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 573200e5062f5..9567e90c0b62a 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -727,11 +727,20 @@ static int rtq9128_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream
 	return ret < 0 ? ret : 0;
 }
 
+static const u64 rtq9128_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9128_dai_ops = {
 	.set_fmt = rtq9128_dai_set_fmt,
 	.set_tdm_slot = rtq9128_dai_set_tdm_slot,
 	.hw_params = rtq9128_dai_hw_params,
 	.mute_stream = rtq9128_dai_mute_stream,
+	.auto_selectable_formats	= &rtq9128_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

