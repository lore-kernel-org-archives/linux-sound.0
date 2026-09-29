Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A63CF660
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659807; cv=fail; b=AUOhaQt+Gnx4dRiA62ew0EJBTF43SfnaOjCs7itcbgv+zTwQkorlhYIV0upK1xj72Kb6TeY7ZpvRTZcVENUKgZSI8IhBsztXLT8GKcRUGD+eQ3Z+ku3Bz0JAnNTLjKv+U7WZk8TkzQlIVPofSC86qykcpX/iDMTaoAnDdaQNVz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659807; c=relaxed/simple;
	bh=kOO561zp4wXSjRqEG4TAc1GiX3SmYsxniBSNgVc4eQ8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z+RLBrlIkbmU7JWlP+YcHULy7suyRcZu0Hwmobl6M8tVORikpxF0ODUpwgp3w2wgPcbsPBpU7vLVJjzBRhkMpKpTtfavgPv9ApOpQ6zKG+dx9cP3MGJ/I4Qo2FRMxpBKQkW7Iwdv/ZXJAxvmJaJDcjeYmW95xyRoHCbJPs0Mxc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pzjXZe9Q; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pzjXZe9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eibKbzvn8BRdkSQsUDln4lI2tPMFTtDtMqYSTDCmjdj4l65/GZCs7BmTjy7eQidLJKH2koALt0s7vmsAz24tUpq/dV6HkXMF4DuICAnWokMsPmeJO/sVT8tasTcCwpyldMiKKJGdmHf6aZWzqQlFoCuSINyEaI7sngNCuqS4kvDQ+aSW70LkX9f8IyMHcIWnnddhrAvI3mfHSteL0vvizkBHApSaup7+2tXM2X9RIzZs8ibcOMP6X24Nu8wnvK+EYHvMGTCvT+yJzcAlZoNqGir68k1DeAAdr/kNk3KwwhNhMZKXTz6cF4druFIsPzHf04R7UxlkkTmYJJXoXFKdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgdSeJzzbfwuWLuTNWYJKSS8ASQvzRYPEAgINXnnVWc=;
 b=QL1KkIi9XvW3J0LqvOoBKbGcKJyfb7ePu2fSg+bviVU/ixfvKKM/wBd26J8hpUVYgMtjOl7gvpacDAkscvMFyV/cwhLUBssbn85N7RZ0gdY5P6WAgLzJb2tv3nejFIEWdtRnyz+9Xms5s0qgqZDNY2m7+w/BOdnbwa6OeNmCX3Inxt2eOPwOk1Xvc+5UgI1zfSe2ZoRguqtRprwiAH0FheXl736fXO2IpcVe4jRiKnm2wbhHZkTjSFaHB3X44FvreOLV7rWKe4I1blNIx/ivgyl516tzbdHPXrmeo5RThSzDudKEQ4hQu8EPDiC05SHDSIHOBx+CDsS61A7J582ong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgdSeJzzbfwuWLuTNWYJKSS8ASQvzRYPEAgINXnnVWc=;
 b=pzjXZe9QNzELC4UEi3yL7b6lU9CSLCQZqJhX7qhHWz+fE2g2l+6jxwXr3cQ9wn+6Sj5zhJpWufysiMYU31bOLg1BlOYktctlRDhtPwGAGH3ll8bcwGniqXj6enfr/n7o7ScK2CkCVBiti8D48R6Z6Y6QcUan9XfVgOmH2ryctCA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:02 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:02 +0000
Message-ID: <87fqyseiat.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/14] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:02 +0000
X-ClientProxiedBy: TY4P301CA0106.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: cb973cdd-0ea1-4833-e51a-08df1deab637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZkJdbiGPleBdKb2HbFJeM9j1tAJULprUfbcZjIVn8VxbjkCJ3Bqa1LhH1meIl0CLxcDuBNXbUdpKxsKgJIgwKVv8QhBHjr8QlcvOUv+yevFRMsoEtrI+X9sy1sXm/W2RUteAI+m7hS3F6V8rG455tZxbtyrNkMiCiW7lSSQDyVL/acqt2iHD3AZNHs93QxVx12idKRu2Bc0MdQHoUr9axnvQjuxi0ZPdoSGWncJofI4kazPa8QbkztM8JYPuYyW8jwxh/RniggenK9WbGnmZwAlhFxNEL/KRVZQeNFo4VMf9uD/gwDvBIxs1kazl+x6jzv3PTdr0B1/FOuQUI9/nAnxR/57oyQH1VRzLTlrODcN1FNQGSQlbsYJ7+TP9BvX41RziYOsXmsXvx6/1r/e/Jj5Y7JSX/jZTchD7VHE47NIbUExRpeiBAjH/JEWCcPwk58nmsUfOHuWKAabmiP+lIOXdmP48uAuHNRqAJMU41YLs9wQ6ERPz+zv8a2pwkbH+2/sfck65oCCaPHT4k1fUcFtE6hGQwaPkUrsrLdWB8ssUKiW2vatWOmUa/gDpNLX3hFSB4/pCdzWkphH4ahErPhp/rDYxMVqOOaAPDxHmHKnQORBPOnjmEMBQ43psgxnSLLSiMtdEGYmhFihW4wKICT48jeKN5Bj/3NvZNJcu5w3U/guH+D41BxZApJupMFH7m9enkykQGa9iviVaUeALdPj1W2R3xYgKQZdCQWpfoqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bsfx8/+t+fUby4/AOaBtdNXx8wSAAJPLiXoEciRw5sxcOHPAXhsFs5h7hDUz?=
 =?us-ascii?Q?y3q3UVIjwbhDJuFAFZUmGNR4l63b7S8Dhl98WRqoEN8UrJVvv87D9qNUPJ9M?=
 =?us-ascii?Q?6YLygkBl/EWdN6X9hfWolYTnw0izGd0FFQUxpVDZH+cWGlY8KjsbCnCGVeST?=
 =?us-ascii?Q?Ya/4ySMicWIrsUdCjY3OkJKpzRotMac7ZeOWT6TeF+e4jOddZBAmxc23Ztfr?=
 =?us-ascii?Q?JgJ6GW+aWAvJmNqXT8IkSK/J7qJ9lniR4XdMPGCLefz/y7qb1WyKi5yrWNhG?=
 =?us-ascii?Q?XkCS2NwD37udojsetR2tRBPKM3uG0YjJrZl1OP7JRNxZBqsZrR3LOZs1bqj+?=
 =?us-ascii?Q?H/qcpi1ogBw1cw5VGNav2pMakxqSKZgrx/wNM1MNeYOH5fSOdlMoV11LJdY/?=
 =?us-ascii?Q?H4qYkZWEIgHuRSrEORI6lOgFEX7KWGKxwEJpTp0sAItiV0NHHpTqC1zvDLEw?=
 =?us-ascii?Q?tvX5tMMeIx0TWexIIZcGhApMexeEQ1OuAEm7oA4yQOexwdyW5c9OM4AWc4Y5?=
 =?us-ascii?Q?VozUCnUaOvl4L01d0ePXwMMbTTrQrktLFt4obTUYxnHK01unCoQXAUd4xJ97?=
 =?us-ascii?Q?d3oNgXl75oSLluM3GIzs2F7uCBK6J/wGEZH2HU6z9O1LVUY8DOr0DY/0En0s?=
 =?us-ascii?Q?kBbDt/kRtUeSeihim94lMZqM1qPfrMFsvXE/yboiv9mWr5sEUrUFjd6nljIr?=
 =?us-ascii?Q?kLWuAvCUyijypUW0XQgl75sI0bHxGePxyr0Bd2lumN2Hi0bMm7bgeA5u+d4J?=
 =?us-ascii?Q?TJRkoxWMKXLqj2+KCT2w/0nlOFcxjbnn0y0pe+W0ZeH4HRcL7FC9DtfTYC3k?=
 =?us-ascii?Q?1O/5oNEceIDsPQZ+f90R3hloR9IaZp6yTbEP+ZcFfSEqfrNiH9+LCj3at2NE?=
 =?us-ascii?Q?fcGtiEyVl4g/3ZFa2Q2IWdkRqozOP24Z7dF+NjTqinQK/2WKpQ4FJWiQOyre?=
 =?us-ascii?Q?OoVuaE2pKz4YDlxaXblYo9eUXar+4hvuypS/AVQOtOaIZCSGNNzO2SD649Iq?=
 =?us-ascii?Q?Jb5CIMdKHdEyZxuyYeZwlHXjT5q7UoVNHEIxZVz42U6BaKQMka9I/iKeQsc3?=
 =?us-ascii?Q?t43gkzWK87eGIaU9l+JAvtNNvQZAXkIXS5EaTMGx8wLhSa6Gypu7KT0SHd7L?=
 =?us-ascii?Q?b/TZ+JeZOvnnOEpO6/mo0tMByMy4rhm7M6InB4b7cFJrJMwlzzjB2k9/wa4R?=
 =?us-ascii?Q?V2Ktm0bG1IHfxHBEnvJyeXq/bhIHiLo1HwNO+g+8ogbRPI0b8nO2YQVKDHCc?=
 =?us-ascii?Q?bT9dyfK0gVwfxIYeCjRhIFuQWvpFu5kQZXk79byyxeWx/pLEDIffHReHx2/K?=
 =?us-ascii?Q?jrPoGTa07Ct+31/ABooB+oO+GVegZyR8H2NljyzOJQmUbMmAD7I8QVgVxiDF?=
 =?us-ascii?Q?ZUECT3ZUXJme+NB00kIb3Kc3uo6+vDsMacWdRlStc2cnwu5EPExCn6gj1MYT?=
 =?us-ascii?Q?P7DcEeyNJIt+/amtW/kPyagXefdZc39Ql6vh+df6+2whegvlA9fUuAcZXxdd?=
 =?us-ascii?Q?bhHC7TdcU1HfEP6FW5AqoKD+yr+Sd7liMuZ8isrynD3ti49vVvIlXZwEzOMw?=
 =?us-ascii?Q?rveJsTGASehMgxO7MlklBd8qz5QOz/ok8vLQRaLNtAP+VZ9N/O8UtcdE3FPa?=
 =?us-ascii?Q?0cemvmuHvieLC0hlJjFkx/a65lxcLtUVDmJmQ/KaNANJsPopcp0gA+A/ROrw?=
 =?us-ascii?Q?OUZSxJL3/jhQ+q3Hlj5imoaNInp4CZKWdtGa5CZfmP4mW0LTAUkQk0douQK6?=
 =?us-ascii?Q?8VHESPViVhmMwSsk1huiqicev6X57tavDCHqzkwULQlQmVcXaEN/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb973cdd-0ea1-4833-e51a-08df1deab637
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:02.7682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWGEH431AmKHDH5bFBAOjQS+t3FgVao5otVRDAOjllVv6OpJ8TF9rY/KOX7Bd0jilLrAd+ZBnMOwMohrHO4ebbagkj0Et+eLn5qUvjPumkeuwPAeE3MWPhpclrAqK3bd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

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
---
 include/sound/soc-component.h |   2 -
 sound/soc/soc-component.c     | 191 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 179 +------------------------------
 sound/soc/soc-internal.h      |   2 +
 4 files changed, 181 insertions(+), 193 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7708d84af8853..f2dccd3c9ca8e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -404,8 +404,6 @@ int snd_soc_component_close(struct snd_soc_component *component,
 void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
-int snd_soc_component_probe(struct snd_soc_component *component);
-void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9622ad96d4691..78b348269707d 100644
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
@@ -330,22 +331,6 @@ int snd_soc_component_is_suspended(struct snd_soc_component *component)
 	return component->suspended;
 }
 
-int snd_soc_component_probe(struct snd_soc_component *component)
-{
-	int ret = 0;
-
-	if (component->driver->probe)
-		ret = component->driver->probe(component);
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
  * snd_soc_component_add_controls - Add an array of controls to a component.
  *
@@ -1333,3 +1318,177 @@ bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 
 	return true;
 }
+
+#ifdef CONFIG_DEBUG_FS
+static void snd_soc_component_debugfs_init(struct snd_soc_component *component)
+{
+	if (!component->card->debugfs_card_root)
+		return;
+
+	if (component->driver->debugfs_prefix) {
+		char *name;
+
+		name = kasprintf(GFP_KERNEL, "%s:%s",
+				 component->driver->debugfs_prefix, component->name);
+		if (name) {
+			component->debugfs_root = debugfs_create_dir(name,
+							component->card->debugfs_card_root);
+			kfree(name);
+		}
+	} else {
+		component->debugfs_root = debugfs_create_dir(component->name,
+							     component->card->debugfs_card_root);
+	}
+
+	snd_soc_dapm_debugfs_init(snd_soc_component_to_dapm(component),
+				  component->debugfs_root);
+}
+
+static void snd_soc_component_debugfs_cleanup(struct snd_soc_component *component)
+{
+	if (!component->debugfs_root)
+		return;
+	debugfs_remove_recursive(component->debugfs_root);
+	component->debugfs_root = NULL;
+}
+#else
+static inline void snd_soc_component_debugfs_init(struct snd_soc_component *component) { }
+static inline void snd_soc_component_debugfs_cleanup(struct snd_soc_component *component) { }
+#endif /* CONFIG_DEBUG_FS */
+
+static void snd_soc_component_set_name_prefix(struct snd_soc_card *card,
+					      struct snd_soc_component *component)
+{
+	struct device_node *of_node = snd_soc_component_to_node(component);
+	const char *str;
+	int ret, i;
+
+	for (i = 0; i < card->num_configs; i++) {
+		struct snd_soc_codec_conf *map = &card->codec_conf[i];
+
+		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
+		    map->name_prefix) {
+			component->name_prefix = map->name_prefix;
+			return;
+		}
+	}
+
+	/*
+	 * If there is no configuration table or no match in the table,
+	 * check if a prefix is provided in the node
+	 */
+	ret = of_property_read_string(of_node, "sound-name-prefix", &str);
+	if (ret < 0)
+		return;
+
+	component->name_prefix = str;
+}
+
+void snd_soc_component_remove(struct snd_soc_component *component, int probed)
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
+	component->card = NULL;
+	snd_soc_component_module_put_when_remove(component);
+}
+
+int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct snd_soc_dai *dai;
+	int probed = 0;
+	int ret;
+
+	if (snd_soc_component_is_dummy(component))
+		return 0;
+
+	if (component->card) {
+		if (component->card != card) {
+			dev_err(component->dev,
+				"Trying to bind component \"%s\" to card \"%s\" "
+				"but is already bound to card \"%s\"\n",
+				component->name, card->name, component->card->name);
+			return -ENODEV;
+		}
+		return 0;
+	}
+
+	ret = snd_soc_component_module_get_when_probe(component);
+	if (ret < 0)
+		return ret;
+
+	component->card = card;
+	snd_soc_component_set_name_prefix(card, component);
+
+	snd_soc_component_debugfs_init(component);
+
+	snd_soc_dapm_init(dapm, card, component);
+
+	ret = snd_soc_dapm_new_controls(dapm,
+					component->driver->dapm_widgets,
+					component->driver->num_dapm_widgets);
+
+	if (ret != 0) {
+		dev_err(component->dev,
+			"Failed to create new controls %d\n", ret);
+		goto err_probe;
+	}
+
+	for_each_component_dais(component, dai) {
+		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
+		if (ret != 0) {
+			dev_err(component->dev,
+				"Failed to create DAI widgets %d\n", ret);
+			goto err_probe;
+		}
+	}
+
+	if (component->driver->probe) {
+		ret = component->driver->probe(component);
+		if (ret < 0)
+			goto err_probe;
+	}
+
+	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
+	     snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF,
+	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
+	     component->name);
+	probed = 1;
+
+	/*
+	 * machine specific init
+	 * see
+	 *	snd_soc_component_set_aux()
+	 */
+	ret = snd_soc_component_init(component);
+	if (ret < 0)
+		goto err_probe;
+
+	ret = snd_soc_component_add_controls(component,
+					     component->driver->controls,
+					     component->driver->num_controls);
+	if (ret < 0)
+		goto err_probe;
+
+	ret = snd_soc_dapm_add_routes(dapm,
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
index 11e25ac7235f2..38663aaa483d2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -133,38 +133,6 @@ static const struct attribute_group *soc_dev_attr_groups[] = {
 struct dentry *snd_soc_debugfs_root;
 EXPORT_SYMBOL_GPL(snd_soc_debugfs_root);
 
-static void soc_init_component_debugfs(struct snd_soc_component *component)
-{
-	if (!component->card->debugfs_card_root)
-		return;
-
-	if (component->driver->debugfs_prefix) {
-		char *name;
-
-		name = kasprintf(GFP_KERNEL, "%s:%s",
-			component->driver->debugfs_prefix, component->name);
-		if (name) {
-			component->debugfs_root = debugfs_create_dir(name,
-				component->card->debugfs_card_root);
-			kfree(name);
-		}
-	} else {
-		component->debugfs_root = debugfs_create_dir(component->name,
-				component->card->debugfs_card_root);
-	}
-
-	snd_soc_dapm_debugfs_init(snd_soc_component_to_dapm(component),
-		component->debugfs_root);
-}
-
-static void soc_cleanup_component_debugfs(struct snd_soc_component *component)
-{
-	if (!component->debugfs_root)
-		return;
-	debugfs_remove_recursive(component->debugfs_root);
-	component->debugfs_root = NULL;
-}
-
 static int dai_list_show(struct seq_file *m, void *v)
 {
 	struct snd_soc_component *component;
@@ -225,8 +193,6 @@ static void snd_soc_debugfs_exit(void)
 
 #else
 
-static inline void soc_init_component_debugfs(struct snd_soc_component *component) { }
-static inline void soc_cleanup_component_debugfs(struct snd_soc_component *component) { }
 static inline void soc_init_card_debugfs(struct snd_soc_card *card) { }
 static inline void soc_cleanup_card_debugfs(struct snd_soc_card *card) { }
 static inline void snd_soc_debugfs_init(void) { }
@@ -1296,143 +1262,6 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	return ret;
 }
 
-static void soc_set_name_prefix(struct snd_soc_card *card,
-				struct snd_soc_component *component)
-{
-	struct device_node *of_node = snd_soc_component_to_node(component);
-	const char *str;
-	int ret, i;
-
-	for (i = 0; i < card->num_configs; i++) {
-		struct snd_soc_codec_conf *map = &card->codec_conf[i];
-
-		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
-		    map->name_prefix) {
-			component->name_prefix = map->name_prefix;
-			return;
-		}
-	}
-
-	/*
-	 * If there is no configuration table or no match in the table,
-	 * check if a prefix is provided in the node
-	 */
-	ret = of_property_read_string(of_node, "sound-name-prefix", &str);
-	if (ret < 0)
-		return;
-
-	component->name_prefix = str;
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
-	component->card = NULL;
-	snd_soc_component_module_put_when_remove(component);
-}
-
-static int soc_probe_component(struct snd_soc_card *card,
-			       struct snd_soc_component *component)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct snd_soc_dai *dai;
-	int probed = 0;
-	int ret;
-
-	if (snd_soc_component_is_dummy(component))
-		return 0;
-
-	if (component->card) {
-		if (component->card != card) {
-			dev_err(component->dev,
-				"Trying to bind component \"%s\" to card \"%s\" but is already bound to card \"%s\"\n",
-				component->name, card->name, component->card->name);
-			return -ENODEV;
-		}
-		return 0;
-	}
-
-	ret = snd_soc_component_module_get_when_probe(component);
-	if (ret < 0)
-		return ret;
-
-	component->card = card;
-	soc_set_name_prefix(card, component);
-
-	soc_init_component_debugfs(component);
-
-	snd_soc_dapm_init(dapm, card, component);
-
-	ret = snd_soc_dapm_new_controls(dapm,
-					component->driver->dapm_widgets,
-					component->driver->num_dapm_widgets);
-
-	if (ret != 0) {
-		dev_err(component->dev,
-			"Failed to create new controls %d\n", ret);
-		goto err_probe;
-	}
-
-	for_each_component_dais(component, dai) {
-		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
-		if (ret != 0) {
-			dev_err(component->dev,
-				"Failed to create DAI widgets %d\n", ret);
-			goto err_probe;
-		}
-	}
-
-	ret = snd_soc_component_probe(component);
-	if (ret < 0)
-		goto err_probe;
-
-	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
-	     snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF,
-	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
-	     component->name);
-	probed = 1;
-
-	/*
-	 * machine specific init
-	 * see
-	 *	snd_soc_component_set_aux()
-	 */
-	ret = snd_soc_component_init(component);
-	if (ret < 0)
-		goto err_probe;
-
-	ret = snd_soc_add_component_controls(component,
-					     component->driver->controls,
-					     component->driver->num_controls);
-	if (ret < 0)
-		goto err_probe;
-
-	ret = snd_soc_dapm_add_routes(dapm,
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
@@ -1475,7 +1304,7 @@ static void soc_remove_link_components(struct snd_soc_card *card)
 				if (component->driver->remove_order != order)
 					continue;
 
-				soc_remove_component(component, 1);
+				snd_soc_component_remove(component, 1);
 			}
 		}
 	}
@@ -1493,7 +1322,7 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 				if (component->driver->probe_order != order)
 					continue;
 
-				ret = soc_probe_component(card, component);
+				ret = snd_soc_component_probe(card, component);
 				if (ret < 0)
 					return ret;
 			}
@@ -1545,7 +1374,7 @@ static int soc_probe_aux_devices(struct snd_soc_card *card)
 			if (component->driver->probe_order != order)
 				continue;
 
-			ret = soc_probe_component(card,	component);
+			ret = snd_soc_component_probe(card, component);
 			if (ret < 0)
 				return ret;
 		}
@@ -1562,7 +1391,7 @@ static void soc_remove_aux_devices(struct snd_soc_card *card)
 	for_each_comp_order(order) {
 		for_each_card_auxs_safe(card, comp, _comp) {
 			if (comp->driver->remove_order == order)
-				soc_remove_component(comp, 1);
+				snd_soc_component_remove(comp, 1);
 		}
 	}
 }
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 76353d52ce971..5fdd6dd1687f8 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -42,5 +42,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action);
 struct device_node *snd_soc_component_to_node(struct snd_soc_component *component);
 bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 				   const struct snd_soc_dai_link_component *dlc);
+void snd_soc_component_remove(struct snd_soc_component *component, int probed);
+int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component);
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

