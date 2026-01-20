Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393115E97
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868052; cv=fail; b=aMLQKOWcRnDVPq+kFQxdPxzpiEPoT0Maa8j79un36owgoCbZo6CIvgGBFqUK1dfwZJCxuASh8zSq1YZbD33oa7uyKoGu/7L8kF7lMGtMG2YfIgRo6bqLlOc7AbUfywMEzMvKfVt4jBqtCIcSJ7hMwhsBECM/dI+Py8pzmoBjt70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868052; c=relaxed/simple;
	bh=6ITjJsfPOgNMutlNekR0d2FU65RJ9B8aw8TUl+bLfN0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N8buxQRnN+qQPxLmmS6+kBaReq8aBvJd8zYyJgbYcBwgne6HLCAdpdqnfxhVK6/YadOZdwVrCsU2HpxqHNBlaDsmgVMAjgaQD8nApzbQUkL1i6gDIRH4nsVp7rWyUHghEAfM6PZiMCoT/L+pbn5pN94tRPhWucNjzF6rSNGDvP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jqITAtqh; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jqITAtqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNTnJmyTUr4iUDZPC8om9jWXTYlOm/Wa+2rQHIraPSkXUmMr4NH76ckSMkUjrH5rOvfqRh3iFldawNkqtr5NfLjK5madPhqMVR/KVj1fxAPcvbrndiGEtieXSZ0/COzbZztG+1VKHpoy0EdbrsfsbQCWfz0BzBQ/MgESe4wS97msRukUqRxh0DgiaHKJh36MwGbYQNoSMKfmNCoYFFboFbY4V0Yud5z47lpqtHGmnVElh0/hcuVwokksNxhHALxw3rhTSTchn0zFJx+JMoAXFUjVv3CAZZZjbOgRs5/Fd590BhW4KvX1TXBs9/gv51bUtkUm3QCYqGtXrjegv99esQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H41iu8IFAa1qX8z1jOY5v7kYU7NFJlMOGvnDVFxMCu4=;
 b=p3/1eYB1z5lfnVnUP6kF4AmeiGF3LTXTmyJP0Er7bfwV6hs4U1GsOFHTsdQoy4kpY8VYT8o1zXXgw6mViV2lcLjKJOxRRuo2bNNAsB2cl0LkvP3heYuCMurGSyo+SC34+zB6EP/jMNobmhibI72bVLdPwluUThXPpaiW/Uw5Kq/8S1d3d4ALjq5mcAxGmLbcUjwRr54GcwzYxqGuAiaYzYgncygh97WxQDkn+66JjnLj/6rmfewV8MFds/3TypqtQ98T7Xvh4yKccKPE73BSUmB+mTYjDEI5hcEfLXQ05wcK5LTAp2nPQwdx9KtM+ELykupJjJg9CEe4vDtl1DtVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H41iu8IFAa1qX8z1jOY5v7kYU7NFJlMOGvnDVFxMCu4=;
 b=jqITAtqhxyVDGY++ZL7nhJl22fHpWmTB+4R6nXAqtQxp6Pge0Thz3n58tlX0muoQ5x1kp5eDETLcj6K6JA9fqEjLh5KdjKJuaeeiRpaach93f8Mqyt8C111b1q/+ZUcO1roq+QDCXb61HuaVbgls22qfOSJRbGSPJLkyz1Ak3FI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS9PR01MB16099.jpnprd01.prod.outlook.com (2603:1096:604:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:08 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:07 +0000
Message-ID: <87o6mpqgxc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/8] ASoC: tlv320adcx140: don't use snd_soc_component_get_bias_level()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:07 +0000
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS9PR01MB16099:EE_
X-MS-Office365-Filtering-Correlation-Id: 919bc5b2-9d59-43c4-8860-08de57b8d425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yotMEY3TcG2OpTLo3Htrv23uhk8BpTHRnTJbqpDiZlzn3xv1y9mmKRHhTm1h?=
 =?us-ascii?Q?abmoeyg+VfMf/1evAm6tWEBxZTheKEEV3TE+sLWyRbF29xyjQpU+xFjt2p7k?=
 =?us-ascii?Q?QijLdUgtTY51a2YhYbyI7jibmGtfHO64k9PzK7SwzY23kXcTKyTz/o1zWtl1?=
 =?us-ascii?Q?uLlTppvbXHo+p7Qpe9NjiS0mPLgg+lV5B/tvwfmX25YZfNROcntBzcFR6DWS?=
 =?us-ascii?Q?C4DJE9WEjLfX4ZflHq2CaoWbje4/tlpZorqQm7MKZjBo04aZLJTGyM1fM6aV?=
 =?us-ascii?Q?23hkNJXyF+WcMaLbqyQrMd454cQWVV8Rt5Kbk+9eBVxw2wLjnL8QPPJhGVuY?=
 =?us-ascii?Q?Fwe/Nk087rh0ZCkTFr+x500h4+KYLqk/03F99DfjPM41iuPOzsdrOb9REBVB?=
 =?us-ascii?Q?UyPaGqTJGvQYJoSE5SOoQ76vtHq0iGOUbSuwJSFF4wO5IsK+my4eX49q9HO1?=
 =?us-ascii?Q?K9+u21Z05BvXGDYwdXFvg6TeWrbnDaAAxnc01RmAYWYLFE3kbmJz3ZuXsWiy?=
 =?us-ascii?Q?662M/y0bD1b5TXG6hh0Gjip8Sqwt5l53Q6DgEbZBN/mf7MZ37t851B/+NTAF?=
 =?us-ascii?Q?j1SoYQi2+TGx8lflNQKLfGBknJh5a5mB2sDP8vzH1H67Kl6mNbvbEW6ogXK2?=
 =?us-ascii?Q?SqApFQKhWDGj6iBHtxdJ4hgqfFPDI8gV5xCeuYh3fkp+KwJTm1KkSae29cK4?=
 =?us-ascii?Q?I5SvVjFBUBgZ4LpEHEaNJJK2PWlPl9FeLGmmlNJUA/6ivXl5KPWYXqyQZRkn?=
 =?us-ascii?Q?J88MNvbholqyuqV+x6xtuw+5Ts0FMn778eM8+GxdqmqGp4Fk8SCE8+Dc0ilD?=
 =?us-ascii?Q?auA2ub/SARKmgkCY9vuhnYtV9h7/VQMOA02oNkeDfH7xZ/1BRnvQGbzr4EOY?=
 =?us-ascii?Q?McAkZpgwY1J7pOqta7VuDXeSjSNzB7RqcImf5UPM9MLAaPLDPpcDDWx+gLXD?=
 =?us-ascii?Q?yXHyPo4hVOHtUGauFuWabvl1ns5Fq+MSYsdbWVAWh1MVbYWkBCeu2ueRt+Gr?=
 =?us-ascii?Q?4avj2s/3Xz4YNEreBhiqaSUk3mhlHOvshCJbkORREUVNwpfnFdYRnYoI9tkx?=
 =?us-ascii?Q?F/1QyaVULQYu2Zf2+dBWby5JuD90zog5aSZNO8Uf0yRucJr7CptS9JdwJzFe?=
 =?us-ascii?Q?RDm/sYBYq+eloJVj2vpBMmy1rn433W4ZnkPJwNJgS6TPScGCku/b3R0uF2aQ?=
 =?us-ascii?Q?tXeBm8m97hu3VNVg6ntOKjfRDONRPt+kIpFP7KyGn0e+6HreklQIkOJcS219?=
 =?us-ascii?Q?eMlOKRBia2ByCigSaxCvsEgXAeRoOHLnEM8wokQHznGyRctRKBsxYJ4dxWDI?=
 =?us-ascii?Q?JEkg31Gzsj1kOv+rIfKX37HeEzAwypJZ9G90uXMsMt+WGXEZj/sHdXK0PGG/?=
 =?us-ascii?Q?KiX/IzHfXOO9JUKWns9/0nsFlJCDPVCtWtD8A/oOVzD4KP0KO17C5PUoH2Dn?=
 =?us-ascii?Q?cbZvfTLjAYBFRPdjyka7jQmHTiYmMtbOk3AfCSYFfp9noo60RAT8dWI92wcx?=
 =?us-ascii?Q?B0p7e+dwQ7SpsyVboUwkDal82wHEgAQwR0HSpWOTN/nYiac+rU77SOtmM1cZ?=
 =?us-ascii?Q?Qauwp0gdbaWL7tUQlwaAMyMuLvMA9BL2RpJ24PP3uoiVS6eS34sRIP7dkalJ?=
 =?us-ascii?Q?yOusulowWy8S0GzBRYtPUCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ey1GALrQBkOXQy9B3ozoSgwyTqVOd7Epx63XgngLsgmNwG6DdCOVEy2y110?=
 =?us-ascii?Q?lWer0FYU5vJ/s3uS28DiElk85P9vO8V+UA7/zTmqUs3ryuaa6riwS4/i4sTe?=
 =?us-ascii?Q?6h764qc2lTg+emCG7aFCuiPk4pCXfxn35V/mqAYC91LyDq+ISR+y2lmCSSON?=
 =?us-ascii?Q?Tdq8hjPALCw9t26CgQ+5ikpKaVF2o0+ouveV/KEXnjp8ISp0hLXmdWPVzTHZ?=
 =?us-ascii?Q?tHAjWV9EDyX3Ib0gChZMmwvm7kqMvg1qIshm8vy+tn9CiIOSCv325fVhLCoK?=
 =?us-ascii?Q?MidR+xAbcfvb8JbSe4guxt/YTIOkrF8DqtI1ATX6w9NgmZlbTXjTHs0n+SGg?=
 =?us-ascii?Q?3q/IRVloU8SCuGvVlKoevZdPDpJN/Qnj41e/XqB0q+TwuX6QDX4Q1KxYQlh1?=
 =?us-ascii?Q?i8kqwPG/64hiYJpYW2NqVX/T1bV72Urw9eOua/aZdUcXhxwUm9Dc5rvlEeNS?=
 =?us-ascii?Q?m4Fx5gm/NewhAo49CrIc7eO5qDUZJsXZq3d6xJTqGD6DafjsIA9WWBdXOtXU?=
 =?us-ascii?Q?tmK2km/F1aJ7t7Q4qYnGhwDCcCHIDQ8rLuvJmh/OQE5DjCsVhmdln3rJRFbW?=
 =?us-ascii?Q?X5XePBcqCVaOAM+Uiggx5g1xI08MhjlyLqnJX8KJuEkykGaxY1UcY+Yh9WqY?=
 =?us-ascii?Q?dFCUMWuRcwTvkh2NmEfFNAPkYQFj4lZyvAMi0LnrSJ4+F/XSvDVXkgXkzpk6?=
 =?us-ascii?Q?Uvvyo6qZI70IufGginVxXu0Unrup9x0vKaj430vBcu90SpIoI+CDSqlNgcTz?=
 =?us-ascii?Q?GYqjAjldOar9v7G766ZSqqv7Dl1xfRkoSSaE+zEVZWXUxZF9GyV0YnegRv43?=
 =?us-ascii?Q?fD8nFNytXcWtadS+RNrTpWZpZcCBeLrt3g0tsJzncKqifhz89cyTBvfOdbsa?=
 =?us-ascii?Q?RPH2rsv5jF2v6yscPV0BCM10twKUyN2DgXmNL2snZuCv6l9ES59ckXFcr3Kt?=
 =?us-ascii?Q?i/C6bm7E4LERVraq3MBAO6M31xu/3/tiLveqRGUS7xC5z84VhMQsDN2FwPLx?=
 =?us-ascii?Q?ZD9mQakV8MAVLFwhMfJ7y3J4ierYp2tG2tRLD57c2Z2FFLXwz0ejPkQvMhRL?=
 =?us-ascii?Q?GoJpFsQpNoWSAErCaxdYFNe7CHl4yI5JeuzGMteHZDGj6Tobg1WH7eMfL5CD?=
 =?us-ascii?Q?1q9Uq4J5W3ctWS9s0VinqSmQZz6KmNjlu52erMtLH1U2UQUxzroDlnxKz58S?=
 =?us-ascii?Q?1O+SV05CxBRtOztQ0g7owOrp+uWoMlWEWiSoDAyqqNrT3FQ0nJXRb0hZCieI?=
 =?us-ascii?Q?8hHGmRS4AuLpa5KMc0tvIIVTmIxe7vStNhb7ASXy1bK1TvEk1n88uxUuvJIS?=
 =?us-ascii?Q?vYTEOYoapZu+IiIRTkrctftza2PQDchTXr+QUIusDD9WjPLY0k7FInJyJFC9?=
 =?us-ascii?Q?LVQwV4uwuExQuoS87mI2Cx9d5wzNzlXlKhxO1VLU59SGDnKrR9YBVi07IuUg?=
 =?us-ascii?Q?V2WpRV4uQQCXgHVE22e5uoRm5YglGGuVEg6Tk2zd9zrpvRZHFfHkJHzqXABs?=
 =?us-ascii?Q?9fVpzpOI1A+AJLzL+sZ5w4E3dxEPi2zMgjUUiAKziVfl5WRxemsCDwu+2Z27?=
 =?us-ascii?Q?+gi2WFJaYMkYZvZgm5MeV5gyqvHze0ioSMPwlS3om4xZPkdijdZZZJRehOXA?=
 =?us-ascii?Q?g7bRZLdY+XkOuQ6FflvA99LHCbWTE4I45idUiSqzeOLqLYvbBo2oHjbHcXlA?=
 =?us-ascii?Q?lcVmdJwo2omG9CBNbK7XGTtSUROyuUN4slScW48148G5UAuNmuEfO3IOfPbL?=
 =?us-ascii?Q?jCwfRaOXj98xNXYd8K98BsyDw7xe/p6Z8r8aUcpqcQhb4G4DgRqW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919bc5b2-9d59-43c4-8860-08de57b8d425
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:07.9118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaZHkrKtnVxaBKbEp5Jw4NWSuvJXyXSCJY0v7PGaBhDxIuqSIGiIorz+Vl3qTX3xcfCPJjDJg6IzcMWo/PyRlVdmwdGg1HrQsBSBYtehDR8NuntmIw7vcdw6yzIwR3ol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16099

snd_soc_component_get_bias_level() will be removed.
Let's use snd_soc_dapm_get_bias_level() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320adcx140.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index ac6aab8d72240..e4f27a734501f 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1188,8 +1188,8 @@ static int adcx140_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
-	enum snd_soc_bias_level prev_level
-		= snd_soc_component_get_bias_level(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	enum snd_soc_bias_level prev_level = snd_soc_dapm_get_bias_level(dapm);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-- 
2.43.0

