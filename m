Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32821FF28
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821232; cv=fail; b=MLyj3R0fTJObMAAIAx/2r3E6D7k9c31n2awBknMWv/aBRbM7rxB/NqS2MKSzQGtfg3iAccx9XFCDV2R0UxxNZwEO1POV9+CD06v2+wC00He5fRAAe94RtPQ83C/s7kRCx79Jp2cp2ovC7o3INWGAlwlf3dFPi4aTyNIyq4sCY6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821232; c=relaxed/simple;
	bh=1SQZ6FOxhORxewAesDr7lHM9wWO8ilW8uo+UvqmOuVI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iHaIb2H0YHLa8IvgnigK+y+xJahxmg6Y5aHHOfT5GfsgPLk2UXuwRS6wvysu+JKVLZyo1qdHrYPqFabF3tml/SjMzmnzH0Unat4eNypb3OZBLUXkiGZp1D63y6R8wJ2IdG7QnuMPRKZLcFSr8OW00LEDBmb3g0mvan0vNkO8nMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WYPG0Wgp; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WYPG0Wgp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnKD9nVtP5JBo6BYKbWYGV+nUEv4I9AdzY29dfB4taFnKunNydUWeKp51r5yrQgi358X5XEsTyksT28Ca0/1OIkdVh4IPt0Im5sCtrIACgIUS1r7f8kGrnawZfeC7Z1gBYWQu7916ISGQ81hMlXk1oRzfyl2TEM7Hcd/AmbyOYqEZDPxQRYKKr5cxSd8lXhROq8cbAnVu/pZtyJBDzQIGrj4RlDtlzbmcxqkY6A7ZHdKp39MZA7ewILxFoXPhfKrOiFxtV68Iat/HoOdDfOd5IdIDcAvzCTSwq/3KSqkSP2E6BJ+CAa2xZ8DV2aCC0eXzYNxBLPLOxUddRd4z2i8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nZVdTKwe75GaS6ZH3/oXwyARAp0QK/hxvzyO2CU1yA=;
 b=Nmzb0D+ZJpDgVGDUz8LGeY6wojcjCRDxnyh+LwT7EehLaXHzDDJuHdgVtOQgb0RfHgqLDPIEvqEeZidfommAnjiV04/UJY55FhxSRCxR6KJEB3yRQRExdlpoFH6vCq55fWDXHuSXncBl7HzDfQY3nb4YdVeyzeySzexGvTxXUG3arJUsFGm3NqV+Bzxa7FEvjW+8pR7eBNzVuK3nJyeGuZNrwj41NMXVkUC4A3xHvTgsQNuzF5qXsB5sUoC0yUiTZxPM9lHl2rvWMbswUTQF0Gh0lTY47/68ytjnrGQmDE+I/+T/AG0Uy2LLO3l9JLfg3B5InDK0JLLg03DSO2KZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nZVdTKwe75GaS6ZH3/oXwyARAp0QK/hxvzyO2CU1yA=;
 b=WYPG0WgpABN/kqa/uFLOZ6FeTL/D2ucQq5KcrZPgZNGAuTo9d4GNm+8tvNnMM+ShWQ/gYHD0JCOW6kqHCUoP3lHcdotrWwKTthGTMSo4H5x/q3ce/j16P/GJi0rVDDKhvZt3ZNccXLdh79ZGJKcWqic8xWcHrbWqCZhBi9hbFcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:46 +0000
Message-ID: <871pm5wgph.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 232/292] ASoC: mediatek: mt8365-afe-pcm: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:46 +0000
X-ClientProxiedBy: TY4PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: d03eb26f-0009-445c-01e7-08de20b9f9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yB56tioeePZZgxusxlTgw/Oq20XiIoOBr1dXI4ChilRV2BwWmUdw/DXF7t2Z?=
 =?us-ascii?Q?CdaT6453B09gUZbWifRgwNEyESchng0e88giM14sG+wDCqpDpLFqbEYHMvLq?=
 =?us-ascii?Q?NNRJlrQfI9WMVB9nVHTyEBo8x5p+i8k9TAwlw5neR77g1dYGtuz1l12csVIZ?=
 =?us-ascii?Q?vtUq4nqu6mqsxJHXoMJaxAL6iOBF3ni6hSAPozTCrynjA05LvPXxXbA3kmaC?=
 =?us-ascii?Q?r4Zsxw07scOzvkXObwYnbhzIgnsRIV1b02xHlsi5aOe9McaQtFh7baKkatcn?=
 =?us-ascii?Q?Lljs3TPvAWws9/PfKudtTG4c86evrL4YCAIFCiKZMlIcQHmDs28OnqcrDla5?=
 =?us-ascii?Q?hOu3F/PSHjc3UvGM26bDAfeWhdPZEg3j46CoQJI4eKYsU/isp4ZT5G03dZxD?=
 =?us-ascii?Q?UDTZYOSjaOfYVDKkPsWW2lC8L0oDN37clKUTB4OlhNWoHHw61dq+5Kur2NTY?=
 =?us-ascii?Q?Kmu7Q6wq7/YWTTLPpDrz/p0p5eTSJ6T+2eA3BUbpw/TWL7OK+wQeHs42jNHc?=
 =?us-ascii?Q?AOugHr3/tNxlAMQdi7YDLDB2ichBey/1Ksq3dhGlkGwYfeCjUuicFro3bJXJ?=
 =?us-ascii?Q?5UaBUks/LEWROJMvE0RPiaGy5W4O2tbOYlV6XJqlxTDPtQ0ZM4wyjuBIbah7?=
 =?us-ascii?Q?cO5g98FouY7/i60lKRnnwCU+g428pHew+KXfexLP8pUn4AQn0WXbZG0GK2tV?=
 =?us-ascii?Q?h5emuvl1mIGKsy85I12uhFp89A6EKoy5PvBL1H4F7GBkB0GeQ1nYrel90b6a?=
 =?us-ascii?Q?lL4p8mnFSc8iMQ1fcLKgdyhEeD3DF8MxPK7Y7f5O7FUkVkFe9vilRKoH1oY8?=
 =?us-ascii?Q?RQyHnkcOSro12i2YRco4uiyrNR1+K2qybjgpQ5hibm7K42B5ZPgh/nukJcRV?=
 =?us-ascii?Q?wiugS6SOBrN/PNzodiRMKQFmg+DnNA+VAPq/i7kUdg6HTK+Sfr7zS1S2v7eU?=
 =?us-ascii?Q?yHPOO4KnA2GCY/33RYS2hezSEJkvADc3NqxErMwhrR+Y4Ps/jseWIHY07r6E?=
 =?us-ascii?Q?+EJNx5Li5it4nCWPLqNdXhZ6lXWwHYLsR9xpkisOxLPrS0pCenYZo+tr3HV2?=
 =?us-ascii?Q?joBBgOXbHpM9Gmf+fbT61a2dxkApQJdVjxhIHqyEdcixxfayCiCcNF/EWruj?=
 =?us-ascii?Q?WrFKTzSgZoARstPga/GCwf+4yjfedqS+1DyszjDG2r5f7TPsa1OR/W0Shdne?=
 =?us-ascii?Q?1F4i8uoSAuk23xbnjowCWjiyudwJCusbcv2bODkW5uLf8qdWamFXaOrduh3h?=
 =?us-ascii?Q?yogaQZfJ3EPaw1sq16barh0oArCEFJNWsL9qdYGbWOb1oZd4oEVKiwX6vmUn?=
 =?us-ascii?Q?xhtEGLx6nGO02kDAkkOPyAWVkxYuczYgrBalev08UnSZj9uvyR7+m7qmNZy3?=
 =?us-ascii?Q?i2zWc3in5WMhp6Z5kX3BENMrsCGlR6chchKRXFEFOu4I++gw/ACuhbDRkQBt?=
 =?us-ascii?Q?pC3WNhDkD49A/ZRACzwJcJy6MKWkNb01wTwrsWucJY/jqmeAXMqt8mMPH9Fw?=
 =?us-ascii?Q?7mIKYyCFfJuxytX3OcPna4uGLtZvoplPJk1i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wUtCkOqT0DWY7/GCKJrLY9LohQJ2S1u7dlvbbqpiKwv9dHFG8R0QwyvANXMR?=
 =?us-ascii?Q?7jA2uOkg9/9tBeLPoHFyUNFvk4euN6RZ9QcAVo2EP1JOWbCfoxhkbw14F8t/?=
 =?us-ascii?Q?KT9HEVUdULHiJp2EzrU4bEcR9bSqm2I7XsRJInr8g0ZaSR3jv/wEJEDT+kaK?=
 =?us-ascii?Q?n1nRFw/dn62SxXq+SJaPgWCPpcZQXrc1WxtsMPe6dqVcbewpU1i28kzkKGB1?=
 =?us-ascii?Q?kj6PHZctDItsRD5U1I56Tuvl5bnjEgiQseS6MMQNFVB29oUruixN5IXF+ktL?=
 =?us-ascii?Q?5dbHP+N390wXaF+4G3rVuM0lfbr8YAP6WQLH0iHQq6/r6HcTVxoOYjqdQC6B?=
 =?us-ascii?Q?iZMdmevjQh+tbZJKuDt5vWSlox+6MuS7yxk853GelvQD8lv9VEHW0nMUI29I?=
 =?us-ascii?Q?nfaurkg0zFX6FqRzapG8+6z+vJ0w8giY0TzOCr+FYUaF4C8f6Wr/wKwxYhKx?=
 =?us-ascii?Q?K+YccqlwxRTuwZ+DsMQZeOpKZtNbHlEi/2ExtbJzJG2cdb8aY2bD+JmDg/tF?=
 =?us-ascii?Q?kdA2YSaJfFfgr/s/qBcHF50AmM/gxVV13hfG30Fk68/CEOhRm3mbSFdJJMCw?=
 =?us-ascii?Q?zpJ6V+6b9711JVoNK4+gbrkOh6az+UV2iXxIBQlBb7CzCFVgfqZqWuGUdQsh?=
 =?us-ascii?Q?dGQMtTCqOFKNoD4qsAS69hQdnlmu6Vco0TceD3zAOivvsMtCPXt+J8amYZB2?=
 =?us-ascii?Q?3SU970+WClxp3Pq76tSNcrZ2n5lQ8E0OQUTYOMSiBCJH/aCkqLP+qfDlrf/0?=
 =?us-ascii?Q?fU/uKA44sGV8PIItI6l+fVitNgaHqdpoXzz9n35l1mzsJr5xeZ4p5DG+TUcB?=
 =?us-ascii?Q?lS1upWdxUJiNnZmahtAtks6ABYofRcQ/YjfeW+EvLs5FA3FuOgP1m0PVxAnL?=
 =?us-ascii?Q?CUeY3iIN1//u/ucFg6sUeXeRuzrJ3G+82BTrGBHQ2FRizIhMnM9q83jqL5x3?=
 =?us-ascii?Q?Ym9u1HpH66Iy/+yTm9Qrx332JL1+s7ZLwd1VKQijqPyRFJQSDO9BSub48/Zk?=
 =?us-ascii?Q?Q/FdIec156YYGz1w6L+4HefBPhlKfBtqfAjNSWOYTBfHihdv6AwRoeqosp0a?=
 =?us-ascii?Q?5SSZGRcO1dORHqczKcxAyXijPmQcWMqMcqa4lmguoahUBHP4jcaxbdGE88jC?=
 =?us-ascii?Q?Qtw+gCRSi6OCasOhUArp0ykMTCwGjxOstoTcB7k59yUqfuB0YD4yqslBLTZy?=
 =?us-ascii?Q?CER5TXyTfe6+FG7qTyZ5TQMHmcsZgbhU0qBvWNht3vm23F6+Fhys4/WT93t5?=
 =?us-ascii?Q?wVdafhkFm+FKV6J5xn31rs6mCXShD4IzJEfbxLowRYE8CiDr4JCSvmLOCZGv?=
 =?us-ascii?Q?p+RyQs799EqY0YisJBITeRu+vimGPtROfPfFIxKdvBYzgVFsKzTqi+j2SbJu?=
 =?us-ascii?Q?ybCZvjt3UD24Oug5X+zvLxJlaC3h4dTt399bEvtHku/IgLRjMekl+o/i+YUd?=
 =?us-ascii?Q?k1avVs/aoYA/0lXk7wwAXHyaPyXnxkf5qb5ZF4J9zOtNPFsfN5uxVHIOzJRz?=
 =?us-ascii?Q?KRqnVdXZDyfI3KBIRNfvuzmJmyz7n64piTwyQ504+BW7XKBPn9Tc7WRgfC7W?=
 =?us-ascii?Q?KRHkhWLHXdFwfyynclrzAVdGRZ7Lbte76oiG6/RlEL09CZuFyRHGMYtrAzoB?=
 =?us-ascii?Q?S/GSogvRdlNpMWwHdwlyf7g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03eb26f-0009-445c-01e7-08de20b9f9ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:46.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUn3AWzxrdMDT87rc6Lh/bMYScWVBjXz+UCRyYL4arge+EwBPoD4de0nxeb7omuR5D0fWr4wSKf++wJtwbqXongfb0EBT7NGBzJma9xYxkKeGUwLiI3b75UTyhL0ouvq
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
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d48252cd96ac4..d01793394f225 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1256,8 +1256,7 @@ static int mt8365_afe_cm2_io_input_mux_get(struct snd_kcontrol *kcontrol,
 static int mt8365_afe_cm2_io_input_mux_put(struct snd_kcontrol *kcontrol,
 					   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(comp);
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-- 
2.43.0

