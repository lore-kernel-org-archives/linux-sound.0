Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006572702A1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611680; cv=fail; b=BFppfD39w0ROaMF+PYMXeNdviw2d40azJjaMuuEZ5iP5S/rBM2Dot63PZZJ4QB+g9YLD9elhwdfZ7PwDW9G+KZd22CK6d9vQPpBsrl8rvS4XAVcp6NVIkENrkRcfx8vycMIQfHMpJZjZSAc410atuW5WRsLGXJ4YKQPbxPg+Vn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611680; c=relaxed/simple;
	bh=EsRMEg2IMWevMOekjyajI9bZSQTsLlwNX9hLFfLix/0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AtBku2jFRv5If7r+w1z8J4RG0rV7Q6SU/MowjtS4hdg0pVI7WGTuX6Hor0jEhJjZXsXfWPNFUaGmDIUYG/bRNMcac92OxmkVODh4pDvSJnRYoSF7MX2Es/yXcdeuAdbswSisIXsEayJ1FovzWD8aW1hnuHO7ELdwebD3uHTHqIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=okebnvhe; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="okebnvhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk8Nudi8iEXgmd8UEEYE/Zf/zfDk39pZaEd8WFFUFj+wtX2oKgHztRBfWRPksEu1FCUANi+GDAMlSWFe6QTL9zkrsep3ZCLtmmNoV6/7McOD7s+Na7zNXyW0RsnM1AAe6skULbeZQiIlBOxcq9wbkMfNkuI+2iWaAaylajFPfW9xFCII+lsFtfLmeldlOJxaQWPtZDhWbWSWQQhVN4ZD0+fNRZmtZuTPFv8A05GBOBJA3gjzTVVYExPl0Y5+oD0fEFkVZpjTZKmq0GDRc3BR6zx27sM9tynvv1/50dGPkn8u3hU6CZOLJrFBcJDL4EVTOEsEtQt6Gi7dyvCoJPI/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QueVaoH2KAaj2ufF0mhjRMS5nd2VAyYix6NQKNzzAw=;
 b=E0ljZD1RTqcpz6dRMfxlw6+4SyctuWEFOfwKSG4mizY9bk5eZehlD6Am6heudleg5V51KsPYZ3a1MKV436AhkRhMLQSKb0txZaVtW0cbugDn8DDWG45ClHfaezrigIBObG78R7wtbRtinWJppoaHDRA6xJFJc/t2ebvVTY2rMDyhoeXH6aqYqJeaGo/fem2F9hDcIxO7QHYlbSZEtngzrlgXIV7TUxHfiRrjxvufArqnuqQH8CKt5z0unD6clZh6xGqZWorF5jrr2MxQsyat14sxQRmRjcDjaJrf6Zo+TZPJy2N65VXIykDrU9aiNQ6SXWKdAzz2LPsgnhSswY3utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QueVaoH2KAaj2ufF0mhjRMS5nd2VAyYix6NQKNzzAw=;
 b=okebnvhecG2Bnxn8X+wVmgM7gCff3z0ZhHhkvsxskMunAJzTHGvx2+tntdZZW9QmxQqPVPU/XskX178/cYyl1+7+RAWMOTzLjGvW+YD+BTW9rPGNvnqxoplfuGDN1t6OqJgRzpvEtw3UOa3eoVcZmcbHvvI6Cdwpk2f8WE5k35A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB15051.jpnprd01.prod.outlook.com
 (2603:1096:405:1a4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 23:14:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:14:36 +0000
Message-ID: <87frk0qox0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
 Detlev Casanova <detlev.casanova@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: bug fix patches
In-Reply-To: <968e6830-2826-46dd-b7ca-107cd3af89b0@sirena.org.uk>
References: <968e6830-2826-46dd-b7ca-107cd3af89b0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:14:36 +0000
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB15051:EE_
X-MS-Office365-Filtering-Correlation-Id: 25690158-0760-482c-a119-08dd56bb5635
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bhn3OONTlECvNMCUqSmqT46x866qni9zSfu/oakjUufdJ83kfZKwtwGjSI16?=
 =?us-ascii?Q?6f0YBQQdVETR2tj4ahlcfrgc4IbvU3wAMmnhguVbygq2xTc21AR8VONCa3xl?=
 =?us-ascii?Q?AQlEVyNnQsmVDGiTKvgLGDtBsbzbK620WG+UntD/RuNrJjcnKJ/vyruBbsAE?=
 =?us-ascii?Q?zXb9Dd0ZZjL+PC3o+PcgyHhz73Q4GfbhNTur0AaV0wYmVckqCm8aZD9In/Mv?=
 =?us-ascii?Q?vejIWDQaJnkTwhNf6SqHz1xhuLS0/HQix2esAn+RV7wT/oC12eddZYMmjuTW?=
 =?us-ascii?Q?WO6dK4LToKXxlZJb/8epy8sOqig0XSTbbDsMTqbzFl+6r5y/tLTBRz4qaQXf?=
 =?us-ascii?Q?N8e5/vUX32ZPVkxJmihkyZI/rM29wj4k6ulFxZBAFivBeQTL5laSgvt/Bh4V?=
 =?us-ascii?Q?oMBrSB3G+ybsoWACHpUJ8+qvjI4IPX5WRcYZvO1Hugy2VZCiwmm8uFueTa29?=
 =?us-ascii?Q?9mXP0M+QFQFgkT2DbqfSTE51G5VEE04j4ezkNfNpP3uygA8uqQ8xTqvuwi7v?=
 =?us-ascii?Q?W047kA6kaxzsdpKsW/ykTmAoYUj8dXkRazFbK0w/7g/xnSSwcUijYV03o8PL?=
 =?us-ascii?Q?tnU/syUdzvTCu3gCCO3cCVx6CUOSu7W3JYpJb/VLldYkcSXBhRRnKfpBQuDY?=
 =?us-ascii?Q?t9KbmD1v89ETERZSw/EZeO6IULj+9vHbgKNQAsepiSfaJqIGAwzeLZwrlKho?=
 =?us-ascii?Q?ySHWIdkihLNmOLDHcHvf6iC560+Sg58LkYwNgWv6UMV2CgzFdjP4LdVFWwZl?=
 =?us-ascii?Q?slYoCVrlt19uJ2q4MwkpXLeZE6GgSkrpN83FxFiCwOUAKim23759l0Tuwsg1?=
 =?us-ascii?Q?9aN+iMs27uPuCrDpGBvaaHfuhAjKPBPA2rCuKMYjnYcjP9lvsbeTgCmRNgh4?=
 =?us-ascii?Q?eNRXnzmAzxBd+aizwheMqW7a+iBQyoeVMa0BVemMqLTcxmKwvH/qSNFuvf92?=
 =?us-ascii?Q?v3FPoofn681SmwoxF0z6ITi5b7PTv4jfOdyWTy5JLSzYTYBWlUhz0bC5Jn0J?=
 =?us-ascii?Q?pv0U3jUqy1EEUub2/6DC7Rs5jJPybIaaUWF+o0/61TNMi9XTnZiux0wZAZyS?=
 =?us-ascii?Q?jplUHvZKGuopiAOetVMNWSGCcWX2dYLWi3EqHlFyYTAi1CtSD8RRN+eaXhMe?=
 =?us-ascii?Q?l2LG/zwKcVmEhllJv2hS7NvQhMeve3/BsJ5umT3nB/IATdUwt3E0uhi0Nus/?=
 =?us-ascii?Q?RDi2z2rXabBiUHyyumvsI6gq0aQnCtXrIvEa5U5U+Wvb1cdvv+se/nBk78jc?=
 =?us-ascii?Q?wuamAoo/XS2C9CdDkTxMQ4Btrr+mpkLgwQpA8Gmn1LUir68jrWzjMHIrPBEw?=
 =?us-ascii?Q?Pmpl8yZTXtq8a7lPfy5bACjK4Jq8aEqlo4znWkHozTkIckjXBAUPz39d3R7K?=
 =?us-ascii?Q?DxZTSAW7AHzaQ8ouHwXoouWvHSnSOGZAjdMczfbuVwztWKRsCiEvtPpY4SdP?=
 =?us-ascii?Q?+e2YHNg58+Riq6lEdj8P2jmQES+XhTHi?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Z2daATLuYA0kt7X0HF7Eeufs2/wsxwLU9CAWWNPj+qDpJcGiJ49ayPP87l2V?=
 =?us-ascii?Q?bdbfdEPjbdbAjY/FoD5mteOFDAXdSm+WH9wPl4LSaGcG/RJWy4R8l2x+Nbht?=
 =?us-ascii?Q?XMgqsN6S8uzS1Tdpteb3mHMnjYGKLef9UrzsYup8x1w2hmsW/vEhm24X3CqQ?=
 =?us-ascii?Q?H84/mOVZ13JyfiacwTQYDCi8Hxt86gKlMjovFfZhrZ1rhGE6E8KmgIJobjQb?=
 =?us-ascii?Q?hRH1uYQ3qc6YcpSKJK4igKajelmX6fu1F0USNJLKJUsCPEk9gEuGhXXmJW2q?=
 =?us-ascii?Q?vIkKhPvSAmnY9UICyYhZtkOsh8xlKc90RNxZAIgtJSVHjq8Y73rvMNUg11Hy?=
 =?us-ascii?Q?BYCIr7yPw2lXIg+ZIPsWN+vwOsIfB50fIO10XhgvC/haeAv1i76vB8m2uh6w?=
 =?us-ascii?Q?TJKTPY8reLWONV3lfu6nmJesz51zwF3lbhEGawPPsTfg0Cl82eWrKvDiXKHB?=
 =?us-ascii?Q?Adm39TDhqq44gaTBAmGx0yVo+pqy8LgkZI++uaoi1Vy4PLD2booOy8D1pFEt?=
 =?us-ascii?Q?MJjqGFQ8peQYnWoX9NRnpDJ71X7+HceKbIL1sJsk92cB+ZMux0OsBtrVQmFR?=
 =?us-ascii?Q?5c567V57QHOjAxIiT4LphCRWGE4G2nGV0nUBI42YF3dOazbCbLDskos7qpwh?=
 =?us-ascii?Q?HVqTLF/MyDBiXRx8wRgzJ8PCMYpBap5lgAthOBMXecK/tPSwlC0K5ZR5X5zG?=
 =?us-ascii?Q?gIkLmtv/XHutPE2S3SVr5Na3KDlvzmxZfoJHf8OuJ5V0pbVQrC19H8GYd/gQ?=
 =?us-ascii?Q?pYrQnAvrjcv6N2rzsFqHFAChdNpBIJmtUJ2zEpHN+nS1VxVB7OVtenVsjxBE?=
 =?us-ascii?Q?FiL/yNIwyz85ddpXMorFHUTwVf9Q9nv5RDBe3pdlJh5q9iRVdEenqcZImaF8?=
 =?us-ascii?Q?kzgqcZLGcGwD4IEhrH3tYgputt5iIXDl3w0/r4Yp4llGC2FvAHgh/l6N3/em?=
 =?us-ascii?Q?VZfAZys/ZAXY/8wHFZQedVS9a2jOlgAtjvipLZd2rvLIGut7GorfULHA4vWh?=
 =?us-ascii?Q?aGZFBhy7un1rW07LwVbL65tVKqdGfj0kKah3YnjdOzONBhNtjHLOGmvVHIyU?=
 =?us-ascii?Q?3uPwppGBZ0zfVIqg6ebFoR5mo/LEciOm8vMBUPJHXPZbwXwmoSPV0FBtXNuD?=
 =?us-ascii?Q?XLkA6stv7MO64DJFmrv7DCrMhsPh4oIWK2Av+UDqruXZzs0W2rY8KYiJCLVL?=
 =?us-ascii?Q?zAfb7wlCCInSIGLWiyRsYnuIjRsmyPU/4vjqGdmT8bAoVX7XG/3UIu4DHELa?=
 =?us-ascii?Q?GvjlF73i53PDervlgCoG6yJEV2nFU+BgH6enuQuu3mE0XG9sjhMG4P3Q3uMJ?=
 =?us-ascii?Q?wbUS6DGf3l6B6/RRxxn3rcOixL2ryKeLGOnZvbd06w128efYRY6va4ZNwwwy?=
 =?us-ascii?Q?J3jwmFjnr1cfEiQSyUkc3kXgiTte4Oz0wcOZeDrxK3ODKpCJJYvGolu6/LPy?=
 =?us-ascii?Q?zvrIzOSK/nkjSXy191XLAKtOrKNYg+3lyFvpWoxeHCbunmp/M+G3AYyt/7nQ?=
 =?us-ascii?Q?cVswGbkYdJxEniERdgwJEtkapOEWbO/WKLP9ELw5wBkXc295hSqHXDk3yj8O?=
 =?us-ascii?Q?H9xScKQKerFvuNx1RGe0504b9nOqPxafOZsWmmEciO6tG+iOQukrfU2/FWy9?=
 =?us-ascii?Q?554DbBwhXRZkW6PSR8NVrlU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25690158-0760-482c-a119-08dd56bb5635
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:14:36.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaLMX+y8V7RF8aTeJ4zlNwSEa7BZHC5YAVUusiB9wLiYp5c0cze1vDKkv48r7bZ0G/7YXwtn4z87VhSQ+ufaVSFgZO9ZwnYLncrMv9Dduie9sbsDQJkVPIXc6ehKkd1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15051


Hi Mark

> > asoc/for-6.15 branch includes my patch (419d1918105e) which uses __free(),
> > but because of it, it has of_node_put() count underrun issue.
> > [1/3] will solve it.
> 
> That's actually in Linus' tree isn't it?

Oops, yes, indeed.

[1/3] is needed to linus/master
[2/3] is just cleaup, can be asoc/for-6.15 ?

I will repost [1/3][2/3] as v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
