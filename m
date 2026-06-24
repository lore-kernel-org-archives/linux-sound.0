Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536B345CAA
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288100; cv=fail; b=JfHI5P+/YiO1ZsDnVDjzVGlb7S6tMVT0qSrxQbWfD/t/rE57wAttA+3+VRVvRb1gb6AOSifYDaVHQHd1OWr9hIdqBMBtGp/a0yeZl2StqbDuEx9WRUrnM8zr2NpXTI+S0QOznKR2VBHl+ywWYEeb1Vd2klM/0+j1XI/ESvPQD6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288100; c=relaxed/simple;
	bh=igeZuC+Pn1KGiR3rwgsilP/3PNyP+DbTdloIplElY/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jP4ZY6AjFJlEZgyiAj57Gd/4SUzY3fMlFIWQVOU/o0UHcNFIWxtkYqWOjkf9haWeRusYqYQgpoOzX75dEki1He/gbm93fp2I/Rp61Y2KxX4Vb/keD38Cm+hCB7b124AOb/w7tNH/1gSBsH6/l/34MA8HPe1Ei+8JnpwkT5AOX8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EAuHx2g8; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EAuHx2g8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyHCQQ58r3f3st0kSsepBiTiO3puM/r+6BQFkLEJanLyqImMXUxtdwidiTPlP4KnM2fxmVTae0DUyt98bqEnd6KCt7ynM3vVQVc+/MCqoYmeweikDVQeJjjNua2PdqkVVwkyXshJuokqG+U57ZYNkCetj/HB4Bv+CTi8Y6IJumgevWuJ6HRfw9TnbBlY2sIchqVMBrYwdLJhGJuCqjqDa/QAfB19yBkBp4Z35H/gOtVNNlf/xRH26KUdEuHzzjhCswhGh1STip6TlayEzyPQglLVG4CXPLuB2QlkVMaHcpXegVsK5Qb2sMTC5b6zSHclNCzQifcpOsgQAsoPh0W6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igeZuC+Pn1KGiR3rwgsilP/3PNyP+DbTdloIplElY/w=;
 b=mpF45Yht8spLhOn+3HwJCvHU7rfuJCKxJqKXFgEwQV6Hs/hTtFXcHmAKqvlU74J6cskCKm+Xp7wkdOatOBf2JYJhEJjPemKOLHE2aWVwjJSBMGPZZ5V1CV+/rcx0g1ARzsaZOfjXsZossQgcgTfu1e1VOLEtRoTD/MZC1cORhNcbPNGkR31XOEv60UOEBQO9YGIC5LBKE+0FQ+w/GzhN+eD/0Mj3Sh+DYDmLr+xTNXIDKXffk4kzOixK27NV8JakCBpm4Ymo1+ODa495IH7/b9b2rTtu4PJ0bV1cBW//0aPUvpWkNgIAtjEe/Nnd7ClbjRFySt+3ZCd2pNr9kX9Geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igeZuC+Pn1KGiR3rwgsilP/3PNyP+DbTdloIplElY/w=;
 b=EAuHx2g84FF0+A/MLzXF7vWX2gBWH0E1CtN3+V0Uk8uyaIQYe0ap2Hmg4uQDZFSzYAs+nbtczDMeILGiZ0FhyLjks6a0kTRjSd5D9FhDECoZ1Dc79UMG3hCRMhCOp/QuMlX446lBCTK741l0xxSVdNCriEZ5Mb45GIql8LcszZ828md79uHyFrpnbxYg+CibE7JifJPlW/xU6AG446BCFw/EKpVVKpPqp9Z8YFdLyl6EPP2p8PeEXd+5Ns/6GMC3C4gqPPPCirh1t+ern3zhwoNq6CDXVXrCcwsnDtJHH2RSAq6nIpx3DSij+oaYQJQtBZSYMHxgw66/lMh/XVmbZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DB9PR04MB11559.eurprd04.prod.outlook.com
 (2603:10a6:10:605::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:01:36 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 08:01:36 +0000
From: chancel.liu@oss.nxp.com
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Chancel Liu <chancel.liu@nxp.com>,
	amade@asmblr.net,
	broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Mpuaudiosw@nxp.com
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Wed, 24 Jun 2026 17:00:02 +0900
Message-ID: <20260624080006.1105961-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430140752.766130-1-cezary.rojewski@intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0143.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DB9PR04MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b51d1ca-a82f-48d8-e597-08ded1c6cffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	43LqjHe39XVtZwi2QUAshI1PxF3yrmCro3a5FHuKXuDqebbfKqrZ5e5qm62lp/7GzsnmhDOWacNKFFPbpNKFKL1KTtKxK4czgU+rDI0eMV0oPaxVVJfQALTv3b1gNRms45rGjnr27edQDo78a6JoH7997oL9l86xteG38CWfl2d06W5cYexq/naTN/4AEufDXC8I/kCnN0JKcrVuloJcoiG4pFreepSKQoEKUI1LuUFjnMK5GL8jl8x10S97wt97lFCFG3CpUoazTy+0bIZX+B8hLjPDnKPpyYOayKE9nie2Zjfn2zUQwXkbgKF2Xnk1p583dES7CwzsHHkPmCObyI6VOuABBW0bSbuHm6j1dty5CrY4fd7ST6PRxWQidCNxO632X2lz61caoCfanrx6TF3nWbyt8NkHdXBmzqWJAzzSNJuspmuBJ2+VtzX9TpYngtLl20WaeebP1gutEzvbzSYhkBy6Y5/ip1eWuwmZozJrsp3/pmix0470DOwDOorjdHfG7n7RJFp6raKncsP9GX62KPSXtZJ2UDN2eF5yR0OJJkRE7ssUI5XsdRYyT2CVDAEdS8geK6qUXXD3wVbHmTnbySZvbSb4rnwMNB/+BSgWHh4iU+sVPlEMBEpPs5odfbCywlE/uKFmiwqtJB66gN3BbyIhQ2hQ1tDeWbFQm6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0tnOFplbXAvRGN4R25iR1BWQlplek95aVU1eGczZ1pWZVRiSGVDNnhIMGRk?=
 =?utf-8?B?YWlQL0FUZjNRRzRtVHBXYS9RSE01Y2IzMzNBYVBxcXJ1YkhGekdpUXI2dkln?=
 =?utf-8?B?UmEyai9ZMEJyOFVaQXhLM0lUNUR6NnRKU1Z4T2xjQkJXalFXU1pLS3N5K2tq?=
 =?utf-8?B?NXZjd1BwSnNtaVlxOVNHQzlkdUhwUkZONklKR2NJWkhmdFlEM3dkMUdkdTFi?=
 =?utf-8?B?emc5RFhpbnYzYVBOeU9GQXZLTm5HcnBScVhSTnkxZVlHd2Z6MjU0S1VSK2sx?=
 =?utf-8?B?MXpuREpBdTFGWkE3K1BiQTFmcHUvQjNQWWZpRW9rTFJYbCtQZDhiZVluZUVJ?=
 =?utf-8?B?eWZ4N0pDZ2lMSWh6bGNkK3FHY1duUmpVRGo3MjFONzVrRWFzbms0czMwdjQy?=
 =?utf-8?B?KytjMThac0hmZDJqbWJpRVdrVkRGaXdDNmdSNmRRbEhKTzdzVXNMaFg0Vi9D?=
 =?utf-8?B?aFJpbklBOHhoQzhJcjJOMW9hOWxIQjNmelBmbzg1ejQvN04vOWhvQ3Z1VHJD?=
 =?utf-8?B?K3FuRElNbTQ3dkhBbzRzRnR6WU9iTjI5YWZPZ29jeVdMSXhOOFhuMGlYK21J?=
 =?utf-8?B?L3NRSHUwbmZ6QlNWY1VSTU9tNnFBanlWT2FtZngyR2JSaFdrKytQSFhnYitv?=
 =?utf-8?B?SlpUZ3NYNE50UHlyWkx6UXBOV0hmL3B0NXVNSmVCR1I2a0JpN1M4R1NpQ3RS?=
 =?utf-8?B?VnFTZW9LQnRPQ2NDWC9obitLVmRpUGhkcnlqeGlOVCtHS3BMTnk0Z09BVGNM?=
 =?utf-8?B?OWxvU0R5blROVDVrUFFzdGdvc05XZENVZDkwY0xTWW5TNDltL0tma2ZndHgv?=
 =?utf-8?B?czlyOGo0MjlGRHM0eW5TZ1lYRWhUcURwUGpCZFU1aUsvRk5GQlluY2dOQ29o?=
 =?utf-8?B?TDZwK2VzTE10VVgvbi9IREY5STI4d1lrSmRMWHpXakpmTEV1WXZvQVQyakl5?=
 =?utf-8?B?L1pmcWg0bnNmbzVuckhOaENJR1NpQ21JR1FLeTJCUHFpUkNiS3RTSDljS1R3?=
 =?utf-8?B?RmFDY1F3aGN1c290bUdrTkhqWG5lbHNRN1RVUU92Q2o1c0FQczJhVC9IKzZh?=
 =?utf-8?B?dlRJOHI4UGpaRjl5OU4rM0RSRkdMeW9IZ0VIR3ZXM2JDc3RMdUpORklFOERH?=
 =?utf-8?B?MzJDa3NhZVVORVdXUDkzY3Y3MnZuNk5hNkUyMVBzVFNYUVBJc0lDa3p1ZGI2?=
 =?utf-8?B?SWpTeVRuOFJ1WktYc2VmNXlxNWRhcDRLbFlSbE40OXlEQkNFL0lZbmxnNGpH?=
 =?utf-8?B?SUxtM3pkR0lIaE5ZV3VTQ1ZiRUxRbW03VUFpWUd4Y2F1bkxpamg3aElzMG5H?=
 =?utf-8?B?MDJiTW93czRIOUZuV3FSZzM5TGxqRXE3TTd4WnlFYmhUQjloM2Y4Z0VUbnUy?=
 =?utf-8?B?d0Z4M3ZnVFMxR2ZPZW55OWRyZFl2OVUvbjdxM1VsdEQwdTZSamV3ZStzeW84?=
 =?utf-8?B?OXRoNkhoVU9jMXlOQ3JwQ1haZmpiM2pnZklxc0ZVVFFJTXJmYzlQbWhyNG5q?=
 =?utf-8?B?ZjZ6ejdzY3NESEhUS0ZrZ3RqQ3VwMUVmRFMwSWtPTzNqd1QvNk9TUUI5Zy9a?=
 =?utf-8?B?TmM5b2RUYUdhOTRLTVZpamlISTA1Y09jeWRhMVozdllwN041V1R6VUwvNU0w?=
 =?utf-8?B?anJhQWM5bDc0TFRWeGVRM2xJbllxS2VvSmxBb1hVWHdkQmdiQlZTYmpOZWZj?=
 =?utf-8?B?VDhjOERHUWc5bFlHMnhDR1cyNzQ3ZHdORHlrVEsxRzBsNVlHbzV1ekpQYXoy?=
 =?utf-8?B?SExkK0tpNDcrQUVOZC8veVlKWUxGMXhHV2xQVzNsZkhyTDdHTUI2QWRTaWlK?=
 =?utf-8?B?S0ZuSDk5blV2N2phNkM4dWNOMEU3Z05hRmxmZUlxWFpzRFlVN3hKN2owSVRk?=
 =?utf-8?B?bFVKYjlWdlJybFo0T2YxcFdOdFJSYTRjMkJYbVlEMXk5K3VQbTY1RGhtd3Ey?=
 =?utf-8?B?TlVoQ2ZuYkI1ZVpzTVlVWVNoMFdBclI0enFERU5vMFNDWnluZTN4SW5PQjF2?=
 =?utf-8?B?L2QwMjU4dXllUFhUZDF1Y0pac21Nb3ZsYlB0am1EQ2lkRnBLSktveDlsT2Fk?=
 =?utf-8?B?cGd3azFGOXlMTElTQ1BJSEJVTkxjdVlNQjVCSVJvMDFoM2xyTk5BeFRTdXh2?=
 =?utf-8?B?cXVHSzBtck9NQis5RFZDb3haVjBFMmdlZ1B1UHRBMWJiZExEeGRNSTFSSlJV?=
 =?utf-8?B?ckxjN3BGRENJMTd1dnFWbmpndUZWUWg4UFUyT1JNSndpZWd0ZEZ3VGJscFJP?=
 =?utf-8?B?djJ2dS9SZ21EdTMxSW94SXlYRzM0Sk5pRVlrclR5K2V2UUZXL1ZhTThzS0dW?=
 =?utf-8?B?ZXYrS0lBclMvSUJnaENYc0w5MUVCTHVjZkdzNEhTOUIyM2pNQlVlY0pRaG1X?=
 =?utf-8?Q?rnmx3I0qi4DDCr01caSUGzRIwbyuU/pIFCPsf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b51d1ca-a82f-48d8-e597-08ded1c6cffc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:01:36.1953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XveVb85lf/yvel1C/Swchp5RR4DVsGRwPyotgRW2YgjiSrdX/jj0+Id2PaWr6nmLNYpdFbowUUJaigRz7/7kedWrwHHLmKBTAN8dbxISkpkmi1BXCSBSDnj+4AngOgF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11559

From: Chancel Liu <chancel.liu@nxp.com>

Hi,

We have found a regression on i.MX6UL/ULL after this change.
On our i.MX6UL/ULL + WM8962 platform, starting playback can fail with:

[ 321.026334] Can't scale 63529412MHz input down to <=13.5MHz
[ 321.035547] wm8962 1-001a: ASoC error (-22): at snd_soc_component_set_pll() on wm8962.1-001a
[ 321.035664] wm8962 1-001a: ASoC error (-22): at snd_soc_dai_set_pll() on wm8962
[ 321.035699] fsl-asoc-card sound-wm8962: failed to start FLL: -22
[ 321.035719] HiFi: ASoC error (-22): at snd_soc_link_hw_params() on HiFi
[ 321.035780] HiFi: ASoC error (-22): at __soc_pcm_hw_params() on HiFi

Before that change, if a required CPU DAI or codec component was not
ready, devm_snd_soc_register_card() propagated -EPROBE_DEFER back to the
machine driver. Therefore fsl_asoc_card_probe() would be retried after
the missing components became available.

With the new flow, the card is kept on the internal deferred binding list
instead, and the machine driver's probe() is not called again when the
card is later rebound. As a result, fsl_asoc_card_probe() may complete
before the CPU DAI and codec components are fully bound.

This is a problem for fsl-asoc-card because it currently caches some
component-dependent state during probe(), including the codec MCLK rate.
On the affected platform, the codec MCLK is provided by the CPU DAI
clock, whose final rate is configured through assigned-clocks in the CPU
DAI node. If the machine driver probes before the CPU DAI driver has
applied those clock settings, fsl-asoc-card can cache an incorrect MCLK
rate. Later, hw_params() uses that stale value when configuring the
WM8962 FLL, which leads to the error above.

We have prepared a fix that moves the component-dependent initialization
in fsl-asoc-card from probe() to card late_probe(), so that it runs only
after the related CPU DAI and codec components have been successfully
bound.

We are testing the patch internally first on all platforms. If the
testing result looks good, we will send the fix patch out.

Regards,
Chancel Liu
