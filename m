Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B91A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820745; cv=fail; b=p79yx3xRzTqSvkmEBJ5nzdUw/BCm9Xa2LG3xAEjlnKu7tVC38M2ZZFmx1zeRJRXeaMlkzuMFKf0ympfTO2sHz1t9GI81uTc8h4pGMeygIHjwtdSZOFcc1gd5FQ45N6it9iLOcGadE5J7KLyuVA4Jl1w92m4O59jPGKCsbGG5FfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820745; c=relaxed/simple;
	bh=VoxfLsYXSHEeCnQuc/1NS0Ei9UK+rE5TPU0sX2MlXGw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UKMflbWm6oFjkMj5fvYg7pjvFd++oj4GuBNgBTerAYt9y/xiGIfSX/KjuBGxEGJqODfP7YhR/NKYECjKipoO+yu4CkosHaa/wdB0BiMHSmnRlQGJv+lQwz5caq9KadtuNXyOIDaB3d8mFochGsCcJRJyfPkyPYPV875JvfklfS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SB0CpZyc; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SB0CpZyc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBrKV+fLQHWJr9UisUQm9skJpD/HqXoBDm4b647uLyUN1JnqlwDzoXBHXwBwl6bwM72lo9EZyw/QPUITz/j9G3rP/Um9DbTFS1R7+kkOPzAcOq54MdEShyYdGpK8U6MhNNlKAX7ZSvAAdIXrk4PxIgoPhwWqqT6mXp0uIaIMulTd4EVt1xmuc/2FDeoHELSGQWmLvkYU5Zj2X35YwthjzqA2gpIcA0sEE/KxyA7sg64ueepVneT5+u5US/7b6hvsIATcr3tIjEm9EmcFas5fOULSECYZ5i8u1X6TCe7davHICMozuis/fHUTvOsH+cUfHWeU3YORqKAILxkTljNePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ulU/9Dl6x9HRbJrEWjGleyac7eosHJj84wVYqPkNtM=;
 b=LzQ8vggSlM1x7+pesVyw4S3o9UAJcVHYk9Skv5fdmWsqxloZk0kIcVlY4SSqROzVvpKJofuHtKX5eDxMpaOsYbUasJR0KeVa+A9zqA5ji72nQIC22nW3hf/wnOMs6UNrBkwgI6uwz9//O2qjoMA3AVR8T8OZOXgEkjy0sCj5lkJG5e0GbDd7Sh7mUQ5fQMezBVKezCrDdBZWUaQfFQINwTyAwBCc7mO2WL6cbxPS6t7eAd/2fk19Sgy4Onqevh8qiX1z490cIL9Qc0HJX936RaHoYaSNFjmeXJHZo18bYWaf3POTBf2KfEl2N1ahG2txDfe1lcJG++eL4zT84q+dlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ulU/9Dl6x9HRbJrEWjGleyac7eosHJj84wVYqPkNtM=;
 b=SB0CpZycluwvYfpDIND6CxAhlJJSXi0NN5AWRJu6fH8M3vcYu3JGzM4L9g3jQu6WqSJySbbJPj4NpX2/fL4KwjAAnjYcMzrj37eTVRhNk4VKWJJvHqNsGdJQ2fIa0M90jWyOEsssQI4cOGfIZu9xQi3iks/IdtuRJ3NT+CpNxcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:40 +0000
Message-ID: <87ldkd2z5o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 118/292] ASoC: codecs: rt5682s: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:39 +0000
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef7e2c6-279c-4f2a-c4ea-08de20b8d7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ctuNk7Uhzwg2d/roDrxGO99pJUxzs7uxvebeH659EQwi2z9eyK9s9LPtyyov?=
 =?us-ascii?Q?cqsmYVj5fw9082mVvqE66PZO2/P+Dbs/RpZ6F+SZcudC9j+fDiD9vdVqqHYn?=
 =?us-ascii?Q?XE4Qn3mVw84RL+jucFSi44JkTR3aTyHHYJ3pxDGgSvZpCxvFQv4YN5DhTVlw?=
 =?us-ascii?Q?NQ+6Wo78XV7cA/rHQNL2CgA0tt3dUmod8mNW/TQMs3KySdDHyk0Ddx606exy?=
 =?us-ascii?Q?Px1+KsvhIUAsDLdUL/JQsmuR3IjTFhUw0LgmhPAnrr1OQnYeEg+ENtbcBk/i?=
 =?us-ascii?Q?o+5zC226YG02Db5hqk9B5vkt+yhYrSpymo6egdZaHtShTtL7xIzIsa3fJ5Ed?=
 =?us-ascii?Q?KlkIunoj8vTA7DQqXHaSB7GLB7wZ2pFYq9RiZ4q2X45DVYGLy6BSa/ORODVM?=
 =?us-ascii?Q?oQwF9RBm1KZ7fjJkPz8sevTGGB5b6kz/7LcEBgTflYwAVtBnK6h1x+kfypaE?=
 =?us-ascii?Q?D57ZWzUwrIHHb73gxI7DBaTwokSNEhU8qJNMM3Tn1AGyMeXl6UyJlNRQJXEl?=
 =?us-ascii?Q?/su4MSD2eJZaEquFPojTEafEPFMxhN6i9hCtfsR/pSA4drr2VDf05I1hK+hr?=
 =?us-ascii?Q?L0qFLbKFOk4kuTkF69OxuS7NTSJ8uBqFAKqFSNDknv266jVhDrLll3qcaV+b?=
 =?us-ascii?Q?nExkXhxlUmlFi+8JxN+/xH2hBF18MtIB+9l9059j91DgCH+38ax914QtX6PB?=
 =?us-ascii?Q?gbdA+lTdn4C4TweZjJIqCLaGpLLQ6J7gaMdBWc8hIuqc/u0DAq2MkzQuGLB+?=
 =?us-ascii?Q?GjEZbmzcC5/nmgej0oWrkapRsAE6U2l96cn//AYMwxYsx8yn2JUaviw4kemr?=
 =?us-ascii?Q?0jUYymgcpi0w9Q6TycDrgPVdNV12fW4ESrF/HRQFcSSmf88q6r+Dv/BrCd+j?=
 =?us-ascii?Q?gi9xVgSdTgciKDBzvXA1SnGvFBB0ajbjq9UOGlbhWvmhBy0jWQRtAoo9u5uq?=
 =?us-ascii?Q?71mmmQp8tprXGt1FcPxZtgNffH4pFEpQoDoL8Ai60dKzJrq+8M1lE/QEdwUM?=
 =?us-ascii?Q?hjuVwCMeXEHN6oH7TKCn3UeJB42X1ghP/seelOgcdFZ1Bre0lugqySTwO29H?=
 =?us-ascii?Q?Vl5aN4lbBUr7mmQtGhglVLDCImOB2cefo2TKOXuRjeN3RoihmePXpYYQTnQK?=
 =?us-ascii?Q?kTN7WAmd1UmKAw7bOnzzuPkjWiruHzrPBZNYED1DM90OAwkNxZN3yxpLIZJg?=
 =?us-ascii?Q?55aEK44kyslWSoWewyAbIViipchxpjqV22aqjwnPLtsY6hOynHYenPTFAQZn?=
 =?us-ascii?Q?M+y/7LMUU2U7Hywv9hZjc2OhMRJ7kfKqkQiES/GXll8eZsOaheo2BeNJz++h?=
 =?us-ascii?Q?Rs+OPcAvo86tXrtXyFzlWFIS7Yv6jUKVVavxrs0ylkyIwNsFpCG2jf1r7A4J?=
 =?us-ascii?Q?NRE8P7r6kbreGUC6EM+dDcyR04ZoNLIT/H6AyoSf5Zrd6Pcw+a4Ku3HXLlrl?=
 =?us-ascii?Q?6eIinabG/G3wFTMaNQbNU92ZQ6W4RvfguncjVMxBiKtLN8500FOHpmTv8ASi?=
 =?us-ascii?Q?wHJMWnMP6EAGKa1vQImBuFWmYZUZErzM6vPc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MD+tpr5qYu1GOcHK5d68BJc4A2+PN2UWm77lh5oySFcxEOELm25QoKD/ktl2?=
 =?us-ascii?Q?pa+rByabD4Vizx/q7h6f833G56dAvqxNvNPnUIGf081xDTy2gEsLCqQPjz0s?=
 =?us-ascii?Q?rve8wZRWNN7vSpgJdO8ZA7DDAzskX4VbX3oLk2h3eQEOpgEvBKbCV6qIqRgd?=
 =?us-ascii?Q?Gy7csAK5+NfTq/AWOmQVhorubN6qNi1T/AQmVPLUfNlGxa5No1v2ZqA6cUaZ?=
 =?us-ascii?Q?YJRpEDGBg+zfo3aae+lDPs5HXbvr3Z3wWOnbFb78VynKX2O9tGurHM8cy2xS?=
 =?us-ascii?Q?w3WEZTp40+HREtf2Oe2ymn25Kd63iikcQzryES9Ro/RYycteraUaJKD+Qvfi?=
 =?us-ascii?Q?82UwMpjgTCUDrz9yAK0LSS3ca90BcR6dtqI4E09hT4U89XxUbJRv4JXgxeAj?=
 =?us-ascii?Q?g/s59AHXGDYgLcHImEGivOh3C565Fa9Zm2/faRgzbG8DJQtliDYaNw6AJne2?=
 =?us-ascii?Q?f2u3QqRHqsYLbYZMqdaQx3D9g8CljELOvu/Js8RoQJ6DarGEg52LJjkyQSnJ?=
 =?us-ascii?Q?3/ZXStduhvVuGuRxe/FMEP76ar3rTAMdr84QIbmwEpVLvPfzVQ1JTB+KYMl+?=
 =?us-ascii?Q?Hqs6zomQ3PdKjAE6AN7k7bz3Yh65sBpvAQx0f4ju9MFRc+IcR7n6iratABf9?=
 =?us-ascii?Q?xMcFgHGtCZk5ihnPqtvuDQA/gh7/cwbxVtftSFQheY4GfidzrFQ8RR0QpvVn?=
 =?us-ascii?Q?O25uT9hUHuvz5NJ+O7X0UDQqLg8TvjYiJwy53AG1HCaDTLCiYzdPL2sVkGlc?=
 =?us-ascii?Q?yF3JB58ero0gqRdfMd7sljueyTg+xbacOEpto8z363mz3VnsHlMdEsuNsgOe?=
 =?us-ascii?Q?zlbSW2DzgUzAlynRhS7U3rncQeuAcdgxHAQX3IDSX/RYI789KBJ+F3cA7Swc?=
 =?us-ascii?Q?skVxshd+U6Ultmeiy4Ft4m+35SiV8tCYEmBCMKeuD4E/DBCnR6Jai+iWwnqN?=
 =?us-ascii?Q?QApAjlE8xXhDWCXcR+175YpBLPwKIqail12OxSNdKCZtQgxcECiYGTJ8eOsw?=
 =?us-ascii?Q?TxeGdh8OKKuwLmt3Z2V3hYIrvKtSi+v79vuKIpwRH8fGkKhyfHx6Mu1Ual1E?=
 =?us-ascii?Q?fkkfwdWHQtr2DripXNaJ7rP2DZR7hTdyrqSI0FB+ji1F7XJO+59UqcycseRe?=
 =?us-ascii?Q?mYLUC2TqlvmxrRRdvCshD4PHJNy+Fctef9vPvxEePL+jfgcjZ+pv2CntzD5a?=
 =?us-ascii?Q?RmxvJWiGLUqFwJA8eAbwNZxecKAJhcYAWvO1eG+vRmrNPCcT5RiDaursItre?=
 =?us-ascii?Q?kxacndriMnVlc1+mKyIKHugGPBHIvHP8rfX18Tts0xkuquWtnkNXLXi6kREM?=
 =?us-ascii?Q?4WXh6oWVVmKfAXaMz5Xl2UapWeW4AsAn8Mj2IREzTNyyEiDuFDjaOtPQFy7Y?=
 =?us-ascii?Q?zHU2OPXh81q9HMtMG7xuT60+LMA+lvk4Wwv5WuGiDWPoXZR/30v8SgM6Q6TN?=
 =?us-ascii?Q?HCAhSViMXaIXgMItK+hKF8yIA0rMFVoNGPoBBzXcoDeJElrdCuZRERtu5Z4p?=
 =?us-ascii?Q?71sU1wxlGQllp2DLwyqXZsIOJYJ17MhnDvBZZjIrZqTPRR5KRK+ee5ShW4WH?=
 =?us-ascii?Q?Kpb+wJBhVX2BFVD+YwNzDINI90LGjQYEElPudgC/ywi0AaCQFOrjEGcOcVRK?=
 =?us-ascii?Q?AuAyXs/FuzOgVEBlF6K3u0Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef7e2c6-279c-4f2a-c4ea-08de20b8d7c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:40.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsMglDGOAfYtS/XfOl3t+EDuJxo7v4Xi+b8mQZltJLY2JrWxK8w/8digT3Dh1sIETW3nscxZ4mgAHWPSP/8c4idMqKjBrBwkAr/XxTG3vk5dOiokb+u4jSpymkhSxMvV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5682s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 1d80a4b862e27..98de94a792603 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -841,7 +841,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	dapm = snd_soc_component_get_dapm(rt5682s->component);
+	dapm = snd_soc_component_to_dapm(rt5682s->component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682s->calibrate_mutex);
@@ -2485,6 +2485,7 @@ static int rt5682s_set_bias_level(struct snd_soc_component *component,
 		enum snd_soc_bias_level level)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
@@ -2492,7 +2493,7 @@ static int rt5682s_set_bias_level(struct snd_soc_component *component,
 			RT5682S_PWR_LDO, RT5682S_PWR_LDO);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1,
 				RT5682S_DIG_GATE_CTRL, RT5682S_DIG_GATE_CTRL);
 		break;
-- 
2.43.0

