Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1819D074
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820699; cv=fail; b=Inzkk/Qkib0q9TXn7j10fsJ9vmoyPBI0YsY+j7Hd0Ol1kGDCqSXWzKzJKcrOZ3+DYHcGQ7n2QQGux+eWurWfQrAxrqg2mohwMuIjSsGaWS0m+5xh4BeNN+iicySX6w6dKTEBiV4G9RAjurbUYeGyghmu1IOuZ31aNlQdd2ymyTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820699; c=relaxed/simple;
	bh=80LZZmYnRQFGxeupcCyJkDELqO2H+QgmE2FCjqux0cY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rrct8MU6gccVYOfSCZzt0CUStwBGSGeTGyvMAuHq3kbtbLOsUx3+QikS3OUT79ghnCGZNksKUihsQmTw9uUGlXIS30drqmZrNIrJsy84vg1bXpjDMuPPl9g8nEuYdf63YEtyXuTu9w+5gtOKWaPFl4X3jrQONGjwZnsiQszpHXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NGve+qSd; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NGve+qSd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHvETUqC2xjKHRDGcX7Xzb0CR7iAs3vsEyhyUofaD+h+IVLqmOv9Sr31dbRo0w7/OhbdtaVLhSIpnbj+0WKCukPlEe8pihC2gggybIkbj3ZSa4ZjiiLEIed/uF7beIqyxTflWzMk7yMXDoHvudtmOj0aPtm7OlTMzfxBoFmaMW855CC9c0o+pDy4CoTidDL0eA287dyeaOte/QJg48vUMaN+ajQ0hWh9ug5O0dKmpEZIf/UmEqI252NM+SOd2BsbGB3bjXIpQ5OJ3jIwIHltKNiql2V6Qy3qZsxMHkjPbWKfi/S0hBZ2khZgO6gJ1GSN72HX0/HhAhcOxJupAFEpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA/swmh8giP+qfQ3DX/rXIBRq4Nn1tGfNlDm+O/cUT4=;
 b=waPIZPdrMBKalY43ae3z2Nd0sHSLqUESXVt01mZ9/Ys5Tlo9CDzcWdq30pREtpC3aOkKAluIcDxUkCRbzyaFCKEAXfNI44tw1B5XsPYKpq7H5jAUvzfhjQwv/XovfEXCjvfc5GsPGQkBJqHn5VX+t08dOVyaITSNunkTyTVI2Ry28EQzSCy0U2521KlhhsoQk9f7Hssyvk/So2ls0I8pBB/ZDgn6awH8CFFQ3aRJp663tN8ewM+KCMDu5+yJXMbtNC2X5JTCOZm6fVygLqK9O1cBdsIwPrMSkxxCHuRS+2QckBuC/jXlv3pmPTc9Nycj/hmK4+bj6DeluJZ1NBxrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA/swmh8giP+qfQ3DX/rXIBRq4Nn1tGfNlDm+O/cUT4=;
 b=NGve+qSdFz0mqsSxZ5vK4iPrZRt42BPgfPcRk2g1XrbFyclaHFMWYv/8F0e9oQAFgVx+6Q5CEnA4EbJZV+nY9LYJeeQcD/5Wk+J4ddrfaJ/EQWonS6D1apgQClG+ZT8lrdCbT+pspQLp4A0CwH1DVVuSIm7ykyJ4GsjPN5bZ9W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:55 +0000
Message-ID: <87346l4drc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 106/292] ASoC: codecs: rt5631: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:55 +0000
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e260c6-e604-442c-1ac6-08de20b8bd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSb/k2BnwWH8jjrZijoOpyrpqIlCCpVCovNRZN4p3Ds8SwKXmrrU1uWR08DI?=
 =?us-ascii?Q?Ogk7Dd1bMrpvsY0PCS2VD3Smf29ZiB2VFNnJCwEtssK3PWsMQXNHxwQyus0i?=
 =?us-ascii?Q?YgCRduPNbyaINrwvxt8+giHDwhJvVy2BFiAIvich0hjUhNYScF8Fb2IgRnjY?=
 =?us-ascii?Q?uLMUg8R56sNd226bsnt3npKXl/sCaG3iP2SOQytIf1uS8TkLeUzV/JC0Pe1l?=
 =?us-ascii?Q?Nmv3DPGb+3TOxiN14Pxo+o+/B4kNAiUOblZaKfdiBVPMvaqSgcxRH0cbCKpW?=
 =?us-ascii?Q?V968BzvTQNENyfA1TFPZO64yRMDISFd/K6hhdyjJAFPGrbfeASc5/RRWLY96?=
 =?us-ascii?Q?mxurSUS3F5owGI8N1o3+k0mPj3Ygo5szr9bD/GSjcXM3c/xvNs/S7OaBoIXx?=
 =?us-ascii?Q?Rtfz4O7yNhOn/jO5lsdElz70w0Nn/vi1tujvE4pgV3ipYbIq2L5EuGBIvH8A?=
 =?us-ascii?Q?uXQklfXWVM0RG9zT6oOIADfh1+L0V/lrQ5YXI/cgR4GvBda2EL+e2VDfeXWZ?=
 =?us-ascii?Q?YvhBrlXWS43pv6DzcpmPjiaV+s+x6h0iJRx8M0Lk7xf/YCNJrysLVlrDtSPi?=
 =?us-ascii?Q?R8TnbbmykqAiuOr/sObqhvRcpgPhc9HBAYSep924T0QdNpJtn5FgsZAtTEQZ?=
 =?us-ascii?Q?KKm6TlcawrfM1a6GNeEGZBZtVWh9c1bxM43g7ObjGmGf2e0oeCUeLAzXWTS8?=
 =?us-ascii?Q?KC/2D6i6+EZO7OM2p7gWkmPqcJJu6IZD8R8ler0vvcWOMEkltCGfzmKW+xJ5?=
 =?us-ascii?Q?ROQURYG9fQ4yVwm9LTNawUjgm8DE9fSR2JY1JGywzJn0WO6avV+fTnOnYJMK?=
 =?us-ascii?Q?BlHrN5C48R0wKXt0ccCNFMZmZ3VCmj2CIJukPbUx2NB45Hn3K534Q+cBbgfk?=
 =?us-ascii?Q?TbrRIFhjAUESdIz+I9VScVim/NamK2hV0+mLOelrEjS8CPxlqPOWW+WZv1Tt?=
 =?us-ascii?Q?M81wgPicYiQW8r1hFKu3GEZjYH5N2EDLmGGUq2V9MSayVJRXy8tu9laVG27N?=
 =?us-ascii?Q?dLL5VC4luBj2DuucpzGYgjf+G30sCNs5LwuPAjOLG4hAr8/Qhd548F/mBcQk?=
 =?us-ascii?Q?aYnXPDhFIT6KbM80E53pZ8jVJDaYYpD0qqiwtb0rWFfGBjzdrz65nf386/CO?=
 =?us-ascii?Q?bHOKiXuuWxua2+I5yIW1Uj5O3EBPJMsyVFim9sI0N4jNzzwkL3j1qWxmh+m5?=
 =?us-ascii?Q?bKNl0VZ5aH4B8epi+v6Q06AHcJc/4mo+JUV6Xmg7sDIWFuBh2xZOz2lwL3Ci?=
 =?us-ascii?Q?uqoZr75x6cG2G6hydwb/M7VToMhyAYNQHmSMv7hxLAyhlhVamWn+taJhWC3W?=
 =?us-ascii?Q?JNI9lnX9pbC3XrUlGkYe534k6yWuhxNr9/fls5y2DCz0Uoo/FgU5mkAS6K1v?=
 =?us-ascii?Q?6beJHn3+yBq8xwahV5kwGrPl+Mnt/7aZ1yEttl/KU3mdyHsGC0sAD1/0sBB8?=
 =?us-ascii?Q?qd3VfNVlA1Ot9D1e+sSH2Bh1KfP5o2rfkA9nXFCCvQKeAgtl35AX0Asuh4r0?=
 =?us-ascii?Q?VecN9qbx2nj0KouMXOWtV30cNVddKIHgjUFf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hmyWGEHnwey01t0+hHgEhmXznU2/425oKebgT/VpTdsEjkAj5MUTJKJ6UT19?=
 =?us-ascii?Q?jYIaL176EMd/A6zfFsZ/soQRI/yqvkNcNOiblYzPE6/wRTBboaCuMnM+D6kV?=
 =?us-ascii?Q?wp2WANJ3ercpNRFtF4QcAY1PEz/pFy7sEdL2d9QvBb0MjY44tN3g7XzvFP+O?=
 =?us-ascii?Q?zlPBzIpkId+f/+K229rMjqI2p9d+Ac6PBtl1oJBmY6K6rMaBrDixUkg5kdEB?=
 =?us-ascii?Q?9SQyiIyvHk3K/0y/Sj3oTUQwcTxn9ElwUPs7YKY0JHQVQCksxV2z06DwMilY?=
 =?us-ascii?Q?qaxievxm96Fe71+HiBgZZDA29PFqFtFcYS4zeF0alb32zvcki3JrMrznALqs?=
 =?us-ascii?Q?M3OjjB/uwazBhcE/9/gUO1PVFwGMRw9Sr+lYX7Z4z/T/yNqlT5dFK/8qUDSc?=
 =?us-ascii?Q?+h3GWLUAP+KJUw7tK3kkinzwecYDhgRFBOjOu7Nrz3ei4sMnr2STJFPuvqSw?=
 =?us-ascii?Q?YmSIzeLBzVJrVnJMh358nNW4AAE0O9n5P4pBeoAVTxyyRSw4rBTiO9gI3M3h?=
 =?us-ascii?Q?kBdLgJ3EX7k991UIJLpWGMp6LfWILDCh4PhxgaAgJqw7hizEoRfKxTkKmhO1?=
 =?us-ascii?Q?GZONEuWYUQph8OYiw5vvG6eviR8/jm++bxAHkCRMcII81gL9hPl0Z92RXDuC?=
 =?us-ascii?Q?2+NwUBQyeaDoV3aXTSzUiHKYL3rhMaUcsr22DrKQTwICQFW+Q/fN+GgSLxXP?=
 =?us-ascii?Q?aefa8BbgbK2VLmR/CsP75kCbB96rBHUDgjzM1Dh7+s+GnMbLVoLGaffJzSoH?=
 =?us-ascii?Q?9stUuT5H1tYYBUtnbzMj8tb1Z5lgheKWTx+nNrQ2/tmJ15XaGNjvH1eQ9gKQ?=
 =?us-ascii?Q?LDkXVS3m9yjGxclhb7z5xyjjh2F+3TfeL8vyT+cx+VEZquF2Qr6CYGVZ2jP1?=
 =?us-ascii?Q?MRJhsNCVsSiWRcEUlmrWZbl7Bdvoav7bh7ve+Qgr92F0fMF0UtJWCq670UU7?=
 =?us-ascii?Q?I5g/Wtknq97vhC49027heHvXUNInxHX/cPOZzozXGAANqQd0wVZHhMdj3/BH?=
 =?us-ascii?Q?JkoE+qs1V8gprbz2w79gW93ouBAhEBUxTynjCWo0bvm/mKEbI88ahjjW03E0?=
 =?us-ascii?Q?9ac+s1Jm/B7sVEox/NH/VreSLzWf1zLSGI0wVFAq/n/n0t1/qYGkQ4L9sB6h?=
 =?us-ascii?Q?RascWrdeEgr7NArbFhOVIjvE/Oa0AjFqHOeUq2zVQ7VRY2ryhfqXaU3dYjx9?=
 =?us-ascii?Q?hUxicMegFla46qzTrtjdkYyAcDfJwvIV4M7Gr0VNiko6i3RP7fqQd0j2lHtF?=
 =?us-ascii?Q?8CqwLEq9l7AJdVWfZ+9SKQ2MJXPwKoXHFZCPGmFy8exM0rQBcxhgAAP+9jUz?=
 =?us-ascii?Q?W4D9L+1fK4/am80/6YXrU6fKluR2eQnwGjN/x1VBkG9d63KKNXSDpbfBdGyc?=
 =?us-ascii?Q?Z/ppB+I+28Sdzi8HOIlp+sLienOZBtlfs+nKrF8LBNGNaaIKzBazj0eJmwzA?=
 =?us-ascii?Q?3ON5qqsMq/qLGon2dbEnMEi6fOCAlgGPR+laDfcLdTMDVwLBe8qWGG+WSG6H?=
 =?us-ascii?Q?fCbS9bAmlRXDNOuaTx+ZlEWYX6+1SUsTn4CSVKCz6NPHQPhkX4r0SMpInZob?=
 =?us-ascii?Q?X4fRwT1f1/7HwRG0FFxFCLElSOzGxaGqIwwge3G4KMi563Z0QSArAldVWYFb?=
 =?us-ascii?Q?b4iXH8nT/ZnRisGEIjeTMic=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e260c6-e604-442c-1ac6-08de20b8bd57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:55.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAs2zwdJLHm/athYawz1eKlEg7hb8FqSMo/UycVoMmdqqOQ1UfsqVDm9kUxyEdoiMKpZEqOJEmLoaPBrO3798l3Ota5TlKYcwf0jpa0fLU+jZ5IvfFC8Whq6ry17U0dn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt5631.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 616db75b634cc..19c6d8f760d9e 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1535,6 +1535,7 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1545,7 +1546,7 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD3,
 				RT5631_PWR_VREF | RT5631_PWR_MAIN_BIAS,
 				RT5631_PWR_VREF | RT5631_PWR_MAIN_BIAS);
@@ -1575,6 +1576,7 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 static int rt5631_probe(struct snd_soc_component *component)
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val;
 
 	val = rt5631_read_index(component, RT5631_ADDA_MIXER_INTL_REG3);
@@ -1613,7 +1615,7 @@ static int rt5631_probe(struct snd_soc_component *component)
 			RT5631_DMIC_R_CH_LATCH_RISING);
 	}
 
-	snd_soc_component_init_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_init_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	return 0;
 }
-- 
2.43.0

