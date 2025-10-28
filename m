Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FB230D35
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634355; cv=fail; b=MG+I/4712UCqWEpqZbaxacylnKDVbwLOyMiTAO9XmcZJS7au5iotD7G7QyHajY3TYZt/06xdqnDGyFh+mgfn2LYAkGp9NMuTccDPwwwnrJk2JQvy9nJ7yu4W1HEEKiIFiGB0K5RCIXHB8ZobalEgyP4fFQuwIvPr2FB6dssp4cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634355; c=relaxed/simple;
	bh=BwYissy4maozixsckau7gE4SefwWobTKhGeaXn00s5k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JMxzbM9QsiQsIvMqyX9DSmOUfJ/rO6Tm9HVWScuakfCSFhco/y0+R8OqDhO0cTxBtrQWqwW+926Gri6DhBAWAOykhkd60g5Bkxu7Jkq+YzheWIcTNribDtgti4MlQSaE+Ev3qeyUMWKPixnkuIzutZwgqFx6HJkSly2QbrAvlMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=g10in6z0; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="g10in6z0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5UniozFze3zYnuCB79diEmZm15Cwmo2u5OxFsARP+TaQYrVgeTBVxe+xuurU8Cr0z44i3ChDmKmGQUtv28Gy7QCuHU0BcbDQGqqlaMtm9VRHsk5y0DhRmAoMo6UFaqWMeJY9sQjgOb5b1Zsvs7RyIbKFuhAJkc5vrbnuRLp8lUxTk7Dk//jAkZ8ESUGj9tFn1XV8bkKb2OwagE/+h2OJaUs8BWcgcu/1ylswmTwaHOz6MPBgFvw6pmAfqkqoEk/G+XonRPDgK66kxRWb7COW0cWeXWLQy+d9s21WXhSUD8ItfVMb3D8h5Ro3/lRgVYV4iKqGu4ZklA+/pBQdrkNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx8UV9f95X4ZXsdrp7XbGUhF5BjvBYayTtmEVYtchQQ=;
 b=tEtwZ1HzEj05z0qvCcHQlwsONW76j54ghfVGYKn9mzUuZibKYP6iR+AgX6sSKVLgqe6DqhrpTGZgkIbkS6sRAJ72ZP4AQZd7L6TPhiAo1N62+w7IAK58ZeN1ZIgxYWquqtQNQJff9RVCoIXwecd6D9l0IpkDkBKTIfW2WWlKHelYB8bMgc3UEKHsG5mcEjQDuSCklQRl9Jvtblnpxitp70aeYE1NDQbXs0Voa2zN6sYtHjIjrto7M6vvqBc7qbehLQWhDyOJKg6tKfTjU2+cAdh7QbbTO3CwMjmGO5pxNHHCvkbtONfkKa6bYKBw6jKNlacGwtjqyyVs8TE4OK/5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx8UV9f95X4ZXsdrp7XbGUhF5BjvBYayTtmEVYtchQQ=;
 b=g10in6z0VxAzvNswxFmPlcX2AAIgQ7ZLflj9yJGOP1fYWiPlZ35z6LBI8BbbRia6F2aQSFU6huNumM4eAkoRaTriEb7j/I/nhGhCEIkQReAHJk5APqf2bSS+wANGMFaTv3PFPZ76V7pGh1pJmMVCSbl8tcH0PyOUciovHeoUvo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15756.jpnprd01.prod.outlook.com
 (2603:1096:405:273::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 06:52:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 06:52:30 +0000
Message-ID: <87frb3seky.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH x/x] ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 06:52:29 +0000
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15756:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2087f8-7c0e-4b5b-55f8-08de15ee9016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jSLkWlRjd9orVT+zL97g2hZMm6p1BaxnfNDjm/ykkFsBh/jEUQQDy1ngBmZW?=
 =?us-ascii?Q?wKJvGFc7LmzRQPY+UKKlKqEqWUXV5iEupEwKFMJOEfiCxTXzL/rUWtmKRRIp?=
 =?us-ascii?Q?U6WWrOaghmC3tqgJZ7L0ipwWD4xj77KrIb+gGZvb/rmqFOeAxZzAB0myJqQX?=
 =?us-ascii?Q?2vRyOQ+jjxsa/Jz5hJ3KawRTTjY2IxYs1aoZ0J1CAgQK8Ety9wMusXmh0pNy?=
 =?us-ascii?Q?37hxRmLlKOuGA8KB4VOnaAZYfCot8eXNoIl4FTD5N2cKEeLG9tMny4HUUz1F?=
 =?us-ascii?Q?wgGQJVpjR2QiPCcLIqOsO6HKVtwqL5x6wgG15pV6S/Xc13cEmipt/Zi12pus?=
 =?us-ascii?Q?wxEAS4Rnkwh6WhtIDlGhW1umilxb206vz+ijTBslKrmu72EmGjL7C23SKMpj?=
 =?us-ascii?Q?86Syhy/uc8Wibsu+Gbti2023hYtZhg+c8W+WnvYOjz7OFFIaVllkGE06zQ/r?=
 =?us-ascii?Q?mbcXL3cTa3FX9qmnAK2CksjvV+B4lyLvr/1YcV9j9OzfnIrUk4igmmQd2YYh?=
 =?us-ascii?Q?j4yu87jBu5F/jDcnlPUAC2eANlSWWnIF7SOqQ1dZvZ+NhniKy1uHnf3WihUm?=
 =?us-ascii?Q?39/oyvqGd9ay0PjbBe683DWqMc+Lyv20rSQ7LPPN+TZlJyVMTyXxdZp2kTiz?=
 =?us-ascii?Q?Zk52KhriMZ0t/5iuZpriP+HCPfwVJwxX/k8ZQABW+hZbN7TFOZ9bI6nPVy3y?=
 =?us-ascii?Q?1CWEtgPnYVctaMS0Jx1yP+POYZbEtUt5+naj3jmE5zdX1fbajTAS4W+sJmS5?=
 =?us-ascii?Q?k+pyvvxp9uCMSHhcGiJuc7epa1KJ87QA5zxLj70wK4bY+xTcwHR097JT/7vy?=
 =?us-ascii?Q?0skKWw4o4y5+M3pehYnsdgdEBdcGVc2f6EV8dLBJv3XnhKwYmbNGwKGvKXVk?=
 =?us-ascii?Q?5FjRRJxcgH+7N9CUVfyCSVrlwnOrX0Dj42+XhXyzdWPZBiljDL2mNbwrEtsh?=
 =?us-ascii?Q?B2Hq1HFY0PHIuR5IeUGkjZCQiskC7G6f69hlBIdVm8P8mbd9AFSPisDBAeCY?=
 =?us-ascii?Q?qjqNGHaZIVU45fwrYzdhAN+wpDQdD1WraxpLiR90FFw3TF8x69bdvYTYm4f1?=
 =?us-ascii?Q?YJMuCJHx8h6TL9Ldm1a2fWPmLXUQcGAGp/byZEpJAqXuD5WnSybb0TATcU6O?=
 =?us-ascii?Q?88WWXPWe64X9RF5mgIjnET5C0o6JqG6MfsMN83j4Oq70sFz4PGwKAVHAdwqw?=
 =?us-ascii?Q?v5Hrtl3K+B7qsza64Nm1x9njct5BhEf7awLWgXebNtQC9EXx2JmBFXdcJFdc?=
 =?us-ascii?Q?CcCqUeHKPRw30VwfIQsJILb7qGtrDlrIPanKzhSETkAatiF+rBei3lJmPuPY?=
 =?us-ascii?Q?wp7SR5SNth+0ogAhllr4YtsJAPZzV85n+4Ek7Hb2yPkTORAhroshyyntL2Ls?=
 =?us-ascii?Q?Y3tIQhrAuFb0DlLH6VN8qbWfYGfRn5400O7xeMU0WHc2cxZehRGv73TLaXp7?=
 =?us-ascii?Q?2zHzXj8KBt3XGXbLmrGaTV5hMF3cWp2b8aJci7/kjuYJFT/TW5dg1oBI5ZXq?=
 =?us-ascii?Q?g5HkX/Kt/I4tEIm41J7m9HMbuD6pc+hsumOs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FxljMcq7EzENYYJSzDDWuzZi+nwId2xdR/9lUVrudDb+MneksOvm25oXgZi?=
 =?us-ascii?Q?aL1BadStgr73gqaFaWwTnC4SZ03D5lUMKkKlDElHr47l9VqJp82t+Ixwo0pA?=
 =?us-ascii?Q?M8B9vmiErWfOonnL7bDSlh8OWuDGnVoviY6gQ64LPSHBZ/gHGFJe3FPVXSYE?=
 =?us-ascii?Q?xw9wTdfLt5+MeOGlJqruCulpVBgzlwN/mRmeB2oB1MiiuCpjlBDmIxGXLIgn?=
 =?us-ascii?Q?LzL4iqIi/W+58WdinQ1ssxgAz4dJd/9aZxQvOS1M5Qky5t9/sKJ100CtzAtL?=
 =?us-ascii?Q?+nVqi2C57su9rRb/CoSBLopxiNx665YsVa/6857eur0lXkeWS/ILW/j8QQNt?=
 =?us-ascii?Q?SXllWqNb/7mYFraDarcfvbckIZai/LU0JfnYTd+eh3/beCZK1WdmFT5HaQ1C?=
 =?us-ascii?Q?VCGz5myzYVGTVIosAiHIDxZdivJSt9IE86CYGw323/Kz+fksbvmAt7ywjAOh?=
 =?us-ascii?Q?v8LtSQr+4Yl/cqQWP5XI2kAqLOSPdIfzXVfqF31eRBFfVViKCZH1PIq3ioDB?=
 =?us-ascii?Q?sFTyTosGJzQ8X0H8cgCu4hMvKIbds/aVFahJbmJiCPJDHfRogx0XIOywpghx?=
 =?us-ascii?Q?10DAacMc2zkOIh+1WOtwKixoPT79Rt6+EIAo7bamDQNXiageJ3Rfq4pgZN1Z?=
 =?us-ascii?Q?FODXBh9jtrEx90U2ZdGeyg3h6+h3r1kJBTsImhYyIU3pccAZ4riMoFor5e8i?=
 =?us-ascii?Q?ZctpGXoSqNy5OFoX1lz5WEhF2KChb4WFOJEugQaFCVNF0xE0/7GJum2z/IUJ?=
 =?us-ascii?Q?z8ANUb95Wfycmqjxd3CoZgtuPrlnqBVYPKcgSkeLy7V/4DnNfrPsr4yoxF2n?=
 =?us-ascii?Q?NwKUIN6hoVoZ7pjyoxEMSgJZihOIZgdJX3eBGcEV08ELYzJJ3SbNnWC7qS9B?=
 =?us-ascii?Q?lHqo8xYcIVOWhBWobtbj1l0DHRu3YU4K/zxLGLyxe+4i0esH4fVSi2WyjyUY?=
 =?us-ascii?Q?QZxYgCx+QAHPtTEYnyoJutS34mcWKukFaa+Y6IBf5pGsurblLnUs/ci9/4nD?=
 =?us-ascii?Q?NBGV6iSIr7vbofcG3d94GUFuUGKtVFlkzOp0vNDX4B2XDNjg55248g6llJhd?=
 =?us-ascii?Q?mxtdxGRtd9U9w9IN3X0OmkxLO/3jTgts5rGaiSjYboM7Cm3I+OWScS/F+LD/?=
 =?us-ascii?Q?En/egk+h98GogG8rbFCkPaeUPKZuOkdc2yE/lK072Y0B7RTZmC2RefCZyPg2?=
 =?us-ascii?Q?HhKK01kgMbJdo9RHwS8eGOm59Zz4qXAJ2Q9XXsmtKIg2AS4ggsWr5u8Om3FX?=
 =?us-ascii?Q?iz/sAyrlX2mgpMYzHgc3M13XxH7pJmNmrR7MYeYTK2vKKLoSmDCbMKxEkePf?=
 =?us-ascii?Q?UJZcndeFqs56ue2nws3+6f8SuCO3/7F3vG0chAWego2TnbaGSlsEnM/Bz7m0?=
 =?us-ascii?Q?ZaYnP6nMK0hfR8SZrjhPcUVpWb+l90u13/03Tm8TD3+GGW/3XIOOrthphRwY?=
 =?us-ascii?Q?G1KJTCioO8Ypr/DC7DkEzWdpW1P2kVADLU7eItFMS+AuDOg5KZ9FcLcPsgAL?=
 =?us-ascii?Q?zFgOSBjW7XyETcYAj440tDhf3hcITd9WP+9KS95nPHXXXUlnTy3JaCENSLHw?=
 =?us-ascii?Q?hz44IO1/iJMDagiHAeYgGmiU1t22QZgAjoUESdP4ftp7Z4sIT/RS80RIUoQN?=
 =?us-ascii?Q?ABG00MMY3C39cewP/NrWRdY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2087f8-7c0e-4b5b-55f8-08de15ee9016
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:52:29.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkamJL0fBmm4JuLsLLmohrpZEnEfO5nnYejy1P+sIk2+IbFzZRm2kGu+dFsPQl9NwNj0yn7zxnYXs3Aq3GQsta5oQA+o7BiT5W5PDvhytDwrpvrlo25KXm0JFFVWDPU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15756

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
 sound/soc/atmel/tse850-pcm5142.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 2a1d0408a4cf1..0b4927d07f25c 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -58,8 +58,8 @@ struct tse850_priv {
 static int tse850_get_mux1(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->loop1_cache;
@@ -70,8 +70,8 @@ static int tse850_get_mux1(struct snd_kcontrol *kctrl,
 static int tse850_put_mux1(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int val = ucontrol->value.enumerated.item[0];
@@ -88,8 +88,8 @@ static int tse850_put_mux1(struct snd_kcontrol *kctrl,
 static int tse850_get_mux2(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->loop2_cache;
@@ -100,8 +100,8 @@ static int tse850_get_mux2(struct snd_kcontrol *kctrl,
 static int tse850_put_mux2(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int val = ucontrol->value.enumerated.item[0];
@@ -118,8 +118,8 @@ static int tse850_put_mux2(struct snd_kcontrol *kctrl,
 static int tse850_get_mix(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->add_cache;
@@ -130,8 +130,8 @@ static int tse850_get_mix(struct snd_kcontrol *kctrl,
 static int tse850_put_mix(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	int connect = !!ucontrol->value.integer.value[0];
 
@@ -152,8 +152,8 @@ static int tse850_put_mix(struct snd_kcontrol *kctrl,
 static int tse850_get_ana(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	int ret;
 
@@ -185,8 +185,8 @@ static int tse850_get_ana(struct snd_kcontrol *kctrl,
 static int tse850_put_ana(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int uV = ucontrol->value.enumerated.item[0];
-- 
2.43.0

