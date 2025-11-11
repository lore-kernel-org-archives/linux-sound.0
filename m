Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE472178372
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820574; cv=fail; b=DtGbflmASWm0ajJH2GvdniVlpo6DTAikcCxvTVcJl6Vvv7B5yXnOR5jHyqlwdtxx/yMGhcIlt6QXvIIqDhNsFIlqTeNH1IdX2G5WyrkiaeqVFQYHWlkQsJ2EwMyXfQaWfsQ+byR/amL6bg9iPifyG/CoJMi1kISj+bDbGKU1bzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820574; c=relaxed/simple;
	bh=b1HCeExqjxuOWdNXrTTnCbCYSPfQi+/m7vPqfOgmglo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rCk3Ib0bpSts4DIlf0OvMP4qCW8u+pTCChcsTsBypMF/9j63D3i9Ggh8Lylliv6seNHgMuCm0cdZMWYPIKg1dqfS56BBACtmca3DzzvDafduEa28wckd2tu3iwZMawcIEsipMIVSKMoL2ozn3ePQRxttg7ywuBZ87r1Sf/bfFp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Dv6XUdl5; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Dv6XUdl5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jbphq1Sc0hf48SEce9n/msNXr6FTBES526YbV1TRRkMajGQMs5QVFVeMK4uOW/oGFe2s9lKqsiKwavhj3peC3QVZpcyyzfihqXi3tqtG3HBkmrVit5MjSN3e8oJuYnN7qkAaeF84W4ob9zlDTFxHjI592PM0nn2yPF6f2MwUOsMRG3gaUxtgccBHHaW+nTdpBtxC3dl0Z6vYCnWncK9anvxXWUvBWyVWq/W0+AgDlQa3zhI4t5SGeZ54Dgp7FHHpMwQtmeylxvttP0LFXhl/ep4CcDSJNyv72NE9O/UUWIGKMlLulYPTMlGOnHM9rTvnTw3LB/y+Ua7KrWDNDS74JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vK93WdY/Svii3rIs8OGO387ixtsMGUDPpFCbXj0h+4=;
 b=mxbAPD2NtHRAPso2Ku06XxxMvt7Ytrjlvp+XiblptMYhXQPUtW/yrGHKn2k9EsyKpi2fS10NgzED2JhkXysp6fzjfrJ+Kf+BvTnJWOXlDRKwiVuWYH30DA3J3TOc6Ihxmhxm01f+7VXgVKDx4MnfByIpR+Ul4QIFTAHkzrKcSjdvPwa788Kzm+67MFMG1pY9OJ9IQVxW2E+h3gskYt6qb0x3pfRQlKEYK3sq2CTWUkMy83SxYKSe4VXk3ZD2Xr/RQIYJ8hQZPe1A4o2Z7Cd+FpVflUENvRO2/d+bYqVfjIrgJWrEKsR/lvFpqVYeusbMp7iG76pmcKSgkdvYoPfCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vK93WdY/Svii3rIs8OGO387ixtsMGUDPpFCbXj0h+4=;
 b=Dv6XUdl5yXMfnJGVYZ4T2V7YbRrh4wuN+PXvo7akr1xXvD85iDCIVxICe8V7msk0GGFRovWXx+7LZZAfltI2L3TIkAAjR6ktviXU1FCw1Y7T0V1ehlDRgm/Etkr3ViIwm89UEr3CSrZKlaiCQ9bcBWGBn20vgR99VprX+nclXmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:51 +0000
Message-ID: <87fral5sf9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 072/292] ASoC: codecs: jz4770: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:50 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: dd011736-6854-46c8-a6ce-08de20b8730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KsPImVZacF1lqovKnFclWfsotAZkE0fatyClOhP13rij0ORYxXuMNya2CLNf?=
 =?us-ascii?Q?+ByMccSNFBhD6M1GkWR8C90DrwnZkyqVHt8wTXth3DNiGHtzSu+PWUYyts3W?=
 =?us-ascii?Q?g2BO6qezbfKjA+6eUTsxVNNzw++y9DAwYl1RvFKOA+OH+fh5lohHFsGVaTxG?=
 =?us-ascii?Q?xmQangv6w/fdhHZEOFbWJGzRB68hX5mu2KNjfmsXSL4T/pPA11NxsayJXze/?=
 =?us-ascii?Q?LQWUC9hunENkspNw/Kt4eaMb+dQeSivIKk8un7vm92oM27S3tIwgVGzOnGl5?=
 =?us-ascii?Q?PtpWZ0d6ruD7rLl9MnNDAATD9rhDWs8I1DkH0wfm9xrfHLOXRfF85oF7FjVU?=
 =?us-ascii?Q?UPZAFLtKB5pQVE0Duv86GKkyndI2YLn+QykFLbYjqFA6NAeMcEo4dBPCOciF?=
 =?us-ascii?Q?+ODeMgc/da0f/lsjSrPpjXdYP6vAgYHDf+7qVC0hOj6NsTxDVGfwkagsPCeE?=
 =?us-ascii?Q?17GdGclHrIqHO6C603/WmhbSFQ+wW0mlchhjQo5+IFjNpXbSTX4vBX+oXErb?=
 =?us-ascii?Q?Z0Wq3M0ovtXuonl40eARtuafm3PMrfBuuyARWx3IE88zb312GPN0V9Wdk+kP?=
 =?us-ascii?Q?JkJ5ShPIhw04+4CHRzZHveg7pGQe6xY3v0kyREE5IMB4cMIM2pGfIrmxdJK4?=
 =?us-ascii?Q?/zs7w9ZQi2Mtjc7sOg1XxnoiUXvTUxADDZHwxviCKRY8oxpIHBRXlIHIFYat?=
 =?us-ascii?Q?vtFkDsp4uamQFhaJcKjtimrKRNj0rA4Oje6dpAOOlDOUU0D5IyUsPPMVc3so?=
 =?us-ascii?Q?2ESVPLrJPSwHFCtTLAO2tkm1pT9RnWmSa9fwggRANn295qE9wDCS9azGEDPD?=
 =?us-ascii?Q?i4lYpyjZv/dhslZnmDY8utmoLntj5ENvIMiQedXHBUx6d7kbwPiKscwx0Ic1?=
 =?us-ascii?Q?FpTwL5zLxFsuflz86svWByjTJe1OTUd+Rvc8b7T6Yg4FrLiYOpD1fSC854Ci?=
 =?us-ascii?Q?mE2v5uX+pxVsO0ZjelaWPyFQs4mYSllcRgTVroRVUPJFP1LmUcaPrXQX268V?=
 =?us-ascii?Q?FqIkDxt14lPQQjXyjR1D3Lv2S5B5WON0YVO8qQquNAN2fjwtVoafJQaSIkPt?=
 =?us-ascii?Q?n5zt4JFNbAgHW75Su3n89luSJiniqqUruCe+rB8zkEbTBZk7ZcCk/L4mrxBY?=
 =?us-ascii?Q?5EkW2DJz0VwlEM45n+38dktM/pVWQ5dUyOi3/hrZkRC+dwrQtd9HyFYO+Ues?=
 =?us-ascii?Q?EWjmRxaDVq3fm4+l1+rjNN569NBbpLLQgBWpLhZbYIVAKRtGz5zgRN+4X1bV?=
 =?us-ascii?Q?ex07W8cmtpFBtvwmGasMdr1JnG60yQzFHmysuJbE4taeRmvN82ZCz1yK1QoJ?=
 =?us-ascii?Q?9L9iuoxYkOmtY2Jf8Vr1u4HfM/F4+a4EQzh9qDe4hhygoqHgXHY39KZLt2by?=
 =?us-ascii?Q?0MHUVpMEqYfgiAAKnWBSwmXFyfojxX8E59uF3dUtUC8tG5QEFdJ/SheZN7Lr?=
 =?us-ascii?Q?3a3BoSUyWRyFJg4reK2uStWtl6c6sg2kgRe+S7wmWfyTcbHu0bFaCajSeVJ3?=
 =?us-ascii?Q?tpyqAiE5itaRPrti2jeDLM5Dsbs4KFzuOTX0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83cNeFjK8qc9x7VgsPAMihW+/08yGzXr59wxTpJceGffMXcPas03+zkTDrB5?=
 =?us-ascii?Q?Hpt8jPGW3FATvm5kJgD4WaxyY5mX5MzZpWR8rFLrs8c5rbIokCKkQLWOAtFx?=
 =?us-ascii?Q?dl5isSoisGJpytEONysqintLsCLnhesDtqATwcbbmvmqrqQTHdt1XVi8mOQY?=
 =?us-ascii?Q?DoPCN6b6gta/qPWMX1utPKJnwzW+L/+iyQ1lNN4m9FaEwMVztPpafXfW72Nl?=
 =?us-ascii?Q?2kDF1l2qoNnZ9LRf4gDAESZYHlqfEjM5CA6dmgHvCom124VGfSnS7ZCSc5Gm?=
 =?us-ascii?Q?cqJG+To9pjDBdiI55knIfuPOmkdUW/GncnuhgXi9zTWRWBon8dqDIYN2AkPW?=
 =?us-ascii?Q?Yh6xsUZBk4kSXm/oO+KESGoHVq0gIXW8eTI4lyvQjeY199zxtFRVTYSDXEWG?=
 =?us-ascii?Q?WqoutILQRqcLSnoy7B3E5PSR9YbVeQn71MaguhkOV0I1aKk838LybSPSPc00?=
 =?us-ascii?Q?0UOKb6W3WwNBKySlLVhJYIxzzj5Z5wGOp1VDO7K2SRpyBiYMwweSXlvgNWHa?=
 =?us-ascii?Q?POULnIEjURFPb8kTlJspXHZkm5ACVcY6Lg9bdjlwMMYypUt9OFxX2d9nRPZV?=
 =?us-ascii?Q?JKC8XfdOg3ql8vaHW6u3vk9KpP5hIj/qKZ6V3ZC+m6DlUgFWjlThZjyeHfJX?=
 =?us-ascii?Q?VT9zDzGhK33mF1bCpqcNcVwefUvtF4GneohYqLxifhgPozuPjLE783CSaC6I?=
 =?us-ascii?Q?80ivz2oUM9x0QE8C//0ELjagkd3foFwZyBsuAsZJ07uJAJYHKYcFXISFnyRJ?=
 =?us-ascii?Q?c61DwFD3z49SF7yQP4DXbtGg7U4prdeR6yWOQBpK2LCWGJkijdlVtkxdvBFN?=
 =?us-ascii?Q?OrJMHLjOYzLvbYDZ19nU/VkSuRoPXrPmvsJ9v3EqCH2w5ir2OO046SKeKJpo?=
 =?us-ascii?Q?LNYKNcIfk9hDjCdcPxKImpXhuQ6hDCEM8s+mNWfyRP8a/V2CXcCWnoqpUIjZ?=
 =?us-ascii?Q?1/ZaNj4eBFcHh8C5P95x3fGRc/bFWpwYdJT5AFe5wL+Yx8wUwmfAXfAewQ9y?=
 =?us-ascii?Q?jQN2E4HVxBl/kQPUDzsznKza1Qr24lp7i+Yu3NWGVAe27WGX6qs7oVe0TkvT?=
 =?us-ascii?Q?ESI62R5Mh1H7+kIuqdiruqNxkFPLkWF0goZHsNjPTJqiT0bpJs1x+Fh08DNo?=
 =?us-ascii?Q?HAl9s9j6uNbU3H6PtrgZscT8/mXU4ZvWYGud1s2gTBW8VNuIhnViLZLOzQUx?=
 =?us-ascii?Q?lUUAp9SU5wamvDTWyTQxldAf+MnFpeNwQBLEuKAXlOru6MNdNTaARNxd6rOj?=
 =?us-ascii?Q?Kf/iCIyb7k2WfR76KyJ+TG16gD3r7MgbhZO2LYDFvZMjHgl+kNCCagrasdJx?=
 =?us-ascii?Q?XQOK71uw+i+3xRt32qraUawBCvwbuOXiWNDkglgUaV1pMr+nhqsAUz2cgtFI?=
 =?us-ascii?Q?ju7MOn8BhwaTfx+2gDem+8PUD5YH8ngAlLoZdQO8kA0hablfFIe5lGKG+qE7?=
 =?us-ascii?Q?kY/pyDjAfr1/CME1Pncfh/yLxU8i4Pw9b47XZxiPc1DWc+QtwIPxWQsnYwCC?=
 =?us-ascii?Q?MxObGlgoyluEJneyh5qulhTJ9aS1/PLzCYE+AQoBNSRVdIwRKzXQYWHFziHB?=
 =?us-ascii?Q?oTXRjl0CaJlgGmaUqC21jq5+xUW/lEEwbga7j3o9hPgTqNI5Frd1e5O99p3a?=
 =?us-ascii?Q?mIyUe4Nx1EM4kd37cC2x4Xs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd011736-6854-46c8-a6ce-08de20b8730b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:51.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrD6biP6onpypwPtKLYyK+ivwG2lyezQD50C77i8mgLNwsw3Tnr4E+RkU2JVsxkGolTpSpKqstxcA45SmBNvkv4ThbjROW599YAtjJId1y+Hf8UdEmc/Zl+PKS3li8F/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/jz4770.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 312202ab5ceae..6b86d47028d77 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -217,7 +217,7 @@ static int jz4770_codec_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 
 	/*
 	 * SYSCLK output from the codec to the AIC is required to keep the
@@ -234,7 +234,7 @@ static void jz4770_codec_shutdown(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_soc_dapm_disable_pin(dapm, "SYSCLK");
@@ -245,6 +245,7 @@ static int jz4770_codec_pcm_trigger(struct snd_pcm_substream *substream,
 				    int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *codec = dai->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 	int ret = 0;
 
 	switch (cmd) {
@@ -252,8 +253,7 @@ static int jz4770_codec_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
-			snd_soc_component_force_bias_level(codec,
-							   SND_SOC_BIAS_ON);
+			snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_ON);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0

