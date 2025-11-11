Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7830121FF35
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821175; cv=fail; b=ECr5JFq57sgYyZpb2hgRsybYbAOOLIyhgVNKHoReJsUrjYwgAZAChUKB3itX3ZralwANxwlI/gk9s77Oq+oae72r2ZfMsWA64Su3sZvYUiB4kWv38aRMIP/yDurL/9mTSE0GvD0BQKmJYyXbuv9GdoEOOcE/FcraLvd4nr4dqwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821175; c=relaxed/simple;
	bh=7ELalCPhQyCKy3hpVdEKgSbAL1y3jRIRh2qAHgmuvCQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EXhhpm98/nvMr+ocmyYpXzXcTgOznZ0QaEv38VcwHV5PfZIM4//OYmaBmjEGSW0wmvMhCL3jOj4tb7T6ppPRfOxb03gKYgZtcTKTIH4cX+2fF3cZspwXsULcfHk6xd5mWxWhwsrE/fq0i63OBaB4w89gPPOt5WjMQRjTb+ObpPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HgRGerMV; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HgRGerMV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+QbromNAezfnPeV2scBXg7mMNIPbg91RutWS4zNxfJcXQD+1EUa/725UHCD/QCIfJmSs3QcqVvsxckrlEQU4kHwdeSqYT6x8g5YYIWGdg4dhiOtkIN7zWL80Rvs/V18PxgXF7wjka0BZglRlch4fy6Xtwv/Cu9wiBNP96ez3K42J23wc52hobLk64PxnqbL/hpdlQQDME0oH10nZlv0XlVm4yc7Dd6bEuWVbNnCqQ89tNMBeEKJwiAnJGXaWpLOn88wwgK9fQAiE5pZtsBEMSMqGiXJazUD+CQJTirtJgJVOh3JeUxp+k+FTS2K8AbW+VBwEjvGaqz0Az6CsQaVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoA5G1BzNs9u9Vyub/GU/Ws0jzFYLp4QBrwttENrYhU=;
 b=sEix54vgjm1ay7ncqQQ9llSqTnYZepsbDi24JbpMwGK1yDRskzhpM5kzzErIBXEc/kP9kAXep47kRm8sbeECrwrz476CE94soOwfOhMY9dvAcleH3OGrIY17hLK73jR6xtWlnqf/G1b8DS/j7MCuPWWHZHzHdOxYYwnS847hi2l15mP3OApLFbftyqgvO7Fvu/umXroPJuLYWH05+YB1WkuzlsIxVlFDExEdR4O6kHUvirnRY8lYMqrPOD+AzUNkV2YDE3hvkhEOKPtQDT8rfzhX2PSwDdAKSdYXrXQiwpVNeNF4tPDp3lPdG2YHoDIaiu1jo4uMAxy7QU2RBQ5OTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoA5G1BzNs9u9Vyub/GU/Ws0jzFYLp4QBrwttENrYhU=;
 b=HgRGerMVBUDJv3nMUTK7BRoGwFUyN/fs4RK0600f4zcOSm+DVITfMQzY+Yfh56V2hB4ElzdoO/e/Y9u/oQLKkTvR6upbP8b/KV2ARR2iIg8feZsTX97icf7wJcQ4jeTWYCC9VIYOC2oXI1iWrLnZwF+l+y2vIBSl41rJUfFvLP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:42 +0000
Message-ID: <87pl9pwgra.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 215/292] ASoC: intel: boards: cht_bsw_rt5672: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:41 +0000
X-ClientProxiedBy: TY4P286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: d37040f6-b68e-4f6f-5d50-08de20b9d34a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PzAogCcBaP+n5ezSuf5TEEkAiZHJRWC/QiWO9X2mJqDIpPfxiEIj1wWSfzeU?=
 =?us-ascii?Q?IkZTADjxzLdfzBENTK2fH8rVo4bMS/0e3r0hfK8uB/Ewpvm0FjQJbOPQJ5l0?=
 =?us-ascii?Q?ZeTB2/SnUVMm7V5A4g6vAhp4+luOcm4A/nGPFCe4VDmxgiOpSF6a2CON7wAe?=
 =?us-ascii?Q?uf/ONH7hU8fNEZllmoZEYo4nE2bgUhJiV7vmCNFMXqWX3GForJXB4kYs8AgV?=
 =?us-ascii?Q?tI9JVkRs+kgnDY5VzOas7xISSyoy3FF0zU3ltUi3FOf7FjtnBfTH13hxME4L?=
 =?us-ascii?Q?aSeb/J8Ci2oRngI8KVBbe9nlkRrDpy/s16khwwz3xqLBX9n5f4bZ957ov5Rk?=
 =?us-ascii?Q?BY0tkZelpyHUkOUCTMqFePiOm3LaZhoXyPeGDr++3g1lSHdaBvMU3pRdmdv1?=
 =?us-ascii?Q?1kWzaHG2VDhqV8yXgdfZjAhP/qRaEZUwEivn5q5LvIkfTdUci/gDIH+zZbBa?=
 =?us-ascii?Q?ePU+X3XeQNtwlNKLQSUvomGPmtfg0g07FcmLBpHQ62Ok3SVgim5T9awcC695?=
 =?us-ascii?Q?8nTF/V6L0KeXHA9q8vFSSfpPD1xTqYcdtyRpAbnK9hUH0+veFpVrIMSmEJuw?=
 =?us-ascii?Q?pfEZsrOiyt2ktV6yF5H/25sp9jjx5Qr2tIOow4r55a5jS46vLpQNE65t7/Dk?=
 =?us-ascii?Q?HcRPNhxQg+Ci0dopc2AOyhUdE46as5fIUPcZLuotPGwII/Zoy4WkyrL2UMHm?=
 =?us-ascii?Q?QCqJ5GwGKs29tdrkNNV+FvvJNofAsl9hol+zA9ngWkzgzDS2XrvJFlHgMM9f?=
 =?us-ascii?Q?l0fV6eX//L7vmkG9pfweZlQW1sdnXtUW76UfXf440WDxumHmVc9R3XILfbx5?=
 =?us-ascii?Q?zQBrNzj/KjeHe3kCUSdyzV77EV4Lhl4bQBW/ZR8BY9p3Rrn8/ODgp9LKvfMt?=
 =?us-ascii?Q?Kv/4+74yrIrIX0JyXA5fOXUzoNaQg+cccKeBaugeAZv+kHSk12qM6zbpd10K?=
 =?us-ascii?Q?abPTXnoal9tAvEbTEvZsU1/X76L5S/R+f/68E1fYUlnhCgjsJQI13a7GP6AJ?=
 =?us-ascii?Q?G8mXUy1LDNIvTSDobze1C7jtFcfQauPAtPpThNGKMjCfl6A9TWO1mmy2N+zH?=
 =?us-ascii?Q?LJYTIp7dQLTkDQVuj2txPGvyInESSRPIAG9cPMeJP4KZuA5be3iEg9fgMXN+?=
 =?us-ascii?Q?ZlA/51ZRZiWKteG3q7Pa/tgtciclte9oCJ0QV3Vk86yFjm41vFZ1iUAxpLOd?=
 =?us-ascii?Q?pnPoIlT8Q9pq7NXqKR+3qxgTHIwYWz76xcaycYkAKxHr3B7CWuasYCa94FtP?=
 =?us-ascii?Q?8gIufs/ATRXt8pZccht09pcoOV4XtfGgKq+USdACauhyDpsV5+KsxVXpG5y1?=
 =?us-ascii?Q?r07yw9Qsw+stSdEcUpkCGvmtQmU2PIxvOVptr7hRvkd4QFvgeu0LJmmsmWpr?=
 =?us-ascii?Q?jzfe7JHdAMXfVTuQEEc8G2mCafORKeiKyBzsm9PGsgEM6yZb+ts2novXhR/C?=
 =?us-ascii?Q?7MIi9IJQxzTDRTS+02o9FKlnNUWuTJvbDe84Q2ckCRH8wWSx5tm1Cpy/BKXw?=
 =?us-ascii?Q?djhelQkonars7TdLZP01F1M5BYfqFPHMTigA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RrPtNYhNpGQsQpZpKK0wvqC/3t0cHWwgNfcnxv3lozp0bA0+MzI+AUVnoekG?=
 =?us-ascii?Q?hhTjXa/hE+cEM3bvbpr3PylLES59HwIZ2DO1vo2fph1IgH8y+h6AtS+nYbB/?=
 =?us-ascii?Q?xcG3YhjiNhBip4Q3q74s6Cey/8iYcWZFJl3k4kpY3BZ9iT4pHblefjV5XCd2?=
 =?us-ascii?Q?7Vtw+Cj/pCca4obd10ZJ2M5GDrfygs5n2bV5Im/0INiqhH/dxeTb9ZFYoTkN?=
 =?us-ascii?Q?jIUWOXvWLWzPQ5ub5/e8LO+l6iGqcfy+dx2VrngMXZmh53jEPh6XNLTyB0RC?=
 =?us-ascii?Q?C5NI2AaJjeFPfxcqJF5pf0PIf6vhUmgDM2/AhXCmnZIxJZw67hSPbhvqs3D8?=
 =?us-ascii?Q?AT02EV4tXWMEetctIGAxkBVr6vtezGcE0MlwzQYo0wPLO6bmAyFBi+7b0QRT?=
 =?us-ascii?Q?UbyZV1eqoi3PXuQIxtiCW3HTGCfV6sfY3fG279COUyMCCUjRV6rNbRU4DtxH?=
 =?us-ascii?Q?UzZlSoW+okIDY8AB/y6SCCCED8IqAUbYsaAWT61JsbUodXh8tlD8UPZ5B8kD?=
 =?us-ascii?Q?U7jF5p6HkoBl93HV5RGjtOL4XvG0ngB6UZ/fV0pfqOgDgOCk1EPItjZoSDJt?=
 =?us-ascii?Q?BTwx4Iq5otTJbX/XRrcHtk8+8RXHmQf6wdRIOqWMNqMHe1NZA7OSe9BhPStM?=
 =?us-ascii?Q?XWICyIigduca9gudTaTC7qt0F+AdSuyor976kBAx+6CDL4Q73wNRGgz1PYa7?=
 =?us-ascii?Q?8iAFKFz/Ac6edCRMFLus1X8lvhxK9neO/ckzBgIEMJdu5MQATaJQMzeOfRnH?=
 =?us-ascii?Q?0z2IIsc+0EmX5QXv7oNbrhMQzmlYhzCDeT34ud7KwqZaxGJiDxkuskicjaSf?=
 =?us-ascii?Q?4aRjb9lRV5/gzW27GiJ3SdzdIoZG2U60h8cbiVOyb4TVznLqHH6PwYUObwXX?=
 =?us-ascii?Q?KmJWs6KMW06XggACDmsQlW2JntxEzVlsI9tRWAW87k0gH7g7XgkI5OFR1AHD?=
 =?us-ascii?Q?IxWC1VKM5wpfquxBpkJmA9NbbBMIb5Wb/m+PtQCoqjQlYhrqOIuev04g9CZr?=
 =?us-ascii?Q?1MDfSgHyeJfm+T/8IDXiPhyd/ghRkYuf2sVSu+P3v73sHGJFdwu2+6diiRxA?=
 =?us-ascii?Q?mYLCbEs7mhI8oaf+1CYmHMo1JrMdNRo2IsXaRSOjNloPGwgY8e/B/Xqfi/QT?=
 =?us-ascii?Q?QDlxPjSwZg0iLSCHjVCNLajkXD8rus5jeF8hX7kCc4MTWo8OFV+v9lYs9qaN?=
 =?us-ascii?Q?N05aRcaCxDxj2ljE44uOFAzgh6DPWQv3864Rzv/gmPtOdZxGqjCJneWo/ZGo?=
 =?us-ascii?Q?rO8EPK+THOWMtiQf8zzMte0iQuHwP6K8+ognOdcIEyVeZ3tpr2qNo4mWENBz?=
 =?us-ascii?Q?y+aI0+PqRyFzJJBuMJmTIn9X2wSxhQCuDyycGRN448LesagxlRU8hKCF0Lc5?=
 =?us-ascii?Q?CtlynlcK4Axm4u+9aTwHfclhUJNBN3GDqnEHE98RyKmFlXOa5LlQwEf6rL4K?=
 =?us-ascii?Q?diEDrPLal+z3BkvRABREbxtiFEs+y+drDq97i2zwDmLd37mwUCj0dVqv6pkk?=
 =?us-ascii?Q?nx4uGgnxR5HoEN0dgv3J4C+X6XV+8/D1ckWo/lBZu3m8LtA7vF8ed/u9zMZ1?=
 =?us-ascii?Q?BUzYgJGXfsZREVOX/MtlljsOudbrkJ6rlN6ryEODSedGqAeyTi7TnM5zdLyR?=
 =?us-ascii?Q?2mDqCw+x0MPkyFPuj3y8ac8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37040f6-b68e-4f6f-5d50-08de20b9d34a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:42.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuoCFhxERaUIGYMk7vDhacCd+gZHA2xQUl3VWS/faOEeyvrw3seOL86wOU7d3dCw7iX5t5p6E4VZ81Le3S1XHALYtKTqrqswOI6lDGEeKIbRRqNq6xjFGtDD1Q8cp+JO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/boards/cht_bsw_rt5672.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 54c1894ee96ac..359723f2700e4 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -51,8 +51,7 @@ static struct snd_soc_jack_pin cht_bsw_headset_pins[] = {
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -193,6 +192,7 @@ static const struct acpi_gpio_mapping cht_rt5672_gpios[] = {
 static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(runtime->card);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
@@ -215,11 +215,11 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 				RT5670_CLK_SEL_I2S1_ASRC);
 
 	if (ctx->use_ssp0) {
-		ret = snd_soc_dapm_add_routes(&runtime->card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					      cht_audio_ssp0_map,
 					      ARRAY_SIZE(cht_audio_ssp0_map));
 	} else {
-		ret = snd_soc_dapm_add_routes(&runtime->card->dapm,
+		ret = snd_soc_dapm_add_routes(dapm,
 					      cht_audio_ssp2_map,
 					      ARRAY_SIZE(cht_audio_ssp2_map));
 	}
-- 
2.43.0

