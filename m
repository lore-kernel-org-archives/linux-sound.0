Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303778F20
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820304; cv=fail; b=qwOQqUf6g9IPn0gkzqYQqWWYl4Tkhph6wtAo80YOEzQVjPqguUVdurLUcuWKu4oO7tFQ2D29jZLExsqTj0OWRrFFyH4qlnU3MPkk7VRP+Tt96VBsLdR4ypaQ+zsned/8+GjCJGrFY8bAP91EQYMkWJr4xre095HNuCi4qBlp5oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820304; c=relaxed/simple;
	bh=qnVUSCFeV35yjNxbS8HnzwlOIiYSjeSpK1ymdteZQvs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mbHwdYrLyvULSaIJZh0XCdWllBekQPpCIQLCDV8Guyzqn6OnfvmyZ3SHng36fsQyP8uywkBm/696BoXHqnBiKlHF5rE+CiwAF4VSxVGngFgZDU4KI1NBrW7IA8fRZnk4YRZIscdEr3Uj5T3cWNP+2j/H52qiCdT66fQEqECw/R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YPjNqgRM; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YPjNqgRM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnBTrHze+45cIK6i21+RjAQ06O+3tjkyoW7zSk9PAb5WIVA8rED/QpMAo1tyXK7g6uWBFXJgzjkhjbwN+1KmkOgnNxUJDdnu5ckfMVv2Si1f5Dnhkt1csj+FuB5WGzVInhjFytjhuYkuiSQy6gqhgAPgHHnJxU0G17HQE9EMFJHFE3e5ROIxYhg6c42jAd6Dwm2IQ7XQBc1PbcsGB1h39WBiwq6sL5C2HS1q0N0KJOvRmZZtxM3DADbwhD2Vq5bC5edbzjLtgXSd32P41mhslP9ig4pvPN6V5EIxi7ztk70oRI/00KM57IJqSL0hSdjWH4BP9jeOKp22+CTOtITO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9w1kl5VVdFNOS+8TCP/cOc4tRZXgYkpt6bg+hvWUK8=;
 b=S1lwGgjBHi7J88yo2NcqKRK3NElTmf23kv22Pfv643Em7gJqi3WH/xncqgoOGh3tzr5/BuhoAEBicvVxH6JaEPb8zFFVhPimO5MQnJBxAXb8HZC3YnuGhyt+h6gXNGoU9mb8DY9vstYBUEZ1wQIsuTq9j6hLnguijy1Y3Rsg6MJ2j1hEgobrrLABmXlNl3osCK1m324pWGVU1VKBBVQqOBvMVAvNeCLDvsLgzQN5xK5WKJaZF3cL/+CKJeAVAEqmwK8/LwmBm5UJIoBXHR0LQdlmtCt/13mOoofyEGmIQ115DrbGmPgJHZIVAhUz9cCRkO1t3S0VycI+BDVfd12Feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9w1kl5VVdFNOS+8TCP/cOc4tRZXgYkpt6bg+hvWUK8=;
 b=YPjNqgRMBrsN4eeQ3qI6JEkA63d66o5MW5LFPs9PzPb5th7WiGXK+OefoFvgTa1rZi9g+ll9iNwD1QfVUj4plk5CgE9nws1KB2e+L4KYzAPrnxj/H0+TAqIBgj3G2ZODjo6MOkudRFlI8ZH2UwR8x7yu/vvk87SpL6fMUr7UFKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:20 +0000
Message-ID: <87qzu58lrn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 015/292] ASoC: codecs: ad1836: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:20 +0000
X-ClientProxiedBy: TY4PR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 694258f8-16b0-497f-3a80-08de20b7d1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x4+FySG0iGi4XPRdSDYhMA+4UeJhMYIKsvPShWe2SnFa3bwguxD2KC0KLGzf?=
 =?us-ascii?Q?w1b/G3Fv7MZ67eQJJAc9g1uDhiRfUruCP9F9ES8jhFPB5B5b3BZ+Inu80r1m?=
 =?us-ascii?Q?xtujuXgrjb8MJJVpZWwez0LuLzvyz+6NK4XyL3vS0OcrkoN8OV8MlneGViNT?=
 =?us-ascii?Q?GzEJGBC2KqUW7r5Vrni1gt6ZL1OjcKzwie+WQq0c+JIBKxq+oqYS0NnRhj+3?=
 =?us-ascii?Q?R811kNFGFO1e4OQ200dEzhswUh4wAd2OhDKaU9ZpI8Sw9zEgrZBMmJGB4gGe?=
 =?us-ascii?Q?iIn/hOSQUY8k4M9azKRK1nwr5nQxJl8sexIr6GutWy9ESr7uVmlI5QQaL70/?=
 =?us-ascii?Q?2T5WZuvDCjsYcLNGCOOpnj8R5a809rB2zEv5LGwT0oB1xVeZELfh3zMsHWgF?=
 =?us-ascii?Q?v5MRp0G5d0sLN4LVgqGSOd6kcicOQFn5WgzTTU0R9oNj5z1k6L1ECurZzSbQ?=
 =?us-ascii?Q?xuPFwGiDY1yy0bGggvtubo2TT/87ooivg+7CVkObX1rCRew7L4qQE7CsV7c+?=
 =?us-ascii?Q?GVtEKUZml9PnioEnlk3wXYycWoFDk61dvxGhH16TJiIui5hB6J3SEXRQXqOK?=
 =?us-ascii?Q?6c4yW4zNfZ+vfAhO0MkgeWtnrtZDaGWJDdmrwX20YE/ZwKhj8DnE0Dl9akN9?=
 =?us-ascii?Q?McvKE8repTKGyNAOEjgVeNVu4SB0TDqK8pH7kn6mwDxXruNnMNVZeRxuvL8x?=
 =?us-ascii?Q?w4DK8QUXQsLC4u8kxV5Jeytvnj+OHUnvtSrx2oJcf0kM+DOvuEpgquItvsdu?=
 =?us-ascii?Q?hqCM53GNUbrKjPqHkr6L2B+cbWgwo7WgZgMp3RMCG4FAwG+MoAMb2LdHIjxt?=
 =?us-ascii?Q?GANTX6KE9m2/MRPcuZ1Qq/ykJr45tNYtZlWLDZGlY6fzNeaa6uhKxNLY6VzO?=
 =?us-ascii?Q?59dibRIRaXj7yVDe5J46tkpq/3KboqMmypGWQOvyDRenP5bkyHqt1ta3AmeU?=
 =?us-ascii?Q?szYRb7RQt/p7rQYXgmXOu/xBqiCvdl52XPhT3komi0DqQLN4YoRo85GlFC1r?=
 =?us-ascii?Q?rj96J06vld+C6mGRuTlgHNGitaybWQpOc74DU3eRImhh3Gs15bfK/IHnFPiZ?=
 =?us-ascii?Q?zRCJOXooJNO54MEq2p/Zab+/MOvEvV/SAJY6YYhVjDvnMNdLSaWgoFuULhVm?=
 =?us-ascii?Q?iTJxVAMLe50AYHJfT4+PZULNrHqjfWK454cpnpGVSUec7ppyfYy7FJeGHAqZ?=
 =?us-ascii?Q?QoiMy3vuWR4mVt0mPw5pG81gabX6tzqad+2vqQgq9B1RnMDLQvDi4Tn60uEI?=
 =?us-ascii?Q?xnF/ANblMEZuap7xIgm4cRQCd9Z98euruc2J5pO6FrovmizMvUdebcEr7HEl?=
 =?us-ascii?Q?fsRNtcKua8i7q22JGoVNK6+Ks+Ggv/GYZ/PRGjxV4H2cxMmYU0n6/pl55FdF?=
 =?us-ascii?Q?17R9xxs7MXy7vqbxaJM9gWm7mqaWIgPFBH9HNVPzohVqV0KFOwRwlYCK6JN2?=
 =?us-ascii?Q?eV3K8jjROgerhjxZhZgi7v6q4os6KcYvD84dhxaadNyhnsALkRz77cvavYeX?=
 =?us-ascii?Q?v5LJv5xxEkV12ohpSUxuhV0KFduOEBEcDRMQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q+V0J8ZeOF/4hN6mEJ2TwVp4rO+D+z1UKfptpsQLaP1eFV+MI7jCiirm7qyr?=
 =?us-ascii?Q?TOitM7CiMbG0/BEYLX3RtPE2NNT4TT9AoeScXHz1XVu9C+jprd6o2JWoJatx?=
 =?us-ascii?Q?jnpKyAoTa7evAitFJDxIJiBMdWDISQrWGxIDS/IOn+BHBJjYCoHulBl2e2V4?=
 =?us-ascii?Q?yDVPFFLLYSNot1Dyz6pWg4fGxGohpsQDOd91Zc6WLMIhiyDw5S9DnifMVCcS?=
 =?us-ascii?Q?V2fusM0VPtolIDBI8DeBbw6VCuQW5t1GKD2VRmv6PRPaN1LKFUXE0/NZ9j9J?=
 =?us-ascii?Q?hmxC/c+4Zn7xhyYbK52CV1DrpgruxS7+Prdd/MBElXEBYccVsVUq84L5dxhf?=
 =?us-ascii?Q?aKBpIZeh+LKFnpqvjHJRQE1E6Ms+yt7G+zXUXkw3nAWwDcIX4knMiLrfhxtW?=
 =?us-ascii?Q?N9w8d/pBfFLoO+8BqFXYIMtgXZ58GbXefvSJLAP4jsLH0SGuqJpV3Pn384x8?=
 =?us-ascii?Q?6Bj8TkQGFt6gTkEjdFiI+B4XyZuHyfpyeBMWB/+t11SSX5gorrzb3OjQ39nE?=
 =?us-ascii?Q?Yy0g5IP8GPmN5HKFUiT8IX+EnOzDBlX900A346PEI8M4O8LvECyMMzuSw6Rb?=
 =?us-ascii?Q?PU7OT1C4Aaj/BkwuqQVBa6cfSLXzQK6cGbABn2996yw85vdxN7DNrXf77L6H?=
 =?us-ascii?Q?GQSP6gEdabW8xjn+1FofO7XF5HVbNvjFKQ8WHUQ0oQsu5cCJinGfuy9O1tgN?=
 =?us-ascii?Q?1kDDVHhvL+Kl3+qrdEEVTRbr5hV5hywbpN0aRCbl8FVpy5Ul0L4+3p2vOvmI?=
 =?us-ascii?Q?Nleb6z+B9qiZR1CbF40IR5szsoon/jf2qE6ikBo0T/hoVhsr+AEXXEuYGdA/?=
 =?us-ascii?Q?R8A4Atf3dgEWitmKnrr8ObPJ9H+g1PwOaL0V4bCQef8tFh1kWH5cVKykxrnA?=
 =?us-ascii?Q?CHAwUHOl9RzZpULSselB5Ml7E0klZIEn7NXV9vDaisyB1kD6CmY3gNU5PRQ4?=
 =?us-ascii?Q?c9gzLjTMf2S55EXxOABLG8N44jVc8RkMZE/OaheGuZKwg8oOjGQE7nVBdS60?=
 =?us-ascii?Q?q7SvewuZO9aXYbBrH3SRn0Jsu+E03Zf5vBfrDVJEPbiHSYiCcWJdl31vozOL?=
 =?us-ascii?Q?rrmDMsUAgIm8jzZ+oZ82b6zhEcFjVdRHNGI4W0iHK0I7dwucjmGJbOYgcxr3?=
 =?us-ascii?Q?2eI5YvoM5/9qd1LLf8LcS+EJCP0gWIjwYmV+0jr4LOqXOegSSvj5DGiksIT5?=
 =?us-ascii?Q?4vfU0+YtqLs53iDN4iHOmROLba5q1aCX/W3FAWY8DYHnDt4avBnibrvrUTR1?=
 =?us-ascii?Q?v1OJY276ETzdO5Z5Rk4S8jJrSeYDkudY2+H7J22Gb+mEVeu4s/z1x5xyclQI?=
 =?us-ascii?Q?i2fWYFhuSPmcBFT1MnHgHonL2X+xmIYhcKpXEkLibOALRbYFUEw0oixWsjtL?=
 =?us-ascii?Q?cVCCKgjrU0cTFv+k97qJ/LVHV34eK2b74yjgzMFnMLFoR11VUgo+SPXfVv8R?=
 =?us-ascii?Q?8L6IRAamyxwX6as5WTGZmVw2eHw6rGkPyHSuWiqUBM/YgXMVJS/W2fs6q4Mk?=
 =?us-ascii?Q?ln3EXUzN5b7c1KdYiIyjB9JngjhZWVk/MFVownoS+pIinOtoA1kosmYPjjqc?=
 =?us-ascii?Q?Cc2+Mx4BP8PUexZaO3XG4qOG/V1gP80z8jdExtsaqqqqu+WsqFrEObi+/YCi?=
 =?us-ascii?Q?qP0eK78wVk+VT4vIeZjs/rc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694258f8-16b0-497f-3a80-08de20b7d1f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:20.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVWKd8O71wSUxLalF2BP3E9K/buL0LMprq0ERUF8jmQg3syTefSnSeXEkv3rbpcBlC1cVbkoPwNYEVmNsE5z2hvqXhuKdDJY31WPZZqv7uc/Ig5VBHBwDhQMtbW93lwg
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
 sound/soc/codecs/ad1836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 949077108bef4..8afeadcaf8b09 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -250,7 +250,7 @@ static int ad1836_resume(struct snd_soc_component *component)
 static int ad1836_probe(struct snd_soc_component *component)
 {
 	struct ad1836_priv *ad1836 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int num_dacs, num_adcs;
 	int ret = 0;
 	int i;
-- 
2.43.0

