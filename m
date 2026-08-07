Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB11CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063955; cv=fail; b=Bs3eli+0PgXNm9yvG7MtMuVpq7EPNjdMg7W+9kyvkCW2lEgQUTPMmscXVkJGlvveiyPLG0cLmEzQEAPxNtq8vAoovK34Hb/ymCIgGDQIy0PhyOLt56Hsyszh6aTGB2vR495+PDROccUBMo8voasEaapiKO2hOvmzfmDz+mh/MIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063955; c=relaxed/simple;
	bh=9PxWN7hAKPs0A3FwmN5zpPsfwxtTZwm4fpm2XuVQhww=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=Su/WhFeQmW6uWgsrKdGo/M0dg04ZYwtEOXzt/G9/DK0dvmSRjV+A/5DIFgExeTGcEyDV7DdmKGR+5O5e4hHwZiMEjNFDNOdsbJDaAKpQBeTsEDSSEALiFdHi/mdkH4XIczPEinv1QjAZ6o3prRvg3gW7vqKC07oHC/8VQWhRAtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=da2NqV+J; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="da2NqV+J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiqMJWIlj/vO8PCgEJCvh1A1z/jZblfhpabrnK7AHiPfsLtRhuKgxsYJK+wUxL5Vjf66Dcec1WPS3fA6LZjLnE4hpjRAf9FqRAn4duEmv5sMQESY5CATwrPgKYpHE31ZWDj0Y9euFEeLQYmiBFNjCFfSbCkc0dwwB6dE4aQb+cw0fkpGZJS/5/fGw/fzv1E3/6gAZlwaSafNy9DgFUm3MZz/J0bb4LBZwRrCd4TO0t0JxQnMylsgYucxhMrjjH5bJsJqscgG0qGG4VcDFrOXZN8gGJBrvxC0ipqBq2tgg9P34s67gEhwEIDme4BhnOg17uNuq7hMhpqu7MVJFBTang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VClFZo0eu+Khdf/7OfwQ9eQ1xLszFgwWFjqr88Gn0+8=;
 b=wnQiqVFJHoYuieODO3dvD98d4BI/yUCIYdsTQUdOKEuKLMLvvAzS7gObYGDhwHNkRreLGIosUgQPj/ghe3RjGZp5YTl5RpUPZBe/pBDvf0Qgdcwbx2vNGBN+SDLDHMPT1J6XQ06ueLmWwI7KH2g1bktve3uGHItoDezB7EOhlU+rbqsUe47BCmXUk9tGmqJYwu1MC0enst+AO3BKkGqCkpTpA5g0L+mupaZq2ZKFvit9utNoXP3pYonwRayhyIGXoPhnqTcQhtuXTlIQGJ3zcjB0Omo+bDHmoxqeTh17iV6hoTJ+Jp8rTmRsukhs34tCWDHF2PUkWNURB6GndUH+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VClFZo0eu+Khdf/7OfwQ9eQ1xLszFgwWFjqr88Gn0+8=;
 b=da2NqV+JpTrsFZNoFDdlY6wfXeMWVXPKphRc5Q8YkLajooWWCub1UwS7WB0V4dVtEBxTSoioBfs7/Fvg6xd3Ah63e1MWQoP1p4ZRmC8DpLrzPHbUehS09E0JWr1Cw2vVuI0FLr8CzN0w097oz6KiODmSbjeo51CSt7CrJwTT39Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:52:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:52:29 +0000
Message-ID: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/44] ASoC: codec: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:52:28 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8f01f8-ce73-4020-44e4-08def41e27df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	q2cbInScDTaxF23ZgBasHJ8nTHigpNXf2+EssXK1JiXRc/m5x5YD1ZbtHV9HJjYWkyohg2h17LvtFbICRYzBvaWEOcZssUIf9SsARJYGnfx8t1eRNDShSOgU1ayUYWpjNmCHjMEk+ZLNV6ASGCXXpjVALDNlKTlbkgED9DuhTvt3SVBwFTMpLkdQSBXuIRkvM/6G7pG0iIx8yEg8t3uoP1DAREhljlHZFqXcjyCRMfMtw0i20bh20a7DDKefte+ZPJkxv8fHK6eGEHeRdT76P/zLHAfJbSPL+UbRQYBrlyyWPOFQRHnt786QzfZuUNUVZBfOKlS51VvrL2ZOIN70Pc6B6+P6aV2MXieqxlTa34N8cyyqk8gQEMj/aT+0xRQJ1Zb4a5k5mzoS0swpd6dJ607wTZo8xXlwPK2le3LJrTnwDqKJF6yuMnqPFx2RbkMTGcY4005V8DizOC6/gZemdLyV1rUcl+GBnYnkbJgyelz86JnShxpBgE7tMwcUK/uRoNIeMFQmekiOBgCPbohfhB/P/0pBqN24zCHY0t3Qbzpvt+0l4+joET5ibQa66HLkrcsHmzZ8oBljpwJevLJNw23gt5nC91ixR4iM8E5UjvQL1L09G6TibayZnPpukD6arbUuKwmPa8jr34D4ftYecH8UG4CH+62+FaUe1MbjDkwt9ufqj6aENbIrYFbBKlqKgGd+8Y5HodVMbQhAzpMzcawXBQIhzsrHr7yz4T2Nv3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kqTVby4MT2CHWWQbdiPfbESwBLY/kIHkSi0YWs9DR6B675jurbVLxfxSMcmx?=
 =?us-ascii?Q?IMaYjTDtp7npTaT0in0CLnDj+CsHCwORE93XoO4ZExxaW9d5uqgwwnpiyuy8?=
 =?us-ascii?Q?W3XdcOwA2E1XMuyiVNdHmYLiXPzyXEoPwuBTr8Np7lnICYNYwekTbttaSjkB?=
 =?us-ascii?Q?9Ej8+oSBJywD1VY+5miUrGFrtBtjddzlMpSKOj2A6/6Dkw9XD+v+Ca8cQYJ+?=
 =?us-ascii?Q?eBYyJdWsicCy6rudQh4jZdSleO9l/ivCHiuFNbh7zf+ZIY6B6r5kbYGHGWoh?=
 =?us-ascii?Q?vt1Q3t2m4iuY2hGRMQlvdJCFargmQBAYZxw44sY62CV6QTtUQHpc3IRSu3ff?=
 =?us-ascii?Q?PI/fghw+QPgzt1gLfd8LcbNU3Z1zE6VhmBtTX7U0JhSbiIuCcVCdcS5F9oVr?=
 =?us-ascii?Q?mv3Wzgdo9hiw95JK+qYyhmxAc6N0YaVaB49fJAH/PCEDDz4Q3PbMgDGmwsPS?=
 =?us-ascii?Q?8rl+w099Ji9WIJRetbMDS4x18TjUQhHCNMMHtMZQJb2Q1ffS19RPcr8n41Vn?=
 =?us-ascii?Q?VvP1a36SG6JjIC8xEkGPupjVBGaZWANzjCBBXxihhy7OOD+vTv1JKnME8NEI?=
 =?us-ascii?Q?jRew6/jYgOPJJqHiyQEZoHyX3wHsyNeoDJVPwo5bwKHUMmO2w+SDpPGiAi5J?=
 =?us-ascii?Q?Zyde4SMJlodZTHbx31Yu+W5jgiG8lvq6YhxsS9LKGZ6bD5cuCOuPzHiRM/Z3?=
 =?us-ascii?Q?q5mWcGm1bNDLqA1wwbZle4CUgLjLASmSRJwzLcPwDOaDIMATxYTnQUkAQp6j?=
 =?us-ascii?Q?CBjNdiE9CK/Nhxd5jjXGuPm+pm5uvv86YkWjc50Aevl1brwbtNbAxlMbALh7?=
 =?us-ascii?Q?S1RGD0XR4Ytg45utkqQw67c19ivki1LWg6lZ/0xlLeTuWR+r2ui2szPsGtmj?=
 =?us-ascii?Q?ckRlI2UEYOoe+EhmxBDIzFmeSV5SYpy4OtFcCEKJQaaAbRxhBo3LNeV7PE4x?=
 =?us-ascii?Q?5KWf6w1sxZDmUhAnbPdAsba/lwdeoJXsRZdYqZLGfH/tjftTxulHvGwl6hfi?=
 =?us-ascii?Q?ZGHXYVYHKQ0+xQRcrSzdsOwutBzroQLjjq+od4jfApSn451QwVZVb4IUxTY8?=
 =?us-ascii?Q?Vm1cvFzkF32TqbXcVFCQBIwxz4t+MYakDU1xsLVEo5ENDjQ40MMhfTtSOcBX?=
 =?us-ascii?Q?s+Sb2m8mAPf4Uti3MqUI9jqSc6mBTJq7d4DZQXGD548GU1DvkGUuMAL+bGkM?=
 =?us-ascii?Q?iOpfItb3Okb3AcoNREQsdj+oevPzU9xyRHnmbDqy/6TDSsUMH1LDxU/2hYIM?=
 =?us-ascii?Q?CeBKIM4Wiw3auqfddx6FavcaYWYGwTKHXEyonnofq349mzNRUjpK3FH4xcwa?=
 =?us-ascii?Q?70GycS17f7kE/d20tMhy2R+NcVADFR/LdLpunp4cacSP24Pdma5F7i6oDi9L?=
 =?us-ascii?Q?OzYqtTfydYcdr8uaPiRN94qmRTXTqD3wtorNnYtJI8SpMI4C9Aghyij3glog?=
 =?us-ascii?Q?fk/cO6AoRP5JUGalBWoWFgrTiBex0qQdxxM1NVwZXJjlbdvXtBgn0NQH2qRu?=
 =?us-ascii?Q?qqb8Wo7T8XDkR5YvMCAKnL+HLUimkNV1Jfn9KYMBobRwg05ZmehmipiBEnes?=
 =?us-ascii?Q?N5mldN0yNAgiKfjkDw/UpMCo4ziCGJ+nlOuH85p7z4aQs4ED2eNKKXTocUYa?=
 =?us-ascii?Q?+3GdPze1C1Mh+bxaVkLqS8dSHQ3AabTOIMGrVx+KREPHl9Z4ZqeiTkseXiyY?=
 =?us-ascii?Q?B5/axFnRO2g7FOEovrn7EIe+xUVAWXwgyiTVa9eUpSJZLDiQ7HiOdntxx5Yq?=
 =?us-ascii?Q?+nnxgmXGORFvHiSXwOVJC9lGi73GZD4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8f01f8-ce73-4020-44e4-08def41e27df
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:52:29.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7XfD3rDENr96kL+hT3cN8yo3fMJA9nBuvTme529cF6gDihGzM9hkrwEYU0aZkTpXWhZnafET6rM9/oVHxFkWgVtHFDzcizEPVWgGeiOUIT2WozY5DSPKc7r1E/z7ujC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460


Hi Mark, all

This is v2 of Step2 of "use .auto_selectable_formats" patch-set

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
 sound/soc/codecs/cs48l32.c        | 16 ++++++++++++++++
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
 sound/soc/codecs/max9860.c        | 16 ++++++++++++++++
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
 sound/soc/codecs/wm8350.c         | 13 +++++++++++++
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
 202 files changed, 2233 insertions(+), 1 deletion(-)

-- 
2.53.0

