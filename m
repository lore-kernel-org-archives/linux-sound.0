Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54671DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820907; cv=fail; b=FNBCK0ze8DCsvnr8KF8KCsnTWfKTS9kX2UEbwpmmTlR2JwUNZm61+obN/kdPCZRONf/qn0tjkXrDoGFdPKPIyfPotwC8JLPPoq/R+5kwZ2uOTqV0U4NNF9dX5vzExu4z5umooWA+RA+4ynxvKDMIlvzwtcsFO9F9abNntGYekQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820907; c=relaxed/simple;
	bh=GG8tSSL+sS9lZz6W/J7hgtHSwNP68daX5e+PyTsOP9M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lqhI+rhSCZTpD3VNtuzAiOao4YtOsm57aP3z6VANcc3dLR8DDf3dCjTaU/wjaRFKUoii1H3Sta7sFVQ0/bJpwf6UqcKC+K4HdaR6URP0VzrZPrla/OEqmorX9RG0GaggmhnMn4mlTYCWeGLCSX+KOIEXDgBVmgnT2Qh1gCKpYrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RD3j4OUX; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RD3j4OUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWb1/D2kXx0A2ZNgwf0eLpvoH5rMSGf0pIVvsGeCr7TmffBXFKitXrXO6pVz568/hXPt4P0fxlqbio+Crkq9WEeAt2TOPWEhAss07Gc07ZFFOToO8Rc4MDjW9nawKn1LsVFDmiZUS+NTtnw3+bIH9ieOD+ea4pCUNIBzFWwMDA78AYyzBUZPb2kyRFIrCw3AdUPfkIagMUoetxJGFbtQHIVcAnxlxan5U1alt9ABzaM51jTWwv6+rpEjPaHIiHoxYCKYfBfdjvPumjCWrl7gwvokUoTZoKJJVgwZn2mteYaST8hFAgBdR0Eeyq183N6y+0X9cGmbWZVrFS5BN9ksxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDuyYAD2uP22hP5FXo64J3Yf1RQ50eKvgQsKPr7zwQ4=;
 b=sBSDqUoYiIzE6R4v2Nz5FmYHEP997q1vM9nMZD5Hph1V84DitsmGb3Ramp+NNMTgYuZM5OntgQT13FMP+1qEJufqrDgewHNey0n+Styv1m84JQwadwXgJ4CR5QZ4p73lH1yfa7LcPr28rJ16Lq5+ttvd4giKpW2+mAwu5Kqb06dLQ+nUWs7nWn95VaOmbaFUVZxL0qTJNby1D97wfDnp7tL2bh8Ngv9g6sY+L4dqqKDLREdG9yfzbHTCp9kOJtiJ+KofP1EtKNqOkvIeX6Ixg3Kbp+W1ZoOHOgSSozDMtThJ82crcDrscOcuTTBIaXIU6d9RJ37gAX3EW+cNAAN2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDuyYAD2uP22hP5FXo64J3Yf1RQ50eKvgQsKPr7zwQ4=;
 b=RD3j4OUXNohUlujyE5M7Kz6K01zhqHA7w/NMKm9AQNMxP8O/qS0IK9vdwK+YWijaw8FOmDT6OkjEDwQpuwT1Yx9E/sMGaLm/VTKMyePzcTa2JsOKEgaVXWImq2+qkkWYV0ZKm/jlnQk1vB9IhNwUM6+sdX1NgkFccpDpDD2UL1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:24 +0000
Message-ID: <871pm51kgo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 157/292] ASoC: codecs: wm8580: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:23 +0000
X-ClientProxiedBy: TY4P301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 039ac058-3f09-4b3f-311e-08de20b93985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RIs13igSNs9I8AMiGvXpynMBSJBYK1TIdRDhg02XQyRLeBdOHPSLn3FAmWvZ?=
 =?us-ascii?Q?v5kj4sim+MzAM91FVXgzxD4DHEKnMVlar5mwLbQKn8O7Xml3oDdyxhO8KkxF?=
 =?us-ascii?Q?sPOno2Pye65juRi8F8IawPYvpla+27+hOES2ABgRKpgwSgs3vHhgCEKEV03H?=
 =?us-ascii?Q?cGz2feWkaATyTTtpIkQhNt+DX44ygCdoI4LTY1yn1RONU8LzzdEKq6qkXLRv?=
 =?us-ascii?Q?aK1lFnNy9+61wc4dw7elWkOhGjX3WqEiSNXZY8R4n9PThgIrw3dQrNAGjJp1?=
 =?us-ascii?Q?+rjLSW/WLOXys2AVeFTi4WuPuXX4TZLcca/sivt/mPgio6v2vhuowVZ0DJTr?=
 =?us-ascii?Q?CyEnEPaBg52wbhUFCL+MlC9DYPOQIunkuAll852rRlHmwM0daM7YAmgkPfI/?=
 =?us-ascii?Q?bb1KzIYGfyWLDiCFOOL/gvlbk7UDmWcGwlW7+jNk3ePERN9GmEL09c/yEn4F?=
 =?us-ascii?Q?XyMjCVo3jLFbCaUnxZxc/kxq+fBpy/zt2AAaAOqDOF7WiLJczn+9ECnDFfpZ?=
 =?us-ascii?Q?GIOu2oSFHhf8j0M11uStmn5ODbZPH2oAwrsmmRv//g7yo4/g7Y0VRVSR8Etb?=
 =?us-ascii?Q?B/5R0RW2RHnPHMySpqzSIuHAyMkWznuvznTVYY6VroKyNZjeP1P0tYZt/2Cu?=
 =?us-ascii?Q?zthTOcVQnLsYF/HW1opLYWfZ88Zvmn8Q/UDKjYC1YQ6zH5R4x5CeJFu+6SK3?=
 =?us-ascii?Q?6U/eLouh91AkgJTw/rV+g9wvAiJT2eHJrj/ZuKwhWBVDkVLvaGWLCxwojhQx?=
 =?us-ascii?Q?7EiM3NEcHKjRGokzavvzczh8noEtaf7qlfC+XT7SQEIZcHOLvLTdLqVtBaY9?=
 =?us-ascii?Q?b9kqd3suIZbJeVCP4wcytDLEK4KWGZIYWX6/KgFuJ7VFpr1GvnPuO6k8Udkl?=
 =?us-ascii?Q?GM0iubth8HN3peTucw02S2LRRw2O8O8QyY2S3AxbOHClH6lDHOwu9EK3uuct?=
 =?us-ascii?Q?ooavf/1phiDlieCqmljsCQU7CKO9PHu6v9eZ+TT5/Eaaq/5dpfTLlxM3jtRJ?=
 =?us-ascii?Q?/PzKOjmzj921YsZnuuyoeoSpyxEJXRLRN0q1ktSZK8gMv4bV49jc5V8wBoR+?=
 =?us-ascii?Q?+Y+ZrsrPSzXe9/A/QTjOPqFStfZJnmYUReTYpejVNoU5InzfIESWJGz32AKL?=
 =?us-ascii?Q?ms2iRaPk0HiRbD3zNu5fwUsrOZVYEoXEAr6rOn/jdjeVTzmqlKoW07YRYuE6?=
 =?us-ascii?Q?Mmd6FcUyMVwJt+O8k0cV+peSISC4elMFOM+OYQBTVvUfBjA5GJOELdOcWkn/?=
 =?us-ascii?Q?fUlBG9Ug9VwLcxR2lizfMMPu2homP/QxtSxjCy//o/YUo59kCizwJgebbn96?=
 =?us-ascii?Q?ipJ7/Hkq3MBDxblnjbIYPv2z9/6qdDbZreMyxUwal68Q8ywoSSnlYUSOnwbL?=
 =?us-ascii?Q?z/0d4jvj9tXx7vrrCkmCZL3vZqFbcQuCHrQumoekiCs3DvMnRNIFQSeOvaxi?=
 =?us-ascii?Q?EVaO3sxQY9VGeHFitzmLazou/OavLBrlCEAB9G6Oi7Fu4gHYfc1CvJpzZgFV?=
 =?us-ascii?Q?359Wo7Wu7zalUDMqifzsCeBf/4xWAkAyUuZU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p+65RleaOwr8jOWu9JDF7LgeMdi0hYie4ByBisDrLXcuwiv6UU6i/tKr82GD?=
 =?us-ascii?Q?6h0aao6bdEOO1PnJGRHUKFQWB5LsiXpvVOeOAcu16qXmkWYZXQGkvrjT2N+E?=
 =?us-ascii?Q?dKR4T6IEWZUjyvLY7DqvF3d8F2lJe9OthfpJ+l8Ea1o//jDArh37PC9Rf8v1?=
 =?us-ascii?Q?uAfmtBEKzCUXSHQIHjKaADsv+yMM7o55/N7CXDy718wr/rSL/AYMpJnrq4cA?=
 =?us-ascii?Q?bkew0rgGFj+1+8J3Krpa8u2LnHXHHs4Wwh8Ct1RGdYlXtjQ3QR+ZrFG/LWsX?=
 =?us-ascii?Q?+nmkwsoKx2S6s42xPbk0MRYw3FU9fb5p2sQ2e9yhgtzsoHnWUYdDQTG4lLGl?=
 =?us-ascii?Q?kV0PIvGfs0OaZmdw56VWx3qoMDtPGhGDey4rqhly/9RlUuwa79d52pAsW+VE?=
 =?us-ascii?Q?Ajh+p3BdwuHkSpH9PplpUFMSRpqD2mYawXomjVXeA3kywNqH3xRujgErpb0e?=
 =?us-ascii?Q?AZKPgRtBQWguBPQ0AeJUYFSolwQ4wj0N+UYGKBZVZhDLayBNYHwInFrCvkAO?=
 =?us-ascii?Q?mg5mSGvhum3im4wgIxSOSMzCyITYp3uvYae1+0Sv2TWD6DoXnj+yIWgapYOG?=
 =?us-ascii?Q?UJ5Vp9PZ0GW8/P62I5uNKAoeoxTfw1/i/MKQnwwHsvPRk2B+oxvaoVlKUP/S?=
 =?us-ascii?Q?PDsfhzORRc1vAogh1E1wLybxEjT4jKdq1PjuiWwE9gmyVTnF5RZNQzrXFlEZ?=
 =?us-ascii?Q?fAZKchT/Lg/39eHuLOmGUD0Ywubh2gvAnIgCuXXGZV1WjG4X9l7HsGG8Ph34?=
 =?us-ascii?Q?vl++qY3U+uBJouJRp6gFQPBWw7r0Sv+hTNBsjVdQaVaS9O/oHhMS9bKglt0P?=
 =?us-ascii?Q?iyKBlXiOfRV/+6NL6b8gJ6EAl+GzZuAnrWBOyrf8hX35D8uxiqNmsJRT4suK?=
 =?us-ascii?Q?C5iId38y51gj3SuRCSrKBog05BBfHXY6MY8t818a/WE1pva5Epcs9pWAadVC?=
 =?us-ascii?Q?aStCI3G/T37n1C8M7YV1mYJUFAL6S+WEOSt+BGHsAtLGpt4OwHQaVzALOpEV?=
 =?us-ascii?Q?DIU7V0jWrjXCoH652xLyIw2g06jd79PbJpzFSdBzQagYE6PzkO6fCNzInUxX?=
 =?us-ascii?Q?X0t0BZOz3SwdC+X/NXTHKxE8lJQ7mt6bXKMNg12CHTU3GVlQf2rKszHmz8kA?=
 =?us-ascii?Q?9loExVlTbThqf36tEatFbsPwRXZzRfBzhfTpnQTVcYeoPvwAX63vjpxAvJDW?=
 =?us-ascii?Q?cGFKVJ9ZU4DmKKaLXUi8gC5x2H8xUALBj/aP97dEbNDG33T4wHFpSTMczbGH?=
 =?us-ascii?Q?h18Ijopb13vqA8EAxt2erl6TUvruvDWMpCfE5QHRUL1tXIXkbJ7Sfy88oI14?=
 =?us-ascii?Q?r6XOlN/5y48msS6/3KfgWm6bQ2ZEc6Dz9DsOkhqW+7SfKeYd7kx7EHI9WZ1n?=
 =?us-ascii?Q?rwjcUgAVAdNQM5KqOdwbIHPr+6OBetfzr6vrIUGyxPV2f3ZYWaJxJfFyMjjr?=
 =?us-ascii?Q?OjFNbUvw9fE+VyqlrInNVOGljUlbUT515f/yesjdE62KiETvugboil1Yg6jH?=
 =?us-ascii?Q?EzXsJOQ8wuayK1ZOs3GbNmD2GB498rjJnijoRJpDoFoTKvOxmayR89B7oQ59?=
 =?us-ascii?Q?8Fxse9hMwFyum3MHc89X45ETPoBwiL1EJRU4oq7BCaQ7GETnUyukO6rpB+H5?=
 =?us-ascii?Q?ewWhiStJKGX5z8gAZRiXg54=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039ac058-3f09-4b3f-311e-08de20b93985
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:24.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xFQR5pH6+a7QgWjIN0zfG8rXc2MRSUetAGpfMW6VJCoKhQneMK4S45sFvAQHDDsIYn3ULFT3O9k4ULFsktPwRpdg4sJlcgwYkz7xW3hMIbtOAwi4kWuXVUGlvKgmFlh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8580.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index f0cf121b09de1..2be265bb07519 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -820,13 +820,15 @@ static int wm8580_mute(struct snd_soc_dai *codec_dai, int mute, int direction)
 static int wm8580_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Power up and get individual control of the DACs */
 			snd_soc_component_update_bits(component, WM8580_PWRDN1,
 					    WM8580_PWRDN1_PWDN |
@@ -907,7 +909,7 @@ static struct snd_soc_dai_driver wm8580_dai[] = {
 static int wm8580_probe(struct snd_soc_component *component)
 {
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret = 0;
 
 	switch (wm8580->drvdata->num_dacs) {
-- 
2.43.0

