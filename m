Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443449;
	b=wSyGZIjuC9OjcWeRNCJa4rz0dUjYQ/Pez+TKAKL/3V+LJxjOTHaIiXGH+21XBwi4H1U/
	 hDWeV+L3cCsIlxxc3e0mI7XJzxFYa5Ieyi8XBxMrCE0B0dbuROgMN7ppXA0HUEWo4y3FQ
	 UTLWBS8UM4vUPWjHDhXqoEYH3qNbtgIWKlnma4gBHHPxlrSNGXawORPxNiBRG9Wix3X3/
	 Hb37kQ5qCtkR7c+nYYUhmlsLudYDETc29l3BbPzZWiaSGPu9UbKs6gOQ9LduiQzd/ZZOM
	 JXAqhqJR8FC0HWkJPiD7cLNZwi1Ndc/8VeLzZXpqlA6o3NwLxtNCPsgt0LSVl6aonOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443449;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=737l/VEdJyEWkL1PkLMWYvH0Wn381BhZ8NLCJSg8Rvs=;
	b=ZBg3rVhYjxRBjNXpxZssQDVlizQYoK7uKxmD+WI7tQAkNTeoM6jfkE6dtE225Je8eSAR
	 O2aT/T06ITMvt6IOxR+lh97lB+cFot0/caVx9AkO/QtCtqj8OFdRbzMj9fkfOF1lakW1t
	 fv2B4zLESAje9l5lNjlo2YKyXY6p6VVBYOv8oQ9G3Af/NJCVzir/dGNXPdfSZeGEg6Q0n
	 vb/g8TnyMD4wfi+Vj0dWO/UqqRmjj+afD2SlVNoHleeVS/oFYA0D+vEpy5qEN+PEuq0na
	 kUIYuhodwbSNfgjHSRTX72cQp3iSWZ34AQ4IkxgrNU++v7BCfTE40/dXvvPY4CZdnWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RYFBU+R4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.31
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6493606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6493606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RYFBU+R4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUxEOta/sfrFlcdCxSsiN4Jx9RqZ2BZV1wg/gNCGtewOg41k4DSpFAeUAM1oy49ZyMj3aCQQJtlZ2fuqboj3C91P7LJ+xUcvhjeRW3ptxVWcTcgT7r1h1ibuTiT9nv1GqCXqQ86DXftXm6JhbcLfub+NpYZEW7Y2f2T1edEYP4bwoJ8pkS3OHCIVroAhyIMkqMPd8uhS1LZxSL3LORaJyFl3NHzgce9djZTj2Z5OgxnhlPG/c0M78i1HH22fOVWAeIeW0mBVVT/iZiHHrWjbkZSC7H9N8Bqt2rOnSZxVvnhnKPOkKiVyVst65wYYD4o5ZrnDTF/DMjDrOB85WBpf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=737l/VEdJyEWkL1PkLMWYvH0Wn381BhZ8NLCJSg8Rvs=;
 b=wYZDl0S9gE7mQbAZm6bBMlHoA3D4NTZvVwRp2c4gF2tvOCuhTClpz7vb2hpEm7s+wHafT4x0dD7qC/juUYmyR7eo8wqNBaji6YY5ymUynA34+T3N6aUPQuw7kQlnJXF3Hbtw04nLPVib1/fwluIStVYPfy6z9ZDHMjHP/HzZQ2ZsJHau21bTkE7MRjM3qGTeopbbp0w60FyxEFKPRbPhipYwYcK6ZVJM06gFVvSoxB7uJkg7SugsQbOZcnFzy/TcnQ71DO68B/gm+qy3Ubph9HHx3j8y0GY/nBDbGEzTyiMZ80s5Ho5cZASRY5vBfRQ1TyxYQioeSKnSRACVgyBeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=737l/VEdJyEWkL1PkLMWYvH0Wn381BhZ8NLCJSg8Rvs=;
 b=RYFBU+R4yxR/QC0sOOROipCaRxQwX9zxHqi5s53+cOY2cmVk1e8eGnevmX9Hlz0YD6/w10jGyGf0+rgRyuIlwpvEnkqWHPur608NOCUbQIRdC5PE7NMEtIPhuBUP0uLGXMRA90vFL6eMe5e0I/LKiJsF1mw0sDS2edgi1L1FTL8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS7PR01MB13650.jpnprd01.prod.outlook.com (2603:1096:604:359::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:30:46 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:30:46 +0000
Message-ID: <87wlqi28ne.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/27] ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:30:46 +0000
X-ClientProxiedBy: OS3P286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1a4::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS7PR01MB13650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2240f481-753e-4733-e2cc-08df40543195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|261026121527099003|261009223027099003|10067099003|261102130727099003|261021123027099003|261102123227099003|261021121427099003|38350700014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h16El3g4/rZHxKZi+HQySeJN3ibBuy9Y6YbU2FOKPdzct0WjCj+42+PH/piSKKQg+9LYHHn9yoBTKY43WQU0CZAO38V70x//9gpVtVjLc1VEYwgU48YtX9Roo0wSM0LD9uGP1DcJl0/XLyWD3sEJxovZW59aalkA9t0Nd9r+FkoqNFpeEDclQZb+Jgd7+wsN3wABTxA+1P/3zAYa3l6U+Dk7UYlNHOpOjtXM+GCuwUsLnp1mHthLE0VD0fPsRx7SU2TTVNDh9KCl920IuOpmu/bJExDnYH2fuo+1b1oH/W+lpagPCMJYVEe5dwULzBUfxEC5qkNmOpJSxXOVkeIcHNfw9ftuhppnL78XCqUrHdEctgumcrREcxULfJ8UrtS/jeE0VfIVUwNV3cQDF47719LaIpJhyhqizu/D20qMWoKWGk2A9jp0qUeIPh9QDzrImFcnTThg6W58qSMvtUtRMjyz5HZZSoUvZKtw6n2g6PQJvUnHLLihHQC9XVDlQ4U2fqTfwSd9i6Kss3F4pNjF20/dptkDzn2KJRXu1GNuHhyxxZ9qPujggdLD1Pmi35FHnqR2UDllYUXNFtXDyjr+Y+VF6FoIBvib7QFhlZ+DM5C+wB4yt0iUmwblrwHePB/ma3xDwAb/OBl6+Kdzx863fbaFfs4G1HNx91h5u5VCmclh/TEVbK8RgPjxuHbdwMDcXyTDpukh+Wu1wQkcMm8p7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(261026121527099003)(261009223027099003)(10067099003)(261102130727099003)(261021123027099003)(261102123227099003)(261021121427099003)(38350700014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R5s3/A/IUXS7VPaMFS8zS2FMla/4OIyL/3T8pt2DVXFLxQm53ZARJfk1cnEW?=
 =?us-ascii?Q?jV8trIfZOKNIsH9uuGfmq+Rl0AXdS/TTELuLVl06+2NJ6mDcN49V0ruoHuaZ?=
 =?us-ascii?Q?gMV7W5F0vz7C98ecsX0JYDfaWt9o0Dpr7TEN04vDRQ+teuuG+RSVjyi7u7aF?=
 =?us-ascii?Q?5JtiEV/TVcin7WJ95JyQTpRwuiupIF8qkOCPbNGRUjMQgjt1BVEtNuJvcER5?=
 =?us-ascii?Q?6Gt08FQa41DvbpCYBhf5va8pxTcx8ukqOO8obf+fWAWehkDKR5asbksBTj/x?=
 =?us-ascii?Q?uHe8e9VGFBU+pUq11B7aaK5bwgMlMqiqcJNKz2YklbrI3AXUn24BelPxvsrN?=
 =?us-ascii?Q?gEXpTBlv4rFPHwd4pRq56Dz8T4eswPbuPNJgrTZdavr07VNaOBMNwbAEohwK?=
 =?us-ascii?Q?jK9g0w+t7Dp/TVvkLXIa+5nuNqERH25M/QVhfr4k5EIo9hQi9e6aZc4C1ni7?=
 =?us-ascii?Q?ivGlaaTzZDzhjLE2PQZozWZAYgQnpsgr7sP5rqb+qY6hOHCfDMYjytVQQcfK?=
 =?us-ascii?Q?NP+4MBuNCVVbhoyek3MB3fI0li5qNMIL8KkUGpzy0si/dXNCJE2dyOBZkCVL?=
 =?us-ascii?Q?O2dpb57Fb0SWJpSRbMagq9uBmRofWvy7XgEE/HtmyiKZLAkYU7Nz6mpRare2?=
 =?us-ascii?Q?spT7+YDp3D01IiAftTlJ39zTph9jBD0tSN58E8Z+W5onA6SZDxvEghzxQnu8?=
 =?us-ascii?Q?+DmUh6kT0v9Z6DsL9kQJLRHOFRacEDrh3kLFPFmhx8wfJknp3nfkCHmjkZtR?=
 =?us-ascii?Q?CkMsn/xafesZYDWtk+zMAq3zm41bwH5oaIr4co1GS4dDD7tRrshVyFHHVPBv?=
 =?us-ascii?Q?xv/T1F7E8ssZfgJAn/dmykSquI0HNenkkzGic8KBb2g28FARXUf7RyCoj9eN?=
 =?us-ascii?Q?Sky4A1Sd954dIInn+E8GhCbZNgKdN4aZ4aVLLE4cqykVRO4JLN7XSbsDsbHl?=
 =?us-ascii?Q?6WarTFGesmH81PEP6tBCMQJQkFc5I2dyJJU9YHcxWUKHkFDcXUKF8BtDuCb3?=
 =?us-ascii?Q?w2+zGnD0sl93EaoOjWjYEdnGn7IErHwIcr1s17H1Z9IOY4GTjbIOT/xyAGuH?=
 =?us-ascii?Q?RpbHtax4lgcfNvdU5VFZbN7p6pikEADub94iDWizDhTERiiVYO7SRtlqBaN2?=
 =?us-ascii?Q?rnXC+wnhJ1EwNBrsOhjCzVgr/yjT2jEmE1G855ScNWxDnWIDQUI+rdCJqDft?=
 =?us-ascii?Q?KcUye2IDhgbMzO7MmiqxfCovQgQPjQ4vDIR9kQDx2kqPLYDVX4QFfj86NNJN?=
 =?us-ascii?Q?qMRJEnybq0+pGLJtH77HhwB7rbgkl7xEARInqJuAfWad6tayAT34BVh0ZmUl?=
 =?us-ascii?Q?LPZ8P4P60QKB8h5BoFf0nwnEx7skc95RQPHEIr9xiKfAe2kmJEKC8Pn84K0V?=
 =?us-ascii?Q?JBU6F6WOnYLcK2RlstjmZlQXyMc2J5rTXItlU70N9iwH2QfKAjgmeTli5aUC?=
 =?us-ascii?Q?aM5l1mtRdPM1e8J8jTu37Z+5ruJdKq0Zjchg8X3mNEThEIiViZNM11ncu5LY?=
 =?us-ascii?Q?sH0iCwa/fw7tx+rxLY2ahtVlOPwEZ5FK4X/EVoOKOZ+N9bM4en9FwjyGlANr?=
 =?us-ascii?Q?Em/Ywaz5Luwiff78oYVVK+yOymoFGDg/TVtfgYyM+tSvsqbuhDAAblV9veza?=
 =?us-ascii?Q?srA0jvvfcpIFzAlu2Lt56b4vuitzYlmie4LYdG/hn4wWBUmsd8DuCa+qlYUn?=
 =?us-ascii?Q?Akgzp73HjjnhpJc17lXzg5GrAeoXlbqlb7kDoxC4tc9MtHGIV/9N8qEhORR+?=
 =?us-ascii?Q?+p1DbozAN4U2bfMIFinSxMYDEYtyXnI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2240f481-753e-4733-e2cc-08df40543195
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:30:46.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5aaNxUA/JQx93Q55DeOpjuAvTMZUDjYnRiymO3md8/aRU6pk7LXTFgZqZH+WEdoyHWRuGDfJKbeq6AKIzbixblRM+CEol8DiFUCLnFH4Wm7pDSYDuDA1vpdfrpJfUF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13650

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

We already have snd_soc_component_regmap_xxx() functions.
Let's standardize the function names.
	- snd_soc_component_{init/exit}_regmap()
	+ snd_soc_component_regmap_{init/exit}()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  6 ++++--
 sound/soc/soc-component.c     | 14 +++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 73d66c9766944..4e30a22a767e2 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -337,9 +337,9 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
-void snd_soc_component_exit_regmap(struct snd_soc_component *component);
+void snd_soc_component_regmap_exit(struct snd_soc_component *component);
 #endif
 
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
@@ -445,6 +445,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
 /* REMOVE ME */
+#define snd_soc_component_init_regmap			snd_soc_component_regmap_init
+#define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a6e280c798f3d..1f40caefee8f1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -435,7 +435,7 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
 #ifdef CONFIG_REGMAP
 
 /**
- * snd_soc_component_init_regmap() - Initialize regmap instance for the
+ * snd_soc_component_regmap_init() - Initialize regmap instance for the
  *                                   component
  * @component: The component for which to initialize the regmap instance
  * @regmap: The regmap instance that should be used by the component
@@ -445,30 +445,30 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
  * yet ready when the component is registered. The function must also be called
  * before the first IO attempt of the component.
  */
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap)
 {
 	component->regmap = regmap;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_init);
 
 /**
- * snd_soc_component_exit_regmap() - De-initialize regmap instance for the
+ * snd_soc_component_regmap_exit() - De-initialize regmap instance for the
  *                                   component
  * @component: The component for which to de-initialize the regmap instance
  *
  * Calls regmap_exit() on the regmap instance associated to the component and
  * removes the regmap instance from the component.
  *
- * This function should only be used if snd_soc_component_init_regmap() was used
+ * This function should only be used if snd_soc_component_regmap_init() was used
  * to initialize the regmap instance.
  */
-void snd_soc_component_exit_regmap(struct snd_soc_component *component)
+void snd_soc_component_regmap_exit(struct snd_soc_component *component)
 {
 	regmap_exit(component->regmap);
 	component->regmap = NULL;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
 
 #endif
 
-- 
2.53.0

