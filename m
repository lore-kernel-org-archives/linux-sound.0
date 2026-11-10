Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288269;
	b=A3+1gqcHP5uK+0ua7LsnGlfB+aZTUOi6y4aPonL64NHniYbPRgyL5af7RfEOqoVPyf2t
	 g7XJvWKhtqavnkVZeFMwLwFYiC2VF0ui/P3BXabfC84tjmPf9EK+tbmInPBGI5jIcyJEN
	 ZtZaIn9TBU7OFpBPkAp9W4BiEasl+649/z0zgWVd7ie5/26eXClET+7xeMFvZn9NJtBq4
	 DXRW9zaV2wdvtJFTVUWBCMtuYC8aR1uMu+59znsC3XyR/JyZIU+sfRI04oziAK/EsWUZg
	 6eqJbp7t+yq8gs6nl97SidMPddx4gEITmHbogv2ClcSLZuTW73y1xuvqf6ZbOhtdeHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288269;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uGrxnTA0P6F3JPS6JAxjOPfYYCVXtWGKd0AABd0bJig=;
	b=Sq3F4fbZogkZAsxjmwd8Mz7lyGb167Gly/jaMgsJ/4ZeYTIO6a6g2t5OoPkusatEEdKM
	 pbjg7m2B1SH7HlFATNf/FXB02attZcFsSRHrgv9rmD9girtFFOoj2CNRhTCvUXE3SQjDw
	 6PG9rEbp1Xi00nuuXm3LIkqiYcc/M+/thiLa4uHtf4AROOZfxolxYFTS+HUBnT/RQLOsh
	 4HYPwqXxc0w6BFwptpboCf84zD0UP8Lv2iW9TpJ26yltJPH1F2UdaalX4+820q2SVwb66
	 TqTCEtJQ45O2YSR9Xr2jJgxnyeVy4bKZJ81jmjuHBPctSidUGoXmVlUjwAGhv344tiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TQB1AZj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896B606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D896B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TQB1AZj8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2LRAuFufXXdI03O/IrVQyJop+mpGCXTWc1Zp29sXzfTIwQZgA6Fo4627p0KQ+BNnXnDQs82Bcrfir30CSfm25U3l9Mmn/LmrC3qQaV78IGcw9XMp4oqdr+txnFGTPEyNBTWCARNWeKnMQZnAj4YV92VQqSA7q58E7oq+ZXAv0kyhTyGp6+hWFJXssDRuBDK540cqzVtF9CQ2fyewDzHe6VzlVV+0eDctoIAexdbzQ20Ce+n8mRFB0QbhhFid3JXt/DniVvjmM4dy2jHnQxXI/VK2pdwh1v9E+RVSluVH4Cawewqx8XKjiYcxPWOkrCQx/XBtL11q/9hQzlobRVNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGrxnTA0P6F3JPS6JAxjOPfYYCVXtWGKd0AABd0bJig=;
 b=n3X9ozrHs+oAv2cxCcH9Dx+aiwrEhIG/SPqIFXS43WSASR3i6Z6wNthdKf3AgMZI+q59eLS5mTR9sMsO9c8fB+aAe15q0yGnt69n84oLALjrl7Uz4Fe0dwAYUaAPGVtaj8WYIFd3wb6DxzWbmywS/Tjvzu5UO9lNlq+X4AFiwEY9fxczFMJSF4QGjJbZf7AirsMq805b6axu9WML9k93ErNCk6RJgCdyYJdZkFKCiSN1LDQJ/159I55f7/j7t1ZY6l6zChVs8npN2vhwO0k/F+e0ZQyY9P5m65jYhvfIjoo9FdEQ15CZ3pBdksdZCSDRgxDm+oH9CDf1/jlJE2V0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGrxnTA0P6F3JPS6JAxjOPfYYCVXtWGKd0AABd0bJig=;
 b=TQB1AZj8iOFTlAGnv8vs9SPuQJmJRVpzgZZKqa6w7t+gCYFc056YGf7bdy644xPPJ0W6oAiGy7DmaakHrlJgm0DBezuP+WdKLQVNm8RpFxhZMWB9DIo0uMY6ITxj3agRu+vGBYYFms6QrJWXzLl2fbaUqMh5sWecmLQeMjaHFUU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB118402.jpnprd01.prod.outlook.com (2603:1096:604:510::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 05:24:27 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:24 +0000
Message-ID: <87tslpmf7c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/20] ASoC: soc-component: add snd_soc_component_to_card()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:24 +0000
X-ClientProxiedBy: OS3P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1a4::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB118402:EE_
X-MS-Office365-Filtering-Correlation-Id: e15d4d61-9902-4ba7-a565-08df3eeae1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|23010399003|38350700014|10067099003|11063799006|56012099006|261021121427099003|261026121527099003|261102123227099003|261102130727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XlMACyrzR/bAi/rs30ujf3Cb++oe9mckv7jri+JLlDHgYfROGttfbvDBA8pxOqmjmF8cY5Cd707gPDe7nicscPjv+ZxGYb2g8P+zyj4re0jrID5/cbneTJE8fFsJmGIbMSFtkWYyaACmydHBxLkD8yfftXiaIKJ9MLOxsc+3onVyUxFMp3e1Df1Ahm/ts9tyPg01N6fLx/gGFtheTN+O6Y3X0NJ5I3LOcdfeOYce+p8SmemcOOtRDwITsEhxvA/+txs+SGTUw0ZXFxXtRu15/KzX3gDxEDjprNhPz5olt9SghEfePTJTwd90ChH0ao2vXb9HW9thaoP4BMYCe5NrdsBaiAN5WiYQSfLgTdyqzWr7ZJgpvUsOrIanb0dieaEnJYMYWJfJzMXzTzf991zLKMIcVTQ9DSEsRfS02fypEYT+ROlIFKRwqTk+/t3yk3HWIRtVrOSOI5q5SxxFJC0KRI+VHFOkMeBlc1RqJnp5UBCxg/HO1ABjZ2ZneB2xqZ9Xhbn7FynTdPbDEWSVxEskV+khta4jzJmczORMe7LcSU/O5CQf21l3fcxNzXRDSmtGmg1+WK9Grn/AN5P5vkT4vQ8jcxYWMj00LGdBiCVHuOF2VbWUPA9fcgzcfO5eHtO21RwcQLc3jhHHGifpSOz/QYc3bw7KDbadbYpXxuSt71Vf2pXzyNduyeBp+X7al5zR0C+gM5sJEEjCw7cifKCpjXpOkBWrZzNWeSqTR/GRvBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(23010399003)(38350700014)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(261102130727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OfC0B3nWDtVmwYcLEpoR9aVDjmItfCyWh2P0EW0HYYEZ4cog088WgwStVm9f?=
 =?us-ascii?Q?oGMA8mXdIwuEhUNmcBkI49RqSxSWdZtem+nm9Du45QuiEdP2ou1kXbMlVjJn?=
 =?us-ascii?Q?OqHFiay4/37tEWFRSmjhe+N1bTDCIboWrLb17UdVAEtFFp13j+2kvkuXVvHy?=
 =?us-ascii?Q?x1U4sKWqoNf2Kp8/oCcgv5b2xvmHEAaNmaF3r4uLMF9BniHCtu0ko1qKsUSD?=
 =?us-ascii?Q?BIR42PDXc+HqXdSzI+cuRMspx+QqwIDPxIQfyO4aXKIsa5O6jGKJu+Dkb8Ql?=
 =?us-ascii?Q?DrZMwZJK5BPEj/U4fl0qm2h+3luK2tUQWqv7nOrkSi1cej1qk5lqvXHP8MuP?=
 =?us-ascii?Q?48J/C21O4dheV5ypYDB3teojs4V1W/Kx/AdoPDvpAc36XpS0vCNlkgHdwaik?=
 =?us-ascii?Q?LEaxqcXS90Ih4lA758yQBJT7Chs13xkANUw6dOkfonxSWArsJYuk7V/FMJ8b?=
 =?us-ascii?Q?lrjq8gE4bqTvnVAEM/V61PLVX7D7K8Fa8rBZdlydbVFIpBrueHENyfZA2hhI?=
 =?us-ascii?Q?xNNUZnqgJFFenoHMZY+6/th+bzJpcQ52b8DO/YZjcL5JF1vXV6On738onuul?=
 =?us-ascii?Q?pm7zduBg2GdZ954a+vAJnIzWNphLDobSAEHlUVQauEUkoDXZ51D2f2vLsP1w?=
 =?us-ascii?Q?N079p+jh+obzPvYuxICFbyYGnHXTmSCLBV5y7/ztAmfHpkVN+sopQDVhRAOd?=
 =?us-ascii?Q?zvzWh6Ok0CqFmtRsS2tysVVG5wRL73FxOLxL6pLBvQs1OkneKagcA634xZ9P?=
 =?us-ascii?Q?rk2WdPG4zhP9rO1OwfoTWLsxPwVJ7wzbnk4Gr15M+iCjvAk8RqPsdYBp1/AP?=
 =?us-ascii?Q?rJPFHMvn1qFi2XncViG4Bs1EyALJ79sOh49BQBaGyGpcXE89K1/GaAKp+cPI?=
 =?us-ascii?Q?hrpFf50iSOMaLebqnbBFA+DvAw8d3Ac+dKup9VIQNsl/d57YcP7kmgleaeWO?=
 =?us-ascii?Q?I+hpoXMj9vgQxNgGRz4x8SGiTErihiFepEcSg1rJm3l8Ix0jh8gqEo0RxVnb?=
 =?us-ascii?Q?sjGsHzxAcl5GCpci0mrK04VWLKQsfgr6WvFI7pVMqlk1qMtUeBKpFhnpXD1n?=
 =?us-ascii?Q?lwvYj6q697q8ECt4K8DC6SQOn2uIxyi32GlYsUPdUast7U2wzJp4++dXf3Z2?=
 =?us-ascii?Q?ub4OHfbUT7e6ae5ZuagBkcc4aOGPH85tnuBxqCvXxhSeFhwZ0LIYOuPiSo3t?=
 =?us-ascii?Q?NGIGg79RWl1/+YU/MiikVSXHyngsqgUuuRM5XMPiPGrN1xkZROWDvxh7qC+4?=
 =?us-ascii?Q?I4z5QEBYRxkh6Lrsk/sjpDYzs88F9Q+9hGrkQCYd1EomwXfjaonO1m1hwXhy?=
 =?us-ascii?Q?sYE1Tq0FhxtGbgTvL3P+4KDmb2BmNT4S6x80pjzIBNXrRpI7kvO3PiU7Egtt?=
 =?us-ascii?Q?xpJeQ7WrYgHqceH8E97U4lX/X0/DmnEKIWUI4dMMrCni4A6mW2Mh25vSOQNQ?=
 =?us-ascii?Q?O02kq7UJJAxQO34RISW1HvynLkAoqYRKaAM9KeLqoXBYjVQQyxJFUmGs0gsu?=
 =?us-ascii?Q?9ssZavK9TsXCQzGvJv4va5BOmrxjJ9xjXZszFoS4R8AJ/XsRrHdZOZHGT4iD?=
 =?us-ascii?Q?jNzKvi6clW/4kGrbx10h6pnyKX60B67y/vrr0knWTR6RL7T8IYMBLuK7tbtg?=
 =?us-ascii?Q?3zL+0RFlzNjNgaalgH4FlEtX8ambfbQWxZDmwh7tHU4W44uDecu85IdTq7iz?=
 =?us-ascii?Q?DQdKHIscyGXFyQ+F88lupJ+aQNEVrsqNR8XUi5cGRHzc5UAVr4ET9XmP/G4r?=
 =?us-ascii?Q?Op50GHIhw3SEkJ1IYTlmg9gf5jAOe5yLiuXO0n9PvyOPW5AZv+cr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15d4d61-9902-4ba7-a565-08df3eeae1ca
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:24.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o1k2C50b47D2ug+9P/KOx/vkUfb0oe8mPdsrt0CazDefkxphsJ3cQnu79EWMI+o0GG9ng5aMLFy6aegTzZcW/sfmISHoxmA7+K4GaecndzEULS1HYnSxQcBsgnykjZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB118402

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_card() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 23a41fbe55abc..64aca0083c98e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -276,6 +276,7 @@ struct device *snd_soc_component_to_dev(struct snd_soc_component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
 int snd_soc_component_register(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e42e5152a9f93..bf7c0fcbbb8ce 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -80,6 +80,12 @@ snd_soc_component_to_driver(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
 
+struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *component)
+{
+	return component->card;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
-- 
2.53.0

