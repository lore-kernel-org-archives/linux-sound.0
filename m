Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088E307AC6
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722139; cv=fail; b=EX01sfEnl+h7XRvIEQTY3rbfCmwskKBxmNml22qAZrZyXsCn8A451n++y6o0TdeCSJKJOYTcT8cjldCknqrvtzRjSgDdb+eH7j9uu6xH4f+/mcD5nlzXqkPZ5/zS94kFJuxuMhsGy2CahpQC9haPRPUu+NaL0tRjW+BhQfpS8Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722139; c=relaxed/simple;
	bh=uZjA9eC7czanm75pGc0yQSCDNIlGapWeY2hu4GLYPLs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QHeukkIZg+ROMMWvugyVBfD84SKKqpUpomNEupXnsgI2+UoBEJjB0N6f+YjNUyoxC50QO408o1dUHW5hBwuzwesmWFx5pR/wU94Sfhpcbt0FmOoj4ds2y669pgZlcTCnzvNA9C2JpDUp6IGVevhH6RY1Za2KDswtMgIcq6N5+9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IZjazAJ2; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IZjazAJ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPO5sSdHnVomiGnhhobCyYyE/DBdjoJ5xyCTrfpy/XsdKshQE7zOoKmPltBmTx12tD+5TaA0VA+FMMVbImsfBr3/GMlcHYKnkinVIuHQx41SS0W7t390FLixDDoA0zKjhKpE3h/rEBdHcVk+edYri9upWxbN8x6TGrWhNr6fkScCXLLoZVHUusk78bNKSoVMPH+y6zvgvSrrhZUwAd7cbZBYpsr0MjKZ6JUQ8xH8zfz8Psm1EEbl4N9D4VRJ3wj1Pq2MFLpouWMue+E/WjcQYqvAe/8kS0EOICB/nWR0eBG+GTzIIprWctHr3NfKUkNyB25ZqQ/Sdpc8EikYCV/wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itKYsoRcP86KCwdS2c1WQFMESffEJLfol3dQn+qT5jk=;
 b=PQyu7p1HvkMrJj+P3voE4ZSNs18sQTRQq08uUrBUB01lFZ70aBRmYkzcA2h0hSS01U73roDc9RCO86g5z0k/Eipd0S/rpyle7rk60qQMHUK8ofbCaHdE2p7iAUVxTCOif9kf63kwpNuYnncl7/qCiEh32AL+tJ+5XcQGGlwehUauokdaaAWpNcUV3ZA29WF29ABG88Wx2li56hobaKwoB3a7rLbN87PjjZKGoSe+afTi+9v4gceTs+1tSVUfLzoBMZlRJ2Gl1TYVYMknpFYxo6FCbjC3MugMIBjdpU3TfrvZHSq0BmXJ6cIxAbB3RPqN0IOOfblH4upU33U2eixdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itKYsoRcP86KCwdS2c1WQFMESffEJLfol3dQn+qT5jk=;
 b=IZjazAJ2GgfCEoEpFZtyxLbSVfSYRrKHYYzE1YafhAIKL2lx+llTpTpjw4FstE4Gro35tDVQcCZl+1PdxKYIfT+8shEr0oZ8p1Xf5SKADEvo/vkx5WGpNG0GjTOaoTn1pwq59CBgQs1CK+pDdasfrMo3Fw8PxNFIc0lId2hoG48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11383.jpnprd01.prod.outlook.com (2603:1096:400:375::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 01:55:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 01:55:34 +0000
Message-ID: <87v79srmqx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] ASoC: renesas: enable COMPILE_TEST for AC97 SH7760
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Aug 2026 01:55:34 +0000
X-ClientProxiedBy: TY4P301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11383:EE_
X-MS-Office365-Filtering-Correlation-Id: 4210aa43-bdbe-46f4-f78b-08def1024e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	D/x5oFr4o8Eebpl8OdmSMMUG5X3Goua+Xrb5tpJaAmS1cfBLRov/URl6cQyJLnX0z4ZCGT4xzyHsVdzSeFJoVf3LacWD77FmR5hcyXarZ39Yx+bJ5MfN98E9euVgqXVYAynrpvCzpC9L8URusdNTuXvZAU1RAFYSzCqa+JM6PvBMWLrITC19fmrl+Jw3ewTZoubciuHwUykz80hZc7fuhAObg7hMOsvqJFBez8M7pOQh97LWbHjfIf0im6Rv2PzXeJ4PrhfEQxcxHEDweKjsvcXXbSPu8BVhD87i/34b8/mUEKtLWjkqAnAX7IePOa7d/eucKsW1vrRoQAo4MDJpJju8ABPI6d5Odf+SGf5lfpLGd9KNzIuAH/ecmfNiwekWWJ/vd/mYgm/zCXsq33U8/HMgTopA+ijoJFjyqKP3vRvsOvTGN5zOikLBLAuLx+T2ELmYcXnpuKb/QfMZ7IHfbX4nUjewH3uU9Pz96CGmExtu+8NZKvOfLX6XVodvDQTZ1Tuqm2Jh3usSdwPVKfOqtAvUShbdz4ocIRHyV+pETYtbixheM80jsjSxejrJ4UpdjgGAZeIshEXVPKhxuMvkpeRTfGe5OReI5D2l4G9BcisvfcC9kv2u7Bvf3KyDC/Ru1WwVpFvVxJiudemXr1kVbfX1wW8qcJ4LUATTJ/x7hN9dk0UW8ra8sxPWgWc/bsy6umP/h3R6KMTmEJfuPNhvY10u4y72EukTl2VZdo0/SDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XaUh19ubXSLn8bKol2xTZ6OzyaY3SapCNYX0f2n6awJI0lnhl+MBYkutzOWZ?=
 =?us-ascii?Q?I8Usx7GKE6uhkiEFiI1V5FnBW0YfYcgnkqjaqFg7PE0BIU7TIDqSs8jhVdev?=
 =?us-ascii?Q?B6dMcn7pdQrYwq8gFCkUuHzQ0etjl36DQHvdpE1BRNIpK3aIZ9DFJTbqbCER?=
 =?us-ascii?Q?wauSjCWJsY/CSptVY6FxG9DxPNlcW4rugB9iSNVMhLho6lLKBYhNQFoSxvPk?=
 =?us-ascii?Q?CwS4MJGfkrCkfs5zukXRRjdwKp8wWZt477K7X/S1Vx4Ov8YbFRaD1jwMLYzR?=
 =?us-ascii?Q?M5iZB9jbUcW5/wAS8Vgn7syow8fC++O1+fBbM7PMD9/YdcYEmySHYJBYWaZU?=
 =?us-ascii?Q?y/nVA3gq/uEeyNf3tdVQ+B6nktwAaKRSmA7Wz92bHEP8MoRjO1Kve5FpDNgi?=
 =?us-ascii?Q?lcIiYOYns6eOYVLxLDKiczMHIyd+OFskBDOz9LUrVu3ouwuMkEyYwxv9ZX9/?=
 =?us-ascii?Q?FdVvYjvLK5i/z0rkKD9nBeWZ2wD8In+FDW3DVh1r0mG+5KLtgOMRjVYbWWA+?=
 =?us-ascii?Q?OTXDXaOr9xSSEpZV/3ZBvVsmqs/9WGk8PXvp/LkPzfZDE0kny6vSL0FIzBZe?=
 =?us-ascii?Q?+o84vmc9yKXvT9bcj1efbYr/9GcK4ryK9RyIqAzkuBkVQJi5WdK2kb75/Uuh?=
 =?us-ascii?Q?dR0T51RAW9ubIsFhkQkZJof9Rly3w7FS2+GEp+c9vLsz4eVM3Eku6hrnpnqW?=
 =?us-ascii?Q?DZ0UZEcZ3qnEbvUwS/9X/MRvz8lfYQeHYNwFgWCSFzHcwUY9HsBlO0wRu1d3?=
 =?us-ascii?Q?HEGYN5VjBM1uweWTt9OI2elxpeGmDE+1h9QzvPg+O35lJjM8/3Dp8Lf7edom?=
 =?us-ascii?Q?IY4b8oiNlrerDWTcHkcGdY9JYRtQKhZFFVJZAHCKCR9KaGFxNaixPcBH6AKV?=
 =?us-ascii?Q?Bgfy0PUboxH6IEk2tQDiRsJozWs5j1AHrLwO/UtlzlmBc7HY8y35o8HtJMc9?=
 =?us-ascii?Q?K0YIhaYCXHn0II0HDLCANXe+53fw/61woyfWMDtWsMAwQyLLoQHkyPaiXP5I?=
 =?us-ascii?Q?cCIKaf8JV+c2ol3L0BYzEyULihDjAHNI/zfcdLSHCmXZpH9LLPyvN6tbUqjy?=
 =?us-ascii?Q?5uBFwq/jwErJOcfrXbyLrZDrOTFRgqMdpISDY4fYuUDeAQB6+x3IIOeWyEfx?=
 =?us-ascii?Q?4Be8JD/fc23ekWKRNcObeMMWiITbRfNxsxD1yP9mRPcEYsM3tMfr/LhqdIve?=
 =?us-ascii?Q?a45byu0cAYR0cCpGl2xgyB9cIqW6ufzGTiB/4uw8zxl9YilnB2KTwaP0/4ll?=
 =?us-ascii?Q?g3e4hk60hYu2u9mtKC8D3PD8S/vpXthZeAmuGIl4Q8VOn2W7xz3Wu/U+WK5c?=
 =?us-ascii?Q?DHANgEvqyguUdjqAkZAURo0SrxJZn0duL7yAQrWizTt20DY2IO1Ft87Zu3Df?=
 =?us-ascii?Q?UcoP0TFs2AbQqAsvJ21oBud3jgQbX/1a4T2G2w20Mx5E3GtnSywIuFDH4agX?=
 =?us-ascii?Q?9nBefGRpyXJlw+teVxh5Bb9P4l66wRDN3a8AwHj01MGQZ3P1uXU0HFqOTxeS?=
 =?us-ascii?Q?YCl/ux7yxvA+zBnabSpEOWlR7kPTLLozS/LTrUvKpMbZ46uAV9jJvGJOBTzv?=
 =?us-ascii?Q?W64JqD6hObA5uzwaVL+ne7DZFLvheA2eMCzu6kipbWsSqcsbfTFhTAcf6AvO?=
 =?us-ascii?Q?nTlIGp2Dan7Mn6tlBLgfIkNQ/F6vFnhHdljBQS23mKa26rvMASqII1X+nWfP?=
 =?us-ascii?Q?Qkku39V6K3Q86kRK/72u5ZQNxYVG5SPNZAYvFUvAKbszU+qXYQgRs8qULgcz?=
 =?us-ascii?Q?Um6k/iyiQGQw0DZiIst40p71O1haUqM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4210aa43-bdbe-46f4-f78b-08def1024e94
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 01:55:34.5508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWK2UA4W6ETLtLPPygqQtc+cSN0zBofWozgApWkDGGi/DBVz8bzKvKiBzGrYqJqk7ZrmFtz3DC96FvMtK0OBK+nKDHHGu4A31hCZU6WXdXJjm2HceFfzhCvu7/i600tB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11383

AC97 SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
which selects it. So it is easy to be overlooked for compile test and/or
ASoC updating.

Let's enable COMPILE_TEST when it was for SuperH / SH-Mobile

Then, remove #error which hinder for compile test.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 3 ++-
 sound/soc/renesas/hac.c   | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index bb73e5402e4e0..7b00c6a73687f 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -63,7 +63,8 @@ config SND_SOC_RZ
 
 config SND_SH7760_AC97
 	tristate "SH7760 AC97 sound support"
-	depends on CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760
+	depends on SUPERH || ARCH_SHMOBILE
+	depends on (CPU_SUBTYPE_SH7760 && SND_SOC_PCM_SH7760) || COMPILE_TEST
 	select SND_SOC_SH4_HAC
 	select SND_SOC_AC97_CODEC
 	help
diff --git a/sound/soc/renesas/hac.c b/sound/soc/renesas/hac.c
index db618c09d1e04..9963c9f1ca452 100644
--- a/sound/soc/renesas/hac.c
+++ b/sound/soc/renesas/hac.c
@@ -86,8 +86,6 @@ struct hac_priv {
 	{
 		.mmio	= 0xFFE40000,
 	},
-#else
-#error "Unsupported SuperH SoC"
 #endif
 };
 
-- 
2.53.0

