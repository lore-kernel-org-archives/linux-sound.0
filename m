Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5B30B503
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416056; cv=fail; b=Ddp/sOhid2RX4A+Ig3co78zdxZq/ZK6CnKaGji64NPfSAwUX03m54SeMqfi1TYdo2rHnezCqoO6RklwkwnlXkZXH3h5ksC5e2DxVVQ0a+GW1e4CsGIID4Iw16jCKE7o5/KYvrbjh/1EAl6MdHgNr1/xo+OmYvynkSbqg4257/jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416056; c=relaxed/simple;
	bh=X598hoAcQRi+9UQi8nOtoGjbqC50+tiX9S5dWL7aA3A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XF+qLuIvSJQXVA6MD0NfMgceJD3rPLgUi/M3rGg9hoRnDVawa5OAcJDl8LBmBqV5xmXAeOgU3W8jbhmyT5qGILCdXIJEHDFZAk5xcPE5/ZrxTicdompvUI8owsIMGga4VyvRt2tmml4PQZrUM2lliv1RZ36BxUHEsErDfw/lS24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bUX5Lt4C; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bUX5Lt4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1sg62YSg65bpQK1z/J6DQ6cKh+EyVIm+PQFOox70XR8U4coLnejZknzOLNrjRDwIW1deUNBMPds0NWwBALo/OxLibrqV7//d7b4rvrdqEaJrI8Xd3aoj75aPoxBbMZ5Me5a88HA/ddHxUMz8/JL4qKTSJTBh3YbcUkQxo1cdYy2bOxzgtjjk56cZGfV0ra/bNnMqLWQ/jRqnwwt/ufISB92Z8bIVHqWWbbvO5HYqF4kzsIcZ/mo8uHF5o7lHCxt8/2miV/1xUDQLUHHMJKZI+UF11rTM6X7ocmg9WJSjrhbfQmvTGPNvfWGYm5hWKvzgYXeUD0ytQSbh5hdWvCDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLd4XOEsx8PcI59llRUkJjbDDs/yQ+40k/NWC5hWD6k=;
 b=KHSQ3Rk+dZVg+xgZ6spXrPu2g95MxlwJzQo/3BNsAg57K8xsrmLupl0rhDhN9DzorQ06ygpg0M3rG8aunJ74WXj4Ko1EaqRDiwnOxLKI04f05GPsJTvXq1EpzBasIsa+NaqnKTO9mHUjE/iD/UoI4aycVSp2omtqbSuxePLM7yUJzyl8m0QXBon0z4h+oKE22PSYiMCp4zDg9YChM/aOu33nJVElirVgtnOOrh8QM/R5B3NhlJrpGPeOpEKHcC9EoUmS/ct5YO7266AAeJijDBF2Hc6jwj4kPqwLcvr2oYnXsM7rJjSVBZ3AP13eImgzUtXt0tmu5XCeMZ4CfCb2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLd4XOEsx8PcI59llRUkJjbDDs/yQ+40k/NWC5hWD6k=;
 b=bUX5Lt4C6Qop06XIQNsZYswgOiElgrxDBqhnDEnXnNYWQSbzmx2kRBM9vZUROASbaiEsZz30+Qu+PkK40CWuUgHZ2m5EgFDDih+9AZvgG6nC10gaQ6M/GWdSOlTx1eOevvw9qSFPyNc549mjsK0b7efXPCmVaVYHhMo+XIBAei0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:33 +0000
Message-ID: <87o6qam7kb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 130/139] ASoC: mediatek: mt8183: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:33 +0000
X-ClientProxiedBy: TYCPR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:405:4::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1dd9f6-82f2-430b-d3f4-08de0ad9feb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bd7609XTVwxns23H3CkBwdLeD8lhXxYmZdF9S6JYkgU8Ub4n2vxlgKJTH/oi?=
 =?us-ascii?Q?P+Sh7QAyej1vAf6KhTEy/p7HDhXBMDiCLbmSimNjnntCK1nFCYYrIgz5QUtc?=
 =?us-ascii?Q?kZYXzr2RuXrL6G5OHrGHkiwCSJHjfeAIGNZzDZkrsSbXQOttTcsvXNw9S9Ze?=
 =?us-ascii?Q?/3Ocy7f/7g17vQdY0W5fuebObX8LvhU6LyrcgJh/ECi8gvc+qm79aW0nIMbP?=
 =?us-ascii?Q?QTncLCN7ddLczKDWZ0bwBKKXL07dfr0xH5/aIXtaQJUAlECOk1YkU9sxPSd2?=
 =?us-ascii?Q?I14SfOSRHbe1czXlTwWrCzku+1PXT+lWH2cRYx44uv40s5WsmtBelzsyJ0Xi?=
 =?us-ascii?Q?/7jDz7kgGOUZUHwex3nM1gZMlg2SgWa3lGlOPF8o2fMMzCM2b1InZ5an7Xme?=
 =?us-ascii?Q?SLhmI2fMJ/RdCC/7s20K3YnSsleO1YoE9O8cB8Hj5UNMVAf1eBXgMyutUdpT?=
 =?us-ascii?Q?JbuaWBqYkBWELTuxM/Fa6fp9odDtev1W76qmDjFL1p1alqgbjJ5X2qbX54QK?=
 =?us-ascii?Q?IKAqD311FPydRrC5C05n3AqWO+tHolTJ5xg4t8WON2rcTv75aD8dikMKnM6Z?=
 =?us-ascii?Q?Jp4Y0D9LOmO49Nn8+VPFrVYY3yp6hmeRPfRjRunO5OfLNxvM1LyHNb0h76Md?=
 =?us-ascii?Q?spHXigGvhLI4XNUhuh0QNrr4vFqWoHAA/PkV5uFi3eA8J5hDIzon21ois6LD?=
 =?us-ascii?Q?RRDhykCwpp3FDhkb9AIAoO9i+Ha1lcJ2w1q7STK0h5EcSoXDQKsoboOQHHe8?=
 =?us-ascii?Q?XXvzAwF/K07MSLgoueruVNk7lhiK5t2AMF6YTBq9Aa21n64xtTSm6DvVta76?=
 =?us-ascii?Q?WkF7dHQaZow1nD6v/PkRQ4G4nE/WtVvArL3CIT+uVgjJB19pnXJgPhaMacUl?=
 =?us-ascii?Q?+jTLE2ADK8BvJrsKoUy/hVheCPr9kaTNQEzpWwxOI3RJUVsiEXvonQ5n97dG?=
 =?us-ascii?Q?1E0s92XiCWbIiMyactbY5AuJIt+BfdTVw3w7JN+2CDf1FcvSjvryWzEKJqoS?=
 =?us-ascii?Q?U/QltY5QrYf/XxPSBxejojssgbI3o+cc1yCakGOQ1+IzbuyCp9DIUMrUhUH1?=
 =?us-ascii?Q?NegWLbmoAjKX93Bnoyh0+xIA0OMiUa659m8Wsc+sLHtrTn5gv7RkbFjgYlVZ?=
 =?us-ascii?Q?tp7ijvmqiu+Sel45M6QUlRXlJCFz23V/mHqt9TOiaO7MpF0rteJujyGIz/OW?=
 =?us-ascii?Q?b9GY5I9Vs+QlHzSd+fMKhGmHSlauIyOZPxLRAwun4oWeV1NMeR1ru0umt+OI?=
 =?us-ascii?Q?1iHgpp7mGAO4QpiZ+fBb79iPqpFitNc8jemojBFmsnofuubjiU80BF1n0mnr?=
 =?us-ascii?Q?SG8stFV8y0v+g8cIqVKc1o6Ive1Ycm8yggOxaW2DQG1cNBlQJv7AiqfBA5fu?=
 =?us-ascii?Q?tnP26ct+X4YSDwr7KcV3bHtWVKZr6pYFuduHGZw++GbxeEHTLF/GsmLy6pM5?=
 =?us-ascii?Q?zIBHYDYVdEU5abWCcN3URZsx+LAAhpzk4A6nrDHkKD/DeyHPTRhpLtSv0JMk?=
 =?us-ascii?Q?flQtubD9Ni/5tcc95pBg69jY2Rp8Xx2sA/jZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O4QYu2P5UhdSFy/l1yRIstbGgyqd9QL2EIimWwYqBbIXFH2ZTkLSihQwmwxP?=
 =?us-ascii?Q?9nIsBCSwOizzKgUbsGG8Svp6gmC3+bYSo49uyss5FrSmfiDrbWDkgBhLVu/H?=
 =?us-ascii?Q?F6Nfjm3gKHjA5ri3VYHQez6jgnZuCo60RsU7khQWjKGeyrWaIYHiYW0+YTgc?=
 =?us-ascii?Q?XGiZ49hB7vUHEcx2B7eCtLO8LTzaF1fpghiZRaN2K10PSTrQvPVWRj9YCbKo?=
 =?us-ascii?Q?WDXSsrtWUY9WRVsznntwzXxJ2z6oZa5HU35LCf/qkh0WwhImT/i/vKlDT4CT?=
 =?us-ascii?Q?gwjhBl3HJO4E173cUq4nZjgqo06lkf6+LzcteyeO7Ze1/gCDmS9GADsp8zYg?=
 =?us-ascii?Q?SKCAv2LLCUoEZ6EBvuKZZ3/KRxupwQvty5Owj+QMRVCtzaUzSUwL+TzHVU3z?=
 =?us-ascii?Q?BBrdMBzRfg5oDl0PKolJEKYq/qCVb6ULo5+4ElNwmyDG3X9olMw/kke2TKxp?=
 =?us-ascii?Q?HVlZFtUYZDg/Grj9wySUaIjMadAjJLGSCj4izYaBSKuQwwC2r0Jf9J1aDaf9?=
 =?us-ascii?Q?rqWf4TOdhsdYAey7ulLqgYJfY0/3+y4vnJslhx9d1zApUSIOl0vDq+qAox+y?=
 =?us-ascii?Q?aFilCn6mRekWeKFEOcFcCvYJh4A20NCNGhNiBSCIICMKDBWKdy6TjNNcu8+S?=
 =?us-ascii?Q?puUEFhy/zvbFxUwqurqwubpL/7eL8GUIRCn6HKiUqnYNS09USxzy2VOGplKq?=
 =?us-ascii?Q?wBGikTYfT1oKNroqYFrP3rJJgBNE7hR8lat+zz45xyPisFyDK+T22+JOd2fA?=
 =?us-ascii?Q?3lGHufOxbGX6pO0M+faUB6zzaOnnVIijHv2clIfMT+BpCw/Up+PUgCVeKnX2?=
 =?us-ascii?Q?r0HrRVbc1hSoQ3AJnGkl5a/VMTxf47/1NChB3IYBl43+SbWdBKxVGh0ORhE2?=
 =?us-ascii?Q?tkWqlo5eenp6m/BexnokcgMMYCz8jIA9Jm8/BkGPG3ZG4AI/G2sfZop6C2Fh?=
 =?us-ascii?Q?NxIbgSL/tLRFTUdDVFosUbnPeF5TYulO0pgTFeanNWO+blW71JG5ZhdcECWQ?=
 =?us-ascii?Q?GWPIHRpEhTiugsS/YkMLXFPX0Qt5oWGkmt+/vxM/fRGD23pD6QjV6L3iExJF?=
 =?us-ascii?Q?l6UaE2uD4vkmUDV7DbwqmMVw16M3xd4E12Rc1BIf4l475loQCbyWa6M6Wq30?=
 =?us-ascii?Q?kfgyLw7OF2LHXBLZoB/TtyfXHzppTzbbcY22mTnTDu4dUACkWegaHCrkEfhn?=
 =?us-ascii?Q?I9DKSRDdlz5MLf9akkXuMO+FKwG4bRJQkpxzkr1yA149TtewdrjX5es6HYwW?=
 =?us-ascii?Q?7D7dhuH5QngXpJOlGbky9/hH8xn+tqy8TuV1Y9n1+JkQUqHLUZOlU5CNrl1z?=
 =?us-ascii?Q?1Oiy5M39ThAHbxI4oFYIhQSrJaD+B/2bkTdsHIuv2VQ3GjFdj0kEtJg7tQf6?=
 =?us-ascii?Q?68AzzeabB0367V41Z+U4yEbkR87yQ2792jjxIqpJ7jLhhlY0JuUL7x6MgvyY?=
 =?us-ascii?Q?hWL+IkxRc0bKnXhMZalXDEOqTe0CZyrdvmFnGYjIf3dRcv7eqGyGVw6v/K02?=
 =?us-ascii?Q?BENzrYCttmFMvq4H7jBTJ5PKn8o8kS3K/SEoeJOqCT53J3rWe9HadNEsr3l2?=
 =?us-ascii?Q?OVRa+7M6K9fC2pYVsAmgUcUwQYvCqz7B/1FcuuDnxe78luo+wHsiaORV9mQ8?=
 =?us-ascii?Q?nzC32ajUi1TWxO0Lj1t+uU8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1dd9f6-82f2-430b-d3f4-08de0ad9feb9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:33.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6f3k2HbSnJ/367lNFGL3KF4pGlD6Wl/9Nuf4M40lk46xpS3klXILEvivw1Dh/zaZiFzKtLUzwqI9rbTjF8HL4OitlR4KSJSJo1yoNa4plAjO9TfDXI9h5hP2gpfG0g4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c | 4 ++--
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
index be69bcea2a786..1f55d9e342ba4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
@@ -113,7 +113,7 @@ static const struct soc_enum mt8183_adda_enum[] = {
 static int mt8183_adda_dmic_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
 
@@ -125,7 +125,7 @@ static int mt8183_adda_dmic_get(struct snd_kcontrol *kcontrol,
 static int mt8183_adda_dmic_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 5cf5592336d33..3709100a88659 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -118,7 +118,7 @@ static const struct soc_enum mt8183_i2s_enum[] = {
 static int mt8183_i2s_hd_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 
@@ -137,7 +137,7 @@ static int mt8183_i2s_hd_get(struct snd_kcontrol *kcontrol,
 static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-- 
2.43.0

