Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AD3EBF14;
	Thu, 12 Feb 2026 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856309; cv=fail; b=HQ6AQk7wm+vnK4C7TG5aetPN0d1vN1VLTa+gd/ywcgwO5Fo3oPC2oYTG913XmzMh/7s7dnskeOLYKg/3XxHtpDKw6vr2ittXkVVfHp1WnYOsoDQtz8h0zZCTAd7Oy6r2j5PkAw7BtDfX2BrQdJlJnkIEH7XOprIIGCe9dMYYUR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856309; c=relaxed/simple;
	bh=wRw6fXrBeA4Yyr1qCJTP3c3j7oTJDo59hiP+6HliFIk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HYtcWX3dR/FLK9ezhUezsdUeHSenDwkQZswuO9i5P5Ba7/hYWnz/iMAGj6+YzullK3+avyYG2+Fzp/mg0BXMN0EnHt0P6Y/5qfS5l9Sxi9cyIRoqIYGHXnqL9PRZPVwmT5WmChB6teHBNDSB1VCZRGuwbt2IuDbSaN9cVPKASOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RJeXZLFV; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RJeXZLFV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xp2+cRtfWYy+gAV0laanc6cPLS3soJDeCV3WZHPVRMsZ9cd9kR6P9K4FcSmeN7sxObtbYsuIQnnnyvi9teScBMpLesKa2d72vG+bdy3h7DC+hfJmtVMgy7sPephvrOxrkXGnaTwblJZGduvD2HgiG/u42L97sQLUtC6qNkDMheQ6ptcGFgozWcj7S0YrTcHs+Qkf+l9iQFu4bm4WGWElheZ/BF4alhhnz8T5dn4WvR2oU6X7FcrTKqrfd9N2zg04P3wMFz8yC0N97cEVoVvmh94inGPBSuf9D+VNLj5SWyzClDqRW8N3Rh7hVomqiG+qUfenozl8Lubj6sBcl6bsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeAL90YNFRHjjkT670TdUnRuzOfoWOFl3OUphSsWUk0=;
 b=NmcjhtKM9crleAs35ehpMxJA7o2chQNe7FYowLCaZqTO0wPKmoBaaHjfJKgl3nfLqSpQ1cdnKu6+WNH2Xt5NIETY6CfIBtIwFnAJmCdSghV6yyPRoTqME9ybW1TRI6ZTxewreAaqS8RvRbeSmyZRQ8Jn/rkVerqPEGH1daHyw44N5PdzCyyPHi1GqiWRZW4qQh0VYyZvKC2pkrziu6GsfYGD30fnD+H89qRorLSfOGqgG7lHbBLH4v2uDqk39ubfbAPK6F8s+AByRMXl/7FHICr2rvfrLSCRBWUUm34VXgrhME0ElHiZVoxygM/ERTw+TQGJKz8Ton7Oe52yCqxujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeAL90YNFRHjjkT670TdUnRuzOfoWOFl3OUphSsWUk0=;
 b=RJeXZLFVguiLemOZWkx6waaKINDEhIN4B4RnK74XTCDenaXgopzYXUjG5Vl/6F+x+OvImfyu7m38fILCG0jt49oZElDn+sbDYvuqpzonw6EDr++BMnqCkbB0mnuFtIz1ebE9mSt80Nb/W0TX3XFszVfGd/XoMNEfZ9OCUJY8ZDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY4PR01MB15604.jpnprd01.prod.outlook.com (2603:1096:405:28b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:31:42 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 00:31:37 +0000
Message-ID: <87y0kyu7iv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v3] ASoC: simple-card-utils: add sysclk ordering support
In-Reply-To: <20260211112815.126734-1-stefano.r@variscite.com>
References: <20260211112815.126734-1-stefano.r@variscite.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Feb 2026 00:31:36 +0000
X-ClientProxiedBy: TY4P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::9) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY4PR01MB15604:EE_
X-MS-Office365-Filtering-Correlation-Id: a6083317-a9de-442f-0a12-08de69ce14fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kXi3zZGlB9H3oPUhtSI67i0qJNYVkr0a3iie63fv4Cdhvfh6KtU9L8RlLOF5?=
 =?us-ascii?Q?EDWz5zfgfddoX9rn4RFe8qIoofcyp4//CpTEEvGHSyZvkIf0i5d1UrGOh2TZ?=
 =?us-ascii?Q?JizXSP9bHfJ8xw6AhEklGe16b5y0Bj/YKygm1C36envn6oDHLvUYuN4tduEX?=
 =?us-ascii?Q?YxQC7qB8Fsh8jW9YTXWEZ2Y2zlMgKF/fs72AYvLF3BCFJF/k/qrR3mnipxSy?=
 =?us-ascii?Q?smTtxBERDDQ8TEZNmUOPGYXBeXcze5uzrWTuJlB3xhyyjYX1/rl9cF/63BWm?=
 =?us-ascii?Q?boW2FyuzWTwkYYeSC0IFByyRMXufi9NvV1wy4lHfmCLOHTdWFjAq3Licoj3w?=
 =?us-ascii?Q?4q8yKF1nOQkgs+sArldQCBkKuSL7DVzehi1USLlv93uXN5LU/ACH1OzO50xn?=
 =?us-ascii?Q?/fZS9VTIQ5V67vvDOewMXTVn9ha0NSV8xk7ycjyjl6J/x/QZna2SbF2Dh6Vi?=
 =?us-ascii?Q?dyBph0BLpRewNGngs1fGI9YDk/LxK5QMYDZsPKXSFJYDrmtK2jOfDzo2OXdu?=
 =?us-ascii?Q?0CVFhMPyYdHcWOHvKSK5r6l4xK1/8iexmnHD4MCBDIkPmPdXs+aKKuf3xfk1?=
 =?us-ascii?Q?T0bIaHzTvFVP0cCoMod9D13xlpm0bvqgovgxtYMy/8wuyr+VZlTTLibj1Hg2?=
 =?us-ascii?Q?p5DnSER5xZK8BG5ejm9v+51EldhYUrPo/1SQxpuwzQst2KWBC3Jqsq/kIdKy?=
 =?us-ascii?Q?7NtewEkRJbEytLJCBAW1PYAlKiPHwQGgWgf3uoQoG8+SnQxW+tENqSAvuXNS?=
 =?us-ascii?Q?lnwJBpzGRh84YQWulAxbsn772+mogiJowabep7CU/0x0cccQbVtrVN92zOPy?=
 =?us-ascii?Q?mDKC01skMmi/0qma113f1YKVMfsPvCeJ57FvlRaf4XmduLxJgHYNozXo8K95?=
 =?us-ascii?Q?7SeT152RmzrctoIxHJzANihw4FeJDc3WfZ0o8IhRQIM0NWAFiMxISXHL52ov?=
 =?us-ascii?Q?0YoYd2ExoMUvSjj6LzBXmXAwzX6GpMkXE+AtYf2IHWkJ0EgM9WcLvpRq01fH?=
 =?us-ascii?Q?yr9pAvWc3Bkin55CMFT48ZeholMqlNQhr9MZwug75cC1dSsXRmZDMQlw4lGA?=
 =?us-ascii?Q?nbwHCuWeEjMygerLo6bj1FXXe/za96rDEwDdAOFsIcM2gXPl0CuP1GUAQqjk?=
 =?us-ascii?Q?xMyFyyYNA5D8UiH516aZhUQYS31AUZWyG82GrT08Ho+wn3rJ0WTiTV6KOB7J?=
 =?us-ascii?Q?vvcOlri9BQ788LnonOVu4ig0mar5FqlrV97m2oM2YVfA1xkv/oUzQ6i5vtS3?=
 =?us-ascii?Q?jScmwlGaYCVewsurDLOvYdEaccLO9ApYBraZEmnt1rMto2ke2M4l2GE5waTV?=
 =?us-ascii?Q?vMAheP4vqGpRbLjaYrOUMZaKyttwaEGHHguam37OCvKxBLIFlYNIUldhJKng?=
 =?us-ascii?Q?jvhDNb5ZvEV5JEqKv6PCU6MQzGcaHjSuVodSgKrxgsFmsyByX5jDjZyUtFQG?=
 =?us-ascii?Q?qDKCOzUaZVM00F0Lt34gpjztTaqEvbGHgaGV01SzwsrHtsC2TA3ly3UB2tFi?=
 =?us-ascii?Q?OMkZtR+yFee4BYO2GyD0X28Qa3kiRWKeawhgTlS5RXzMLIkAZ1gJmbOpXtJ2?=
 =?us-ascii?Q?KHdOvq9UIOib1UsihkNjvMzdtoJxSGM/LsbWXv2oHUobxAQ3X07tIX3xlcPL?=
 =?us-ascii?Q?CLXfIZDXW+eokF7IoUBnsdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DUKK/T48OB2G5YBGko/8eAi6gmCrXHZaEXCAQBIuCevxz4t2NP4dXuxmUt5W?=
 =?us-ascii?Q?aUYh0pzNUW9/Y/wo9o0PihMnfNptjiP2HkuZGGjhjBOyFOpXm/M5lT0U67xu?=
 =?us-ascii?Q?w7mOm+wZ0rsm3ktsBAxl+dXUI9NpglIpqMuqjNUoFXRMq1ig+uESRIpZHhT3?=
 =?us-ascii?Q?SAQFy6+BAvtC8xWfBcmZlvqAb0bfRo33J5f41LhEEvjLpuzVQyPAHLaU2OJd?=
 =?us-ascii?Q?wcR7pGnxEenk9wOzdmFqN69qvLlX5l5tRVh3fvqDaKW3PxuVDhsfe+as/tXY?=
 =?us-ascii?Q?mIs644DEDhLU5KEm/jHph2Rh6NbKH0e+XTuzFdsPQDEJPAhC0kK4sFZoT3yI?=
 =?us-ascii?Q?CvnnZBsRmSOqX8e0GD2codtUAO31OruYJL55voMMGqmmYxz03pLJyYxPQ1gS?=
 =?us-ascii?Q?Y5ijpQb9xZPwaqNit4NxT5X65VX2U94FBPLjXe27nKLqMb9B0G/QXboad/8u?=
 =?us-ascii?Q?GnhbB5RUknEHq7BvUreyNmi7c/MlMkizP1P/Q0wUck++kpmiNtv3OQQ8mJSW?=
 =?us-ascii?Q?z2c+NbvypI+uIwUslsyOkHEWQY7wAlwdCpRgV3tpPxaMAUZpcV2Sh5dSabTG?=
 =?us-ascii?Q?36nqs/aElHksZ7u0AosypaU6AHoKoqeM9nzYAIOv4oatfBiAf/jEXw/cDjX8?=
 =?us-ascii?Q?fRYcX0yTjkFqK06TzsodlvoZGaDt+E458+U59mWngk1fBSQnYQ1NHsfOzI6Q?=
 =?us-ascii?Q?HLTjVcl8dzTCWP0ynr1k+2pcoifXKGhPvINh1pDHjq4KagOg51d6m+9yePna?=
 =?us-ascii?Q?7JBnp5skvdfaLG0hUna58v/tYf9mzgrixZD8qM2EYLsk68W5+Ra2DpfgHIa9?=
 =?us-ascii?Q?4Yxs9aDvNQjRWprXt2a9oz4bJGV7oy6J8sqOP9mNYUZaQEM+G2sS3HhHMNLg?=
 =?us-ascii?Q?ej6sQL8VbJiocrPdUuLg8Z8uRKNbDIrVKtHQP18o8LeiflgZ6Sj+ti2lOq/o?=
 =?us-ascii?Q?QM280cUcFcfWF/gqoxallolVwhcr58n7Tsg+FazVjM/d7oqKopGfxxwMXtnd?=
 =?us-ascii?Q?5LwFaZAl1oEoWo5oflLRSqM2w3u5EU0d2b0OcsgICc4mcnaaCuTo+mMVDCG3?=
 =?us-ascii?Q?eOsOMqsZpWZE6hUFYYY29LhUUL3M/Nw4Ve6r46aj5zA++Woq0J8nhByYACmf?=
 =?us-ascii?Q?gERGGE6YsbQ3EMF1YZDa2iQz4Ow4ayNvUo6q5/by4hzJNDyHfgrIB4BONHcV?=
 =?us-ascii?Q?8lsrDfq51WU85MLIzRixYAOTUtl83IUMLqCkLup+Pw/9aSB9Mr6jIWIlfQB/?=
 =?us-ascii?Q?61ROPHrzbQmpfuLjIoffNm/q8JLvE1OaavaFFPtxAFUwDgAIgBXSWbiR/0EN?=
 =?us-ascii?Q?2qj/NXPTwu86aRZuPxm8yBaXtQNI+46G53Tjv6+aRaiF9Mxw3hWhIlFdY5IA?=
 =?us-ascii?Q?GbtAF/m1aPuDBsBy5rEg7Gr2bhFBfXVu8MR1aPXa5kdJhMFc3VTGj0BQBZH2?=
 =?us-ascii?Q?KIS/YyVqZqCTtik8pZMEuZuXC8XVcAm95+Dd7YdyMpwkFkr+ywFqT+fA4DdN?=
 =?us-ascii?Q?VsvKU9qsivPfNF8N6A8o2RyVm8vyhwRjIMCm+3xdJPMvknxIi9u/pAwvcuXY?=
 =?us-ascii?Q?wDiQbNkg8riSbJaMu3B3dUbqntXo/zCJEjAQoMOMJEQ1F9Pl16o2+vpG0T7G?=
 =?us-ascii?Q?k1C22hodb9/DrIFYU7FR9EgmV1mYoRZGif7E1gXwzzTaKH1GxMTjQL3GQWtS?=
 =?us-ascii?Q?130RS+qiJZPT7G5gUA+b7cZYqeHmM9tm/s1QkyMu/XOTCWGHGZ/jKuh+Db5X?=
 =?us-ascii?Q?T0NXsjMyvUW1Zrqq5TL3m5BsjwWNY6G0ut5+N8RliLGYYXLTezxN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6083317-a9de-442f-0a12-08de69ce14fd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 00:31:37.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhWIbNYDnlRt4D8qrKIo/VFybilR6J+VdQxbwsgmUB2dneU7FQl0kap6c3aRUJHIRGqNFtQbr4I2p5ObcicWs6UQJ37i1VseVAB1yvIVTidxL0ohbbxQPoW/uGuWQVuV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15604


Hi Stefano

Thank you for your patch

> When simple-audio-card programs sysclk for CPU and codec DAIs during
> hw_params, the ordering of these calls may matter on some platforms.
> 
> Some CPU DAIs finalize or adjust the MCLK rate as part of their
> set_sysclk() callback (for example by calling clk_set_rate()). If the
> codec sysclk is configured before the CPU DAI applies the final MCLK
> rate, the codec may configure its internal clocking based on a
> non-final MCLK value.
> 
> Such situations can arise depending on the clock provider/consumer
> relationship between the CPU DAI and the codec.
> 
> Introduce an explicit sysclk ordering enum in simple-card-utils and use
> it to control the order of snd_soc_dai_set_sysclk() calls in the mclk-fs
> handling path. The default behaviour remains unchanged (codec-first)
> to avoid regressions.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
(snip)
> +enum simple_util_sysclk_order {
> +	SIMPLE_SYSCLK_ORDER_UNSPEC = 0,
> +	SIMPLE_SYSCLK_ORDER_CODEC_FIRST,
> +	SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> +};

I think UNSPEC is not needed ?

	enum simple_util_sysclk_order {
		SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
		SIMPLE_SYSCLK_ORDER_CPU_FIRST,
	};

Do you set this "order" via custome driver if you want ot use CPU_FIRST ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
