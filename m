Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F563E6394
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659801; cv=fail; b=hwCn8ftA+kpauX6Jmb2mhoMFjfrYLrDCAAtKY0tM74EIJfy8uhXtD+b5L0iQxE3uZ5iLUdl5Md8ofzty3VQ+lD6Yy6UkCVzFY1NRGGmm1BPN8LuYooSR6zl8i8+kzDlmrYzyL4tY1mHi2VnXFdTNuMGOUm7PeOn0Xis5vmCw56Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659801; c=relaxed/simple;
	bh=ZDPqFJIbV+Vq6u+5lPgeIJPv9pJZNjErALTVIlQ5RSY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ok+Gtc6HZdX9gGJzqHk8XPNqeUWUzLbBU2+b+DU4p1WFAlRxmKBMzYP+HQ26epkhWSX55/DtJAvypHE240Yo5NeKZ1bgETl6IePK9Aik4d0PCkfWOVEUdrSqtmoR57ajj85sSWYJE4KUfghSxKZGFxQTivr2Xi63AtmFJ/nZ95k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p4f4vfEB; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p4f4vfEB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAETHSLby/bTiYCryRxhqMKLeXwGE1rYfBXGTg1sAzx/UNtG10J8TOTkwqH3q8YJUR7cII/mHihLI7HMUUU0fOsgyC35zt51jbB1i2WdbmIH1uyHqliUCsTuj+/PVksckvk4C2yY65t5WgjQ5UbUAaOtSvhgr69GVvN/5hslva/m6HkfIOgeqvhbn08CVjbGrMLAi0a/X8YGi83NqFodSjQlacgR//ELI6/un8ttLYyMql3LEoP6nAnU46KnizS9vpKkReSyQFBCBgUvKHxH/WZnWc0lVADrJ4xThb0HAjmdwFE8+CD7ehrbtgoE5wgvGyTJvQ0hX+t1atTgvYSi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLI3+AhMCJMPcefO/MKxeI6kQglYpdv1npyQ7saHkRg=;
 b=JXWrEyCX/r5GLImteyc2Tzs9EuSVrdZ6bZHBczmSPNKsA25hkSxr5mkKq5e1k+91wJrNdxEYoirkkzJSmQ34esFs7DCZv1nUEeMvh/ZUQIp2Qtut9UJRJPaVGbagxc4dM1ypA2c8/hkIUQMIwCCsTmnwfygRLa1pwb8+4NZgbsrM1kqgkVEt0gV5+vVmQJ5xvJIcXahzRONjcJxyT+2xLhn6zOabDOS+Svt30RQmgz80/zmvVsBoajzZ39bWaFIArGKxVPO+ZHLmVUldNs3cGNFLOH0Eb64y5wg5ZEx5fOCLP96NuPBrH9JlHfIoLITbn8Meo4KVEQ6chGSDBD0U9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLI3+AhMCJMPcefO/MKxeI6kQglYpdv1npyQ7saHkRg=;
 b=p4f4vfEBvOh3dYIuakIA2ALBUesIFEMAPBPPJ3Z29ppMWBBHG5ejbmWcQyRxGcyiHHWKNDINn8dOPqK4E19693B1VxDt0pQD0Cx5Ix8A0ujNBu/Rgl/KG279avGhGBfidHGNeHomg6Gzm1UQP+K8U4YKB8vKUepp3UNPH+27AAk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:58 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:58 +0000
Message-ID: <87h5j8eiax.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/14] ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:58 +0000
X-ClientProxiedBy: TY4P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 207b7de8-b452-4754-e4ae-08df1deab3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cHjyWTLZ0k6SYfOJLuNdwWcejbaYBX7e6W66Tcxpqge/vgwIpVTMs0FNeA6ACqqDv8A1q7kIska/Gzif1CmiJAQcdRAoyzvWvU2FHsBZDlhAPQllX9Ewkwq0FS1Etd/1XeCvYkAQj0H0mHRv4TyPw3IdAhDGcQNZU5E/tXb6Dhl4sPRi1nRP6YfxyJWH42LRk1Y9wJZvC2Jq1E3LB7WoLZoqkErTEypdgnW1ycuwfpf3RD9TIFqykolFMQMq0XkbqczIIH8zqovLDr4EeUAVH/hE5b2/z9p9uo7nTQTZ2vwA9+B72bZgkoQaEJxWpIQL/D8Mpx58KKQ/ZNfW3PxwGuIcnv3gNMTZOiMgv0FFi7g8h3QoxeGMZ3hlaSNtlzh7nwh+Cv7CTfaFo4M2rRi5rGs6v2h7c3SxLnueSYaZ+YaML82+Tzt+RxZvAtUA3BgQwRR4jxW0aOn1r7z1q9EJnWXMjvBV9cjjv+RbjDBoXNGjdc5Pl0jDXauBbe0dI+GC1sekSbuThjwlnk/yeXj+sWmVnbFGzQrSaBFlsw42HG21x5ow2j9W1L9DgRgxUltcs08zd+3sWt2HQEHzBsqA8nGMchS6OyIJTW7sFg/YssAYIEYpi4icH662NvsH3koqA+yTAT01f9r+nZx9mk0YxrGExHJGGVITvvkoGSbKln/Pv2m2rd/IDQhw2aP1ElBaKB/cU1A5LD6j+iVQ2thWH9XqcktmwtvV6M+76BZp67I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jy6nXzvKxzVEwt9OevORWlysaktC1ymZ5MmA7fxo5ISYB/d2TSMHCuH85Gyd?=
 =?us-ascii?Q?kxoxVJHj4gS5mjeryI4+Ma2lRwW4J259U8ECgx8god1Txz2CtIGG/0H48gNF?=
 =?us-ascii?Q?EUj7RyXgCxmwAlFEPVMCrpd7xYMFwY4QGv4QXVx/J2dHODJgeVF17x0WxLRR?=
 =?us-ascii?Q?hkwN9wMhgNlCRR7MskSMaKmu14O+kKJSFHQRXSukwfoWvAeidO5zainXEZPL?=
 =?us-ascii?Q?2O6DSr9q30YsXVlGtFDD31dyVYKlIlAyRDd9FMxT7ozbgkf65leqy+EcbTXc?=
 =?us-ascii?Q?LzYvRhpLnnD+DOohCiDcG5HXUaZ53ZjJG6WfjEJKIw5hOzyicuismUtLXLqW?=
 =?us-ascii?Q?xLxFtsF+dSSJxfmey9p75ummD3gigEI2tTlc3pApR80+WwRVgFAkgrmLuTJs?=
 =?us-ascii?Q?Ma8mvD5v7E62EE0Kop4UknwyYvb3RlXb011y8pQhW2wkpdIlFRsVL7WUgXnZ?=
 =?us-ascii?Q?FCz8nV1kNk/TB6mSrtuqEon4DbZgdUxek2hLyHuBqb6WGzj6k0dukp10G1W+?=
 =?us-ascii?Q?LCi6o/dXdFLwkAcmodTqNfzWc26352AuUEArEh6kvJMcwK3iOXGJ+1AZ1WzO?=
 =?us-ascii?Q?dQc3DZfAa+tKuirvrjalAWzuLGar+F6FwJRvr/hocwLBPo+Gw4qjTmZ06N7d?=
 =?us-ascii?Q?W8lcoz3y2XoJcagKDVXz6avW+/DwuOTbvYMrUAcI/bJV6vWH55erV4htfu3G?=
 =?us-ascii?Q?QHKzm9bpUF5gYRKsXXfjavtBtJ/Fpzusz/C81QIgF38ZAsJNerWZF7mMKEGK?=
 =?us-ascii?Q?K5OCeP64imWtssZb4v3V9x8a2gOw4A5x+IFSwfpGUEflWwfd1HEVAtd0IVl2?=
 =?us-ascii?Q?mUAT1Olh7xQnNYbONaKIuUvCEAykOISCe9H5S33EKO7/1snwTra0sPMyWItO?=
 =?us-ascii?Q?cTyzJH+hA+ikFH5luIJ9CES3el6RBghwmC+cIhNBlYhqF3cxxN61KKm2jqbC?=
 =?us-ascii?Q?Pwk5u81iCv4GniNfL23FRlI7+vItuH1Vr6ETtW1QhgZXRCoc2RAtlqI4HrGe?=
 =?us-ascii?Q?R+q4Rgo6mSGGunLrZ7yqUXJbXEIFZrjYBCxCfFtKzy0P29GFq/xLvn+bR09G?=
 =?us-ascii?Q?4JwX6411YE71cG5cFJ1WeNdeIqFXkJsZDCw0EinI2nLUKHS5aDF0a3Mf+5wF?=
 =?us-ascii?Q?0/bIZo/5m2MyrI46VgDpdvzi/WsWNhvK80vVZP9WTy1okCO/DJ8pjnYunuKB?=
 =?us-ascii?Q?iKxdolpYYzLlQKDMOu2FvO7LQOKMUZSUUHlglvpVhaw156okM6O4rb6HvGiv?=
 =?us-ascii?Q?q7+qdJf1nOTj6y4cssIaVOitZXMGbi2UdLLwHE2h0kOaSYwaQjoxNhWFaOXm?=
 =?us-ascii?Q?+pFA1jzYWjJFFzIc8pDG4ex1wlxp/KaUz7ur1EVQhFYoO6fc0MIJTteMcABH?=
 =?us-ascii?Q?yQqj+o5T6n2kivBe8zg+tuiXRneLnKV1zKjXz7xgoMjwvjEmKzV3gPEsXFCt?=
 =?us-ascii?Q?RlGwXNZ4Tp1G1DhzbJDmgo/IaOy0fAyWw88YbfNx4kBeihtdV785/10cajo/?=
 =?us-ascii?Q?GzQOafAC7aLkC+Li3mewfJVuAqsQL/Pf+Q9cHF/4B5/zqxbIgr4J0m4W7CZn?=
 =?us-ascii?Q?KSU+nvMeAmTKIPdglPd+lexJ6xrFDibHHGawxSgh/DQHbKJAWCIT72i8sEn9?=
 =?us-ascii?Q?zXNCZ5fzS6/QglWC3Mtd+uF6E84uSTbnjUIpLN+eDp8pjP7iFZoFBUxFwSxu?=
 =?us-ascii?Q?FQ2z3Yq1rqb+FafrsqX1YCMxBWmLIaV/GXb6uvtFMvA1FzBo4YNaDC/095Pb?=
 =?us-ascii?Q?greVh1L79pihk48eo3O3CIikENvKeZHG5HI0iXs9Vv87Aup5uPZa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207b7de8-b452-4754-e4ae-08df1deab3d3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:58.7845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqPM8jp+YXQG9joGFS4oChNpOeKiIrxJVEbXpknbInqVf7s5Jho9blZO+z5kSKyio7ctl8azCjrI07HXCakfe1V9VVOsScn0gStJOXkBuSe3Uyj/szeefz/8nlbuVTnt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_is_matching_component() to soc-component.c

It renames function name
-	snd_soc_is_matching_component()
+	snd_soc_component_matches_dlc()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c | 27 +++++++++++++++++++++++++++
 sound/soc/soc-core.c      | 36 ++++--------------------------------
 sound/soc/soc-internal.h  |  3 ++-
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 11acf0d42213f..9622ad96d4691 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1306,3 +1306,30 @@ struct device_node *snd_soc_component_to_node(struct snd_soc_component *componen
 
 	return of_node;
 }
+
+bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
+				   const struct snd_soc_dai_link_component *dlc)
+{
+	struct device_node *component_of_node;
+
+	if (!dlc)
+		return false;
+
+	if (dlc->dai_args) {
+		struct snd_soc_dai *dai;
+
+		for_each_component_dais(component, dai)
+			if (snd_soc_dai_matches_dlc(dai, dlc))
+				return true;
+		return false;
+	}
+
+	component_of_node = snd_soc_component_to_node(component);
+
+	if (dlc->of_node && component_of_node != dlc->of_node)
+		return false;
+	if (dlc->name && strcmp(component->name, dlc->name))
+		return false;
+
+	return true;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 59a8f44e249a3..11e25ac7235f2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -785,34 +785,6 @@ struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_copy_dai_args);
 
-static int snd_soc_is_matching_component(
-	const struct snd_soc_dai_link_component *dlc,
-	struct snd_soc_component *component)
-{
-	struct device_node *component_of_node;
-
-	if (!dlc)
-		return 0;
-
-	if (dlc->dai_args) {
-		struct snd_soc_dai *dai;
-
-		for_each_component_dais(component, dai)
-			if (snd_soc_dai_matches_dlc(dai, dlc))
-				return 1;
-		return 0;
-	}
-
-	component_of_node = snd_soc_component_to_node(component);
-
-	if (dlc->of_node && component_of_node != dlc->of_node)
-		return 0;
-	if (dlc->name && strcmp(component->name, dlc->name))
-		return 0;
-
-	return 1;
-}
-
 static struct snd_soc_component *soc_find_component(
 	const struct snd_soc_dai_link_component *dlc)
 {
@@ -829,7 +801,7 @@ static struct snd_soc_component *soc_find_component(
 	 *	CPU component and generic DMAEngine component
 	 */
 	for_each_component(component)
-		if (snd_soc_is_matching_component(dlc, component))
+		if (snd_soc_component_matches_dlc(component, dlc))
 			return component;
 
 	return NULL;
@@ -856,7 +828,7 @@ struct snd_soc_dai *snd_soc_find_dai(
 
 	/* Find CPU DAI from registered DAIs */
 	for_each_component(component)
-		if (snd_soc_is_matching_component(dlc, component))
+		if (snd_soc_component_matches_dlc(component, dlc))
 			for_each_component_dais(component, dai)
 				if (snd_soc_dai_matches_dlc(dai, dlc))
 					return dai;
@@ -1155,7 +1127,7 @@ static int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	/* Find PLATFORM from registered PLATFORMs */
 	for_each_link_platforms(dai_link, i, platform) {
 		for_each_component(component) {
-			if (!snd_soc_is_matching_component(platform, component))
+			if (!snd_soc_component_matches_dlc(component, platform))
 				continue;
 
 			if (snd_soc_component_is_dummy(component) && component->num_dai)
@@ -1334,7 +1306,7 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
 
-		if (snd_soc_is_matching_component(&map->dlc, component) &&
+		if (snd_soc_component_matches_dlc(component, &map->dlc) &&
 		    map->name_prefix) {
 			component->name_prefix = map->name_prefix;
 			return;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index a08e6e8ef17f3..76353d52ce971 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -40,6 +40,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action);
  * In soc-component
  */
 struct device_node *snd_soc_component_to_node(struct snd_soc_component *component);
-
+bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
+				   const struct snd_soc_dai_link_component *dlc);
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

