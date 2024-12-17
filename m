Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720041C687
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400123; cv=fail; b=hpaQf3WCc5G4kHl8qiL9B90vBi+EYue+nS8o+zoM0VJM0VGTGkR+SjuMF6bqEGLZ8QHxK0PUJ0A8B4GRDJu3Z20xpgQZpGvZn/RFZGwGiuBZkgeMtyPcorG1y3mjyy1htCQ48u9q4Ul2E7ykVSlKbM3v20g8Xf9ldj5Da3ldILA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400123; c=relaxed/simple;
	bh=dFfg5Ae/MoPJH2Ejeb8Iihqmn9ztw02wCYKV3a6BO08=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cXVT/IfzZ8GbZdiwQQNJNjsetZyQdx+IqdnYKEMsD5AvtOG2hBsrpbuyTC1LmjZIfsp5ajEwJcfqO07VZpWevCQW2FRBVBcfzBy5nnXrd9aCbrOaAWOkZN96wFtdBHPWH6HVCJVc0RuVo/4y3x6X/8i0nFLtbvuPeb2l2jzGPRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FW5gL+Gd; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FW5gL+Gd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ2bMC+cA5zoQP4TGIJhNX+pufg9Z6OtD3LpQyEl/KkbOBxzAzCapeoxHuVIdXvBetUpInJXjjZ3pOqtsLiat9MGIRBzJk6sGhB8syVQwyPRRhYDayoTLNzQallY3tcImMU7bU4zJ1CS8kdHLK44SvrZR/x9eQrcbWAbf+0PsVmzFdrnNp7lxKKViDmwxKqKDWzqE2SgCezT3+0R4zYi6ceEK11I0oSI1mYCGGB9z+jL4xP3Z0SL4GYSKacsZzHeEFOPa8SGXvrxqlpYsy4FY16roITxFyaClmzVPv/iBsWT5jzr4ZPzN57szdy+YXvaQWiWwPGpc1ZVpxLtV9O//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=unZ4V8MK/mUNmMvVaiL1mXk0nWlWTnn+KzC+glQvHx3mJGcZiPfMX6WjMfc3vGvQrxCYXU6alQhQ1QscvhcKCRAQX0pD77b4u8negqzrfbGsyudowUrHhqc42molNO0PoOuF1TWsBKyoGDem+jI4/0xtRtJ1iIfx/a5H27Ij3P8VFWJZaAhkkRVw8ebKCMZB7aNqEVoatzU1BBWIHCnbUZ+O+fQs51SG2hUR0JkncBjMXD4GopIKadxTBi4Q7oZr32PgDbLrT4jMwGl9olzxLxtgryqer/iN5G7FQilv6r+DLwNZhjWPFVKc+o4x3T1MHyvJtO0ha/JwjdYe9d0WJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=FW5gL+GdKiIaWLQyBhVEScDf40U7aE6nyosQlyzJCOv4+HQfUkQukzT79p5bqTj7p91ujLgMBYHbTMJ67XoVFDQsR1veInmb6olEi4+LWY0Gu+GJjeRloHBwZKqBuR0u4W3fU0DAxXYXbtckJ6X1MGNVaNuLEgLff2sB1GFtJIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:48:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:48:39 +0000
Message-ID: <87y10fm64o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: simple-card: use __free(device_node) for device node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:48:39 +0000
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc0aca1-ee98-4d94-766c-08dd1e3cedf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ueia7w28D0NFdlmbkaAm3EaIrbWvgqgM+E/CIjAwRHChmfXaF1dhmy2u2Vfm?=
 =?us-ascii?Q?oSeK8CBgIDfJqmSjUo7y2d8ufReoYY2v8bCHuXOmacApPO4k7xTVFhNBxm6t?=
 =?us-ascii?Q?VL+4GuVhLzuy9dg5LmbCIaQeT3t8gHb7mdQoot8Dfx8R99mN95xDUK6XOYLe?=
 =?us-ascii?Q?eDlt8h0bjaZrPb32DoeXv6nZNDgAIZsWSAkERYPb8AJoNSI1Ag2p+x/Lg53v?=
 =?us-ascii?Q?Vca1Zzh+4k3S7rXY63/o8KkjF4kuJ2ckf8qOdsm336tOjKdgRgHDWR9sX/MB?=
 =?us-ascii?Q?8Vc4z11EaMZy9+9lQPNmyxqFBMFnhJWdV9JVLMQtyCN575I49HXPxBlr6WJX?=
 =?us-ascii?Q?5OhAbIi1UTLMUNFdGfQQslV3yECODKSSo1I4c9agPRN3FA5m1ie1vfEADAKM?=
 =?us-ascii?Q?RcEWEPgEEN7zZHPdxpsUrfmeq0LikmNpUqqaD80WPwd+gyvzHGb0nAusexIs?=
 =?us-ascii?Q?4ccUqdVEFN6ohaNT3ExnIbxXcfvMQm1WOflIeIBIm0ySKfPZEpt/9slRik4D?=
 =?us-ascii?Q?f/IvoKu8Xj3qw4xrvmAZgxyhJhGBvl3D+xcbiHN5EoYA2qEMQQc2UhRxmFb0?=
 =?us-ascii?Q?5m3B7QLyfC6pE4HaoPWNBrJMHXK/y0RobXqHXuziJqUwI8uBhxCmIDiPQOJs?=
 =?us-ascii?Q?YTRmGq8qjrQVQAbgrqncEIcOQ2vfAOrGxQLvwvNf0gVg5JE7hjKzsnrlKEzI?=
 =?us-ascii?Q?nzrhBdYWz8erMIHfVWhZeEssow02qEdE0hcHsY9LkoWXEImduprbtCkFx3HK?=
 =?us-ascii?Q?GdI1/6OCrOGN5CJJJWguNLX68mZH4sq46LzTKOYUc03zMFVvk8Ev8cRihA9U?=
 =?us-ascii?Q?Z4Se4Psw7kAPsNmnuAnGsnYds/I1wPt7phA6iyDk1LjpJN9RAi1dsRkafUo7?=
 =?us-ascii?Q?ILnxlQHpG8qBjEm6ufT0k92XgQjxWxB6I7pPms96wLIM2CiyOT8ZloBs/2wT?=
 =?us-ascii?Q?WyhrDcfgDzqmBjFzEqhJGHxI6o6/h7GwiasVePHl9wu06LlhdPAAzMD0tE99?=
 =?us-ascii?Q?bELw4Qq1ZjGi4a7wRPV+LPCWE/qPTP5KFVo8NbOcKsHlY6kjwLnih6VOSsOT?=
 =?us-ascii?Q?5Bm9HGaFtyY5g6YevrhImxqHCn++L6Ep1vIqDQyUi5ydrLaWT19EyJiXl7g+?=
 =?us-ascii?Q?NLYPbAVcEJy77WhkpAF6GA5Gax/CzwTBI5hSNf8s+HPrwLlS2NV8tbHBAgoo?=
 =?us-ascii?Q?Jhl1ZOXLH5E0ivzuJnWVWG3RvqWjaIx6Gr2NTa+VDTOolZ7dbC6dRhodxogh?=
 =?us-ascii?Q?4ieKu0u+tDm1L8V7FPBy1TGLppuYLkntR/b4aSMK2JGZejeRZI2AIWRri7It?=
 =?us-ascii?Q?d+Js0GJGptLeMYY+iO/SCgoq5kcGOTDy00IzscbKMN/Z3HCIBDE+hCIfUFh0?=
 =?us-ascii?Q?vZ3X3ibx1hmD+Amfh4PAGRwCh1WIoqDKBlMUMGXrwD63B9VtsSy9DbeJg1ld?=
 =?us-ascii?Q?pjOq1TJobOpFNKwHknurSyzodTSoeJyT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gz1DHxaBVNogjZzRP3MsrRR+P8cKWzgPCLVP0hRnWhIBkRrSP0VxcsVf5Fa3?=
 =?us-ascii?Q?wjqXTj46ahtfkFrO0EUHwAJiqD/Jsj7liJ/1POXeqK2QP4oeODbp0aePXtiX?=
 =?us-ascii?Q?Bg1ihD6tLEhmzka/1u8IwEJD7vTjx0bxvZnHDYwhPuEfdJ1an2oD82QmeIgt?=
 =?us-ascii?Q?YXlRSGqlo903kjcfplBhcKJ1NgHWZFtAGo6GHcemV8LLJNHrcVckBN62lkVE?=
 =?us-ascii?Q?FIcRgqo6fsql/APLKZvcr3Hn8kZbmKZX5QsEMEqtDgrcwbvGrwViJfsIJpkz?=
 =?us-ascii?Q?kVSGb5U7j4SG10B+TxTpI0sUAStZ6FJEQUWX6tRCBM6RW8REkN3KeenCBpR0?=
 =?us-ascii?Q?pL0B22qlmJ3eI/A0olS0duTCUAgmRjwl4BPJ6TXQHq6Mbo09W3/yawgBQws/?=
 =?us-ascii?Q?06UOjw6+PWd5T4mO7REupgaUvgn767agGQR8EdPGvE8bfRHkldvPDL9WYHLL?=
 =?us-ascii?Q?vmuEavHFEiVcIIRGGLrfWgNYehCiP8wudOgt9Ft1Wf4LbFcoxX46eyFxRYbE?=
 =?us-ascii?Q?Ie4GTMC/XKeq1ATtQuhj7Dk2GMMJN63Ma7G5nkDE+G73/dNsL1bh19JK7iC0?=
 =?us-ascii?Q?W6q/NonqXf765hsVswWEg5+8tttr3N0czzClcpSy7qe421hM1jCubFURdYLF?=
 =?us-ascii?Q?aP+RREUo4HTaMKUwG0w8CfGrG2tai7CjCYxH/9zYoiHsHMa/371l8gf6vyni?=
 =?us-ascii?Q?vPn42BfoOsCJ/htFSz3ZRruesbJGfjTmMeUM/ntc02/CS3ESu+zTOhxXHap2?=
 =?us-ascii?Q?+I1wJ9TXEPlKetWVlTgT9IkIWAzmbTOg1WFvlocaW4IsJeVZ/p7gQv8LWyWD?=
 =?us-ascii?Q?AcwW/OWT8wy5xu4TAxUFPR/wFTdlbpVqK8tTaglfxqBCtBIyEttAk9RCE/9M?=
 =?us-ascii?Q?L153byKX31IYLhdRs4wO7Qd+/v8RE6KpJozveOrFtc8NM2day3GeaMQ/ac7V?=
 =?us-ascii?Q?8aF/b89ky7P0IaIfc37TqCNnT9Vr4pjBmZnBhwg8buZCMSu6R3zZk7QK0xdo?=
 =?us-ascii?Q?nmCp9u8/0AJvb7AqxT0S8rCCUp8hMMrgSor5KvwsXQonmXd7EWkt7h1aFv77?=
 =?us-ascii?Q?UrCdr4AzMUapzhpGYsThITX6yCK3kA2hbgiirCcIWX/RDoBp29EbOdFn7+jf?=
 =?us-ascii?Q?F+wwflbxYrK1Hj+jKx9+ORbuDuI5vxcBSx+eA2jwNp8GLUwg2rXkrmgZnT2+?=
 =?us-ascii?Q?eVtQfZ/m4QagWvnh0kpxb0v17ZUDjXamfzr9mDcQec13twBFBILD7s7AM6vG?=
 =?us-ascii?Q?M/1RdoddEw7lgTofSq6NvR41JB/ZKDyqzyTnoXfWpexp+ipbznPwQvI+RoXC?=
 =?us-ascii?Q?uKfd7aRVj7bHi2muS+G502yikFj2DvlM7CzvqrF6ROvjc7vGWhoEp0glu+KO?=
 =?us-ascii?Q?R4ip7SeeNC7WUjcvA137qm6G73k3cq0yfiyrWJQWH9CTSs9LnqhTtnKb25z7?=
 =?us-ascii?Q?RM38EphX6YlkRMu2R/oviTmJIWszA0KMcdQ0giztfoMRgs8MJZ6ZmQnNOVgM?=
 =?us-ascii?Q?rP1vqseywewPssFUfYlQq/jLoYCUhzDRyaw0tcT5dZWtO9X2pjwwgOLW4Ima?=
 =?us-ascii?Q?+XADXuak6oWx63nwGepFTyVfh0BTL2jxWHd/JroAV0MA1ufHa/ZIS82Mxyji?=
 =?us-ascii?Q?DP6xRUTwonL7KHhLa6E5hks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc0aca1-ee98-4d94-766c-08dd1e3cedf6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:48:39.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVvcV3rL4eD7AnO7obIggRgp7k6/qkznH0YSWw+fVJH0/oWvF0PaSS7b3Iy2dDQRn5RcfxOGxdoGUYoOAU8eYsgDIFFdp+0/qKhNbMiRuw0eIRWk/itLtGf4PJ+49fQ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

simple-card handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 58 ++++++++++-----------------------
 1 file changed, 17 insertions(+), 41 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 76a1d05e2ebec..afe7e79ffdbdb 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -120,14 +120,12 @@ static void simple_parse_convert(struct device *dev,
 				 struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
-	struct device_node *node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 
 	simple_util_parse_convert(top,  PREFIX, adata);
 	simple_util_parse_convert(node, PREFIX, adata);
 	simple_util_parse_convert(node, NULL,   adata);
 	simple_util_parse_convert(np,   NULL,   adata);
-
-	of_node_put(node);
 }
 
 static int simple_parse_node(struct simple_util_priv *priv,
@@ -176,7 +174,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct device_node *node = of_get_parent(cpu);
+	struct device_node *node __free(device_node) = of_get_parent(cpu);
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
@@ -185,7 +183,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
-		goto init_end;
+		return ret;
 
 	graph_util_parse_link_direction(top,	&playback_only, &capture_only);
 	graph_util_parse_link_direction(node,	&playback_only, &capture_only);
@@ -215,11 +213,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
-init_end:
-	of_node_put(node);
-
-	return ret;
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
 static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -232,7 +226,7 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *top = dev->of_node;
-	struct device_node *node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 	char *prefix = "";
 	char dai_name[64];
 	int ret;
@@ -296,7 +290,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 out_put_node:
 	li->link++;
 
-	of_node_put(node);
 	return ret;
 }
 
@@ -312,15 +305,13 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
 	struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 	struct device_node *cpu = NULL;
-	struct device_node *node = NULL;
-	struct device_node *plat = NULL;
 	char dai_name[64];
 	char prop[128];
 	char *prefix = "";
 	int ret, single_cpu = 0;
 
 	cpu  = np;
-	node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 
 	dev_dbg(dev, "link_of (%pOF)\n", node);
 
@@ -329,7 +320,7 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 		prefix = PREFIX;
 
 	snprintf(prop, sizeof(prop), "%splat", prefix);
-	plat = of_get_child_by_name(node, prop);
+	struct device_node *plat __free(device_node)  = of_get_child_by_name(node, prop);
 
 	ret = simple_parse_node(priv, cpu, li, prefix, &single_cpu);
 	if (ret < 0)
@@ -352,9 +343,6 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	ret = simple_link_init(priv, cpu, codec, li, prefix, dai_name);
 
 dai_link_of_err:
-	of_node_put(plat);
-	of_node_put(node);
-
 	li->link++;
 
 	return ret;
@@ -374,7 +362,6 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct device_node *node;
-	struct device_node *add_devs;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
@@ -386,14 +373,11 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 		is_top = 1;
 	}
 
-	add_devs = of_get_child_by_name(top, PREFIX "additional-devs");
+	struct device_node *add_devs __free(device_node) = of_get_child_by_name(top, PREFIX "additional-devs");
 
 	/* loop for all dai-link */
 	do {
 		struct simple_util_data adata;
-		struct device_node *codec;
-		struct device_node *plat;
-		struct device_node *np;
 		int num = of_get_child_count(node);
 
 		/* Skip additional-devs node */
@@ -403,26 +387,26 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 		}
 
 		/* get codec */
-		codec = of_get_child_by_name(node, is_top ?
-					     PREFIX "codec" : "codec");
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(node, is_top ? PREFIX "codec" : "codec");
 		if (!codec) {
 			ret = -ENODEV;
 			goto error;
 		}
 		/* get platform */
-		plat = of_get_child_by_name(node, is_top ?
-					    PREFIX "plat" : "plat");
+		struct device_node *plat __free(device_node) =
+			of_get_child_by_name(node, is_top ? PREFIX "plat" : "plat");
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (np == add_devs)
 				continue;
 			simple_parse_convert(dev, np, &adata);
 		}
 
 		/* loop for all CPU/Codec node */
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (plat == np || add_devs == np)
 				continue;
 			/*
@@ -452,22 +436,16 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 					ret = func_noml(priv, np, codec, li, is_top);
 			}
 
-			if (ret < 0) {
-				of_node_put(codec);
-				of_node_put(plat);
-				of_node_put(np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 
-		of_node_put(codec);
-		of_node_put(plat);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
  error:
-	of_node_put(add_devs);
 	of_node_put(node);
+
 	return ret;
 }
 
@@ -514,15 +492,13 @@ static void simple_depopulate_aux(void *data)
 static int simple_populate_aux(struct simple_util_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *node;
+	struct device_node *node __free(device_node) = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
 	int ret;
 
-	node = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
 	if (!node)
 		return 0;
 
 	ret = of_platform_populate(node, NULL, NULL, dev);
-	of_node_put(node);
 	if (ret)
 		return ret;
 
-- 
2.43.0

