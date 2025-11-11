Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93891A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820733; cv=fail; b=Cn+1QbI0K60He1t8AiIDmpWfgcR2MvQrp63OLn2Pzpqm9cJsS7fuvIVR+X/rjxuIChjlmIypgXSmeIVIaJTTfYyxKqr6E4cvxTaJ6yKELUNAuhfOPSWBZgbkQtyDJx+ofFer3uXwykezWPqn6ef3ZbLSH0JnS/SY9MiGPfOUWCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820733; c=relaxed/simple;
	bh=nQvrTtzUbsQSS+tskkin/ip+BLL9pFBT/Kjh5rg/jlo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K+EIdStV5sBVVUHZ+7ufA3VyKvYM82wXvu880AUKfrBlSiWgNn2NgEOrOgNVlUYhAH3+kPOunBq6hPuckshLnuBaOtyxz99uudGZpBtnF+d1f15dlWB2U+hqdvxS8bdYb2UauATLhNRSZdqxtzv7Pwc5CVflycbdqzeLnJVHoZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NjiLbj9Q; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NjiLbj9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTangANnOshXWmYFKnSAgsGLuIWtgVXCKqmfn+Gqo1FKRcjB+46KefgKDTvZNNhZgEHHgoiKRdpBQgDbqSvHjTUBJMDl2GNJ1BNY8neLgfFZvSqy87zvMWpwy8q8l7Fowk1huEunppc0ovNj2pwceyPbTJp9KlyGo3BZ98BRIg+mNtcETlVUDeUbltd9qVFX2sAsESt8c7wjlryRBGh/w6v6yF883g5Td1rSPUXoLQcPcMHIVr35poRR+U9ydRMLCls3enm9wlZ5YI4jW6UAHWkSxU0BC1qWMxTo7NmVvc7KKG9vt7zdult1Y33+o+4giTMv3j3wZMfAfr0tSZ370Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZEPxl32rMHc7NQ4Jjx3kvHla16UAhtDjVZ80brEZB8=;
 b=E8XlCMPFYQPfEvJiZ3nrjp3aM1ElWHTvhU0lbEmJ5d9rc32J9tMh77/kL8rBhIjdoiWmMWNJ6yjkXgmhy2UKD/C1SZwaP0tMLaLZyMw7LHMknn+44DL0AU5Qd0aIJ2LRkf+KEhbcdzA8Gvd8mw9uIdum8JdlQzH6Ju3oCL5UsLgePAa/XhdYgQuPpNNUSSmjeIiSlRan/biovSQfeJ8la+o5s0veq/nMihcmGNe8h7FKBsPnGgM5vp/mJzmJKPlAJTmr4wQ1VNpD1QMb2Vqp3sIxK4zGA0KdhnmzcKW/Mg7xoH+b4472FrYRPMJiLRDQtR7tfi3MHRqr+SCBaPLVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZEPxl32rMHc7NQ4Jjx3kvHla16UAhtDjVZ80brEZB8=;
 b=NjiLbj9QVes2nEBizc1cbjFe1ofKMYnbYBrg3Vd2hvi6otWYrQpY6dLjxGICtXNrFP8f7of/GOhWRP/zEOElzmJvzetS60E+RfLIftu4j1sViOT3Wo95QgWnOvxgzkmWLsIX26Czb7+JL+VIB+qP3DATVxQHOgfYvYKhly15mBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:29 +0000
Message-ID: <87pl9p2z5y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 115/292] ASoC: codecs: rt5670: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:29 +0000
X-ClientProxiedBy: TY4PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bcfa1f-af7b-4bed-c3ba-08de20b8d199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4p65IrhVkeqRK/unT5HFf7sC0zbrfoW+LtoGtF/2cwkXmBhameSD2Nlzw9U9?=
 =?us-ascii?Q?bj2pt+9TuWe7GcKhCntGa6r2GXOn8ReGomk6HyZIHFNW5dFqTwqNikgoxIwm?=
 =?us-ascii?Q?F4ZwCyTJLELgnEH5NfxvmkqelUeUob76n+ZX2FiXuAFHaUQzkGKpiyXPWDS7?=
 =?us-ascii?Q?Z4FhViWFoGhCXCNwYJHo60oFtHygxP7lU5lxbAqhW988r336FZgcOI0TaETU?=
 =?us-ascii?Q?O4uEihSUhA9/eZKazeOCw42DXVCfL2JrsAJBWBliBq947BJLyDF8K84OXg3d?=
 =?us-ascii?Q?wVHnT7Dfe7HnZX/a0q2TEgRsn2Yftz9ZNJItjlidrZVUXCVqbj1nJDNIidgv?=
 =?us-ascii?Q?/HGIxLFAMSYH034AT8jJrXdWRjaepKqAeCOvMJ58f/VmIFScNv8MFzdC1MNf?=
 =?us-ascii?Q?p4XjscvB8d6YoHrjd9iMKpAA4bjXVa8rcB3Ra6D15qu/z0VDp/LZ7FDLqPIB?=
 =?us-ascii?Q?gNHfa6LWXJttySStfSVCQ0mt36SXSrhW28zpzY0BRRd1QNU6yMlUwvQNzaPO?=
 =?us-ascii?Q?65QSe/g25oyYwCik5D6rb55CH04yeMyxNUSG2ZTnJy2086CGXDxeQBek2SSq?=
 =?us-ascii?Q?kW4k06vzjl2i/K5OzVHw7oJht6BtILZGjRfWLPhUyARyijuNLv3K6zXHoH7R?=
 =?us-ascii?Q?gQOf69Lw/v4gTEWA+6fCbIFyIZI86U/pFclFvN3cgtHhKcjATfCei34YIwiE?=
 =?us-ascii?Q?0BDkvIosD21HrQU7MOHmF3Rkl9rc0B7q16t+oepUVCF8A3xhIPYsFfq4Y+Ih?=
 =?us-ascii?Q?ZS5iHkMU1xTtUXvcVO4+WvWvXLZoo++M7kxKHMpvt2Ie1fpM8b9N6o33CtKp?=
 =?us-ascii?Q?uGPV6p9W3LpkI0cEtWLklWQyOGs1VHnKOC1ZB19HE/aQnApyg47+7Rpyvo66?=
 =?us-ascii?Q?w+4yL9k8edXPbk8KGe0MCjrItwmNqhxL5nrigKfoVcTYFW7NCgcwHfvZI869?=
 =?us-ascii?Q?qBvpV0LSageoXVV5gSVI1eGhhBybIopBDdDG+xF8eV90cHWrypfWQGI0gkqZ?=
 =?us-ascii?Q?7/5n7Whz9Z6TtcuATSLweLs604mKU/23SkXhDEcGqsPN0zKvucDovnWyq7mS?=
 =?us-ascii?Q?YjoI1oKfSkaMr9AZ84oHAQBwr6XvKbU1inrui0uZgGYCesh2YPSPzgh45h/e?=
 =?us-ascii?Q?QVMBXoCDSoGvuPez60YXgw1r9jWjQ9G+bNo/kM8VTQaUXgwCcxajDUIupLPd?=
 =?us-ascii?Q?8051gAEnMiqiHm80wuMma7r2WFewR7tcam+Aj5UVFCNbaQd4KtiSsNJogEk8?=
 =?us-ascii?Q?wLsjNNCpWVN44HyVQY2pZAtpQM20oRPCQsuAWcGCg+HaUR9hUcVPerg6o+B/?=
 =?us-ascii?Q?vJrmDRfvFmVP4tkVKf741VT78lQgZGiuyf3lIsnp/1mWT1Eh+oywj/Mkag+B?=
 =?us-ascii?Q?YiL/4wppB0N5V8QXnNXpSXu06E7T5cgtFiJ7a9Xr/uTnd/vdtbSlRTmfIHWx?=
 =?us-ascii?Q?8E8/6cVC4LMxVcpQM2OtdOeHtEaH37Ei5Fn7BtJRkQFJBmnHb124Jhgp+PTh?=
 =?us-ascii?Q?Fw5KM1n+6vj3CBgOQ+vmhWQ1p4X1D1AuQDeI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N29F/XSkBEpVioXqnKmllUJ1ptFjZJpqv0N+kZW2SR2zHpsOIZzGK53oD3xe?=
 =?us-ascii?Q?c0sdLD6yMB91XBZgBEl8sY+zazDCx9uQBZZBmN2PejI6cy0MMXl1ahIWRT5W?=
 =?us-ascii?Q?xXndVuYLPVIpcouGRCJOOA85Qwi49sGkoGs3R8gUgcyi+rlYlu8maCdQRSVO?=
 =?us-ascii?Q?rmpP1W0aE8d/rs7qfcQdgQncpMOTKtYuzzbz0bU6JlMDCndB81d1O5Wh3kFj?=
 =?us-ascii?Q?ofdoodFd+gkC02SZRnsqHRqOzUcHr4Yhv+T5FWo1b3oLYDcC5k00bejeY32b?=
 =?us-ascii?Q?P2CYYKf4+HmFMZ1T9z98qYf7RsijvXx94Zw0VtKHWNfR8qBKFXGCmbSH4cIK?=
 =?us-ascii?Q?5h7UcAquXnp84Jks9IknWLl1CxFQ/X7GbFFzpexKQQrP4SlIyMgO5UCzdul8?=
 =?us-ascii?Q?GSSGGmg4ictdOOh407P2sWYABu0vyOjXqUZOjGYYMa/p62lmbOdAOPGIqcTV?=
 =?us-ascii?Q?hlUwQOaWve0+0z30T+loMRsJ6QZKR/4aWtbjJSR0IHM5PDH+5x7miqNitrQV?=
 =?us-ascii?Q?xNqWnflaguUfv8FfwdQ58H/n31pJ4Wf2RHe88Q+SGYi6W4LePi28NJZPaI2M?=
 =?us-ascii?Q?KT7Qa/x8KB76RIop1PPNb2oXJo8Gxs6jC7xo010Optki7Ns6uOkNDlvc5s++?=
 =?us-ascii?Q?DyxcSN9/AhzYMh5FbTgWP5oCrvb2LR9n7sfQxGAVQdSqIBo/jibNRqtj4eYy?=
 =?us-ascii?Q?beGY12JViG/acBUTitgFuWaLLTAUnzr09etFiYBEW2saqnEg9DZ54ZNxkC29?=
 =?us-ascii?Q?z2S0DvjucLo0EyrJpq2V7kZ+adsYngxheyBw2/L+BreGBqcKFRi+BvCXBvY2?=
 =?us-ascii?Q?95fp+dgrqayLfFPub8GOycrViqI1TLjOj5Dmpyb5LOzGj8ccRyxT9LZcmhFw?=
 =?us-ascii?Q?+8o21Q5BWp4jkWYnhEgEw5F4oT2qdCJN9Kv62CrhFDrsXPD4fV5z9k6/83TU?=
 =?us-ascii?Q?UlgjhvigOYOKdlVrOkR3ocvmv/6wp5X5jB+9FTY1xmiePWS0tNZdihUKh0W3?=
 =?us-ascii?Q?iIDGBM0Cs7H5U+WY4ZGiaTQL/iNDVpaVTg31C3gWLunJX8q7hP/bIHAY+cdT?=
 =?us-ascii?Q?kHET/cRhjhA/dclAOYM2RVcp3pib9ssE/nmZNPZ78Mo1VCaTa+GsY9TZxOjr?=
 =?us-ascii?Q?RBnqPCxTF82MoGWjBRCMweA26WLCzUbS9M4IANV+P8nscPzscnfIQbMoUSy0?=
 =?us-ascii?Q?yTiTsqmk64v5VrM7fCxKVlXhyvhQuY/bSOmKKceNjrJKAyjnBK9UWSgaSSIl?=
 =?us-ascii?Q?N7i4v7l4FObk6OJ678SC/5WSNNh8JWraF8YwftmhkDQUe3aPieY8PGKmT1Ak?=
 =?us-ascii?Q?iJgCHtIxG/QKzh8PCu3B07nJfjp6w85t5n+tBwcEOH9XVzmmMpw3jXjxhzUp?=
 =?us-ascii?Q?Qs/ta9xrMm3y4T3XLwU0d2WDqeiXIUf29d0B4HcNAoqVPuDEhHIHz8jlen2U?=
 =?us-ascii?Q?ApiZJGBO9nv88wq/RUQPbUL6dF1JvOWpJ4LvqAQK7Wwz8EyD/RjcUYKrocxR?=
 =?us-ascii?Q?yzw+sn1zjLQDJirmPZJj0wYhCKMcQieRncZJ6otQSFP7I0GWQaHDlCXuvS0y?=
 =?us-ascii?Q?HMESmhbRv6McTRUPfBZeY6uVEhMYSz4ly7V3RLN8el5fQBAkUQL44Rm00wQL?=
 =?us-ascii?Q?mle3VMDn48lrSz5OnkACeA8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bcfa1f-af7b-4bed-c3ba-08de20b8d199
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:29.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SwnUAPweRSRQfY4F0mnefZrmh7pnbVXE0X7uN63fnY3RwYZOZt385Nfek7W3Z/I4IiahwW3H6JFYPNVFkyyiDfORiJSjveNjU02RMnulyZvxyDQB2mWNI8jZMmE3Ci+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5670.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 8a681ee96f5be..cb5d03bf4c7f4 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -431,7 +431,7 @@ static bool rt5670_readable_register(struct device *dev, unsigned int reg)
 static int rt5670_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
 	int val;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 
 	if (jack_insert) {
@@ -966,7 +966,7 @@ static int rt5670_put_dac1_mix_dac1_switch(struct snd_kcontrol *kcontrol,
 					   struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -2670,10 +2670,11 @@ static int rt5670_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_update_bits(component, RT5670_PWR_ANLG1,
 				RT5670_PWR_VREF1 | RT5670_PWR_MB |
 				RT5670_PWR_BG | RT5670_PWR_VREF2,
@@ -2723,7 +2724,7 @@ static int rt5670_set_bias_level(struct snd_soc_component *component,
 
 static int rt5670_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_component_read(component, RT5670_RESET) & RT5670_ID_MASK) {
-- 
2.43.0

