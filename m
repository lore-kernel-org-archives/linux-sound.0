Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D56379979;
	Mon, 16 Mar 2026 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703746; cv=fail; b=CFfSI/LC9NPIYyYAnGpZuoAqPNZIc2RpLffeRM1Pp0UzVEktsZauc1zvxY/y87K73Ci3yp1ZAmnFG6wvGfR7WpC1PTMD8J7cYVBdY/x4mqjuaTePgVBcgLBqxCxbjy3thSPS4ruSXps+xJhhoaIQdmuGERjvrBMlLvEESYV1UBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703746; c=relaxed/simple;
	bh=LMxH7pw1ZkxJGGqkb7Ml3YZfYytE+B9Dnjl0RWMldIY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ps2sk1XCmi9mJ1Xiwnw8ukvvvhU9pRxNyfoHy3svpYDgVCpVNWlU36EwfgycXcq4FbLcDsH0mARrBltnKnc+8qhyM8W1zL/FXILWi6qacyJNXsYF963RVgvEnSymqs1Dzgp792Luxo5965f0xCQbdV3FIRTw0Hv0nFsruS1j9Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VKiR7PKr; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VKiR7PKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zl61LaH1tbVgZ2zR1YkUICbqDYQeUe6tJBkd3751p+N1RAQTwbhEBg3dgatrasDblWPSVbyLmiJOA51yUTIBo3VIS1qODehy+WxT4kMHJzrITtvgVhyQK1IPGtudm8vp8tAdEsKu7WDJotRiwHQSsXECDIR57Max+b3pyUj1nC/dbEbrnIdQqOrCHAE62LzOAwWbr8OSAGULTBDjNwCfYvpVyAlv8PAdSiQE+2EF2rLZsqdhqL8tBn0xx8xME22WbLw6HKPUrG07HM4Iri9vQmves2JKl70aE4sKBZdB2/zxVP1HGXg9sMuZPijCbR/OxjAHZPsBEcIW4M2Q0r2C3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeEJzisMTS/MfS8FQIsEcgzPHu3vNeCDB7U0GTaYU8g=;
 b=nZZhQm29sF09v/UOxrEstegH6atNpNlrYcrt27kbna9pfAo981sPyEgeY/gUQCi+18ACOXECw7ePWB7fzyr1+jlEEimzCCKYHqKfH36yNrBKFeAHMdeMKhvg87NughaOkDrKf7KYcnUO2uHFd+Mb9WjuwB+p5RXJ8R7t1IKh+k3ifp4CYWbEafZSQxYsKrYTttgSoXU3wNoEX4vhjZiXFap5wiIYQ/ezjFfMZ/g7ddt4wepDcfYY9FqzrJOfavFb541clpfIdh/Hs3cv/sFWIMDAWIfge/tWpCOWUa3x6++ue6TGQa/6gtbBUz/+0rJSh+Vo3Xtw6ifBQUF4E369zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeEJzisMTS/MfS8FQIsEcgzPHu3vNeCDB7U0GTaYU8g=;
 b=VKiR7PKrTYUecD7bCtGrNwaN8pLKUsS8pbFy4kgTs2z/NSe3d1XpWG+hBr/hRxqG8qCiS+l4m6e/VaYrFAsfzCc50UtGSqxPymHaMpSXuahFFM0hfanLvFwr64baf2YF1LjRC3mkzmMtzrRCmTIKbEqkowIAOezpuMhaOJ9E21k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB14852.jpnprd01.prod.outlook.com (2603:1096:604:3aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 23:28:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.20.9700.024; Mon, 16 Mar 2026
 23:28:45 +0000
Message-ID: <87tsuficas.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils: Check playback-only and capture-only input value
In-Reply-To: <20260316095156.3913910-1-shengjiu.wang@nxp.com>
References: <20260316095156.3913910-1-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 23:28:44 +0000
X-ClientProxiedBy: OSTP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB14852:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f8c558-0298-40fe-1b2e-08de83b3c468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|56012099003|22082099003|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	MNNvfrFkItJTtDk3qQHEUXvnu9CRXtDZY1JBS5IaJHDqH+W3LSSL+xZtrTLXXNMdRTUua4zVwCI96cSOt1tV5vXF24XEZpx2itA25WXXANeNooyjn6z3lF+s5pFlAGcUQN+a585+21hTKcEK63gOZDeaUKv2sE5bBHD2Uw7GwHD0eD2cN6TirSF7AkdMLwQ0Yxv1XYmBUIQAQlC3/da7FkCwNIPgUFvi5Sg8FY11Q5Yxr1MadCq0vJCrisCG50olePQSGqQVN5/F7rxh7PrxFry49MmeIJw0Bx/8NYBBPbCbY8dC9HP8IWwFrlSjGRfnSvwQCtPThN0S+Uqtl51/7yvyXVSx/0zbnmjv27UiHOgeRhQZkO+umP999YfwAmXOA3zQ7HAC4bet9OUfRFJRpNrfUytr4+bK9CXLrxCWNzQsz9bewx5ZN9LzHRW3GFz0G+Z0QbqSNROpNpn8/hTS76S6+p/INVgpBD68jchq8j5veFJHtOWE1ADJkTmpIh7pn2Ez1LoyexXmClPFMyuhc0any8ZamdlPWYDSWlVLlCK/ClyjxMUXi1gyWI9Jpe7x+6nuBDz8USiyWhU4VZHeo35ZrfmQKFhnOtDVOpeJkF+wlwfWsmYBAGlG0Mk+TpWOktZYry/TywskgcS572aMKCxX8wX11GalQZ0DgCLN+RQVr9LOpYgYLvT9jc/uNgntwvo3x9GPkLKNIAbzSUHhdrHOprHuEWA4mQ94FJ4YQKZqkC+WMEiIs7A5bnP+okAEv+DYtGpt3nhPABPkSylgfoDxvOTTi7zf9aBKmumcU7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(56012099003)(22082099003)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3nDzMa0YPfOTPRx0opNfDRP09O+SuXRfqnAx0vzY/2HTUUNyw8+WBzmGZZse?=
 =?us-ascii?Q?Q8bwfWSHoRmGlPIJewWr+Lnn2RYgExDM/bbSiIfss3xknkODE/g6ZMbQ7Bqu?=
 =?us-ascii?Q?7QKYOV0lF2P6aFZ767TwobFsJJoWTQiPmLlr+XF0loA98ippfYQ9u0FaLHfG?=
 =?us-ascii?Q?39XzzHhn9xDteNloeP7cyz6J+9EmzTe2NVsmnVyi8GmFLnnQuSNiWKBQRVgv?=
 =?us-ascii?Q?t9BpOtlvZuYUESxYMT/cf61GQVJAZqnNSMWem2ZyNBNnI34fhs/1INGvjhND?=
 =?us-ascii?Q?JCJ4bqaOfE+EWYDJxGOZVHmV6kix3yacFVKjwy0sUkgk6LRJ9L0UuxounMsF?=
 =?us-ascii?Q?ERXI4T7yI8BetkfG62fVwT0uzuVGUn+pGwGId9IjJQPhgF8UrC2uDa5u8QIa?=
 =?us-ascii?Q?ydMiht+M2SfNJTCW43iw/hSU7a+ug0gFdduozFf+tuFzYeXTn3agnHWoiNaZ?=
 =?us-ascii?Q?W+r7dVAH4p6F/CZTitu10Y1Y/7lBWv/rWDKXiHvAkx8hmDMtUNiGVBmqqWbg?=
 =?us-ascii?Q?aVM/mzX48Ip/xyQ0gfI0f0VuW9fnW65NuUomLkPlhoO1H5Z5UdXHExNdzqRp?=
 =?us-ascii?Q?mYcr0X0mm527epBrg3BXS6tb0zov467WQBn8VMVOu83EPME2jj1zlxwNCGkN?=
 =?us-ascii?Q?exPrA/azki7tXtzG1Cx0u0A68hwE6cvPkI00y9+dfDBP0RLLclfcsDm1+fq6?=
 =?us-ascii?Q?QYNRhAEGgzt4AyDmq1q1OZcVPI4Gk56f8Mw6VTk4F7bWJH0x7hj/1wD4kPqh?=
 =?us-ascii?Q?/WfUl9aUUhB1HnVWvTCdttbzN/2HkZDTBdwpwezqiIS+wTQ5OHeYDtYH6lJ/?=
 =?us-ascii?Q?gSRhXZngY5PyJUmRQ6o7DILsEzlk00xKnNGngf6MYiJfsWW5cY9NZPx+pKjz?=
 =?us-ascii?Q?h09eQAXPlcXCn+Ekui/iQs0UdHJIsjdq+tH98iADAFu5pVyvDoaW4omgAdGb?=
 =?us-ascii?Q?dXsj4x8M6gXlz/5hqCW1KEgvYqldG9GU0DrwUOgkuREVntmYCB0UqqF4jV+X?=
 =?us-ascii?Q?mSi1Ad0mVjxxoHl26Hc4Vn/Yc3mBdTIPZvu7uwTq7xd0kzfL+b0fMJ7UiZdr?=
 =?us-ascii?Q?QzuGJNhqlCMJB3VyIqs+vzbytSMr90fqOTwx993ZTsu+aoJFOCJ6iQzQxMiN?=
 =?us-ascii?Q?TxOAYf9oMYcmWR1LgyfpuyAbiBZp/RXgz9K2CrWgq+bVEyDMolnvMhh0kN0q?=
 =?us-ascii?Q?ZIeVdWY31zmaIWv6wTvslYYvdccA6LoBNKGSzc+LZ0IjI2H2OC3FUFN8MrYD?=
 =?us-ascii?Q?XEqu2eX9wOAUsskMbPYdu/B2RHtzvMQc1jiCrivkiMnXeovonmB5D9WhuD4j?=
 =?us-ascii?Q?NuCc+uga8JbZnhZgYL7UZXdSCU/SDPBjrA8IBOd7U3KNkJ9lT3mO2ARnMmx+?=
 =?us-ascii?Q?YGVtBeLfNgPqBo92Lg5RNYFWPjfKof2RGw8sor9esp4PluO+HsoM62cn7dX7?=
 =?us-ascii?Q?Q8TrW005l53+uyOaVQWKEJA2k3sX/BA4ynf6C/X4bw+ZgAGB7Rek4fDbJV9C?=
 =?us-ascii?Q?Qj8bqs1AgayJ9VOaeWpkgiZHbo6niCfU1mmwJLradfq/BzLEf2rqwlSVetje?=
 =?us-ascii?Q?vEjnZ9wc1Ig/thF5fGRnudlX4PSA3VJF9gEywY3PH50vRwndib8jtyo4Nj+J?=
 =?us-ascii?Q?IwXW6f0XudxvB8sweQ/0EMscMwum43pIZlkY49HmaAA3shU7c4S3g4pr1iFy?=
 =?us-ascii?Q?0E3/6s28uxsa+nkiCfjempoTMbaBEdO0VdLlvrLmWhD4NDF0jeqI74RcvYjm?=
 =?us-ascii?Q?ddWaQ3+3DUQ+Jt8RBh8+2YrPaKWrhlNPLbnAhuhsqe7z3SQDBhFZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f8c558-0298-40fe-1b2e-08de83b3c468
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 23:28:45.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FwK1Pr6HVG4hOd6LteykUNzWPLZbcDrdUS9mfgSPCK7QwXuC43WUEC8U+zlp0mRCjo8e8MFzBUhlnx+Fnxn5OkVv9sYxKbnhnbaoIevrGwsbOeH7iaY3lbpLHr1a0Vc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14852


Hi Shengjiu

> The audio-graph-card2 gets the value of 'playback-only' and
> 'capture_only' property in below sequence, if there is 'playback_only' or
> 'capture_only' property in port_cpu and port_codec nodes, but no these
> properties in ep_cpu and ep_codec nodes, the value of playback_only and
> capture_only will be flushed to zero in the end.
> 
> graph_util_parse_link_direction(lnk,            &playback_only, &capture_only);
> graph_util_parse_link_direction(ports_cpu,      &playback_only, &capture_only);
> graph_util_parse_link_direction(ports_codec,    &playback_only, &capture_only);
> graph_util_parse_link_direction(port_cpu,       &playback_only, &capture_only);
> graph_util_parse_link_direction(port_codec,     &playback_only, &capture_only);
> graph_util_parse_link_direction(ep_cpu,         &playback_only, &capture_only);
> graph_util_parse_link_direction(ep_codec,       &playback_only, &capture_only);
> 
> So check the input value of playback_only and capture_only in
> graph_util_parse_link_direction() function, if they are true, then won't
> rewrite the values.
> 
> Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before overwrite direction")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/generic/simple-card-utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index 3115e1f37c0c..e1564c1f7d8d 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct device_node *np,
>  	bool is_playback_only = of_property_read_bool(np, "playback-only");
>  	bool is_capture_only  = of_property_read_bool(np, "capture-only");
>  
> -	if (np && playback_only)
> +	if (np && playback_only && !(*playback_only))
>  		*playback_only = is_playback_only;
> -	if (np && capture_only)
> +	if (np && capture_only && !(*capture_only))
>  		*capture_only = is_capture_only;
>  }

Hmm... It become complex more and more...

I think it should check "is_playback_only" instead of "playback_only" ?
Oops, this patch changed the behavior, and it is the reason why you
got issue many times.

	3cc393d2232ec770b5f79bf0673d67702a3536c3
    	("ASoC: simple-card-utils: Fix pointer check in graph_util_parse
	 _link_direction")

*playback_only pointer check is indeed needed, but *np pointer check is
not needed because of_property_read_bool() will ignore if it was NULL.
So maybe we want to have is

	if (playback_only && is_playback_only)
	    (A)              (B)

	(A) pointer check
	(B) value   check

Thank you for your help !!

Best regards
---
Kuninori Morimoto
