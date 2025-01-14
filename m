Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B901212F8E;
	Tue, 14 Jan 2025 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736897348; cv=fail; b=F/CX0eK6ZJz1s17cQX4HXzZmiJGdgw9+AYAbZIjNrxtxC0pV4GsGvc1PpBzAL8RUuY/nxQiMfLUXvq3sjWHOaNB0JDHNx1LV1ZLIN73xVhNOf9qKxF8HGIvy7QLFRtxYnE+5iLiLux98Jaxrf3QQBDm5b8Jud80+k20X/cgkBwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736897348; c=relaxed/simple;
	bh=LUAl6OkNA76XWj5BRdDwj8B3tt5KdUfTmMmbaYfm2p0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OPtAEnbmzMsAF1kf38zL6PhOn0twlSyswReCgh1FjRwCYSWD84ixvMGFOJZBs9/LrZzUcYJzm8oOAfdwHpO5wm7pX/TXjn7kPtSq02wEqINPUhHRwVf2tfDJuBdJplywgYYb/DzD8TAz7kw7w4RehAYcGJKAqHnrP3kv54anS+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CcgUimTz; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CcgUimTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5t8xI8ffWwkvs7UuTufOuW2e45w47qRShloTbBQVBketS5yqvmF3Te6fgT3a7Yi/ekvZUhPtK73azDxF2vCk9tIi2vH7Kos18xHagBCZoiye2HQMzG60jIoM9Bd2vAUlAzszs/jVsUMowJ/kynOgwMikGTTjbURWwRLwTDaM2DReENuSS0QrX+bhYJOMGoicIblCYiFhVE2meuoqNlH49Ipl/FkNyl7L+WoDvkkQGT7lf8DLlSYOVGyoqW6/hRaMRKH21bT0inTWIzMdpZbsVIj9jRN8Smrm0CVcOYiEgpxt8CMpWHBpFI7z2tlVGGMUe8MFs1ob4+FTVNpefrq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi0/xGy1mz8q5d0SW73qPRGlBbqk2BlrCb9W2A7Gy2A=;
 b=ONPi+S1gvkgiFQyMJJE2VsH37EKmaiFwlKqTzrbea25Ga2tGm5hdAQZu9pGIzbIAbADEhTVgOT5q4PMXNUx0YEuMafn7TKGQ7ko2JCGvI5fdLfcMG7qlD61fw3KSqljE/3oX2wRGUnUIXL9GXzSVCS37OSrQs9TdaR28xGweDcjm6dUMS2vUMVs4a2ANz2+aebs/soW2gigMP8PlZek7ogMUkkq9EyzQCIECT53WQgTIjBT6VVztW9HgfiGzeR3cbMuxfgBykXF2jOwwT97TpCa5bnuY66NsEmfhjsLpXMHn78hFGa/KKTrryDgxNcxu5coRlr89/SDbBaiiHD7VOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi0/xGy1mz8q5d0SW73qPRGlBbqk2BlrCb9W2A7Gy2A=;
 b=CcgUimTzWtlXJpZY0qnBO9jBEpqp4v5L8jmvZU2dUrzeBcN7wvWJCInV0ddxTjlxXl1xZleIaFdfXQT7kSUVLJKr2kl9vita2XamvESdYEW1LzNX46jtt+rMwYcaNWUI8ghXldkcKnG3ni8kge2oIGeNYZeyBHiA1Um87mAVnTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13266.jpnprd01.prod.outlook.com
 (2603:1096:405:114::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 23:29:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 23:29:02 +0000
Message-ID: <877c6xj7pe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: simple-card-utils: fix priv->dai_props indexing
In-Reply-To: <20250114184314.3583-2-laurentiumihalcea111@gmail.com>
References: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
	<20250114184314.3583-2-laurentiumihalcea111@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jan 2025 23:29:01 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13266:EE_
X-MS-Office365-Filtering-Correlation-Id: 115ac8f6-3157-4f7c-8564-08dd34f33a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+WvEFQNsmCOwiQm0i59DxvzKUctJetLQpkPaz1tHdN4cq3C7JLBKin9NBn2o?=
 =?us-ascii?Q?gQ7GNxer1vo3arXXzvoSklf5ccLEvInrbyTTk0VnWPocswwTRBTFtui1M1wq?=
 =?us-ascii?Q?Sth82oJ3H9TOEbB66xXq1LQu6zDGad0ZPrVV2AKiIFJQ+KgskfsG8e0OiGDY?=
 =?us-ascii?Q?LAkdbZCsLh//i4pL7ghx79lk+Rr3Dp3CQR/UNDf1rYacWLfkVYaYajWoCxt3?=
 =?us-ascii?Q?9f4qXczK/w/wcnDTzN0NzSPnwxAFLb9DdfqIL7N53BUIItgKcOosbKWBUWd2?=
 =?us-ascii?Q?ewmuEDsrI4yhFh7BxZpbtODxDSCosUk7czcRmOwzytu+ESIyAdh4cx0CW6uU?=
 =?us-ascii?Q?x6K96uh1lj92Nd319aY2xmFoDzfzgQH691SMhtPB4RsCi7h2S9Y8nQr2QHk6?=
 =?us-ascii?Q?fEvFClvt8EdxUMsDpSF2DLt0Mvf36za7NRUsoYrOYo2xFpvm8SnOtq54mqXO?=
 =?us-ascii?Q?NkwvYRty1HL5sjHTSw89fPwd68dCaY0ScFzG/qxmksMc9gag/m714M+eR+zw?=
 =?us-ascii?Q?Hy1dyAF+F1Lwp5G0aF2vMl0l5scMLn6Cg/vyt1ngTIp8V3Pn7jP1IF8bue2u?=
 =?us-ascii?Q?Q8YBRSxvnD3fpXgTXiT2HSZ0wJtn9AVeMjPLL2lwKfZFj2LMygBhc7fixTMw?=
 =?us-ascii?Q?+kXgFDXxROAZJB2ugieZXDrxlXYRulxD8h71vzlDgY6vReF7QCRNLNrB8hD6?=
 =?us-ascii?Q?QPmP1uV5whvWnqgis8yU0jnABhR4OrJ/GCUhhDpM+AQSQ60Gpixg3KKNqDP/?=
 =?us-ascii?Q?H6sZdTQc333BzosE1rSHuNItYpsFBG8FUFRCr2wLXsiFHzZhvvN5Zj//3fxe?=
 =?us-ascii?Q?1Ia8GywpG7AqheqJDoSVfUT/KXCltPyNak/XPJErAwQutNFANqPtR6V+es1V?=
 =?us-ascii?Q?p1ApryobX+MGeXWIueHab6qH1bUZz4/FFeW/BWkQZgSjGxJMIRCamopoB1YA?=
 =?us-ascii?Q?xG418ykx5e6LNXaDxtVinsssWGLnb6HMLpNfDe2PboA9+8dTCGGjkhUr5VZm?=
 =?us-ascii?Q?go43rfGue8p2+4yBi4g8SsCwZCev+YpjTtLO2OBsoAAuKGacmtdZZyi6LA+t?=
 =?us-ascii?Q?M1o3l2z3pWqz/N7G9yt3bHhIfdyhKXrDXwVWqLMGEmnz1Kad7itRH3wImZ02?=
 =?us-ascii?Q?YorVxYsn3bfFuoHHUswrWmf1lxR2ZlSMczGTq8AkR1k7UmHxfuM0or7OoshJ?=
 =?us-ascii?Q?7P9ZyYQXI4PwAEqukxPvRMAqnRIOv1gAAywTEjFFBsu8lib1PTDZAy+OqSjS?=
 =?us-ascii?Q?In9ShB9lbZ8LoD/6xZgCbPF3Xv8WtgoFxaG1OMGrXylmuQmfPIyueqBRl2Ss?=
 =?us-ascii?Q?TH68Yj6hV2ImQwP1hWaFOzy3EcHI/q7GPWdSLpEGR1AJK/t7S3AgHaiTvLW8?=
 =?us-ascii?Q?weiTdCxVYj0T03J6ba1KNZ/5rvBjgSIUjLRlUS7WcAqL2xYYH/JOP4w14jrK?=
 =?us-ascii?Q?G7vSa7f/7MfcXGg72QTxwqiQegHEuais?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PtL095PrPNld3G9wB7d/z35FSW9IkwwCyZjnyBt0WQTHpjQ407wRkl7A/IzY?=
 =?us-ascii?Q?mMUMzS7m9qAl4WacChD0+PMEoMCp6Wd33vMQ7wP8R8QIZaV2Yoqo60G7EwNw?=
 =?us-ascii?Q?uGSjQtGaZEyioMTYuDBmWq09BI867gxAHVlxeu+HMd7BL+D5MOKTPJ1zU9bY?=
 =?us-ascii?Q?WED2JoKcjyx4pNTyplQn6qFYX4TtomxqetB60D9V/M5PINwsKi9PxmlOG4PF?=
 =?us-ascii?Q?dRAzjs3JYum1lyAufKG8JJB+0XNOXM5f9vBLnMN2tdLqQiAYlFmSyJD02lmV?=
 =?us-ascii?Q?SEO8qQeypWvoOcJCMo5hapWIFUjSgrEH9Y2XbLjMpY1tUkhqqTmDhZ38404v?=
 =?us-ascii?Q?4g1oC1YVtPHEZKemLFM0UJ73gGc0Kc1MVCvgNuQHgdnJJQeY/yHmJmZP7MVc?=
 =?us-ascii?Q?yWXGIT40ee2xS+VVeV8CsWJOdq1JLBEF8rcAZ4iL7H84HhmCPOUOloYr8OCo?=
 =?us-ascii?Q?6m5DQMTWrHw+55UG4vmqB2TTHC68ony1AJIQpmEsXmC1n5Fk+bztEC5RU4pB?=
 =?us-ascii?Q?46tW5/NMm9SeymqIFU6XKVusqFP1yQfw1LhD3wNkhYTrCI4Zk5jAIs45VsYJ?=
 =?us-ascii?Q?qclTc8OZLlrDhhFptqx8VVe/TGxPLKxjL/OQS+i0/IqvW9nXLu1YDaGOfelF?=
 =?us-ascii?Q?op2tTP3u13MzJf0uzuMk8U7rWsUmGSScyEGn6shYODnpAY09XlgtyWw4wIyZ?=
 =?us-ascii?Q?UkcSCSvBjPZn4Yc3dsot27ef7zlbFrURzQlqzF0VLkzUXDZJSvGhvrYlQjoA?=
 =?us-ascii?Q?+cA2biMwwCxDELn9zn4e/3kex5iPmeyjpH8750hluMsP+7C49RpwfBTDweZP?=
 =?us-ascii?Q?uSw0SgG2ztaVcG39moYJZmF3pA0AqGGm+R8bBIZDA+bebOa5w9JmuQ+S7o96?=
 =?us-ascii?Q?Sw3wpOFzePn8jbnh2a1KHR2bxbKcMt5zHLxDVFb1jQoRluZiSoy6TeRNmjya?=
 =?us-ascii?Q?+VYnSFjh8ynFmMdDWNBiggUh7B3XgMI2PYftzN+kT/TcswbmiF4f6uDQQxr1?=
 =?us-ascii?Q?PSdaW9jMSj2I7zvm2HZRCGc1vpYYTLSZWOs18OlhqYOf5kN5j/2+aiXf2PrP?=
 =?us-ascii?Q?xSn1FLH8IcljEKk7FkiArraMA9NhE3v/Z7YbiBxa0bnDYV8N2BM8MxTpcfRs?=
 =?us-ascii?Q?2NnkloUc9fkPcG8AkgrfBkjZwDEn4zMN/v/ggJ7qaW2Q3E4IrylzAadCqCTy?=
 =?us-ascii?Q?xZs/6Tj7yM+kl0HBYfCjdTWZUkX5QNQSeCK4AJ6/m9TK3aP8o8Mv9jqfXFB4?=
 =?us-ascii?Q?y4LFowMdNdo+f9++w36iHw3mmGOiZSMbaKqc4bbZAF73FLkIX7v/IUTmcizY?=
 =?us-ascii?Q?/Z33boz5D1UxSb7oeIswtyf7qj0c9d9SfZwL+V7UzxvIh8yVjkdKC7vON5vD?=
 =?us-ascii?Q?hsPIqUhBiziaP6vUmbhm/Ggln1opPacBCJWfdHQwU51K5zFVBYyAbb0txDme?=
 =?us-ascii?Q?nak9cZiq0bVGbaSoMWs33ixujbTEOxEcG+apQgK9n68jG4tYR/hlMDC2+ox5?=
 =?us-ascii?Q?dkPf7vOKiWA/BYr6IT+InBGmrPMolDYArDD+eWXdzdmB2ceYn50zXZeCXDwF?=
 =?us-ascii?Q?gLRK3SHNuGPbz0pp2TtTfk6uni2M9hjq8KqwT4e4P70YoCHS1OYAj2bZiC6W?=
 =?us-ascii?Q?4Y5gUVX0kMf/s8t4tlPSIW0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115ac8f6-3157-4f7c-8564-08dd34f33a81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:29:02.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEUbZMnFIHxmsEpW0LQ1lyREZkrHvtNtrwzKxJzYwMy52vh4SyAFCU2YvZ0Ir9o7PHDAyXtV7KiVoqZSDLM4GhLhOlbaozuKsE/cl4NrHeRDhV8PxIHV4NQnUZ4MwbVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13266


Hi Laurentiu

> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
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
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
