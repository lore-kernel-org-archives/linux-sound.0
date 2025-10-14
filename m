Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E530B506
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416073; cv=fail; b=OJc7qhi0FKxx/c+5wlhjI5FAD9az4ZxCLd2wH2L5Lo+cQKgKcSj2oaluKdzFw3XN+gyh71w3h12HGuVj9k5+ivlDEzSZ5spLoy8SnUABvg6RfhVfBogd7zfAAiBbVcx4UOmfIi3DLEtfaggD3shMECmG83J3foec1hQ8PCCSfZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416073; c=relaxed/simple;
	bh=SM5tmk8/qBwHef4LqYdvbm1LR6W0tGTaNZN4yCxCj5I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EelPZYRw/PD/fFF4u9LjY5bZI5m7zRTu/ZOf+oj/7D7p82eAP5hKBRsEB7biepSv/DtumrUjHd/2sSl3iTHNTmstL37RIbkWPGlDQDWQxSsUyoJZUP2Pgr5bzmaSPKkxwg6mTYmyGKoYcyCpCrh/tXtlRSb/iVl/02lwkKcwlpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iwuRn0Km; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iwuRn0Km"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3Cakk6y3dasJPsHbNIZWZNSzEGzJHUaXh2fqMGPiPx9NoSZpzFaLta78NTZ5fuHUTfeCFAmNvIG+l8FXywVHIQA7+cn12uZblI/rUueAgDS3XeabgLcOTjqDSMz3fkuUbMhFs8uIBV8UxmRK6uq8PkKEC3TjvRTznSxv4oHEy9glnGfU/iVBO7rxkOTQhhHoy4ZAFtucoZ0CIQCWw1wbr9yac+iUDc/2E/4K/j05Jo/2F8j7ld4j0tHh0yJemeuTv3a9ppPFqmvDijQSdvofJ4u+E0aG1QAiMnq3PFy+vNeDo3m+HWMv/wrOfi4plU9llFiQsUCEcivOu97fuV8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC/gRagQUhMLs8hhy/ghI/H/6xgtqPn86vVc7MmkFS4=;
 b=m7g2e+hOf3QY4iG6IoALdYF5L1baT0luyO4vBXRSrcheJj8+sOC00ZW2tciJzVn1T+eLl8MX9cz9Eb3slVsC57QlRzS8149cPDy5WdKKXXpNh6ll2zuSM/15G9yv8j5Da2eiEhTgUB9ULQTu2SBJh9LUC5BxpKLWm24OZxlyN0IAB8Rf6nMIoyotN/q601UCps3J7hACTMQJVz32mhnvRYIfNF0ij0uwu36EYegBjrE/VfQl3q35+2kY74CUpUS5e2iSMoD+v9Y9qKyZzQCK2resbBLnJeOCqdZVa1VgolM8HNunBc3OKobLkXvMau0Oy4Q6mBCYSrSuPoaE5nPoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC/gRagQUhMLs8hhy/ghI/H/6xgtqPn86vVc7MmkFS4=;
 b=iwuRn0KmEmB7HRZ5xIHR4CJtOWFAofrK7PAHhxCp745RCypkIums+D9LQHIAHMT8l4jWN2oduSsrQ+Dv0EWpk+p/11aAjZGYuq+xhaoZDej45YmH1g8G9H6o8CJ/kDQDZIF/Mp3+Qb4u651GyUcaKnxhQGzT5vjb1K0K1VrKxqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:50 +0000
Message-ID: <87h5w2m7ju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 135/139] ASoC: rockchip: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:49 +0000
X-ClientProxiedBy: TYCP286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc36298-5294-4d0e-79f6-08de0ada08c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ghVXwpjZKK34bqxLVV09EjZVLKFkv5sFSURu96G5m6aPBHFhujoxcJeRU3z?=
 =?us-ascii?Q?0+IFeE5m5nFZcjQBkQgipmc1Kw6xRk8YGDLIl6q3zL3Uf2LMdG8Ad9QITQKs?=
 =?us-ascii?Q?1VI/XZnAiiqcyVWW180nkOA3HPoc86S8BZ/GJa1bxery1fT8aD1CB/nq+LUf?=
 =?us-ascii?Q?gIq7LxrgobPnf+u0+b4WqxXnu3Yn23baS7OLRxFtM45Dm57oyoCwAD+tUwsu?=
 =?us-ascii?Q?EmlLp3PvzYPAJ64FMu+QkM1Cb5KVlb6hyDlmdbnsl4zhmMynjvLxEW6iTZuj?=
 =?us-ascii?Q?+jCakrtWn8ZFuc/1BWGzoi02u4w7GU+ZqhIYYWAMsEQ0MiJKVMi04nORRmjb?=
 =?us-ascii?Q?ttWOYOWfO/kozOQUeopwpW2ot0na/13QzWTbReS1B32/EKrVJH794kGshhC1?=
 =?us-ascii?Q?RerQYXIVIqMJ2QTTjmpxxL0GVsRUwj77eJKrV1OAhQt/zAIjrzs1IikOTgTs?=
 =?us-ascii?Q?2trMHScsmavj25dSTOZeN3ZwId4hbpqRjVcee00swcKZuWUtdwnLENW6lKs3?=
 =?us-ascii?Q?kMYfZ8N1aLgpM+HfUOvAnYYzLjAJVf4dDwCwJeZ3jL9o4i8stmRcugXnFw+4?=
 =?us-ascii?Q?Hmu43XRY5Lmm10fkg1ytMtC+Mvy3uZ093sSeDMJyIueS9zyW5q880vnaQXVC?=
 =?us-ascii?Q?hDCld2uH4DDT+Cdgz5Z9nsf4+Vuz5EEF9klSWvNNZ7Xcc9jJqs5hlatBEvw/?=
 =?us-ascii?Q?Yr/SH3A0BhpCb+UL12Afti4ELyEwCu+nHbpKCMiWl5Bzzpca5Xy4Rem+2F3D?=
 =?us-ascii?Q?qdyajkJCfz7CQcNZI4RujuWKMTY7BKcWg/vfHkiCK/j2o3SuK8ytoH16SCOO?=
 =?us-ascii?Q?w1HSAnAcGAwDz/QqLP4164LzRi+p7Xj69xtndCJ3+fpL/p9jDLAGPnetklCB?=
 =?us-ascii?Q?qtU4VHogodLSmQ25xovN4Njh6/2ck4dsVpV9+B+EBOfvGfecBrQ8+bezytd8?=
 =?us-ascii?Q?Yq6tnjdGPwIuqdKRCDjnwDCP2FBwNegOs5XcCyWTzdXHI/rxlpgh023PXjqT?=
 =?us-ascii?Q?el2Ahh0mkfPoq93sDY70FM2LU5KGPMH2VUhVFzJySPHuep0EUD5GwJuEX+EV?=
 =?us-ascii?Q?9kRzHJEXP73S9XXohJL4pI3z+81QbfBlYKjy3DaHFkxSnEHNszlnugUnbD8U?=
 =?us-ascii?Q?C93OorJ9H2f0DtuzrRIHx9JkMQJso+NwzzzPiSDwwRCUAvBaj9niv1dBAmEV?=
 =?us-ascii?Q?e8Zy7YkVtDXv0ovtH+BBzSyPlxEhVXB/n6ZDo1TYCrNSNpDakY+7+OBwfHP9?=
 =?us-ascii?Q?xJLLTS0CYQL+mFXSDBg4ytkhYpqHPCSSZtqMUZ2VOeR23ksdJhvHtQK9zcba?=
 =?us-ascii?Q?9VAgm63SySPBXFgtDEceHUj0XGY0wAr7qzWIEFA1PWSSKVM/21Gr8nj/mrAU?=
 =?us-ascii?Q?geMWTevm/TYSOin6Z72OC7e7mZkJDsI0sXoL8qRDoXbvKwLofrBVVUcBKxE1?=
 =?us-ascii?Q?IS2/fmqTnCeK0jv3ZhjXgJpW74jrk1WmEKg52ZSesc8D3WpNjEBkJ6HUcVop?=
 =?us-ascii?Q?nmRaOaSH+Wy5HQ4cAaTo5gVd9CR8oPHDXf8o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z9V7rNB5xGWgP2+zi43gIX0+nnTo4lK62X55FDGeeIlzgt/gT7csCGj/wNlz?=
 =?us-ascii?Q?eRteS1yyfmLDa/FzQ6LAkdRjj4R+KZTfNO2tYWJo1UDarxdCpxsZhAf5AnMj?=
 =?us-ascii?Q?BiuVN3nnrUKiV90vkIqRs3oy38jG2qfZQ+WNRnWF1dVxX6m94VoDkKJugLz3?=
 =?us-ascii?Q?HVTza5rFWTXTOvJGpHFVVxj7y8qcWh2Wik9E/R8ir2xZSZl9PixGYAD80rnD?=
 =?us-ascii?Q?ujH6rghwtbU4zKuOa1K3ML6I9vUKk53OJxThG8rTVRmyKVrMlPCz7FlOAjDf?=
 =?us-ascii?Q?MFYbRBI1MzmEkMuKYr3LpDpS7pdKGatmwA/Lf+wXUxDeTLUzW0gb53tpSS6d?=
 =?us-ascii?Q?1Tjs9kq1oXXfeOKGi6wX9ucfjnVv4hoAV/ETm08UXEAhHkcqpHX9Ei6bOTiR?=
 =?us-ascii?Q?SQsn+idAyhe68w9UKX8HY8W326gmghD4Bp4nTn79/4NDuuU/Qi/wcrkiaUWK?=
 =?us-ascii?Q?ml+y/nhkAQ5XX6s0YODLYPmfE4YbMfuVrFGDhGcDavH02E7SKaEjYbc9b7/4?=
 =?us-ascii?Q?2gD0JWcIpQ7IYyml0o5c9JyKsss0Zx03OVaz/KfcagnMDJ6xAqq1TDEDlCvE?=
 =?us-ascii?Q?Py0MSS8QSQ85Vx3NK1UcfTq+PbcQylUph+wl0JfEUrK+dUyH/71vAx8u+pxo?=
 =?us-ascii?Q?YyX2eywKDNjBzYHeA/e9/J2WhafQE58BG1QzXuTy7RVn2Xil8Yn3BEDw3M2w?=
 =?us-ascii?Q?Ydda6T7be5n6JDE2jPuJenfbnTJJmjetRqQTaXx4m/LNqwwAHl0g5bOp7asS?=
 =?us-ascii?Q?7BDPQmkvx3KB1rfmNx5youXEFRW8cl5V6++mhPBp3mxxJ1AjUdN19pQ6Rr4j?=
 =?us-ascii?Q?8Un+ksRWKEJkpCAYgJsyDgPhvT1IDaPN4R4/jeJ37zL8HiWKQTD/XiG9a8QL?=
 =?us-ascii?Q?uS4EG/hvgRN4bKirzcE7w2bpa9Nhzsb4uoXSiOH5MGocgHE7Q6lOCshW+sie?=
 =?us-ascii?Q?ePX7/7aIcU4JmASGI1yTWBVxbyvUvkFeWo8EQsxMB2ej0AmHZapAy8x4Bb7m?=
 =?us-ascii?Q?Fv+ZwgcIdZwIG+j9QOFQ/CWRizEhE5U/4W+HjaQTe8ZpLuRrst1cUbh5SRea?=
 =?us-ascii?Q?e2FWY4ydV+i4GMf72PCtQO2m3D1WFojYnv/pwgcpo8Y8H2gjU8P0xqLC0mpq?=
 =?us-ascii?Q?cMki4x1uCmdMMNd8Ij5Ry442vGF7e24vFT0tMZ9RpiOLrjEEcFh9SRCRFFVS?=
 =?us-ascii?Q?m1E5EBw844Y/8W6+VdAw3mQCkoxdht8sEDdpTAK/GuGIvEbJWTo6yTgqtJhJ?=
 =?us-ascii?Q?BiTYXTSfuQZ7KnhnBnTdW6o4MOCLm80Bl0Vt3notyXWMHR4Cm/0yawk2BQQ1?=
 =?us-ascii?Q?ks1izib/7GkKC+wi2tLzse9SLItVHx+URqkLX1NeJQcXT4dq8ORWHRSelVM2?=
 =?us-ascii?Q?lVt9BhcLzNKtofKc6ZHxN/6wrNCCMLKHZbw96SNywj/d8dLYMUp9P6FWdR8h?=
 =?us-ascii?Q?y6FbffgkuA0igKL4x6YhvnuRLqwsBmLyGqiEIZmr2HqHAgFYHK1ytASwJlWJ?=
 =?us-ascii?Q?KusjHqJDu1LzyI6vuSxNWDeKE8uoVUTLMPB7yJSfzzJ46GZeMOF0ALCBrwSg?=
 =?us-ascii?Q?E4GXOghcgi2n4qZH6NpUDTHZ5PXJdc2MnB6z+fXFWaJyeyaSrkZZVRz6t9dt?=
 =?us-ascii?Q?MLNGisOd0a7poypeda7r+0I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc36298-5294-4d0e-79f6-08de0ada08c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:50.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBvI6qcidAeOjvClhJVmHMQMbuCDcJ8iH9uNcICnQUkoiKCOWO90EpnRTAzL2PpjNyeikjseGyto2LUq8VVCOsJ81WsVcqOaySSbCULW4jKUJepXyqhF154oB9xOIIMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/rockchip/rockchip_sai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 6695349ee561e..ebdf0056065b9 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1227,7 +1227,7 @@ static int rockchip_sai_wait_time_info(struct snd_kcontrol *kcontrol,
 static int rockchip_sai_rd_wait_time_get(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rk_sai_dev *sai = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = sai->wait_time[SNDRV_PCM_STREAM_CAPTURE];
@@ -1238,7 +1238,7 @@ static int rockchip_sai_rd_wait_time_get(struct snd_kcontrol *kcontrol,
 static int rockchip_sai_rd_wait_time_put(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rk_sai_dev *sai = snd_soc_component_get_drvdata(component);
 
 	if (ucontrol->value.integer.value[0] > WAIT_TIME_MS_MAX)
@@ -1252,7 +1252,7 @@ static int rockchip_sai_rd_wait_time_put(struct snd_kcontrol *kcontrol,
 static int rockchip_sai_wr_wait_time_get(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rk_sai_dev *sai = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = sai->wait_time[SNDRV_PCM_STREAM_PLAYBACK];
@@ -1263,7 +1263,7 @@ static int rockchip_sai_wr_wait_time_get(struct snd_kcontrol *kcontrol,
 static int rockchip_sai_wr_wait_time_put(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rk_sai_dev *sai = snd_soc_component_get_drvdata(component);
 
 	if (ucontrol->value.integer.value[0] > WAIT_TIME_MS_MAX)
-- 
2.43.0

