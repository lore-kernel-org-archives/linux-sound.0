Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A47339381
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909505; cv=fail; b=hiy8yA2jv+bfeMBYc+W3sYc+JKUfxRkgUXxLfGcZNnxhpbAbDms5u18UvJbG3cVR8DLSoXSNjxwYg+Z+lF14AV5jpHRGIPwuIbDvcotzX2F2aY8uOJRJ2nQ7jNK1QYQ+qImo9vfPssOBoCLOhOhWfu27rWYP7452S5AvThPfAhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909505; c=relaxed/simple;
	bh=4H75kFNDJzpHPf69+FMtn5iothG/OOjqByYcZjOh6lE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z78oHWHnGimFQNScXiskCYHJGqdQ9mJnEWK4cYv/H/7SVtKwbgI8+iCd36w6le9b9in0wvm7lnlx6gJg2X2jlBrd4066PS5nKKlO3F2Rr3PfXgYnFkKrU19limD5dcA7XH9LfWAQO/7PI8ur93fQ3iLbScfd4/8D6qwJWPsZzmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RLEXTip5; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RLEXTip5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slJdL9VuItgLhDasKxaXCABGnHVoHLVWrtBdTdkHfjXs2/FN86RyO7x44yEQ8UMHnMEsO3hRgrDwtGRWqyYW/GQAMxlwH0iBkrKny7fWNYBf+xSuZjaq/sOZWtBYKMinkMkyP2fKkrbq9E1QQpP2T1jgXqAwv3yEsTxuJVM6qkZ5KAUa1arDNlf605/RkFfpM6rLpyvkt7N34+pGGLUs9AxwBQ2fog8JpVU6QUiDTQ26as/bdz/xcyR2l57yz9LbIQe3YphaoIxVMzt8fIbjiX7m2ZHLbrQKkB3wvE0MdzyfIxd+xlfFrbgDVje1Typ4/IzWJIITLtHQ36tSmoBylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+tfMHPIETYfaoaU8/YWQ7NxTk/6kc4rVCvagUKU9R0=;
 b=zP+5xgDTFTN2eeHFJPJGORSjwI3VLvNWDWN3/n4n2bg0HrHDS1ZWFDO/DrH8ygN7lDO1VCjkQgOPDeNlIIlXn4f6GkbpMhEN5FQH2CDFcsekvCPRjqUqS1ks1+79u9yZQcCt12u5d42ab+t4xVCvbbT+TVtfURQ7e4BaQTLemVLIUf5LcD1E8ihG+KFE/KB93LhJAMOFBJRRnJzslGSkk5eF4D7fPWTwHNU4TEzM4q/M7li3du2Ozbk6h1o4RJEPU+jiGb07OaV4h2wOJCieMLSD2VWixRQblOGEJJehvKlYtGoPCpqMM+cV7mujgQyYfp2UZLSYhMFkMSInqLHnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+tfMHPIETYfaoaU8/YWQ7NxTk/6kc4rVCvagUKU9R0=;
 b=RLEXTip5E/1ZoRZ4BIvpegrnHZUx1Q4wCtq6+TczV30LIockkNK+XuzEpqPsff343v+pTGGn92rAWN4txjWX+QuwkVNj69Nc2gG/zlYcYKDxV+5vm/uUcAciiEdCS4diBGJpeA6Rj42MBph0OH/UM3cNySKKoDmvYmMpjaOq11U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:41 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:41 +0000
Message-ID: <87ik3k6chv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/13] ASoC: soc-component: move snd_soc_add_component_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:41 +0000
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fd01a7-2b1c-4b4f-8957-08df20301625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TzwHHeX3tw4GIXVWUqZSHaUf8Ol6FmH/T48la5K6flZdrgSkwNz9kIxwlX6mczhnkEvYnPqZaWumtXxY865pIMrFq4ZoV6EMJbBbdIS5jK/727Wv92fxeTgosG2kGkBwCEOAzC2A0msStEABwwZ5r5qKzZEhjugzUPnQ1hZtSX6krIuIAha6BB+47mytmv+bPegxit78eTxWGAzXMdPNZgRtpdCn5+si4v+1e5OEe5Nm+aHXnjP66v+EaiZRdYIVSKVhqVC6sW9RD3bYOIiz82QiHZ/YssA8PI1tZ5XGjlqIKAd4YRsR66Q4BwU7OXyYgSTXmw61YJfAy9i+9pGpX+EuhEQpvlppspuqegyTn/NyCmWgeI8PlZycTTlyq876FGk3gHNRfrLShm2trADE86EQNOJXoHD7pZpc+4rT4TWAzvEo/u+sK7XUUHsuLVNcmwsXfQ1w2Kk3q20OWHiFJVNfZzw2bSsz0cafCawvDQZ10UxBRNQI+D4zTL1mLtGCe8Q+7foAHul2tk4Umu81UIOvmN0z4BNz1yRMoQ5EW2abGV5HXn0NSXGxx0pDdU+YQAlM9aetIHd2gqL36biFytagsHKBHLw5NqWW9YVddhQavaGwojIm90NTl8m5Bj+tY7JUQ0xEgjdAZSYgzOF5B2Obg1cDEBWQdFuMwbwTeTqwAk+0qMu16Yzlu63a/06ZaTnnvD5ZBOcvb7/gviYnm0ZDZ2N+/L2ahXhQGH3jQ00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?P3I5fMABHlK/PH+VArzWKdrfd7fNYmExbq9ZaEPGKVs5atL5esIDXfrt0D?=
 =?iso-8859-2?Q?60vlCwqfk3cVwnyL643jVbKppYormQgxl/Byo7De7PDfJocqrG2yJUgZ3j?=
 =?iso-8859-2?Q?Qp8Vx4NS5JyIFwnO5SwJhoOIKo6ZX6HzuTpK109SSoXuu5B0dYJXUPYtTT?=
 =?iso-8859-2?Q?naAfIjIDZxNQ/uiwCHCmzYN52RxtxVFFodFgbjTjdSBZjquCvY9or2sXSY?=
 =?iso-8859-2?Q?bKr4GlYLAYTXyVj4qEfLEe2hLkhO5qjZk6fTfIn7CIwQwRFy4RGax17vZB?=
 =?iso-8859-2?Q?/NK//4tILlY/D+90U/4kU4bjYWxlR1/ABDG3vhTI1q0UQ0PsWK6JVoFghH?=
 =?iso-8859-2?Q?+hrH9PBYSpbWwz8DUgPZ5jffglwu0iY89LTJf4zWwmoL3TsBGGaI3IbOfR?=
 =?iso-8859-2?Q?pBjPkWLZg4ueWbFRHqQDJhJJ+tpLTxT5DLbZX+xMh9oyrbCK+XrUYlaf/C?=
 =?iso-8859-2?Q?0Rvb/2GKXvCKuk26wlV942UN5wsq6SupFgE2L5YPg/DD866y66D+diMPqK?=
 =?iso-8859-2?Q?fjF3mdcyGY0//2AVCy2lO1CGn4iNQ3D+bHJhEqpMblfmnGdgsy3UXtbivc?=
 =?iso-8859-2?Q?O0xweyvs+SOqRpOnT84ECY8M5qrfyp5+0hPov1drJCinW3XHSsZwGnacmM?=
 =?iso-8859-2?Q?dMxi13q6ePtKCCt6uyOiS9jcCJ/t2ehJqJndFhI/G53FM5UoJ/Pobnj6Et?=
 =?iso-8859-2?Q?hYMLKIbM+CusseeD6ZgriE+r5ypPkMd9gwKNdaFII0goeEKCgq7v9uKy2P?=
 =?iso-8859-2?Q?OJGcJYBtT0v+5TyyminTV/ssip34w86feKWtc0MdhfVFeDJv85UyjYtsbT?=
 =?iso-8859-2?Q?o3D+i8ahM2JaL8spYJzQKhcz+8SGRh2dqKhnXmZldjdxIBxpvSiFFnEZEl?=
 =?iso-8859-2?Q?iMiT5UrnFguTJCN3SXKLXPw9AvIRpctmdtkMDV9sWNSvSeKvo+AG6eUb4A?=
 =?iso-8859-2?Q?pILd5hmJ+mqGy5LmdUgRw5pUkzxc5N+HYWAnJfP5TR8fT1yU+3Wju0h2jW?=
 =?iso-8859-2?Q?Gu2k30owgoXl6DPU586nrdp4uz5uPJb+CgucHURasYVcxb8vMlLF8iKhoY?=
 =?iso-8859-2?Q?S00mp7KDImwVuYzQP3MpaL+ycjC6qAJ32AXpTdLW7pRqtuBmD5N0GI7oZQ?=
 =?iso-8859-2?Q?kfpAbH6ejUohqZ6Z1fbyIcMxQSDEliQ+uD59BSSst6dstvAidNeExznIax?=
 =?iso-8859-2?Q?g2OntlwjFsQoRe/yaMe8gwFKisQEy9kf4jep7p9DqncIXqoXBybZyTsOKV?=
 =?iso-8859-2?Q?Wrqdc961qTjPfOxLEf4ZoZcnaJioL7L9/jjWRUmpgSM5Ix52YDVeeqU6qI?=
 =?iso-8859-2?Q?wHLqM1TSaEV/nIZNTx4H64RFiaTcayTUNRHlgunLA/bpKhv+fdpGosM8dg?=
 =?iso-8859-2?Q?caiiUBKgkvd0GSL+2EwBHrIBjnawKoqT5mY7FbjDGr9+fR/aqz04uI9yrK?=
 =?iso-8859-2?Q?C/O08Q1DBfeX/LAFl3ufcuObtxtFw3DSER7n7RE3trp/3xVWrMosEzk2ru?=
 =?iso-8859-2?Q?MzN14RscNipkx+S0ed8PZ1o/4HK3NjQlIOQRkmkbs90QVYCrs7pSw9kj14?=
 =?iso-8859-2?Q?6gFdVWz17fL9mOn4K1vfyzceFp0FziRADb+xp3+WB+vWXYj5Jm5SzCRt4S?=
 =?iso-8859-2?Q?BEpnRFtDnHfbOb9J+hIHhfzYolFF5ZaurNhkyTgCeZJZViTl2PBsOkTdhO?=
 =?iso-8859-2?Q?eyWP0rLAsgS60El8/A4jZDrrwSlgXxe/DCeAkD2jmI8V9JY+kwll8H8sM+?=
 =?iso-8859-2?Q?sh37jF1VKPxufrAyoPHTsUuAwU/dPk/lZhr1gipEg3dNezI6uFfxZmftLc?=
 =?iso-8859-2?Q?3SK593eyuNqlcAq0NOTf5WzOA5Ldalo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fd01a7-2b1c-4b4f-8957-08df20301625
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:41.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdhPgE7iZyre4qeP3WPlfKQcy8YypUokHIfZDFqsTL65W/Mb5ZyAYzB4j+qZsocVt8Uj31gX3OkPaH2PL1r/0F8TIESPAk9VNORM4q/dAvIi0BSD7lkZvrGFINsdgfea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

snd_soc_add_component_controls() is Component related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-component.c

It renames function name
-	snd_soc_add_component_controls()
+	snd_soc_component_add_controls()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  3 +++
 include/sound/soc.h           |  3 +--
 sound/soc/soc-component.c     | 21 +++++++++++++++++++++
 sound/soc/soc-core.c          | 19 -------------------
 4 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 734dc44773e96..d83ba2996653e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -355,6 +355,9 @@ void snd_soc_component_init_regmap(struct snd_soc_compo=
nent *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
=20
+int snd_soc_component_add_controls(struct snd_soc_component *component,
+				const struct snd_kcontrol_new *controls, unsigned int num_controls);
+
 #define snd_soc_component_module_get_when_probe(component)\
 	snd_soc_component_module_get(component, NULL, 0)
 #define snd_soc_component_module_get_when_open(component, substream)	\
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be984..09a3e737c23d9 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -551,8 +551,6 @@ static inline int snd_soc_set_ac97_ops(struct snd_ac97_=
bus_ops *ops)
 struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template=
,
 				  void *data, const char *long_name,
 				  const char *prefix);
-int snd_soc_add_component_controls(struct snd_soc_component *component,
-	const struct snd_kcontrol_new *controls, unsigned int num_controls);
 int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
 	const struct snd_kcontrol_new *controls, int num_controls);
 int snd_soc_info_enum_double(struct snd_kcontrol *kcontrol,
@@ -1548,5 +1546,6 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(=
struct snd_soc_pcm_runtime
 #define snd_soc_add_dai_controls			snd_soc_dai_add_controls
 #define snd_soc_register_dai				snd_soc_dai_register
 #define snd_soc_unregister_dai				snd_soc_dai_unregister
+#define snd_soc_add_component_controls			snd_soc_component_add_controls
=20
 #endif
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 463ea227cac81..709d78ee92fd5 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -12,6 +12,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 #include <linux/bitops.h>
+#include "soc-internal.h"
=20
 #define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
 static inline int _soc_component_ret(struct snd_soc_component *component, =
const char *func, int ret)
@@ -339,6 +340,26 @@ int snd_soc_component_probe(struct snd_soc_component *=
component)
 	return soc_component_ret(component, ret);
 }
=20
+/**
+ * snd_soc_component_add_controls - Add an array of controls to a componen=
t.
+ *
+ * @component: Component to add controls to
+ * @controls: Array of controls to add
+ * @num_controls: Number of elements in the array
+ *
+ * Return: 0 for success, else error.
+ */
+int snd_soc_component_add_controls(struct snd_soc_component *component,
+				   const struct snd_kcontrol_new *controls,
+				   unsigned int num_controls)
+{
+	struct snd_card *card =3D component->card->snd_card;
+
+	return snd_soc_add_controls(card, component->dev, controls,
+				    num_controls, component->name_prefix, component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_add_controls);
+
 int snd_soc_component_fixup_controls(struct snd_soc_component *component)
 {
 	int ret =3D 0;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a1985912..b54706dbb527a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2305,25 +2305,6 @@ int snd_soc_add_controls(struct snd_card *card, stru=
ct device *dev,
 	return 0;
 }
=20
-/**
- * snd_soc_add_component_controls - Add an array of controls to a componen=
t.
- *
- * @component: Component to add controls to
- * @controls: Array of controls to add
- * @num_controls: Number of elements in the array
- *
- * Return: 0 for success, else error.
- */
-int snd_soc_add_component_controls(struct snd_soc_component *component,
-	const struct snd_kcontrol_new *controls, unsigned int num_controls)
-{
-	struct snd_card *card =3D component->card->snd_card;
-
-	return snd_soc_add_controls(card, component->dev, controls,
-			num_controls, component->name_prefix, component);
-}
-EXPORT_SYMBOL_GPL(snd_soc_add_component_controls);
-
 /**
  * snd_soc_add_card_controls - add an array of controls to a SoC card.
  * Convenience function to add a list of controls.
--=20
2.53.0

