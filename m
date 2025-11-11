Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D701824A3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820293; cv=fail; b=ACwXgunk/EY4INwJ+WYMy6AehQCybcg4/UBOtHo0qsCvCGzWG0T4NVkeUESWkEBM7xus60y1ubSMWUPyQ2pt+k8UXNjuO/Af681t4zrUr63gy24vA+3PcTksO4IYvgSOeOa5d+6sHO03vJGf6ZHhIf6WF5c17HPNgevAhqBs6Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820293; c=relaxed/simple;
	bh=OW0deKYfCgm55MpBWVpQPUTjVJ3NtTlLGFwFjMHVjag=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uxGGb1Zb5b3AmnrAsoPEwdVOgTC1uzb1HH3ThDsO6by9wWwfp1/0jBu6kQYpJ8gDaL7Gc7KGeaa72c8mprIvIHYRKIq4+tKx3/61kGSSXK7P3mFSAOAsjDNebImSrP8/+UeqnkbiBXjT7/YL3g/1emetnL4DtF0ozst8I2nSD7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pXUzIhpA; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pXUzIhpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYPrFprC211oJ4rPVlG5sjeWOX85H9Xb/uCf3kcDfcTKxYddMcZQ+SbKcgzh/UuyVsPE3DPLUl4EniS6Q96WHCEW3ThPsDYk3dZL/QYIeI94Af9sqIbi3UhkeOM65oKfBO5thrAeTy3YQa5OuGzxN7pM6rQJtwuGVC2U4MeFBSVaMNj7Onk0K4buU2vItZ5LdX1P86PUZ2lMnz7i9PSfYEgdqCO6dDfZubBWKoA1KYj5eaCcZmD1CRvsFE67Yg2NSeKEDllr0lXiijvV7OIhTI4nI0DX683v550HLahAGB0GDZubW6KY5IrjmSNkR7JDdV9Ke/RwK/AiDrzXceYUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+3jlwQ82Qo3bPGyQKg0ishyRsojo6sA3MNfnkfR/ts=;
 b=hosuClS+PKFYypXGV9qyLmXahbT9IzNe5LXtdJ7eVFxqMhcJQQpsW/D0FazQM7FxtAmV9HUqClDho04/W1vBREDZYz2f+wmrLPFh6zkoBU1UVXv5IHqulWS19+YsyAFmNwu2Qf3/hGPu8W54a6cW3mYTlXaTtlsya1CJL0sbpNpDl6MZFOcXQLUl8Rxp6QEA1P/rk7XwZc4wrvNdoPqLkK3roFaw2BA3DGQGLeV9DMdwK/0+y3mtzsXkjhNdm/ZBv9ibjnKsYnpdPxeAUUR4QQcSqvfjwKYYvK5hvQRvOFFfgerNTbuyO5xQrFUXvf59FsVY64wiONjh1rSDimQGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+3jlwQ82Qo3bPGyQKg0ishyRsojo6sA3MNfnkfR/ts=;
 b=pXUzIhpADCqno4PBlTWQqT5PX6HD4NTV8l0cROjF0KYPnRfwVND3t5Q6VC/WHUkBTfmLczVTm+yf7cMTRNqx5y6hG7EtiiDsgqdvM5WcIQmkqjEG/wGS8qdnENGKdhQqLsmg/MBjG8TJ2PVmo+7GD06Xs7liuady5XxqP2iK/kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:07 +0000
Message-ID: <87wm3x8ls0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 011/292] ASoC: atmel: sam9g20_wm8731: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:07 +0000
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d8f56d-7ea0-49d7-9d95-08de20b7ca07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJJw+TWEomx0CIaZz0s80CoYhG9yZItBaJV1HtxqrS2oMKIjoM6Ve1pYZ8fU?=
 =?us-ascii?Q?ksYhzBOACanPp1adpZUONuM9IBJz5plOGUQSjgXyqylxsv00qPvgWGAHOe2h?=
 =?us-ascii?Q?HMnDL+mBtGb9YIPBdQvMyFW6+omNViBhxSaWL3YEKlDYVxwa+mBpuEAmTmCc?=
 =?us-ascii?Q?FAVhlKwO0u/WIDrJkZS0AnPgekHAr5mKIhLRtf8I1XyRhfYakRqsuUN3G73W?=
 =?us-ascii?Q?GriusteF0Pe5FCcaV3z2uPEjpWiLsUwpfxS2zI32BdO5TpLwKb2XVhXgxVgU?=
 =?us-ascii?Q?ILlGh4tZh4N2cJXQyY6tXtqTCXNkB1iw8CJbaMp5VnUgWKo49E00DeA0HZ4r?=
 =?us-ascii?Q?tDREILWqMHhjrkc7YLWaenz/muqn76wNOTSWce8Fr5CQlDN4NeAWVq4JqQyv?=
 =?us-ascii?Q?OSs6q/efARmEl0t2AgkNTl2iN26rxHu7K/CJ5gR9cwkMqLYg2j+FmQxj4O7r?=
 =?us-ascii?Q?Eq12FjP3HJec7r7pHUspNBon7h7eRDmRT7LU5s+3Bdu0Zlb2ag46edhKMQw2?=
 =?us-ascii?Q?RtQZVGaIY76BWdRqCt8Dc289PGq/NdegS1rFAnGa0c+5K3qZwmRev9jhWSLk?=
 =?us-ascii?Q?uk45VkXKaGKzAsaieU/BkGi67g5K2v1jpyZFcRPihcyLXNweAIUrlUCngeoD?=
 =?us-ascii?Q?zOckvBD7LxT843t4GAXBJExJpwXxhkPOhcvOajYXmw7pG5H/xwi95id+iERO?=
 =?us-ascii?Q?pLfVb8yiAEnBOpoH3vwEUPIBVNYdKQrnR8NFZKZTNl16co8gCsDYxFnN+Ej1?=
 =?us-ascii?Q?68rqiUj4UFeD3k/gbrvNJoE4U/vt23a++BCH9vuRqsKlvvssxLbnJ4yIpxsP?=
 =?us-ascii?Q?5xKpL0/hOGqfVtad3wYhAjED4HYV1MGfc8IIivMAUGcc7E0x+FriF634b8mn?=
 =?us-ascii?Q?vw2m9qxpBtB087oxBd8zvwOQe3NhW2zB6hIc0LRGIXw0oa+JwvNPKicenuC1?=
 =?us-ascii?Q?Kp7WOq6zegIc7hx3PfehRFC8AoXpgJzGZzMVgXpOSkBLEIhEv4iG81XtbRm2?=
 =?us-ascii?Q?NN/1zavhi+KbRkbHhZkKfEZHELSTJmeHDnWGgRXb0NHJGt+Evtb49v7g0z0D?=
 =?us-ascii?Q?nDPpdpanwn6yBJgj3vaKjEEBKvt6Jd7Rx41JbQRZ1644QwmJscn6A2E7Y0PK?=
 =?us-ascii?Q?pYyoKgz7cTrr8GKUW8M0QzWuMq+lRMinC9xWFY+RlCJS2UOiLpYNXVH348Zs?=
 =?us-ascii?Q?lrCGopPiVD/bzrpz5gaNBvipYETMt8szmXf+7S9+okFUykR01Oa0pRu9HOgS?=
 =?us-ascii?Q?MaT/QmWKsk9t9lMFXfQzebdaqTxpuLwKmQayxOlSNg8zrVLAcmaIVErlDtZa?=
 =?us-ascii?Q?w90nkwl/hoeyoE1tP/jMMMQI+BDCm9C9Oa2T3H6CSB9y/UW0y+p6BWaBENMP?=
 =?us-ascii?Q?tmU4nMGieum2egguD8sJpKlnnDgfuu0yxMjtjLKRSu27nmLR65CpsKJ5LU4j?=
 =?us-ascii?Q?6IRB3QbV3M1QySGRQKpo7XCHyLLnGkXNW0TWWLHmy8Y9g7jHBot5mPr+3GVC?=
 =?us-ascii?Q?YI1g2l2GACJfv3bDo0Y3K9KcFwEyIX0vltxz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?luoePJMxvpvIa1IJIL3o7EzaQUaGOzGEhByaFcJwyz1VRbVPmBKd+UMzV35F?=
 =?us-ascii?Q?UhKzZhBmJRLns55seED29Eof3iUVR/dLUuBQoo0r8OxNZ5W5a9Q1g+c9SeDg?=
 =?us-ascii?Q?IkuDd+FEOfIh4dpPL9PWvWJeZk9b+g0KlLOQ8kAIFR00bs9S1cID++tww5k8?=
 =?us-ascii?Q?x/HNcaqiXNiXhIdWhFYW5HulxyEU9gml6WW0hJiABpRS0CHWXkM9ct5yzOC/?=
 =?us-ascii?Q?rkqOjR/wAqwcvLcQ1Grwo8H22cCB2hXFWrXf/LPMit1iDOrbE6RQf2g75eMr?=
 =?us-ascii?Q?IZkSFtDq6DibO0yBkuUpGrmDV3nzDfNL8Hvqgmh7GZBM57Zk9aLt9GU9f4KN?=
 =?us-ascii?Q?u/dbRdsWqVoYf6hLxWoUnhb+pilS7l46sMmRtQ9mu87uE8QCVZ7pAGg2oMpD?=
 =?us-ascii?Q?cut7AwDV4p36TSFwW0fA4WxH1lDs5uQlku45BgBAVBTs8R0Hbo9rc34Z/j6p?=
 =?us-ascii?Q?L1396hQc4H0B9R6Cb2oKfJwNa8pxMWcVRs20dkNPSjpwh7mdEv0//Xg85ka9?=
 =?us-ascii?Q?bsS7Otml62IJiuExYZJCEI4iJWqDivgk7rQQMqoT1h/n/DMdcFaeTUvduhjp?=
 =?us-ascii?Q?LmxXJ1uL8XLE83hSI6JMun8jIld8NA08p0itMhtxx9GIrkrOnhkMPKDf+GTl?=
 =?us-ascii?Q?V4mJHjaHkop265zTkUGoOfacsqfgYYs6vq91W8b68MELdgGY+0lwn0EqSTJy?=
 =?us-ascii?Q?kLam+epp2vj2Ka1F+w3hYz0vFgSFXUkUE049+0zMQZAuluKH6nkO5pJL6Mfk?=
 =?us-ascii?Q?qJjCTQhUJ3TyE5AKQ9ndzoeFtxaju3nQZ8NbWDLMJWMUH2KZ6Y5y+v+5KWt6?=
 =?us-ascii?Q?P/yK3TFUBozsZJT0OdNqfPQ2GSw8nwT1RnPRH54LWni82ULs0JpLefDLcWOH?=
 =?us-ascii?Q?Tpop6RPnDQb52kiOpW3AH4JqUB+3XdWM9ziGvi3p09y/82HhbXPflQ9n+bPV?=
 =?us-ascii?Q?quKf3TBxMLdI8ftqZ2QM71+LJKbqz9czawiHM9yih8YC9y2SU0nhz8O45daG?=
 =?us-ascii?Q?5bbdixTgm0kgwFGmyASaT4nGFp+SWMz4hTd4j4H6/OXXammOrhf6PwVWbBI4?=
 =?us-ascii?Q?C/tEtS4wQ0oKJAc4h+fHeCF4AsGhbb05V2aam1TyGnKYrPscyca3WKpFtOeP?=
 =?us-ascii?Q?GifUq3tLGCHyN7B+6xx/hmkTb3SIo5Q9E4Avk0KVqHRwHU9V4vMUL/wI4K7k?=
 =?us-ascii?Q?//d799GPK3UN8wzojgMyaryYEHTociuwGt/2DRL+BWkM25p+YyLX1L0YRvkr?=
 =?us-ascii?Q?eRW9mx1UAaX4GIVnPunV6FCyHxLRro2wAufS/dczXi+Lw7CVl9UjlOh5nSe8?=
 =?us-ascii?Q?xaQ+E8Wxf/Bny9G34Vtujogaes4pRT6gTOsG2eRIbiHXj9XiFLRr/OsM5gZu?=
 =?us-ascii?Q?cNJwETpsQep6Udnr3j1R1wq0iKWXuYV8oGjzq3HpFG5sgADnycGGZtiIY0tk?=
 =?us-ascii?Q?paVcvYvoNo3cLPq2I6b4/D54EuTuD8BSojOjoOhuDNt0ypmNhgWqVNdA2XjX?=
 =?us-ascii?Q?wNjvBO8scg4OKCv5aaNQc2dZLT+x+L0casD2itBgvznWji3hIUux+OU+Ozst?=
 =?us-ascii?Q?/EvbqK919OQ7bPOwcfoNYprI+X6xz3iHtXAK8CmF90Hu8t1wKo5zDP23TrNG?=
 =?us-ascii?Q?TXTk6VT0vbx43eYRvxKFSkM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d8f56d-7ea0-49d7-9d95-08de20b7ca07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:07.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LlFyuqJGzzEdIMbaxgFrAB9njBMwdhSIAu/q1aAvfiyHeP/FmPH+cOjALHsqY6nSpDzaagTjpAcvpyk68lmhKWRbJpWUqHtWYukZYXoukTeW0TeNh0yVV5LisrYs9jo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/atmel/sam9g20_wm8731.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 335e216ea7b40..be54a63f43d56 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -80,7 +80,7 @@ static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 #ifndef ENABLE_MIC_INPUT
-	snd_soc_dapm_nc_pin(&rtd->card->dapm, "Int Mic");
+	snd_soc_dapm_disable_pin(snd_soc_card_to_dapm(rtd->card), "Int Mic");
 #endif
 
 	return 0;
-- 
2.43.0

