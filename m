Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B9233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821332; cv=fail; b=QeodAx0hGW/K9d7YyrjPyW5Iq+dO+uTuz9lIKEgn7ycObdNMP+RAfqUD2Uby/lTKOthSKYM+mfjEsPfuhWIJXlIa5qA1F51Gru/S2BSJZd94HumZ4lA5n69t28MwkC9lUWaSAs04nQ3uVZSf6zc3FCVLiLD+oKATgEP9NQ8iaEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821332; c=relaxed/simple;
	bh=lTM+8O0EbZFB0uBoGiatO6r2dJkInKZuv9stIE5BTGY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sf+zL6P7h+s0FH2Bs93Nz7/QXULN3zm4U0fN2V+WSmqaCckQgyLdEDIpMEMzuSxCioqQya49AU+iVftIvnjZgwe8eZM9qf7wYVZaDVV8XAvYfdr+Fsj6AmsIQpSpFWKQbm002MWMZ1CfKSPG0v2/B02mwgz3ArjS1m76KQxCd1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jrpfTni3; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jrpfTni3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/vtq8eXwimSj99utmAUUZgV/c49dlW1AkIV4Ed+kXruGog4KsS8kkkdeNyf3dPhGDe0jwUee4zyQn6ePEVgUr7O2NkYa3EZeKH4Q5KAjR2HJ5xb4pG0KVB8p+T7rT18HKvocFA4XpKYk5PRlEn8Bg6MZiBjOV9fJIdwZcI0GzCLIOhTMK6IZU1SjIj6ENVD1PvYl4x3PlBbpLeMjNERjNL+jE3SWhoH62rafXfIBgB8FG2w1WVW0S8JrmWyYR5gnWeKXR7ta7c5ZJhIa6M1REh5Z8hHtrCKfkGVMxLA29ONw5IxQAplk2aYviDru6+DDzyEkmKxckfRMaYT3taulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzLIDVdAiNWz+tq8B6fywVpK4qmfpNqrfbtQomRuWU0=;
 b=SPgqgrB5s2sKGMJ4NLbu3XsryvBDX9tHynArEGQPtBgJ/DMQB+gNNKa5xo9TzegwOm7yyK85GK/+M20CGro2vO3dyKgrQz0G+KPwtL47pr4vy5+YoWgFNw5q6PWRIPPmX5WJGdMwg8pL6LJw0ld+wDHO2NBhcNLHzGVrlHcVtBOsGfyo1EGX5WXXN5Sxn547/4wzZbd8WwKPsOYLgPVUZ5GzLai55ITzETz52UXzlAy5FJkMrVdrvUmO5/veMdhCdinNBKKKbzLMHdsXULyeWszEhGjat2WoV9I70UuIC4ncsR4LS3ECbuSVGVBvOKwnspaTLpwWCMIumJFUvf/hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzLIDVdAiNWz+tq8B6fywVpK4qmfpNqrfbtQomRuWU0=;
 b=jrpfTni37q9GKmY4nxKi9CrQ0mb1zY4NJeGwMjqtpRPtV75rWq8g/ArQD06x6B8x+CR+28q58VHTAhTas/3oZYl9jn+0gF93wpc0esR9nGzFHWmYGMG4CTf7jDBn8/MEvF9UB937LXQUXghaW0fk/eVyDVKoaH66pQSR9/B8t9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:26 +0000
Message-ID: <87v7jhtnht.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 261/292] ASoC: sdw_utils: soc_sdw_dmic: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:26 +0000
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a4f26b-a433-4a62-bf7e-08de20ba356f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vsz506GU7VkGOqolYKiLRH65C6HTyMtDxNKUrkt9Twc9hpx2VMyt4jJA+zy5?=
 =?us-ascii?Q?27G8XuBzfjInoE7qM9iJDIJDGfeo/Xuc+cBQjgAL5KqcBtcqd33yuEi3XsTG?=
 =?us-ascii?Q?DvaYs/mLi2FQ7GCmQBciQEqhuzE8XYUsfuCJI2UYzZEF7CdlY0QwS7ZU8BjK?=
 =?us-ascii?Q?BMIO+GH7+SDUh0xDeDL181W9mncBHdt8O0/uZVDCmJRH/R2Gg0TWOAlRwXjN?=
 =?us-ascii?Q?obDdEv4rTFpKFgpgIuxSHUgWF5bmU0usyYpWhhD2dNm5S7G+AfLxjEHeJs5e?=
 =?us-ascii?Q?5IJjQ9PEDKgf9I6bJP941PAAhPTYG8CBPIbEWiMthotyUHUpjeQQxMxhFyAa?=
 =?us-ascii?Q?3l1QBGgh4i1unR0UeTnpiztM6jKJfuFA3anmR1j7yEO5TyA9JnGEpnjsfL+4?=
 =?us-ascii?Q?/S3i9nON/9+aZwAADncsanoUMn4RbBfiE21kwNKxTsNmltGAjWVHY4VbeUK9?=
 =?us-ascii?Q?u1QQUVFttnu0cSKQGgDIO3sPM6TuznzV/BWNapR5v1rRQNsitoOd3LoPnbZA?=
 =?us-ascii?Q?6a4Pjgb1LXOoH9b3uo6xbC8CdRueudUi8izLfe5yBGts0XwZwVxcCmrTxwdi?=
 =?us-ascii?Q?hIE+OGusrtJOVbDnBVkIqCiEjb/u6YMdyNMYvmTy6GVqUvCEEIRPPBh9EUO0?=
 =?us-ascii?Q?tQpA+EWZoKX7NAvg7Iq0ewOZ8nud+x/W/bC6fA2A+o5k7zrQygh36nePDaII?=
 =?us-ascii?Q?qW/ezQNakflLw0eaB8dkwSzDSidIkxEvqIwbM1iZVHncjf4ecICIr2QATlhe?=
 =?us-ascii?Q?cR3D59NbFFpLf3RAQXYu219v6Tr6lmtE4PBBzzrXE9/nsJ30jbZk4gHdg57i?=
 =?us-ascii?Q?WHrFTvYcOuCqkdNqsK8zy5GCpjkgYuJrdo0DJMdKWuyfDAX8sAShBgYrKd50?=
 =?us-ascii?Q?NUyBrSzs3rEBenMNN30vAt+dOmxft4l7RJ5J85ad1PeyKU3iVAIw8513dHhJ?=
 =?us-ascii?Q?AOrJsxpritXNPicVHOyNa2bLvtZLw1TwcYB4BPt78JQArrAjmQSyRY+UbsGN?=
 =?us-ascii?Q?viwJybL/d+66eQGdtVWStK3FFAkNRVTGJva5gplm5cLmvUr398b9Vtt8C+NK?=
 =?us-ascii?Q?H+H5Y1pxkhSEqT9IxyA6khDAbMQuyHPfqTb3+wfFLZOp0ikWte1NOdMGU4xo?=
 =?us-ascii?Q?lHbnno4Cz5vKUOfPXSZwvK82Lu4IX4/63k0jTStlT/j2uITEzJQTtepBWmOx?=
 =?us-ascii?Q?QxltLInryRyYTYM1GvfJBwtERkmGEgrLgQSIcWPBa6EGN1WMwVGzRyokU6AZ?=
 =?us-ascii?Q?JmiJTLv7Iod895IbqZle9u/8aFb7nkEKQH6pPHxZAsrkyP4QNZ9KqP3Q2STi?=
 =?us-ascii?Q?rlSyb0cv5ip4edZYIRXUVk2vmDKn6JNbHwoQIFbUFpUvhMSvNESDnK/kE4Zq?=
 =?us-ascii?Q?QeWCt2wm+l2T64WenwK5A924OGVJeE8zrVyuX7nNhEt0U3TUPoNEV/IYMyTZ?=
 =?us-ascii?Q?qjpkizSaPtYNnESd1zzxtVUvWfeLiiiA8KuRxA9Kww3e1cr+g/YfY18YUGYn?=
 =?us-ascii?Q?IlL/HQ+p3WijVuYd0cKKMrHTi0zAKhRzMx+x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mMIy/uFa/9f//xfWGkFk3TzNih7oGE0C32zmuZSoB5Dpt599ZEdpUKML43OH?=
 =?us-ascii?Q?eXMwD3S8jNdh3jeHKX1HwHG9zS7joQBdsXW5klmWno49XMVPuYMwHQlufrkh?=
 =?us-ascii?Q?ENOhB/lqvW0UTeWfxtHAYOq11H2+xDudJagVl7FxwhdtudN3S7z3I34Iyorb?=
 =?us-ascii?Q?RFvsZsRvBRIqOwKdy6GFwQnLZySjkHmAKvLXlLIB9AChi21Ho1ltNca3rJJQ?=
 =?us-ascii?Q?BKVQcAXb4bGsoifZKQCcgb2Bn6Hr6NaiiGfFkX5LmukT9ynqqCcG1xPvnmZy?=
 =?us-ascii?Q?Qc9Z8pQrOv36hwNHl856XHbv1yY/NknsffjT1IX8XexEimq/sbPRY+aE5wZP?=
 =?us-ascii?Q?zIues/kCtJTLF+aOftp8Bb6IoovIw6qdjHDKaH6KHxAwKpPsiEVlYFmr06BY?=
 =?us-ascii?Q?GeHhn+UvHrzp1ea/0GHatS1z6Gihwq3jPvdeeT3Eab2HH7OsoM7Nw6RK5C+2?=
 =?us-ascii?Q?uVV8mBa4d/zPVbjCvVD5mqce/7DxXQj2+Mjc0undBrLtgBCHDmqTeDVkZQGD?=
 =?us-ascii?Q?RpLSSGCZICC/6WKiZUNEmEGvXz8fybvkElqltRqgRMJ10hubnUIUMK+OS3Iu?=
 =?us-ascii?Q?2dPSh4mlQkLcpD446TbcIazlvXfF7jon65l4d/oJi6O5le+Ie4PGTIzEOgpG?=
 =?us-ascii?Q?J1DXFT27gkFMaSrb+XoR5ecSzXIuYqljJiXvUNQMp2tAdM0dlsl1RdSbrV2A?=
 =?us-ascii?Q?1EPauw2qYuGL+WMz4lGr9+/d3l7gH+A3zx/QoSuc8f64PZJ7mMGlCkGCD+ju?=
 =?us-ascii?Q?C+ZmQ7FhIZWo36g2bh+fUbe/EX1hmeyTFk5QI0cbI3KvKyGXpejBYYufJjrz?=
 =?us-ascii?Q?J+OvDHP+x4vRB14Xqhy3IeHNG0TQLMGoXTRqpyJOO/wfeIxE2IGiLcHpKjLP?=
 =?us-ascii?Q?QgeAwUYZWCWrW5psnDO7+HJviConwF66fgoaOqZv6kH953GCWTUIbZTyiNcb?=
 =?us-ascii?Q?m6MR+wWVGdvLiv2tW8cWxigspfLg1L84lS6NkHdsGKLMLpK4C7fWrVNZDdIm?=
 =?us-ascii?Q?2MEG9EZp1WXjOcVAb4NLu1TJrP23XUTLm5OoEoCHNVt4NQGvO1pIR+FD4pIc?=
 =?us-ascii?Q?X+ZrrhsvaPa5heuFVxiy1pRS7JrNH3KCK5HgGXWMNgOebcN7JYF2JIwaUhBS?=
 =?us-ascii?Q?KpZlQyZJWzKuE4HR9HTw03xpW2QPAUzCgdMXa5r0va43Qx+B2IT0jYltRsVi?=
 =?us-ascii?Q?2O0i7JhSDSh3CKkaribmANyE8zR7FW0co3QXvIBzOvqvo58bmh5QjlxLJ2P2?=
 =?us-ascii?Q?ic/5ZmEnoV678C6QQZ6iP1KooMO4JGmCDVCIovBigiWsVjOqxfRP6HLJUsot?=
 =?us-ascii?Q?F28dU0HGu+jCt0XRZgd2kCvRf/886WWQkigcS8EGJUkH99EBDO0cAWIgVqpG?=
 =?us-ascii?Q?Hjh+uqbxhuNze2wl2QvLb3F0MOurRq1YFJU2NRKTbsk//TgETlVYgyy+mVjR?=
 =?us-ascii?Q?RhRXctU5pEZT7EnHgdXBzZMWEan7rYKBQFHkInTz6+Ah+YZR2ZCp0BqK0W+r?=
 =?us-ascii?Q?DZa6nqqo48L4vti/bY3wNrIxdlLBYOSHGEkJQ3wrsK8bFUQNd/I2WWIx9jZO?=
 =?us-ascii?Q?2R7e9Blm1oBP1stDxCzZ1znC0XkvKjfYVdR9P2O7a/G2kG4Zq7ZctOBHBrN+?=
 =?us-ascii?Q?n6SVvWxCGeXrmmKRcGLUBDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a4f26b-a433-4a62-bf7e-08de20ba356f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:26.7029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agOswwHBcikJH/lvQsSqescDGWhlxB0YHaA64MI3SSBDOJhb7/kA3ZTCKZ2+1dmMH4gsaCSyUFmceUbfQL2O+MBDzUFULH2Sj43BwRfaRgmJ71aGp0j/ZABtNudnG26q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/sdw_utils/soc_sdw_dmic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_dmic.c b/sound/soc/sdw_utils/soc_sdw_dmic.c
index 0d8fce7234a73..6075cd2354521 100644
--- a/sound/soc/sdw_utils/soc_sdw_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_dmic.c
@@ -24,9 +24,10 @@ static const struct snd_soc_dapm_route dmic_map[] = {
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, dmic_widgets,
 					ARRAY_SIZE(dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
@@ -34,7 +35,7 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+	ret = snd_soc_dapm_add_routes(dapm, dmic_map,
 				      ARRAY_SIZE(dmic_map));
 
 	if (ret)
-- 
2.43.0

