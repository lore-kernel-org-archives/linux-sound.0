Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045817C;
	Mon,  6 Jan 2025 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736127635; cv=fail; b=NrjuBrLAsv/IPoDZtsfm9KqGRYW6Fvr+9j49LrZCKwwdbTohBW29gjeGi5OlHVy8oVQDhBd1AoUINwTEYiT/hDp69YzHFAmZd8aiFCy4iuSLcxLPXa/7jwaY0oqUEvaHKou64dcsN9XsdrdVgOQmpb+G4WFwLZU4T8DMn+A/4ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736127635; c=relaxed/simple;
	bh=CsfhBKE9CW/qajDfLhsJzFrB03nirb+iRPiJ70n32GQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IxSaqYUNFQGT6y4zvpay9bpzPOn/bjwiCpabFNX2PRHzlVHxQYmpdkiXG5sXyV2nfIFiNw5jXspDqTwvRxXmjkuyjZ+WJAk9Z3lwCxgmTOZJmN0/4yoHPrHh/AmDOXs5A/a3GjeGNGVNL1BOS3ja0vOoozF4e6Q0Rf7yKFXhDXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ikkJ5fhi; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ikkJ5fhi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDUWnYhMRU2PBWvMu3Q/QLEPgJF7vLzPqywwftqxaVuL1n2KTZy5AlDSqYxhXS4Oyg5gru1VqvJhPFm1WEbHYSPmA1Qo8aKCdYZj6L+79DxretTzAT78CsO0hVlDXJJgwvRcJH4/Mp/NgXI9EF12yjHkohU9oeaykl0vH8E0pi4dvqfc9zgESCA7QoopKC+kQJAyCD+WUGuL9k4NwusS+0+ca9l/H/nw4d/njNWhV84rUUVErvBMEk9HUy0VPkjv7RQc62JMORyh9TFJ86xhsy5MxSHpHM8Rh9HrAzwvZUOzuukW05brf073Xf1s+bwEuNgCSm/AjzJFUcG10VI3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSQ5BPlQVrMY7UeIp6gcEk22eI3Xgnv+Y76TlcjtWmQ=;
 b=Trtr2uNjsv2XEy+coTbwWY28PldBjcQlyvCQy3qJYFzjVaUCNLXE/gIjooIiTemt2461k8Mwl/TqKGm5j5OZyYuKV7iAoAv/1ZVbnmBTSBSJGjOa/YLAG9tio8TeLGLl4X5qlTSwDgselRQT0zXW8pXYketlf+DSlXPtteLVmt8YoS2XiNoG1gz52ilrXjVXonQ5aaITiKhusbL6AjL7Z8MwR/n4rUAL4kXJN8KdRPey3YonDObw4xpAlXGWHYnNgqve6YxL5PLhE/nuKPsCqUeYTJtFLG4X6IeymQZ7sQ6ZSVm4ZWIE4mmnUilaxSWgRcXQvKsQb/qgCEXUD7bHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSQ5BPlQVrMY7UeIp6gcEk22eI3Xgnv+Y76TlcjtWmQ=;
 b=ikkJ5fhiS4N3KgVvJYJNfwF51R+Ea4vryMCd41DKVjNh0QFYv355ipoPInWeUWPU0FBnY+LusBC8SFzemGA+3IbdYI0zcEVvlCl/ilGgHQWQ/s8wU8Miz3MTIkl1pZcDIQID0aiiQp1S2hAM6HCdrc4+vCPW1+2mpI0POMhrNDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14080.jpnprd01.prod.outlook.com
 (2603:1096:405:21d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 01:40:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 01:40:30 +0000
Message-ID: <87h66cpvn6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] asoc: simple_card: Show if link is unidirectional
In-Reply-To: <20241231033841.6213-3-gordoste@iinet.net.au>
References: <20241231033841.6213-1-gordoste@iinet.net.au>
	<20241231033841.6213-3-gordoste@iinet.net.au>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 01:40:29 +0000
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14080:EE_
X-MS-Office365-Filtering-Correlation-Id: a87a3b40-3008-48b3-4134-08dd2df31a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hkFKMgT+XNSr46JK0NUk/eBPQNNAW5uAboh4cGVnrfBAl2CJARcIIaLU836Y?=
 =?us-ascii?Q?Wd5CNb9Wt9Fz8Rsd5/5HOIY96EPoXitJSSM+ouE9CGBfQc6TN0Wlo286xHxs?=
 =?us-ascii?Q?bdi5CXsXRTly1LiGWHDq8hCtmB+hoEYtSIDU5iLH18kCh2Po3ExrPsICwsmQ?=
 =?us-ascii?Q?3QPp5qIx24vQcw5VKgceztelQn+WEfocDR89yhiWkcb+tDa6Z9s6CNx4S+g5?=
 =?us-ascii?Q?aMZaOOln9yme7SWDi4Xcd+qrzmBwDeH6JwtPvHW3CCEcY67yq7Ns/daKWRWI?=
 =?us-ascii?Q?f4r81mEeld5R2c9KDjXCjZ1pwNXvNFOqBFvKRifbWNcBtbgJqtVh12HjSE98?=
 =?us-ascii?Q?A/8ZuL6N3CXj/HG920in45P3yFDy2iVxne0wxzgVTNR/SJeDJg/Aumud6Rqg?=
 =?us-ascii?Q?r4DGAC45R2eEQRaS/vD7A2+78P+IEo4QmH8kT7NCZW4mHOGpQwpcZbWLkKOu?=
 =?us-ascii?Q?WJw1tLse2Ewb2fRrTcX6ez+vV5qeycxu//UvLi+vyxCxxZI7NuxPSQXqY0mF?=
 =?us-ascii?Q?ODL8vhHVDE3nhIeorLiHZq9OVhyQ4RnVbZyCqAn85dZSMwNoKLtXgRjDjU+y?=
 =?us-ascii?Q?WJaAJQY1w/1p3bapSqRHoGRoPdibDhQ/pdkpkbuFmLG4KvaGIP7ki0SMXa8l?=
 =?us-ascii?Q?aY3d8s55K2EFyYUczdp2zEtf1bASGqVcN0w+U8FYqfgNGPCGfy3215u37p88?=
 =?us-ascii?Q?GblrJElVZnW6e3dRjVPZCyklNXSeJjNSzzgs8C8pTp3I2G9Ghkip5IqJdzBA?=
 =?us-ascii?Q?VBBnOYax42yJHPF+2J15GcjK/mAlq3IvaMw6msPujAKVj+W1C+w9yLtdX7pt?=
 =?us-ascii?Q?mQYCF/inlhPVPj2YM2dbzWTLTmpjkw8FdoloHk0LBOx6cMrG1zTIHYUyKnGD?=
 =?us-ascii?Q?Jqdd6+5Muovh+I9ZKtlKuVhixHMfCdPJYAylM6lUGKjaECZJob17H97NaAWa?=
 =?us-ascii?Q?DIeXJq+WiQDTpiyRLoMSoNVfYSR860c/ONbKmQnY2/qe3M0+AeFH/gPk8qu9?=
 =?us-ascii?Q?Dm9XtjEGesBSGOVVXD4TPXWfg0h5W6XcrPJXwenAT3zmxpke++cZdFjk/ptN?=
 =?us-ascii?Q?0+CxuBO1lmYF7j7Jn+L3WsHGXNPuQoCCMttpEPV9hnrJz0UV85TqWjWIuzUP?=
 =?us-ascii?Q?Hu6N1fxub5ICRZkFZwIQb/+dd1OykOVEpL55nCaOOnl1DOJG9HfHW54QsFo/?=
 =?us-ascii?Q?eBV8DSJBe8tzRKukZJCrS/bH3tdWCY77dw282gI2aZXVux/bH/tZUO9+Daen?=
 =?us-ascii?Q?E18013vCFwsuHszB5yepN+F0fg2hMoIq3QqXASfSNjpreLyebuozId7DcJ7g?=
 =?us-ascii?Q?pyz8H/8AWZq+P5S0vLrfQHgARnYkcI8oHoxdM3iNzy5A4ZHKn8h6v+nlRolw?=
 =?us-ascii?Q?MSSTy2wHboCp6Y5NK7NKlzcSFVWwcQWir4Ltcy6/e2/ZBm89VNoslSqqu0/m?=
 =?us-ascii?Q?D6rICDr/mlIoESXB/7sxvEosRyBbgIAs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rpMuYGE9dPeteGq/wdJP5YqLkuwOA1AVMB700DyKocdkwKGLmVri/zHmRxi+?=
 =?us-ascii?Q?8fHx3xAky1BMPyCDSBJ1UM30QnoFh6z7ttJHbfdEmx0+z7r288W9RAUE4Ual?=
 =?us-ascii?Q?UtHCAAiJwwUl1+ySmjPktPAOqijHn94WQ8K3+lcFvYU3TBaPe/ZnQZLxi0B/?=
 =?us-ascii?Q?POTRAp8pk+v6z1f4uKqX7DHhZbaA1oTWnN3bVljt1+nn58HhnQFgdLFd3G1l?=
 =?us-ascii?Q?iJG5bF3eU6YbDbbSY/uOA9lrnUo2j5Xee3knP5N2DKIRgufD7wKTt+Y6MT5N?=
 =?us-ascii?Q?/iGBr0W89zf2bfauy8uoin46+HxoGDdEdDrsLHqYHB8S0414F9Bs2GR3Ho/D?=
 =?us-ascii?Q?gPgK+aHoDjDEpLcQPIHRjQZvkc3DFLHtSCEg5Lrwfycdo377t+b7qE6M2Z5s?=
 =?us-ascii?Q?V/IgRaAkQIsRDS/lHG477MjLi6Lxaq7uFiB9sOgIhAPk9UkijqP0pLl2M1ZQ?=
 =?us-ascii?Q?T3PT2aaxjpjZv2Dc0eUmaHO3uXwMGW3KpJFSG5EPIk2uNqb017+wF7xc6+fM?=
 =?us-ascii?Q?fDaPTdQ9gZnHz3VU/Yd3hVcwsPkQ3A4KKK29kYA8jl7zEz5VqDspS5mWLanM?=
 =?us-ascii?Q?UxzAdQpMRpAmPeweOk7QY58oxRG47KS3Sk5uslBX+fRDBGzUZbWGl2tiJff3?=
 =?us-ascii?Q?SzE9XxGXT91c0ZP6qB21//ZFmgkiPMVwtPTflVeoUXaNG3X9RK0hLBYCyTXv?=
 =?us-ascii?Q?Y/ngomiGsZDO29oRDT3RlEa01QjY3dUuF/K87dIs1pTx2rqKwjoPhkF4Xrjz?=
 =?us-ascii?Q?8ZvVwPi08KwKV/G8QnIwXdpTp5Osz+1aSAM+Sml0ujE7J+UlgPP7d6WTpL8i?=
 =?us-ascii?Q?hhV192L3pTf/gG2s/RxLp3yoVdf7uXTA6NRGKvfJ2+ckLs5xJswH0Uj/HaB7?=
 =?us-ascii?Q?gthhje/IOmAc642I4DI4qLv5fmK0KTQKtqHCauDWsRBsFVrmJtaqVbRyzYSR?=
 =?us-ascii?Q?dkyR7e18eMw6gDlQjXcdS8SWLfJvgtNYZ9QNJINqICKmi28Lj2Och5dD0xlT?=
 =?us-ascii?Q?+qEsRDFRVz/riSQHKDE2GzqAnXMnTgperSM87m29UN1WLwk5BbFiRxhC0Sz+?=
 =?us-ascii?Q?ZhNNOURW2MULjuKKiBe3KiA7W5PobMYRCVoQya8AIxDml6yrxq8RNEw92XLN?=
 =?us-ascii?Q?lISIusorPPNJWENczuZVDgKYWBxFEhDox39wqrWXVQuMxt6+4l5g4Mp/vqh8?=
 =?us-ascii?Q?WzJRRBUWD/92ApuSYBEKT44V3Yah7TROW5Zra5ZSkZvuxoOLvXGjOOfvhewZ?=
 =?us-ascii?Q?uBVfxDSKEDRsrGCNlMRjQU0Ovcr/aYwx5cWHJtTUHSF8ZgMe9cYXbPOEbSvd?=
 =?us-ascii?Q?8g3QDHXF4uqWXnlgmil1EfFGrbeih1fDxPCNs2i33cc4KB/72rx5PpxMl4G4?=
 =?us-ascii?Q?n8Ffl7AmxlAzQPbiS42EpdhsTgtZGajqc9jn+tJvNS2j/fejgqbpXTRgfanX?=
 =?us-ascii?Q?V1ws/Zt/SgvNlYJfNcYntbkgNQmdrDQIXUurRILaKDVXp90eOl/qxdJmjBqx?=
 =?us-ascii?Q?2NmVTk2GRWZGLAnxv0cDRg1f6ZfsjHHZ87cNSWMQGNl4Ud0X9Fxw8HxI6WfN?=
 =?us-ascii?Q?q+l50byWPgUzCZPognciTSJeArEWdIIbymygUPwpT5ohULzHP84GC50r7q6B?=
 =?us-ascii?Q?MtNQ3ATiypA+zttMss93ZtE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87a3b40-3008-48b3-4134-08dd2df31a58
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 01:40:30.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XesrGeOrSnUUVqD8AAIQvddKCtobFIlGqrbmnDS8MPkFMuMvrrBxQIsYe07yg3DI0vACNXE7bl/SJF1O4KUuHQtKtMKUKPZtvgjkAoormZvdIm+pank5fm+eScK9lx+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14080


Hi Stephen

> It is handy to know whether the link is playback-only/capture-only when
> debugging.
> 
> Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
> ---
>  include/sound/simple_card_utils.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
> index af79f680c72a..fc149fc18ad6 100644
> --- a/include/sound/simple_card_utils.h
> +++ b/include/sound/simple_card_utils.h
> @@ -267,6 +267,9 @@ static inline void simple_util_debug_info(struct simple_util_priv *priv)
>  			dev_dbg(dev, "link name = %s\n", link->name);
>  		if (link->dai_fmt)
>  			dev_dbg(dev, "link format = %04x\n", link->dai_fmt);
> +		if (link->playback_only || link->capture_only)
> +			dev_dbg(dev, "link is %s only",
> +				link->playback_only ? "PLAYBACK" : "CAPTURE");
>  		if (props->adata.convert_rate)
>  			dev_dbg(dev, "convert_rate = %d\n", props->adata.convert_rate);
>  		if (props->adata.convert_channels)

I like this instead. It will be less misunderstand.

	if (link->playback_only)
		dev_dbg(dev, "link has playback_only");
	if (link->capture_only)
		dev_dbg(dev, "link has capture_only");

Please add "To: Mark Brown <broonie@kernel.org>" on this patch.

In Subject,
	- asoc: ...
	+ ASoC: ...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
