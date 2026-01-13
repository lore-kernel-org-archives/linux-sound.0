Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A08156F45;
	Tue, 13 Jan 2026 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271617; cv=fail; b=PU5hmBdi5G0o+TJ8DS5dU+VnGskRbvp33pioa5D28/P6NvfWxlDZp8TK4s7qp0hmsizeogrXdf34F1G8P8iAqWpeKiNkwRW1g+ZwTIRYOSUaBH1kdHJokVuPJmnyOTv/q8NwKXZeAVcycHwIJcqIJzx7+1yH7TWJp1szQI/q+p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271617; c=relaxed/simple;
	bh=3w0D4ey3xnKNXNTWSQffaRae9RjOZ6O8GGaGA4ycToY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GFHBtibOUlKciI9GJM94PP2EUgNF7bZlt9Mk99EueB05eyOHUqgJzGTKMUDf9qdHs1H6XT/ncOsQ2jMWgJi7q3pJdL/mS65jDiWrkMtWcV6rSS33LjnGx2eqMBgyRdEPKWVWRIrqP8tuzQqjkberpZKRuqr85SjOErYH39RuKzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QbT7yg5D; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QbT7yg5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeWEmIkBXXUW5VbKEzc7e9/KXd3UpYggFAS4jv5zkz63zy6T/1ykJbiuR7WEyQCZkPeY0qcQUAVbuxKZLLP8ERkt3aKbLNcupd8iCcHEbvFNEZ6YF2D4Wj3ghQVPFyxu9XclAtM3y/BK7htvjQqQRwOfkX0c1xiUAWqtrZFn0FYS8BUVSzJUm8yJByDnoSnnLBujuR+T+Zwr5ZfavICXAnslXhaJdD6vDOE4dcuHAVmSW1uPZjO17LqynfH7iU5u2s9q3E+jAwJsJGIdH7WwLzudypC5PiJ/Lcs1PZ0/FgSQ98MCsvBl8H9/utySXpcZ3nKJThxTGMpq95IzEuA28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rrd6b+f2TY66K7YlrsIDyQ+enZMtQrC2GWyTxaONfo=;
 b=SrXWblRmmmOFXRgc3elYPjEyjNW79SI38u5S88/lBgHCr7CzFDHPgHs/+1iBfRbzjHzCtASJ4u7yKCVLTuSr847a/sG+xZAXL8Q2M3FiYSHW3nzQk1E0Jgdz85GlV9oC3NlsQS6C+ZcqRolgPAVouYQx7mybI4m4ZHIHoKLGcc8L2qhUuCnDJBCOXGiByWsmuDNbf8ZFtGK2hwg7EmkYwHfVcnoa18tKf2ysvIviM7b5FujAdGBnMVT+LdNUTqnAzf4C5ZBZw7cX7fH2Bxnh+8E3peG4HMV4BDI5ACjQJOY5/DfO61dVJFINXtJuFWzgMWuaP2k6HrTETncI7Cj43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rrd6b+f2TY66K7YlrsIDyQ+enZMtQrC2GWyTxaONfo=;
 b=QbT7yg5DufT/Im9sz0QBddQaxI1sv/W/kRUQ/nRKD4lYhz40JO/p3aVbUtMC8ZA68n1zU25zsU1dLXyUL3QwW7VD/en4lwIaW34oqrsLW2vC2xYpgH0fmyRCWs2QPP+Rbqr9J2/xeWqw7nV4vMzptoox/RX/b/AQK2DjshKQLYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYCPR01MB8358.jpnprd01.prod.outlook.com (2603:1096:400:152::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 02:33:31 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 02:33:31 +0000
Message-ID: <87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Fabio Forni <development@redaril.me>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe function
In-Reply-To: <20260112231855.193030-4-development@redaril.me>
References: <20260112231855.193030-1-development@redaril.me>
	<20260112231855.193030-4-development@redaril.me>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Jan 2026 02:33:31 +0000
X-ClientProxiedBy: TYCPR01CA0022.jpnprd01.prod.outlook.com (2603:1096:405::34)
 To TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYCPR01MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0510ca-2a4f-443e-feec-08de524c247b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8NklvMeMfD/o6sBVlJwYExj04LVsgcdhRc2fPzN1eN2eQI8+6PGsunDlMcv?=
 =?us-ascii?Q?yeLUp0JN5wHMMEC7ImjHDL/R/mSCDyvW7XWmW1bzEY8hl2m/ZEr/rUR6p7dY?=
 =?us-ascii?Q?roSC6ehpSv6O1yR1f4sitlBZPdSCHXiiNJqC6r99UQ6wq7Pin18mG7RSgkoI?=
 =?us-ascii?Q?ubpyzMGR5gVScjjKKUQxkyi9P8vWb+Cxwwp37sZsBUDoPpjhAlydbKsVJRbs?=
 =?us-ascii?Q?WyEyeMGiH8J+PJgo//Qy606cc6BP0awI2J4Zh+BvcbFT6MBLGn2yEeCkLrbu?=
 =?us-ascii?Q?qsJZ5y/0tAKb2X0pQnGYKJMhE0SMpyNo8SgTspwc5Cju1fB27TujNVGr9cLg?=
 =?us-ascii?Q?JgXzE/nIF/aL9tHHCnUpKmId9m7BnW1CGaU1TtZOKBqmng0Q3R1RdUst2gFh?=
 =?us-ascii?Q?a3cJ9BdfPZRO1nE5ZnISLr5yEfcVwHN60DqERgSruJG4Ri5muc2OrZGx0YmN?=
 =?us-ascii?Q?Myr5yBF5wQaSEP/jMTWgboWHbq+Ai1zVHoN5tiiW7WDaReJsHDG/R4vj1nff?=
 =?us-ascii?Q?y8Y7JC4jN7F92YEA8ubLtAy2oUebQjku4BWGc/y9eZbUiDs3TKA7YUvvM9Qt?=
 =?us-ascii?Q?2Z3aV7nSKdFhLb9KMSmjnVfGeiUYEokMIdMUM5jaXdk+nfTUIT9RkdbNVB3u?=
 =?us-ascii?Q?EePCPggaL5/fQkE42NG7Us0Y0xIBOidYljFZKPM6sDuahtd80MvnuSh1TjeJ?=
 =?us-ascii?Q?O/9jfxAJQQKL0M6CbTMnTahXtE8CHZfqULaDKMfeO0nbPe5dTUZZp4XvJ2J0?=
 =?us-ascii?Q?9r0qalFT4mlezIRqiJR7a6tARBqXESWCjhGWgksL84A+MV0EzyosKYd6BvtU?=
 =?us-ascii?Q?FEjfN8blsJsFzbdnCsdrQGxTenlLhStvnupmP+vmQIHvt7w9gjwsV7YqL8Mx?=
 =?us-ascii?Q?dg/JOMGPfOA4gDIuSfz6+nWwkK8VJlprqz5qUhcZWfS0rfF4UmSurJxvaR5q?=
 =?us-ascii?Q?7kbOlfwWr+sF7EWrvZg8ZOiwEYciwKu7K6E38m9qJqo8dEeOPGMpPxV3Lrd5?=
 =?us-ascii?Q?ds3Y9K0+gAlV5ARjJQPjMV1ZufWWQ3gEGnDHpXEeH+OVwULVqdCv5yf+gb+f?=
 =?us-ascii?Q?R2TZzFAxMmpQjbfpxY4mmVRzgDDXfYBPZ/CWwJ5VZDSoWuCNAB9UZ3iKeG7/?=
 =?us-ascii?Q?5ME78gd1ZCJO3szdEkr39vpu9hiwNhZnOnm9kaw/+dX/LklcBvOZT7TKs+Ge?=
 =?us-ascii?Q?Ccgi2XwPMBYo4O/yJD4WLFZaj83xCfdD8OyHDdOAkNzfc1rpFyKgBpSOmXDq?=
 =?us-ascii?Q?pLK7uFUOjKSJIVekUpVHb2BfEiJURJ0Ft2ix/LJiJ49u3BFuMfVrOnI5mBEB?=
 =?us-ascii?Q?W+iXlznMZjt2Aop96kvU23rimevUVd76+jj2/7Bai05XfaHTiAMi3L48D8qz?=
 =?us-ascii?Q?KKm0/aV1Jmvjf5bKHxJgOHsQTJJ1BwH388rgp6IkMqfHD7Qw7/neWCzPBnLg?=
 =?us-ascii?Q?G/HQW7o2BYa7I1zSr/AfzGO3wFu4lsIXhzHA5mTMLXnm8xaKNOrtrEeA40p0?=
 =?us-ascii?Q?S+ddlRO4ZyqnV6noKVLaq97h1NWSJraXbQAj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l5mOq5dkKCo/yEbONyNlItQ+bdzIlQ2SUtsyW3X+7Zso2Fog62v9y9DPHU3h?=
 =?us-ascii?Q?h4gASqOV4Onygo3CYhwcjXsKxBG4DJDYu0YArNVLNKuWG0yCZzhTjhl/Wvb4?=
 =?us-ascii?Q?KP12Mw28+zMMAa5t0jSG7SwtQchW8eGch9ML+89jLjDz8J8puIce51qVrqAt?=
 =?us-ascii?Q?xYUOIdFW7B4GMHxlWa5+qHaUrbWjhkFwnS3jiXjb39+rNMLwJ6l81Fr8tLXl?=
 =?us-ascii?Q?w1gPnazcRU96ysepHiwSEtratA+XCXcp7yjKZqle5F4Bs/rIWGIafNnGbr9S?=
 =?us-ascii?Q?GUcDBwcGPnyKkCTxnImwi7dZWdStPRPCFcY8/cWxf4N+T61cXM5oEEBxuPDs?=
 =?us-ascii?Q?dzRBE6Djts+RutuuG5IoGeyv+Hpa+ErAg8jfuqanCEh2t3DkLFxpFYgLlv4Q?=
 =?us-ascii?Q?8mpW0DYAZX6XgvaPzYR7Rzbdvp450eRhHp9BKuw7L50oTYBFJ27tvC+Ub9Lx?=
 =?us-ascii?Q?N79LFEdNvejGYWivd3Y+YYxwCysYuD2eG+TnXVq6v+5Wewzwfpi4rS7ex4JO?=
 =?us-ascii?Q?JOes6h8xBU6OKM09iDOZy5UljTTPuw3cfzypOT6B991pnObZe66XBW1jkaTo?=
 =?us-ascii?Q?KMvJU8AKb2uxLTT9pbcLS17wWb9bWLG4qt+n19df0P5RFyarVUkKKfU0Vcwb?=
 =?us-ascii?Q?Bjbfa1T460Q++XQOE/v2uGNBornshoonNIA6M4cz3f+QM5tUG1GLk3lFYrVe?=
 =?us-ascii?Q?B/rVlKTLwoo+EWVKHYBVuXDJdqefnl0yAI1Nqn8vjldrIUSkQ2MQ/DQiGo1I?=
 =?us-ascii?Q?EN67FzI6hi4nFrFpSv4GPD5C0yNZbmnDKJLPDc2QCZfN0IEatzxuSW2Zb+Zf?=
 =?us-ascii?Q?YwjwtDXk8Q0gEZ9ClrHySh4g8o5lA3pT/SXcDBXS8P3W6hhqLtxEY0UO825m?=
 =?us-ascii?Q?Uhe0hdpHB9CCo8MO5ny6lq4HOMiSN+aLki5Hm6/g0pPNGAGIA+XyIWhMbtNE?=
 =?us-ascii?Q?la0Jq6E4UItg8T4LPaVZQT9yxsPqMkBWoB84VwLu4cHXSVX21lheBm4H9/dw?=
 =?us-ascii?Q?wADXEOl7ucC427tjgo0WUXKvY3jerwddlxj8XTwOCsS04mKklUgsX5WlJ7r6?=
 =?us-ascii?Q?XlEkkkL7efLt0LtpQlFW7VdkN5aguLk774jddTDJLfq+N33M7mi67V7jcKpk?=
 =?us-ascii?Q?iVi72btfhkjAW9YKoyVEJeLeEsPdJltMWK/DrjFf2QYWtynYNMOmD3B1HEBu?=
 =?us-ascii?Q?INIuJfY3g7Y8CyDrHeP6aPLWQ8KQRESNhtvgMklwW+mhMoOM0VZiQdakkuZ4?=
 =?us-ascii?Q?J/xxO7zzi6nEvA8v0r+X+/WS9diFya9B78PNAVg1UAljbo7e9/4D5EvwCyMy?=
 =?us-ascii?Q?7O6tj81FEWZ+JAap6GQTijXAaEtjUk8S39VNrm02WeTxTOSjeC7PEj/sm15s?=
 =?us-ascii?Q?IXZE4XfVZxU0HB7/gIKq4dQhg6XUymqQiCXDMJneY4j+OKXRMDLNksFmUsM5?=
 =?us-ascii?Q?mMplsBsNmynDdzBXQ30zcgWX/yr7HRjVloX7fkgVn2pDIrXtU4nmCasZx7Zz?=
 =?us-ascii?Q?TaLLbZHRe3pPHClUkdWv2VynxJWDgGfKcqrJssHvTNbgK6mJTCEHQQ0uFPOm?=
 =?us-ascii?Q?mWQdBVPEL2+KJA1lJzL+N4kXxCrDwD/o+h3a7ARzjC/Z1R/3Sw4cWTFnix5D?=
 =?us-ascii?Q?HRMd50Hw6UfdYml26NURpZNL71NvX0Ww2Ac+uSGoeNmqTJ3zcGCTdfhThBDU?=
 =?us-ascii?Q?zhYSX6ScCKL21E1gCX6fHFAtE5Q/YsBFVdx+98ib/w/7HJrkVqGb5Pxo2wtk?=
 =?us-ascii?Q?b2KcLEJWfJ2JQgaQ129qF+TwOt0AElkClzJZZ73Vb7WMlJ6ShcaL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0510ca-2a4f-443e-feec-08de524c247b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:33:31.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUf/Z5bSi1m9SYMdGf7xl/yAU16a6FMYOQFE7aR3f1Jk7tip1rZ+OGh1C3/bbhNzSbjMdFCL7uG0eR0+JMoxxWG3tQrtwMD0Tv2rWWFnt5d/5LRwDbzRFo2BXqEQ/YNC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8358


Hi Fabio

Thank you for your patch

> It wasn't clear to me when different simple_probe's gotos were to be used,
> plus some allocation errors and snd_soc* errors were printed as if they were
> a parsing error. This commit:
> 
>  1. Splits the allocation logic and the initialization logic, respectively in
>     simple_probe and simple_probe_merge_components
>  2. Adds more error messages to improve the debugging experience
>  3. Reduces the cognitive load of gotos, as there is now only one label (I concede
>     that's subjective).
> 
> This commit also documents simple_util_init_priv.
> 
> Signed-off-by: Fabio Forni <development@redaril.me>
> ---
(snip)
> +/**
> + * simple_util_init_priv - Initializes private data of a simple audio card.
> + * @priv: Private data to initialize. Must be pre-allocated.
> + * @li: Links of the card. Cannot be NULL.
> + *
> + * Returns:
> + * * %0       - OK.
> + * * %-ENOMEM - Could not allocate memory.
> + */

This should be separate patch.

> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 298f8cc98130..b8004aa8f452 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -706,47 +706,26 @@ static int simple_soc_probe(struct snd_soc_card *card)
>  	return simple_ret(priv, ret);
>  }
>  
> -static int simple_probe(struct platform_device *pdev)
> +static int simple_probe_merge_components(const struct device *dev,
> +					 struct simple_util_priv *priv,
> +					 struct link_info *li)
>  {
> -	struct simple_util_priv *priv;
> -	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> -	struct snd_soc_card *card;
> +	const struct device_node *np = dev->of_node;
> +	struct snd_soc_card *card = simple_priv_to_card(priv);
>  	int ret;
>  
> -	/* Allocate the private data and the DAI link array */
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	card = simple_priv_to_card(priv);
> -	card->owner		= THIS_MODULE;
> -	card->dev		= dev;
> -	card->probe		= simple_soc_probe;
> -	card->driver_name       = "simple-card";
> -
> -	ret = -ENOMEM;
> -	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
> -	if (!li)
> -		goto end;
> -
> -	ret = simple_get_dais_count(priv, li);
> -	if (ret < 0)
> -		goto end;
> -
> -	ret = -EINVAL;
>  	if (!li->link)
> -		goto end;
> +		return -EINVAL;

no dev_err_probe() ?

>  
> -	ret = simple_util_init_priv(priv, li);
> +	ret = simple_get_dais_count(priv, li);
>  	if (ret < 0)
> -		goto end;
> +		dev_err_probe(dev, ret, "failed to count DAIs");

Here is missing return ?

>  	if (np && of_device_is_available(np)) {
> -
>  		ret = simple_parse_of(priv, li);
>  		if (ret < 0)
> -			goto err;
> +			dev_err_probe(dev, ret,
> +				      "components missing or uninitialized");

Here is missing return ?

Is it clear error message ? It failed parse DT or something ?

> @@ -756,57 +735,85 @@ static int simple_probe(struct platform_device *pdev)
>  		struct snd_soc_dai_link *dai_link = priv->dai_link;
>  		struct simple_dai_props *dai_props = priv->dai_props;
>  
> -		ret = -EINVAL;
> -
>  		cinfo = dev->platform_data;
> -		if (!cinfo) {
> -			dev_err(dev, "no info for asoc-simple-card\n");
> -			goto err;
> -		}
> +		if (!cinfo)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "no info for asoc-simple-card\n");
> +
> +		if (!cinfo->name || !cinfo->codec_dai.name || !cinfo->codec ||
> +		    !cinfo->platform || !cinfo->cpu_dai.name)

I like aligned condition, same as original code.

> +			return dev_err_probe(
> +				dev, -EINVAL,
> +				"insufficient simple_util_info settings\n");

This can be 2 or 1 line ?

> +		cpus = dai_link->cpus;
> +		cpus->dai_name = cinfo->cpu_dai.name;
> +
> +		codecs = dai_link->codecs;
> +		codecs->name = cinfo->codec;
> +		codecs->dai_name = cinfo->codec_dai.name;
> +
> +		platform = dai_link->platforms;
> +		platform->name = cinfo->platform;
> +
> +		card->name = (cinfo->card) ? cinfo->card : cinfo->name;
> +		dai_link->name = cinfo->name;
> +		dai_link->stream_name = cinfo->name;
> +		dai_link->dai_fmt = cinfo->daifmt;
> +		dai_link->init = simple_util_dai_init;

I like tag aligned code, same as original

> +		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
> +		       sizeof(*dai_props->cpu_dai));
> +		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
> +		       sizeof(*dai_props->codec_dai));

These can be 1 line (with aligned. I like aligned code ;) ?

	memcpy(dai_props->cpu_dai,   &cinfo->cpu_dai,   sizeof(*dai_props->cpu_dai));
	memcpy(dai_props->codec_dai, &cinfo->codec_dai, sizeof(*dai_props->codec_dai));

> +static int simple_probe(struct platform_device *pdev)
> +{
> +	struct simple_util_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	struct snd_soc_card *card;
> +	int ret;
>  
> -		codecs			= dai_link->codecs;
> -		codecs->name		= cinfo->codec;
> -		codecs->dai_name	= cinfo->codec_dai.name;
> +	/* Allocate the private data and the DAI link array */
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
>  
> -		platform		= dai_link->platforms;
> -		platform->name		= cinfo->platform;
> +	card = simple_priv_to_card(priv);
> +	card->owner = THIS_MODULE;
> +	card->dev = dev;
> +	card->probe = simple_soc_probe;
> +	card->driver_name = "simple-card";

I like to have tab align here, same as original code.

> -		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
> -		dai_link->name		= cinfo->name;
> -		dai_link->stream_name	= cinfo->name;
> -		dai_link->dai_fmt	= cinfo->daifmt;
> -		dai_link->init		= simple_util_dai_init;
> -		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
> -					sizeof(*dai_props->cpu_dai));
> -		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
> -					sizeof(*dai_props->codec_dai));
> -	}
> +	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
> +	if (!li)
> +		return -ENOMEM;

no dev_err_probe() ?

> +	ret = simple_util_init_priv(priv, li);
> +	if (ret < 0)
> +		return ret;

no dev_err_probe() ?

It is calling simple_util_init_priv() (A) without calling
simple_get_dais_count() (B).
((B) simple_get_dais_count() fill li->num[x].xxx count, and
 (A) simple_util_init_priv() will use it)

I think it doesn't work correctly ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
