Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A2199EAD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820654; cv=fail; b=uGP+l203X1+PFD1c8FI0FxTsU8CnuP8ZaayJOZLlOFNiexetLLHTs09WvT4UzX3dkmBVKCtQ0yZkFYuudS188WWn3048XyyAB5u/9AIpn67LKKecjmzFt24EyVpW7m6b6PMIq8k5M4vA5eDSt3TrmnsZqGdtwt52I/eJRuO25EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820654; c=relaxed/simple;
	bh=5hnrO4INuiXDcBL2Mp1Nu1fyntMuu+jNjtR9J5+3mx0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kZUqD6h9dZhU3VrurdPimNncpFxwlrgbbvqKXmQt2cLpLHgYaIVXJKXdtES4XdDfXFkzaKBQESPvJCUhmFFw7kzQTljbb5qslQiiiuSeBnGfSePi52ansC2vywfmHi/LE0EkVssdQ5Ei+4JbmuUPxAgojxG+JraibyGdwNpBaV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nspyy3Jw; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nspyy3Jw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPtlWCMNH35kSTygwoIXbOH0sDZDsoe73furLtsZiR6XFRAxChEB08Nrg7Y+aewoezHfuU10i16GI3hBjbVCWE2+P13XFUlOKfvpH2vV1kzDhlO0/S3btE8ZFYHKREGIFQput1xA0hGVFZ+X8N2QMBwYOPWrlGT4MThSOzf/w9Gf51XuaW0V/8kOOQZ+ggdM9QiE45PtgjbgGueSKWiFC5cj2AdNQDwHYc8a0k32cUWtSI34wy/1sK3DVKqpL9ar/zDMaKicGe+s6tRgrnPI8VgrmxU37nFq3pY5TpPOhowtFs8heXFyIFMX2TCU4DOdiZCN/LVHZ7sxpp5g4uijpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HUqvcpHMyQS66Ay0SpyL/VSG/Qqm9ULK4wKuxvHoHU=;
 b=od3GO1nuGNXnk7z2OVjMLCyA8PkomR9PRXdDauZPSqiFV6keOjJyQe5Cguq3P4OegOM/kBfOUZycc/ab8SbtRpffR16JPgHqIhKOvbcDhm+yyMqWku711x9vQHKyzfNzh+bClOylad4/J1ZpsjRthOI5kfjBTSjzq336hI19ZT2AUJIca1L/TvLSrIPpizrqgChrbHq2uuwsafp1sIS+FPGuCAH186a3iCsWfb/K6KJBqNKdq9J0Wg4fD4uSPyt+IkufvqEDfbep63GCWdvu4jns6w1vQgCZ4FYxxK51KfNHXBkg5dvAOtldXeZBoZj3rUkecLlX30wX4Ticuk2IZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HUqvcpHMyQS66Ay0SpyL/VSG/Qqm9ULK4wKuxvHoHU=;
 b=nspyy3JwO1SdpPuvTzYET/7VhG1LddMp92HLxOli7XcvWqLnJ6mZJ7IYxOkxcB0aGKi+NbQEGfS8/SbwooGJgt88zXpML4magRMkKx0CvK8yPjah3EFar3yeY1akofpbxMpTU6ebmHNzjZSFD0oOUZFHZl+ngO/wSpp4HhoyY1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:24:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:04 +0000
Message-ID: <87ms4t4dss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 092/292] ASoC: codecs: nau8821: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:03 +0000
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef4a774-5c1a-44f0-95e5-08de20b89e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zG8LyzRmxN287O2ZrGI9vIzbgNkWVCdrMPbwD+w82cpgW8J9srfdORp7QPXY?=
 =?us-ascii?Q?Xr8AU50eOzfwmTqIirQiZd4gCUVVwb7N5ZuO4+2aaXdepk+8rVN/oUCdfk99?=
 =?us-ascii?Q?IuL6HKmGWWkzC8cfVwyk9Pr+B78nduq1a3Zn0hyxXlPDx1p3sV0H7DA9DFRI?=
 =?us-ascii?Q?zIRPsh4gcrl4elV9YJlnNP9EqSlL+matv1gllbwBBjBM3sywy+tNJYFFj+wl?=
 =?us-ascii?Q?X0BOdLoHSuOnc10bibMvR5GH+RSPIsD0YIeqkfj91wTawKfwlXTIsRZxYVWr?=
 =?us-ascii?Q?9z92wC6TdGuHlslhhMJ41jYuyCiPwT4pPcg7AQSwevPCaO8DFDB5EvadxKpI?=
 =?us-ascii?Q?1AFN544WXupaUlpBAhgIJ5CI5kB1QxhIpZY5DeWBRGjmh8bODWCpHAz6d5ML?=
 =?us-ascii?Q?vrUlZVMUtsgAAScrmBESFhTDHgWj3aL0yD0+y3puk9iGMluVhBf219VeF04p?=
 =?us-ascii?Q?zJB1991j5uc8NmwD6PI2WfOGQKOWrG34yGJhYsklUEPMTmmn28LYWqVRlt07?=
 =?us-ascii?Q?qT7YRGFeKEUtg5UjQJQ5W/IQ67gYqoAv/4XWn6NOnKdm9fvMYs+RugtNOo9T?=
 =?us-ascii?Q?6UWDv1nHbg4GRe4qqHMZK/3TGIWk0UthqajnIIwWf7bb15LpuSexrwUSFVes?=
 =?us-ascii?Q?kf6WQh37vIC3bhfwTwZrIVNV98e+lPhoIM9KA46nCqceTL7kJM16sMcE9H/2?=
 =?us-ascii?Q?U8dEj1P8B6KpYxW6VDJhF/MYVjhI87yn03FhblhftooIlXdAEgRQloNWQuPG?=
 =?us-ascii?Q?8Y7sB4yG4XI7wGnxip4RJ/w7PGdR49WamXN2vacpANcGsOUKRU6/N71TZWxd?=
 =?us-ascii?Q?3sypVBKi7B4XB9wfeoWkfgjvV9sdPE1n1EYGV+rYwxeYsNFOq+4rK0Jhluu5?=
 =?us-ascii?Q?P0xLR1qUwMThoiBhnzCJetJCCZ1O8PDrApb3zDo0NRvXdUwsAOAvGFqwKGfj?=
 =?us-ascii?Q?ZkxFjp3r2vFrODTAhmwwggb6zmqKTsYD06iA3gyh+Pa9Y+txhT7M9o7u3+Sf?=
 =?us-ascii?Q?Z10voqnlj/OnCnT1+Nd2TAqd0WyKXZUIna1dWnmn043Fo4VEh+xz8b8CaoQT?=
 =?us-ascii?Q?QNPjW5U1SkYWHxVjLo16HfAxtKX5ElrN9NHpQsAQb55eXu+oC0kYaYz8ufPw?=
 =?us-ascii?Q?Ef7Z67IYIArkZIeXQMNolhawHWuUZO8vvoe9CFAG7jXmQY9ldWmDPd5Nhs6J?=
 =?us-ascii?Q?JtpVUlsZZGddOqigmE/44V+VHO//LAxfC3rJntjELaOmHUjPFb0Y7aGl4RvM?=
 =?us-ascii?Q?XKdoDmWH/FLbPErOziiccRCCRMA6XotsC984ppQNil7VJGWbTOB4TvqWKg5K?=
 =?us-ascii?Q?4JkO/ZGHW75xah+pxtNUnnx/GT9cBwQ2KE86X/DCzw7hfDjejliw7HN0tnkk?=
 =?us-ascii?Q?oJMWgwul1Myhz1H3fJIYeLkQjkWbHtQJXaTQtV/VVvlJyVtK4nDHwStoO6vS?=
 =?us-ascii?Q?q7HecQj0/kTWTi4ICwJvGl/8lfjT+molWS27nHzt3BNMxaDWR3PlW4uwwZAl?=
 =?us-ascii?Q?ytsEyMxSUYRf0EH5/JSeTd4YRN5YgzaXLfao?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5nFAhvi8yyn3JNvy7Ec5ZMvD1hLRnPdL/5KsoGrQVpxcKlgtwTrhvKxr+d+?=
 =?us-ascii?Q?ELFXu045WDUNCdxtPY+SrLojconNO9/SwJRl5bLFqhLV7xAhvAJoKZTqqEvY?=
 =?us-ascii?Q?QpfTbbQWs6Tz7OZicMsoxJf741VxxGhMm8UERbJ5eelpsNTIWutrAWO8wEA9?=
 =?us-ascii?Q?1Lxs+xz+j5UytkNmRKjOWA/JwsGwa6WAWgiRugT85W7WzDfPMvCXcbry6wzm?=
 =?us-ascii?Q?EETYJN7HXfEIO/T9K9EyXJQmC4PtXlZLcJaSahOznwJxUCWPS68XUOUftTPx?=
 =?us-ascii?Q?ZHgByctgRfYsUb5XOLb0wcZqleZZO2cPQE+SrcHKmrMSTfSMBBTBGxFzocK7?=
 =?us-ascii?Q?4L78+Q2il2v8HvTPFTdczr2Lnv4z8FxTSD54w2jnt9C9Dpy/U2bXATvG8YUP?=
 =?us-ascii?Q?I/pyaSp3fJ8Adql6G0M/lk3wfudZ0umRYDi7VE4rypQ6FqpFgldVJTPvShF4?=
 =?us-ascii?Q?432/ahd3Vh36AaZZlHXQK1fTqxqyV+6X2Zuepli3Niq0WqVnxwZ6GbnjBrzN?=
 =?us-ascii?Q?i38XYRbUS8GdW7NmehA4SRAV5tOrBZhTBG404Q065X03EprN3s29M+UUaWlY?=
 =?us-ascii?Q?7n/P5W4jIk/Wm0+/ioN72zYokPTZ4ESQKFzKh30mgjC1agEvTn3iXhkMIAUn?=
 =?us-ascii?Q?LPckLzrnJeYDWAjPkrlj7SPu7zW9yT+w0zHeAyQgB1ftbeMZGf+tpoPnrPB6?=
 =?us-ascii?Q?3bA8du66oGlEyx1AUTb/G/LqMZzGuCqj9MaYyxO+WeBDe/gISW6mhHRfsmuc?=
 =?us-ascii?Q?URHGrFxiFboPvUCXszCo/c1PdYSTMgk/nEs2j6YdC3WSeG1uwXUmZZUAzS70?=
 =?us-ascii?Q?0d9uOvZ0kTeZ3D91j7SPRKhv+ykO769W8+cCpIa3sTKiuQ0/07bREP+BJUVI?=
 =?us-ascii?Q?t+wZjjF3FHg5GfCFdDt7JA5DD72zG08kZQ9d/HzqmRM4MTUriF0m6OKPge0e?=
 =?us-ascii?Q?1g55cBc9SsdWdq4mYdOOK4/80PFFWgCfVi909AyyZq8arewSXUOzhnvRwYOP?=
 =?us-ascii?Q?SNfE4Cr30qU4y3KO6L+WNBuWLLSw4piLSk9YuPhGl3k18xQqHDZhMPz+gfH9?=
 =?us-ascii?Q?mP52c9IucrdsklXBK08wT1BEiIgn9WbD/HRgZakR7P7Oj9iRbgmI1AXuC1xO?=
 =?us-ascii?Q?uZdtYrtUS5Ys9jDCeo9+mcOY6Mq6Ovq/sXPHaZ4+ZI7ir48h0gdThE9FlBF3?=
 =?us-ascii?Q?CLhwN/9UoQMqkr6WAG/bVDcl+NJOaNdBPN/LYQqTkaX9JuuxKW+zhTJCegim?=
 =?us-ascii?Q?KmHk1lAOK59nHE1d6ePQeV9lfq5r79foe+4/x1v/2PSi5Heu94Q91FpsQmxv?=
 =?us-ascii?Q?uRU9XUPtMv1b6YRNZWDiydcc1bNvUGYKE/84XCzmivstookGbaaOf6rm209/?=
 =?us-ascii?Q?PWfwgfuza2nU/5nMBgeyO/Z/4rHB8fn7hulyqYe268BfzbiF6v6k6MglOQr/?=
 =?us-ascii?Q?g2IoOEo8Vb1DCFBNXfDdZFW0LWZyVy/ulESohSxJLekcwlJjmZ6Hzg8u7Fog?=
 =?us-ascii?Q?OuZ0loP1OPxhHJLOin6GJCY8z+YXpWg3s27RijXCJN2mu8cp+VqLOB8st83G?=
 =?us-ascii?Q?sGzuJDnQXNsX3sQYuuA7cUG8ustZx4iI/NJIDb0hGcxHpBCv2tSec86nBXRd?=
 =?us-ascii?Q?JnYeXhwNRIErGBzGkfRDEfQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef4a774-5c1a-44f0-95e5-08de20b89e84
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:03.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5k4wpraz3FSZZky91/d9IeVIsJy4+GnMIS94CT3a3mazTKVRbZqZEiw649rpoTSN6a5ovXw//srQTedjy5GBCAYPjirpHev/cu/XwombKmfxvfNX/hpHVIgf8FK/0wk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8821.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4fa9a785513e5..3beb3c44dc2c0 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1047,7 +1047,6 @@ static void nau8821_eject_jack(struct nau8821 *nau8821)
 {
 	struct snd_soc_dapm_context *dapm = nau8821->dapm;
 	struct regmap *regmap = nau8821->regmap;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 
 	/* Detach 2kOhm Resistors from MICBIAS to MICGND */
 	regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
@@ -1055,7 +1054,7 @@ static void nau8821_eject_jack(struct nau8821 *nau8821)
 	/* HPL/HPR short to ground */
 	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
 		NAU8821_SPKR_DWN1R | NAU8821_SPKR_DWN1L, 0);
-	snd_soc_component_disable_pin(component, "MICBIAS");
+	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
 	snd_soc_dapm_sync(dapm);
 
 	/* Disable & mask both insertion & ejection IRQs */
@@ -1080,7 +1079,7 @@ static void nau8821_eject_jack(struct nau8821 *nau8821)
 		NAU8821_JACK_DET_DB_BYPASS, NAU8821_JACK_DET_DB_BYPASS);
 
 	/* Close clock for jack type detection at manual mode */
-	if (dapm->bias_level < SND_SOC_BIAS_PREPARE)
+	if (snd_soc_dapm_get_bias_level(dapm) < SND_SOC_BIAS_PREPARE)
 		nau8821_configure_sysclk(nau8821, NAU8821_CLK_DIS, 0);
 
 	/* Recover to normal channel input */
@@ -1106,7 +1105,6 @@ static void nau8821_jdet_work(struct work_struct *work)
 	struct nau8821 *nau8821 =
 		container_of(work, struct nau8821, jdet_work.work);
 	struct snd_soc_dapm_context *dapm = nau8821->dapm;
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct regmap *regmap = nau8821->regmap;
 	int jack_status_reg, mic_detected, event = 0, event_mask = 0;
 
@@ -1133,13 +1131,13 @@ static void nau8821_jdet_work(struct work_struct *work)
 				NAU8821_IRQ_KEY_RELEASE_DIS |
 				NAU8821_IRQ_KEY_PRESS_DIS, 0);
 		} else {
-			snd_soc_component_disable_pin(component, "MICBIAS");
-			snd_soc_dapm_sync(nau8821->dapm);
+			snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+			snd_soc_dapm_sync(dapm);
 		}
 	} else {
 		dev_dbg(nau8821->dev, "Headphone connected\n");
 		event |= SND_JACK_HEADPHONE;
-		snd_soc_component_disable_pin(component, "MICBIAS");
+		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
 		snd_soc_dapm_sync(dapm);
 	}
 
@@ -1162,7 +1160,7 @@ static void nau8821_setup_inserted_irq(struct nau8821 *nau8821)
 	nau8821_irq_status_clear(regmap, NAU8821_JACK_INSERT_DETECTED);
 
 	/* Enable internal VCO needed for interruptions */
-	if (nau8821->dapm->bias_level < SND_SOC_BIAS_PREPARE)
+	if (snd_soc_dapm_get_bias_level(nau8821->dapm) < SND_SOC_BIAS_PREPARE)
 		nau8821_configure_sysclk(nau8821, NAU8821_CLK_INTERNAL, 0);
 
 	/* Chip needs one FSCLK cycle in order to generate interruptions,
@@ -1191,7 +1189,6 @@ static irqreturn_t nau8821_interrupt(int irq, void *data)
 {
 	struct nau8821 *nau8821 = (struct nau8821 *)data;
 	struct regmap *regmap = nau8821->regmap;
-	struct snd_soc_component *component;
 	int active_irq, event = 0, event_mask = 0;
 
 	if (regmap_read(regmap, NAU8821_R10_IRQ_STATUS, &active_irq)) {
@@ -1222,8 +1219,7 @@ static irqreturn_t nau8821_interrupt(int irq, void *data)
 			NAU8821_MICDET_MASK, NAU8821_MICDET_EN);
 		if (nau8821_is_jack_inserted(regmap)) {
 			/* Detect microphone and jack type */
-			component = snd_soc_dapm_to_component(nau8821->dapm);
-			snd_soc_component_force_enable_pin(component, "MICBIAS");
+			snd_soc_dapm_force_enable_pin(nau8821->dapm, "MICBIAS");
 			snd_soc_dapm_sync(nau8821->dapm);
 			schedule_delayed_work(&nau8821->jdet_work, msecs_to_jiffies(20));
 			/* Turn off insertion interruption at manual mode */
@@ -1261,8 +1257,7 @@ static const struct regmap_config nau8821_regmap_config = {
 static int nau8821_component_probe(struct snd_soc_component *component)
 {
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	nau8821->dapm = dapm;
 
@@ -1564,8 +1559,7 @@ static int nau8821_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_STANDBY:
 		/* Setup codec configuration after resume */
-		if (snd_soc_component_get_bias_level(component) ==
-			SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(nau8821->dapm) == SND_SOC_BIAS_OFF)
 			nau8821_resume_setup(nau8821);
 		break;
 
@@ -1603,9 +1597,9 @@ static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
 
 	if (nau8821->irq)
 		disable_irq(nau8821->irq);
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(nau8821->dapm, SND_SOC_BIAS_OFF);
 	/* Power down codec power; don't support button wakeup */
-	snd_soc_component_disable_pin(component, "MICBIAS");
+	snd_soc_dapm_disable_pin(nau8821->dapm, "MICBIAS");
 	snd_soc_dapm_sync(nau8821->dapm);
 	regcache_cache_only(nau8821->regmap, true);
 	regcache_mark_dirty(nau8821->regmap);
-- 
2.43.0

