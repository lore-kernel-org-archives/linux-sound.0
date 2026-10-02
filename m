Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01E33BBB9
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909550; cv=fail; b=OOvs56szOYsNA+xSo8zOJT5H/BdHiEh6vj3C01JlHzUk3aaoHG+SvROG4RkPhMJY404F91cAwjODTfT/HO78c4KeqxwROPEaGK1gzwiRq4tbjWAhzrk0HEq2aa8UdfpF+LebCp+jEwXLSDRjOxQOgm50h4PtCGe3DlbbfbXePWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909550; c=relaxed/simple;
	bh=uVud3WwqFugn8up0WJA93cPzCLPdxxZDWtvUfThH5zQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WCgWdIcNOuAJvk8o8+1D2rbf54J2wBdE54k0YqcgSyS0rjaFgfB23J4Qsh3g6D8PeISZR8QI8A6ZjocQK12Y3edyLTTLHwgzkXA0OF9XuA7ZOd9CGexwQoHuiZwXSvWzXx9AVNEB+hk5lTwplcr/kacWVWNjJmZbidynsZOlvpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lwE/+DBT; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lwE/+DBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzhFSFLADYanVbFJnaXsQB6Yv3ngjgGh77pnBAspt/d7nNeA+Mf2TzbfFj+WtYzYX4acs2T3E9C8QCNOA5Qqt5QlXPpBq6CTdf8nw6ri/CC1Xb5YJYSsrx4uFuWizEF2BJ6AhLoASOvuOu29SeoVjDjG2F4jPf1scR3tjyy8qwYoJsa5YzEqtcuWaL+pSmixJnaKjY+uT3pN3SnR9SAN1mSwD0KXCRC0bXK+263UONHJ+78zfL51LN4vfm63MuI2MtKX9VpHABWUwcvTZf4EOzB+MsgMvMhA0/zgxh2wkIUoiTUxm87dj8bmGLSZvRPOgVbDv+CVdCFXLQ8sMBnzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp/9sZTtU0sbwQhGmWzXIgCZiyXWr5XhXu2zZ/DCIK4=;
 b=jQKZa/80cBdmtNxLoSwclmPYfeGs81H0FiFfKh0wYTz6HjnWAI/uc4DHWeOhSPDZgma4exuysclv0e6aHfFLgBH65j8i1Q41LlVia9iLg6Ng/RDCKBcHAyA1dW5bx805O6l8fRkkoRNYC+j04lds+xCcqhZDs4Y+Su1xZddGx4DiWyuxylriEfQYoL3crmLBERtMUPtx+DlYS5p+4so8m1ekc+t7YnW6falTzgADSscslF31IUHIyj2+Db7Shwd6WSy2mF2VKCg1kO/O29+zElfsAKAmaQm7pd2bHwnARnE6l87VcW9g4bj+gvOLbAGy07SHCEZQBiDSszqO0SSpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp/9sZTtU0sbwQhGmWzXIgCZiyXWr5XhXu2zZ/DCIK4=;
 b=lwE/+DBTtLLAgTzXEeDmMyfKHbjBXtTzR/Tx6XIOzEelRmPreYM9BJ48uoKbgcLnZeZ8/ffhsxafdDpiPpplTDUPSyUjXQMn/mYGE3LUQTlDlZY9zUgI6xhb5A6dtDiLuf7ny7wyLjByUwMnf6gfd2DbYAaWjG9SNlyr5xoacSM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:27 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:27 +0000
Message-ID: <874if46cgk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/13] ASoC: soc-component: rename snd_soc_component_async_complete()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:27 +0000
X-ClientProxiedBy: TYCP301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e8ffc1-9339-4127-7d14-08df203031a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r97rDQTnSa6t8uypEtTAZ8q1MfB0sitH+suBPHe0tR6M5x3Or3KBUn0baqa0olEGr4DL8FuDvwwz2qdmaLISDM01ueFWLh0SHARY/IlCly49DobCcnZj8axTxz6mBxt3J5nX8vnCp2mkvTZTuLVvYHNBf808GTXp5MDceyEWLwDLFWc/AoJBVHOgMdiqB7/3TZ3UHmuDrX2Tn9X5KoeDAZ+U+dhGwSLScaTYMauPm+caiPOq44JmaSPea930rdZ1gA30Ckyt9oj2pXNrlvtdyG2ihuVvPsXlAhsGqABec9uuxPiXEEygTJBia4lZn6avJ96lLmFDtOPReK4dQiUeLrG1eK3apt6GlsarI9aJRg0+hG99k5riNp4bueZACnsuB70pRAYtGQTulBZ69L8hDhLzd4PvxsLTut7IlYyHYZlFQFfNVxWolFLSrv94cqCeE203o4ZT5LVvItlY0dcFn1RD8DAnRTejKFpz7LQID/3/UvFYtJdij2XtDUxh1/JXT4xWRKq2GqHFa+Z1EVPlQoj+aZURwRdvaluuGlEWdcGv2EaQpcRMLUMvyAd/9aQMW6XkgSHyQa7uxafHmzHE0o85Ylwf+q+N7amhL/6mYydma0ZykX0xOLZa0xWvq/01iOGt8dKyUXZcpTZ/Cg5vxgS4t1XluhGCf6B8CUoljpWVQhCTeLLPxdVYrj6KPXtB/6gKEieFoD6tDhXxJ2f4r/Pzs9nR55iFKP2QDlqrNUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?WIBZNCKT7rZdZ8AD4xFUO8QZnlWpATFMrh83IR1b0f+yUoEkiBISPfFxJB?=
 =?iso-8859-2?Q?FlR777dN6EnlZmIvCjpF62JrDBcDl+rC82zA/JLfjJIMjWC2CXgNnbKMdU?=
 =?iso-8859-2?Q?3htScszK+DGltZmfr0wq2rYBRybFEh6ESY6GYfFBRxWff49zLHbjCk2lbA?=
 =?iso-8859-2?Q?5FQX3y6wro1eWAaUXKm1OJt2z1gq/yd2ROC59cijNuqqCRTKU8rzmcQW2S?=
 =?iso-8859-2?Q?PE7uV+ff6sPbBFrgO8NImbWPSZssVCxcnLJ2ja7N4PTtlLAVmkN6Nrf527?=
 =?iso-8859-2?Q?tMdYp1cDoLxOfzGc/KugsGU4PFc+r5mLlE5pYZRNUAYvxebAKTFu6kKe+k?=
 =?iso-8859-2?Q?cCh9gGvXLbB3GgzHa3XlwNae5XyHO4MivXe0Nh0PQCGPZ9XZl5/91Jn4hP?=
 =?iso-8859-2?Q?QMj/O6XsLue2fT/JG/0uji60WofDAmI/YP3f7/5N0MmeONBeYz+QTimCZm?=
 =?iso-8859-2?Q?2gJxOP+JMkFS0vx8LJ0YNn4W68k+cdln90pEE6JwgQKE77H7Qxv0JY0aBp?=
 =?iso-8859-2?Q?IPZx1vmFGDgTPHDMcujjClitbd8L3FFgcVFN7gUGkICx/QIFNf7K4n+bfw?=
 =?iso-8859-2?Q?tUVN4RcVaATtj+dkhbJfvaVHMU9bJimJqXtWLGOga3N9Rh+ILS0EWxkY49?=
 =?iso-8859-2?Q?a8KUtyeUtrbl4hQGjTLNr2WKUTm7l+cxq3LItVHhCccH7+0P+85HOgfiwa?=
 =?iso-8859-2?Q?LhWFCFQww6fwsz/JyjyXgfmkQUuhufYyElSEzNbrVdJyDGtHO+BwbXLP0l?=
 =?iso-8859-2?Q?3NBrELzrzjhXH54N8xvUx6WgnuA8JPKM1u/rTSM6yuS0lA9jXxm6lmdJMp?=
 =?iso-8859-2?Q?wJm27PlDPkaveDdu6M/qpxJ5CLVMzrZZ3EFqMbxqFfTaiMfjzBNXxyyhOl?=
 =?iso-8859-2?Q?sowJWZ68KM7UlV4J+knPAWcThWWsaaHS/W+9G1+xzthJdGeML7VparKRC6?=
 =?iso-8859-2?Q?UaeLYv+DO6RoXhrKQPKsDrVtXFoL26kOt3PnAO5x9lQBcUp87ryIaMVDzc?=
 =?iso-8859-2?Q?TSR7qqkwdYkDwjGPfH7elenRNhYGL5fBj9gkOkuaDiVcAhJxVlbP2EY0oX?=
 =?iso-8859-2?Q?ZsQchJIqwnz69haIX/f2rz7KAI0922KHqo2Gbrsgl7hCJScbnnU4Px+UtT?=
 =?iso-8859-2?Q?IA8BDl9i2lGtQSSAz0VLw4NCghJ7WJQHy5T8XmdGUWUCnWgnNPQ+6xF/mD?=
 =?iso-8859-2?Q?7wUf4Ou/yIy/ZsjSeYTx6AoxZZ04Ibhk3Yz7aaovc58/t6iiC1cTx7mrMc?=
 =?iso-8859-2?Q?rP+qfjYx4exIrYOsFOflzGCFpnsD1BEkX5ePjFFiIIJKQbnFfct01T7iH0?=
 =?iso-8859-2?Q?5xPEIjFfnmr7dTn8Dx/iCoLk9chGcRwbym1j6u8e3rdqwIIZ4HOnmqHKcY?=
 =?iso-8859-2?Q?a3wSGTwPvLlKpRO2GHnCwoAM6cHGlq+19yf1ez0ajzOONepatN5q1GVCR4?=
 =?iso-8859-2?Q?F95HAaEcv8Fa1ZZ1TZccHuvYE5irEhXnPyrRhIFeT+XgR+QSnCNXeoSkLa?=
 =?iso-8859-2?Q?KE8PN6hnFYJOZftseytpN7BeHrtD5DB8RggtbEHW8cynomqT8DYSIvJq5g?=
 =?iso-8859-2?Q?ZQhHOTlHa96kPem8eV5jqJHswOZ1hrmgQ2c0S5S+BOydnKQLs/EEGTLTyv?=
 =?iso-8859-2?Q?M3yuzQ5Owu5KfIj9PaKlJYklns5yktzLiyRzjtjJUFQ06BSOsZcctqDDNK?=
 =?iso-8859-2?Q?MyiYo0U+1DJzdrj9q0RCsigkUnPmCiDHP5amRUgj/nMqPQw/Rv6cs9dJOT?=
 =?iso-8859-2?Q?LmGN85FEJGhFATwaO79Ud8T2zdoF3sGjYDTUIjvpg/Q+Q2TbkThVbD2UMZ?=
 =?iso-8859-2?Q?h2QqG1T7tWmfGvQEglevf5pphggE+xO+NuYxOIdoal5WvL3mjdpg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e8ffc1-9339-4127-7d14-08df203031a9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:27.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3SkZ7ezs+4P4NDCO088llJfwKW7pCLuv71e7HkNl5zUXaFmbEEZou68blQJHfZSsQ80PWMHf2f8CfVDNAR9yep9h2nqyHZzvDlP8leWcogSPaxkWhx20qfP38obyH+k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

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
index 26d2a4fb9380e..33626d06796db 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -303,7 +303,6 @@ int snd_soc_component_update_bits(struct snd_soc_compon=
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
@@ -334,6 +333,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
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
@@ -444,6 +444,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
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
index b339a0c7506e9..e4cde6ec6cf41 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -437,6 +437,20 @@ int snd_soc_component_regmap_cache_sync(struct snd_soc=
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
@@ -941,20 +955,6 @@ int snd_soc_component_write_field(struct snd_soc_compo=
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

