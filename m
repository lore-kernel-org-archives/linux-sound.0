Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E879DA
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864492; cv=fail; b=KfqFQkQ5juDatIICpd9q6tmerx+oG3yxIaClFtAJxYDaBjQNPCqB1qpyIFNVxQdTUOW6JEaPXxI/DkCmBHRzaTywLlVgZjfGwaaFVjnC9kdNOwR0gHnTnQXfnRv7/Y6BpoTzZyzf/oQATeyfmYQg/16yRb9ch0J/sn/6vXv6FTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864492; c=relaxed/simple;
	bh=bUTIYX980M/SQqhXsESg9RJbUIBy2jOFCHE9C9B1zFE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J/CdhVtzd6YWYXXD1AtPz4VtFOrVjQUwsTusFHJFdnO040kbR+aQzDyFOvA2Q6JS6Ty+iwBLtagl+nOaCGGMBw7NS19UYqciEUOeQxxF4BVCS9+319nD9eJTjG3cnljFlCqWp+UZO2b0qtaHRobflhFTsvumwaiWTUcdmZLSUn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iQRz5VjX; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iQRz5VjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M//ZPR4D8Fjqvw3tzdZ1K70MYMZSHwaNMPosawyozasMjmlwnInJSSBsKjl1xZwDKIqvxY5rZqcKLBO+vPacbay6lwmrF9z+YWiJbxYx8mmf/4qPmg5H6gKi+YoyzEu4KfQ8xM7cXSJICQowXtk1CvgpY91MBmipdoRVqJbj+KXS7Sq80v6DiJKEnt7s7oS2JASYdU0XW0OVCzNwdNc5d07G3QQZWj/l/MEs1cw38ON/nyZNcDSSwSTyE2n2Iag4tucK6W3azVn/4KCip3XXcR8+AnUnMdAou4QDQKPeUTizjl5RYBVEA6KoQb0aXAKXYi58yhQIIyrTLvSlAecu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzXWjU6c9jWGZ5L5SRh81gHeD3ZYRjoKR6nI6rMKEyg=;
 b=SzLD4E0828AQhZaGFsSV6jRlz+B43Leet6KQ6XxbjlFrK57+A5UVoUgY7MBouJw578G7z5T0c+Ipd5G5fj4ulkyiuzYJWEofsqmIrM8qtiLFA5T2X7gLEPE4/LScpuNfIqhYM3NctZDwFcRYVzr5wB4YEm/ViOnBnl1cdCnvgtSMlAIwEhpBoHj/AY0LFG27clTxxw7sVguY9T2V5SbcnHLQ9w2DKIFxA73AQhX2t0b1tTC4BvFzxDwDno6nLbIprvf6GIPx+f9tuET3M6/ZsYqnUzb7cRbwYjL6WRcm2lbY+nRlnc62hWTtV38wicYqGYhG99/YTmEd0JN0fcayNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzXWjU6c9jWGZ5L5SRh81gHeD3ZYRjoKR6nI6rMKEyg=;
 b=iQRz5VjX8f2dEyIM1H3hoEIa+l7W7yznrO8xISbWQ1UeFV47XAzr1z370cFfbOTfnp/uFP0O5gIipDaqWP0P+85ghmHOmBu77+H/B3nmMEAeyn0HRYZHCDiVa5KcRMRZ18UXcPeSFIqPJXsguEYg03TPgBDMH+kE4sc5B6FkfeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB17388.jpnprd01.prod.outlook.com (2603:1096:405:353::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 00:08:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 00:08:07 +0000
Message-ID: <87ldbvd120.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
In-Reply-To: <b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
	<87v7b5dddd.wl-kuninori.morimoto.gx@renesas.com>
	<b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 00:08:07 +0000
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB17388:EE_
X-MS-Office365-Filtering-Correlation-Id: eb25e720-41d0-4db1-88e3-08ded704d472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FALJiIfI2VQYgJVM2tqkCYsRlBPtv2Qsks4Widwu8Vmt+fLvlXZ57BbxEylbZTOl9WYliKKdIDSkkaalK/4/x04U5rz2sFAHCdeSqSz5CfTCxJDH+yVcpYHmAYFe6/5d4lvm4mVUmN8X6U7euD1bMMEpAaEUEKzuKJuj21e7jh+Ne0I9XUzOpBZj0u35t47Qs6k1i9UTcpdioxJ8mEplg6nQCqWW+J7Bgixt0oQnGDlJSp7ym5I4Eb5QnCnQMmb2P97pDoLfUp50ZcoMuugFRUFSFGkgPZHmp4z5rw56xz975hIYzftdON1JmilmEGyUYP73RZ/B4o85KEvCKyx0DD78Wis/x142VWR/Qo49OX7d6WGs9w3yFSWy2hZ2BHyPSclHRNDUcuaYIWr1qoqf/vAiTA7FVnm9sbK2j0hdF+GuZj+GbqGxIiaZzKCu7p/hXc4/rfLTYhVce0cUGyP5BVAnntXMBTcZxe23JCPrKYXiD39Ha+4NrBu50zYkY2YswslhqwlPMV/zCVU7AvlT5emXARD0e9RIsZH8BJ8oVe1lv9vApJwOWvfsOMlnfeZDKpKiuzmOVlLy5mszVL9rD0ukQUVJwgqQ41gmYBnnalG/vRaw0666ToxqxQ+k5ByS1/qCgIWGJr1aMHDLMjvgHNlZY8NLSq8+cd9pMrFmv/lsBz4IWoEZTXhThb848i2QdTlnUl7H06BRxNucz2OsYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wdp0Mh/rzX4K2FohQm3HHmZPkF8sviBlKMqIKVPpphidJaY/U5IkBPyUjH4b?=
 =?us-ascii?Q?9uyE93FqdZn6NgUgJCHzPuklLa5YgN6DT2PfD/R2qkZ2Pt7SaDWw0gQ3lNUW?=
 =?us-ascii?Q?UWJ6cOOFyysvIg4qrD+8bGf/9zdWXGRVcXU66cIYi11vmF28mHWyN2S+WJYe?=
 =?us-ascii?Q?nHYdsa2pw6/ob3sju0D2NlWVZdnRwPcNh1tepgjErkbb05t2ZpYXKO68fXxS?=
 =?us-ascii?Q?pZ56ZuVyCPQ9pawR4vyrrbFD/CCGSgmkwypU9sbuWNaFTSEGmDE4pefVMusS?=
 =?us-ascii?Q?NyI70TPMB0H+bFMmDj+c2ZhVPsGnWdRsQZ2OxGPJ3xyivc7xy0+vLPzCFb18?=
 =?us-ascii?Q?xJZdVgm+lfKe33qaBmsGgXHRkQvOckxE3kC4OrdxXDRK1PX1b0tYo95bBOkb?=
 =?us-ascii?Q?hAim1xxt/DM44utWkhYlU0iIc2DOqs1EJkKv6G/JHVYWE5AO1nig2ohcEpqq?=
 =?us-ascii?Q?MeJf5OOZclIEXA2chkEDXzdsolRI0FSpKFAHrhmxTT51CsvYNsxu0XwYCsiY?=
 =?us-ascii?Q?QWwD55EljcJOHp4HUdLkozC7YSPNEXLbOXys5YV60Wwb57h/VZP5YOfVd1/5?=
 =?us-ascii?Q?+ulPSaFuC9Gc+Ayo+RuiVQrVSF6Lu+UfY+hNoUIUmnlSkBQ2aVJac/nEG0Jp?=
 =?us-ascii?Q?+jbtksT397zMShHpJNGwYNblLQJRaViAG+hs4xzY3JLk27xvmEnRDXpm+LmK?=
 =?us-ascii?Q?64gJC45AkwvOxkaTkObmCfNYCZRCOVOaoYmvcCHkdmQXdU8TQSDnZOtuI/qN?=
 =?us-ascii?Q?BOrposPwdW2359/YEuLDTXF4JqSVCuEhZP34RXTdx46qtBetB4bY9r8OQp0g?=
 =?us-ascii?Q?tMDz11T7N9R/DdYcwdZ49CB4R+tBlyzHfKikFyUOqT8Wh5p2vqVG5RoSXx1o?=
 =?us-ascii?Q?EZcIe87m13LcfO1vMkTqNhKMqKKL4DnL/BnBRHnw/fgeT7LoAeWSCeHwndAo?=
 =?us-ascii?Q?MNJ9dPNAT86s4uwcIQEpwVd3+2n7N6EcEazhhvKh5WPyo01jPeOIhZEqtK/c?=
 =?us-ascii?Q?Onjiob/66Ik5H/5SRDjjc0goR1UL1R6AdlJQOjKiZoVRGbBDDc2IZZwYjlol?=
 =?us-ascii?Q?iLOkhkCu5Qvb+zlHO1DB/4Mys/d9Vil/oYCowicvFQOFYBHXgVIhw4WHErLJ?=
 =?us-ascii?Q?93CzR5Abyp5S/IrkgcrrpfTwkewyD+S4LbKDP6uoJmvvM+bUiH6SKkDh95Cp?=
 =?us-ascii?Q?PUgR6iHD4OYBDtz70RlzAoKtpTiVSj3COFrRgZkU7YEv207bqKZSaaBne/Ko?=
 =?us-ascii?Q?XM5RWk7EIHml0bENHJy8m2gyIW4FydYpsISGQ/GLpAM4F6nze9v9HriV1KDI?=
 =?us-ascii?Q?y8NB9CSte1movR1ydjW6BNlT8gvX5K81pf9t9vHgAnDQkN6lC1eiBgUavsQU?=
 =?us-ascii?Q?uKSry5BF55pioJr/2n+3/OY2exlZSZxuWqjW2Y261r5z8lvbvVRXSYVIuJmv?=
 =?us-ascii?Q?hYwkQHPA8CI3SQCxKBQozt+71vdNe+jiQXY/dd5GgjlBCWrVmil6GYU5Z2Qa?=
 =?us-ascii?Q?gGXZrcT7F7iBp3mt7jxp8Vcnc1uYJtQYXOBGCFgtKsEFGYIqqQ8072Tij65P?=
 =?us-ascii?Q?YNp53EzuleQF9gAWjmgoAhry+gJrFs2IXQi/EZGshD/Ud7XJEkzOOCG2cSf+?=
 =?us-ascii?Q?9OBejgh+vQ5zn+GVICthhhjacWVE66JPnFvemrn1RGPE+7CcmELPZuCZSphm?=
 =?us-ascii?Q?Tq7UG00D1lEqBpfyV6GtdyHYLw+J7TnblePOuXUG1kGWcpWO3Lj0fNcGDLqT?=
 =?us-ascii?Q?JkGFRbebI9VEU3M5/5IG3UnrUW3unFs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb25e720-41d0-4db1-88e3-08ded704d472
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 00:08:07.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIKrOWUYTTGHlRbkcn64F1bPl5jbLt7MD4tl4OQpBf7nDRoQBY2szLCVFwthHKjG1YRd1SIvuS2tnE7mhq3EAMopQ3s8Ud7RD7Thws3f1apogsmSE/9XRwCdU/PsvP5Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17388


Hi Mark

Thank you for your review

> > -	/* Single/Muti DAI link(s) & New style of DT node */
> > -	memset(li, 0, sizeof(*li));
> > -	ret = simple_for_each_link(priv, li,
> > -				   simple_dai_link_of,
> > -				   simple_dai_link_of_dpcm);
> > +	ret = simple_util_parse_card_name(priv, PREFIX);
> 
> There's a fallback for using the name of the first DAI as the card name
> in simple_util_parse_card_name() so we need to parse the DAIs first.

I think this is what you mean ?

	int simple_util_parse_card_name(...)
	{
		...
=>		if (!card->name && card->dai_link)
			card->name = card->dai_link->name;
		...
	}

If so, the card->dai_link is set (x) at simple_util_init_priv() (A),
and (A) is called before simple_parse_of() (B) which is this patch
is changing the function order (= *).
So, calling parse_card_name() before for_each_link() is no problem,
I think.

(A)	int simple_util_init_priv(...)
	{
		...
(x)		card->dai_link = priv->dai_link;
		...
	}

(B)	static int simple_parse_of(...)
	{
		...
*		ret = simple_for_each_link(...)
*		...
*		ret = simple_util_parse_card_name(...);
		...
	}

	static int simple_probe(...)
	{
		...
(A)		ret = simple_util_init_priv(...);
		...
(B)		ret = simple_parse_of(...);
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
