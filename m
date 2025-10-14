Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F333090EB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415691; cv=fail; b=srmMBErO8wQUfydlv99jUUCISq82Z3ZGp5thDVpA5r3UlPTh5jq0OGN/Pz6SrjxJ9loxUVjDnBFEWT3+9HJzlLJgXu2dKDVxOmWbyTT5kclrY6o9ZvN2oyXp540lW2geWI2zv3qdTfvJ/37ORqoDW3f6GJmQpsJw0e6N7phIAPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415691; c=relaxed/simple;
	bh=j4pBDgQejvwqEkGN4gKB5ZZDf1u48UyF1YAUKllbNSs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tgvm+7Eqqo0ed3y7yCjMv9Cy11YzXcjUOl1dsWmtNCYGs9N1+0mSP6Glv41IcCL37Lua8FbE9P4eHFoNZh3ZoXI1iXNvIbwDwolJ4Ma0AU3XqAMPFx2boNC1nEayB249twABprfywPOsPP5mwAG7FakuIEGdHfZKxORU3qkAmOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c7J+V3Uw; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c7J+V3Uw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXi79FTJByH8sBl3A+UsGj2YBYwHIC+YMv8X52teVIooP7yOCqU7srHr6B+r/oTm2QKaiDpqvEab0aZt0POtoqJO52nrqMDg2lbCcar160VxOuuhwxRC+baJ3I5NcrDczslLSMpZsOCNiQSAC6xBqcZpl8pyxAEjgksC9OE83BOLC5u4W1LIZf/TxYOzmOt5LWnsvpVgYZL2Kvq6jryWdpc3Bp7AFeDBFrtLwc6K062SZ7zOR+dtBpQF+RvS/e7n0idZu4AhXX/SNZvCQGDLPVmqm4Dm3El53Tw2zu1OD5W8CTrnAOQzJ4Wr5sdU6YbKFZAF3d57gaq2B7RSaC4n6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWiMVZCgv9Lp4ERcNzxSnZ5g+zy5GIlslR7xQhYNaDQ=;
 b=LQT5nwYVnVI91AphDk+opAdMZDdZWUZenWrcYPcOWdhJFv8RvPyfvMwGreJAIM5cbVFunUquAPD33yzO+IQFuaTBK7Nl+JUw221Ki73R5zH9lx5v1Ar05YE/NesbPw9KQ8a7D1MbvssC6zoxl5ADlLY4m/maBIbkZkWzFfPpSp96p/yx080olqcclUldOC//aBUJM7UuTtUMkZcK8hK4GSEoIOg1tlImA8XhUZozIYgfbNgfiXtkKh5iqexrCanx7HCyDsO/KwLPH319DssHVIRZe0ptUbBKEvl7en93uAJbbq5vZqChCUG1WuIxorILiIvQ/2pCS/dgh4Az+ylaaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWiMVZCgv9Lp4ERcNzxSnZ5g+zy5GIlslR7xQhYNaDQ=;
 b=c7J+V3Uw44W+fvq8loD6cozNdoRRHiqpSkBhhKO8dYTlGZqQzNVKi8kizLcBuxVtbKVkeg1LL53TKLx+VprWRqKKLzNqL7XTs4QmLEAyhRFwSKbk5d+jN5FX3dPQEmqLY/271pdptJLBtigWKT9SDbvTvQwNMQj9vdVnhJEpH5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:26 +0000
Message-ID: <87ldleru49.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 032/139] ASoC: codecs: da7213: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:26 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dcaa3fc-fd2a-42a0-f182-08de0ad92456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zp2NLQvoOFLIJjF4DFhLtVCtCNZVP+jSVGOFJ5DecR+CPwpR+1xU5pqfOMlb?=
 =?us-ascii?Q?OMjTHJBxv0THHD6Igs0UYKkDFLySeLzwCVFLeICbpTOp+k/Byw4YHPg1jwD0?=
 =?us-ascii?Q?FcT9SXM5CU3aJL/z66h3tox8zhDgfkvS99s6tiMSLmQh1Ff5B7kiq3EfZ6H9?=
 =?us-ascii?Q?/GkSIlN6t/zKl0vp2EMAxFNuPTEhh/agaYWS8m0WSvkMT9jqiyVHddxmUeoB?=
 =?us-ascii?Q?liPOfjV75Uyhpscm5UNz5yD38WXNWSxmWwoDcHE9Cn1TgmENOxItRDIi7tqF?=
 =?us-ascii?Q?s9yYOCf32TXWYT3JbWahre72xWjAfVfEJ1xfWHx3eLZ8CB3AxESDfVxHqgP+?=
 =?us-ascii?Q?s9PKNlt3ak8/vn9UWdyQlSqIGDxYIQXdxyaSayEYo/z+C+1NKPFUKkDQFDjq?=
 =?us-ascii?Q?NWunqiR9qrAeFQtbND60jWcW5Uok3xNHLa9fam9iaAUOnb4Srqtp2dlxIIi8?=
 =?us-ascii?Q?jrdz9Go88bt3Drfn0aS81mHc24MZJ3eAXfEitOiTYGiGqHW7tGHtkT1XOoQ/?=
 =?us-ascii?Q?dIg6cEQ+DHNNOLaYfeR+TYCUzStC2qnBpGKirSzwtMDbKGeiH1pCFegds+NC?=
 =?us-ascii?Q?DHE65u5Xpwg6gq8cmrEmKk3eNtIXKzbAOM4/qQ7IlrRqm4o1SYNygxU7JDfx?=
 =?us-ascii?Q?3TI8JdOTn4QWwZnxYG+nO5GuWz8f/tkaWIRuy/Tp+rf86/My/Wqc2mXNuIz6?=
 =?us-ascii?Q?WMiaz1BXTV2yyKiaqTzeR5Tjh/SKKvAH6O8cJDTJVvArVcRJcVJTObOTxe33?=
 =?us-ascii?Q?ekm/bcjviXP2YaqHal0OprLjjqWJqWJgEguXmfdm76LgtB9VCh3nlfg9H6mg?=
 =?us-ascii?Q?2W5ik18er1y0VO4kYj6u5JRcFXHw88HZqaUNlazDprUYC7ZBejzA67DCEA/m?=
 =?us-ascii?Q?Hb1rBFLaBSR9Q/GaLBJZS9hxadxoruXGidPVX4eRsmu+yNnrEoW5Qo7IuUk/?=
 =?us-ascii?Q?Zm4eMmlLSHBi6skqeq/cTsVQ7Yt8JHVZyj+VIyiF6zCMLfLYGxDDsPdWy31W?=
 =?us-ascii?Q?8jYbjq+4gr7heGCAWuQjc1yS7YARMfrmsErWw73525KD6AIqhbM5zaxAx5vk?=
 =?us-ascii?Q?jczsokQShCppZ4ZL7EscGSgglvURvqlBf7g6gdoIY9LOCHEDYM53mIjOvovY?=
 =?us-ascii?Q?T9GHTVodtWVgAwDVM/GEbRiy71fGZWq3uiwILdWBPDsDHlh+ZEdsmHR/OKSq?=
 =?us-ascii?Q?MMysMTusa0UuPdv9rmswF0nhu2AmJ4vbGcDW+aOeoOtEwoMlxKE5ALmoUdIm?=
 =?us-ascii?Q?Q5twiF1V6IQ5eDDrWyycoUH3UNXGzamZT2G0TavSl0DxO85RO5TgkJrGqne7?=
 =?us-ascii?Q?K/f6wr6vAU66zbFoyy4q7/tUQYAq1LOzwdMPAE/V+X7z62ul9xbaiEpeP+YB?=
 =?us-ascii?Q?gXTh62OGlrO468ZxF325Kf+OWv9Vel60J8yfjQcNeyheqpmdvMbfaYM5quIi?=
 =?us-ascii?Q?viaJHH/0uBV2q/jLedVMwis4+VwXHFiY8bQhabhETjG3NXGEPkjGFeImtVGF?=
 =?us-ascii?Q?G7N/zVyag8c3NEEPahlsjwtWe7tI9vt+9fXf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ud1sX0bQjSCRoBHqfMS+SkSzuS+3sMmwzQlhmJ04gYFUjQhV8OvCv0C7ja0W?=
 =?us-ascii?Q?Lu2Ybi7XMvSqOAXid9luAEL+QRUOtwR5aVTiv0TrkpL7Ku+mrlLOgI3ZTPrU?=
 =?us-ascii?Q?1QkCm7YvjepZmfsXmynCrFFCDWe5pUAZFy/fgfu1eS4yDB3LqG+03ztf1jpV?=
 =?us-ascii?Q?YST92WLarHb/pNg9B8AC3fjtfV2572ogOMaRZv+5ks0Er7NLdKhT8cCFWflj?=
 =?us-ascii?Q?Co4k9Mk0sr3qsoptjM83vE3EsU3KZ74A3WOXw9P4UJyE7xbhus0RSQHRxh99?=
 =?us-ascii?Q?fi1zwKTLB+ewHU0WTxlEqnIBGrAgfIBZnY6zbOFgrimPyNLXdE37onP2/N1o?=
 =?us-ascii?Q?vyrLJQT5L+DOfuzaQTt1thBe7HXN3NZZCuadSE/6h8NuVDL3rvbzTqR1fUPk?=
 =?us-ascii?Q?jTFMwQ1/GuGHR3SkOfpdeWMbxeFwnWxPNbtgIiL2sLd6tMVrtxnrFykMCZSR?=
 =?us-ascii?Q?R21bq0QjYKYcrTHZ84S7+bE6ZTpLjNIElVUgnVpyBWuBegiHDEwNs0HKgnek?=
 =?us-ascii?Q?UBId6pc+pjEB9PHSk6xpsoxlI/fvMz5eiiQEz38M9t4x/JlJwetlC7uUTsxX?=
 =?us-ascii?Q?RiaesfVQcwSWQNJsmCfJnjqHrbwzM4Y81ySMLgMKUJKGJypxUkGUCapNv4sk?=
 =?us-ascii?Q?HnKlzqZDYrb06y1FVHrUXqXHcZmQ4RG8Uc6HyXXX1E9ly59syQ+78A8IyLr9?=
 =?us-ascii?Q?X174CgVwbap7ZZJcgO8ZJzEYsnxCdgUxbEDYCbuj+Gu4Yn49DVyCuvSZow5i?=
 =?us-ascii?Q?B/6uZZEZKlfOkafPu4FvzAo52xpHEQHrvQ1KNYju65a5n7qSKgvKscIhK9yG?=
 =?us-ascii?Q?wHIQteySVLfeIGXDn9t4PrxfPjKCnsM7vfWlB71Qz5EZoZ2Fm1cm8ZH/aZn9?=
 =?us-ascii?Q?KNaVIy8FJvwuDG1MHuCo7aBRu6fUAVM7X4iDwbKs3Smrx5UmyrukR9afADON?=
 =?us-ascii?Q?3dxeudzjbegezFdjxAnW9lEvCZr7AK3cPyE6bI1n7JRkgQAT15k8vGvTTiJF?=
 =?us-ascii?Q?m/Y0yJqJX822q+Byu+g5cP0bdiugyMG2e5fWDzMhsQxe7K37iQMz5+Pw6sxb?=
 =?us-ascii?Q?Yr7SxGuygvHjAkqnnVpUqjkgzGIs7HieCuTZcH1LXpE+aSFP4w7+gDm5EAHP?=
 =?us-ascii?Q?EKPXok6i0k7/mOMLQ4+Cx81iDCUdYEJ/lQm7UG00EqZqGplvaHQjPHmJLECz?=
 =?us-ascii?Q?TB1SxzWXBbK5Z4AscYBR1Y81vfm51Zunz8E2d2cV6DR8Rnbkjrhs0OCBsiw6?=
 =?us-ascii?Q?GR8QL5UYsXj/BxOD8LrxvSCV5mi37znzJzbunXdKvmHxcGBh601F6z800E/z?=
 =?us-ascii?Q?7BSr/n6xLNgsLczypPk2GsE3TU9y4vBa9eMcHpJYBLa8NuO9RN6RXn7AxHMa?=
 =?us-ascii?Q?4rckdf/xmX0o5YcF2xOlI6do//50pIs84w+cChIZO6qUeh0LIGC8L96Vusm8?=
 =?us-ascii?Q?BVuilCZ8o9KlfnZi8xr24JmdamQhT7Lcj1561SjpRlSPOcG/PL+RKkAwzI2Y?=
 =?us-ascii?Q?W4R0FVE/bCY75VO/JhGnwSU7EiDXja+u9qP81co0VIQZb+HSeJBX1IVY752K?=
 =?us-ascii?Q?xpKAPips1/rly5sZtsgrdv4vwVEfKdADVTXzuvb9x4fIDuA/VxS0PCFgz1FP?=
 =?us-ascii?Q?XqggwFh4+6evYrOT4zoh+5w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcaa3fc-fd2a-42a0-f182-08de0ad92456
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:26.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qz4+U6octai22nDB3PbTQwA7ZbqGf80f5GNVemjrHjuhdZYb+1cNOpMqTEzgiYmOCGSpDtxAmpdm/0Tc8dXfgd8lBez/Nl/wvN8ZMLF1rY+kzowrTNGu3rtdzfyNrv2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

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
 sound/soc/codecs/da7213.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index ae89260ca215f..c1657f348ad93 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -214,7 +214,7 @@ static SOC_ENUM_SINGLE_DECL(da7213_alc_integ_release_rate,
 static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -228,7 +228,7 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -242,7 +242,7 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -256,7 +256,7 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -420,7 +420,7 @@ static void da7213_alc_calib(struct snd_soc_component *component)
 static int da7213_put_mixin_gain(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -436,7 +436,7 @@ static int da7213_put_mixin_gain(struct snd_kcontrol *kcontrol,
 static int da7213_put_alc_sw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 
 	/* Force ALC offset calibration if enabling ALC */
@@ -457,7 +457,7 @@ static int da7213_put_alc_sw(struct snd_kcontrol *kcontrol,
 static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -484,7 +484,7 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
-- 
2.43.0

