Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9463A7F40
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152799; cv=fail; b=XJ2HZyzUR782p++6Zpwd5hr0Xj+ZCNKAdmAqPbQCqJkDY7FW+Z93sA1Bbci/VasOFWSz2gnG8rRiDHjT6ZoGGh01w61UPPXKhv+DG/qZOmMG+Nt7Dnj9cmez5rvMCCojLcWPg4BGP4TpL9m5A1neSbw51vwwRMIgW9IH6uCFh64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152799; c=relaxed/simple;
	bh=z1bV/DQeSapULLExDb5KWSyb1un9mejsonylMpB/b6Y=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=H6OXLp2uIZ/qC6PlxskIy1DENtKdAIMYUv0XsjN3XLZbGR/KGHgkBwZ3RRO3/ejG9/IihuD+A90FtPSiLm2/Jnk0TXldInfTukKESX06tXlbdAYxQawak6sGc/M9dFE0rzLcJq/O45ykfXwuoTY75dEOMW7uQP76EXMrElKHwXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PC70lH8s; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PC70lH8s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0kitYKzmQEFZnApr0aAZY0TymwPm/8kPq6I7wux62K7txP5MxpVBLpVC6ptfnvT5EYZ1nzP6Hy8RK/pviKsNfRSjhuo3fsCg8656J5BvNC007yYb92knw3G/PmjHWvXMal+XlQ+/716h9h+J++R6akE4gPiBJTDOpxaczMimICgzCYFmz2FE1gx/rEK/GwhJbGS+Ee38fAtEpolBBI8TtlhI4uUfA4Ireb15b+LAN7PDj/vmQ031pUqXntrZSKeUFZQ/DjUQupLFzsFw8YP57ofX95as/d/D1FpNF4KjGpim+A93yBr9vayDlIZrYUjNSrP63pmX5IdxJz2lgE3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thMWf9q0tt1/WiNbNWoiBb/8agP2OaB87lRXtRkeqVE=;
 b=TAvUyVIWrhbEuhR71PcGiCCx3abaxEKK6y8kF6SmgI9QYd93EUmdVoGNtx0AffE8tEQQBhQvLAUMl8d4zwDb5ZPqVCjy5Ge/0KRKRFcmITqlHFIhM3rZY9eh3CYuipAUPo4hXeu2w6ldVgWfcNJ0VhIvuzP4nU82FOLDSCYj9hoFt1FLuZl/ROGefXYIpLDbTw2rRW7x0QAbEdWxaU7B0uKcIZmM5BGv5gr2NKzQpPZ5W3Z8Z7rRHcEqh3AvNsk/Cpf5JazP+9+b/GXUygDAjmR8oOkUxxz7BztvDUY0feWWlsszMDG6PXG4FXTIKy80GDkL2/UBC5wvOiwlqtqXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thMWf9q0tt1/WiNbNWoiBb/8agP2OaB87lRXtRkeqVE=;
 b=PC70lH8s4DPYNnXQ1JpRGhI1ASp3DpItTFgcj9SFey5avUSxHAbMlyZUsRFZVT5wf2FBJqrSB0PKGqTY+TOfk4nLAuBgJ5dghU0vda8wMQKD1E9jUzFTqo/jColtImBp55fz4V7/PRm4mTTBfxDzlAPrYgXyvs9w+RWKXbMDT+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:06:35 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:06:34 +0000
Message-ID: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v3 00/39] ASoC: codec: use .auto_selectable_formats
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:06:34 +0000
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: acde5d69-fcaa-45b1-20fa-08df071da10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FPdOrPUaJR63KJB305F83WSIWiil4IuHkryfGozkLgV8dT2fqHf4gueLRzc+owXrkHQmLMmEddmur3zH+tQGxhjCiEFWWAQuzJv4fXFhMCDzFw1KA2LEb9GN1/8F4zNaOH1bZ2Bihaz7Ot/wzN2RXVYbA+iwnFpM+qhweCJaTUiU0COsm4Z3NXZ53cVJ9VKS19BgHcn+kmEYZltZ9kVoWAckFU2PUrLiJYT6cOrzZENB22lNgDLOh3CFOsLghsoYQj8zySlB8Dnx0vnrkdH05oOqNICCOFsachX2LdqkFjMdbS7Npj7YP+UIk/+gdyR/0fHcqAIR5mxGhn3Nqb9vbcrbEx64aDRSXWFPt55FwRLYojPSHiDrKkROEcv9TQg52mKNg3YhNKU5SVK8Y8JSIszi2fdi6OCFT2zQBJJX92t9O+szblOn04bOKRoT4wkHZDVKOiNWjDBPEVpBLv5GNWtHWfY3yBRbTk2tKNpK2kuSXM9o9v+BwR9r4PAjo5lu7omaFbjE0oMwXwGgkvNJxy54z2Qyenw9fAFfb9xIoxmQjIMyU93HdLJKNTGwNXq5ifABmdsMc4o9xjuaL6J50AdJSJf3CaK+wnOZGQlCCSbvAemn5jCVdxyscoHsemCLrLQJgGPCSqmKrCUJrqLiC4i7OPdRcKNogFgCjW9sp4iCJMBpw6WB0y4qS0Jw7GxxEAu/LwoCdFz5XVD0Zjt+/IPVjuuFgXzj74mZxac2Ckw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r3qYtB4ELEKWcaN1fMlpvpzhNs88j7w69ehBfBLjmBNAqApT75WyzgMMPG76?=
 =?us-ascii?Q?najyvFpjnvXBdgOAFpOmjkPE5NjKy59c0MUPJuNsd/lpyIAHVhY6LDda/5wU?=
 =?us-ascii?Q?Olj4ehXPv4OkaI2m3GW6pw11OKTS+N5N9quQa2zYzyNyv5PPgic8Yj/Sp3xe?=
 =?us-ascii?Q?t2Mnn3xXGKkeotFc3feIfsiSaqusFqlgDb8Hi3ZL3+0V7T45bRLQvtPl+V+T?=
 =?us-ascii?Q?vYs61xXITVtf6BzP+k/Uq39tEsfs6iXXnvlha3eK/HHvJ1QyQVheudOdxPva?=
 =?us-ascii?Q?Jaaso+rvaboNeUAVXEZpKycPd+io1kHLtuM9VecKhm2x78gApXllAToLEWAU?=
 =?us-ascii?Q?imuqsF/iEseX8wIhJKnh0FyAplYBBXAQAWzqE8ua7y9wZKMzHIrB3lqy5UiD?=
 =?us-ascii?Q?32qj58GoUDykNUp1ckgFRWPFiIPirs4wZKOEASln5ub4ooWbyFOycw/HWtTS?=
 =?us-ascii?Q?TNXLRscUhC5pR+L8vpoPTkqD9rdIDFDYsdYwjZrPUUygwksncwEkUTzIPBfJ?=
 =?us-ascii?Q?egNARziqZjLI6uTnuKk15arde6e0C2iTLGk7gckobF8gf1E43nnKjTqzpZbr?=
 =?us-ascii?Q?jhHGy+9YYU+jzzBDS1yc2pi+/1IINjFkYlhc2zEW+1fb7+y6H7zyzgP4YAgb?=
 =?us-ascii?Q?C6030i1hHfr8WdCbDk0SBG7Q32iY0rrcZUajU9jOBz0srNDNHch4J50SStY8?=
 =?us-ascii?Q?9L9H0WA9Z+1xk0AhEpdj7MzsuLSHFxeKEshDX+bMGpT3AxOtxR+sQYkii7c1?=
 =?us-ascii?Q?JDGMpARfKGsI5YHQP507MY01mYFOdU3vS+bfZQiQSVZ9wYCwWevvcK0m/UcY?=
 =?us-ascii?Q?Fp0z4tfkfb1GqTfTKYYMwO/2dutEOEjIKBVwOpBKSwg3Mmd++0mgGprzKhTQ?=
 =?us-ascii?Q?0vMR3UxUbEPb7v6u1mII6fbtiiSyeEwpZJPdMVqR7jpuop0hdXg83ce9bcqn?=
 =?us-ascii?Q?Rvq7FSIWbVNDV0bsaJGFfAbKohQ0eF2ZZmNVzuxmbeI81L8Ewx+hG5SQq6tv?=
 =?us-ascii?Q?+EhRNC32JZYFKm41bWFq2xAajsP+j56q+uyMFrVtgLn3KX4m4TWyWvD+3Z11?=
 =?us-ascii?Q?SuJgh4M+UOno/pPiPFtEZA6YSuHMYuE2LCtIYJ4tSa0KTimrgiA9Rm5QWsDX?=
 =?us-ascii?Q?Hm2OY8EdoHI3lne8b84IpjoQn3wW2QwwxLMwXuq2s3YTTcwwmwTkpF10P66g?=
 =?us-ascii?Q?1VciG+11E14y1zKV0i6PQVKarXanhOrDCvbUNlJ9/LRJYMH7yBuiYx+BbCrV?=
 =?us-ascii?Q?8bwc/O5I/T0meg+hzpFd9p/goyalHIUuK1sw2aaPBz//yBUFD5sLBzOToRgS?=
 =?us-ascii?Q?uf5I+gTI/KC4vxGaHBHT+f7SE3+J33hkIWgQbdeTa69GAAfowACQmtslsdWI?=
 =?us-ascii?Q?hcSXlA2H2oAhQsFOYP9ifVGUQjFJ4Z6k3kWoc+XLSDbXJrOc+UU2KgOLsiX/?=
 =?us-ascii?Q?k2LKFwv+XRzZTYwyd8kcQvgRyL9daT3dflGBgPXc5rEtYJnmFjmn2RbBOBfA?=
 =?us-ascii?Q?NUYXjI5aSmP1N933/IGhhUEZWzntaGMzeB5GWuqQIZSpRwb15s/wobuBTVX8?=
 =?us-ascii?Q?4hGE0xJT9gIev9JrOWli5YTID7ieyUWt3x6SRBDflhShgn8LkLyQbTc2Tzm5?=
 =?us-ascii?Q?vn/IJdLLmYxOdA06+A7pP7qA1fyprz5oO6WmwyohXB81Ya5A0Nbzunj/rJpD?=
 =?us-ascii?Q?NqpAZhPz6OywmX6UxfzLEjUzyad6Rjo+/+5pd3RHXLYb5aRk0FrYhOr/Oqr3?=
 =?us-ascii?Q?H1jIgu+FPj0+f7Dz9u9dWeFZ5zv8qH+YHf2e9p1bArZcmHQBGVzF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acde5d69-fcaa-45b1-20fa-08df071da10d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:06:34.8310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki6n7Gj0hKasGxnJ/2AuC0TkNJUHMETVdcfVt37Asp3y2zAeWpJR+xBG9C025Ab6BGzSnkljK9F4ypw0b/dkAucrwtwsU8fVHPLN8cz9Q+UJCMYeGBeR5V/mxvzn8tWc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785


Hi Mark, all

This is v3 of Step2 of "use .auto_selectable_formats" patch-set

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

v2 -> v3
	- Tidyup these codecs
	 - arizona
	 - cs48l32
	 - max98090
	 - max9860
	 - si476x
	 - wm8350

v1 -> v2
	- add Acked-by: from Nuno
	- Add Reviewed-by: from Tzung-Bi
	- ASoC: codecs: cs35l*: use .auto_selectable_formats
		- separate fromat for i2s/pdm
	- ASoC: codecs: cs42*: use .auto_selectable_formats
	- ASoC: codecs: max*: use .auto_selectable_formats
		- It has some limitation
		- add NOTE
	- ASoC: codecs: rt*: use .auto_selectable_formats
		- separate fromat for aif1/aif2
		- It has some limitation
		- NOTE
	- ASoC: codecs: wm*: use .auto_selectable_formats
		- It has some limitation
		- Add priority

Link: https://lore.kernel.org/r/87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (39):
  ASoC: codecs: 88pm860x: use .auto_selectable_formats
  ASoC: codecs: ab8500: use .auto_selectable_formats
  ASoC: codecs: adau*: use .auto_selectable_formats
  ASoC: codecs: ak4*: use .auto_selectable_formats
  ASoC: codecs: ak5*: use .auto_selectable_formats
  ASoC: codecs: alc56*: use .auto_selectable_formats
  ASoC: codecs: arizona: use .auto_selectable_formats
  ASoC: codecs: cpcap: use .auto_selectable_formats
  ASoC: codecs: cs35l*: use .auto_selectable_formats
  ASoC: codecs: cs42*: use .auto_selectable_formats
  ASoC: codecs: cs5*: use .auto_selectable_formats
  ASoC: codecs: cx2072x: use .auto_selectable_formats
  ASoC: codecs: da*: use .auto_selectable_formats
  ASoC: codecs: es*: use .auto_selectable_formats
  ASoC: codecs: inno_rk3036: use .auto_selectable_formats
  ASoC: codecs: isabelle: use .auto_selectable_formats
  ASoC: codecs: lm49453: use .auto_selectable_formats
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
 sound/soc/codecs/adau1372.c       | 12 ++++++++++++
 sound/soc/codecs/adau1373.c       | 12 ++++++++++++
 sound/soc/codecs/adau1701.c       | 11 +++++++++++
 sound/soc/codecs/adau17x1.c       | 13 +++++++++++++
 sound/soc/codecs/adau1977.c       | 13 +++++++++++++
 sound/soc/codecs/adau7118.c       | 12 ++++++++++++
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
 sound/soc/codecs/arizona.c        | 23 +++++++++++++++++++++++
 sound/soc/codecs/cpcap.c          | 15 +++++++++++++++
 sound/soc/codecs/cs35l33.c        |  6 ++++++
 sound/soc/codecs/cs35l35.c        |  7 +++++++
 sound/soc/codecs/cs35l36.c        | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c        | 10 ++++++++++
 sound/soc/codecs/cs35l45.c        | 10 ++++++++++
 sound/soc/codecs/cs35l56.c        | 10 ++++++++++
 sound/soc/codecs/cs40l50-codec.c  |  9 +++++++++
 sound/soc/codecs/cs4234.c         |  9 +++++++++
 sound/soc/codecs/cs4265.c         | 12 ++++++++++++
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
 sound/soc/codecs/cs4349.c         | 12 ++++++++++++
 sound/soc/codecs/cs48l32.c        | 23 +++++++++++++++++++++++
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
 sound/soc/codecs/es8311.c         | 17 +++++++++++++++++
 sound/soc/codecs/es8316.c         |  9 +++++++++
 sound/soc/codecs/es8323.c         | 13 +++++++++++++
 sound/soc/codecs/es8326.c         |  9 +++++++++
 sound/soc/codecs/es8328.c         |  7 +++++++
 sound/soc/codecs/es8375.c         | 12 ++++++++++++
 sound/soc/codecs/es8389.c         |  9 +++++++++
 sound/soc/codecs/inno_rk3036.c    | 12 ++++++++++++
 sound/soc/codecs/isabelle.c       | 13 +++++++++++++
 sound/soc/codecs/lm49453.c        | 15 +++++++++++++++
 sound/soc/codecs/max98088.c       | 12 ++++++++++++
 sound/soc/codecs/max98090.c       | 25 +++++++++++++++++++++++++
 sound/soc/codecs/max98095.c       | 14 ++++++++++++++
 sound/soc/codecs/max98371.c       |  7 +++++++
 sound/soc/codecs/max98373-i2c.c   | 10 ++++++++++
 sound/soc/codecs/max98388.c       | 10 ++++++++++
 sound/soc/codecs/max98390.c       | 10 ++++++++++
 sound/soc/codecs/max98396.c       | 12 ++++++++++++
 sound/soc/codecs/max9850.c        | 11 +++++++++++
 sound/soc/codecs/max98520.c       | 10 ++++++++++
 sound/soc/codecs/max9860.c        | 23 +++++++++++++++++++++++
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
 sound/soc/codecs/rt5668.c         | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5670.c         | 10 ++++++++++
 sound/soc/codecs/rt5677.c         | 10 ++++++++++
 sound/soc/codecs/rt5682.c         | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5682s.c        | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt9120.c         |  9 +++++++++
 sound/soc/codecs/rt9123.c         | 13 +++++++++++++
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
 sound/soc/codecs/wm8350.c         | 24 ++++++++++++++++++++++++
 sound/soc/codecs/wm8400.c         |  9 +++++++++
 sound/soc/codecs/wm8510.c         | 12 ++++++++++++
 sound/soc/codecs/wm8523.c         | 13 +++++++++++++
 sound/soc/codecs/wm8524.c         |  6 ++++++
 sound/soc/codecs/wm8580.c         | 20 ++++++++++++++++++++
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
 sound/soc/codecs/wm8962.c         | 18 ++++++++++++++++++
 sound/soc/codecs/wm8971.c         | 13 +++++++++++++
 sound/soc/codecs/wm8974.c         | 17 +++++++++++++++++
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
 196 files changed, 2229 insertions(+), 1 deletion(-)

-- 
2.53.0

