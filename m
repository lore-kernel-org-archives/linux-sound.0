Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7021D3CD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821177; cv=fail; b=S6MhMlC0dH9MG2xSD0y/Gso34SGCdwkHeZeq8ndqmbftnpsjFqXdFYEiH8r2F/SFhAK+7q/bMT0KwvGASMNeE4EQXFPiPPPGEPnj1tkIALfM26EocUNzrwStp5gB1g60QDKg5nwyiZZiRTNG7PcSJ2WA+LzXxSqS+ISs53T+V5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821177; c=relaxed/simple;
	bh=0u1mdgmCb0WAVHGPUTbtn2zEJInMknJyLBlRSRh1yfU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XfuMj9fqPLYomBX1mrvvByvfscVhboMz7VrnzkK1VcYDSPwCyUmEFb1U3HQpXurfQkkAu9cAlFwZdHm12wkcLAli5IEXhMKai16A5FMmewXf6JB3L8as0qoKjOmBx1U1aQmggXFs/yy7suEtVymzREBm/pyWyoyqUDNr+cbljTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l+AWG3tk; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l+AWG3tk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4fBtfIyEMxH8A/64MV3SwDZDLF98mbymi3gqRYze6sUh/XokY/HXlSDqvq0EwuulYM67xXRCoxiu5T1A0wwkr0YDVdbMptN7PawQ9bbWofqwOqxaUNgnMKC7D/lYzCb/4HgwZ2J8hnO1UAKSc+7RUzGO4cWPxAfmXIU+grYDesEQDog186jQGokJpY3ZsUpDMU1DanKaXbjWHbHCcHOdlkxAAP4LFKkeCFVJAgjYOnK/WHYbasgMPDrgzNNv7g+T1gSY5X7SKqSfB9OT6g7n6Z6zRuQ9V6rEB0WtLpfT9u6LCsNC62L+HVynLBMsihp0dHcJMMXArN9GCj12QuRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6HA8Kvgk7Cnogdd+9WpiplmbwmIPQkOAE7cU9TWqN8=;
 b=UCTVM8ufVDMIt9dyqKihnN5fL6UloAnND6rbOCSgRHpCN1oDDhUUr26OFodtNsmvN3THIaRyn+/W3Q3fadKINI8bAGB13g2h/pivoMfLMJ4YbVoDflvVnSshAT3cIhud6JXvz00IT6QYjsuy5Y9TZK+7QwO8rXPQ10R5gLqfwUkacGYh4+anaGreNWDND3uqaL5YrJRJ+XilUVlGwDIEEkoDBU3gJfnSj4cplsbswd5R1ez1MvXWeyx9OWwFD3vvebALqDVeX0oxYRQVr6YzKYiTATii6nQoIuPdFxDoFWySo2dt2gBP3NCqGwgiwnJB+rD5FUv4oXiqaRhPkjMP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6HA8Kvgk7Cnogdd+9WpiplmbwmIPQkOAE7cU9TWqN8=;
 b=l+AWG3tkDjX3lLbkhVqwsoGUlH54UexzsrEArs1/6dOOJUANL0daowv83pl0rEu6Jr1Ulo3oVpHb0Prh5/qQy2BH8t8QrLnB9850RM+Q0BQq0Hy55hOAe3j0qmbQQ7d2XaQST0IaRCaPubxBUGsFXEYmsA80b1jenNSMQwjlFFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:46 +0000
Message-ID: <87o6p9wgr6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 216/292] ASoC: intel: boards: sof_board_helpers: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:46 +0000
X-ClientProxiedBy: TYCP286CA0205.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8033b211-cb98-42e5-d100-08de20b9d5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yTfpPAe/UUF9l+PSLMBw4lJupXQGfQ3P27UQ6OPh3Rdqna6iibc+rGbqedtg?=
 =?us-ascii?Q?WhTVXN+lHK7W7QRv3m8I+qLVrA3cJkxKqo2xoYyfRz6xquMVQr/tQbwjD1DB?=
 =?us-ascii?Q?EKy9H20aOabQ69DUpgGnlmOZBsAkl7ifHZ2LyZ8MfzU3QSSU0t1/7L/e0TZ3?=
 =?us-ascii?Q?9p2K5bkcfQtOXZ0CrhazkWmqY78KZ/IdEbnjmL6DBHybjVBF6H2MmDN5DenO?=
 =?us-ascii?Q?/bmsD0IJD3GoOyP96J71nch1mjoX+9YX1o0Wffhu3/taOfiRVXYm1mRXFS0l?=
 =?us-ascii?Q?xK9a2iUMI4ZfZ9+Gx284KSA6QwTQwCFtlEBLwTqDY6arWKChAADoBu7zCtkP?=
 =?us-ascii?Q?U4ORKO2kSRJh7WDJ3bqRhZvHJ+ZJmF8wDoLBa0r4OHUxE8rh/KPUktGLpP/n?=
 =?us-ascii?Q?yWoiJZrfzs1PaE4NYyUvFXiM0cZyOQMk/W1MyPi1DmLvKnewr0lublW1lE/7?=
 =?us-ascii?Q?hRoWEcMzAiIxyXcc0mu1TCFtZFRcskDp+7Wl1pvf/SkYFjilfB58IxaAlqyO?=
 =?us-ascii?Q?wawakCZl/bDlctvu2qfXMvj37E1C29RO/u17FUb1RBe4F4Xpy3/iwV9FbBlz?=
 =?us-ascii?Q?jEnzXSjzw9KMBst222kSRrW7Ma+p40TU//HySdJbJQEr+boKW0j4cs/te2Cn?=
 =?us-ascii?Q?v1eBVNMPeq7CCCamFOpN6YqfLGMlu1Uto04l4Q3QivF1nDw0GM7eI7teeVIH?=
 =?us-ascii?Q?Ny2/EoWKeAmx6l6D1c9huAQEoqMVDDgZGR6O7+22G5sS5goqfB3f6WEdS0/L?=
 =?us-ascii?Q?eLjt1Cmp0c6/S+rAWrJgyoQ5n+1PEm16k/jCpJD4Bx3fGPTJqib61v5M+uHE?=
 =?us-ascii?Q?eD7XSnaVMjfetn+ptGyTCEGH6mlpTuYCCJRP+/Tzw//OBZiiqP/dQEpvNpNz?=
 =?us-ascii?Q?C6QR/1CFRpyI8gwHZA2qrAUH/1RqFVB6DWUEeG6ueHLZ/MvM070PX7WSUNGc?=
 =?us-ascii?Q?dGy6XZ715PWQUuoRDy9sAhWpN+1gYw/XMy5rXt9ueNgPxM1UdIh9OpBaOZWi?=
 =?us-ascii?Q?92HklgN3B2IgPqrtwX4AkT4rpwDtXdClW0BCKfcanNPcunVJiLf17POGMFf5?=
 =?us-ascii?Q?f1vOTyFMi3FWohqx7oNPXTIIjv9swb8GnD7IgegM4AI4ZU/HNvyNs7WYIGky?=
 =?us-ascii?Q?z6DT+Svx1mt02ayNsHk8RnMWAC+73yQN3DAvxo9g8pHKhWCY9MqDZ4+FfMGL?=
 =?us-ascii?Q?9hakcyJzSOSHwA4QhtD57b1EZG47eW+iJL3nSD7rsKYXMwDON5rwYsBC/dd0?=
 =?us-ascii?Q?zV5714mTUtXzXFhEhtYoaVgdDcP3YfZr9wzNkn6RqxHN6smm2mzwHiVWxJM3?=
 =?us-ascii?Q?oJcI6AVNhjp08VUHzHV/jKzKijcySKTOCYhnuAh5GgZpQk6ypN3HZA0js2xZ?=
 =?us-ascii?Q?eYhMIQAMn8LMAbKsh7q2o80evxLD0BBbNHxn+ygmx8LiqPjfrOpn2J0yFGCq?=
 =?us-ascii?Q?6+PlLJRAJiwkDuMDZnB+EyQ/eluqhHFlAhDUB32ZWIkPN/joynUiexzf+Coq?=
 =?us-ascii?Q?NT+aSMgYTysRqysz1Ig8qbSJCEn+225T5JSv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p0M9RKNAoiMZL/6d0ST0sEj2rMbxdbseZdvR4nGN422YbHQiJN+rT0PW7mCn?=
 =?us-ascii?Q?S8CzSxLNXZfm7rTpCvNUSwHD8RQapCGDB98U7yFGv7t+IVbSujg5m57a381j?=
 =?us-ascii?Q?3wKlaWuPTZEamlMY5f1sWjUWbHiXI6WrGqhPzcgdMjj0i8Z+CCIz13NXyiy7?=
 =?us-ascii?Q?8IN0hWqgDnHTMqn+CFC1M1v8TtVPn2HnOACoCB/BihbjfYB228j/6/U02k79?=
 =?us-ascii?Q?KLo/QcMAyc8IkLazwtqjQGl+YD0zEV84vmkXtyccegAPgh6Pqdr8pDupyDST?=
 =?us-ascii?Q?JCzZCDB6mQ2sBWadXl/V7+R6jUe2/bbCB5oJl4eHVDXQV9HzCAUw6Yjd9jJm?=
 =?us-ascii?Q?MsjhvJXFyvk4v3HKGh8Sc+a7QAH/aKDx6wZrgrHy7Uoe3O/ioPYxwyg1U5N3?=
 =?us-ascii?Q?Abr4vOesTaCSCQfSDr14aIf7zdaZOUithpIdcJD8G2bNgXu/EBWmhkJibJCX?=
 =?us-ascii?Q?bhbgwVTTp10eVWCFTkDjKvGaJxntKIlSbmaKMuoTrZbDrCc0A3BUa38uPnRH?=
 =?us-ascii?Q?zHrH3xBRgm2XsyTbyvc6FJ9FQEeqScdtXmv6vnBRUqm7taYVahS133wqdONr?=
 =?us-ascii?Q?snIQZuioItgo8Oc3L5QFjUgs+iPKbVNTGaP8JXinEw1mdDzVz5Z1SW1r9rkO?=
 =?us-ascii?Q?NLp6gH/ioWqY8ziTWrp2yf/aS7KEQSvgs6MwfHwq63l3Iutk6yn8+oZAji5K?=
 =?us-ascii?Q?5bEzPxFWKdlJ28ayu2Quh5qmwJwMgoNJsTrpQbOUT7f/wolWgjIwrUZJXAWQ?=
 =?us-ascii?Q?iXEHOMr4kZ/PkrcG4Uii3BZkNFK0r7fHEqVEL5SOT9W4L+aqVajkHbhxLVPH?=
 =?us-ascii?Q?hGwZpCmvBQpQCiMuqDafPoT+ewfBF5/P5gQMLJrDNDZsQFshOjJFiCH6KEra?=
 =?us-ascii?Q?BWBG8ta0bOFMloKXsB/3M42Bsh5h+rjHtpqvEKq9lm5ElWJrXVTq+LEyw0Vl?=
 =?us-ascii?Q?bwUIkOkGSeQI4CaancwT7v4iVc6itlFAxEmI/IeW7mspTUtn0ert7InI8+7B?=
 =?us-ascii?Q?oWIleQDeImBtAR5rfNkJKQwyJJSYptQGdTt3pUZ2fpnXQjBpV2cDursqS8En?=
 =?us-ascii?Q?dYfzikkzZNqUD+KRb7e/8jvCYTBIRxQpSZeF+ERjBUcByRyHY9solB//RxLS?=
 =?us-ascii?Q?pXVqrH8jcIKkv2jq8SeV9QXKSENsM2nCipo8z1FHARaCQ5QFsWv/Vfxv4c2e?=
 =?us-ascii?Q?lzC0K4KufqdiAhKg9M/1habq1H154hNN5yJajcgumQbc0E01qareoIE6wrpP?=
 =?us-ascii?Q?2WuCOxq9x1PyJpHmYD7SqbBwk94bEWJ7efuxs1lPXN9M39augbUWjxocMjc3?=
 =?us-ascii?Q?vGO90PfM2Sx4oUyvCsDMq4XvWE7LN8tjtBSHzVlgGmksx0Y9MuP6XIOtToP8?=
 =?us-ascii?Q?454e3bA0Ink4+uwpDBSKBeAElYraq9ThQZ3y3zCb7BPiNCMiVCsRCdCgMeFf?=
 =?us-ascii?Q?sbnMMX6UX0JTFsed1tELO/Sbm1VUyH8WnvaMGBHNNve2G/AHLySQq3pBLrhW?=
 =?us-ascii?Q?ixepLmRUM8OipDJs/OF7Y2zyrurAZifwPqPx7/mws8nN9ybQ3YeWOm2nWz75?=
 =?us-ascii?Q?qqV1T4gXmpUo81jjEZt78z6UOKyxRHJTl0XZqkRXyN+SmGj5mztfjzzJqW7r?=
 =?us-ascii?Q?qiyRlGew7UzPrw7hhNJXya8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8033b211-cb98-42e5-d100-08de20b9d5f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:46.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcOHRTA+NQT9Xvm5aNASWVpIFIro+UV5B6FU06tqVoLrzSshUNiw2Y8oMN4+TVVICmQwOMvcln3F+lxLAdtFBCXPm/g+EjYDTBprpTT2Mm47qFBIYUxFDuuXAV3JBLfc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/sof_board_helpers.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 2ea1dda446ec2..f741a1e142bee 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -51,16 +51,17 @@ static const struct snd_soc_dapm_route dmic_routes[] = {
 static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, dmic_widgets,
 					ARRAY_SIZE(dmic_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add dmic widgets, ret %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_routes,
+	ret = snd_soc_dapm_add_routes(dapm, dmic_routes,
 				      ARRAY_SIZE(dmic_routes));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add dmic routes, ret %d\n", ret);
@@ -111,16 +112,17 @@ static const struct snd_soc_dapm_route hda_routes[] = {
 static int hda_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, hda_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, hda_widgets,
 					ARRAY_SIZE(hda_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add hda widgets, ret %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, hda_routes,
+	ret = snd_soc_dapm_add_routes(dapm, hda_routes,
 				      ARRAY_SIZE(hda_routes));
 	if (ret)
 		dev_err(rtd->dev, "fail to add hda routes, ret %d\n", ret);
-- 
2.43.0

