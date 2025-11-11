Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A071B4224
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820635; cv=fail; b=V1vL7QvIr8rUh91lPo0Uki3a2nb6yPj7BPt1/X/00fCfnxl8RMfIaJSw1vpfAKaopMH29n1rbPEwgu3vWj429nm221GZcGscoQbHa5sJTxCxZEfZkgzDNH48E36pfAKARXKxhNr9eyUkHqo+0J8GVCoMzgP736JhozwL164xLyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820635; c=relaxed/simple;
	bh=KBM8zJO4MFWlAFm0F9vMKCayg2+jV333nMzywj3cqOU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vES+jsDtCrgtQuKFyxVvaSbCc81wnWtpCsnFgfeYqHI1guf1304b0yuno0gavNGHjOP29T3Ha0ddmuVJprrGMrHos6rOaxQbkztz43q3HOdnjcdKmTU9yHBaRojSKwavSLmg7yEdPwbhcMopZvW2URfZZxHZ2hZVN2x8TK42pgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WodfL7+Q; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WodfL7+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXSvp3ieh4elT7XFmWkUiWQVLIE4avkqLMToTilpQbc3ddkhpQpCOSZx1DELhptFBiLNibj8KitmoS0Yv8A2bEzc2VT03MMHv44CN57kC3cPdnXqguySF4cjtJr29fp4+mGg8pblGVhLXlgZJGRCQbbEU7KpCX95SuOIYgYdNGEpHprOMd7UPqHxL5TDeynEKA0qDetVkNOQfBqoPhpjBQORqBVPmKNp9LO5GdVpUpDhwKRByDOQSJ8vyIzHLEMVWeKd1zZ+v/3HIBkkOxTj6FMFMsRDYJehVmAefQYziGBGLiFdK5uRGDJGqMu+VOo5Hs0h+zfg7udK0q02PuqY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVwGeGD30Mtra/553G9unnFTrOWOEu7qK5vsSdEwc0o=;
 b=x5K256GcWimltp01xoDlqfhPhq1zbn+MWiZY5Pg16INryqss1FEcDCU9vWc71t3xOg7OVe5Wi85Kz20LsiIBXAR6kenzyyHbUVmHcTV6Qjx067jj/9nGBDbapnN9zOfAcF4Fj1BrgC+S6qjC7dZEvowyS4sibUoJgbxEUT6O9q+b7LpdlYxQZEGGd7oLLmjWhTyAYvUGTPSIwCwJSdWxY15bv1MUIgptQ9dk/80OppSo4DOfcW691NoVBbZluIkY5L09TFDZimryz2+iD2BfwDj5IAb4C9Sxrl0sJ0KwHtnfrRNcVJgcN41LrrpVbhm6LgnKPk5o6O+hX09C6Gf1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVwGeGD30Mtra/553G9unnFTrOWOEu7qK5vsSdEwc0o=;
 b=WodfL7+QtUYe0/mKOv424aOqjuoda9DZ6OAdAJibzeiIERiPpM+4lWS+kiIG7iOa/CqJNwJoGURYP+kgF4z+sbAGicTg5pgyicK+/5PNBi+QCLOTUIHxblJF1fGV0P1RCgh1MlMl7CBvyNgeZS9+acmCFkdjIGTsWI6Iv7spdc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:51 +0000
Message-ID: <87qzu54dt4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 089/292] ASoC: codecs: mt6358: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:51 +0000
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: b07994a8-9f34-4e60-e5cd-08de20b89743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jr9Affv9EZDQkM9KT/KzLTpErkrXT3bBdNd1zuSlxK26jpsLdzsZOX6bbWP7?=
 =?us-ascii?Q?7Ywp1XVsB4ObQsCV5Ck4SDl42P/LVxuYoeJJ99JbtDFgxv/L7/jSOIEptr24?=
 =?us-ascii?Q?q2STsIi/nNnMozuKvGY9h9eLJHwkDsOalMPubkHdrbtIlnQ9XrAIwaSYa1qO?=
 =?us-ascii?Q?vaPwbvK3TQbcsLBinThNibsDGfwnNVVFcCLhMX4ixkRVDtKFYLx1rGHhBQuL?=
 =?us-ascii?Q?jZRoVxxGF4Ztvp4fN01Cwg2bPZyDd4/esoRWscvI4s20DvA/XcBf8y1an+L4?=
 =?us-ascii?Q?v0K5FyPSNh4n/3StO7Js0NjsT87eEfOr1uxXYE5+3PxeUpI6X8kKgJtjHPzW?=
 =?us-ascii?Q?FyMwoYSWsc6O+y2/itozsssNazuWfaLNz+I6n0WosK+MhmmgyOp0lOR4hgQe?=
 =?us-ascii?Q?39OmiwuOxyBKbx9RRJqiT0UqpKemoo791ZTrXtAnbDj1dzxN73K6DFzz5mgm?=
 =?us-ascii?Q?BcBCNGC4Rz4WR2XS7/25aVKaNwcBn8SVqpwNp1XLT0bn+9VGxYHTBWJlcqPm?=
 =?us-ascii?Q?1S5kMOCxS2NVobZ4ZJL4wtzX6Waa/uTMdskiqDUul0GBb8oTzpIvkImCEyk4?=
 =?us-ascii?Q?V6bQGB99fSF+nXrUWd8XGF0+ndx7mOWd7Pb+D0k556NDcM6Ur9reiXCNw06O?=
 =?us-ascii?Q?0jyP4/52YQbE7Ic0tsshQE0O8U2FL2FQUs/QP8+kTzXQaySuppBXz7u94OtB?=
 =?us-ascii?Q?llN/ilv6XXVH7KU+oqJaNC+PVAHeWKcBBwZHykhaqlBXl2G8RDvnaGppOwLP?=
 =?us-ascii?Q?xoPrdDr2lFCHZlW8GHsbZBeUylffJusYvTpR9vTMWWZAk1MdWLz0XLHy+iph?=
 =?us-ascii?Q?VDoNbqU/TvgwwmsV2v39YPvSIjWKHGZCVI9E3THDRROvmBySqnwfB4uVPZEd?=
 =?us-ascii?Q?6y1MRaIlfKDO61H65i02d9rJvC274hBPPMToAu67wrHm+e5bGwazp67muiB9?=
 =?us-ascii?Q?NFEBBBaVP6kEk73ojtF78kUbT2x2ioPfUQI609Uwoy1o4l+HzwWpRC6N97Ue?=
 =?us-ascii?Q?GxiOw/HqgSQJg1MI118TBhuTTs/VR5/TFLvgZPx8J+buuvFZzL384+sl9vqf?=
 =?us-ascii?Q?4UrAR7u4STCZVlVgFmYdoNBeJa5FHNRYHwvg8sdWFiNSM2ZcKUf0TGcyMhKn?=
 =?us-ascii?Q?FvIcFQUS6TaNXWfeIHbMDdsezkJ2FjKRe9nIprmkwcDvtmuvecBq9QUo1FHp?=
 =?us-ascii?Q?qVpQ4Qh0rQijKF/mcgQ/+H4yFIOZgTi84KFxd7ubyXyd0oygU26orhtDKtno?=
 =?us-ascii?Q?nnEYeRKBt02g1KnutAy1rDvmBsLlSEbkwH9C+HZp9uJ3HHjXmm/vF1c32U+K?=
 =?us-ascii?Q?EzESNSij8sQpcbnu9MOohUUeIALVIrQuTaN14P+CEBdC1e9JjyXSdmUq0Rkt?=
 =?us-ascii?Q?M4A/+H64ZFFVKjTHEznqW7y9wBdTARJBWr848VgyTzMnfEGz6QXkhFbfDnUR?=
 =?us-ascii?Q?U+4KWI9xVm+GLhvL+te5xOUajqUh5uq0NEI/WiKvWDFd1vWDT8lsNuANDfzx?=
 =?us-ascii?Q?GZ5QbAkJ5hxxU1w/d02NFLfEu+hMRPRCz/k1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXSG0CTc8TqzwN3THMExicCevCDMnD97uu11yWqi66ew4utuvAAyQiSdZ9Nr?=
 =?us-ascii?Q?wTi0IZY0L07ywbVDSjZAW8UwizkYvZKzGT07IsJ/95fWPyl0mcQ4Jj884mhD?=
 =?us-ascii?Q?sJuIjxGum2BpzaUORuERBfT38GIeKm++b6PnqxSCrIG/tBB0YEqaTdZLQs0G?=
 =?us-ascii?Q?yNHdDOqZUzUJCuXhFXNYT1GO0h3SYOvihpAHmDCVSexJsw7J+385B+T79b/U?=
 =?us-ascii?Q?n8mYJXidx40PA5RwDiQ4yijfXBHkCW5WYVfiYpLDke57FsWMJ+JzlDkFAr4B?=
 =?us-ascii?Q?kjUYRkO3mzpzSm9VPh1XEjq7MtWX7P2wYKsURxD1ONwnqDUwhEJYtZ8ds4sE?=
 =?us-ascii?Q?0embArTq8FtXmZI0xQZmUeR+u+JhnwWQ0mg9rPaSDAvK9hf+byw69OAS79ZW?=
 =?us-ascii?Q?BEU8BqTrTdnZciWPSf8e7qRP+30MY6fu3j57fQ83I1zRiMFXy8CwPnX/F/G7?=
 =?us-ascii?Q?FJj9cuMKsnjt58hDj8KJZ5GDeYbQrZZBAc1vfh9O2IXfwVOnTnjxy2VffTTM?=
 =?us-ascii?Q?5VqAKBe5540FfXs+IFn0ZoSZpiBlEms7vLQxRI/LPDlwGJuzFQX9ZBRuxGx7?=
 =?us-ascii?Q?foOIHAlgJrwN/VNXjRigRoxboXtlXHiTf04kxK5jbhj1ToxNACcvvgIkIa5T?=
 =?us-ascii?Q?nr+qb7K53GBTQrofOOZtyz5ztPW5emKy3lqykaz74ygi2bb0ffFy45OLNpPK?=
 =?us-ascii?Q?HwkhjpdtknvARqbggTqcNVQV9YURNNC5CY/WDJ3pMwMkfkxPjxbJJ5qTQy1J?=
 =?us-ascii?Q?oogOL4S68A1nJy4xwByGk7fakh7bLT9s8N5Onm5FPWc9FEgldfDOwUYcTxpg?=
 =?us-ascii?Q?uh2G+dVKfUVIDI5nVPRA7HBViAy+qqr6S2A3jsQ8C0hcID5N9WIQE9kAkx6g?=
 =?us-ascii?Q?KKDzYSJH/xE+oz/oDkGNyoQQlK3o5iv1xpxHxhyMCwHwf57GIYyQjT1aKxbI?=
 =?us-ascii?Q?3XnnPMfxONLKpt+4U7fkjt5vHBy+E1XTMKsB2Uhy+sjEDqznN18/Oqllruik?=
 =?us-ascii?Q?BCuWyAzCuBNk047f+xl4NO+F02IE7SJkeH56LlKtkQOS69gUIuTMkPSzk8C5?=
 =?us-ascii?Q?9f2j2TuMeMVgbgOeZhpPLjH0xxWjpaynvQL+rWLkkIV7n+rV6p+045KE+kIe?=
 =?us-ascii?Q?lPLTaNppvKmnyPMuXmg6COoCZJStTtV6e+bM4W/EE0TlkNVZnaZ+laSRiQWJ?=
 =?us-ascii?Q?AOyq2YbF68WcZgMAqF9s9uaA0eZzdg3Ii40AoyRiQ06UY/fCesI6yVjFryjp?=
 =?us-ascii?Q?Oh+ntGGOTkhN9GcOHrmdKVKFSblC1k0cJ6/3uduXJMmfpyj9kAcWdVcPbV19?=
 =?us-ascii?Q?P9Lvc/W6jeOjuoLsZKVg2Mg97+4I8lU2AHQ5UtlD1b7aQ5nkhUH2g2Tz/4nb?=
 =?us-ascii?Q?ndmK/c2+Gh80u3m0MAjW8SKF5l5jvb4RWFY3uNl9jebCCur05dqHFFOm2bNU?=
 =?us-ascii?Q?4J/qsZmLiea8JD/MW7CEOzfrPyXpm2uFWcy401eDSWmzDF7pyXHQ34kz077w?=
 =?us-ascii?Q?RG85T8kqMOO3nfL/9NTMwDZEXpWlgd1IuSPlAm7YLEzOsDM7kptfgf3KLgOb?=
 =?us-ascii?Q?I8+KgqCyFxq1WxNl1yNM8jax2lvMntcz+fFW81AMUIRwjcf92+0ZzBUh6XqX?=
 =?us-ascii?Q?SDZ4X4YOkbI9qGqVO/c4opo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07994a8-9f34-4e60-e5cd-08de20b89743
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:51.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5397hwnpOFJPdtDqzFPUYv6qDYdD1KebRMuwvy9XlvY2fd8jlg1OQOC21H+KZ4jlegVAfS7pF8QDwDd5gjkG4zxFRPbmzn8I9Ign9cEHV1waHbNc8W90/7O3c3eISqO
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
 sound/soc/codecs/mt6358.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index de611c483e0be..a787accb88e85 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -1287,7 +1287,7 @@ static int mt_hp_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 	int device = DEVICE_HP;
 
 	dev_info(priv->dev, "%s(), event 0x%x, dev_counter[DEV_HP] %d, mux %u\n",
@@ -1349,7 +1349,7 @@ static int mt_rcv_event(struct snd_soc_dapm_widget *w,
 	dev_info(priv->dev, "%s(), event 0x%x, mux %u\n",
 		 __func__,
 		 event,
-		 dapm_kcontrol_get_value(w->kcontrols[0]));
+		 snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]));
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1828,7 +1828,7 @@ static int mt_mic_type_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, mux %u\n",
 		__func__, event, mux);
@@ -1874,7 +1874,7 @@ static int mt_adc_l_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event = 0x%x, mux %u\n",
 		__func__, event, mux);
@@ -1890,7 +1890,7 @@ static int mt_adc_r_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event = 0x%x, mux %u\n",
 		__func__, event, mux);
@@ -1906,7 +1906,7 @@ static int mt_pga_left_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event = 0x%x, mux %u\n",
 		__func__, event, mux);
@@ -1922,7 +1922,7 @@ static int mt_pga_right_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event = 0x%x, mux %u\n",
 		__func__, event, mux);
-- 
2.43.0

