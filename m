Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1637FF42
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605421; cv=fail; b=Tpud9cFpysd6Ag41EwosJk8IVilF13pU0EGI20waqlH41Zq90xDhPo21gtbw+9QzLtjaBErij/EBm0UBSatnoslv84osqNBUvAUSpvx7J+eaDDoES45Td8i2Tgedh6LTnnV+iZDF9BMWrr4cmXW9hP3SPaf+4X26NkEVpc7a3aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605421; c=relaxed/simple;
	bh=jfUiiV36XCBdJrCj9WtSJW8uMiBYvBdDQZSEUsjxaq0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ntvYn7jYFZDaEbIEadmauTOmUTfvborsNpqza0ebv8OspRSTdwitDNRNfeqz3PkcBqtomAGQAu8DUO2yrXuqozcdJg1hP85fN32sYbHP9GGOt9f70ZyqTCGgOyQ0qgKxVqeb9g2PUElnZUHBLxB3hSWmXLwx6wNKq4zbkUsGf2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PK926Bvn; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PK926Bvn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQpLSBzHC5TApdiOd+69YXHLdYepwOy4HiGFS0u7KnKR4qiaFL8bluqsLQnAG3r6lyx7VsIQ8gkoYpsfJ5S5FmuO1r+15uj0T9ymQVWuEnawl4WCF/1untPOy1tJ62STRAYFStUd1UZrpI9ioI3zEuR9YnLJobz+eOX9j2Bm/4KdcVXTbgR8avrW4tdV72+Ouf39jmbwLBY4GKlaYgbM9qIIuywHVzeDqjPM9WgrYIClv9YM9r09ZDOZBSTHVl7deF7fkVSl77EDy1I4b5ANptgM81Z2TGJDFse7OT9pcPg3rOxNw9v9DZ8YgHD8qS3hmBgBVYHcE7X1CWpnYHyAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSd76YuhXC9adtXIbJqMe8lOS4sHwaYN5vTvBDhtSfk=;
 b=wp6VQTRVqfDtDel5bSlSvHQx+GUjhf48F897gv0zvxMge9ymdY7rlBDFHTZbEIpDDh17wM70cVOv/xpXVP7yFePtZgEF40E4j24jWT3oVi79yoRQsUKc1kgfvPyq8F/VFTF6JzZ0s4LrZVX8/jg0p1/cr6Q1sxGBcbpEeH4+zPA/35JFBFR+fpMqa2wX3lQ0sIuAxwg9bPL6Eb8lUboa7SOtFUYVTmsltxh+ZZwFeAlxZjs/4PSEHAuMYZo/OkPPhgEVcpTpMa6I9M0P5e1CtrgqgFy/dxz5QwXcPO5p99cbCT90/aIvY8qI2cPAxWpellGnG3O/i3HHv4m7I64Nvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSd76YuhXC9adtXIbJqMe8lOS4sHwaYN5vTvBDhtSfk=;
 b=PK926Bvn7ghgvrYDdzyuZx7jN6n6SwBv0hjTNdwZSXBAQY8lvrHnkIJnWVlE4NBnVojNBT4/AI+N/6M/k6jn37bCiQbV4E72QYg52kcq1azfu743TvYbmWu7zT4myB/pWX+4ViBUcEi9m0fDtGU/ziizEW2cIGltacPIaz/mswE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:38 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:38 +0000
Message-ID: <877brsp0ye.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/29] ASoC: pxa: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:37 +0000
X-ClientProxiedBy: OSTPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:604:21b::15) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 908f60a2-e2fd-4bf2-3964-08de79b6925b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	wy8Ha9Ckn3em5JpjIgYubVphNb09342h4TpruYkt0Tenmd4jZH2MYufMYaUtjvVIkakDa4Dnxz3GvkoER/dd0YsTJMP2pGjwaLe6fPm+hqO4bunjDJnFt3Tk92SQ61HY2kDKL8MtcH8+dmBldedtfZNisa2m+kp56ShoSEdU0qtYrwjHCQqSfoBmDjqwSlD8K4SsOiG7eDz92Rl4wyB957KkZXXPyG6kW1vtcVaukuP4nwW66MnQF7z7/Okj1Iq5aVpx/smk0q4XBi1fhF0xH8bhjsn1soq2nKGM2x+1B7E56KQDZC3ZGZpo6MeH+BwQB0GqL1jjmvZExnqPsBA3308rQgb/HJNW0MvWJOTr4v4nIeWFrglyOhzUNGd5YExKUjIj0cANdbG05kgkd5dBqmANF8jEmSE3midrL1nFU20ypb8Z8qm0szfDhEQPS5nq1+GOvhhSIeDuM7oLbtVQKmM9WSRkmm9dfH4tvAOKZDpdXuEyHgO+XJovdLOa+caBB/vDarcpEiSumTZhzShu8N3oYWXFok7IBDFvn4P5P8GLMgikbz3t8wW8elU3Wyu+O++zYDoLrncf1h/5By/UbKZm8aQif/01Jm//111DB5nj7K2tD4E+EX4rvPtqbpNprd5KQE2+x6+5HXhzXPP7W0mDhX7e7UNAXxNUVlqI2bFXh3aYWGWlmKoIP0JJejn43rD5lrqrnqFskBoU5QD2UgY9FPIX/urDA5gZnUIpJ9aua7Xu6MQzGDQyUMEtHm4MngFyfft5yP4/vTGjRSAufQekadAbRv1UAyirJgB6Zu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8phzTnhTNDeXa6M+eLO9HfEYWLtv52XTxpUtzeHfMZuP4381fok1MY+I/Za?=
 =?us-ascii?Q?cI4SdvSZPPNl+69JLgGJza1ihPKaxmKpD5OJAOpU3gp9dDBNPzrMb5sv1hzn?=
 =?us-ascii?Q?D0MXYi/TkQD6gY5QbxPzoeyTV9U0GaRtjF94pYsguxK0+tQ3GErOjm3UIL7a?=
 =?us-ascii?Q?aD/3qGT1RGk5Ft/ASoxBm0m+IbzvIHTxVKel9QQbtptvwXFCYC3aTM/9BLqA?=
 =?us-ascii?Q?OwKDygTwQIK59aR4TJ57tyrY4CC0oTRZGgonT6XLTsDyPXseQenS419+BCWH?=
 =?us-ascii?Q?LRgwyOehgvoa8/w8QJh02WeKykzmFJsGe+7fZhU1ZuzE4wLNJ6UEchulOvXN?=
 =?us-ascii?Q?yzmWdRoMSXgjscH+yF7z1sLuB88alf8ahzRAl1G2ci0ndrX0jI+ylUJqotMO?=
 =?us-ascii?Q?LvYtkXaysxGEFfbSMF8gGGSmy65RmdbYy2DKGJy1YaJNRpRV8oLewiwCYmeQ?=
 =?us-ascii?Q?E5geoa+Nx6ugHWmOWvMoeqCdOuA5hpJrsTDioZGvP/NIu4cSvogDQGv7O/ch?=
 =?us-ascii?Q?XKX/UN39yDiUsgCfwaLbgKCsxBMc5b+OVnYof9Q7lCzDDCQ11LmQc+WvLJsA?=
 =?us-ascii?Q?EX94NFwLBPAl1NqvGpdZ3Sn0ZxzAf91dclzU0Cp7B+4FmSpIKQBoEKkYZHIS?=
 =?us-ascii?Q?YM4igWL6L9BnAF2iSPH5tTgdZoEElm4LAB5BBq0JeiwZoIA0MXW2QiwrrXfz?=
 =?us-ascii?Q?J9uFIDITkMnwtAt487IVxr8OEo5an0RRzdNZaOaNng9fRPOcNUwEbEzq4XTE?=
 =?us-ascii?Q?i+1WkbHgLbKVk26+aAg061X9Tw7eo5lxR47S5rEL2abohyOwXgs4A9XGngsE?=
 =?us-ascii?Q?A8xVBIk5cCSifyrvtQ9PA8ARf/odkKSCI2xlHus/vitjtXZcLNGkXMSZK44E?=
 =?us-ascii?Q?pSWLlx2N94Dg+7flu0V1glEbMrGvP4Vfpn6W2UeTB+fpnWpQYAO9UooMJP17?=
 =?us-ascii?Q?h48OEKak6Hmiwdbq4NBFO79IRJJiwU1pO9jZLaJejEzYxg8dVV9ZNe8REQa/?=
 =?us-ascii?Q?ISbLWtnLm3aIK2za1uJWk17GTtL2Os0KKxyQofvOm7YTtz/kzNj6A+TKLJst?=
 =?us-ascii?Q?yuyma6Rmv88FCJrM83bqpVGF0DXOvbKxkIw4i9nIMmFFZSEgRQ4Jhj2Y01sS?=
 =?us-ascii?Q?8Q9csMC2Jnv1sjAk/sy3QX5qhhVLKfr3Lpl2NI2OiyMOZgT4DGR7ZWGJNveO?=
 =?us-ascii?Q?ejU05NAXIFrvE9pU6qKPv1E3bRsxIg0g/OT6maGvtS/07ViMvkzavkCMoNwG?=
 =?us-ascii?Q?eGldLEGU5OUCbLm5XJUsIJcZRQlu8nrEZtKpcuwZ8iOZj6lOWzxtU3xNDzGD?=
 =?us-ascii?Q?PTnCQIj5vC2fbvOVCoVg8omdNCas1RwImIVrLdgRcIl8JvePZbhyYc6uh2tB?=
 =?us-ascii?Q?e7/reTeXcx+ZO8zunP0D4ZoOIFQv182uyKzbHT96btkLHfHx2o7r/CUgayUn?=
 =?us-ascii?Q?VszRhigJoDnhJQQmuOGybcPzcV3TB1uCxRA3FSTSqN7FGBlzN0MPyIsFVB/4?=
 =?us-ascii?Q?iFBOEzG0gtM7cu4uJ/wDWnjkKI8NO0UnZNFXnYu+F/qAb3HPyHgqptJIvWi+?=
 =?us-ascii?Q?vJZMORMrN2CObmohz3GrPEzM3NOvkVx8pHDwCrUxGKIn1WG5pio9t0jkrGwo?=
 =?us-ascii?Q?JZa7E9CuHXdvtovRIiWMzxi3ksk08w2tSOgaB78n19FvUFS/sGKAlP/QHoVs?=
 =?us-ascii?Q?154oJLJQ75o3sf2kTqB7tEmLdTod8z46FxZJ2grv02/BA6xTerVj/1RaSB4G?=
 =?us-ascii?Q?ofbZdKgyqP89F3osVhWqe8EII38Qd4C+oQyvM2dFjd1QcR8MkrsY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908f60a2-e2fd-4bf2-3964-08de79b6925b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:38.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gdnvnA2JaYM4GG5YmQ3uykRKifa4H/lzEd73lNnjz09PKqOsRH0X76/WyCg+YKtO9CgvHYFyUQV3xTIANI3EkoAKH4a9pUpAVAuaIhCqTz6u+UcPupzKFjEHwH4th2T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/pxa-ssp.c     | 2 +-
 sound/soc/pxa/pxa2xx-ac97.c | 2 +-
 sound/soc/pxa/pxa2xx-i2s.c  | 2 +-
 sound/soc/pxa/pxa2xx-pcm.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index c34bfa27a446a..37bd8dbd541f7 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -843,7 +843,7 @@ static struct snd_soc_dai_driver pxa_ssp_dai = {
 
 static const struct snd_soc_component_driver pxa_ssp_component = {
 	.name			= "pxa-ssp",
-	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.pcm_new		= pxa2xx_soc_pcm_new,
 	.open			= pxa2xx_soc_pcm_open,
 	.close			= pxa2xx_soc_pcm_close,
 	.hw_params		= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 109a4958d9c04..a0c6726029186 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -198,7 +198,7 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 
 static const struct snd_soc_component_driver pxa_ac97_component = {
 	.name		= "pxa-ac97",
-	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_new	= pxa2xx_soc_pcm_new,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 849fbf176a70f..f6ada6cffc889 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -356,7 +356,7 @@ static struct snd_soc_dai_driver pxa_i2s_dai = {
 
 static const struct snd_soc_component_driver pxa_i2s_component = {
 	.name			= "pxa-i2s",
-	.pcm_construct		= pxa2xx_soc_pcm_new,
+	.pcm_new		= pxa2xx_soc_pcm_new,
 	.open			= pxa2xx_soc_pcm_open,
 	.close			= pxa2xx_soc_pcm_close,
 	.hw_params		= pxa2xx_soc_pcm_hw_params,
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 9d6c41f775e51..ff0fbb61dccd9 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -18,7 +18,7 @@
 #include <sound/dmaengine_pcm.h>
 
 static const struct snd_soc_component_driver pxa2xx_soc_platform = {
-	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_new	= pxa2xx_soc_pcm_new,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
-- 
2.43.0

