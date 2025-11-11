Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE4F1DF965
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820932; cv=fail; b=fOqsXaCDTxtmzhAp/R9Vz48z5cGs7L0J7abSfMwYP2zaG0vjaIOtui9AwA5pUqLf1Zmu01GZn1t5KLb/yfY0j6x4cJhSWcR//+kxD4d4jJaMuLyeII9TO2gnB+gO1byaG76Tc4TlxJTaLgNxbiE2luSdzgvbCMBN2/i258gjf7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820932; c=relaxed/simple;
	bh=rb4ss5/JAFoPJdDmc3qATXaBSfpB0TCJ5IVnBvcmpBo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BkooSrNCDLCynKxFBLLI6+i88BgHwmPWtSpI0wTEO/uu7N7mIVEhvBdT6Odrl6AyeF7kkQqcpwXyxc+JzDVAE/nx+WDvY9y0rgXSJj8boJg1R9gr+rgNrXu3cg4I6ymDMMTOFSvA64eiqP5+5fSMQp6rFu0LcahL7tDS1qSACF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k6Oo1oVF; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k6Oo1oVF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkQLkCOwP+jIvhx4I8+PWQDfqR9oJF3Qz4Y4heWXNH9uwR7I0m/FZOHwTD0bmHNUS3CS5gkGBQIgZruPBWA6yT9nJRA8IJbiIeTjfgrMrxNRQF1RxV03FQS37KzfNGsGzFyPRLM4ND1Ebp7nYs6q/Vtj6i7mMcp3gE/TfFl6DyfQgZnvHT3VhHImq4DuN8O6UjP5/ZUjKUpdA6y2hzkXP0a5iMYUtj1rUyFv3+RMsCyuFjPpBt8pHe0bxW4GBWTJWFnFJ8fN4ilWEtbGMGbbttgrG+GDVf+4EcrxY1yhSDA1eUpKwxisYksWkFkyMhiGavjPHwCXYLq+NsZ5MSuzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8opboNHr3GbcceFP9vJDeg+XqxiB+K2MAfstvoFgA/w=;
 b=g5u3qgfy+aQd4BXp2RPMspygvmFvsQARdpJ5W4trLVAVyXpeLdE5ao9V2P0Bs7iX8yL01I1d5W9qhZEGqzN378ee7T0PxhVjk+h1EOh3I6y5qUTc11tZP97Bts9QOyrf8bNPhxw5SrT37Qkyr48RROGS7BEC1/GP+PJCG8Dwz2cuT7uhpO7ohHelLLp4UK5Ci7wT/P27UDX3ylgvyNXVjJcFP+Q0uG5dDOfOROkFxhRpT+q76AoUaj9HD9ICctW19T8mw5AD15yGjn2P3vi0S5ysEMifg/r7aOJjsWU2KC5k5oTi1CA9bt1Boi/06M2n/EEHJ2qJKbqGSBL1eOTpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8opboNHr3GbcceFP9vJDeg+XqxiB+K2MAfstvoFgA/w=;
 b=k6Oo1oVFKXYBRLmAVtgUjLdmDSzUgX2FMdSxVsiRDAuZzEvBdnSIURImErAqKTMb/LtNkrHQy3ru5j9BYjTY7Jgo5UKkD7qg9xgSIzhPulL74J6yA4G33LDKYgWSKC8jkWYnAkEBsqefSBesBuxnQHvSt4iPrPO8jNDn8Ehr67Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:45 +0000
Message-ID: <87seelza2r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 163/292] ASoC: codecs: wm8753: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:45 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 8035b737-a8ca-46c9-8d7f-08de20b9461d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ido2XNpnnPoNVuAUtMbabA44pGdIEz0MRCZ4Kslan8i0EUav546y5JomBVhW?=
 =?us-ascii?Q?pCDM/dfhiK/UP/gn9KG2KwWXdpn1AZDupCI7CdbYttgbJF58Ql/m6hyyn03g?=
 =?us-ascii?Q?FWUgcB+4U8tpuvxEG4MP+VxCQG3IYe1KNXEt5eZNqTWEtxi+dA7nvXnBQ1LK?=
 =?us-ascii?Q?nN53pS6Bsc/lJQ8NJikNkBcopzftW810XCpvxiAc4GGEA+M8AJHAzO0HoAEo?=
 =?us-ascii?Q?okpyb8YL+XH3lz8RccfXpxI0OgO82eLqXiAKh+/mZBD88nPvoXN9/j2bt55f?=
 =?us-ascii?Q?VsSeV1chqDq2/O+UUNGewDoT7KSiXmBFcRBscZ3vFbh1ONFbthV5Vez/udsx?=
 =?us-ascii?Q?k0VeOo2SkdCFvjqWWggG2HDtfNYxrme3WwTNF7+p3sVcHKRaKJ4QgLuFqlGm?=
 =?us-ascii?Q?Mp/5RLehhqkd7026bKlyTLkxCioY9aHDs0iS7u3HhltV3qO9k2YYxuKjOWTR?=
 =?us-ascii?Q?jC94/tXzxIkHdxdyBzj72WqYAiDNk1f+SgiBH/IZYXCqqMSOhEpxJh2kKA0J?=
 =?us-ascii?Q?Yl+/DCvthocQaoDTakmM6wrXJ7fEUd2LR57puEuL4DWutrNRficKsA6BuZP6?=
 =?us-ascii?Q?sRa+d5GVa9Lekywv1rO49UAgXeRJ47hxKYYYammU15CAI9SzOV4xY0nuQhkm?=
 =?us-ascii?Q?ozkJFyly3uOyWHE5/6XoWq/9xbD2fhBLPJ+a+uwfaxyRa8/ccE31z6RS4jnR?=
 =?us-ascii?Q?8ZQEi6K14kCoUN0UpiG4e6koliDkCjiu+J5vjyZAP1kY/vNgQN84yyRqqr8L?=
 =?us-ascii?Q?VKyD+5k+SwzwV/ESI7BUIZFTo+IgKZbt6Ez0AJRufxcPfIuZwYsab/B2sElm?=
 =?us-ascii?Q?vHA8bBvlfFQ4qMd0fOh08pVmIKPB1ozTRD5Xq5geJzCgcLGbrDEE6DNdD3Kk?=
 =?us-ascii?Q?510uw2g8hkm13k+2Y4yF4vWx1toFT1607Cjh5ps128b/BA7ZZmNx59yuWfwj?=
 =?us-ascii?Q?gIrDOrg2AQKSeZZ/XqaRvEnB3goDixjIFYB7b9wXWlNx1LC9NvWsnuej4Im8?=
 =?us-ascii?Q?sNulYgeOVuol1AeL+Hov23YCtPviwhsnDm9cWv7eiNOd5aUsZpx508nHm+8z?=
 =?us-ascii?Q?dmKdwo7G8WIaTh+U9NF56CBJe4zwTgK+Fgax2ycuirJW3pauv0PeuPk7AgZF?=
 =?us-ascii?Q?SJ0TTOjnLmYOvgXDONeHNCjmlTtO2/tFlweRov2f6ROHEFAVfX8iWkAjnP7Q?=
 =?us-ascii?Q?2YDrwkV6zNlWP+e/8+CnNi1VrDoqYLn3N221Nu9q58qQXm9xTdEDp8PaSVje?=
 =?us-ascii?Q?rY7qepHkm3jPrAHn7NpZC4v9QO/8Kn9xa3MP5pGghqs5vr3C1lUoMwVexffj?=
 =?us-ascii?Q?XADOgrq4LAi4XwKUAzvwY79q0cwIyoi7WIMXb/5rk5WyQDld7FQSibIZGbjM?=
 =?us-ascii?Q?BQyGFLhoYPsIVnja3VMyHCb4mD9C0f/sQcsaOOVMN5gL7P6HgjF6XWHdjXgZ?=
 =?us-ascii?Q?swe9CmGhBNdpdRQy9zFD8SjzZgS9fN2Da7ZGOfoz0eebS4xBcElv/NHw2uFs?=
 =?us-ascii?Q?7wwxXj+RVUKc91eHimW+EZMRIuiFbz/tpyGJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HcnjlAeiJxK3YIX7NQ1SVtymIr2NYAFzIyaEN/qvDerxwrjDu1EfUUUVBm/c?=
 =?us-ascii?Q?+D9s90wKsAMZwt7kp8M/YII1vA8tMAc8ne/V40S9O0Whym9hjqd6h3xWdjoS?=
 =?us-ascii?Q?5m3qCZWS0afGYqZCt1a8p1rYndYYTSq0AuB9SYfDk0uuMEa4BLngJgDvymEi?=
 =?us-ascii?Q?EMv7IMKehymnW1yISmlJQ69T34tQTQ28GN9mWnLk5kjZopKDbpPHj713a7hD?=
 =?us-ascii?Q?5NgjlM5gQDnyr6CrbWKl8zP8SazHgjso8Au23CUYESCotV1J6paPmh5UmBTz?=
 =?us-ascii?Q?/0rEoNVCUAJVie/CatB17k7oVuJOTjMyXB5RwuSRjFww5mOCa/MPi7hHrR6D?=
 =?us-ascii?Q?ybR7bd7+my4Ijgl3G8axTv1iq4s7HoV/ui4IErwqUP6uy3lvNPUwlxC2PjZY?=
 =?us-ascii?Q?H4zc2sejSpEMn2XJX4WCKP6lnZUu0B6D+e1DPqm6jwlYZM1Mutb5xPU5gJ2G?=
 =?us-ascii?Q?BUmvS/NywguomPIoiP2ng7MyMef2HAtaEpnA4IdD3/GHFQuTa3Gl30EF+ELd?=
 =?us-ascii?Q?64+U4Y5uoNsHe1qCm3Gn6sbFmy08MxmvbuITPmx3Blo3GIfJG6YB94at5OS1?=
 =?us-ascii?Q?WoDEbzvNlVBFu3UxPxB2vkGHRmCzj6iXL7SJBPHZFXFOxyHrMog+xcC84avm?=
 =?us-ascii?Q?MkCe1p+ao913C+/5DgoSO7osZbUzmH/QUK0gLe80/vzhkXht22TV9Tiyiq76?=
 =?us-ascii?Q?HpgJQYyZknYoh+28WMDI7aMXq2DmXFehsLUolYuSWoPlilkxPS42sshDE6qG?=
 =?us-ascii?Q?0Di/3PZWeogjvu6vikVu9sx9KxKdVDKRxoEsGwgHcAeuofbxmDc09kXK9O8+?=
 =?us-ascii?Q?aKeikrSnZRCehDjeXdf2YXTHaPsqg+wLkf0BkZwU96em6Gxg7HJ19bQovFT+?=
 =?us-ascii?Q?B+DkWGNtLaE2uLgAUd6TvGmesX3TekoRLOYvn9ArL0fMbv40EXT4aa0q2uxD?=
 =?us-ascii?Q?bu3MmM2xZx6aulSfc1TWzf1cVUKTHj6hg2MvVFGdHtZIod6VREvX4Vy8L/RJ?=
 =?us-ascii?Q?shGOJp/QQ0nenzVqn7THETgFXtqtIzkbVBzpna/uN/Va0JrBXWoeJYmD4MBy?=
 =?us-ascii?Q?fnMSGtGrhrb1UbIr+UOu1HUYkKGUIS0nAM9Y+aVE52XwydyRFcBQqKOltRRv?=
 =?us-ascii?Q?Qf/lTe4bqo52g4gxfIxJPwZbj2cXWaPP+oNP6FxcYS1azPZUojEehEaGPoEA?=
 =?us-ascii?Q?5JTw1Qkj9vc6cM/86j29RLWKaICsdSLD8Jlkb8iGxG9uGYorZnxQS5Mi7wkT?=
 =?us-ascii?Q?d4HokECsLDAh2jnYEPEBveXGGS8ugyRH/dciTk54igJJW315ekxA2sdRco6P?=
 =?us-ascii?Q?97UCafR/K8CWLn3GVBsYpgqeSfvJvlSreqybzbShH2iSurtIMtsNFnaISVZI?=
 =?us-ascii?Q?CKNfJLQ7Doffup78HiZFagpNwmXLA8QW/5obFzYvmbmSx2eteM6erqprwUvD?=
 =?us-ascii?Q?KBkEq6T1Aym0gXWBm2TVpITCQAkJtncsBlyp+k2+GSNMEGbmPbJkgMA/GPmd?=
 =?us-ascii?Q?Znl2+MJlRc+mtIU9Ruc7flPgaIpM4DrlQnxHSLVmatjn8/aTqk5kj/8MunsF?=
 =?us-ascii?Q?baDfUjwsgZNamM68Cekd/T/7IdI3k4PxqVmUv9vd+XmiFpQddANbf3PZPolv?=
 =?us-ascii?Q?oISoWlJHcBs7Am6VxDFpGR8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8035b737-a8ca-46c9-8d7f-08de20b9461d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:45.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQjc+SheBR2pbijA2zV3lZMVxkbIDHxMyYyDyTP3+rEI/0hwSaB082bCQbn9eszryjeTWRPQn8raChSo/zsP4JBiqv8bWjtbT9/0aXW8JDq77LwM6IKP3suRDEyEMuzf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8753.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index bdd38ee5aed77..a532a95e80480 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1331,6 +1331,7 @@ static int wm8753_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8753_priv *wm8753 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pwr_reg = snd_soc_component_read(component, WM8753_PWR1) & 0xfe3e;
 
 	switch (level) {
@@ -1343,7 +1344,7 @@ static int wm8753_set_bias_level(struct snd_soc_component *component,
 		flush_delayed_work(&wm8753->charge_work);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* set vmid to 5k for quick power up */
 			snd_soc_component_write(component, WM8753_PWR1, pwr_reg | 0x01c1);
 			schedule_delayed_work(&wm8753->charge_work,
-- 
2.43.0

