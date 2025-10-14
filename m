Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FF30B52F
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416021; cv=fail; b=kdPqNzcNNG8CvXl/FIwORGwCT9b2Eoe0Ht3K2Lb56m4GMs8JAupErZGlK3GuDQTfW+rnp2UJAtxUBW+9EUDSyG6FD5ATqGoTX+hLEs9Deg5SrvlxudoupyhK8iMnFKpsZ4KIoaFPWv+DrAMn6LtpFkVB2Y6GFDqIXgywfrYHEdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416021; c=relaxed/simple;
	bh=Jx8ryurxwmtRqyxQEz+E4BJwHSUM9bCxVtVU/sJv5aI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hYLR/Z9Q4BBT/HP4ZHRSnMfUfn1dICnu+6eJ95jK5/dv+zkuZ7a4IvKKEHzYdQOjv5PtLT0ZCWgJgK+VFGNyy4DrZQg3cT1xJm0XHdCD0P4ddZP99b41NsndCTibejj5o9lH+kan1MX8+9PgAtRqAOQx7+kHhmz9f38zSphZqyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H6zN+kjN; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H6zN+kjN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbd5K2y/AvkCDYJTf/KXQBjX7WFFTr1XUv5qIBZV7OcZPRhJDyRg94N3bi61T9NnrzlbT/fPjpQ4Dth889nksPAMgRdhfxfokbCwRk1RnqUsj4jcedruWW3CJaDvdtiIn2G6RMmr4oSHUHhu7wn4YsLfImTHjszvzBBJtM2fhAS27982wiMOB8Q53jq8Ebqi4KIxpCSAJtLSWZZ8V6SQ1cxoQCF8FXGHBhhM7ZB+SgvNHTzkd86vcTnRxT6cns+mRkgfmVtYagpYHeNNXgk4948y3Iw/nsc8/XzGOl1/weu/m0nFFnsjX1i4nrO0PfFGvqaVizyLmTs/KDeHt6rpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FuJm+qXa55k0bZVXiMwFuCDPfB3yX9ximbTcsqPQcM=;
 b=lsUPx4BXWNx9WUEcPM6TfyrUPWCoYgU+WmV+zIssSYmnFf4opBxTN9c+C+m0c/1hlAZrfvC40tkqc1VRW111JCMnEfD4gVNDwZGuT8+0u941vCBNPT+zg9qh8bvMaVhLwMUutcZ1Qe+M9RWeMMBRW0sWIqqfQwfbZrD41J5oHd9KQ52Itk3u6Q3PCvBe20oFvDTf3y7OoooRiYXjQEV/lk/XutyX/PeFsKNy4Vhp5Td4cYzLIYTUS2ERAyKQpbNPL1QRN71Ohfb+vBp0qjvZb+3lVNGFxI3yYf0Ds85/Y4tBaq6ICuhmVW0ycdpW9auPILtomIXN3CvRU9AIb2WyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FuJm+qXa55k0bZVXiMwFuCDPfB3yX9ximbTcsqPQcM=;
 b=H6zN+kjN/C4eRCVJmuYfyoY0pcsQO2bzWgsdqAxVIpR1O25wSqmb1tP/EBZ3i0dxrWPsp8Z2sod7ikjc8c33K32OiH+AW6hLAytVo/g5zJV10vJPH8Lc5XCP2NMaeAuvTwO5B1TiKG4gw85mRMAKGFAhFqeJ8BzeFT1EgQ2ebHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:58 +0000
Message-ID: <871pn6nm5p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 121/139] ASoC: codecs: wm_adsp: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:58 +0000
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 921aed81-09a5-4c9c-481c-08de0ad9ea44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fsyhcBnk8PffRmAWcAemJRbmegvOrIsXdssWjQjiMB/bcDvRsbWeIbPSHkhB?=
 =?us-ascii?Q?AOXq4w04vUs+X4zEn+maC9ST7DZFsEsSQqkvf/737yA0bgsYdrH7tflfM2fC?=
 =?us-ascii?Q?+ByybYUAmZqxLVoMLcEz7GncYGwxS9dMLar+xF4MiQdTH5gNV601KkHvJAyI?=
 =?us-ascii?Q?I4XeibH7Uf4U7DPOgn0CcGJP+HG1aoUVsXuMM5wLlrVuW/1QDaCA9blVS5s3?=
 =?us-ascii?Q?q73wCC+MBzm62kYS8wgO1+zYbp4bvocbSlXGV8KYv8dY/SnCHdgSErf2y62a?=
 =?us-ascii?Q?bp3t1Wz+q7W87iLHVP9MdujjimySeHBSQ2HpXAQLRlcJmbhK5LroR2fnQOW+?=
 =?us-ascii?Q?r74RS+0aVCb0AGs7MzcML8yOzIafYSnf46zS5kATxJaX7ZxVyrwV8ftsKIvi?=
 =?us-ascii?Q?MPxXye1wlLRQIRe/tpM79ZtGcfCuK9an9P78WoGt5Lj1J6w7TmBWNuWwiwZV?=
 =?us-ascii?Q?bgUGSi0V+Z98fH7jRt2Gw5Oxz7rrhUitwDegFypn48VBuIcQufbqMd9wzXK7?=
 =?us-ascii?Q?cgyKhtNQO+6zZU4S8zqGprhHNx7Z9LmGZXAswi6vc4m0fwmwwZ80haOc2XaQ?=
 =?us-ascii?Q?wnnqjdPvw8P8Ncgm6kE5sSZvwBfueYQ4WdUMxD661cdEOWvuaBjJcebZ+nt1?=
 =?us-ascii?Q?8iGIY6DwooGxidqoLuLOYu5v2gBQWcq6gJsC1YWPjTV1UClICcfZS+ipfWkg?=
 =?us-ascii?Q?v+jIhk4/0q/SX3kB3xDfq5yPDa4swjA+YtGKOzUrdqO/l2leo32eqq77fWcq?=
 =?us-ascii?Q?toKBbq1OcyaE5TxNyWOJv9Kt7VO3lzNjGMqyAp2/NwX7C7Q26PQ0rKMK7M3d?=
 =?us-ascii?Q?psLqNsnKRXh/Sm0nbQSraDfcP/C3XYlOVmChejl62IzFMgz0EDi0781SIPhN?=
 =?us-ascii?Q?okGQmMGbMZ0b3XDuFPLkwUP/QqXZ/UDahnnE8ty0cJVmCMb/U+fR0C3Nl1u4?=
 =?us-ascii?Q?2wjZCVNNDiUWdCaBCs6FK78dIr+dQHb5iM2ZP2NjGbbOn+vPay1WKxhkiQAs?=
 =?us-ascii?Q?01Z24M46bf645qq80L9ZcNIX8hsye7jBkfctoscY8iUK+bUBx0sblAz1zC1W?=
 =?us-ascii?Q?ypjxHRqTFhfRYtOYk/JxYPSxQDcI+DGbnAaN4KSA1A8A2elMynXM+nUhwHM0?=
 =?us-ascii?Q?m8QeEe8Og05KZBanW82q+cozcTJpaz0VXf20K25AcyTWY2HA2jXgdYojyHS9?=
 =?us-ascii?Q?zmCNnb9wRsmvTS9bYSAzXgdoLWDSP4sWR5a7B/2GaVlbQ/b5/tqsLK9DYVnz?=
 =?us-ascii?Q?uiVCgTyvwMGcykDnnDcagR38b9sI7E3FoA9iA+mNhVeGKdSElxRYhNpWfEUe?=
 =?us-ascii?Q?wGrfMrFz7JnfN8j+tb5Tj6QzTyYaD7sjYMsiL92gQ6Qix2I232uZ9Ci+fdyQ?=
 =?us-ascii?Q?a+VjN52V4YOK4S4QJkSaMS2jb0LdT/fVlYbrKMcX6+YbQenY7OKGu7d3AS3W?=
 =?us-ascii?Q?o6+wszob/+5JK9sB6OS+WiRem/pEKmOCsM8mAmdqkny/JkCjHHWh9VrjWFoO?=
 =?us-ascii?Q?vyaBeWszbsp8Chr4ryEJvkGuy1XcjVJojNbc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h+Yo2Ym+5UOXep7TxnBVKCAWs6MeYX0bSolSdWsjmiv+2PdjWm1ybTRE3JmK?=
 =?us-ascii?Q?DoCmhmlSqMcor2a3UmFpfAbu33J2kUwQR9KDQ0/wv3euRQYupbWP8oLi6aax?=
 =?us-ascii?Q?N9EaJs+9w/OmNz7nP0iolKyUYDRGFYTATkQYhi+zHXvyHDQn8ZE9zXpRA1bi?=
 =?us-ascii?Q?MLp2kreZGinY61EuwsYBfhF4AI3XtrA2HNC5ah/2GE79HCo/+UM8/rKCx2jT?=
 =?us-ascii?Q?yGvPEL4wLobz+wTVC916V5QDTUz4xFRmFOnFLbqOYODT3Qh8uRfvPGc7yenQ?=
 =?us-ascii?Q?HmCSzeFfFyaXowKxVKWxvySMUWlYWth0/Zy5vg3rqWQWzxCR0OZydc+HR3U6?=
 =?us-ascii?Q?jv5PfIVn4tlKU0cIlnsDtu7Aw2P61x0jdcquDe3yjESi4maGaOvKSkDhRQF0?=
 =?us-ascii?Q?WYe5SeUkbaDRs3RCT5nH013HpfZOIDullMVo9xLXv9nueqqkF05Al9m6lE8/?=
 =?us-ascii?Q?WJK87hhdqP5M5Lz6qrXkF2OWcKpuMLYw8wtqgT2JDKLhqeKWONa+x4GtljEe?=
 =?us-ascii?Q?lDnHVb4Sz3AI46Z5zfjSw2yBaSVsqlglBWTW/21nrSTZZpnnXy+c51wQfyE/?=
 =?us-ascii?Q?RpO2j/XvshZTFdoSqVsU7il4Os+K+1TZQpAfkSYCgRcAEw78EGg5thTbZdPP?=
 =?us-ascii?Q?ABu45mFo6HWaB9M0X4/TJJKusl24Ue8KAZLD4O0VihRpkgtsaAUc4rIL2ykw?=
 =?us-ascii?Q?JbhdBKGrbHK+ZcYRK6Em7L598LIVB5RpA2+3Nq0KCbXFrsbEwtssWMCri0oC?=
 =?us-ascii?Q?P+fk2/C3ZyppExQG+jkCyg4uginf1EniMYwdZQgIKogt62V38Ps77D6SQQHC?=
 =?us-ascii?Q?s3L3xRWr9gwf2wJ5eyrPJIdUibXkNHiN8SxgZsI8Lj7AtBVp1oiEveFLUBS1?=
 =?us-ascii?Q?8U6sprCSmP+m+k2kbO3W/GqZMSQ8UauH2ouLLEqGfX+3VE9AgKnh/57sUEv4?=
 =?us-ascii?Q?JxzSKNgzid1cAV1YSZl9bLeFnQl/V2BcjNj5j5lZTER3EWV8ICLWj78ryUkN?=
 =?us-ascii?Q?zSlqpaTgMFbJXyFK03U6M9wbRbAWCNtOeh0VJ53L7NQKOBT2vpWShrzmebbY?=
 =?us-ascii?Q?cfA1bqSvLEm2CRczS6YopDPRAC4FUQ9IVfSTrfYcUzmOCsfwoR+1bREks86b?=
 =?us-ascii?Q?6T6MmgqyXFd3vXh0sm2G2F/LeRoNHPs1A//GU64Fb8BDaEtn0mB6CR/JmW2c?=
 =?us-ascii?Q?/7/UTzbszkXEMoy3RJzZazdS2DaJe4+g3qeIyzjUwKKVUWCvLzZWyZ/uj/fG?=
 =?us-ascii?Q?CIKNzuMPtC9Y/SQ3ULSXKhJO1d5kz77WnxGxxYSQtTZbY3BkJE9mHExK4hCR?=
 =?us-ascii?Q?ZOBkPECGTlqX1IssRUqvyuzjmOfeSTFo3+n3ygcq+mM1zzKStEjpr7Z9VGrV?=
 =?us-ascii?Q?s01AcgV48CqsIwPPUl/Lf63N93G833tvZQumdJ6ybRFmjYV04GtbcVe/X31X?=
 =?us-ascii?Q?P6OuDojBFNQ8YU4efk67tQS1NqlE/OJvijMjosZB7E0VBMfSkd7+nRAQ6hf8?=
 =?us-ascii?Q?kfQ2Z6Yt3EfjLrV4sCWGvpZcCIdydvNmZ40BUaRBr6SST7yLbUTJQmoQ6g43?=
 =?us-ascii?Q?8gdafr4PtbtlvD3aYVRSBEuIF3U3ioquVD125DJ2bZas8puskGIwfAMb+NL2?=
 =?us-ascii?Q?4XH3b1jCrqBBOq1dLFdOyvI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921aed81-09a5-4c9c-481c-08de0ad9ea44
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:58.8870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kBPQg2zksz4KfXhY5cEkwVvDYMZdreN7BURkftI0QWlt56WKKWG/zKsomRxGXWdlGiYQsPWfK2JGue3NqDsqlDuUWDSgTjPgzuoppzeQ07u8Xxv/oebvG9GWSMmu/2c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wm_adsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8782c331e9252..b1b1459073af9 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -319,7 +319,7 @@ struct wm_coeff_ctl {
 int wm_adsp_fw_get(struct snd_kcontrol *kcontrol,
 		   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
 
@@ -332,7 +332,7 @@ EXPORT_SYMBOL_GPL(wm_adsp_fw_get);
 int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 		   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
 	int ret = 1;
@@ -936,7 +936,7 @@ EXPORT_SYMBOL_GPL(wm_adsp2_set_dspclk);
 int wm_adsp2_preloader_get(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -951,7 +951,7 @@ EXPORT_SYMBOL_GPL(wm_adsp2_preloader_get);
 int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm_adsp *dsps = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct soc_mixer_control *mc =
-- 
2.43.0

