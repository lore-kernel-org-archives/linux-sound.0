Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9B3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152946; cv=fail; b=RDiv9dIOZV03TE6DCsuc0p2YCykT2b1iymx67yLxB54WXq0z+4KFXFvx5z6QyJoln0vrfeTkfCL7+tgHeKJZUvUGogYRSh8Axgchq68dgsnv43u0GSK1zSqKuHO8pLnWsJNBc1DahrdRc+jNFdCNIsvOqxajJ1z2c4SdbAPNY4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152946; c=relaxed/simple;
	bh=bsOoXr3KNp0ZLDzdrepgbxGvRLFs37JdrXQwOIdEfTU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sDVW1o6QX/Kf2SAqR+44zj9oGiGmqkDAZnrmynNxKrFUXbEwYKJrA/q2Qu+0wQ6L4/ThjTWLLU2yynptNFEsjo9rCjmL+3EkqWmBPSg/s8wrrVM6tD/NnL6NeRkAumBI86qIxUJqW5/6BOZXWg4QRh6dwTsFNdhnc4Z8v9ZgZ7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SET+Wp3v; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SET+Wp3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbEm5gdLKJMRGY7Xsdot9M0KhsDt+JOuui/j8iszfPzfiONp5rnOg2p1DHVX5EXNVviCBAPtixF7DR2Ub8eSjQZmzlpEi7u95bcrBvDZfkIWCEN+IWNoBLwFsGeMet6KLT/RqhihrbeUjA/1vgM2GLhkZIYSziIlVzJ4SngIjoTl01WHbU6QKCM9qpFEELGrb8+kSruT8OWwl2bNj6ajtgVpqo7wUoAf4q7XsZnka1DUU86eXsgXJUNHwr3AIODhdF5LnWXkT6SGMTqfVFMseg9wwhnoj4ZAENKJF6fj5orOiRmE8O/Opbq1+uDSsUxaQd5+2l9Oj2vTVDW59hC+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=jV4H2yNQrkQZWzHOBFz6xTQyL/vAeqgwQZxqFo6h+l+oSMKrt9ubJL/pMq8pU2MR1jORPoZ2iz3gNGFBCAjzk8Y5FFa+F4Y31vfIUDLl8B7nMTFa6Tg90UmBwGL6vlkOHg++6z4QFddzWwcj+4iRi/CNn9nJkg2FE1jUw/oaXCvEsaRbMMITix+VFcepNVrEmizbRZqbRPZnbNkBQLbcAeoaY3+bg++TqDod00CmFLVnGgG3g87q8CLChjwR2bxmE9JvxzfNjSxXCXxEIFXriQJBgWMGzivFeoSFBqfdxa5fpzpxhp8o3EcFQ9sNH0HiE7ibJhCa6K8fyy4P2fF+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=SET+Wp3v+B287p7xMgtjjzSfqUHvDoIRHqEbn5o9k18pxSQc3n/lJUtZIAPbfoaeHCGqi8tQxAJGn/NaKEp+FxDguoHeMwkYqy9CA3SCVVtOyqRSM6/s7lf008u/MdXdMOKf3ZPsf/7rIaCeUoNirmxhqa5dUlAnZ0Fh8Ih4Qx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:02 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:01 +0000
Message-ID: <87h5kaub9u.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 30/39] ASoC: codecs: ssm*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:01 +0000
X-ClientProxiedBy: TY6PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac54a6d-bd78-4d8d-2edf-08df071df8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	8oellaO9qnkKaQS1XqwiERK5CLbt/2Dk871i7+JOBdjXMIk7BwyyV2Cm0eWWXtRQpU+6lBDm4VqsF5g+Q182KSGmmPWkrIT1mlf9CpjoGdhyG6GdxLuBEKfQzUVOElm/DO6CEjvvaIMc1eCk6mm1emwxGLX+UUnmWpYucNdM8KiF8XiTfI1khDCjceHNGR9uBcogwE5vwgtLqirsgNYtkhjzH3jbwhB8kmqkneewk11sWa8HFitX+GNXTf2WaHsHJ89vObwCJeffbfMeZJZr6+a5dIs0pN38nlJPJI4ZGSkyMWxS/tudnteKugkjXmQc02dG+bFBwraDFy5sZC4jFoyJbgd5RGX3PbgKa4fiHHWNo9jwbZeM3fP5XhArRRBNHde5mCzX6gw8lor45xsc/haOJYYd74IuX10YoqQPWeXa/h13ZMPdjWueYdGaP164nS/gGqRN0Qor/ELt0RDDVxz6LOPMVtt7W+J6ns45O6klOaQE5OCR6CfGT4qz9NxPKKfdiR8NUS61THYtnpqb73aoJ1yPPMOvAchEZpcyIcSAW6qRU6jiLOGozoWXHfueaPFUl7xsmgQIHgpObnRFz6H4qD7Zzj0RfjJZr4aCs28R3+yhUcbmzTqvq9/44ux4KmTziPjUXU2gU7F+8LFDTTQbAbOkXYmFyZ+7ttc3u2M3ghTVseL1CZp15Vpn73Sihlx+X5QUAE7wvSpgNqrjtLm9YoSy4bUXUdjew6JSdLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6wc14VsNxktzc2GMZ28c10r+8PIQ1WPv4M88jqB67HP6RVztVZ4aqH4QPo4?=
 =?us-ascii?Q?hsyWAdDFQszLQ52NDloJQGEZM2MKnQAdF0B5RdfLbizvbQ8nrUPIZYzPp51f?=
 =?us-ascii?Q?qQugXqNPFGVKJWwmsDxkbb0tT5JQI3FCtCGaHhSSamG4HhHB0kQDmtjWge2L?=
 =?us-ascii?Q?71+B4vsPslb7hdZ7rP+pRYr1851Zoi1WUMrv8pGYx9Lq8kvJa0KtNsSV0OV5?=
 =?us-ascii?Q?R3yl8v70wtCFPq8DKfp5fg/BdCpwBad+Bbud/9hU7h0fBEMQ4mYZeGw7r+9k?=
 =?us-ascii?Q?Zqen8Db1e2R5KijEX1fs2z9d+Pev6yjBASkBoM2XXKps/S6jq5jeHWPOn0Ep?=
 =?us-ascii?Q?DfsIDz6zj77hM//yv9uhXw25Vkb0feJLc6l33ctqcdvvMhDpdsZAEnew1GjW?=
 =?us-ascii?Q?HR4glAVph5t6fZmqhGy67gHLRjo3TQV2KaXUpWXX4/2VYVJpKOwNx4jk4ZsL?=
 =?us-ascii?Q?vsnSeV81egsFR4GL0+fSQYbGpuAjtFxzi86KNjcEYnhaPz4ugwoxPF/4u7hx?=
 =?us-ascii?Q?JkJIQhroBuc+8yi3CXDHzHyb6LMCW2KNGt7hrpwNrdtD+snQAjsE/KVfr8Ah?=
 =?us-ascii?Q?vPKvRRZ0RMctPcFAYbpQJcuLRYOgxn66pu1gPM6zZcD4wzJ7+dK5aOjGsf94?=
 =?us-ascii?Q?41mf8pvAas0F22t2oID38dk/2Ng3XGwUBwaSp/p2B28/+M2U7EzUFQ4xdYj6?=
 =?us-ascii?Q?SfX7fPHUWxFr0asPnkASn44aFweHB/UGRHTNrmly/KxbPtXE3IMaxIPvFZyT?=
 =?us-ascii?Q?VoSmPYIif7xUhgDlMZZ7dnRsuuBvjTagF3OusbsZovyXfU0thmg7pwFmJh5p?=
 =?us-ascii?Q?dAaunSVswngKD1VcyU3cijcjklvZVFToLHUuj7sgFpjyxsQZTa1COxDMJJXg?=
 =?us-ascii?Q?N8p1OWike+RQtj1vPbJWDHjpNRDwCCa0N/0dy2nLBHHlyg8nP6GQuRcwjV6+?=
 =?us-ascii?Q?gRrko8GrhOvSpt26+dWqXK8q4oSMbtUUU18IHFt1pJ50xfmu+Q2TX0R77ZoT?=
 =?us-ascii?Q?vfAOvTC976HbDPd3VmH01ls8bMR9mjd07sT3uD3TiVSCV4SvQysqnVKZym4M?=
 =?us-ascii?Q?rlah4esxlo5ffDuo3ZJYIH536AKOjGYoiYx0Rxc1KpzkvEAAE/LWmeedHECu?=
 =?us-ascii?Q?JJaPslLW5Wf1hdP0p50R19cS5fJPPyfg73xV/5D9hdf5JFKj+dwyrUrMAIr6?=
 =?us-ascii?Q?XDzKTQqi1Uspb95Whmaw2PF2S+7oCalE+watuJkS3mEVuw5Q/SWWXesr4Vm1?=
 =?us-ascii?Q?oZajXgWrsxKjMbypTxdv++hmovKeG0ALUq0ou/rUWMbhukV+Nj9PEUCTO3fl?=
 =?us-ascii?Q?g0Rd3WQo3x0MzCnpXR+R/2uRFIO135htK25NLtiXFjGogMusfxZX3Z4Zgnjw?=
 =?us-ascii?Q?gRE8IeKWtLbdvfZDeJc9YN15bwPKARUuF/Q56/KEHprXShKRku3xqk2fVW1S?=
 =?us-ascii?Q?tIbwp8YM0Zz9H25fQz0UCU9Zg6icplUjQETcRsIdY2P3TPEAmRkXLlHiHgaB?=
 =?us-ascii?Q?zawotvf2NvSyxzi7tiv1gNGs0+SUI5VkAbrvsX+P9XH3uPb4Yrk/PqsnnIjm?=
 =?us-ascii?Q?gc0VJo33TciiBBSP/ibJ5Zkhcj734zlOZ5dvm5QgJQrJ77C5JfW1fLMBy11d?=
 =?us-ascii?Q?cBQO76RmOY/yoqRQe0Xgp+X4DOoLHkVkCnUFqF0V9pLHi1mx4HFKLyfC9EoL?=
 =?us-ascii?Q?YVYoybOk486mwhFNn57YOwPeH9NJA8cgV4Omjd0JejnZzbclp4UZDDRK5KPf?=
 =?us-ascii?Q?HN/2CkZ0kFSFOG22srUXP4KetkRJNUbnLnCk1wMwGPoyZwwFRNdr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac54a6d-bd78-4d8d-2edf-08df071df8a7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:01.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6fOCPJAzjctfil78Eeaz+RsUc8rljAqtqYECYxtNurP43A+gJZDrjKEHepnb7Oymm53b6V8mKDlOB/MwRCdVpnSmKPWDaDHZAAkBl0kx8F6thxsQ9ijdKJhe4ev+v0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ssm2518.c | 13 +++++++++++++
 sound/soc/codecs/ssm2602.c | 13 +++++++++++++
 sound/soc/codecs/ssm3515.c | 10 ++++++++++
 sound/soc/codecs/ssm4567.c | 13 +++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 5192569ba6a89..32e81b31479d1 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -620,12 +620,25 @@ static int ssm2518_startup(struct snd_pcm_substream *substream,
 #define SSM2518_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32)
 
+static const u64 ssm2518_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2518_dai_ops = {
 	.startup = ssm2518_startup,
 	.hw_params	= ssm2518_hw_params,
 	.mute_stream	= ssm2518_mute,
 	.set_fmt	= ssm2518_set_dai_fmt,
 	.set_tdm_slot	= ssm2518_set_tdm_slot,
+	.auto_selectable_formats	= &ssm2518_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index fccd2eacd7a6a..92df44f869155 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -523,12 +523,25 @@ static int ssm2602_set_bias_level(struct snd_soc_component *component,
 #define SSM2602_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 ssm2602_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2602_dai_ops = {
 	.startup	= ssm2602_startup,
 	.hw_params	= ssm2602_hw_params,
 	.mute_stream	= ssm2602_mute,
 	.set_sysclk	= ssm2602_set_dai_sysclk,
 	.set_fmt	= ssm2602_set_dai_fmt,
+	.auto_selectable_formats	= &ssm2602_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm3515.c b/sound/soc/codecs/ssm3515.c
index 8c6665677a175..f71509237fca4 100644
--- a/sound/soc/codecs/ssm3515.c
+++ b/sound/soc/codecs/ssm3515.c
@@ -356,12 +356,22 @@ static int ssm3515_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ssm3515_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm3515_dai_ops = {
 	.mute_stream	= ssm3515_mute,
 	.hw_params	= ssm3515_hw_params,
 	.set_fmt	= ssm3515_set_fmt,
 	.set_tdm_slot	= ssm3515_set_tdm_slot,
 	.hw_free	= ssm3515_hw_free,
+	.auto_selectable_formats	= &ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ssm3515_dai_driver = {
diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 8415dd163edd6..181047b38d3df 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -389,11 +389,24 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const u64 ssm4567_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm4567_dai_ops = {
 	.hw_params	= ssm4567_hw_params,
 	.mute_stream	= ssm4567_mute,
 	.set_fmt	= ssm4567_set_dai_fmt,
 	.set_tdm_slot	= ssm4567_set_tdm_slot,
+	.auto_selectable_formats	= &ssm4567_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

