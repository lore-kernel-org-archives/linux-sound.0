Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA41248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064189; cv=fail; b=F0NIduui8Tc7qGBRUbpFgXL6KcezYGQrX8YC3peOwf0PslIBvi46jr+uANO6GAVLK4pWv+dxrWkU5tsPzv3gdQnfLxqfTSNdKMZDAh7kvbXaclizbNdyM+SdtwMBrEC/ysI21JEUYaRhwx8KQF7H94hGkODAjRiE+dKE6A3Fbig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064189; c=relaxed/simple;
	bh=eJFXvsofCrgP2IBmQ1Q8d9ThkXe3dbhTa2yFufhyNbY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=H0Tmg4rSBJwvxeTyNk102zMhTos5yMYPjjtOidD2bPcN/DXfe7nVGIJBW5E4S3H+FFgJF7xIZPswB/OVBqP+Be5o3wXOQIU0mxfsfzTXrdW2eIouCQtYHtvHe3mM9Hh3buwquFOV/aMbuo52MtMHW0X2o3bnVKRAv5t07NZs2NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fD7gvFgk; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fD7gvFgk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqYzhSHpKvqWoLTbL9cO+tG2Nf6ZICoqNu2yPS+nvNXNvHNthZYsJfB3qiH7fbsttdHqFDzbxuJnsPW8UlV3hfeZi9xs693ieALurGGfh2xzWxUyWJB95Bv8Kl/wKDYJdUGLR4yEmwQnUXKsUjCWK4BsRmnBK7xUQO7bw2UeM2dFTMRWbocng9OhBo/HOa/yx5lMGwY8RXeOnGZCQTgZpyOp+bCDZW/BgxWeeUPrM5MJUwKkJAjSZVe7LEqCuUOpAepHh053akGQW47TmHfh+rUdOVpZkmgRaPzsBg2MnuOwL9U2jQdPqrgNu24dwdqptoX86pB/JyU78da8kCZ/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5083amhe9neqdGMK9b79ve2esRnINyN+QW1NY8Q0NN4=;
 b=CRF8H0FrQHypJZ4yL3CNeWz4tTGbMU06bQzj7q9J894cow3oiuKZCOy4mwxzbFx9DrMln8Chwf1q+XURSfGOeUdZ+Zy8SwWI1yWppjg8i0aVuPK/jJb3HzqUwgcS37VlLIXiCY4D5pTrnZOhUlVkfRc7BZjZOj8kxnxRzkhXAZ0Xj6AR4iYfyyU8ylVEGplhs+02n4mshce65uxNRthxe6SI+RR9I928uryDRAq1leSu4o75H6Pk/8NSX4M6DmXXZOSCM3N01jPxPxi3vUkQVXbJ78gqktu/Qi9JuBizB/0fioJjMkX4WGXr0gLHivARzC/8Z324tehwL1ZPFUuNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5083amhe9neqdGMK9b79ve2esRnINyN+QW1NY8Q0NN4=;
 b=fD7gvFgkU/JkXFKLROR+exMlq/CqU21rKvXIE/tgw7kdKAeK0Uc/lLVmIeWlE0P4LU+a8NI7MrVVuJBDV4gu+4a9bvjpwstQKsshgRDk+dYCFJvyM9WxD649gFLFWMRTC8Y18Mnbj4t3bNZFx/2DVajk4ojBk57bKOc2usWPygI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:26 +0000
Message-ID: <87v79msq86.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 33/44] ASoC: codecs: sma130*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:25 +0000
X-ClientProxiedBy: TY6P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: ee08c4af-b49b-429e-4ab1-08def41eb52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VFgDES2c+xYzJAO5yawaf9JAGGAnIKdeytrFD6kdAgfJDy1rJZPhmUd6bl8Aiv58zPjmzfXZXwzwg/WHX/sK0Q5Fmvamcu7uuTso09ei7gtsCjqZz/pXPu0kruOrQFcoR2SLYR7ywRdsAJgmlvEBs35FFeD2HlZTDRcfV8V4xkpr42jM9A9K29T96FMVpyF1ZVrQG73rL0bc9ehbwJQN7jAsS7OEEtO+2rSZHd4w67YEeLbfCeAzS8kQS/lFWmopWBTd0jhnPsDuD/8CSVR0fAMt8FC81ZBwRaWAUlcwhqfBZy7lY6jc0m7N2K4m4B6ZFE6Ni9Bz47dZ8ve9zloj9ps0ji7S9njkVYXTyHf7I09xUvAnkLlLLJjIFI3pweKJvpRUanaDI5NxukKkOuuNDfamkqo5qmOUwr9QvyJDZMT2LVwfdnj0h452rYZU2VnTO6gR6PDapDmBCdzrkwfRRgmWeP8p4bcMUgM3Qn37p5FPu4nGRa6JlOetbxZoOCwojcWYSIas8QcAdO12XSRJDqywBFiy5+z0pfuSu+IsTOFZ9W2D3ZsgfpFnIKsIIg7oN1Brto4/mKykTwX74eGdLhgTjAmIb5rRIWEPmG4SwwsU00xUpQtgkBhNAMB/mtRMkdtZhSUcC6YzqEDpPLv7KFVUKdk47wd1ehDc1fqZ/8JCv1TagaG6kWyt5sW+DPMfvXaOICMxUnrLB0++/rIAnEy7zWJlPrpT2yWP1nKkmj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8rIof0pj2cXz37ng4xDptmvrKOtQccI3OysAg5ne0WQjtyowEGDVLhuWA6qC?=
 =?us-ascii?Q?jcPwz972XlNd+FZBbON5n4cyFKSbRGJ/5VF2JCPF7+mEwvHyiwhIsQYiyu4t?=
 =?us-ascii?Q?SJT2e8/xdo09Lqu9YIqglJpXF/CrAeNvuGI3MSe5U+nj9CjH2c8smXtHIaYa?=
 =?us-ascii?Q?EHBQ6/8BrkLFpYtoKdvovUrao81sSPkkX1SdXF8x8V/JTkpoxlNmGHy3YZCq?=
 =?us-ascii?Q?kJxBatnuiIjoCv1qPkk+bMEob+8yvi8XtgLWOn9qkD/4fgLCelUX4/IwXGXh?=
 =?us-ascii?Q?cZbSeaPt0+fP5lZDnmCe1p9AFGoRUbrQCkcslqlJneC9158xx2WZbpnYG2UW?=
 =?us-ascii?Q?UrD994oeUe/wAuEozpHpyb1GBIn+D0jpQMxFjzqb+GsQ/24wgJTbUx/2OdZq?=
 =?us-ascii?Q?LbgjunpmXfhB5WGeKOhPOjsxhImSdq9lx3m/kwTyTVOA4hjk5mGr9zsABDYt?=
 =?us-ascii?Q?m7QQh6ZeS/fS3uiZ8uQqISXsJ3O+8EIr+1xdeEeJr+2Qz6Q23iFbx2g+Ymaq?=
 =?us-ascii?Q?WrrKySJjfGs/ylQYHcfbgVl5+F+kSgQQWUPq9aZIW0DbI28W3SS/Phukw0zc?=
 =?us-ascii?Q?U2joGEyEEiZx/zoeGfqwRFDImqceEG2mQ5pU6Vq4bwlc2uMys422umMgNdgO?=
 =?us-ascii?Q?DDFRMLUcVkOQ1NJYZ/JYDrsSnqhFNOp36Jo+HsHqjgqYX7cEeMnxW9SdPv4i?=
 =?us-ascii?Q?CEq3giNTp+O93aKsi0DDE5ML1R+ZXaTt0viMFd4ZxD/FBri7NXZVMV0zCClb?=
 =?us-ascii?Q?OyBZxF9BGobHXnJN3MrY+rKryonhwoOB9OxUgUgQ5hi2UQZ9KZd6Xq3/AhlN?=
 =?us-ascii?Q?6Iv9vMeVcmEnH3Y3YUnufP9cZcuySgVw6A2YzuVtvUEzQAwMpZhB7IkM3UrP?=
 =?us-ascii?Q?Acc1rfVluMOR3efcdPJZxAHFs4GjeuLb56Wlm6M3AWKFceytVd+bojk/yGme?=
 =?us-ascii?Q?31hiL6qBcKXbEnhHl8cbJrGEjNQAranIoZYjUNmXRBKLMKgf83RILsiJQnin?=
 =?us-ascii?Q?bhZqRoptMPggMqgADpTzyQg6HcAfjfLAoXGdL1EtL8m+CvCSorv+W9kK//Kq?=
 =?us-ascii?Q?Pz4gXEjjx+z+SwjeQWT3ZMZWxnQNMkpUhY3OkofYjHQXl8fx4VU8qDXeP6MS?=
 =?us-ascii?Q?3a4pFa7cCCUXqNWGnTH6GGvnZClh3a4Gm49dArQwuICRaDbzo/St4OzGYu6v?=
 =?us-ascii?Q?0xCLAsXFbsDYqOSw1WcmZZRNkPJ1hbiZQzlx32/rAv2Jm/fr5VYBZQFqHagr?=
 =?us-ascii?Q?xQRqHIL0+4uICvjXBlqnrWUdnD3+pkZecfKY5uhszzZ022Y/lsfjIa+x+fO8?=
 =?us-ascii?Q?+21i5prONa+DzfJ+Ls3nCorjaQbi2qWeCwuFSjjXnoPYnHoUv4886rFiw6sR?=
 =?us-ascii?Q?7MeiCGXXueFg8Lt6s+IFcqXH52Kuihqar7e7S13SUAGipCRVqiviVMmoA/eG?=
 =?us-ascii?Q?qBdW4fxl9wTSDSr+7T6CJhMfS0z1VkmXdUvqDuFfV0tli3S94Zw18pIraoRo?=
 =?us-ascii?Q?tExbf9p/DKbxtUKzd+dyEUzqlx+ZFEuVI4gx6wItzLeSZQsrvgh88UaK7CHG?=
 =?us-ascii?Q?3ZfvfmFSyvSroIcoAybq3T/C+pPEzeFeW61SFQ12lJXynPLfud0LtirgFBae?=
 =?us-ascii?Q?sWflFlBFdoPXG29n84XRaJkMn2leinZD5lRKnrIOu6I5gE6x8VuMI4hBTC8Z?=
 =?us-ascii?Q?b4JB1rZMfvOZjDlopAxsQOYC7+sHeZZpGlTaIeaThR/TOSaikk2+yqj4HFE4?=
 =?us-ascii?Q?W34+WpIbzLoDSJ1YkRxGdw7D8EHr5Ok=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee08c4af-b49b-429e-4ab1-08def41eb52e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:26.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaMLdcAueBoglTLZBpCHzJwUa9ehr2u8zZqO+rUni2rH6AnATfALNs6O4RWOcg2pVxAn5ppTE+uJdy/VgBRcubDGs0260bz3JIqaXJ3N9ymHhPOoLGn8zXflIpJVTigU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sma1303.c | 13 +++++++++++++
 sound/soc/codecs/sma1307.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 15758eb13f8c5..0bff325597143 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1412,12 +1412,25 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 sma1303_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
 	.set_sysclk = sma1303_dai_set_sysclk_amp,
 	.set_fmt = sma1303_dai_set_fmt_amp,
 	.hw_params = sma1303_dai_hw_params_amp,
 	.mute_stream = sma1303_dai_mute,
 	.set_tdm_slot = sma1303_dai_set_tdm_slot,
+	.auto_selectable_formats = &sma1303_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define SMA1303_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index c52fe95b30c6a..eb87f728b165e 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1552,12 +1552,25 @@ static int sma1307_dai_mute_stream(struct snd_soc_dai *dai, int mute,
 	return 0;
 }
 
+static const u64 sma1307_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops sma1307_dai_ops_amp = {
 	.hw_params = sma1307_dai_hw_params_amp,
 	.set_fmt = sma1307_dai_set_fmt_amp,
 	.set_sysclk = sma1307_dai_set_sysclk_amp,
 	.set_tdm_slot = sma1307_dai_set_tdm_slot,
 	.mute_stream = sma1307_dai_mute_stream,
+	.auto_selectable_formats	= &sma1307_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SMA1307_RATES_PLAYBACK SNDRV_PCM_RATE_8000_96000
-- 
2.53.0

