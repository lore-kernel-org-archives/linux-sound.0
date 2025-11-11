Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B223504B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821315; cv=fail; b=XuC9FgIuLvRg9uNvZZkjquj9c8/uwTwxb65VnHKF+7JIANxsSmE9cYoO6s57gZ9GCThIK1oZWKCKGWNtiMmTffDuK7+TRSUfDtLFD0y01gdNbYT9eyYem5dW6fN2GRzsNTsZDKOodt6ixsfeTCqzP0vES7EI0GN8dk/YWPG4Pws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821315; c=relaxed/simple;
	bh=JCpRxwjnBZ70l+khLLIWQV2auGzLDs0qJIli3pdB/nM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XamHcq6mjj/4/pepfWqTYQUEXVRlqrCS7qFupTn9DwLdHazcGjJW6VpX4zf1vueUYBW29+YaNve1hzPw/3f/yXhGIEBEiz9keDURo6ytHlr72BfbR0egI4UTZhUN2XJrbsnBhWHp7wToqVIVevLIE4T77aK9zeeeNcPWewj8NpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ond06dy0; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ond06dy0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjy0TbTSaZ6raXJ8jXVqViuyB9Pw85fWCgdde5SOjtQM1SY21U/rbLQmcwg8Ly21yCcjRcZlVSdpXSQRBsmHicxBXoe95luieni+y/0Sf+hMXI1PU1Z4gUtqe7/McLhab16aB+7ZdKtSzdBpiJMR6tVKpVlEH+aRv/V+yHDrJhhpYp8a1i/iVrRd3EdIThXHKTh2jjMUAT6/CDsip4de1q1oktnZnH/GLu8teXWxxVernIiiRd1QzTXtHw2WyCrvlRQ8UBjJLY8zuytXp50QzSgsVbZbsOkmt+Ujoht4xQN/xkIFN9CAhdIIMr35WRd3GBYr9A/VxJUzC9+aTgZh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQENxpnwuSKE681jzS9dPK+aOJsWH/jp2hrpf6h+sYo=;
 b=KqJbRAmjGmMKRW+4GyWnBP72MI7MjliZRkrDERGzsTPwkOZ03Q5iDhYBDJKymIVo678m3Yy8UCVWLQ3GK1QGQRLmmw9RCxXIUJykAieE82nsbNVHxnabzYexsTvXt/xKV02hkF3cR9Qd7fZhgdXp2gFMbXn5lU7Z1SfiZdZJaVkGOPdjIrvC5Y9WamSoZ9ENlshe4ILDQPf1tagrvT6dk6/nl3bDpWH+WlgK3AipXCxyxVO4dF5C7fG2f7ov9g7jukM9jLd1mAyDXtclndGmikf9q75ZHaCMxCcFPboyGyE1rvtcdVUT/DIKFFX2Aa6o4MI2hWdv9N9D3vpBAeUn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQENxpnwuSKE681jzS9dPK+aOJsWH/jp2hrpf6h+sYo=;
 b=Ond06dy02HBkzen7+B4Z1TOlLLeKrZ8ipbIUkIvRmz9Qk56i+C+ZvYdUuGvQlXEqfa2HGV/Nc/2H0QHGOH7ojPJvmaylONncqO5urK3ARlIIKoslaXbK4KA7iZwXFPz92Cgq+BAV8n+Rr4OLg4kX1g9ITpgRQZFPjMgIW2J7JME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:12 +0000
Message-ID: <871pm5v22o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 257/292] ASoC: sdw_utils: soc_sdw_bridge_cs35l56: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:11 +0000
X-ClientProxiedBy: TYWPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: cd13755e-93bf-4d89-e4a6-08de20ba2cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5D0gVJ1tExIM7sL0choygJ2KkM2bec7CBbydBrYInlJ5K7tKgMA4AuzNG5ij?=
 =?us-ascii?Q?m14Lr59TDURv418oxTsEI9TZIyOg/UQi/RFuMhv62cjP3Bj6O9ZJcv+Knf5n?=
 =?us-ascii?Q?B8RkEswaywY5QE9kcJK00E10SPQr9D01Yh3qP74PlYn4d0syTbNnPF6boNq/?=
 =?us-ascii?Q?fFmZeLo69thPcryg4Z3E3tfcL/b3EhN2owJ3W0DdRq6IPy2QRWEnEaV6gCt/?=
 =?us-ascii?Q?/Az8FtUpLLmvB4IdajjfmD0U+UzSOKwJPUBWx0dAXyrcWw71LkoM3eVCkGaA?=
 =?us-ascii?Q?OMPc4HuQXNvUPEHSjsHD6TkwJuMceo+jE6VdvhRmR4sm+T1Iklf30V/EEFtB?=
 =?us-ascii?Q?fPaQGGBp1kN72orVUtRocB0krw+sUpAkRwawhDCOVZE2G/q7vyN75bM39iwp?=
 =?us-ascii?Q?QZhwQe3g/pv89iwRWaD+4iDsxSqNT1wn+cLsFFr31btmzD7633zUao2wnfed?=
 =?us-ascii?Q?KqTJBcX1CrTJ9NF6ZLHaddFJflX6os1Md2ledHR8xldLwuDowiR1qYI0BASH?=
 =?us-ascii?Q?Cp0r0euCvaw3XOJYHBl6eroJBDLudTrsBKacxd+gp9e2HtAuMcnUpA/gcO05?=
 =?us-ascii?Q?RkJnlO0NmUsqaccmdYaXYUDlCbtabGNekdN7aRm50FCfmsK5jr04EJ1rmcxr?=
 =?us-ascii?Q?CwEcEBwDw/+BpKz7ve9CqVlBXC7f99uaztyg7ckBfKsfQSAz47w4zDQOk8BS?=
 =?us-ascii?Q?Omj1awk6l05R6Zi/yTF9B0Ui8ziATh13wQ/Ags8ucORZ7SejmHjlWOEcY4Nm?=
 =?us-ascii?Q?BeLcSJzJoGXdtfSkQ0VJFlh2Fl90OsqqgcMluY7Vse9FW387vITJDmCKPX5X?=
 =?us-ascii?Q?ivHqlAA8oo1aVmqAxAZNrQySsEpK00t/nKTfl0Dc6zXYlX+2zfqMkKUwq7Fy?=
 =?us-ascii?Q?Ulm6YpApqLaLg3FhaKH9M5BQbr0Pxhwfr7YBcK/f7D1hSintxvBa06GV0lvf?=
 =?us-ascii?Q?gs+K/olVvFeuT09w289umsPnXLmcANuuACnqXZl52vZkTlhcCJwMnz75JLEY?=
 =?us-ascii?Q?3QNNzv7dTOLkWfIOTyvgHUnIjD27joW/F9e1zGfPOn9A9T5l5VZcTl7Oa+xW?=
 =?us-ascii?Q?oK//guWcAkWa5h6KkX0TqsdUEMD2mT0OH2a3NvGKOiOBulSh/pXivpwn1sTF?=
 =?us-ascii?Q?x7LiLW7H535v65drxftyFR6luvNce/cHOv54xicC7GUjY0OAIidME+JJAicF?=
 =?us-ascii?Q?UNZDAbq8Hcd6U+kGfg0YF0r6ia/ovqvY15owXU3JMFk2R6xtubDE732Bv0U9?=
 =?us-ascii?Q?+hU2OJjH+HhL7PyNG7RbFKxpXERgYL/vwAE5JiZRKHa41khoBwO1uoyLfpfU?=
 =?us-ascii?Q?2cQhVx6GDawYKnny6Co1l7R3kxnegkNX8rOxT3b6fRTOeCMe1tKdKkTMzIFK?=
 =?us-ascii?Q?QbNUXx19FUVgfGSTph0l09EAHtR6grYYmLvEfH8zWGCYX+j4iQINwbyyJ5Gt?=
 =?us-ascii?Q?fN9vBxFBevd2G3LUaSXTEeiITO+caNQMg4hM9uoEM/d69bto5Hspl37DBzde?=
 =?us-ascii?Q?0fV43d2ECDHI/1cXlG15w0IuMOLYUFFALKaL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ErJdIW5dg5KEhApyYZ0EfzML3Od2vCPbT31KFALwD9aszI4pXIRVswNzE71?=
 =?us-ascii?Q?E3jnL43q5MZ2FCqAfcZ0WsXxW3F/WywXWOH0AqYBCu3jz5TfekQe8syLj8Ox?=
 =?us-ascii?Q?sy9dirim8F358A/xaZCUatsVPf0J44PiM+9LrNrTn8haPRrl4zTAaIk/nPUP?=
 =?us-ascii?Q?/iqpl5VGvnaRrkMYDzMqpljn1Tm4pE+xESGmGcrZREFoNQ0Ve3SkvCLLfBOf?=
 =?us-ascii?Q?kazNhuXMh5Jg84zzXE1Z/g874Xcvm4hHTQNa1s3vrndGk1NYxjtQ2nzDFQVK?=
 =?us-ascii?Q?X9cigqH8OL16bG1nuiblwkHTDFruxDGZYS/hFV07O5AfYgW6ZHU7EaI/s6F/?=
 =?us-ascii?Q?jRZ84Vp5GHVHtHD4PTwwsiap3v0hVT4HysenDu3JOQf5dftQuWqCxZnx6rqx?=
 =?us-ascii?Q?hkF1fq9AV4TjcDgX2bJws4uRqpG+g0CFBNUvNCxJgTYITLeJ4YCnlF1/vMEd?=
 =?us-ascii?Q?0wiErmrCj6t7TobuqLxRqyrItk2t3wZv1/aJtdVe0ZvolPQULusvkrNYYHMi?=
 =?us-ascii?Q?2yoRmBoIRLqSPKDz5M4jUK3/kQw1l1R+f28a/+PNy78vbcfJHW8K0WUlly+Z?=
 =?us-ascii?Q?IoGo5NJDrlXJ3I2O3o7fDfXXCVhlYdZWJn0Zq07IC6O2uCuFOXFM5C5M/8Co?=
 =?us-ascii?Q?WWlDXbrqHIIAy0zpc3c7FMMHQ+4fQWdkJs8NAvGhtFXxbnmHtOi+NthWlTvp?=
 =?us-ascii?Q?jptqXx4FD/25KhNO7f+z6tBAFbjndefBQeggXCy0DXDRmIitZhKyO/MklOAk?=
 =?us-ascii?Q?F8cITFnk7UMJcF6bqtuD7mztmcgTmbn4CTwyG77Xx/GIkVeE+QXrLtrubsf2?=
 =?us-ascii?Q?89q1WywJHIajiY+uVLdTo16YeDfv1cjVVXFfzIBPg2UfHkO/5NWrkJFh+4eE?=
 =?us-ascii?Q?ghhYZDCO2N14e3uIl0mRJcWB8SXDDGf8dL/zimuVibgOPhI1NUi0xofo5IW6?=
 =?us-ascii?Q?3zCcPQ9ZCDzxOG6WaBhhrboa8NzWV+LR6XzigJ5wXKUg+eRIvNE3MCDT2OvV?=
 =?us-ascii?Q?6p2HC0DT8MsaUmMeMqCo9+TzHVZ7NWdXb+1lDKIXFwryF1xZie+JeNjmO84j?=
 =?us-ascii?Q?1nPThi0ZbZobkNAk2ieKV1B1X7EIOehIlA7uNeUz9vR+63UZ6nV20Q/smLzF?=
 =?us-ascii?Q?URKE5yO/HXEfJqBvteFrEBZw8zbiLlkO5xkVxtwL2Ckwww/PbbPlv+sgAehY?=
 =?us-ascii?Q?7pQZ/lc6H1/rakwBLiRzakZL6AxVDV3c8k6WWQ2sivp9BjLwDAWj2uUgm7Xj?=
 =?us-ascii?Q?AWU83I10457ZptU9NI2HpkDpB56j6fBUb6B2LK35hWZynJHKI3fafrAejzsq?=
 =?us-ascii?Q?JCIxbYbv0B0lTR5e4vKtjxRN+uHDWHU5wh/+bq42LbFL2Cu957GMSpGMWp0f?=
 =?us-ascii?Q?/4qE+9XFlQx5yYZLtDl1/z1I9CpqsIDiR3umqH2+7qI1kNOxPlqF78w1Xsyd?=
 =?us-ascii?Q?RITWtqGlBt8Wpu1Y0KrQ6cq2/1vKc+kfzOjQ9B4wufKq6Y+qX1Y4hzcUTK55?=
 =?us-ascii?Q?5ne4kgezOV8WMZ5b9LPosWaVWALPTQdIyG3p6jQasnRfMQLnWS30JbMyhkAv?=
 =?us-ascii?Q?YEgeTTXY4hJRtF3/o56dnKLC9r0UZ4kHs3YoZ264m1Gi3cExKimgbJzdUsrL?=
 =?us-ascii?Q?scommpSHxbY8S/1Q39agrHU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd13755e-93bf-4d89-e4a6-08de20ba2cc0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:12.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcdbIrA0SDq2caosI8Jj2D5oEEPjbUfRNDontE0MRM1WY9HDIJ8NZm9+fkom1ME3QLNlnssrZ4JUJfXs730VSKikwQw3ZzT35fq4F1kDRqmJoA8p6/R2hQRitGLp5lyO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index c7e55f4433514..2a7109d53cbe3 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -33,6 +33,7 @@ static const char * const bridge_cs35l56_name_prefixes[] = {
 static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int i, ret;
 	unsigned int rx_mask = 3; // ASP RX1, RX2
 	unsigned int tx_mask = 3; // ASP TX1, TX2
@@ -45,14 +46,14 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, bridge_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, bridge_widgets,
 					ARRAY_SIZE(bridge_widgets));
 	if (ret) {
 		dev_err(card->dev, "widgets addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, bridge_map, ARRAY_SIZE(bridge_map));
+	ret = snd_soc_dapm_add_routes(dapm, bridge_map, ARRAY_SIZE(bridge_map));
 	if (ret) {
 		dev_err(card->dev, "map addition failed: %d\n", ret);
 		return ret;
-- 
2.43.0

