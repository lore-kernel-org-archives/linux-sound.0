Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2E3093A6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415693; cv=fail; b=LEO9h3zuX6ouTxkgUwlAbcADk9Y2WxZ5kC+knpGaJWqGN42dfxOco1KrNMWZa++yMJBslYrCuCgvziBbhnJGD1EVWm6901mDkeo72D8YEpIJs/DYKeDfDaWyTHOGy4m0THDkdRAkKpukSC7Lbt+U1dE0fjxrSrp73LwN7uSEhzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415693; c=relaxed/simple;
	bh=v0HjbNdjv4WkqTn42pSBqJxym6XqWNMJPn9ucBusIJI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=r1BK5/WGt7VsZrQUj6Pqn2qUK5mFXxWVPDGkJ7YxHnhZab9+RqKQDWq0I50/gZgi/Ay65IjiNUM2f+3NxBLpQuAeORBI+OT06ken/b+BTnJQIy/LQQhgVGoDaLZBHkQ2dtERTvuOlb4I9G0uf0Ync7ChOCrsXXj6OTYIQnxWVkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vh6JjDuY; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vh6JjDuY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBzxq9bopBO5p8TqbFaihgvIjqg2yOARLYHAUGC9lb0+/mvPoXh7KTsv9dnC/hCzcxuSNd1WjnAAU7fcX7c0lJFlUqfOE12FS4nmDV4Cstn6TNySPmM09apgKfsTjf0OYp32Mx+wOjROb1V1/qhgzoiunnbEQCJFkcrVdKmQt23sa/0DWDfrySdNCTwwAJdO2yPEeomhYcvA9lhIYfP5Z96mu+82B8OL6pyvdu4ApIoC48sS6wac8ONjwt/rUkiyn1ud1g98BANLSDjgo68clhQ0luLVAZOveX231QTWRgsbkYtOfG+R6RNcYMOrT92WHS4kHxhtw30fuKlNajo/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NlnuhB6+LeEk+q7l8zmo6oM+UYloNZWjBejTNl0xIc=;
 b=JxmkvZ3ObzqVWg57LqeHbzpdqsKKGqSyfWDM4YnQRAkmGLML9wWXHKHhnPT38slnAWjFnj5n1p6Qx2QHScw2T9Ca4i+gjSeJQmYA2pGz9A7j7dFHNQmoOEG5EpOW4wGNQ3Pmmvalxl967NTvbBFlGCHDJGyNyPdJn3y4iPq8B8sdQ4RlvddjiTaczgibG77sVqWqvYK2FpIHe6be6bQOIQRyTh7QAh2YrFG7UkZVJ/xQnIytGCc3xwIstZu3FsLOGBEwTtaBcyyQFzw8NdXgovybg+kByMFZ3hXKSZP+zeB38PGb8rXxATXtNeUXSu/dh9YqmteLWPtfEZaMkgqRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NlnuhB6+LeEk+q7l8zmo6oM+UYloNZWjBejTNl0xIc=;
 b=Vh6JjDuYpmS/asVxN1saQBcM0EJOd7bSteYpv5c0PZUMtzm/bpfSYUICBWXrcnXkDpRBLHfqQWkWB5z4RHfrTsT72ziKnGSxT5yU+0lS3tCPjtDUsnTXJXNzrEeArNLtija6sXzD54NreqsmuxjZfxDp/yFLnn31y3T1b7hzGG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:30 +0000
Message-ID: <87jz0yru46.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 033/139] ASoC: codecs: da7218: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:30 +0000
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: b23bb521-9e6d-4f92-015d-08de0ad92675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmkQ62dLrDbhi8aIHCSm1dRUeWmWou4AMERiVmW0AXv91NJTHvWu5JTvQp/E?=
 =?us-ascii?Q?bPccdTfwB+MsIfECNmwQtTdPPwAUSNO4TYnUGPvPm3YLebcLYmFxT4HH8tY3?=
 =?us-ascii?Q?y4I8MT5qAnWp7qcOPAVEW1GWDwHDgNt+72Onc8owKVwNVnITK50IW2eqL7KK?=
 =?us-ascii?Q?bxZ+pYuQ26DmhoNIYChyQa+eBazEDw9ulAsqng05I0YYNPUsR7IKUTg3cgUb?=
 =?us-ascii?Q?IsxYWtQjq+7AJPrZXnqkzfoXGNDplg+HxGzMip5Vp9k0qTohSr6nrDEJ19IV?=
 =?us-ascii?Q?aATKYR23Mi9v6DF2dc+45nX9l+3nQ9qxqSV9N12uwrd21ZXI2TW3UZoUEFC1?=
 =?us-ascii?Q?b9d0ptdbSw8PgeBjY63+Q8m2zwsMqmK1gL8HigEgo8GsREzoIDjFXIk8kkxS?=
 =?us-ascii?Q?6i6uQMCx5knY4r53PfHvB7ms5mLuCAcoSn8sY7sB4iCWSyu4im3YEUBaNDoa?=
 =?us-ascii?Q?1rQqfVU/XT1sSncVz8g91Aua5U/M1cYjXOd0aM9KXv8zoUnGG4xU5ranfn4J?=
 =?us-ascii?Q?/pX/6l9fPoqCZ5lu1ZnSfNgOKKJj0e+GbO/wdNClCzeB+cin43h4p+WIHeG2?=
 =?us-ascii?Q?W6QOseu0qShBrEFHQiLccgvuNDbCRXyMOoub8Taff5+C1U6/f9oydlYeYxfi?=
 =?us-ascii?Q?BGFURBzV2cnlQbVCvAQcade+Gx1IeWDEAwu9zRDOPbcIFBW/4QA5lOXCoWDm?=
 =?us-ascii?Q?EUPQrPjnKUwUgRu5ca85xosGfMkyQX90dnEFJVN8hKk3b3uXUNphvy05crKF?=
 =?us-ascii?Q?JixVGCxiWFcDorvAqlKE0reyy6wxKkNRYMpj8lkTxu+5WmA0cjTIu/+vsjJU?=
 =?us-ascii?Q?IO6bsuyAQUaaSjr3LkxzAajlSCKnGlbnRXEXKr80fxFmmjdCR5znVmDoHWKA?=
 =?us-ascii?Q?YiceLnptFbFkLlJKt83wfICm6tWAomaxtCleu0UX5fGHDKgBY51SUEvorETd?=
 =?us-ascii?Q?f36MlzG77t8sS6iopx5XEWxDmmbqsuppgXBAKCpvkLPVtXJQlz0Ii9VqlLL/?=
 =?us-ascii?Q?k954OvSPVOQYu4sNlfEZwLXPso+un7u1czPHDNpiKCJCKbdaXF/iN+oXJPAV?=
 =?us-ascii?Q?WMM2fzJzs3z1PT9lDbfYLkm6owZJ0CZIbw5+s/vI4XeKQcVcbcrKS9VsOThw?=
 =?us-ascii?Q?MDLiVcy67DLKg8eNqOKTzf85R3S4VAq9w2a7gFxjlaX/QAV1Vpw2YcAv6tZ5?=
 =?us-ascii?Q?RvU1eft35xuxVxno6wuTFaQplE8ZDQf1NSY+pCwbKL9w9UuQYTLtV56cKyHa?=
 =?us-ascii?Q?AiQm1i/QPHibwii5UREvMg4m1ga/1DDakl0qBAaH+nrO6MFlHz6ZK1C4o/KE?=
 =?us-ascii?Q?JB0QPnBeVlDjztoUJN/rt3LTW9Y1pLUY5s5/RSXk3m6gptQ8Ehi9OUnNnLQC?=
 =?us-ascii?Q?F6sDzrHgXghdTFTPKZFYJXAWQ8WO5u2Cn9kZPxqXaw2zCwNaDjLx8fb5XDXR?=
 =?us-ascii?Q?QqhV2TxNEkH8fEhksmoAkRmDHuPqZGBroXRsa7Qz8l5gys1HkbbSkghW/cKo?=
 =?us-ascii?Q?UpSRwDLXGu3rrqci8A2FryWUBeQADTAmtKCt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZLxSkjLBq2XtpPC6LPhyaMhAOQPRRZ1sWvslCXHdzbsBxO6X/rd2lq6CSwF?=
 =?us-ascii?Q?+WqacdbsCj/al5nUOAve21JvQNPR+gy9XJ+koLNghknXkEVivCIATrbtbMD9?=
 =?us-ascii?Q?AUFn5gyGsKo3PE/Apy2CSngKP2H0rFOgfQFE+UE1liBA/dqbUGkp+oESQx72?=
 =?us-ascii?Q?7pTrYKK/83rI6JilQsIyku2FC5+SpI5rIxANu72465RYDd/x50YlK4ArBdxb?=
 =?us-ascii?Q?YKsdqVbkdJaAFdm2jaf6JlEcTgiGqgZiNawRiGnzAKmj/6QyOo4C9EpdlTcT?=
 =?us-ascii?Q?BIbGz5c+RTmhkv3vhsKxflNpqGBcdO59X83DaDlD4yJhpqPNAb0SSx7THkIa?=
 =?us-ascii?Q?V2xZCf7X+Wyabjc8IB72EFk9DKkBL9OEoKASbhfu69mdbZlFSf3SLrF/GYoZ?=
 =?us-ascii?Q?jmiMOQr6AKa6Ck8QaY86euaRPLwnPqgkeamoepVH+4ldPfSsNYPIwDZMqrfg?=
 =?us-ascii?Q?GYSdPxyYKECaGv+XRWysbHD/BEoz9waw8ptd+Wu0ByuaSC03J5/PX50682pr?=
 =?us-ascii?Q?0h9TtTuSlH2Dxo+05PL29JQ6L06Se6u8cjsqX73fy645wTaI4WrGN0Z1NR3m?=
 =?us-ascii?Q?D5MHLQpEcCbPFUhnU+FSpJowYTy68FkzBR90dnrM+JaNchQcJG7UCrDzrJkZ?=
 =?us-ascii?Q?dsomGKJ25IJRqd7NOkD5tArf1nLGVURAec64O3MJh15ilMih6it/8dEgr/iV?=
 =?us-ascii?Q?2NgKjJ0dlPVAXsq17FEVcTQOYKkJ5NSSA2yu5w9Ak+FopV/FZ6y9AGqzo9iK?=
 =?us-ascii?Q?smfDMjQ8sPLDpYzQbuTcuw043UdHVlplUQIm1z1M0tR+ZcX0560KTnTCMsvZ?=
 =?us-ascii?Q?0S3GVHOwx+qQ1sxaTKFAQAN/IWYH9qgJCOFXQ+cSe/rgReWgxOrqzqdoJtFO?=
 =?us-ascii?Q?S7egqfnSXbb1Au5ukvRGrWhEaAlTn38MTpXLS/qsSzSrjqtyQG7A5Bsmnh6t?=
 =?us-ascii?Q?NtSpY7YJ8wUbe1JKKr9YLEp8CKP1Wcrg9r+/acjVQwg+MVENqZjacQ1Nx1W4?=
 =?us-ascii?Q?D7MEXVzoNvQMH2g1IXv05JjS131WS7tZzymtaQ+I302sonzAsR/DS0gXcm2l?=
 =?us-ascii?Q?vw0EoLkKz41IyNp/Q1bO2mdoCppbGKm4thKCjJbu0oCsWzsdEkXwdsSJU4+4?=
 =?us-ascii?Q?apBEBhMotDjHxElHgepvAAOCIslG6+soP86xY5XdomrbdozzSRSmSR2vSeeA?=
 =?us-ascii?Q?Rbs+Et7xwiSiYzKiu5U2Qm/hvJ9zzRjFgBpxLUYDagBiot8F6zrgRU0o+/6X?=
 =?us-ascii?Q?QD08mA5Si9JUVBls6hE5Bhgc/iI0qqVAsJApbQ4dftiujSPLT6zfpC1Zg8qG?=
 =?us-ascii?Q?lIpHj13GekhbQLXYm+tKpoOYJawtEL2qQxKXHYJVvgVCrSkb9XQ39lWZNwhg?=
 =?us-ascii?Q?qL8vsPQoC6J5gVj945TFbqmfZifKag+i1dKH3g0hFSYnL7zO7SVMyUfTt3rR?=
 =?us-ascii?Q?GHumRKfkQ/RDAMMVEnQLxgUxtlghnc6WppHe3BxtbkOVpFHVEsHFz4IOCVkr?=
 =?us-ascii?Q?XNguxcXv2dFfym675ggpS1PmIUpOoQN/W9Ox5rP98NTLs7GaS7rloF9zdVvH?=
 =?us-ascii?Q?JGvI1YltozYApG/EXspK6UZbACvdr/xMaYsCXFkP35xvR2ezrcDuKQYQ8YHR?=
 =?us-ascii?Q?yGg1w0Ca4rAtefTZkZOlBhA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23bb521-9e6d-4f92-015d-08de0ad92675
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:30.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywYVTYYQfWkPu/q9D6UbcjRhc9V69iazs8i0K1LnWJQPorJ5ZFD9aFfq5XEczQsm+DuhbNvqfJ7W564F8GrX1UhSLKmkPszk4UmptLN0C2HaIbb7VEKfsQaWVz2Hhcra
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7218.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index a7539e1a18939..e6f4299073e9a 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -425,7 +425,7 @@ static void da7218_alc_calib(struct snd_soc_component *component)
 static int da7218_mixin_gain_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -446,7 +446,7 @@ static int da7218_alc_sw_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *) kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	unsigned int lvalue = ucontrol->value.integer.value[0];
 	unsigned int rvalue = ucontrol->value.integer.value[1];
@@ -469,7 +469,7 @@ static int da7218_alc_sw_put(struct snd_kcontrol *kcontrol,
 static int da7218_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -493,7 +493,7 @@ static int da7218_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 static int da7218_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -513,7 +513,7 @@ static int da7218_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 static int da7218_mic_lvl_det_sw_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -540,7 +540,7 @@ static int da7218_mic_lvl_det_sw_put(struct snd_kcontrol *kcontrol,
 static int da7218_mic_lvl_det_sw_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
@@ -560,7 +560,7 @@ static int da7218_mic_lvl_det_sw_get(struct snd_kcontrol *kcontrol,
 static int da7218_biquad_coeff_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
@@ -585,7 +585,7 @@ static int da7218_biquad_coeff_get(struct snd_kcontrol *kcontrol,
 static int da7218_biquad_coeff_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *) kcontrol->private_value;
-- 
2.43.0

