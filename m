Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443613;
	b=meLpFEGqPNi+yTr8hsvgqKCB4jRI5PgGeqrE2eVBVjaDLXRoVT3DP9fAc50kSvHEHQPW
	 pgEfsSuJc2h5EZyk5OTmb6VY3yd5q0rVI7TYRC29VkpHTyH5xyl0GdzUk7hSn+skbl5wG
	 Rw8gdAkcyXDJB49Tfyn/e3Ju1+ADy/kAgxdnONmLBSQUP8zaoyLYlI2vwxghsQqmayx+v
	 lzyJFoMzCgaTt8M/lqM0dj4fBTqLzImq5BJKihVEXvVdZXfi8kfSPxJtjtXkbJ8/x2U5C
	 OZaHDPc7mg3oqhHNC30JQHd+FolD05PktiVwzBgcS/FD7yWsu4mtDrbrTQJAZwnQJSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443613;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lZT7BLaDkkJn0SPNRZ/hrMKd6UxzFnVRBp8YpzymBDc=;
	b=FKssTX5HSYa1enehcJllgourtxU1x0ymI7YTMrt+jZH8lPsiHe7l9PB9a/kxx7TIjJhY
	 U1nE6LT73gzAXxlgWjA3JYKoq0/woHePGMsjzhOyJUVwQllynpPo2O2PBNcxAv/0viWRg
	 gQiEIVA8OSL+KrRC9nmKwSjv3VAGYMMAh/305zeLIjNWCxDPrNsmgjSMVdwPMu1RBlivx
	 D6gXJi4t1egEXbzX6WYM1Bx6U3JJ+ja8AwasHTUj/5KoxWcV/TmA6a5Ry7oltNdY5KyzS
	 6OmLYKibqOf3lx9rFfDJK0WoT75qkkl13up9IxXLLQgdfbsNP0FOd2DkfR6U3Z7SZfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=gQKQrz9o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C2606A32A
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=gQKQrz9o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otP+eZox9vd8CB2d78LY2Pxou5571NSEP2Gn2eoLw+DynYnSuMF4nGxeyrVR/Oywkb6mtYsM/bQab7zfe/6FVszylFBNQzHTFHVakqjhsaPNJ4nZKIKnrcHuPR6FgBW9Q0KjuwnVDq+1eMtjO2Elk0JGJh0fMekNYosiHsNpeBmWf5AWv5JP19gNKaojJ8IYAHxJoKmOp3OY0fA5rbSvWWrc9KNWafe5UmZ5Jfhd5ItMKKRvoqdSajnkjkcD8qKQFFxH8KECdfEcIhKV0dAgn96Ye101ojNGbbwFKXsmTn3BMRTMyP7PfJ7fDi/1AhYNHLnPuJjTpPdloSFCcJFIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZT7BLaDkkJn0SPNRZ/hrMKd6UxzFnVRBp8YpzymBDc=;
 b=Udk/W/fVkiV0Ez+7XIUjPAimkO0Yf6eakFX9YbkyQxB4vpwn/961x7ZwSvJXOdWipap8yh4na57e8ytNgLtXwMmiUv1kJHuNUS6E64+xrROL+BXWX5AdNtr8Ljl/gL6Y2Rhupw7mERZACHdl+0+tB1BD79c9Ct0teOFgAlQsP8WMV+EuMvNh/w+x4XVzcEqfWDTEZgaioO2aCR12XgOe53JLHyQ2pWIz6Sy19/xRDozcKdqz5/CsvvlWBf7HKBd3TspyXhKqVFNfTKnA8FP8eSPZJArGYAVhz+wZx3Y5JbuW5RMnHrLf9bCL7jWTvIewUbG0wHOcRLoDqhV4z2IJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZT7BLaDkkJn0SPNRZ/hrMKd6UxzFnVRBp8YpzymBDc=;
 b=gQKQrz9o2ok2JS2Yj8kD4wyAzzGEgxXl1kSdWxQKeLQnTUT82RZKH1xLg6pKIn2Oz24gayYijusJZBCQE+imlNNprqd731zd+LdWetR9+Vi5qct5i8TDzjKWpsPqid5rXLlV+OccXU+PgLYu+h7ZDZPafjrusXVwLxsaNo6TnAo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:31 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:31 +0000
Message-ID: <871p8q28is.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 24/27] ASoC: soc-component: add snd_soc_component_num_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:31 +0000
X-ClientProxiedBy: OS7PR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:604:254::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d59e17-30fa-4ec0-89a0-08df40549411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261022105027099003|261021121427099003|261026121527099003|261102130727099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XkOyMqNvsTfYGRvv+QP1LCaBnIJAG/bTjzVoUbAPSUUh0UDvfk0M4072G8WQXp2rjsNSEpF2Rt8Q72apWwlE71u6Vs5nFnOE3Oqj3yamjW3Iq+uuOdk4aoYxy2Y42azIGVexxWoOXe6odwbCK93t44UDv5kwZt4yqVIhiCHMy7HY/sNzljAqHrFZrKUO7GsEc5s8wSP6+Bp3YS6HFQc5gcwknYHzFy8zvoKEhkg8lceOPRtX7sWlfbLWx0nbESbLn8Ca5MzJwY8VCnCqv51pbzv5ZM4McxQLsSEfMOfSAbN/5bOD45uUhwN11YhZXiFB2SPPdsBcbd3cChdqjg4PSeIp77iW//hwnD7c7QjYS6eTPMLWgm5x3+QQxLtpjYo+TJ/h7Zs4IsnOdyLaWcdx247da8Eji99Q6+pT5MFTsKUATHaJBrf9CevtBAr9XYa69+l0uHQIB3YLJhoeZK4lSD3wB+xw5AtxjP7jp976ja8zPeSPkMLlAJvFckuSRcIRvv3MmfoCt2PXni32LFYkmA7pF8G2w8WQolIManuFxIJswqPLpg/BOVjKxfpiC/vHRbnH8Dwz10zdE9jzwSQc5nB/MxbDfkAM+et+LhfnVWZaRAhbr/gLywWpxt9LN0Er178E0Ryci1h06jcG4DzGgaLlueiI/6DDrPQH0JGg8zVOjCFKh/NbegnT/A/Us4pa/X4Kyv3DC/hMG3vaK3zyO825lVTnvytSfhROj+MaTdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261102130727099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?KvCgHMpH5toulCYpZMQ4p4UiQBMqdt60P/y8g2o6xWwIgDlLRb+Gk3OV4O?=
 =?iso-8859-2?Q?xJBoVPuO7lCHO1rfSz85VkBL3G6+iEg6VhCFWpRPJ/5n1w2IWfUSAt5BHj?=
 =?iso-8859-2?Q?58RGjL4/F+1iVKsWrvXjaTrZoX1LznwzsCGviEMeKunsbIcctDB5Uxi7dx?=
 =?iso-8859-2?Q?1W0xTM0DW2aVJYiem5iW6UhgsvB2D14ns0Rs8OrQ+LMjaiM0fpnsSwR+3k?=
 =?iso-8859-2?Q?Pfa/NAp+v/IcepryrzJ8mb7j7+WPifwPW9puOpjkFSJqlNIHDW1bzc4F0i?=
 =?iso-8859-2?Q?W0/IYifKntFWHvpgtIbXtqihr3mLjkJTkJFktpyfo0JkQmbx9esFf9p478?=
 =?iso-8859-2?Q?SUInfl5W2u/CCjuOoVvM9rEENQLl6fjwxZH2fyV8Q36RiMelU+m8ARLAS7?=
 =?iso-8859-2?Q?i+gDL8tBuiNPaV4l6tnP53Gt0Wv2HJnvaCmwUnH0thn9K73kCWDkh7m602?=
 =?iso-8859-2?Q?c1iU2pPOSiN3/AWi7G0C/w7RgjnXCxaog7W7+3et/oNPma9wvyHwewBNby?=
 =?iso-8859-2?Q?bmP/XHQeVdz1Qp8DFdbpdG39TkXjgJu0hBRUxUc/YHyZFj9cHscLfQWltM?=
 =?iso-8859-2?Q?+VSHIaNmEvCPiLAwdDpEDgl9RiOp6uOw8IfGnwZHGthPYIvyn09nYwiS+5?=
 =?iso-8859-2?Q?PtxUtu8DoG0hHJy62dHmDCHQfUZk1w9yWl/a23Mz+vscV0BRaq3dEGD0lI?=
 =?iso-8859-2?Q?jaTcKq++t0s9VNbeRjmSmlBCD9CruLyATg095h/197qFXndzGEJCuoabbG?=
 =?iso-8859-2?Q?FElbpLg+Th+o+ZahQgBnYJBYIVDDby166Cm4ueYl4v6jrALQnQBVdZnN39?=
 =?iso-8859-2?Q?UI8bzQjLoWv8rxMvfM8wyi9W6/DP70vg9fFb2UhmfVXVozlIaA9bvy68ZQ?=
 =?iso-8859-2?Q?xDikjGRNJQvTosuc0aTONzxynoOwwrqxWjLBWIIVSsRhc1qw/l5pHoQZ5R?=
 =?iso-8859-2?Q?Uet7hyWlc325C2U0i7U4UrVo5NxZKzLXE4AdzAKJo1qx/O2pVptW0d9RtD?=
 =?iso-8859-2?Q?/cbppmbyswQKwfXrjzi9FFLVds2YGKvHtQA0V4+GZ5LvxajwOpTncx73Dt?=
 =?iso-8859-2?Q?3J1is5PFwOhZHsiss8aPvB3bg9TEb+brNfAyfBe3vsrE1K2tKcjwr4WNbE?=
 =?iso-8859-2?Q?HkzGZV8nyY2dlOBe9rWBmsVzM1xgF5cF99Q/6wGGUwcZqqQJhnLHuuFLeR?=
 =?iso-8859-2?Q?zT6b1Rp1gXeZbXTfO5hyAFcsQ+1aPvLDErVDfZQQoEBLd6EbGMlutQUvzv?=
 =?iso-8859-2?Q?qhESm2E+9aNiK6LfguDDjb0XUWbscky1yvooxnZArFHM1U0ruEnFT8wIdp?=
 =?iso-8859-2?Q?3/rZKaWj0hj9NziuW1/uMUlprl2fdiqIsvr+UAIFWLhVZC/ulac4d2TTi1?=
 =?iso-8859-2?Q?HqxALPmR4KP2VVKR/vMASjyaS2So2g/DxReO+t6TfHp0it9fxNkd7Y6V0H?=
 =?iso-8859-2?Q?HMDcgnyaeq9COrpr9rwKqEkcWhwqBIxjynkRV13GTywFWPyrPFvbOqUfs2?=
 =?iso-8859-2?Q?xnQ2L9XLMz5oGBZ98Nk0yq0Aj+wtpjFVxFV+hApoEuCp5cUz14+nZBW+i1?=
 =?iso-8859-2?Q?8kZlpimJGSNVU1HFS5742io+Wmi9FKMtpWYeSqlFdIMLyV+/OjwoCB3CiR?=
 =?iso-8859-2?Q?ewiUX/aIHqxsUfVM5BGAisCS9y2rSegWrBKUVnbZLrspeIThnzoOOe64wb?=
 =?iso-8859-2?Q?rN2jVIk7cB3NBuFX7GFi8fV1hsaCiWSl5yR+9qxzLVKVnIMiBWbTLuadKN?=
 =?iso-8859-2?Q?kiiLwEdXHtTylSjpShPiAJHD3Vgi8e2OVOSX7sAeNFoD/a+3XIaGqjqcPN?=
 =?iso-8859-2?Q?0vpl9H/uCFnhZ+Z9UrCykxV3bjOzH8iRCKNnBjBJ9WSFkC42Ivb9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d59e17-30fa-4ec0-89a0-08df40549411
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:31.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BDyTVPQIQKO9vcGMjmxb5ZNy1dSID55c5ItLJY8yMGjdHZj9lOSr/Mpx7/imCHZa2Huuei+YywWxJeA7sVmETPaGLFr+tMAA3SJk9EJCWcVinc1eyziONV/zfv1WuBb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_num_dai() to get component->num_dai.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 458fe11a10da3..8314a2e8df55f 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -393,6 +393,7 @@ static inline void *snd_soc_component_get_drvdata(struc=
t snd_soc_component *c)
 }
=20
 unsigned int snd_soc_component_active(struct snd_soc_component *component)=
;
+int snd_soc_component_num_dai(struct snd_soc_component *component);
=20
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_compone=
nt *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c0219d9f96ea7..9e2768838a045 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,12 @@ unsigned int snd_soc_component_active(struct snd_soc_c=
omponent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
=20
+int snd_soc_component_num_dai(struct snd_soc_component *component)
+{
+	return component->num_dai;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

