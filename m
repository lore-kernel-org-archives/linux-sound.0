Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F342FD67D
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398045; cv=fail; b=get4JwPxLblX24zNC/N9Mvy5hX7qd+mC04vrawk+bBafRUDVkKvV0rA1KzFAY5SBzdacBrXJA4HRXGeiJcMcE3D1kZWjmkL/RXe0y/TvKBjrZDcn2Llqiq20qZSDbHMe3tvF06krtptoGHyiN8XH0St8QaUM9fHWazvQOCIPrGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398045; c=relaxed/simple;
	bh=R2zOpmI25F8DJsWqWN6xb4qjDV35V0OPoMLi4/Oir54=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kdieLV21wIi8apoxAbNp0PgqTGMoSE8B3NroUSD8xRsaLc2MqLOw3oXZZjuRb2VvpMHk0oSMFcgenMZXgYSySJCmeaqO6e/cmmT+hmbx2DFym7szKJdEuMwir363a56PNouGvvC1Z6n5DLnbA27TXmNNJrO4D9ZrkG4gJnGV5zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ae7/1G6y; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ae7/1G6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbaXrRYfgnmuDcEcp6OPVZxFisQF3MCRxMBhWuiPzv60SyvE04cEY8x8Zd7yh8Xly7xORYNoMvRjlSF/cCWmy3RBdwdUtybkw3Kk2Th81KC0ZbW1AZs8vUN1V6oifadAaKrbakDV1qVO3Kvzq0fL04TeiM6hWhXM5rW2e7CczFrP8FDi2KvdAWjM3xUx9Wu2FtEnzp0e0zarqDzKAKX5zOpFISOIAYuVlFHUCYRIqpT84tY31w9uUawfk3WW3WQZGGI0/2WQxT/AvHEG6SDA1XKtWx1cubKRUnt2Hj5ClTVK2+ChS1AhIfxpX4nXuqkoXoIDFnS2CCPPQhEYOdMq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYks/Js6KVkU1n51DL0e6J+eHMIqkQtx6IY7KLqd8s0=;
 b=bT9hTxb+g+ZZrh8J/wB8CzT9ZavQowAtjZdjnQ613b9vEGegWkmwkVGH4IlFZJH8UFxsnkeTeE+wHVNdHnK3oMlpRDNwU9lwsFdMVrPgfdEmjStQn28erS0+f3wJiIhiEU7aGE0SWlYyka5IkzZH46HWjWKyQ0TP/HjbRLAwPf7/DUBx39pFDpELrux2UpwjDp1mYXjPtYoFVEt87I0gDIN2isO1Ue2ZDPTAwJA4EIDWWJhcLoZkAD38chQlWr+X+Qkg5neiR6Fs6dFRs7Wdi+IN7VKCUGjUs/oHFakRNinzHlTNGHYz3uZz+eFcZbMiZ9EHJndcuEFKdIdTPJkh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYks/Js6KVkU1n51DL0e6J+eHMIqkQtx6IY7KLqd8s0=;
 b=Ae7/1G6y8HJbkDArlzWtVeVERQtMNBtLFLqDPTHQe4wS4mmN8e/+wPGUnv44cyAuX5/yBbFWZvF3Db4s3SoUNgQOCfw7k/M4uJ4qsix1ElBhbcNk0TQ3pQknSH4tnDi2FY+lrRSXLdB9jl4simdA7UHe+9RkTmqkJKHlA2Jb6AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:02 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:02 +0000
Message-ID: <87mrtzyw4m.wl-kuninori.morimoto.gx@renesas.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/21] ASoC: mxs: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:02 +0000
X-ClientProxiedBy: TY6P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a26244-8627-4ab8-d866-08df0958a3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	se2QA3vVxG/+8Ixi6yhhkUCdTRefE1Vya0v7azZfuu5fQbuUz36Cgk49Efg3x4IjzcrmAuOleFJQHM+aWP3zpW1PjCVoZ8iIQMXh8uWkN/y+hNkV7m8lKLVC1mPFI7uAvC86t0b/mDkQ4guiYTkKzR+sz9G24Pf1Uwt2hbKOXEDGM1z8KuM0Y7C+TLHkuRKW5ig+CLHWGxjx4iJzUeMA2+TXmokhnRYhfAGv5iZjG33Cpz28MY48ZRaHDLMPLQt5Cd/oxKk11q7qZmm6pNZCCdsFNSGceAub86/HWHkvUeqYxrthJuf/NVnNSfoCTGXhyIHQSrGgBLlP69tEBWdATP/Xgpsla0auBhUPWv3IsqVYENIie8S9Nomz5aKSzpKICeYaaekphWl+dpba5ZLqbT22V1Xgxs0bUYk1Ro/Gs2xJYmagRFJdjGcCmAXhWXHUNcB70FhZe8+D0LzPBl2uc3rrDFiEo6MWUudX16soOGNsqwtdK8DBdH6p6lQdxAey+jQ7kwWH5ISvI6Lg/pP5IdVaE7iuXA5GJRDHROTh4lhxdPZvFJhBRUxMQrE4gS13mLg7UAYqWYaqhZEzZW73bwdMr3zNSE+CrObZHtMA70foGMnQU7fP1IKWBicnIhQM0Or3qGjxQ+tydvoGYyjodyRuUVxapwiEpS+NLEmEG1+zG1V/5lru9/wnWpgqT5vznw3inh1kmOQyFq7W3KVyot+D89h6lUeEWOEm3ciueeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxfHO5FIhzrtXthnXGY2lgXgNgQbYe+4LlvJtlhsNFnt8udU2VkqLYSPFpmV?=
 =?us-ascii?Q?tI0Nhva2y11/8SPvhALitelOLg18d57vKc9BwtQ/jF9FIxrXzInwAcpUdCIX?=
 =?us-ascii?Q?62PlJKk2w0u61e+dnny8ca3IrOlDshhRoUZsVko+QAr5o8w2fDywiE7T53v0?=
 =?us-ascii?Q?Ya9Pku6qys0sqZYjTpUyBApVQJyxd4O6m1qD/9iDH2tgaPS/vTSmzr2JhaCw?=
 =?us-ascii?Q?YeRcIXir9s9pNVin/UKcAbJduYxnzErly0EDTS4U4OxqnB5iNMeZLfhNfDKg?=
 =?us-ascii?Q?8TsoDuORof4O1ix+uuBu7/QpOwdxNnyDQaDLGe/8l05oTFLqmehDJuY7KfX+?=
 =?us-ascii?Q?Oe/+DSwE9TBGLKeK004O0w4j7slmAZGg+EeaV2Bfq6UcVJ+W8PjgpCVkNgOz?=
 =?us-ascii?Q?XEittesOAOtFKFHsC6zmR94b06Xywq3IFeNzIbLee66+lNY0N4ZFguSkjsp/?=
 =?us-ascii?Q?O08qRLt407zTxS66pb8aR8sSWaqT++aJnVP7RnrQCK3509x/I2E33cR7ZSL2?=
 =?us-ascii?Q?7NjzJDkutU6QpSxv1eLVJSyAE45VIbKqmrJLWdNs/LTbsi7tefVzkywlQKxm?=
 =?us-ascii?Q?w4CJrmIgUSbgh3yLzHyHQFWk2cST5MIUG1B/KGoxMJY5crc2BjY/wukICP9L?=
 =?us-ascii?Q?+v3PuRaNEoNT2Q1JfLZxdWarm1coqm0wIA/BvbW24r5noJuyAX83qOb6zG0o?=
 =?us-ascii?Q?Rb78Jx2wE9F8gNQQT9Lm2SBwLt6EG/Ni06Pa61OGQ3pD/fvtZHKukla12qdk?=
 =?us-ascii?Q?9awnrhy68k6EPO5s279oz5sSXcH4vIbkWq+brISWbGMm+ygptLaLFkaE3pLB?=
 =?us-ascii?Q?IopXTaUvm4auuSzvmOCnEQVaE0pfPe2DPgaSBeljn2nw9khVVWu5e06+PDal?=
 =?us-ascii?Q?rocCzqaFdYMA2cC+3I4g8KktJ3hrbDYgYpFCkUIGu+8ZEUEgfS04tmz/EtM1?=
 =?us-ascii?Q?VekOmOw8/PJeJHwdOttsV3KRZK87OU+KV9naRe3nDWio5gCRsDFmlkgDa6FK?=
 =?us-ascii?Q?dqzycooO9ZHJ3SG+bi3+b3TpAYTcUCi7SV3p0FNTG4SfFMNh7Wg77FcV9bz2?=
 =?us-ascii?Q?Six7PMjNwtLlghZ/g4NQkExLHidsoeya2HFNMPIOgq8YtS/tqTplf2K5LQtU?=
 =?us-ascii?Q?8b6n8eCvu6rx6rcmBK0cETvjrJ5Gwj3NQWnfcqRAnaTLVYl1J9J2NR1oFkMD?=
 =?us-ascii?Q?LAMD2fdGRTvW27KfqrJaCPKVM5u+roRgn/HHGT+8qC0jODVKWP91njyhlLAn?=
 =?us-ascii?Q?YYkB2cxBlGwotgyodI0LWpybkUxfLr7FRUkvggDuHNsZJepACc7xO2V4UvZS?=
 =?us-ascii?Q?g+lr/mS3UyQrN4Is/LVV8BuFpQhuciD3DQoDQCzNzafrlko5a8C+ksID9iV5?=
 =?us-ascii?Q?uL8KyoakL6eHNTiNsv148/u1cA2Hv5dRlxMXng6fdoR81neoKNSsMD9Z5/PK?=
 =?us-ascii?Q?D1wTqjsvNLXV/vmTr2mY9SeGRaF6DFeOalHplO58zXSYusTfG/f1CaUGXQMX?=
 =?us-ascii?Q?WWaoSiZD6vqdnmZWORt4J+waoj8yyP87+WZtAKxlre8/FvZ1+R+t6EWW7Wdm?=
 =?us-ascii?Q?3DD5vDzgUgB/rUBzeNNXeuIYQNLakhrB8m7ocz1pPf20nQVzY8BVXiNHj3Jy?=
 =?us-ascii?Q?+6aMS+F2zfT9Hz8ON8lhGPLuUtJdleH4AqfwAyHrXZc2UiH/ro5K0L6QAde3?=
 =?us-ascii?Q?6uEPXyGbraJDd6M9iMSxiPgyISwv/bV3Mku+zoBcjvRGh4wJXdp1jUbVNiaf?=
 =?us-ascii?Q?i2win2kFBG3ovY49ehIjw2mB398O85l2PxHMCb17zaAuP/v730Vt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a26244-8627-4ab8-d866-08df0958a3dd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:02.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTJcWqIJnkmgI4+9B6Xa01zVQxveD1QaKYa7C25TH/1wS3BZ6uKCiN9lLTgUMQQDsLIeNG7H2X8DbrsSezLsdbSa8Ok0bdLMyW9WAVdwINQAo7hstNvMoetCDMKehgjn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-saif.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a77cd516a1bfd..e46896ac9669c 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -691,6 +691,14 @@ static int mxs_saif_trigger(struct snd_pcm_substream *substream, int cmd,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mxs_saif_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.startup = mxs_saif_startup,
 	.shutdown = mxs_saif_shutdown,
@@ -699,6 +707,8 @@ static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.hw_params = mxs_saif_hw_params,
 	.set_sysclk = mxs_saif_set_dai_sysclk,
 	.set_fmt = mxs_saif_set_dai_fmt,
+	.auto_selectable_formats = &mxs_saif_dai_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver mxs_saif_dai = {
-- 
2.53.0

