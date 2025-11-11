Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6531E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820948; cv=fail; b=TyEd2IEgOxUmJv+6LEcPX0+OGVw+wC67NFls2CSU9mM+n45o04oOI+HvxYfE0ZaCagMR72AP+ppSEH5DyyK5JB9bplEqTfEeVXr3H6Nx9hOluyNCT47Qn6EbPDnua2/K3qm/uMcQpNikhm2Qxfrtuq9foC4eeakTvkoGnFEpJfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820948; c=relaxed/simple;
	bh=JHbVX5W0DlPQ9AdcxU2oVKdHPsLFG9Ea+podGpvKc9k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ssog/lj+LpTRh7FwagYnCqIsJFfdYAd22Qh4nMNDfKC01UhwGOJ2yTJx9ih4BlOzc3Fyjcgn93vwNaPtfapmgxW6oYSfgSVDgzT85VRvwzVIrwghLmL8kzZefGOL3Js2QWZEjyv3QXX716q4fqgJ0Tpe8nyI2Wp6QkMVDIumoN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CxXBjtkB; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CxXBjtkB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWNFucfai3C1CnbBOvLYpNgyC9NXKcfRfqWDt8LoFC5APoCi8+qoLiCUKPGDtA0h/UYEJIHquwz0jkPpQHy+nNa4meLkxcyKer3J+chTPMDK3IX9Eqlvx9dNEtaDsf5Kw2wYqknSGnqJPkb14NpfM8V2cPqIaBz743qlKYRZFmtlZWBItl3Vwpn7T5tsC2oPJDL7JYp59pAM0WppfLAjV2pZPTB7gUr00oT9ARQq9Q9a74uD8AtQuuLNapF0eFMRlWAiFlNNQtaKJzmjmmfY2cgs7isp4Oibt7/qyrMEwd2NeCnaBpz9Vtw2gL2Qi4zHevA6+kJ1SGPmcW2OoJN3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsNFyNIP+bwg3gzlgBSym+CYLHlKDHpi/rcjGWp/tHw=;
 b=VEnZwTikuDhpefPdWnbrcjipSBRlAKgbPXkO/YQb3KcfnQT0UmwJXC4vZLYCa3vo9BU3s5j9aANFE3vGxe3/pZ3n2lfee/rQlwxvJCNGu4YxJSybmCVKpPmMMJm2IbiqzmeDs7duo0p++hhJ6qeJUbzOaCUvmnREQm47tSMwKpylozctDdfk3L9n7nQrNfEODDbRIa4EBMUYcedWNaFhGVXbLNRjPfLn/B0j0M2ndnqLr8SU/9yZcnNKWaIGcLRuFzAXf+CXSI9IOx3vG0cLQXmVaauqdCC9jAhe7vAsF5d8K1omLLPSL60du0BGBDpd7SFsgZWQ3Jmx6PSKmc9jhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsNFyNIP+bwg3gzlgBSym+CYLHlKDHpi/rcjGWp/tHw=;
 b=CxXBjtkBphWzBF5kKKJhnQBzkATiIyW0M/3pve2sXBjqZTl8KgINO1O92U7r18pOsfjbC9E1PGX3KDiy9k/nL6dmssJcYEJe91AiE7iycF+jrMK26tZM2dY4Du+myrFUK1FlCc79cGJ2l8AONOtIMTRLdujGOpz2R8WYvcHlxeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:04 +0000
Message-ID: <87ldkdza27.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 168/292] ASoC: codecs: wm8903: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:04 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ace90f-ab61-4603-82be-08de20b951d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9i//+IV2bxCancx9G7u6FLMfKO+sHOUNGlvF+71FGJG+2aUwpI+Ij0SLO75L?=
 =?us-ascii?Q?f8RXmY+XdtYcUzvjSvVRh+nQSCF8/WxUKkjrZntS5NgwuvdJZFc+44lFra/c?=
 =?us-ascii?Q?cOv0WB84Laax99+ofafMDdvILaVmt5YQ5FHvClUfRAXzHUKdNOHEDsPsuBQ2?=
 =?us-ascii?Q?QqKKy55M173ZcPsu9iRQREFtPkf2QeNLDaxV/9rp1l9AomGE6cTecRsV5DE4?=
 =?us-ascii?Q?rs1ReNG7GFLLGrJ7h1yh15ohW9hpzHDqD4xPHdZEe2eaAHV6XX2/N16nbHSP?=
 =?us-ascii?Q?n4M7JNUaoCBc3nFqB1NjQvZKn67UlKgoLXv498p4lAIkyG22Pqdu32iFt07I?=
 =?us-ascii?Q?ApE8T/8GdfQoPkAd1Bz7TO6LbkY0dOxgYjZHpKjFyZptzau7h8LOgaWfaG9O?=
 =?us-ascii?Q?1qjcEDUHMSZa35sESIbZ+atifsc5NFmzVGpJjLWmj5JLe1RMZANsYXMLOJwY?=
 =?us-ascii?Q?ak0EmUSMt94BjNKjrxk7+jEI/iu/Gzxvx18kcCzbmPUnLFqwWclRMPXh0MvB?=
 =?us-ascii?Q?FuaUXsPkOtWPrQpatfi78f79MSnL+TYYm+22HbCiR+feFwoouJXwQMR4IH2R?=
 =?us-ascii?Q?oDlbOfx/59Nu3InLxmnfNAYTkCnCWJmHRM9sGXtmpM9jNWpghOsOmw5t8Utn?=
 =?us-ascii?Q?IEptRjCVvg70IdKRBE/aVaynKjNGMKno4oukjV2k8km755dusFz4GR10P4e9?=
 =?us-ascii?Q?A4T6b+BRBrpIFeRycN2So3qB6jsFU64d1usm/asvLwg082BGLU+hwnAgqPOU?=
 =?us-ascii?Q?IFuUa7DmrbxCH3ZOzX7l2eHNW6hc4ixiKLA/ldrmPx2HM0hYcdD5sjGXwKEc?=
 =?us-ascii?Q?CkN2fe8OcEqQSRm5Ye1+tIkcNssXvZYgK9gT3lzmgL6QXIc6ae3IcoXita2q?=
 =?us-ascii?Q?2xX56j9FGNJ8KrQj1iPITo66JsjAMFZ785T/cOf5ubDR92F1qTc8CyU/no16?=
 =?us-ascii?Q?zk1N+dM/nkESsw1oAudbU31zuSWiDlFzHwAQAMTNpqbXDecn0+Yfmi4nrbcc?=
 =?us-ascii?Q?K7RuU+W4W2ku7rdWOLXP0+4hal5Y9NGFueDG7k5pHbizN7dqeOgfiAu4jTVx?=
 =?us-ascii?Q?hnjE9H28+ZXaBIE+DD4pcH8CehfOqNs+N399HxrjaIo6OrEfhzSgHxXLh7zM?=
 =?us-ascii?Q?51OacOgF/Q3vKXAQwV/IkrTqxteFGNSfc8m6xJv40zF8aB953oA1O0XJpnkC?=
 =?us-ascii?Q?DCGfV4sJH4ucmGvRz1ywjMz9LGbnOea7mqaw62PyTub6stToiCwnvPwX2r9c?=
 =?us-ascii?Q?+lYPGVRVg9UjSHSpmauf8k4uNOL3DmhpkJ5tF3alYtU2uDu4P3zfkRhpVt93?=
 =?us-ascii?Q?zlzuou3XZ29Ue1P2Z5EFSYtpG4CjrMORu44hCuykKqUzhC3qF/SS4OrtxVZw?=
 =?us-ascii?Q?U5iiHyYOarD7fuQy+B8tsQC7G8OgY3HmOp2y4S7mN6QMnFOgawTfJL4uIF+r?=
 =?us-ascii?Q?YgaLq9CoUWGSrKeDcBdOcOyFKR3QLqKF8RHYEnD0jjHbMpmS6gWwy4u2Wxpf?=
 =?us-ascii?Q?qQpdgrK/0mUoe2Tpiq3kXRSBk66EcpAxKgfm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BvkrvWTXyf5cmhdgIkkyLtGmeLA595AIfoBv7mQ9FSHoK6ulMu8CnEl/03sP?=
 =?us-ascii?Q?f+Cbib1qptWrxlPk6mbI4lMZyCkfcipjd9abXRkr04KzZ6WiNgrvc7UcZ1Fh?=
 =?us-ascii?Q?uiqQbmHUDGsH7IDtx8b850dUYQ4x86Uvqiug8U8k/fTtRavCSUNdsqRJHZBH?=
 =?us-ascii?Q?KIvDzzPSKAl9ck5L23C0mvdMG4hwdJdSqNK2jLtvfbn//qycBkNiPP9ETNJd?=
 =?us-ascii?Q?RUR6IHw3n5RffY86x8Ejw/7bEmX89Qv7C3rStdg2+sX41hGmuvQQ9chNpXHf?=
 =?us-ascii?Q?PI4jrUyJkBqmUh7uEOB0XVNwr+tb5JrtLlNL4MimJ4C7EaVxoDcwPvhO1VTD?=
 =?us-ascii?Q?sg66nffHDmFxG4NIjXyTvAelyPmrzN/n0NPj4f3p8YI+XqKo5hYem319HvQ6?=
 =?us-ascii?Q?wR9OkCl7Z/i9BHj1x/f+3pHuAiwqkaH/CH7CLmVkIFZGriEUsCTRio5EPoWO?=
 =?us-ascii?Q?MLCjqJ301scYRaaTD5o9dYg6Fk5RqkU1YTClsvN9g6OOPFbPl3C6zMw/4NQG?=
 =?us-ascii?Q?NhVD8NHhN2RrVWv9SD6zvwmSqC1x6XlyTrxACv2D6EReDlTZ1FtCo6C/SrYC?=
 =?us-ascii?Q?dn+pd5bjyDh+6ntAlioYcqzRo3u/OLXxVeiOiz3OmpZZbUNLCiT0oG/A+TtO?=
 =?us-ascii?Q?10j3bo9clTgp+sQ68L+RmVrFVsweBKmuy9FUcBIP+F4jor77mRFyLvM0IGre?=
 =?us-ascii?Q?z4GJbKTi06StpFjhyBbMRo4M9PoMyn/D6R993wMa1FwmtCnBmw7dVkCuB7AA?=
 =?us-ascii?Q?hF2hoL6022k2ePV3upBSEQfAEeZ+MYwcsGQmfwHlTaK12lmbN8WQ9zljhoNN?=
 =?us-ascii?Q?lAYcXRYJKwOL376a+OfJW1fK/eyOkvpwUWSA+TzLDp9mpM+P5zmRczr74IKw?=
 =?us-ascii?Q?MAcdmrweY+HLJP51H6M7cMczTZgNxpVUZS4sM24LIz5hBM5ke9YX2QnXvnzY?=
 =?us-ascii?Q?tnILj4gEPBDnkmx1NPC4LfpRWUwDQ02DsgBZiVewzY7BEOcXPfPVPbuckVoI?=
 =?us-ascii?Q?kOYJX42HUm2fSrzNiaYkWMJBEzIAd8Nwrbju5CNGZHDi1TPdfdWicT7DiFqX?=
 =?us-ascii?Q?3H490mbglhkLeqEStVyNSnwuzSJCXHZhYWXJOV/Di5ADVzH95ctZmP2VIQCA?=
 =?us-ascii?Q?rnhc3G5OJH63K2g7g//lRcXLZZKolIjVvJjJtedKfVqFByKT22wWcxy6t6uK?=
 =?us-ascii?Q?w8Gk+0U1AWMdUykyIKRKQkvopLlUUys9reUjGP9nzGOYkeVqGR9YozZCHMLD?=
 =?us-ascii?Q?zHANwf24g9rM7GajP5sDSxMFap4xLET4fCrKxnzwDoIPDOmFbIeGoGmFQTE9?=
 =?us-ascii?Q?J6hF9+ffQFN8eSBRp9UHzgqHuin+OdaNZlhCJ/VZc+emYdwuuhzL/VfTH+RT?=
 =?us-ascii?Q?uq6IL53h/qNgLPavCFczrOs75dBSlZsa1GPTzLvYvu/I/TKkIIXdAk5Oz/hE?=
 =?us-ascii?Q?QlDmsY1g7IfV4FzoVoUNhqSZqUkfBAJ/l8JHcjjO2FCCfpDd9M8Dm0tpDiRj?=
 =?us-ascii?Q?Ng7S5CvFX+S2AzqyltlJb6E14h+SnoeD6+G/BAZXcKgQWRiPuq1flxGJxUXS?=
 =?us-ascii?Q?kSLfiqokb7vjddwn3esQt27wwmeBaPE76uwjabLgwetL1PhtLK3wAgPXQIMu?=
 =?us-ascii?Q?Aa0wbpoow1s6hwSm5dpoAI8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ace90f-ab61-4603-82be-08de20b951d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:04.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6Vm6d9CQq+2GoaBFsmPZUGvtGHEAYGOFBwpz3Fg6LmvJfjEpE8fzw8On8SaFF/Na1H8iUa/oLlgnAWT28UA9HqyATcGis52q7Zocn/A/52kXGFPtufKCTi2VD1uwG5k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8903.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index ff91dd1824e60..f73f6ad06b383 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -369,7 +369,7 @@ static void wm8903_seq_notifier(struct snd_soc_component *component,
 static int wm8903_class_w_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	u16 reg;
 	int ret;
@@ -1099,6 +1099,8 @@ static const struct snd_soc_dapm_route wm8903_intercon[] = {
 static int wm8903_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
@@ -1110,7 +1112,7 @@ static int wm8903_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, WM8903_BIAS_CONTROL_0,
 					    WM8903_POBCTRL | WM8903_ISEL_MASK |
 					    WM8903_STARTUP_BIAS_ENA |
-- 
2.43.0

