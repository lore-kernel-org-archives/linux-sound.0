Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD07EED8
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016739; cv=fail; b=mBSN2cDkLlOTg7/9nUAx9h/HhmUKgrRtOFYCEmowWi+VCpuVj8+71O84HcSGn+knO/Jic321odilcjUBccgm/5C27nviVsUi12EWys5PBLGs/jqSSz1KFlbxzZEQA3Y0C6OYXHo0aEJnVsVgpL2j75c/MHgUgfIivIHdA1jmcak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016739; c=relaxed/simple;
	bh=A6fWXu1kGi5cOKLWFcXsOlSlJ/nxxcJAYclkD2OWf8k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DxjHI2qCmmbBncZL+BMayDCUZyJvzP359tTeO9Cl+kRU8ansVLRrXcKO/Q/bQSCvLXqESVjXzu03R2X+cidcpOblkHF9S6fkW7kvDjMl6EK8j2T0GIqFnFhPBHcyDqfv4wT+kKXf+g4UiXb47si5pYAeVT3z2IKTYtn0WTHRTLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ore1bspF; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ore1bspF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX69hvwzDx1MjxnkPFa9jshCvaek8h+Zkuk2v8IMUNY5d2mIYxNxtSLSzT1KrYxtQuK5vZ595yuXyOHAgILO4lfoXWR7cM8JBe8u+8Lt2gXadGcpdOw6W1GWDaeX0ZI5Rz9sfOm0vxklfsHNrjXv1Mzk+LimkGo4UCU6FPxTq5/K8wCt4l6YZ3haMwut8ThcxwKfAEIlYdIkNZd2cKZL2RTojHVfZxNXKmlaSIP/1GLzoP41WNKpgXHwymYbNRte9q429jHXN9TIhPvknGE6Rajya3AZxa/a3vF4LPrlfAHoI1eXRxkX8SK5ZJ8ReRvxiSSeniygEEV6wey8I+XpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXtrUW/yPTkpQcGd1ljlYa4xiTv46v6YV9sbYLxtGeM=;
 b=J4F7n8YlYrdU8OK9Xw+ryEFvKLe2Ene83ztyvPTvyYUZTdTmMtKhu/bYAZ+vWX6fwG8xaZr5Y7c5EqBu7awRHkFcb3WVUIFY5qOGxV52K4BKqtotsC5XrD6rQf/5P5nf44Kn8FuFtCuZKpsCdK9A0BCKUL1GS9lwbe0UE5R8OUeSMX8tRxiALwTHA3/loci8okfnmj7wXFezm0kM839X3eFFNFZZCKjIRQu03UfyQN9SYiYOWZmx6/rFVvfbHrmFZ9/wn6FURDydK6bzAW8uxh3QzSNFbejeyaMRafmfiVB7z8GXSdoWiBzqkqwBai+62es8V2ryECtCAZvXegNNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXtrUW/yPTkpQcGd1ljlYa4xiTv46v6YV9sbYLxtGeM=;
 b=Ore1bspFjktBaAnTS0+5Olnc/aPXYwTA9UHcpT2l1VGpYqnjqyUN3aotzHBeMZVDFA8wbR+sq2WpWQrFa9CYAzoF6gFTpFu/pfEon35NE26AIJiVefBiNghsVUXGVzh/7xXDSii//uuHmPWP7zop4I1Jud53j3BLDs0bya4UR/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7999.jpnprd01.prod.outlook.com (2603:1096:400:f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Tue, 18 Aug
 2026 01:32:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 01:32:11 +0000
Message-ID: <87y0e4mcx2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 23/44] ASoC: codecs: max*: use .auto_selectable_formats
In-Reply-To: <fda82e76-bbac-49ff-9e0d-c4ae7315aa11@lysator.liu.se>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
	<87fr0uwwb2.wl-kuninori.morimoto.gx@renesas.com>
	<8ea031ca-92af-4b51-9993-c0f34c85bddc@sirena.org.uk>
	<fda82e76-bbac-49ff-9e0d-c4ae7315aa11@lysator.liu.se>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Aug 2026 01:32:10 +0000
X-ClientProxiedBy: TY4P286CA0131.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: df5900e4-93a9-4388-fbbb-08defcc88629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xFuW1eqYFtU9OgRRWW0cUaaJp1IvfO1OWZd8yF62my+ydcuzjiGX7ipyS7aQKZKK8rC6B/9VGKW7u+98OvjQB5WMpGJqcw7AH7bBpaSJ+ndEm8z63bLMCkRkdtXz0yJLiTXI+ayvIJnDUg5MYSFsu0v+w3w2Tzh9+qdZptNCGJLI5V1qy7KIdV7nBveQ6f+F40QoqBDPNgJ42yaZbbDFF7v7gq6mCFd+zRrCQRz+VA3tmoOSzTCCvOcYZbOrK3mBzHi99nz4lNBCwphJE2qDSDOwf6pWr7F2LZAbgR8xay6zwcjrSWUoYVuvC5vFsfYg1R2Thd8dJQPgILPshOuc3mSrqpxyS5so/B/CGoC8XJl0YMHZBwP6APvO7n1TJ1fBaiW/BiWo3MPTuGYf4hoWqqrueX1QFu89M0c9ROEzXsEuCuocxtZWT6ThNBvOLKDqkGdsFqZU593v24JH4Ubm96uN7K+yUJXdv7W69i+t51fDGAqG8KEVzCl62zOqjks+RqgRd+ywL/HXMAVXDYo61IYx+M6MWN7tSkl65ZM8VE02iz9e/zArheFYqKd+bYqiRujd4IkOFk/69iZku4LG/q5VXKZTiG3T0HdT8gzf5bBA/OYkjTL6rTU1DJdQdiGOPCJ9WZAfVa2axWB30xD1J14ltfzUplKpvddctDpU151jb/220vO6uhkkLaQRWWgfNKc77Uj5KIzjEdM9tW+fcLTZGsiZMylMpoNqOTMoIsg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O0faMpmFBWDDJI+v3lgImOTPX2i+wjOM7bzVskN+ToP93f6H0BpT/VFtcjx4?=
 =?us-ascii?Q?Jl6jWTEFOev/r+pOqyPB18A7Dk7Zw8QxgRUf4tdOf0LGXLJf+77eJPDPvKaN?=
 =?us-ascii?Q?t6HL0JZ0xSfAYQZsoEWiG9fsRQxfzbd6V8gxjgGaFLjVzjrGsHAUOru7S15f?=
 =?us-ascii?Q?chSmP12YmYnb9iq+3+FqSVi8LWDdUKUeBtarTX0htPUVbeGTzNjpAlOg21lA?=
 =?us-ascii?Q?Bn9jX4sW/2XVTLQlz82S46s784fNUzrYVLfOJ2j50TzsoNIEXU+ZoVoo6o4f?=
 =?us-ascii?Q?RwoFrIO/AcUon32p8EngDCedHr/++hSsGz+y4rSJezX+Pa2Sys+eskdUXgmU?=
 =?us-ascii?Q?hk47wRoyMDZ9Oso18ZgmhUhrYUvkkquGCod+W2wKOFpDDkklN26xT1jUoitJ?=
 =?us-ascii?Q?KIBkzU3cCho2y+2q2mSz4y41pFsbsyyQ4xIWzFkAot+rfg+V4Ks7tbr0Wo8e?=
 =?us-ascii?Q?rMA9Y+8CEZLyW4/Ke85AlJTEIhz/E090mr05azOUfouliOrcJpuN9BrKFcRs?=
 =?us-ascii?Q?zTwGfRDTZ1QUdCgL0ox5ocZK4zWvG+Q0boshjEyvy8NiBeEMdl8botixZgvR?=
 =?us-ascii?Q?i2vkC0HZEhbCQGoJH2UUxShiLyeL7YW+xqZO0Bhxn+3MZMVoZVysPasqphdI?=
 =?us-ascii?Q?I1scJ5s36PznRvMH+XNAq/dOMzwxYtpnBWIU9j5hLlZ581+lS2bKrHPf7XPW?=
 =?us-ascii?Q?bYH0q/2EfNbFDC+NBIy6kgKLA0nMZEfhioqaKgKlexDhnpeG3UhuhP1nwnNN?=
 =?us-ascii?Q?it+EYZWCcivxWse6RcGTfuVvQwItTVYj+8kQ2MfQfyYN4vIqGlEBIFmMTwdC?=
 =?us-ascii?Q?xeXqtiZ9QT7UMwG91q3y1z7fg4Dlt1j1vxPywBK4ZssJz38iBluCcZ8TSN48?=
 =?us-ascii?Q?W9UecJ+WUZqHRjHCBLg+k7p8PWQUQfvdUesqrAo2tNWimw75imh5XGOgkdxN?=
 =?us-ascii?Q?MkKLgRiKtT51TBm7hwvGIgZEgJtY+DhJttXSiv7SOUZ5T2lYLswbi88ulRaK?=
 =?us-ascii?Q?cLy9Ixf2at3AtX7/arAe+Y2/zvlweZPBbVsoH9CGu7+CJRLwUYWyHSzFiM4C?=
 =?us-ascii?Q?Nwa6iVHMnYtQ1hhNh8u7ocGCy5J+sCEY8FwPZY7tuw/yNXiO5QCpkeeqEVmG?=
 =?us-ascii?Q?5kRCVyjAY+vCtYL5SmMvL9Krw0+vDEsb/94WqW8F21mZgYnu+y4zrzQ13ALA?=
 =?us-ascii?Q?xfrKZkSO+DbmLQSq+b4jUOv6sZFEOLL+ANg2IVeoWSI0n/mcM7spI2Bb9GdL?=
 =?us-ascii?Q?lPAa2oNyn18IULfcmNFYKb+wjdlXxElPMuvPYaJtPaOmPVklRbFdf5QaHBw4?=
 =?us-ascii?Q?vmMoDT0N0LyfLuw+xPTeH4X8Hfu1awk2iSnTFc9LiZrbk/02vgFmTnejlEer?=
 =?us-ascii?Q?7hq4J2VdByMFFhRXR+VHU1iw/4HAiPqo/wpTHog1wH99BMFqUr5xyl1nQ1tP?=
 =?us-ascii?Q?X2q7puFrHiSRM7iAmPOLXEd4zfJb+bvN2r5hYI7jmB73QE7JNDlbmHjSm0h3?=
 =?us-ascii?Q?TbitNcSZB7JkxWFa76FhnbQ5X21A39Zn766b0b8To+4YiG6z9dHt6QLK6Hjf?=
 =?us-ascii?Q?LrGTlxJs1FGM8VNeenQraP0B4h/0gCuPiJQNkXcXNjvNXc5uFsuGEDWsy4DW?=
 =?us-ascii?Q?4O/d2hkwEyIcBUhfUl2+lfza6smzcALF8HxV1KEDavf8d1DRtnQbPZWW1uDB?=
 =?us-ascii?Q?XuptS4P4KTnQlo1rtxhVZK1VDzEqR5/7mQgLQuzdsTwBh3/NtvVOUkpuwQ+x?=
 =?us-ascii?Q?XKrc4q3K1c2c0/RkGetNJcN3Grcdz7Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5900e4-93a9-4388-fbbb-08defcc88629
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 01:32:11.0273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC974xkA6qyRhPKJNWgXcwwVZ97y3Y8dtuyfBvy8rJIEskkiWvxHHMESy8Oh58qFgz8yNejRqSUkVQkZNV2W+Fd0kRiZoK5ZH4RXKVY/PLUECGmu/b0+Xm/UFAGy/8Er
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7999


Hi Peter

> 	/* Remove 24-bit format support if it is not in right justified mode. */
> 	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
> 		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> 		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
> 	}
> 
> Should RIGHT_J be preferred over I2S/LEFT_J/DSP_A for that codec?

Yes indeed. Thank you for pointing it.
Let's set priority for them.

> I started looking at max98088 before proceeding to max98090 when the
> above problem was spotted. I then stopped looking. It wasn't exactly
> hard to find an example.

Yeah, it is too many drivers and many patterns...


Thank you for your help !!

Best regards
---
Kuninori Morimoto
