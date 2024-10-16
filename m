Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031B13AF2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042534; cv=fail; b=VuUrA7Jmafgx4tIzIpkV5Mf8ybIEzJJa2i8IJyCSCAaRz3R3E0Jbfhv/cUPCVa0Gl4R+RzBD6HccW/ee1xlL1SETjytMe1Z0W4zBwhWWnrv9aW3kilQRmFzySLTcgwwROU2dbWAxNazLl3Ql/wXPXEfA2Rv2ATzyUQoiVfPAoH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042534; c=relaxed/simple;
	bh=QJ7k1wcwacC/l3OBzExBFAIqNi7DjVqPCU2ghc+XvzA=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=g0fklR2rUMAk4FUz+9kQw+mZfFCQKkOS9OX6+w9sGg+pCqbQw5/XJPuO/2pWM8oR7pg3oiTDab+WlJAbXfsf6w0go5cqpnZwbu6MC+lKrUZzWdtFVFd9KAMe4Bs3ziBTSXMjhjH0RSAnsHil0qArHzOWdQvINckEv0XKB22n0rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ies7j0Z0; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ies7j0Z0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdHYAhEDg4OQIJldeMfeTbdG2oO6zwK9n3KJsC8fUH0QKopxP9MY/wMUkjcVgtRZr6U8XZn9bkoqiiqRQqPI1+YQv8UHB/dBA35tt4KH1tEg/pL1QTQdEax7FqwKsTWE8YENN2CzvUUcmwjW82z6bFAg46H8qPTl/0pzJsrvTzYRs4TYKwb0Dbi+a0NPZNFJHyC5zXSu6YxSAJdd4i/8hQhx1MRj3DT7r9YWBcI9eYM7hWoAI0FU80RqhZRQcNXKtxpdpku3f3Q4a6obFtgxxQb25i2nxVAREvdiykXcEe8QXV7sAL6uoZz7eDHuuCcfkSwJjmc4H3PB7GflJNhC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4+zJ+VlOXjFFjvrLovLNxXQJKjVrJ7YKNDljtAWetE=;
 b=dof1U9aGHP95j3DhTXGxCpgpBsUHZAP7405ymLISeWi99qoo2VeJVHTaeveVu/4WGqFYjPE1DMZWAkKmtfCWi8H+f8Qje00AN2QlxzX1igqReiggC9YKQfPr5a7KyXMFc5s1Btcz/OpR9c4pc25ctbwjlWySfHeirpsAQDbTXN0G4ml4VDQG2Z0PQcV2bPt0C3Lr1Bjk8AohdrGLB9CNwPHA5pMPjWPVvqd2sapAnYapYeldtUbLtohGEV6G/DP6hNba6tqg3Zknq5ZQ8TCAq+x3QXrtLbLamlNMOcqfGL6tjlwvDpuHwNP5SNi6MTz5S+dNI+M52TWCTmPlN6ZHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4+zJ+VlOXjFFjvrLovLNxXQJKjVrJ7YKNDljtAWetE=;
 b=Ies7j0Z07ngfWGwd0CD/5WIS/SmPxOL4WaJq22xnqNnf50AxaN5yJNWqnvjD9IrPYDDUET/Gc51MGcpjlaqxA6hWgUaOe9avoaiuLF9jgan32TXnInUAxrE9pnVeZpZ/MKNvUpr9EzF1nTY203Chy5S24irAMNW4DUm7lQ9bsSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9281.jpnprd01.prod.outlook.com
 (2603:1096:604:1d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 01:35:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 01:35:27 +0000
Message-ID: <87cyk0eso0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: makes snd_soc_set_runtime_hwparams() inline
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Oct 2024 01:35:27 +0000
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e6bbb0-68e6-4a13-c4c2-08dced82d02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?McrCDoKpu3R8yVD+iVYDRNUDcsdXi1ALeSO8g2We2qr/bMjA/R+EGSQrX6NP?=
 =?us-ascii?Q?y8FL56NkxeNAYM0MXHrIqA1Ke8Bqc9vz9oIAnjZ/rM/oHYINu2ImLkSe/yCA?=
 =?us-ascii?Q?IHQRMopxad7wJ4SdYcTsE0o0n8RoQGdKnwr5QUQiOOOJ3167dV9hFVHFyZBJ?=
 =?us-ascii?Q?eVDxASs5Rng+S9O342ciQG/Dg80VlPP15eZVZXA3ZTdtQx51gjWL/aiYJOlP?=
 =?us-ascii?Q?GNsqBy0NYIYjPVZqoWinXFOzbQdkY5oakuekAKom3qog0xtM53og3tyRzGHq?=
 =?us-ascii?Q?6n0Ap0Xb+bCIB0DOUV50pBHgNNAdfk4bDfWNaD8HSwi/YeR4L4uQuZtB4ixN?=
 =?us-ascii?Q?XQYNHxI2pXnIUaiAEveOtn2WLrgskqH9ruP+L4cwkjP2fWojs80eK+4qa+rR?=
 =?us-ascii?Q?VWlNvK//vuwfAim9waA7VHY/1+aK9VC4CnpQHN2cffF9galsAclVG2gQrvMC?=
 =?us-ascii?Q?iywJFiKRASDKabjYLvM8ZAu0DyQvdLZEiTevKoGhklnzIuy6OCwe4vA92qWm?=
 =?us-ascii?Q?LU62WW8CHaw/BLP+2sKJkZv4Xm36/HtbInN1isnA3GYF0u7uGmC5MuqF5m0P?=
 =?us-ascii?Q?6/Ly/+X8fwyB0FT0883ocSxNouKAzDRTDOIy+L9OhA+gJGlDKA5oRKD/mPgW?=
 =?us-ascii?Q?EIYpaoLUQlDGhK6XyQ5HoKKneB6j9WPjwAgJLJPhV4hL3/MD2G6/B5hHcUsi?=
 =?us-ascii?Q?TIR3Ruk3rj4C+2uC3baF5UI9OTLvzqfHZJ/p9H5PfgiCXLjVqzqysZFf3Mg0?=
 =?us-ascii?Q?ZwoqX7rMdEAFLQpZzdwIksvVIdJDvaUKxVD7S+BbSeb2tb6Y6eLbHXaJGftb?=
 =?us-ascii?Q?G4rvHIhzk/yBIb+vodI9BgtQX1Qxhm96oIorUWvs+TNYiyj7TUYMh0+87x7P?=
 =?us-ascii?Q?zhssfiVAM+EFQ+j9CYDwlzi9Hi5Gzqu0PUgWMqUMGs7s9qmqUZlpamt8v+FS?=
 =?us-ascii?Q?Y+TWnMPlOJEuw2TB0aGiuSZP56S9x9+LgoYu246GFJNtqL/AMFusgXxtb09B?=
 =?us-ascii?Q?SLh8RFiO907IRdVvxnTTOopVbRiFfueGZ9cILP3lN4ldvr6XMyaCdwWJHn2/?=
 =?us-ascii?Q?pKl2ettBBZiY8AxPJ22HVfqvAimYX5EAQiJim2AFQnGr7udWB8fFztiS/eXe?=
 =?us-ascii?Q?VtkrUCAcmDuxbC/+BTJwd2+VNbJ09NtQ1vj63TFyFyivK0XDCX9NA7AelRxy?=
 =?us-ascii?Q?hwIQZs4koIS86iLdmVws0WVq5SJwR7CfFz5W0z91pHbGzxgdtD/KKSNOYYQp?=
 =?us-ascii?Q?1dxXJgKf3Yx8ZQ1uTuO7qF0smVuVFVhU98JTyPAyG+eCrdNXCne5OL3W/Eoe?=
 =?us-ascii?Q?Qn/ottCWdjS/uylLYuqX3h4an9H3ZYmSR3cqkDeHCuNRYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?foWvcxQqIAkaUlVFpRUKlS2RGlvF/eeDiwPLZXitLEThqut4MMfWPCft0Ujz?=
 =?us-ascii?Q?zjd6ruwe2yGR/9gToLnwgtQbiEl99dCyNqJUshGL+TszWXUhVlQInjdhxCTI?=
 =?us-ascii?Q?NltnS9LKUTx34SK6qNAU4U7GsF75zDNh/DVwo3vL3sShhMEspZh5RwB8VyPO?=
 =?us-ascii?Q?OcpoYyBbgEdevAjOJ8JsxMx/DR13jyWX221vpbi+KotcVt05e+Ci/ca2p7vd?=
 =?us-ascii?Q?1H7JTdP5Eo3yTYqDBwuYfbZDBOe6PVLyE1pHlbR64csh57S+GQ29X/RKhZaR?=
 =?us-ascii?Q?e6ZRF3JGYIGvB5M42vWIIcRDyU+iRZ76WUdfpVi5zNaNwA7EEY4afb2Ih0vV?=
 =?us-ascii?Q?r4CN0E0L+XZjx7L55OxmgqP9XnhPwknsPAjpp9R1exoy2k05xah13KHCJXtK?=
 =?us-ascii?Q?A0xEQom3B8+VffG4gaQFbeii+SmP5CLL4hNTaCOrdtsf7pZqwvhHj772A/sj?=
 =?us-ascii?Q?p/xSgKecaMFs9/Q8D6s93ARbfiQz13kRiTcf6vrCKUBU75YJVOcqWns8yzEk?=
 =?us-ascii?Q?dkWmX6B2lgIR1dfN/It54fr6rS/1XBCTZQh1b8P82U8hIyMXYDj0zGTDvaz9?=
 =?us-ascii?Q?h/ozEn9PpRkxkM5sPbcBAenGXEovyDnN+jCQcFQROyrP9YjEwwELGsAR4xsn?=
 =?us-ascii?Q?SDKetROXR/indFP0TCyugTPY2aaX6qd48EpvGpyZSRxEYTJnSRAfMM0DPlRU?=
 =?us-ascii?Q?ijoy9QAMJp2FmskGD4IAPas0/VC22zTB3zYG0HJrbhZsjxr1s86Nf6sqz5QD?=
 =?us-ascii?Q?cwYkwH6K5MWDOjWsRFhOhfbOcBPc/cdnc3503iS5ywOiVQyr+CE1A1mtv1xQ?=
 =?us-ascii?Q?4y4H27t/pd6y5OEkKtKYAkzJC6sdl5eOuui43Z3xEIFFElY/cTYSMgxHI3uj?=
 =?us-ascii?Q?gRoLaaZ4aXyTh6qUZqaX+B516tMg8zabeh6iPKojR8+0FpHkQZXYTl2NsEMy?=
 =?us-ascii?Q?2BJDx8cNdxCgTak8W9997ueR6PInXbF5jZG5LYZ3ZiyWhf8Bo44lUGQU6ebD?=
 =?us-ascii?Q?6Zu7WZ23vL4sYCDYycUmmLOtDKa5kDg97MnouZFHrW3IhD59DsMJ3ACsUC/b?=
 =?us-ascii?Q?SFauRw2/f7W1j47j8A3IaTSt3a+Ql42m37yo5fAMUc1Puu+gkIMnAXMxUeog?=
 =?us-ascii?Q?zgsImUWSjTXCpLh+U/SM1huXuNsiUe/N/0bRQANHiUYQ9xjmmhxmCXl9aGE3?=
 =?us-ascii?Q?MgT/2cx4pZQ7yLApL5WX1VFb+CnkZMS8FVhyL4rKNmR+c37tBY9Rkfpoh5M/?=
 =?us-ascii?Q?yt+9zo9yqCcuU8zQcTP1yrBqaWrXnTu1kyo56jD71SfDXZtB3ImS5JlwkYEw?=
 =?us-ascii?Q?V/dCTD7ePOvCeDLhzodh+BJ31kx27UTHEbxAS4n6dPe7BwvbF6jqCIvqhOwz?=
 =?us-ascii?Q?VoqcNDC0WNHwItl2K6DonugjxsZlL3Vp6ktfBuq56fluIDRdtYC4IwK7h0sk?=
 =?us-ascii?Q?txSCdHWGIgpamYOENfsIUTc3s7mwDYD1xRbvH9yxekO4kYM46CGOcNuKgWcl?=
 =?us-ascii?Q?e8dNrSdH5Rmso8g/gPsK+hljYOIrVLRjwcuf9V9q7nwW5b+tqam8nc/fmrB3?=
 =?us-ascii?Q?3ntzsiSnFLgyKK1S8gymhoLX0TCz5dAcoE1CK75StVRWii5bPq4VPUzi+1iV?=
 =?us-ascii?Q?Ikkc+WOxZNZhhsivggAsotM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e6bbb0-68e6-4a13-c4c2-08dced82d02e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 01:35:27.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GkSAFiO4PALQ6DTbgU+yKqRz9mGTqRvu2NnWPFR5vnCxlAiq71S9ytytGIo7Xiy/9nurQvumcpoGXbwZ5CMKEsk1x6k0FIYjp0m2JWYDf6/Wq7R9aTSwR5O8htC8D2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9281

snd_soc_set_runtime_hwparams() is now doing very simple things.
We can makes it simply inline function, without having EXPORT_SYMBOL_GPL()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  9 +++++++--
 sound/soc/soc-pcm.c | 16 ----------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 123a0140a23c..3e72317e2c20 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -541,8 +541,13 @@ int snd_soc_tdm_params_to_bclk(const struct snd_pcm_hw_params *params,
 			       int tdm_width, int tdm_slots, int slot_multiple);
 
 /* set runtime hw params */
-int snd_soc_set_runtime_hwparams(struct snd_pcm_substream *substream,
-	const struct snd_pcm_hardware *hw);
+static inline int snd_soc_set_runtime_hwparams(struct snd_pcm_substream *substream,
+					       const struct snd_pcm_hardware *hw)
+{
+	substream->runtime->hw = *hw;
+
+	return 0;
+}
 
 struct snd_ac97 *snd_soc_alloc_ac97_component(struct snd_soc_component *component);
 struct snd_ac97 *snd_soc_new_ac97_component(struct snd_soc_component *component,
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 76cfb6b11544..678400e76e53 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -416,22 +416,6 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd)
 	return true;
 }
 
-/**
- * snd_soc_set_runtime_hwparams - set the runtime hardware parameters
- * @substream: the pcm substream
- * @hw: the hardware parameters
- *
- * Sets the substream runtime hardware parameters.
- */
-int snd_soc_set_runtime_hwparams(struct snd_pcm_substream *substream,
-	const struct snd_pcm_hardware *hw)
-{
-	substream->runtime->hw = *hw;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_set_runtime_hwparams);
-
 /* DPCM stream event, send event to FE and all active BEs. */
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event)
-- 
2.43.0

