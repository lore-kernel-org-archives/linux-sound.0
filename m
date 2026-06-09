Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C569F16DEB1
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964558; cv=fail; b=fJtKrGLG0MjvTJM2B+p2aEkIoeSouS6/AkmILcnJXgccqUeJnyjzDezwmPf5xLgLAzVuyFepYbHRKpIGrGXI+Q28gL57rxrxqHpzulhcH5/5Rh9riqBv5pmjdAn8FR5TAGbk3WzCaxzHo4f0pjUs549T877UiVIYeuy1YsunhAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964558; c=relaxed/simple;
	bh=gEJF+AGBDVYGEwNnqdJCF8iLETFQNQ/VxDsTS23sSh8=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=dQNrV5KyrEIoSOErjSa8LzJv3md2qhYNAB5efz3yn4zZ3D0+gu7KkbNLdexxHFFXomrnsTdVvTK/GHhUb7jpPj0x+3UNoW7nTds5m58qugIb22RNCkFm7JOLZ92BJ9+HGYRrsdPiXG/o297OuRtcR3f/ugTHgMoDWbCSymb9M/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VlQgFnwd; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VlQgFnwd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJzak9TzOdFhue+VfkbhX4dL+kYh6ehruL/C6x70VjtU/S3euaf8k9+/7GrE+tw/1rhXItcsL9Y4PwFodsJFDV5SfUeS8eUWoUkXldSu3LENUg53s82y3LVvkC/c73eYEtjYf6UL4nX1uKTPEj4It1CMVBkJBjF0gRKp8MylBYY/PaJh9u9eKOe+TRMvCS1g8uFhQ5StQCRJjSVTK6Pv9s6cf0NEurcZA9LyhR2GUdhEca+MSs0NuKu6Vy8VIsRISEnbS/1U7BoWpK6uT+D/gY09DGg1kg7pboR8YXzxEypaPW0z/xggfJwnGNwtOSIQug5zdR9y16H6oBtmU8uouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7nEiE88maxQNox8i6rpCpGlkibsUPjk2zhvVygkN6E=;
 b=LfpsSHhycLmdHdQlt4tVJsq4vw+oMFGfFGxwFkooFNcsQS4mlz8JRgvNDj1fMeLRrMWf9NhpiXfMQ10fv0zcDlRggVg4QF9MYNVDhN90RLpTK4V9PS44kbgJl18xpE9Tq8KAokC8HSlT/4M/BK4cKbadHRNA45de/iUW7qhOCsog+KCQybocArgIMY6vODjmcdjlT3GjkvJg+ds0uWMbLPqPZCEQnp+YNlwTrS7afPiHE21LzlfW5wopFhvaAuCgwdX+zxXEall5fSbaix+YoKyX6y2wi/QaFDhZm0jSucbiV5xSfEJgu2ZodCdddfYdKC97g2CIrbheHTdqv0+e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7nEiE88maxQNox8i6rpCpGlkibsUPjk2zhvVygkN6E=;
 b=VlQgFnwdGq0L6VwsS3AFNbiUHk+ejCfpajHOYOW4mFxLVYc/YNRWzT/p6diSdGbNrb1tTmY07VKUSjiCm5BeehhLfbxMN+AOjOn9pYWnjtBzGHYT18Ir0ekMAJJEKvLNOYAtTwDKgyWVufLeen+6OlY1AZfHU0wnVdc2NNhZIeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYXPR01MB15665.jpnprd01.prod.outlook.com (2603:1096:405:2a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 00:22:31 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:22:31 +0000
Message-ID: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Herve Codina <herve.codina@bootlin.com>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Sen Wang <sen@ti.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Support Opensource
 <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/9] ASoC: don't use array if single pattern
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:22:31 +0000
X-ClientProxiedBy: OSTP286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:226::10) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYXPR01MB15665:EE_
X-MS-Office365-Filtering-Correlation-Id: 36481f7c-9947-4a3c-7b5f-08dec5bd3242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	k9znydxBROm1yR7sqrme4sSOoN49uPH7QhJHd/SAXhhqvitb3pFX0ZDkbw6kUSjXkhnDHgEyWJvs+zJY44XWonABJ0xvVQQev8KAPEbWXlHEIwOr+rAcdjHrPcO8+BXeJ34FAcovSqPpN9Djoi959UfJoAHidbOmOSOtu1TJfZURSnonQDI2AxVRd/UR2Ft0DoAsU3QS4Dv2wD4x5EHuXZmx4jPP7ug2zVS3EVhVqubQMljvlB0VpoRT1wkPAGXy6+GGaTmCte2z/7CuWOqi9LIe+Bp5miKZC+QT/i9goxwdWZFG0n+YTpLBWcT4M8Pk7xAYhKj7dUT+q9znWhFXWAOhSe/AoTbcf1H1SVlLhY1swG3s91ceAoUjxr6gAk9SupDg8J7RjpiJrpf9YUABtRRYuWujeIlwiXI2KSG+FEoqoxGYXR40aPg6MURB1ssxpiH89fyQeQ9U92MvMINshQJNVhZhn5ZNY7TCl3CXXv4b64N41ZTl85GsnEffJ7YV/U++QHE5OIE/v5M4rQ5Zhb674Ewk2D6rtV2B9bCDFdm9tEuK8aFbGQQHAvo7D67LhAYDdmg5ibBI41Hyvnbl/ttmzvBNs00LXYIn7byTPx+qlsqphBCT19LDCpEu4AyHoQjO9x8c+VbqLgelyVDCnvKLGAiKCFhj+WB3cvqVlUoZxTD+63KlGg1Av/qy9iZYb2AJ9CV50uOX0U5gCfRvlN52Nka5pHkQFzS6CFnYFCvueUrpVnFOZkEuVcr7JUR33ds8lZe17eh9QR4TUVqKnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?040iLuxLoZuH0hChMNKpA8ANrQLbR2Qxyj8Me/59EprRYbdIXp3PbM+4Yrwc?=
 =?us-ascii?Q?9a9BnHvmRTKilG8UhqWmWAPgj72BxVA6ZR8oVQHfFMJoNXVE1jj/JWtQEtrL?=
 =?us-ascii?Q?cuAKtDbBaS7BB8+plBuJRdaevrq5Voj1Z2TmwMHUscw+PBuiZfcmQ+DVMohZ?=
 =?us-ascii?Q?hcsPgBAE1E5pKNoeQ4kvyYglxDoq5HSVY5TYtjOM+9azjN9FRmLol+MBcYQB?=
 =?us-ascii?Q?TRFNsSV/ICvyYTLqigKeyjIW2KTYPjMME2lFQDgw9BAYc5RCeZdh8cpIFIOu?=
 =?us-ascii?Q?86eW7O12+ulITZjk2h7fT9ZzpcNy2pN1cxl0UKTJBcdAdkBvgTDg+Yiib7md?=
 =?us-ascii?Q?a9dGDCn3auGvGjXQeiOM4WwOIBq0CTY1ruzF27aFQhoIkZDEvkPJKxByCjv+?=
 =?us-ascii?Q?iJhZDyFWxuYEHT3tkEGFaIByMBs+2WaTARriN8MLxSpl1OHl7Aw67qWAXCCI?=
 =?us-ascii?Q?4e3vx3dpCihj6KcpZm89ZfFTyKKLne8SEshgHV31wTekXAjrDVy+9ksYyH+F?=
 =?us-ascii?Q?TEH7z15PTqla8mBN1OBBVA52ovdD2pv7mkx1818KE/JGHTukdZrMbCK0KHl8?=
 =?us-ascii?Q?UbV3LiAHRIJjGX9HaRtMQzFq79Xm2XofhXvZyDMHpFOnmY3M9lg224EZT1WA?=
 =?us-ascii?Q?QF/Dr8YdhSqv7beQD/ynk9HMNBrjR/I3KG85vOBjwXsZ10MGYxoevh5WkUIL?=
 =?us-ascii?Q?uX8Sgk1nSmXvTtEF6uIuXKaLg/yurRRh5qs7u4juvX1pzuj/d6smlg3ZZ0k3?=
 =?us-ascii?Q?60zUnDFFwiHvGJ5idHQgt19whjWTQGq+GlEt/EHwC7K+Z3Mv26PQtcHq1VnD?=
 =?us-ascii?Q?P8yuLSG82vTaRGwUIwAfEUi4n06s1a8wQKM7apphpal7VHGh97FNp53XO6GO?=
 =?us-ascii?Q?LqJ8EwXUQi5KXVDMrOEqJCxYh0mzmiDnYotLpukotdkBAyb95ng+8hTz3sFu?=
 =?us-ascii?Q?C8P9zrgkUvtO47e/bPqUwW9cybT9IkyDq7MzCHrBjk52rXEs+mHkx0uZkh7h?=
 =?us-ascii?Q?cNBx2UZoy5SBUCW6mmX40gEEL3T+kIM059/Knc8ot4QuTcxhrquJkH65rPqm?=
 =?us-ascii?Q?lvaxJozw7OJSHCPu37jZmOVWXUuM+h8uOTicQmRj2WMrvtqMtkre674hkXR1?=
 =?us-ascii?Q?E1F2BiOLoU0HORSqg79e3cAFoTFzAaoU40dvK2YH4X+Lb0cvZHJgDymabdYf?=
 =?us-ascii?Q?axDfQCD5tBtocjst69WcVjHDsdigDxUhGb1T1bc830ybfJi58NxpPKayt1q+?=
 =?us-ascii?Q?g/D+yGOSSAkbPipyxIfxy2vh2mpU7DFY6GSfuXmnU/PEqWn9s5dpvN7erHSz?=
 =?us-ascii?Q?AG9DhoDWyaRJ8zlRsRkvX4jXiERUSK1S4r167HrRljbqSKMl7v+iJa195Zb9?=
 =?us-ascii?Q?1Wb5bm+92B8w+/S61dOfmfmBX6EX+3zHarAtBAzHG/yLtbPhNI1kQL6KAxSy?=
 =?us-ascii?Q?UAhJxcguxf7h4CA/VZfREm5UeRv5PC4PekAkR+6J3m9AsrjpUL1MYIRJs6t8?=
 =?us-ascii?Q?c5JrYnNVoOegIC7YGE61ct4oeAx+FNlH9Z7wqCGxhZwe2uW061UBZ+zirLse?=
 =?us-ascii?Q?I4JkoBaK+wvudkWGLctYAqp64AOhQCZS47tyIeAC0Pm2aSKZJ7y56v3DgoUh?=
 =?us-ascii?Q?PUt3gbVq9qusen9MN8H/PMCtAMCt/QZVhnT9IdR7++m1c0AZ3nwDpAKhwIi/?=
 =?us-ascii?Q?hJ/H9gu6bHG54Dbptti0RuWvLJN3WFZP+De14Gqen5HSvuad6jPPtRpzUHpK?=
 =?us-ascii?Q?M5aZVdClvHkTSjI8ZE2m2BLHo4mCaeDeBeNkCeFTYMCCVc1XS2pA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36481f7c-9947-4a3c-7b5f-08dec5bd3242
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:22:31.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9huj6TQCWVwYatAnN0x1h7iVSwa/wDg2JrFDDHUsWT09MLBAWdbRRbHCa/GtPWYtTP4WgJUfX4azrYKNxL1inDl18/E16eQOBB993t0rRvd9Q+nCVALZ9rxWXs8rzvI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15665


Hi Mark, all

I have posted this patch-set as [RFC] and v2 before.
This is v3.

It was too huge patch-set, thus I have separated it into 3 part.
(A)	- Update existing driver which is already using auto format
	- Add auto format support to not-yet used driver
(B)	 - Already got Reivewed-by / Acked-by
(C)	 - No yet reviewed

This is (A).


v2 -> v3
	- pattarn -> pattern

v1 -> v2
	- Separate patch-set into small piece

Link: https://lore.kernel.org/r/87wlw9etne.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com

------- 8< ------- 8< ------- 8< ------- 8< ------- 8< -------

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

But, I noticed that current auto format select method can't handle all cases.
For example, current .auto_selectable_formats is like below

	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|	(x)
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,		(x)

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|	(y)
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,		(y)
	};

It try to find DAI format from (A) first, and next it will use (A | B).
But it can't handle the format if some format were independent.
For example, DSP_x (y) can't use with xB_IF (x), etc.

So, I would like to update the method. New method doesn't use OR.
It try to find DAI format from (a), next it will use (b).

	static u64 xxx_auto_formats[] = {
(a)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
(b)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF,
	};

Switch old method to new method, Current auto select user need to update
.auto_selectable_formats. Fortunately, current few users doesn't have
above limitation. update (A)(B) to (a)(b) style is possible.

	a = A
	b = A | B

I would like to update method, and add .auto_selectable_formats
support on all drivers.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.

And, there haven't been any big problems on .auto_selectable_formats,
because there were few users.
But if all drivers try to use this, it cannot be denied that they may
encounter unknown problems... In such case, "dai-format" can help, though.


Kuninori Morimoto (9):
  ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
  ASoC: codecs: framer-codec: don't use array if single pattern
  ASoC: codecs: idt821034: don't use array if single pattern
  ASoC: codecs: peb2466: don't use array if single pattern
  ASoC: codecs: ak4619: update auto select format
  ASoC: codecs: pcm3168a: update auto select format
  ASoC: renesas: rcar: update auto select format
  ASoC: update auto format selection method
  ASoC: audio-graph-card2: recommend to use auto select DAI format

 include/sound/soc-dai.h               |  15 +-
 sound/soc/codecs/ak4613.c             |   5 -
 sound/soc/codecs/ak4619.c             |   8 +-
 sound/soc/codecs/da7213.c             |   5 -
 sound/soc/codecs/framer-codec.c       |   8 +-
 sound/soc/codecs/idt821034.c          |   9 +-
 sound/soc/codecs/pcm3168a.c           |   8 +-
 sound/soc/codecs/peb2466.c            |   9 +-
 sound/soc/generic/audio-graph-card2.c |  12 ++
 sound/soc/generic/test-component.c    |   7 -
 sound/soc/renesas/fsi.c               |   5 -
 sound/soc/renesas/rcar/core.c         |  12 +-
 sound/soc/renesas/rcar/msiof.c        |   5 -
 sound/soc/soc-core.c                  | 160 +-------------------
 sound/soc/soc-dai.c                   | 207 ++++++++++++++++++++------
 sound/soc/soc-utils.c                 |   7 -
 16 files changed, 201 insertions(+), 281 deletions(-)

-- 
2.53.0

