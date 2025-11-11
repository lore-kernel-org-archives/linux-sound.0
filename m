Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709A1E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820952; cv=fail; b=nTb6g0BB0easCnN6MYzdLBs7rILop7K1vThsPxcJHhFXYHryGF2e9/0I26No+581m9PEnC6bbze2v8DL3eYFPI095RU9bvAV7cYXfpslqlPv4+0UxN2reiR2SsaLbYVw7Z6sNnDQa9neTp4k4pzm3jCvAFCuuN7B3nHOl7UZGOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820952; c=relaxed/simple;
	bh=zOYQmEnJijd6mYMxCL4VpXbemRvplw1V1I/JiVVNIbs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hHOYk0W0SMf/RCvmrBIqkTxh96LtqW9kJk6EmltiFjTMQi/uQdbPCpnd0J745qDM1/yTgIP5WxDeagxuUTORp1IK7972D9dpj+sM7xhXxQIRo9Ng7MNX1cbX5digGFOanjoWTWl6b3UuJCIVG6P4Wk3oxUZPI3bnEvLr70ShFjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XVYLP9Ym; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XVYLP9Ym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKoWRyZYC9OSpOXqPHnmd6c0IFLnDpcudV3UBn1fYhHKu1XCqy1MdJElT4qADAoYEdrEH1s3G+FxNnVfT55AA/dAKdUhg3i/TQUU3iENBj6gnVlat1W+Uh/F7RAAs4UBGYPApI0P3XBRuTfAhLk6bn05Kzpn17610YjmHio5roUmslSBuadbDbC45aDyeV8Hzik7Iu/qOHmkaFdPAKjGUXhzHS7DGXOId0HEnzaWI9bIw4GpaBxPIZAJRZGMRDOsg59ILxTmUFLb5b9k4SrBORLbc7omEGm1C60rKPhrGYO3b5hv49hN3s8/eRD/atarN1KKkl5MX2MTrtWNf1MVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQdd/7q4AM7P6WyVl+ij0FYqhxIPFsSsavi5XBu3Q5c=;
 b=zGvoDPyd7A5C0GDj6In0ss8pLUWAQWVLUFA9Y7xhLNqWsUZgg/aNNMKiA0SUXo+ZJbvh1Pkpi8RKyLf6ufszJJyqb9YVuq6sOzpuWLLo8O/MEpEJwNC0DIuMUURU38kfFtz6VMRCBEcZAwgdXwJSjy9n8o2Q0udClK6IUtQtu3Vhy3/QQg9CrLiiQaRiGoVkkGsaaVJeCgbcX2ipzEJcPQRIKe0Y4YFDqO5PXmZxW9FHWO83kTfcugiQtaBeSYqF1FVu+ajOjEiXzRx/0YG48ChJymYMBTlw1E5onyMFRj2TuqFE+ORv/rakDaW7dHIzMLT7zVx/3LlHN8jMxZTEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQdd/7q4AM7P6WyVl+ij0FYqhxIPFsSsavi5XBu3Q5c=;
 b=XVYLP9YmAxKQrF7fmcq3Qiq5WIpEdHUSGOEdDZOfBKFlR1m/+hSSZjKDSPRE4stEdmE1EaVjs6CJ0kcoUclalRnxHZQ4Pmc6aA2lftfoQuk9lisT7s4/Ty+nKFmMxb4emyKUH/ZhOznNAjFof2b+Bqu0/o1SSccNSA4+aS0Y7+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:08 +0000
Message-ID: <87jyzxza24.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 169/292] ASoC: codecs: wm8904: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:08 +0000
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0f6342-8c60-472c-c07d-08de20b953e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A6zamPlz0SnIQ/5AUaGgnts8+I+8esqWMxsYxFVljvjjw0miKsV2Smi0r56g?=
 =?us-ascii?Q?sN1ujqu8nq3Ed3phcoxWokFc+3iO4B6Z2+S1AjYp7R5fFfMnimVeDrqZ1Sy7?=
 =?us-ascii?Q?5cxww28/dS4nyRG0Wpea6UwkrUHx2TNReLLgZqhjnGmBfvDh0a9RS759o1Gx?=
 =?us-ascii?Q?q9U9dnxKBHzsV8QtsdqAY8Fn/TQoLubFMznpyxINNNlNZh5AMv+IljSZGbkZ?=
 =?us-ascii?Q?L8PaudlANBwIRpZWorkoIWYNX5dqvbI2LSQpgw5ODl0sJjV4EAZjI68knlnL?=
 =?us-ascii?Q?QEVl2/TaySNIJJdqcmfiMno3l5q+o5w/V1wDDum4YxX4C7wfiejGG/E4m0vY?=
 =?us-ascii?Q?rEUU7cKEScKCCnjzZwZPH9f+GehA9C9fE+iMGWmumYL6WfaUJvTThv2QSKY3?=
 =?us-ascii?Q?RP+5tt3qxRDCLMHirl5JyETWUXnCMS2rlOxvahKy6MlMoojP4BLJbi0YA7CH?=
 =?us-ascii?Q?oGA5YvNFTdfuFK70jYcM8T67duRIppK0alwBH1RBt39R5DkFafNTUfjbQATO?=
 =?us-ascii?Q?BcB/dgL+2i5/un8mspv9C8Yu3aPCk9LVECIB3qQWyCPb7CrzVy6JoOgb9PEu?=
 =?us-ascii?Q?dFWNTwqbEbFmwxO8MCiXONphinsK+pXQEAO7p5x/cj/H160qNwn3zzQPXF5u?=
 =?us-ascii?Q?wbq971LoS1crOJfPct/0rec1QVrRqcBHoEMpBffvcCkqJBuBlPz3mCWcewPx?=
 =?us-ascii?Q?o1JHZBrQpv/QP4U8/K4FKU3es6pOFjHUzwYFBFzSmlH39O7SAoIIUfgy+NYT?=
 =?us-ascii?Q?D6Nv00OcqYB/Izr5zz3eCOjfoKqQCVTTxYRv5Kb4jwpy+Kbb8fvL63LziqEM?=
 =?us-ascii?Q?6lYpWDYbao4Vax3EsOA4CEZFtYDonePaooZQP+jsc61vwttmlFZQzvXMcxVK?=
 =?us-ascii?Q?d7T1YEDka75rHkoN9d1VruFEVcqveJyROB6EqjnA1hX26PnRqZI8EGgyXn9n?=
 =?us-ascii?Q?06AcAyocz/97DefYKiefsgbfgUXUbIWMuUtR+Ydu1R4sHcJpgoo0/4ZXxTh7?=
 =?us-ascii?Q?clR8jsWcbU6bBASdFXk459zw1KhsKfzUC8EmsJLNmS4XAnc3esuvYGDnlwQ6?=
 =?us-ascii?Q?aSKzjec03F4DCfQuc5He4zOK8B6e8FIeFnX6E+xS/9DWwk3hItV9CjrMsTON?=
 =?us-ascii?Q?ysQG+w5bBjaZ43uHsB1xBczS5liLDJ1AbLu3Z+a8Wip1IsQDRgmqO+pjqDpm?=
 =?us-ascii?Q?EVb6lWRxgbPo0xhLEIMPHBTgSGnL9TiNUlLq8HgI5MJmEkU1a6VN6r9XSpwE?=
 =?us-ascii?Q?rvzZMs+v6MYK+3LBYs2A8FFpAs25IFuexCslZqjampWXtRC4ysfWHkbQU+pU?=
 =?us-ascii?Q?0Nfi8PapmCNj3YW7VVNTYRldsaG4gAx3Od1nbojdauxPT0eU+IlURzyRefpM?=
 =?us-ascii?Q?rdBH6QS3J6MEiS2dlyrqA7mt/Ps/vpvZOByCCPNnT8xidmckb+Sy5cYQGeQY?=
 =?us-ascii?Q?rJPCtzk6jDNGGEpHYDSjTspoxiLFv+oGSeA3hcFpfw5bKnrq5ZMb52TXDAJJ?=
 =?us-ascii?Q?ORDrLJNcCaVxZFrDDu6pLm8kPzRsR+mBcPP/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?47KIdXB736/pYcWOeJ82/PT0PpZxYnIklOmDcESbJtCiqOg6TyMCfE3rsJqG?=
 =?us-ascii?Q?kEMbPi0BZ3m5dOD10AgF0LY6/j9MXTakFgxwmS966gdcVdm2uJ10YMlXQowS?=
 =?us-ascii?Q?dZpjawgyqTS2mWcdfyNgY66zZHUTb/uAJLOJqvzGDqM1pFrvf7D+KY3AZSrv?=
 =?us-ascii?Q?hhNMskDRbNEiRUSM+muN8A+0iszCFxaG2UBINg4zV3kwBl3ytrpKchrDr9ip?=
 =?us-ascii?Q?tu2eXy/qwYsgE4RhBcP1h2wsunlN5xwktsarDglEuGwJ+ilRIjIQ7FdNKoaN?=
 =?us-ascii?Q?oAPEdCIQb162W5FemQkLcVaMm5WrfBVP2oSL4qTmoeBJ+kjPu4Ql+KIfgaTp?=
 =?us-ascii?Q?ktJKU1t2zZtRRfytoadPcua3Zl2AHyyKQJbxa26ppoY1TOm/mGkf+1aDIy2Q?=
 =?us-ascii?Q?7t5vOBoLtWBJ/yf5LwUWfBLn5W8nxfh/AmgZsl0/flnV+f12zmH36tlJtWEF?=
 =?us-ascii?Q?LyMm2Nc1ycXC2N99zgznTvZfQ6/pp2wmDNXoNm8ajGNzsGtfljvir/rNprMx?=
 =?us-ascii?Q?Hlk8m5tyV4F3wW9Zhmccp+pUSVum2IwxJq2dZDCoI5gvctoS2jbzDaDRJ9lZ?=
 =?us-ascii?Q?XBvaUJZYgrmqxyk34jvXBzZ49uTqjuevebF/684jTmim5znAC91AEIfx/IPQ?=
 =?us-ascii?Q?M2tZKXNbykU/N0hEPlRbc9AiDh/Khft58WmjkG8S3hjQQxpv7G06SFZObpFj?=
 =?us-ascii?Q?orEBhZ3Xul3vzV2Jbvr+92u8qAaBnoyFHalTQibzf+QHM/24yFV6gLmVCiFl?=
 =?us-ascii?Q?KE+uhGpdsMM6pKnKbXEMwzTbMoQaMQ/fxOiMQREwiZsk0vnfGFTkU44jry74?=
 =?us-ascii?Q?OaBfmSLXlcy+yBX7x8T/pFA6WArrbDSxTA4b6BhUysuivkwXrfQ+jqDX7xDI?=
 =?us-ascii?Q?YsXDZ+uXHkbKiJduhpfUkt8jhTS5DPBMOX40Hho69jE5Hj60wQZTz0DtBPGv?=
 =?us-ascii?Q?XBpGHPg75ETQkzpQl9wvnjWTxo92f8dhZzUPk05b0w6JHWAZxGFAw3/kqqZA?=
 =?us-ascii?Q?v722lU2YQcwx44kyCo9/HTas+pD1SIRfydESHLpg8skAbcXqKwLotJDsvTgQ?=
 =?us-ascii?Q?GSYZci9TPSaf6BEKSFmWMBsafKF2OLRfSpFYvkYJ8LJhwW7yw4gnBzSm+hgg?=
 =?us-ascii?Q?vhL+DGmy6v0Wwki2z3rMpuQ0Th1YxDGfPYaNuexSrnMmCAcpBVfUZG3UVnu8?=
 =?us-ascii?Q?BE/Qc9mlIRQVLORzAIkcflBlnOB2ZrlW+3pJNhdDqT/va1AoWvxd+K0zSgQo?=
 =?us-ascii?Q?rR3slkHBwaeQiUnsHtIHAmqXh4JpNgGt4M2NEj3FUUmEty7CvI+a+r9MXzlA?=
 =?us-ascii?Q?/r4Rf96oka7sxzUQ4zXQ0abHzOEF8ML8pac8ljBmYo0yh6GrGGZJKHsnwB0/?=
 =?us-ascii?Q?3j+bckJFogwEd+QvenSiX0RLZurm9MfyfgJBaS+eqaaMa2oOgn1C5cVWLtSJ?=
 =?us-ascii?Q?yhjuG1oIE7AXNkQzPhhhz4wrd8sB/rTy/HyUqX+MyeMjnVYrWOp2+GYsMXMc?=
 =?us-ascii?Q?BQN+FGJKoGT05S10wo0cYouylxlF56gHc+p2O87HQnASDdIL5Ua039kNVLWN?=
 =?us-ascii?Q?zAA7uhGPJdB6uHc5blPTIYodFrHPuIjN2bmcQYW9aq0TomokseGNTy4VakI9?=
 =?us-ascii?Q?XoWG9rlH+3ICWK5M+F3kGH8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0f6342-8c60-472c-c07d-08de20b953e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:08.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAZ0GzbAOzpqrJD/VFeoizA5Up1T22kz9p9loUfV9GrxQyRYoRfxiepKe4V4M5OBcmTCtVwbfk+d0aZJpDhbd6TKa1OURiYexVSFZRB9i8gFf6g5npVePBpfoZiLHf6R
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
 sound/soc/codecs/wm8904.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index e16b28b722437..4c73a340f25fe 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1246,7 +1246,7 @@ static const struct snd_soc_dapm_route wm8912_intercon[] = {
 static int wm8904_add_widgets(struct snd_soc_component *component)
 {
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_new_controls(dapm, wm8904_core_dapm_widgets,
 				  ARRAY_SIZE(wm8904_core_dapm_widgets));
@@ -1934,6 +1934,7 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1952,7 +1953,7 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8904->supplies),
 						    wm8904->supplies);
 			if (ret != 0) {
@@ -2114,7 +2115,7 @@ static void wm8904_handle_retune_mobile_pdata(struct snd_soc_component *componen
 
 static void wm8904_handle_dmic_pdata(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	struct wm8904_pdata *pdata = wm8904->pdata;
 	unsigned int dmic_src;
@@ -2161,7 +2162,7 @@ static void wm8904_handle_dmic_pdata(struct snd_soc_component *component)
 
 static void wm8904_handle_pdata(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	struct wm8904_pdata *pdata = wm8904->pdata;
 	int ret, i;
-- 
2.43.0

