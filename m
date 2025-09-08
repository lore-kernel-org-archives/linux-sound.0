Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A519D8A8
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 02:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757297429; cv=fail; b=jU8KwPgQ9Vc6KTXtC3WBoX5I2EZC5/oknpt6TJGDjm7XyiTcdbrmjMS0eJ0IgUU5UTPs8Dj87N7EVqCHVf6r4tgxfKbZrkTUfwTHyN406Zr6Cy7+m5TnrnfPfJMRAF2d3fPXyhsP/n1mDkQZMQQsLtTMC4UIgPXG3VzyUYOtRNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757297429; c=relaxed/simple;
	bh=E0EjjChn36HGRpDgGw2Y91LYp0gcQsy76idiECRPKzA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SXeK+Kf0x4whu6ZKFsA5CDXZ3R43Cf8x3QuFaOMbsdNxDHcLkhshgFWJK2up4eVP7PefKBaLS1Kl38+61xZ0fLZqRcqzxLIskbAFF6FYLx9u4u9sOg2ybz1lunz9qollviWDCTrIJIE2/sbLIcFGvQvw1SHaVoT1A0MdpdobqfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dyzpNiXj; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dyzpNiXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCcsWFWkEJB8/N2pZwDy3YKvnEgVEraKVapnquy+GkBNo/Rm8uVre5BreJiSeLlGodcZyXZ0UObzN7a8cSPmmiLK9wbvwcIaBX0IETROIPDHOlCrt6GA6RGAshteU9DGc+HLhVi8KlFKSjsirvcm+p/SuO+v2bKTTqZR88vM4In6H6YRFgDnE/oUMkkMPFW//qEzXTA4j53ZOpoyKeX9blWb1oePB83OuqbpXThbtPVMcvM30KYE9IccilTGKUlMq5YdQnlGxE+d0O3Op+cHTra8879SdguqcNc5QZfTZqL5ql3B1yPInBQ6bowjuCsw4SjzeEtAmSYkSwo7+gD/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYtDl6kl70ZFoD/UIxAgK4g7rcoB51+aG/2eYWNreuY=;
 b=XkbkhLxCe8hy0w9e4nA8tiYG0YHbcxDCaWmjoTVIT4yoEdApdEc8eAgaiNmS9Kv4x+ZOEqQldNceQltZjUUEzuzQNqZmaJUwX6XAz0lHSEJdJZdL5o5cUDnkFopFZqoexNR5HmlxPKyr9DTcUxHQ6Wi74Tct71DCZXR2i9X1i0w5pGBbTsMHDCeDtozXXK6qnKvLRBrffepOJoqso3Pxy6MABf7nkz9rfc92ojvHuLQSQ7lbpNmV03mQnjYCSRRsP72mtPhV8GmqAsdtD1vvnYPE7W+Q/OURZoK9TyVQ524A8F/joF+5hNVQbsjHltUeo6HoUF4BWbgI0L9RxiQ88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYtDl6kl70ZFoD/UIxAgK4g7rcoB51+aG/2eYWNreuY=;
 b=dyzpNiXjtTsfvBmy/0nED247semOstjDWjq9dukWGzEZx6vtBWeD3ez2TZz2hAmKHWXGIfgN4xNxCKtbGn9GV4liokvGXaSs7dDtDY8BeM1VHa4HzITxTMM8UtIWhzXbCzKGacMIWSrAGcyMC2jV5o3bJfOWqd/TT3O0c8vtC9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9666.jpnprd01.prod.outlook.com
 (2603:1096:400:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:10:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:10:25 +0000
Message-ID: <87h5xd1ypa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: renesas: fsi: Use guard() for spin locks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:10:25 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: c93ce9a4-8c5a-4eca-8027-08ddee7cdfd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kkj8cAYKty1CyH+sGhuQwF+w8aYOIdrx0QT0hKth9RMNd3XFUrMVyVu6Is6d?=
 =?us-ascii?Q?t7vXuAdUthdGcbBPzonNSZPtY2V2+MQBRgz8AhDwh0lhN6Nf7zIJuBso/taM?=
 =?us-ascii?Q?Z7ZZDS8ed5apdE4h9+gEXljNQNPKiot5gwlOYR6+iDoiW5kZXMrAIKvEqnzn?=
 =?us-ascii?Q?f7KZOuf1UxIHOK7yhYb6hocm3/2LMwmEGcLtp0CTr18nXPgWm3tMX8Lcpvux?=
 =?us-ascii?Q?X6ZyihGJ7kVfKPJ2H2HYtXkUS4Paewm7S8Et2h652BvrOmr33Q1fXJs3mKJ6?=
 =?us-ascii?Q?+a23L2N6NhmJrbH8CuCLAdC4a+BrVK1/FfZHQ++BjIZJAunep3c45uMPIAqo?=
 =?us-ascii?Q?M5mKF3Nk2YKHuRdLcnjw4YNONIOF9rUedcohPCDmAArM9P0kiknPCO2CMVhs?=
 =?us-ascii?Q?Sz7GWCQmB0pkUUGIAOACBKHyyE2p8ffvcyFtCe1lXydVfjUPF5mca7CnPheb?=
 =?us-ascii?Q?TAQ6uOmptSUE3hpypDGdiSA01ne6Wt9030ZapFinlqYuwPX+tLijrat0vqiL?=
 =?us-ascii?Q?vJmdbgswCtCbNiyXCiA7L0d00jp0z0r2f86+VvH98sD5/9euWgnEsYXpihHU?=
 =?us-ascii?Q?wsZSnUS/pOFhWoLm3Pt3f/rd3r1hX3APJvLsaR0okE3BiYhXjtvVdX7Kt/iG?=
 =?us-ascii?Q?hDftvfU/CkwBOp0pHd80GPOWSv4E4TBjyEZc6bddr1XNooQZ/NiYChARdvNK?=
 =?us-ascii?Q?gBLTQLKpcEvUI+Ww5+ZmzQWcI2QBoI6UlnztpACCdD7Xjm11HaU2Xuq2oX73?=
 =?us-ascii?Q?Oxl7bArjimQoYhPJgDe2UnUqfUqPZ2fJJKHEnvtLnsJb9McLULrzz+MTp4NB?=
 =?us-ascii?Q?eh17o9RYd42fFtCG97GVndULbULVeTwUVT8cATbN+wBMWORdpHkV9w6S1o2M?=
 =?us-ascii?Q?/l4bCr1OCjN5P77P78A9zhbz/aj9cndBLk/XKQI3+ep21fiI9tJXg7Oohfy2?=
 =?us-ascii?Q?Xi6vi64+Fx4o6aRmpTdsC9XsAwr79DGkHUb/RSL2i4vSVc5g2UMa/XvPWx3X?=
 =?us-ascii?Q?P5n88NSWX4Ba0RW6W/B63dVpxy4UuEcB6AWBU2EjkzrWKu9CQr8esPu7vPSs?=
 =?us-ascii?Q?4aiE2sdIf8zqCvyBy7iQ7j8AxDg0T8PZPqekzopPMH8H1c+qJYmK//by9aJr?=
 =?us-ascii?Q?5iZMfOIc2milubT/x8Z2bfibmH1UOlvSykpn0ajKyt6WmqwUPjt+EHegrl48?=
 =?us-ascii?Q?aab2UIRqlhHd60E3cSDMBoCbhh5fqNUzk5zJHRoj4ph5Bjb50DC5ZFeFQyom?=
 =?us-ascii?Q?IsOJIBPgl5A5qx9g/D9YH0cbFJo8UMS1Js5xjjDRXNPXgbzme7vjESy0yJh8?=
 =?us-ascii?Q?VK9oKE6YJm7wCZrTQIhBjNxkNPZxNU9e67uTjdgfFvq0JfwYFZkFj+U604J/?=
 =?us-ascii?Q?NHfKQiuEsE+IUM1pbzEAv8szsdLnOTa6FYkU6wWoSP6saSWfdNlVeHePmbdK?=
 =?us-ascii?Q?dvX9dZJxPe3N2jP4686yjF44Zzz8Du6gMqaOLAYJObWYFqWMFaTiWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1bLJP3PinESzkifmXI+AK3+9pCm12FPdHoyUcgT09Ee8+DiJ1RrDD9gabPNi?=
 =?us-ascii?Q?5I2vBTnGrTgWR4ryHqyINjX4PasiOLZJxWBt6aajc4XvQ0MiZbgWbkLd8xRL?=
 =?us-ascii?Q?6k2ktTxV28XIEaXjIBc5SZbiSrE3LYs7TxRMlRk/OKTSzBxB2wrLSBwMEEJL?=
 =?us-ascii?Q?P3DIp/dN9jNPgrmCVIrI0NEhqdk3+/lLnoRyHFQVz7Z72vZbjbdj9m9Jwin0?=
 =?us-ascii?Q?Z6wre+c83xVvTYmxvkPSSYZJ2GqvgTE9vUhLG5+IgHdftYTOS9n5YOjZy6Us?=
 =?us-ascii?Q?4vPh8OTlK8XMBu+yYDy62cVUt4kLrgbgo/TJt/SjvT5QmlQD05Mh7N4RYq4m?=
 =?us-ascii?Q?Brht5SteLXCFeuYXqTwZeC/JTzgTcPc9ligMcmGL25Y4+haArCGFD1hTbJrY?=
 =?us-ascii?Q?AeN5YsWCjc64U5asiIFuGAIkbsRemu499vLkyuypTXVfUm1Hxu7zwh8Vfb86?=
 =?us-ascii?Q?MDCMDJQKS+ZY+sBGbjImE9Ct3BcARJp63a/54l4PpIAMUGQSsIcZUL3WxB45?=
 =?us-ascii?Q?4dtcj/aLSF8GpN43KOugaeIsosN+sLNWwvqH5A90z83MFcJyoZc//Vj0uf/C?=
 =?us-ascii?Q?0/KexUvjFLHwSvaSWWuo09v6W0ttgPhwY5vyvEKmuvo4hcQFeHZcuk9LG+YU?=
 =?us-ascii?Q?b/bFXpYGbwS9CRk6MSZM1YmfCMcoNV47as6WbPBu82ptMsvxj2nYcfBHkQfz?=
 =?us-ascii?Q?OBfBahe5ZAyIN6IaDg96EYTCqINz2Pys/0G5loEXxOCRdZApgIX5Rvp9GvY6?=
 =?us-ascii?Q?nvHoL4geFyvsvoPwmMqwJlwWurMOnIL2yn0gnJx1kvMJ8kgzwMdOEA485Y3y?=
 =?us-ascii?Q?K4ILZbdXVkLMJGiE8kLsjNkmi9/M18sjPBGzejru3SCAlCrfOmZ17rBVpS2k?=
 =?us-ascii?Q?6wNt1nnNe+DDtbuFsVdnjtgd8bWS+5ZP8QBZSeuauQ2WoEAyZB2HPyl19n9x?=
 =?us-ascii?Q?xHBYnFV9DzAGFz9or4DsFEzpRB6ozgSHQhmX8ySAhk5AKi/DvVErFswZOU2N?=
 =?us-ascii?Q?a6eik74rpv56Cv0zt78Od59t1qGLtuHLGrM5Iw/tzp4UnCee1te7DbFjLlba?=
 =?us-ascii?Q?+bTKmLCyUArWhkcmzOmcI+GiLrJkLY0uCt9sd0hcYenhFh4a2Q/49p0+SM31?=
 =?us-ascii?Q?FSsZID/YzIWX+3XoJeXC8NXBRQ19arY22KXf+h+plyaG4KY7n6whdLE+hAcR?=
 =?us-ascii?Q?OG9AqTr41bYpz3IxgTMT5MjvQqiRO46YOKtfeIWGNOq5cqlTH3fY5fqH0U6O?=
 =?us-ascii?Q?8ga+uSZk23i+S2blWQFjqwPTBQUp6Zi8QtF+xpvU/6ZOCoC9cEi0TNAh1OX3?=
 =?us-ascii?Q?KoofYW+tSQEugldh3Opbs7zYtliQ7osR6moTsyKJlGdf6G0QbMtEoJD/d7gP?=
 =?us-ascii?Q?XM75kmYUHNggwM08XxyVRrOALw1dOgN08w2LJJ07x5J+pPVq+G60FOS+SHkD?=
 =?us-ascii?Q?rZuqSx6GQZeLXvY3FFqjxbnwcoYphqEKym8mWqWbVXkrwTNR+YGXM3RLZlOA?=
 =?us-ascii?Q?zlHAs9P7g53+8rDzUzA1zKCTuhNRKIHfOclrfd4m44GScgzr3rb0UoQ4m1ZR?=
 =?us-ascii?Q?NgnPhqfZbPWnTzK34cm01gjdeoCNaCoYsRi44hLxPAMpJakbci8/8IpmKe3i?=
 =?us-ascii?Q?clXAWCEfH9dsN8BxtjkCIAA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93ce9a4-8c5a-4eca-8027-08ddee7cdfd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:10:25.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OY7sBzrH+I7tZl4vTFcuNtqTSVjP/3ormuo0nbnsx7oyLvjTc8wfGYFd1s7u3qeJp85prHvzRwDWSvvROdWmqLzEvN+/SWC5EhwKusMd/Pdq3slSsbEufk4rBKJXUvvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9666

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/fsi.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 221ce91f1950..630c2f52e1cf 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -343,14 +343,9 @@ static void __fsi_reg_mask_set(u32 __iomem *reg, u32 mask, u32 data)
 #define fsi_core_read(p, r)   _fsi_master_read(p, p->core->r)
 static u32 _fsi_master_read(struct fsi_master *master, u32 reg)
 {
-	u32 ret;
-	unsigned long flags;
+	guard(spinlock_irqsave)(&master->lock);
 
-	spin_lock_irqsave(&master->lock, flags);
-	ret = __fsi_reg_read(master->base + reg);
-	spin_unlock_irqrestore(&master->lock, flags);
-
-	return ret;
+	return __fsi_reg_read(master->base + reg);
 }
 
 #define fsi_master_mask_set(p, r, m, d) _fsi_master_mask_set(p, MST_##r, m, d)
@@ -358,11 +353,9 @@ static u32 _fsi_master_read(struct fsi_master *master, u32 reg)
 static void _fsi_master_mask_set(struct fsi_master *master,
 			       u32 reg, u32 mask, u32 data)
 {
-	unsigned long flags;
+	guard(spinlock_irqsave)(&master->lock);
 
-	spin_lock_irqsave(&master->lock, flags);
 	__fsi_reg_mask_set(master->base + reg, mask, data);
-	spin_unlock_irqrestore(&master->lock, flags);
 }
 
 /*
@@ -499,14 +492,10 @@ static int fsi_stream_is_working(struct fsi_priv *fsi,
 				 struct fsi_stream *io)
 {
 	struct fsi_master *master = fsi_get_master(fsi);
-	unsigned long flags;
-	int ret;
 
-	spin_lock_irqsave(&master->lock, flags);
-	ret = !!(io->substream && io->substream->runtime);
-	spin_unlock_irqrestore(&master->lock, flags);
+	guard(spinlock_irqsave)(&master->lock);
 
-	return ret;
+	return !!(io->substream && io->substream->runtime);
 }
 
 static struct fsi_priv *fsi_stream_to_priv(struct fsi_stream *io)
@@ -520,9 +509,9 @@ static void fsi_stream_init(struct fsi_priv *fsi,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsi_master *master = fsi_get_master(fsi);
-	unsigned long flags;
 
-	spin_lock_irqsave(&master->lock, flags);
+	guard(spinlock_irqsave)(&master->lock);
+
 	io->substream	= substream;
 	io->buff_sample_capa	= fsi_frame2sample(fsi, runtime->buffer_size);
 	io->buff_sample_pos	= 0;
@@ -533,16 +522,14 @@ static void fsi_stream_init(struct fsi_priv *fsi,
 	io->oerr_num	= -1; /* ignore 1st err */
 	io->uerr_num	= -1; /* ignore 1st err */
 	fsi_stream_handler_call(io, init, fsi, io);
-	spin_unlock_irqrestore(&master->lock, flags);
 }
 
 static void fsi_stream_quit(struct fsi_priv *fsi, struct fsi_stream *io)
 {
 	struct snd_soc_dai *dai = fsi_get_dai(io->substream);
 	struct fsi_master *master = fsi_get_master(fsi);
-	unsigned long flags;
 
-	spin_lock_irqsave(&master->lock, flags);
+	guard(spinlock_irqsave)(&master->lock);
 
 	if (io->oerr_num > 0)
 		dev_err(dai->dev, "over_run = %d\n", io->oerr_num);
@@ -560,7 +547,6 @@ static void fsi_stream_quit(struct fsi_priv *fsi, struct fsi_stream *io)
 	io->bus_option		= 0;
 	io->oerr_num	= 0;
 	io->uerr_num	= 0;
-	spin_unlock_irqrestore(&master->lock, flags);
 }
 
 static int fsi_stream_transfer(struct fsi_stream *io)
-- 
2.43.0

