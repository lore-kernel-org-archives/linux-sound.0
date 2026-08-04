Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519037F8A1
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804093; cv=fail; b=Y+8AIXX65LBs0IWIa5e9D7glVaqU4t7cZ4aNWJ2vAeMZeeHepwg2Er5hDB5KK9eYgDcaEPFy6sDIZGbJrcTa3DdH1CqizQPX+ZflJjWtxbE6bpYC7rQwJ0eCtv8jY/1rg9Gf3T5qGPd1l4ZcRHfMIHzlTbILCiXymIJ0NRkge7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804093; c=relaxed/simple;
	bh=r8zvwbRspiG2hUL+ZsGiLCQYVKiVG00Ac5eHFrvwNRw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cIz0TZmZKH6FkIlULlOlS4LpTm+S/Rs6C24p88k/aP2O9BaBF+IEljrkQ/h2a+DBZaE/ZMYG98ju1FoeB4dKYtE1Yj9Jc0wSQu+ewuHXUkTeOZE+QThTaEnMQ7Zv0M9x+f+43WTsOVpT/WSRKkc1DumPkLI32rIi7PY4LMKTQH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JD8MXlvX; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JD8MXlvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFDBafkhfZU7MdO0KsPOuBhJr9Fs8v83fbP4k6OSaG+ih80kr2glZ1bvVs3ERrUt4bCHuyFMxzG4/r4oMJxk329j/Hk4YkPv1KWRjzqM5814GzMDnDZgLAOlbEs9DPbSkMqztFHTyBNKxjYC3n1vsA45iVj7Z46qwiS7kCD+pa9GTeS5ECOsOF+6AguXEJ+dBeaQshsdg9DdGTWLOxIFbgHpqd/RaKL8OoVKcTTzJsSoUZnJApQzft+mHl7x3FvRRljQP+7ZZ3rTfXAPoGM1OOM50sRCHH0Nv1X1CfoLIs0xouKW5mPAPoccF8s9jLXHnDI1kXTV8YBE5KsLRvLRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uAUbrHSrY+voWqYuRAs1Yi7KUW6ULC1QMzUsXOFdiA=;
 b=xu57yO/q1XkN+Q+MeW52fr6vea5TE3Dlq9HXg1C1yFH/4d97DnTqrno6qewLE242Y2rVxmgGmY2T2euJ2XoTbfGuqYAMMDa+Z0D1Ak21civSCq6Mvw9NM6s97Qm1St2c4q5dZQp7DJn4zHp1xtUE0pTeG0UE31t/tVmk9KyLBRZgK+5iMCxEu+LQNQIIrsZUTF+AnBXnMnFj+d6GxLDskNvZAeaw0J1xuTNBKV6SKfQHJ4WTTb9DTSDqxEIZW8jNE5Znvjz3NnEVcBxTR6lQ7OgGg+mEhJxQ79XpwG3d2MxQmPyBPGsHzIElqq3OvVnq2d701rK9zL2TbhGgpbVeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uAUbrHSrY+voWqYuRAs1Yi7KUW6ULC1QMzUsXOFdiA=;
 b=JD8MXlvXmiZQtg1GVTfVrxSladLq7EqcvfGEcKahAINpgi8xwDinsUzOdLDhsCpfKrxOfwuL00crs3GYMue/ZDDD5GQbNBfPKKi2qxMFqbFg9VAjkHmu/N3wLqHhX+vrNCZdeMvPgkFOQGD1ocRRTNqnvctMxhk8//XxSMz0lE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:29 +0000
Message-ID: <87v79qwwcn.wl-kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/44] ASoC: codecs: cs35l*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:29 +0000
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: f057a2d4-6b42-4525-dcbf-08def1c11f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5+Q7jzueBNTCawrJY8K+w2rvWiSQ7xRNRrO37B1S2EmPBLE+c7C6kHUGKp+cKFLHc+RYLDI0yp7ipvak/Uvr6LZ5pdDLjUgI6U4tGpsJa4L2jqzU5VmN+8TJ+FVtdm6ytxkrjztBoaV042KPkKGFWTsVYUnOIeKvDJwnIGq09CEzybr4fHk60ys7A8cT6yhtJRHsYM9JvUhpDi1dECquE4/pGdU4xzumhQ0D9XytfZ2JK8qMqT5ZXI7ieqUo3NEZ0M6WJSDQy7CZ37MQBipiidd3O7VTprTLjT/VJ+uxPYp6feHly8ARNcmH4YAa61AX8j6Teu40MNw8nt7tk/YKXo0/NQxBhK8DgTk+Le3AEWuMjZy4z179k9iEp3YmzC1t7/67+Xz1KOQHoUKT8ObISMjjfddLIQk5kA2EMLUG63D9jiCjQECdumkZGLaHwIBESYoOdtGayrakJZdyKo458OcSdOv66jPrHzdid2cU1DC8TUKzK8v40uP7fWSpvLU/7d03/Odg2vxJ3mDERr2KEhMpeDY/v7azhAEipRwQ0jBlWQL1P0PwluMmREedu3kjGJ2B/MSFGb5A2MVAYpiblthXN5T9k0/NTXy1waZUbGiPOj5fHD+BOgXCDNEKo4g8Ryiuzfq3P5aU1npzkJrwvHr1q68ABwS1lzoyRpVNxNeevOSZdd+zOapJnJpu3+aW6IsmiIazMgdCOHAmhbzmPNefAZc4i3RaXUMvVSICu38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I2bsbSiRAn3ACooiHpwMx0K2SID8MWIt4FElwFRyhdXi4Gpz9CDrGXjGq5Wr?=
 =?us-ascii?Q?BNjGmOO6cNud4cMW7rcv7B7xsNZ0/IkIOs+gWsv0QlJO0Hc6SZCnwln4MN8S?=
 =?us-ascii?Q?RNzvRJwWuJaPQrT7uy4o4QX6ogCn8V2GckMclJV7g55nJtsfuBM89ciaT4ra?=
 =?us-ascii?Q?uLLOcdNNx7595q0VOnzXRQF0bIjhC+2qe6WQlQrSUxg1BhYR7WaX3dHWMR+V?=
 =?us-ascii?Q?02oAHu7R5S7JB3fJ9HLyJOArfGWgZo4xgKyVVeV4+0/FHt9+xH+9rkOCB/Ld?=
 =?us-ascii?Q?IBxV3moVP6uCXpiv5i9R4u44eaQer2YLAw2HjhvDHObmJW+i1U8N5COCuwxB?=
 =?us-ascii?Q?zMYhZBFPw63F58LMlPL0lNFskE6lRiYkzn81mOyH+xdOCKvet8hANRdy1QWS?=
 =?us-ascii?Q?cK3TFwegyzRD6VikXnQ61CZHaEsjP9RBSMQkOoHphz666FtPi6LAxm4nrbXO?=
 =?us-ascii?Q?Os8oE5z7SJOQfKqe1CM4LnIyiOQJp823ZUP7Mx7+qezzWSlDq0qxUoweEgCt?=
 =?us-ascii?Q?/ro31NT7euORvmnnOQLhyBGL52jBGAIyP+JF79ohYPa3Ob+E9uhV7Siwlx/E?=
 =?us-ascii?Q?uY9Z+/ZFySoBxVW/oGwXlnilFU/S0wywh/ZJN6BEAAcDOfWVdjlLrqxEd+GA?=
 =?us-ascii?Q?aqqYfbEpCdJ5e5nZ/AgFFmtvMGaRSv7BigyVfT9loU4gmVpM9ANUs14zihwW?=
 =?us-ascii?Q?xtYWoUCI/wzkZVh+6Olh/CAw1LmcMUdVkbwvx7Kf3sZlK7lefSIggx2fV9XB?=
 =?us-ascii?Q?zeidnvaByCL/vEKHx8fp45PmQV8kIlYfkhMOJQajA/9nFauDSv0xcY5e6YlF?=
 =?us-ascii?Q?qoGF4mb2eREpL5JketaSJ2yNDQwHX5uZmjFzNF+n2Yo/U0QZhgDRXzsZRsCU?=
 =?us-ascii?Q?mfgiSksA3N4cU7yH+pGoW2g0KalSS48aM+x/VZvOb2jpKrakfeT7v4z3GwNe?=
 =?us-ascii?Q?kAl/6WAF2mvYm4A8FjKjiueCneBDgrACr96veYHqH7JOFf2amp2q/V+5wI36?=
 =?us-ascii?Q?VOA2woWzm8XzfMvcqg4/EQNjks7m4BVIgaGOY/cinKS7UaZj97gFxex6jAN4?=
 =?us-ascii?Q?xa3n2FwxfdOKfFXUvI18kU0ydfX6TMxiIC0W5z1yVaD7ukrdsSbsFzGJozxq?=
 =?us-ascii?Q?8kIGysMnb2XTXNzha9+j7qcABKgQ20Aek+laqjgvtv2HyJ+jYfsA/Wog+dU8?=
 =?us-ascii?Q?t/75Ppp3KVutFETOpv97waTKlJWbgitKbZFE3+Sy3n7QFedPf0WpceTWStvy?=
 =?us-ascii?Q?vR9nYEjxxagEEVucAFFY9jpnzsD32hJq5SEpjfKpIMbrhVobOioGtuh3jJ7O?=
 =?us-ascii?Q?xhSY9n+yifcwxqgsYP7zASLOW6OzKY2GzN/0g4SPhIOVGtexBKCGVujH9qre?=
 =?us-ascii?Q?GSnLI2p/8Uy1d98urYZaSH2U1pX33ESHE8OfhViwr2AObrlv+cmx23CXF6MA?=
 =?us-ascii?Q?g2bMMb65wU6JLrMUe/zffGlgrcBF4yhgMnZro1EvCGnCRrAt5u2P/RKJip2r?=
 =?us-ascii?Q?bk7+1yDY88gU0FWl2vMjwEJ1TbOUWW/2/FSU7/LGRdIpj6qXBoY6s7ArfQyJ?=
 =?us-ascii?Q?qtJqKHN9k8XMzYrGSCEiWpgOwkisBHSGQEBAMTAx8/5g+AfhOWdhrjCU6Juk?=
 =?us-ascii?Q?AVdEHqz5THtQT5CSevhJ8GhpoExnPJdy5RtesmvqhYXDys5J/oGuzvzADFwI?=
 =?us-ascii?Q?mRYjBtMccdVIkSN+cs5qCVPGaIO+uKyG+hyF70mvFWRrE1CkweWov49ACsm3?=
 =?us-ascii?Q?vv3oXzbMAomc3jFvdJo9+P8Wb1WnNsCJzHmL444jPtGhgJHwFTv0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f057a2d4-6b42-4525-dcbf-08def1c11f6d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:29.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+7eAKQjZpHPkiVrJxDPXDOc1ZhT65CjPpLWhxa9Lccch4S6PFXZCImId9iH5EsIjqC3QCeNnp8kGbnzQLSlh5Bs1a4wm3VbgdNGJc8AnvrRW+DI5jN8+0y/TtlWrd52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c |  6 ++++++
 sound/soc/codecs/cs35l35.c |  8 ++++++++
 sound/soc/codecs/cs35l36.c | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c | 10 ++++++++++
 sound/soc/codecs/cs35l45.c | 10 ++++++++++
 sound/soc/codecs/cs35l56.c | 10 ++++++++++
 6 files changed, 56 insertions(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index e217da124549a..d0f9231f5e442 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -663,12 +663,18 @@ static int cs35l33_component_set_sysclk(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs35l33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs35l33_ops = {
 	.startup = cs35l33_pcm_startup,
 	.set_tristate = cs35l33_set_tristate,
 	.set_fmt = cs35l33_set_dai_fmt,
 	.hw_params = cs35l33_pcm_hw_params,
 	.set_tdm_slot = cs35l33_set_tdm_slot,
+	.auto_selectable_formats = &cs35l33_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs35l33_dai = {
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index b2439ec3c19fb..f4f844cafd68d 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -657,17 +657,25 @@ static int cs35l35_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l35_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops cs35l35_ops = {
 	.startup = cs35l35_pcm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
 	.set_sysclk = cs35l35_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l35_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops cs35l35_pdm_ops = {
 	.startup = cs35l35_pdm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
+	.auto_selectable_formats	= &cs35l35_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l35_dai[] = {
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..170588be4dbe3 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -947,10 +947,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
+static const u64 cs35l36_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l36_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L36_RATES (		    \
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b2a076706c796..d286025183f46 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -953,11 +953,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 	wm_adsp2_component_remove(&cs35l41->dsp, component);
 }
 
+static const u64 cs35l41_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l41_ops = {
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
+	.auto_selectable_formats = &cs35l41_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L41_RATES (		    \
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac7..25a9eb916fa39 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -846,12 +846,22 @@ static int cs35l45_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs35l45_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l45_asp_dai_ops = {
 	.set_fmt = cs35l45_asp_set_fmt,
 	.hw_params = cs35l45_asp_hw_params,
 	.set_tdm_slot = cs35l45_asp_set_tdm_slot,
 	.set_sysclk = cs35l45_asp_set_sysclk,
 	.mute_stream = cs35l45_mute_stream,
+	.auto_selectable_formats	= &cs35l45_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l45_dai[] = {
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0b7b080939a18..ec3b6621dc614 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -603,12 +603,22 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l56_ops = {
 	.probe = cs35l56_asp_dai_probe,
 	.set_fmt = cs35l56_asp_dai_set_fmt,
 	.set_tdm_slot = cs35l56_asp_dai_set_tdm_slot,
 	.hw_params = cs35l56_asp_dai_hw_params,
 	.set_sysclk = cs35l56_asp_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l56_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static void cs35l56_sdw_dai_shutdown(struct snd_pcm_substream *substream,
-- 
2.53.0

