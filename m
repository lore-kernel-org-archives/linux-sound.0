Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9975F214A9B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821148; cv=fail; b=FZSl3EFGXQ5qU87Bz68NaZtoPKQ/+SlhoanHA2c2LoZwyfSSGaCL2drG1FvIfKvNYW77qCH76G4+Lzl2/uZzvSS266vd+n9LboLuJk2JrP8i5h9stxmyjO8qvTOKkkQoJV+wXEen1aDpxvn5WLZl0GE6yZQAXx2MbrWKkU/kFBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821148; c=relaxed/simple;
	bh=0sQf9NczabUHOFwgOGLeaPhTobBsktqX3iwHlZLiDsk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rEqhe0qsJKY4f/GdUMGXUemkcqAP9GIdcKtujD7qWFqt2UCYrMBTwkcG9rW+qSKv4T3VfKY/uiZsRM6Mrgq2kN5pT9k5jSfNxjHuFTnlksFTMbd+yBLLMrqVurKfkfwGIx2DlbAuPnHrKsXunF0QfZzUY+of2ZnZKswxAJAdL9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bf4df9Mr; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bf4df9Mr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nScK1WImbqjYHbj/ADj4DZJ6sz7bUTlQ5rOqzJXcuBMIoToIuCVD1gspF0q7XLsSZagOsy8gsTbpm1nURk4Yl1W1LYX+mSBOZ+FySddqrJLFc8358QuljPyxQ/WmMyqTVHbvV+oMdiiJwTL2bCvJG46rWtIlIsCum3/LbOh04C6f/ItTadVWesV5QmWiQOmpG0Eo5HGOQtt8NS2Kpk2gKz/FYhIalzoSxCP4mzYeiaLTndFxSOTHTZB4pxPX2g/6emfxIWC8Lsd2IGZbrSrSFRD9Kw/PSsMSbCINIZJ7vyc3Ajbn9iP8VV1loV+JApVKojS7e4bUpfMe7dlOpyU8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9TNsjvoPWBjrk1c+xb43Ehl3gOTAwt/ybY1+CA/aT4=;
 b=LootaZrVcOhucaSA6VvhZE3jwiHwySrSxxmWtr428/YlRTRAlyCr+t0dvcr8XOyKJgNCgpcwCrQAQaSSXB6pxTRMKvSSyqxIqZ6bK0M1fwXTiqqQHPxDv+TQLBR/o3TyWptIyciVa+mO0re2gRuFOvR4WH0Y8ef3DnTPIi11ooTycqk+gcZidb8zSt0PLOdLkWfihpSe+OeNdIT4kafk1ha6rOI3P5zt1s4Lm5sbQKCOvE2jDH7YwNjhRyWWSE/i4/1xeKLQLleFa36Eqxs/ka66vqK2szZn6TAHOUAXwhKPhvYS7aSSHZ3VSL1NhmMQmiKZgl2PK0ye7GoXhs/yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9TNsjvoPWBjrk1c+xb43Ehl3gOTAwt/ybY1+CA/aT4=;
 b=bf4df9MrMIqJRxDG5CG7a74uAdLwVwNASUx6Jd63OuzE67d2jv4jJrlEVjTH9bOKZ5ejPS4kAbi4alinsI5Aa/yt8vCWPNwmRyGXk+38KEMhVKsmiYQqxBvmcgjg1vg8TuWe4A4EGpPMXSvJx1w9Y+K6BC3+opduA2DGjr5QHf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:23 +0000
Message-ID: <87wm3xwgrs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 210/292] ASoC: intel: boards: bytcr_rt5640: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:23 +0000
X-ClientProxiedBy: TYCPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c3d968-ebe7-4c14-1fe5-08de20b9c836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iTf3deGpI3/x1Ti9PMsnUFyFZdRpAj7fbXSDZYrX+k0mvkVFaYX4DcjTFKQ8?=
 =?us-ascii?Q?BEJcZCo/jh+EU7cIc7Qy2Cg45W3gyTXW+mNadnQLiIbcEd3cd6h4mXegCU4t?=
 =?us-ascii?Q?cOAZslZdHW3yMUUKPWaMRElvpSM2py0ke67HlcgEsJwQmYmmcay6BK2vDJnt?=
 =?us-ascii?Q?xCL6ULn6VozzkXJwsGoeCfsEGV/7IOMeXhIt52Xom2vuyQdXyiJooMsCJ7Sx?=
 =?us-ascii?Q?zu7i3I53GvTUveWIuwgdtfuXIajZmsiX2hry679HNxuXesUGNk4kooj7P06m?=
 =?us-ascii?Q?kfkc5fxhVezBzv+TYjHqCNN7IQvmBx7eMCpFlTxiMiRbTO7uwhHl9Opx2Pzq?=
 =?us-ascii?Q?6n6nItmRU1jISX+ZVLyh/oZ8cc/x0OFpcA0P4eR7iHM64REvVURA25/mUd49?=
 =?us-ascii?Q?HvacRWhFzKEqOdgfkvXDukTKGW2IL8Z+2OIlocV0ES/i6JKilhEgaXbReTV1?=
 =?us-ascii?Q?j3FlUG8XJDIcjEtoU9bfnEMNnbI22EdktU7vsA6h4BtGNmmB6EGwm6txzYio?=
 =?us-ascii?Q?9tNoShXWCSY+EHwt/DVjVCnNuTmQpweox0K9hptgFjb0QggMCxAKB3w/NGjn?=
 =?us-ascii?Q?6TauUwj+37TTBMpLE10WNExHqmMfY4BPWkGSKMayOqsg1OhBZloqqT85K7tT?=
 =?us-ascii?Q?bTscJOBWYYeh1c7jSnlO+TeZEY8R1iuAYGVs7zO+0Nl7iZdNzNYR6X7QqkZC?=
 =?us-ascii?Q?TgV9hHPbiZpl+aBK3qsoOT9qbIKGeMQHtzSolQtKL+G9g2DXNdqZjmD1IV2u?=
 =?us-ascii?Q?2ctSwBtA6T+NmHf4p5v24amODKE3GZFLl2NpxtJZMFht/e1+DhR7VRx78H6N?=
 =?us-ascii?Q?LO5z/pxCmgCgxtJCs44i7JAq+i678w8OsDp48vAdSuiwQTR87ape2nXw+F6k?=
 =?us-ascii?Q?pbgy0mLyLXQf02VtK7i45HEpwlzFsYGDpS4w4fHsNOEdkhDpB4dfC0QVO1Bm?=
 =?us-ascii?Q?lxY7WXUSttyOAUpQeMEPIicQzLomPxD9a+bgI6b3X11kVJmkNiaU/drAHiOe?=
 =?us-ascii?Q?/RgSuIv8jfmZHz2ydfPMGR+DOLI2Mgdtct+0Rg3WWJDqpxrPodCbDcVcnqc6?=
 =?us-ascii?Q?uhDzBNEsu0N/NwPdt+gUhgy3dYORAqN0xrYMp8sqoU2FcwKcwFAIK/qm+lj6?=
 =?us-ascii?Q?QCbJUVnBRB7MgiuasD0HDtxSHIEN5PMWHMqIc4Gs/ank/35RoGwWNkkGkW0D?=
 =?us-ascii?Q?UWGrEqrTq8OxyDNISAPzM/XO3qXWEfS59NTixwoGHKfUlx3I6/7Tp6xJfuL0?=
 =?us-ascii?Q?5FGARejy4iz/BNsheKF4d4DWjXGd6Osr+Gism9iyOm3L5xuvQHbeGpeEIOA6?=
 =?us-ascii?Q?qCOvPlo/GHlRiUrNXFB0vaJ/C2E0w8uYnrdz0WiLqukLFWao28kWMIzPZ7/0?=
 =?us-ascii?Q?zbvkSCQdQerzIG8Acjh1UtOkcXvQE2Bd+kTVh7gp8zkOttO+kLO3ekVo3uSi?=
 =?us-ascii?Q?rp7WqOAWOy1/3aPNz2OZApr3LB0sAytSvsCujsAJJPJqAZ4wNASL7wt52vlI?=
 =?us-ascii?Q?7imUcL2r8zknh0C3ogTTbYOjAl+M+q6I9hBE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MXzYLpq3ZBEQT4bub2s+iSRewdV1POAlwmkbuKKpwrtgBEoCyoX4xuxVM6K1?=
 =?us-ascii?Q?kGKVc4Xa1L8aaxIaUwJC76d6MajNT8XTCkEOYGtD8ka2Lfsn0le55E1syW2L?=
 =?us-ascii?Q?K9bPihkcIs5DCGnJ64EmCHkZ2BWoRFuZPW8l8dzVQgj+88dluo/E9laIU9GQ?=
 =?us-ascii?Q?jTtt3YjE168QJS+S/SXUWO7n4IsoME8DiCtAZGY+FDwALyskf3mIZdvoPrFd?=
 =?us-ascii?Q?WVqqRLyQ/uM0LYXDfY+/M/gJ4qfU8tuNeNiLEAXjCAMPIX2/r8ElLp1xqfnd?=
 =?us-ascii?Q?MM1erP0nHBgtXpcoTMSB+y8+BLv9cCNVZDY8Buacm/9Tbx1/dVl7BEX5IdqQ?=
 =?us-ascii?Q?qXsA5LcCw7Bb1tuiXaMcQmibFExkYDDFS0G07JVnIpRVn9E6EUhaYx+vZ39y?=
 =?us-ascii?Q?NDZZVezhdO9HvljiELyiLliIJsNjsFRDsLhlV0UTot2WluN+6qw3Hbv8Djzk?=
 =?us-ascii?Q?nRP1QWOxiBRJ0fqKIOpzwhJrqDhnLKQm9WlxXJydnXJeWMtihPFKDyl/KgR7?=
 =?us-ascii?Q?Y0n+3gufHW1osmZgnAyQh34e0zJfUraNgCCAKDpJLfm/9Mx7HkAYy5FEi6Dy?=
 =?us-ascii?Q?HZ41uYt8fm4B+OAgXO8lMKSsqd8LmSnHQPvSrPwAaQZ52yn6ne0YcQwqE72+?=
 =?us-ascii?Q?gDgs+xryBeIYMkVp1OaGdLp9F0/W61GaGmI1Hz9Pr8DdKuK6FrMmxWDfsgJz?=
 =?us-ascii?Q?iMt0dsRjNVyrQq6QGcS0nJdtuOU/BmgYABPgui51ttn9bYcxxpJ/TF51osko?=
 =?us-ascii?Q?s+XKw8278OLjO4R30OU7+QClei4QZwBpHiIpEizu3zFDPz1e/HTxCLm5vNlI?=
 =?us-ascii?Q?IAOG5XAfqTTBoHfm1X7+P+SeKiMoNSjGK+rUAIh1wXDbxSYL8GM+WEzjorB7?=
 =?us-ascii?Q?KyDYqT+Y0eFVnimZO/eGYBuRca9EM4MjB+v+ynNK1nApGrjfaHK3b80+Ddi3?=
 =?us-ascii?Q?EkVLyKkq38gVNx1DKZqHAS2Hq7RatHvN1hd4gjm3fR8uBAYwcA4gfJELpfPF?=
 =?us-ascii?Q?5pDDefqfZPZN3ag/VZik16T91uTgVHr5r8i4HGtTCRF5WUuQT1RGEN2M+++u?=
 =?us-ascii?Q?SPAZHfqnVVRn+O6B2W/xWH7lSEd4fNzbfUkySBN1c446eha1IPHP67fqqz2a?=
 =?us-ascii?Q?fr3OsvkRe/WiSu4fS5Rf9Nny5bjhw1zvQT+zyvZjwoLbEV9u9zCUbMblcWDm?=
 =?us-ascii?Q?HQUrsK9b1qzs72ppTXr5rY6uBbbwynHIWDSp4F9tMbZR2Nzn8cHm+Nvygy8Z?=
 =?us-ascii?Q?iVZ6cP6MFyZGWAWj+Dn2OQNxC3RQmy8mh2pegFY6mDNFZoEBLfChrYct0Vq6?=
 =?us-ascii?Q?jdw70/XtOOcLe1wOMhtU+JX+HIoZPlmLQlGQTzw+j4UkYVRdbceRcziejYle?=
 =?us-ascii?Q?+PCMmUMzTN5o6vlT4gZlAnYelHmx9JnlQQI2yyU4tkOZW8xWSyyifbo5rTE1?=
 =?us-ascii?Q?ZJ8neXZbYCMrrzyjJTaR9GmZ4WdcB/YIjhESw2cO2hWY+q6qWK1bolRbA7Si?=
 =?us-ascii?Q?RD1uraTYoZmdteDoosWOquOeTqoZ0y9DCaL+VgBZSq9cW3pn9RQebcybJcLI?=
 =?us-ascii?Q?YXYB/cMefklYMbs16Ju3lEKcefauRX7CMwX6U9a/SJsIOpAg+jecBllL7kor?=
 =?us-ascii?Q?ltjzuIyMytDVxzBrP7jVZQs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c3d968-ebe7-4c14-1fe5-08de20b9c836
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:23.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTYxf2gxIXH4TB+Jh3PgQoMO0EkBWGpii7AkuyPUIHcH3DF7mVaDY35lLXFakR5iUbC9SzWt2vSCV1ucJey4Gtemwy0L49KFDoltc4HpTD5/yJfbUdVF2wx4Z802xcqg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/bytcr_rt5640.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 1e9b1903fae81..103e0b445603f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -257,7 +257,7 @@ static int byt_rt5640_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai,
 
 static struct snd_soc_dai *byt_rt5640_get_codec_dai(struct snd_soc_dapm_context *dapm)
 {
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct snd_soc_dai *codec_dai;
 
 	codec_dai = snd_soc_card_get_codec_dai(card, BYT_CODEC_DAI1);
@@ -273,7 +273,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct snd_soc_dai *codec_dai;
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -1317,6 +1317,7 @@ static int byt_rt5640_get_amcr0f28_settings(struct snd_soc_card *card)
 static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 	struct rt5640_set_jack_data *jack_data = &priv->jack_data;
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
@@ -1324,7 +1325,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	int num_routes = 0;
 	int ret;
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 	jack_data->use_platform_clock = true;
 
 	/* Start with RC clk for jack-detect (we disable MCLK below) */
@@ -1367,12 +1368,12 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		break;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
 	if (byt_rt5640_quirk & BYT_RT5640_HSMIC2_ON_IN1) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_hsmic2_in1_map,
 					ARRAY_SIZE(byt_rt5640_hsmic2_in1_map));
 		if (ret)
@@ -1380,19 +1381,19 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	}
 
 	if (byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_ssp2_aif2_map,
 					ARRAY_SIZE(byt_rt5640_ssp2_aif2_map));
 	} else if (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_ssp0_aif1_map,
 					ARRAY_SIZE(byt_rt5640_ssp0_aif1_map));
 	} else if (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_ssp0_aif2_map,
 					ARRAY_SIZE(byt_rt5640_ssp0_aif2_map));
 	} else {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_ssp2_aif1_map,
 					ARRAY_SIZE(byt_rt5640_ssp2_aif1_map));
 	}
@@ -1400,11 +1401,11 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 
 	if (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_mono_spk_map,
 					ARRAY_SIZE(byt_rt5640_mono_spk_map));
 	} else if (!(byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_stereo_spk_map,
 					ARRAY_SIZE(byt_rt5640_stereo_spk_map));
 	}
@@ -1412,7 +1413,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 
 	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT) {
-		ret = snd_soc_dapm_add_routes(&card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					byt_rt5640_lineout_map,
 					ARRAY_SIZE(byt_rt5640_lineout_map));
 		if (ret)
-- 
2.43.0

