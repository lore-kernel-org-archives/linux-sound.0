Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4D547069
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946749; cv=fail; b=OpuRRkGflHzjPWWqtW0dv09+U3e9vzQsjNk+ikD+JNdxgSmEpZRVcBi8KXdEewGQ+iB+BcHVqBufVI/S5bscO6RcAUVaiO1bHly60TZKgpNJMcaYKSlE7NwUOLI2NXgAFOROyMvN54H43nPFdmfe6kp73Ps2gKVYYy28JbHSYwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946749; c=relaxed/simple;
	bh=f3uFbiOIL5n08qK/vdkv7eFN3q7a9uJuLCTn8bgsNBY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FgciKSa9Q17AUgFpRpQyWneOe4Pag0I+A0WKbVZkVMC4QHio4owpuYmgC8zw1fPnSV+9hLRLQMxamxQJSIv+22nJFyIz1gWkEFeDkbBL/UL4oygNYaV+LcapnFvGUcl29/kE/Cw5hGeyJm6zOq85bgWcstpz6xIXLSziyYjT0Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fpAifH4L; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fpAifH4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD2qS8OqRI7o4p+6ybHa2n3i7gZ4OqVvkotadsYEYdr9N6UmSQU7Ustk5i0UJQCdhVwGsXxaBn0v7tnKHmYs3SjSdaynTb56x5zHyewpXGI8Xuj6dxv/1pF/bYyxNL5jNNA+/kjzsjYm9fF1f/g0t7DMprOmXCwUUYtmryCV7qMaZzOJdPCHz9Okn+/QQt4nYgGZxtVO591OPrae+IrGYeg42Db10BbhY5bClTe7XvFTkHZOLCXbccKm0aY4qkqJoiqFLQxZIMKz33OBKoKQ9Bu8Y3CJwZzcSEWrIcjKgvCR4eGt1av1Sas1eHoykp2e2CxzqBhzXFO/b7zmeU2ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63frYfFDn5xCN9jqTwANwCYAktq9WfjSvhB0Son62IY=;
 b=sPNmyBCaWucOCRwJhgl9Qc/3ec51jKwIrse9h6YVR4Jacd7Sw2p3xivn298RMbVyQWqISMLoeOWt5b/5XE9c4oLaJp5s0/UIJA4d/7HlXTv3xWyQk5xdN6Z/OjPvlDZrfiQGbjGokKfjBD/RHkwfi71OJuJFTUlQwwXmnlcjifrwC68Fubg+pN7+hnh4VDG/Ej5y8/ua9MSSczg6/Fm7xKVAPqU3srzG3wDppDT5AHppS50kCX4tNH38f195IMz23kmChercdN9BIX4yiNeBT+/z8A8kOFRnEd76pRY7n/m5AGcZ6qsW2ewkADmzi12c4QqfDd6C62hE8UiS26foHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63frYfFDn5xCN9jqTwANwCYAktq9WfjSvhB0Son62IY=;
 b=fpAifH4LBVtpIR5PfGltHiNfb7xwIA4k2XBvdUiwAU7aPLGcn5Yjd/TAqgh0ER1Tbhfn/DQSwH4rQYM2bFHffK2PipOE2itaOGnC08xEeW5SaQ5c+P3SFKaWHkyiBa67pfqmUvU2ynkadXX2ixzXiMfUHtYUMcWXuyHwY3J208A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OS9PR01MB15638.jpnprd01.prod.outlook.com
 (2603:1096:604:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:05 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:05 +0000
Message-ID: <87fqy9yoli.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/13] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:05 +0000
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OS9PR01MB15638:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a272bfd-f0d5-49dc-8604-08df299f1be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|6133799003|10067099003|22082099003|18002099003|11063799006|261009221227099003|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	/3ErJ9qC7AFay6aMjPgnlmMQjEdwdIFRUm3tUwXfGYYIq2ctCiXRthQUd/gW9lhKTolcwL7k6XQOxq5a094P+54F75DIYTb7U8l/QmyBuhEF9TTGcsoosBe9jUq7DdFpsv9viXU/rjW5zGAf2NJ9tqzor+8OBdeqAGbGak89YD+a+IOug764mZLcnHXH8OT8YIR9c+7D3brFaCPJdd7jeITX/0t3nU9r74Dk6b5qQfL7O7nu3dJUBwW+p8/Wa+SYSa/GX5GI9wfQmbXmBwL4iNVuHqRRXAd/z4wVGCEyfekcnodVShtEYiHLPjupC9i8jjeEP5JtshY/GdiamsFbQDKdiU8s0fYHWakoWO34T1+HpNMOBYZeftZ54a+GbknojEmFA7Hu1IOs8JYIe/sSmImOGoC2rfJR6yl7HeXCTV4FqxdqUM8vPQp0fdb69/QXlRIUNMHkXUNH72MzvbX4ZAI0BFlnL60S+yGKs3Zky49XBg55pwtz5fVTH7NhcZ1KdwM97AG9IcV9biT+8kXDWYVkAkdcZG0WLBoNhBbENziPU8nlsnQaP6uhWOFZIzwj+LWHFSAacPYmhC7YRF0dH2WiltZiGjT4YldsDwFWirry8qd5uvUUsA94xkjmpmNF51ymK6/oWljDfJ1d3tVQDk5AjRI4AthOl0T7bMjzGFrkPbwDO5TjUL/Ez2o18SLQVKnbg1ZISz6hlfUhq7IVftCMaKpcrY7eVNTm1JXqgtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009221227099003)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?rojWsFk3lcsJXV73xLaRkurQ2mWuf4N9BRfp95GKG253ZFn3Rd9ladj3CC?=
 =?iso-8859-2?Q?nMDTxF2aCjZ6Gvb9syHuymwn0qEJE6Be9SR9QLBdFGPdMGhTtBcTqIevXv?=
 =?iso-8859-2?Q?pjuq/EPjhqGB/jgk5IC5f4M9IEKoWyTOw73+RIsJtQtzbkFHbmVXdph3aB?=
 =?iso-8859-2?Q?Hw96ZNBO7LbMxV+mejmTMTmftleIAszrQ1j6QlXVPysqMO/7w9BXe2JH1y?=
 =?iso-8859-2?Q?rIuhM572Hff3z3QrFydHKfvFe4+f/0/qdAgwcyelOd0H3/SZe93dFh4Ew7?=
 =?iso-8859-2?Q?O2UrDott9LHalgYjWN302a0FxfL3ChRtO9Ct5Ii+aZwSjouhIB2VETxxH7?=
 =?iso-8859-2?Q?CE0NkQc8GWyPnoYGJEpt6JOmHp9axpdhkoXvwMR3B2kra8HGexwzeuEAng?=
 =?iso-8859-2?Q?YaiYxTSETl3AiluqWSAY2KXGSmEg5FCFlP84c1YpgOv+TL22+TOX7Bg6o8?=
 =?iso-8859-2?Q?t+bqaXGcWM6v0cA51tRFUcWvO3sytoYB8US9U1e96j6b6LbyjEKXVaoiL0?=
 =?iso-8859-2?Q?wQcfRNH1NGCaYpX64/rXW9I67/3K+N3iaFPewXZtPz7aw7q0AmuoVbIQkp?=
 =?iso-8859-2?Q?oA/Q8HCpRVzAi03yZl/PfaJMS3kzkgHk9i17tOAZ0m/YEN2Kw+AQKftbcA?=
 =?iso-8859-2?Q?TJu2bFc7Zxv9elprENDXQAHsOkoJf3kPWfqaZZyszD4IN3U/uAr/EtwjYa?=
 =?iso-8859-2?Q?UpOZpi1KbKmixwvp0w8tb1OH/HawYcCQIkl4tRJcFM7NOqSf4EoiZ1Indo?=
 =?iso-8859-2?Q?spEUD2autqswsmv/bB4JKxGXmGCkrxLt5YOS8Ekh8gEOHrL8oUjqRvILLE?=
 =?iso-8859-2?Q?D/EZZDYGF7nTpRYE4CzRbe/PqS8J7D7xhiLfeIvChr2+lMo3ZvqUQ2V6ui?=
 =?iso-8859-2?Q?hPlX9zL8slMl6SHnphjjq9UxQjef2AinmKT99Olfjo+26ATandFAPH4EfN?=
 =?iso-8859-2?Q?e/ggwv6xeJprLs9gLU4cAWBXmboRkOnqNVceZLIrvTT8VmgUPrkhY9llzx?=
 =?iso-8859-2?Q?CNlDf3v6P1m9Fckp+0qbuMEpDR4y/ky74fbzqPNSzOn9qtXsABkaw8F/PD?=
 =?iso-8859-2?Q?iwIom6ObvUnfIhxnrk3NN/B7uY/zAloEtgEpfPNVwoLAeSy9hJqd6MlGqB?=
 =?iso-8859-2?Q?vtGKFNXAHMKMBU9mGBJAYErGncBiE6mOJHNB2auEAC8nJtEIATs7PB+WQp?=
 =?iso-8859-2?Q?b4gZIgJbj8hf6WmmDidfHjKP6US6skBqsCiah7ZqmphK/9glRkoWPMauE6?=
 =?iso-8859-2?Q?PGThX3d+ESNkMEnBn5B0PAckJuImLIoU9xDnEMsFZ2iSt/zCWGhxlsnr6x?=
 =?iso-8859-2?Q?GaePFLWcZT3aNK2k19T2+FjPZPhhafhAhjAXTMS0aCkr4Jc/GaE2NwlPBr?=
 =?iso-8859-2?Q?XOqnGDtTrXH0PUbwK2iNt/Z3PtrxEO+QXf07gGd9BeUzdFyAFQyInz6m02?=
 =?iso-8859-2?Q?Spqlqa6h/Veh9K+Bd2e9Mlp06NwoP+kKjYJdzqylyeZx4S375yBRBxtd32?=
 =?iso-8859-2?Q?9bN1fleJWA1Oedx6XwH+rCGN0bKrUL4QaRzyL66FiGC9w34uJw6dKK/BeX?=
 =?iso-8859-2?Q?Ff48Bv/juYSlzXw1xr7/lXKKR24hWRC7CbWy0e7cVI9ZYji1Q7ehFkuFPd?=
 =?iso-8859-2?Q?vKaqMnp5yOrAKJU5lerTQ5fm/s4C1jYqXQxugyTORA66IFKXcNPWm3ko8c?=
 =?iso-8859-2?Q?eT7ex14naIUZVkHnW9bzjaPZORkKeF9ojcXpDslVQUQU8FnQHwtmlv7RtQ?=
 =?iso-8859-2?Q?YCoWGGKRvZ3jop5zsFA1/VgPKSFahha3+M8Xe7bZj8tzHbxD4v0Vx/buR7?=
 =?iso-8859-2?Q?jjIA91U8hfc4o+ZADY6BN3+Ben495WDITBNdbW+4stj9k0EJjY1H?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a272bfd-f0d5-49dc-8604-08df299f1be5
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:05.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7uenJV+AOFFGPP/nghSqrxgTaXwV3XvBd9Mxzvm48EY7iuVAdqK0hacZ7t2G5XYpd+7lIOUcrbhjC4uWzzea111/83RDiuD4O0+MO9R+CviYVnveFzsuxMYRGbV4oij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15638

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move soc_{probe/remove}_component() to soc-component.c

It renames function name
-	soc_{probe/remove}_component()
+	snd_soc_component_{probe/remove}()

Then soc-component.c had original snd_soc_component_{probe/remove}() which
is wrapper function. These wil be deployed internally.

Releted fucntions also be moved. It renames function name.
	soc_set_name_prefix()		-> snd_soc_component_set_name_prefix()
	soc_init_component_debugfs()	-> snd_soc_component_debugfs_init()
	soc_cleanup_component_debugfs()	-> snd_soc_component_debugfs_cleanup()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |   2 -
 sound/soc/soc-component.c     | 190 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 179 +-------------------------------
 sound/soc/soc-internal.h      |   2 +
 4 files changed, 180 insertions(+), 193 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0d316c48cb420..8c8141fe9e77b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -407,8 +407,6 @@ int snd_soc_component_close(struct snd_soc_component *c=
omponent,
 void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
-int snd_soc_component_probe(struct snd_soc_component *component);
-void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *componen=
t,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 0635988b17c45..25f50041fad31 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -8,6 +8,7 @@
 // Mark Brown <broonie@opensource.wolfsonmicro.com>
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
@@ -311,22 +312,6 @@ int snd_soc_component_is_suspended(struct snd_soc_comp=
onent *component)
 	return component->suspended;
 }
=20
-int snd_soc_component_probe(struct snd_soc_component *component)
-{
-	int ret =3D 0;
-
-	if (component->driver->probe)
-		ret =3D component->driver->probe(component);
-
-	return soc_component_ret(component, ret);
-}
-
-void snd_soc_component_remove(struct snd_soc_component *component)
-{
-	if (component->driver->remove)
-		component->driver->remove(component);
-}
-
 /**
  * snd_soc_component_add_controls - Add an array of controls to a componen=
t.
  *
@@ -1314,3 +1299,176 @@ bool snd_soc_component_matches_dlc(struct snd_soc_c=
omponent *component,
=20
 	return true;
 }
+
+#ifdef CONFIG_DEBUG_FS
+static void snd_soc_component_debugfs_init(struct snd_soc_component *compo=
nent)
+{
+	if (!component->card->debugfs_card_root)
+		return;
+
+	if (component->driver->debugfs_prefix) {
+		char *name;
+
+		name =3D kasprintf(GFP_KERNEL, "%s:%s",
+				 component->driver->debugfs_prefix, component->name);
+		if (name) {
+			component->debugfs_root =3D debugfs_create_dir(name,
+							component->card->debugfs_card_root);
+			kfree(name);
+		}
+	} else {
+		component->debugfs_root =3D debugfs_create_dir(component->name,
+							     component->card->debugfs_card_root);
+	}
+
+	snd_soc_dapm_debugfs_init(snd_soc_component_to_dapm(component),
+				  component->debugfs_root);
+}
+
+static void snd_soc_component_debugfs_cleanup(struct snd_soc_component *co=
mponent)
+{
+	if (!component->debugfs_root)
+		return;
+	debugfs_remove_recursive(component->debugfs_root);
+	component->debugfs_root =3D NULL;
+}
+#else
+static inline void snd_soc_component_debugfs_init(struct snd_soc_component=
 *component) { }
+static inline void snd_soc_component_debugfs_cleanup(struct snd_soc_compon=
ent *component) { }
+#endif /* CONFIG_DEBUG_FS */
+
+static void snd_soc_component_set_name_prefix(struct snd_soc_component *co=
mponent)
+{
+	struct snd_soc_card *card =3D component->card;
+	struct device_node *of_node =3D snd_soc_component_to_node(component);
+	const char *str;
+	int ret, i;
+
+	for (i =3D 0; i < card->num_configs; i++) {
+		struct snd_soc_codec_conf *map =3D &card->codec_conf[i];
+
+		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
+		    map->name_prefix) {
+			component->name_prefix =3D map->name_prefix;
+			return;
+		}
+	}
+
+	/*
+	 * If there is no configuration table or no match in the table,
+	 * check if a prefix is provided in the node
+	 */
+	ret =3D of_property_read_string(of_node, "sound-name-prefix", &str);
+	if (ret < 0)
+		return;
+
+	component->name_prefix =3D str;
+}
+
+void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed)
+{
+	if (!component->card)
+		return;
+
+	if (probed && component->driver->remove)
+		component->driver->remove(component);
+
+	list_del_init(&component->card_list);
+	snd_soc_dapm_free(snd_soc_component_to_dapm(component));
+	snd_soc_component_debugfs_cleanup(component);
+	component->card =3D NULL;
+	snd_soc_component_module_put_when_remove(component);
+}
+
+int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card)
+{
+	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(component=
);
+	struct snd_soc_dai *dai;
+	int probed =3D 0;
+	int ret;
+
+	if (snd_soc_component_is_dummy(component))
+		return 0;
+
+	if (component->card) {
+		if (component->card !=3D card) {
+			dev_err(component->dev,
+				"Trying to bind component \"%s\" to card \"%s\" but is already bound t=
o card \"%s\"\n",
+				component->name, card->name, component->card->name);
+			return -ENODEV;
+		}
+		return 0;
+	}
+
+	ret =3D snd_soc_component_module_get_when_probe(component);
+	if (ret < 0)
+		return ret;
+
+	component->card =3D card;
+	snd_soc_component_set_name_prefix(component);
+
+	snd_soc_component_debugfs_init(component);
+
+	snd_soc_dapm_init(dapm, card, component);
+
+	ret =3D snd_soc_dapm_new_controls(dapm,
+					component->driver->dapm_widgets,
+					component->driver->num_dapm_widgets);
+
+	if (ret !=3D 0) {
+		dev_err(component->dev,
+			"Failed to create new controls %d\n", ret);
+		goto err_probe;
+	}
+
+	for_each_component_dais(component, dai) {
+		ret =3D snd_soc_dapm_new_dai_widgets(dapm, dai);
+		if (ret !=3D 0) {
+			dev_err(component->dev,
+				"Failed to create DAI widgets %d\n", ret);
+			goto err_probe;
+		}
+	}
+
+	if (component->driver->probe) {
+		ret =3D component->driver->probe(component);
+		if (ret < 0)
+			goto err_probe;
+	}
+
+	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
+	     snd_soc_dapm_get_bias_level(dapm) !=3D SND_SOC_BIAS_OFF,
+	     "codec %s can not start from non-off bias with idle_bias_off=3D=3D1\=
n",
+	     component->name);
+	probed =3D 1;
+
+	/*
+	 * machine specific init
+	 * see
+	 *	snd_soc_component_set_aux()
+	 */
+	ret =3D snd_soc_component_init(component);
+	if (ret < 0)
+		goto err_probe;
+
+	ret =3D snd_soc_component_add_controls(component,
+					     component->driver->controls,
+					     component->driver->num_controls);
+	if (ret < 0)
+		goto err_probe;
+
+	ret =3D snd_soc_dapm_add_routes(dapm,
+				      component->driver->dapm_routes,
+				      component->driver->num_dapm_routes);
+	if (ret < 0)
+		goto err_probe;
+
+	/* see for_each_card_components */
+	list_add(&component->card_list, &card->component_dev_list);
+
+err_probe:
+	if (ret < 0)
+		snd_soc_component_remove(component, probed);
+
+	return ret;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e96b86561165e..cd318d232ee33 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -133,38 +133,6 @@ static const struct attribute_group *soc_dev_attr_grou=
ps[] =3D {
 struct dentry *snd_soc_debugfs_root;
 EXPORT_SYMBOL_GPL(snd_soc_debugfs_root);
=20
-static void soc_init_component_debugfs(struct snd_soc_component *component=
)
-{
-	if (!component->card->debugfs_card_root)
-		return;
-
-	if (component->driver->debugfs_prefix) {
-		char *name;
-
-		name =3D kasprintf(GFP_KERNEL, "%s:%s",
-			component->driver->debugfs_prefix, component->name);
-		if (name) {
-			component->debugfs_root =3D debugfs_create_dir(name,
-				component->card->debugfs_card_root);
-			kfree(name);
-		}
-	} else {
-		component->debugfs_root =3D debugfs_create_dir(component->name,
-				component->card->debugfs_card_root);
-	}
-
-	snd_soc_dapm_debugfs_init(snd_soc_component_to_dapm(component),
-		component->debugfs_root);
-}
-
-static void soc_cleanup_component_debugfs(struct snd_soc_component *compon=
ent)
-{
-	if (!component->debugfs_root)
-		return;
-	debugfs_remove_recursive(component->debugfs_root);
-	component->debugfs_root =3D NULL;
-}
-
 static int dai_list_show(struct seq_file *m, void *v)
 {
 	struct snd_soc_component *component;
@@ -225,8 +193,6 @@ static void snd_soc_debugfs_exit(void)
=20
 #else
=20
-static inline void soc_init_component_debugfs(struct snd_soc_component *co=
mponent) { }
-static inline void soc_cleanup_component_debugfs(struct snd_soc_component =
*component) { }
 static inline void soc_init_card_debugfs(struct snd_soc_card *card) { }
 static inline void soc_cleanup_card_debugfs(struct snd_soc_card *card) { }
 static inline void snd_soc_debugfs_init(void) { }
@@ -1296,143 +1262,6 @@ static int soc_init_pcm_runtime(struct snd_soc_card=
 *card,
 	return ret;
 }
=20
-static void soc_set_name_prefix(struct snd_soc_card *card,
-				struct snd_soc_component *component)
-{
-	struct device_node *of_node =3D snd_soc_component_to_node(component);
-	const char *str;
-	int ret, i;
-
-	for (i =3D 0; i < card->num_configs; i++) {
-		struct snd_soc_codec_conf *map =3D &card->codec_conf[i];
-
-		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
-		    map->name_prefix) {
-			component->name_prefix =3D map->name_prefix;
-			return;
-		}
-	}
-
-	/*
-	 * If there is no configuration table or no match in the table,
-	 * check if a prefix is provided in the node
-	 */
-	ret =3D of_property_read_string(of_node, "sound-name-prefix", &str);
-	if (ret < 0)
-		return;
-
-	component->name_prefix =3D str;
-}
-
-static void soc_remove_component(struct snd_soc_component *component,
-				 int probed)
-{
-
-	if (!component->card)
-		return;
-
-	if (probed)
-		snd_soc_component_remove(component);
-
-	list_del_init(&component->card_list);
-	snd_soc_dapm_free(snd_soc_component_to_dapm(component));
-	soc_cleanup_component_debugfs(component);
-	component->card =3D NULL;
-	snd_soc_component_module_put_when_remove(component);
-}
-
-static int soc_probe_component(struct snd_soc_card *card,
-			       struct snd_soc_component *component)
-{
-	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(component=
);
-	struct snd_soc_dai *dai;
-	int probed =3D 0;
-	int ret;
-
-	if (snd_soc_component_is_dummy(component))
-		return 0;
-
-	if (component->card) {
-		if (component->card !=3D card) {
-			dev_err(component->dev,
-				"Trying to bind component \"%s\" to card \"%s\" but is already bound t=
o card \"%s\"\n",
-				component->name, card->name, component->card->name);
-			return -ENODEV;
-		}
-		return 0;
-	}
-
-	ret =3D snd_soc_component_module_get_when_probe(component);
-	if (ret < 0)
-		return ret;
-
-	component->card =3D card;
-	soc_set_name_prefix(card, component);
-
-	soc_init_component_debugfs(component);
-
-	snd_soc_dapm_init(dapm, card, component);
-
-	ret =3D snd_soc_dapm_new_controls(dapm,
-					component->driver->dapm_widgets,
-					component->driver->num_dapm_widgets);
-
-	if (ret !=3D 0) {
-		dev_err(component->dev,
-			"Failed to create new controls %d\n", ret);
-		goto err_probe;
-	}
-
-	for_each_component_dais(component, dai) {
-		ret =3D snd_soc_dapm_new_dai_widgets(dapm, dai);
-		if (ret !=3D 0) {
-			dev_err(component->dev,
-				"Failed to create DAI widgets %d\n", ret);
-			goto err_probe;
-		}
-	}
-
-	ret =3D snd_soc_component_probe(component);
-	if (ret < 0)
-		goto err_probe;
-
-	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
-	     snd_soc_dapm_get_bias_level(dapm) !=3D SND_SOC_BIAS_OFF,
-	     "codec %s can not start from non-off bias with idle_bias_off=3D=3D1\=
n",
-	     component->name);
-	probed =3D 1;
-
-	/*
-	 * machine specific init
-	 * see
-	 *	snd_soc_component_set_aux()
-	 */
-	ret =3D snd_soc_component_init(component);
-	if (ret < 0)
-		goto err_probe;
-
-	ret =3D snd_soc_add_component_controls(component,
-					     component->driver->controls,
-					     component->driver->num_controls);
-	if (ret < 0)
-		goto err_probe;
-
-	ret =3D snd_soc_dapm_add_routes(dapm,
-				      component->driver->dapm_routes,
-				      component->driver->num_dapm_routes);
-	if (ret < 0)
-		goto err_probe;
-
-	/* see for_each_card_components */
-	list_add(&component->card_list, &card->component_dev_list);
-
-err_probe:
-	if (ret < 0)
-		soc_remove_component(component, probed);
-
-	return ret;
-}
-
 static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -1475,7 +1304,7 @@ static void soc_remove_link_components(struct snd_soc=
_card *card)
 				if (component->driver->remove_order !=3D order)
 					continue;
=20
-				soc_remove_component(component, 1);
+				snd_soc_component_remove(component, 1);
 			}
 		}
 	}
@@ -1493,7 +1322,7 @@ static int soc_probe_link_components(struct snd_soc_c=
ard *card)
 				if (component->driver->probe_order !=3D order)
 					continue;
=20
-				ret =3D soc_probe_component(card, component);
+				ret =3D snd_soc_component_probe(component, card);
 				if (ret < 0)
 					return ret;
 			}
@@ -1545,7 +1374,7 @@ static int soc_probe_aux_devices(struct snd_soc_card =
*card)
 			if (component->driver->probe_order !=3D order)
 				continue;
=20
-			ret =3D soc_probe_component(card,	component);
+			ret =3D snd_soc_component_probe(component, card);
 			if (ret < 0)
 				return ret;
 		}
@@ -1562,7 +1391,7 @@ static void soc_remove_aux_devices(struct snd_soc_car=
d *card)
 	for_each_comp_order(order) {
 		for_each_card_auxs_safe(card, comp, _comp) {
 			if (comp->driver->remove_order =3D=3D order)
-				soc_remove_component(comp, 1);
+				snd_soc_component_remove(comp, 1);
 		}
 	}
 }
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 76353d52ce971..17ed22c2cd505 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -42,5 +42,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai, i=
nt stream, int action);
 struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent);
 bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 				   const struct snd_soc_dai_link_component *dlc);
+void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed);
+int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
=20
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

