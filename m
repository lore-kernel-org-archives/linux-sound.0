Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F92E149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820496; cv=fail; b=hr3FRF53VsPJLsZ1QUeQ9gZeMmHbyfoLdsFOB6+vlU3qAftI1ZEQejVNdPwJR+7KACaY6nQ/KGRzAaelUeNkFxRHtx0BRFH1/r2TvBXVrJyTIUEKwRFX2lf7TyNgcxJ0hf3CLfVm58nYCSzNUIbjfJ0UaSqL0/TvKmX9hJBcWPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820496; c=relaxed/simple;
	bh=boiody1n3NzLuT22CqqChTFdiII9gEEASbc/BN/czWY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kawr7ZFyB1N7XQ5z/9fC2jJ4JLeQ4qRDnbsdznjOINzleCz8Zxn1LnGPEkWIA9vwhWbdwTgbURUeDvDLSZfI4N2P/TuVCsgos1ObClviUAziGQzXxORdGAIeyF8Ofumpm61NfO9OU+uhgKt128f/ocye0RsoWE3+2E1HUOFlyP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BuTbNAMR; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BuTbNAMR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUnskam87YOM7X0kQp+FcbYU1ORmvIrB5k7fJaZL59NS4vhBw6EXTQknTf6Q67rb+IC1aStgGnH4gSb7p07z14A/JYUj3FloWAOsKk1pCzQ9+JKYJFpbEiHL3mNCqmtrSZrJhpB1yJG0n4q1nVx52ZZTUnHYyrSxUiob343aKoiLR4HZSzwFEsR3XlP6/0qb7LziaMCMm/wIPcA0LjkSl/keS4jLM2y38XQi0MB9mtAYO6ybCwt0WCeS8SIffGZfGQtnWSdcmdHw8BHPhvJ3jDluUJIuMCtKuao2oIoPOgnJGHICFHLU7TKWJHTX9vsbLhnmNI2llAxFtPa/PunYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3j8hC4m6x875HdZh5e9ZmRUMHrY3PJPK/a5hzO+6Tg=;
 b=FEpelbPYc4/QSZKqKr2DsyoUYYkVMndWEpZydFiDpTpB5dG+Jnm6SNqAqfgmyeJFODlAqKFWceQBJPupO/C3IUOU2qec/Z3VQXQqu7wHVEWIyiz/+NKK2qwK6n65IPfb5nHBvsDPLCpzuovkXQ7ow3qMx3mCH+rhfjRwhV/O0RjsQYmQn3odIRVTU1iSe7D3kxrXmgaifU76VKF2uUfI/MMoOWPnuX4ZVrtcZJJsvjr9TguBvMD5wLGN4bJcJoLU7jFJjEWmT+lsO9isQOA9Nx1qCRf5+0xhQyiIvHbJN9/pkdxhG3s2ijNXxqVh5UcsMS9azdAsG+sB9U0L2giJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3j8hC4m6x875HdZh5e9ZmRUMHrY3PJPK/a5hzO+6Tg=;
 b=BuTbNAMRkH/B6o07j455ruodTPU5eQ+OkoGoCyQylgsMVoTrBkT8oOTSIML6A4EVOH/fPLj56iwq2JxozWkq/4rBuINeAo84xo3rhhe6mDBhZCfdbD4LSbCl3d5ZRNzGTPcvAJU+glgxi0pctcmingjFzpMJyKjQ0qTNczJAZ9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:32 +0000
Message-ID: <87a50t771v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 051/292] ASoC: codecs: cs53l30: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:32 +0000
X-ClientProxiedBy: TY4P286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5db6f6-4145-4b02-4bde-08de20b8442f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QMC8u26bVVgwuqWojPSU9/BItwFTnZMrzbeNZRmzbSB6hcydN8yixNj1BqIo?=
 =?us-ascii?Q?+q7So7gP3l4lNlDvVVml5qImJzu1YRrnh3sBM3Afu+YBygL7sVmHc+29jbG7?=
 =?us-ascii?Q?ca+ChuTdr0eVWcxDNqFIzOaoqqslQcR+NNy8KDwiq3a93t+owyGyXXjrFhjF?=
 =?us-ascii?Q?xoU1aY344fRZMCB2uHheY1KIacLXMce1XcoLEeJRIanuxta32/MOcy21ExF+?=
 =?us-ascii?Q?Jc5OecBh2pnpsLEbIBtkS+AvHruK7K3kb+AElswCz5A+q9O4gbokYyLN1Yg4?=
 =?us-ascii?Q?SkRxKAjrKRWxfUSaeZ5Z5gSvpIUZEOXVGRfCoNrwIhMzDNxDAlOVRRxNoJPt?=
 =?us-ascii?Q?LOkIdYX3HnmyMwsqgMFPM15Qb7b/H8lvz5o+nQ4A0IRE3YwnUZI4JFhflkKS?=
 =?us-ascii?Q?zryRbMoqXQycNl/P1QuYqZtWfROtMHKvVdyywjBzmM/+pmF2olDmgeJYA+J9?=
 =?us-ascii?Q?lHGPYpPiiJHTCt27dIeb+nDP6b0ba7MLFnwtcshdEIENHA3pr0HflKosZR1E?=
 =?us-ascii?Q?ivEa8GdCxN9azTZxl7qEcN83D/vnq+bhKq5IuyC0SCEeBh3b1hdnzGeIgFyw?=
 =?us-ascii?Q?7w0Rdcnsrrk7eTbKGQpGXXTR6YtesSubzTkcgNKW3gF8KrmiK3OvD+6k+o+f?=
 =?us-ascii?Q?fU7uaSoFjshpRYwNB0ICfoS/tUfQ4WdiM5HlJsTmMFMgpQyU446EFI/C19WP?=
 =?us-ascii?Q?PliOTS5hrJa7HVGZgpS3Fr95RcZ/bJ1kMoygk4A57rn6QWbyT6l7ziPPhst4?=
 =?us-ascii?Q?JFAU51Dk9HcVfBUA8fLYy0STN9nICbSlRz61qL6I+YHtBpdjpyoqG9AO5K/o?=
 =?us-ascii?Q?GbbtibHRBxRaQ4w1gMc+UUrr+kqSn9repUAikNITpL0hXvOJB8KTYb+VFVBJ?=
 =?us-ascii?Q?tkrnnYKRV0cZqu6fmdNsLRbjWxnqB3zBCkAUKGr1wMBIi4lU9OnW0GdZ/qjQ?=
 =?us-ascii?Q?TJT/xpLUeqzVc3B97MfMdn1QZ139ZNawyMG+dfy+XzaMlByTDiNOOTe0ihbL?=
 =?us-ascii?Q?lx3ideZryextwb6BWOPxu0fdjVdaPUXDX1lSciORQiRWA55jjYH95v5ExXwA?=
 =?us-ascii?Q?saUffrPhRvQtg3i8E+Yz1+tObRhihbksi9WzUt/EH3UsaVg4cifcWVvZKOwD?=
 =?us-ascii?Q?Y+X5GUDOs1FMU/BtwrE7LZoKujDZFoh2iRNKwnc0D1wj5xLYm3BiHM2NQTcT?=
 =?us-ascii?Q?xV9dzx7vYGo83vKCi+BxJCK8ENROkk3ktkoUntP2Hmq0fvex4aRGFnizqvlZ?=
 =?us-ascii?Q?eWFIBc1hzwDP8VJob+1Iy9DWHetQgSItv7I/CDIs2mFicaLi4OnviTUdpAyK?=
 =?us-ascii?Q?6J8Ul1GtuANKC3CxJawnbKq4Vd9HrbfNtjgeA2yuRIue7/5kz0f/2MT+/G47?=
 =?us-ascii?Q?ciD4VK8y1jvybQDF0jlJ+9+7xkZbdcnCNh5iUNd39aOB9bQj4Pc9ykRFSvZr?=
 =?us-ascii?Q?v/HR9DCF8gE+mVcGTtOXzumfHVs9TPgN7LO7hnKOvx38doFT74fIDsJ70e+A?=
 =?us-ascii?Q?kpDc51csTiPtBe3PhRlod6A8M4hwCGAJ/zG2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AxI727ltiOUxpa3GrL63ePy9O5SyO7RJfiYbCC8M7SxzB4iQ9bq7FJ6M9mhc?=
 =?us-ascii?Q?w6LCdd6V/ydjP/hQjIlhB5vdBripBGYoiwl5Ct3zhXZ9NYfRV/zG0upixCS/?=
 =?us-ascii?Q?04YtpBiBRkZxwMLsPmjbUDaLkF6a4HwGCFlU5zTOFtNoCLeiAo9v1bk1AWT3?=
 =?us-ascii?Q?k8O8wyC4ekjL2t22jHisusrPSFuUuWAHr4A1ymztLw7JhqW+U74ufmTALhm/?=
 =?us-ascii?Q?Yo4NWtbZZr0UFrwx5eun1qUcx0MovnBIga2pJBLiMBvOvzUo91Jmc2G8fI+U?=
 =?us-ascii?Q?5BofRjQOltsy3z+u1r6aibA9Z5eVngow/bfw7QMbf+AzLk0ZesGBhpk4N0Ea?=
 =?us-ascii?Q?7WOxlEZDHUpLh5wMfNSZKgw5Hrmaqic6q9Zisv/tz6RRNQk89LWry/hG+uve?=
 =?us-ascii?Q?3Uosz7X8NcyB2jiHC/VtpCvpnxZUUnXm440avaniuC8+AaaZaI4ZmNKYPpyh?=
 =?us-ascii?Q?C47f45EHpKfeRpvNIT3oUPtC6DcIdChy5GIMy2qjJoXr8vdvy40kLNYJ9itB?=
 =?us-ascii?Q?mc2SZ7gvUJhR8MjAlNr9dkC0H9vs+9fGZGAhOPIOoRmtVS7u7ysmpOxOQUgt?=
 =?us-ascii?Q?gFsmYJ3Zm1MlnfoA8zOtd2WXhDpx8LDaR0vpP2DTDhkwf8hDh9YYmlb2lkcn?=
 =?us-ascii?Q?qR/qnU1NTF/9qftynd0eUyMiA2iGLOSFtWozGEdeeFTg/d+qv5/mR5MlQu/a?=
 =?us-ascii?Q?StKc/atlPAOQxGqlt0XnUJskK6Q128EuoHKPPI8Wbebd0wU2L8vx+xL6ogU6?=
 =?us-ascii?Q?hW5X9BrcdrcbKRMnoT2DeEnHbyjjfpLZgG+EIGlo5JK/NrIy5tFi76Hz+DF2?=
 =?us-ascii?Q?XuBdr9Vt/tBiLaaKBBwxh+fMbEwJClYQTTtz4SNQnAtNfbPWos9I52fM5etg?=
 =?us-ascii?Q?41XTZ/Ty9saW3gRSbRAJg0fuaHCh9C8Ohc2KFF+tnn89b0E1h5CFKBCyyewI?=
 =?us-ascii?Q?mhfj2hKrnyuMBGN+sWhyeAzIJNa9JgE9OVM8IR59JnIzGI8tngcbpX6V+lPD?=
 =?us-ascii?Q?gPE+8tNURQ/cKS9BaKmnmnRl9tC45q/JkUnnaPR3PjhG4COnFHvOYQEwdCBc?=
 =?us-ascii?Q?m4dQ1jej03dvPwku86a9ffJNYeFg8s+12aHvf55/Ox4lwrBahKuKK6HMQNLK?=
 =?us-ascii?Q?s+Fr+iZ68MxltgzWl0sBRjJcK4C4UCuD6AzNhQ/chHv7yiolb/65bxBRYuWu?=
 =?us-ascii?Q?vH66diRn/2LMMw17mM5hmtowWTl4XqEXbcW/tJLq0iEUNoYMkqpuMTfayT8X?=
 =?us-ascii?Q?7wYhTAeGQFdfqbQDZDCgKMJxlh9XVW82xFhsDJbD1dSUuRSHOR6hk5igccbJ?=
 =?us-ascii?Q?k+ozv04fQezw8alUzEIkA2eR5+/K3h3YZLJ8LLcwSy+lQ54ixSSxFULenVEp?=
 =?us-ascii?Q?lPb4qAcZQr0vYvQlAl4IWXtatIe2C910GFSbuEJP7rlr+WbjZF3Z/LHIR3mf?=
 =?us-ascii?Q?1UjYS/KwkHo5f71FP9OcQ8MWBtE7in9rBZ21XJYDmtxgEJZuPizYep7k+s9N?=
 =?us-ascii?Q?phpZwIX/iGU9I/+jrA+CEo5ZGE/L6Z6WZEFT7oogJIzQI/nhjKpHte1dz+Hh?=
 =?us-ascii?Q?b+MvZAuDO+9iplmPRTB5E3sHmtxcjBoqTEoM98ZqnwSsc/Y6WHbrJev7q1m8?=
 =?us-ascii?Q?yZYMCPF92SlG1S1M1DXO4aU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5db6f6-4145-4b02-4bde-08de20b8442f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:32.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnY4oJnSkxbuSmNX9YfWrxLv/HdhvUJS63e26ZoL3uxcYAaX2iCU/SXNbZm67rdWlTNHJjw+Pl5pEARR59/eflofdJ/sCB94dsl+QgGCbyTzgBGYWGUji/LhJocYrT1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/cs53l30.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 61bf72681674c..93ea2fb4dae93 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -649,8 +649,9 @@ static int cs53l30_pcm_hw_params(struct snd_pcm_substream *substream,
 static int cs53l30_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs53l30_private *priv = snd_soc_component_get_drvdata(component);
+	enum snd_soc_bias_level bias_level = snd_soc_dapm_get_bias_level(dapm);
 	unsigned int reg;
 	int i, inter_max_check, ret;
 
@@ -658,12 +659,12 @@ static int cs53l30_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_ON:
 		break;
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY)
+		if (bias_level == SND_SOC_BIAS_STANDBY)
 			regmap_update_bits(priv->regmap, CS53L30_PWRCTL,
 					   CS53L30_PDN_LP_MASK, 0);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (dapm->bias_level == SND_SOC_BIAS_OFF) {
+		if (bias_level == SND_SOC_BIAS_OFF) {
 			ret = clk_prepare_enable(priv->mclk);
 			if (ret) {
 				dev_err(component->dev,
@@ -857,7 +858,7 @@ static struct snd_soc_dai_driver cs53l30_dai = {
 static int cs53l30_component_probe(struct snd_soc_component *component)
 {
 	struct cs53l30_private *priv = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (priv->use_sdout2)
 		snd_soc_dapm_add_routes(dapm, cs53l30_dapm_routes_sdout2,
-- 
2.43.0

