Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F393211A14;
	Mon, 16 Feb 2026 00:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771200962; cv=fail; b=koeXiIRT+apcBcbpTftbzY2edboZCE3N0KsKUbTa9rw/oUh8M6EMWEs3FB2t1586TkCZBO9riA0YA9XcKHn/fJ+v/8SguYkb8p+CWPA4IaWxCyKvj9GtOHnir0/msczWQOHO9IVkHUaIHwSE2kxGS2PcPgXNRzVbQVblrCjIS0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771200962; c=relaxed/simple;
	bh=DkrDmxPa/ovjGGFP5i8wzwygQ3msrDWzIvT7lMh/SBg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XjgVjr74RqD80wZrC4jgTpOxRx0Bf6iPqFwHTkI2EnaRAXPWP4olFG3iAUMbDtMQPVu4oFIyfDkgazwYwrGzUqnodHjY0c0PFAaPAQbDsOkDvXue23snbIIdIu5HBYXHojxvW0ubL9I+UkGiXTuKI37Trba9EzjFOeQH6A7c05g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UC+VJy87; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UC+VJy87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIKHjwsHBmIkSqWpboD+DJ6IpqPgOrHbsrWhCCZHCGpPAXjktwxLjTa6zVQxzPcj9wvI4r/qUSW+B/9Ktvlhi+x+QCG+ZOdiG1N62eOUbtjukFf0azHEWmDOi+o0R55zcxTWtrWuhwraxcX5b+1arTzZJfdHNcX4M17ebXLlY7OilY0itiaxtT4hVzIFA75XbZ62jpwfnmmdrvTy1KG/V7UAEyykup5AYsaAI/c4QajL23w0BKyJeVy6uyIpuEhEsOLZ+mMBU8Os1vByW3VWXqnejoupjnOLCDnBrHO9UUaB8fmDGF2wug2NM780vqg0z6D2aBwPYacVFao0I2NBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn9RI8Xqz81icUJH9LoepIWL9hhGomnunbF1o8lDans=;
 b=sLsCGLx/KEXGSsOlMw9RNUXD6HAOktdMqlWJ7f2rBRwirKkQMPQ9X87Wzch/FZWyiw3XNkAOEp/z4bQeaQPm5J9zrsK9Df4pq3YKXFpG3REJJ3umo5hBiEPnA3Ag7eRpnTLk/fORwDtJNFvzvpRDt2xbRTwjhSLScE+hJvRZowtVYhttbymQVVS6+VsTUH5lOaVZCyHca1J580U2qldIiX64ebAR2rc0LDL+zFeoGQsoGoEw4F0Fx6/ZCLOZZAFmRX4uprqv/6mqmx0vIgXxJp8ZgA8xndW5VHaXLy2WaTFpV1o8Ot5tmeA1zY7gMmwR0xLx27ew1oohgnRqtTptGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn9RI8Xqz81icUJH9LoepIWL9hhGomnunbF1o8lDans=;
 b=UC+VJy87wD3OuuYexlftza1hVECa0IUr5nRFfOFcouUAgAK1ZSGNEnA8by9RzxPNT4gEDROIRf2TUgEraWvTNzakxYTjEWa0NtdpwEG9O1zqO/MwY2SXvi6GCoeVmEvIkni4P9bKcksOX4Fr2E+ONBjMtr5eN5VkfL6xTqUInPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS7PR01MB14477.jpnprd01.prod.outlook.com (2603:1096:604:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 00:15:56 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 00:15:56 +0000
Message-ID: <87pl655yrn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v4] ASoC: simple-card-utils: add sysclk ordering support
In-Reply-To: <20260213150355.442609-1-stefano.r@variscite.com>
References: <20260213150355.442609-1-stefano.r@variscite.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Feb 2026 00:15:56 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS7PR01MB14477:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbdf6a3-2363-43c8-fb27-08de6cf08e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ehm79LWIhQEyc65qgrQ+9o8UTp8am4NkEQf2IRxOLfKOpjXp0pl++qdCe7Tu?=
 =?us-ascii?Q?d4cjyzOl5v+ERqmtlLWUgqkeBmkPdDV/2ogbdOBLhVJaTt3JoH21VlSNLBuL?=
 =?us-ascii?Q?Aib1wcGRQNXNbTCwvZGXyrgUzDajQk+z4XiBRNapMsSOAfb0E3xuy6cWRQws?=
 =?us-ascii?Q?UKuuI18P50NlJDOtvhuWUVOOUJqlySKI/w/rL1VWVqEMtISYsrnhFXXQJo8Z?=
 =?us-ascii?Q?jVvopPbOMo3ec6LuAl5B9OMu4HvY2ZzYJrXPnfMJsebhvKATVlC4VZS4sVui?=
 =?us-ascii?Q?0LS+BWiHpxktdFTSkF+yxYUffCLjOH1oElbMI+FMuRpuyS7efdcnRMIpVkTd?=
 =?us-ascii?Q?I1Z570SvqYLTRcV8neeyOM2pw1s4e8ZjvIp690K53BJISahoTQS7lKuo0/Ht?=
 =?us-ascii?Q?DV/IlzE4ilD02JDA4z5lUn5LyJuSFHYRy0ijitmwnPJgaQlILdbyj0rwUDaq?=
 =?us-ascii?Q?J6phIDv9E7mUOIZVms4SSvFu7lrFNcpKvHhsPA9tnueTq8fPpT5OLNiqrLkT?=
 =?us-ascii?Q?4Ymu005lUON/Lrodz+Gd4GlvqbCiMtad48+OUKaSHDMEtm5FIWhGOlV//IF2?=
 =?us-ascii?Q?4EZ8uwLTBX0ZMiiKZXPcUKvQq/0dl+11e99zIrDp9tmTDs3OSTCgMh2C4TUH?=
 =?us-ascii?Q?CcEI0Us39jTILOA3lYnD00R+FiAVLuJxo3q4hpuhzMegsgHJ6dGm1AiOnSjb?=
 =?us-ascii?Q?zxuvrKsCuVD1zc6ZFzQaEoMZddI4Nv5GnyzwkGGJz5HMNOlJtfG6V14+OZll?=
 =?us-ascii?Q?eBq7t3eNg2zhz9GmZ7DG4kLYkZBCtKd1ihmfIB8eHOtjtuwsjz+dnRogDeDL?=
 =?us-ascii?Q?TOG6dfqQ+6Uw/yAKse/8V+PR5NNfZ+qIU++rRQA1H2I0L6Q1gRTzReZe7fb6?=
 =?us-ascii?Q?lJT6on7GuxrW4Y0Zypozo8Dw7Zp6EXiOOvtEQLOrtoFiY+L1t54CfNYIZmqn?=
 =?us-ascii?Q?x3stjM3gFBGrrcELJvq21OWrIllXdNPVgiuJNjtDIeBS5Gmpz4j8J7lWr8wR?=
 =?us-ascii?Q?uTzWRXEQ9Tw19E+UoWyAvkDkBz0Qhi/vGtOWNRXjhUUY0wYXiYVjrIvnbuQC?=
 =?us-ascii?Q?iLDfLyFs9s/fbCX5PScq5IC8EEmqklw+AaBBykEaeC8FaMabAoIB7O05zdj6?=
 =?us-ascii?Q?Kd5E0rhHD71/Uvow9G3EoEYczX5y7tUYWeVjP+WxqI7ZJkfBd0BjyZtoJUmK?=
 =?us-ascii?Q?TQc2aUd2xrMwIJlCpuDJhRkUHkFfyT9Azp4uHg19Y1T6PcubGDuCJCzdmc1z?=
 =?us-ascii?Q?9gLpiRNZnAflSgZyr4EGcOHfxrFi1jQuGsOPrvT+6wE0Lwq8CsKA9uss7Lgp?=
 =?us-ascii?Q?adB5+vEk9zVl447sfCZlNXQKMyA/8tpbDHZrTpTyk9pvvhqe1cXNfNA5jogQ?=
 =?us-ascii?Q?hYOEwZrLYz0ajl0KRf6BnbpX1JoXPAdT+7uuAMDU/HNzAXItuWG/8iAwdtue?=
 =?us-ascii?Q?brPPzVtBQ3G5SO4TC5+YAtsfbNJ9C8POSYlZgFaOozVj6YNIUDHrcnCvpqs4?=
 =?us-ascii?Q?C7KmkpTaw4kWWMPDbttN+lSWsNcUbAUCziYiEKzT5w0iEOteiqniqWWbA4K/?=
 =?us-ascii?Q?vWIRpAZox406xcTyKYMBCWWsM5+XRSg6vMewvBDWDJI6B5OuXNcZqwbpE2Mw?=
 =?us-ascii?Q?OG61UPaZnll7/fRe9iDj544=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0832WKrCwZUP3FONudKfOZ4xifrR7/dCE5kLeQnuladgM2QFtr79KpGJ+YFU?=
 =?us-ascii?Q?/9PZjWRJ/3IFrEsG67PxOEsWhMBzZAGRculQODJd6xM3rumEElaoGOH+hTtw?=
 =?us-ascii?Q?U8Fag9T+yVRXHuQWkvQz7WYKtC65gb9IC21Nf4rF9gk6b8/IrantJTVktQ6A?=
 =?us-ascii?Q?DAHsmAVEVxI35nXHWkMx0Sy4ELuX+mFQNGVv/+PiM0UiBq7f8aWhatfCWDZ8?=
 =?us-ascii?Q?FflO2i+mhr2tfNiniu5MXfjGVtAPCEPvntMTggIBamUo4SO4GH9BVHU4HZ1a?=
 =?us-ascii?Q?dKxSPzEQnXSr3qGqIsPx3kaUeaHndq5s/0lahcPo4EK9vx7HHQDM3MXduXGL?=
 =?us-ascii?Q?Mb/DlLo8Nmc4FPDnbhSEL0OlRigymm/wQMxbEB6JSLzKpvIWe2HQJ+EhHah1?=
 =?us-ascii?Q?/GcOtBTOSZ+1AWUyl7oMkVrKC8v4tmgPOZi5XnU4a0NqQm+IYCy+jYfE7A9n?=
 =?us-ascii?Q?oXK9m31q+CVpi9xgsz8ZcfRIKYk9T189FDZWkKpgWgpyRLExrNZmw8aOEOxY?=
 =?us-ascii?Q?OaHNYEvgo/PmfhfTKZXtZXumGNbEwgoCMANCYZazQ1alesBlF/pqtmqH7+kq?=
 =?us-ascii?Q?jYPt5LZ6gBvG1VAAV0P4rIZCRZwUfLyhBkhGlnBvxW5nkrxJvhUUW1bmuk9N?=
 =?us-ascii?Q?lfsXo2eW9Witl9M1kiNeF4OHNiatXaFWWGPL8v0cx3bO0363bCCSDDyHa9tg?=
 =?us-ascii?Q?YhIFZyTjd8KDcqHW8+zjauZq59pcTxQItotV9iw73oi3S8Xgq7Zp2LDzkKWX?=
 =?us-ascii?Q?7YjSDa+XxaaqYSMkNKlj/bhAlFqqw1vnnFILdWxve2+7DSGXFMnf9tvhkwBc?=
 =?us-ascii?Q?Gt4U7AL3JFIyfpnGHoNy7gzt+lFJxhfOTn0el7T/QHy53dLSK9i+Yvx33jnE?=
 =?us-ascii?Q?QG5z1LL8a0Nn2EWSrI3BcOAriWfvz/wBrsdegj+FNYaJNe/iquIbFI0aNH+s?=
 =?us-ascii?Q?5j9hnlryroN9BbKiiUl3UlWscWe3x0RmjPIYpzbr0R7B5u6IvrlnN1Vh1Zcs?=
 =?us-ascii?Q?bH0d5lFiPl3AHbcN0f3gCdc4KDj2GkaE0UDrkTs5K3127K3MBbf96b/TSkQu?=
 =?us-ascii?Q?tzbLrHAoEutBc9TGNXOKZ5iu9Q5nQmI5ur8aYBXS8POdtSFusNiwatVrHhOd?=
 =?us-ascii?Q?psdJkO48Q48CbKoUwlBFjtCTcg8dmUYfmW53r05IXUgCLVMfjRSfgvltvUbS?=
 =?us-ascii?Q?/jn30FgiH3sEoM18B3o12qCy/1P+MlazKPZtL7oDpNcolBA9hmOqOUY7q4fZ?=
 =?us-ascii?Q?XozAF2x2W106FvLNFrwPJFIS5ZJhGBVw8fyIDO9XUtwaPEfBJ1Udb7pFNYKQ?=
 =?us-ascii?Q?j422MxQ6vvVdyyf41f8IcFVPtbFMrX2P4ETI5e6yh37XEMbUP4teo4FcMwxJ?=
 =?us-ascii?Q?Nky2b3tBiMAv5Xv9FvkynffKI3+he6yVikWU7YoSmerKWA+V13kSdeiI7ph9?=
 =?us-ascii?Q?BnAs7n+TSIouQBKc/nTiz+dwW6haUsd2CnJkwZ9f5tesoocWj+NCkNGqpQ8j?=
 =?us-ascii?Q?jck5++tspd5Xa2JxDhQjGT7w6bZW6b50W5bfGNwumKaoC6Pj19ks7GrcHCNC?=
 =?us-ascii?Q?iIEefUwI0w/vaqKpHvJr54dWlPIVrkmC1a9tLyGDcl7HOINByiy//tiGuSr1?=
 =?us-ascii?Q?0H0D7Hrcb4dc5nFm9Qbp8ycIRfgdmKvxkdp6zo4o1VS/pt6/s5cZtRXI8yMJ?=
 =?us-ascii?Q?Crmz1EveWjRMmta5x591q2xp4xTnmcAfHbsCgwKouZvgpFPvxROMM9NXC3uv?=
 =?us-ascii?Q?pC7nsZ1WYsWHWipdtAMhq+2jji5AH+XgFli+/Tl0obok0Os9Kzd2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbdf6a3-2363-43c8-fb27-08de6cf08e09
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 00:15:56.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyT3FKMCU5ImZSATPRAXgJAW/pzoF4j2+FFwkR1nBjqFr3Sx5gSB9xaL57h02XeyNaeGG4R/jXk2hvWKfzQAcCGog/qzzwJPoEnylTSZiZt000EEdgZA1KGbB48SWDUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14477


Hi Stefano

> From: Stefano Radaelli <stefano.r@variscite.com>
> 
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

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
