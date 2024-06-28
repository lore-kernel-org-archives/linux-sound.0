Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2042.outbound.protection.outlook.com [40.107.113.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82CA38;
	Fri, 28 Jun 2024 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719533605; cv=fail; b=MkLwbMojrJ4j3vuWpHylDH9drx8IGNs6peLGSKeZaKTvJraGdVppFfAOfbfxDNBL9a4VJlW3iAhjuQ+kOI78l1rawcRe9Z+CrLOV5zaFjqIdEoDcucTBrHyetVxFyd1wvy6dxzqlCaVBtrDTDwmsuB/9O88fgkeCCDWnPDCGsqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719533605; c=relaxed/simple;
	bh=8O2FGimlgNJvaWe4kAsIXR8pFIZh3locyRXA3j44x0A=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=IenpQ/IlMjnRFPjvtjgxrKURtXVDgrLAIIVCXRE6VR6YioU8b6gCKTV4o7IQsLyrJdamCYNJDOXHZ1DfyOzesAkryOe1WaFXzzbJcIoR46GH1DGL2Qe0xVPg3fNjBhgbEg96aVgudCbzaqBbsRS1ecwq+XNsYSMQh4zN8Mbsp2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BUuYU+Cv; arc=fail smtp.client-ip=40.107.113.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BUuYU+Cv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxwAmWnYPzxyTtTWFQwYiviws9DV64chpUrjoErggWpLnzTVgrQPESAGqX2cg9PfZvHGNvG+8lxp2qJHdmMtEilYkCvOGx+9TTL09ohLxdJc9HR2Or8r3T4qSHGWPPiMaihNu+gJFEC2lI2kuD19V5H7HLb9uARry07D7em+Y5dmbsScgPKvlYmw4gtT9XhIUXYlRsoE4Ylg6MGR/7HozhmbBXJMoIDyc/zfLaGuC+P6TuJpNVw4A/+zeXZVhXpEe3uJ88CdGwJbpSL1EujcfyQSBPLHC+KIDYyx75O+ozgXUSJHZvp0b0Evi8c8E3pxsFaPhDF+HXcXre4WftSeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxz+Ru9jUqXO/qxtXEbePrLSWeGR/JlZbKcKVX0lof0=;
 b=DfI2lo8JNgg9pHzoykE9Ia9tpMEX+4mdcqWGZd+ztr52hStdMVzvuL2uPkophd4mrU05LLj5fIa9T91qR7ROQ7iELDyQ4gDoTyxgf9uv7AcvFGNXMXcICR4f7tzyih/0CfIQqvi1WtkBCmTxtUBWfy8Z31I1Oy/zLGdcq6MhBENd32JOHgXgx8hA80gcDVqK8Afl4xbWOLWF0z8OJKrURm/ajBt2TCxuMQFPL1dNytQLiMFfd1J0Yez6U9hwIavgYBaVCbkj3ZWXlD2v5d0EcQ4Kzgthtbv6pfnBMGFy51RhfVG64bZ7czBGwfwpPyyg8/Fe7i00MOorRnexSL/VIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxz+Ru9jUqXO/qxtXEbePrLSWeGR/JlZbKcKVX0lof0=;
 b=BUuYU+Cvd2PZzFOXgChf64kOc7+kvmhHgWnKwy4kLR1cmxfs00/MUv87JG5gzdbQvbCxzsX3doArUbrD+rPcmA/fhYK4IJqGvWeHS4a1ulDo8G+99D+bPp1nZemmuiD02gbVrOvGFSe8ggOGFkzpDRr+gY1di0H7CXlBJfEafQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9386.jpnprd01.prod.outlook.com
 (2603:1096:400:196::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 00:13:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:13:19 +0000
Message-ID: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/2] ASoC: simple-audio-mux: add state-labels
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:13:18 +0000
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: 46472191-4769-43e1-0de1-08dc97071d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/kTTrjy9NOILhSmFhz2X+icsIXI6ikkkFWX7jGPHLodAbyBJs0tAOFl5CEv3?=
 =?us-ascii?Q?V7Na7TyrcXF0j9h6B9sqcoNaPi34al7HsvG0h8pnxwRjv1PvBlQhZAXnIxlZ?=
 =?us-ascii?Q?Knaj1exTHMHTqu3k0Qi/TMlJcqGlFvoK8IBEyCIH3Q0a+FOGsfp6tFd8uCZT?=
 =?us-ascii?Q?RDWLGeGtaTX267o4tXx7nCP7BhIpLMYQucv7MuVuKJFsyrA82NxbopnTVx3l?=
 =?us-ascii?Q?mShsbN+xBJS/6PqHUVm0bCwcO4EwfHaF8brae9giY8cdgIBv57EUv4vdP1Wm?=
 =?us-ascii?Q?rWGLyORB8TsFSKrUNGql7fAeo8w3aqgZWxvmYbkimqSZdBbXKgDNbf6UFbcQ?=
 =?us-ascii?Q?ayE6rcbbmIs4vuaRLAhqTRHogsJtYHiS94DcewhCJeaNh/AstksSNJ6OcXr0?=
 =?us-ascii?Q?5hy/vzd+fpJ3ssKklDb9u0N9HG/Ur+HF/ElhzlxFIDakDpnfZLI643LJc9li?=
 =?us-ascii?Q?SVe3NLJfCVSMgIfKRIctlCchueehFfO1Ni63yAq/bwhnlzKx6lOsy8LIUxaq?=
 =?us-ascii?Q?FXmKao4w0uWQ2qV+VACogMpx/6jpISovmDhw7Py+nyuF4NvvKpQNW3RHsqte?=
 =?us-ascii?Q?YX8L1WUlI6hUtXnzqjX/Y/BYv6Hm04Dy4qrW0js3xggnihJUmg+ufpvwMESN?=
 =?us-ascii?Q?E6IY0OiV8k10rAkbmXAiiYKEnczp0SeebjjQ0apjoP96NmDoTWcRiOLfViGD?=
 =?us-ascii?Q?bS6Ny06SuSzY6LqoP4+C4qT0M7bOxc3NSjZpIzHFXgp/7TnNaSRgdOwLc9Yf?=
 =?us-ascii?Q?MLU5a/epUXNKmIgcS5kzUIMlq9Pmdt1k9awRj2VUjcuTRt8HSrZpyltuApGC?=
 =?us-ascii?Q?qzFMgSqrUM5f8AJVzsCM82EBmBqBedO/WJ1i+juYswYEU4eQQ8XVonRIKyjV?=
 =?us-ascii?Q?p4rqX1r8mWhCJeBa6BK7cqekFh2pS7WUa5ud0v898tjFVBGGpWmcqjSbzKfG?=
 =?us-ascii?Q?4+i5Xz07PDasm8fVK+g1LC9r2b71P8Es6DL8eTqj9Nb01ARW7M4L0/NYRFrG?=
 =?us-ascii?Q?xxrRjDb01ewb8JJAca43gA9SlsDMGx5eyy47amYkjY31Kzf0HcDoy3hysdLS?=
 =?us-ascii?Q?GDX71YWmUcMvNXUZH1ZbmHXd7Nih7R3Z8+9+LWo2CVANNRnjEds9B9qzpGjK?=
 =?us-ascii?Q?RpECFMI59zEgQvUzbhfa9LmLsp8SrPwfF9djzzA45hxhyUIUc5BcUarYeDIR?=
 =?us-ascii?Q?WUCAvNaSH2vAffp/OTQuNdJ1OgAA9R8kY9tAqZ51CJEkWUCWM4uctLTzVzMI?=
 =?us-ascii?Q?xGb600CWEd51rIueire+PzeksO0GqW+7G5+73Mgdj07l3sqX+Va3h46+pLfZ?=
 =?us-ascii?Q?hd+Q1Poo4C4+YWe3/1X8t4/w/7cYq/4tbsVODM5z/zI+3XB27rl3THyDfKCb?=
 =?us-ascii?Q?XOuz1zbMkKCGeI4FU8aMRJsS31z2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EB3gFaeGzIimRqTrGZSUisrGOG2cU+QoSMfBgU1SE+wzsfZTYQWDyAVbJ0ZM?=
 =?us-ascii?Q?41Qwb2Rt49YJV6kzlzrg4K/8ELSz4kCNrmT0P3M+FTdb5b0A68htkkL7tJsU?=
 =?us-ascii?Q?YxAF6NPQwE0z6aKWLIzhVPxF060347WpaV+XNpG0Mg59uHwvn1SUbqPMaiQN?=
 =?us-ascii?Q?PzLl5MZUlNdRTcFKXuDR283/0th/oHea9WrF+v7xtI8Xwmb6RjOn9OWVi7t6?=
 =?us-ascii?Q?cXU26qDLPyWny6TN+aJmYOkE83o5lfrC5nKeJZcqX6c/hZwALDUJiCFxumJX?=
 =?us-ascii?Q?rDBR+Wq6X+ubSS2ifw5ur2Umc8GSoCqGu0BGKiSJTPDJEyEc04kaWtMNJyL7?=
 =?us-ascii?Q?rdPLFeOHrXN5RzWnE8wMwb3OX3kdawAONuC52U9ugWOWrO4nvJkSz3wP8Fxz?=
 =?us-ascii?Q?UZnRdLV/bbBtMPjed4+URa4Vb1uOlgp+tCYzE03OgtqhjhA8TRxrqb3Qgp8R?=
 =?us-ascii?Q?8uPmV4CBiQ/rBB6gUtU4tnD29p6roJgatr17gF2wKUc5vjflnV+Qaq7RM2Ej?=
 =?us-ascii?Q?mecoSSxpPyRFWKnsH+PTDbD1PcjNaH/R9FMgJyqYOEnbXSCUXEXBUu0PZDwb?=
 =?us-ascii?Q?VPy0QBs3Id9uH4HcuuOS+497klWYfncOL0nZlOCID4AfKB2RYaTGgvKpQLl0?=
 =?us-ascii?Q?eFyoOoqZVf6BQg0pjBsU1PRDTlje1+0stmB7TVe9iOLbi3MLR4gOBU7qdBlM?=
 =?us-ascii?Q?0rhh/axwuj/s36FTEYbJEA+phChdyX/6cmarbRTzQO2FWEXuQ5SfVCqtYf3W?=
 =?us-ascii?Q?g8ezCB8FtfLyz9DIs55b8kCFm1cnKYtPOkZ46tO082vP6hCyattOeIBhAuvU?=
 =?us-ascii?Q?VmzO79dVBAEFvW7Ro8A3Wgdag+O8DSEcBjRMeoFX/l4liZFS5JoDM9Nqalla?=
 =?us-ascii?Q?3mRx55DdsSTWn9M+Hwsc8Cv6KvoTmsqZVG4miQ6qGkRmcLdKKP4CLciSnDGM?=
 =?us-ascii?Q?mv9LqeCP0e3rhGsZ1lRKBATWHwFd2QwEZG9ZSjvKzUNT4awr578pqVBsqw3n?=
 =?us-ascii?Q?nvqkPtKqjfV6OEPpSlyig+NJT6m+YwZ6He+HALuoQ1mtIuMqWoGQ72ZyVFSG?=
 =?us-ascii?Q?rvY/KrOmxG/hGVo7FqgT+tOeZ2ySgj043fU9UXarDAmhk6bJYyvnCGrSy3Fz?=
 =?us-ascii?Q?tHpHJCgw7K1nF7GhuxSX0SulCLGvV3UlpQu8qYaPn7lcxmNgLkYhQ17sVraD?=
 =?us-ascii?Q?UU60UTf95cHDS8rtbtbzXsMFZHNoSbeK4nEz5luV2UwZp31mwKyJFc1JNgIS?=
 =?us-ascii?Q?87Mugn4m357BgRJ22f4d7Wvm272cm23Clg0JLj74eqEKRwvte9878dzX1cFc?=
 =?us-ascii?Q?EJAgtijZk18XzXQEsEcC/lJqgSCYDfIzm2blZQT+sT815B3/70dh6nVh1cYm?=
 =?us-ascii?Q?THSBWZ0scM8QM551GQRmQ/Nd0SxDEm7UeLc5O3XnTmJgIcpUjjmiwGNR9/GV?=
 =?us-ascii?Q?WCl6MGfUIsIfMU3rc+gG7cCXkhjiAc0JX13EEoiRB91fFL1jMoo/Z2Go37jl?=
 =?us-ascii?Q?SfQweIzo8yxl4ZSyTaGC2hbQzPHVUmkMB0HKi8t8dfmeH+KF6mHH88WL8/M4?=
 =?us-ascii?Q?Gwycr9G7scKv+uV1xvQOgRGHpSgUllBZRCinofVIVK5zlLxaSJGLAVlCWEjs?=
 =?us-ascii?Q?l3Kw2zyi9pe3y/xXKkw7kHM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46472191-4769-43e1-0de1-08dc97071d1d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:13:19.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcD52CK6O12zake1SzVdf4Ku/wk7lXqJD1kZUbwTWsYNizTV/e0dG9jnILAwWDSxYs66JgBcqIyNeOBv3Mwp1feTkS3541mSHOeZPgof4OEOyeS4wxXR7sBe5V/SnjlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9386


Hi Mark

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would work,
but might be not user friendly in some case, for example in case of system
hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state names.

Original
	> amixer set "MUX" "Input 1"
	> amixer set "MUX" "Input 2"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
=>		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"
	> amixer set "MUX" "Label_B"

v1 -> v2
	- update git-log explanation
	- update property description
	- change property name "mux-names" -> "state-labels"

Link: https://lore.kernel.org/r/87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (2):
  ASoC: simple-audio-mux: enable to select MUX names
  ASoC: dt-bindings: simple-audio-mux: add mux-names property

 .../bindings/sound/simple-audio-mux.yaml      |  4 ++
 sound/soc/codecs/simple-mux.c                 | 55 ++++++++++++++-----
 2 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.43.0

