Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569C548EE
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965302; cv=fail; b=iOd2ZJaqHW05+jwz7KKjCBh4knaR2e9hJtCGjdna4ln+yLwsBJz1MDeFMDSD/zhS6U5djckXK4KNh4LSAXDbbh1/HLpfzcAZm+XNtz57zVrN/XyLtIf7WVs7HQS1EWZQMlWInnWNSATA3KY0ZC+bHxZT7YMt1S1zHYB4+JEMpgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965302; c=relaxed/simple;
	bh=vpYnQYXqVFJAPMKx1jXObqjGnXa+EDBex5b+aPfbpXg=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pYhgAkQHBmgCpzBexocfaK/yiWrOCpoBvZapGCJXbkT/rMIwRzxP9czh2aj86Gf7Q4i2AmiwAeSvElW9uLY2qnPfhi+ky1t6RR703/akbUziv3vRhtbHdWHIef49fFmCwwIpImAaUOi6wlXI3TmuqN5kIFHQ8RFoWT7X0P23lYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dvHZi+Zk; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dvHZi+Zk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJuxwrX77YyHzMD4JiZeYxSEkNl4+IiZSh5rllRM0a8PvzSGq13ZuwPN8+YDqilQzmOfQcha1FaJjpcOqIB17nRcmdKBzUDrECcSDe/FoB2pOBKIMfts95IIHzxpgSvyzBx3okG7NaOUgGTkVxsI19HEhVE7+yhhEKGclzoCKjCqVY2B9Xt21CaZOJYk2+VUWrWFX7pJB6JJ8sRtNO1l/DJi9LGRr6LBI3HYVzlJqUu/wN1LB8hps9gXoaYSUqd6Hqvj36moFr5v/Yuuhzx/OAdznNZVTsvXsRf+a9XykXXHUPwMH5ArbD9GpDpGaURR78ODy/blpajKb8Upq2MkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0PjrGMe8W89rXeWQYv38KC8IYnIdhabYGbCVIwCe3g=;
 b=HXB/MT7eZoGfba+6ZCdcJymEYgwZC0PTJFPsRwNdvfynrrsd6YaWYzXqs6dRou4GGHh/atWtYm1RNd94sG/YGN6IQmlTl1DJAqWdMnxibXvz5TIFYurUMQ6a14TJPBfgW6aManHMHGjb0nzF3i5xKvAOWTbFkQBlCyMhwPKQpssM2ao/Ke1diIgzbGHjJhENEoCZcCOdoxSNDeJkEcG/ddwK14oc9CA+L51AnK9gIZ+JFOS3kzI9i7hInk8P0dm7xDuBO5RTyMIBIDur+HDQTzXFsHbFpDSHnz3Wpl9ZF0xoHSOFRwrq7GGO3yuYrhzyrsFMtp5SVkl2DWpAMy2/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0PjrGMe8W89rXeWQYv38KC8IYnIdhabYGbCVIwCe3g=;
 b=dvHZi+ZkvVledSJn2sACHto16WJ2+hlx2HvqB8y/KRYk6CKPQ3USqcLmTNA2JuVPVJpjdJsOqrZfBd/Wlcz/NJ5LWISEs/2pIAfjF88iahhxlJla/1leVxswdCut8TFVj6azWq5eSK3B4T0aFWMZqywUtZuntm+LGctfaxtCh4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS9PR01MB17156.jpnprd01.prod.outlook.com (2603:1096:604:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:34:59 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:34:59 +0000
Message-ID: <87ecig3619.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 4/9] ASoC: codecs: peb2466: don't use array if single pattern
In-Reply-To: <87pl2036kt.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
	<87pl2036kt.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:34:58 +0000
X-ClientProxiedBy: OS7PR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:604:253::6) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS9PR01MB17156:EE_
X-MS-Office365-Filtering-Correlation-Id: 891dd29d-5956-4ef2-d77e-08dec5beefb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|56012099006|4143699003|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	V+YDlBX9gNGN9qoI+y+8BuUvxH81X0MQWIG51lnbYhaT1SZs+Uj7UUadpbn/PeSzJ0hlT0ZclMW79Tayt6R4skKDFBVhw+v0Vi59sbZs5wBbJ2uVvV9H5Q2AIrYoPNlmJJXRdU/eq6f5Q4evzvDRAWL1Ffqy8Ai2JOwHdRLhdUzJlLcS8BquRfdCiWstyH2jxFCve9tP9geDqJKqnhnOj4pPgwd87L5hgVDBLjXH5xfMV5U0StXzjSDj2/XPSmAf+Y5wl6MvPUeQA+To7U8WvQ3dreC9SGtkfeUNs5Nt5ELZB2tCkMNO7dKduQxOqUADWsof8bg/osYNp9AthSDbGzTeL0mILeC579L1Z/qwpotasWfXJWgSfIci6eyNjJtdo5+EAQDfD3C1av2teDAt55Aweuw69Lxo/w3lr3rFBx1D0SKsTxNDmDmJ5rzMhmCL0thyvRVBVmIzp8VsKIop7CaF3HcRGBb/qHUpapUdcmdYI6DvWpzXjev9Y5LMe78jHA8YsH9dQR802lhZP3wPbsGGFCCWxQE33trqhvm/ZOEJF3qx4tg2wNOqbgSbwv9VuXCqrFhPjzs1qJxBA7fLPsQwlPNsjfHex+5gJsLc5/mRZ0UWlfcYSJcnz+LGIb6lLPSvM0A/cw+gIZl6wQiQ2syb6viYFuci5c4MvdYdmrMrZ6d6/EDmjUr2p747P3lbvV37v5fgITYt1OQdCj8StzbSfHIkH7LIqH7gEqsdsNbqtgPjQkvPZxCXwqJbT4mUiffmZmnKG2HXI/Ooyvto5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ZYTg1bxqbMYOAMuHQWnf9JXjSzdX7Mp9ZIpXJw+EwE+75yR0G9V2fjQgMxd?=
 =?us-ascii?Q?wBu88TA886VfiOeq9+8TbV4y+vDaeffwiYS+ggNTLRHY5aFayAzFDYePHMN/?=
 =?us-ascii?Q?ZMm3y50IOxD4WCvnRzktL9jKm9rwaN2D7t6Q0PC8uufUoRZZz4+lleCq3FLt?=
 =?us-ascii?Q?15ANeTTDalRwAu0xz/pbG3ZagZGigsjR08N2x1PRDw3/7ceCm6DMsC4DIj6t?=
 =?us-ascii?Q?WR6FUU0wXpI8QuQWsmEfSDxOSTYh6Ryj3cKgLj07tQdo2eK14JmamHwEK4Pm?=
 =?us-ascii?Q?uohSqurIhG0+LgB3zM7TJprw3N+OAP5ZpXuqf8IBB1VdtlChqjZSzglUHVeC?=
 =?us-ascii?Q?Kow6wDAUd+2QUBgMjqdbQBOgMC3VN2snOG2DQap8XjkGYJypLAvrzXEwsfiO?=
 =?us-ascii?Q?dKkD2pMiv7guB4GfXYRh6QAF3C0KsxPJ2GsBvZhUAeS7MZzKqBlolW2JxEcv?=
 =?us-ascii?Q?wBWBzz7gy7Q+tuOieV45cJvVnPqW+g1jF3wqDWzzAypZFxOgoheYwavnLxiO?=
 =?us-ascii?Q?nPvlnblMiULMXYpGVyrbd7dmuVPprsRqSoIqXx2sXKMYMtA4U+AM6ucq0ff7?=
 =?us-ascii?Q?3Tb/u0HlJnJWTOFzGu7eavK1Iu5tA+D+hMFrZBCHesoFBouxYkBk5J+2Wwmr?=
 =?us-ascii?Q?Bs7CbKQ7KKArt9ALjtzArm9R0QU5SnfFBTiOOq3kbuWNg+Zg//hHSFDZKKLr?=
 =?us-ascii?Q?atc4aG8SuNn6yXhrDtEAgYc5NB8b3fHcmCbl21RXnzICychCdPy5cYsFdNX0?=
 =?us-ascii?Q?ljRqCqR18ksTe8+M25+fb+05laEihj2LyKBgtEeHeAb+rGo2LNk0CKWu6UmT?=
 =?us-ascii?Q?6QRSAVf9jJA09tyE1vxb11LFPMixGiikRNB2fkYFxkg3v0XxfdXsQP5dbrDf?=
 =?us-ascii?Q?JsvCaAFYDkEDNxy6ACYYmNXxI1T/DGvvVFDPgM3uvdRmwmKsqx82PzPDkuHr?=
 =?us-ascii?Q?tXwWY3yA6/4FHoS74UeFEN3HpmyRUwNnG2eNY8Ai10B9gbC1XcyLoSJlCxSW?=
 =?us-ascii?Q?5e4SYxdoCFvbMwKedMPSiDmpwzO/Iq0hm3/Hh+R+XY8eCbvxme09oUoZ+kGw?=
 =?us-ascii?Q?WDRCn0Vuz8C51U5mws0iKvxxMs78spg8X/TgeJWYEXITHaZ5eKJDnEeeZIix?=
 =?us-ascii?Q?PiueI0Y7L/YMD8dRxZXwW87WESUGnI7e+pp6rgEyTuoksk9WsX5hg5oXv7Qi?=
 =?us-ascii?Q?ezYd/OLCV0AShaT/6Prf4xXQTiMMjiN3He9ZMRHHqr933gs5iBja2t+ahYtU?=
 =?us-ascii?Q?SgkYJOji1FJ3AgwbVUHEz96+0YqfsIiX1lnW5hSzMY7EjW49gM1EELB0kdyL?=
 =?us-ascii?Q?CUzfSgIPa5IC4eg2HO4Qnh/Zdv+wFvvIIL7B3+0014ZZo0aTOC0WJSzpQTAO?=
 =?us-ascii?Q?sfQN/3+dmtO+9YLvW40pJNWu8B9GKg1uRyodm/n4vaThqX4xo/OGbiECxUWP?=
 =?us-ascii?Q?0JoICmJsQbUi3aiLbd48SxhwJczpH7z3kc3BGEMD+r0dk/eOYw0Ptp0u7AF+?=
 =?us-ascii?Q?yOEKPQER1C2Km63s6qhUrtmuFza2u3vE0iVSh2yAynOihJcN5cJwJNhuBjWB?=
 =?us-ascii?Q?c/z2YaQ5vaoJjBbKfGlvji65xnKHFOrquSIJT0HS0USMPZWUoWubshgI4gxr?=
 =?us-ascii?Q?vnbPjP2NJIgOfo/QRCDTLOUYSqJBQSWorccipCxmCgKQozlfMId25O/8RlOQ?=
 =?us-ascii?Q?kFF/ow2dgnu+ucJeq6ikefSNKywri65E3cSdXM+05x+PgiT6paSL6UzU+G8B?=
 =?us-ascii?Q?Bjh/QSMPsGAAKbWUDrlNpkOWTJq2kwsL1EC39CZtzl0/Yg2teKaw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891dd29d-5956-4ef2-d77e-08dec5beefb0
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:34:59.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8mP429hSmfkyjQD1wD0rcJkG5pg0G6UU4sEnhqFnHEul5FTvAWcpnCpzrGQh+JF1DXJW0G+cCi275UeQdW/Q0UasAO+Pu0Ak1UlhdVktTn7kKxot7nRuVXBbLlKaJ7l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17156


Hi Mark

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry. this patch already got Reviewed-by.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
