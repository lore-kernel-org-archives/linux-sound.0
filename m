Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F2309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415821; cv=fail; b=VWi5gJRrbqhhVTeGD0unKCHwT7r5mNG6wSVP5wWBk0FQ3Sd+73rIoHiCqN7vS5sam4BRPJp4orJtgrWucoyTexje0GTUeGhD85oka6iGB4hbUjYvqPTy/y2w9CCwUrBbjDbQ2bZvxVgZNwobs/VaPNJsKxDDWWBR3cga+DY6SWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415821; c=relaxed/simple;
	bh=a1lAqNr3LtUiJHpBjIvGf+URkNgfhMXkvRJ0jdiHD+M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GlRM79p65zk2+7BZNUIX/zp/KkQaaKzerJQ/xpLLCLi6gabql/yToEEBwFTiTWNfPadOqpCSIS/rRQjRBIrJyqQpj8gw775uF0YVSLFZ7/cSpFVbGneVWVSHb+sKB8soPv2fI/VDteMBifgC2jKd7JlJVJ9j9lPyhln0VJCQyUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CiFvwqD/; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CiFvwqD/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f715yj/xBrhydqdg+YoM76A0S36MX0ZDESITUfBqsyl7rmhYKlQFwJCFJFOanfeOcXVyk/JsfS580aTJh1NgKP3SRkfJfuNvzuG7Cdyd2yhVElXoINz7mHoBPUVVoniu8mWbr3UD/x9fEK9lJb6gvavQ/LOgV3ji/aILj2RsgO0Xw3mNHTB2CUDTljHkly13Jz5fRXcwjxL+afifTSpVi5RJl5TR5xriK9n+qlinKQmkzgon0ExvIqD87dwd4HJ1FEPq2sMB2dbvYA1LnbPPiebkiXdPHnIKCfQSf2kEBsXO2tX6tpYozae/YqHUpsNsL1SR3tXuxNoBYl3PClgrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUhcP98pzkvwRixD4rHf61UHbDtQDxyZTG4CR9npUnI=;
 b=EsbZAeOSWkTCCEROkReNkG5M5aUY28aWkX8msA1Pd88xnyBskffciloBwknJcXrIES6QwjbIodvobCL3DlEBYp2PXBRiUvrjWZLl/CnrzEkXp23P81DAl9YrVuFniOrimkR8KqK1O36S7BVhHu+XvBjPsyoyF0PJViyN5ODZ7q7UHbCgJnZ9sHdgQzAH1KdkiPnwWj48dfLNH5JjVrBbtz2cFa9PLhR1Cao7otN/LzTc58T+BiTc5su5wQBcvK/jjFC928ln+CueQwb3uzhiiCTtLZPIbzQFNPJ9HpWH1t/KESOFPLcYgp4nDx+b7Lyo4vwyTqMIREg73MqU5YzfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUhcP98pzkvwRixD4rHf61UHbDtQDxyZTG4CR9npUnI=;
 b=CiFvwqD/UOQvkZ/HHWuTesUJ3CdTp+Z4wDq2BA2LoCUEOJjgpg4PDfNLL1tGNxxzpWehHeA9Eu1/UaLmwUmWEO8hCjTzOsAk5DvlFdSoZin+kB1R4G6C4+Os4t7YiFjNeZmYcwQ0/m6iEDbSUUgb36ELPSYsh79/k0CbOMOfPcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:37 +0000
Message-ID: <87a51uqfg7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 065/139] ASoC: codecs: rt1011: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:36 +0000
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cca140e-1a3c-43cc-f8ac-08de0ad97205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xvnRnvBT8gM1z9336bKDe3olnjG4Tro6U2J1t0kwkAs1jTJ5Xyr8JB+4uDYS?=
 =?us-ascii?Q?OWr5DuE+Bj6wMQ9W1RGkNvXFrUqw6P3nT03bnXpWrUfPu117FHk7fCAaM3Ws?=
 =?us-ascii?Q?0B/FpG53q3kroAnPb5U5H7Kat5FnsF3U/JZOwGqxMTcbuJ1oanw9GM9h8+iw?=
 =?us-ascii?Q?cNMs+LZPAtS7yBmq12nlyjzlREnpcL8VKSkexIAiB0byfTKqRjDxciPEfmMj?=
 =?us-ascii?Q?VDnB+7x1fdqcMRNXvvBPAXapZoJ2k+G+usBz2uiOCdrvpCK8Qp5mouWQ8QUY?=
 =?us-ascii?Q?q3oPRLrdMjGLfTC5OjH9TWxNcaHBIFor1NbsUC41kaUo8QNdp5GchEXmDWTq?=
 =?us-ascii?Q?KgGV7SxezG2sZ3bIKcDiAGx3QkTAw+3dYNz9B3+EJ+06rzaRrEVil1kGKuYo?=
 =?us-ascii?Q?d8KFPRJIsAgqHyNi38SGf1ZoGAqNIsoRJKPeibln3YYmhJZNts8axNoA8/oa?=
 =?us-ascii?Q?KQ4GxcIObrUblEGQkvsJQL7bYmB1ngRnVYAW6zemj89EaWdQVA7IianFR7V7?=
 =?us-ascii?Q?+QEP6E2ijMAs7vi9AyvVQ2eDMKFrs5wdYTuTvQNXBdPRMasDAKy+BVQT+yc2?=
 =?us-ascii?Q?Dun4LYfgigAJAFxhO1Y8wHPhr4VJGxQnsD21sRAwGShc3g5WxHibQ01H6B99?=
 =?us-ascii?Q?t+BOiBI5ttIvhVv37ir3CxSUQUbeCRIkqSpl4KbbHJRyFzzoDTW/TEJIUtyU?=
 =?us-ascii?Q?+eYvy8TdqTgiUc1XsJ7z66tD1bJ7yO0CHDOG71rJyVUN7LMKrKbTML+bHmV7?=
 =?us-ascii?Q?EgQfFZQOOBcXXsxtObKM4HYV4696jnild/21fxoB+0SnQ++2IHwdhwJn24ya?=
 =?us-ascii?Q?4RsxvCco+04EEqXag/EZ3+ZDRlSSKSCfRynlZwaN9v5G3A+pkfpuc77KVGCy?=
 =?us-ascii?Q?iYAmqGEm/gpan72FTtuyCi9tQC/WvM+kPONdYjy/BcHu8+L4qq6EiNhk610w?=
 =?us-ascii?Q?Kmab2eMAkw1y6ALY/Z5XGW3kKpNtLO4eADd+r+aCDBkEfc6F0Fp2qWWY00BY?=
 =?us-ascii?Q?4i94yFDLPR395hlEkq65nFZeLqBROZvemYqfz2aAgNOp+Ctfn/IaUtAj1I9l?=
 =?us-ascii?Q?+YI8K4dMVI4WcLaki1Dv8YDA6osIiXMGdn7sK0LZjw6LlDaE8LvwKWENPeww?=
 =?us-ascii?Q?R65gZKuonHUvRnZKo5o784AhwnPYkHr7rEHIBYA1gMD6G6HZ+ewu5WWkXStz?=
 =?us-ascii?Q?QireUb1kWtgik2DXPG8OTH6+5/RabSQgMq0M4gRCdk+zKkxVij5C4T36JzF5?=
 =?us-ascii?Q?cJwYoUnBPlF8sUjYe3eiUZZ1Ci01J0PLO+pzlkoS7gdkL1B4w3RAvY5hGoMJ?=
 =?us-ascii?Q?J+OtaMQtdLo9G7CjzLfvcGsHqNxb/BAA+Ijfp8dGi+R7NL0kjLDbzPWve85e?=
 =?us-ascii?Q?IMNXc7QzCQ6nkk+Az2vnyVu2KKNMsDmqhzURJblaYZL8S47PWQxlzpkSM06r?=
 =?us-ascii?Q?Co5FVaJXbHaYEoUagaRPRcUpBA9bYJQI9UcJQXx9w8OdznwDNGJPJ1pvn5d5?=
 =?us-ascii?Q?JP1yQUqi9LVrlOL+s0zwzgtzax5+5b1HbZ6P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuo5UHgoizm9zk9UinAQaW/KR70TBG9/VQ23T6z5mfaGjEeVcLc7bGc9rVJG?=
 =?us-ascii?Q?rKLHUJ4j/l2P7YwNwkJBZ9bltZUUcFGm2wCbRK1TtiRH7w2vEvFvxnFLX9GL?=
 =?us-ascii?Q?9idVu+A5uiQpz2fD4f3uKjQjhnvPVXOiJLJnvt/bGlBUgpVcc66a4xlItYJ8?=
 =?us-ascii?Q?+JEFMX58vucxBxxDlfS6zFoseXHkn34W3HH01OBwx78f2hjT9acqUWUiWwfG?=
 =?us-ascii?Q?iaEvlNVJtVFMpJKnhL8dSslaDTVFxbpfrJXSCVs6Bq8umaOfLcKsokGbCvi/?=
 =?us-ascii?Q?cuTS3mDul9EjObNF289p3CYDepPXtxu1/vpCyLljxplbiX0nKSNGVXi/geYe?=
 =?us-ascii?Q?M+JJ0vt/XemFxhp/+J84B7GfRA+5FLf5lhxc8IdtRCXIzit5TSJfjlu1+rYm?=
 =?us-ascii?Q?8WhWJ5hVKjcRmhzCU3OvwOvBVBQ6b7SdJIkF2yzDC9Xv2IqZX3ScW5zFhMRY?=
 =?us-ascii?Q?1j62L+84L2Ba02nmte05V7s7WyjgJTYhG/TJ8w+BLW53Uqlam9OpjlZHXVli?=
 =?us-ascii?Q?8xf0IHJf30VaqWSxOuWK6uPEyArWIQev0dPfbkGuVCL6NXvnuN6MNq9Jfn5p?=
 =?us-ascii?Q?MunsU5GDKDpY0D6mr5uvVZg1dJfrpXDuYo99hixp1MlamU4QKeL1ULcfOCii?=
 =?us-ascii?Q?6F9I9ysWcZ3gLBU+LSZSgxpNT5WOxArodLPCy660Fd0niKZde2QdXgcOCjKA?=
 =?us-ascii?Q?7kLT5WHZUB5FMGMbPVPeXG2++86cH/2FvVbZiZ4Y3G9UwORyGAwP8GbSkg6V?=
 =?us-ascii?Q?wQwiw50z1N7cUi3AFaOh+siBd889O6bD8jzbezvbGNGrzh+DIkQkTeB51T8c?=
 =?us-ascii?Q?ufGdunmQ8LvrvpjeKVLYhouHw1+OWYdT/q3Om+Uv1q1J9gJ0DmxlKC/2nEOT?=
 =?us-ascii?Q?CevMmcXtoZnW9etEOj1Z444WA/obaag26caM6PW2kpRHxnDIv2tU13+dhmNE?=
 =?us-ascii?Q?1aLY9l2nmnuvPbNiEFFT7rlw/sUhXoxCL8nrwARng6+b50GZig/x0Q6csTeE?=
 =?us-ascii?Q?8Y5Gd8vWDxh2sHg5lmjofvfeg8x2gSDnBj/77Hw8XfbeoFh1nB6fEyzBrbCn?=
 =?us-ascii?Q?uDg3SLXAE5Om9BzIr1MhZ6Wt89v/BoNTSwhlERsURftowcOXp7I8DCXUqZtX?=
 =?us-ascii?Q?imnwcyXQx7U75sfNb+od47J6PNhRldV8CmtGcJE1Z/azNAwbTn49sFgjYZDk?=
 =?us-ascii?Q?vo1jw7a6+B7xjHrjOhljZoB+chtgnhpI56nREyvt6FJKziALql7ZFMTij5Kh?=
 =?us-ascii?Q?IwFIsQO1lWd+h8HW0LLhLOFJJpqk3P5u5C6w4dOb9fPrpctR3ecN8cXQOjQg?=
 =?us-ascii?Q?Y34TFSyEtaGQdE1BNGHtitBaYbXBaELrWG0DklaRexCu+HoVlQtd9nIXg0Xx?=
 =?us-ascii?Q?StIKKEig+FuLZhugF4neW8Yko0KR2a9Kk3tfLkU2Ja7tVVhx0ty4dB5psKWB?=
 =?us-ascii?Q?u5lKwGii+BsxdL0ka2R6lzUf+Mk/xMwKwqoR16f6vTjJ5WWSGHk1SOqTewct?=
 =?us-ascii?Q?Hi7hxcuZdSuwkkUE8OKCmQhmqiMKkfrACr9abw1j3Dcgmln2fyarGMbZPvwu?=
 =?us-ascii?Q?a70ul7uzi04SxD7+VGeVeaQ96ahWnxgGsTOB+ArKuxT+aNBdbBJwFwY6uXR5?=
 =?us-ascii?Q?vTZBimYUrlWqt80NIBYnAbQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cca140e-1a3c-43cc-f8ac-08de0ad97205
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:37.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjqsZXmWk1c0fJDB+VZW4ugIpCAH2LskuuSqLif4sxi+x+9bqC5bcUHi5WK0jvFuNCDHVOJTkrkOsTsh6Ho5IpazZvqzo/4uzPdby8MRFyphd9ex1bISu3F/YyhLnVo7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/rt1011.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index b84dd18ddde95..170e257e6ddeb 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1034,8 +1034,7 @@ static void rt1011_reset(struct regmap *regmap)
 static int rt1011_recv_spk_mode_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
@@ -1047,8 +1046,7 @@ static int rt1011_recv_spk_mode_get(struct snd_kcontrol *kcontrol,
 static int rt1011_recv_spk_mode_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
@@ -1110,8 +1108,7 @@ static bool rt1011_validate_bq_drc_coeff(unsigned short reg)
 static int rt1011_bq_drc_coeff_get(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 	struct rt1011_bq_drc_params *bq_drc_info;
@@ -1147,8 +1144,7 @@ static int rt1011_bq_drc_coeff_get(struct snd_kcontrol *kcontrol,
 static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 	struct rt1011_bq_drc_params *bq_drc_info;
@@ -1319,8 +1315,7 @@ static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
 static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
@@ -1348,8 +1343,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
-- 
2.43.0

