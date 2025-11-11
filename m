Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EC238C1A
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821431; cv=fail; b=JAB68hqf7npg5MNMh2lvsEwn2ITAS3z16oL7WMegQzSWh6yzSP4PHQgYWfXSemy6uMVZhCuQJCmQsJCg9wupqpZjvH9FcxKaBty/HdzVXsRwjJ1zz/nN9aVTgs1bMg6C/kD4INRu1xyKzt1byWIpkGzlqJEWSQWaa+JdtoR8F8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821431; c=relaxed/simple;
	bh=UO/mJuAY+HAZ8V2+eetcxRMTQSIurEf3FrpFT+N4YW4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eoe3VLeZvZicMbfZhOh4ysukEzJUdHb4rFoko4HLvVeXvnWdAT4olahBJclJFU2C45RktCGhol2LZmW24/Rzo10Ebqj40iluX46nePzYutL3OiqytQoXjyu2yaxuxiyMKAaW1ZKLVhFf4p7suYB+ZED8oTcDkxyWyaarg4Qd+Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gi2kh8SD; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gi2kh8SD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqkAN1vmmkaVcRhrmzxb1VCU4/S4XZWs5vNOZlKv24Pm/UsyNlMzQRPhj2Nmip2d3tM2ELvRqvAJ/HuF9dHTVtFPW7KyQWH8vXaFsBvYigzK4noazKm/wsy6EW22R/GOD6u8ONhhTWEGEYReoe7BVLy7FU/oKCJsn03olqC6g4aKeMisjpjIsuMI9KPCgDx4cGKTXAxwwo8cxWiXHSbL9bVVhF3IDvhs14voIRr62tqxv/hVlXCKaiq55gZ7//t5INkM+A17cQA1zM0BL20o8BKw808NeptMGNhjFpcCTlVRakylcW3ak6Gsd5vNVClOuUIKBJ4ZzI1pFqKatPNiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yZJgoquok+KWGjjeh87z6ZWEu3GchypMPxZ61Xf7hc=;
 b=QeFmgaZ6VyngnZxI4XfgXmjKa6r6Roc8o74wTWXyciMfBLKMh8SGb7qqDhmCEW1hFwGmkxs8oTKeXoIraoz/0sRIwSKxLJ1LZ/lcS2lKCjIhLQhwniCKbp8xz+V0PCUHjHYWsgkc5hiys5GGHYLWxH0Z1nZQ5ppU4EOkR0s2F96EtlRknFJSnIE90ApaiCKn+cYPgGgdJ4hbC57HSvS+o4NxQ6Jc3qmkvJad92wJ997UZyIKYouPzaPBrdzp75gYWkAiYFdZL7abAyHrkeKtcNCJoVyfZe2Qk6fZ3QI06VIjsHrs5G7weIwriUvwpzYBKXk6bmePWUP+U8oMXttRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yZJgoquok+KWGjjeh87z6ZWEu3GchypMPxZ61Xf7hc=;
 b=Gi2kh8SD5G4A9TP9sPR5Avur9vJVGLPAtz5iaabn1Dpnq8/wQPSoUoVUu1JCVOt5YZXVPbW+TqrNtvlpKc1MR5itzJK2wugFH24D8pD9huSNLW+CFLBCi8zSeOiKLQiT0oPZexzlV96M7A7PceeN1+rOq865cobY2Idxk3oWf10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:37:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:07 +0000
Message-ID: <87tsz1s8ul.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 287/292] ASoC: ti: n810: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:07 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f67551-ae83-451e-7066-08de20ba717e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P6MMiUzHf3JXvpdPdf9IX1VKOJeV0bXFuiHAJKIgZ/h+flPQVtQkEoCj/lGg?=
 =?us-ascii?Q?gn/6/K7EpJ9DApRfkAGD183Ip0/E1nwJ2bA85OK71e+my1y4VogNlK2wxfFh?=
 =?us-ascii?Q?ELI2dYRSd9Cai2CDd+rPiun7gPpQhNysVuy8R8bSmBcUs6+WUPRkGsTqp4/p?=
 =?us-ascii?Q?bcWnJfGKHeKTyVcbw5h4VDO2qxYbTBkmh6HQht8jwMjkjLVPlZuaLjipjg4Y?=
 =?us-ascii?Q?Z+FnNO0dSWr/7bsh454uMiXXgYELwwWww6oBj5B6gEYEGtvJ5edne3KlcF2J?=
 =?us-ascii?Q?J/uMHswqGz2MASm4Ogmf3f7hctwMIvqc6QikBhsAPePpcfVax5WU8K4r25pg?=
 =?us-ascii?Q?WDu1tgxbp5v8xJ9Yada1arsrsBilg2igGcrgGuDQE6p4bTjfTJCDSp7tq6ib?=
 =?us-ascii?Q?COZBvMnVh8bckKohRTftY7/UWekxC58Xf6gRurSm0HIeatfF7dzPbwwIItAe?=
 =?us-ascii?Q?W9GdUtmyzoKzDb3MN485YAS53Z0RXQh6eo9gR8YwPo3lgfxMu5YVj3zTHliF?=
 =?us-ascii?Q?hmwq2fp2LdNH2gcIEgSsL6ZQH8ecAet9N8V4LgtMLhHbjX8Rk/FSVob3OaI7?=
 =?us-ascii?Q?foI0vV5Ws/qj7WAQAmd+z+rHLOqKoBKQFpZ5cpWLPF7rV64GKsHbmLlwj7DS?=
 =?us-ascii?Q?DvxmYgLsUUQyETeJAq8ZIXMCmWRZU7Oiiyan7TtM3K6EzRqw9rdPj90nxw1W?=
 =?us-ascii?Q?gOL0L0HZJvEqvm4SKel06FVe59cKoG01m6/7QugBlUNtY1HGoD+rzo9zo9NO?=
 =?us-ascii?Q?XkPJcC0stNWkJkok6bi5GYsqanh3GQ84sjfJiGsTZZKoWiHdkgrU8d9oG9/H?=
 =?us-ascii?Q?47AbuzXsmxgHtimZEKuBe+L/5QaXkdc8qtMnlIjE1quisHwf8fUDYAyZyNAp?=
 =?us-ascii?Q?A1oCsyYHk5vY0u9vCsdRsBSvI7TkEMyvcxMryyBHvTvMKFHjaxo+tDlpZtPb?=
 =?us-ascii?Q?2RyuCEj5WSLbcysQ1w7uG6KIAEtTS1YpRHgQWP+8IXaq4flIt1WioikCYTT6?=
 =?us-ascii?Q?AryHohl6X7shBMAVjF0SAHfQ+qJxc0KON0mmsBjXqqr1VJKxS59H0Icnshqa?=
 =?us-ascii?Q?NMb4mFrVMTrIs3mMt+8DadxxO2wgRodN7Ffqn0JkITLj/HmmgGd/tbJJw4fA?=
 =?us-ascii?Q?Sak6ENp0HNDX9A0/QzZsP33ct92wmeCW8WoGANRpb0C5+4FTH9sVL0r4tz/s?=
 =?us-ascii?Q?WsrkTHoy1DxTCuf36anIL/uXPjU1XSUnE5qjdnF8hZk/LbTUDJpWrmr6/eF5?=
 =?us-ascii?Q?3Z/BSD+3LClVbyjLxNH5MoY+GIHPpZAtIU74AsxqeH9BBqIAjac+YImFByyq?=
 =?us-ascii?Q?YwVFvdExt7B11N2MHjerI4O9/oGWWMl/qHG2ALVYik9E7laKb9yo8yh2zk+R?=
 =?us-ascii?Q?xcvcz3WGSm+1tRFBOrwELJ8rEfquNGpoI8yugR0b7OrRgoKxFveNi5b2ob8M?=
 =?us-ascii?Q?HHCiBPa4TiwihHSxQm6VMXM2abmOlQj/AUfyd0PPUb6CePrnJZq4pZ5yxvgw?=
 =?us-ascii?Q?bjvIbphtqwLzrErA77D7x3bCoheestpg8HnJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CQzHbToFMwfohB0DBAAiADKMrv59++7yy1T4QIPW/V9uuEo6sloqM8gj3Lk5?=
 =?us-ascii?Q?dTXcMbGtRS9dCgngpSGzzU9ITMd5HCPULK5gm3MV/PfaMe+ngpb1F8LfjXJe?=
 =?us-ascii?Q?GxpwKgBQk46C3iLhHaU/6Lx0KSNCnyj/EdfdB2Hn3HeAO9B188vjU/Eejz4o?=
 =?us-ascii?Q?Sjn7wlVnXkmMt1yHWQHBn6+EdYj6Q37jR90nOLSozA4QDWRuMEt53vG0z/Or?=
 =?us-ascii?Q?o8HUIxGMrT3qx67VDNdA+dvKEZpGD4nis94elYDKevNY3ae3OyDoLOhr9n66?=
 =?us-ascii?Q?0OVFkuNceekHOFffGSPG8uW666wZedFAIEpkJm5wqIx3VofqgNxPSXtFdPUQ?=
 =?us-ascii?Q?90DLOxXF8xVDVPwwU6Rj9OpkzxRuLjDxaRybu12C4+50LCqeN6ezZScAeS2l?=
 =?us-ascii?Q?F6ghJ6aS+2LGSR5q8uVGP4meBOcs55thUryhT+EskuStM4pafNkM4dbDoogh?=
 =?us-ascii?Q?7iejToF/BZMvhOD7ICSEvIgKulmnCsPht++EASsSqFld1D0gRJFdZ0QyGQPm?=
 =?us-ascii?Q?r+neb+WI3g6xrXvKGeXCgr8F/wKYPL2RGnhDu5fK8roB9cdZ8uJyYehC2A88?=
 =?us-ascii?Q?Y9GkHTMnkSdzthCwdr/hd6OknafIFr01PFKYXMfgGa0aImUAVFHzlzb15+GP?=
 =?us-ascii?Q?66bhITa2xSNFxOtEoVP6V6rY5ckxIpKaHnvhwyflvS7Hxr0u/ndvnfLDhn3T?=
 =?us-ascii?Q?Si2xkGK2OMVxNNrZMVVHImVfUjq2HRaJj19BNCjcuR2UrfQgKbmKtzTEwGI4?=
 =?us-ascii?Q?JeMXQsVpT0DEB3OogM6rN/EQIx0+0XdSNU4s5zFq01josHNKjLryIqF5qDfn?=
 =?us-ascii?Q?I0CFqnJRZGTIR9wLzlB2h0OPvACDqTWZod7/s57idLcBPnen6Q7Z4xUOPddU?=
 =?us-ascii?Q?w1XlZwVNStZ8861GSo/J5lQ4QR7J3bkawsvHGQnQQX4znGCiW/0abn0Yz/It?=
 =?us-ascii?Q?6bO352q+xE0YUILb2G4P8e+SvWV22INlFsylNcDgOJIdzS24kk4GEot0mNE4?=
 =?us-ascii?Q?0juTtxLBxkh8HxDQKYagbDXT4nEWGDLJgB5e55mn+Yr0WNvRAEcG63DkifnC?=
 =?us-ascii?Q?oQEEERSk77lVb5s+zJxxpsrXAhh/9x84xH4L/7cRT46HsyK/KtXOIlhWdlz1?=
 =?us-ascii?Q?S2uo4UdAHtjs+YX0LQC/uWSdQHpTk01TNCJEfRlhxl9n3cfezFNgox2JytDG?=
 =?us-ascii?Q?foO3S4ya64vU9V3903riTCgwASjbNOTxCSW4rgpdzX2sqQH5Vu47FwuwUAmY?=
 =?us-ascii?Q?qwT2igGHpD9vzZl1Mu6N/AIjHHuNxsnKPTyr4l+yN8WteYI/oT+REvJtl2zH?=
 =?us-ascii?Q?h236uny62fv3EURSmPACiiBA9LfM15sa27behq14XZKJfHvzJxBtUaHp32lh?=
 =?us-ascii?Q?etw6J+Y5ysH3xYeBSgnFnUmPMvDH+Dq7XcOhSyzLrjHyj/wrLkqQcvnMfSI3?=
 =?us-ascii?Q?+S4YO6Wq1TvwVRhk9NZq0ESGWcpSHZTlV+6/MkG7AE8SqWYw9cdQmIeEBZoo?=
 =?us-ascii?Q?WmnagyY7Wb+FedyODb9m/gYN15R5zHwrHpPIHSpOR/hQYa7JMRz3VR9ZWm4R?=
 =?us-ascii?Q?3lbuN8WO5F50VZbLFaM1Fo1yN6yU5fUyDXcpEUxu5PDm+7P9Cn2yR3CM7JLh?=
 =?us-ascii?Q?ERmz0iy+EW1PRvySW1Oljos=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f67551-ae83-451e-7066-08de20ba717e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:07.4186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtrbIrYC3kB9//zRmlCO3pF2hr+RUWagu0ovKNJKBs0qcXSOD7JGaBWQDXkEwozahTKEoqc5xsr/Zyyg/fkkF0z2A+9T6iYIlKvs1ahTL8SGegkXBFRvs7sdH2B6MDrm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/ti/n810.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index 345c987653809..242b07034816d 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -85,10 +85,11 @@ static int n810_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
-	n810_ext_control(&rtd->card->dapm);
+	n810_ext_control(dapm);
 	return clk_prepare_enable(sys_clkout2);
 }
 
@@ -129,12 +130,13 @@ static int n810_set_spk(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card =  snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (n810_spk_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	n810_spk_func = ucontrol->value.enumerated.item[0];
-	n810_ext_control(&card->dapm);
+	n810_ext_control(dapm);
 
 	return 1;
 }
@@ -151,12 +153,13 @@ static int n810_set_jack(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card =  snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (n810_jack_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	n810_jack_func = ucontrol->value.enumerated.item[0];
-	n810_ext_control(&card->dapm);
+	n810_ext_control(dapm);
 
 	return 1;
 }
@@ -173,12 +176,13 @@ static int n810_set_input(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card =  snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	if (n810_dmic_func == ucontrol->value.enumerated.item[0])
 		return 0;
 
 	n810_dmic_func = ucontrol->value.enumerated.item[0];
-	n810_ext_control(&card->dapm);
+	n810_ext_control(dapm);
 
 	return 1;
 }
-- 
2.43.0

