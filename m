Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9D30AD0D
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416054; cv=fail; b=sR4fnlb47dB1FbIHXbeZqsr1SDE0OZNjw0M5KuDMh4Px9NveUmxvLys65I6B2RtWRijE8AJQ9DpE0XSfzhc90EVED/gcjZgB5tDsPnEVCQjmVtXk4P12muprQtjekPGJf9olAg9q4qubVn7qyZwYYOk7h4ltSOZIjch+TosM4Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416054; c=relaxed/simple;
	bh=uRKna7cMApKOzaTvy0V06KxsvfuGCk+vlCf5jlRctQg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nc+kJOLbKqsr127oHjfNGpSHOh0N3qJ3WbW80mQ2zDEgHSNq3g+lk6NFaLkNe1FjjquGEz9OwWkMwTr9RbKy4rum4zuIeFUuU+IyAI0feLOf3lqLu50K2/2L5QV+qyqKLqV92rUT5GP1gjvdIZvnik5TNCxOroXBz2TFuF0pE6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ItupB/m6; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ItupB/m6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9F6L7/y+ZeYs+4rz5OPiWYNJ2nPCTBCAqT9Ng0wtuz46QIK5CwNPdSGO5ir3YIBifHYzYresbIXJyZ2qvz0kVpv7njUn8xAUK7RMZF8YkNQvN6TL3mZHMZmnwUgzXHSuRSAgb9dVMcwqNf86FEocggfqQtLyhpw9t4Y7GFGokMSpfB719fhFIdUdw7UW5WbsMDK63DBoTJWgOgFiApZwwaNVxTZqE+yl+JyUUtrb5bsFWEpb06KXnQoIN7qOdXxWeUWtDY8g6idGdY2yu5/T2N0+q/MJMqijoZLOCaBzKx2B6uK0o2oZvWlWnt4eqecSzSS09OgV5A2NceUUNAIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWmUYrEiKdkHXryiK7CdnzQcOhlL7ntAM1h1YeCzOa4=;
 b=ebTNFpcJNXHnqzJg/HXp+Ogqtat/87IKnJmDzNHT7mUljVRu4HJSi8Qaa5OIyrRwupyQFKRzA7isGBetTuF6VyKZjEKgsknzhqNz2LH8LOWrW3GS6b6ZTknCqxAV4xEMrqtkgPtx5AkLvggbq5+boIAaJ2DyBP1Wk09D6gBHT0dYNsEzHBx1gnqgNTHlG6tsMgICWSszbXuTG39F8l1R++ClZu3fRjXaUpvdtkq1oeTlWDZ+Ob1CuKBB5fsXX0aggB5a3Aawlva1gbyMSWkFI5jIdEbSMW8rVgaq5rDveAepy5pT5bFMoMn0wEkpJl8kVHH3iro4Wykm+A+zjY30uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWmUYrEiKdkHXryiK7CdnzQcOhlL7ntAM1h1YeCzOa4=;
 b=ItupB/m6TmiWTXir7p4ltp2n2t43oa/vwQw0mUh6OLOOSTlnIC5rGnNOyoTMAW6vVELwgVG5G2e+Xmi2hYrC9sLCTkFBCuKYGT9V1nZOP9NMuZDboP944TDWtcujDnvpq1v2TgiYgTcRFxvkgk+09jUQuvmqZcv2rcOCPi1lL+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:30 +0000
Message-ID: <87plaqm7ke.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 129/139] ASoC: mediatek: common: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:29 +0000
X-ClientProxiedBy: TYCPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0413e7-6d9c-4b47-678c-08de0ad9fccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8sf935tkqa9Ct3t2SafUKlAjG0maJW9LzycHh1qgzmYOdi29yUvqjjWz6oYO?=
 =?us-ascii?Q?7o77lsdReounTwiHTOqFOplZuXtpgyuCOVIKBeFlANoDMUDjvys2+s4pYm+8?=
 =?us-ascii?Q?SSo9/yP0HcMkm8DgmeA8r8Teu35FHpA2Ex2j27kLmCojDdOCpLh0uF0bv1CB?=
 =?us-ascii?Q?9kQK0MiG8NkHmUZiLPd7lJyQmky85/63TNuFe/RMQ+3wcwu3uIDGQl7IBna6?=
 =?us-ascii?Q?rRw9HW+Euf6Dg0w/FQpS2AFWOGhkqSTVYzvcjxnxH6EX10pN7pWjQVt6YZS9?=
 =?us-ascii?Q?TMuXfeeJYpdci7WbwVkzRPLNWsJCTRe+SGiEMmOMMlf83nUsN/LRuMLJZVHF?=
 =?us-ascii?Q?jQp5+XG7PF97fW/2lzkcs0MkgNPu1TDIh5tR99lU2DZ1691D0tChxVqNVyiK?=
 =?us-ascii?Q?l4DN/+e5YJVBZaRGy3b7fWmLNwB8MPTs4HVFPTiXgijIfxQ8TjvHXn/kEcIj?=
 =?us-ascii?Q?Kg4EUgKSEh8jQZKRAbxfBGq6rWnLidJps9D9eGSBiZYEPD20XtDJFgEJpGYn?=
 =?us-ascii?Q?gh4+rO40fo4fTIwDmXnPfhdb85n9UuAO+dXGAlqAc8K6pBPRISs1Vq7PyBMi?=
 =?us-ascii?Q?CNrs763x4R3bvSOsTSvbLlF3jNWNmZPwluxwi2HAnH1+W73H8U47RoixPpX6?=
 =?us-ascii?Q?U9NNOuKfJ1SX5UEoXyAPiqkH1ZTCBpXnf76lXQ6hIDRsc/tPmyUo7l5/+j9R?=
 =?us-ascii?Q?5CKqrMxdnXHUZdZ2uYnOcvygiVZ/HF6ogfb5eO1Ogr75YfWIT350ajecxlYM?=
 =?us-ascii?Q?oMwb4hda3OTaXliZMrUSWYtV1//h34b2Oc9DSQk+N3tOujtHAZKpYHq2Q+MY?=
 =?us-ascii?Q?cLjwj4LGE2mA3ONz9xTj22I/9zP1JMc2mrdYE7Tfi8rJVZ3xACEttJgs72o2?=
 =?us-ascii?Q?asr4Ie7K/WSqDD036WKdEgi8B5Ms3m22Lekgki8nYtkpuY/Bw9zkE3IeItqI?=
 =?us-ascii?Q?ObpF+bADOUKM3/NMhff7/eAHoFhCwNvkLJHGFJXZF6J4b+QasZpdbgzdMmiQ?=
 =?us-ascii?Q?98yDT96/lDsITQvGYBgEkj3Vykemeole+FXtoGfGP7O1cWtNIMp20MduGYx0?=
 =?us-ascii?Q?ZcwKAhoxe0//o8s93zWJH2Bn19zGLUwwLHKarGsVlCVG0b2ozJfS1yUYYU6k?=
 =?us-ascii?Q?wtF3/6hXgWnILpu1/etMgMpKTFKrng4g9SXaABX6VbLJb/FC0tbPbCm6HBXi?=
 =?us-ascii?Q?I70o+0FDxnVdSvDI1Qo//+OtpHylOA19t2uMp/lU40o+GcCH9zh2ObSWXZfr?=
 =?us-ascii?Q?+lNyPup8tb/sdboJpL3uIRxkKPM/kiItjpf/6T/u6yrFKoOrgFEiXgC34vFJ?=
 =?us-ascii?Q?8m+XlUeb9Rnr1PbKWXj0JBunBJg3U18Q2hoFzpebZqOoJGamXl2I0fwIEBbr?=
 =?us-ascii?Q?C//riYtY2iQyKL+23RxyE65WXrEfIDVe28+S6iGitjEMgG5kj3NAwDJuXhTZ?=
 =?us-ascii?Q?aFJJ3TUcRGKd5BNjOAESi3q59paNnJ9x25n6vr93UdMMR7iizUUjgGG/kfp6?=
 =?us-ascii?Q?S/Sg0BifOIc6QAuTh+bbtFQsbMOvW7H59bdj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?05nMCzKOW6eR7gSzTEWfi99wsh9dIm5NvVYXdyd5S4+77aYs1Hge4kqXJrUg?=
 =?us-ascii?Q?k6R3Qho8mSOoqNxjk6aw62kOQgd7N1k7ysZOCy91fdNL4OrfDo+xuWgdAF+Y?=
 =?us-ascii?Q?JC1CtX6+OvyyNKnkSs59nNkhm0o3IZ1gg7tTqoW89IcnOqNv4g7u2IdqP3eM?=
 =?us-ascii?Q?EPozlKAhuc2so6DORqjtyHccqlmxDjQHN8CLVuCMuM5w7CWECweA1ShWV3f1?=
 =?us-ascii?Q?lTOj++gfcJqoRDCFPY/KDfPTFMujmAZ62iQlmN0nZL6w5ToOfXbk+40Aom2/?=
 =?us-ascii?Q?N+/4rzVGuRD54T+B9T5rDGcH6stNxy/whdx3+GC3IeYRKZAqLjMm3fmaoD4X?=
 =?us-ascii?Q?aQrkWwGpOMhwastrxBYL1E6AFu6ApnIISVRH6uFG+7U2X4kX/FfokxWl6oGb?=
 =?us-ascii?Q?EolHZ74LBHPtUqngWIxz96mbhyqzd79VlHSS1lNfDiWm2e/DWm5OQfGNBS0+?=
 =?us-ascii?Q?Xm/qp/qW0d4wXeFvZmCEWQUEShX18+Fp15iqgjnJQpIFzDVmG16jdEWVLoSW?=
 =?us-ascii?Q?hLM6lC0jcOgHhYmY0Kz6fTrqax6L4tfROI19O7vIBEbrNm0Zy2u6U66OQ556?=
 =?us-ascii?Q?5geMcV3YP5jYMLHhf6b+xixmY3e5yweiVWuzF1XH04T6QXHWoaOaHU7bvTRr?=
 =?us-ascii?Q?3XTgNOLe/t3MEcC4FHvdhjRdHzXle9C2ju03Ku5uQ2dNJU+cO5DlKrkujr3q?=
 =?us-ascii?Q?qUdipQ7Kf4G1TP4YRYqrIDyg4RIIqtp5ERZplwAHrY7aV3kyxHgLcNskSeMD?=
 =?us-ascii?Q?tmMMHizk76IrqG5H8Rn+0kdw2VB7334UO+3sLdNEbuD0/mRC5LvY37vL+CIp?=
 =?us-ascii?Q?vC6IW1mvTdBFQ9q6pA3iBN2dUhBq39saFebPDsEJNrN/Y2ZzSC8hHV7MMU0v?=
 =?us-ascii?Q?y7d2WMTcbSO+RGvdFgvaU+NpQFgsh5smFTAfUerLSvq0tu6b4oui+CMfNB9c?=
 =?us-ascii?Q?RPnfoOPgGne76mRNN3jv887k/Crp2C+WamOaw5BzsSZII50trldD4ev5VdO1?=
 =?us-ascii?Q?AeZKls8VDH4vRhTH83w4l/u7Tg8vgU3X/F8XiZ7kIa+BAAjV6yeyLVWtkDih?=
 =?us-ascii?Q?WC61a6JlmYXmx3ag96uzubxlMjkTDuxn7NCJfzTVlTpfB0FJJeaBLojyp895?=
 =?us-ascii?Q?BIDVPWsbgdxeocc/57hisc/2AIbDOeD+5BKKPxoU41ImHS1hpTI7HVIEhZFO?=
 =?us-ascii?Q?NkmxwRglaCehx/k6FMEkfPvAReHJBDz2eIKOSmCz5Dp9Y0HeiAGKue2mJt0K?=
 =?us-ascii?Q?2Ct0jK8mMHB0EDRYS+chIt6pO/6ZeuHrj9DTrhJD/XH9L2nIkG+uxJ9mDve+?=
 =?us-ascii?Q?jRXxGw1iaL8A6nIjuV4UEkJvef6qcXeTsM5j9gYTWlqzs7plF4glwXZ/YZqw?=
 =?us-ascii?Q?zE1K1+WzqRS0G+z/mHIy57jsSRsz0qQBEAOdoQNqSYIXwYF+c/gK7CYwisBo?=
 =?us-ascii?Q?Gb3RE5cuGLnhHPk2BS5bybqHLDdhg17EGB3sUigRQ86QucJ3jnr5DmhDqBvy?=
 =?us-ascii?Q?4v+Dxnk1w/nS70bJ0qa/dgSxamLqbengwW+meXuiCZxCGs+UqUc3oAXOxgM1?=
 =?us-ascii?Q?vyLycpMoNSvEJlFh4Fn+kwk/0+QMNLOIV+4/PcHL5Z3pz3jXP8FAYMN71mJL?=
 =?us-ascii?Q?5eoD+8MRUz+GTJFjKZCglXw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0413e7-6d9c-4b47-678c-08de0ad9fccc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:29.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7z6TZSGS3q/MMf+KPRziWkiepnHdfU02hWPTF10AVWXyht3Q88FRNqX2lB1UiPMk6ba/Y7A7lUnDNvmhCpwh0MtvIbhR8MJEnQ2ATWzmSwnT7luT+FJv6hVgHwpHtJo
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
 sound/soc/mediatek/common/mtk-btcvsd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index d07f288f9752c..5e7e85b4c98a1 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1046,7 +1046,7 @@ static const struct soc_enum btcvsd_enum[] = {
 static int btcvsd_band_get(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.integer.value[0] = bt->band;
@@ -1056,7 +1056,7 @@ static int btcvsd_band_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_band_set(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 
@@ -1071,7 +1071,7 @@ static int btcvsd_band_set(struct snd_kcontrol *kcontrol,
 static int btcvsd_loopback_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 	bool lpbk_en = bt->tx->state == BT_SCO_STATE_LOOPBACK;
 
@@ -1082,7 +1082,7 @@ static int btcvsd_loopback_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_loopback_set(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (ucontrol->value.integer.value[0]) {
@@ -1098,7 +1098,7 @@ static int btcvsd_loopback_set(struct snd_kcontrol *kcontrol,
 static int btcvsd_tx_mute_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (!bt->tx) {
@@ -1113,7 +1113,7 @@ static int btcvsd_tx_mute_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_tx_mute_set(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (!bt->tx)
@@ -1126,7 +1126,7 @@ static int btcvsd_tx_mute_set(struct snd_kcontrol *kcontrol,
 static int btcvsd_rx_irq_received_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (!bt->rx)
@@ -1139,7 +1139,7 @@ static int btcvsd_rx_irq_received_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_rx_timeout_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (!bt->rx)
@@ -1153,7 +1153,7 @@ static int btcvsd_rx_timeout_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_rx_timestamp_get(struct snd_kcontrol *kcontrol,
 				   unsigned int __user *data, unsigned int size)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 	struct mtk_btcvsd_snd_time_buffer_info time_buffer_info_rx;
@@ -1180,7 +1180,7 @@ static int btcvsd_rx_timestamp_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_tx_irq_received_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	if (!bt->tx)
@@ -1193,7 +1193,7 @@ static int btcvsd_tx_irq_received_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_tx_timeout_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 
 	ucontrol->value.integer.value[0] = bt->tx->timeout;
@@ -1203,7 +1203,7 @@ static int btcvsd_tx_timeout_get(struct snd_kcontrol *kcontrol,
 static int btcvsd_tx_timestamp_get(struct snd_kcontrol *kcontrol,
 				   unsigned int __user *data, unsigned int size)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 	struct mtk_btcvsd_snd_time_buffer_info time_buffer_info_tx;
-- 
2.43.0

