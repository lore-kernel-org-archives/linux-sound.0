Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEAA23B609
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821428; cv=fail; b=HBdPFMDIoKcy018TjCnsJD8ABLZaFeZpca9F5Z+9gL2A+nN0H25cKX3T0tT/BTqWBu8BrryV+TC/VELAIgRy/yFvwjHtRT1H8Hwg3DX1nQKk3CtEq2PZIIEpUPyqFpqiD6IJxKoCEtWugKOlhDPWd4yLn2tvLSdftN8yKkIHfLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821428; c=relaxed/simple;
	bh=bwuXi9Q7TKaxapwOjZ+qLvQX14eoRgRAoO26RmPceAs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O+uMoqnkCGsas1Ml/JbRsCsW/0IwtfitTJ7cOkuslVJTqJKQ2gT660bMva7Ymg70qGMw9Jrl28/0285+ZCR8thMkelHivT+tQZmNqs6htwKoy4z3VWQlmiIiwem+eOVKPdBfRF4XBf0DWOgjMTeJA56/jc22JUnPmj5v3vAMGG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FUEwtdSf; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FUEwtdSf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3psqiVdv+omcyCcwAEsH1WJ7s0m8n7zBQ+JMhyHDQgudw0Vap6FfGPjmIOeURKxMeUHlKFpOwUKDjGrnJtEM7hOaXWblPJC1CFIWGPaF7JXyK0aXyxAHmxQsy9gXlsgUIVE0A2RTjKHRjEkgq1rcY6tZ8fa058B8UtvupYSK+5aGQ7I9U9HWT+ZOWDFAh3jAZH2YvYQZJ7FQlvXvCLCPRyBLBwlNUidS3QIZnAA6GxkyZ5WhrMPMV6o/t5ACUQl9AAMhOpL7ERwWHWTuVd3VmOjiYEBK8dhgEHvyyQWUpd3krsx9HhmbwzMefjI3+y4jy8pNhTVleCnQo9qO40h+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nJQGslMpvwaVj7RkSXINsCmkB7+RUVDRpyLpoUqM7I=;
 b=UFHzGZIennQ80ifBEcvuKEUJ4L+mry9jNHZq/UM6GOYH9VwoCACPNfm298ttHXCNK+3tLpM7zXGojsZhqH0JkMaGkYBfCoU+bhHMoW3nucEBc4fSg+2i3zvRrgHY90imiJLMXrvMWQmMA1UoNmsQNB9ldUBYpb9/FH4pg8Z6zF6wdOCeArrG70MjkR7jPTPzrJQqpv/Bcz1fMd+b4r2kaQB+VmLtFyeC2m1+lAANVLPRtBgciRluP8nfiS+eIh9dXj62wN3binijOucFegvakElqJysveffE+9NppwHpXil+v5puNLR6sxlGOR5hfQ29u0JeG2ALKPVFhsLqu0DHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nJQGslMpvwaVj7RkSXINsCmkB7+RUVDRpyLpoUqM7I=;
 b=FUEwtdSfCj+OxmMUqjU8tEGwfkzhjP7OHQaSbBxRRW+HLCiCgCcIH0UVee6/paq2bwxzrvndJ68yl16/9jjYe8nvNpHuO1CcIyrketMmff5D05D2TQqbRaYx1hJXQhozs+arNka0x7uv4kb+HlHW/s//kHYC8Fqfm8nl4M42NKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:37:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:04 +0000
Message-ID: <87v7jhs8uo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 286/292] ASoC: ti: j721e-evm: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:04 +0000
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca39617-a5d9-4a80-6ac3-08de20ba6f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sh8PySyHcSw8toiInIO/GAZJFfo4HUdoIpOZ/2xXihldaQz6kqUabgRhlRUp?=
 =?us-ascii?Q?tT2FTgTnxGK2L58nW59lEPfGAw0eQTndHkIuSIeHq0Wx6d6xzGvHdwkbqU/x?=
 =?us-ascii?Q?ZuXdgU13ySJ5d9xbtMI02aQOyC2UprOP4JGj55pM1Q0l2OL1/0hPOiKnYN/6?=
 =?us-ascii?Q?/JacW57g0GhIa4YQyZ3tm5vGq+kfCv3NwotgoAscqw3NMoBlgGyLoAx4BXUI?=
 =?us-ascii?Q?PZjMGvtT5vcSVkJMTvUxqBaclGGnjrxKszzeenLVfwFoiYCqcMXhaYsvN9zo?=
 =?us-ascii?Q?O6Szp3Qvly9UAkl4s7F6F1IPd79YSobVBbY6Iq5L4kpOJHYm1s/YXNXZsadW?=
 =?us-ascii?Q?fIFHCjmw0RRTjNqyhUUtrEVeDM+JCb7fHlxHOP+Ov9QFxet3++Sj8QOH7bcm?=
 =?us-ascii?Q?l0mP2Zxyz0GjYwy6SUjE7dTiSrXBiKPmA47ICOfYLgGRoWQyL/ZjDzKWq81s?=
 =?us-ascii?Q?D82iU0KrHZbzrTih7eeJl2vdMFPIagnXgU7sVsSomqbLQfiK2utKsd0qZIy3?=
 =?us-ascii?Q?li5Rl98PIjNVkFaViCwWJDboacZ7W9+J002g17QwUloFcNcD/5DJikCYflNW?=
 =?us-ascii?Q?bTdITb/1kuJOBZw8GzNQU5QGIzK8aY3FuokuzC6sNM3Pji520huGvq2ZqdKJ?=
 =?us-ascii?Q?msv4Iy8Tl6b7QIYD1cWJYx2u4p81cbpxnn8W6iffnW2C1ADAcqifgVUWCrIn?=
 =?us-ascii?Q?CsNHbn9y/+M0NmTzFozVpj6IndSfjArv+KOA9vhOU1RT25kfttxVnd11WRdg?=
 =?us-ascii?Q?UicTOEjkKBrMFSrn7SSOXIFMw54gzmp0oA/tIF1JCMCpMet1fUP3plP9Nuo5?=
 =?us-ascii?Q?VuO6W9C9kS2VqjPJt949PCHYs8l0yEL0JI3RBQZKSxTFRWWHSapeS802C56T?=
 =?us-ascii?Q?tVjjsvqVUTaoHaTPU2nhPASTt8WlrzyXZrgqmBPTO+euzZAPyXrR8JzTnZTx?=
 =?us-ascii?Q?nqHAxTT07mHS+UBAmzlcbN83UWTU+uVBxqV9KKdWu4vRjHLO5SCeYCRj1lek?=
 =?us-ascii?Q?tA4RC3QSJRrIW9Y63S+tGcVchz/1i6Dt1GPK2hheWVUcIZBTx8n89/k5l2Yc?=
 =?us-ascii?Q?oRBSCAPPCwxfGJDQ28C7hkCk0glCgohuwlWRhaxavUMwRPArsqZWKeN2aH9o?=
 =?us-ascii?Q?oxZVn0EdmKn+SpK2bAFIcpdD1XSYyyM1NGU2VnPAw9WRZVQG1nBo3QOf8g80?=
 =?us-ascii?Q?68dTzH+QnK0UuEzaAZP2qTwTSry5jKE0Wgu8Xca3JA2d56OK0eCzVm2lE9lf?=
 =?us-ascii?Q?P+FEyyFRKf4OXtWhsZYCeak//0/pvJ+K+Bi3gDbjaWmReWi2gPy/45CC7DrT?=
 =?us-ascii?Q?Xdtxxq75EerSuk3f659f9bWo/oo6bUhFzqCJs6MZVp1SeGuzfltqUmLFC3dQ?=
 =?us-ascii?Q?04pS4T40q5Kx48fHZMvsTj3EEBgsiEpWRayZ/lc8QsXxn72KTwE88z4P/4wO?=
 =?us-ascii?Q?AjUKpqVtxhhk/l8Lm7lyRXQk6wy8F3RXNAA1SlbQS/j1CbtLjrZPFxNncsnU?=
 =?us-ascii?Q?LkF1YHCyUp0nAhUW1iAJvsfb2A+sqXQ6JVQj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rYR8va8dxUL5zezjBpLAMaTv0TeNUk2yc7r0CIz9jc366NjuEcPSNJGzpEHp?=
 =?us-ascii?Q?U6E0JgmtrnSQqrOsG4vpTKGUCnlKg4/3Iuy4tPz04AgqoV1g4BHakC/qCqrJ?=
 =?us-ascii?Q?fkYVrnqIqG9CKipQFs9cV1ZgteRKlmKGB6Tw8U4xMyMlom/QFs60Ahjgrpsb?=
 =?us-ascii?Q?O42rAXI7CEOW7GsMvVhq8iGq+5/KqXMhBVHBiz9Dagkr/l/1SgsOjAofvNCN?=
 =?us-ascii?Q?YQrFN5RQhUKdhpZPTzKSUNV/ZP2ma4uvDVsyOivUdLrMYvsJJveMi2FWrkd7?=
 =?us-ascii?Q?i6ECPnF+1EB9RKbVazdjXaLUGDI3iXMnR/1ikqLQSa/qPfviDhgWiK5EtFwy?=
 =?us-ascii?Q?iRg+TUD4K0JcdxMjMHcur9doRuWQjzFPBEtCmbIn5/zlgs+xxEeMLcG4QiKA?=
 =?us-ascii?Q?vPM+yCEvnIiP3sGf7t17tLK2JdZZ4/s1dneqkas44rYLMEXnjuwm5HUFMPJZ?=
 =?us-ascii?Q?YHdKf72/BXJUieAPVV13TBKYI25ovOSo8VjTkoNu6+lX2pEYRoNzdWBYjI02?=
 =?us-ascii?Q?jeO9ibJVZ5a8/S5TE2SrDMUJDIl7toRLRDOQ9qKSsQ+CUghz88u6nCbmX/xs?=
 =?us-ascii?Q?JEe7ZNEsjSQDW5f1xrPLb+K9S2PZSoNTpHlUR5Pjpg4NJ/goVQZDkTthni0O?=
 =?us-ascii?Q?iUJVsDiXoFDOf50fKtHcNRlx3IBhjZUKhIA8gexdpbda8zf3ODvCqJ0H5ELu?=
 =?us-ascii?Q?nOrG07XbEfPnZ7fqgGwLTMaX2aslI092+BQb1KLKMXcrLW9tod1cQIVlcq/e?=
 =?us-ascii?Q?gHvBKN4Gy0C04HMgqv7hvjLVgRzctZelmeiW2YV+e+mXLL/ui3HJHTfDgoh9?=
 =?us-ascii?Q?BR5MoHnF5+YwSQTml2abg70JLwmNivfa4zlX0K76luEHbW9tnEvgdSqP5GRg?=
 =?us-ascii?Q?yteER7lBbldEltjCfeJIZkJVneM+66GI5rpwQQItSE9SVHTh8QiLVn2Damkz?=
 =?us-ascii?Q?YthWIwwMbJxVw1BOZ5q2dXnSxeNBleIlvHBaEJR+2p8o3iYtyhZ+CTUey45g?=
 =?us-ascii?Q?AysHQdyS8ohTTApxxTQY4o6zoKVdM8PPVtWb3uu1Xq8GsVuTbvcAmlLFXt9q?=
 =?us-ascii?Q?ZEZC06//8M8MFltP0cgCCOrIlF1LbVFprNWiSGIEFNJVJyATPx0oQxTMfUlH?=
 =?us-ascii?Q?hiuys5H38isG/ZWy7PbpFE9aix9NA/AZWD1n4AWtM4mrBZkyw53+ezO7+WVB?=
 =?us-ascii?Q?AOV27EFVnW9tatLkQqGK1cVutaFAcCKJdCx67SYd8AgJtD/PLRK2cH2vhxP1?=
 =?us-ascii?Q?CEB72LYFEWOx2FC3r7u2WDTfxgdOATKhHj+HDjhWxXfDTXE+1D/syG4ZAvGl?=
 =?us-ascii?Q?BjRZ76tOj4u6MEjg/qw2Hn4VZL2IxaW7Tsdxy+Lnnrc37mWqc2lR+u5Plz3n?=
 =?us-ascii?Q?mn3UvLPTZ+VXzSS1w8Whv9Rlg+Vo3QdP+M5hAKMIDo7wdjQt9OLPYyKEnnzi?=
 =?us-ascii?Q?6pxgt4aGzQaPmfg1p+So+MnDCvESW/Ag7Q0hf61plsGQX8hLpuvFSLI9j4/w?=
 =?us-ascii?Q?zn0sjPnculmgqZV7x5UL54RttqQAb7zEN0gpPmAp2gDFXrniFRjFx5w0C8vx?=
 =?us-ascii?Q?fWIc1G37vuNZmuD1ya4F4BrEw14HgmHuAikD2tej0WPcPPqRqObZiRCYmxfe?=
 =?us-ascii?Q?VdhD4eCD22UI/c3bRqgF5bs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca39617-a5d9-4a80-6ac3-08de20ba6f8e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:04.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8POZM+CI7wDjBGT4g0Sk+3KSY+B6V1ZnCSWg4kVwUPDpEEeOzbZHtl0Ej5d0qP/cQ+TiMxRUlQjM4ADm8AiPP/ddVWd3CisP8tDLS3EF0407STWsc0paTngWRhBskXm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 0e7e4ff950b54..faa62c1a9b8e1 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -444,7 +444,7 @@ static int j721e_audio_init(struct snd_soc_pcm_runtime *rtd)
 
 static int j721e_audio_init_ivi(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	snd_soc_dapm_new_controls(dapm, j721e_ivi_codec_a_dapm_widgets,
 				  ARRAY_SIZE(j721e_ivi_codec_a_dapm_widgets));
-- 
2.43.0

