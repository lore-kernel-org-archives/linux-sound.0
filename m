Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190162F549B
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189353; cv=fail; b=OeItXV34S4P2t3aSyA93BXbPffahv6EgQiCbSih0NRFbsd2CliuVUeyri0Stf3adrNtGdqQDj611U5W0GLAjyjmhN+cA/YOqmHZrTTZ78wc2Hfnjkjs6ZuJrbNRoY4+V9E5WJRpbz66Omc2ljvya9Emj2fYO5KTv6GgiX88AeB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189353; c=relaxed/simple;
	bh=GRsV/nf3jKQRbbDqrKu6RRsqNI5UXmUFv1yDMcCOCFU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DcU9putPBFDKETUv1FTnzKzSMc07M/VvlbK3eLzvzebzlHY59ZOMoqBEeDbQz8JmhYDLFgOhq5c6lk7YxlSoedb6u63I56F2lhvDyF0rAAxFKO8bOsTMhzJVkVdnvBebqbw9EqgSLWIet5ryozy82oFe73IM/VB+ba5gDHfqHrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ToMZ1o1a; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ToMZ1o1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey4XF404EFwEwVNf5yEmDZ6Gom0zZ/moNtRZ0eezBJepvVzgY7dmzNL5tk8nVUBt0bwiPB3+pVURpu82TUnn3tadtWLSeE2ufVgNh3xs/CIHh46j9eNxr4mwVrPS801FevnEtJDix2Iukxr1AwpyudEcKrhiltwPNlaAHHYpebn4oXZ/Qz3qN2qsh/xSr9qhrmD0TOYr77A4Ahv1yHHlsFDybVqqq/BZzzB6rY94yfW3fRDOvrnZ8unQQslPiRUVy9IMNNgLyJOAw98ZBZq+QB2vQoVFKVmqGlibAKF1FI3cuH2ur22NvXulzJHC/euSZAEPhKoEeVl52ZqUvu5c5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJzsoxYOURc7t3F1YbeW76GHBaQJiTb2b20ZRP6iim8=;
 b=bDm3dIidv9Rp56lEOFBMVNdWSD2OoH5NOgH6cQNqmWq3VOoRCF9xLUbM+55UZJMQ+DXqs64ctL7hqLXR6t8yGPKqaRVj1BI39a3bhx9eO9IcKtf1Bhd66G/ndlDrL7mNI/RL1daPIVfcIhakcXXpn0T/DeqZTnCAqqH58D3ZtzFqNkgmis3fZZz4ihVOPMeGomk3+46UwgPIRG3cgEYYW72RYKsyEiQs747XcFq2ckioZDmniJq9xHDef1v93LSCtR06TNhlegw4CDXEyVMG82tjiu3+0f8v2snt1zueCi7hVozXAdRdBazgYNOqQTamZN4EoLoDxKsq1ZLG0AFcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJzsoxYOURc7t3F1YbeW76GHBaQJiTb2b20ZRP6iim8=;
 b=ToMZ1o1aSC8yLdBk9kKMqMoVorOQcW3QF/gy5VXosBRnpHHV3tI5qK0aMx2elITw/Q5mDLMtPbGQf4ELxqHKa1Rpii5i3gX3+f6i7FjAhJ5kJvlDcYBWhe4XNmksI5xKHvVryI56+XigkO5HLH7RPIhRYKZP4soZJsxnatmS114=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13225.jpnprd01.prod.outlook.com
 (2603:1096:405:163::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 06:22:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:22:27 +0000
Message-ID: <871poyy53x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: soc-dapm: rename snd_soc_kcontrol_component() to snd_soc_kcontrol_to_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
References: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:22:26 +0000
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13225:EE_
X-MS-Office365-Filtering-Correlation-Id: 836b24a2-d6c0-4383-d17f-08dde468ed74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FiO1DqLN+iL3rAwMwPFSSDFke9h+m61YKmYLkjxU9b4BJ6tXn9va2/dCBQO4?=
 =?us-ascii?Q?QyaCAogQ/gNZkHALMYa5OMnUdok1T2YzqFnfQyhMKdMKNnPY3sLrn5ZCtPU4?=
 =?us-ascii?Q?0Nk/GhIuH0ISITtglEHdgKp9l1xfAKFhxffHf3qdhNT38E0Qvu9UKXIg0tbD?=
 =?us-ascii?Q?so0qMesZmWDGSnKtltCjPmFwOo0nYow7arXQi3d0OuO+1yYMjWbd5nlteHoi?=
 =?us-ascii?Q?E2uiOJppLtojdwz+jSFx0HorDgnhBRdBahk50t8iljVJ1ZLwglFAsbxnUHcu?=
 =?us-ascii?Q?bhryK+Qa5dFNXIL9YcxpKdDMmkcu+eA278D5Rz2dXYv0pdf7qo4M2ZFxpIVN?=
 =?us-ascii?Q?ShYQM82PhvvCod7RJRQB9GILSZo5WxDyRh94K+qaYSEZ3AB/rVJhLZCp5VDD?=
 =?us-ascii?Q?jB3lcnqYSYQHg61WTtiRRqRNZaAtKJO4FSFmmDUaMHeFH/HRNnlgwAvX189x?=
 =?us-ascii?Q?ELNAQG1VWmldryRl4teadgtwtn06YAdI+NzOhU7AaOeU0IFDSynUPKAfZEAQ?=
 =?us-ascii?Q?gpKhb3MOL88gcOAszOm5CyIj2tcTsh51ZNGwnsRqO3OO2Zy6GsNCdnQSMz1Q?=
 =?us-ascii?Q?0jZFCDVr2XiQc7h581m2yEt1KNJWUg6sk4zaIyOLqC0CdK4DvZECNoxJUXmB?=
 =?us-ascii?Q?VwZXPYh37mM2CIDi96XC4bmOiwxoY9vTYBpmeRC6HyGN3atGUCx8BYSL7gDp?=
 =?us-ascii?Q?1PaES+3d529dYfbkVkex3X8Q/oi4DGoAtuge5MI3+Ya9i/r8+anZgzEZqBxE?=
 =?us-ascii?Q?m7bfMZX3Pt259rZ3CUdRXxb/Azhv7ObVawU2xd2bE44FnexVJT1T+PPi8Hz6?=
 =?us-ascii?Q?lsc2T8I8fXUof4L9q4EIWWXxL0RIcbJx1ioW4pM+QWewWCIMddiytxLYcIl2?=
 =?us-ascii?Q?6aepRgSAnpfh718x+MvMYKUId6oSrV4QQvzqNHj4EMUxRgzzMvNCklh8XQyg?=
 =?us-ascii?Q?fSdv036hZJ0Bq5F1AlqwzZpd1NIcPtOlx4DZ1x8RQyrdUCVXh8y66wQvmHw+?=
 =?us-ascii?Q?FFBIoqP0mgWi4WmTfysc2+aOZGulznu0m7x5YlCrhQLFjT52lYmcXU4Fixcg?=
 =?us-ascii?Q?TtX/i1dZsf2nkvJosiemHlyebhd+B0OddvfX9meyE+ghRSueaiaTF8RQ1T6H?=
 =?us-ascii?Q?hQJR0gBjTLY6IYtEyHgv+UBsCdZhiF43L3TflDvOC1tv+KFHoSxZth6dc9/2?=
 =?us-ascii?Q?lW6ta0k4TCVmYtMGhWMSZwtYdS5RyzqBDd5VNPGvLunILVx2rbRk/e/K6AtD?=
 =?us-ascii?Q?FFPGsj8xT5MJP1D7LuafQG7XzLvqA7iSAmiTe6PuwRo3bzSN143OHFD7h5sf?=
 =?us-ascii?Q?/xCbldsb3wf92WUTlsnkKJRMqa3Uhg8hHUbcVRmuFp12phLyFEiYShDGdj57?=
 =?us-ascii?Q?dAUocT1v0bSjzPT28JaI9BXqE5IWj29/jEHA4C6S+POTIHoKlXsyv3IlfdKQ?=
 =?us-ascii?Q?ue5AHdR0xzMdeDDcrq9au6j1GxGSo0rIDyWDKm8fDJlEupPW+Xi4iA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+hyzzZgKpn59itbaAPYPaGsePnm9NsmowQ1oRQW41tDl8NlBvQyAPPmYeguH?=
 =?us-ascii?Q?SdgDkZYiWcpYsrRECVKmdkVXDvMp7JBUPvdoxwLD2V/lS/7UTlfO3royuKI0?=
 =?us-ascii?Q?pkVHscv1hj49TgRM32dji/kQOnAz7YnExLoG/VS8TlzqgxThEsLI9dcby3SR?=
 =?us-ascii?Q?k/wFI7z/klafxCXZ0p0YCQNfYzKqDsrxADAhikGTZ0BL+0ECbzGUJG819LoA?=
 =?us-ascii?Q?VEih0CiLDIZHFPHMYVcjsDQ8Gqmi6UlAH1m+CtvjwnjI3RRcAku3ag38t1Cz?=
 =?us-ascii?Q?kdlq6lclWyE6IB/WBi+PZBqWbGXXqTLHqEuTwdA8WV1MTowYPZ///ZULBmXa?=
 =?us-ascii?Q?QLO/zGDNSo24sdDxXVYMkGZEN3+aRarVrqsgOE8v/Lb1PJSlqV1i18b0kMho?=
 =?us-ascii?Q?dWmTtHh9cO338gWCKbvB/7fjCl5gG5PAsWZJ5Z1d6eBaMuSnGUgWun0Xbonh?=
 =?us-ascii?Q?UjklK75i0m9Kr0c3g+Jm0TyI6C1O0nWFLaTK95lOMpSFgwOZaUQ6O2uo5FpR?=
 =?us-ascii?Q?a4XozERHF2uVZvxDiGszrX1/HXNrnfSSzBlCzjA9ukkrAPIdnHR9lzSvqt51?=
 =?us-ascii?Q?9lHMXBErUfXVNtf0tvpkzPHWtG8LbI+u2FQjXrK92VJ924efybK/OwE2RfsY?=
 =?us-ascii?Q?QbprbLrISMQzAzIL9/wrFSTFol939G9IcSERn/b/QRI94bqq2N2Px+AIJXmm?=
 =?us-ascii?Q?BDb2oOuHjOe1812SkYNVkPt3LZs8jQ58n1VR1tw1aq2LXhqfyufbZ8ijP+9q?=
 =?us-ascii?Q?39i3c+ZM4xS27zrkumrcAjm6hJD4aYRg+XTKDnP6efwk/fNEdUiOxKu9fEPe?=
 =?us-ascii?Q?3vzkj5Wf8IcEKkPisD9/gh5KUjC84OyQ/n1aIIFWapDpJQU8aEVluJvoFo5H?=
 =?us-ascii?Q?ZUNEgepqZL/fDTYb9PqKEHyJpQkCFCCUCfG/jp7lYX/hggh9hr0OGqzD+9Fw?=
 =?us-ascii?Q?x362l6ZK3N3TK3IzsDBVivDno3MJofdQss6QKDr+EeUEaHJ3iXG0tFrA1GXj?=
 =?us-ascii?Q?x3/yuu57e2hVzlT7bK6U62ooeP/TLsBkTY7CTFivecVsiegfNXXTsQ1jycFm?=
 =?us-ascii?Q?FsWXb9fSRo+NHQCEDq1AWQHzqRz2Dj/mqJhIEjZ/adVVYvDqlmj2UGjFBz5q?=
 =?us-ascii?Q?TbLRGH7LJXUjNtxRBjaQw7JMMTFx0p0oiUvNbHjtCXjwFwwZAzse1BQb1xY7?=
 =?us-ascii?Q?qLBfI+4KjCBybJa/HKCuYrrjY5L98ePSJrL6T9IsL1hBRCINYFLseuzhwz30?=
 =?us-ascii?Q?vXBs5NF8hUGbrciDtySjKQEi+w4lNQhfvpYPIHrm+wH49OgJyfCy+a4rfP3b?=
 =?us-ascii?Q?+hs7OOHDgNLakBQYbdmX7OJsnAWdWw0HHbPgSmExnawVasZaebBwOS2+mgnR?=
 =?us-ascii?Q?DNotCSGYUDJgYM08fc47o7pw4TG3T//reDKVYWnz3HLSbJo5mD05c9ZHsdzj?=
 =?us-ascii?Q?rtYQD5WXU77pJvNNZdRRFfb6vr1VS2A13YxFZGypUTz9teWDqzIiEBFPQYjj?=
 =?us-ascii?Q?Kruu++uUXjwE8VioO5l/YIkNYjhkk1Xt/JwHoITW6xyiW8bQL3tFtF+/HKSA?=
 =?us-ascii?Q?l8PQA1BeZ/zPW/HAWtqaHBvLu4QW8n1x9hYyO4c62MaiETZHmNHMd+ueYPVF?=
 =?us-ascii?Q?qW/HxZW7/av7gpM7A6Z6Y4E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836b24a2-d6c0-4383-d17f-08dde468ed74
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:22:26.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba2BHAdvaCtTqYaUTkBr4rEZayg5PlVpUoeUAuZDBRT086Rs3txSCj1WZEYij3wVbcqmXOxORkahts459x1ltu3sdDYMPYb4joIc1E4niTdj8OqGCF24y247rDAs96AC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13225

We have 2 similar functions, both converts date from snd_kcontrol to
snd_soc_component.

(A)	snd_soc_kcontrol_component()
(B)	snd_soc_dapm_kcontrol_component()

(A) is just wrapper for snd_kcontrol_chip().
(B) is for more complex conversion.

Having similar functions is confusable. So (A) will be replaced to
original snd_kcontrol_chip(). (B) will be stay, but the function
name should be xx_to_xx().

And it is defined at soc-component.h. It should be implemented at
soc-dapm.c.

This patch renames it to snd_soc_dapm_kcontrol_to_component(), and
move to soc-dapm.c.

This patch keeps compatible by using define, but old name will be replaced
on each drivers and removed from ASoC in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 14 --------------
 include/sound/soc-dapm.h      |  2 ++
 sound/soc/soc-dapm.c          | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 54bfa0cb1085b..48e45cbe82e53 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -286,20 +286,6 @@ static inline struct snd_soc_dapm_context *snd_soc_component_get_dapm(
 	return &component->dapm;
 }
 
-/**
- * snd_soc_dapm_kcontrol_component() - Returns the component associated to a
- * kcontrol
- * @kcontrol: The kcontrol
- *
- * This function must only be used on DAPM contexts that are known to be part of
- * a COMPONENT (e.g. in a COMPONENT driver). Otherwise the behavior is undefined
- */
-static inline struct snd_soc_component *snd_soc_dapm_kcontrol_component(
-	struct snd_kcontrol *kcontrol)
-{
-	return snd_soc_dapm_to_component(snd_soc_dapm_kcontrol_dapm(kcontrol));
-}
-
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardware
  * @component: COMPONENT to sync
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index cd02fedb2624d..ed39458b94bf9 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -719,6 +719,7 @@ void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
 struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *kcontrol);
 struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol *kcontrol);
+struct snd_soc_component *snd_soc_dapm_kcontrol_to_component(struct snd_kcontrol *kcontrol);
 unsigned int snd_soc_dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
@@ -732,6 +733,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 #define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
 #define snd_soc_dapm_kcontrol_dapm			snd_soc_dapm_kcontrol_to_dapm
 #define dapm_kcontrol_get_value				snd_soc_dapm_kcontrol_get_value
+#define snd_soc_dapm_kcontrol_component			snd_soc_dapm_kcontrol_to_component
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f8ecf86a3d2b1..d74c096cc2084 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -900,6 +900,20 @@ struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_dapm);
 
+/**
+ * snd_soc_dapm_kcontrol_to_component() - Returns the component associated to a
+ * kcontrol
+ * @kcontrol: The kcontrol
+ *
+ * This function must only be used on DAPM contexts that are known to be part of
+ * a COMPONENT (e.g. in a COMPONENT driver). Otherwise the behavior is undefined
+ */
+struct snd_soc_component *snd_soc_dapm_kcontrol_to_component(struct snd_kcontrol *kcontrol)
+{
+	return snd_soc_dapm_to_component(snd_soc_dapm_kcontrol_to_dapm(kcontrol));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_component);
+
 static void dapm_reset(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_widget *w;
-- 
2.43.0

