Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA901607A4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820498; cv=fail; b=aYPUvc+HTGImFNF8/sJXmYoD7CxM/TK6bPhwc29Agft2nGdiYE4YbptTWZQ6BrYC9HfldAwmgg4ynOITYVM8bMJSTzAE4RqiJ1l9ag+j7uKIdf9Cn/X2qQx42ZyBPuzHNZd+83khbfMgLUO422M9tOxkRtAkYJ8snS/tYcRgo9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820498; c=relaxed/simple;
	bh=xk1E1gR/btASMa+Fitur2IjcGXRwnlEw3OoZ7vpjwjE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GUHyPaMsz3w5GvN7+i4wnJUd/vpJKZV5OiM1oidGqPnDFCPlc2rZ2y4yOey6HJHKvx9YUnIhSLhiZ9j/0sU4yt4nVSyNTKspt+4RplcJb9f3xd7cA3nkllLQE781MQsBGOWWLMxXf4jwpAs8ieXge2a9UDfRpubIBVvgp9I8BXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OO/mnX5a; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OO/mnX5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTPcBjbU2NOF11Sm2IlMQXfn7a1WbuPUY9vhKI22JuUb5jvv26HnHXAgnYJFF4v+6sqtLR9Lt66PxTleX6lUU0aU7SH56eoOxw1N8aEBrvS1LLoAcJZbFmFFoX3/ude1BNCyx5qs1gGh7AcMRt5T54zsSJ5xZpsaM6UWyBueo7z7CIlFM7dIvQuINvkP+Jj1koY/EtGyxkmfD4+JNY74oT6FcJAQSzXOVaBLdLSz3X0fSpEOvQ5t+R3SX/xsCXo70xOONrPovcn7sAHWf/ZD1/Q86mAjhQ4G3eMsmdBxyhTjA0RekP4g55OEUu1xBpPUwlUH2MU8N4GPpTgw2xNvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NGRtK1f+6JTySDnQR/gh2Gmn2jmewonA2JL9WW0EEw=;
 b=GrZFBMAV5otyC8dlLjR+OUzLtKaDT9QzvIZsY+JYE0+N7cGHMj5nV2v91KYa12V4+/M8cBW9mux5xHWhIXczOfO0ROwQ0Ea2Qsepu2R/Dw/w9oY4Ecp/ML5rYgaIOsxSOfYtMMAqKfqD2zcnSA7+Ca7ZfeGSKoB3CkIwwXhUyaCXkL9mC58J7QahNpPLb03geolQxCLiQyFB8u4Rp/voQ4hrmSmy5/qHCxnmBnrwKDtOZ4/0dghk6ky+anlcn+Hl9toME4VLoGpgQQgOFTkGevkPm5LFDnvKPEpaXIn2Lede1ESE1UkBRcvna3gN6KVRuhyrEob9pP3fU6rDrKbeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NGRtK1f+6JTySDnQR/gh2Gmn2jmewonA2JL9WW0EEw=;
 b=OO/mnX5amDfr91QPUFIjc+6+oU0TDFlEt4iGPTNvdPFhvjShYSu0dyKZEqrzPigVvAXadubKpw9mOfaHsnlEUirLhNCGNrPADWJGhVjsMn+X4+o5QDYTcRcXSLlVF3Sc/3+d93PJOVNemb/fzBzFLzkeHz2Ah+/Z0BVXqyugb/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:36 +0000
Message-ID: <878qgd771s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 052/292] ASoC: codecs: cx20442: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:35 +0000
X-ClientProxiedBy: TYCP286CA0245.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6cd2f8-86fd-4aea-e821-08de20b84655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hsQ7Z7daYSeMmvvHgHpvxYkPF9emb5DvVGP0HoRHELYqTstLGQxkzUIeQL+c?=
 =?us-ascii?Q?6CXZeNLQzEA6reko3NXPn20LRlBFE64h9SGH9iEn4gED9chqLLtkYXhmli7/?=
 =?us-ascii?Q?e1RSg0fpYmv9gYcueQk6RbJvAjJgcJ1sMFp5r2JRKZsXgArkwA+qMXGU8/yz?=
 =?us-ascii?Q?EBqUqcTI9432n68J0HWF6mW7B4S9LiLvm2yyFVt04Gdxr2kFFgGyw3cocJW1?=
 =?us-ascii?Q?E1W/pn07wcTcAe/L/8MrL8w4/js4ipC++RLwQE/Gfhnet9aaDL/O3F7FPTee?=
 =?us-ascii?Q?acGbU/VZb1QuMG02S0FUqZZh8HJEv/3Ll1+za/siSA4BZXRnES6W/xnwbPpc?=
 =?us-ascii?Q?ka5SnAXUefZ8dH4ORFcn4AtvHxvEujoWP1L6ixHk7scKoj1WXfcXX+EMcoBh?=
 =?us-ascii?Q?01xGaMzbM5pC/YPgISoo9ivK5n8IEjTT7r8t9lvBNS3YgC9f20KfIS1qdvk3?=
 =?us-ascii?Q?1qeSKxRmV0N5NEXWI+xvI9spGw4jVKr9gg3AsubEePainMAuwqJpELZQlezz?=
 =?us-ascii?Q?S8GmgboPo12K7Rt2P4QHnfSdbqwYRLlKxCH1nEnuFBxRhZAnzif4LLyhdvRQ?=
 =?us-ascii?Q?dMpQamrJS8VIlABTi4Mj/cTyqRWfO5gZg3EwOG3E4O2pLI2+mK/hBkqy/4vv?=
 =?us-ascii?Q?JBSrBDcEk5VVuYptF/6q2wnQttZu0gqjz34NPofxebm2YwHCNREfglcDn8K+?=
 =?us-ascii?Q?Zg0T5Btiq/q0cADO2jg9+yNMvssLrxB9YysfFtYt/re4FRvsmCuYAw9vglbN?=
 =?us-ascii?Q?6oQNmpw14axIc9tVVLSt5VMXj1QLbTRQzS4w3bYNhtNP2nV9zO/fnce4ALkn?=
 =?us-ascii?Q?XJaNMXB12t3ssJcsrdfBxlbjL3gjN1XyckKxROUeiaEnjGT/vv37gKuqsTT8?=
 =?us-ascii?Q?oObZ3Xs/hHUO1gbniP7gQkawX2mV2Fkm6mMxLutAFNQfEjHqr+rofGkUS3GC?=
 =?us-ascii?Q?dYZT+vKJMaT8vdybzFYoF4ORL/CWrrbovz5N5f84BGzgDA3I73pobGjR0PxA?=
 =?us-ascii?Q?E7dDCBN7aQx8xni/GUciz+kr2KuS1adSoDBVCaDEYTtxhe9+ZO3AvzYpuzy4?=
 =?us-ascii?Q?7OI6hdqT3xnq0onhVO5ktJqpFqSVJ68kir7A+bYcWzv04ISfGL+af83FBZr9?=
 =?us-ascii?Q?wRa2k6xQREQrD2NTDx+tyXShT9YUxnEQPf9UVgL0PsuK7xdEPSgXb4Ix6RHz?=
 =?us-ascii?Q?9X+PVhUSStDPqZelEYclZi140SwRnG2+/4p8oQP1CLJ+T1cWMhDdknj9UJr+?=
 =?us-ascii?Q?AwUzZ8YeNVpbimrW7IwbK/e4bxNA7S0T4GUx6AZyCY+MLczWBDjU5Kyr+Tk3?=
 =?us-ascii?Q?n806HBAKyOLtih0NZjwI/fZhAh9w6iei2Ee4a+SAKf9+K2Ik9gM/gefUwSwr?=
 =?us-ascii?Q?SADVrsRmho36//49EUGYCabW1DzPYnE7aLVdr3hzJfcnvzD9pOm0BtcXzMqu?=
 =?us-ascii?Q?f5w/WvgzGty5mDAK/RUo2dro/TuVKNBExyEARZyQOankahfgWT1BDFytM7ni?=
 =?us-ascii?Q?0mT7xF2UiKowPMP50EQMBE8e3MxTb7PuFrZf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?abOBD+eoiXM2rNcKc+sfu6DY7pMJFbgeAAho6fLpJbJeauIu0c30JCSxs2Vv?=
 =?us-ascii?Q?64Jy9Glcjeu3qPa9w0C/NWWYEpkAsktg+EvOxXU35Jde4+ZBX4+FDKojlesS?=
 =?us-ascii?Q?UlIuroeWuUonTDcJKsTKeWMcrnVyncls1fxHBbzoWWL3+FRKFPN22jOP3Jl4?=
 =?us-ascii?Q?FROLShiCEx0lEXxWUNK7iTaD22WWYx92FMyPcFdO63s+oMwoGUxicmlS1+o/?=
 =?us-ascii?Q?vCNeBS4ZZQiktb+YxVgDWB+Et6uiv4xAwh7sD7K0UTA7jLXqyqZTfMz2yFGE?=
 =?us-ascii?Q?nzj0K+5TANhF0Lvy00fBXhtAELhHNo5UCAIKcHsaM79Hhf+Vq2XmebAvUu2O?=
 =?us-ascii?Q?NlK6TWu04CqYiqClc1Q69evifaJ5sC8GEjy+LT3WQcCK940FbYcDcMnO6NyC?=
 =?us-ascii?Q?NHBpvWCMXGTx4vKOjLKo2phzGBcHHoZk1eYrNU/DpWfStVMruabzQR6V1j22?=
 =?us-ascii?Q?tpT2uDxW4boqsRxA0DURbBIfO2QQCWV2+nt7EqNXlBEgP82hNICZYwODzhjU?=
 =?us-ascii?Q?93TZD2LFf010X6w++W6fbK4KxKsfiiqfSVAqTHpJi2raNvPyYswiitddAjtk?=
 =?us-ascii?Q?qP+7YjmOVlUxmEJPvZd+4IdyWSfRHGrdU7dZY8h0OIVfS4qTD1ggIdHwRmH3?=
 =?us-ascii?Q?QXra7r0yEVusyTZBkU+ztst9ZEQliLoOWRDsz/kiI+8pywOT6zrV0Rcu866A?=
 =?us-ascii?Q?Kjnmi2rB3PGvxkf4VM+3Q1sZS2ZqvCSymK6GnlpKRd8/FSgMAKKLuJC7X+on?=
 =?us-ascii?Q?erveEb2vijjFQn/hRgVYJmX1zry8WPN4IPUEmu1N7fioQNorGNklsyiL9omI?=
 =?us-ascii?Q?5qsjcNfrDzb6Iav/EoioP0CWAZY/E3XpgvCYwa0BPf39XihMc1sUVsGnTPBe?=
 =?us-ascii?Q?1Ym435TO8FF2W1IohaDlLDmSZ91nhwikgYjNMgQONt8wN9hKZ+spbVHr5egC?=
 =?us-ascii?Q?/VceqWqjgVnrd950l5+Exszppptz8cTZQKh49GPZfxaB/Z19qN77O/eW4kOh?=
 =?us-ascii?Q?i3Pgu+Ia5aUn/DxCymA14lBDZyRHFuvu8tN6AC/0mwwokl59PdeVEaOxQk4P?=
 =?us-ascii?Q?sVR6PE+itGPBBVg6XE2V0mm0MbV60lpFWQURC9yMp6DjjN57FWZneQD27V3A?=
 =?us-ascii?Q?tleB7s14jvI8muin9wMDdV1PKrpr+DmSAKYaZtwatMx7fr2/3mObRcUZnrQD?=
 =?us-ascii?Q?48Oeh+Xqe584sQYQudHLrsIRjCMGm52DECOfJPlu98EI3OlLayLx18Rl00Uv?=
 =?us-ascii?Q?LiqP6NimdfdA/e1c+kr3ZqvyTpptS4UPQm6bYOl6+zM+D5i2ENg1eU4iJRTX?=
 =?us-ascii?Q?pLfK+UE3TqqJ5BN+LhhkTt7rIDxEke6E3iU7ORU2sAaTvIY1CTpaliK+3Sfy?=
 =?us-ascii?Q?VMCmMjQqTJfcfxQ0U5vedc6ZADYauIhEd3zg3AqDJmjpvnX2aUFcCtdxlYIq?=
 =?us-ascii?Q?/+vIBwXO59OSL29VkKUxrpQqM4V0y4PKPf3MxM2+I8OjDYoPEk2O8uX35kBg?=
 =?us-ascii?Q?VRwUV0zNMYR3WlGfIgllAuKNIvegiCGNCyO1nhpspCrbVRs0tak2gYhm8r5e?=
 =?us-ascii?Q?fe9oZE1ZzjSPxIOWAV9w043swKGOCYGRga9+lYA9RDysp44UE94rFF0nxUXf?=
 =?us-ascii?Q?DvNzZrKsX2hSJAHaCBAVQZE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6cd2f8-86fd-4aea-e821-08de20b84655
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:36.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYAK6fAnL8DGzRkxNdruyGfiL6K2TFlgUrx5E7fU+ft9E347lhQObJNvp3dv+qxqUbhSfd34WKa//TMAmSk9TdkRBa06h9RcUwnAa8/hpudFGQyqPkcv+Uld9aiLryjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/cx20442.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index 9d54141a0cd1e..d6121c0a26167 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -315,11 +315,12 @@ static int cx20442_set_bias_level(struct snd_soc_component *component,
 		enum snd_soc_bias_level level)
 {
 	struct cx20442_priv *cx20442 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int err = 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_STANDBY)
 			break;
 		if (IS_ERR(cx20442->por))
 			err = PTR_ERR(cx20442->por);
@@ -327,7 +328,7 @@ static int cx20442_set_bias_level(struct snd_soc_component *component,
 			err = regulator_enable(cx20442->por);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_PREPARE)
+		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_PREPARE)
 			break;
 		if (IS_ERR(cx20442->por))
 			err = PTR_ERR(cx20442->por);
-- 
2.43.0

