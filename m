Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137F549620
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631174; cv=fail; b=TlcVWZELEzNWB8eukEk0hleR/8x1txKprvNpmq9DD7OkNK3IXqMbvnKQQrAA3j0Rm1UaAGmTp8BoliraGPuHL3Jso7qnnuzHLFmR/7MdAnbHMurxa0N4dEFh2H667W+8DleyM9keSQe2UEyY6yPTqU9+935pJqYgX4nDY7HqE3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631174; c=relaxed/simple;
	bh=oy9dOjOJE7oAmbW/k/rNL0hIpfAe9x6+CWdElXYD+78=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ThmL9xh9lRGXIrwTR2JmTekbo+UjV/Sj90ilTr+YAvJu33mqIiV0c1spQkCAfJIwjnt3YIezI2R5rKo4/11vG0GNJxiKSnVhJCXAJe9KJaJdGQKZbsSov5x3F6OyIfL9KWc0o8Acw4U3eRc1pkqqn3bBH4C5tIBNBA3AWD551Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H/4S7qa4; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H/4S7qa4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raWmj48WaLvhSGPNF8FRMWPsWdw5KTy+Z+3wbD7yhXRG/U+rTZ94eZCWxOuNq7H8C/vFgHPI9Ni7CS41AUHFdAqavARD70uw3u22l/uw4IhJ9tOjofv9wRRXImF76JZgxBhIJD0ysaR0nlTX8Qbvo624nKqmSJUqUvm259sTXdsRJXODmyMU8Q2Wcv9YvXIGRPfsFy/sP1Fh4R2NEvei+c/sdIBUaw2OeukQWzpB1Pjxyk6NGifUZ2FFL6Sd5gdC6cnhMDfYQsY4xhPkn3d50ssHAL5x0OKCwkfLP10wd7XzBeuAorr60Bph0R28Z4bhJsFEZk3Yi3L/H/Y1o8uX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZzyuMY+ine31Yf/SbFLYA03Wdf2YOQtMFdwi1L2CyA=;
 b=snpZBbA+a9zfM6xGQK7Cykxco/j1wSihmUFh/me3uhUteH/PVcRrMlUJz/8xZd3IHKnLCg9OlyF0SMB8EIw2yzAuR8AW9OfFmz6/XNrCBDjBimsy/j6ADBFDX9iEYZx67znU1VkOrtNeATMBCAl0va7txPpegZYIP4JhjRisyNkUa271Fqcp/LCkqmmyRndRfnMBnV6ctu31lSHIYXR1ZHeXyLNmxOcE5qPHUBQsFYL9d8lHF/mTgy1rsVQeywehda8OQR1VCXzR2FrCKsG1s/OAfQ0MA5fdzVpUH0QAM1ccCGMbgxcJKW8M/Zo0Aeu1Oe/czOSo8IubEyM25SjrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZzyuMY+ine31Yf/SbFLYA03Wdf2YOQtMFdwi1L2CyA=;
 b=H/4S7qa4vuZAk2+jIL0Y9jaEeujak4JZX9eWD50/fBU6CPfXvbmLwDkVzz+C96J6Y8RyHLLzVHOversSzKe1Ku15KgrB1GeubbcaRCCmM8qIh85mQTFDfNF8Hrm0rT2NmJAUYQ0SqFF4FN0a2Lo4i4RjurxuPYt8DjZDubshE8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB13832.jpnprd01.prod.outlook.com (2603:1096:604:368::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:12:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:12:50 +0000
Message-ID: <875x4s6ubh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: amd: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:12:50 +0000
X-ClientProxiedBy: TYCP286CA0360.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB13832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba92f1f-1fcc-4de2-e8d4-08deb0845ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	rL6+8jDBqnPZZgRQnyeGd58hYxmekY6POUoOiABfRRdLpvB49NSYezOY3BAnynPE93Xwuuv9uNrtnVfcxD4HZEqpsYjmS7IHm31ZLly2XF/vXIkZinLGNIGWSrcqJUJzLXS5U0CY2+bylgh/AWDEgE45v2RepLIXSR42A23JpxoruIWfYE4xgTcikutzzWLWjFMmiEDQlt35J15xcIVRKttrCIKcdMutqLJuZUp4rJ/MTmhEY5My75fxZwOUNYbFOrqMgLVX/jJNHZGcQw9rfrFAB03Av8CGXcJxEAUNIPFd4XL3rjeVt2b6Z6lWGvJGbI9lL96Eps1RwLnwRmb31N7wHt82+5eBz88JToR9JBuqot9GVYyJf7Ew3ILHbkNgnNmUtzzIgkYRDDlU/e0wVXZCqKiRy9diH4XMx2Zt/oAgsRfGZ9uchnKpCMxlB8O4g+IA8NusYlDdQtu8QuAjH3m4UygODe1szg/B+mNVrmmX+h+JvDCI1FqKmRPQ2wQPQHE52AByZ9FroAp8A9BqDdtsznE3IllzoS9sdcUeoV841mMQkMuYMqhfAwIJEDnqZ6qtV6tz0FbxXqsi2SETmGtrYYuAahh2Mm1Xucf0PfJLDeDWbyWl2zEoUaChVQ/pFuxAEFqfFliFcaiW3O7LMC/EToJ5b650kdXuT2ksMw3LxRCDVcUiIWE62xGpVt/tquAwVAadb5CRSRO/1Kg36os3j0QKqb8XAwh/df0/YwPyUvOTG1oLXaoLF8KlMv2c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RrNHiQo/9fLgkri0f9Nzp58wcHuElwuHzHhOHI9XtbxTdFT5ja5VcPy4Cb0o?=
 =?us-ascii?Q?oJBceOLqHOzlbEp+s+UodQPWQLkieKHLwTMq8yENtFsTFNaB2/rprv9NbD+J?=
 =?us-ascii?Q?p2lkN9c9/eAiWO2kRn5CrOR4UQtM+2w6QMv5n1iwrgJZJ1iNbNoFTa2EiU2F?=
 =?us-ascii?Q?E1C9tiM85llTdjEq8CfeQHtgiKiXUXMiuZUZSsJsepFXsFwwlPNq8HVlpnkS?=
 =?us-ascii?Q?6cyhATK8ljllaQtw2fLnMG3MYcZV/IqTb9hQnR5OLRIiUkLh3bdiX4DX7vYe?=
 =?us-ascii?Q?lPfV9D8WPxRM/Pjd3RuIPINXFfBOqGTafb9KfZTpuOMU+VDYayNKSSg2MOJv?=
 =?us-ascii?Q?GKEmxAe5EZg8dUCtIHltRLe0Vnk4EQJZuy8ZjsmVDAJfKq5ruap411KIF5Cb?=
 =?us-ascii?Q?rKqSJ0z3+LxpZromsKTHwTzEhZrNB09B8auwnudMvLWP6xqIE/bCVPJeVYDD?=
 =?us-ascii?Q?sJaZaQ18bJFFpFp7Kd6K/FAjQJ5qaNCvx/zfRZlLlDMTEiB6nC9PzA6A89F0?=
 =?us-ascii?Q?3yWfOLN7bXV0PgYPko8Bwgkds65OYugJQdMuSVSDzkf+VVr6LYOLTA7Z65Am?=
 =?us-ascii?Q?N1fNSV9PVl1mNnVBwFjfBYknkA2+XNG5FRQA5CbIdlQl2h8WNeEUQb6q9Oqm?=
 =?us-ascii?Q?0WbCC22U2giq3/UoTcRYdWshFAPZ/5dq6hY17qGN3/W+s2gBysKGIRJoasFN?=
 =?us-ascii?Q?juxfabMd0HsYtJCvPIApyVIzXPm8g3Ssxr2n0AytcmYdolhbaTypGxQtM/ks?=
 =?us-ascii?Q?o/zDAYF688SMahffzmUmQzvvppirOmeiugnCUQY5ySzYtl/TLe1BR5PbmE6g?=
 =?us-ascii?Q?/5lBvsXQCMZbB1xpdQdaCjyuq0oUgTwsVw0E6cqkwc6bu2JMK8UrHtv6MFwX?=
 =?us-ascii?Q?OP8zGNWqX0kflTM6DwJz4haa+mKNmWqJr7EvaIaAXQfVPn6Gz8YP6O2xjByi?=
 =?us-ascii?Q?mnILlmYGBne6VNtlaUCtOfBnWXOCRUTyvOyRSYWmA1xOG0IP1QntxuuXQ40F?=
 =?us-ascii?Q?yHgvqh787GzJfRJwwvSipFBJ1Hy2OQKmOAiJdC43QYqQCXR5lffweuAmoEf+?=
 =?us-ascii?Q?iQ7rPBvvzOw4K0+MHuGncuWqRoO06DsCtgTJt9OrPxPp2S0WXgluKwXjcBdX?=
 =?us-ascii?Q?3Fggt9B7+j3BUGV57MilZ2P8dVkiO2aWArSwAnQgDa2dyOjl2Om9k07dXRXD?=
 =?us-ascii?Q?V+rlzn59id45r86qaFjsN3i0FkIfuEtUul23ve9ylIslxM0HUrul0KiA69JC?=
 =?us-ascii?Q?1Kv5Vfoo5swY8DMLkBCtkDv6F6EiZ3h7JQQSJZFcJeFxxG3RoV9qYacetUlJ?=
 =?us-ascii?Q?HTllmZpLImD8awPTeF0iGKNldthdgxklAQBHFL+prNEN15bLCY6Ffi3bFLJN?=
 =?us-ascii?Q?8CL1IkPrZdtN2C4dG6XrQslpwf44boVxv85IN0q5NxXs5mqqubiBrrgsFGrn?=
 =?us-ascii?Q?eY2QePcAeBVWbsMnR3LB5K+F9gT1ePtHyB9Qs+EZoHGqfwl46S3u1zbSeMVy?=
 =?us-ascii?Q?5/qIuFEYPcJhnlw8u5/2z3qxOticesuZMozkfqyjBCbdtV5UKr9ziFEmKm7d?=
 =?us-ascii?Q?myffam8kPdqUvCzAoUiQQnptOaVJHNX8dBvjoiH+aHyazHZWVU+9CARKkGkd?=
 =?us-ascii?Q?7/wHBWJgM1qiqKZXH5v48UZLN1id95m8z9UGEO4lU62BhvPITI+QiwMbDTsM?=
 =?us-ascii?Q?NEF1sqLtAJnK9Qq4jKPo2qpVIGHbLPi1od9dNrgbpOmCXn0RsBeOv9MJ9xOw?=
 =?us-ascii?Q?zYKVRtynJomFOt8rkDE/sVt2nnyJ+Lee2uG6+q0KMBX75rQkEcLP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba92f1f-1fcc-4de2-e8d4-08deb0845ece
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:12:50.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ll8wCgf5EY5h8NnUZm2hZHfZicINFZmomRHFlMmwlz5paC6z2oWRUX/gJe4AGZQYTGZIN2CdYKXUounZaFm6N83gVvLZfmmvAv/8zpY3moUP/p9Okyl9hjp6FNrt2NV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13832

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 283a674c7e2c3..bb58a9d34993b 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -686,6 +686,10 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static const u64 acp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.startup	= acp_i2s_startup,
 	.hw_params	= acp_i2s_hwparams,
@@ -693,6 +697,8 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.trigger	= acp_i2s_trigger,
 	.set_fmt	= acp_i2s_set_fmt,
 	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &acp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
 
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 352485dd98b14..b0147e88ba54c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -250,11 +250,17 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp3x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 	.hw_params = acp3x_i2s_hwparams,
 	.trigger = acp3x_i2s_trigger,
 	.set_fmt = acp3x_i2s_set_fmt,
 	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp3x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index bf719f6286174..dbfb87e2fe929 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -337,11 +337,17 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp5x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
 	.set_fmt = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp5x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp5x_dai_component = {
-- 
2.43.0

