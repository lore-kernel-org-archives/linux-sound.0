Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027A19CD19
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533987; cv=fail; b=hUp+uRpFm3zTkeJ6ylx+q7m2sKCHgCcqIDZW4nC3mO4sasWCiPpwDV3FYDXSoWKnUufub4Noi0maU6ApDvHD9QnX/lV0jZpBXneMJv2vmOtTYu2wkp190Gavb5jsYebvTXjSUnUkWwwX90Ng76t4CWDhy4Sz3orCSKNMryLxmIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533987; c=relaxed/simple;
	bh=FoLhmLirUaahiw3p37Y7wgYo8eSn9PoakVy2HTA6XYI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wj1XH558cW/gf2DsKagzQjtib8NSf5PMBvhJSUNfHG5aGKs5fxErGF4ibuwUygcjD3pmvoyskMHJWvycouaDTPSOo985nFfiJRAXPqWdUKIG5Q9wHZU2wWjv6EyggVbPaAnSdaz9Uhx2JsbLgg55q4FRwtxZxm/LfWjZusrtKqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SXwXvYX5; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SXwXvYX5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aveEvPbWkbtRO8j77zvcdsY8nzDMYQ2wNChd/rhUEtCxSU0zLWxlm8c0vKHzoLToXoCKlnpgUUpIq1o9BJlcDWJmWXPlRLf6A3P3VcsakDQUkaFMlMtm037kw29dcuwpIJo5n6YkoucBIj5S1rKm1gxS8lbDde/w9zz9vi6q7D7+gEKaWr3GBcKJd6qn19xSY5H+pFzuKL4QQcrvvWuV36eIFW31thyW/+rnInsitPIws/Kr7yaTz35dOrxbk6P7IPOHo1kXBmUTkeNXtqpMuIMTq+HrIYrrQpNsYKFUpAw8RcnZknTEQpyBV8i+3ybArqEMo/ba8rXl8TvRPwAJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGh9cWB91A7D7safx7yMOvDfP3lo9LemjwOCiI+5U9o=;
 b=XWWMK/zgTDp6uiwehyLxE29/cM0mXHsNxpUyZQ4Ifeu1lzI/Z/TLT/JCuj6BzfbM3Y0yqoH6HgbhKjkJWCkEWslm8uX4puQxAHMPleDfVOZL//bN23NKERI5A/lER6yIUNomYwzR3lkSatBrWpO3N4ghss0ASmofdfNACw1cqTjjLxrX+n26Aii4vdNWtI0iFNeMeau9hvCL2nCojYZIKJqoeiU88FL9ka0G6cUdrjhKBIMGvl0B8DLpytx/JEppPlxxtCHkR0CaD9eRu3d+tyyVGUi6pEo6IUN/XNOj/EXj3/zqHD7IygSp9BKCis5jsIkO4ubs8Opd5UEiC3f8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGh9cWB91A7D7safx7yMOvDfP3lo9LemjwOCiI+5U9o=;
 b=SXwXvYX51fH0tXlMQYXMV1kx19xl0UXcOwCsgNewbjdtKcufVxcO2Z2st2zVIiMyNhrsEqQ3gC4R19REKy4ufuipyniYJPTHom6cLRydIukV9cCdIJXfrm4fphio+eRuB4of889aPY8Oc0LXkjrJ6Txa5lEKEaxg9PJ52w7Rxwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:44 +0000
Message-ID: <878qpt8owv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 155/157] ASoC: rockchip: rockchip_max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:44 +0000
X-ClientProxiedBy: TYCPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:405:2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f17790-f21e-4006-9243-08dd56067240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+A86kYP8Gq9zzDkeA9bkB2iBvavVwYCp1oiKqw0tvydJLYlTZpcLz0XXqrbJ?=
 =?us-ascii?Q?vfmlqkS6ZNDgqSvfytXtgrpO8Ww7+wAoiZLHYrzRWmu/UaQn8NfIagPHGdTA?=
 =?us-ascii?Q?6Gl59ee0wA4ih5WlZJFDkymGqwieLe8lXY5d2CBqErNHF6JF7UHzVUsqPEAI?=
 =?us-ascii?Q?gFTBC7J53Ht1E01r10R/GmJggkIFaJ1JJLWtfv18ULAdtzc8Vlps9UclXbBY?=
 =?us-ascii?Q?P0g6SnpqV3DLUkwtrRA5WwPPpG2P5njztkLlxVDzbYS/T8i3Q1Oax1ZUR5+W?=
 =?us-ascii?Q?Y7sshqVRZJvv/UnVCm2jeQ/+ImAO6uqqDz//fzy2SvW7jllPpMAnQp81zSDf?=
 =?us-ascii?Q?dw17m5ci1jyMU5XLeAJ5JdKj4bxw4aaZdI8WhKTQyv6CAdoWKoZUG9F3LJVI?=
 =?us-ascii?Q?yVaDlOdzf9l/iBFWq+KHd0LcZfphKC8k0q8xIjP0R1jw7TZLaddGOzm9tkzr?=
 =?us-ascii?Q?3q75KKjix1P4iBwD9bXkih6st11PDYuv4969K1SAlLedkPGIN9IdRahxm62U?=
 =?us-ascii?Q?0rqQPo5l3IsFkJaq0UG16XbUeQFiYWelLsGESmhhQM7T0zJqga6i5GcV+Y0y?=
 =?us-ascii?Q?FrkHECMjgsmGYmo0vi9p3bkpa+AbQbVyHRtVlhRYeMtHGGU8xqR0xtP37FeK?=
 =?us-ascii?Q?UHlGp8gs1lWLDVKPajPbGzQ7E607a2BqDUfoycYV4DJb0fTFFs7Cg0TvMKLa?=
 =?us-ascii?Q?+/dLnQ+eyOXWD4FjYKG/I7jFqO69pYBLCMkXSHqZkLEwOD1U9eSBy18fPmqI?=
 =?us-ascii?Q?y1Bk1l4X2jE2scnhuqtmBjj3epvyLrdr+eaY1btf+dCc66uOFTo5NP21UCFt?=
 =?us-ascii?Q?Xb60sUMKsEa3qQqaJ36t5uwS/IQSdWUOJPi+aTwgHPR5D3sk02ziS2bvSzbF?=
 =?us-ascii?Q?lYaQWjq/ED1T554OSTjgSesMrHpD9CbJQqiwVEHwZps/wVXMTduPGcKM8e5/?=
 =?us-ascii?Q?6TecwT4ouRndVgIyM70nBVBuOwSCMA+pJ3gHm25tu9dI4m7FOUO0PdvgXL0E?=
 =?us-ascii?Q?QZieM3RSpNadYMNMsxmCU365BWQhfiMmdA7otWAf4+kCDHYUesAcsQUMFCi0?=
 =?us-ascii?Q?SVkDQKJ0xPteJ0sEjJr9BsxOO/6BlYdEakkkmrVRpjW0hoObHhjfUjpDgU8U?=
 =?us-ascii?Q?wilSaUucKPCQOqxgQnOKNSlVPmVxKUN6FSaAz+XftSrWxcFzJED1LgkeEBj7?=
 =?us-ascii?Q?x/K4OYBVjO0M3hT0AFy1ldJZwOxMrb9HHBCVCmxhpLUOykZDdm2oDL69nzIB?=
 =?us-ascii?Q?eXl/7LyaMM5vexIPuRB0ZacTn2Ekt877NCpV6QhAvGZePENaA8l9cwBlEfqV?=
 =?us-ascii?Q?u4jswR6IcFCF1n8YLsbS83alQCqTe+i6PQcxiV4q6Cju5Cqks9V+il0qaOxZ?=
 =?us-ascii?Q?f+NeeVQf7bKPq9uU0GegHIY9yovVc7HQorjnGc3SK2lRrDSNdCMnSyHJ8cY6?=
 =?us-ascii?Q?IIBVldjvxNrapVQxFZREmPv6pFVg9o6a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1nSLwcfejzg16ileceeYxrQ0QPcViypf3fY4FW9kmH+wDG09k7UaSLv++Au6?=
 =?us-ascii?Q?XM88328dDfSRhWAzl42DXi/8mwWmGIdqk/sM++rPLVfs0Znz6wsoDQ8IXII6?=
 =?us-ascii?Q?ggbPOhaYzTtXt/ell/2lRsv0DdKsc5bF6nOMNXqRH1SYB0IAiaBxMZZiRobX?=
 =?us-ascii?Q?X2EdlvgZ9EARaoMumfFWbpJgsTUhH5bmmtA7xp+o6pa3QZN/BLA0YL+Sw5nR?=
 =?us-ascii?Q?nZayd5JZPWza+5mV2JKiLm+j9X+Y9yIqHzuhvV7dpI/5YMHMDh9dt5CpGCTj?=
 =?us-ascii?Q?Nm1mU301tgNbzrcFBDLrmBLyaLnBMZPQyg8aJZMmAWtIQI0ot4v1uaY4xlHn?=
 =?us-ascii?Q?lr8s2Cjr+v36tF8L/qN1VGNdkl+IfHKKF9vNhFLjTRYqiSx/3xuo56bcEmMt?=
 =?us-ascii?Q?pu/vjRjeA7wrVgXzT8QVE4dOPybrowTxRfwVpg7Qg95skVnWzadTUwsmmH0x?=
 =?us-ascii?Q?ps8WsdnYvemiNN0oVyyv5BiLOjoASvoEEmPEk41ilXRKvfai2NdL1Gsp+oPV?=
 =?us-ascii?Q?hfMNL/GsCBXcXPTqqEj/AxkpV92uqV1u9DUbNd8CX7E3IArm+bE4Ju3wXP5s?=
 =?us-ascii?Q?buuMdlt9ckEWCP+9DMxk2VkfSGAb5XfC5JhpvpUnwEdNUEryDG8lnAiGoN8U?=
 =?us-ascii?Q?yOsCBTS0zN3dxWgQPUiIvy14fleHUSAORQfzfrmGxzLAq/MUSy7MshFylozR?=
 =?us-ascii?Q?cdyODwFy67HqTgmEMBVwMxpvEmF01PxrnbIK6ihw2BJsYzCvwp9WdL0zG6ZL?=
 =?us-ascii?Q?rQjeCbefuZe32Sj3TfGRKMzcgf8ppzUJyaEvJ5Yd/UIJoJ4d+lM8jptBmOwo?=
 =?us-ascii?Q?nsaZhKDITeu0LXLeAeusHthRgohl6VzO+AWKLMc1TzErT2ERhPayJ2+Iryl1?=
 =?us-ascii?Q?UPdC7aaophE3PWLKASow0dH+WEI3HQoBG9E8s3CEJ0f7D6chbOWU16Kb4aCq?=
 =?us-ascii?Q?tjhxF0WzwyAsMuCw+bb/G3rKNiSq0GjE0IZtAGnK0pmZO5PRIevc4F1EyaO3?=
 =?us-ascii?Q?8Lfl3LyzqWyZVRX2qwejhONgSqKOYvcEd2n3loGC7i0wMnZ8RGZWPC1J2VoU?=
 =?us-ascii?Q?7HO0aOzlEa9SNJb2wZZf4QC2m+UF63gUuSIocEC+yVLStrHZ8rax0yPgTQ6y?=
 =?us-ascii?Q?AhUuo9IUKGCX7sC8gGlA/UHWFTtbT878IPrIKm5BCdQyXf1Cd8JvZ8qUN5ko?=
 =?us-ascii?Q?BzR8kEJEnn1yS7Z01bCg6shm8euQzMfmGPiMTiKmnMSO5j4t2c9W3OzIr5jV?=
 =?us-ascii?Q?OfBAbPf31ykfbJ0nqJVWrRh6YLE4VwvS7WFDm4eYnBVybbLZkt6ZanjLRIw2?=
 =?us-ascii?Q?2Ts+waMTe/obICWRbE73vFtx2A3/7Qj/sFSaPpe1fDhfmEr8AHVxffm98Vgp?=
 =?us-ascii?Q?hsvZWPdKYKRzGkrEARKHMLu0U9xgCkpJum5HNS6eLbq8MIu8TYZbX6YuId2Q?=
 =?us-ascii?Q?LgMaNVTQFUidUo0HF6vOadYbb8OOwEMz2bWfplhi6Ck/qTdN6TRjRIb17+S0?=
 =?us-ascii?Q?jKIyKhQllTK3w0knpdVGqVyoFo+wpf4HZ3YhQ+b9rfWqd8bzw1YG5gY5uOEJ?=
 =?us-ascii?Q?rI8wBcxmjVgcUJFJxTKYRwcQKN8eBzO6tnAe6S1M3xdLB4MRUMfb3Z/daZpF?=
 =?us-ascii?Q?v0Uhh5ycks2SYWLKEdDpwjc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f17790-f21e-4006-9243-08dd56067240
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:44.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFlajJ7F3XQLuouF23gX3qQsvbqQ8at1SwWV8T6yX0GwFzDPOj1+2GitnBYsbltZUY3bXseiTxnWaDJ6Qa/jXiwa+NttVGawjUKZKKXZXrcENUP1KxiTSoQZRZTDeQ/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 783956dc83b5..b8326e9143b6 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -247,7 +247,7 @@ static struct snd_soc_dai_link rk_max98090_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		/* set max98090 as slave */
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(analog),
 	},
 };
@@ -260,7 +260,7 @@ static struct snd_soc_dai_link rk_hdmi_dailinks[] = {
 		.init = rk_hdmi_init,
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
@@ -274,7 +274,7 @@ static struct snd_soc_dai_link rk_max98090_hdmi_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		/* set max98090 as slave */
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(analog),
 	},
 	[DAILINK_HDMI] = {
@@ -283,7 +283,7 @@ static struct snd_soc_dai_link rk_max98090_hdmi_dailinks[] = {
 		.init = rk_hdmi_init,
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
-- 
2.43.0

