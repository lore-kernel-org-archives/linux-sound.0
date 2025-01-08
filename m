Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA80259490
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 03:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305558; cv=fail; b=JZbvsWdi4AcHzzVsmm4yTIbESYW7vltMJfnP2iiRBS/rRE58CJKzWCW0x6qAI6wG1D3ZSPyBeuCeCBDTSJ1vvS6i+iqAvHO0vR8eNnAIjVVROhe4xsMvI4xVDtiTbIVw9Wf2UVN1M4/OXUX5aK1/ArOk14Kpq18fuK+I5wBiChc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305558; c=relaxed/simple;
	bh=Xlx8gJSh9jeikJbGPC4OVgPn04x/GbDgkhvDLgX1BNw=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=F03k6fwXxzdLbQC1bRsDV4IJDzmnF98cMSuHsG8dIVX9nUYbJU55blHfxL5V0CNRj7QlyDDbRth0B0RGswj+DEMxYFblDVlfO0RMwXBoi5z+ChTFIcDBatHeX6ipScGOxNlA2so1PU9VRwi0CeUZEFLly59uCeLt+fBOYMFypj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I2mEbLXl; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I2mEbLXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPC/RLlIa5uOkguIM5VnTpgJK8wIA0T8Lw5CdAkTmBTrBV6sdKK6nTjBkTAVq/p9nXjfql3O+r4H0AgVDoaGI+ScDrawBzmXbu3HwkIL0Sn/uPIrlcVIdckF7WedXt3g/MNx+fwXUld8+GJHlUxZyXOuYTmy5jubvDaXurKWYJdacW9uEIt0Rgo7UHT3eJv0TepGvNuPXkHvH9EpbBmGgCf7DPAAe9qHaAlEPsgMagDUN9Q9fOmCRSUcwkGZ4Om++JRByK/k+JkaFyHFFIxMdscl1OHo6VAZwKH2trpqC2TR2O3KHfXuU97KVeKVRz6MkBn2E2KFKutc8iXiMwZ1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bS+3cLwRzcNYLf6cNgw7/UT0VFxvQB1VPSO39j7tibg=;
 b=bX5uG6JCpFqlEqFq9IRKBS322msuzLuhZ+u9HYL+VcK9DOxoTuQAJwk928SjWHnzNMxWx/RP/Y49pi+3qOWomr4RqkAf+2NxVOtIBlQvwy3o7NyGSjb4yK72R2fuYhUm5U8iLPjfMQuLzmjPfi4rVR9RqI1peF6VsX2i1yiShd45D+pd4nDPUdAi37Xu78RLYcGI9l6CnuhUnFPUv91VKiIRqary3QcfHs8bXwY9aHjQh76T1l/j3ujHGtT39vqWKEQfzabPiR4wXg5/Q4mOzDCRRL3OtOXc5W1SYoqA31kLDd1kUX7rvkwOlanrELyPtB2DyWSPQeXTT6PKRa+4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS+3cLwRzcNYLf6cNgw7/UT0VFxvQB1VPSO39j7tibg=;
 b=I2mEbLXlgMluSOaQqSxbK+pNHBCVOQ4dsP9gdhyjGZLp/0bzEhdQQ78v9tLP3nKcrLslg1D4alJZj84LG+QAA5xKwjGr9hiQZM62wLqqWc1d7/Q6eboPRjZLBWNjHEIRRO6ht29a0dYGSU49/R1U9QBghTLk7OEZs4DKHJDH+sQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS7PR01MB11882.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 03:05:52 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 03:05:52 +0000
Message-ID: <87msg2knsg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-card: remove card check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jan 2025 03:05:52 +0000
X-ClientProxiedBy: TYAPR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:15::35) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS7PR01MB11882:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e7dbe7-af51-451d-c637-08dd2f915c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTutSgoIvWewJwlIccg8Pg1dDJE+6xeXBX8Juv+BPFjdKdQJ0N9sTS3/nU1X?=
 =?us-ascii?Q?llrJZ7YVvf5Z11kb0YAd05Y+PbRU6ug7xzqhyTMG3dKm1tkbhNRBrKsTccus?=
 =?us-ascii?Q?D+XwW7h4a1HwZKiGEf88WktcrBN+Z1bi8oyIMzaF5oBAA6NHN9oOvz1juLG5?=
 =?us-ascii?Q?yseuO2+HneWbIYPwbe/KwgIlmb7Qufr6po+d61zCOpoYPLhE2r5JFwpBYdBL?=
 =?us-ascii?Q?eMPYrzCSdVUGw/km/DAAE08PPoUyqXmc+fgSBEXBHSI/SEaA1exj3OAMQ+Si?=
 =?us-ascii?Q?OABcPLAzbyH9pdJKowV3WKyEB0ha1exvshvWXA2QxC48aiYdg5zpPj34Cfd3?=
 =?us-ascii?Q?ufYG8L9nXiFEmCA+wtICtcCxM9EJA1CHOh4HIzsTypPNieFWrXQQHXOXeDVX?=
 =?us-ascii?Q?XeetXIRT54y7sxdRd0qLThjc8LdMUdrrPQStgHHE+TZA4TDdyIGSXXOh9MRt?=
 =?us-ascii?Q?o7LFgtXbRLXSPTslV9wokIzBUJ98AyI36JREOu6uNk9QJROCeda2HPBRYRhy?=
 =?us-ascii?Q?kO/zZaTr/SFMh3wyIZUAv/a+gQTvyZcuQ0P3Kccq+/X+cl1Q/Hzth4KRwAxj?=
 =?us-ascii?Q?c54mZMp//TZ82MSi+LP/HdkUcAQ0tsfQKGuau/sxrUI1VMwTX+OlDV3c6ovE?=
 =?us-ascii?Q?QzGEpfpTQd+mIdzI8katr6rtvMab0+Qn15kefdYl1AIoJKqdzX9VM34JEcWa?=
 =?us-ascii?Q?wO4ItDnK4+pP3LYrTsVXiFHfLvCgIgsQQOZwU4lqrfrlNjcw22l+DtzM8ICO?=
 =?us-ascii?Q?qUE3kpMjqaugcMcjf5hspk2sAha9SH6Smns7/bgimGHPY9Ql+B7DEdfK4yN5?=
 =?us-ascii?Q?aXVPvy39Y+8Ts+rVJD3A9onB2KdFb5lhK8Ic6pJ97zgc27+6qYgagXjvHGNI?=
 =?us-ascii?Q?zYrBt7emEXaGswPNEr+XSbnm36dw/s3BHf12BCPolE2tuPW/vNxBx0TR5MFx?=
 =?us-ascii?Q?aHdiIpkqjogVQox/xbG611weVTr0wXg69SMG6zEHnk1j4XHfW03otCJhr1zP?=
 =?us-ascii?Q?RBr9uG2ukYliswq2f7eD7UYO9iO7aanpMuKuo5eFHKmOaawLIDpWpWBL8i/I?=
 =?us-ascii?Q?Ix6AgXREiYDwf6xaVJfXGRIYs8qHxuCI+ku5BOW8aGxoSFOG8Egbldk0UUJU?=
 =?us-ascii?Q?SgZfrFSVbjHzc9wXRxYO+QvhXcv8NWwnurRgCYo93CMjeR24mtZ1AaJ8E6lE?=
 =?us-ascii?Q?NbuJ/eGbuZstM/3GLjhXeROeFZtj/Uw00DXV42L3is3jnwS+EfGe1tQMrtjT?=
 =?us-ascii?Q?NcHGYR7k+gKxd6U18v3P//SMFrl9140nbuHvWIP1Nzl3YJV0mPqwQrWS4YjX?=
 =?us-ascii?Q?AXFZL9O0XJKnTH4OagPMwvK1DGr/0wysG524Fznl1YnpzgDuTXGG/npaEiIk?=
 =?us-ascii?Q?ODZBAdQJih01KqY/ATRIMGPDZb9cCIfL+d31x+9n+3TO22wTTNAMERtdejkD?=
 =?us-ascii?Q?Zu3k6BVLEBbtMGtVCr8Kgk5ET5PkrtUN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X12edGLe+QhL6PxWyEKCi1G7UxNNGTo91r/GYeOYu5yvLXX15qV+ikvOp+bH?=
 =?us-ascii?Q?vHslTpW78MF7yEKRBtR/+ne6HoFeeHXmWB9pDqANzt9ftZikgaTQjqHlKdss?=
 =?us-ascii?Q?sBl5HbBbkzwaOKHEYt1htsZb6TUwnfiYnY+ebii4Qm3aLXQXrwvbMeRLMo35?=
 =?us-ascii?Q?zLfjfV7li/9Z3yVvNXsI3JAyNNx+09Bt3K153q+DUkxUGLcPap2NCm33f432?=
 =?us-ascii?Q?tbHj5mQqpU2mtn8wScRAnhkuWHuP+3Ma9Kp/YEobtYBP2R0olJqp1ueDwFns?=
 =?us-ascii?Q?HbJXNIFNdmORjQNXXiQ5elbSEtV1UEaNA2B2NedVkG25yP/NEQYqjZ8yO1dd?=
 =?us-ascii?Q?0OxDC4E3Tlmdbmto/w2kCp0C0uChk/1egPGVKCLr2q1NFB8lEIgoNadqKOpH?=
 =?us-ascii?Q?IjtCVAt7leAEZdPslpNj+6LH3ylMunOtsbtfDb0eskSpaN8ss4K26fsd4Nt/?=
 =?us-ascii?Q?cDHg5aO/8GFdp/4iq0VZHNyM7CNZtBEMtDSDxrEEzHoJVRLzALjCZESb1Gg/?=
 =?us-ascii?Q?QIHFl/IoGxDecnjoEr+dMkSPHDZZUEurYVjJqaQ3lywH1bkmGvZxxpznOGu+?=
 =?us-ascii?Q?48XW4eGnnO4+WmBuOuZnqQGUYVC0OQct07wPezkmx8iAISlX+lmNy/JMnAMd?=
 =?us-ascii?Q?vycM9pGhis6QIx4uQjvtUhcH8FQiK1YCD+spAR4zaEf9zDsafrdVtfJ/XgE8?=
 =?us-ascii?Q?+Cf2/SF+U4dLmAsJ3gZx66LgmNEolA+nQJ+H8n62uQ44hzEW1kAvDXBoVZii?=
 =?us-ascii?Q?BrzluJIXTENECwhkXUE7PJoXRNzVVmp7a7KRkLJKIac/z6jPlYot3dOTM1KW?=
 =?us-ascii?Q?NmQBBI6C7oZkkzLyDQbH8SbUw/YAQWYEDu7V53MpI5Okd8pTXSByxA6AAZex?=
 =?us-ascii?Q?XJB8xoFEp7Kq9iu4mLERfDpvzQUF5nq0YYboqKsSwchRCl/huHzmM5ZErdpI?=
 =?us-ascii?Q?3kzehxhhMZWbu8baaHT6ziKl5+/YHZudSx9VWPzNkjut3zUKLHHaUAXsoh1J?=
 =?us-ascii?Q?VqiF19coe9ktGjDz141Kg2DnIYX1q6F1IvIAZuS9xOKmdhy8YYiekXFgOe+r?=
 =?us-ascii?Q?YnTq4MO/wO+MCUhr73qRqgzLYtRz2rNT68v6X9lHilqAxsgKoCBy16+QouNn?=
 =?us-ascii?Q?NY4OKUbtjjcj+MsdYb+YVRBYfIsW8fJF/TcBBdEJP4ns6pF0TO4kbW7RbPVi?=
 =?us-ascii?Q?Y+nhsfvAIsR2g5T7+OopGCs5LFXz9XVlpQi+xDmYYzh0hRwmDD8Ygu33ttWG?=
 =?us-ascii?Q?F7vLV6TKpM6niGUI3Fz3HwmE5IednsUWuhJfmD9x0smvodIrDvWeFWeYOTgM?=
 =?us-ascii?Q?ZFiu6W66H2BpA6hSi29IMfpxD59lxHZ6RmPtXaTl0f5BDFlaHcW4qcABRBmB?=
 =?us-ascii?Q?C2rk9gw1214qyi2JYzKdetBT1h5uYGXcjrfqdueaLWCOaSt6aAtYtBQ6WrBy?=
 =?us-ascii?Q?rdhypbc1pV0kXw/edtMQqzyEFriwpgFWeitHodFQnkrrKaFPQmNeGAHuWvva?=
 =?us-ascii?Q?k0S7Ypka4yobbbLzlkafg296APVDvNTICWOREWIw1oZy2hoYmkuWV3dhvDdw?=
 =?us-ascii?Q?Syj8Q0KM2M+cM/yISxXnLQy+kNXyYVJUwY+RHM6Vqp8TwNYu7/lbfc/LeA5Y?=
 =?us-ascii?Q?Gr8BiGFERHY54/M3/z+3eWE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e7dbe7-af51-451d-c637-08dd2f915c40
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 03:05:52.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzXugMO2OeBNzBCq2iIZlPQ4i0QT7cWEBniiMIxtmpKvmYfInNWKzNXGn5aYnUkajbVLqIezszZiR6fJ97/ojiV8O3Hkr+086J0fSMiAcIhpERGhNcIXLlW47BgJzJ20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11882

only snd_soc_card_set_bias_level() and snd_soc_card_set_bias_level_post()
are checking "card" in the function, like below

	int snd_soc_card_set_bias_level(...)
	{
		...
=>		if (card && card->xxx)
			ret = card->xxxx(...);
		...
	}

But it should already have been an error if "card" was NULL.
remove "card" NULL check here. Otherwise it will get waring on
smatch without this patch. This is prepare for error check cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- rebase to latest asoc/for-6.14

 sound/soc/soc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 8e9546fe74281..e6eb71b3010a8 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -219,7 +219,7 @@ int snd_soc_card_set_bias_level(struct snd_soc_card *card,
 {
 	int ret = 0;
 
-	if (card && card->set_bias_level)
+	if (card->set_bias_level)
 		ret = card->set_bias_level(card, dapm, level);
 
 	return soc_card_ret(card, ret);
@@ -231,7 +231,7 @@ int snd_soc_card_set_bias_level_post(struct snd_soc_card *card,
 {
 	int ret = 0;
 
-	if (card && card->set_bias_level_post)
+	if (card->set_bias_level_post)
 		ret = card->set_bias_level_post(card, dapm, level);
 
 	return soc_card_ret(card, ret);
-- 
2.43.0

