Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70A324716
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 04:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785903945; cv=fail; b=Kptb+qVEcd/542e4FubWxzKgaKkucxZw1PWef5z15KgfYiabOIyekPM5h3URY/STjsCNVq2pW0mZCG58JLgJM5q4Gs2W9xd5dOKEjFN6G4mjxjAnj6iLoXRR7DaXp5bCrys7uYHCMYGJuHfM7y9wZ+5CzGv2cCjJ57e26cD9/rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785903945; c=relaxed/simple;
	bh=7nZAp4cpFfLHOdtkrCpViQb/QAnBgiIdT6upfOmfuBY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lserX9OZMlDXXmOLY87ZJi/Wdbqm6CMuVyz0WCL73+r1Khym3cZ2XvtOGrAnvHpg8xQbDENfr0WAvGmX4rh059iNa8AEG+Y6UyKR9zHTl8gp2nIigL3WL+Wg42xezSgY4yY6GiIOYSqjSigUCk38GnvqwCDZ7uOhSOF6poZMt7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fXJ4r10o; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fXJ4r10o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvHR+TE8ZPUvtW0L2Gv7g/GgdNm8pO5Cq3F8saLHA0Vvwr6mWrFkCp1qVRouJ3FLISYJUkboopitWKAWXgqWOJy5MguphunCmc1Nne9dpWBFcJOxw8+p5HLkK6WR133TS18ZpBb8qExiXkxcqpF4fyk6yqyd+b+GICzocZi7ft9cYeBXgi/cQ/SQ2VplYT5NCZ8i3hqUdu7gmPsprTq2QB24ZbFfMrh0CzwiyjfOOVNjyulBNlI4QTDUMFMUuuwA4A7nYnG8VQuAh/AW+u0n6NhShQwU1j3yoXnZ+1L/c3Kd/DY9VuuFvb2FsYfSac3FNrQHsHF6jC+DQSM5LeUisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UAf7DF/Ta2rz+gn/YkJWAfgeddcQ5C1hV8ZXBNcDSE=;
 b=gfs1ILBAKlQErwrhKZwtkAJynGKirIYdNkOSdf5p/4lS964lgEIS4HMGIv4RA6hCmyioWpwycEE0gus8YwwOOS5fsI/Fg9lShN9sIw9j2wvPnnu0Ebkdr0J1RvhsVggG35LgDzDSxcN4CWwpMSFtL7uqHUsJt913SbUyXj7v42fxn3U1/tSVLSVJhrmMIouPN/9oZgnNuQJ/P1V9APPMxGXSXMYKJPYnX50PMp9L3eJQcYaAGL4HWl9kLPxBBLVI+siH5Aj/FG0e8O01Gf7aFiPgkcglOSXHu1/J8u5NpwnSDA+O1gAskshgEi+yh0rn9wbuj/Wl8zfpXPx+/WBTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UAf7DF/Ta2rz+gn/YkJWAfgeddcQ5C1hV8ZXBNcDSE=;
 b=fXJ4r10oOQ0qrFjHRC8YBE4KN5Csj12MFGe8UhB2CTkMeie121uFQnsZN8pIqRljZVSLOh3NbC+6dVRZOQHk8fESlydx49fm5aVkI+basvdYA39G87cMBIDkommCjTd3XdS3vLs6Eizp3u76d7zOTHEAiXU1qIoOV1J5wdAu2a8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB18211.jpnprd01.prod.outlook.com (2603:1096:604:4ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 04:25:40 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 04:25:39 +0000
Message-ID: <87ecgdurb1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,	Jaroslav Kysela
 <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,	Takashi Iwai
 <tiwai@suse.com>,	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub?=
 =?ISO-8859-1?Q?=29=22?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 43/44] ASoC: codecs: wm*: use .auto_selectable_formats
In-Reply-To: <5a891fd0-7ce8-40be-9317-8bcfbd5c1e5c@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
	<87mrv2vhnq.wl-kuninori.morimoto.gx@renesas.com>
	<5a891fd0-7ce8-40be-9317-8bcfbd5c1e5c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Aug 2026 04:25:39 +0000
X-ClientProxiedBy: TY4P286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB18211:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2791ce-f157-4251-4eb0-08def2a99abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4m3qYAxeY9HV+5D9vZ7xZQhj9gN6EWk4SzvCWXqR7uvbzxI91i3E9cIVFVZAqQHr3BYUB38J41fcNFHrHaixpWDPtmTzCdx2ly+GAH33Vo53sK+kC2wQQIzLWm3Bck42o0ieyTx7Mf7zp4ArmE+LIzKACCdTzpbhbNbgCc9NHyniEqVLg8g5mR137gbRhYO0g/5qp0Q9UyUR7uY4spreciiolDl4nuS5Q5PJ96EENTcYcRGgq0Vyb0SFDy1VcGAaphMCPIz8ppkioGUMl4GbSaFOgNE1z6RTGYyuDWqchicARsY7sk1dSQpvcZELj9kqpNWfoCaMtb2WmwSQc6fpaUnOZa7WrPcjfxcBs4uVTN77JIl5XiOVaSLohiInr/wa5QobKdimxeutHSDTsVFWSTTEvN/11Wo8qLvpdnurQptP4ZyJhu8840mMrXb1G9cDhXeR9qzczMKZd4t5cmOl4yoRQrqYQCM7IWOUSjBjGcTTlrh52ce3nBnckDC2X7tpROf5FKnf8om0uY1DhvVwVRNNdThDSSRwR01fzmkY9iCSCAeRHjJUymlL/wdqxdYvPbZrmC3SuaMl3B/AlP+G4uo5DzorpuVSNGi5tsOxrUNapRdU8veU3PXZCzVq1KPpl2EKu3iV98eH1iKFCc/4qjfwLDHgmg6+EARj3z6RlR5PnepdR5xUQ37+QirtNoPahseouSJiXVdGegdr0uJhfCdKXJZ9ozau6GGlNsC1vj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RaUN9HjkDaXeJ7vvpLjgz2nrmelgCSJ5uepDDIRjJzsNXc7hQ9wqcXrZbEob?=
 =?us-ascii?Q?k7cUVCVRPa9wH2T55GrxIc6jHvGDQBpzL5c/z80fqakeDwQCcqYutl14BtJd?=
 =?us-ascii?Q?ll0TFjWsLltp6cWmzNXIZx1X8ydvr7xjzXHwiB7x2hLFnplSLd3cZAQNJzAi?=
 =?us-ascii?Q?FD2xIzsCWBKOhC8VVztyxGhLeu+6mjF8Sh6MmhzBHOi/t1vlqNXSaFcNeWu1?=
 =?us-ascii?Q?m6G8iowsazEx3O60rgL8HRcZC1R+nGt83WzLEo2rzEbU3R1J6iip9sKlrubB?=
 =?us-ascii?Q?5Q29aDsNUmR4gTddH7aRA/fECgoXY7jktaMOmfWMswBR1B0HDtadniVaeO1f?=
 =?us-ascii?Q?fN9kzd3/D+E8iGfHcFtENF0Lf/dnn0lqZPEs/bqWAYndGkLvRWYx2TNqlOuM?=
 =?us-ascii?Q?tKuZAdbpt9nZBRYXRt6z0rWH3QBMIqaC0duTC52XhBPo/dQMU7F03DX+RXyF?=
 =?us-ascii?Q?fcsMEpKcEcIL4nUDECyLXHLe77stlA7SnvbyXj27u0V57lTDWB2sRhyDZV9f?=
 =?us-ascii?Q?KzqAgEoUXAepQCmZTbgOECuAUCvEC337YXWXv2EPbzlA8sFb72hvJ1/iWYg/?=
 =?us-ascii?Q?+EUWX0xmx8aJtRi6VHF3vJHmXbieC2CGf5EiuZkVmfq4meuBsAvcB/BD69NL?=
 =?us-ascii?Q?HQHNNUQ0mykvPRmvGu+aqhIoC0Q/IGHsgfWSUdmzQw9sOoWBkG4r1hAXMwFU?=
 =?us-ascii?Q?DRohsYfyIJpZl842G6ebIP6luywYMU8vfsVwK44tle8nlzQUOiBoGfXvY7wU?=
 =?us-ascii?Q?dmOQkTRIVXOizpAE2XQsOidFmQ6R3xMMzBisQ9W4UJ+sZWfjiO4wbgfQmAZC?=
 =?us-ascii?Q?6myGcPZUDuL64OIxxrefrTq5hr0863f+K7c/Qw4S3tOgDFvFK8HHFtpMF8wo?=
 =?us-ascii?Q?ukr0GIH4reyt1RaXEQC1TPrrYpXALLcWoZGxdRQ7jokq3CPXjNz9Tl0+pFXr?=
 =?us-ascii?Q?lRNgJs8R2PnS/e7se1lop0XqSgzCbZ4/kzhgyDF6tAldQhYUhjdkLS3E3k85?=
 =?us-ascii?Q?z3fjiIx3NSXziKwoOuWwuuPpRF6HGA9IdRnT5YRdMVWhb0kpybNHz6lmnvlb?=
 =?us-ascii?Q?Sg8C2ESbqR70J4zIk/C54pfm2oeQeYUuhX/fnKWVOLQNWUoD7imtzoJNS/z1?=
 =?us-ascii?Q?c+UKcrB9wOw9U8kbmPTzMmlqAp6HgPUmI+zPf0CUGz0AovhGMPkgFg0GLG5v?=
 =?us-ascii?Q?xFmzj9lS3h+vpojjAaFoSYvjJHwCLrFqSriFo/wkWHn/yVGgYFMifN5OKirI?=
 =?us-ascii?Q?y4gO0/Eb4nnbTYBqDGy6bg1eyN96Z4tk4sPTJPtGKiVIrlcTeMZP2lJGapWJ?=
 =?us-ascii?Q?gL5cxHxg26/d2S0j7tPG4ijOmPqhQ2/gdVJ7cjGHXdWxAXImaFRlam2htSzi?=
 =?us-ascii?Q?Iew/LM7hDLhSyQskq3Zjs2BdKiJJz1PWOMBFfYoHPtfK0UAU4ojz0SMS7xRz?=
 =?us-ascii?Q?fga3e3AzK4daxrhql/HEATK1EXvEHn/jRt7HdA/4ymO6yfAdW/8a+Pkp3tf7?=
 =?us-ascii?Q?eWrPBF15cmw40Kwx57mhv9ao4r9JBtf1mIMm/jM0iS7Ia4dF4WOTDkGkenFG?=
 =?us-ascii?Q?Uf7qgrYw0/rTBU/xLZobzHaRENf0oXmM5ab42rjpC2VbeyAnwEtOoT3nxlb0?=
 =?us-ascii?Q?K3PKzTKj0ujr88+hHjgNgw/XIt1AlbhCbakzXtoIHFdIiS/PkfYJuVg5RPAn?=
 =?us-ascii?Q?nZQ1UgToajDgXslbNgtaBFhe+mnVwYvGtKULC4EepZAMnpp6GxQ+1n5GJRaG?=
 =?us-ascii?Q?nCKfNV0M8D3Ts+0H9IvKKOod5r2e9xE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2791ce-f157-4251-4eb0-08def2a99abe
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 04:25:39.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSOZZ713cQRZUz2pJRugzv82ozPJ1h/jYkDzXm68TTjhhYE4CctbTOTONH7NoWShWcyec36fw0A8c0H8N8rdG3ItXXH3Am7h9SVIAVLsuvofn8qSnOWaa5Ihe3OLWZJ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18211


Hi Mark

> > We can use .auto_selectable_formats. Let's adds it.
> 
> wm8580, wm8962 and wm8974 don't allow all combinations of frame type and
> clock inversions so have the same issue as the Apple controller.

Thank you for your review.
Indeed there are such limitations (same for other reivews). I have updated
the patch-set. Will post v2. Same as 

Thank you for your help !!

Best regards
---
Kuninori Morimoto
