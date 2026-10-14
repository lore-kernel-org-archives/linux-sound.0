Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82E3ACEF7
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946736; cv=fail; b=iH+OTCacKKO0PQ16Jj/SFGALb52hMhJqLRdQUDrEHAXK2YXw0Sv0OBEQjSfrrv4IA4ku7XTW6KicaHE+Guoto0NMAw+KC7e577QZfNujmO73nEjBfx9ttGWlhxjAfwChAGkvRFUggpKLLwGAqG9bLg2N256fRqcBcsNc1ZjoJfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946736; c=relaxed/simple;
	bh=OGScqhq6E4zX8SGiwu2JnJ/ayaCzRfrJsB29OufenNw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=imJ/+/UOiFDbzJIXYT06gymvkKjlgMQral4SVZogC5Dgih3DSO00aeW6muAbd2d+o2qab8GzUHtysOyhUMcOn0MMPnJVCS8B4n0/3KHqQqYfmnWjae8OLbXjEqUT7Yjj0xEmmsQMbuL35ZZ4aoHvvykyv9C+nScuIAy1KEp44FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SZls/lcZ; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SZls/lcZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4nNRM10SIJX0Yf9vINGmt8q+hYXYbjsBsdKMYSNnISTSXb3hVIBLXsoITCR+1SSFXWMWBkHNbYlqf44d1RTf9I0iWlPw7I9l/AKXRXXoUUGNe4EAZOg03e+dyAbhuL7AROzTYLjQHoei6i7QVcfMKXx42wEsUveYsmEAsIWQSctmcvlg3PFmkXdftD4fXos8tvToXzwwtJtR4siLhVvuKwfcidSQ11O2wGWoadXPAFcnSW7zy6OFJvCk5qRQg6JYDieecZ17BoN4upknjwBL2683kux3u7Yi3YZ82VNl7QAXqHvuleLJ8qd6jFqIvAcRHyHkmHMaeSXTy1TMkqQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wG8Ac+1UbkH1lMcSmymDuZn9t1ifKGClqmutW4wExNk=;
 b=ivqa/xNjwEi5htqN66TrBb0ePPf4xgEcpYxCIjk3gM76riFofJuZ5uQaZTmdl9TjXEnS71W8xySyGFJzmxIpE7fh9YpCuhKA9t9vzL+50eL4TT1gAR2SPAdce55Rh4/DCGpFDY3PFIKY0gb2PF8t50YRFxJncjdVi01Dyb5hXkY++urh7SvT8PjgkR49bF3p1qgLGiBkEn4d2alM0APpTNkSzrIf0G29T6mtuAa1zKWbYAYxncZKqQny00ngPKoZ0tbLK2H2jdBDz+CsTYewGrdzKvdD7DwitGC9Y3gvd75Kc5iZVem5G4PrclBeX+6x+Cn7+sXmqN2DnTDnFpy0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG8Ac+1UbkH1lMcSmymDuZn9t1ifKGClqmutW4wExNk=;
 b=SZls/lcZVng4dWq/O/WldJwISaDvxQs1pPz1EzilSzRvnXhTpf70R+WgCFAG2AGE8vFAkdivHMjtK3KQ4jw326JPNW2VpC2PnNqNRaWlEw15auHNAgN8/ocO0/v999kviA90laqJQpBOG7yY15JAZkVQTX2wML1C+H76ehgAI2M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:51 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:51 +0000
Message-ID: <87ld81yolw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/13] ASoC: soc-component: move snd_soc_add_component_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:58:51 +0000
X-ClientProxiedBy: TYCPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::17) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f186a29-3958-4734-8b30-08df299f13b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3lMCG8EbE4pMPgXZvgqyUKjWfWjTsepvU5g4JZSMQZGccV+Jda8V9g9FwihtOY7IS4eEu4JX3UZaDFv0rpDRXPjyt2uo7boNKsK7vgVjYs272r0MrBf0Uxgs9X1ymNZ24GbcJ2DBXt3GlifNGwWbrofYrJdqurQ/TolYyD/i47CPIX2fDNAWPa4ZK6SZHfn9ZdxUoudA/Gaic8cSfNyW2OhjsCxNYHAQ45y9xOP6PciN1a5ImuoFWsvpCc3XH3XI35Ps9MnKEmwcSuk7M8M9MiuiYpSsFJCze+/z2m4NW14d3TOtYCKL6hzY2m3DzaeGA4/XIVC8wlVNrta/PaqfffcDh7StxFtQQI5vo5HPNA8KTdVIDkCcqGx5hX4WSxStTJ7pHGWoOns8y4/6ZG5rQSYh2KP10G4Y27IipuXAeUVGkVW3TcAjYHnJXLgbBRBzSHBSxpRmQefoOeDiNwFeh2QxscHEklmyeZ3V9nn2Q8V8/PUvXwYFg8R2SPqr2XTM/sVBPLrJUazNEyUziMo3zsBHdsoFgNFX9Iq1MClRWh7hoflplN4EUbP88c0we0pJH2Ce1EZai/D93EQBo0sGw2eE8BFNThaRvyty9R4yASP8hkwGyHpCDUWQRVR0q7sur8LZ3K3kMOOzYyqtwcTRDCwZR69VVsIgv3Usm7jTIH/ouoD1mpn9g2bF6v/5TnEzjgrmRTTUK1zTCVNPlj0mFdEuKXqLgVlO+5Cc1zitFSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?SFmxIRuyNtNMN5V1utwKPUmfAvmb37WHbuNA8fsnU1dZUalqsAB3XICkVZ?=
 =?iso-8859-2?Q?6bFRz6e0i9Z2Dzf/tAqLQnMYsN3+0YfWozoVZrkqfIkLKGE3HzEY2W60tE?=
 =?iso-8859-2?Q?g7wEMHh882ID6KMVuFuv3odPr56E9WdfZSf6PTqi+S1XwipVNekKYEtbGl?=
 =?iso-8859-2?Q?DfIU0Gm/MJGP0kGNoRHrleenWxwVCirf2JTTIknkZE4rjLj5Ht8XDGKGML?=
 =?iso-8859-2?Q?spHy4pEeNWGFwX+xv+WCYMiFFx5H9cCnEvhYEwS8ZcJdNwLFU0PvvO8xXA?=
 =?iso-8859-2?Q?N3uZ8bIRE244m3NAnsXV7ullUYGJ6KO66FiExy1QanILy845zIBAjrqrPb?=
 =?iso-8859-2?Q?g3bPP73hal9AgGQClFctlYwm7GgGSCWhoBc406txbpYNIZ/86iBdGcNIA+?=
 =?iso-8859-2?Q?/yb2h7MgNLeueX9/AB6x82hsYRBtdJPcjaixopjFJuoVAE6tO5npUd6sQw?=
 =?iso-8859-2?Q?ORVHEmNzMuhjy/BoU1HmNUjhZ3JEgQy9EKb2RswS9aRtPggwv3TTTJZFap?=
 =?iso-8859-2?Q?JBj3mMHp3ZoFt70acym7om7TlJQfLVmCk8Gwlvh4hxai/zYaUm8qTV/n4K?=
 =?iso-8859-2?Q?YTkQOOw6QL5B5mhdfQXQKfTA7pLVtLROXHWddxnwfZdFVeVgEEpn4nqJyO?=
 =?iso-8859-2?Q?OHZ3xVmqxUdVES0zSsxUGZV+pKhhAvjmdDl9QKvPGpETTItRqdKPG/WzGI?=
 =?iso-8859-2?Q?LktLOoE1h52+SP0++cNMHh36ZGf/Q98CkxBCMGw9QiYcbG/q/SJqrsfxwW?=
 =?iso-8859-2?Q?+1omP5UPZBTrXgbpSnQiha1Ujktm5FlFzRFX8TiS8NZ4pr9O6qXAZlqUM/?=
 =?iso-8859-2?Q?71ls2IYb1lX/a7Nuq5Vp+CQL8WptpP5re+wKwzOPfcx7/NOl2URsFoG4bb?=
 =?iso-8859-2?Q?XBxJqjj8QCQ8Kbfox9fjtuvp8OW/3F4PADeHguboOx8LYVk3rCVVDwEEpK?=
 =?iso-8859-2?Q?lv+viR/LttciGer5JL40C7sxsgPn1FFHYfpr5h9V4vh05ZjYVpalHP7EGU?=
 =?iso-8859-2?Q?/B5tK27w0BgWrPEC8v/ctYWmlkxbq795mE9l/DbJElNFj8Oi0ffpbiZGrS?=
 =?iso-8859-2?Q?mZx0JyUStqzBG86keEHfelLWcbdG44HcChq8nd/2j6IoLd6/pKQ9IfkUYX?=
 =?iso-8859-2?Q?xlUd7MEbdnHbVEVS/XmcWTBOVgOU0rWUYIux/+GhMIMKAgEsMK+mz7f3ir?=
 =?iso-8859-2?Q?rCRQaLCPcw1aQzdrBU+NrjiQmNYZASxw4WIZdnfHMRhWUon7sMp1lunxnZ?=
 =?iso-8859-2?Q?0JfCHYeAsdiOTQarhiFuVuI97gCihgu7e58YzQKWYTdCvOZ+XjipHcWhap?=
 =?iso-8859-2?Q?vI1LaV0nCB0/MV+erN3isu8dekPyhm2DaBNjnk9o4xthcnx7vWm/1JZZ9N?=
 =?iso-8859-2?Q?TGFSo7yCLl3WFwA4f4WYTsACmKpHB8liiFTlw2f2BUmaLtBnLLW6TvEdpg?=
 =?iso-8859-2?Q?Acek506e7xB2y4PmF3uYzrnkZ7NKe/UyX8gYn9aro56ucO4kiPdJEQhw3n?=
 =?iso-8859-2?Q?Fl3DL7itxtjIat3gngG3uiCj8ghzAeEs7DD86RQB6yIJu+aumj2Nw9SB6J?=
 =?iso-8859-2?Q?3ZwOxgDysoi5x9RXX8GPbB6KHa5WW231jvSzlpM4lcqrnGFQY1vdyzhSwZ?=
 =?iso-8859-2?Q?wqXeszQJm2UgfvZMlTLiXe+DfHCXuhsl1cg0N1oGdYPu7VQ0JQBtnnJk1h?=
 =?iso-8859-2?Q?ZvCCcHyhdFfx2BY9W2vdEKQdop5SFxu+sKjWX84g8O7TjjtlxlJUajtRxc?=
 =?iso-8859-2?Q?Vwtnfu8D0DjKP41frGCZbe8TUaRaIrR5w7xc+f+al0iGnlKRixHYaSULMu?=
 =?iso-8859-2?Q?yUOaMXN3eO0x2iCJYJWufwzY8p9g9rIXyp9WN1xOv1P+mSui0EvP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f186a29-3958-4734-8b30-08df299f13b0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:51.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgymdw0G5VsmJZNkzGzZoKYcEFs6DV7QHiON/GDvizA8eNdMbpPr/f4RQs14AfvEbJbiZvBzjAA3GcO/b6su4CrjPKLQl1upsOE4RQCPI+AX/zenyxGQpg5MD7yEPMoY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695

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
index 149c4d4f94034..b19abc5c26338 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -358,6 +358,9 @@ void snd_soc_component_init_regmap(struct snd_soc_compo=
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
index 08fdee15dba7a..89612ac0c1d95 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -545,8 +545,6 @@ static inline int snd_soc_set_ac97_ops(struct snd_ac97_=
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
@@ -1542,5 +1540,6 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(=
struct snd_soc_pcm_runtime
 #define snd_soc_add_dai_controls			snd_soc_dai_add_controls
 #define snd_soc_register_dai				snd_soc_dai_register
 #define snd_soc_unregister_dai				snd_soc_dai_unregister
+#define snd_soc_add_component_controls			snd_soc_component_add_controls
=20
 #endif
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 34efb270ce298..5a9b526676f49 100644
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
@@ -320,6 +321,26 @@ int snd_soc_component_probe(struct snd_soc_component *=
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
index 69181cc0258b0..06f001baf2472 100644
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

