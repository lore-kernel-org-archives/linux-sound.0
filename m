Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C1221F26;
	Mon, 23 Mar 2026 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774233045; cv=fail; b=rFYN7bbbAYktmNHqa3PKVWLhTsM40R6deyCYPrKG/4HNhPIo6UrMKS6q/4eHGK10Hw/NWB9EaLo76v9NxeEMhYaRdY7VpFNCuuwKwFCytedKZRpgorsIl70NbRkKg3QtKq3kIETSc9C8Tty1iBk/45AWTdewRcG9oZ8KZTVM7Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774233045; c=relaxed/simple;
	bh=nyEXokAo6mCkvqs62iRPGE6wvXFuNyigGDigqKWtypU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PEB6ICAspXJzvqywciH6lrEa9sqtKcZ8k7B0W9ZP18fpzyzoy1cT2JcLyMLnqI3LxTtJjbJZ2MAT7GqnY/qvlmA/rX6tyJsY+jYrX/O0fe2GS/eGq1En3UdYSLaY5BLcrVRJFhrvfR8k+IhUO2qV9GsoCuvqUq6VOGRrz6YGIOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mSE6p/vY; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mSE6p/vY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwhoraMdmUCC2T/jkKXNhzjMwP3v86gseUqv8IKjHm3Tz38EDBOjD25uiLSsX0S8ZlFNLuO53MkFGJYT/9t4xIAGYkh0w56vZGsnzDQm+ZjH81FWhvoZaglm5BRQHv9jSabAF6tNz1/kg7dFU7Bjq9eAwOoIpOi6OAgNJ64u2rx24KBT48Aw5xhH3yGln3pKOkYufGwoz/BCi1vgy9J6uMdoP3n0OdiWzRKFY2QiU75EZPTtUPr7JbxDf54h2jv1xyXHvey/sUyuf1xt2h1Q7AxcOkvD1nep3L2/9J3UbAJhxMARP8o1nTX6iKMyly7EoFD7GK1ZXqar+FBp4kDY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPKg83SflJV2tzd8bfStiK7Y9IEmAzUDO4gmseZuWZw=;
 b=EuRrDXmrmbeYae4BaFjbAnDRYcQD2yZLE1oiNiEBpgWpfb1JNuXPHxFQqvaVM58xlIEoKdoaegM1CHTSZRheOfusz8LG/ZJqigXLoVczpuJMB8gRP9xS0wbonjIlss8hwNJLyLoMe6FKye7RIIH/RQ5xzfQg+cO56tMLQ87SRlPuZxfHYhYwIx7Ajh/d6qOEV7wI9n1+VyuDRo19BH+2Q+nccWFBJT7btAxQu5A7wihNP3AZISzYDPl1TAlqJqqVj4zNEx5XmaKw3OD4ZXe58dSSf4IKOtxq5qWhzrI0ODboi81XYF+rn/7qENrsi1ioNJhWFdBnmx/ZvPzzryyc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPKg83SflJV2tzd8bfStiK7Y9IEmAzUDO4gmseZuWZw=;
 b=mSE6p/vYgjphHvS4N/ryEPdnsssKR5wmC1ClbBT3D6O1lkm3iv8SnK6NGTl+Jk2jP5ikeSA+j8b5HLP9P8Hz078J+jUMQq7d1TUDVu//LcgPsqPE16RzneLmZ2um3BJxbfjsF/vSLajUlXTVm24cDmHqVTo7J57EnIQnY3vfd3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB13413.jpnprd01.prod.outlook.com (2603:1096:405:1dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 02:30:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 02:30:27 +0000
Message-ID: <875x6n9t10.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: Re: [PATCH] ASoC: generic: update outdated comment for removed soc_bind_dai_link()
In-Reply-To: <20260321084118.2431-1-kexinsun@smail.nju.edu.cn>
References: <20260321084118.2431-1-kexinsun@smail.nju.edu.cn>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Mar 2026 02:30:27 +0000
X-ClientProxiedBy: OS3PR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:604:dd::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB13413:EE_
X-MS-Office365-Filtering-Correlation-Id: 927e891b-5837-4fa4-7136-08de88842549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	MRFInjB5YJ3EPcSmnxfvUi9RQzDEwT53OmxfZkExx3ktn+V2UBDqQ6Si7XktljK8ECqwuKDu9Mu9bsxdZGEd+8pElMgLzYrDywRZyEa6heoaWGdR/Ons/9NHo+RSDKxAaMFTfmo0s69VgInUjbezHKF8xopelF0/1YokBILssNr65xmINsn/AjCh4XEjiehLXPhq86WZU+8SsY16lAopg2LN5zLhgaDMcXGy0g3q8bg1Vc/uCaGc+Ha+6BfemdqIIQC0kN+6YMp7ExW2Aaw9gOYkXwzQsYPXugg3MRfFjqOfeK/x7g2kbp6gKcK+q5GuyuXDvMMQYygSGVegRQzYlNMEptRhcbKYSCHQWU/wPlKz7Cd5f1udxEK0MVWBmRViec7m6MGm+08BEj7ilWa6br0W6vVDt29PTJHET75xFGwGduRX3Y17wa/z/f/KBWfYdAcpAtxmByekqHdvEPWECnGjmYi34jrOIegEj1WJ9veUx5d2NL3C+EqgZiny8wXugNBAIniDJWW+TLBMVZaOt0BY0ES0LkvOSal5wqUY+Qg9VJOJo+fo9rtkD5xelDvnsX7SFsc8dbhAnsP31o0e1B8X7SyxArAUVLIr2I14qoAppqEBvz+NrZ5WY2YNpAWifde8e+ZU0FKtNltL67jXsMh78LgpmdYJVer793yDydBvrPuegLDG81+OJege0Pmp2ISnPbzbgGym/8EEfv1RCbxTvuUiITi/kkv2Fzt6PYuTiGPv6qOAJo3TNGMNLcGLJ1TITz/tSNLiXWzLTzT0Mf6qP0WQQsVi0hmT7fxY0Zs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qwj48H8saLdxdpwFOxvlGtB4SmT6yfmLUQ2WG5GLmFrJSQWKvHVDuDGZWqot?=
 =?us-ascii?Q?Lr1lfkDClmtEpBqw2i56BVGbFNehe7TscXkPcr4nGOFTHisaJvpxfT2AhIzP?=
 =?us-ascii?Q?CGlj/wUg8WqQEN6k+/7GA8yVtDQW9Z0vOyhgNU1+VtDExSCchHW51TAVU/33?=
 =?us-ascii?Q?9xwMghcPVibNT5rgRQfm2o04JID2dPvwTvdcA7k+nxmc1qDvVTM3mN9IHCS3?=
 =?us-ascii?Q?t6U9eX478Oxkx+KI/8xE7DApprIw01X3/+lNZ8cSR3fersdln3usfTsSOTLs?=
 =?us-ascii?Q?v8ykH39FyHP6tjtklgG+bdOCSj+/AwL3NnFdkE+5rpALF71+1oT9V0RCWcIq?=
 =?us-ascii?Q?EZH3a/thgsYb6GAXb19IZsTJ7tjR80h05UNaKZfEJNg0qJLCQet9qGZjYH45?=
 =?us-ascii?Q?stGpxG3dP1bNpK/O3R7MvMHc4e8rgfYCGPTOg5iSBg3ESf/KLQU2eZnlMei5?=
 =?us-ascii?Q?KsCCJ/O+BztJexsOF2cM1p4yv7BNAGqJwEJbVbjj0Bj77bqUilJIQjNTO8Uq?=
 =?us-ascii?Q?CzgCswF78FBnL7TBQr9k1vauKCLaSslEdDWARHOG/eA1eKlf6F0R2I8sIjyM?=
 =?us-ascii?Q?OQ0nB2t6Y1OEkk/GFVt+NeZLAP8lesuiBBvYWoYRTIYYpaZC2yVsYCH9D4LW?=
 =?us-ascii?Q?EQ0JD9/0ReT9i1DVuePNTqNkTa5T5mjlsIk6387TZ3y8k5qqI3WBEdX/bA70?=
 =?us-ascii?Q?MIIROKrC+LPHuwzV8qjDvQsWKhzjKjwuCr3hXeB8y+fJMo76UNQxAXZEzikt?=
 =?us-ascii?Q?KPyDYT+zaop16EZO816Cr2hfSSpS2zyGI8HOoAXJ6mOpS0qm2e0q4Mb7dUnF?=
 =?us-ascii?Q?CDHgv1Z/FQnGw8ddNToL3mr1l2pVhaXlkCo1zNnyFcahwcq5StPlfTntmDka?=
 =?us-ascii?Q?pOXieu203ITN2/gagNS77QPsbaVLAnLCpjTjaUv8nmeyypkOeBJSAOfu2e42?=
 =?us-ascii?Q?Xf9ZJTEzcBhCk7eRZJWAYHWdKQeMbTmKeU+lBJXQkQOQoYdyPquryqsbz3IH?=
 =?us-ascii?Q?grQKgyMEymn7nzuCddh5xSob8Z4XC6eOLt3M0I0KWCZvwx4k9GU8SIi8GV5P?=
 =?us-ascii?Q?2rrrtJymulNPdgdD/jCYdbZTHCMChN+hWMv/ye3XUqcC3IuEAeXkqQJ4iozc?=
 =?us-ascii?Q?MB3ARWtP4ZGqn33Nst7HmdhvRN/rDn8BEtNBfRyJi6rL2VhJ9OKzKwWfNDzq?=
 =?us-ascii?Q?YmTl1BMIyl2f1Az2EdzYuYKrgtOzY8qnW7yJwG/HcgAQKDR2kXpAV+OS1Anj?=
 =?us-ascii?Q?9zxs7vPDCv/WBywanYOYXSZF6CLlzAWPxVrOxb27pewQ2894Vvk7BtKgLac+?=
 =?us-ascii?Q?96o6WgNfH2c5vVbQpGfR4LmTyVwvd1reHX+5sO+UvW7gKaRlJAEO5iffN1hO?=
 =?us-ascii?Q?MgDmclTWnDmBocxJcJz2PDkvq+lr72okHjGjDwuCnhFJzRo4Ek1TylxKsSHr?=
 =?us-ascii?Q?sVDd5uxaElbriIy+/vsjS1SkS0t7tZ94O/3xALFF4HDGIxOExMqauY6nMIeH?=
 =?us-ascii?Q?Hv/ICsfjjffogskzMoaq4cPte1LO0NA7NCTAVhLFN4y/AsRkHfFmsinxIyAv?=
 =?us-ascii?Q?jpRN8uJeatbMV0I99de8Zmx+UiR8CgOWwxBTfw73X2FlPSIyxgAjwr6bIdIm?=
 =?us-ascii?Q?iWNDVzwCqXpdgszdq48asz/kxUqbv5qY3hUHk2qQ995amgGWTdM4ofCQAwWh?=
 =?us-ascii?Q?N39KXz3EblaEDEoGH/b8MoLKtZz8GXSVTkGfuUZwSi+rOdoGCKnHfRVx3Ncu?=
 =?us-ascii?Q?HOl2CxCyHqgcm+sCF/XhtzCRVLjZ+TwadYzQYHeIStJR0OYHf+vM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927e891b-5837-4fa4-7136-08de88842549
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:30:27.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7nxuA7qo20Ujxx2aWReroQ1XQ/pnBch9agBoqJ4YtQgE/BZpkyGevU5r3tcxeev482jKOT+Ii2ZjTZvt+C3K9dU9jedpBh+QXFBo6/GPlTbQc38mBwF2+DgC5sW3aL6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13413


Hi Kexin

> The function soc_bind_dai_link() was first merged into
> snd_soc_add_dai_link() by commit 63dc47da1f39 ("ASoC: soc-core: merge
> snd_soc_add_dai_link() and soc_bind_dai_link()"), and later renamed to
> snd_soc_add_pcm_runtime() by commit 0c04800424c4 ("ASoC: soc-core:
> rename snd_soc_add_dai_link() to snd_soc_add_pcm_runtime()").
> 
> In simple-card.c, also adjust the wording since snd_soc_add_pcm_runtime()
> no longer uses "xxx_of_node" fields but matches components by of_node
> through snd_soc_find_dai() and snd_soc_is_matching_component().
> 
> In simple-card-utils.c, simply update the function name to its
> successor snd_soc_add_pcm_runtime().
> 
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  sound/soc/generic/simple-card.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 06638f9a74b8..9937a991846e 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -48,7 +48,8 @@ static int simple_parse_platform(struct simple_util_priv *priv,
> 
>         /*
>          * Get node via "sound-dai = <&phandle port>"
> -        * it will be used as xxx_of_node on soc_bind_dai_link()
> +        * It will be used as the of_node for component matching during
> +        * snd_soc_add_pcm_runtime().
>          */
>         ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
>         if (ret)
> @@ -76,7 +77,8 @@ static int simple_parse_dai(struct simple_util_priv *priv,
> 
>         /*
>          * Get node via "sound-dai = <&phandle port>"
> -        * it will be used as xxx_of_node on soc_bind_dai_link()
> +        * It will be used as the of_node for component matching during
> +        * snd_soc_add_pcm_runtime().
>          */
>         ret = of_parse_phandle_with_args(node, DAI, CELL, 0, &args);
>         if (ret)
> --
> 2.25.1
> 
