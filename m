Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183133938E
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909525; cv=fail; b=qi03jpDAo/8BJlBOCJjx2moenJGnnjSPqNnXZp7NxROJ2AfQloAr4vajl1LVkH15bIGL6Wh2faCmEP+f7VFz0f8TcSf1S45nwPZyGXpdNrSHEJK61Z6IZeE5sd+GXip8A4q7GX5z1Jp6ekPKwht86w/BrJ5NWIf7uGNGrv+wi6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909525; c=relaxed/simple;
	bh=tRjJhayLCyrLyW3qyChhImAhfAAvpw6JZECR5IpBPOE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IbP1+PGkWDA4QkkK3iV+7YlEE0ScbYAfRlqGcKmcBSBKNwGWK7D5Gelxj40TzD2X3S+0d1o5VrW/r8bU91a9ugPs0K4+qNZ+rymSDBbjLmH+8a1LLOVNQS299t6gOdzbTVhRDaQc8cou7q2MqazT6R1kEctY+ctJMCG1lZmIQIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PXaH6/nI; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PXaH6/nI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sd6o5IJasuBPWiBBReBN0u+hll9YolBhWslJvuMLRDQrKRitrlw+TR/hJSkn8+3N6FgSBcLSisaVjpWCCL/g4gKfcRv4YfPNLcVcmz+LD0lxHUJWaQj0j3fiT66fAARLMvDKzn7WM0gG3UIRn44CC6qy8kNUYQYnfj4XzijqbdVaCAhSZdD0ayyiU/Do5Ak4wuNFr2Kif4jz2f7xm2I7EyVQ9QMgUOBbJmaSrXZSUl91LN+4jI7+ofR0IRrJ2MARO4waM1YfEe/1FBRSLDJx9D7heKXLbttEO/l7VcWFk1NeSUDWu+Xt2CGpcbWvMG40rPGzaK44kIPYeWXHU2djjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HamEubkzN+SlOjnzo7Xt/gBKaSHX4fTjSuJMPNnwYLo=;
 b=kQsevd1vO2oyeshGAxuC61kuwyZKPLtc+4WuuZue+Bockk/qp/g/d3iKVRwmozk4G4UJyE/Hl95ADzb7UPED4dAaDZcgh4N/GKiC4eYYujhBeM89SYA3hUD3QjuvgxYzMXHt0+L1K9aS+k86FxWhoNPOAbhKvMCIWFkhwic1tZbybBqd0pztsKvSUvD6sZTGFjWuSeRLhuyagM/Nt/2eJau3lkvOrQsWakLY3YlUvt2WktbQEZmaGaOYXhHviZ6V44OPC5VxuOfXz+h1xIADp4NT0uUuwk1JGngCc2++Eqbuv3uYHc9JoHA9y2iiqdKSHU/Xv2+k4ZWOwy8FLwytxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HamEubkzN+SlOjnzo7Xt/gBKaSHX4fTjSuJMPNnwYLo=;
 b=PXaH6/nIP3s+n9WHfGe/V1yM41t14CNO0RbBo81/80d4OOym5FlyhzEX7jedoBrKVyT8dyMd78hd1AEnLvUFLYNpkqklAXyKjK3L+DsVZ0ShVaJt+PJyESKPEaM5y7zwpaZwbfFN2iIUijc14r88UILWKonHY0DrTtTUT+C6JWo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:01 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:01 +0000
Message-ID: <87cxts6cha.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/13] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:01 +0000
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: ad54a500-5dc3-4067-2c19-08df20302253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gYO4dpWCMHEfO3gG1BeB0yq0kzywDV6YA/LQfIlvYjdNA2UxsTlxlrgRk88Sszs5Cc3pJ0S7F1GjUApXNxB70BjMn4UaFoeL5P08MF8TAzuZYbbB+sjFdFCKIfDQm29sSntLE7Y9i3/so+1kwSY2MGZMEHS36PAnriYqC+2hhY077c6yitQ31Vp6yYdJPB5PT54Viooq6U7zy3X0ENvaHRa8N54jogNsyL2befsmX2VmP83+hX4RwO9ZBhRsjC3X9vFxRjZZimaA8Qj+Yi+8q6Y+Ts2pj4NPtxK0vNkWJtaZ1IsbF84zFIblUnsR8hXBHRBTx8P4NRZTHWUkiTX5NPuRA6OHaPQG3N02C2qLewl9Q/aoX9S1BOYtujt7kvEuYDYYQ/JCmK0ZbAqPM9mPoPacYUUAzpr5IstQFEqx8ewvQlUzgpHYI25v2hsluZqsN1ape3koTX8WfnTmJ6Xi52gfDdiUw9DqumXkvex83F7SDnb15c2rKlUc/jYrYpZAMVIh3idUaCnOPn64T3XTCZrYEdel3x7mwd7Ao27WEeYbr1wHUQ1gXdHg4dSfiueEs9JjFixW/Y8JA0sN1C6AvM4aPQNSyE6ioIak/7QyNa4vhC4zsO0fLDLJLafD6d+DS8pzvut8ZXpIYsgKoIFdmfgsxH1V1zXSj8OHyJl2lWTrnrrn+HyvEhs1JjGLAjiuFMgbbbOQiuOYCHQoxt0aehwsccWlTcSqYUelIX4zIn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?sXx0k3ewWX7tMJjlMSBv/Ay/w16ZWBh23es0cNWLx+gKWZal4suCS8cufS?=
 =?iso-8859-2?Q?t01wHhsJtcm+hCadlr7tGu/PwX7AWIOOrWwSS28hbYMzfJMPJTYZTlkGSp?=
 =?iso-8859-2?Q?x6mHEFAkWT4ImnnpHAGeWSU3ywLZIsHKCSbW/rMwD+u5fZi2CmB2oB70hu?=
 =?iso-8859-2?Q?IZRhATPj6UmvPr2PrSWII5tegF0gRpqU6iy7TRH2hIc5cYYQ9dyd6aic/v?=
 =?iso-8859-2?Q?52mFqEJmXO8QFdKzj9/kqycshmI0DHxGNXhiM9evCS9uZRV6wyXaVjaEu0?=
 =?iso-8859-2?Q?MPwzVL58FiVhazSZXRqPV5LkbKpwov4zks8TjuARaCWaRGd+dgniNePl4p?=
 =?iso-8859-2?Q?gHzUtCpJBan2DwpyvROT3qdK0GIZKLs7qTd0SzrzFiU69JYwsGAx8xF6RT?=
 =?iso-8859-2?Q?1X6KalQsMmrZddfNGT31s2rFfah3MuZ6LFPAILj3n9Yfdtz9p1prycA5c5?=
 =?iso-8859-2?Q?GVvxYwBikMZ9iBiGbbhIZVc2Jk2y9cB1wfcziQNkBVP+lUkZcJ1XP918ar?=
 =?iso-8859-2?Q?qbCW+19qhPZKYAF9LhAaJ6uTYNHcBgvB+ynEN+U/Bk6w0aeUwCMcYBTPQ3?=
 =?iso-8859-2?Q?jGZiUOWE6xLUli3RFIXKlRIYCwBt9ZYQZIErgkUZAnF+4PTyBDqSQjKQty?=
 =?iso-8859-2?Q?BAuI2jFHqxXcZ/wLC//mHKvuHFCC7n7Gx8yDGzoKdymRZ+Lp7AKDD8lAxT?=
 =?iso-8859-2?Q?QsAZapyAYAv41xGt527TIEloQoKBesdrN4BizY5NtdEc6gYbHFw6NFOwtc?=
 =?iso-8859-2?Q?yapBxt4zVATQd1wy3UBTMbb1s/rWb/eHSyNoH7uAutjN7LuBggUne9d871?=
 =?iso-8859-2?Q?Smyufl3homBe0zApXwWkAy0up5RDFDsFL6Qcx1CXVA0E41tSv16HthBXL5?=
 =?iso-8859-2?Q?bzfgfl6ZkJ3YQie8oQ3hMpEDX5VT7hZyAz7FrjXHvjGoC/7wUX9yMRZ8YO?=
 =?iso-8859-2?Q?aVluEQtezTpumuq19m0hrvtGahrlcTylQqUY2hd5RUdQsNvwSV0waO8eKr?=
 =?iso-8859-2?Q?XTV2BWyuFhRwuimW+R+702JGf/lIFSOTvM+oyyvEuz39viRWFjq76um6wb?=
 =?iso-8859-2?Q?x85b+L+e18611JEe0FiOSPsPFWQuC9Ome/nFB8fdFBSE44DaXaHau8rJ+3?=
 =?iso-8859-2?Q?mDrr4oBpC40T4JELRXFDzAbfJTHSRUHOKJkmw4svu1L/GbtHtZaHWENQyA?=
 =?iso-8859-2?Q?StkPBmXpjHHWc3P7x8K4xC7YDEItdGL8zheULWdBS5vigCBuE56P9G0FMq?=
 =?iso-8859-2?Q?VtjGgjP839hh8SNUJZOmi3Da0DLbqqE+sQn4E82P7KG6BGgg8wN1oSKOTl?=
 =?iso-8859-2?Q?Zl4haV3hU9B/Q/NKv7iWnyqdEa0FYARu8iTAjTHK/pQFgdaHL9x7MTWegc?=
 =?iso-8859-2?Q?9gt1ZvXnVLFlOY4vsgg6PTgL2mxbBRW4iGr5yKDMPa+chzhfTpCYKmPuoc?=
 =?iso-8859-2?Q?ZIRQ6dKeWpOt8V1WD+v4BvzdaGGPuiHYSFwhKcJLPs5aRjiK9AX3q//OP1?=
 =?iso-8859-2?Q?x6M9u4SRzfsbcoaGcaExZzpzbrxsBkUq0nvwdp2DO0xHPPBaG8vCqHWiR4?=
 =?iso-8859-2?Q?+nY+2uSHNz4/nOOwbEqWsJ8HQzqR/Y9b4MVXHePltEqiSoUU42JhwXjHoM?=
 =?iso-8859-2?Q?NQvPzKlC5IYNvBWmfouKsq3ZE/AGuRd4jAESPgXyS7a28IDQb8XnCddyE5?=
 =?iso-8859-2?Q?BPaiLCcjihhIcQ7KjRq0NUdD0dSlnFd7KWG5Ob0LMIxPSaVkVJnhlVsMIq?=
 =?iso-8859-2?Q?qLBY/492rQrw8wRpc3oO0Dkglq06E3ARgkIE72aHazsh74sBM+sy5LWVgJ?=
 =?iso-8859-2?Q?wKAmX1hHUGtYGhhBJHHuwfQy/u5B6VGZRROrsE9DW7DJmYSe9k1p?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad54a500-5dc3-4067-2c19-08df20302253
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:01.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFnjjmr+18RDD9Wbbrrav88n+Zcs32jqcEliOfhxQxteqv+Xkgm16zseb58Modx4euey0QL2gYcgsc6P1NEdt/k0jjs6NvJVfEVKWZ5Is1QxNsJwSD31FBGradh9bXA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

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
 sound/soc/soc-component.c     | 191 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 179 +------------------------------
 sound/soc/soc-internal.h      |   2 +
 4 files changed, 181 insertions(+), 193 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7708d84af8853..f2dccd3c9ca8e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -404,8 +404,6 @@ int snd_soc_component_close(struct snd_soc_component *c=
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
index 9622ad96d4691..91d30ec9a8fbd 100644
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
@@ -330,22 +331,6 @@ int snd_soc_component_is_suspended(struct snd_soc_comp=
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
@@ -1333,3 +1318,177 @@ bool snd_soc_component_matches_dlc(struct snd_soc_c=
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
+				"Trying to bind component \"%s\" to card \"%s\" "
+				"but is already bound to card \"%s\"\n",
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
index 11e25ac7235f2..6fc9f428d4060 100644
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

