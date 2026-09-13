Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59038332F
	for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343765; cv=fail; b=Xt/R17QIh8Ktx1CnEpoxVFWciy0A9E6idS7ipVVzCr47hhkqkCZPkx5SjSSrhJqDSrq3okeizSmfWckfEoQhOlZ8ES4Srt9GosxFpBVRiZpieiwPCU3QExqZDSBmETuIXWV+ZKnU8XUc2KfAAe0/eE5rEYaOV+pEqS+M4RGZR5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343765; c=relaxed/simple;
	bh=TieoJ8hx2y9qD4CVr1/5AG2rYH4m3jIBU8Kd4MJWFig=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PfNYXGhg9bo2SSrgcZt1rKTLvLJ577MCv5z1BSLuG8Mwh2UJzRPB1Sn/FWPEcEiS0zUwQXCx+/lAGZ1EQGOtXQ+jEq7QvBrQRDpPrRShmP0Vk3GFgtwY1XcF0Tj5zBIjE+YUSlfTqLKbEvzqF/UGeChAIcSW8slotH/Bz3Z+7+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XvIWfNyJ; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XvIWfNyJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAIQnQlXwDjcKRUyOS/P7lF4XW7KNvbNvQ8QykUdgTCdQnNO+CD+rArh7MdJ7kFcTD1Xv8DDY/GOf1vLF6f/3tGv2mEoAaUxYPYxWkN+/tTV20icNuWnTGPgJdy0YnHBzynLVtguk3fjfxSEjpYkyFk7Y6O8EkVQcmJx2VkOnUNz4q+Z/Kl6p56qdbbWtICAoOnPDOgtKfnUWircmdtQQSQ7OXS2T7keIuAkHTYa/hzEv3OIfX8m3TotxJFeQGMtx44QwinR/OIwEza0X5cvE5X+lw+sULibUktjzm4WhvQ4rVyopyqQiboUFhs9mVm/4TDbi4VvX2GYtxoXpM5lyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6uPEZu6HYzoFvR5msI4k5FUouSt4r9xYpBrdf27e78=;
 b=C/bEQrMdZ/unhH73f2xgJxXU5LnxCNFGy61ylyzX4rFP3hNsCvooZhBrPpplY8Doocjlf2x9Xzm48s8kkKo1VG4tl5XfV3qK5qpchL0+CIm8nvcm+AyoX/YeCm75HFROjH6tuKumj+Fa6O2j5qkIG++WCQ3QQWpnG2B2nNhfMWtZnV/5dgac3gu4eynJKT062EvFZwiAUgP8QY5pgAxkbNYpBovAEdlJglyVfHoenSKdkFq2TJDTDrSZPvNba+4g8ArSosS3C/hAm+gxRtvrqC6fNU6ghndm45VPaPRuMnQERzGw2GPJECicb5bFdxPo6Tp/izU6O6DcTbV3Qn2mTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6uPEZu6HYzoFvR5msI4k5FUouSt4r9xYpBrdf27e78=;
 b=XvIWfNyJFGUnHKyYPtdK0swjNyYKFzzapBvbEX9Bs3u75nPXsS8ngdaqB0gJSMVn6aSYTFnIheuDQMNIcMjbbqKXYGUElIEuwPhP7dvdRUnJK8auxQwglJ7pC0c/e+LeLrJ4U0tPto/NG09twLcTSGDjBQhaXbH3t3Ffj6+q4Fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYXPR01MB15704.jpnprd01.prod.outlook.com
 (2603:1096:405:29d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 23:56:00 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 23:56:00 +0000
Message-ID: <8733vcn1tc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/21] ASoC: fsl: use .auto_selectable_formats
In-Reply-To: <aqRgKGJUn5NGVcdi@sirena.org.uk>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
	<87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
	<aqRgKGJUn5NGVcdi@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 13 Sep 2026 23:55:59 +0000
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYXPR01MB15704:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfd93db-76db-42c5-b464-08df11f28f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|7416014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	xu41XlOOmLDoEshbamZkE1llKDxZMS7w/USaLNUy61kPW5xAIuJjbAiOZASsJSNLIx9oQJ/fqYwwnb09yGpvDziEBzIYoWYP6xIXhrMRcfP0ismGgCeMsUxbjjIEnLGjR1+8woSmW8Pia0C1t4E6K7v/jif78BgNF9ool0gezRfYVXphhK0bd4D9PD4V9/Mx1XyQhEA2cYNtY009h8xYGTf4+z+Zk6vxLYm4G1QXYDz8tcRc3+P/7R3MIf6WdEhOLvlJubTxviYfBh7XFrN0x/8oAOjCzdCRzeQmij7EG3hd5Iw6vVzvCYS46aVHtld4zOZJHuD7rwYjPLOqJ74GgDyGrJ0df4a3Tdc+oylSHdDP60og7vQQalLdJgqO16qzg9IqyQbUoyTn+fLh+10pnAJc5+Tow5jh70OgFM+m+ww7JlNu1wiP51vyntBHTF2f7pnfav3tZrw20bbB6C/n8TgOEs8gRlsDHp/qpLZv3bvSYcpa3lq2+t8zDqB52m8r0ypDU0C0BXYSiOmSpUGwNq2THjEZi2yWvDMo2NKEwwZC38hVYwEsc2AeWyU+G5e9pZXjaWHdu8OdjoQCwUTXdhAEJExvljleH4JtCsxycMQYr51+cKls5RMKNIywNFbChs5yg7DxeiC3u6ztrdK3L63OO5PyS/LDnzU8XwrwhtNZMOZfGDAmuj8HinmcU09z0TOWpWgvq0sbZwv2L0R38Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(7416014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BDSDaXBZ3/21zIPPd3O015G3/9i9GCEvY2Bnq77Z0VvJ3f/VZRoUoTnela1W?=
 =?us-ascii?Q?ufeVRX3/bxbIiKM9+OFd2sZy6d35FM9ml7Pk32fdHo92DbBLsLYbl2xEiUaV?=
 =?us-ascii?Q?FL3YZz8WybG1cz1mhZbQ/AN0hGC7YqYGEHHlbvYhvWIWCnHtqoeX2Cii58KM?=
 =?us-ascii?Q?n5vLnubg5xc5NeDrwMtIJAnCov/JKAX1++uTEwcnuUh8zsFtAGvTuTTXJoX/?=
 =?us-ascii?Q?mbdX3xcrtOvcvX6jOiFLHDAtMCheARjSzMoJVI6lTluScAgH6i5pFBXqd7ro?=
 =?us-ascii?Q?b9sqtPn3tvhIN9pDQgHVsKrWsxx4abIh1C1scecIFYyZhxSM8tWzVTGtt8mZ?=
 =?us-ascii?Q?tJe+6cizIgRHhcrxjkxqYVbGDL1n0x1zPhKpfUcqmLg4UgXNvQ31GtuxUv4v?=
 =?us-ascii?Q?pOSssjMr/K9kKvbXRgW6RXVPg6xD0tURGVXYtd0SNi5CcsE4V75EBhBNWVWH?=
 =?us-ascii?Q?OiknJXajFYvEY0ZHBt9mRNYVFJXQHf+Uvs1zx8g4X29nLv47oCxBhxjOJNI5?=
 =?us-ascii?Q?JYbX4pbZy28cuPXxMl9DXbxE/a+jw+AdJSW/WN2jAa1A/DpJEJhkqg4S5F/K?=
 =?us-ascii?Q?JqNtjZkwkRWLxIdY1IlNZCHrVkbzbARybQVwPeOWekaOKE0D+c8afAGIoXB3?=
 =?us-ascii?Q?pnr4FvQWVXFRvUMYctaZVp8uGdDnXskaxqkHjPhjeCZy0F9tOioJqK4e2Ipt?=
 =?us-ascii?Q?bupqaxVOV4tOM5LLka40+0sigDeYgHkIPeZObXii0XdLxaCfNq4ZvdgO4yZ/?=
 =?us-ascii?Q?3gCHQy8+8OxcMGwwszldJIGvOaEToukpiCZGxBCzqOaBZuTAgoWIsAoo+hpW?=
 =?us-ascii?Q?1LY4S4zP/aTego38qy/JrNjIKvu3qVks6ElkZnIvxvB3lZ+C2bs/oc0BgINs?=
 =?us-ascii?Q?IO8+wG1qsZ4biq7fDTDFOiLO9+98oiPkH1uB/mEr98zGXIp/l1X+X9EI0kUA?=
 =?us-ascii?Q?gQWzAhgnGSWPaoXiLFQWEqBK94EZ+0T2cN/SY2iCve35N/oVgaWDQzfD0x1b?=
 =?us-ascii?Q?67HYR4oPVF+DEmdcPoApcmYTNr9PmD6H/9AL94p8Upw/DNoVn5W2ZkJGQtC7?=
 =?us-ascii?Q?rxF3XMX9PSI9nhTow1SFIUEesVyXAvyNrZzDu77kdshEOw2IZnzDc08QSzx+?=
 =?us-ascii?Q?fB11Y+CQm17I8S8F5Nz4tMq2d2Y8OASOLmwJRelLJZ4G0ZdGmv2m337CnTm+?=
 =?us-ascii?Q?BM0gO1Rz06JbtsyotF4b3dQzp7XPujZga3ZfXwK0ke9TyTb31/Ogk1YPpkbG?=
 =?us-ascii?Q?X7uF1oZuRP0KokFlVWXCOFkx4pYavC94NozGvfbCGc3Jv1ZNiF/MF2JvmWWM?=
 =?us-ascii?Q?UbZ8KzoL2IJJBaPk8a/Iv/ZIBpG7IkmzyF3cmshAyubyr5wdJYnaFLxLpOPJ?=
 =?us-ascii?Q?1SFBY9Ha6nzJLaoK4C/o5e8X5Zo0bL9hrrjtCYRqcsU0+xpjj5DXEp3ec+9D?=
 =?us-ascii?Q?b6FkFr8pKlJPCzRRtQczOQraQCaM/cJM/vu9+RG4msx8+EYYs/GxQDzLiX69?=
 =?us-ascii?Q?aqs6VsTOSdCrWaZYwtHPU5jIBq3ajLOd2Yi2hlr7pXq695/x78NxWaR68owX?=
 =?us-ascii?Q?CdNpMaUgS2V8OCu8WKb2/ucQt8lloUgtR+k2JfOq1OhspfB/3Uo9RQsyGea3?=
 =?us-ascii?Q?Vb9DK+LhaC4y9SL6ydeGyj1+klEHLvdNMfN5NDkvDn55AcwGOKhqVbmZwws/?=
 =?us-ascii?Q?bYNHcRNt5d8zm2heQlGZsHwCUPiuhXMEKQGr5E2WsIFd9ui8b9KzPs9OrOwt?=
 =?us-ascii?Q?wRFiufEJmNcyncZm8wv76sQ/GoEUTpA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfd93db-76db-42c5-b464-08df11f28f89
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 23:56:00.0206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt43C5e5Ds7k54XgtTG1dyMwvJeiZUCxXy2rcbYua44KHNkvcmpAXku/g4lIuI4nMNQe15TZjRL6vDLrdJ7Hss545FdA66dYRWXBAk9pwkidpTgL8Z9uePZ55MozaPsz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15704


Hi Mark

> Are you sure this is safe with DPCM systems that default things to being
> linked to the dummy DAI?  If we run autoselection during startup and
> looks at the dummy then that might not reflect the actual link we end up
> with.  I think there's similar stuff going on with some of the Mediaktek
> and Samsung machines, I'll skip those patches.

Ah, I think each FE/BE will match as own format, and FE side format will be
used in total ? But I'm indeed not 100% sure about that.
Thank you for skipping. Let's ignore un-safe driver. It is not 100% mandatory
feature.

Best regards
---
Kuninori Morimoto
