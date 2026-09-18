Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3E39AD33
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695813; cv=fail; b=ZTvbKQX0FQnOxYI17pEIhTErHIB/dHKpgL/LQslu7khMIldMQF3rNhn0KMMRvHS0srztJ8RKVsO8zrIK01XmXuCfAro/Td412s9+44t1b0EC/oYbib0gJ0ZVUcYxHXRaYH9j7qYh+VzV3+YhvVJm9T/DhTEUHEhfm0MBw1L37Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695813; c=relaxed/simple;
	bh=UbTpmGlnQXy9EC43QeVo4v1ckwwC7b/Fw/rdhL9nRK8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i+Hg/HZ9yvU7VoWGuCQY+sAVMCSFdt2xkkzwzPzgAmGgvFsQn6NqQ7cJi8fHBz7ZlJ6+YT7YY/rvocwk+MisJW3I+7NFlXwuMWw0mM55fDBa+0zykO7qNnyNtatE4AkqLz2DjAc2mPi/nQ42jPfdFMYjGCFnvVFSUDkVKufxMUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B0Zdosag; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B0Zdosag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdoVcOW6wygd9GFRCv7+5IKp7qSN5OkjB7TkfwcscgQV/V1gotq/S8ULWum0XvmgyNmF9VB+c3cSTJj/9Xx4lg7K+KhBgMjkzlTkkz+nIbmSv8aJtdK89jEPNoPXqfOZ9rBI+HNfBXLVML+3FAMIFYpd5nXoJTyE6hNLf4ixrpKaFVR5UR6Mh22Q3Eowpg8i60fBV8Ze/3Y9cJjBdo7fQ0rcEakuZemYowVhTfXFj+oIb9vdvSWkz1K50WfzdWsRFTA6VooQOlD4QN8KzLNv/+9hplcjjJu/nyWpraHdsFvhUVulRwomiw5UXnY65uHEO8uHepk+HnaRmRuxYL0ZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHOQvqoJJF7FUlkAPaUVYr5FtJi6fjFyqB0phQPR8MU=;
 b=bxPiQWA0cFTL7gDQ0UajEs7eCNXrX3mxPFW3pe4UAP6+xo/Y38PsmfTHvKmQwJrtMF7ckUYO1QqS3kWrS/zsLSnfXPjp9Bu8DxEJ9LjsLNZwDh4dZshyf8CLOGeEpNGtFN6DrnnmX1eBbsjWwbdJl+3rUAP5lSdw20adUqQQ8UB0p8ZWEYn+A6VZXUMjfuoFalCOLZFicEDCMxsMVgQftvq7WYfC1D3odMuw0cYohIFHl4uVnr/fc1COVI6neS2QR+2t80YJiZkxvgz9HSYLE0dvI5t2UoOxYqS2l+52tJSZ331RObW2xuySz1zMThTtp9yrv8CKMJpDLOqci7MTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHOQvqoJJF7FUlkAPaUVYr5FtJi6fjFyqB0phQPR8MU=;
 b=B0Zdosagvyemn5qvonQV/Hg5gIWqI6X0Z1eUxSDHHYMN7pcdMVyQhIczkpGK99B7Y6o8EbOBLKPicTECetDbnFo1B5q3UTMTNFcVE6WWIPYN0IGxDFRBTAwWXQCiVIbTSEK2GKLpFPwERcpA2BBIP8hjuN0xRu36w8IH6UqSD+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:43:27 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:43:27 +0000
Message-ID: <87ik43jpvk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/9] ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 01:43:27 +0000
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6b808d-6699-473f-5ce1-08df15263c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	HF8EtTFRrVIUAj1j1znYQ6u515/B0eIKJxYb+16EjaP+ttHVJK6nVmLETy5VqV830wXiaELJzoYmfT3FtYXYi8KpEBgrw2zQr9/i8vfI3ibSwVpJVRlUHwwjTHN7CBfs7AVmgMF71OE/R07FadyIC4/0RwHSfmFaua5pSKVn1V+PvES49MTua9hXsKeSmNHGJuFaqqwNAEqLErN2VzvMENsoBgszNtdbmG8w4URvAhy9S8R5hmp7a4uhnyE8sRUWiFwI00BV1oV+ciTyadiPK+u5UtMTDYSxrjyJ6wXa04kTSFUlmMHbwEenRREhnYglBeiAD4rvECddoNQk1xfOW5yZXHqb1V8SpYjBjCkPoIXl2TgHNPvreHWnLkAvRMIQ281TvT3kG2SOu9/lSkP47uoi1IyvCpBdeZ3RI512tYV/vLy0pH7grYuW3LcBVBZ2bCoBPX+EG2ehFNWHTuC6hcHbxjRYBxTcDhugOXWvl0Q+4Lb9f+17AS1FbnAmYhuqN6+Lyt6hmW7fBCz1uHpyMmEm2lsYeiq+m6kHsvtAk5DwZd8xkZhQtJO/9HSqb3ggIZnQkph2Jxuo8lk+EZ/XI375ubr2oJSkOb7OZw9W1f05cxtc1gGBB5u9j6O1ex0ObbadYS54IyfQjUybVqTSlA1f2RbWbNTBCsVUGF0c4FWmPOI/53FUfuQzyhaProVWR7/Ukq4raB253GNsFYeMKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?vAtM5GYJgRnaUdmTtawONE8mcjtYs1bXUvj/AnGttREPIOQvOixA+nVEoK?=
 =?iso-8859-2?Q?LVWD0NDgDiz7whD27vgOqsOxq22V8ZvwPcYQbYe/ZOp1ISTVpscYXWtgPD?=
 =?iso-8859-2?Q?mEtTrSr5K3BxWp02s5ctOJrdwvZtzfZr4UO5qRBbLCniCid9xBFjd2CmzG?=
 =?iso-8859-2?Q?dkypAFQ7aQAdfMUtSR7srDEdhMXFh8h6SNSeCWH2S8w2CLreb1jKAeAc3H?=
 =?iso-8859-2?Q?YPYg3Lk/tmFxBCLL3/gTNKDxHosU/6A6E4hBzj1NJbavNHuAWgwkYjPQoN?=
 =?iso-8859-2?Q?s29kDKsbZ5s4+LIIGylyVEpamjrquI2QQp1ORjvqtgrhodZ8x+sUUkxl6A?=
 =?iso-8859-2?Q?2Vy+Nk/bNjTh9zXbSaZpfbzjJie9gBlyLTt6/o7GerDCLqRQ30rTMiwVIK?=
 =?iso-8859-2?Q?dxeHV29ViLFzko7zqFJWx09ZULsXkQ3+K8ETO7A0zgBratyBXhSlprq+Rw?=
 =?iso-8859-2?Q?tFUB3/bfXMTnIQMG3kqjl+5uXuXcvVObq+nhMsxZZY3gT5vitxfkHt0cWK?=
 =?iso-8859-2?Q?VwooUjZZilPSXdLlimsyRzDQy9VAxd7aVv97jOXazGGZE7ScRSFi0r8p2r?=
 =?iso-8859-2?Q?cklpOJ/EhCjqQOOGFEzDJDpgVhwV+rv57NI4tTQVyFwhpEITa5j6D2YYgQ?=
 =?iso-8859-2?Q?D/cNyIE6pgjHaTROUr0EvVXvzAhqTvesrkiFu03p3NrNBrYiEqwKECdDP/?=
 =?iso-8859-2?Q?1MlKQ4+q+jOW6phaLXI/LhZ3dv06Mxouzqozm7EbcCFjW0olyTs5Z+MB+F?=
 =?iso-8859-2?Q?B1RBAUk3321ar+ywQf2aksjey5QGUbZOVF18Ma1b275urL1EH0LZqLZGoR?=
 =?iso-8859-2?Q?Wy7aO1OggtXM7f9iKL9JqmGuqLOz+S5WwI2vvPvbgcPWPp418yPPoNcmjk?=
 =?iso-8859-2?Q?jTDdXPZQk//BdVqYaVuZz93/WL2GkyFYnRulC0L7zb72mlk+lm51SxQLdI?=
 =?iso-8859-2?Q?pF7Y9ltLDDUmWmunu2/O8XWFWysLRJOPtnd1sU1RuB2a9j2cXXF1IeCrzm?=
 =?iso-8859-2?Q?hW/N+1Q15PcmZbfvJWuPWkQTeUGUALwmLsWCWKgZS9bcvBfamuOpYquAYS?=
 =?iso-8859-2?Q?+Ak0wjHjtl4tLm3XOFSuOlcKAPi+0nZzO4VAqehjFb0j8rFUDPQEW5wQbY?=
 =?iso-8859-2?Q?9NxVSBtou0yEZCqGMEj8bjARcdC0t+oJR7iRdkAUubADZksmFxTux3RP5m?=
 =?iso-8859-2?Q?k3pZkgJqHDC9WZDHRISvrXke7rdyN52hGfbuSSdTYaYDTTwApngqmMfm98?=
 =?iso-8859-2?Q?WBvqs+aBQowIhbwAhvQggZTr3CBBsQsu21DsXskbH/5VC1GIFQOOooQNRN?=
 =?iso-8859-2?Q?1FfQdt8kBG/z8L5+HqqZ6hspOAtRdTwrvfh9Cl3/Gk9Dt+woZpwMXZtNjb?=
 =?iso-8859-2?Q?S3BnjbTL1MHxicIiCdYwUZzkx0heZUXgaG4x3gJDdYXnKZRu0oGD80iqDh?=
 =?iso-8859-2?Q?/o1tvLVZpsYnItSjG+ViqbbgbAV1+3n/Zv9P9Oty5IsjqwmNYVgCtLYSqs?=
 =?iso-8859-2?Q?Ox5A2vo2nsX77cO5JLA9qQbD0wC6zvwps9Nn7hS6x5jQ7rlSx8GNsTfQe6?=
 =?iso-8859-2?Q?E6AJJWa8rtJ5IdAwWCCBjc9f6LxkaHKadq2AHLyl8gFTlGanbNd5B2brET?=
 =?iso-8859-2?Q?4NRJt9nsjeAbwCCa5TKxtN6hDbTs7AsRZR1If1AtiLG4hs1RBDAOBQI6SH?=
 =?iso-8859-2?Q?a9N9AbA33sEhceybpi1rtsbdphM8kwYRoamf1HEFZhS29eWnhI0BZhXMz0?=
 =?iso-8859-2?Q?43dcla5y8xMsbaP88bbm43xlboiKZhU4zLHejmYTRrVu5IyyRZWO52O0X5?=
 =?iso-8859-2?Q?TadpBTowoDhvDXzFCqmtRT/OtC0C46oGCcp5lN9YVFmfdaH1WQeP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6b808d-6699-473f-5ce1-08df15263c50
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:43:27.6023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjZa1k2x4jAwWze1mZKboGIbpOW3UXL+g3ZR2I/Yo8x5mE6xbeTL6bAdbNlTY2lh5fxU59FAeXJE3LP3QLx+Q3AsYH0oE1y3XhoKQic46jt+S+SjET6wipbxU4N3lnw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_{to/from}_list() to use for_each macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 14 ++++++++++----
 include/sound/soc-dai.h       |  2 ++
 sound/soc/soc-dai.c           | 12 ++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c49b59630101f..6c1acc984ecb0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -258,10 +258,16 @@ struct snd_soc_component {
 	void *priv;
 };
=20
-#define for_each_component_dais(component, dai)\
-	list_for_each_entry(dai, &(component)->dai_list, list)
-#define for_each_component_dais_safe(component, dai, _dai)\
-	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
+#define for_each_component_dais(component, dai)				\
+	for (dai =3D snd_soc_dai_from_list((component)->dai_list.next);	\
+	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;	\
+	     dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next))
+
+#define for_each_component_dais_safe(component, dai, _dai)			\
+	for (dai =3D snd_soc_dai_from_list((component)->dai_list.next),		\
+	     _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next);	\
+	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;		\
+	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
 /**
  * snd_soc_component_to_dapm() - Returns the DAPM context associated with =
a
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 375a8674d1452..bd714c3bbf3df 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -561,6 +561,8 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc=
_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming);
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
+struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
+struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
=20
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 3e553e8c0535e..69a3df3c56a80 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -32,6 +32,18 @@ struct snd_soc_dai_driver *snd_soc_dai_to_driver(const s=
truct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
=20
+struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
+{
+	return list_entry(list, struct snd_soc_dai, list);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_from_list);
+
+struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai)
+{
+	return &dai->list;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_list);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

