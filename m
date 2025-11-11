Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43A1A0BE0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820710; cv=fail; b=nnvwV+PK8PtSm4jKiGFAPx7CLscMMGpFR+9+5/q9WBc/9ec80GLKnVs8AIqmSB14cS83IEZAC1Oxdv3iHSnjprIIf1HbWQt98/HhTwhboaZaiFp+yEQSALGvyyJAPfF/eF91hQMuC2yylxsCAp7jHzlW1Vuuw9z035PGU5y4Iks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820710; c=relaxed/simple;
	bh=vlonYX1hxPF8pkyYZF9AerK1p7UJFSIWalYvf5pDhS4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ynw6+AkzjPTd7JxVmmPoPjGNZmkVWp4nazCep6VzOiwsj4DUgiAegTyTsWWc7m6pGMSssT572Y4QqkZJY1xQERw9u8Y5zoHSOeIBF1WaOSaemUDsSEGf5WVH+ZviYCvyyQGStQkznRJTquGIvDjzeNi06SZR+6yEM58Mgn9SGRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CEFMhs2T; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CEFMhs2T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWtsTDlUjDQtabQEjdpLndJB6+5PxjBZA4C0eIZLnNiYJ0jLXNtfbscv+UJrSLl1LhwTGZLfwjhYrJbzRNuxCY1TuQJ+lCIy5b7/63BwiuXIhBdw8J+0qyW79xhy8/BE5e3nPY3/GmvxPWFxgktIz8LT4jJ53ykp8JydqPuCWgQg72bzhZDavRwHuopzxe0exjNHjcrIQM6RSEHky+nrmYwZgb1Zxt6jfDA7wyyls/GH6sN/n6WphmQXqNCJ0/rmkuBot8f0o1GO2Rw9UsplV45svG3eB6gErHoiJULZ99DPzTuXBEmlogjlKgSpJhjABkXuWOlnwJT/Q08dHs06FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0p8eUY1c8xGljm+ZCGx7RWG84Ii0HeBSPWVIUgz5H0=;
 b=CwDslt3bvUAv4ReryDNCHypMV5KRRI4SoPMBHL/Z3nt1wqhqpjx5Wf3d0jzm6jDXK2qfZbdVCf5QhMVKCU4ch1fKqSF59SW6L+R5BuVxliZEsU9tc+Tn0gMA1QSz4slTElt30TSi3lsEq1LwnKOOkNJJLPcZqwnsOVm1ovr0MZlnJHBOgDxWtkfanoon/nbt4iLjScABtAKTMMsWjqmtWj0WYCJxOdtrj5HcR0Mqft1PCEEVl8cZUctyFIqs1OEsB+aWVQWHJawOXDMfFd0S7UnYBUT2AFNFHnSiIgHVBySeIK3Woq1Pd1xsJ6xkUm66AAPW5UjpPTNPhs4R9xUfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0p8eUY1c8xGljm+ZCGx7RWG84Ii0HeBSPWVIUgz5H0=;
 b=CEFMhs2Tf4NgMExu0mhL4mxc01/VX9bbQS8CD+2upTzSnfCZKYC1zy/aC2rTifx+Sjqs3jQ1FKM8ybg4s2Y56pfim6/5d/f/wpfX16tlCuKRNA24OSQumslyrdqUgFUcKSoAEBrcKJ+dPQtsA9BVhScwCTiXktBo3pUeipXnbCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:25:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:03 +0000
Message-ID: <87zf8t2z6o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 108/292] ASoC: codecs: rt5645: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:03 +0000
X-ClientProxiedBy: TY4PR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9eae14-2328-4e08-061d-08de20b8c207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?avCJ3TlqbYc8JC6cYaNvgV6NipwiMSz0Rbm4lUg/nEAHqN9TQ7FBoHJKKxIL?=
 =?us-ascii?Q?cvTX/S7xuAkFH6C58mfXYSQRA/SNK5AZVUXw8hpq1X6J6PiXlPu1nZytlfKw?=
 =?us-ascii?Q?pHvoVpfRzdVV9ZC8P5j14eSKBMljTcckpFcDYskEbRBGhf/99WQYxDZE33ie?=
 =?us-ascii?Q?P2tnOrxTa9XcuN3iMd7kN585CB2dpV+0AK9D4hslA/zBnOUltAw2lrj/LQJ4?=
 =?us-ascii?Q?dur8MiQvf9iDHZpkzxcuv5j4dcFqX1LT5mTxM7N/23CB5xOrDj6fgIOpLF7Z?=
 =?us-ascii?Q?bs5QfuNh5+ep0wrt7/RsZblK1pNojWSFUTwN7zRR9Gejf1RAXUwlsDaCBqr9?=
 =?us-ascii?Q?DyuVOO0sJvOlcQ9+541WdC/mYLYemMK3jZaOuf5+miyITkO0Ccb32MCWjE1t?=
 =?us-ascii?Q?a4LuHIYsMxXHK5ATkj5VtdGwNaMTOGvH2JWM+Dr4Hp+5cwehezvc5Nxbkjaq?=
 =?us-ascii?Q?FPclDMZ/IQnM8VbutrbeG+F/9cyHKPVbn97J8/MJW1w5rIz8oTNU1R4OnPZU?=
 =?us-ascii?Q?6y1cCjA8hpVf7GjFeYj7V951PFvmoVxykJbinEKtFR0psHRLllsePBI9ux5Z?=
 =?us-ascii?Q?ODpOj5KOmGvhx6hAgklJ7FgawiagcJMmSR3dvdGktvqXjpdBtyK56RbXXQKr?=
 =?us-ascii?Q?p7i87L8Ra7+iUQdLlDDmAjMvDjFCjFRky/ZgFLYfO6hGQj7r4KSXldydGZBM?=
 =?us-ascii?Q?4SAS6lyA56zm7qlmS66vmvFi1XztwI7A9TVFwL+yatikxhMPp2eI18fWmsNv?=
 =?us-ascii?Q?5OXyke8qPWmSiaBLvOP7aS4NyXwhoGh0UQ+WbKiTE4ptjwyjvl02KJPRoeGD?=
 =?us-ascii?Q?RxDr7U4K65NCpJs9S8vY33n6KgyeNlehR5TDQSimEogsx4CMMKeij0lXBfe/?=
 =?us-ascii?Q?YZS3B/+5CMePibdbzOl3ZjyBDeiyc5hRfbyrN6lgonqBiJ+Dt7mR5eppW97l?=
 =?us-ascii?Q?3v4apkyUwHR0Ou8kQmihL0NUOf5PUF9lbg/BhtUnS9qFxOpVDLkJYHDudMUw?=
 =?us-ascii?Q?44orsHUNPqae0s/5fHzf5ZMw31eiSD/+743Z7gT7/yr9nd53iucnwGlydCb5?=
 =?us-ascii?Q?44leKJXyrI5FndA+YkQw4oSBIB6RrzGZHoOX37t68YAaXqRz5Eo6ubrmHsnE?=
 =?us-ascii?Q?Fy8ge0LDvLxpeRTKgl5pboR3cpi81hcD9VXthuPYN9nXaBHGRMEyBE0U4ete?=
 =?us-ascii?Q?9gog9Ow1TN4nRoRR2Lb+TUWlakesOHhpPPQ6MM3O0NFUoNhoOBt7OKIOavmM?=
 =?us-ascii?Q?1iG/Ck1fJ8pRDpUyLM/hIEfoEhTOKNcqE9eeWHOU6noJCzd2E9nqsdiYmzxH?=
 =?us-ascii?Q?Qare4qmd6LF0vUYeLXo8MLoNOSGRJ1v9sOSBOeUHzGAtHLEjjvV0z+oCx8Q5?=
 =?us-ascii?Q?2MPexhCHca0GcHGK6NHNay6A3/4G+ZRWrmEAAqw74aAxKMxWHVx8LyxM9r7J?=
 =?us-ascii?Q?lx9iyZdBhmW3acZc08CiFKDpDYmAWxr1cdgsh84C8e5NzgqyuxfsW33KkRpR?=
 =?us-ascii?Q?y/erd1wSScuGWEPygucx+JaHyd6xeGiQQlNr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jlCXaamf6dgBIqSni54ByAXmoFYYZXiVOEvOk96QsVfbrNlV3dlBFhGJW44e?=
 =?us-ascii?Q?uHFzaDfL8b/7Rm0rPwkMRpgJiIg25m/L4x1/ZCNWgtxKsisvaaea2tfEgxHW?=
 =?us-ascii?Q?Jqqt2xhRmG7OUR7OOQe6LBOjfjLR5//ZG2URKA87NL9b1lIrj8MxbnUB9Q5I?=
 =?us-ascii?Q?pLHEZ6Ft3ake9hjmTPWBqMQD/Rt5M8dKFEdgXtFEljqIfQ/vOBHj7P/yrKqs?=
 =?us-ascii?Q?HfDF+oDK3iWRAY+jof/MJbTg1yTagqOVtXnp6P03dUtSOD53xVvI/agTZzNK?=
 =?us-ascii?Q?mioL8zdfhKntyV2TBOojHx0WKI05ZNMoJlO+PIxnrB+Ck5k8CKgIyFig9+Uv?=
 =?us-ascii?Q?7kS+4rDcePpvVSIFBdk1iMk3dML8DeO37Jcq986qv5PbiYcNc9FtxV1YcY6J?=
 =?us-ascii?Q?VbfKneOEmVb4rX00f3ewevq0qxY+dcqkQZjIe/pbLB+MDoIMuBYr3Y4PnI0m?=
 =?us-ascii?Q?yht6Zw64GOVEJE9AS6Ot2Fm6A8Q6XT/WW0ExaES7PF80rgPq2O2GDOxEyKcv?=
 =?us-ascii?Q?faICdDlX76ZvNEr2TH0XWHXCf5Bl3+kZGl9BXA60h5jpIg00qfcEyAX0DSu+?=
 =?us-ascii?Q?J3Ga+IKSZ/Ubzui0xNMx7DPRbXMV0iiEWb4FDNLNENAVePkZw7w/OAi7Nggs?=
 =?us-ascii?Q?ZrPNxPbTI36yrEIj1Bdn9kWOHG/h8hHFTjNMA2rmmmFdLlEoHD7iC8AX/ufS?=
 =?us-ascii?Q?z0+b0NCWGvm0ErJmhdS7PjMJTIJ0dd2AOJWYmKz3pCpvn/CaVGLrnk5OlOL7?=
 =?us-ascii?Q?1L9Zzo7OXgTWHrmyX7lfcoFFAD0iUFDBbweN8Ei2RZpP1bzGh+ZzsBe5buHl?=
 =?us-ascii?Q?E5KBVdanIhcJmyMqC7yKt6HpcedZhnpxkhupRcNgngutxjHmo2cQtfbPIjH9?=
 =?us-ascii?Q?cYz83F+15PUM0JxODIABixDMppVC9SWJPXmM/PEhgYwgy3qrUOgckRu4rxL/?=
 =?us-ascii?Q?JFJ56cfgV7tuJ/ESrd6O2RtkoDEmauBYRi8NgWjvPpYa4jqenlCndyXtl2U3?=
 =?us-ascii?Q?ALH069mMMl2vzG7KlwLWsQ9bP9lAS5s4e6p9GrftzSE5agF0wfk5T1qhKqWK?=
 =?us-ascii?Q?dlUJSsRyKKozN5j2Tsjj3kyUvEKRgmiAXC0HtiJ5kPjI4HOVOBH8HTGAfj7D?=
 =?us-ascii?Q?3eAvObEy29Q43G9+jAOepjTdPmX3nPyGRjdR1MRfplX7tkoe8NUoifzKtLhL?=
 =?us-ascii?Q?lhKq7izqKldC2mRpF09y4lA+gaDO0zNHPiKHH8yEn5tGWSefqsEzu5ve9Ym5?=
 =?us-ascii?Q?VBFuqPVeyPNpRpJtbdy4/kqVD3FciqbxmaPnXJKN0qFikDRDlGmRktLnuRF7?=
 =?us-ascii?Q?nkW5b21IAbvgGwaxQN4u8pEkzMj3MzchTMcK9U13vyM/VIMDaejeozjfFFrE?=
 =?us-ascii?Q?RySQE/XNGh/j1sPXy5IAbrCHGsQXAurmbP3oGmeC13rEyGuHC0u4KbbB0O4w?=
 =?us-ascii?Q?nRBuHvnJ7+9QVPkrB4fNDNGmLzb/oJ1BEkudSjeaRBsu5WUXjOSnR53FndXw?=
 =?us-ascii?Q?Zk3ypv28jPDMYF4zC8n213mz9P3Ll/BcdmFgfUb1uF+6yuXgkBZtmBJAxr7p?=
 =?us-ascii?Q?uhSTUaVA55Q+xq5HezErQWT5h3/rjbbGsIhD/Nd5/KAy2xnTpp6lm3M4Vr5f?=
 =?us-ascii?Q?buYJWMN+zoFZ+HwcgWimCQU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9eae14-2328-4e08-061d-08de20b8c207
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:03.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxFdp1rMNXTMOxCAg4HyJpYA7twbdhSqlaObVxUjVajQKmtBVDAdIq9w1bzEw7DRdJwU6a6TfHuxvOH1tLzlaQA5x760jZ9nY+iMXDgy/sCxcyc0CUG4FXkKwyrCQXyd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt5645.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 29a403526cd9e..f7701b8d0d3c7 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3071,10 +3071,11 @@ static int rt5645_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_update_bits(component, RT5645_PWR_ANLG1,
 				RT5645_PWR_VREF1 | RT5645_PWR_MB |
 				RT5645_PWR_BG | RT5645_PWR_VREF2,
@@ -3099,7 +3100,7 @@ static int rt5645_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5645_PWR_ANLG1,
 			RT5645_PWR_FV1 | RT5645_PWR_FV2,
 			RT5645_PWR_FV1 | RT5645_PWR_FV2);
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_write(component, RT5645_DEPOP_M2, 0x1140);
 			msleep(40);
 			if (rt5645->en_button_func)
@@ -3130,7 +3131,7 @@ static int rt5645_set_bias_level(struct snd_soc_component *component,
 static void rt5645_enable_push_button_irq(struct snd_soc_component *component,
 	bool enable)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	if (enable) {
@@ -3169,7 +3170,7 @@ static void rt5645_enable_push_button_irq(struct snd_soc_component *component,
 
 static int rt5645_jack_detect(struct snd_soc_component *component, int jack_insert)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
 	unsigned int val;
 
@@ -3180,7 +3181,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
 		snd_soc_dapm_force_enable_pin(dapm, "Mic Det Power");
 		snd_soc_dapm_sync(dapm);
-		if (!snd_soc_card_is_instantiated(dapm->card)) {
+		if (!snd_soc_card_is_instantiated(component->card)) {
 			/* Power up necessary bits for JD if dapm is
 			   not ready yet */
 			regmap_update_bits(rt5645->regmap, RT5645_PWR_ANLG1,
@@ -3449,7 +3450,7 @@ static void rt5645_btn_check_callback(struct timer_list *t)
 
 static int rt5645_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
 
 	rt5645->component = component;
@@ -3478,7 +3479,7 @@ static int rt5645_probe(struct snd_soc_component *component)
 		break;
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	/* for JD function */
 	if (rt5645->pdata.jd_mode) {
-- 
2.43.0

