Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2618A6A7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820588; cv=fail; b=Js+KXd+SKGopna3GZpXxmQvtGEccNse76IpdbmFcEA/G7RQX6jvPNN67deL+aa/LJQSxccT+fC8Cm5lybTtPVh8FfmF8e+2bYZ4av65nCeo9NVk71i9piDP6NSTc/sRE18ShfSk4dTy5p6bimiiE99vw90jojO18m34xC7LWsgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820588; c=relaxed/simple;
	bh=mjJ6BAydvdX/4uFqLYLdCwl8x+qUShzeZuczkAxsN4I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sn+Mkfr5GdKobBpM5MSyhKwzIl+MeJR/rAfMDJOolSGfZl1uuAkmyO50gHC2NIJenqh8Z5lCtsuhHRnqpmyhxYNtUHwaoSBhI6mWzMf1Z/WYIURbfxkE5Es95Ji8Fi6FLi6uaQfeJSZkxnGQgzq17lHNTXxS13NiwXjjjgg7Ocs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fNe1GcPa; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fNe1GcPa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJtxlABaanBI/ml3PEH5bQd6vYLRdNz3qIfex8AEsoMoaX3xDEWYgN8ix0U3o0i48mX9HRG0fanAXIi5VXQ7q3NqsjMJ5qZkYQ5RSYrqEhoiZhiLArK2nTuZrfRnuXCj7Dli8hwBy1tJP8i095IZ2SrMTaw+hYijsv3X3aswvUbbPNGu3gf2H6PvLSSvvJBz/D+6/ed4VlKVOrb+sx2uxm0MgOy88PsJ6hyA+nBDxiYqndlNFc8DtiGh4PweS7TQ/B2sbW3bYy/wySkv0yCVns116TgCBAcGkspvj/hTuiM2WgpnMGPsfmL1xRtBAvN8nbCo7JwsGiRhWiGvFct0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4oev4Fq3FAU5gIkeh4PdApKWmfG9iSrMxPnWSYvx/k=;
 b=sG9h8MzVK29u9PaJUDZ2p3oP/Yy5JDnWKZ8cM1UQWtZkW+MnYWZGPeeRYxFc7IouPXPZKg4c9R74ivvBZt7yH5BnkYNxp75ka9UPs/A6Cb6Xb4AvppGmS0N/qfwyjHD7x5gPGwpAOuyIMDR8cAI2HFRBcAG6rQybVobmzoSx2MvwefLhROGenmd1tnaVwX5x2N1orGwh7jrzcfnwftnoIiElPKIbk8+cjVXOoeV9IM1DMsE8MFqgo8OGcrYe9BFkGGWF8WRfzjzUljFMPGq240/Hdjcm1N6Ljaug6PPKujIL0J9QyKcHZLzVQMF20MCYlSpp2Fd3WK6l2p/TNqAI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4oev4Fq3FAU5gIkeh4PdApKWmfG9iSrMxPnWSYvx/k=;
 b=fNe1GcPacL+bB7UKfW4DIEGev9otqNq2BXwHBTQsuB/qzXwCgcZB6rOyatGDWCXJlQFJWgBP4H+woH5tgF3XNr3zWUj35x5TjLJeqKeDDHqUaqaG9+hSFgoBxsQwa0M35nSJD8HMjroT8TRcdSXlhHVP8VbKV0Tnn3Xuw0M4++I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:05 +0000
Message-ID: <87a50t5sev.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 076/292] ASoC: codecs: lpass-va-macro: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:04 +0000
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 361115d4-66f1-4c35-a51f-08de20b87b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7dpPyAWslErAqt8xh0j7Hbsu9MzCWKjP4a5/OHaHVSU60WZwfvtw7tPoJETC?=
 =?us-ascii?Q?hsKi1GhNord7h3o28dLiiqtQIVLMbctr/6iqb5jpbmtijvzcYp6Lrsi1/Tzm?=
 =?us-ascii?Q?d6xbJLokRrbxsAoQUan+4IxpCWpjxpzwMq6USIyXbpKntBpqy6znFB+/xXXC?=
 =?us-ascii?Q?dI7/gW9+8zMYapeIHmxPoA8Z6BuC1NvG4ZhGZJwjUdUy6tj0VNtdRYcECGp1?=
 =?us-ascii?Q?NLGUYFOE7ZP8vUknLe93sHjbrc1+ElI8JmmO212MH1O5piRkVw+6hT9fdQhc?=
 =?us-ascii?Q?YB1WN49nXV/jrAJlNsI9/Z1WqTpUvFPdFGk4RaDagkw0vld5W4/oKyfA0vXF?=
 =?us-ascii?Q?O20pa14yJMU/vYe5z1XDCmycE0NLqEnPZQ13+mhl8WtYiDApE2kpr0TngYAO?=
 =?us-ascii?Q?yrWXySQPEYP30R6lfJq77k46NhzpDKBXbbGhLSEjlcnT4Ik5gzBTPj4/DLx/?=
 =?us-ascii?Q?nLl0xaofgbOQEovg9gRextj/HZncPk2LsmihuFJB/oB7mxSc0glKFhP1vFbi?=
 =?us-ascii?Q?95+XLGVeBUr7gyoMwPYRwzAb8tBQGvlhGmyO3Ax4m8iygoFfpGi9Rh7Ag3tD?=
 =?us-ascii?Q?vMUEUwKYixyi284oPakzb355tbM1np160R7PupYQh8fRAPFR4k6K28XmorSA?=
 =?us-ascii?Q?TfyVA9sxAzApWuJ73fLaCcuFnp1Od4gaB92OO0UxYualjr8d47wmQbFKPPfC?=
 =?us-ascii?Q?b3SgIY/2H99Nai4gXO2n3L0pklKee9QVXx62TMvlb+QIg67IeHxTIIPPc49+?=
 =?us-ascii?Q?uGUscZUvuL4Ao85gCciM9lmwZmXFz6qHRCgVEnJWS2IGFyZIUAK55Xz0astP?=
 =?us-ascii?Q?V8LEzT2PL97G6ifs12wgzNg9pBR07n+Ac0fcjH2l6F6y4YSKdC0S/f5iTkou?=
 =?us-ascii?Q?Wkah4ctYmHZ3yLOsYicZ2cBAoNwXak6ffoYdFzxIRsOTGlr1iqvSNYIDULux?=
 =?us-ascii?Q?wxvYli+KCuzxSwFJtOIfha5U5bPdvUNj2JlxEbS+TuvZYKc0ou7DZ1Xxdsi5?=
 =?us-ascii?Q?+pFAkP9zZr5L+fxoGJGVjbccr7xl4nx2WMx21oL+Nv6sMOfxJHjauLsyf2On?=
 =?us-ascii?Q?Y5mEouzxgDL7q7PwP/VfVbbnXLGa7FSqlwcgHvOhC7Gos2Tng425kMuR8mV2?=
 =?us-ascii?Q?MjsIDG77YP7XEZGYBNnJFE/vUxM7w+Sh2jDqDQl+gZsmfpcZBoOZrU5SBKw+?=
 =?us-ascii?Q?jX1rJZg97rUABaQKyLmaYZdmwHUuG/QtAuLt3yUGib8+N8eBegsl5T7hggUF?=
 =?us-ascii?Q?y1pDkWmXqx2WJOZpiSZbHLkWVzB9OGJLJO3NJQiVZOi3FGzGt6yF0sDY7XlJ?=
 =?us-ascii?Q?Bdbb5RUqCSaAmrjyBcevcO2U+DJ/Lg7sK4r9or+LNES2O/RxE6WC40PSlpUZ?=
 =?us-ascii?Q?pup2MKPAz513K11oW3WZB0hdcUZ/xXIPBMPSLLHUBd0Z3YsnJN+73ASu08NM?=
 =?us-ascii?Q?30viGDyeEiJjT5997j//z6to1j7hxNDOuzdqdY6rebbebHpUcOgJga9SY5Ad?=
 =?us-ascii?Q?f3pTr+LHAWDNmMp9VCF7E36D8Y0+VLrmGV8W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W2tYrCaMtnwOI4T4ZvpGywyuD5lgSVnNpqHg0+T8ES+OuzQfiI0jOi9M4FWR?=
 =?us-ascii?Q?1xDvLIFPNohlOQxQih+nCKsY7gyMI42fRU8PyTHfjENsNYs0vioRQlLn0kyX?=
 =?us-ascii?Q?dqglZSiMEaHI2MOSFSsRNNAPbOynWc07WLDB8Zm5YngyaEH7Vaiw80v26jB5?=
 =?us-ascii?Q?VswU8O3dqoJtv9KUcQ7G1ugvvo+Bno/L6yenTF1OxJt+0XbLCdMUqraXQPAl?=
 =?us-ascii?Q?MFubdb9GcKyGoZb6MDm7Nv4fmax39wIAq/qYuxWOSrpnatXFstzZ1XwCrwlb?=
 =?us-ascii?Q?SIILsGMGTsq6VwNQDKYX5LpxR0JiCinwSS/NQKHC1t83lmw+SBYL7MEk/y+I?=
 =?us-ascii?Q?+yvLRxC11v39/tfVFyYx8PtssUn+I70xLI9lvrhYmaC1Qw6sKXJVmlHYZK20?=
 =?us-ascii?Q?lUnzCHj8ifWBOQqlP2pt7CZ5oSG2qiYGz+SR9JvmlHCsiFqqDK7GYYByOlnv?=
 =?us-ascii?Q?bAtzjh6u/eMBEDX0jREAvz0rL4TnnKzHBUkjvVvIL3MqQch0Hd7LOk+KhDNS?=
 =?us-ascii?Q?JvM6+x/lxMCJeDLhsUT79K0+98L9wMwApeXC9xMtO0V5ljqwvVFPh+BFgwh0?=
 =?us-ascii?Q?dU4oe2ahkxCmDAwbelLVgpXvFQ7ldEGAr/JoGxIfHbNkzQMEfwNpG2VHwocq?=
 =?us-ascii?Q?fwD+iQt9nMN7B0EH8M4+QyClgxqtv78v3MP3T/CS5+7Pnsgt5u3G43Q9qfpG?=
 =?us-ascii?Q?6QR2kN3z7H46T3ZAi4AfRa4IaG3qZenCm1cSMC2RmanCoFJ4EsixKTBnbZqv?=
 =?us-ascii?Q?rHxe88lRaZjk8Q9qSwci53isrgwXW4q73VCwMjr6rQCtvkjO02CmJHlsF/Pw?=
 =?us-ascii?Q?FiOiK2pR2t/Mbb62o/wnml/Y7zHvcNzKK4lb3nYl3lfkZ3NB5BsC5+laAjZk?=
 =?us-ascii?Q?y1i2VwmJf6MC6CfVsfp/w4CBCjL3/idK8rs4rwB1YYJf42W3zDsXY1SoAhq9?=
 =?us-ascii?Q?FU518YljholpaKngSMHE3P7caRLKqqbraDopQ6umQFr36vd7+5lre9hilOWB?=
 =?us-ascii?Q?suk+pdID5WcuaweVHjgA9IYKmjTmCdH/t4EsllpuYzhRzYnHHAiItmfnMLhq?=
 =?us-ascii?Q?Q17Qf6ONPYh49tcO2ldVLNaH0rKO49bBNa3XKxQG+ZO6cF+u3l2dxeyrnCyP?=
 =?us-ascii?Q?1moNfyropbdHehk4moiYYKDr/01LpMWraAmJzwkkSgWiI9TUcWNmn09q00ub?=
 =?us-ascii?Q?rqMwff29IVMpyplK39tSRUItrmRb6+hUyBrk/CkSKZb1eazpM04NNdfiRpaP?=
 =?us-ascii?Q?3zmujtwkvn+2r9yjRqHDa126MhZRv3sL5QQf42BI0nSLXfy5+5vJ+mOdD+SL?=
 =?us-ascii?Q?VDPgQV4e1LqrirGTKuUzRBTiTrx3Y3KLiewNIF8coPc9p/BPEP0gyahzRuM1?=
 =?us-ascii?Q?G+V1vccNGUlmCsuscE/e5hwC5vuD3CeT334ThH3yPU5WtHoVxi6XNAiAYHHB?=
 =?us-ascii?Q?RmuZhZKyvaV24qSJSiYdtegbtCkBCCGmcmGo7cQSZn/2obC/IH342/S5qn1R?=
 =?us-ascii?Q?KmBfVCoDj1KAG0SdqDOz6f5J5KRh8Lzq7MsAZ+Y9u48UV6PbaY//DGmqBKkW?=
 =?us-ascii?Q?X/NteLSE2lFQeCSVOIbepf6sb1+02rSdZRgP3rU8abnB+MvpTWzGQBBgnaw4?=
 =?us-ascii?Q?82DpvrmTn6PCiDoBJQ6eb14=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361115d4-66f1-4c35-a51f-08de20b87b60
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:05.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9XdFPAVaDUGM73bct67BkgyiXMzjdVNVRrJv0pnpDi/eLnBihr0VW6JTmGkFla5WzqBhbsD2vIDSlbIxpwWqJQ7NiKux2ikHmGwi3uSnUrib4IvCWmje6A1Y4Y2s2KM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/lpass-va-macro.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index fbe5ebeeaa805..f4e7f3f17d8ca 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -524,8 +524,7 @@ static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
 static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -564,8 +563,7 @@ static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 static int va_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component =
 				snd_soc_dapm_to_component(widget->dapm);
 	struct soc_mixer_control *mc =
@@ -585,8 +583,7 @@ static int va_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
 static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget =
-					snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component =
 				snd_soc_dapm_to_component(widget->dapm);
 	struct snd_soc_dapm_update *update = NULL;
-- 
2.43.0

