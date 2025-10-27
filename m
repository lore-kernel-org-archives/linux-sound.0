Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363427FD62
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 06:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545475; cv=fail; b=ajMncSyZRfw9KqfLVg9sRSEnu9CegSPrzrKfOW1gY36Hdi0H8tFrPAhZX7aVbkdBI6ivuJWVzA3nY3sCzdMNWlkL3M5B1ZK3bAG3S5MyAzNqGHmmeC7tPUAV4d+PzhDi5UyF3bmP65wp2IZgkqiqHY4sqw+/3Rg22rIrkgSM0gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545475; c=relaxed/simple;
	bh=kpfeSO1XX/2mBnjMctULikaztpkIyxB4xsKpwEWeTbk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bPPCMEtZl0z44C9asCdp2QtNOjenb1vYCWHHxrVzFXiGTmOR238pLqgt0ziuYQZqZwttLGEgPenV5k+QBuJztw8rpM1LWo2LPlU8lai9hs89h3DWNSCf32qSbZ+Nphf53PKz0i6fX+duxt1NgMfagCI/uLmx1GryuWUPJhZqh5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d5VmAuk5; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d5VmAuk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1pWMdnwA2sjSUfv/KImwr2B38+R5jGT1cR/SrgaZLKYbkPGU48gPzNM0n9oc6MjIekyIwD2SWlgg8Jw7U7JhFLwi7bjwceVWDaufY8eq3PcsxFuaBt/xwgZvlxsnOnhZCabPkPrZGN0d/5qjU+RQh8bORYCZrMruHwUi0FKW+W0EAsKzEp6JefLJIxv3kdbuxMprIZKwjYSOqcVlkSxzpGZ1TcMMKMT+KI+/LAvs+ww36B+Db2prDktiZGOpMFNphQSR36jmQUsFGq/rXi9p9nPTUSb9TzGNivAfeI+i77y40FNN5gc+NlgCFcYHGZb8P5GuAS7cMvZEN0kIhYm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oNoxwach7/RSwPt69KGYwPxF8xiJ7lUaUMBiQ+wzRo=;
 b=yZIBd8PIX6LD5PiDOJkYq6WECBE4Pi+NJhXe2FYXho9V9AX/SjHo5Lf9Xavgb7Q7NOTe6B7cFM+pooQfLpaMmYQ1sK1llfzVQsVasOZ8n8KyPooLLuK7Fu8oZVaXUicY008nCbVN4I88Aw94VeumMSaV4KZMjn5pUBmeXH0Y/m8HYUZAOsFHuR3BeVPNANVm9t3dPbpxQ6iSVy499Jkd5lgQGAUl5NlilEnIgZ111IymP1wEj7WT60NDk/bHU6Z3DnFd8Uc8PBry/nV8bjODGUn/kj3aVPXnx7zm7XNtZgCYkpLtsDiKbLr8fTT/WcGtSle2pwBx325/yixckTqzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oNoxwach7/RSwPt69KGYwPxF8xiJ7lUaUMBiQ+wzRo=;
 b=d5VmAuk5Gl0BoP07vpE0aIhFBxkjTVpsjC5KNDIBrjUJImC2CtxZqszA071M51FoW7G3mFRSgAgfOVvdhzmNBGM9xtXB800nTLhfMRtFNB6BIYKEiaq5fk3yJ2a1e/Ogrf04JbdFiTQfFX5FPvTSlaB8uzwJJUFlHoXPvaBRpzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15801.jpnprd01.prod.outlook.com
 (2603:1096:604:3d6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 27 Oct
 2025 06:11:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Mon, 27 Oct 2025
 06:11:02 +0000
Message-ID: <87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com
Subject: Re: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
In-Reply-To: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
References: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Oct 2025 06:11:02 +0000
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15801:EE_
X-MS-Office365-Filtering-Correlation-Id: 84afef48-0202-48d3-bb39-08de151f9b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z03qgjBcfUKk+LXtCV69dPj6W/6MVYIargf78yaRFoLUhIy3R6RB4jfqhueQ?=
 =?us-ascii?Q?Pl0uV/sAmuXQH2RHRQWRLD0h3gLK0GVobNnEqZjexavkMB5Wut7nmV9qbUHm?=
 =?us-ascii?Q?SG5jPM4bC5TM/zITOwflKz1VRgo1ekwPXAwYhZes1ZcwXe93vFAB4m3YuHgZ?=
 =?us-ascii?Q?EBy0vioap08zLPC0HbEReJWwHJplU3SW0CAtOoIcGmsxrHuUZAvcD8xSx6/s?=
 =?us-ascii?Q?Wpc3XNCP0+VKcrL+OgDQXV70J3dkU8RIuzdoGZU75XETaDyzwjIVgvLHfH3K?=
 =?us-ascii?Q?dFWbK2vJ2GA6W2t/pg2Aqf0/qkcCtQMZ2RI1bo+6NZchS2v0Z+A+GHF6a75M?=
 =?us-ascii?Q?6aUlgR3ALAPCHsCee3JE8/uJ/uSG2kMoqqS5lvSJ7hFlpAijyfhcZOLgY/3X?=
 =?us-ascii?Q?+qoCxEb7vPczLijmCbTdLqJT9WDVUDZtJP/cy80aCH2V+Lp+XzEXIl9aCRip?=
 =?us-ascii?Q?TPeUh2Zchq8gxwkxpacQo/9NKk0b+qNupc4V99Ve/+8a4ICPRPfbwydHwWha?=
 =?us-ascii?Q?HGuGZqPYGDFPp9y4NVf2a72sShRlZBNft+jEvAqm6z8/OLP/bgCm94WM5b2t?=
 =?us-ascii?Q?289d8yy/O70QS4SQgShpt1CxxqKlUut01VgYt1yoEQl8GDuku1dCr3w/DsGX?=
 =?us-ascii?Q?kw2WqI7oYA8HA7VaA4XOruhJ5tq4A8Azh+gJP7q+X1k+6z4q1cfNyW35+cwE?=
 =?us-ascii?Q?S3kBB0yszSc3M4lMrnj/NBEyDDFTLAFGdiU0EJLl5cdfw5+Fb9fZK7aLbLqx?=
 =?us-ascii?Q?62SpIN96IslbKgfVnc/Ji0K9M2Sephy1xdJejkkUsALC87HCCQCuUad91vkB?=
 =?us-ascii?Q?VvlSMXbzlcvmHwXMuIVDwvpR5M6FQt0RyDUGE53PRQTkNXiwZ4tgLtfnAwuz?=
 =?us-ascii?Q?Cqbhpf7gWC1LofnZNonYuuCC8gFPvWj45l7fBFCQo5Sn27cWAIXfwy3lJ21z?=
 =?us-ascii?Q?xrRS5V5p3gBCqIX+Sx2a+5COaRjATmStBXB2URrrjixricjRYd3dUHq0uz4c?=
 =?us-ascii?Q?v2gcYoDwRyTS83MdihvNnDqCeoaZ32LVbXHZsZLnW31OwJ0O/R0RxhEzwSFC?=
 =?us-ascii?Q?WrRiM20eiTTznbieIeTWR7w68LvWVlVUs7a/IG1SMf7avVz0+iinhzxEO367?=
 =?us-ascii?Q?3lsrBEYnIk8QZV3dz65rK08RZAaLYrzro/S9BwRZUhYRZDtXVTeq9OYbi9v8?=
 =?us-ascii?Q?hoC4pbLbNqVE+aJC2XX0i28nbWHwvhHJIyuL9DCBB9sJxAf2c49d9pUB7FXR?=
 =?us-ascii?Q?nH6ChLEFcCguhMJp1g75/mwwX7GXC/sntfkBais9pzUEfuXBceVKPiI65gbc?=
 =?us-ascii?Q?2AVHxWZ18FFJbRpIp/UO/XHypF8fVpJYAgd1XJeQux5QNMvornVq0OhQgUDq?=
 =?us-ascii?Q?+gZuFt7o8qk6bsJsyhTf/tR+yGZswgBHKUmqhfzTChcI8VcYC4VNqLLOXbsR?=
 =?us-ascii?Q?3mNXYDm9IRfroPI+Aji9X88iuuZ2zVcR31saQNva3tBy9aHQ/gXwhJwVBzWM?=
 =?us-ascii?Q?psmmR/Ov4tCbclIhnpnwJWypYz526bxuWB6B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xg8qR4OI3gqe1RPMdF3pPCvXLfeLM4A3lwzboOVpyKk/S7JxFu21bVYZX3Ei?=
 =?us-ascii?Q?0H97290/uqOrM5kg1lfwAlRzL6NvXNge6/NFXzuNK9rHvPqHxfP0YFry2MzI?=
 =?us-ascii?Q?tGx2G14bDEb+OFtgAGRiJ/OWpYSswuaoOZ2i0D6GJe1XeY3Ywyh2T8tvYXbf?=
 =?us-ascii?Q?N6/Dp9bgW2XWAM4wlc3pHAjehB6dDNS41EQRJUKv5nIMbMzb/lZu5dZ73vdi?=
 =?us-ascii?Q?KSbkPGdJzYr9AHv6OtX+G2b/1uBjcC/Rdj7mi6ejVgAcpxwio5W/+oJdYVzF?=
 =?us-ascii?Q?DfayiKCI3vsYcTBaqoQ9mvUljs8kxV/lvZ1NX5A5Fr2OHvBTgagiuw2qg71w?=
 =?us-ascii?Q?JsrMk72XWlVJXT+ag6hGW4RnmnVb7p1we3xiwQZW5LeIXkjWmQXLJHZbcuRn?=
 =?us-ascii?Q?wxFr+KnSDI4Qi50m6jdtCvTJvAIWKcdVc573Jw1nzbyhWDTnYsKPn5vJj40e?=
 =?us-ascii?Q?2wI+9v7wnfll70t1BxoOeEaGOVVffp+XVtoy0QhSvaYoWAWLej3Nlgq9KQgO?=
 =?us-ascii?Q?5ct99W4JOtGk8CjbbK567EO369CHHTL9644LRo6rPYejZN6kj3KT3w71WvYS?=
 =?us-ascii?Q?lrqk8y6cF3kruCBy1pcCc+vukRsigj2isBNAGew+qv0fQckhYmdYBAwLLV8M?=
 =?us-ascii?Q?TpIhTT1rwd1UpXpNDHH3PYm71d39w5gE84Z4D77keiyorgFUhYTCEynUUbiO?=
 =?us-ascii?Q?kitYexlhfIJOPiKBuqfZRPS2b5sj14k7dFB3zE2KdDFtKV1N8yTMVlX0qUIV?=
 =?us-ascii?Q?PwafOcH+UrEh34aCY6E88XTRPzFcFsaCCpgvHMmhd5GFg3LpwIl56KDx5Q10?=
 =?us-ascii?Q?EhxSA9f6t06B209Ixe4HtnsV7E+C6aP6x8e0ZP1BTH2ATA9Lx+qJruvTNXgw?=
 =?us-ascii?Q?rxp7He4spUOSaG4B/Jie+iINPblLrmQvsaTn2XAcv5GIguOY8afvvkn40skd?=
 =?us-ascii?Q?52UUnljpQ20m1AaxvQJXRQcVVlqbupL65hkJU7XM3qS2uBV7OtVSxhlx36dN?=
 =?us-ascii?Q?rfLKAtZt/TcXqPHtj6VK/V6zfJn2DExCeJgxjRbjX6u98HiD3L5Amxid1+xo?=
 =?us-ascii?Q?UI4P/TcObayxkdnJPh1/tl766w+0MstOvebkI3TWf0JYwx8p8pU7YaZeWkIr?=
 =?us-ascii?Q?vXNRoB3lG50Z4/gCT1NXhHxU9auTHBJo+grmxtWIQ11OSNTWWx2N8sk4Nusp?=
 =?us-ascii?Q?8Voyv2/SZu8zSU31ALWGORBU8CaT4H/sLNuqAHCK9dhl/dvES4B1Zsayu6we?=
 =?us-ascii?Q?saLszu7nNTC2f4Me9dbElsgtW0aKAQJRp+R2jzZtNqIW8ugwKXT6LPLJtkIF?=
 =?us-ascii?Q?BuyQgmoFd9qBHNu7Vxkuc1ZWc/gEHU90A7BD6BIhEXTxqa7xo47LFkSq2RzB?=
 =?us-ascii?Q?a4/XxWZkDwWZB9bl+Vu7Y/amMk2gMRCXv3s3VjuQk3takaZ4nHPDJELH09on?=
 =?us-ascii?Q?GeZ/+WpnXgrV6EX0bbFAXcclxheJRPrAIrEhTPsp77pCluRRxuhsO9Fg2/Ue?=
 =?us-ascii?Q?2mRZYusT5lC5gwBdnjsDTg4BZxeepvGEr4N9bM6mNJj68Gz578XEFwNMugKz?=
 =?us-ascii?Q?RhE8TtiC2kqXUnrw9X/7A9uZks2Wm2eQrY7UB15tUBTN/ZqrTLfABlIhtOee?=
 =?us-ascii?Q?xhaI9MJ2U61h79XWbqIhq8s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84afef48-0202-48d3-bb39-08de151f9b00
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:11:02.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5lMbJdmXatBoQkmtMUWC4oENLjMosQVMMuY9DBhgnG0JQU9Roa37MWdMq2vWr2tpYmUCb5Am9OnWJHlFqCq0+XiAu/UZTv7okgYxxXeaknUV1It0E/uD6X5v/x1HUlA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15801


Hi Peter

Thank you for the patch

> Component drivers can prepare snd_pcm_hardware struct based on the hardware
> capabilities which information should not be discarded.
> 
> Only touch the rates, channels_max and formats if they were left to 0,
> otherwise keep the provided configuration intact for the parameter cross
> checking decision.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
(snip)
> -	soc_pcm_hw_init(hw);
> -
> -	if (formats)
> -		hw->formats &= formats;
> +	/*
> +	 * Initialize only pcm hardware patameters that has not been initialized
> +	 * and preserve the configuration which might have been provided by
> +	 * component drivers
> +	 */
> +	if (!hw->rates)
> +		hw->rates = UINT_MAX;
> +	if (!hw->rate_max)
> +		hw->rate_max = UINT_MAX;
> +	if (!hw->channels_max)
> +		hw->channels_max = UINT_MAX;
> +	if (!hw->formats)
> +		hw->formats = ULLONG_MAX;

soc_pcm_hw_init() is used from only 2 functions

	(a) snd_soc_runtime_calc_hw()
	(b) dpcm_runtime_setup_fe()

And this patch fixed not to use it in (b).
Setting same variable in multiple method is not good idea, IMO.

How about like this ?

	static void soc_pcm_hw_init(struct snd_pcm_hardware *hw, boot force)
	{
		if (force || !hw->rates)
			hw->rates		= UINT_MAX;
		if (force || !hw->rate_max)
			hw->rate_max		= UINT_MAX;
		if (force || !hw->channels_max)
			hw->channels_max	= UINT_MAX;
		if (force || !hw->formats)
			hw->formats		= ULLONG_MAX;

		hw->rate_min		= 0;
		hw->channels_min	= 0;
	}

	int snd_soc_runtime_calc_hw(...)
	{
		...
		soc_pcm_hw_init(hw, true);
		...
	}

	int dpcm_runtime_setup_fe(...)
	{
		...
		soc_pcm_hw_init(hw, false);
		...
	}


Thank you for your help !!

Best regards
---
Kuninori Morimoto
