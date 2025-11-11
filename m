Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629561D6DB5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820834; cv=fail; b=eDFv3Mq2utpkrpaWjq7tbrurqsB4+Pn+LQL6tNg5jNk/Z51qSyOKZBELE+MUBGkb2sRjBUhwMZK8rAL7c9OZn2mBMW5D83VS9b1U3/iU48lyycyuyQ9VkzBztCWOgCSqAbKVRQvNEsQ7p74/TMi/RdZWWAumGrbtoonapmU3PP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820834; c=relaxed/simple;
	bh=N4sWN3NgVt68JcohPHk7lEK4f3RMQALUSna3JgHPt/Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nAySxtm7eSvNXmLjTo0ScFgk752CVFFWDCBG1DGDZ+v1HsmF3+Mu1o1D9Ksi/d191MYK86pF4pNUZmRbp0STHUyDehbGgwWRsRRoAwxjoGQt2TB7rzDxiZN7nqWWmIo1tSvS173UDzZoTYWzfdmgHFKsKaHF04SoAJmiOxhCJCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d+FoT6vO; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d+FoT6vO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlE7E55tLfAtWG5Llg1Fj+O2R9LM+aFlkP4LNwX6ivxfZ/LRgX+jZoxfnuTREEBw6Zn1wYLNWLR+bDo5+mn9cBY7O/z6tgHjk/XTjKi9K/F7pGWDbGb4eYTdq7+Jn1UFBqR5ULqBj9SHdupqhcZd8h8w2hFuHFyqSbkHsbuB0JjceNsCzuYhZr8OU1uTufgRcI1YABczfaFnCFTD9gVFZND3jGzwHZIBr6OF9dzK6SGb1jBWUI3PbCqic0f63t3N3z+Rx1ROM8hdZPLIS2XJgdrNYKCXs5LWETh3yQs/40pCymviFEiQjWYIi+TT86YlaXxgH8tUueyXp1poERj2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqeg1Cthj7PJtKlFbTvAqli5zxbPAZKKcue0oDBpmIw=;
 b=e/DkqwKtgbpDhqheHTiIgLTGEAObbTu09/CMc/3bf/FtTxQaDk0VjyPcwa66CGNBfXgy3MZVN3fRqon1+0oU9Ed3T1lAV/G/xcz2RiM2Vk+hFpTFAmAL97L2IGxVosE+Jz8i2PH3lQuJgkNZnTWGEJsq0OFZ9YkB1Tz48LDbweaBdJd6G9ge7rjy/ZHATOrNu2hN3elbCBfKPKGyrcJ42c/aGtf8/3v0fWy6gz/2cbc0eDUadlkuRfeY4W8OGRcDLBuRuhjNn98EfXE34j9jHyMYT3g2+64isLsZLQ6kzLaskQMX6XfnQ+EdEasEQDnvSvOmt8rfTaH9kt97Cis3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqeg1Cthj7PJtKlFbTvAqli5zxbPAZKKcue0oDBpmIw=;
 b=d+FoT6vOEfWmG/NbLeE9V2pASWPEo4HQHqnat/CpFwttPscbv5LenYhzKLlsA3PFhl8dRroNl45EtgQ8eWI5EeMhwi5LnefixX30ZpB3VcBneUMRlCt4dErZDVbi2TkpraFSPaVKpyTdGShafvfMbntxzt0p3DoaiYHdAt2cCVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:10 +0000
Message-ID: <87o6p91kiq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 141/292] ASoC: codecs: tlv320aic3x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:10 +0000
X-ClientProxiedBy: TY4P286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ff93d9-67e5-4599-08fb-08de20b90d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TgaMwtJbI//O0lZHY8uPpmecgfwyVn90t8hROPPkMgq7QQ9KpwdWx9HnrJ4r?=
 =?us-ascii?Q?V6RzWdgAWr9AgBKik4IBqORqM6Rx+bToWO1I5zNDRDW8X46wQXmHZx4qnGZ3?=
 =?us-ascii?Q?41QUQHP4JAk2uNh0m8XpaXkIWNcCudMzwVOT7k5/XDI0FGGVpIZfF2uKeLwk?=
 =?us-ascii?Q?wn7rumCJhPTc4WCNssXbByN+oPMSW7VwWv2CNAM3dLE241hn+EUuPMdw84MD?=
 =?us-ascii?Q?c29WIojz6PFd/Uf0FS+1ct5RA18EeC+olG/eEZuXIBuK08efAwAggn4dRqJT?=
 =?us-ascii?Q?xyUIsmLVd1inRbFprMz/mFQYtfaPcwB5aWuaDtRo0VlnRmvBDA1ubA2Mlcap?=
 =?us-ascii?Q?Nkw6OsqmGcjVPkwBhDPOCskDno7FZID66PjjL9kUhjUZiUR5jYq0VveKp98R?=
 =?us-ascii?Q?U+gROusUAT2TlHTHHk0buBDjJQksV+9O7J375+0HKiphG0tcnb4k6Q3Pqqqo?=
 =?us-ascii?Q?7qNCw4Z6fMVTRWWiJ65JG0MNQfOFpnEHLU/J1xgpUXLoKHRLwxe2psseH4L6?=
 =?us-ascii?Q?iVWlc9D76AwX4ROewV29BtxsRgdg4EpGlj/fvMYFRIyylZMJ7T21Uz1hfT/J?=
 =?us-ascii?Q?q5IRnfBg3Q51vf6DWSNrVq0vpCFRjc4XfUfHP7pctjNbdukBi7WNlXJGqBbO?=
 =?us-ascii?Q?doA+HwqqPyRZ795zq/7G/yexvBalKpO/vjkN83yB6gXW1abl5+HpFjUsFbti?=
 =?us-ascii?Q?JpzXcQBs9te3BJzhkK0OcVuSMbAkTgIJu+w89JfpSzXZ73L85r7mU7UHoxTD?=
 =?us-ascii?Q?vkEAvBMDjedaEmkYRcXvpxiA/kf9r3PX2tWf+imiXfmvTV0A2sThCvYoMyOU?=
 =?us-ascii?Q?EIBtJ/n3GPmjAlr9sF4co/PYYuFW/TxSKc+u0WAj4zcvhGw+0LNCO8HaPdwS?=
 =?us-ascii?Q?U4Z2IB+wz06Mgr6P0uHFIsCkIKsP+DfOVURBYGlBQgq3p99JlC0xxPBkXXCg?=
 =?us-ascii?Q?i4TMfnXoTxGXtPukLdZrrxMl8Iv6BnRzXWwJeq8cf7iU0RI8/PRFHZVFxzcb?=
 =?us-ascii?Q?s2k3p1XCEgn+2i9tSXGXkIZ2eYcwxZnlIy+JkVFMoQlT+G09PkmzUEYMX0YX?=
 =?us-ascii?Q?wedaoaBc3nZlSX30+a/fZbBkUSqADo/4uNAAv8vzKdGE4Rq3Fw2F9TKUeh9P?=
 =?us-ascii?Q?MxxOAqmr4Ov0dNFRByvh91FI8dd9FurHWNrXcj5fZgQ/vWpdezLbruRMGtjA?=
 =?us-ascii?Q?Vj1mYNzj7s+pwe5FWA/gKt+W8c+Jp8ukaIh4Re2sUZqHxZOadydhFuibrqp7?=
 =?us-ascii?Q?LVcHiaHjU4KniEp5nQDnoGhGS2xs/OWIv3dqNlX30I/vhIYr1Cod7hoeqYjU?=
 =?us-ascii?Q?0W+OLryDYtqsRgh9LoTTqtY4WeKbuE+XOnHk5B1t6kSsVEdU6KRcyCx8+h2l?=
 =?us-ascii?Q?336ctotINcSCFOaJVM3efy48cewROqlBg4EOHxQy7McqR2RtqN+GvgLO0qT8?=
 =?us-ascii?Q?K4g4Za9I4Jul8ekqtIY+1szLB+uxwE3qEFSgttRoZkNCTtuBS/HHqoRDRD31?=
 =?us-ascii?Q?4jmjWY6oR20VPP1Kh294uzZfdaNBlc+OnvOt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5d6UgbV5FfNVDTA5Qzc+rbOK3Ap2FJ9FDA5ViB6ThRuxRJXUhowD/WktI9AO?=
 =?us-ascii?Q?Buc/Gp4XgDrc3f3ZlWTZG2F7XpA7F+Y1BWcdvBo4KVoGuDe7+OjOoZjCC4Cx?=
 =?us-ascii?Q?PShv6NXlFcbP2q2V9feXDmJ6d0gKdrYdvZoY1la+DTte+pj24OjiTT8NkTg4?=
 =?us-ascii?Q?1/oODLplHdQcLWNFrxDyvWE3CI5mHS+8sZtFBUJMEcskLmVpg6iHpbcrquyN?=
 =?us-ascii?Q?WBFt4XdcoeIgL3N9JFB8wl1gDCG7rli0K/Sbf5F6f5pU4eXzceVXaK4XNa66?=
 =?us-ascii?Q?I67D/V3mYDXbjVd6hE2vVfN8k7/spdi6RvDdt0/wjVSIhdGx3ac1FmywUKXY?=
 =?us-ascii?Q?qWWIKQveSiZvna3XTRhPZMYKOUO2rXB4PC63/MAtJrCuFoJVCVYfFITkfzga?=
 =?us-ascii?Q?v1X6BYqtlf+V2yR6BWLaBFvSrMm1JpIHwmH2VmCpwBQj0KSTNO4vTJ2+XBV1?=
 =?us-ascii?Q?gFYlM14EPMRsmjiq6D7eb71tA/aFKCi7X4jl5qcmtPP0EzAojr0M+H5EsSSa?=
 =?us-ascii?Q?4s0fl+FDOXvg02xO8fxeF++UeffKD4qbP2g6htyX5f05yvg+ArnAHrLE//jh?=
 =?us-ascii?Q?kVH6JwFVJ9f3YkccySr9vIgz2FkJOKBQyi5C3doVby23so54ywLAostR6Tt/?=
 =?us-ascii?Q?Amd9f/2dPsvXR2ZRTge0Cx0yPMpmpqFfI/ezCk3CGCfUFh0TkOCp1J3Xew7T?=
 =?us-ascii?Q?jC8sPnW9BTkFhjlmpO1X22OQqQO5A31xjzIxcLMKcu9lw44YUt/1uRSqxISm?=
 =?us-ascii?Q?PLs65lt9fmDkq80xbAII7LuZANrjqHM2p2uEtZDvDOraE3Fck3RXl5kQgw25?=
 =?us-ascii?Q?m+OdJ7MrjnaYAnsVMcljtn6r+ISoBNsaA7QLF6zZztKm2KWs47m3KmMwW/yC?=
 =?us-ascii?Q?8r64y0n3czNTwkGasgIpEl7qKUesx29Fmsy2ISmOhSlXdx8pSn/EaEPUskrP?=
 =?us-ascii?Q?DMAI2DziFHdsE8hl772tfz1fdRijetkOUCnKH+LcN6j4uaq+UjowaO5U0zfy?=
 =?us-ascii?Q?6JQrj5FanFLAgPQTg2JqzLxqydOIyvgl/nlqrxbBQwi8iop1+w6zHYKNCmR8?=
 =?us-ascii?Q?W5trlIxlEHD7rkIJf1JtqACDX4Bx89fOsD8SEFs2R4K+UFEoYKRpKUjkB5Hl?=
 =?us-ascii?Q?UGK0QXxp0b811ICf8iyeZMq2hwMVvMAY8ddvGoNctAvaUq2Oa98B7wnJn4YM?=
 =?us-ascii?Q?vPZ3czcRtzVQLnWr4044Xa7LJEcwHlPbVYPyqxKgOhNnntRWT5CAhwql9F7g?=
 =?us-ascii?Q?+TgtLneHemfnLce8zbqWkGQW4HMGYXluPDPlm6kBMtj4zZy8Ctwyuf4R1KmG?=
 =?us-ascii?Q?IU9kUZP28ilyOcI36bhhEGO5U1rJEnICZhKtf/9/rfXSJfqbGntjx8LSLmZC?=
 =?us-ascii?Q?Z1pymV0JUs5vJGL7XJL3cSlrFEfkqIXxLZPh+1A7b/sTGbBTK2i4ODJxgFOl?=
 =?us-ascii?Q?dV8QU7LkG1SFgfGJHvHiICkCJCARtiYh4PLH/sxuv/slznjoAWRqFIhaZK81?=
 =?us-ascii?Q?ieSRpFHdWgyRiQYrQJ3dnMLZkdyD+YVszc+6bFX8EfQ867MQjil4PQqcV3SO?=
 =?us-ascii?Q?vmq3aF00BgSYBfbpSRWbmLuL4vEd5ZT9RlRc93fPSYoLoHPmBb1LSWPWplX9?=
 =?us-ascii?Q?btVlayFAp5gZ/84TjQjcSvU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ff93d9-67e5-4599-08fb-08de20b90d92
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:10.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5pcdDgfx90eyh+7s0LOv7GVJRgC2X1knxMUM3WPo+p2EpQNzsM8n7QDR41KQeNnXouiDAgJKTPxKXSdfR5prcdjv3beNjs9/7x+DMvsJuKQtijNOexFsqG0xogI2Xkx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/tlv320aic3x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index eea8ca285f8e0..ce22298b43efc 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -163,8 +163,8 @@ EXPORT_SYMBOL_GPL(aic3x_regmap);
 static int snd_soc_dapm_put_volsw_aic3x(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int reg = mc->reg;
@@ -1009,7 +1009,7 @@ static const struct snd_soc_dapm_route intercon_3007[] = {
 static int aic3x_add_widgets(struct snd_soc_component *component)
 {
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (aic3x->model) {
 	case AIC3X_MODEL_3X:
@@ -1449,13 +1449,14 @@ static int aic3x_set_power(struct snd_soc_component *component, int power)
 static int aic3x_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY &&
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY &&
 		    aic3x->master) {
 			/* enable pll */
 			snd_soc_component_update_bits(component, AIC3X_PLL_PROGA_REG,
@@ -1465,7 +1466,7 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_STANDBY:
 		if (!aic3x->power)
 			aic3x_set_power(component, 1);
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE &&
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE &&
 		    aic3x->master) {
 			/* disable pll */
 			snd_soc_component_update_bits(component, AIC3X_PLL_PROGA_REG,
-- 
2.43.0

