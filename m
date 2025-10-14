Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7030AACC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415914; cv=fail; b=V1a+8JPW5tHFt1i1JKlZpm+vTRQvJouVfQPPWJRyaLpwZcV8yC9ZxJsOMiJfxmJcNhhCD+Ujo+ssipDbm5A6X/P71xbqR3r0blnxtdVD9mlqAxei9Jv4h03FOiGbdnvqmhyYQBEEiv6SYjl6T4vry0t6kz7QOm3S1Gcd8g9ipsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415914; c=relaxed/simple;
	bh=Men+T4TkO7CBkTCEcuQo74sJNZGs+GCVR5pGCY97HD8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EQPNw8E1RxMX1WD4LtyxtQZmj/lEFpisC50QZDn+RhUh1YzPZNUsUmqqEEXVTdi3upqiWXMocjyh4rKRUEKgXrVTljGKJmzOfp4W3VNogcMLz6TBB2Q0K6zviXfdbPU4m6OJugb9Y2zdFxiiMBp+sS21N2gUYypOmqFkpuxp8wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IWK7lCui; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IWK7lCui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeWbQXitKINPksv46kFwEyqfqdqiXs8X1Hk5xsNkzTg8raXh9RhNOppx5VAOuL1btv5JHPEW2gR0Bqa12Odi2VTzlz/JsaB4pItGpJip/zFV+Wm/bHY9YxKfiQ2q7N04B7CE8jzmwQDAK4d4ZpIM50Gdx9v3EwB6eLtgDbXwqwVaM11z0D5sHW0oKW5xhhCTWTAzT1VDVtE3EQfJwTWMx9pDtniwR4Wmm5aAAy23O+WseFpC9eg5A2uixK7zsJDgB/41OEviSqy9BH/zbTwX8Q02xlKXPaWYO1jm9BCGV83ObkEM9Jm2jhODM2HIaBx9PvJWbBPAiruxqvs7MZpqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idhY6ZsCZh7XytRxJbbHAUJfx8ovo4hGpq1qjnKmiDY=;
 b=JxmkFugqrQiu5W7AyMnmgTwS01XnAbWlqggT0WaypHWQ2x8IW9WMwVXKqR90RvCSEsYmAYHOAsGrqF3C68qY2n7ZNSVhJY9FtG+c82XMwp6h2opjDMkj/qGPBSkr0YhIThdVTf/N64c0Kso+ujqLReBfc1i+P94+o+vdzDAq9gUP1N3oCA1BisASueIXj+qka8z1Bd2RIkyIzpSnZ/x2s/aGr87M/J0xeBbU5oKyj1ayh+LZTN2TQuu6fRFyBMdOrDtdrMH8IBkMBtKfoY01al3Ca4rwjln0YzYm3LceodQpcApFNSCTofxCCtaiKHK8d2WFn4cfQlDVQ6ioSV3bQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idhY6ZsCZh7XytRxJbbHAUJfx8ovo4hGpq1qjnKmiDY=;
 b=IWK7lCuiKhqOGNssSGyUlYh24PeLhLrl2yaWbA8F8rV8jfNQLNnBtujgxFVsYGOTrF95SwGEjm7X3kiKZA9/8IF2h4z9XMEdHt4sIgqEYJxfRRuY6V1mAEq0TBq5CDGMvmwAtBUNEs6daFOH2cQJwonNB6PHwl1xtGYVtew4TLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:09 +0000
Message-ID: <87a51up0t6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 090/139] ASoC: codecs: tscs42xx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:09 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b2263a-1802-4b31-fcd3-08de0ad9a936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jqab4rvjHvmM2mqBkmrcuvzBqAHzkepMgIyxz/0HXhcUmY3UNJCcVscJT3pZ?=
 =?us-ascii?Q?+5ss/0fAl1csjKO8ob1D70v7zkeiJM/i3WU1nTfGN9m+3mobUOznmllsC/oZ?=
 =?us-ascii?Q?SsTANu9L0Gy7uEnrS9cggzrE3fauGS7FNtPuTkLc1r/hu8hjP0jpYAkqvM54?=
 =?us-ascii?Q?hhEVvTrEzzwHovj7C4qgibUU899unYL9YZniKMUlS2c7sZBlCm4l60yxlF6Y?=
 =?us-ascii?Q?3i7S8q3t68NqnbhYx5btkljxdrrxLFPMnAAZZzoifA9Ejg3JK8nC32BklpbW?=
 =?us-ascii?Q?d7v6GPmQJr7Yq01cRnKiWncRYc6XhDGTUAsa0KVkZfFoLyVf8XSzyXSNsHD+?=
 =?us-ascii?Q?pe1HTrroHsADsA/hB3dTj2WEh82pRMxK3YQf/4DTvmskj0g+CBHZW7WbvCkS?=
 =?us-ascii?Q?g5CBm6uu4mEyrDbxO6UsB9HAe3P621jle1oJDTQmlandvtop8zLzyb2H1+T6?=
 =?us-ascii?Q?NVofkEWmVwPQYGhFvzpWA9zEFtybmz9tX/4Q9yXo7v1oECtNtkPC6jGETiVF?=
 =?us-ascii?Q?mi6fnHR2TbqwAQmdTAasOXF64IcfOk0pTRELmnEJNpPQaDC07iZgotYvplZv?=
 =?us-ascii?Q?gy6kyXfnpl6rjromS9bnpfvloB2I4TucsXGFR9dDMzUvorSdti0NeuAATPM+?=
 =?us-ascii?Q?bqozTpYQEWp3YDrmWKcFbwPxzTkdehudDLxBk6eCn577eUJ3aFqcQV4o9Vuf?=
 =?us-ascii?Q?E0pHWFz803ibkgCFv8Xyg2e2FkvCv8CCDF6UWbkVEBorsn54cXF+p9+ONAn6?=
 =?us-ascii?Q?5HL1h/TuJxTU5AOTppTt3fVWND+XZ7fH5c38laNaxawY++LsLSnubbdrjQO4?=
 =?us-ascii?Q?0kT00S9A3a9dkWqNvqNiD3t0TodhOY9Ex+OslFy78R6UgKhYgcTWKv6RNsgG?=
 =?us-ascii?Q?eBtWFfXQfViHSXDPnAjrUP9OILztdjmCEyospm5ntC45u/6Uf+zolE22Qq7l?=
 =?us-ascii?Q?/AtDFlg897Wn8SoS5BGUjCJVx7+8xUX85vlIRPRB3qMp55qrdMw+KbsDDRPk?=
 =?us-ascii?Q?pvaj9vqC/vOGaiADxubyNLcO6bhBYwPftneH0ktQEkVezvpOeyyevUEeqZsY?=
 =?us-ascii?Q?qBVVniF/XtXMa3PAEW/99+6kdvv/5WMlOsZ4Sldl9THVVAZ1YkrXPp9QHC8J?=
 =?us-ascii?Q?AjmQyWXQ3uN5QrAH4wPpoAiiSOcA8WoMzVgoQGgMR6PALV3y2hDs2hO61ROY?=
 =?us-ascii?Q?2YNyfNHOcZLqXm6faYnIvolk9w4aDpYU2jaIfKMPq1Hvx2KeGxHwtPvkeJ9m?=
 =?us-ascii?Q?VZOSm8S6fjv40IY8c1kI5ZsnSgQuXl3N4zb9nr5jsSNgF7NCOTtTbojKRVFp?=
 =?us-ascii?Q?QiDuGpXaUCY2UwAFxd84NHdhXN9gP/fEjD8fsNDqjDHlsEnPDOjiIDQtd38L?=
 =?us-ascii?Q?Q6UeZ9axAZTiKgdnWO/cxOK21VNwBF3UqZPDrtqb/Xc8x2Czh5BYao4zz7CD?=
 =?us-ascii?Q?7ZWvww0xQRWgN5ZLo8kc1DHzwgIk/QNgPVNHKobZXThpU99RPcuX+rV/ZZAo?=
 =?us-ascii?Q?QbyUCB1nYe1u2UAtvzzshHzOvIu+e6+5A+cR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1VyjeMOCVKi7UlZA/2TKcUCpyPZxSSRfg5k0fiwzhFfFd2pxPOf1Uj79xfRj?=
 =?us-ascii?Q?nDWM0lQzaCGJGpKU6BxOIpQ351NsIa/FkbtOGiT51jKNFG37wd5LMotx0OVR?=
 =?us-ascii?Q?hGM2KkIUgtK0kbEOd4zAqPkbYSImkhyAxj2zAsrRbPOvbyhEOnUX85krcDIk?=
 =?us-ascii?Q?R7LKd7kcZmswc2gc8CPUx07yKeijos9gh3o7mJFuycODOSKmfyM83wVFL5go?=
 =?us-ascii?Q?CEsu7GxxaBvfHtceuJOwA5gdQl+hlWBllPlp8Xxp0Da8+xRhFTPjUclCfOeW?=
 =?us-ascii?Q?BTphB1POl/9MXzD+9eAb8bnF52VdYFCeYxwGSADhaMH+G/exDlinkiR5M2AS?=
 =?us-ascii?Q?QBATQF7eoO4uViwIK6/6Pp9rM0hagTaMIAtj1y0g+BAB4J2V1AtEMH8duE5t?=
 =?us-ascii?Q?blB4U3g7Acsno6p1L0JW1G6vEX7ie21yr4lTvZysh2JewKtobENxqkUk56xy?=
 =?us-ascii?Q?o0zFbV1XaZ57M9Mu7Jr8GbfUalVP8csrbovKK2ibEzbLwACSOMXUlM+N7nAd?=
 =?us-ascii?Q?XlIdB5Irt0mjtLfqIPROq4dvTnUFGAHiBeyQqszVGutwomZRRZzjJGDVJgFP?=
 =?us-ascii?Q?wS6+JIZ6nvDeJGJMTkUqO2na5T3bP0DSY82oMXZotQfEgXuRIroBbvzcXbwU?=
 =?us-ascii?Q?wzuYyygP/n2mOPo78DnIimNdFk6A8Rtjcz6lkOA5m/Om9km/wgFPq+gpuqcT?=
 =?us-ascii?Q?HhnREXYpxEbgdIYSjGJhHfyw4p0J8UNwf8IVCMxpP2uZvG2PGdxKF/tCDGF4?=
 =?us-ascii?Q?l/Q7m9Jb5qMCqf7B/TRcTXR0L5IIulDfQIPiOgBK3YbQzqM3BI37+M1yexX7?=
 =?us-ascii?Q?ogBWDYm/gtCd/W2jRixhOSH9l9EagtUVtr8f/jIYNIG2q3uuhugoCjSQRact?=
 =?us-ascii?Q?szzLbGJlYg9IMzldnAMm70ljneQkQY/wNPOr6MjpKa1MjeRhJAmBe5twskMa?=
 =?us-ascii?Q?dYkYmAmzv53WzP64M0gHMHNDmWqAk2aM1x+9bT8Jwb0y5vu8boVD25wjhIJ1?=
 =?us-ascii?Q?xnOBqh0W2Yjev6WHzgHlj/lWzx145CTqyvT5f1VnuOC3hxVHnvuvJx7qrWVG?=
 =?us-ascii?Q?uz2tYGfaHVKQlG0Y5K2P9lhoXSXMowrF0lKHplDr7uD1j8R9upQP/8I08WvY?=
 =?us-ascii?Q?R3K3tathcb2Yuq3yvnBFMNadf+Pl2wW33yeq8PmS4gI7JyK5Y01HsJXgqIOZ?=
 =?us-ascii?Q?WafDlgqv95UMGhFCY84N2Ig2FIlb0IZ2+bDMwvLD5QY8rWBqti9h376stK4o?=
 =?us-ascii?Q?1PFoP7xvLi5bbayIxTIPvh8/6e57XKva5vhSOXBIpkzgYPFyQU4llhYTpDup?=
 =?us-ascii?Q?K1SaZ7/caAyF2X+wcYit15YxT5tGbcBzuRFtpqmz2JyDxdrQl0HUh3FeTAel?=
 =?us-ascii?Q?hfCafIR0ym335rztLye4eOiir+oQ7WdMEqAeag6m6xYTpZbxcceyDY0Osbt5?=
 =?us-ascii?Q?ysJQOgE+codvNivApndI3P8roLrX3FSSaM+lwRPMPrXCChh1v9MPkrLPKONE?=
 =?us-ascii?Q?5Pwpj34//tDR6RZThws2kwRK1hi59TedlDpNZUDXNPVKyK3fAOSr/6YwRYeZ?=
 =?us-ascii?Q?GI72t2m7UqcNqxXMgYTDuZ/F4TG+Z+J2c6N5GRi1XiEg8JZvf/ri9ZIYtynz?=
 =?us-ascii?Q?XuLRfW8VflLEZvFO0ETAkL0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b2263a-1802-4b31-fcd3-08de0ad9a936
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:09.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0tXtaE98DqrVPlBw3JlWdrdc79ZFZuD6n4/l3CEGcACjWFASO6tJxgoBHzcgot606beAo+ThmBmcAgcBt39iHDcHFrMeMRzRxI+V3EBwVepYrltXt6YPRKprdHlj3pj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/tscs42xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index f8a3d1b40990c..7390ab250ebb6 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -263,8 +263,7 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	struct coeff_ram_ctl *ctl =
 		(struct coeff_ram_ctl *)kcontrol->private_value;
@@ -283,8 +282,7 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	struct coeff_ram_ctl *ctl =
 		(struct coeff_ram_ctl *)kcontrol->private_value;
-- 
2.43.0

