Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362372CCC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783902430; cv=fail; b=oiPR7bH9bDmEg4URgpuVibFkdGDQ5F1guMQ6S0nf/O/md860w/jw94+zs6goTdgNbr2OnuGs1ZyXfz0lQTsRLWFaxdxHZyIZYoGA/jsELPiloKp40p7cOZ+Q9XNYILE6b/Af4JyoG2DydFRJAQdnfnE4/CZ2B9gH2AZ+RQOJQRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783902430; c=relaxed/simple;
	bh=B141Lun3Gl6IXCtcsRDLSgz7PrVoFkIA5bBRc/D7GqE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MS8+af+YjBKfdtHC09Dzm1sKFbspOSgMMVCMRH8HXw8PpNiZ4W9+Db4CEe0gUF2MGcjB6y/+coAfFlA/EZA964j8wtbFDDdcmB1sVenrvEY5fw14MVkg8U3EOEXv4/+tIPY4tHqcqWzjfVPJ1t3Phcou7Yp/QB3T8FAEESeoC10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DXjJw1QV; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DXjJw1QV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN49bvq07qA7KjwXwqamV6w54UnJHravA4YIbfbUdMDnrA8l4MKHsBgzj/HUxKyTSzP0PkLnCU+MX9dz5TS38pV8gqtN6xOG6rDJ4b0cVXNTj6IDWn+3eBNFNF4X/MndoZA3mN7RwRcanls5yMR77pq2JG/S5IysowreKmLhV9hLPL5IgaQVgIf8KjyrcczgV6DzjMCd3/lhrGJ4hB9hp+Rb0RyqTi3ZWW5Ta1PbE0HHa8P/WpDriwcpqKm2l/FPReGkDK2j4y/rWYP++nP4fWOC9+A8ZZR64xZqWN9Xov7Y/A6z0NlrWD567lZo0n5SbOVcfKuBm3qbxq9ciBPqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/alYK069DppYDF3yY/3uvJPQ0keQ+9qT8mgu7pOV3s=;
 b=k7Br82socPbdxUkoFNz4nGExRBb3pSso2aArwPO7awES7BPj4l25SZZg3uj1xDULpx2H6uSmHgRPy16vrS5qVDnWrtCf/C9O0QFwNaslS+0cgL5TohjMH2SLXiuCyx8HcuFew7QcDSCZ1UF6JegL+/67tDhGQ0727c25fGKc4gv18FzYFvHOh7VVzaXTZK/6+3RAWcSuTsbXXGS3lkDoPHyTkSjT9osLcW4ZICdltMmGZIHx0BddoHBHO9NxAivcZw0x4NUwnKA/Q7+vbk5ULNBB8/pxx1l6z61dBHzNXxZGy8M0gR9K3JPR9DTE/62EsRAvQ+QO/dB1EzMz7ISZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/alYK069DppYDF3yY/3uvJPQ0keQ+9qT8mgu7pOV3s=;
 b=DXjJw1QVIcGy+ureCV3dxKn+KbRvN1kbNpxSW6CRPWZ70Mhn32qDZHM7zQVQJxJNaqj1a+TYCtsR5eir6Nk1P/qjCTorSGtTgjdnACvwkP+5ydibAOoLGqzZLCUvCPUE85Cl9u2/t6xiCf6SXWO7jd0fXuD1ZynfqQbmG9X10z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13304.jpnprd01.prod.outlook.com (2603:1096:604:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 00:27:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:27:06 +0000
Message-ID: <87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?=
 <povik+lin@cutebit.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:27:05 +0000
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13304:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f204395-d228-43de-1250-08dee07577e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+zZG/+8mBBPYsIxDFtk8nQZqbpPmaWgKB9U87Z5SPqBXfFXKBZ3MMOuETNqjR+nWvzwilDFia6MZmHj0y4PlpkKoT330fSOFk5+WXC3AX/inC+eELAXia7nU2sOVoKgL08j79LQ6Hd5DnWcxWXuc6xoiqTtD+vpofM+lRtj9J/nCCeg9tBwJfsUwdTTsfqA2OXXZNUTDCG6kgyHUqA1/CTzu+UcheJBDUodcCSYs8C7o0VeUVTV1Vy3+e8JFp4cK7W9wTaaXQTIz+jNlJ4IuTH/3WqQ8kk3E/iurTwCHPNVbEGGxPuE5N3VnKDGdeOGHCN/oIP+3HnazXYibqNQ5RShng60yekQ7rZZApPmDs9qK28lyhsrK2E6fLt3RzuRHte0ZeUWwyJpb4PmNSU1hfGYzCnK3juaKe4b49pYILIGk7Z2Wt84Kza6bBescol1luyR1mimIMNh9ytBwXw4nhrYH5iCSXEsuUVUDOB30Av8BbVL7Y3aEXvaO9n2paotTyEsvesttjqTrD9/8HWK14EX7MCA3BZjag1VSJy8eV8vPqC8Nm4aiPu0+cS6Wm5DPEWqkfn0xBd/MgI8EbMhbhPHlCL/4NkbU5QqdYmIkJowOVTGeQdIrWCqqKUYadQLeQgr5YzY6cAcl+2IpzcY+o8SG6BdFSlQ2y+dUqfnlG/v19cGheCHCbzWeNnT8h9jhPrLiZxKA/9a+PA90qmazMS0PQyv0Opd+SFDP/mgP8jI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?di9rzHjyfGEIKuDQKyOj534UectaJgvAxtj/CUCIbJM1vGyjyseVvnw+LTuQ?=
 =?us-ascii?Q?WVWtJGiMmMj2BZNJS5o2W9aNvliX12NBG2fNvmSqqFh9pzRvB2buc7t4IaX1?=
 =?us-ascii?Q?9luUJrvrHcr2q3MqmX4ivc5efYelJHKz8dOwQhMVN7ARTwgY/jzXaeAsopJf?=
 =?us-ascii?Q?jT9l1MM9kIyuxJPCzP0KTpg77FE8H7wO2SUCPIm/CPj6MEWITXv9Bo0eUGiz?=
 =?us-ascii?Q?vBXTIJkFjzyeL4WP3tagf6AazhXbCPqZy+YWefZlpNm1L2uxE7XpGO1FCnaD?=
 =?us-ascii?Q?SdOg3EXJEeKMqyOsDlRJK8fn5rQ8CRFFC62RIfdDigsJlIUPEI2jnsvqQ8PG?=
 =?us-ascii?Q?so7FmcxkXvCADQWNYbTs+HAuICg2AUUV1xyxfMrK2cBPFAELiQshaBh+n6CP?=
 =?us-ascii?Q?u4l7oMUU/+9W/i6YkwtX/Ye6lSz08fE3fEoF8ovJvUuyT20Lz4PtwzAC3vZ7?=
 =?us-ascii?Q?drbZW66jN/1Hww0okViGvcHGzIRGR7zRrEgkWTq/C/cSwhc23n9EZLroYeCJ?=
 =?us-ascii?Q?nu0QU2nKv0YNmnshQH10Ai9Zi1A+yp9w2MxHkGtFLZBvel2GJ45aDWZBLFp2?=
 =?us-ascii?Q?eX1jXqSYjnW5H2l9fjev2wUIF3CqFNwWLgUwBSIQfhnRgbNbeq9GPAdiSO+w?=
 =?us-ascii?Q?n/VSUlwL2nx8XyqoOvmI4X/37zoeEaHQU33jleXWqpufJudwqPkRwzK4lrIB?=
 =?us-ascii?Q?8eXPU719X9vRmuX0dif//j2lYPuddN6abEff3ximmsCSOLf6xsXMb4RgCWkX?=
 =?us-ascii?Q?P1Jkda7GffSNuydmjDCn5av5zBwXT7Yl8ylYmTxRPNKf63TyHW/osl0xDE0k?=
 =?us-ascii?Q?WXNk+ALaIuYKCjsJC82crESghhgsYyj1nriQ5mvRnOYvhNPvuQ8CfZ1WvtaP?=
 =?us-ascii?Q?C7NhZcLzrmkBvB8SERoUVNKv6gUHH8voHWph81nUaQA4kIyLB9wdMHIQaXGf?=
 =?us-ascii?Q?6UwxNpVKlEBRUxPlP8P5z8F8JMc0jbx8Obecs8d6dguqlrPsCYr/Cg8265Ea?=
 =?us-ascii?Q?UBl4FtOvsGQtU22bIVzyUJy+SkDDlPboc8mPYziqz1AUT9D+C07xLNX++LQq?=
 =?us-ascii?Q?6d+OQLvO7tMzE76PCdmaKD6j4iLQCblq8q6Psg7vRKPwbpGJBlLcM4A6iWNE?=
 =?us-ascii?Q?6kw1fKLNDra6MCTWxoWasVzVNqFr4knSjpt/I/+nkLPLBAggBvDfuh8yai6y?=
 =?us-ascii?Q?1l+joWiGLPkZS9kBh1TA1Zbzd/RHtOjcED0jzmF6XWDW/ACDpXGwlCPONy6Y?=
 =?us-ascii?Q?L2vSDg6mY6lZRaca8bUq2S5UlixZSsnguqJMkg8sxaiG7DLa2/ddEQcGt0Rl?=
 =?us-ascii?Q?rKwgkDgtWN5ScCNdnniQufpFrnO4ZUHbIyeia50QscToO4ypdXO2t+B4AFX9?=
 =?us-ascii?Q?UXIjqhj/ZSyrGBj9kO5x1SQaqRgTQ5NKgUjbd81G52WNgJk1lUMcVbj/dJNS?=
 =?us-ascii?Q?dA24HibW3U72iG3o4SnPEnPGTvlrLKGzpAWnkTtIbODGWVckNrkvm5me49mU?=
 =?us-ascii?Q?Xf7OMdfl601lltFfwSLUrQgkF1FBcrhAEviOEWus30pXfeiX/UFwx6r2LEsN?=
 =?us-ascii?Q?SayUjNz9Gvj0rq3HLFMFrGAnS+TApnyA84xLBzT5cLgT7W9ih79Nu77CIBsr?=
 =?us-ascii?Q?Izzg2M0HmSY0wjPNNFRWKdyiJb38u7L/Mo3EHI0hgXydBlAqswwtBOVzVa80?=
 =?us-ascii?Q?+ecU78bF4w4QAbU6j/Uj+d185X2RNsunkr8TYeYFTanLLyrG/lcLZgPffbN2?=
 =?us-ascii?Q?xCwPpl7up4rApi2Olax0uX9Ni9q3Rx4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f204395-d228-43de-1250-08dee07577e6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:27:06.2862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeBEmGAK2XPGz/yudbYKX3AArnZ1zVJaBKGrPhdOthi3gMh0WWdOmzUxwHj6otmMMJ+zII9ufbtqDdv3LlfFX/8m2zZu9RUKw0gFeFWfd5a/N75w4+OfByP+BDSvUadg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13304

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/apple/mca.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea9..1954192a789f1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -699,6 +699,14 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 mca_fe_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mca_fe_ops = {
 	.startup = mca_fe_startup,
 	.set_fmt = mca_fe_set_fmt,
@@ -706,6 +714,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.auto_selectable_formats = &mca_fe_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool mca_be_started(struct mca_cluster *cl)
-- 
2.53.0

