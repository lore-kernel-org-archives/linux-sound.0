Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871032F75B
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946771; cv=fail; b=egT3Z7JGRa917LlBdHZgiiSJHH91RkPFpgiGf0eQIdhln3eMI/VNdd4LmEcM23kLmE7sjB5qNpFTFO3Otcgxs0Wk8ij3WmEXCd1805egnwhfCtWtEQePdRhrbkKTSYZNPobb7vO5VV9ngpjA0jXSsZ/phFlC+/wCaL/N50xCKyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946771; c=relaxed/simple;
	bh=NBBjSWedf30T/sybpKXppstugA7/bMumu4xyf0c9DHI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NR/U8nI4QMLidjnc9dptOloovq+SZeunbyUYy7xioHlRQa9JujxU94jUfxvp8VWUiXKjozsuYBeP5ziZKHJGT8RGnV1YhiVx7kBV5lrYSb5JeDYUQfWCkwpoMwZeeMNBP1SnKNuxy/CX6SqJG0DwIlX9P4Kcm1rIJ0fH5rJc1Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fQ/MokNe; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fQ/MokNe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veCcualKYnnR620sm+XWIH9kcq6ayb5lpiyix3QU+vDBSS2hpl7e4PWCC5KRLq46r0QyFNNg8Vwv8B9yIub/0lJUto1c4+6IbAbXx2u1cPNkNG8Gm0lvxH9rU9w/GcmNgHBLhXx+9L3IbNw2wDb8RSph/xUHI+ecO+lrA3ozhH5yVkUrl0Lb29oLZ07Pft4ldlSLzaiEoYaEHJizTfBlwxvHKLfPl57t86nxU9vQqtrvwCOd61FHxZR2wwjSakiKsnK5quvf7vG1ZcxmBdMxVlcYUFIjc3UbCYjfVewMQdBJzzoWRzGNAmNMJ5knr1vYXJwUzSDnhU61CardRS+Nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sKvTYL/Rr9seztoOInRDvwWX4SZJF3Dfe2sQ/6T1Qo=;
 b=XGujpCOvOgZr0j1mBsuysx9B5B4iGO6mqVVnODkKMiNrS6mu0wafUuCvPrx+U1owRoc4OeDyX3St/W6lbEL+RNPJHZdLlzGtiAWM1C7PvlXvHF+OgLYPE+2lphkcoX5QdTHKn7wDZbStQwUhRmRdzHxwVx+kxPt2Pzv/sALUhNwzCEIH5OgDNtvpBi73wXbNnELfsN2l+Tk1J97dCpc4V4FUjqPH7jhhjfhpMINRG7DqYXM+LC+PgwFGNih1SvOAsHcbxVavP3xt+DcPAWIyO7G5rNROUCaW8LNvnq98n9OxGq2WXvFpFisa/Q0H8euWF5pgbLaYr70YElySUltIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sKvTYL/Rr9seztoOInRDvwWX4SZJF3Dfe2sQ/6T1Qo=;
 b=fQ/MokNeE4Wl53aNk4yjyzP7h7dQzxMUnWPSY5TUIy4waul+6vtQ6hWP9QLGmFrfcAEH+eLI5mTmD9NydmOSHx2TZNEGPoxtasdSFAPwTOv7HSg5xAHpkWvHzJcS5Jv/llL+DNbZ8xf6aZhH+/o0zd9ev8vAx0vClxXP6dGMRL4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TY3PR01MB11826.jpnprd01.prod.outlook.com
 (2603:1096:400:406::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:28 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:28 +0000
Message-ID: <877bjlyokw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/13] ASoC: soc-component: rename snd_soc_component_async_complete()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:28 +0000
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TY3PR01MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: b02441cd-93f5-4a6f-f63a-08df299f2968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|260925021911599003|260925022911599003|260925021311599003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	tqxso68pifBUZW+25VF4fT1PfFhY14mt4PkU+HoyPE+RCU/el0Oi2gQGZBYBK6vmL2utTR31thpzr7DqtbhPDX4lPVFbyZIrj7qHq2xcXjuYWgM0JGdVKDOEHjc93aTsbd5cmWzXF54D8jKm5+Ozkm4eCaoa3LQ4IljIGsKqvWBwllNwFWnvoailCtUTL5UqP7OQO3J67oc3AFpMXkpSHzXjwuXPxhU7DpQevxKV66kHO88gn/aMKGAXzBuMc39hvmHpGBV+LyyARBHrw3+aF6rsbQ5dqWtHCmztG5MH4m3AGIxxbfTIy42i+J1BEwvr83/GfZFtipWpAfR07iUV2rsNcf2Z0ztiAqm+MRU6O8pL0phfH+bQOTlerV3o1WXAtfKhkqMZWhKgl7cJphaEGHnS8SjAEktHojlTPRZXTK5fIcCvhWFea++Mh2n20VJAwHU09UbmIIAewmPrZ711ow5S5HDOMEAmeTHz1JEJGaAYXSx+SssvbE+fw9DI+Kyd6dLE6P4k3lWnD92q9cs6RDm8Evr/2sIAuEUoX4M5QWu4TFdnplMvWB/IRy6BNlCXS1OhwZKbCe3LQG+4mELyxrEqeBio3G6YPt11Id/AnfQi0meBXBwrkcmjfVvrXDMTwISViruKOkTzyXkxJcNzfSucrTZbcdwHlxnr1E7YCX03Wurrq+92h9JkeTg1YAtzsdYPq153eQ9Xjuz9QEERGvBbJDZLR+svYvmpu5RbeVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?C4Fy/fjP1MDIWf+HwjJRpJIe7fvg5/sFTDX+Fnm98q8odvkhDKFO5HZ2+K?=
 =?iso-8859-2?Q?oQUs+SdwveA2jHzGNceSj++Ipghx0NFtHlXfGbfvPfCwChmOFD03j3RomR?=
 =?iso-8859-2?Q?FSkLb1XHMRNkxIPzW7sBe1Ps2kpRht8CrwYsIed4X3cVDL69eBbfcPhHS4?=
 =?iso-8859-2?Q?fLTa9RG/F6DEe+QW4JEnWZc2541+5dG9Se6y1pCQP7Ggimd2KjBU4/vHCu?=
 =?iso-8859-2?Q?J5qOyJriarey3ZXxRYmDBNYjbX3Vjf0PDZJobBvZ4HwZdla/2+GbDvLNXU?=
 =?iso-8859-2?Q?Jx/LOuaCf4ATEe+nTivcl8pfa+NSQLZlGH7ZOI0ZL2Z7Sx9dI/1KPKE9Kt?=
 =?iso-8859-2?Q?6N55tVAyBCbDrj4TOfhX75bJLWEYvK3IAxHHtlhGX2aANdSOeuXUCx36Gs?=
 =?iso-8859-2?Q?sNZOGGRD+VyOFhaQRwJasvdVeyI4aeghjddGao7DtafQFDX4vTCt5Af3jN?=
 =?iso-8859-2?Q?VnQpjRRryHB/CLl5VJAahTDc4DqqPoiZrvyHvCPuVmRhns904Q/jLRLuLP?=
 =?iso-8859-2?Q?UBHwp5bunT6tiedkjv0X3/+SrvvoHebgnIRJDcYi05UjiMCaqIbrDHcSJP?=
 =?iso-8859-2?Q?IWQlvwiD1sM+23ffXrJIdqk3trIN3h0H+XUHptuu2l8VzcRpBDh7cOsl08?=
 =?iso-8859-2?Q?lgQJr0Vk5yEVaYZntwHMpiPQdXxE3AHprltx4K5hcFzFh6yGvt28JgRwLE?=
 =?iso-8859-2?Q?TFjHCxsdTnno8PXo/NT00PaTqqAnOBU+k+RUd/kxbmPmh16I01A4bz9Mv6?=
 =?iso-8859-2?Q?B4MRbkBrXUkSggREatlSdAtXkTX4usvLYatdPbDK7YctaBAmDoRHeZ+drz?=
 =?iso-8859-2?Q?PeXt7yCFmzrbhjSqcKoXZeaajVWybnpyglYsOxnT+4zbIoO1O05Y08Ndt/?=
 =?iso-8859-2?Q?KUF2/fiomPqfN0Ur+ehpTfmNuAfqT+pHgF45KCpU1QoRxBBSkiI90Y8pIv?=
 =?iso-8859-2?Q?bjm79EvMj6PZk8o/hV2Fy4oDR0MQ8w2QGCe3ThicGqOnuL6yEw9u6wIOz4?=
 =?iso-8859-2?Q?1UO0LMJ89VA7wn2/mRxrbVwt5c/363z6J4dSNZHnCZPtowoXWTHALGfMNa?=
 =?iso-8859-2?Q?euCl6PwR6vJ9mT4kMBFqRXNFBlDp9VflDdDfeKva3wcjbM2oFZelKk0uNR?=
 =?iso-8859-2?Q?9H/MCB4jxs4L8HeLR/Rh6th71fsblTPK5ySlvYVh/GYcVlNBnt6C02ZWAo?=
 =?iso-8859-2?Q?9xXUIZftq27VdTdKj5KqXYy0LXtGEhK2UUG5VJE7+cqAO5+uGj7dcDd9Hs?=
 =?iso-8859-2?Q?j8puWEDvwhbCS2vLfuxGzyo6lEckMQG9j8UbYHgnWYXdK1tfRxmziBemqg?=
 =?iso-8859-2?Q?21rJUKu/fZ7mnNH33gwruh7Q25K29to6YgMg7dkoUVk2ORzpBxnRYnAHKm?=
 =?iso-8859-2?Q?g1N1Bs2boqW8vf6AMfnIQPtm8WzNcTECaAARJF+wxFSeyUHUWXs9UHfn9L?=
 =?iso-8859-2?Q?E6P/iThNYLRaSb2w5tqILVYaXXuEw3u3tmPwxPPuOThnk1DtDJwKV9csfD?=
 =?iso-8859-2?Q?XdDrlfwT0pADkInFfDsnh7Y6G3AY94E/PwCkX2FY0AHvtu39L3dHzscQvT?=
 =?iso-8859-2?Q?oJFSGH3KXe/pIiWs4v71tXmAvBk5TpbtDxA8uwNJiVnYZVfiRo8jy1dX5G?=
 =?iso-8859-2?Q?iQ+79eeSVbDXSJDRq9ufIhgU09SFmHcFXFU82PMFY26SBEHz+F+3gX6Ebd?=
 =?iso-8859-2?Q?GsSF/HoJaxFoS6dlqQZSl+3N2eGJTIQQ5bj81pVeVTdNQwlYUvcT587nxX?=
 =?iso-8859-2?Q?mVwhFTbnU17GH5PalavT5R0AgjHXgqHy59qOneAFY/QlC64ljtoB50BpOs?=
 =?iso-8859-2?Q?HwT4qd6PGXklMPqSuRVZtcCtgotXQCvfcVwPGmjvfsTkf33ULJ6y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02441cd-93f5-4a6f-f63a-08df299f2968
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:28.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1POKQ5x4D5AVNA45XL06A+Gq+NQkxj+O2yOmvCNlb3xp/XsBTU99QeyD2mTLTmAskCmZkFjF8Ffyd1XCA7atMF2cJwCcP5IHMa/m1yRwTUlyQtHHr9zulAtGRr+LBls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11826

snd_soc_component_async_complete() is regmap related function.
Let's add _regmap_ on function name.

It renames function name
-	snd_soc_component_async_complete()
+	snd_soc_component_regmap_async_complete()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  3 ++-
 sound/soc/soc-component.c     | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c287ec6f458ee..0839f137a77e7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -305,7 +305,6 @@ int snd_soc_component_update_bits(struct snd_soc_compon=
ent *component,
 int snd_soc_component_update_bits_async(struct snd_soc_component *componen=
t,
 					unsigned int reg, unsigned int mask,
 					unsigned int val);
-void snd_soc_component_async_complete(struct snd_soc_component *component)=
;
 int snd_soc_component_test_bits(struct snd_soc_component *component,
 				unsigned int reg, unsigned int mask,
 				unsigned int value);
@@ -336,6 +335,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
ponent *component,
=20
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component=
);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -446,6 +446,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
=20
 /* REMOVE ME */
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_async_complete		snd_soc_component_regmap_async_c=
omplete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
 #define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 4c2d2dc62f86e..07d7093855824 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -418,6 +418,20 @@ int snd_soc_component_regmap_cache_sync(struct snd_soc=
_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
=20
+/**
+ * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has=
 completed
+ * @component: Component for which to wait
+ *
+ * This function blocks until all asynchronous I/O which has previously be=
en
+ * scheduled using snd_soc_component_update_bits_async() has completed.
+ */
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent)
+{
+	if (component->regmap)
+		regmap_async_complete(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
+
 #ifdef CONFIG_REGMAP
=20
 /**
@@ -922,20 +936,6 @@ int snd_soc_component_write_field(struct snd_soc_compo=
nent *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_write_field);
=20
-/**
- * snd_soc_component_async_complete() - Ensure asynchronous I/O has comple=
ted
- * @component: Component for which to wait
- *
- * This function blocks until all asynchronous I/O which has previously be=
en
- * scheduled using snd_soc_component_update_bits_async() has completed.
- */
-void snd_soc_component_async_complete(struct snd_soc_component *component)
-{
-	if (component->regmap)
-		regmap_async_complete(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_async_complete);
-
 /**
  * snd_soc_component_test_bits - Test register for change
  * @component: component
--=20
2.53.0

