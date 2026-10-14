Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7893C1D7E
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946759; cv=fail; b=kL7VNsD0QGa3XtrBzRANMhUH8qbnDyqqBG99xE8jMk6d/xkTUo48Ecm3RAIAbrM/n9qEJW/48oi1YZJE0Jxf8Xe0EsDWW7G0+EuLoeV2mnUbdej7mFf6F0kzPLkeTkMEErXpV2BhzW8yXxaTeO3GgyUn3rXWcMiCdghehNcj1rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946759; c=relaxed/simple;
	bh=3Bl+IwgRR1mtnFMFJp8N8hP/AxTFE3nlSYw+9zg8RNU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W2icggAujRbIBlQ8oEQRPMsQ8M/sNi6xjWo7EcdVK38fdCe3mCCName8IJCjmHA3wDQKlXGX0AC6KbGf/W64dOBHYdGdkEpDSWur0IiGKRc/Dpdfp8jBaKIVAQUgI6wowiHhDL23TycdnBjmXtXSzwFv3tLm92BIky/LJ8lKHYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UWwj3/lg; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UWwj3/lg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mlr5WVhlzbJOiJTkOrkj5qch0v/tUpe9nwqBl5tIxaVeIG6AFlK+SX+mPYkvUJ/oLiRzyghNiDhxHUuxygHH3Y1EuXU7NiyQ3rCgPklmELk3/8QyEJbeQapHzqFfZxZzMVgLhFoX1HWsBD/JxsbGX/8TW7Cd1fI0tikG626XCz/xlPF7lZeAWCi3HvhGXcQZTvJHA5a+HDEQf6cnwitV+skIqEuW1onkfyLHnNUPxRNjTCQelbb3m+UFWiEjPck7iLrUboyiVA+IAt6FAFQhsSCRiaP/5LXrvhkGnB+PCWsw+zNZwIlwjtu4qfxLiRNkVjxrdY0hrY+nYU/3o30p0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAp2Ry/IBOkQlIAgeCMQ2ZwwintMg/TuCm3W54yOlCM=;
 b=rIu2dGuwJi5qY4hrUNu4g4WwWhK6qW6hBuKjboCt9KVsktA3BOlTTvqV2DTWQwW9mZrbY6cW5EPSI1nnfJQtGttYx/SU25SnNIGVNCThUPEYC2qEtu5l7rraj2WHyG8frjAay+6W5gMOzr41LMcTSStlIBrxkLacHUJFqKRhQX4mDC0ka49ibDflo8nSqDkXJDesMksYzVwNjT8FZI/VH/FItvVN9NYt0Lwd6vH+X0bCuQcWKuH0ct2BXkh2gZZBPohRenyugPusRq0J4v8nR/DoYEbingSjbFy3f2PumtXGhRAy8TjVFmdZhvy5ZGyGvQG0ZOoih+bsYjG4CHkvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAp2Ry/IBOkQlIAgeCMQ2ZwwintMg/TuCm3W54yOlCM=;
 b=UWwj3/lg1RZGt9/uv9i+cYfACEm0u0vCkaWZD7bBmByEQUIIoCY/cvXaW0t3yELDxZuejh4lajEiap0k4fc9OIUCNfa4yeZuqo8deUWdFLdLM4QnDS1F37dUbW8QVRte5u5AVJxdTg5FGLitQ0jT90FP//V4DQ7Pam68IUY7Y5g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TY3PR01MB11826.jpnprd01.prod.outlook.com
 (2603:1096:400:406::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:15 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:15 +0000
Message-ID: <87cxtdyol9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/13] ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:14 +0000
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TY3PR01MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: 569222ca-2386-4fbb-02b0-08df299f219c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	KzpDHVynjYYaNDMk9IUEeEUw7zWSibjqOdmleF+Af5It+QjaWMrMP/VMwbNECHz0IY8Z55PtHcfeQClI6zsZE5g7YBkAOsj4ThekXBfAgs6Zy0EDu2YYmwhboi3eRayD+yKeCqgTtQVRT5h0TYoJnz54PpExcc7/LI1r9iDhLJSDOXHJUN3ap3cJVXRRfGviXuxIEri32LrU6sULCQO4FFoSm3IRFFClHoBzNmawdkmKmDkHk/caUzM4N4pdRXWN+wvKEyFUFHNlI5KKrAuvECZWxEddnBRwYNWSZCjD+Ckoqt9WLedNKK6cUOL/LH+n4WAk0RsgCUTShl5Q8L5GoUJB7D7sIbeZ1jeFG1ui0u2Tc3fx5yVhjzfKCG6Jsnzd2GmlWuISKb52AbI/yh+F63/J474lEau7fjdwm/O6jJBZMtiqplbcrSZZrlrTJ4FC8ON3U0PRZTlqzHNhlQ3DdplPOI8W+y3e4fBYxSE4/k5TPKjjAn0+EgF+AVfHl7YcMqNTyHTIncYGd0+BWjYqy11NO5Nj6rCcriTu9wp2bQnN6pR3NGaueH2n6Tqyk/RCmKJ306AjjWwqRGue8VtolNGl3dWXekbkRU1Q1qf+fy9L5onvQJ9g8GKg90+2RLMcChILULnzYtqs2gr2BD/Ov0PpJFNkbsm4fwWW5uHdfNI1A2Xd5RnKvUdpWv2ZZock0ZiVEnnukD/ESm4mQZJVWq8ob9qwuO6xjIb1ZTOpyD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?r1D0oE7T4QqiFi1mvGfdlT90/oX2KE3Mxa27jmAz5C0bEvcYDYXN5YPeXj?=
 =?iso-8859-2?Q?iqzYHpzO0oisw3RPrRGEgb45iXWGMhBgzJpfTaiDzCSYF7iUd1GtaJIgrw?=
 =?iso-8859-2?Q?LXxi/DdJVeEOaba/qLzID8DJiOBZh4qJTCadvYFQvcI7Byj7dm84hHpb1N?=
 =?iso-8859-2?Q?DhYP+nYmn5TgguM3dVG6IOFVEeZ5a6dx1PkL3fqGBk7CSEP/XBmSbtq1nV?=
 =?iso-8859-2?Q?RyuS8tn3m7U31mkbFINDD6hcrNuACgO0GQyOPHamjcsNCXv5fsi+FS7Sde?=
 =?iso-8859-2?Q?tZdKGzqZ/a30k/ya4oC+sOvWvt7ixq7/LrnSvsMEAi3qLLu0SKqi+I6eRj?=
 =?iso-8859-2?Q?xX8bGEUATu73aXGFi64UEsJGjqwxMSXTwHsG/zrFc/o/EPES+89BaWr+Rq?=
 =?iso-8859-2?Q?JeCrMpBA5lkh5pZI9LyYld8PyHwibHNIae+mah4ywXCl40HHXtATm/D7yO?=
 =?iso-8859-2?Q?MtJHIDvOGcR3tHwz2q26+RqAMdaqLddQnpGBhhGezSxejpuDymi8gursIb?=
 =?iso-8859-2?Q?t8TSfADQ8HZxh+6u4J4F2shda/QJv8VjDnOcTQXDHIbHK2UvAIQvCmr9ei?=
 =?iso-8859-2?Q?hZAM1N+663rxWtLGvo8Ar51wX7Cyw8NLAeCUKGoBiwgOtJTHjGxATVY/PJ?=
 =?iso-8859-2?Q?UeZ5kk8K71h0CJH7eBfMBsUS37Wz/ubETka53OmU/ghSOsVNjPrXTlTnJK?=
 =?iso-8859-2?Q?0v1EaQgrIN8dtlSUGF8IDCd9Oz7nmhfZ8XT4FiAUSFbhwS3a9fybnBZvJv?=
 =?iso-8859-2?Q?fIjHOrKnXTgecVHTFcGcwCrt4l0gov+2eFKOi8llyF/tf3yW6XTuoDlqoV?=
 =?iso-8859-2?Q?slBe97rf3c8wsGT3r/E40WmKLEKKXXZb3jNxRTvOQ7NBL060E4wNk2Usgx?=
 =?iso-8859-2?Q?Szcojq1/xaBo3tEbiLupuPOzsr/SwIPBpwN0HRJF4k0URF2FAteKWT66S6?=
 =?iso-8859-2?Q?8/o+NdsH6L4lPavN4zBURHPv5tVd93V9q8/NqWzfHgrQZDjFgOMAMvbyOp?=
 =?iso-8859-2?Q?XxFDDENpXBn1mn//5c/unZbnkmQlvkG7E9XZZmuGv9BJD1k6k9z/Em7A6g?=
 =?iso-8859-2?Q?pMF6PozyFFyM13OHB6ijl2dtpf1umSQM3GAabVB7lk5QKOyeAaULcetbmj?=
 =?iso-8859-2?Q?a1oQEG6JhPfMCvolpR/CWUkYMq/2bv5eLDBb3uHlxsu1ZzoXqmogGUqPuK?=
 =?iso-8859-2?Q?tn7jYOaf+bo3TH1VKhyYlixHqOOYPLUIvWEPBXGzFu4WIYiDAfV+qNvnWn?=
 =?iso-8859-2?Q?IxyRynbAhYgUR1Ol6Ttn3em6uSt4pl9zdjxvLJhfGs8oRjemIO3z8Zsl+y?=
 =?iso-8859-2?Q?VoGdd2uyoISaLh2IPr4Uw2LcWZk7Uu2cgPp/YgQ/1D1u+Rt0Uj6NUVadrN?=
 =?iso-8859-2?Q?WY0aFKhEmvXk7z1G8H3Tn55/JcN2oh2VVTbrTgd/KHMVuoNCTZsquVMbxk?=
 =?iso-8859-2?Q?yY4zjTpxTUDl/P0Lhgyhup+bikOR0VU6+fjrfK+fiuBr6qGABHs3qn3RC8?=
 =?iso-8859-2?Q?vhath/4liwN4I1UZLTkYQLssuWrf93yU8iSSKe9iWFKWmh2T8ZOK5h7Cxd?=
 =?iso-8859-2?Q?nyeedIFhXqyb2C+XII/KRACwL19GN1plWx3qNsVL35c2tuQ0hyu+Ur0x76?=
 =?iso-8859-2?Q?q2sVd3cHvBn629MylIWUdYvRpgPrIcL2sZYHYiPoOZrp2pg4oZo8Mxps88?=
 =?iso-8859-2?Q?MMwgU3DAhsLZGjKo4FOYjsc421ixkUSoR4lBA9o688yQ3pN/v8PGFnd5rD?=
 =?iso-8859-2?Q?6R7qFaU5IpLF45taPRm3UkR+iEWhSEibESgjiOQVc1TVJlgP0/3x35fdL1?=
 =?iso-8859-2?Q?f2j56UN78a4MmMP7HNIZv6xNWeHd7QdmLByjygxHEGQ4+YJF3Ta8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569222ca-2386-4fbb-02b0-08df299f219c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:15.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Knc2GrLPpROox+xP7H/mPILHMKVaMEKflPtgHdeYNOeEhYyUlzWSsLJAumSYkJnPmuMbSlllO9aa8t0y2YPI6+Puw48P5h394dJcDiD82AFPabwpR0EUZsdw0BnzWQC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11826

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_cache_sync() to soc-component.c

It renames function name
-	snd_soc_component_cache_sync()
+	snd_soc_component_regmap_cache_sync()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 17 ++++-------------
 sound/soc/soc-component.c     | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 08cb74001fe32..1a5c9d0d386d2 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -273,19 +273,6 @@ struct snd_soc_component {
 	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
-
-/**
- * snd_soc_component_cache_sync() - Sync the register cache with the hardw=
are
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-static inline int snd_soc_component_cache_sync(
-	struct snd_soc_component *component)
-{
-	return regcache_sync(component->regmap);
-}
-
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 int snd_soc_component_register(struct snd_soc_component *component,
@@ -343,6 +330,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
ponent *component,
 				     enum snd_soc_bias_level level);
=20
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component=
);
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -455,4 +443,7 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substream =
*substream);
 void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
=20
+/* REMOVE ME */
+#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ca776b6a7fd0d..737b17ed60d8e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -391,6 +391,21 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_=
component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
=20
+/**
+ * snd_soc_component_regmap_cache_sync() - Sync the register cache with th=
e hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t)
+{
+	if (!component->regmap)
+		return 0;
+
+	return regcache_sync(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
+
 #ifdef CONFIG_REGMAP
=20
 /**
--=20
2.53.0

