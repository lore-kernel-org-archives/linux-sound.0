Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A32CCC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783902408; cv=fail; b=bB1n9nLBPl5av5HS7l16Vlolf0NLxbOpwZ7AZZY9iv9OMWpks1NLesPsgBaxUckh9bQlrACYp95PjxqOt0DvaKRfGh23YjiBB3lQOhZuMFmRtpa//xiUa99kUUQcvjb2obQfqD5X0xXTxnrI5bD3SGkISMa+7FJafnobbzkEXVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783902408; c=relaxed/simple;
	bh=UX25C2mSnZwRXfl7fN7nld819/MxMYsUfLmFGaIhmug=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=g/eLSfXYBNyItxACPaQSmRh8zt4oYkn5bm9SgzHk3klmwLm69mH+onmUkR4MZQFMyIL/EDFVB+mTu0w3KQFh8t86g8Rs1W+5UvRntNy3L9Gu2/2T7c3h/cbWXRQCyeLeDbOvOnK5OOVwNMtfaH4YBMobIXkHzEW8wVT2YZS71g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=depDDQOf; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="depDDQOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yz/SNgv22goVNH7uARkUHni8WXk4JDWcc0dpLOlV2UbkFI4nD2EI43ZGwZ3JgaoCaqx+uWMBtx0CmgwuM8oddenaIea12naHhdlEPcSoTCap2+wRB5u+2/SNxjYuUttTxeXv8uhe8oDrFojflrlGrhiM+aQvl9ZZwQWgmHgbKfX3HcUF2uAoq1GI54fDf7smMQ+//9pwBxZiaKJj4hA4ixeeyi/UVF0LBcoiD/eSJMfSm/dxvMtDVFb+cd7QmBF7zZj1fXfjNrmCLzbcsdK9FU4y6NDXLoEs8E2R7ICrgA1YwHhwSygNouUmmJiGRtE800nZFcE8j89yMCeONaQGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suuIWoJhuOTZLxhxrLbikx+fCUKarHJtG0L8H7XrGn8=;
 b=qyKedMl8f/hqppHlUSdxT2PvfaTgL3VimLwCypumTTVfoGs4eDJXhAt/VA8EziO6yhFFtqm9ETNtFeWNf4GfDe6vitI73toqvs9EH0GRL0R/2WN86pTV9GVmG0cisB6kw1iBI9itMIwpQqz4fJAtOpxnGXasdGwh7xHNnzV5dDW5Cfc6LdFo9lyvYOeFJHU/I0dhgDSJAur9TxYYtgXRYSymfsMEHWv2sNLI+t7rDr+YC91716IjpVZtQQ8Tm2K5wnEROUNruZ+Wz/UVkP/U8OpsZudVoVHW4YNgHxN/jYix1rmPwLCZbsezLDUtX0BMFOdWg5qI094bFXotL90EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suuIWoJhuOTZLxhxrLbikx+fCUKarHJtG0L8H7XrGn8=;
 b=depDDQOfBevdHwKVuYbopxUQFpjE1PubBYTETckngHTJos38Vm0OEJpLoB/E4kLVV/vYgV9qScUvRZbgtcKuQeqaszim0gsPROmu36E3YiD6O8tObDY6qboRT0ZIuzQCYUSvMPhv2p7R1KB6bKUIN4pTCYiLYaW62pQUBGQ7Aac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13304.jpnprd01.prod.outlook.com (2603:1096:604:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 00:26:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:26:39 +0000
Message-ID: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:26:39 +0000
X-ClientProxiedBy: TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13304:EE_
X-MS-Office365-Filtering-Correlation-Id: acfc015d-e7de-4b32-71c3-08dee07567fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	bPH1eUVdCz8w7l7+2nvSuV73Lka4p3rz1zipSsAzrPKeki6egrddSucUKLOqQBUgMMATKyuPr1uMy2lNwahyEmTyU51wnZ1teBxPXJ7kMpGr7n9pq5osMWDKXwmRvFDdoo3jlcskYNVyMjL6KcJYd0fnM0Fgx01qYqvQs/BbAfYFMggZRGsownQqS+IaTQQCUsto9rDW3RtZM+Hfcse6CSTUNBZUHw226BVgyoiaAV3toh/Buy9cmzvUJnBpfsAzFCAw1znqTiak56u0y/Ujbm5MMYblGylRw0klSeJQjBuFPaU85eLM/yatuebAtOGemSH64qqD6ogaGdKmkY2mmXjdd2D7+s9TMozELgWJjRqnq8omkScD1JuzsCgQIHhxnvsHVHQVEkkHr0vjh3qDZQCxmRAVofRW3s6YJaJK7eEYE2wqQeqdBuqeXQtv48IaCf9H8sUjTWk9Gv79GpULVISs8I04mSD1yXk+nU6Nd/oKz2dYIQEjLsGSdv1cOjiiMqt59jawANX5D81vrFDdtCNVaFrpMsos9PUcWv1ROAPWpu2zYbCPu0IF7hDm9mx1K09uTDicj8aL/dXg75LSaVKcc2Utfbh331us8LWrr7rYlrCZ6QbaE+uJPlVLZYjPtnwf8MHD9+L9X1ZkC+30L0qXPauzor+BnR+L5faircVY+relYJyjEgKlrZ/kYWEV+k5xJUqmCIVawS+6qQ0PxHLVRjjntbtR4GbKqM79jF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XhwXWvwmCCWymIMkCSZVMPMCdF70vFsWZ+SZSgxaFvBCqte2VXb7UVb2PCn3?=
 =?us-ascii?Q?rLdaLT9zeUZpvFQT6VRZkD2Zb+eS7wrPV1+l/XGkEIhft9/zFOHyKQeaRpFZ?=
 =?us-ascii?Q?WlRtTgEYSWU2n60YWJYsQCOaPU/9iiTWS7ChuMJv8b9F9zcFZ4j80TYI65zE?=
 =?us-ascii?Q?c9M/1Ko41Czk43Ij6cyEcs5OoaCsUeOT0RX+v8vEczuVj/N/8X0moLEi6Cqf?=
 =?us-ascii?Q?sOPnU2pxv8YnJ8YgY6OEJmsdA1K6iia5kDdTvCajU+MBnMx/vKRWX1phMM48?=
 =?us-ascii?Q?rZrDv1/usD+gURB3Rn85j2k55Ud/mQsOHZ4sGPk+NhREsVyyp9NkagZ56lz9?=
 =?us-ascii?Q?Lzm2dW9b7uzKNg9PJc1dIt/DWatbHlWLNfzZuPOAtSW1QVFgUuAd7BUl3yUC?=
 =?us-ascii?Q?2B31XgiAoQaWHN7eT/f7nT6jYHSWHUUMm8G5DbDq4Y6rdlHEX/mKbkFISFyt?=
 =?us-ascii?Q?1+g/3giUNfAxrdX7V2yLBo7xdebssk7dLNOtPcgJBM3PZ4ISrDDIhlLnytNe?=
 =?us-ascii?Q?IclobrcyhHCnjCuua7W0Q2q5T+ckf9tCiOBiurP0oTZDIgkI6fBj6CXR4XmA?=
 =?us-ascii?Q?JaaOBq4CCmvI/mVH1Z1WA5KUCFmh+CWIDgj+Lqn9EY+Ry8FL/Pu8YosB48k+?=
 =?us-ascii?Q?ZrpYPqT2S4Xg4p670KOkowoMfwsITJT2wYlmpN8wAS2yZVgAQ9kqWmWoM40G?=
 =?us-ascii?Q?LphAahXfpXHJCR1Z0OfI7wbyLYRRZ1dQwfOHmmC/RT5GqabsjYXnNeaT3Xk4?=
 =?us-ascii?Q?CzJ28Tz4n87+z0RldrN22SDRi8qgRTvDRbE2x8SHnrEVsmKoW1zRfpdXuNnx?=
 =?us-ascii?Q?Z6fdNIWj9SsWj688hgWUz4XFJK2xJQs4B0Lv5kQUMbCoEpSXN0jvZ34/vNNb?=
 =?us-ascii?Q?2Be1vvI5glsEUy6VZ3LbPeEoYQF/noJcmYkbHUfxeLkdB/8OjE7M/QCuTed/?=
 =?us-ascii?Q?Nn40+8UDn+LetPVZ75QaVK5bOQUhd2bU4OOQOzviBeeoGs5uncXNujsRbU9G?=
 =?us-ascii?Q?NZMKAWJjL70LpYawTklCYRPtpRxg7kbszg1tDLRLfI2qWj+hJ7u9kdbP98RC?=
 =?us-ascii?Q?NhFpm/Y6jz0M6WpHip6+rOqw8QNHlC3JK+byHnObJM9aUj8JUN3U30IBTs6V?=
 =?us-ascii?Q?8SaPifbXE/uCbDGon/qnUMYdrENbrHMAcQnmBXFVONLbC7x+JbhR6z2HAgl4?=
 =?us-ascii?Q?taP96ffSktPZHY5rqREHKXduw8b5dREbxAm7Q5+sTYT7LffJojMh9wpR5Gwr?=
 =?us-ascii?Q?/PWlz/GD9p+T5sII/NjEnolXa3JElBq7mV5YXKLb0gB27q6T2T7afDuvQvD1?=
 =?us-ascii?Q?/zomwJqSaQBiLao32Qrduj/+wNA/8xx/EPxmtlx1DLZ2k2WuYjNa/sz8gEfm?=
 =?us-ascii?Q?qgvqn4LTUQrb+IgxfGwfHcvpOiFDMKHuAtFDqurDfHV/SHMOU+lyQOT8nccN?=
 =?us-ascii?Q?NjRV29t9LqAlHuF5JNpNDx3QGsKwf1bvqh63tv+jpBiAXKIbm8Sf/rnMeI6L?=
 =?us-ascii?Q?i+Y2woG4bp85gBR+h93dh10Cjlwtv8qX4K1gf/moBkkJRveSiTBvGhoW/1c1?=
 =?us-ascii?Q?nhWVlW/SGiWUTN6rxAKd7jlXUrVLOKhoUj/bZwDrbmRYcR2Vf+GAriHNrCXk?=
 =?us-ascii?Q?YDIEQmP2GR9JjAerdsuNKd22GzqIt0E2CWNLjFHLrPq2qj7AqBPJ6BvrHEF+?=
 =?us-ascii?Q?3vvExZCuGIDWYx1Q0Gguz2wzR0ZsqJEA5AFArN1NzjrMRp9+Zoefy1u7dK7g?=
 =?us-ascii?Q?OfRoXjHpJRjbvB/fXeww8bzEmc2oVhs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfc015d-e7de-4b32-71c3-08dee07567fa
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:26:39.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osM0li6SlVHMeC+EWyS3j55O/aVxuV77EmHERVCYNBgW1cjz4Fr5pIgBOrKfUHpL2hqJ/MqSeavHHNlPnXPBpX6k7YBIIDpkMa5y/7+jd5aKLYOZ0QuBq+tQBlVWk8Vz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13304


Hi Mark, all

This is v2 of "ASoC: use .auto_selectable_formats", but separated into
small blocks. It is Step1, and it will be Step4 in total.

x: this patch-set

	[x] Step1: ASoC: a to b
	[ ] Step2: ASoC: codec: ...
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

Link: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (5):
  ASoC: apple: use .auto_selectable_formats
  ASoC: atmel: use .auto_selectable_formats
  ASoC: au1x: use .auto_selectable_formats
  ASoC: bcm: use .auto_selectable_formats
  ASoC: cirrus: use .auto_selectable_formats

 sound/soc/apple/mca.c           | 10 ++++++++++
 sound/soc/atmel/atmel-i2s.c     |  4 ++++
 sound/soc/atmel/atmel_ssc_dai.c |  7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c  |  9 +++++++++
 sound/soc/atmel/mchp-pdmc.c     |  4 ++++
 sound/soc/au1x/i2sc.c           | 11 +++++++++++
 sound/soc/au1x/psc-i2s.c        | 11 +++++++++++
 sound/soc/bcm/bcm2835-i2s.c     | 13 +++++++++++++
 sound/soc/bcm/cygnus-ssp.c      |  7 +++++++
 sound/soc/cirrus/ep93xx-i2s.c   | 11 +++++++++++
 10 files changed, 87 insertions(+)

-- 
2.53.0

