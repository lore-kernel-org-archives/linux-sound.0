Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135E21D3CD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821175; cv=fail; b=Ze/WRFsfKa6uQPxJUFvopGygiZs/FIKT8M0+B6RBASryyylOz5jeg4/bg5rvo3yK3/mrRqFTW9BMQuB7XMqR9AMmLZnXzcZHkQHMAqfaCxv/HTZ+AA5DWmFhwaAo/Hw3Tdu91qW+2B1VNdTQn8EwFTE4KS86XJJtvbRNKChRZ9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821175; c=relaxed/simple;
	bh=V1972W/kLaG6RfTUezfz8cdAprhhBSdb4sw0DJx8v44=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PTpLVnLeah+s+izEldMOYHDA5qLteofCLTLktOs7NUuH4NEHaKqnTDOIrbayIV6gNNkZjbBqAeXAAWUEfKvTd6LksRxe9s8i+mlCNjHdJZWTx94w4658+3aTKvWTf9urrWdz0bGUflAE8jDk1R0KLJLvxO9cGGfN8PB3VYn/ut0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KVCK2IdH; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KVCK2IdH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmMDpxXvn8Uspe2h+NoBKh5dkxAjEz1n3jrC00tBK7jI0Vs/xjjxOCy7eDYm5Xm4fEpsxh1Ycq1QB2N/W9rogi6xBpISaEXAZu4DbRn3U/PXWovN/rEjq1iTCSrJmOCmV0bsnK3WjwtmccC49XJ/M6gp7xmQPFJB050lI/js7tQg9ow7TaCQmlfOvOx8bB2pMFn0PHpBvzqpcLkGmTLyTtF4+UtUpxEpPfz04OC5bsQc3uzvLNBqkF+jWyET/iZlkYBvTDJm++E/qt90oWdn7DZ3D9DlCOgDBIG8Uak2ADXj2vjJYA8I3uzu+ECC9dI6H5AsNoo8weiFELgZhfvWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQKgVi5nR/U/LrxEiHLWySWVTK6quIUfJ6so09ftViA=;
 b=FS05/WreT4xpCrn6RsPaIFREMGyqVEDQrb3kRWoH0t7+TXwHs3oOrvCXQHWEf+8hOQsFPOs/Uji7jaSaRDi0G+/2VcSDBcb0Q0+TQ75rrwg98eyvONHn1VjJ3Nh67L/n27uSaIXLfv9Puo3Ena6bcIjd5NYO4szkwHdHK03dx6bIWkg8qtv1ojoOfu2SBNSslhdBDMT6f4EyhbVhuB/EYMWOO6bIB3/8OmvVL8NzuOAh/722f19852hGg5bxV1yybPMwe/DVO8tXre0ZHd2z0h0QH3+8e4EBewxMFfq4Veq/lZivMPwfra5qlKO+MosFi3Prr702mAYB5t4hDdH36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQKgVi5nR/U/LrxEiHLWySWVTK6quIUfJ6so09ftViA=;
 b=KVCK2IdHEX+9e927UJ95HuEOYm6kxfNCJpFxQyeFep0mqDAVOmw+d0X5NLdyIMgknF+g7J2U4PBK7SlwDQ6gkwbpdUWb6SpMbunFtdSjtB9/V+gcj8EcdfvwCPnOmgB4xIMrOWkOO24/ZIwIsNO5wGaVDsbqaJ+hQKANSRyG3i4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:50 +0000
Message-ID: <87ms4twgr2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 217/292] ASoC: intel: boards: sof_cirrus_common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:50 +0000
X-ClientProxiedBy: TY4P301CA0104.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a01a726-0941-408d-0698-08de20b9d835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HNHlFOcwI6hn4BH0+8RXF32MUfTpADua9L18zAUZ0Aq7VUan7q5eC6URyeLZ?=
 =?us-ascii?Q?dhIaoA3umQ/kOHpu3CoIoU4mQdmVJw9RKOqQFomHJOL5RIlEJr7Bf9o58344?=
 =?us-ascii?Q?nfvosmhihdvjy5bRHqMIx3OfOMM589V3pyvXA9MYQwem+Yiwa02DVVmDcKJ/?=
 =?us-ascii?Q?ItDs4bTBmbgwOnpFQkcLReJuEqG6BQrpqUmClCww5ZeM9a1o5uHc0rApUHQ1?=
 =?us-ascii?Q?vCK+If/zi3xmGvmf0jGChY2Uj1e5PeKaG3Lae2nMuHLUwDja1gEuLnkhI/yg?=
 =?us-ascii?Q?5wfDDSMSuZCGSpgeRddbG7q2TnF7ABTvXQLIKasuoqs/f8PqZt4ck/0/0zKs?=
 =?us-ascii?Q?7V3KnkAVr/9xM+Z7hHpGMQ1YfecOXXPWA3BHDz/eWO4XHLRNySIAoppMzwc4?=
 =?us-ascii?Q?04iGUkIRaamvait3tpuaybTUXBDhUbXTJ+fYjefFDmDHmT/FEs89NAffJnpI?=
 =?us-ascii?Q?TL9FCH28+rPsB1TQIl0xZ6OprRDbebH9r1ELL6Xl8IE0nBZBu+txVW9T1CE8?=
 =?us-ascii?Q?tkaQj9Z4f0qh3aAJmwpxdjldBD+l3JjJsTOAjPbDYGVKQTJDlAgY3YwfSAZQ?=
 =?us-ascii?Q?5aYYNEwaXJB+pjPs51oxsGiwQo/9ThRJez3j8DGScEcmoHmFbh2aiPuXBWw5?=
 =?us-ascii?Q?yYB8wH00ZK6faFgEYoPyOo32+gPma+FmPamtQWIDjNJLVefjoQ2M6u6nBJZE?=
 =?us-ascii?Q?m5cP2cN8zAuxQFYLncviaetfZjKtP+AtYyMYtCjinprr9ZAm+xnjhnUlQIIT?=
 =?us-ascii?Q?WRp5KQbnmzE9YzuE6mb+TJ4F/npfRV0GHj2Dom+uMb1rl9Q0CePGWqvh5Wpx?=
 =?us-ascii?Q?tzjYwvn2BTCkdGKkdhS59DgJQAmgiaQMQmSRTqgMUFwenN8jLdQKw0lerO8f?=
 =?us-ascii?Q?7eNOJMh8emOHDVD23i7rFiMzWgh/9YJJ6295zgqq7ximJtBVa+36L5Dc7r2z?=
 =?us-ascii?Q?De8WNU9/AsY1eTdIh8KaPAhwszzi1+0Mp/D1neItb2qePume+T4tqaa8avGi?=
 =?us-ascii?Q?6TjcYu3gBxW0jWoGw5BAwTWFdRWbAT56tdtamU88lcdNhD3JgjSL5SGgctIF?=
 =?us-ascii?Q?4ipHbmqgDARi65269IKOlgF6LuOW8yi/tIOawjZ+6tQ4Wp433AUQgyL61Omy?=
 =?us-ascii?Q?G7gYBFsGAx5loQDcatjDfLUsyX8UPlrryl2CV9RYpVqJE+EB5YuXtq0oP0fv?=
 =?us-ascii?Q?R6dDCw4DZeTd/YKJrihkojjZpKsxY498rVR70gDKcAHouj2X7dU22D7j11lG?=
 =?us-ascii?Q?d0yYLll3xKE56p4r+D5jjNUmcenUjQqiXEF3c7QFV+7HNGif0XDZIe0fmqR6?=
 =?us-ascii?Q?ZFVnYplqsGPPUG27F59DP8EVd7S9MK1IfTeU2To87CEdb40UXk25nqJNSra8?=
 =?us-ascii?Q?fnyZ0n1FJaDxxGbI6tq5SZ5VaQ8Z+DkNVzduAjfoQKHBVfn8pCvEZaG3kQ3V?=
 =?us-ascii?Q?JjT/X10mMsDfSi9e7hgTc/LfQ9p3hEJcrnUhqklPJAeozGdMV5m3RhWm9iwB?=
 =?us-ascii?Q?/CLB9ZE7kBT/33o0444cDhxpPsWXI8gtufGL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bs2wO2qbUo+1B8PQNOHPuXqwWt4hUxVsTa4sD/9uLd5RP3cOuWJvo6FEtILg?=
 =?us-ascii?Q?b5ElGJAhnnsXMxFwSmzM2gFjFQeC7l8sIjX5U4EY63vV/JuLN1Kwm2E21ReC?=
 =?us-ascii?Q?jAYCY+dkC6cvveWDqfPcyEoJbWxhgRLowMr/+ZAfffvrP3ymjdJipolprrdQ?=
 =?us-ascii?Q?jpJ4tgrI7rrpGBDhToRTGGF6IIAmMVVeeWwX3RvP9xrt27fzhI80PV/wDRQC?=
 =?us-ascii?Q?AmywR0NOPdl36xraXKnD2jpo2f7bdX/ShLH7EAJyq6jxknX7owaOIyTAVk18?=
 =?us-ascii?Q?Ch75qOH5CjCB+d3Uk9yf62bZFjeeBPnLbOle1O/iia1cG0imGILvhDfEbKkv?=
 =?us-ascii?Q?aCX9EdrbJtZYhMDD51m5q6VrHaugsjMFZlFjdPuH2lbgKG9U8MzO2ln2yFRV?=
 =?us-ascii?Q?nJJaHvCmun4TgCu3B2mH0APKvtMyaF5WVS+Xf1GnZxYUQhl7J87+gqC5g8ry?=
 =?us-ascii?Q?AzkOe3Wlp9TFf+Dk9hxQuR2S8JcrempqtEIVenrFewD2VDmWmRIXwdj/y1O8?=
 =?us-ascii?Q?8+g2i3KJhfwBLCuaBIyU9+4cgeEoiB8kADreWGSajIcDicKTIdNkFZzsU4gW?=
 =?us-ascii?Q?tF9VBGvQTiiN+kbYQoSOv1pHjA6aJyz4UINveYBr8Bob2B/KQdlkQHDVJxbC?=
 =?us-ascii?Q?aNs2f/z50sJuh1BPep6fa0J5XB9dIJypJooEa3etc6OZD3pTNM/T/LYBoKwD?=
 =?us-ascii?Q?AkVA5bZrXcgBw9FOuixZQxGL3vXQfVpuc2ZntVxSqnGxk0NEikmKC1HNwseV?=
 =?us-ascii?Q?isw2t8yYEMFcjsWMFalmiOI3zNI0NErttPOZW/bSK3fPQteRGgHJ5/Wk1It1?=
 =?us-ascii?Q?HRogfHLNAsevpNp99XdBqRTXFRTlU8GSFDAKRbRue+9lHh6aCVBeCtgHNKHY?=
 =?us-ascii?Q?Zky69TZ6lC2ssjKaH79DOmmJZFP391tyLfVlgfTotC0BB6qVDhUIWm/aw2OG?=
 =?us-ascii?Q?5FjtrITYIOu8TqEsa+mPnyuOTVjBCzBFCftf9XgNtgYn+QElrl6sFrJSNY2R?=
 =?us-ascii?Q?yZ9vCPpa5NgMYEoPvHZdGWz9koi2alX22zXgqnxq3U0Ef/6jvsX0R2hi+YW2?=
 =?us-ascii?Q?0J8iZEpwDfUl45/xZ2Qj6Uxjyg1P8qRoclDIM+rjaSoOCYacqbTCfg4j3onK?=
 =?us-ascii?Q?Z69pb7FXw6EIEJLv09TrCxu3MC8rehW+/PUHUVsRpUpUct2n0SQbTp0p1Swv?=
 =?us-ascii?Q?PInE3CC+FPO9VnH7e1ERcfw8Mept+B/ddC4bkyL0YHgVdhZXoTkyimQjCUxg?=
 =?us-ascii?Q?kJlkq1B5bWw+hD61bS9wUosrjkwMqDieO3sKSJDfGGDr7XUS6X2+g+/vXFN1?=
 =?us-ascii?Q?gibeO/LJglM89LbqKnkWOiIzjfLLPtO9yEfe9N7Dw/BVBFERefm3/Agewxt+?=
 =?us-ascii?Q?34M6y+9Dafum5mIHtBeqzdCmsRYvddOmBclUVMK/yhOfbSIQbWtnUKc7cQBj?=
 =?us-ascii?Q?4DOOnR3Z+An0q25KTzJH3doEFpsicr6BldgCPuVaeOYOmDRU2+ujtv0gFM9L?=
 =?us-ascii?Q?/Qd0IMMbW64mFJQgnX/1yxMCE1ThI7GaMTWjUGSFyAgVZXsa8uozJdY+e8wG?=
 =?us-ascii?Q?Z/IE8jTDj5Iy7GM3qeMHCqyDqDlc4lwDyB41JeOq5nhS/iStiABFm8iFF38S?=
 =?us-ascii?Q?X8YQODsz+f7nfW5jg6VKw2U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a01a726-0941-408d-0698-08de20b9d835
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:50.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efXpCpJ7xSGyUA+A2TYx5npZCEo9MlYRf8PF37b5l4iZTD9lcSXAjODDweByObtc/63tEpX6QFlc0ljkjugqhTJQGLBxWGI12bwb0zUYxo7UvvDF1aHFs7SB2DClHTD1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/intel/boards/sof_cirrus_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index 8db7695b97476..88fc6cb2bfd49 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -48,9 +48,10 @@ static struct snd_soc_codec_conf cs35l41_codec_conf[CS35L41_MAX_AMPS];
 static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs35l41_dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, cs35l41_dapm_widgets,
 					ARRAY_SIZE(cs35l41_dapm_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add dapm controls, ret %d\n", ret);
@@ -64,7 +65,7 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l41_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, cs35l41_dapm_routes,
 				      ARRAY_SIZE(cs35l41_dapm_routes));
 
 	if (ret)
-- 
2.43.0

