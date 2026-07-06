Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EEF374E73
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304316; cv=fail; b=r2fyUvyNZGyMm1jRbWigB7j2JNKsampvjuFZGT/z44PwcjLrnY44/qktYvztFukwgsmAJLn1ltYzUIy7hZ1/ebKKiQkelCY1U9jEU0kWYH1zdds9sCf3gvWS4h4ICLvmu7A/g9ro4fUv+XlnXek8NXvhpnMNIvRwPOIgUVUlC+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304316; c=relaxed/simple;
	bh=oj3sBLUEAgPWMK9j7cmk2h4T4FSn3gwO6dRwek8h3YU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KuiPtAaNlPP177sRtB2zm/8hjG7cnU6m8q5mXetD9kNwz7EuGxKpIz6AEFEOeyoaqMC5dPaen3D4DUL/6rwO5pgKBFLhXOhfHbLqd5hjnH/gmkV8yoB/6djWsNj0nhwG6J3QK0RtMa4jrt0xtcNTfcdvDmYHx6ijIMNBU/XG0Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fWwPIhSI; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fWwPIhSI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz/R+i10f0tBPdOYxREjUYCgQVBMfvThIp05bQtwg5Q0hiEICvvLJ93cwVvoQcD9NDlr9O1kRt/pWsZY70ogMQArW8d73TU0xr0wUpdqkGXrt+Pcu+iad1xfelCEN1OgbNTsHmQ3bmtS1UxWiVQpOZTaXjUAAae1WITvHv0g4TvmgY6tRZDpu5J42ggvJuUjgRJY2zzGkmVjfyiI1VQlzA+Qi2gAi+yNQIDi/R28qNe5XDLu5HjpEhzpb49Tr+sfsYNV6/fNCn9Sh0muV4CU5IoLu7YQ+U0cAbhUvR3GVRp7X9WoHIEDJQkMrgHmikbX4O+pfezXtQqEhIgSFRKJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HYZCAuFYh8GmvgLqLl/i3C0L/fWxxJnuj8pmaFQYhk=;
 b=usoXIfzp5YUo2EEASBLIVnxpkpim+IVBMyAg+NWtm0TFBnTvC06yxw/5rY82RkgW9UmRoPxI7rVhnPkCyqRnxlPcPNSnF2feVmKbTN0cV2v1lrPCT/d6PSkgmdiXriGVmOvBrEejBGk8dC00EETYqsj83W0oLhx7wCKaSLebzMf0xeXTdmOqtIRaAxu6YnJYxgzKiTawHmpiu+fkNWuaCoBgIxJHzh64rNn1ZeBsXomnXfSiPj2HBNmQ2KakCqly4CKUcPqwW6CYyob/6Jh03Bv8t5LWlnrW99Eh0Wb4DZI0aaRHAvzxyU64BABOHJ4VOK7hfufv65e/lxp1pDX76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HYZCAuFYh8GmvgLqLl/i3C0L/fWxxJnuj8pmaFQYhk=;
 b=fWwPIhSIQ4m90bzp8lZLWfBbDX5+gyjZffX6Y1eFYTPTBjOPoP9/lg09v1OCAa+o/jkvawe3kLngGw6aEq5jsvoy0qd9r0rtuNjQLq2S8Kb0gdt4Ag6/aLUeHBIqPD6zqKVD3J3smyBlNOn2C5Jt0+3w94b0mB6o98/2kCx/XMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6963.jpnprd01.prod.outlook.com (2603:1096:400:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 02:18:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:18:31 +0000
Message-ID: <87echgc13d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend v2 1/4] ASoC: amd: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:18:31 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f55f263-2f9a-4c80-1e6a-08dedb04dfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|38350700014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	GvcUVhMK3W6XbT/Om04V5gdRrsUN7MvIp0btQ8sr61UAfUmEIXggHxzcVgltqNZzQWq5Ynmrcg+O32sasXfr2Kn1nc7nHohwDbpFJboajx/dXfqYPOalXUzWQQzPXeoMa6zJRYWD1HLkNBo8DZgEDTUCpJySruveCrWvG/Jr5sE/PKVnL2pKy+vVGgw83kon0G/+80gA8fSxFg9uUrfqM8orc2G6YSQvXSDAA3h/101c4LHQ3j4N3S4JeIzudvWwFGt/Y6YJB80jTGsA1N+CvpsXQBb72SPloinILjZKZgefZh5AvJNEt7AqjN3KQ7wUEvYRjCQ8I0mPzak/QSfHO5Jmfq6n+b6uybyBraDy3T6lZXrSpt2kYKMYaHJlgq48S8HRHp1CfX17kevxBfdj7eLkJPabe+D7kXubJ1DiP/DgwuX/N8yiaYFekeVCkcoJ/F81pqIU1Of15er+UvLfZghVytQJieOTmKENxDBhX5Nbm3CAm5rhKwLicY3j7SrlksQWSMm1pOmBrlU6TTBo83VaJGyN7pBpJOZ5g/JY1k/opFgpgqGrBTB921hd27MGsvLaXk1gEiBtDNC81XKtb3KxgN6o2mja8ilAhbtCB+0HWW4WibC9qgQarhD/Jnou1Y1GUe5vbzjJP2Ia5xlBoKVqE3s1uXq5/99FOlj4aXq3Hzie/WBC8C7RfW803WYxqbwUb3yl+kcwI1D9dBnFcaEg8SMnoIZ6o19p6kquztA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/Bvc84h0l5eCgyckSV953ucn+eDcAJ5sAWHtDyltFoh8clbffTVjKm8Kq8C?=
 =?us-ascii?Q?PiPVkDetBRnFgJ7JmnBPEqJ12iDiN810GE0olH25QJu6FwkeHseFUE3B7tRq?=
 =?us-ascii?Q?c7BGbcr4wiq/qNtXEc9eNF7vUxFfAGL4L0KAoDx0Ijw/Svw9jeXLdg+hWHGD?=
 =?us-ascii?Q?+WlusX2ckDCTcvZ3mgbmfzyI9mg8QdjivSrWy1y7apUn0IReuN76RjvbPw3u?=
 =?us-ascii?Q?B1tlUdHA3xauyTcG0kKnVVVnONfgtCwlYgbLgQeAwC8lWoLIv7KpZo77zcPl?=
 =?us-ascii?Q?pQ2Jnl+uACfb73aIWYQ3gn+H06BAHe8Q04iZxa0aZPpOA4IM9zX72mLyb+uK?=
 =?us-ascii?Q?MdRwF0QLhpQRITNUJlGjMWp+U4mqBCiHiD+nY00ySGj47giN0yp+AYg8Wzht?=
 =?us-ascii?Q?IFGZAyMjC9utnYsm0BWTUonc3eFxA2osa9gPVJGftIwv6mOBeh1yCSSCjMDh?=
 =?us-ascii?Q?VsJTSWEdBHP4UsnuF9XSuhox5CufwGrD+999kt0lLdRNt2GPmE5RqIECeJdz?=
 =?us-ascii?Q?shbEPMQDapQ/qz1SZd0OmJOd6gO7IgDzZsHSA+VpiIRM6Dv2zhQDAWT/s0F2?=
 =?us-ascii?Q?rfgrnrHMNiCtzVwJqEKL/mulTAi0KDmgAVbhiSnB+l8d7klcRLrZb62/vgE5?=
 =?us-ascii?Q?jR+8uVrTV66Me9xxQKzaYvBaGd2avGsw1aQUXnGZxHrtJjNfwb+0Ga3HDPEL?=
 =?us-ascii?Q?onhp5bwu5ZAuA26qwvE+RYZe63OOt/2008Se9FE2tVdHhOn1QqEP+F2/YQoQ?=
 =?us-ascii?Q?UjqmGgnvVbrssXdomM1HhURYLEEhdpka43iEMuoi/fa8JoLOh4Vt/rzg5WVm?=
 =?us-ascii?Q?QSO1W/HnGGqOrtBeaBvwwryKLqZYqvcJM/m3dEyTIwS+R7X63P1mBMoU3zOD?=
 =?us-ascii?Q?fRQrf/0r4iHcvmgs4eaf2HvA9WNF4FhEkdyuN+vhTj3X44PV/7gKn5Bk8KIa?=
 =?us-ascii?Q?mrgiL/eF3Fq40pesHunJIyPJfHack5PKXjzaEHhNYcVaI2loltdW6Dr918zZ?=
 =?us-ascii?Q?oA7WKR9Nj0Mpstq6+32fHrlwaLQaZFUJYIedAQ4iETjJEdj3bepPtqaEVNev?=
 =?us-ascii?Q?IAiysxNZ2bYpq+Yur1XUqUYg7zFP1SgMFJdj7bNPwdS/XJhC2ThPvZ5MWMH+?=
 =?us-ascii?Q?TzX2RtHtM1i8DEn4F0I10OibI6fB+NfQiwwE/MqZBN2bCLKd7Eq8LyGurHiq?=
 =?us-ascii?Q?7x8F0y+PfT/DzhL5k6bIUbM1MpB527vBYermKAtv5RAnw9me65MhOJhCcCaD?=
 =?us-ascii?Q?01wON7KauTHxZdIKyyM5ffGMXZtsuOiWGfMYOWdPreFYdZhe75uLuSA5vHls?=
 =?us-ascii?Q?kcLm4Xt7dghqTRfiXWu8XzoSh9x4AUoGjLkm/L2hUitVPHUDfaX5+NifOAQh?=
 =?us-ascii?Q?EZL9bnG0oL/6NXDKNF9/uyNsAU9BEelhb9O95F02QKBesopWDEmc4ZJMfW8G?=
 =?us-ascii?Q?djpiZj+rIPHu+EzSl9EQdURr/A3hyY+kyt8gThf0N0jiCQ4gaa0i3ntfbFqn?=
 =?us-ascii?Q?ZzrWuLxt63xOeWFa/aaiEz4AvDRZk7xMKyY1vm5NkgPkG5fSzrzvuY6jBUpT?=
 =?us-ascii?Q?swQCe5l9cTmri+mfgJ0oU0jtIvNcHFGP+OeyV9RLo9z8QTIaISH7GtRBv9+1?=
 =?us-ascii?Q?7V2fEPAob2sAndebVjaXT7F70BsCTlajFYYaSV3u4cwTvAjCWTdDl8x5rIeX?=
 =?us-ascii?Q?r2w2/+DywvmjAx6KFVbhls9qqMM1mK9xenoc3lR0uLXeI3KK3GAv9LAP0pRL?=
 =?us-ascii?Q?mA2NwBCNMGgKkrW0wQR59uJ9yAPdhio02WKMTW8/+jj+/JJw0GL1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f55f263-2f9a-4c80-1e6a-08dedb04dfb5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:18:31.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mp0EEgRGqsaLhiU4smL+p+PlBvuGveEDAFHhVs3p5uB7TFuVqFS0YemOwiulIcwq/2tZYXVDJmGH25RPwev37GwTyyM59NlYeyR3QeG6L1g+EGnTNqy2x5T0P3q7495R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6963

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 283a674c7e2c3..bb58a9d34993b 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -686,6 +686,10 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static const u64 acp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.startup	= acp_i2s_startup,
 	.hw_params	= acp_i2s_hwparams,
@@ -693,6 +697,8 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.trigger	= acp_i2s_trigger,
 	.set_fmt	= acp_i2s_set_fmt,
 	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &acp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
 
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 352485dd98b14..b0147e88ba54c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -250,11 +250,17 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp3x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 	.hw_params = acp3x_i2s_hwparams,
 	.trigger = acp3x_i2s_trigger,
 	.set_fmt = acp3x_i2s_set_fmt,
 	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp3x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index bf719f6286174..dbfb87e2fe929 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -337,11 +337,17 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp5x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
 	.set_fmt = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp5x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp5x_dai_component = {
-- 
2.53.0

