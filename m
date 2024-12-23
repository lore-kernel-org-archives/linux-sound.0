Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3010383;
	Mon, 23 Dec 2024 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734914905; cv=fail; b=UZk5URZmabucvHTOcb+EnV4gj3rJJFUe5mQ+bfj8uscZuDgFYJ1LSCVNMUD/Uaaq/9/twGnv2NHrEk6J1/aOzdeafniGXus9YBig8QPX+AVKcg+vy71Hwm+XOYpywNwBU/v9nps81AQgWiwz68WV1Q/W+RIAXL9/dPbqqx9fbsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734914905; c=relaxed/simple;
	bh=8VzS8xpuoO/wbRySPFqic4Igf3lILIcIGno5NrdT5lM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o9XT52y5R2zlG+faSp6kdu/U52UChP6yPLqwkD4FQBDvZ5n3slF/IjBf6VbbEN96Cfor2cdzmslg/FdB5m8mrB4EqNRLpYRRwZLRb8IyhBiurJDAlO1TXMy3fMcAP0LaHQ++g0Bs6vHsqvkXok52ThPjT7Drkomk3HV05m4GJjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YKUwoZpD; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YKUwoZpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MP8kzYzSo0gMeySA5v3853By26BkkIkh2JAVYyRkHmhlnwlBxtNXy9LgJBY/4OEy14yffkp31VOxLuPu0GfH2EuMOO5tanXYR/OwI+P6dmrz75BcYZD7bWpfR/D62+BQVPbe0Y78rT7utQ8Xya/wElmJThIZkkPMzU0LFkIX7ma1hJgOVU0XCrDuxiEB77xVGNgR0Cnuz6LasEmAZDaFwY22hrcb6ZqdSSpTyNRkezykkSUNHjhbJFH80cAsIsf57CDSkSEcG9mD9eLFEKul7N2WejiakBdJCFCl71kTfMKSYDg80dFMGgCJoaHPPbXlVNV6tv/aYxAXbSHTPr/Jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC13Ava6hMVZ4EsLHOdIk1LQizJw3vbz64kHItmrPfE=;
 b=tUjdM0Rmbjf/PkZyvbsQz2GCmOSzY4SuIRJw1SbJRcsTCS2NezTNxRFQptTDkMz8IqcF+chhaeZ9QrPcKhiW6Dv4nMcaiVS6wp2XURI0aBJzcVn15Vz6nOBb+FkhWQf25F8EchEc041qeZPDl+rQowSKL6whNCdSIs/NcUWt+HXghc/+W6ymf3fge9fI7TiDp8bfZ6ludUtGIIrPNUANF6L49B8qfE3E+weeKVx9vdUr+/K8XkX+0V+G1eyOT3MkGVgZ7ectqQjxt19Gbl/e9LvAnTH9/S3p6yqadvQ8g2i66VnyeeZCJlfnoBoToSgvP31hvlzc3HBR1z3sEbasjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC13Ava6hMVZ4EsLHOdIk1LQizJw3vbz64kHItmrPfE=;
 b=YKUwoZpDG4BldsoRNjciLnTEk9/YrA+8BapMvpv6nVK38iuqdjtuP6At+hoY6dsEGet4gPXQGQinx5e4lN5f2t/htxo+V00x4QkOCIYnBUyHApeDjunY/hIATW3gd2ogYnRr94RzAFVUnchd8/JDxh0jv/eWb0cw9jQB49+2uvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10783.jpnprd01.prod.outlook.com
 (2603:1096:400:298::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 00:48:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 00:48:19 +0000
Message-ID: <87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
In-Reply-To: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Dec 2024 00:48:19 +0000
X-ClientProxiedBy: TY2PR02CA0062.apcprd02.prod.outlook.com
 (2603:1096:404:e2::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10783:EE_
X-MS-Office365-Filtering-Correlation-Id: 298de396-7b90-41aa-197b-08dd22eb7eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIQ7S2SkY4wzMsW8E8akajmaNXI/XmWY+DPGPYfSvRmGh8FFyZM08+te3/DN?=
 =?us-ascii?Q?mhLiJ8aJgDMa5ZlOJ4jRQyoeQyTf5Gpjd/wmdyr/kSm4azwR6MZzjliT3nMz?=
 =?us-ascii?Q?5vNAk3RnudwCwFztInuKvdM8lgszCDIYFWeBC2rv39pc369kTfY2lQVaX6sp?=
 =?us-ascii?Q?SKzd6y5/Gb7EdLSxW8QN7fcsVReDCbyllVSbRGzLIpIs4LRzavz/oIrA5C09?=
 =?us-ascii?Q?iqNFMi9iDr4J9IOnIUdLP+HgrDHHaKqBoc5JBqfmUU5+cze9EiwunVfpYtYJ?=
 =?us-ascii?Q?9pHDYOQDOdTA3mxgFtvx/8n/WRB25CAZEhVRr3urbBgTHUuE3QMEoUshcvey?=
 =?us-ascii?Q?T639WwtX/e1KgRW6ApCF487FNa7ly8MKFPB73YAFHoJyb35LYaV+ShxiBCpZ?=
 =?us-ascii?Q?gF+A8sz0hO5mX9f4rjYKzi0gxBFnYz7TGTqVdlJ3RQvzxQbOT5ojGlrIHavT?=
 =?us-ascii?Q?IlB4N7W0sqZ49eHUR56g4fzRxZ5Pt7wp0BxcbPnhfzXMi52v03NCzuN0+to8?=
 =?us-ascii?Q?hWIsczqCxkKM6VZEbBLMnSHEvbIhmJvlcXIrSQzdu1VAbyV7fuq8+FK5OQ6f?=
 =?us-ascii?Q?35y1WeaaCuNIdOa1TmOg3ShjHR2mZQ/Ma82K/ibZ0CoDVxoOVIM0+fTNCofn?=
 =?us-ascii?Q?it0oEK701tEQVhAPniU4wxWoVGWQT2EEh5ObS9F77S0ap4KYVJKKAQl9OEv9?=
 =?us-ascii?Q?26xb4wcodGzx+xrJc+oOyIxtV7Shd3Vv991IB6q5RKc5bmDzAIlidQ5y9R9H?=
 =?us-ascii?Q?eDDuBkFfTMy2/nq3FctURCWNQfNocb1fqkOwQbhtV5RLuGZxk/6enCzoHi7P?=
 =?us-ascii?Q?0fhpNDpG5iJGp+ItAVKe64r2IXH4+tF0DbOjpQwS3B4vjcXo+3UJ/OoTTOyw?=
 =?us-ascii?Q?oxEbwJkihIPkdE8RlmKDPSTHPvmiz00+5nIY409BkzTdycG4MFym9o7zuHeQ?=
 =?us-ascii?Q?rGhhCJgIH7AWgy+8W//v61fKl3t4Wp9mRPNer9C2sZ/8AJ0QIWFogw5EPVnC?=
 =?us-ascii?Q?gfFM7w0/m9LalKukHH3kNjIGMlVMDNl/zDKoR2Bfm6I+vuP8BS3185Gp38KG?=
 =?us-ascii?Q?sVWsoBalwgdV0Z43X26sBnxwAF53IihyneH728ejot9uw8Yk94Je+HJtA2OL?=
 =?us-ascii?Q?uUh4Kqtbc/r0KV/X1KsMgmfCHiGv/ww2fiAg0MWxagK4NlkQx8GJpHg3oUbJ?=
 =?us-ascii?Q?ASi+9HT3++zwM1tStlmSJ+lamsx++wQKORl7ALkKmy86NYWl1XlGAPNBI+4I?=
 =?us-ascii?Q?gL82Q/dsagJNUZCihPeQl/0fua+x7g4r3GAUDy6SRChxm5V28jpD6qWEHvGT?=
 =?us-ascii?Q?RTixSPXscqmq8Xg1PReK6TARoWmFYzZywtBss81OpRwXJTZA8LyuZGaEVlmK?=
 =?us-ascii?Q?PyadNW7ksPayJ4JhrA27Kl2+8Ait+VYNnu/4bok6zs1/e/2y/6WZVPRLUXpa?=
 =?us-ascii?Q?VnOkwe26mN+dQ8raSW6PLX/5VOtrsM18?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CB9cCNkGbQZczRfLVjWm3is51AhFezl0KFy1b8J0AWf1I1p/Ias0RMs8xnhc?=
 =?us-ascii?Q?lHIQY94Q0xVVYasRFT0KkyuhfqyzUv95AH08YIrrHWsnAw4aKue8vh9tmFrH?=
 =?us-ascii?Q?g4VG+kK1n32WK7cHdHOHyXaF+aVVmVDGLWrdBVv+Dc/MViY0rW4jDbfFPh3Z?=
 =?us-ascii?Q?DJq2aQubczmluvYLOKl1rlchWPFhudZuVzbfmg7nrguguWiF3N2pKEQmu5c8?=
 =?us-ascii?Q?+1g+m9ovqgJ1cOxx2nn1iZIUydCtHB+aL4NlKVJi8uiKEkl/WQv3tTnGj16K?=
 =?us-ascii?Q?kZR7yib9k77lyViB44m1v42VEtmY/LqZXTd0VAgfCX9VbDsGtb7ixecI02dL?=
 =?us-ascii?Q?p+JsxMZArSQfR2VnlrgSvevgsdCyca98S3iNJ+r7rzgIaMmBwK5RdDauyBDj?=
 =?us-ascii?Q?0pkbAfdPpzl3ZNCGAVtVi6c8fW3NPCGDrWpO0qrauwJ45Y0wcyyR6JebP3sY?=
 =?us-ascii?Q?VaAqpjaS/p/9LA+ekUKHn4nGGkilWLqDyANAP+dHFMjdm+po1gZ2v0+3xQia?=
 =?us-ascii?Q?bnBSMutBNfX1RZ/SwusAZZHZpQm0S+1bHtcUdNVPRHMo/KmGUBGsUPlycqk6?=
 =?us-ascii?Q?qdSkHorN4n4ynT6Um0K12KLhbEoWfee06O7ZsiAI2dMn2VLjZu+t/atSWI5P?=
 =?us-ascii?Q?iF7yEt9vYZwq4vL8OS39eLTy76UUBoJK6a+36FWTzjrzvfxifZMnMvs01Xpp?=
 =?us-ascii?Q?1P0PdLU69HDh7r12Dh9u0NWb549NWfF91IL28UB70l5PDasfA+6TSSlSfY8t?=
 =?us-ascii?Q?Bh5WC0SWxoKJ2N+eql5hm+GVISd33qznxoF1HHb7MHRwKIs3uplrwNSdm6rV?=
 =?us-ascii?Q?FYooJUwd5DfdpdglAjHc+hcb8OQ0LgHzHqB+YH0HIkavbOffVmCmXvHXOL54?=
 =?us-ascii?Q?12EV1qqC/W9ZnUltn6e1H/znAbOxerCQyDIWP2yNkxTPV48ud2WAfRaC7IMv?=
 =?us-ascii?Q?o5AuMzmPyWPJhXSfljt7HuOdjCYJG1knttzXD4Bmp+R7CWo2jqm/LisyZOLW?=
 =?us-ascii?Q?aYXhYw7lkcyBwbB4V/JQcotCK9TppOlZNN8eu/rAMg6OqMoYj69efu/Bae+v?=
 =?us-ascii?Q?LynLe0xbywy/zpMeS2EsTyhkI+mTnFOqGIPYfgBSQjckohqtvrJRNOo7KH70?=
 =?us-ascii?Q?2X6lFLSpg7HJTr0dPcCcuXGOmUKOYjR5+4cukQ10kvSLYw0oHxvLVsmVwW4e?=
 =?us-ascii?Q?VeAgl1Y6x7fZLFwp+mc+yWxESOpSwjHEM8Ek2Mo+T/JqbtjJjtcRMR6ffsq4?=
 =?us-ascii?Q?qLv5Dfzagz1eNPGNGtAbIUbGyrr6QutaU8FqYc6Dsqpo5Q6k2erGLDwKnjCk?=
 =?us-ascii?Q?jF65Pd1B6wOfg3m/Bu7A6poprmdtM3dCRoFI7AEfmqPM0yvqSXhHWhw4CeXt?=
 =?us-ascii?Q?UXeC2GBbTSqKkId26TU72sAc3XPScA5WP44ECfNxF9VBcA3Rl+Chqy66iBGQ?=
 =?us-ascii?Q?9xPfu+xAmXqoJO3bbrigj8kKm27U/czpr022bPu3i0s7t/u5tun/PX/aTQDc?=
 =?us-ascii?Q?C+pAMRT91UkrhDxlGCM9SDbGYDINPfAJNe4O5LTCIOXK7LapwPJkrvrP9V5Y?=
 =?us-ascii?Q?2Tqoit572iqkeN0Q6gT40j3C2vb6QR+D4U6s1HKoloKXJpyGvnx79dnUDTFs?=
 =?us-ascii?Q?C8iYtI7RzVAuOQEM0xqFQmo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298de396-7b90-41aa-197b-08dd22eb7eb2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 00:48:19.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpVzToIbHFwjuo98KGOSggdrdRXd2ESKWqZAN6uIKuzyHbBxu0XNXCaYkboGW9gzIta3Eb+t4wvWcpLMA0EGOhXzv/MYCdBpKD3vDuG6LqoTu+IJcOOHtsAwBcABRA5D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10783


Hi Laurentiu

Thank you for the patch

> As of commit cb18cd26039f ("ASoC: soc-core: do rtd->id trick at
> snd_soc_add_pcm_runtime()") the ID stored in the PCM runtime data can
> no longer be safely used to index the priv->dai_props array. This is
> because the ID may be modified during snd_soc_add_pcm_runtime(), thus
> resulting in an ID that's no longer a valid array index.
> 
> To fix this, use the position of the dai_link stored inside the PCM
> runtime data relative to the start of the dai_link array as index into
> the priv->dai_props array.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
(snip)
> +#define runtime_simple_priv_to_props(priv, rtd)					\
> +	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))

Oh yes, indeed.

But I wonder it is needed not only utils, but all drivers
(= simple-card/audio-graph-card/audio-graph-card2).

Why don't you just replace macro ?

	- #define simple_priv_to_props(priv, i) // old macro
	+ #define simple_priv_to_props(priv, i) // new macro

Or, do you have any reasons ?

In replase case, we would like to have the comment not only git-log but
on header too.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
