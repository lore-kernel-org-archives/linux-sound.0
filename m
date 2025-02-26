Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07632702A5
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612376; cv=fail; b=rlQfAKaVglu9u8E2SB1dH6hMaqn13tjHCT8QuTyS2o/3np0o/5xy8uhKuq2zyuVughhwbZM4EChEHIogDRxbem+gx2P7sB8w27SFF31Fdn6+jUYLnsiwjpGy9lKmjb8X20n7HHitvFtnpdKBagXJmXiN4m3mxF2UZwlKk66pCnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612376; c=relaxed/simple;
	bh=WGaxRZpnLSL+NlHaz9QvMPkEiqNrPBKAUW6oveQMJrk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s+24HIO2rPiBXTFljzDMNW/Xm+AcNk/nT+1C9isCTSnPLojdDyzwWrFqkTdGlnDDfuW0FkdyKN5f4qesLD0ibRvk5+m4X2jeqi61M2Mt8a1aEL2rvkdd22jcZ6Y8PlDM5HG8U6zTIciVXFrpWGgbH3JDQoTXZG8X/RXUKoKwpgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gvYomBDR; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gvYomBDR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzD6t3HNrwUDElynHit/IoOkPft0yjE6uwTFdnBEjjVdQ0f2PWQcYBfxLBRHQUtrV8v07WgORL+bKXqVEOtLN3oqTP5+1kHgx7LdJ3Qx8Vi7dFsIUiOHmBwCYW2J6MaZCPfVFKcNZyiyMFyBStg+sfcGSx3CBEcAGsBfKV1d8iWzZ0+eYYxCxgI0ucs/giGMxscWGQ3+dE62PzcXKFJ6VphnjfDlPN8HNvisRUnU07Kq6d0wrlpOtSYIoyVxQ8vVzfiYWs2d0AznPN2b+Vlv49Kf5DZ4ku88zpxmxaEQWxMZQfakBAEdPVp40aGyZ3YqXTcvXBunj+moKl2IBz8QZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFff7kd4+O6Gkb8ZlveezEfV7OiaBfngw27tSJkvhMg=;
 b=F7npVhXdN43tYCHTNUQbeu9cpGvmgnGJvvTF9B3PKeYXnM8x8Ryx/zIrWK2qS3oPIT8xBcN0BmmBIvnCF8fV+KJTNpGpoF/btVYW/ho1ShamF4SkMVxogQa5twFnFWgogVY8eZ3FClBoTJ680/eIPGTLVoAewzpdP2Si7ymfFXRIruy7iFp3jbBvQbdok9ax18hGr5ux0IHK/aYE/MQURiqM6FCowsEyLjxMrW0OcCXguHroyEZkKk4v6BDKl68rEz6Yh8FWPfEGxu2ycQhWOzE3pBpiRBfYYE0WhnGVyweSg7HhngLfyqnUC1jTAL81J6jqY2wmyKueuXmlN1cadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFff7kd4+O6Gkb8ZlveezEfV7OiaBfngw27tSJkvhMg=;
 b=gvYomBDRdfA/MCyNdYG/vo/soH5IGHMniRA2WQq43vedRHJ+iITLCrqlwmRI1wgOzT/nGzuQ796EiSrLCs0kpM+njQEsPdOa72Mbyp0eQ3YhU4YOrWhn8mOxyCfNuJpkIaKlHloOtTAAdnKfmgsZUgch0VSWymXgWCzqNvdvdXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8688.jpnprd01.prod.outlook.com
 (2603:1096:604:1c4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 23:26:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:26:11 +0000
Message-ID: <87eczkqodp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: use DAI ID and Name for ELD entry
In-Reply-To: <87h64gqp2n.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
	<87bjup6wx3.wl-kuninori.morimoto.gx@renesas.com>
	<742390ec-7272-4fc7-9fe9-865ff5247c79@sirena.org.uk>
	<87h64gqp2n.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:26:10 +0000
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: bc99b5e4-97e1-48a3-7c01-08dd56bcf45c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?NmXmHDLWCu6DWuRTDPF7r7qKIg3LyD57/iOJM2OkcBVO2W2B3YVAjJKT4GF0?=
 =?us-ascii?Q?NiE6CB+aW1qpRVsond2GlxBCOupVKwDLXuDio+wtRrFe8WxIWFWa9FtWxoXm?=
 =?us-ascii?Q?VgsLAYqcKutViaKUe9V8viBEKGev/i0H22ZETEnyfWZngpTPcP5PmhIVxpq/?=
 =?us-ascii?Q?uEO3StkHpy6xg4/yU5x4VLOoPInQXo/tyUdhQUhW7MMlVWSAVNOZ+us35bkp?=
 =?us-ascii?Q?CqGXsucQzIVdoM24UUMiROK6E8iloy2Y/Q7/lsQrRN/pigf2apLrDHzUk3WR?=
 =?us-ascii?Q?znTS8q9ysvzSqMhkSVs/GfGnU8003hWysf+/pyEg5rwEUPv+ET6jTIl+KccM?=
 =?us-ascii?Q?rRfrx6KesCOtmo2My2bCgygo3OoBG0Z8IDzkTGVwPq1fLcxjYNrzZVsUYftI?=
 =?us-ascii?Q?BC1q2e98Ii1JQK4MgpIqdgEsUGasx2yB5bBCiQeO3PoIIQyoepDMPFhjb0+j?=
 =?us-ascii?Q?ONEdO71Px/WzAqw818YhQQ5oza3xIJ4Xz2c75tnl6xzgVADv27+U+1XYlXu/?=
 =?us-ascii?Q?XBxBWPGn+FnQ/MTTypaKB33HyZyD/Y1v+mkIm/ejJWLReS/kyp+w9TOn2Dfh?=
 =?us-ascii?Q?maL9meg/63BT6wDBXIG0/ftB/db+rg3XsSnm13NWJgTNHqBfFp7oqG3xQdrK?=
 =?us-ascii?Q?+2ec43gOCGgYcO85R2WQxYo1buP3dh4HmHHtaxrZUS7rLVC33dfoWOnO7LJH?=
 =?us-ascii?Q?HVtD2QXJe/Be17BzF/nA0ZJZeTsqXvHe8nnkPYikyDqDtiU1nG7dJCJXvUuV?=
 =?us-ascii?Q?awLmh4O9sIQF7LIBUY40buPpboIxHGD6clp+fnxsNxuMtcjh7HSAqbAgF5ml?=
 =?us-ascii?Q?hiE9kd2zr0+tDlD61w7xeyQIpJ6wo+1plA7mABtcTfrZBR5WbOuumBCLRgHM?=
 =?us-ascii?Q?kM8s2oqlHbonrDlwjsN9rcdjFgpVpYYwHefZWQ0xAgArAtL0l1ctVqIzUB9j?=
 =?us-ascii?Q?hQD8eRsaey0bjRPvT0MQhdkDRB1BjBtX0Xtf0jNFeOKsP0dYq8DOHgsUskhw?=
 =?us-ascii?Q?kpQK12OnKXCRiY2ps7K5PXlOsolFpiPH23DYx7489G1Nsmi+w1kbKhc5zx52?=
 =?us-ascii?Q?9tg2Fkri7hnF1X9KYQgfKC27veVYcdxb3K4cko+Bp+FassV9JfkXNrjLAEGU?=
 =?us-ascii?Q?EJqxMX0b73Eb+ikLNj8qWJx5LdgYSRfZmXBc9RglnE7E7vEXGGQcq/6H90qJ?=
 =?us-ascii?Q?BPkrppCi0R79WrM7czbdCV9Ey4TRw1DG8j5GhfHf6FuWCJbLV/+DJ626sxFc?=
 =?us-ascii?Q?Y3OITCNJtXURNysorTt91MjRJBHU5NUe4H9KfhsodeOzmh730HTsKz1ZdPLq?=
 =?us-ascii?Q?g+5subXHfPaxUa2i8QIsLGXsGWfQvOpBgQ+GbXnj0hBrGQgnh77ZqKN20dva?=
 =?us-ascii?Q?DVlvhFSek5GVqxbR5nTtToe6Uc+bB/rdcchyDO5uIcsPoRgLEH5nePuV2qxz?=
 =?us-ascii?Q?jvzQr3BzEIR0oyNqo5ySdsDGraFN6NTZ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5KVO/RXz4T8mIicBmjwxmXYCmVYvkjtSABtPt3ftiA/o2gUWphQ17Q+81NmQ?=
 =?us-ascii?Q?Mto4hj+pcKel+9Z0UdAdsB1AwsYR6WzOf1dptx19jAYnbO7uJ24Ax+3bNlTU?=
 =?us-ascii?Q?jvB4RpCdikdz7pny0IJn24Rd6gXdxI842iuMotMq6xOxLbx2O2QmCiDiZ7sK?=
 =?us-ascii?Q?2E4Td9rLuueMHFdl6aB/jj9/c8cRKEaBNI/mIbbFkHJuq1ZbsPBfYg84/yyV?=
 =?us-ascii?Q?s68lpbl/K5REwLhXpW3324T4/EyOJemUbhz5gq1ZGyU3PMlerO7S8E5rpI8m?=
 =?us-ascii?Q?4c3zQlxwVbXEBTAFGqvXzDfQxSMkiCkjQSfJitn/WrThmzB09GU2fsNScRBS?=
 =?us-ascii?Q?9XfE+VmP1lHNSiZkUQGY9jK4nFKC8d875BfXXpoF2T/drczIDjONLHFcPOaJ?=
 =?us-ascii?Q?sQOf6g6ZpBO24Iq+6HcjU5n2QcMS9rlJU+w/uLIs2Bta2BselmY4R9WSCL4L?=
 =?us-ascii?Q?r7k9ItIUd9geekL/mqezmal39d8uz8+74Tdygl42Qg1iYeNcnVy9W7se+K7b?=
 =?us-ascii?Q?cISNerKh59lM/jZogtvxV7uaEQr3YzzEjWGLtcoItBblCTpHs1rFmFOTdJaF?=
 =?us-ascii?Q?mpRy0dx4wWGxwQS4bfgQ+rNaSuRHYCFC/W8tHpVBndSDgKST5CgtXUBr4EUO?=
 =?us-ascii?Q?yfXASAjs/dbDiTelFgHG2qOJ/XJb72iT029gijT82EG2oZYU29pJnOOpucvL?=
 =?us-ascii?Q?jFiMRZx0frB/eHzwjlwPDCZ+iF2f3e40LPgRMK0Bth558OhAf5OueJTLoCLR?=
 =?us-ascii?Q?4+fTpj9F9G8y97JeOA56v+T+dEmsGbgCNekcTPhCs70dVgDWXRCJbqWjKUeH?=
 =?us-ascii?Q?8c1lxMJDAFi7hk9tQ0KdPHyBOEqJoOKQZf5bX1fPvKNNdz0SlkdKUpmJnK3n?=
 =?us-ascii?Q?2GkZvs/EWEz/Qxb3ZqTYneGUwGhnXBpXJ/TrfCNTF8+y2v34w5xstfh7UCQ7?=
 =?us-ascii?Q?B7OoejRWIAsOtb5gYOcPWxV4tY3T4xiB0cUIecDYyfwEYT0plSANuwM6O1CZ?=
 =?us-ascii?Q?EZj1MeT51C0jUeB0ERER8EOon0UodZ1HwZUteCX+Jks47Sz0Y2QpmS/kgGJv?=
 =?us-ascii?Q?f3qEUQ44entG+9JNDrPP7pRrLjLZ1SFs/YeXbPHN7woDbtU9ivN9OscuI2lY?=
 =?us-ascii?Q?FhbE8zNrQwp48HEh6DOvUyz3gnvFGwPD8RCaOuMeFAUg0Up1o9UkTDQ0BsGn?=
 =?us-ascii?Q?gBPpPxWtDEiXzCN+9vWkPdYwLv7Q4GP6EErBPNKwCykZ8/GgFCEDjPL6qv3K?=
 =?us-ascii?Q?Y1dume9TdaqLfqG6V7iP5917+CzRm9wC/Q+ho5vlFTp6MaYJiZFKOizLUZqh?=
 =?us-ascii?Q?xDErWVd40tng7kseAobLpE3crvh4MSiYNzgAqtJA3sd3+S0ajU+t8oDOfHJl?=
 =?us-ascii?Q?v435fHyi18QEX3/AEzi87VPlbPxMxVdP/3QEz+2wPOY151mpr2YxZ5hjML0R?=
 =?us-ascii?Q?ejrUDgR2cr2QPAqAEmuqcnHK2Btdxs4PlceNufnXvijywahQctInKRzEU8Ie?=
 =?us-ascii?Q?joeKP+DOXMXMxIB0rG+VCNT9+Iv1kBJG3eMCxSZ/V6p8ljJK4aOv9iV1VV+X?=
 =?us-ascii?Q?dSthZnpRT27GLMUPxtLquCu+lBNExXbeOJZWKQ9RDWu9VLXA6SXuYbL54bVw?=
 =?us-ascii?Q?e53Fg5bHjoGMyW/6uQvnubc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc99b5e4-97e1-48a3-7c01-08dd56bcf45c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:26:11.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSN0G/86UbhEw3XENhMNBv8sfKmikYmNS4wh3KJkxvBzUn0V9yKTY4AUwo4dTt9GK4bkhvzx2PP48l64F0SZQuxjIl4VpAjztfsSXNMw9bugIGMINUAio/jmYQxEO5mV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8688


Hi Takashi

> > > commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
> > > "eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
> > > have duplicate DAI ID on same Sound Card. In such case, we will get below
> > > error. To avoid duplicate entry name, use RTD ID instead of DAI ID.
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> > 
> > Given that this doesn't depend on the first two patches it'd probably
> > have been better sent separately, especially since it needs to get
> > merged via a separate tree.
> 
> OK, thanks. Will do
> 
> # I noticed that the Subject was not matched, and the patch is missing
> # Fixes tag. I will post it as v2 patch, soon

This patch has "ASoC: " on Subject, but commit 0ecd24a6d8b2 exists only on
your tree, not on Mark tree. Will post v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
