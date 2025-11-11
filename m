Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB31891A9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820592; cv=fail; b=Skv8dQCgFiFZlBrLrxA3ZFUlwsoBPmnczGGd3AIoV86uHJJFg7fTbY7Mpyo73ZRuMToTVlqj5CRzC4JReaPHoCPunKcU7v/jKHf51gJLJx/PUob8N3ucZbbuohl3im3eWzoCafs5FtrhhC1gcDj0K/qqazSxMNmUe+M8MzhxqqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820592; c=relaxed/simple;
	bh=INX2DnjiC+o30csKK2qkNDxh2uWr/4LY4LMD8aFVM5s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k88/GRDcVQ4MCsJep3b9y/ffQ3ZeHI5lbY18h64oNUe3Z7i+Gh3H/vZUKeNmrCqBaJEQqM+uq9mRaTlRr+3r2Q4aZcbaq1BKzoEkWjoKAP7TAEC3Cm00HxrjzAD4SK26oWZtWyHcpGunOyRVeqZpaaNAHvGF4oZn1+5Kn21WKno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Yg43NM4v; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Yg43NM4v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybCGiD78V7iROefuUYR2CCcbgJTT7kxoKWVBnsvqZRnVi4pqonIo1p4SBax75XKSPDumb/u9H0v2ZUZkCjChxR9Q4+naKgLmClLycyaZNU4QwNKJQjC3Os+hwz2BKwL7wWIjVZdtGPVh58wtrwra4OL+lnbhYbCa1Yx/wHIa5z/EZn4/q8gW+BnDIUcSpHSPhZf6q/jQ9pqW766Cm+/EVqGeuAlrWURcnG/69hMG1ZJ9M8MArkInKAhV6l736HlF5Wj2YbcOwQnWhOPIG4gqtss50T6/wteaLCJPyE3ae623VOXd3d0s8u6t5Ks93P9aQFiRi0RVNDbw+OYGp3fRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rde/n4aom2sJL8HQWZBLmQYeQ+Gj8mXNfbue1pubKzc=;
 b=xaqK4eO76hEnh4Hu+apJZCR+WISd1hKHXy2r2344YeFfJ/KtSdKR8hZ26fBti/tonupU/hGZwwPxHoqFbG4xuX6YeFlK3yX2BeDSzi5S61sMx+pxDTb1FBTh4PFwaWKrls2+ZtG6QLtXO8qQ6BTmIDgRkCER9jq5h9dh6eD4IvT69dD3ym0/hGHwmD/YTDrK5bA6W2Ud5pQSdayd3M1rgCb6i9TBlBTaFEJK3/CYD7WBL6fw+yibQCYaTehONgp/oq2ndVhLu3CEPjVgO39iXTN+Qg92siV4f06DjuHmLjBQp2ujR094cQC0Lr2oRI/dWjj0EOMkxlVaEAwmSmpe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rde/n4aom2sJL8HQWZBLmQYeQ+Gj8mXNfbue1pubKzc=;
 b=Yg43NM4vwtMonMKOQqtmrjzAxEWFjRBokCOtVoALo42D709/g6Iu/uF8OvM7CHNm18ivj021O5fBdgDUIx2eRxrou9pG/7CafCmjGu3U5rlObdZ26ZmAzjudq7WR2D3GR0mctWnV92zwOdX5oUPiVFAZUfFkwp1WLq+itHzdC0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:08 +0000
Message-ID: <878qgd5ser.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 077/292] ASoC: codecs: lpass-wsa-macro: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:08 +0000
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 9585c025-5d27-4c46-3062-08de20b87d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MI4zb1D/YJvtDGuKim2d2mhTke3t4HpoE67SAqBTed/Lg3UA6wRsU9u6j5o2?=
 =?us-ascii?Q?t4v3GhVeZfzdhJBU7rw4IUpbMtKA+gX1D3qpm6p73syRl+qrMs5dbRNGGz/l?=
 =?us-ascii?Q?5+2rz+r9uKQ2weHhXyqLHKuTlSEu8YNpolqX+2vZLcivqN/gYY10Z+dHS95u?=
 =?us-ascii?Q?2ggqpdEKKGyl7EuDVai+JIxvaGIcD16NiZXgOB7WD9GisBfBX3xIymEgsZv7?=
 =?us-ascii?Q?ZuOEpEVhp/HISjBGyFf7800jMjDrAXIQhlkun9+yL5LAwI4iIAXNaRu6+d65?=
 =?us-ascii?Q?XGRan6g6l/RkQGIjB+pl3ON9x/EwMPWzMi5KVnIaoA7wPZ98KzZ36BIDF7FV?=
 =?us-ascii?Q?5FtmO4l8zkVVHfXkK6aIFKgHMlo8CKCtmQE7eA3NHg9ZwlvJjQvg/RunMHlF?=
 =?us-ascii?Q?DNSh4M+jTQC+h7o8Bqa0GTAOYHR35D+/9DXAMKM4RYmTcBBhkltao7QX79Py?=
 =?us-ascii?Q?IaKF5Gt6vY5ysavjCubvRGNuaZ0nDafq+aylIF/EMqaIVrAB9GmdFTGbMgtS?=
 =?us-ascii?Q?a4rz14GsIY1DSMoNDf6yXVxd9FlcanBt+hZpL3At1F4mJv2PUww+MYR1TCtv?=
 =?us-ascii?Q?yKqxMF+T6FZ7H65h03quEaESENX66GSgG/SpQlu67wp2i8fdvLhtjJ6gcS+I?=
 =?us-ascii?Q?AFE0qHmIB1rXU4qB0sFjlZatdNfSlAKaEIsyX7+auvtDUN4WxU1hbs6zcVDq?=
 =?us-ascii?Q?hlr10zt1LdOEm4uXkwPuKR3D53203XAQDNXKHjkZM3DMcC/BqacYTmk8XLk/?=
 =?us-ascii?Q?DvMJqQjPwh5LfGKY2jUmVozgCpcffqTYqokdwSKMVb2yRgNFktD5VOFCq8TG?=
 =?us-ascii?Q?RTDhU13z3nOH1IqFuyIjEiwtm0ufrtrebrcmTZmz6E7wimALtA4JFbqq1hbz?=
 =?us-ascii?Q?/JuKpmM0+ObXHoediGRaBgW2RQDqWjdSV+02zMhYWOEV5nUogRTZ5vzpYLhd?=
 =?us-ascii?Q?fZgSFvKboh1rOY4ofOg/PXP7qI9Lqy+fHExqcGyxrcxitKmftKKg2iU05jaq?=
 =?us-ascii?Q?gA3t689kN91owYkp62omdleuFeWeqCRVx/XL0kjS1ZRJofvcrQ8euyerruys?=
 =?us-ascii?Q?020jqzvJJc1xmwz5+4S+TocRSxc6J70PY/3qaxHAqxwyhnljyHQmuOuSvmdR?=
 =?us-ascii?Q?KpDlv6IS1COJI7vBjK/ZF4k6KtuTWL2saVsDUIWQ4MG9W1L0F9KGx0Dto0QJ?=
 =?us-ascii?Q?e5/QSxMyacvcnzipHqOyYR1D9AKtP5x7mYdisLwB/N2ebVUI6aGH9MKO/g3Q?=
 =?us-ascii?Q?GcP36fdScQIA91JrC/UoMDeDVKPNq9s5MzEM8ICX3DiGrEAxda4nIPpKaqPJ?=
 =?us-ascii?Q?9YEQThIW6YbwIar3thzPFe3w7c6QUBHeQEjjuqa4h51iaB+iurtqgnmrvZnv?=
 =?us-ascii?Q?02AoEsGZwB+YTki64CTzi/t+ityBoCl4mAl95MSxI3+zxHxvlKey/IpHKpvy?=
 =?us-ascii?Q?Ojtp8T8sVsfCNNEFj6VjJuSyRJwUtoTHtq1WS6oeZ6eNutrcwe2wn2ufdooC?=
 =?us-ascii?Q?chEFwQmacNOgzSEJhfxR1plLTEBL+B+6U2tP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hhDwjHLGBasnzi/q1pJxFmCnJH6XSK3L7wkhJQB9TQ+bIHS0mWJETuc/Xkkx?=
 =?us-ascii?Q?LhE3nSRxSav4O+Ul7JL/1QdPQk0A5QfataEGkQgXuLojEbmyo5DXRkc/V6MB?=
 =?us-ascii?Q?IFgQLb11zMTaoaQOWB///oOYjSC/bgz/xzTANfYfIUqcNPyORF3O0By0w241?=
 =?us-ascii?Q?X9zjdwZV4J5qTl+FcSfXdN1MgUM69cbN8yAqH0uzNddH84jn/vi+AbUTMPfb?=
 =?us-ascii?Q?wux8l5rgM4ahC8nm7VUfCzaugWzqvtsGHCGcdGRE9mJZlvT95urvGyE+Gau5?=
 =?us-ascii?Q?8+a2Rmd+7oBQ99YHg3ThTAJlEdtoFMNfb1IlDZ19OEAdBaFK4YxpKYmc56Q9?=
 =?us-ascii?Q?jMcem4dwNR5604Eue1X2GWYWK3cilpgnqojENbigHpicYR1vuAd+ioc0JGS2?=
 =?us-ascii?Q?XOWaNHoCcJGgFxWmOzTUclL3eP7aGEpvBSAxG2Dr0T5KD5ooO+pM9zF4k0tE?=
 =?us-ascii?Q?8vMkCTwvosUpUXVdYWv4jRs5O2wcbsLiz2z3C6mfU4bbIfMiwttWTb7WN5J5?=
 =?us-ascii?Q?DVd/IqI/+IXtzwrf9hHppPbbFNkYvatgx2+HeyycSRkb08ieGIYhxEbepul6?=
 =?us-ascii?Q?7Z4mQ6Ig2PI6zIdfjBFyDxs4Y/kJr6wWrjmZgZUlLUYwCBQWvSFqEJ7oY54g?=
 =?us-ascii?Q?qdfEXrs4CQazqZWfcCJl8j9mJ9DCVn+J0/HTT4oiW85WexJYaxk0y6Z5tjsU?=
 =?us-ascii?Q?+416gKPGliNN4q22+fSfLMuYyzkzjdoefn5qjxkhqNkYaL8hXonhaCf0TfVV?=
 =?us-ascii?Q?riLYRpa8hviu88BrptrwHT+ZyB6NvsMKhHqe0dZo7M0NOyBgSyKaK/oAWjb7?=
 =?us-ascii?Q?QTckt9VMK4NRFkMCH5hqjnkFX7WLF6Kot1Ux8fb3Kt7OneMJ4G/r2hDyGpWP?=
 =?us-ascii?Q?q2c7w5xPOJd3YmHh1+jLAsh1NfcugPjfhQr72Keugqx1WU22gPFUXkLE2gG/?=
 =?us-ascii?Q?80oZjTLXovN2QEo8rC+DQT5KNFxy56PWZAoycwDm4550qlim/hURe7v2ttVs?=
 =?us-ascii?Q?uZdKuXFudh5ZqvjZbvHDTBZAZDJZMj5JWnD9/RqD0LXMUZeiy9Fazm7tQsLi?=
 =?us-ascii?Q?9HiTC/DcUGwZfZvNsNfA99A4rBtrqOaknrA1ow3D2Q2auNTGlvc1uWinwxSl?=
 =?us-ascii?Q?bu4V8qGSnMnD6UrRUNL6mM0QBvN0n0hUVWtHvjtFaBLWssIExWiXdDOGSNtr?=
 =?us-ascii?Q?mgpi+Nwcp8L0+sMz8/ApwidKIAzgXjeux4hcTqQ+N68hRPpml24jCCQWs9pP?=
 =?us-ascii?Q?8GIWCXvDNooj2HbcwoBznT7WMaYCDwGdLhMM7bqprYKm/c/0HFgK2GYdZp6/?=
 =?us-ascii?Q?vNxLSQigTiFSYD219dRIUpXqnbubFt5gro6uGCAYVn8FycPpkM/ajONHu/rd?=
 =?us-ascii?Q?6TMkZwNZvMmkNxTRV/FVmcid9maDwOm5z1WgxI2tD6Bki/zO/YlzWioisInf?=
 =?us-ascii?Q?r7s5zvFv6/3sIFKUxSl+hwmO1uSpBb4jPJ07YC9wevrMde/UbpMIdL+I+i1m?=
 =?us-ascii?Q?XUJiSTEP5Zmrlim5WM/OdEFLKIkNicIP48RPYQCUp2N98GguqknLF6bz2S4E?=
 =?us-ascii?Q?+C5UtCgz3lApiVERIRslxk4Ukgm6q4qiAU6GB5Syzud0rgAHIlyvPlUBibDi?=
 =?us-ascii?Q?VKckGfof2arnJeSti/jPLME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9585c025-5d27-4c46-3062-08de20b87d86
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:08.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAu19hVn7PPrdxucwKXwQucdtEeAv3v9Iy4b333yBewqGSLVFiQiAGuuX0BMpyyZs2/uy7bDW+16vtzZq0+ns1x/v5+9Yh8CHta5L3XPHOVw8cBFYrH1Z1wrq1Enrhtn
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
 sound/soc/codecs/lpass-wsa-macro.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index cc0488965654d..3d38c9c213ae2 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2186,8 +2186,7 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component =
 				snd_soc_dapm_to_component(widget->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -2200,8 +2199,7 @@ static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
 static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget =
-		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component =
 				snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -2331,7 +2329,7 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
 static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -2349,7 +2347,7 @@ static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
 static int wsa_macro_vi_feed_mixer_put(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -2665,7 +2663,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 
 static int wsa_macro_component_probe(struct snd_soc_component *comp)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
 	const struct snd_soc_dapm_widget *widgets;
 	unsigned int num_widgets;
-- 
2.43.0

