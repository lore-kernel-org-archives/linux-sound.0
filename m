Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA149223322
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979541; cv=fail; b=YMxsIJnbdnCTOX+DWu7yK1Vdvtan8bUjUHAgO/RdGyhqmM6HM1QOgpmjwHvK3ouZ+1yrd9ko7lEXl2N4eOsEJorbYCbSwidDt6Px2ZwbFJ5alH9M7GVVREHf1uaSbB32kq5aScZilMoH5Mfe/aUELNuo+6t2rWTtp1GwJDp6dQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979541; c=relaxed/simple;
	bh=tB7OIlRHMAzZKUapCRfAw7Z78fcsnXKEUuoPzG43I2M=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZCUU/QcQpthAnnb7nLmiu32ZtVjIHm0paJe6/xzpolm9X0kYxGnuhrlrYo9/qUSXHrutsbBAD98zp8zVewJse552LnWBp6aBD9YlJNyIqqtJ8BQraErrhO/Y/S1JjgLHcMiGoKaP2Go8nWPM/BiUbcW0RnHuGomGF4w7NsVLfCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gJDe8JR5; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gJDe8JR5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZoGO7yMpqwQqYTmjStXh4bpmhr5+kKvy4YGDb3hCtrCt2ECBL2+rzvQmOlV43Eue9V9RNvKq3gst9uY9pSdpG9peMGtXudrhXHWR7lBWaTLESOZl8aKkWarwgBBKktABZXtIXSB+ufg7o7Qwl9pnOMkHP49TdhDluVUvAnKsu32cUI29Yuk5eZILb86UeWDfB4ZYPLIW55OqlAWBrBLjimWLlzvu8KFJAVw1icMttTJSVyc8KF8sICLKlqcjA/yWbEyUrdmTkdvIJqOdze88JzSn9uCxoeUMmwxd4xRbhCcQfskCpVf27hB/IMoI/8oxzXHRr16cbm75l3/vxRtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kQrlRzOyvcGrlOF90SK/hHVQHJhxPC+h/Jr9jTp7js=;
 b=bSX9CUZ5JpvId50Q2Tq6hmwCMZAhEq1ONa9f0vunykYyQc56BpLWpO7DGXqP6e1VsNIY+RRV5JF+SAa56TIbSSh5FaIZ0qNHDChWmdaSJEo/EWs0YZn4to+sZzqQKwypYykcgPFDyEZuTZNDjnvxSQqskaQcbupEtP8whp0LqvxFuM5+XHBbgp2CAskYuLdcTWSmnybLnfS0AFvbMV72W1fNOsYX4A/aCviwRP+C2zgiOTPtL7ZC/OUlA3UIEJHZ13kfMrUwoG8jkhYSonniGhqhiWcBx1MxJ5E8YNJKNxxWUrH15eYyDvcr1fWOGMI6+PSlMlIGV/5qruvmFxfKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kQrlRzOyvcGrlOF90SK/hHVQHJhxPC+h/Jr9jTp7js=;
 b=gJDe8JR5yhLD5EZVVQH83pTVN5NYoIJ5KhFtl035jEGZzT37tUePeVElBiaKSDXg8/mz0d0z4qUw0B4i7wx3JQwSRXNv8QT+Z4GNGT+gpKzwWP0G1+DoU0ACYs4ek9JFounSB+ls0QaZD0uMTpnlF25GLRMu0M4bH2Qj/8Nbrh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12289.jpnprd01.prod.outlook.com
 (2603:1096:405:f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 23:12:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 23:12:14 +0000
Message-ID: <87cyaqgks2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/11] ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() from unneeded function
In-Reply-To: <aF02URW2uIYiOMNU@finisterre.sirena.org.uk>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
	<87v7oj1caj.wl-kuninori.morimoto.gx@renesas.com>
	<aF02URW2uIYiOMNU@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 23:12:14 +0000
X-ClientProxiedBy: TYAPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:404::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2205c978-38dd-4177-8edd-08ddb506e319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zv0j4uhDWeaDYPJnDBssIx2jUAfmUB9MwFjg5NEy3RdwR59IcL4jjwRw8B6x?=
 =?us-ascii?Q?9m8GM8iudMA1z6Rl68OTT+CWnancpZnvdjwyDxygbZl76HdLZUYA4vDOPKbO?=
 =?us-ascii?Q?QNd7N4o1vqQFlWAUCP+NSU53RHUbDCvuopccVOGpVysgyOcrxVXS5zM0Gkyu?=
 =?us-ascii?Q?pVse6Dpb40abnLhZHKlFEfAVBURsPcoyGGcdg7PR9kSkmoa8krscKd7S6rx5?=
 =?us-ascii?Q?PL+g8I1tsjIv7Os+vz1NpX2xDRDxGT1rCgtoQDpyKXz5rF1ApiwVTk73n/j+?=
 =?us-ascii?Q?W93aPXgSFRQQhsrtt0xlsDd1eNU6s/8Z0TdZC1BWrH5hCvEIZnUFd3zlLTJ4?=
 =?us-ascii?Q?jq7BN+HCh9bnjY9CjRZihqyp9h5WvH4TGkauH3GC0OmBH+c1oYgbItbR2Ow/?=
 =?us-ascii?Q?oztVYXLZv9huwyg4JR73NVkWswwfsaxTUwGAU2gPxbxteXf/bZ9wS4shFWGD?=
 =?us-ascii?Q?KlLbDZmFN4R2NTJhp2dQs3kXGDNPvtdoUGMm128VSKEot45/szlSf7Myopz5?=
 =?us-ascii?Q?ZGsxgEMaZQJrwpbZOY/iMgVwTdR5nZ7spuCLCaSEt4+6+revjT3OmoBVM3RY?=
 =?us-ascii?Q?XrtZzpNPW3QVLHrFWGc0sFhdc+jvOcN3cUzDOtah4pWXNjPSJ+1s2jpMC7zH?=
 =?us-ascii?Q?SFpfuLKXuUgvomFtPxrpHMKmI5zqwl/gnOxfwRDXQCvml/MufgoLbggJ+uBL?=
 =?us-ascii?Q?uxt4/37kNvzWVQzbNHVZVyY58IbPK3kdRdoXXHXJNLX1xsdJrqW4jLDXk1Cd?=
 =?us-ascii?Q?zmdR2+fbQPnAy1+frQGvnVlYtFNADMljfvtnf1oC/AEGQScTidFTMilQawvG?=
 =?us-ascii?Q?X9SflDXuYTpCo2C8eXyDuZX/nfWp+EudKRGCI7XsXVxgKqkVARlJqLJ6mJsY?=
 =?us-ascii?Q?H5XIx1Ukjf9nKjedu1LMRYTRYFvw0ZJl0lcfbi5tQOrII/6fFqJdWQ8evuV2?=
 =?us-ascii?Q?hZfLe0trypI6aEzO65kv+W19WX50G7RnOLLE5VNJJTtF9BMJu+pCtRkV8TAa?=
 =?us-ascii?Q?DfZagZvKf6IWIN+hNLiynmkfxJQokXM5J2AclJ9j4cfBsWYl1SgxwX4xzu5I?=
 =?us-ascii?Q?sG/fndd0KbI+f+pIVpMWH5t8RsJlE5XRkglNFr7CyhMcL2WgkGrRl06ddOkM?=
 =?us-ascii?Q?RvnHByueLT0L08T1JfzuWPcxFhx8UfqjLS51zod0w+x8PPweZcnsZ1MsgdTN?=
 =?us-ascii?Q?NoETX7L6kkiVoyIk/8BEMppdhMRwAvh0mNuYRhMFp3yrUYKuMgd9sK1fTIwM?=
 =?us-ascii?Q?g6cs9Ck5gnijHC941WHeNNPNoGvDaTQgWbsWe1wW0SUyoMRiitamqvezks8l?=
 =?us-ascii?Q?F/bROEi+l1HkBWfk7XrQOqRlx/xYXWybcw9ALtUsIDVznqn2CsU7v06IhKPJ?=
 =?us-ascii?Q?P8G7vnE92y6r1IBozEDC3cJSjpBOSqPr8g/h2Hg6ZLAY6AVyVpDMRLWKUtz1?=
 =?us-ascii?Q?uXV76djC66+aYLR4zyLdIHSG0bqZHJpa4KV9rMTI3REEvthRhuFVzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqLC9BqeuaTXee5vp4iDhOHkQ6ztKG7UzQ9tKm5QCm7Jh43j4HhXm859txAs?=
 =?us-ascii?Q?/FXSFxlT+fVJaDDx96SO+VfJWqtWipbOYfUpxV6/HYwLmWuU4gBnUJP8YKpR?=
 =?us-ascii?Q?rkULfM8lRvZMxZgL0SpMXBcWNTAQuUYFqZktoOFhgWTbGjyfe2/oDcV4ylAQ?=
 =?us-ascii?Q?89jUDKUEZzmQxLYwIX9PfRezv3MXkjZ7okp4gjj0sat2ed2DXrcyS0Er6lIp?=
 =?us-ascii?Q?6c7ADD93lRIfYF8c+FjRiezldXEpWPrUeWtITOLpP817nk747Noou15/TGO0?=
 =?us-ascii?Q?se6/Xv7CjEaCVMcoTCLT9guUzofVtjQx1g0zNPqwybeZl1WRMenB+hTI9M98?=
 =?us-ascii?Q?e7s5ppBr/vv1KgBhxB3Nfg6O7hor4ORoCD07wU9XAG34vrhcIAfVm0/KoE4o?=
 =?us-ascii?Q?KdU4cEmIJT9iuXPp02y4OEcYj+kTdZQ8e+uv5rxK02ve55LiJSWRf3Gncq9V?=
 =?us-ascii?Q?oaQ1FEQDG9LkRZBxAa9KUDVzArDVFpRveH6b8vW1LkSYW0O1Q7j8jxztcQLD?=
 =?us-ascii?Q?Swl5MY47yleLVhnFXmUZfeb3B5ipcfwjCCW62lbQQlrd6RsYwXiVb23MEEFI?=
 =?us-ascii?Q?Pmh+J2SsRMd6QC2XMsBB05dTAMTLR8FI8C2scYnJy41tlyfQk4/l/FCpk3qL?=
 =?us-ascii?Q?3ZEkx7VvMkeNN9D0LS4o9rFh0ZPtszx6Z3T0iLdYU3HY4GenZHFKcSU6JyYk?=
 =?us-ascii?Q?zeElTTCoqs8j0G549kTzEb9Xt1uOoGyn7Jmyi5kC6WlpcoxqSvc/F7omL3B3?=
 =?us-ascii?Q?yVfMfrWVzc3mKcaGe+u9OuZ/KEm3aCNrm1+Cr21vAQA18CP5XMylA4uJoQl6?=
 =?us-ascii?Q?FGpRWH+XJzEQpehzHvryVZjHb+oE3qAWJABi3B5GPqE2H+G7EQRMnagoPI8L?=
 =?us-ascii?Q?hn2ZHbx+u8v169fZxCfds543lYo+gZFajlLqtGZlBypDn/9Qe1RA1Lcoq55R?=
 =?us-ascii?Q?IsbfYDJjUcnTLTMALeWna8gvtF7jQDGSUc9e/jnAD/QfEKuqFClHOB90JVLJ?=
 =?us-ascii?Q?LN//fyqHOJFFmkqtPmSM8J4t+O/6MKPtxCYvyhBLPlatMmcNd1b7W0q+ghvT?=
 =?us-ascii?Q?9JW/N38zH8R6JUiX28aZtnjVP857j0Elz6h9JUD4LZoO0Us/BUX8u2oflS3h?=
 =?us-ascii?Q?9bRy+X2kdrA6jLzoIugcup3/YoAO4yG2Xa2dg7YCb5LAnHl+Q2FduBnrP9zt?=
 =?us-ascii?Q?WAWuJGV5eiJtpS9b070ZVdoyaNmEr1fBqY7hxeWecybPWVLBq2sJRj5823ph?=
 =?us-ascii?Q?PNn8assoDbkt7N/BnplQFFnVzjI4FGiSjbPVmqf6WEbtGfD/yXjzYGPy4I9Q?=
 =?us-ascii?Q?94+6KctGzPK4CsVuZ+SGlQ7oOiiOIMNVWD0Jlzyhp6Gu6PnoHGrWagwtHiD5?=
 =?us-ascii?Q?p2nCGHs99lRvEQ4smeRQsW9vX8bOxC9Ik8MVh4R+raByYpOLN1EUJw3XqGVw?=
 =?us-ascii?Q?LtVffNiPfLdhr1/UcxRP4Au/VpPHI396Yxh4t9rxsgolvRNHUAK5xyjb3Ux7?=
 =?us-ascii?Q?BokA1HH1eJTs+IWbeKckMU26R3am8UXNko31BS0wsj7lXGNVlfPrySc7aoIu?=
 =?us-ascii?Q?uP2Ykz4ld8PcAQ5ArzRvFaCdjmA5woSBxY1/L26NWy9wHdfjVDuYGoQXPDVx?=
 =?us-ascii?Q?EoNsWLCPcLOO9UhuyONYa44=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2205c978-38dd-4177-8edd-08ddb506e319
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 23:12:14.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K60t16B2SEXjkegaFzHJ3YCGpcqBK7VUyCDAKD3woIBPP7q4tF46GjieAMwPTfVmkp+6gwBY/fOLoGt9OroKMqMzxjI+MlMYylRYZY97K6FMM3nDn21ehIBQKefYD56t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12289


Hi Mark

> > 	snd_soc_dapm_new_control()
> > 	snd_soc_dapm_free()
> 
> For _new_control() while we don't have any current users it's not
> something that obviously shouldn't be called, people do regularly call
> _new_controls() and that's really just a helper for cases where you're
> adding more than one.  The export isn't really doing any harm.

OK, thank for clearfy it.

v2 will cares _free() only.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
