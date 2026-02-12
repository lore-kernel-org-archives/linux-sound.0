Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3ED2264B0;
	Thu, 12 Feb 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770935683; cv=fail; b=b1hTG0FfkR8O7WINoPPHhJg9fen/4lijCJSb8Wktu2LHCeWpS9+S3oYTVv5bZ3iuImiQwg3Cnh053v7avmMm5tc9OoMw+/PCOisQTlapLQZXsuZaEOGjYOZ/epEEa7I89x79r5O7Mb48Rf51EDDkwekJuuMucg4X1lq6NIWhDag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770935683; c=relaxed/simple;
	bh=Zuc1FqQfUyDq4MU4p90cBbykfJcZMq3dtFBa67Q2enY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kgQoEieUKwTDoNF6CLVPA9tnRFirkFy9wuzaVa0oDKIPoxM72BX/hN39M/yWhhI7xa8R67ToWHPkrbNe1O4kKmA0uvT9NRcPDvEAdFjQtSfZh+fAq381Bahto3VnsmFcqFrpAHTd0BY8CQ5CzGw/KoeNNFpsqMlGT3rWw9gOVs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dIO8sSdJ; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dIO8sSdJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsvPmRZEL855PXobKx6TOyFeDBKsWuyJufhUiWoO4oUuWNJSFxVhk8WFG0ENDbjdWQ1N+A8w4bBnAXPr5ik2/dRpuwdv5vh5mOZHtp+gZcf5lGi5kJZTakDA/cif5VY+9h3yVtm/e0+/c+XQHsyJSdNpczSPG9A/S6SbQfXSFkPOw5d2vmsZYcX7q88lLHKaqedh1S00UOiK0CfM0LGdCz8jJi8WQgZbTBYcKmdsNkfe+dLrWMezeUj7U4KchzsjcpfSnVuwk9iJNQn4JAVhjyWQcoSMaXG75j/QixfH3q8RfiSX/I41RdOD2e298PAjgOErRAZY7PxNIgnFFcZ0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H50HhJCGFHOdCkzYPorFaC+mke6kW115hvglHDOBhdk=;
 b=tUz8gwK6fqHBxmH3VgMHDSMvzSGcMUhHqqnka3QuDPXkEzYJV/WpAcw4+DFuXmoQjkQw/2PyXDj9rocZiWwCvVsKymps5v5AG9r0XO41a4Zk3XZHYH6sVnY/4AEPZwF7+yQj2TPtKKM/ZS4P4AfkdpjDUVpFmQmqmPMTXRv92lv+Xgqvq/j4pJnRqsGvJwCHnKKvM48+mEYYnwnbVPTa7eRYEhofznjipkF5aybydSlXIECkNpBeImKVAswmWkEXCGgTk/OwigY1wuE40ql3LQdiotfRxcQoWdGVE3jS95mr9IzYzsKovmXAVAS06s/Gqg9MWqpbRZTKHQCsUBn26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H50HhJCGFHOdCkzYPorFaC+mke6kW115hvglHDOBhdk=;
 b=dIO8sSdJw+vCb1fNzpnKBtSJLcVVR3X9G6k2cqz+2eXNPGrCXK2UVnEN0H0l9Qv3vTNezrqgx2buh3NpSznboi3CIu0dM9UxEEeYr/EcsWYS24Ntprxebbq1fVGP6wUt5eRPOyumOUm+TzgOeadDwD5zBGD75MPanW3YZUjxhQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSCPR01MB16444.jpnprd01.prod.outlook.com (2603:1096:604:344::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 22:34:37 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 22:34:37 +0000
Message-ID: <87bjht616r.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v3] ASoC: simple-card-utils: add sysclk ordering support
In-Reply-To: <aY2bQ0_bKBqvSFsB@Lord-Beerus.station>
References: <20260211112815.126734-1-stefano.r@variscite.com>
	<87y0kyu7iv.wl-kuninori.morimoto.gx@renesas.com>
	<87o6luu00l.wl-kuninori.morimoto.gx@renesas.com>
	<aY2bQ0_bKBqvSFsB@Lord-Beerus.station>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Feb 2026 22:34:37 +0000
X-ClientProxiedBy: TY4P301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSCPR01MB16444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4663b0da-07c0-4804-c660-08de6a86e741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?80LFIoEWE6ifM2VFSdfOF4bl4MOUcMGLkvKuisFPUS24rhaxVBYVEMnDRS6+?=
 =?us-ascii?Q?R4SphMXTtWhce67A/xEBi/D9AtxtM8x0T8Cn/l5cr8Ia3QZ1ZRn9DK4Mo8q2?=
 =?us-ascii?Q?eVDnhhmmFalBxSSe3hAfpAN6AEK208WE58lVf7pYPv5GV4yzM1NWzw5wYVao?=
 =?us-ascii?Q?4UTXRKRvKzIrUsKChqvjCi+fksMbxw6NuHH3jfHEsP2LHJ4y7gleDoQk5DoJ?=
 =?us-ascii?Q?i13oPcABi2zXIKVCZydIPxvqxp3VBnU/0rI5Ecbs73wa5HKOUb156h5QiqKb?=
 =?us-ascii?Q?cPlYckipOhoJPMuWbeKUMQQzzmo6PjH3B8voM4soBgalDm6Gqw/sVOeVTCiY?=
 =?us-ascii?Q?EH6iHTWGHXRMLAUibia9CdcFIxs7/3ZCvMolP0ruC229YzU17qQYoHLZqZwO?=
 =?us-ascii?Q?VZurdDzC/grHf2+3dkg4oDkQd45TEH30v0UKt+wELU106wyVsZLza7+YaW0W?=
 =?us-ascii?Q?WY6Vmu1cm/YA80tE+ncOMpyBiSgzcV9p9Pec0y268vfI1BwrGgl2iNKBVSh0?=
 =?us-ascii?Q?+qm/OnsTj/N6hH68bR/l2eGA3BLrfmYIlJooQ9i93/QDYX67YA8pJ2GVn3BO?=
 =?us-ascii?Q?NTHZRLjLFfWW42BjeJwuxuGGoHY2U3FJpkBakkAw/i3USOHLEhAJ+QhsgwFx?=
 =?us-ascii?Q?xRf4/K0dzMCraOSnCuL40sbp6dqyDKmxQ6jlPI/SY+V6b2/3XyJixu6YOIFI?=
 =?us-ascii?Q?xJuBUp0gS49d4xVDJgBBwpXUc2yc2BN1kLVuPITIrw9/HChECtaZYa85NgZt?=
 =?us-ascii?Q?LaKktPRfqTZzdq4jpYSp1mxjLUbOuHU/4OL7D9MqJmY6OFlPvoPzGkQEXb0t?=
 =?us-ascii?Q?TLb4dOxovaxuJnDr+V2t5USC6KHUrczozzt9h3sHM1zYf4Le8KOCsuIL5l/b?=
 =?us-ascii?Q?UkZFT9BR3YYZcQ8GcvU2wOOmgpV2vOPibPHB7avKyqq8QzigkzdLbf90dQTP?=
 =?us-ascii?Q?+b1e5EXgfRLwYmHtqbq0BPa/W6mJntNtfccyW3jNLj99Ao8ezjTs5ZFtuQeZ?=
 =?us-ascii?Q?sqKOTHu5D1KiEy8kyJXtE6fS+0yrSjFJkzsQaceng/u6jN3ayvVS076WP0hq?=
 =?us-ascii?Q?PuGNIaNnCXlB9DD/SDIcfX+e5Pmv/1xoplJe7vpsLpnjS7sGA6+Go4q+xfeI?=
 =?us-ascii?Q?QFo2Am+83I5Jg3uLaIV9HwGM/RsPg2bpW2wBTgrr/OoGwv1mrw48w800d5y5?=
 =?us-ascii?Q?ERsmNj/1GLbZlc1mAzYuAWVjhfK5cWOvYJtpXcf2RGR/ERfskY5oeAV3eL+V?=
 =?us-ascii?Q?zY8bZQy7lDbeQDJOvLPP0szOLonJkttUPuRJMMxc/uoSybACI9MtxQY5a+Pu?=
 =?us-ascii?Q?FjYlAwTV/C4gAxhYPml/VT5gd6lOgNjey3aWvMLj57J1ESEMabCEM4wVek9A?=
 =?us-ascii?Q?GkR4aY578af/VaL6YWFThBc9t0moAEf+olO4WEqT3fvVnoE15eNGAPgyuvfU?=
 =?us-ascii?Q?/4q1SWEAhR4dNvpfNRJGUnRo2FPaliPiRAl2n6JN99Pwwfd+2uQ4Nm6Be2L5?=
 =?us-ascii?Q?IfKifdJivrAAtLbD8bn7rouVn7PU0NuAQJIKpWi+NcbQT7H1wbE27lxkiJWI?=
 =?us-ascii?Q?+/DETwX2+FvXgkYKQf3Tj3vYuXGJI9iUBOkkcY3vwkMypEG+wgUKmhwAcnIc?=
 =?us-ascii?Q?WRi0FY1d+5uHli1zXGmnW+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XGvqmnc7ipZsGI5X1V+SPwxHoyqYJkivQPpPsV4QLksuhJUiSANLFyIPvSEL?=
 =?us-ascii?Q?pcAlYzC8we6IBRTkMqc9URGF2z54HmmaGnzBmlTG3GxWA4hMGcxX23e7dEYF?=
 =?us-ascii?Q?lYYMFaf6Uc1KVXwCgoKwKu6elg2vi7V8K2bZuFExsZ3k8J0qaDTOOiMjbPdH?=
 =?us-ascii?Q?3qSBgkeBLv5vk2GSCAQq5SACOixeki6CrAXP6S+vkOqkLlMaldiUywGIjNzq?=
 =?us-ascii?Q?NTBZZg76JM+f8macAML9rSCjFaqugi/y+Ris2lTSdXDuC0jkj8jftR60zSUD?=
 =?us-ascii?Q?HYy0XZXb4fkODNKF4GMQCDUVkR8kfUfWBbr6HRQQE69vJbQ+nnM1R7rvGGuM?=
 =?us-ascii?Q?GWvjtG0G+UjoSgUYuB4w59JntVsveyJ3OUbIX2Kuazgb0/8RklKd+nfDpiLC?=
 =?us-ascii?Q?MrZpZxHXRj2CZeHvthkemg+rvM52iFPhYYFKQnhCk2ORQEqETfoE2xow5CTL?=
 =?us-ascii?Q?hQ31lDSGRQl88eBXiDHfPnpKaJh9qjbIrQLokoCwYlp4/1yr9f5/XtZKD8iZ?=
 =?us-ascii?Q?3sM+Vk3rdwva4Cg1iKkzHJH9vE3Qlg9j2WdzkRLV7mTD7IJy9KN4Q5Ff0S17?=
 =?us-ascii?Q?uZMSC1J/nVsMSLCNdrQVe+cLkaLdkr1lCrrHNBRvXucCbkBF3y2ArKFHRh+h?=
 =?us-ascii?Q?zVJTaKdYW2ePucW1HCeRIbHIrkv42i6Mnh8kfv3zIIsbwap574z5WyyWQIbP?=
 =?us-ascii?Q?3tlh1x18aLso2AqHYQx2a39j3sB0m9kO/CjNqf+Iegtlv17Q9KmdQrhsYXzB?=
 =?us-ascii?Q?lYUtbZwxxbMldQAo51xilYhpkd+J64hg8erRSUz0SCYwRpOi+/iL2YvFG/pV?=
 =?us-ascii?Q?hSe8X0MAGWXy03d1fMHBp8K7AtEX+FkanJ7L6Yzu9lHgfTRp97BoNK1e8/4y?=
 =?us-ascii?Q?XwwX++es/+WA1aw89xujAPbPwcOATok/f0jNi3i3v00a719BeOppgZ29YVHW?=
 =?us-ascii?Q?R3mg/E3bQE1flrYfHG8jAOZA6wvKDOGFYtv7W3UxJOIJ9GsJqrIEhu5qyxtS?=
 =?us-ascii?Q?xwf3tekZLxUPevf65sFz2gsak4vOZDl9xGJhWxsCKXuuUXxfk8JhUcXfMHHk?=
 =?us-ascii?Q?mL50xY6s3oQQQW3cJmBRvWG8ignp3idcYtVWc4rZsdVWqGCqPdoe88L9kk4c?=
 =?us-ascii?Q?4ZeWF9iBXkxQRx7FEan0cBcKnNEdgJCujp1tXeSNQR4+S8el+z5wWnCFFABv?=
 =?us-ascii?Q?AJ24YMzUnk0HnyF6csDqPg9wLgYWDBvNVO4srApQJPClzgdCKNw2CKFIaV5w?=
 =?us-ascii?Q?CobA5Xs7SZE25nAD1uyucYZVPD5ZtzohNcZ6FajP3gwAQu18GU04ka7CtK8l?=
 =?us-ascii?Q?g0GBp4stEn3OFhbic+M2os1XKKQJFjNbRiueVWj/BQqbmiDPZx3bn3E4OGHA?=
 =?us-ascii?Q?bVuPlBW2gEO5Wl9LuOi8tEzqOMdxM3hLLPCFWSk2vYbaoNZ6Cqyr361HuxpL?=
 =?us-ascii?Q?Oe5lrqy3qhrMklOinQpxnEObETirmKpeALFe3+0c9rimsfnjAgwOM3AX2rX6?=
 =?us-ascii?Q?i9Uw5vIZU9BtnZ06OW6i28nSoyMaMGqotC5iPa6+e2jl5UscVHRPo+rAH1Rd?=
 =?us-ascii?Q?tQg9GZsVkgrazH0uOh6d7+UajBraqwnQfNWL6+NVAATOMCP3faTD1QUPdH90?=
 =?us-ascii?Q?EiqnfZ36GaCLqqCXONSk4+TrG3IS9xcZTHEHM37lzTsLHgq0tX8SZpKvZaBW?=
 =?us-ascii?Q?THFvpD5HlmdLYMO6sOiG9SEortDjg2UObfD8AqmYRGkNmrsE9NCwQVCAM6uq?=
 =?us-ascii?Q?+0fJN6a9mL2twu5kLACxq8Hut1YevAqdXi/2Ju8enEsKy5x2VOd9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4663b0da-07c0-4804-c660-08de6a86e741
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:34:37.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCL1XObZ4uFd4OmOxcqQML9aTU5Cg32z1/W4qdzCML89raC23lEkM8Yi66lXDSGxNNyu+Ix0KuDIa0kivI1vZDhj3bWmI/OPpe9vWICsSon3IVdsqrB+BSxaw29/5gw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16444


Hi Stefano

> Do you set this "order" via custome driver if you want ot use CPU_FIRST ?
(snip)
> Yes, my initial idea was to set CPU_FIRST from our downstream/custom
> kernel (e.g. via a small local change) when needed.

OK, nice to know.
I'm not sure how it helps you, but Audio-Graph-Card1/2 allows custom
driver. You can call audio_graph[2]_parse_of() from it.
These are sample code for you
	sound/soc/tegra/tegra_audio_graph_card.c		// for Audio-Graph-Card
	sound/soc/generic/audio-graph-card2-custom-sample.c	// for Audio-Graph-Card2

> enum simple_util_sysclk_order {
>         SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
>         SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> };
> 
> with codec-first as the default behaviour?

Looks good

Thank you for your help !!

Best regards
---
Kuninori Morimoto
