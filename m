Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CE339381
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909516; cv=fail; b=mnp0HMNT8vrKwFBV8XDdI3pVNZRkHIp1XwczdcTyzR+58UeSzRLQFTClTM0LPxFRMGhUB7hsAfJ4jjE8EDbpQEuB2VY0vPvXa7JvbZEOnTawnFuVyVHn2ed47EnAsoknWTFo4GP4Zvgnn2g1Za+Oj6c9hDjEyBGrHJ1TDX36kmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909516; c=relaxed/simple;
	bh=4Cx4gDqpVKx64bqe4Ak0dPMEZ0MewkVCL5eq690JAmw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=taKFMk00ViOZUy6tGsFZISR05qX1R2kAm9295r9TLchv9gOOcHMSVbQiQCN4A0GzSsvB2B0pGeqywKc1ISypT5rcvCkx75quAvwUQjRkJ/WQNFdErYH6MX6BpCJ2dEyOt3PTFEEieYI+SXKskaIsB02Jmoj4/oee6GcfBjrKUxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ebsDrarB; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ebsDrarB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvcVjGLRJgEcmq0wN/Rg93Ox21zFEaCRznhetZpUZ2AiT1/xYkR1Vt1ntwXHCycFi0+j4FN460/ZW2NUZKYYkY4r1Kp/+7Zcy7oHjM2Phq5rY/JBSn/IDgKmKFF2RMm1wTm3TEGsdmM2RgS9Vih14rwGeo+sXaf4AYSFedyBoX0TP+JB7f/kTg3JDWHOerKyqma+jfFqqvOevPDRZuqsnfdUyCbeBtTC4IBf5oAGYEZSAFl/KQ1R6n3I8t3Vr8zLXwXIg4ZKZ/RSwYyZIiZUXyGmwCEFcE44Ao6I+6GsAPIeRMZwmKe1sfutxoywKZENXmxa38h0ochD6ylbN+LqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFi89hbrs7S4rUeM6cAFSfmiGr8rIHzZI4Iq7XMT6zc=;
 b=cLPZDHi6qTt6pz90RfJnvneOGgfZjkORCOJ0Z0R1qgPxguJ89Z2A6QQgBEfm5ITicb12i+MsxGlxv0NkIo+RNSt7B440EMZuEkdIR2TkShLKA3+JliOwjZjqYTWrlkNud5ezpvRXlLdx+QNk8dK3oiUf+j2f5S4ssmhORxCBpSz50LoHP/QzyANi7BzD9Hrv4NLliEWR1tUT+4YyU2389FShEQ55lTqngJ4YSlux9Sdvno9Wm73yEDZuP4uckmIR+fi7eqxl10/6T07Fxzn4pGjbsQx5P0hmzi4VJ6mPeEqZCKaIWr9Rt5e5RPwzEdmK7uCzQWezzjx5QuYDiGEyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFi89hbrs7S4rUeM6cAFSfmiGr8rIHzZI4Iq7XMT6zc=;
 b=ebsDrarBU3FgPq42c62zprV/j16ZvYiLZv2CJCgpVdz6xBA+XtteDvMF7fddPqITHdBiMZoc225Aba5xI6XEa/pz7E6Cum1cK9myjvzoNl4JXZyQPNDGz0CWL4HKMLlSGofcXAlbZReyzuL9Ym/bsWqkntQ0Ap16646ljdGtiJI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:53 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:53 +0000
Message-ID: <87fqyo6chj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/13] ASoC: soc-component: move soc_component_to_node() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:52 +0000
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb1c32f-5c1e-41da-4225-08df20301d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c5MWXCCcC3PL9ZyIoDsIjObmRvlDzn8JN+hVrQ8NtAbf2lyfxnGWF2mLwf/6G14GaK27BI5YJHvmu4iKvP2lwyISG/Ta28Dmgkvz1WvzLkfOXkvMxrisBVcmt4mU8WPkWkBQqxbeErBk8YQjFJQp4xJ779hjPUn/8bcyvC3yjAyPmGlR6zBxnGOXC+uQDi0OttA3i4J60rpciG3bvtq5Q4yzlXdTqY8GXPxBpECBRsE7omGVWv9nbskHua81d7+gzH+1tuRLkinL1pDebm7q2WRu/5SVag228+Yu07hPqfbCR3BQwcjmmXpJ+83c7f96fWp5MnGbv0E953DyX4FiVuM5NUsfMhRLp6Gr+41PpKtBqprJ5gcIj6ab3fpr7ru+38+aOXrB3HlO0FMW9wlW8Jk25/38LWghdAxIxb+Vyfdz1Oh377MBeW7UW0vH4FS6oPEj9bRDs2UWmdO4B1jDqO0rYXRVktkZIl01Z0lS047j1XwakpF/B0GrMcL+JXFynRSocyCJSLI2eBFGUmvxWA4VFkVOtOihKDBC4y5D2aXocTxstnLrtcsgOG1zghdCFGVcNPf7HSgneOShIfiL5lk0WhWAD9QLT1w5YAVpsxKLPWhs9tTvCXQ7deXX5BfRJHQBpGdsltND0xN+qiY3YYbv3sRFx/GrSjjPW1nsgxWMwBBXHqv5drTDpMJih9S4zVAYzXO7jlWxNU8Qn63jPQkuURU6GQAFxV5FUxIvziw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?RviMCDbVIMLIyycIbVQhFM9Kpikc6a99IHDwGEEsCBqK0ZE+KVLCSiv694?=
 =?iso-8859-2?Q?602Ony/RZmLsuzX+WWwkwDfTXfAjwBCpj+5+P8sdDjKzTRfGSy2ZevLbXb?=
 =?iso-8859-2?Q?Q6EQbRutiamypUDQ9+PfiBluOhRGTqWSExInzpV4HgbkzjVtkAmuucP+CK?=
 =?iso-8859-2?Q?Vf54ByAo/HJHOyF+SeWe1kqaBrvG842pccxQm9CdPkpElBK9vbxN6QmiYz?=
 =?iso-8859-2?Q?AO5noHMdd/H+e6PR32dgDYLz2MN8rAQ6L56jth4rSjA09ih8R779CU1oLT?=
 =?iso-8859-2?Q?rF7DryOEOz/ac9+1PBcUjzIt7wygTAm048CDplmT3wswnua6+2J2sbsf9f?=
 =?iso-8859-2?Q?MsM7idohSZw+5OWbUh2lB7aOEPTR2pn2ZlTuNJEEw3RO5258KS3T7L3I8J?=
 =?iso-8859-2?Q?JD4UhHDo3OQmz1z38Y3VPOAkrNmT1hqqqXdsMjmh6JVl63qMhyQg/KMcvO?=
 =?iso-8859-2?Q?b6sKQ7FKGEM6sEWKs8wit8r0rzStqZidYi0UeIOsEgF+R4OawEYnv+AdVc?=
 =?iso-8859-2?Q?qFjgfh79/7iXU8AfWSSsslrnoNI+ebRlz7ILC4zp5zGw3aGSQTJJ4APd7I?=
 =?iso-8859-2?Q?VKus/0i6bktdm76WyqbAXsrFMZg3Lhy+bAyzAgpAIS/ao71jcw8tVuh+8H?=
 =?iso-8859-2?Q?rLZ5y5O6dhRLFpvia4ypR46FyqNewr/E2ImgmbGxvqMwbIA2vRCZDbsHMf?=
 =?iso-8859-2?Q?ISi+hg7d9BLoAFFv2FUrnGZkh0FzBP+x0bpo/cVcD7hz7Ev5xOSKqqx01X?=
 =?iso-8859-2?Q?plNLIZYuVBx9dc1r/Y7C/zduV5zTwaCzKMhz5Xqy/haJB/6bdoL8pJklJK?=
 =?iso-8859-2?Q?0ksJmVG0jp+ZVmxvLHye7gjSR7oX41rPX6rzvOzq8KVPFY0Q4MDJBb4RCR?=
 =?iso-8859-2?Q?jWPrg7ZXTESmgK2ngDx0u8VPqd5kvBmu0S5BXdfoOKUDjMrB7pxNxsp6zt?=
 =?iso-8859-2?Q?wn0fbJXKRYl0gglGRbVr5NtIyCxylqYim0fquL7M7mtiucCqkJun5CzXFf?=
 =?iso-8859-2?Q?AcJ8SmEysZ3FS/gyHu7pEz8LquEoc4AGdsnZiNNgyEqSyXPFYMo53C2Qps?=
 =?iso-8859-2?Q?Yr3MOl9Z7uh4TlrVTB4F221QwYdu2Z7bdkcqJZInHq+hfNXIL6uLnY+ZQd?=
 =?iso-8859-2?Q?WZcHxW+tjax1TmmDBK6vVoZa4MG1LCz2zcJgrCepijPab7/4O2sQXb7TiT?=
 =?iso-8859-2?Q?YyMuHJBXymYPsBXvjUGZ8Q10CfkVFS/vWfClYJz8MVhjIm/eeJ4l42gjOn?=
 =?iso-8859-2?Q?GTfXK4VCUJBDCbF+MqJNSyUPNxPV+JbPREiWEkhC6q9Vp2n4Cqs0GVstUb?=
 =?iso-8859-2?Q?XqYaeNrXfJ+6wF7itT8g+QvwmGcR1/tzGeP0eHxPS63GFAEJIwaxnQGB0w?=
 =?iso-8859-2?Q?X2yAjHFY3BiLn/DbqjRFI9sKyuU0vFnSN7hph8OG51WG1/K/H/W0RRycfQ?=
 =?iso-8859-2?Q?7trOLkdPNqRfIqCNDmw/sW33tboG+CZiudkjtpE/N44JgyQdZXrt8b+B9d?=
 =?iso-8859-2?Q?5m90fZwKXzW+xVAyoN2D2Vi5ZzfrbxHo2syHyQqC21kHd8TXG6FcbLvTmy?=
 =?iso-8859-2?Q?aDGhf67WLv2zDdik8xymhh3e6FRyqhKELefA9tg9TZp0k1FlWfZUciJ+yk?=
 =?iso-8859-2?Q?gH1M7ymd37XTNDhw67dyo4+jTaGl84ARD/2UQhF5xz9z9WuZ4OnIpf+iGu?=
 =?iso-8859-2?Q?60aQOw4SWQvFdsL+FPgVfkK9/CA7DzJTW9B4h73sa815n6FBaQ20TrxSY+?=
 =?iso-8859-2?Q?nRQSpBuPF58a7FmOqLu5M6YBUbwRAlJoKf9epGKh2jRNapBuQ8db6gpgq3?=
 =?iso-8859-2?Q?MI/rcOd124uGlPAIsSV3YODIVJu0xuYYLebcHEAiWRpq1OA9YmC2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb1c32f-5c1e-41da-4225-08df20301d27
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:53.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YlV8y+ExGaZnS5cv/BKZIpuZyrHlgwri+Xf2zE5rnEYBdqkZvAgpe+VBe1tOQo+h5fAegYH9KSl/6cIHJ0eqq5mNFjla958aC8Jp9kivHx29BhpKd5tDU4xa9wjbbrh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move soc_component_to_node() to soc-component.c

It renames function name
-	soc_component_to_node()
+	snd_soc_component_to_node()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 11 +++++++++++
 sound/soc/soc-core.c      | 18 +++---------------
 sound/soc/soc-internal.h  |  6 ++++++
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 6077d07f873f5..11acf0d42213f 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1295,3 +1295,14 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substre=
am *substream)
=20
 	return 0;
 }
+
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent)
+{
+	struct device_node *of_node;
+
+	of_node =3D component->dev->of_node;
+	if (!of_node && component->dev->parent)
+		of_node =3D component->dev->parent->of_node;
+
+	return of_node;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b54706dbb527a..59a8f44e249a3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -771,18 +771,6 @@ static void soc_resume_init(struct snd_soc_card *card)
 static inline void soc_resume_init(struct snd_soc_card *card) { }
 #endif
=20
-static struct device_node
-*soc_component_to_node(struct snd_soc_component *component)
-{
-	struct device_node *of_node;
-
-	of_node =3D component->dev->of_node;
-	if (!of_node && component->dev->parent)
-		of_node =3D component->dev->parent->of_node;
-
-	return of_node;
-}
-
 struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 					      const struct of_phandle_args *args)
 {
@@ -815,7 +803,7 @@ static int snd_soc_is_matching_component(
 		return 0;
 	}
=20
-	component_of_node =3D soc_component_to_node(component);
+	component_of_node =3D snd_soc_component_to_node(component);
=20
 	if (dlc->of_node && component_of_node !=3D dlc->of_node)
 		return 0;
@@ -1339,7 +1327,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *=
card,
 static void soc_set_name_prefix(struct snd_soc_card *card,
 				struct snd_soc_component *component)
 {
-	struct device_node *of_node =3D soc_component_to_node(component);
+	struct device_node *of_node =3D snd_soc_component_to_node(component);
 	const char *str;
 	int ret, i;
=20
@@ -3275,7 +3263,7 @@ int snd_soc_get_dlc(const struct of_phandle_args *arg=
s, struct snd_soc_dai_link_
 	guard(mutex)(&client_mutex);
=20
 	for_each_component(pos) {
-		struct device_node *component_of_node =3D soc_component_to_node(pos);
+		struct device_node *component_of_node =3D snd_soc_component_to_node(pos)=
;
=20
 		if (component_of_node !=3D args->np || !pos->num_dai)
 			continue;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 31559918355f8..a08e6e8ef17f3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -36,4 +36,10 @@ struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai=
);
 unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai);
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int ac=
tion);
=20
+/*
+ * In soc-component
+ */
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent);
+
+
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

