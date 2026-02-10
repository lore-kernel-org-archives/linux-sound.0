Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369031A254E;
	Tue, 10 Feb 2026 00:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770684728; cv=fail; b=FKdXtTdMryLxUDR9THV+NPyQ9fAJXBxPB25VgwjkAcIIa62hVThn6fr2wLrN4UPosdv/DUO7PSKDt9YHicjnqod2RzTAvUiZUXw6TVNNZsGj8SZrkqbtQ19IxyXOv03XKvvI+vGuOjBlXPW1L1XTGY/wXamIujQcGX1S43Btjzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770684728; c=relaxed/simple;
	bh=2YTuoQJfHVsf8BKdY+XMs654iJRjhlfKfKz9y9wtZc4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BUlhWiNZRd/CpYGCbR7fGCEGaIN6bE/aPOpq7Xlwkh960oPAiyG9hW83PMHjoLMwGVW5xTtdAuAEtQRwvirVAXZqn9rDJMew0O2+iiD/GeDwMqafugowpWKeJxun2xIDkLkbeiAo3ZrjETJ++uW2VMaGtqPwH0w9dy7BePdlePc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K16o8PeM; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K16o8PeM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zu6IrAXlZicSA0VYOR2jKsMpfR2wkC51Mbli1qDZd/UQ5IBOUVTnG3Q5SRjSv2ClfHFU1gNAEVRonFA4ynMwOM1iuN+if8+VLsXlQ5imfJY600TPjct6UCF0nPZvrYiQFd4/JWOWBLuKjlCOz1BJL9qFT8Dl1z8Gy5sJkAam/3RDJP2Dop3LCaAmqbrditSXjoaeamVsgDg1Sw1t7G/uqMRIku9p0p+EtcZWSRYiWaBawy3/dwX6TFWYv2W6Zq7WCwHPOfqbJIwu/tsSd76SGCINIb3wAYkx3dI6+0gFFswz8sOp2OC4/GJ4dKZEO0nNfeRCJkEqx5d8YqknFPIT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDKoWLWsjDhyLWzjemmXAa5x6EOd2IHRcpNi2L8XGRA=;
 b=N+YgD/7cbkBsZ7+5FolrkLy8DfFHiawzUBQrFFifwRDnzJjgeynhrMu+DHf1Jo/EWkJzdreZt3Lp3vjZErI+r3Z/9g4QPS2LVOpS+e0LxHCJe+7OSsTHTamPAh6JxCuiWGfn+gWq0T6O6Mmthlphfvx2igS2EmnkXWQyv1meItpxY6Tcx/4JIXJ0B/jNwMUZMPv4Gk08NpMIlsaEgV3r4khUVCXRaY8NRibO0sgLZ5ECLnSpltV4sfmWfpIAVXY7aWZdjuUxKwUtH2PQ/ajlaPPSZYZKCgfVmL5hRFFBQq2pZAFJ5BDYO/FPm5l2fRhADjXeT+BqzLMtVHK/OskaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDKoWLWsjDhyLWzjemmXAa5x6EOd2IHRcpNi2L8XGRA=;
 b=K16o8PeM4ZjigYHpmIskv1VoWc3C+ObmaFF0bnzwaKtVJ9nSJh0kp/sWX4r4xDj4gcPaknON0aBRdgEmfcfUgZFhx1NOyibZcGDYVivKDWtWEGvbR717EDLLr3tBr1/ryT7YqKkJ86/4r8ULlk9UAnqZLFO9BzbHFYUEySu0Qzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYWPR01MB11781.jpnprd01.prod.outlook.com (2603:1096:400:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 00:51:59 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 00:51:58 +0000
Message-ID: <873439o1xt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1] ASoC: simple-card-utils: set CPU sysclk before codec for mclk-fs
In-Reply-To: <20260206134014.143057-1-stefano.r@variscite.com>
References: <20260206134014.143057-1-stefano.r@variscite.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Feb 2026 00:51:58 +0000
X-ClientProxiedBy: TY4P301CA0112.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::7) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYWPR01MB11781:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d53326-8dbb-4552-d90b-08de683e9867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sc4afijx4O4YoUdIm1cLVNFeXiGlzW7GlcWUEDiQHghqHxCCNtQ3VlK7tG0I?=
 =?us-ascii?Q?wo9lNkWM14IDBQY0Y5CO73v8tObKJuqkco79HxleZm543xf/BlIoyTAv8vB/?=
 =?us-ascii?Q?wQWmk4ryJ3jF9DoHBgEi16dIWLdtqPBpJZouUdSAYvxlD/lkTKlMJGjSiKFd?=
 =?us-ascii?Q?Qq6oW6vsrOVUG7iVWu6COJe4V5B6bWrUcduFwFHjjbdiIZT10ImNmBMc+aLL?=
 =?us-ascii?Q?n1LLckYNVlL6AQk18G7s/SxTLXeebrAwekVIzRwL75f7BwrjYWlJTTX3eFnc?=
 =?us-ascii?Q?G3mi52sEMQ6yWYAT1nQHAU/XkWkrXfByKucb9qw3qJI9lQLrztA3g7UwAHp3?=
 =?us-ascii?Q?Xt7YbmfBudfadFWg+skkd5TPaz2dIHhP/J12PFiksFlr1rXoHrWr/bOz1qZb?=
 =?us-ascii?Q?ZJm2xhOmK1VSVg3/7fOEZ0IbXIOxkPgYFrcdP4ZsR/6i6hnEOqDMGk6lX/rv?=
 =?us-ascii?Q?a0kVe8tZm7QnzSiZpa+KRhha2ovaTJ+SBjpNaPWktKlG7imOsUE3rTwB8nOE?=
 =?us-ascii?Q?OyHW/sf0LV1p1Zz1xcg5CcMdS6x2EgprQ3kUEKjAyPkzj/WW0LXG2682Jm8S?=
 =?us-ascii?Q?YFcbKAuhU2jwNkHvGPzqs1UMlp2FvXpgxMfm7J0EWR0ESFL8HJwCPpx9JxCr?=
 =?us-ascii?Q?6BT4mXN1nmuQ8E7Inyqg55ZxgsdtANXH0MSjt5w2Db8u78Mvzkro4CLhLJtl?=
 =?us-ascii?Q?5iTmZsnRuZfoEeD48DHH6TdcpOALP8bP/wyx3mAnpxl2UoXDO8qIGOVfkv1h?=
 =?us-ascii?Q?FwBvczXCzd+Gqq+EmBAwcFMbwEaQ2hVFnCSavmmXhW6R24/z9xh2xF8GJqWP?=
 =?us-ascii?Q?bG2qW+U2LFR1LpD+aHtDOUih1EaORE8Ljro2Ab+9CxFpBtp4/NIw0oWTzBB9?=
 =?us-ascii?Q?1Fq0aGL93MT5zcP0mYG4a2wb4xhh3armBk649sVKRdzSHnSHnLzKczM6pQkd?=
 =?us-ascii?Q?TmJ2q2P5TlhgHRiKrNdlO5YgT5pvM4sr0DIf3bAQTrxwZnOXsqYq1Pg4xfdQ?=
 =?us-ascii?Q?uT0dA1fdi+uqxfgKUpDPPZFSaXPZRprhYsy6X2vUoM4AaCmpjUMVjyD06UqB?=
 =?us-ascii?Q?HMg5HSKyFCOzLeAQp/6gvIKA/mXCWjfOTl8hP114D+U8N+i4DNzDiQEpmlSf?=
 =?us-ascii?Q?rNDXdnH03byRNDM79UB7XCJeK+PFzFabotwAlWEusG882Dfj7ahlNRHuuo4D?=
 =?us-ascii?Q?3hCbISTwn8fI/ButPzvwuzehf0lNWTOwIzMmiEfRCB9ePuDVNhp+QDUZPta1?=
 =?us-ascii?Q?ZqeRx7qvbZouXt0uSQJclhvQPx9I5R6E5wB0l1ZLnl6XdB8w0EJpVzUuYAuc?=
 =?us-ascii?Q?oVzDrw7mayPW5/Kcg3jTJW4mphEBb4IWfWKyImGhrhZRxDGnL9ZPltKmnCXp?=
 =?us-ascii?Q?Ox1G95w9plPGoYaaN/eTZ8cHPfxdY9CXWiybhliXh3ZfrUYfqG3Sp5oPlhm0?=
 =?us-ascii?Q?plQmx/dRajJSTrDmjSzH7vY3Y6sF0aDlDhxAsBSLkdCHLTN1gSgs8p9offmX?=
 =?us-ascii?Q?eL5ztlJNReck+vAstGIOtx8Q5toiUkq62Dk2zWyameGL+cEJyEhuk4nkDmwt?=
 =?us-ascii?Q?5FjK1ENOlI5LfPstukckfiSrE7hiHWOJ3vVzYJBGk8cmeie3QurrmFNG8YfS?=
 =?us-ascii?Q?TVSxRTekhYjGfP4NMEukFN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Lu0ePaWA7ax1zqzDNZA5nk08tXROzMxSrQxYWyqB0LPrzO/hA9TzMztgMrH?=
 =?us-ascii?Q?7MiPXN3qKFSgGl7fHGuWDElPZBuFl5KTcjXDCcSigVhHixmfeknvpkPW/c5R?=
 =?us-ascii?Q?CYMsbDz8JWBO/G6qv8xu92R6ILcJ0BBO8VFFA/0gjJklwF9po0yFBitDyjXF?=
 =?us-ascii?Q?SGdK36kKLgGo10UZFWKWJ3ZUfZZOp7/ltv+Ug2mnWh51aSbeb+AawmJIEy1f?=
 =?us-ascii?Q?4FyTL4Jmtflt7KBb+xJ9eGdtdLiN3lDbWTFI+6HzT3nCtVoPmfdfQs/KoY/i?=
 =?us-ascii?Q?k1ocAMYW3FW43biwRwPpBv1i1U+fNpgapP08R45yaiT+saoq1Qaktkgcg44N?=
 =?us-ascii?Q?TQJ2rjbp5Oo2DWDmbkRMgZBoRpStxdmGSL+l/5VoDfzD+ZxAPGcFckzhtedx?=
 =?us-ascii?Q?mTEMylcXV2MbIzSqi4BUx2seWD0o6bHsCFU5/OIEvaW3Z3QLEgGs/igG2vs0?=
 =?us-ascii?Q?QaawrvwTOPaV4D5XJmBhscfBgBUUlEyZl5VkE6W4y0Hd1crexkdxD/qxuW/N?=
 =?us-ascii?Q?AV+cd8PI+0o4JHGYQtiBmNlnol6KCuaq9IxNy7f5J09EoPd3rgjvHWb6yEi2?=
 =?us-ascii?Q?3ED1AaYr3U7aOp/HWhISy9Krakz84Zjq3K2WLKcntlLbxiST8qYrQleORkvp?=
 =?us-ascii?Q?c3t+t63ALvti9xIEphNXda8dXRZSlMfT9S7HQ5IoMETrEjK3CDQ6pOEr1sDh?=
 =?us-ascii?Q?wvz0RtvGGYNMvXrFHy3/7df1VnsA0LbbdzSGA9M4YAM+ToBMB+t0bmofw7jD?=
 =?us-ascii?Q?NlT9fQeRzgMrvN7Cv8ZDtvNN2SygptO5kUbw0uH5GRSvqzyh2kDuCq56iPO0?=
 =?us-ascii?Q?xfPb50Bj53fW+2YRg5TmeQc8rVsfx1kenqtjGxdnrzqxQtB7HBo/L/v+4q73?=
 =?us-ascii?Q?sw47oFc9hxhQ/cMpw8ElsJxDgPtN/4Pwx/YC5x/jgxsGHCliHR8YI3/PCQW5?=
 =?us-ascii?Q?OHTOS+NNf4UlGCV7i4EhsQUg5Fnij3pK3V7YIAZFoVxsmviWdOlMG3EECHmx?=
 =?us-ascii?Q?X++5ZjwE04iBvU4hiLYgWaKyLdS9mDL9P7svP/upSQ1wDLM1/3UpSrNf6tLJ?=
 =?us-ascii?Q?JiHKnb73ozV8L4pFzb7nWuW6HXpqPy4xrDb1WrXifVycfRfq3jO9Q5q2Ttsu?=
 =?us-ascii?Q?+P3lf1tZty+jeT1ukyfwKWs7SrG5RFkwgN2QiIO5ll3dldidnT99k+PWMqnT?=
 =?us-ascii?Q?j731HEtHn/vrGcqmrRI15GcfkHcFCSVsayv4xpIRJgIRjpLAoVT6arEYJTt1?=
 =?us-ascii?Q?AzLJCHV3UOu4fI4C16a+Cd0lQD7LrmaFzMpsKXW/Xd5gMUfsON/dg/gQwH+D?=
 =?us-ascii?Q?hA51iuk+xsJuEkeN70r7K+adaVbTvBQZQ7Qrw1p7CKLpW2P7XxNAvixhO8Bh?=
 =?us-ascii?Q?ck86RkCd9MfyW7SOTsVQH8lXqVI0wQlHscr4FnRBX4YvrYT0RzDOqJB6yV4w?=
 =?us-ascii?Q?T6V5ilLLFu1gQ10BRuRBG/r1gcGAc0NeGmKs/sA1bIu0kClbrvjsLtlAsiXy?=
 =?us-ascii?Q?6S1+meS1G1DEGiJw595Y3Mfse7WXNtF5Yue+QFCgsY0W8uLZFIv+BAFxloEJ?=
 =?us-ascii?Q?sn8DWS3j/vuBBmW6fSlVBfIaIpQhQrwXgO8ulv3yhi4cOrqrQydOUl9SbR5B?=
 =?us-ascii?Q?fK+SXsoj7YhXXX26GKaZPPs5Ua3cSm+x1EPLGEx152XFBYBqEtjH6bOJE8k+?=
 =?us-ascii?Q?QaCzmVbfKmmmCUuNHrChD+OYqI7BMYOTY6NOwi8dJsV5R69Q3hP3hCTwni4U?=
 =?us-ascii?Q?XmKZ2e2iF9OVircD8pfG/ZrLimZrM9zmAUiDq0btmXrV4nx8IvMx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d53326-8dbb-4552-d90b-08de683e9867
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 00:51:58.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWzk9l1cD6+8P18LSez1SsAk8bEm4Il/FQDpM7MXY3ytRFQugXz19dexNik7HXzBbzse1+W9PEmh0SdFuhmxYEd0TFxZLKmCg4REkCw9QNkBKdF6FUsm87lv30D7HN9j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11781


Hi Stefano

> When simple-audio-card uses simple-audio-card,mclk-fs,
> simple_util_hw_params() programs sysclk for codec DAIs and CPU DAIs.
> 
> Some CPU DAIs may apply the final MCLK rate as part of their .set_sysclk()
> callback (e.g. by changing the underlying clock rate via clk_set_rate()).
> If codec sysclk is configured before the CPU DAI applies the final
> MCLK rate, the codec may configure its internal clocking based on a
> non-final MCLK setting, leading to an incorrect clocking state on the
> first playback after boot.
> 
> This behaviour was observed on i.MX95 systems using fsl_sai with
> downstream kernels, which made the issue visible.
> However, the problem is generic and can affect any setup where the
> CPU DAI applies the final MCLK rate in set_sysclk() while
> simple-audio-card uses mclk-fs.
> 
> A reproducible symptom is that the first playback runs at the wrong speed
> ("slow" audio), while subsequent playbacks work correctly.
> 
> Example setup:
>   - CPU DAI: fsl_sai (i.MX95)
>   - Codec: wm8904
>   - simple-audio-card,mclk-fs enabled
> 
> Reproducer:
>   aplay -D hw:wm8904audio /home/Front_Center_8k.wav
> 
> Debug evidence:
> ftrace showed snd_soc_dai_set_sysclk() called from simple_util_hw_params
> for both codec and CPU DAIs, and confirmed wm8904_set_sysclk() ran before
> the CPU DAI sysclk call, and the CPU DAI then applied the final
> MCLK settings.
> 
> Fix this by setting the CPU DAI sysclk before the codec sysclk
> when mclk-fs is used, so that the codec always configures its internal
> clocking based on the final MCLK rate.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  sound/soc/generic/simple-card-utils.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index bdc02e85b089..50f60e4996a5 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -501,15 +501,21 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
>  				goto end;
>  		}
>  
> -		for_each_rtd_codec_dais(rtd, i, sdai) {
> -			pdai = simple_props_to_dai_codec(props, i);
> +		/*
> +		 * When mclk-fs is used, some CPU DAIs may change the
> +		 * actual MCLK rate in set_sysclk() (e.g. via clk_set_rate()).
> +		 * Configure CPU DAI first so codec clocking/FLL sees
> +		 * the final MCLK rate.
> +		 */
> +		for_each_rtd_cpu_dais(rtd, i, sdai) {
> +			pdai = simple_props_to_dai_cpu(props, i);
>  			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
>  			if (ret && ret != -ENOTSUPP)
>  				goto end;
>  		}
>  
> -		for_each_rtd_cpu_dais(rtd, i, sdai) {
> -			pdai = simple_props_to_dai_cpu(props, i);
> +		for_each_rtd_codec_dais(rtd, i, sdai) {
> +			pdai = simple_props_to_dai_codec(props, i);
>  			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
>  			if (ret && ret != -ENOTSUPP)
>  				goto end;

Actually, this is one of my concern (= which should be worked first
(CPU or Codec)). I don't remember why current code calls Codec first,
but maybe original code was.
I guess, some other Card needs to call as-is (= Codec first), and
you want to call opposite (= CPU first). It depends on clock
provider/consumer settings, instead of mclk-fs, but based on each Card.

Not same but similar issue we had before about how we want to call
.trigger.

	356caf663deee8dc46ff3168ec0b24bcbeb00b28
	("ASoC: add new trigger ordering method")

It was fixed order, but is now controlled by flag.
Maybe we want to have similar method ?

// unreliable name
#define XX_CLK_START_CODEC_FIRST	0
#define XX_CLK_START_CPU_FIRST		1

	if (xx_clk_start_first == XX_CLK_START_CODEC_FIRST) {
		// same as current code
		start_codec_clk()
		start_cpu_clk()
	} else {
		// opposite
		start_cpu_clk()
		start_codec_clk()
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
