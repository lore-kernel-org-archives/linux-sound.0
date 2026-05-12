Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE11A9B24
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 00:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546847; cv=fail; b=rrmLSGW2Mne8Mtzy2wQLZaP93VCcQp1ybGeDhCjL6EARYH/1uSvsksB58P8Eb1YARZ9UPjpjnvhX6CykU9B28JFwUzr59kpLudGfh3f+aHfVmL3TMz1Gq88a5SGZ4pI+IsIjXCcoL94R4+QNK7l+K1KKAme0bXe/MeCss4TkSOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546847; c=relaxed/simple;
	bh=OPmdk1/KYzoTtVDfwxUL6A7rgoqRDAUSKQoKa6uLzVA=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=mtZ7qENVVRIAD2aa5cd8FQKKbZw7//x68EQWZH9aEVMhLRFKVIO0xXDZ7vd5c2QDcpTmJWgX4+Ck+4IDw3XLd2M8ZqF1flnQUvLsGT7GphpxebJvH4t3LxHY5XeQn7IU1lu7DCH3MHGwsrfBM//w8p9X7QKSdUDPiNo+VOARXmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X4pLnlnC; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X4pLnlnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXcdmnHJ3YsdfxGgunU4pUlvTIgTv4C3FaTJOSw6WzAySXRPCh8t3OPY/EMa/PeYmXq8XS6zZOm8AqJNC8hUWgAeiLDOI3sTKCz03ed1T9O3wF/DQgtzi4CNvPPSwAAf8EJ/LDLrmNQXdnngj2VB3wuO3TYhfy6ctclbgIqKw6Ja0G5i8LgaBkA2ThHpiO2HJbOz7xGlkUDAT0Cddnho6UZ37HnvIobBurIho4DcJ86O4F4/Iy2itS759U/vmVgkGzwImiiOMCcnJnTVA5l/cStGTvL7fWCAPvx5MvkTaMnHBZeEh6bLo/wdSj3s0mtYnWRJPKD58lI4zx/e523cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6oaJE6vX2Vcp/WQgFNtzJS4ewZL19lhtZy+w0KTUFA=;
 b=Z/t7QpNmxIULH8/QKV5sBVInWUWZKLbzH3MyGaLjrjvj/MhxuxDWg4l6skggJrRJJyrNJPROo3wRzpokuHGKGpRtXmNK5ncaxumcXvdbZhVD8fh/alAU+Y6svoz/el2D0MX6DUn2G9V7WjinOmgsFMi9JXeQDidxze0HdJFOxtFxD1psFxDmuqSId3+urbtmXpVff+bLYLx7V3smfzwmWoX1TfdQnfEo/iN0o/AWh6qA/BLRLDwRHoMTsj/W94g1PfH6ouKhiQoHXh0t083/xyBPwdygRdt3SaBUBOOLWrXH4/iysJyY3+2x/tcdw2tBfmhkGZTDz5gCM6xstLG3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6oaJE6vX2Vcp/WQgFNtzJS4ewZL19lhtZy+w0KTUFA=;
 b=X4pLnlnCTe9tmsL6yA8QKhsuADm8zgNHyYx8j3W9NOG4rZGKpbQEXCqErX1sETZ42edVGbJAwj3dHhUGfpG7j6h405OBtQgDvn3VBdqnCAliJ/lE9ssnKrR/riuNC7tqUTk3yFWdbz7A9HEnYWIL88WBmuGxqFa+QNqf+KMnm0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB14421.jpnprd01.prod.outlook.com (2603:1096:405:245::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 00:47:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 00:47:23 +0000
Message-ID: <87wlx9wj1h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH RFC v3 0/2] ASoC: move card->pop_time to soc-dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 May 2026 00:47:22 +0000
X-ClientProxiedBy: OSTP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:224::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB14421:EE_
X-MS-Office365-Filtering-Correlation-Id: b867dc36-3b53-45b7-344a-08deafc007b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|38350700014|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hv14iYDOCrTtR9oWSuc/hsQWmu0DDZCMk8Ue4ixW4yF32hQX0q7chvoLe+7dsTEo8F44/iUiOHm6+f8nCo9KTAlPbW1W2+T6uciwJq6Ed5jaPUKiZHKkZASwMC9cIOrIEIRD8QwVv9/14vxy8BqyFCdxr0vBaJltIHCIpk15VmGS0FCRBcB61VowG4FX3Bt7djdDDKjumXHk+8a+mIKhgJLKgSS/FKHEva3DIUJw5993GX1wvSYq3BMoA2CQFvOaG3XSbLbJuD4lsmzvRmbD4c20Ev61RjASAtAn4BX7nEBV85TF+60q7zYNqGEaZ56tV1NWPdSJcZx8EelTptidhXohBCuUnGjdMbeHlBm5zNHC3/Ea0Vw+52pynApi1Kx4xLTR0aF2vVeC5iUGEEU+o2WiLEiYGQxZ15oD6q7V9shuaf0TxtadJl20HZloBfVLgBdEHSTDzcE/XEZ6EknGVLtH6rYNuPruKaX/XNueLC0hg95erjWXPPIxQHmFnMs9aSE9xdPGWJnOk0BotBuQ/XUJR9C7kstVmWzU9qRTu/ejOV144mCJXNrswnFDNp9As/G+zPHUWD8Z+/Dli1FOl16WfK+/oduKVt9CzuPAEcuo7ZH6m7/MGuCJpLz0jNxHZngXcPCwjMy162bZr6LJrNLkVHg1dePqNKVAKHnEqSTPUTFJi7rry3zcGhKQECPyiqLH2FQ15Nxp4n/r8s8O22dqAXtTPEow+XLug5DsG6Z0XiybhY2K5Ui3M3/jr42L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(38350700014)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+u+CtbcZ+uPG+8YUw3UcYMix1G/E1BUsHk9GVmnWJlTGBTQkEWzD7FO0qx+P?=
 =?us-ascii?Q?yo4ui4b/7LAZR9d/7giSM602al2vg1KS2v9n+e/vyn9TvSx0swC3ZoZZmQJ5?=
 =?us-ascii?Q?EF3EyMSfLadhnLqIMvblUbPH22I2Usko2ck6saxpYzHm2Jx1w5sSyKrS01TZ?=
 =?us-ascii?Q?vcCNU+Uv/a92Qwzatkdk+d6hszf/BATlpK3Vu/SEoDn+MuwF0imdxQ0U0Fnp?=
 =?us-ascii?Q?vaDUOOupIB1ITkfP9GlyCjSorrvLG+sWcRLSAZriUae/MuUHPkQEEMs53JVK?=
 =?us-ascii?Q?dKl1e+1OipFKNTItyK0V1aaTXqJY7FRMslEzCnKPc+WI06tRbGYCFNl0OBDc?=
 =?us-ascii?Q?cEY0y8FVE56J5f6EbAgDKTugvtI9xpd7yhBgyAKPFApoK44NU98UfEdVVXPO?=
 =?us-ascii?Q?WQG745JbJXkIxpv0iOATPHwuC//m1y4ThaL0Ct35vWeAU52u0g6rIwthq6eE?=
 =?us-ascii?Q?An+kh5Y/iieyxTsop3DYt8uO/UmgVpkUD0v9KuvropWFpqM7mVcGPqZRIHY3?=
 =?us-ascii?Q?mdLAe4QgkdiQ8mil7iF8pH6KsGOApVmlDdsPd3Xa5MuxK/ceGi7xoKwP1mAi?=
 =?us-ascii?Q?+C50PiyeKsDFsP4zH7Ane+FIc9HGxgGGpoWF3ngmkG1OxY60rAxGbUSeEfH8?=
 =?us-ascii?Q?B+CLz17fDmcV9rFBTIJpD662bW4aGKt02UB0pI8VCDR8XlvivyHVJlKKig1t?=
 =?us-ascii?Q?ZExMbz9ECCQCJJM/PiYSfEoKaU6tbR//dnZuJUF4MYUetxYPO/471JcvvWHV?=
 =?us-ascii?Q?Yl6jNhbzqPiYU1paMIIjgf/DtqgSrv9fp4TNy1DlchgAr2DxdxIW3c7gEVvr?=
 =?us-ascii?Q?5JLhQzt54wDOJ3+jp04R9Zj/m6zZok4cxLOeoiR3/NlFtMDfE+EwnSAANldx?=
 =?us-ascii?Q?oABK0DxNASQRxNr92CKMToRweHKgZsnkdfwed4Iq70J2rfBWPkgNQwDZjeY5?=
 =?us-ascii?Q?Id9NrquHWhKcuIJntWE/MPL0bcjnsayiUwXc3dyZRY9tY+3aS6mDzGBm5fWb?=
 =?us-ascii?Q?KUvC4ofpOHL5RuFN6zgRUtB0SxLPB7b8owU5UDbFoE6pXGrJe00pRrnrq3RN?=
 =?us-ascii?Q?k+W3AYF0N0udzqIxvnPui9lB+9suRpNk0QQsn084YUmyt5GH80keLEx2FipZ?=
 =?us-ascii?Q?XrmQcw0rkq+EiVrpD3IjRkSO8+8dDEyBHv1OaVruzh+I4/VyDaoEbir+itzn?=
 =?us-ascii?Q?nV7RSGPWWC8neNi/B6ztAvXg8Ucf2DLb621bPD7xw0S/Xr2IMV373y567Sdn?=
 =?us-ascii?Q?FY7zu1Pf+Ia5k6cmV8rwg++nem2UKoqja1X8K1gQp5t2KtW5lzcizdmyMulT?=
 =?us-ascii?Q?hKG/qPn4ywnFpqA7rzFSHNQirgB8uaC/2ddXYKuqsit0b3qWovclQ2FpW02e?=
 =?us-ascii?Q?VnKkX5SrsOpZSzQr9v6KpcUCPsJ4daTz4bIOjzj/xckO6kGwIHLXz8qwaws7?=
 =?us-ascii?Q?Ml2i2hqFMiJrlISR5XlbU8T6K994J2xNNbbJnlGc0PrpWriTkosem8kQAQ/L?=
 =?us-ascii?Q?RRHpjPfZAmETLbruBSMQbrZIHrWfJRE9cBRpkV6ILm7Dqzyn1xGpi7q3+67y?=
 =?us-ascii?Q?44+KdrMZft2D3a8FlFLB6+tkVmaRISWUq9X6MXDk6feVUGfRu43B907qV6DQ?=
 =?us-ascii?Q?qg/zI3tVOLm/heURhH7nsxj/UGjquBqBfYDotgjE6SR/UzOFfUgplUo6WXqE?=
 =?us-ascii?Q?CjbFPzQqbPwG5xgW0i7uUYbr3vtWNVTAGBMkAzQwTyJo72nZNyGqADJP7owS?=
 =?us-ascii?Q?DWKL95rV2OGXgu5nSgWYKPiJOxRDLN1N/pEqPzCsu6cQKfuTbGdk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b867dc36-3b53-45b7-344a-08deafc007b4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 00:47:23.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kd945tDthGqLfEGHldPOGZvtvMwLoDRTYFttwfVyD/ubSQsJARb8dWqQu3IG5FqGlpu4JUuBEQNK4vKDnLVVeGx3rpywWPpyj+o4U5ns88Da5L/K+miBFSteW+UL1zuz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14421


Hi Mark, Janusz, Peter.

This is v3 to move card->pop_time to soc-dapm.
card->pop_time is used only on TI, and Janusz posted patch which will stop
using it. It was posted at 12 Apr 2026, and [1/2] is it as-is.

[2/2] will move card->pop_time to soc-dapm. We can use it via debugfs.
I have added [RFC] on Subject.

v2 -> v3
	- create dapm_pop_time in snd_soc_debugfs_init() instead of
	  soc_init_card_debugfs()

v1 -> v2
	for [1/2]
	- checks cx20442_codec and tty->disc_data on _close()
	- use WARN_ON() on _close() and _receive()

	for [2/2]
	- create dapm_pop_time at top debugfs dir instead of card dir
	- tidyup git-log comment

Janusz Krzysztofik (1):
  ASoC: ti: ams-delta: Stop (ab)using card->pop_time

Kuninori Morimoto (1):
  ASoC: soc-dapm: move card->pop_time to soc-dapm.c

 include/sound/soc-dapm.h   |  1 +
 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c | 11 ++++++-----
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/soc-core.c       |  5 ++---
 sound/soc/soc-dapm.c       | 30 ++++++++++++++++++------------
 sound/soc/ti/ams-delta.c   | 21 ++++++++++++---------
 7 files changed, 44 insertions(+), 31 deletions(-)

-- 
2.43.0

