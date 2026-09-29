Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D383EEAD7
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659827; cv=fail; b=aNbRukMyKdFK9t5It+u8nqlqv1lM/TeYoWb565gzGsOsvsszSTW2xyQZglB4mBjM46i7VREqYyD8UGtMYtA3lmPpzXuYPQ7tzZo0npLo5fOBs6AjfdyhvjbA8Ea54nUI6xbTzmdoa/LzyeM5J/6lyFXvE3iXE/9g2fc/z7Zn+Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659827; c=relaxed/simple;
	bh=ti/Zep9EzA08LdInou5MPj0pk39tC97/9JbQ9Hqk6ow=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZizydVndtfHN/CC90lkJvcD43WPwY4vyKnvdL4vH3IFr08M6tuR0n2KXJbzDKw3zefAOAi4U/m54NdxoxAHJcmVgG+S4QTeLFnkYx3FsN9UWSJEx6oPNJPqR6i3UcAWXniXLNA1UYRLS68pTOw42MThGeN2u1THcSmYPGtf4z1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RArF7zuW; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RArF7zuW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTtawrkYUaGWp18rXSQ9rM93WpBlNRchOk9I6O0s6s6ee0G+2ekRS34x0TNTDIgnqqQ+RibjWznzKowfwBhfv6Ll2b07bRFBMLVCG/UBEoP8RXyQ6wK3OW50P4muudXQBXoRHfMM6XiID1usu7X97J9iwkZVj9wtVoB6Iq67y8cYtl9L49JYO7w88XZ9DcT66XYyV90Nny+U9qbx+E6ftYgh7duzEQOfAjEMMMOrsAvb/78o3v0wnwHsRy/bb/f01Jhn5peR92Hu+DIZWm2cLCKfWzoqQBIaq/2EhcI1PG0JVgPrFLWH53FGhHHWgfo3QR8GKHZio9S4hDbsc55wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUPsHvRtKk3j2zBzTAuwg0y2bLInMoKsayzgAITrGMc=;
 b=eGxLadWYw2fX7vRGhz7p1lmJfYqO7gQ1zxRmS81jci5DHfTIxF0n5V9tR7dSzZg6iXO8NWgTaxQkAbhm5VpuhglsS5TfteZOJ5EifkO52NzLfnXrRekirFCCGMZAsZDAsj3wUHQ8AGV1FwOP1I9f/jb7USqpB/s5flnL4Z+th2PjnlqjAq2abSfCHG9mrOS+y5NXMfPS4TN2abOaktWpZk420yjOSjUYnuQkCtkdBi8ahQO1e5mJDtXNNBaoGZ9YG05q4TwgkBiinHeYw0otSVcZ8V66/BrViY0mM+oeEH6TbyjCELVCN2GMrNr6YSNQ7ptRK4gLguuqwF3dOi9JNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUPsHvRtKk3j2zBzTAuwg0y2bLInMoKsayzgAITrGMc=;
 b=RArF7zuWPAA9Lvfu+5zSox11GhexFY37VwvzFeb+C/5JPAjmJjz9JJQjam1TX1ILHqBcMWI1Ui32V9GzCGenbN+mn8iYDBh5E9DfMq0P4lQ9PWbDZ5O3/Z1iipQNjp/ehEG1YI3CeS24BZTjx+TDlofN4Ivg8m7zyY7oV7ECRaQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:24 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:24 +0000
Message-ID: <877bk4eia8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/14] ASoC: soc-component: move __snd_soc_of_put_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:24 +0000
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: 56081e83-1de1-4c09-f460-08df1deac306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+dyswznN2U8FhMNvVz7Z3vDg2PiU//DhvzdXyMz5PygkyrtR91wDd4MmVQuqSohAJczqAJ0PYyhCAiVindIdquwDi0vUfOw9lQjxSUgiHx081/tYj/AJA2iFBMtIjvYDqCcOhbylW5safBJt6GrCUknmgnANCz14Z0BcFuyZKpKXLk3jlECKZbB/iFUYqQWv39y8oitWUo3BgOBoKZPA3XiVaSeIPStUBmJgtZ8b18pbVNDYBwNYP0/B6GX4vasugwkqv78Sedc34vUqFGEM/IpA13TdhupprE+4TtDWw8Uyq1pBfZ2hAapd5iC3YJjX18w2eBSjkeEy25FNPg2tGnuJcDEGSNA3Iq963H2vJfiLIEQfQmv3XXiqfrDcs1WdIypTnKE1kq7A4cLVsqFX3mqeYh2BPjEqKnyZugspZME7AL9511fQ0pEWq7G23nl8moxc/KbkbVHHTcWTIIDabZucB2xKgPeNG/fosHhCq8wRgO6eGOMbxAV+TpUskuvsCmuUwvHVfPSVVQgHFec6eNwvn77KuQqHkWylhWbpHxm1F942fVvwBitEYe5X173GWVvHh1Kx1U9WFxVoPhi1ot2wS27t4RUooAbi4UyZ9lgs7MukbkXFccre5RDOl+rT2GMmix3TslegGdPMhYUiifX7YJRoaS3IH7NwL7r+R3e/7tqINaywwVphSkgujeGTNMbga5uOhGdhPKH0DsjI8Q5/bFlrZHk/d8BBelwse60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2IcCQlgUgCR4/gCr05gHhK8BW6lVWEcyQFJK9z1CxSx1jaGndJ2+8wwQ3KL/?=
 =?us-ascii?Q?S69LhNUso3/6Kz1s3iTRkpMcTfh0qCNlIhOmA7S37J23cMWTNPg3QgbvPPgb?=
 =?us-ascii?Q?RDkRzyYeJZtIsaI3xnIaqJRUMzmdRQ22wGby2qhkm5/v9PJ8ejaBET++Ik89?=
 =?us-ascii?Q?Mk9NFckjB1WUvtNE9TpFiWyucU3XuOxo0KK47vt99XuvAC0XyGDoHq+b/mtC?=
 =?us-ascii?Q?4rLKiy90g1tpb8DSz6ocubnoy+hhWTTc1QjUs4Er5QrhdWELzvVzs0nNwCoQ?=
 =?us-ascii?Q?MMLx/TDRugIgVNAztmR5uykcxluQoy3SWNUZomMyyI6V0bLmGtpDXkUlPjGA?=
 =?us-ascii?Q?1oSObNAI9VlN1fcoanlgJh02A3mxdUwL+41mvnaPv5ftvQ7LEjUNrUq3YhMw?=
 =?us-ascii?Q?4hk1MTLj6J0g2jbYvByGkYqBfjm202+e0t6o40XOZJMiFuu1w8AkmXIVi5zr?=
 =?us-ascii?Q?E+BbgGAPuO1/1A2JR9uarTtx55xqj7pM2lDwcUMdsrOzSGzw3u6QM+vr9X1E?=
 =?us-ascii?Q?WR/eUsXalIQ9Lvn43P9j0iyqxZ4gTYnPJJSXdegUiJJmsipdGcLmRLm2Zz/r?=
 =?us-ascii?Q?itJvzECoamAwQsEcFT7TKVNYDM4Vj9kKwckxnHgIdHM71DWyThO/1yueG1Af?=
 =?us-ascii?Q?y9XMeBk9gKl0Jvj+HGG+VVFldZNeX5Ux9EF3+HpiNqMrYDMME8hZLI8vW5PD?=
 =?us-ascii?Q?fmjK8HquXVXx2bH36GSxLDK27zZp9d8YULCFZWLJY/DgWV7jn7fOKivfXk9M?=
 =?us-ascii?Q?UsC0D0KvOUEmqvbngqtxJxWpAuFKHHDC06GN7DGP052/BtMew8l8w44Umzny?=
 =?us-ascii?Q?h3e+o4rx75sSb0F08df1gbdl/WnGgtH7B9rnu2hz2nn5MRRY7TmAYgIXVCgP?=
 =?us-ascii?Q?6EdSME37zALil8CWMq4x80Yx2aFY93ugKzfbPXB4MklVHNZK5D1Ymep6ja+U?=
 =?us-ascii?Q?m/rYuCEv8s5J0krkKOu0DS9McdFJuSIlED5TPPnufWqtCZv22P13GFHq7/5/?=
 =?us-ascii?Q?KaT8oVM/RymBxVml89dMW5B2xfAQBnOl77NoHU8IiLLYDnhyxCphnSw7Wu0I?=
 =?us-ascii?Q?HRFNoyyFSzCruvXquTfnmqt4adpjabvkFQh79dwrwsNgdYKxbI5Ta8dAweIQ?=
 =?us-ascii?Q?kjh+ESbPdMUftyjr9EW4djGzKlQa6CrB76PkaargMvQ7i7lwn1/aWbFBKIOI?=
 =?us-ascii?Q?J39e/HpjYURLWowkg2e063FMUDBLN80gl/NrtxPGnnAM/0RCHopEaWBETADw?=
 =?us-ascii?Q?KCX8/c/zhIYafQo5I6em2IXh/syqdUsESjKlOPHdkFrcUNzPFu2Iyegvd5ST?=
 =?us-ascii?Q?MPSt+EijtMCKXGM4WFHdy1xalIIRgSJGIx8XsRDxIisodaAG46OEbahDlWPX?=
 =?us-ascii?Q?dkI2mjH8GVbcpUQI9SnzhHQEZqCDeWE5Hzdz1cZ79k2lqza13Bq/hpAlgU7i?=
 =?us-ascii?Q?oLcsM2oVOeKc73nxyMrgvUphxNIB4T/CRtEHylHtnChkhVUGcQlKpklajBiJ?=
 =?us-ascii?Q?QFHPm0nkLJlwbKrHkz1vdThBjtGZzX9xh1+waeK60uikMtE+UooUeuBdF2FA?=
 =?us-ascii?Q?s6xfFqhLh/cs9EyRWUc820wUcuYm+1sPVoP72Ls/OHNGgFTKfBM59QbOqU7k?=
 =?us-ascii?Q?86spPGepACVRfjNfk0O75BBoyg0X8mRLhxqxpG1suf6MAQ+3pwgHa6JOQhhH?=
 =?us-ascii?Q?4XnWRgDNAXyGXhTakQFPBb5NO6+Hn8xBtbtGycGS4g5/bUT5LpU3vo5JnwpU?=
 =?us-ascii?Q?PyI0AyLg6rhRVG9JIIs933mmsodvmuCXWU2WhTxnV90VP1OJNtpd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56081e83-1de1-4c09-f460-08df1deac306
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:24.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkVd4qhm9qmspMn6jdl+2XgD0LTChFBBKRZfwefuL5rglBNtvbxzrKirTzS4B0wesnvDHM2IyfmmK52w3llR1zZgPa5h2sLGLFrgFtQUovnO0mJEruZhAIz4Ig48V3hj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move __snd_soc_of_put_component() to soc-component.c

It renames function name
-	__snd_soc_of_put_component()
+	snd_soc_component_of_put()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-component.c |  8 ++++++++
 sound/soc/soc-core.c      | 12 ++----------
 sound/soc/soc-internal.h  |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9a288f7107c3e..cdbe0eb0e17ee 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1573,3 +1573,11 @@ struct snd_soc_component *snd_soc_component_lookup_by_name(const char *component
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
+
+void snd_soc_component_of_put(struct snd_soc_dai_link_component *component)
+{
+	if (component->of_node) {
+		of_node_put(component->of_node);
+		component->of_node = NULL;
+	}
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8bbd100fb0fa7..ae79442c9c5a1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3129,14 +3129,6 @@ struct snd_soc_dai *snd_soc_get_dai_via_args(const struct of_phandle_args *dai_a
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_via_args);
 
-static void __snd_soc_of_put_component(struct snd_soc_dai_link_component *component)
-{
-	if (component->of_node) {
-		of_node_put(component->of_node);
-		component->of_node = NULL;
-	}
-}
-
 static int __snd_soc_of_get_dai_link_component_alloc(
 	struct device *dev, struct device_node *of_node,
 	struct snd_soc_dai_link_component **ret_component,
@@ -3176,7 +3168,7 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
 	int index;
 
 	for_each_link_codecs(dai_link, index, component)
-		__snd_soc_of_put_component(component);
+		snd_soc_component_of_put(component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
 
@@ -3233,7 +3225,7 @@ void snd_soc_of_put_dai_link_cpus(struct snd_soc_dai_link *dai_link)
 	int index;
 
 	for_each_link_cpus(dai_link, index, component)
-		__snd_soc_of_put_component(component);
+		snd_soc_component_of_put(component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_cpus);
 
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 3ae24274504cc..a790be1c4f782 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -45,6 +45,7 @@ bool snd_soc_component_matches_dlc(struct snd_soc_component *component,
 void snd_soc_component_remove(struct snd_soc_component *component, int probed);
 int snd_soc_component_probe(struct snd_soc_card *card, struct snd_soc_component *component);
 struct list_head *snd_soc_component_get_list_head(void);
+void snd_soc_component_of_put(struct snd_soc_dai_link_component *component);
 
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
-- 
2.53.0

