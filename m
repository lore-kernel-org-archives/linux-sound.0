Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EB0220F5E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821222; cv=fail; b=ZDeUsU5TDaaRcWQlUYTFdkrsVITqWgmwavEpdgZmATAd4DSoUIEwPbqdIf4qI+5MGSm6QqseDar5g21FShUOVJacjHz6yCO1Z1d/+NuvCaH1qxci6cjYgw9XOnxQRxxfazSEZs7Zvvy76ZNlr/D60sMVq7sJSPwHiNjKxZ9pedo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821222; c=relaxed/simple;
	bh=T9aY5MiMWzPgjT/nJ1G3a7yakijClbQ/xNPrDKeVrYU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LuNEpft5vyIPdX3ErY18Xk1tHVaPX9v4eBRNbiEwnAM1PdSZrN5ffLu56eeDxCreqI2eewhCh9aOihyLk1ifMwqnCo3HilLJa98d0SFU+babtm3q4GdhvWJNuRiZdjJPpDlZ0XJDXagh12CPcx28jcHquAyzbJvhXJSQ+FsjeaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KE/VvBFP; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KE/VvBFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhR4EtVSCwxBl8NiNEuWXWLd+S0Og9ZdLI99CYo+zc9PtzTWkUquUaAhH6pH83Hg6Y3lA3Hx4F1GiHd6XhR0J7dg6lM4bfOTyev2JfC1xxj+j47pseUQuh6dI9hUZv8nm7DciPB8xs7oDHIIOjDtvZYPk+hB3lh/QQW1DdhE0y5z1cVNxZ3W10PirsqaX1ELVUuTJiKS7S3Cw60jr39LJfCkIUxNN1caPkQbmsX9L89agU4SzvYHetM85iN9XTAcxFED65XMUYa5JbL9SDw+g0y2bLGdplJCOWx5v/ZWUsGAkoG7m2CNPDCh957rlWoLH7+UYDzG1dhyGJriuz0rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ2I43fopYEn6SJIAUkHU5wPE6I8LqHh+tqkuGKO53U=;
 b=HgyHLlzjKnl/WsUL82o4xxDn5YZ0A5KpX7DIc/JbWPPXhUpvMF76r9A/EXuUwew2qsNmcr24cWNptYS7zZa64qHLx7rzDtJOxgI9IEQ5OL1WvT3sl5MTpTAhpLBwoKg4usjM+/yITdP06rzfNcWXaFNSROwHLfDGDwNwGsRLJ8/va4H8QSjXwGWC0gs2Y4hEJ5zjsByu5AQo3dYGQhDDNOXRyHbuYiRXG0KgRE/9p8hf4LWMUfmZcktGxwiRvLuiHUdKbgffntlLzxMLK4Q2ktvbNLN9nezDeJPz8mhe1OglLSsrpqsKgbYBC33o3KyofV7VKXX/xQU43aw9gPRw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ2I43fopYEn6SJIAUkHU5wPE6I8LqHh+tqkuGKO53U=;
 b=KE/VvBFP8BNV/JhHjW2pZfafNQGIYgWqcUHIK3bDw06T0PklNjbC2hA8iXyGBU07WEIkBstvUSbgwlRoBEp6nFvAgCRqZHRIW5TQPcZPaFRfd4egiQuMk8BqPSy41mLExQh1+mDx86jr7osjUgczpyfQsrtIbNzbQl0AHMF+kP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:39 +0000
Message-ID: <874ir1wgpo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 230/292] ASoC: mediatek: mt8188-mt6359: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:39 +0000
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c68ba89-31bf-42ef-4e92-08de20b9f5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KAT7yM1FVkgVwkP0oZAhydF5v1aVVMEOXSASCUDEchhaj++WzK5lIEOBiiZT?=
 =?us-ascii?Q?5vt//2NiaRHYaV8qaqOEYk+S3LqFXBwJjjRD03+YRdk/Id4pIdt5JSMizTGn?=
 =?us-ascii?Q?Niy3xxt5dKmWQ2Eucq8z1Xb7IXf9Hbhw3H6TrKtXZmgkw4rCpU6VjHkYoNTA?=
 =?us-ascii?Q?04GY1dADpfdMhUtmiIQO3+z+e+5UH3lcCY4fxvn51na2MxA8GgjzJ7Nhjq4j?=
 =?us-ascii?Q?hjlPzRIJyMb+u4ilRtuRRYr33Ot8pzgQgyDrmJyiO8xM3yXkS9gO8vzkXCzx?=
 =?us-ascii?Q?6OzXPmyUwoBBMlNtIEiOWZiiUUcARrW8tDKT8A6UjLR7M+RvTDTvafVK3yq6?=
 =?us-ascii?Q?/Kt5rbIdx8gOfr1CuhJZhDQlq5U4DrB2G2laEqAS0eYo4NYkEw2PPEn7pUOK?=
 =?us-ascii?Q?HvdknGuSddqPiHxdgIScfPu38N1scD+6D8Fu9cDNy7Nh2EO3cRYbIQ4qJ6j/?=
 =?us-ascii?Q?sn+BFdK7MfAHy29LU/pAReADigceY/V9bVaT8nJnIMz9b8YmSfD0ow3zdz+9?=
 =?us-ascii?Q?3crVb9j8NpzWp/wsWC49DexxumU0gnEsabwfHBDnpFZkm974QuoZwHUMXiap?=
 =?us-ascii?Q?pBBu2OKy6DUt3dkkcwznDpk+aB8AuKq0iyG1AqvXYZHXnZyAxCpyUFcp7XJa?=
 =?us-ascii?Q?pe3txrnj/7M/vgrFEPRM7IUvbBgNM6+077BRK1F48j0ax/a2biWiajdmtWHW?=
 =?us-ascii?Q?idr7oxFmLMzSZ7yM8YkKBRTpbH19yKT9zavMUYtBWL2+mbWcwIRu7rEh84Mp?=
 =?us-ascii?Q?P3mPVdzvFk22xr1uYhWZYv2zarFmXEp/sJbqpwjCAt9R5/CA33L635nPLPdn?=
 =?us-ascii?Q?FUQK/fNFIGXQqO3wPWoTVKxk8kyN9NyKIrPCRGLpgNnKGOEq0F8/RthDBfcW?=
 =?us-ascii?Q?+JjteF+mah6WDD8oYhwrGnbl5vDsSC38auUWagTHri+zgdGKd7gH3zUf4sE2?=
 =?us-ascii?Q?+xvmegs5VsHQUUIQ/WYk2MimoOscAeW8v71gwkKf06V6IBJ4ihyTW1b8e6Ow?=
 =?us-ascii?Q?3iAFFXMK7aPovdYgbNI2sgOQsGzpsqiVZXrcyXhMPPMChHa0Zz2hVha5xG49?=
 =?us-ascii?Q?kjdfV7ga6OYk+n+0qF/A/14YPoCHMd0czwoNImSV7LSsFCn3mQjaqPBHJmxJ?=
 =?us-ascii?Q?IPhpWs2f5FO5kqos5TX4Rb4eokB7oEI6eN5BHaiSycq3qyP76gCa8Joje3xN?=
 =?us-ascii?Q?XvwfRhblHZ35pDluFgrNngOo8PUq7fVPL2BbMGzvie8YthKx3eiV98NW7wI/?=
 =?us-ascii?Q?+3mdW4hY9f7aMZ3xuqQGneHAtvV6JIyDweRcPmXKageteqt8O/8yWYYbXal6?=
 =?us-ascii?Q?u8NA5w035mHEjTGS+SFNZJU7LHOVsqmCIM00QBrohMF+EonnTCU87Xc+cFCT?=
 =?us-ascii?Q?4Qdn8NpOA+iJgtWyDzUju9eaoncbaGwBdfvy2/6ZXei7qNAfGkAUmaluoDNJ?=
 =?us-ascii?Q?gW9HU+okDA3uHyVW3bYU3x66MAl2QwIPyw0l44Z4xmd0K98HuTm3kcbieeqR?=
 =?us-ascii?Q?bYt08Qnepae/7sZyR8GnReW3r7rkYg2w4Dn7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GpxzNZy3ESn0ccGVDCxPZNBZebKlDqHEWSJLNkPRXSMQnPUBUTuDpbycsbR0?=
 =?us-ascii?Q?So1UjP0I94SLEVmo555lJrL+fiGP5qqcPp03VwpW+ylM14egXcenwUzpECzn?=
 =?us-ascii?Q?owDCRwmAGKOEjt6ZP07fjN0yKEZEBYI5ZYZtlNcjJh+FJB4HHeJVhpQe4MSL?=
 =?us-ascii?Q?Re7vFJ8HPQo5KP3wD4ft2hpRQzg7GlF1qchomGAjWHmT23m/3GoZdsWLUdcs?=
 =?us-ascii?Q?dTefScAK8hvIerlTWIa1R4zOOhwi0gf/h9uKYmQTt77kbEBuM9jNKvfr3jAu?=
 =?us-ascii?Q?Ty8Ls4kifqFXUP2D9xZtlgB0kgp5ZzJIi0S85GITzdM0webDxLZNJMMFZO7G?=
 =?us-ascii?Q?q0PQRP8bVqkLddyvWC3lVQuoEFzGo+NwL1bAtjfsRhzDaUuPgK0XgSk0BPHe?=
 =?us-ascii?Q?GvO5BR+na7tYUrJ8I24e460N52VLznzTz+cBBaaKmMwEjiXu/Qth9GxbxXBu?=
 =?us-ascii?Q?kg5Tye0/4vsWz0OpkYzB4+J6kXi5k4O5128wtYRrQlyw94VRiFfjbJUMtYs5?=
 =?us-ascii?Q?yxkVoguc0Nykip8/or7uXzPjP8GzB3MYSrSlu4+QBcVYf/E2BdaSKeOVK69o?=
 =?us-ascii?Q?9vHcNQJMU/nXWUQDaooo7SteI+EiHjeY9jDH2nTm82+EOBO64tPIDkPSL08/?=
 =?us-ascii?Q?SoMe186Yl12NDVJtvKowDYYCJagjOgvVMeXcBmlx/y3x4L3nqVF1m7aGizUi?=
 =?us-ascii?Q?+7u6Hq3zkqMtkbYZ9g+RRFJXOmQJ5JLOZb0H+bsl3EEAZLwhipSTCMSgZN8+?=
 =?us-ascii?Q?I2yveagqEu5f7mNHPD6REYE0ws9fglNJHB7SF7COvm0CxFB4AEIsoqtCBK4p?=
 =?us-ascii?Q?nAYVU6wQI4KlBlwms5yKgssdaP1hf9P4hHi3tUEbrUAL5KhYYdQfOwjYFrHE?=
 =?us-ascii?Q?Dcaf17NOPdbL0rAsV3JTkvVHYXxcg5plD1d0VpknFda2oy/xUOXA47KVX44M?=
 =?us-ascii?Q?R0Ut+lH/DG1S9RkR7Tjcjtxot+PJW+JlurznocCJoHr0fSQ8ujP4CMVo6PlF?=
 =?us-ascii?Q?BuLDFBEiIKAmLUpOu9U2/fJMtRLfEjXy2KGMytlBLv6sJft4JM9/Xra1USuh?=
 =?us-ascii?Q?CPLgXUWGeEFPUl408Rq0P1+9rbYmQecdPgThpBlejsVGRcze83dY7m7ZCoJ3?=
 =?us-ascii?Q?UxrJbDJ7Loi7izv9dFyyG4Jj23QEe58NEhyqzX0sriN7IHj0qdDH6+0b/lPu?=
 =?us-ascii?Q?O/rOPbTFOBS50xrsk7Z7y17SR34LD/QwHgr8dhxJRf2hcDgnRQE0Y8cq2hwa?=
 =?us-ascii?Q?2SnGw7ExykE+QPMDyxsyb0nHtTX6bk3fZ3ZE3a8SCBnXBcHsD7mA+662dQB3?=
 =?us-ascii?Q?AhBp5N3F7EMA0/NMM5xYDNhGlZy1V/w432eCBJE0YbXnl2Kh8iqjTd9HF63W?=
 =?us-ascii?Q?VCVAQYFNeTbDHl4n9//4W4wadLpf/rv5HwkENYCYWZ0h9YT2n5nuEyE9UXzc?=
 =?us-ascii?Q?THEgABOVLyckXh/fvrj5pRLfT9XurboNnn7eBEipSLiF20wFlq7JrjNm94dR?=
 =?us-ascii?Q?Sq/KVfremO/z+Sa9iVOAkiUTBYtOI+4nz8WoT71DtPs+q+WQxDCSnjyRXiP7?=
 =?us-ascii?Q?PldnDXlh9DVY2zpvGwBBm29FJo6RBwX5SfR2Moxh1L4zHpgdmQSI3UyxA5BW?=
 =?us-ascii?Q?2BUistCVw1vT0yXhSGcU/aQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c68ba89-31bf-42ef-4e92-08de20b9f5af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:39.7305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxWuGo5p/WL72EgzBLmhhavMpARS8euHdZDzhW1yGz8ebM7Ulgbte9OatLKISWrQyWb/wi6Rsx87EJwa4io4I8k+SvEtkJ30k9O/zYxb0vV7dbQ7u2bqJwS7Lgtxucxl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index c6e7461e8f764..55ebac0c3cef2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -684,9 +684,10 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret = 0;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_dumb_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8188_dumb_spk_widgets,
 					ARRAY_SIZE(mt8188_dumb_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
@@ -737,10 +738,11 @@ static const struct snd_soc_ops mt8188_max98390_ops = {
 static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	/* add regular speakers dapm route */
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_dual_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8188_dual_spk_widgets,
 					ARRAY_SIZE(mt8188_dual_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add Left/Right Speaker widget, ret %d\n", ret);
@@ -758,7 +760,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8188_rear_spk_widgets,
 					ARRAY_SIZE(mt8188_rear_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add Rear Speaker widget, ret %d\n", ret);
@@ -779,13 +781,14 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8188_JACK_HEADSET];
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_nau8825_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8188_nau8825_widgets,
 					ARRAY_SIZE(mt8188_nau8825_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add nau8825 card widget, ret %d\n", ret);
@@ -815,14 +818,14 @@ static int mt8188_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);			
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 	} else {
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
 		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);	
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 	}
-	
+
 	ret = snd_soc_component_set_jack(component, jack, NULL);
 
 	if (ret) {
-- 
2.43.0

