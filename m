Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6F230D35
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634371; cv=fail; b=AgISMnByj5Rb1WnV0uW/kxLYoFZQalFmLEf2GVTeqqhCfBKuhaTMM8gsNE4fcKUdGIn+FQsnyEbO/68k7e1XCZoPWQxmuGBPUwjQrtsM7JtwvEcaxHA51ezC8BTW0IZ0gRh3k+fnttIsENDDbHwzltI0M8zmgLHfHi8cR/4mkbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634371; c=relaxed/simple;
	bh=d9B1kzUB4a8TjL7bFMUm+Tjb4992xY6AIMgPxrLvJqg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aP1Jw89Sv2cOyu4WMxhTXJQoUvl+evHkmv1Igv1AL9aGwuJ04G5+B7xCdQGDuN3XHasiL7TZ0agnpC1RPKN/hkZKJkl9IKiJGGLJp0IOXZ/Q+BdBzkJkCpDIihEtmAahZWnb5AxxqtqXpMIGT3XhF4+c5fGFWn6Y3C9XbFSL+xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b3a9mfAl; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b3a9mfAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUZId8NHnkhqAE0B3L47TWV/r3j4FONVpMRY+tZoJwcKt++M08XYaVcUlAWN6l9g5340PNRRwAL8NWX6ikViE4vSx0fthqNB85nEuk0dN0F0cL6Pu1H45TrfgQYK6LVKvsx0SI2ELqmQ8V0hdcshYmpyfE8s0xoAVTIFPO2X2uHpsAnigafvOEKvb0Fx4uyT81601s9FEyLLfzikt4eI/teLjHMuH6ndJs58BkLpdXcC9QDAmpZCAGFVgK/N9P3hRCulzmtEZG+jgnNoM1r5denAotmbuI64ytTwmN2AIMOuCJqGYdT3N7PChhur8FkkOBHioLj04l4EiThdZ3Zn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy212tUztYdyUDDkRc8DwUTEOWZ7Em5Lrr/HpapMKf0=;
 b=KILK6c1Bcmn0ai5WSXXHy/K+8562HMt6BbFG43+qy+p5PYfVLwKIhU+se5AeHJJGUGW5FcYj0dAqDP8xekxwijHdUbK5eOj0udp1OUCggwIof2iWTjJKhA1veuRYsCwyV5K+Hzk1b1gZ4gGcpFx0ETFbCt4A6gnKOPmeZuo2S8ZPrFdAPyjxSvd+Zxv0pNWdXBsunxpBRyOK8uVKTRnRPcxziKPGHJFOqwv4qOkOOTIQbCIQeO1AWPsL29+0ldhjJA2HzywLXe633JXVLHxzIMYeFXahe/eRSLnS5boGnoHPJ6IYaO6Nl/IniyYEmLQ3qGcwSs4CFhX4Wqwq7wCvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy212tUztYdyUDDkRc8DwUTEOWZ7Em5Lrr/HpapMKf0=;
 b=b3a9mfAlzbbFlxpOn2Kk00rvwR2Z5XH1S9+g/m1sVycQ4zMur84HqnvaY2CWpWwFvP9WmERBdCGqinut9XiqJvH9F1T1q463jqYesNIQEM0ihmQ4/pxuSMox945RqiugTLRSGQR7Jhf1KZ06PJXYLUGUV98GWJBVSn5Dg2mxzc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15756.jpnprd01.prod.outlook.com
 (2603:1096:405:273::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 06:52:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 06:52:47 +0000
Message-ID: <87ecqnsekh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH x/x] ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 06:52:47 +0000
X-ClientProxiedBy: TY4P286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15756:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e605d6d-9bc2-4c50-edea-08de15ee9aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90CPvoo/5cLYH1Ha/qOh0E5dVV0tdRGpLvvgPtqr6ulAa5gcf2tWeSOGG7ap?=
 =?us-ascii?Q?vyuyc2cl+KcqK1xeIPwLBIB4ShgXnwu2h5hgBUF9i133QQSNnz6zCJcXi1lK?=
 =?us-ascii?Q?4CUk0/rl8d0bT7BoiuFcIJsoq15W1zIEpflq1D65Q4dNud8/dg/Op2DZfinJ?=
 =?us-ascii?Q?2kBNK/++r5s+gP5kGzVw/hjW+gua3io4TfNrLvxN3C9u1IgQcsUClpOZ+1cL?=
 =?us-ascii?Q?fijhGlGFCQKv18hSZ2+fwQDgWD+dz5OVr1/17N3Tau0rHrIiYE6H2yVaTD7+?=
 =?us-ascii?Q?BP2nYM1b4+DRHnULddxPqA6otkqRFxQ3f2BJCo82VmBJPbWeZMvmV9rNZv/x?=
 =?us-ascii?Q?KpjQqQn+AvA6GI2urwMZUV0DuAi4TMTbnk6NtpNgPwEosLk7vSnFmYg0n9cU?=
 =?us-ascii?Q?FLOZMhY0mmRBMq9WOxeEPQzn7Xym7ekERoaeqJnbYmoMf7aI+8y5Y79dZbfR?=
 =?us-ascii?Q?MYnwpkXhiZ+HUfoPYfd9ZrrippKdBI+Fr1onApHq2B9CsrI7IyDLwb8k9gdF?=
 =?us-ascii?Q?XlF5iUK5KCNOzVw3ysU0liK+F8n18k/qvYEK6mqdK8VLebTL2n6N4Eddw3y1?=
 =?us-ascii?Q?chPsJ2Yu7JfGBL4dHQ13x/TV7wznOT8XKD6ghRJdqa+LY24FbEEDyFeaUBMS?=
 =?us-ascii?Q?LTgkkP+x1vQT4Fc6SAk53UDsYIddyxfs2pbTBB8yGkHNn3RdjlA1N5+tiyXS?=
 =?us-ascii?Q?8ltfy5MZeYJqUfLewXC8VJAJHREdx9l8g3lZk2hfK90Ae1K5+ucI/aWsPE4D?=
 =?us-ascii?Q?J2CdUEPcNOMaro2c802rbiV7kbKRkTNaKwVwTzoa38RWK6IEyd+FIpewZxCK?=
 =?us-ascii?Q?0xKqj0a2G3lVbDZpycWkWeLqxr80T6tQZ8ULuIxcMg07sScFCxS5cv2j8/CC?=
 =?us-ascii?Q?OCwPijuuuLHSRDUKAFgZUXtYWSem0TsRjFiYRwkx7jySir95HwAW+pBV2wWe?=
 =?us-ascii?Q?Q8EgRvh3zZW8AcBpbKbQYZ9hK/HpI5F8p2QdRCKmoxTwTUVteaDW5/i3Sxt3?=
 =?us-ascii?Q?kxVKOiC5LRmmQe8GJb6+pgFPwNXJ10xLY0EaAniLq27NkbWO25XRWovq0pKH?=
 =?us-ascii?Q?LIcvkHxrPHcoW93Zy3Tuc/Fy7z3QKJYPdNibNqREJQdCc4WFzwqbtNp7OI0M?=
 =?us-ascii?Q?Dc4R8s2hCDwdHL8fHocaZ5WF5ueYwqh6BwXw8RiclReIXmKhDEKY7lTJx2Pa?=
 =?us-ascii?Q?JLmKxZSWedUar/molWsydW2ilJMvHk2ETzvQ/QgtHOmzhHofJxiHqk/m9tyR?=
 =?us-ascii?Q?U+1+VG/mVC5bMHkDl+l0PLY2cslceKXE7rmWtHGLBafGvIEmvkvSyJpjdgEH?=
 =?us-ascii?Q?G4pdECqRec2tLX8lsTp4NYnkWvmkKoTPmYu24qbN9gOQWYQfOgFN7T/bRCZ+?=
 =?us-ascii?Q?TtNmkEXheeYPWmuqDa0sMQX5QYt4mSKReUXBpFqt+a4segBP8lZ/z6XsqCCH?=
 =?us-ascii?Q?Y9etIqPRL/SHmeSEud0zSH3dxmB8zzWIFVPp//5cq2zktLfNz/qNcgAivuRh?=
 =?us-ascii?Q?BUo10vxvyUpmSTjd1FWE2rv6SXVz/+Fit6X1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9P8YSmNql8Xh7v5X2S2YLpLFwQ4YH8G6DHSMoeZK8wZJt4ry6g50Wnzt0qLg?=
 =?us-ascii?Q?ryB74ocK5M6Q0a2zMvBetHinf+mUm6SN5WYpElqgdeg9winHGmJfQk5b70pc?=
 =?us-ascii?Q?DI6WcniutaZnZ+67idGXAQQF1ObAqfuFQ/vagCKeC4sPTmQW1ockWk2ssyP9?=
 =?us-ascii?Q?GyBVkUpJdBMMDElSCFy5JG/eC0laEiwSaOKddeqUxQbdlJNqDcSO6hNvrAc3?=
 =?us-ascii?Q?WubMtyR/O8DnE+a1hiafzImZ3jsmTauTur42FYBh/Fqe9XHUJf2YgMpKgY77?=
 =?us-ascii?Q?oBvEY6bk3ERoivxGonT/GrQzN0WLm6rdz16fqlYQCktZp5wW7/eR1pKWnXMK?=
 =?us-ascii?Q?M19rN+SG+wN97Oh+Nh2Ywra0kjYzwdDO9DB6dM/wUAyUGTTHf9AmOujhojhO?=
 =?us-ascii?Q?/tYemCDiEXJX4r6RWUnjcjfZxARTnPTwFhG8f20iXR6JU1bsoljXbvZ6fCKN?=
 =?us-ascii?Q?8yTQwHDZefQx/t7hAZd76IHZQnzB/kuOV0gLJR5nWEwG+7k1W4cg34DcC3eX?=
 =?us-ascii?Q?w8uBvSMTy4GcMDwB7tcoFQPaYu4PdkdrxHlS0xtRF3WfXS0js+wFsU1wmMXB?=
 =?us-ascii?Q?mYqDf5HMqc4UUjgg/qJv4gJOjvUAWvK71jyroRBDO2pIT5G7ClM4tbvbuZE6?=
 =?us-ascii?Q?NB5NKI7VBg94l1t3AqF0V3KPBb63DxfQVP/bYg6/IYrfGBs26HJw49BJtbX/?=
 =?us-ascii?Q?sjx5yuYNykY9VoGT3PM8AXb+t8kA7NVmArVBVQSfDzwyLhNDnWLd3XCUl1NU?=
 =?us-ascii?Q?sEWv+q790nsa+pDVslcm3W1lrJSnPO7vpLCIMaZXQRtlzRrhXBPNhQDZTyb5?=
 =?us-ascii?Q?qcBr5TMkyLGi+ynIZERA1NzfN+7HrPok0VFyCwR4Z+3a2nvgBM71hSqhS1Uc?=
 =?us-ascii?Q?o3erW4xQT5UMyLa//1fQ1I98nDBDnxjuTEZmNxMmQfSaT8AYFq17nMT4uNEs?=
 =?us-ascii?Q?8swLF8niUw1MAKJFcr0k93DqkZcvNjEVEnvg4MJ5kxCuDZ4CFdkZqMBlE2kw?=
 =?us-ascii?Q?mD7YhpV1w6TwEg/vhmVw+a1B4f9TK5vfOM5JiIpNjkPrrZDu/WWe6AAeQJ1t?=
 =?us-ascii?Q?OVcxkjLeAnHY9NUHJzNBh/mRK+VmhvTTqhQgm1+GikcSq81Ln9EU6qqfkNVN?=
 =?us-ascii?Q?OagPi4YwVF1aIaEIH6lW5+ezLnb5CrqIyOwafpTjTsaWJJX9feY0LzrKcr+w?=
 =?us-ascii?Q?E1WZCxI90UNQxyQrgxLyRDhi9vYnMQVb26coqOf08wvTNJdYs/t2i2pNtjGt?=
 =?us-ascii?Q?Gwt9CMR43rIz7B3U70pK8YnxZjlVpEhAxUgPTQbLr0wqbZJX2HT4JlRJ4Mgt?=
 =?us-ascii?Q?X5kNSi9yLX+0/j7mNn/+picyXyGwH2Si1PRBD9SY1jRXREdDbBdbBkUhPgsz?=
 =?us-ascii?Q?nVGLrA0oS9KiWp3IHtgoDjpzjXcsiwTinpY/mxHOBaZpb6VpuYcl2IP/7+fq?=
 =?us-ascii?Q?zr8oZ77wJHgO4yYDlFQJx45e0ooFMw39u/PahAaFnnnThDdiYmLSN2jVZowC?=
 =?us-ascii?Q?ovRX6M6momN1MNveKi3Oi8C0efs/15KKfnkEIzkOVwvGzXMp9z+pP5o9Szz3?=
 =?us-ascii?Q?O+colaJBPhglkcyH/ACSvKBk+GelNjtULlckltcdPsd5Y7BrmbEDmajcEWis?=
 =?us-ascii?Q?H0FKfkjVmY3+RAjIytwLra8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e605d6d-9bc2-4c50-edea-08de15ee9aae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:52:47.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dM79QPVhR1DtqsCwLeBdizglNV/zMjoy664Yuqw6TPBqEYd+gly4IcK0QTaqXceQDAdABFQICcD+ANKl1D2ouh52vLH/zfuqgOdMHy2+wIpf7Tru+6CkudY7dmtczw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15756

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
 sound/soc/codecs/ab8500-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 14d0378bfe725..fdda1b747bf7e 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1197,7 +1197,7 @@ static int anc_status_control_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 	struct device *dev = component->dev;
 	bool apply_fir, apply_iir;
@@ -1934,7 +1934,7 @@ static int ab8500_audio_init_audioblock(struct snd_soc_component *component)
 static int ab8500_audio_setup_mics(struct snd_soc_component *component,
 			struct amic_settings *amics)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u8 value8;
 	unsigned int value;
 	int status;
@@ -2449,7 +2449,7 @@ static void ab8500_codec_of_probe(struct device *dev, struct device_node *np,
 
 static int ab8500_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct device *dev = component->dev;
 	struct device_node *np = dev->of_node;
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(dev);
-- 
2.43.0

