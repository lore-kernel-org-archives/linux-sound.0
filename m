Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439F78F29
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820269; cv=fail; b=qp/Ww5ZvLKxdTN+dMWoFGK+TU5deMK+2zHRyGo+q27//CslqTDLtwC8Y9Wlqo+npaPZvG+DZtkJ+Lpy+qxNzPxxDAVcZXwS7uvIvAHZcy3eqUxgPrqtMumiX1GYBKOPWXq+6DK1+duZCFdoc9LvxCGVaPG5ogUzpwFOTaoTwy0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820269; c=relaxed/simple;
	bh=/MIslO2ZaGtCbzwwU7J85K//HDnC3fgkCY4NSrxm5Vk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LBEaAamlEb/IsCE4WQyBDHorfyKiv3Qyndclw3I83a/Ca0XCGKzVNehxMFFjCkUds+38DRyLnO0KG3dXekCxvqN+OsTlJ2zEa6s59LY+p3eCJiu4F3KcrKG2HBIVv5RkGgrBua4p1+EswimCARG8gCo8Brb3jNdxv+Mw4VOPNPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=czeqeDnq; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="czeqeDnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqsq+8T/vC7JI4LUy4HpQKL9dlBc3lmJzRY61oaokbz5q62GxbJI7DnVRJetPuRqszywH0LJUpN6YWHiITLbsGNJn9kjYrT8UZL4k8vJhxhGnDd3oy4O5tPNf4LwgXKyOAb+qhpxiHvfRt39dLEJnsHm98TbUQ5/HNE3eZMao3MhlH48Gww/9HYhrIp5WGBTdrsnehlAfuq+RN5sypI8GOFCGJxKY4PptH+JOXlfSvwUZPn1QzjJBWjj2UTC835YjYv4r36VAsZFb4E9P2K1V/msdKWvF3tn0aGEA3PAZx1St/7gnUZIERWcxIgVDUKpGRDxM6f8R7pyZyXTXdku1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNX2wTrVyYMNrQHdaHVeSFXRmtseJT+SILBev4Yszxs=;
 b=tvQFyKJOGYsipywjcgazGJZF1nWG9O11SIz170KIw3AQaz8pFQ37OCNlTFvEo2xQbJXQtUT3WFcz2I22bTiHxxSXR4Z7RaqQ4PxeV0zKUOSK+GR6i7ny61GXgbD6TDxUtLwVb9uAN/p1g3w3b0NTgaVvaw+dC72jilOE7kaIdm7kUiJse0PAJFyWxPBrht7rTabHcpcdjQjI+Cg7lsxYjg7vy7j5z3ruOwn9TsiC+y2m+2Isu93qnBc38NISvEzKiDELypumwAwWJlSSFAKDnFbE9VxLvxQGQlUK9A3snwow6S2hK+U7qs6wK8CeKsrNUF7RCy3JPN1UxZ4O35+1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNX2wTrVyYMNrQHdaHVeSFXRmtseJT+SILBev4Yszxs=;
 b=czeqeDnq+iVzHUSN2jKJg4cuYJbYqXpBGLrkSnEt4gJXgUalboSd+aOsp2efsmX08II0sYGgzY73VWrRCSFG08UsxjBv07leD+IJYFiFPc8SUK/OBced+QZx3jSJrvLiWVpWnO3Q7hao7MtxuF6+KYXnt5j7lU20m54yLl0fhng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:45 +0000
Message-ID: <875xbha0d3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 005/292] ASoC: audio_topology: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:44 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c9a0b2-ded9-4971-f353-08de20b7bc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vlPs8KzMApVBv2SbXtaXekEykENBqs4E81J/ZDf1p75W6WlQw+rjU7B4UCJ?=
 =?us-ascii?Q?N75iPTvH55Pr7uw4AXMvr8ncM2v/0X3z5OX2Y/a1UlCwXG6pRtfX0SQp236c?=
 =?us-ascii?Q?nqgzgv0PP9yPgQEuwkgjafAJK4izj+6fPBcOFdgW+rPRpLEDhtU4KHm5Ibfi?=
 =?us-ascii?Q?SWU+reNPBGLF9dff1Fo+HasOB8nZf2PzCr6XmWcet309VenItI37HknvvlkF?=
 =?us-ascii?Q?9Mk57gOZi7hO4dw7Mm3bWzIQfNBAksGfq9BTMXuu9Q4BWGV0A+OvFtY+axON?=
 =?us-ascii?Q?wH52rKhGGX02Cd17jZGik5+4Wnx2YqCk8quRgmOtGm6YJ932C0zI5eIThhas?=
 =?us-ascii?Q?jdyDMKHFJtOSLU6xDMvy0qTBH3AKL7OjYPrhRK561XTbsYjlUi4rQi+VYFyv?=
 =?us-ascii?Q?eJj+NBFoUv64VEMkCgotcaA0dMxvJMcMtEbLrYkmLdjw/q3NqyX3Q896pkqn?=
 =?us-ascii?Q?iVNQB/dJkoAN8t/HAlV+jC6/eGdJKAQ5KekMeR2PEEq99Fl1e6MbDc91ExS9?=
 =?us-ascii?Q?ulKmt+07wA/PelXOipTaTSIaSIhyzv6n8k09drxKhXevx/li81nazjx9oIXy?=
 =?us-ascii?Q?sb8wtnLJ8bmv6hCNp5CM6U/brFyNuTMjKF1sowJwPYePfBgmqLvHnAnVPxEt?=
 =?us-ascii?Q?0r+29d4sZj1iq7YUqlaa+59qI+K9DtJMztQyXFVJm5jzwlqIFEU2Y2dXLTs4?=
 =?us-ascii?Q?P/kKNW4hXuRvx8dIrOicJ+DdRKZxlEv7rWZ+XC1ssQIKe+IRUpzp/y1WtTr7?=
 =?us-ascii?Q?S/Ftd0BQFRiYJ6vr5Bh7ZIsZGOqzjVYdO55MpEBE7A8PyWylhN2kTnkzM1kz?=
 =?us-ascii?Q?w9XOqTE61L/Qe9wta3O4amrdT6hmJQQoCvZmSJnps8QsSHNefjsnVen3h7gM?=
 =?us-ascii?Q?iYl5Z2fXw+tRYUntjdHysZ7dyT+VPxO+eY3dlDWRk06+2gj07E7/hpGuiHML?=
 =?us-ascii?Q?MhqdGnP8WkIhVDnN+KZfNKZOZQWhTraG49dKlSCE6ZNQiPmSc31+IsZmeKXg?=
 =?us-ascii?Q?NKX8WSoZyrJq10uvwxV8j6Opb5EsHZvPrvHYT92gOd/68Za4j29LSlHKJZQ/?=
 =?us-ascii?Q?ybMvm0ms4r9GqiMxYtY2uwraeMFFaO0MiTIoNgd1sb9JWYjjau4hSogrrEq7?=
 =?us-ascii?Q?ozij+MEJldN85QcaAnDf4j1ntul/r2hzcXfkPyRjo35CnXpedve4ljfBpW92?=
 =?us-ascii?Q?OLAaEpDRxphroRyQNv/RhOz6GgQzxGhrrbskLk96dK82yPXwkyIkWPZszgAl?=
 =?us-ascii?Q?QTGbqvmBeMybFUW/DAt3ZSr9gWt5TC0YWHF1omanZSl+N3/e2vlBhpSIKikn?=
 =?us-ascii?Q?pLePTL+76QlF5P3kMW8HDUcG33M81V7xP/wKVbuCYCIzG3cWQzRBVLpXitrD?=
 =?us-ascii?Q?V1gwYS6G+zc3gA7jH1J2A5HFWQ1ie4RwRuxsmWGB0IkSUBZQYVXSPnjbUTF3?=
 =?us-ascii?Q?ZcouMjfJMTxiGO41lnuUNIzGI/6koXHbHHXBf/8G6KlOWMlP607XAwMfhYEi?=
 =?us-ascii?Q?vSND8R0qVoYm4XOGeTfFHMS35YpPeRnFZNTM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O9nz3JkVtATZbbxEZIL+07wACUGh2jPBbg4o0LpKmp3fR64Bx8ejYvCGQkIH?=
 =?us-ascii?Q?BSXfVcgTuw25e1GgcBi+gx5nTaHcWORg+vWRc0BXuWejjzSPFpklcLJE3wqq?=
 =?us-ascii?Q?RfrIKOK2lnVYpALvI1HY//g+x3lX+EE06Qjnb1WonWLUiKxvNii8L+yf5LU3?=
 =?us-ascii?Q?vjzyje7nrAGXB69vCw7r4jS/snkafo7j1hz5VVylDgWTT/LOLNw7NuxrnQV1?=
 =?us-ascii?Q?0O6Mis6bpICMocLh+XjEs8+i6R4qxSNSVk5ZafCHEg96k4qVr+VEhPgsuFyw?=
 =?us-ascii?Q?EeBbmW670ltjLyi9AvXAWp3nAn+e+OrYlXCh3h1gAdtpHaa59HHy/PMKoHCK?=
 =?us-ascii?Q?8GpqyUIRXbhEGle9XqGjorI2FBR3lZeyI3eM7nYFepPza6ghvNdGLpjYRB9L?=
 =?us-ascii?Q?isSZZY862fMQO+5hLoLJVjmWQ6xl6skcM99n+eFY9OIBO2pKL+h138j+zP4K?=
 =?us-ascii?Q?FAPQF6b63DGjSX6qIkR70xOx5b6HZJQNNPAlLIYqy8yEvaJdX9H3Lj7/vhv/?=
 =?us-ascii?Q?aipFI9JL8OZpuLOh03U9YfzmpV/HxFECS1wPD5gk6L3Ediwt9+NbbMmWxOk7?=
 =?us-ascii?Q?yppY41pd7VlT0yB/Z0Y0mCHoecQOECPrMnGug8N8depjJDva8VzOr6fUmfmI?=
 =?us-ascii?Q?ehLRImiYi8DvK1En43WTNx4gb+dPhOsAHKRas2eQgWEO1dER7adaTeuOOapV?=
 =?us-ascii?Q?MwkRpOAYBIphdlMcCqUB+Ls2mxW2KEWqQmtYesxofpuDX3hPJeGsswRjkMRE?=
 =?us-ascii?Q?1ZKlbo3dcH2lXshuCuZS0/lHySPJdnllFFSm56S+4lFN5dz6xVphZhlaGMKw?=
 =?us-ascii?Q?YMwBm74EszrMBnUHByocNOgB8Sfi1SocBxF7PyUb3qS80tgAJsP2cNTi2JUg?=
 =?us-ascii?Q?Wy5Dt3cqHJYHNHAWR5cGD/+6gloBPY0NJtlDVCGsO/sJh97oTrWM9ICNSV+e?=
 =?us-ascii?Q?lDuYOoDPUNw3RPMYGTp81koyTYhsjU6wH9xGN48UqttTcHhzG+wJvRjZXq0R?=
 =?us-ascii?Q?P/6bqO5cpGnMbwhQprftSYZU08XmCm0lKGmBz32XCc3m3UPrBac3XVwXESdX?=
 =?us-ascii?Q?tV/5SkAo+WEBmVhuM+Nad80TYd82W4oY2hnnzdQ0+Z6lTvzaCDLkLwrEFOVA?=
 =?us-ascii?Q?JJ5i0y/tJd4KaMzsuBVdTNRv8dxaAq80rxLib67WhTqi8NUQWG4IY2iKBXom?=
 =?us-ascii?Q?kURUf5WoXeQF/L5O+VrMiDob7+DLKLVR5g/FnSv+mw75pj2FbOCS0pFjFJxo?=
 =?us-ascii?Q?RwVx8UuCqLCuDUSbmQpWeX8v303ynFeolwB/w80nMKpvEeZxWyp4co2AQRsS?=
 =?us-ascii?Q?rEivPDpBfYu3XBifEEORmROhBMuU57MT+LzM/L4qxWM1fwGAlSpW7OznFrHP?=
 =?us-ascii?Q?O0WqBAdXPwHoyROx2/YzGrK4XD2t++JYuEw3+X/JcyWotigd2q+v5phesSrZ?=
 =?us-ascii?Q?5p4IL2W74jUJHF+xwZ77o0Vn/hmMURssfNPB8qLfZOfAuB1bU34dlf1zKJ8K?=
 =?us-ascii?Q?yc+z7cmRirxa1vQICPmwYrty7LP6t+qoefJLCWWrjirgKjfkjTPFPx/9ce+P?=
 =?us-ascii?Q?TUFfHxNpb7JDTDpuhHu9RbHqbbNwivESxhCGEZwCnSf00kZwla3goEmhsXx6?=
 =?us-ascii?Q?1zxyzKp4vRc7lJaGhNvuA10=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c9a0b2-ded9-4971-f353-08de20b7bc98
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:44.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfpXMe6rV/A3qi0qtWcejztGdHSOwDO4NUhna3WyDW3/14KAYHhB1t4nyNmqfreX7QX9Te7sn0vFRWX0BJ5dZsKYWtJzZ1Ur+kdpA2ol55IMlUn9iOX32xQjuLk3metD
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
 drivers/staging/greybus/audio_topology.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 13b790f81d442..76146f91cddcc 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -380,7 +380,7 @@ static int gbcodec_mixer_dapm_ctl_get(struct snd_kcontrol *kcontrol,
 	struct gbaudio_module_info *module;
 	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
-	struct device *codec_dev = widget->dapm->dev;
+	struct device *codec_dev = snd_soc_dapm_to_dev(widget->dapm);
 	struct gbaudio_codec_info *gb = dev_get_drvdata(codec_dev);
 	struct gb_bundle *bundle;
 
@@ -393,7 +393,7 @@ static int gbcodec_mixer_dapm_ctl_get(struct snd_kcontrol *kcontrol,
 	bundle = to_gb_bundle(module->dev);
 
 	if (data->vcount == 2)
-		dev_warn(widget->dapm->dev,
+		dev_warn(codec_dev,
 			 "GB: Control '%s' is stereo, which is not supported\n",
 			 kcontrol->id.name);
 
@@ -429,7 +429,7 @@ static int gbcodec_mixer_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 	struct gbaudio_module_info *module;
 	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
-	struct device *codec_dev = widget->dapm->dev;
+	struct device *codec_dev = snd_soc_dapm_to_dev(widget->dapm);
 	struct gbaudio_codec_info *gb = dev_get_drvdata(codec_dev);
 	struct gb_bundle *bundle;
 
@@ -443,7 +443,7 @@ static int gbcodec_mixer_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 	bundle = to_gb_bundle(module->dev);
 
 	if (data->vcount == 2)
-		dev_warn(widget->dapm->dev,
+		dev_warn(codec_dev,
 			 "GB: Control '%s' is stereo, which is not supported\n",
 			 kcontrol->id.name);
 
@@ -712,7 +712,7 @@ static int gbcodec_enum_dapm_ctl_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
 	struct gbaudio_module_info *module;
 	struct gb_audio_ctl_elem_value gbvalue;
-	struct device *codec_dev = widget->dapm->dev;
+	struct device *codec_dev = snd_soc_dapm_to_dev(widget->dapm);
 	struct gbaudio_codec_info *gb = dev_get_drvdata(codec_dev);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_bundle *bundle;
@@ -759,7 +759,7 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
 	struct gb_audio_ctl_elem_value gbvalue;
 	struct gbaudio_module_info *module;
-	struct device *codec_dev = widget->dapm->dev;
+	struct device *codec_dev = snd_soc_dapm_to_dev(widget->dapm);
 	struct gbaudio_codec_info *gb = dev_get_drvdata(codec_dev);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_bundle *bundle;
@@ -924,7 +924,7 @@ static int gbaudio_widget_event(struct snd_soc_dapm_widget *w,
 {
 	int wid;
 	int ret;
-	struct device *codec_dev = w->dapm->dev;
+	struct device *codec_dev = snd_soc_dapm_to_dev(w->dapm);
 	struct gbaudio_codec_info *gbcodec = dev_get_drvdata(codec_dev);
 	struct gbaudio_module_info *module;
 	struct gb_bundle *bundle;
-- 
2.43.0

