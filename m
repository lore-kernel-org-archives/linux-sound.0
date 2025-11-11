Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7837156F20
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821402; cv=fail; b=RdpegXPdIKF2PAnRBSmLKBhdozMo7YwvBhhRyBtBluyfh/UtSuGy6m2Cdmy76SrFH2m/3kaR6aKeD80yxMx3v0N10RWRZrRPP6vumvzWRnVEDTTmwr90UtKHdjO+tbeJr/irB8vCxMiIAqqM955FGJ4L2iEplVjNxQRDA4ifrY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821402; c=relaxed/simple;
	bh=v4rjQ7aFpOO8IA8w2bvNbKxsFkiwSEx1B50LI9e2MGo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=L7jn6l8PXjLWZ64rN18pHgggUAD51W4pUfnK5Pla/OWkakWaCizPNF3g24GKXtOp982zGFs9PEdMrlIcVg7MLuOFgu2oucEN378PNVus1IyjwuEovWsG/JsGI6jC43s1VM7kUUc0Olg3X3RrZBqYpjtlZtf8YPIJS4ESdREBxdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E27lZ5pz; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E27lZ5pz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZixrLEnGLmSVkLYkUQ2IuaBv2rARsPExLdCPjzMh6k4QTVB1tl0pZB+uiUZmzSKUrVN2iXx65QQKlEmlXr+0BDzNJhNGiL3d1eDqHtiUZkQdxJNShCk86Sn/4xt3PlOyavLNuVgu+TM9nO3QTpVuTe18r2VI9PvubWzDrXoyyYKeiUO1ZHX/DFF6MCJZXCsSA15GdjvdpEPbtUnEce0VqtyYMTV7oVvJURGeQhj7uN0czks2zOklMhqsDfozBBMtjXvz4KnWu5uGW3ioSleRP0JLpuoZSGjLfSO2Ddx4bP2L9k1237dU2M3k4/8VJ080go4x4m+hQVRIVB0FwA+AIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEY8l3CsDPr6tEDOvCSXxmzxiD7zyYpmNLTSRo722I4=;
 b=GPSeoOkxe9zG4RRWslgdLmH8uzgSArrw/wLHLK/frOVfi3zp4id08rV/6pItlZrr2e3LNEZC1OBJRXja0dLkkhbsSKqv7KBTg2NZbAtckewkQhA6uIUtW7DvwSsvvYZq1+6c/jSbJnwlwALP/ZirTVliLfZ90KWaEE0xQZx5q3KxOhenh48D61xrWeqLrVeW6UMAUAhNqGyZtbwI8sKolJCTdM367ifGYh38Q2+ZIfkp7WCjXncyGmcVd07SybisSE6zgEedbcxou5XA4pOxtHWR8M4eZ4M/Ac+XUPmgeRkvqar8pJFY2bpsvzw2OEgY+gtL36+iNWsrnOZZJ4ZPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEY8l3CsDPr6tEDOvCSXxmzxiD7zyYpmNLTSRo722I4=;
 b=E27lZ5pzxT9KHAGVJ7FrB7+3nF2kVn1ZsbrPQtWLUzHBJscwLL94TsMALiOtHHBWm4eZLJRU6OySwFFrT5fleo0tOJIxEq37HStjEI9PuT1+THqoZvYPX/9zS++0yYYyT1f5jFncVMa6JN2tl1p7UwX9+JlKTPJDypVTtywqHh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:38 +0000
Message-ID: <875xbhtnft.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 279/292] ASoC: sunxi: sun8i-codec-analog: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:38 +0000
X-ClientProxiedBy: TY4PR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d09f75-7136-48c8-60cd-08de20ba6068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gNYyMpD1u5GsNvnYpEHh1atW4OfQCiIAZtEBfW48zD5lk+XHEkRWaOXuSohq?=
 =?us-ascii?Q?XK7Fmuzt66lJYFHhyxAxZh0aynSwYcJjXXYjiwqD1LKw8W5JbQ6ghuNea0xC?=
 =?us-ascii?Q?aKSTWREOkSkPVq7Jkr37DxHjAqpiK1rBC2lKPyBgMYsZ6ZcCgBbVg+JVzYzO?=
 =?us-ascii?Q?JjD84wZ0uaQCfJSXLsIflTK0ont8H39iwWwGEpXWYTCTG2G00qSPm0S6wywX?=
 =?us-ascii?Q?TN4fOiO5L7LRUM1qdTz2s/B2RM6LKdxrMb2OJ4wBf5YuPJ47lX0c3PstHBra?=
 =?us-ascii?Q?2ruJVbh9srDNvEAswobeWPKyd7VENh5TKEFZYmV/uEWdOEpRLhi3YQLb5yt+?=
 =?us-ascii?Q?zWOLAnW+gzXs+oEUY5ZZML3xUnrOWky086SRcVXoyPtPhDwv+04+XwHHtYt0?=
 =?us-ascii?Q?IeyjoTfkNL2mWl290cMM91Encj5W2LY64FggLxS07ayI/iPAdtmTOCc0/A4X?=
 =?us-ascii?Q?ltajS0w/u2penEw5V4lHvKkboee4pK3qRnyqAn/DB1YPM3/am4/dIqwVRncI?=
 =?us-ascii?Q?jSxMwgsW6WmpQa1kakY8ahZ/gix4hU6+/HM6bXViNPeF07fJO6h+seh+u0pg?=
 =?us-ascii?Q?UxYWQJD+BJXqV6F05TLgaHWkQ0I3R7/lzMich4pH9X4n56rWxS0K1P3T4Hhr?=
 =?us-ascii?Q?2nBE8z/K3y6wUyDlkRxtRgD85l/8SNkJh3bq/5VGUj3aH4Fg5c5Hp0zT3dZW?=
 =?us-ascii?Q?GsGrHPO89rCGaxr/AE03adOOi9ZIEnXqT5QRfeMgcQJ3WuGytPmWclF1nNV/?=
 =?us-ascii?Q?MOKIqb6vfCqVKFKfgPPwYhQTKwn31I75hx3+gnhZNg/VEz969F/gD0sM0Ggd?=
 =?us-ascii?Q?RHJsA/QIVZa2Q1YOyVNMzPLbbIU5QcareI8fkSwIG9hqnD+ql3TpzAWvVy5/?=
 =?us-ascii?Q?TvKkwqZhV8Jlb35vEQZ4tEZxxEwJfjeKo1mCGdDfAS8NBXbyYRDLD0c7R+oC?=
 =?us-ascii?Q?SqdMh53D1/iHt9bwcetBd6z8gU+8rS4SM2Zwf9uwT/YhGunOsKlOXaj0j9Na?=
 =?us-ascii?Q?eOefq8Ht4Efz4cafUWrw0dcKKds/i2VMzmoKi2VeA62DhY97FeZTPkw9FexE?=
 =?us-ascii?Q?DqZIf14xeZt/ih5qq0TTZ9HW4bS99psEKdsjeCbB6fbt1tnn1Db7MI9RZuU2?=
 =?us-ascii?Q?YUr8gGsiOlJoSFfyOi60InurIfDhTzVx0gqQYUQKdA3fVtThugzL0rKMaJZV?=
 =?us-ascii?Q?NkDDKhZTVKUt6j5SXkr/nP41PaHS4DRH25cgBmbv5w1ndziElL3bIRJsrmF5?=
 =?us-ascii?Q?a++rGU1VK0aQ8S8Cx931z9RXSVqMUtMg/K/NlcCW1dsHp0xicGLqAqGJHbFf?=
 =?us-ascii?Q?AMFAKAx7nffEcpSnp0ka34OFMzn4EiFt2WzvaBKBW+NQDTnwUn9trcZf7cOd?=
 =?us-ascii?Q?lFJuz80WohtqskGH2uHoCaGknu+0XdGTKZd7W2YyluOBTTHyP5zTDG27EhHJ?=
 =?us-ascii?Q?Am5+jYKeKSbIIhwduYhZIOZxd2u0LJZYJF/kRiIpnCmjbVXQDO6ELl+1vUR4?=
 =?us-ascii?Q?sXQ6gx+eD5tYbf/vE8DbsBi8h/nrKuUYh3KB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rdDxciQAcDxCgGSpCbvZTcx8K36YcKCMhf5YTvIakd5JU8sRZwgUaY/nvl99?=
 =?us-ascii?Q?3Ve/gRQFLaW5OlZSHGYhr79xHJpQaTqVsBOJJyJ7/z/FltG22DLl4GHQsMwn?=
 =?us-ascii?Q?hbXoROe1R6IgSs3Jt5wiCJJmow5PuG1xQxhevP13WS6V/VUxlY3IXVNINcZf?=
 =?us-ascii?Q?bBRlAbi7vxNqlttoK3FDT9zSFnK0ExEqDZcHr8mPK3O1PxU916/5Y6FykBGG?=
 =?us-ascii?Q?CfbcKBDTjTcvZB4GHeRm3kW5aQ78z9v6EmFfqDLmCx4xKNKGR5PAfeQhGeVe?=
 =?us-ascii?Q?gibh3JrqDxV8o9BCPWD2z20+8m2nWD3cCS2BqjVTgC5FYwFJRde1zOMt6mMp?=
 =?us-ascii?Q?MWPLohz03ut4qq47opmUXzKGSrrVISBt1efVIZ69B6TnebnDKxQeFHVBTUlA?=
 =?us-ascii?Q?DK9NQBUV2Rp2Kw4/ueTAsUiaRUC72Yr5+nTL9b+YuGK/8RPvfpVVROXDYuZi?=
 =?us-ascii?Q?TbQzCsSVlNDfwTUJgXjcPAWMlaJffSFvB91m+3PR4GzQMJEy/8CObVgRuFBC?=
 =?us-ascii?Q?IfWBgT4I24BYozrOsRuYbOXcpbqeHeDlVnYD6YhoO0MufLyxtMJhHARBp2ft?=
 =?us-ascii?Q?SDJV7JamLLa/UoFUGLLAsfZzgIAy5Z5gr2Ix60hh079bA4HOIWxbNasKEJnj?=
 =?us-ascii?Q?0AcxFRlAfZ+pcAJNip+W6Sgy9pB8gODCFVAUOYWEw29fim1zqZxkQ4SVAbQn?=
 =?us-ascii?Q?W7rY0J+lSwd/BmOHyjGlyacl8zQDufE7miHawyH7Nzj/9CcxdEa5Yar/T8AC?=
 =?us-ascii?Q?OvkzW3qXT/ceTbZ01VPmKZIHmYkfW0lkn6MOi9g6kms3VbOiZ+YUvTjQTq1q?=
 =?us-ascii?Q?eHTntK66xKoj/cuzoZ2TbXC+C267YCQJj0xjzGMoCvgACymW507q9UaootoP?=
 =?us-ascii?Q?OLnT3FBGmIuT4Zh9JqDrV72whWUbkMrRMveR7/mthyzTn037QZzyPfMZBbt5?=
 =?us-ascii?Q?H2G9ukEqXjOSHKCLhs5XoJIohfu/CAJ2aglZ4pBVudeqPjcpl96x3uNqkWz2?=
 =?us-ascii?Q?TtypQ2Ssg+cN/j1rEdfFuIfqkX6NH262G4EawTDDNsRZAGgrnfjeoAFBKoFz?=
 =?us-ascii?Q?ROLCEnPR3qNKq8YCO6WVUbko6hGWjAYo2Y3odJOhgB3XUdEPY/f+If180rSy?=
 =?us-ascii?Q?1wjob+3Kq6JtTMEYNdxuqY6msbvCeYqlLWzwS5p/74cuIQFpO97+BzDbOUrq?=
 =?us-ascii?Q?kTzJzBULXQwqpnxKdi7qyjpBm9Km6H5ZDmETXYowswNEOtw+LAOt5ziclvlD?=
 =?us-ascii?Q?zdUNJEphsYrq0QnqMFgRBCxxqkFk6qikZ0PJQ6bbK60xI71Kp/mHdbenybl/?=
 =?us-ascii?Q?vlJcJHZSymNzqsabDyEQzdpz40quF1Mi2hTbBxIpwsvJLQAEVpfOZm63tU91?=
 =?us-ascii?Q?Ie/jA1LuFkWo2tyXs11tj14VaWP19nneUXlgjCBiCW+2UA6rSBLiB2HtYjAb?=
 =?us-ascii?Q?H9v6e7/LMakzY3HFRxa14y+GYOcSpTVKv6HoqnuSeULHfvI0WjBX+KcqnVW5?=
 =?us-ascii?Q?Q5fERer+GESLCnwmkpcMpKLnppDLfG9q4Z/aCHpoDOZMJysrqGSPwHdC1Zen?=
 =?us-ascii?Q?i2hf7hQoIdOot+n1VWDmJ4/CGgEgXW9E87z5F1VI1ygc308T8phD1rkuSL65?=
 =?us-ascii?Q?vvuHNwstC0iO/N0KAGawpao=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d09f75-7136-48c8-60cd-08de20ba6068
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:38.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnxfCb/c2VPlzFifq0sYlVv/1W+Ka9DGJVdJ1JiwH+r0sOXRx+PrZ3nOxmmXMqZFLGSYdEHcJxt+TP5nUlyr0PyqF4DPDWrV0c434QsdIXJ6Q4cmQ4gbuoH6pncclyuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/sunxi/sun8i-codec-analog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 445b341418964..2024e2b2553ed 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -390,7 +390,7 @@ static const struct snd_soc_dapm_route sun8i_codec_headphone_routes[] = {
 
 static int sun8i_codec_add_headphone(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -428,7 +428,7 @@ static const struct snd_soc_dapm_widget sun8i_codec_mbias_widgets[] = {
 
 static int sun8i_codec_add_mbias(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -449,7 +449,7 @@ static const struct snd_soc_dapm_widget sun8i_codec_hmic_widgets[] = {
 
 static int sun8i_codec_add_hmic(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -486,7 +486,7 @@ static const struct snd_soc_dapm_route sun8i_codec_linein_routes[] = {
 
 static int sun8i_codec_add_linein(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -567,7 +567,7 @@ static const struct snd_soc_dapm_route sun8i_codec_lineout_routes[] = {
 
 static int sun8i_codec_add_lineout(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -632,7 +632,7 @@ static const struct snd_soc_dapm_route sun8i_codec_mic2_routes[] = {
 
 static int sun8i_codec_add_mic2(struct snd_soc_component *cmpnt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
@@ -688,7 +688,7 @@ static const struct sun8i_codec_analog_quirks sun8i_h3_quirks = {
 static int sun8i_codec_analog_add_mixer(struct snd_soc_component *cmpnt,
 					const struct sun8i_codec_analog_quirks *quirks)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cmpnt);
 	struct device *dev = cmpnt->dev;
 	int ret;
 
-- 
2.43.0

