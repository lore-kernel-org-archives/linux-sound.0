Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2120481DD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820257; cv=fail; b=YfMa0ZhA4zLrmWshd87jI3cQA9O+SsYfpC6a+3Tsn0XogNgDmL39uJBLkRa/QW9nXjzVPohC/Qvx2yzMPY45mdKy1QvYlOaQGYOGX1Oeqw1fEiqM0JfQiKGKsO/4m5FsxHkdSc6JnfyUkhz7MGnu1jhJwgVvnMB/xRUN2Bhf+38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820257; c=relaxed/simple;
	bh=os3xVW1JzNhwh269J3BCOnr+qDbYnAn7oixqJjofdoA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pw2mqkxs7hLOqm+aQzBPBNxB/NpMH88k44FGOtJ9oWWnQC9L6kYGVmq3rdU+V06U6egmXEnR/738idYbuLgPFK/ExmzZLKFtYwPPHIbGo0TdO6XKqDGLirKGW7y4o3gYknBAQ975+fLLe7/4VFZgH9jfL33iAYPIysvVvBNPluY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Eto5qIG6; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Eto5qIG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2hF71SZZpPBrcAzcCFN1CiqgbrXDCNxa5hJFJRaYr2gphMtDWy5qnRO0/KYMqBF1irobgGsUp1LI+sq5v/pJjs7Gh3WkCdmGpSKWC7MblUfhFiX8Jv4Cs2tvi5zcZ2iu9SeEqLQtgb5FyWsrZ7lqcls/7mtfbRdUrejOZrCflfpHVt9YgrPUxnaKudGxbXVgo+qDUSSSNDfuKGoI2/fKv8KtHNS0Tuj9+NIohC6iTII4axLHlxessIzHP6Osx935TmaVe/xh3qPKt73topqoWx4SlHTxuxPYuqvWa2p+Qrlrcx1V10A2qQ9yNTz8qIMoFOKtchSaMwKdWDwwbs8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsNrTwiniNiY8WJ9Qv6GsWEmE/tnfZvQ96eKBCR/v9E=;
 b=hStRFWQZrSCcdFM5psGGtaKXfnkmlzxKNYACdDcuLyel6yO6geO3/nt1JwpuOgJDRZC8VkIvA4lyAZDMt9khWeTgafekQmGOc7EmEnnArmIE9jbX+4QUDUsgQIz+YB5r/LLlygqrWb2X7DGIZ4ZXTFqmjSx929Jiw53wpEBX7qo/+q8KLfXK7/5DN1ZPT3bui+XWp7xOkHntPjzKGjx5JnMxTjdoUxVy8B7kk3WR5Vd4wuSkrhlkMJeGP4kyeYhqUsHx8v0HJBocca9UBlU/TIOvx0UYEqV2S7Ky/bTZgJZySo0tQddtroOjP8Ug/4zQij1DixMYKKnYoCebScv4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsNrTwiniNiY8WJ9Qv6GsWEmE/tnfZvQ96eKBCR/v9E=;
 b=Eto5qIG6V2K7gUdXQqOWxQF97hmM3vxctJjDSjAgSdUPycbcN/yderfG+1Zu61BcLuPl1I/QtYdaEMkQMKHWv1gXR4Qy+stU09RpVnFk1HV+WMNytStQ0C5PNJ/NrFNMz6oLXwMFAq2iRXqww/N3Jl6HvPzVgqQzx3MbWGdHJwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:32 +0000
Message-ID: <87a50ta0df.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 002/292] ASoC: arizona-micsupp: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:32 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: be02dcdb-a13f-413f-ea10-08de20b7b53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDS6NtATm0moU//iEieq52L++LDSt47NOoY6dnpYhlF0KktdvbRJSuXJEcVh?=
 =?us-ascii?Q?KGeJ5jyIrpkltCWmjyrvC4O6pEt54Hd4pfkw1n7R9l+MtpxkbLOkA+ioExdV?=
 =?us-ascii?Q?7fFpeqrn8WLHJbRUos/NywrwYZwPezhd0v7n82GZLmXtbeFBUKO3KuZB8J8j?=
 =?us-ascii?Q?f9SNPAiCh0ZIUOpDFlHjQKFP9DxdXSs4/rfzmz9aF0jPEwFDJjisjDTinHgu?=
 =?us-ascii?Q?3tMkKHhXTnmlUygKeumIC5ITTrGz5biwN5pjYDuwHRY0UpOPUaI8ak6oIZYs?=
 =?us-ascii?Q?UPm2mQ1GvWV46XZk5hy+N9YEOnqK/oNDB5qJAINWHZqKJw4A6FG/1d9jEmtC?=
 =?us-ascii?Q?fVXfj1QTyMf5gdG9KRx/KLc82d+C7Q67Ev++ugf7L/yavyV+Bi1/yCEdhuxW?=
 =?us-ascii?Q?WtZwOUO0P6nxo8uvowAszMkKR5WY6/kyYpji9oZKcGJXPIAPhylwjUDSto49?=
 =?us-ascii?Q?JtfVhDB+NcCc8Bjlh4nU5El//bAfgTmbEYwY6LyAXw3dxn43+2Wm6w2qeiqt?=
 =?us-ascii?Q?aoTK+7r7m0uWlEr1HZNJT+tQ3MtmLnds+iOY6o6baqpUbp5t+zlz5oBHWfKP?=
 =?us-ascii?Q?+Ih8twGO1DXLXnl71k0/D7Win4yaPvH5MuwUbs0Gz6v+ORsYd+RCuXm38AXx?=
 =?us-ascii?Q?WbI9Fy0cIwszGJwBIVmc3Pq5Mb6vTyCDXDGVfmlFtY2Jdmcpb4YDH9KjGf7c?=
 =?us-ascii?Q?L61ioMVYM5bTnlJVOMYEDWA77bXSdXZOke/8+sepVLSkTyceRivQVuygnMos?=
 =?us-ascii?Q?Rs000rdO3HYvSjuVYN+yaXr7D2yJSDyp8VI3uMgpiXAvdvcgFdpaDJtAnGJs?=
 =?us-ascii?Q?XVXRSzv/G4uOIbYqEb7p4lNVOexifQATaK0t+TT2NDYSEG9PWyb5Jz7KCHf8?=
 =?us-ascii?Q?wMzIvJxuE8omu4tXxtE5dthFUn9HSby4Aqx3aOF27HDnajrFijwteEtqaSSR?=
 =?us-ascii?Q?BTzeoLXa7oSr0LAagMPKX4/lYTGS+9bfBkvIbiBS4ybZHDUbA89HW45awuQz?=
 =?us-ascii?Q?NOmovZeU5jtm9C9wlfu+/ADF8k4u6PqjH4Pa819foEHByD6ib8tizP2Bhd2A?=
 =?us-ascii?Q?JmYmVx4VfIIOf65g/W0zW2inlA56/5FhKyOplKEkGaOmqXFPkwhkkEA6KJlM?=
 =?us-ascii?Q?cNuXBTrGpUvhFiPdYoLLy0alNufoywcZrNU2RYfuQkWMva0u/dCN/s3H2NNy?=
 =?us-ascii?Q?v2U3/eSRpKuTosSZLtqlTEYchxgntR8dHwOCkV/+3KYiksfRfcy04PvCYscP?=
 =?us-ascii?Q?I9ytOmFMaAo6ndPB+27Tf3mjmSkwDPjCk6Sp9ObckOOreWSLavluus5yKV0a?=
 =?us-ascii?Q?VGPtXdhnHPmIhpwcl8JwKamjaePn+9HW0Lz+UCva02ObWKPnDNhzbX662v/x?=
 =?us-ascii?Q?NWvvPEutgD5h5j21Az49PLVSqZglWRNTwt/BsD9xnTZaFOXHDEHhwMDg7z/I?=
 =?us-ascii?Q?kODdjNeegLdOUuf8ZnZs0sI/f8sLSX2/06vML6OITREcWq5wNeLBdc6hs6oA?=
 =?us-ascii?Q?RnH4XtBb7TDX+Ujh/Ld0I089KUBJMKDNnp9G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2GLpcyjjGYKAVSN6wPHXRpyaq9LzWIPubBPdM4BUkj6KYhEq4AJ6JZJYtIdw?=
 =?us-ascii?Q?jH1pR4j9oujATjJwaNv0ygYvA3dq87BbhgCeFIOmkQDE4jVLL12MyHJLECL0?=
 =?us-ascii?Q?22GsKrGfGrNwRqDE1QeJ+rSn+3vKK9PtJh/+St92Xnm2jYJxE/wAjeUXyUXN?=
 =?us-ascii?Q?1A/E8gW8+mlxl3UPYAQm1tOQoRFZ0FGcUV2GWrGPH3IFiaIFNphCYGpos4KV?=
 =?us-ascii?Q?1UbSZYJ6MkYVmoFkyKyPuq1sbHol8qxUATyee3iAKjkJcpvkT8bVT6QCNS8T?=
 =?us-ascii?Q?Tnn04i6CZNdxq1q/9dVBaonHrnyhS3Wpoj8DnRivcw5a7ICblT2TMKSGG54p?=
 =?us-ascii?Q?9Tdg3wy9tgHWvApy+KWcyC6RtqcemYtciAuFI7cnfYhS8YheKQQ7rC/SqgPN?=
 =?us-ascii?Q?QIqTeZulv0+iJCYzbhy377qZeI+HJTnY1bVFT/1emmaWE/RiEc+cBoxNGsYP?=
 =?us-ascii?Q?lC4xScuhmkrjI8+gkzugNAq7/Q0xPvasCRa7Z9SYeEw9QCvUPDzFEGotGMsl?=
 =?us-ascii?Q?tZ4PauJapnY88ykqmHxt7CpyxhyM11uRKSVzkBF4ezvDS9Kx53xAk5nWeMF9?=
 =?us-ascii?Q?DcmiBbOOdf9EvFk4UHmB9herJu2Jbu2/BFooyIHqQotI7KcgQtaZ0zUBJtvi?=
 =?us-ascii?Q?/LN1olrtlVTFNCWgC/W/PNiRWSBQodiOdpF0APx7okVU4CP4pnpU4BqjbkpK?=
 =?us-ascii?Q?Zn/Ixx7vGih2FmzTyMHKtnP+8qGrZcear1L7xqqRYvnCYtJLCpKn31l/LRo/?=
 =?us-ascii?Q?uCcytC/bb/yHTKkTyMLzci0UWzidZvKU0DXfixd8I4uZUvlCXupXUM9eeAF7?=
 =?us-ascii?Q?i0v2+xMD5a8eXL6I2kSN2ySasU4a2kcmyAjJCUwfDfLV6Rm7IWAUdXsXFdBg?=
 =?us-ascii?Q?jK1OeW8EmDsRzlDZ4G1775xa0CZnp4ECn6x92JLlQEZ+u6aAKmSnQeFDtW7a?=
 =?us-ascii?Q?6vZnTF6zb7btaiuLMFnrBQhbTRJ2HVzkcaTghPBvpQzim43xG5DO3AVdQX9V?=
 =?us-ascii?Q?vaa7rpPSNhfIrANPN7LE4nGPEXACAJrZx5VdiUEmuXSka+PEryImruLwspKw?=
 =?us-ascii?Q?Fc5wN7a4scmVXaKXVncyz3/Xi8wIiraXxhbKgAv1XHmS8h/C1p85xziUYbgD?=
 =?us-ascii?Q?YL5pONw6CTkJcO3Q7ym2uBLCPuBu1Kf6VvwJ+xB+6I6+ZHmTRKXsQmc5mSBD?=
 =?us-ascii?Q?a8qcO+wwkR778l7awh0wFDkr0qAd/fJPz63tdpn7A+bia6qW0PFUHO4n4coZ?=
 =?us-ascii?Q?3akZLRFT1xaii0WAmahQhffsUPaWJSyu9Dt8t1kwdj37brgWKC5LWd9ykJAa?=
 =?us-ascii?Q?VYGH6bC5gH1zKkUI3E1eJiPF695mAx5iUCx/5ZtEicaMsvEmGr9lsyWB8XTu?=
 =?us-ascii?Q?G+qH6Eh2nFxTNGNBcYzFnR71b0BOq0T8VOK9YLV4P/J+Xwz46WjK/fcGki7m?=
 =?us-ascii?Q?rzdb6uf4u5bv8nzA1Xm2mccNvM0fi4qqa0qLDIVamf2D85bSOsNjdIBq1PJC?=
 =?us-ascii?Q?k7vUD+W115FxPpT9ONAoLbRmCZZC5qWKKiAPRua72ZXvTNNi4qQ7vsOtgroA?=
 =?us-ascii?Q?4PXMuCOt7GgK0XSoZOIodfl7OjF6t8WGUUzZ22R/uCa+CdRAtKPCBD7BxHAc?=
 =?us-ascii?Q?XmmbWksMNQ4TDSLsPBHUPd8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be02dcdb-a13f-413f-ea10-08de20b7b53b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:32.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz2LyRGfQkPxVJsCV2KQ7L2xkrQ9KemUnUL0av8XGKgHdsyTegke8wRWIgv4gevj0wfnTsPrO3Dsta/lHyjFFpPelCSru7jzGUG0VQI/BfNS+LfedgnUBXYuy2S9tGXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 drivers/regulator/arizona-micsupp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/arizona-micsupp.c
index e250e5f3fcbcb..be7208bc7409b 100644
--- a/drivers/regulator/arizona-micsupp.c
+++ b/drivers/regulator/arizona-micsupp.c
@@ -48,7 +48,6 @@ static void arizona_micsupp_check_cp(struct work_struct *work)
 	struct arizona_micsupp *micsupp =
 		container_of(work, struct arizona_micsupp, check_cp_work);
 	struct snd_soc_dapm_context *dapm = *micsupp->dapm;
-	struct snd_soc_component *component;
 	const struct regulator_desc *desc = micsupp->desc;
 	unsigned int val;
 	int ret;
@@ -61,14 +60,11 @@ static void arizona_micsupp_check_cp(struct work_struct *work)
 	}
 
 	if (dapm) {
-		component = snd_soc_dapm_to_component(dapm);
-
 		if ((val & (desc->enable_mask | desc->bypass_mask)) ==
 		    desc->enable_mask)
-			snd_soc_component_force_enable_pin(component,
-							   "MICSUPP");
+			snd_soc_dapm_force_enable_pin(dapm, "MICSUPP");
 		else
-			snd_soc_component_disable_pin(component, "MICSUPP");
+			snd_soc_dapm_disable_pin(dapm, "MICSUPP");
 
 		snd_soc_dapm_sync(dapm);
 	}
-- 
2.43.0

