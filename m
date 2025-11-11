Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C6223DEA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821268; cv=fail; b=AHaUauQOjEZNwH0IbMZzju81LhZX4/2ihjBjoVQkfMi3Zndc9op+eOOqCWvdSKPpg5XVbCshvQCiJVr09LWwKaMvaG0VzzumpzzNheNGjdTpIJyqz3B/PFMjJIwzQwKNPwclbenCKuwuJSZsHEzPoS7MzQL9arOYwv63gQmdBXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821268; c=relaxed/simple;
	bh=qAA7XwxxhANSnx/6Lerd4vlVtK2bVrAPNwc/1giaBzs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rhe/RJ+TfCKP3tSvppNQr2w/tVjHWazIemBrDGxIbCOMPfl/vCgPZ42PYJNUr4kkoinuVA+HOX7hZtJWD+E58l4MWezWXxeWxNYDJ/w9p0SqpaMTb5449jOVCci4UGunkIS7xN5hZ/wK56Axc2opQP7u2KzYON8LIAoIOQ7cqN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WNxD0vrB; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WNxD0vrB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7XN4IKMK4bVBwv8Qx2oO6Uxgl14t7Wtr366JykA9MosiEjTGSZaEKT19zL/8YHDh+zpShPf2jjGMq+cjv+4TheCHzPu0roZExLkb9Y1l9Dl0MWX3YI2Alcmlq4R5LEaDt2AcVCzVzS5Geq2pil3hgQjXJjYthIMWoQnzvvj/LgXz1RtF3daJZjzo/XWqwayZkT6KlFHDCpyCeflUYtb9Qo/m9b4tHEhDClheYhkVDs7oVvwL4g+C4kWSzGBU55z0JZzeDzvoOQwCkQ8c3k8ZPjqwaLuU8k9o6LKTf+udGdR0XSIlJtB1xb15OKTzY2HoSuxZ4/x92wFyOWC42Mg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0DQZo9aRloL7+4wpnhBr9qd6mZcxsHioIx+pLT1o54=;
 b=fpZmteq4vlz8DGm7nzWM1Rs25HSchjP6yvsFLFpLTQszE57P4hY8TCZjFIqkdtnFmMkkWH43L24DMz1yK+2Gjge/Xc5IHdYWs0WMTHY/uRg0Z6mx1gJCIaQHZr4Ky3jReKm5TbwVot9/eG6dLx/5Rm6bFx+F7t8ZaKHRuEFpGy4gzMoZwebQ9xj4t6sHBMly+wyJi4XTk+9l4svpHikWZD/JUuWLymvfKCvkj9fWPiZ9WAcgHrIVwvvRSjA0FRxw22VW/1093L9gCPaWpCaYBMBVvr7C3++p7eiclXFztbMhh/QdJHsvMvOzBPWaatBobc5ewb5tWmQ4nx3XUJ8AwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0DQZo9aRloL7+4wpnhBr9qd6mZcxsHioIx+pLT1o54=;
 b=WNxD0vrBT4eGxqeJuvrYJ7p9NtEbbUfDt4jsuoRT/8ba3mKzsqpLo4RXqe2q1rDSpSaxVNhl3bZ8E7j923Rwl8RttLZC/LnxtA8AXiiI5hEGXKkmXZpNxt4zwmh5nXFpmr3XQWyOYQU1GPhF9hErokdfIgvfMx2YLtnX9wQyKmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:25 +0000
Message-ID: <87ldkdv23z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 243/292] ASoC: qcom: topology: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:24 +0000
X-ClientProxiedBy: TYCPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:1::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: d928237c-5459-4077-9039-08de20ba10a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sNW34ZVCdUHYPiHpWKroU4QfbQnmUWlMkfT0Vbe2rlQTp9fug7Qoeb+HZIg+?=
 =?us-ascii?Q?rM19BZ3HAksfgnx6i6aG/2U2Bdt5xQGMtU0dfDO873AeQ1NpcTqFHBiFs5pa?=
 =?us-ascii?Q?Mw1D/KCTDtbQMifXW0uyGK6Unxrufc9ReBxTR3zPbwklwDMAFQ47GAGhlkJ1?=
 =?us-ascii?Q?JpXdpzX8EyZPvwKy617pudljneD9P0VTXrooCCBLQv5Qhw9UD+Tix13I1uvt?=
 =?us-ascii?Q?M7lcGnysVstZSqOqT92SeVYBoqY1sS5zBFWggcLAaafAzwb5K317cniq0TIz?=
 =?us-ascii?Q?WzMq0UJB7+8cmLwBH2y6UzQ/1ORA1kXiYHKY6iX4AzdCtMf9uSypBRMMHZId?=
 =?us-ascii?Q?xq9XO1LqNEMHe0y1D2HBI+uhSTFM6xqDzGm9pyAqBRCrNjAmv8Rkp/b/jW60?=
 =?us-ascii?Q?XYG2l55HzIcryLQFxr5jqAtrRbSOtP0Q3+HbZ5/rQ03hBYYbFyhdE+LFfZfn?=
 =?us-ascii?Q?lOGqsrL4lJBcRjyFRu45Ic9bc5TwXoeM7lZYSygk/FtE8BJFGPvC1DJ+97BA?=
 =?us-ascii?Q?hwKTzRoBt8tWvqiopKi00oXu65rHIFAvyjpVe7HFkXG+9rBbMtaAY4sP0SFI?=
 =?us-ascii?Q?SoAojchiBfL5t7D6yTKwqQhaVkpcQaj1fUj85yEf6BFWV1bUcMLWbbEH4FGi?=
 =?us-ascii?Q?SXtAmBcl0yDQtmOdYSFOkgux/YnguvyedbKzoGOVyod34xyeVLgbNqY2+tMU?=
 =?us-ascii?Q?GO8LOOswJlk+7VeKgNNjZKmgXg8OasbHlP1k6iubQClH/NE230xz6ecBQmhP?=
 =?us-ascii?Q?1dP6PjQnZkzYuQ1bNlH1daH1NDtEMAYu2NNcmgEiP5UfseryVrvcCOg8V4ZF?=
 =?us-ascii?Q?U/jCjZFaDWVaT9UWqjj50yttJQElulxL9mJSN9NxRNAsVACJeS8M4kPO/RZV?=
 =?us-ascii?Q?K/NPfmUWfasC8/ULiKAouxWXOHg/nIZ+G1Ic40gni/OGC47MbFPKEvveN94D?=
 =?us-ascii?Q?ByJF+kPnI0frXR1frQyULLk5vuMUItc5oXLyORM1TrWviwf2+MCtQks4Fpds?=
 =?us-ascii?Q?NzMK0x1hsdohLYW068g0pgs2uUWIbQJ8v9T6u3aveZDtu4lMl5YuCgqKsO1U?=
 =?us-ascii?Q?fEoGYyYq7HPMIZlHqyMn/UpopUdzeoQF7CeRlZrJuocxsFyLffabVMI5KAsN?=
 =?us-ascii?Q?oAaxDfyDWmyD0bY419V8Pv5NL42CHXfuobaf/MuNxin4bA9PYtylxwyTy8RW?=
 =?us-ascii?Q?Dzn6WlHnNReXk4u3BlOTbBX1A8vjFi3wa2RlTnbtOl+ZdzAyCa6uh8Jsnekt?=
 =?us-ascii?Q?6OKOX+4RlGtp0GDQw6BY+3EIurel42K9QX6AkEJuwrhIsHmdG+ADw+3eMLx8?=
 =?us-ascii?Q?J2VK7IvOLCAjDsalxjfrnwyPiLd1YghuEV4qCcG7SYqLhiuncLtxmuVOta8/?=
 =?us-ascii?Q?rbRY0QTvxQeGuOYfJxV7E7E5u7SjQCG+kwe2dIxmLq6BRJVjnbpzG+IZAW9J?=
 =?us-ascii?Q?YU1QDt5VcNm0T+1E9IR7l0pB3Zn8ocq+E3t0tvavBKGTNQgM/Dnx3n/u/C6a?=
 =?us-ascii?Q?7Rt2Ii2UEN3BaYwtzCtc3ruIQC81E9GTCvlA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKUmNbTA2iBMIvfSBTdIaAyNhOjM3S7/0NZl6Ugry0WvbAAehtzw8XjxR9PQ?=
 =?us-ascii?Q?gAvkm1istXH9O4zLoyjd5DY0lijBhJ5EDEa7d4ombQ3ESAHVGdiBSN+e2Wom?=
 =?us-ascii?Q?IrFLQYS4EXZNHHYOiiNDnHcKXlf9lwp2KrHZOTk9hnJxoPnr2eSVHIPULUp3?=
 =?us-ascii?Q?Z1jX/PaA/2soWbhlxuEfb9xSLJd4R/FVHg3jK688uxR0sYGkup2sLjznczTZ?=
 =?us-ascii?Q?SfG/0679RAWhf3bd0uhIMzOcKjN8M+gajxW5dJxLKYDQQ6zDQd1LIbBxFK/g?=
 =?us-ascii?Q?Kcy/Z4IfF5+byPRH1qD8vuR94ltmWBqyeXPvHAOu+BlizPYwuBHW6e5ChYTv?=
 =?us-ascii?Q?tblHNov1KPRuWtZqUKz2HLf0w/uTFYCqt/l+idw56oJt8GxjVE0G2pOcqkD3?=
 =?us-ascii?Q?u2hxoeuxn3vOtRL7nH5og1aUxfea8EFnWlqFdn0AACbhHc9b9skTJExjiYX5?=
 =?us-ascii?Q?M2m7Hgarja1TP4Wvnp7bsOmvAxCY5dSH2uXCnwyjJH7qBOzC4y8TKlgtInt5?=
 =?us-ascii?Q?SRQ4b9B/v3WwCwdoiO7SUeLakmN1VWCtc250DKI/bqBT+hcD9hHBbHAiqnIl?=
 =?us-ascii?Q?OvA0WdnVJfw3kSDwQUuJtbqfpbSiFFKZNmRM9NdsgptB5zH4tie+TuNCmu3A?=
 =?us-ascii?Q?9hnCcTG2PAB7doPbR77hQP6H/CqQOz8AzSmQyWDIflrKAKVfTSIDe7dWiiFH?=
 =?us-ascii?Q?0/13NOQNETyBzpdqq/dVmgnGMnTUfXDzZaO48lFjzwTqilge1XkbeCjWIrol?=
 =?us-ascii?Q?WzfgMAGBklUG0PPqlUMnVqCSGRgAVxrjSPAIb+Dt1NkvXkUMVKYn3xK2TYNY?=
 =?us-ascii?Q?hwx+KJHrY0OjXIbh+n3uhdyn3gyOeJWbi4J5tplEmHIucD+8UWPjRPRIdbiI?=
 =?us-ascii?Q?scLWGax3fksdJ9yulVIrJx6sLZOKykIpyTVRvQhd3NpDGFVrDwT3ts2Kh3C+?=
 =?us-ascii?Q?VRHfKfUYlnNnuAg9+TUPR95FsC7552H9ELbvghLGiLX+u/ABteS8EwzwzXsv?=
 =?us-ascii?Q?7HQ+2CUidLp+WEwx+Y+qdedFRFx9SC6HQq8FacezcwwCDFvMXhWxzyW5EwpB?=
 =?us-ascii?Q?pRMLZsayhFm7JLcxc96mVyODcm8NwW9pLbtFMMHBicRrwMGn9EB1QUL/tyrC?=
 =?us-ascii?Q?nmOzbN6yRXx4dDuuR17XH5xSgAfdBO64Verr/RweP2sPB4TG3f/BTzeFGN0i?=
 =?us-ascii?Q?j37/ALZi1sDoxWc/9pNL0lqZQSkcr+ScHKYB8R3fCDrCcy6UOOZVkj+cvNko?=
 =?us-ascii?Q?Q+qQ+91oLkJbJN4O3zknpKnHoWihE6k/Q1R/Uz2H9V1szQfoOXKALGad/CU1?=
 =?us-ascii?Q?xWXUZmLxdFe1oWTyKmYmDGaa1ZVeYhP+qn3KSeu4M/wTnFKxF4rsby2ar4ai?=
 =?us-ascii?Q?J7AtJ7ZWpSTUjKQRSsvT1Kd8jasfeqR10Sp0qMsQOuiJjOVCHEIvvx4ehMWZ?=
 =?us-ascii?Q?AS26LZv1rjQYlylqkHOycnYcdF1WePgsCaohDQ04IZtv0mc3BoKwS2O6u9VX?=
 =?us-ascii?Q?H50QE40qqR0/ied27RiQIEfOVo+DgsMMIr9iv49oJw3ACW7k6Ih9WvDGdI7L?=
 =?us-ascii?Q?HdopRn8sfPOSOTcbQ/nbr0rWcBmbocrB2BmPxTpFL+iAcujtKcA+KDCwh9Wa?=
 =?us-ascii?Q?0yBJDzJSw1zJBWjAbe+vmb0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d928237c-5459-4077-9039-08de20ba10a8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:25.0401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDojg4rJjUwsE4bIyb7ZXo9csSiH2QG7jrxB9a9jib2FekAewdLOj1zgbeHl5KqpkuCCLVaecd+ABbv9ceTBdw5aSW9wm7VhLF54p0sazingUj0xXt6s4SuNnOfaJHpj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/qcom/qdsp6/topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index f61285e7dcf20..5ce6edf3305ea 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1143,8 +1143,8 @@ static int audioreach_get_audio_mixer(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
 	struct snd_ar_control *scontrol = mc->dobj.private;
@@ -1164,8 +1164,8 @@ static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
 	struct snd_ar_control *scontrol = mc->dobj.private;
@@ -1184,7 +1184,7 @@ static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
 static int audioreach_get_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 					       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct audioreach_module *mod = dw->dobj.private;
 
 	ucontrol->value.integer.value[0] = mod->gain;
@@ -1195,7 +1195,7 @@ static int audioreach_get_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 					       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct audioreach_module *mod = dw->dobj.private;
 
 	mod->gain = ucontrol->value.integer.value[0];
-- 
2.43.0

