Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544636A033
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804010; cv=fail; b=HlbOa8fAoXmYf8H8SgjqC6DDQwxHstTB1se0Ys7U4T8v/aiUza65vlSSCLsum+9NAwwZNJEk1F5IK9VQRMHv5IR1xDanmzgndH5Z1QeRxv7Tkw2WJnjR/K7bHv/AgceXSHyJkgsojbRFUzp09Edm0q7fMB/XnepBTGRXIWrzDkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804010; c=relaxed/simple;
	bh=Vvm4pT9zEfxnFrcKSvKq9GaaESYmr78TP+B1fppolIE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=EA7daDf18sHqKKogOpV28ZpBpd0ZXErAed4McKVlHzl4uF+5oe6gbmdIUA4z8i8KGDWEq8+U8rf2ODac4M4UiTaQf6x0Bxm9v8lAR3akhW/be8cjyQICEPLhpEnT8kp4eIMSvY8eaz5jfyDsIVtTTZBL5BToi+QIdWG5FIORB1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gZuqHXEE; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gZuqHXEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEqz9UxTw/+3Ax9M0XAdVRfQVPauJ+xK1uXjDN6go6t/6cD5dUJBfSXG8CaDCOCaD2Rc7+FPYAxTtR6Ne+JLQhMO2MqLcmCaKQcJj5EdU2GNmmSeyv9iSy9o0NNJdKQnUgVM+Z4u5Rftmu/9vShbirmGENhlzM7PTAgra7Bl8cMsctIVene6bLKPwqUqfv4OMkH3C+0r7ldGhyjq5OAS16rCg6ShaPxWGLrzwUKb+eLb1IAiKVIdFSw+DoifH+irnRyDVD5svAHkKtWZFgKodjB20LpBnKxC3SgXmtFh8kGAF1EpXhWDJLOonarakyigc+5P9Ba4jhjeb2C7+vAveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbBz2t+wit2FsPx+mnc4eNGVbrpMPfO6MNrEoiV1F8k=;
 b=C18MclmmmNdYg5xQ4jWANRIm5ql1xXyvdiv8Kp0KN6FBWCfV3Qbgbj1xy7y39UiY/hG/wY2uX2OCSnMRHc3Rfjsyj7PaZvI6+fvUiNobmqHTMIDa2DKX7seGLNK4Tp7ORapIYlA9ewLzEh0z/v5yOTgItUqrPDurLeNrKG1B74MMf3zBZTI6Zqm2hwmZKjife5vPc86lCWSAcjrje4LF1KlU19h0qwRJAGpCsvwaoqRooZfp+zgcNBlza5g8hem2W4SpXIZZSz0RUphqOh6+WSptsuitme2FjurRGZxWjzAfgl6GzzHgBhcynd7HQwFXkbVBoMj+Lcbe5mEWcOvocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbBz2t+wit2FsPx+mnc4eNGVbrpMPfO6MNrEoiV1F8k=;
 b=gZuqHXEE+XtEqmgxihCpc8L20k13xapaeth5EvGvBVpqUlQNGFOkefGaUuCobLALy2QnByr0d66WZS21BfYoXetjRsza4aTSKk99kUBVJ3+vUGSIq2Hyho3xa4I+MGwMu+2h4Qu5FRbime6SCiZW6W6Ym9pn0qP8ZmuQv2jOZeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:02 +0000
Message-ID: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/44] ASoC: codec: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:01 +0000
X-ClientProxiedBy: TY4PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f91dba-3c8c-4089-fd1f-08def1c0eb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XwEzq+/Hr2/RsuRP0QzvO09O1m5iWypla6bQfKqKfplyUIadMZ++zHMmDdNr7Ig7PuYxi8a1lJZrz2mDyqFyyC3Lh1PeP/qMR9O5LMkt/VmHCwmCQNwMZAACxHAQzj2WXTOCu8CQrQfApvkml5VKww5nP/5Ci5I9bllHhZZB+fPF5Zem14fikXhxjRsQn2zwqvaJGjfRcW/joKRAMl7ddDgG8G56J6YPyURd0o+3ZQjFEZ3CcDdCVirH5BJz5PrgP3o8hztAaGlaoDriV7O165+OCEzJsabxkxwrS/2n082Epzn8y2wgn/zhAJZ8Y1Z3+57xTpn99qoftjbM/w4p9B7pDA3sDO3mmLy4/iYPJA38WsbCfS52X6s6xCMVbEsCYwhE2F6q3pbOEKVPMv2w2feFMYE80l/1Tn9l03kKWwJWqd/zcjEC6mmxVjLwiLVEJGZKeR8I7vJUFx+Mn+4bTkh15YqodDjHQJ28j/Bvydy+v5VGgqgTIzJpByVe7DACXmaDpuSUsV59tC7+XKzhFJtOSCzaCNIOh9WJxopYa9WmoXVt+cAQMnjh1690WMrqUnYtw+1yHrdfAXjdVdNHWfq4A3MYVF8Io9SMAxstaxdGaO34McetrNIh0qmotVrIvCG6uhM5kxOX5DkBQjZFX/6knVfzeYGJhB/XuuV0bEoUYAZAoOEXGoOvyyIojI0Cm97cS3uwRe7BQ5jTStwnot5NIabLqu0OYNCpdLPtEtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0Yfr1w6EcvFRwsdDtO5BEMMj1dp3/4r8UY8zu5BjQ+Vza28TgAVnSBysIjY?=
 =?us-ascii?Q?k1lDxjFIlYtzgFlg4xBQbxLEY8H75llcWCLCNu1Z/3tRqGsK0KoMXRBnjvWE?=
 =?us-ascii?Q?R2cKdQ1wKgcjlkX+A0M01+QTNfenCJ23awjtZiN/eloN27g+A+SRyAHR25F1?=
 =?us-ascii?Q?E0ZVUdNpJ8LMrJaXWR1xfJELpDnKg/5NIiK4Im/XYJB8zAGYvDlcS4VMiRiZ?=
 =?us-ascii?Q?W46/I4YDz+Z2wNKHNdIemXbqd7wNaUsK1CkZscvh6xfI2Kvjby0ZvIt+GjKw?=
 =?us-ascii?Q?5lCLkoFFJqMV9xeCYtFDjimERE++JsSVgmy17SYGJ7efWbqAyaFckKPbwNaE?=
 =?us-ascii?Q?GxDDMGHhYUT5W7Ieb35mhSP2cgPW016XYBQxfnJF3ve65xmC6eQGqNwWRRJL?=
 =?us-ascii?Q?5d29veJmNNvwMVgLjAxELcd9BYJG+2gYQNWv5Z2RaM2cARrlCAuDFXsNoXlv?=
 =?us-ascii?Q?H3ELNPoEf4pZZ6hpRKdYLtdXaRDjfuviDpM9RmQ/BPtTZEDJnQabsHHNuD6d?=
 =?us-ascii?Q?esmQBXNdtip3R52brTEv9tUYk8GEVOe6E5jZyHXvoKY4JRczjEu3P7cpAqMx?=
 =?us-ascii?Q?w1uUyGsG01SO97fU5MogP96ucWgIJnhvsp2ZEUTKR8YW2kaiBY44KVBIjBag?=
 =?us-ascii?Q?32+lsFwz/zcX8nzeUlG07T6PyTQlpwht8T+BwHnjmAm5tUMRQpzl/BBOdklF?=
 =?us-ascii?Q?82uggvlR3Q6iVbammzrDSGWtAMMwo8tLwG1ucNB1scTOpaf8ns9EoW3PfKz4?=
 =?us-ascii?Q?2ivHzYVr9dnON4x3OERlgQUXFRNA+XdBCTEqZZhlQQnZ1u1ddfpM4mrCyIC1?=
 =?us-ascii?Q?jzzYwg/yj0jPUpvz9o6D9MmeKNb35cQtI19EdbmKsdPoKKgVmzdinFHPWg/R?=
 =?us-ascii?Q?pfrYDilbIVlCupR2+US4F+JEyEqQidgNBjpJVbdQrur8+jnb5Pvcaap0cdXW?=
 =?us-ascii?Q?8lr7sRCFe9XuNPxc2KUCaGeNNd3HENZcVZM7vomd+HxEqpEf4yXdm6jAwQHs?=
 =?us-ascii?Q?InM063My7hoMJPiuoMxpqIo85bDbtXcEAySBQRPyvKmEkeZ/LuSKXqofaVlu?=
 =?us-ascii?Q?TddzrArW3lN2JSVUOyrBw1h9F9FWhPHtx1KTwFId87x7I6/ySCmP/dF0fLUH?=
 =?us-ascii?Q?QZFx01Mbk6KdhcFAGwW8KVh/Se304Ktm7/9+MVw+DDwvoTt8X/AKD7ZPCqgy?=
 =?us-ascii?Q?ZILpOSN1M7uZyDc/0J0xqZntY8aYbBDrYHlEGfoQM7ef+FTBX7Z7x5jNoxrt?=
 =?us-ascii?Q?rhD1MH/Cxb3aLKgp3Fi8pIfkdioVVI2qpt+nonUvmQB/1cOXpwHembfE3ph9?=
 =?us-ascii?Q?Z6j4rn3DC30SGxS3Mcm8/qSltQvQcH+R+Bo8huB33GrPulDnVFHRmplNhBvi?=
 =?us-ascii?Q?1nfWNnQpDtr3mjzZYm/ZXQ0VlEnehdpGTizA/DFpaBv0KVogMQkuwK0rNJUw?=
 =?us-ascii?Q?lHkrsH1xCph4EjqkjGnZGmrrsL3U75TuPcWiiN/dLL+3beGy7VDdE9oBtWTB?=
 =?us-ascii?Q?X3I9OTbB3i5zAQTDzdlr9193Mvc1138rW/wTPvfxESuqf9yPqvKJAgsJpKxN?=
 =?us-ascii?Q?uMdPHT3FKNpoJ7FvRRJ58Wnyyaq6LX1WlNvS1ZJ3gai8IxM4zdQipXZbZnMx?=
 =?us-ascii?Q?olKK1d7F2byLw7Lx9qjM9KBlcdIOeqB5j0DJy+QY9hGb0xUbgqITy5fTqztr?=
 =?us-ascii?Q?Dd/rgcvzbGq+DllzyRTnewagInb8+epI08KphK5fmFQ6ULFgrrqVhjXNfcf4?=
 =?us-ascii?Q?mL+rcMt8YVSNjmfHeGcMx1DAwFsBNnA4BbQk4PTpCvFvA3n9KKCd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f91dba-3c8c-4089-fd1f-08def1c0eb16
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:02.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwZ4IzVXmL1D8ZKV3RhrSUhmqbnDEyd7NRVQWqr+0sNLc5pG+7EX8QlAV4SyEs0wn+kZf9VAqyN+ZXX0K5ENBwSuPJho4tT7RFz1rnfUQuK0MZb208UVfzRP3OChuiyH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651


Hi Mark, all

This is Step2 of "use .auto_selectable_formats" patch-set

o: done
x: this patch-set

	[o] Step1: ASoC: a to b
	[x] Step2: ASoC: codec: ...
	[ ] Step3: ASoC: d to r
	[ ] Step4: ASoC: r to x

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.


Kuninori Morimoto (44):
  ASoC: codecs: 88pm860x: use .auto_selectable_formats
  ASoC: codecs: ad1*: use .auto_selectable_formats
  ASoC: codecs: ab8500: use .auto_selectable_formats
  ASoC: codecs: adau*: use .auto_selectable_formats
  ASoC: codecs: adav80x: use .auto_selectable_formats
  ASoC: codecs: ak4*: use .auto_selectable_formats
  ASoC: codecs: ak5*: use .auto_selectable_formats
  ASoC: codecs: alc56*: use .auto_selectable_formats
  ASoC: codecs: arizona: use .auto_selectable_formats
  ASoC: codecs: cpcap: use .auto_selectable_formats
  ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
  ASoC: codecs: cs35l*: use .auto_selectable_formats
  ASoC: codecs: cs42*: use .auto_selectable_formats
  ASoC: codecs: cs5*: use .auto_selectable_formats
  ASoC: codecs: cx2072x: use .auto_selectable_formats
  ASoC: codecs: da*: use .auto_selectable_formats
  ASoC: codecs: es*: use .auto_selectable_formats
  ASoC: codecs: inno_rk3036: use .auto_selectable_formats
  ASoC: codecs: isabelle: use .auto_selectable_formats
  ASoC: codecs: lm49453: use .auto_selectable_formats
  ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
  ASoC: codecs: madera: use .auto_selectable_formats
  ASoC: codecs: max*: use .auto_selectable_formats
  ASoC: codecs: mc13783: use .auto_selectable_formats
  ASoC: codecs: ml26124: use .auto_selectable_formats
  ASoC: codecs: nau*: use .auto_selectable_formats
  ASoC: codecs: ntp8*: use .auto_selectable_formats
  ASoC: codecs: rk33*: use .auto_selectable_formats
  ASoC: codecs: rtq912*: use .auto_selectable_formats
  ASoC: codecs: rt*: use .auto_selectable_formats
  ASoC: codecs: sgtl5000: use .auto_selectable_formats
  ASoC: codecs: si476x: use .auto_selectable_formats
  ASoC: codecs: sma130*: use .auto_selectable_formats
  ASoC: codecs: src4xxx: use .auto_selectable_formats
  ASoC: codecs: ssm*: use .auto_selectable_formats
  ASoC: codecs: sta*: use .auto_selectable_formats
  ASoC: codecs: tas*: use .auto_selectable_formats
  ASoC: codecs: tfa9879: use .auto_selectable_formats
  ASoC: codecs: tlv320*: use .auto_selectable_formats
  ASoC: codecs: tscs454: use .auto_selectable_formats
  ASoC: codecs: twl4030: use .auto_selectable_formats
  ASoC: codecs: uda13*: use .auto_selectable_formats
  ASoC: codecs: wm*: use .auto_selectable_formats
  ASoC: codecs: zl38060: use .auto_selectable_formats

 sound/soc/codecs/88pm860x-codec.c |  6 ++++++
 sound/soc/codecs/ab8500-codec.c   | 13 +++++++++++++
 sound/soc/codecs/ad1836.c         |  6 ++++++
 sound/soc/codecs/ad193x.c         | 10 ++++++++++
 sound/soc/codecs/adau1372.c       | 12 ++++++++++++
 sound/soc/codecs/adau1373.c       | 12 ++++++++++++
 sound/soc/codecs/adau1701.c       | 11 +++++++++++
 sound/soc/codecs/adau17x1.c       | 13 +++++++++++++
 sound/soc/codecs/adau1977.c       | 13 +++++++++++++
 sound/soc/codecs/adau7118.c       | 12 ++++++++++++
 sound/soc/codecs/adav80x.c        |  8 ++++++++
 sound/soc/codecs/ak4104.c         |  7 +++++++
 sound/soc/codecs/ak4118.c         |  7 +++++++
 sound/soc/codecs/ak4458.c         |  9 +++++++++
 sound/soc/codecs/ak4535.c         |  6 ++++++
 sound/soc/codecs/ak4642.c         |  6 ++++++
 sound/soc/codecs/ak4671.c         |  7 +++++++
 sound/soc/codecs/ak5386.c         |  6 ++++++
 sound/soc/codecs/ak5558.c         |  7 +++++++
 sound/soc/codecs/alc5623.c        | 11 +++++++++++
 sound/soc/codecs/alc5632.c        | 13 +++++++++++++
 sound/soc/codecs/arizona.c        | 12 ++++++++++++
 sound/soc/codecs/cpcap.c          | 15 +++++++++++++++
 sound/soc/codecs/cros_ec_codec.c  |  8 ++++++++
 sound/soc/codecs/cs35l33.c        |  6 ++++++
 sound/soc/codecs/cs35l35.c        |  8 ++++++++
 sound/soc/codecs/cs35l36.c        | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c        | 10 ++++++++++
 sound/soc/codecs/cs35l45.c        | 10 ++++++++++
 sound/soc/codecs/cs35l56.c        | 10 ++++++++++
 sound/soc/codecs/cs40l50-codec.c  |  9 +++++++++
 sound/soc/codecs/cs4234.c         |  9 +++++++++
 sound/soc/codecs/cs4265.c         |  7 +++++++
 sound/soc/codecs/cs4270.c         |  6 ++++++
 sound/soc/codecs/cs4271.c         |  6 ++++++
 sound/soc/codecs/cs42l42.c        |  9 +++++++++
 sound/soc/codecs/cs42l43.c        | 12 ++++++++++++
 sound/soc/codecs/cs42l51.c        |  7 +++++++
 sound/soc/codecs/cs42l52.c        | 13 +++++++++++++
 sound/soc/codecs/cs42l56.c        |  8 ++++++++
 sound/soc/codecs/cs42l73.c        |  7 +++++++
 sound/soc/codecs/cs42l84.c        |  6 ++++++
 sound/soc/codecs/cs42xx8.c        |  8 ++++++++
 sound/soc/codecs/cs43130.c        | 14 ++++++++++++++
 sound/soc/codecs/cs4341.c         |  8 ++++++++
 sound/soc/codecs/cs4349.c         |  7 +++++++
 sound/soc/codecs/cs48l32.c        | 12 ++++++++++++
 sound/soc/codecs/cs530x.c         |  9 +++++++++
 sound/soc/codecs/cs53l30.c        |  8 ++++++++
 sound/soc/codecs/cx2072x.c        | 12 ++++++++++++
 sound/soc/codecs/da7210.c         |  7 +++++++
 sound/soc/codecs/da7218.c         | 12 ++++++++++++
 sound/soc/codecs/da7219.c         | 12 ++++++++++++
 sound/soc/codecs/da732x.c         | 17 +++++++++++++++++
 sound/soc/codecs/da9055.c         |  8 ++++++++
 sound/soc/codecs/es7134.c         |  6 ++++++
 sound/soc/codecs/es7241.c         |  7 +++++++
 sound/soc/codecs/es8311.c         | 18 ++++++++++++++++++
 sound/soc/codecs/es8316.c         |  9 +++++++++
 sound/soc/codecs/es8323.c         | 13 +++++++++++++
 sound/soc/codecs/es8326.c         |  9 +++++++++
 sound/soc/codecs/es8328.c         |  7 +++++++
 sound/soc/codecs/es8375.c         | 12 ++++++++++++
 sound/soc/codecs/es8389.c         |  9 +++++++++
 sound/soc/codecs/inno_rk3036.c    | 12 ++++++++++++
 sound/soc/codecs/isabelle.c       | 13 +++++++++++++
 sound/soc/codecs/lm49453.c        | 15 +++++++++++++++
 sound/soc/codecs/lochnagar-sc.c   |  8 ++++++++
 sound/soc/codecs/madera.c         | 12 ++++++++++++
 sound/soc/codecs/max98088.c       | 12 ++++++++++++
 sound/soc/codecs/max98090.c       | 12 ++++++++++++
 sound/soc/codecs/max98095.c       | 14 ++++++++++++++
 sound/soc/codecs/max98371.c       |  7 +++++++
 sound/soc/codecs/max98373-i2c.c   | 10 ++++++++++
 sound/soc/codecs/max98388.c       | 10 ++++++++++
 sound/soc/codecs/max98390.c       | 10 ++++++++++
 sound/soc/codecs/max98396.c       | 12 ++++++++++++
 sound/soc/codecs/max9850.c        | 11 +++++++++++
 sound/soc/codecs/max98520.c       | 10 ++++++++++
 sound/soc/codecs/max9860.c        | 12 ++++++++++++
 sound/soc/codecs/max9867.c        | 10 ++++++++++
 sound/soc/codecs/max98925.c       |  8 ++++++++
 sound/soc/codecs/max98926.c       |  8 ++++++++
 sound/soc/codecs/max98927.c       | 10 ++++++++++
 sound/soc/codecs/mc13783.c        | 12 ++++++++++++
 sound/soc/codecs/ml26124.c        |  6 ++++++
 sound/soc/codecs/nau8325.c        | 11 +++++++++++
 sound/soc/codecs/nau8540.c        | 11 +++++++++++
 sound/soc/codecs/nau8810.c        | 12 ++++++++++++
 sound/soc/codecs/nau8821.c        | 11 +++++++++++
 sound/soc/codecs/nau8822.c        | 12 ++++++++++++
 sound/soc/codecs/nau8824.c        | 11 +++++++++++
 sound/soc/codecs/nau8825.c        | 11 +++++++++++
 sound/soc/codecs/ntp8835.c        |  7 +++++++
 sound/soc/codecs/ntp8918.c        |  7 +++++++
 sound/soc/codecs/rk3308_codec.c   | 11 +++++++++++
 sound/soc/codecs/rk3328_codec.c   |  9 +++++++++
 sound/soc/codecs/rt1011.c         | 10 ++++++++++
 sound/soc/codecs/rt1015.c         | 10 ++++++++++
 sound/soc/codecs/rt1016.c         | 10 ++++++++++
 sound/soc/codecs/rt1019.c         | 10 ++++++++++
 sound/soc/codecs/rt1305.c         | 10 ++++++++++
 sound/soc/codecs/rt1308.c         | 10 ++++++++++
 sound/soc/codecs/rt1318.c         | 10 ++++++++++
 sound/soc/codecs/rt274.c          |  8 ++++++++
 sound/soc/codecs/rt286.c          |  8 ++++++++
 sound/soc/codecs/rt298.c          |  8 ++++++++
 sound/soc/codecs/rt5514.c         | 12 ++++++++++++
 sound/soc/codecs/rt5616.c         | 10 ++++++++++
 sound/soc/codecs/rt5631.c         | 10 ++++++++++
 sound/soc/codecs/rt5640.c         | 10 ++++++++++
 sound/soc/codecs/rt5645.c         | 10 ++++++++++
 sound/soc/codecs/rt5651.c         | 10 ++++++++++
 sound/soc/codecs/rt5659.c         | 10 ++++++++++
 sound/soc/codecs/rt5660.c         | 10 ++++++++++
 sound/soc/codecs/rt5663.c         | 10 ++++++++++
 sound/soc/codecs/rt5665.c         | 10 ++++++++++
 sound/soc/codecs/rt5668.c         | 14 ++++++++++++++
 sound/soc/codecs/rt5670.c         | 10 ++++++++++
 sound/soc/codecs/rt5677.c         | 10 ++++++++++
 sound/soc/codecs/rt5682.c         | 14 ++++++++++++++
 sound/soc/codecs/rt5682s.c        | 14 ++++++++++++++
 sound/soc/codecs/rt9120.c         |  9 +++++++++
 sound/soc/codecs/rt9123.c         |  9 +++++++++
 sound/soc/codecs/rtq9124.c        |  9 +++++++++
 sound/soc/codecs/rtq9128.c        |  9 +++++++++
 sound/soc/codecs/sgtl5000.c       | 11 +++++++++++
 sound/soc/codecs/si476x.c         | 18 ++++++++++++++++++
 sound/soc/codecs/sma1303.c        | 13 +++++++++++++
 sound/soc/codecs/sma1307.c        | 13 +++++++++++++
 sound/soc/codecs/src4xxx.c        |  8 ++++++++
 sound/soc/codecs/ssm2518.c        | 13 +++++++++++++
 sound/soc/codecs/ssm2602.c        | 13 +++++++++++++
 sound/soc/codecs/ssm3515.c        | 10 ++++++++++
 sound/soc/codecs/ssm4567.c        | 13 +++++++++++++
 sound/soc/codecs/sta32x.c         |  9 +++++++++
 sound/soc/codecs/sta350.c         |  9 +++++++++
 sound/soc/codecs/sta529.c         |  7 +++++++
 sound/soc/codecs/tas2552.c        | 14 ++++++++++++++
 sound/soc/codecs/tas2562.c        | 10 ++++++++++
 sound/soc/codecs/tas2764.c        | 12 ++++++++++++
 sound/soc/codecs/tas2770.c        | 12 ++++++++++++
 sound/soc/codecs/tas2780.c        | 10 ++++++++++
 sound/soc/codecs/tas5086.c        |  7 +++++++
 sound/soc/codecs/tas571x.c        |  7 +++++++
 sound/soc/codecs/tas5720.c        |  9 +++++++++
 sound/soc/codecs/tas6424.c        |  9 +++++++++
 sound/soc/codecs/tfa9879.c        |  9 +++++++++
 sound/soc/codecs/tlv320adc3xxx.c  | 14 ++++++++++++++
 sound/soc/codecs/tlv320adcx140.c  | 12 ++++++++++++
 sound/soc/codecs/tlv320aic23.c    |  9 +++++++++
 sound/soc/codecs/tlv320aic26.c    |  8 ++++++++
 sound/soc/codecs/tlv320aic31xx.c  | 11 +++++++++++
 sound/soc/codecs/tlv320aic32x4.c  |  8 ++++++++
 sound/soc/codecs/tlv320aic3x.c    | 14 ++++++++++++++
 sound/soc/codecs/tlv320dac33.c    |  8 ++++++++
 sound/soc/codecs/tscs454.c        | 15 +++++++++++++++
 sound/soc/codecs/twl4030.c        | 12 ++++++++++++
 sound/soc/codecs/uda1334.c        |  6 ++++++
 sound/soc/codecs/uda1342.c        |  7 +++++++
 sound/soc/codecs/uda1380.c        | 11 +++++++++++
 sound/soc/codecs/wm2200.c         | 10 ++++++++++
 sound/soc/codecs/wm5100.c         | 10 ++++++++++
 sound/soc/codecs/wm8350.c         | 13 +++++++++++++
 sound/soc/codecs/wm8400.c         |  9 +++++++++
 sound/soc/codecs/wm8510.c         | 12 ++++++++++++
 sound/soc/codecs/wm8523.c         | 13 +++++++++++++
 sound/soc/codecs/wm8524.c         |  6 ++++++
 sound/soc/codecs/wm8580.c         | 15 +++++++++++++++
 sound/soc/codecs/wm8711.c         | 13 +++++++++++++
 sound/soc/codecs/wm8728.c         |  9 +++++++++
 sound/soc/codecs/wm8731.c         | 13 +++++++++++++
 sound/soc/codecs/wm8737.c         | 11 +++++++++++
 sound/soc/codecs/wm8741.c         | 13 +++++++++++++
 sound/soc/codecs/wm8750.c         | 13 +++++++++++++
 sound/soc/codecs/wm8753.c         | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8770.c         | 11 +++++++++++
 sound/soc/codecs/wm8776.c         | 13 +++++++++++++
 sound/soc/codecs/wm8804.c         | 15 ++++++++++++++-
 sound/soc/codecs/wm8900.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8903.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8904.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8940.c         | 13 +++++++++++++
 sound/soc/codecs/wm8955.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8960.c         | 13 +++++++++++++
 sound/soc/codecs/wm8961.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8962.c         | 13 +++++++++++++
 sound/soc/codecs/wm8971.c         | 13 +++++++++++++
 sound/soc/codecs/wm8974.c         | 12 ++++++++++++
 sound/soc/codecs/wm8978.c         | 12 ++++++++++++
 sound/soc/codecs/wm8983.c         | 12 ++++++++++++
 sound/soc/codecs/wm8985.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8988.c         | 13 +++++++++++++
 sound/soc/codecs/wm8990.c         |  9 +++++++++
 sound/soc/codecs/wm8991.c         |  9 +++++++++
 sound/soc/codecs/wm8993.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8994.c         | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8995.c         | 20 ++++++++++++++++++++
 sound/soc/codecs/wm8996.c         | 12 ++++++++++++
 sound/soc/codecs/wm9081.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm9713.c         | 13 +++++++++++++
 sound/soc/codecs/zl38060.c        |  6 ++++++
 202 files changed, 2173 insertions(+), 1 deletion(-)

-- 
2.53.0

