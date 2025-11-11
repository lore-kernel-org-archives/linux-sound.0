Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709017E4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820250; cv=fail; b=RMfCV+WUI3yYqENud3s0Zfa6ZnyssWLQqOBZ4q83HXxtde3lhane+FSe4gACzaDYwYlK+/7R0G+x8moPgCw7VGmdddLvOoRj/MRTSeaDFY+S0Aukccgr2IO5gLm26iX9ssfXlf2nljaSGLU1Foo+bLlsVMO56b3Ckb/vxafg/0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820250; c=relaxed/simple;
	bh=o/CoDErKMvoGUL+xhiI/FPXZ5QsIh/MhiGapgNtljo0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fEm3skIwWPq58EBTnJuCs3rAKCCxY+ztRlylx8oNbE+x+Ih7LNhKqWtCZ6Dp6EB/mKONHSNw6rys7tWr+nTVAwgxmdQqrRScttBvuXoOMgNS0KW41OhjWUN5+s8mQxw/Dlk9ruMm0YNvMbeXAtd9EOWJ7oBfDrSYZA5ol7g0DkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cqYMDBp8; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cqYMDBp8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT40v3hXCQ/PVo3fZsdnOOdyWA4VrqezN0WRzWReno5GimHSf4bL42VL5LYAkhfMU3c3/guVjuRLesVgs/KXjqNGyaCG99hBCLj3YtvSqm7P9Ql0MIvV7kCIBMWrpwKnJmV7LkbgYrbXnpas82m1BSEkxZala/01y4KKrMSIdwFlC9Lj+dyAUdlvqKdKsXKG/BR/v0ajNSxrWUioeR/Wn5bch5NePb4jlJ/N9Dn2eC42x9AT1xNm5MxwIt5S9DmDYFjouRXMHAvEkRWvFUFRJe5TiyGcv1HprwrJTnR5qr1jAy3xQ5DgUwMsh2iwKdR1ox9NZqp+/NzUtY6GrfI/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MwjvBgztCoIVtBeLXpOGjBSsICqXtRzr7hCRw5+umk=;
 b=yXDv1+ZWEZFQosXw0mmnMYe6uE3LclKR8Zj+OExEan+iYPoNI5ZHhldXuVFIyEscSVQC6dhsix6wQddbhoOxSLCVYunZo48CY//IKadO8KVh1eqKHk9SvFOhz7JaPPcRJuce5JFonbbMj91Xub+NhasIrw0nOTm5X/kk75FdGlaIxMCYPrYyjnf6T7Oe/PfuJJG9qhOE0BotN/ZMePj7cWTIunSJHytKyjLVT3sCKacJPzsiUXMgrUv5UB8X+eeUWnpz3gJT9V9EjZGIqTTb+ujKjkRswixx3Az/XO+GLyVurdSsGT9ZDMFWo1d/C9Uew4TvF+lNzwuK6U6+Z5V3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MwjvBgztCoIVtBeLXpOGjBSsICqXtRzr7hCRw5+umk=;
 b=cqYMDBp8Vc33HDEircYbOTV9TK/C5JyGfkCHXOUbw5wDZ81Kz8q2Pv1GozYv4zLe/SbIPaXQiVco7uy3PV5GBKk6qEaTInp9VRM9K62SsWLBFnLmFiHcPAS6gn9TSf+BybtrrjtM5D1mLynF+D0/SjxzyQFPnsrg2HFAjHUhfO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:25 +0000
Message-ID: <87bjl9a0dm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 001/292] ASoC: arizona-haptics: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:25 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f01044-1a0a-4e0e-1752-08de20b7b117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dWd+KWjuXxMTg7ZGdR+aiGw8KesHUXNihdN/RZZLL4D7VkPwOmfzya+1jFsa?=
 =?us-ascii?Q?oHfQ3eX33Vo5503n2J/rbxAUVp82Mdzm/93iopBDaCkKoM8kicWc6DADzX8x?=
 =?us-ascii?Q?QgwkuU225ddYZqO6Qn1oufbHHv0oSS8bfsKUm+6Hoj070NY5KFgW8k+w2ri2?=
 =?us-ascii?Q?UW8K28XO47cOrFOiUiscgB8Cey9Tk66upSdJwPcCPjcp6svyhZ5YTSYZfrAY?=
 =?us-ascii?Q?Cc+o1F4XYpexJRQisFbuJmFgsIXNsaYGp6tzSREVPH16Q5QDlOqeYOzW6F/G?=
 =?us-ascii?Q?zhCyzZ2d9KeTflu7z4KJc8k3P3oqmjHzeoZn7AzGEZIv25irdPhHYhB0WNiR?=
 =?us-ascii?Q?gA4xQ0uqLOW8xlXSvhuchJD3vEBcBE3ENiFzWgQQ+zcIwy4cugXi/x/vbxtV?=
 =?us-ascii?Q?LiEFm5tHSKmNbXc92o/hvyQx9Q1MxLtgs912rE5QmJh98oPE8gEicFG11SD2?=
 =?us-ascii?Q?o+6Q2V7DXqF1aP+vqBrBHg4FKkUQ+SjywnC4scducV8TIe/+PBRb7D2TpwxN?=
 =?us-ascii?Q?4PuhNJAT/JCQDtLobt27D+GrQZQXF5tEZ6Bnx6evSMN6n7vFrjnA1rOED/FS?=
 =?us-ascii?Q?zzDcYS22tyXk4EvWU2tFu35crZut4lb31yRoT0wrzdXIq2rG+DwjQwrf3vUO?=
 =?us-ascii?Q?gQW72xgSx2NVgTulxhllL2Z3ge7Rxm53sZy/F6xkCB54usAAHlprMGu7Ksi8?=
 =?us-ascii?Q?IePjgRa/87F1lUcMCB0lCkyqq9eUj1kAksa0YoEOl3I/aUzDngR1pYEaywUI?=
 =?us-ascii?Q?/HrEVWHETeMaoKkNE82y7YJJhVI7XtBE0/QedejN17KvU9Tl4AkgZT9uRV2Q?=
 =?us-ascii?Q?Xa74DT9PuBnzYCdcm3AG62SZqZDH3R2xrNIiPSHOuWZXNVy+mWVRgAf6tIkt?=
 =?us-ascii?Q?e02eO0yFzKiAdplIw3yuahuN0lJvuR6Q/mLBn/8Hh57fPs7eKr4chDbTLGPZ?=
 =?us-ascii?Q?Z4Ds19+9xi2LmP7WkIgKigRNPkptxtjH7QIJ6kLPzk3BsGOqVGixQXv0qQL9?=
 =?us-ascii?Q?qbsT2yf6WjhDPFS6JEyMMPlqmTxaLyTanq0mZ5uAFPoeVPz487yWzI1+bPn6?=
 =?us-ascii?Q?iCfFPd5+igmnYjxmmI8S04qhF7G1C8gUxE/eVw1f17EAyFaA0bjHN1LBUO9f?=
 =?us-ascii?Q?C8kBftpALNUmM8SjklPbtvib/4Fyp1skBgBBUsTYboolillGxUMBG8xizdF3?=
 =?us-ascii?Q?FHFh4n91kZV44O6HG8drslhCqq7T9ZDNGs8mLyhBMfBn3l4Ruvealrv5Hr65?=
 =?us-ascii?Q?FLRlsG6+uip0ehZlxILLGkojTa4fWjfu0RZjINfPgoBmQLy7eq+c5MJVGDMA?=
 =?us-ascii?Q?8OvVvdfHKjhHK2GrDHbVj17li4UXbafMdzJz2/NLGk6W7dVG2BNBVoEC2TdN?=
 =?us-ascii?Q?QCnG2MmuvI3Qi5fJcny4q4ErfbiJ0MhKkke0oqXH9qtlPIe4lIoIGQ9r6QsS?=
 =?us-ascii?Q?f2Wd2v/ihMvUsDuDjW3g2hHqyqy45MiNxJ25cbVhdskqiBcd1ony/UrgUVLo?=
 =?us-ascii?Q?dnpICiqJeVzLw4L3CPKdOTee/gVh0J7mEDfx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gwJAyM4Lu9mlbRC8BOuK8H31u7oo00qk/jgLbIt9f/bF5q0Ga3VNXrFTEbA/?=
 =?us-ascii?Q?DBPFJyeOi6JCwY2430X85fanOQq17CrDGTAHUhzy2DHxjr83zJxnU3JsL0zh?=
 =?us-ascii?Q?iU9PUm39cIlacrFijbHgPW43pYzFLPh76Wl1W4CF2tfU5Us7PcvkdDOYL480?=
 =?us-ascii?Q?7OFXzFXIHHILytn2CHxTPf1YQkuUXyrvMKmsoNEPa7X/YMHk4pztEtAjQ3D1?=
 =?us-ascii?Q?azDsaFwCNVyk/2ERi2QjC1Vtr4SbTn+x6sN2I2k/cumWYx1Fk1CH/ukCoJ1E?=
 =?us-ascii?Q?tztRCezJjkiendS3tx02e87PxWBi6/qvnckFMrNEZbQqaKC+LjmWsj5lSul+?=
 =?us-ascii?Q?zJnvbmQbNfz7uygAj5DjYpxOpRwaBrWoj4YkAl7NXcxY0muBbtU72fQT8hPj?=
 =?us-ascii?Q?EJ8gJTnREhLzBDsJErs283bzV94Xt59yzoPq9njT8N7gJw/IjrJzzuHuP84F?=
 =?us-ascii?Q?+lZ1DKJhvQIBbW2jI1AdFc6WPZJAMSQFogfFw8nppdCFfuBG/uaTCKnlqhCn?=
 =?us-ascii?Q?VXUir2R3VFQpXJzXavlx2j9by2kx2KQbobZzyeBH7EIf/KFUbMrJ/H0HSmSs?=
 =?us-ascii?Q?4yw801sLs3a4X2JT6kgRwRqW42OcfsxnAGbWZQgi9JPowkFC6KDELcOMGA7T?=
 =?us-ascii?Q?N5HmBjf4MnFU+fwbTjdgoRyrHuGYPBdADUxKjkf2s8DnRVxTTUGvcXwroHux?=
 =?us-ascii?Q?FQy13/peN6YXJpurTXMudAP7baWg0M7XEtEs7TDJq3OcTSk5EOrhY1uoqL0A?=
 =?us-ascii?Q?sjL1MKDpl3LlWzgKf/EHlgCF4PkNrcb9TP5NKsCKKDJkBysLctn0+loFMkCe?=
 =?us-ascii?Q?JUnmtY46ns5MXElvCD4yBEOEuijrFz/o4nDDq20yw74vGo0bpwsScrDhrbxq?=
 =?us-ascii?Q?u2CO8/Mkm6CMoxYOuNuUMqpJrHkKHUUcLuCrPV51UJvG6VYjOP+fKPDwTaSG?=
 =?us-ascii?Q?UfZUX6QuTRKkd31ymjWUR646WisCH/GIjLx+3LwNnL4PCKJJXqisqmWQCm3m?=
 =?us-ascii?Q?8emriV3O2Oy4Pi4HK7B4KbrrPMy5fJ2rTdY2WxqkjeSjenDKRiMRH/Ef3Rt6?=
 =?us-ascii?Q?uKGOuaSkyegB8TCwuIsfkmEdXjmTry42qDlS0L1YgcUgU8kye7ecK6wiQ7BK?=
 =?us-ascii?Q?JQr3/ASaED6YlRVvbgm7JErzoLEKWlnkeWeBXcet07JR5iiAL0I6gKjXS4oS?=
 =?us-ascii?Q?0UakuJ7oVwQ2L2mg9kvmNIbIs/mVPxHmY4R462vhIaD4+b5bGeH0FBkvIxG0?=
 =?us-ascii?Q?gLlyeQi+Lm8aZW2lf829xfOnUifiJ3hqUo/0hmURteB2yy7mw6utWyPKMNSN?=
 =?us-ascii?Q?Eyo+rVEp3Fw6Gba4FJfFL7R0gKlL91wSXHZfOA8cAqIc8vGX/mNfZxTdZhRl?=
 =?us-ascii?Q?0/GPSkq3qKe7CVvTw2UdTWJFpO5M8siR1azvATya0R7BY52QKmsA5Lz7cL8b?=
 =?us-ascii?Q?ZovRl9FLUuV69X3P/l8zT5AUvpRanN5G9t9y2aJmUCOJDe9Mgz+MF9jyvcES?=
 =?us-ascii?Q?Owe86kZ183QWssbcluQxFLrisa0nSjazAwAzKaaMK3rCCwyg9nQPvEXEE6EX?=
 =?us-ascii?Q?leJRHj6eVZdy3iEGD9bbjDy8HTnTA4udEPyc/w1EsibqGXV/1wjPxx18Q1Y/?=
 =?us-ascii?Q?39W+xFbPMPMYi3pIPVyZiic=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f01044-1a0a-4e0e-1752-08de20b7b117
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:25.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a3eTVNE9WmpaG5+NIgEPPpVbP54Jw1ecWQJNofe6U6OSs41m+gESXipnpwSbz6C+0uh+pu8EmqQcsLWxvNfq1ZLWDw4/JSgSw0zdyDVdu0L2A1uCQFgXu+Qzj8WsAOa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 drivers/input/misc/arizona-haptics.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/arizona-haptics.c b/drivers/input/misc/arizona-haptics.c
index 5fa1c9438a859..bb1544d63c516 100644
--- a/drivers/input/misc/arizona-haptics.c
+++ b/drivers/input/misc/arizona-haptics.c
@@ -34,8 +34,6 @@ static void arizona_haptics_work(struct work_struct *work)
 						       struct arizona_haptics,
 						       work);
 	struct arizona *arizona = haptics->arizona;
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(arizona->dapm);
 	int ret;
 
 	if (!haptics->arizona->dapm) {
@@ -65,7 +63,7 @@ static void arizona_haptics_work(struct work_struct *work)
 			return;
 		}
 
-		ret = snd_soc_component_enable_pin(component, "HAPTICS");
+		ret = snd_soc_dapm_enable_pin(arizona->dapm, "HAPTICS");
 		if (ret != 0) {
 			dev_err(arizona->dev, "Failed to start HAPTICS: %d\n",
 				ret);
@@ -80,7 +78,7 @@ static void arizona_haptics_work(struct work_struct *work)
 		}
 	} else {
 		/* This disable sequence will be a noop if already enabled */
-		ret = snd_soc_component_disable_pin(component, "HAPTICS");
+		ret = snd_soc_dapm_disable_pin(arizona->dapm, "HAPTICS");
 		if (ret != 0) {
 			dev_err(arizona->dev, "Failed to disable HAPTICS: %d\n",
 				ret);
@@ -139,14 +137,12 @@ static int arizona_haptics_play(struct input_dev *input, void *data,
 static void arizona_haptics_close(struct input_dev *input)
 {
 	struct arizona_haptics *haptics = input_get_drvdata(input);
-	struct snd_soc_component *component;
+	struct snd_soc_dapm_context *dapm = haptics->arizona->dapm;
 
 	cancel_work_sync(&haptics->work);
 
-	if (haptics->arizona->dapm) {
-		component = snd_soc_dapm_to_component(haptics->arizona->dapm);
-		snd_soc_component_disable_pin(component, "HAPTICS");
-	}
+	if (dapm)
+		snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 }
 
 static int arizona_haptics_probe(struct platform_device *pdev)
-- 
2.43.0

