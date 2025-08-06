Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0B4431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455306; cv=fail; b=oGCLA3mgykRAg3dHLHdhFfj+MWELm7hqj07IWzifywQ86PmIL+v8BePr3+WYQ57fjiMpZbf+PlvJmuq9iJngY7v+ARtp3opU5bDqnwcWbFAp5gSyhWVY/Cisg3Knd+q8TSS7gKbY0XF37M8qjDnxC4fvKXB8kJ8lzOKuMc4L37k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455306; c=relaxed/simple;
	bh=pvJP5HzHogSo8KDScd9n1WRfXdUfK5sa9Ln/v9rZhBc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IcM2NSWv1jlE4YJRkN38h1xCvLGjRfsdKonlXviJKKBaDT2pd5Rp7saUS8AL9vRKcVT8uROo9DAmg6fPhqx6ybogFklDHTQcsZhIQA6qmJMF8cddBPVU4/oMOUNsamp+U6TI4WwsJy5eZlNv4fSCtcZS1TR2fbyhv7eRenULqpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jvP0G7uw; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jvP0G7uw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGdJjZWDxC5fFBbwInoI27VS8zNWFNSrt0Rs6OdPY9hIxzWwWUPYVlqLpNho7nmsvZJ3Jg5yIvt4wwvy66lSHK7Bht6UpHuVsQ79q784OiH355YSy8K7GLbqL/+29drMnoB6ECPW9qssA96q0/LnwySDSl5k9yTR5yTAFqfH2okpRPcZxxkWk9f9maARi2HddzI8wBJOkzevdhw5DCjHBLJjUaaRc7yq1vZGrDFXlityhYS2AidpE5bV5eHNI/2aFj2d9QG5r1WZWPGOIxFNVMOZLP/MYKXx5QC9Fld+kkloiGMbVzcO97YdSCXHTPwMYccSU7ztG8QJjLdp9AXNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn7OtyjlC0qhUxtvfqnz8R96lEVxMLvEiRCOEevGT5g=;
 b=NeUFNbVTHm5mGSlcPYoA7qcVj9mJjxh44sEkl8Xe+DmMOMgp2iU/QSifjhaIA4CH15IHoJ5+bt4OkD1AcTs1WJSyyUizAAPEOriiCLfTRRaPfchOBKldLmOrrhdh3sNrrJ0gXeGNShQI9Y1bd+QjZE5Nura5RflbrNaN5eEYa9Gr5b/ZUurB9WhMAZW69raRwHFPeErRtWHTkIJogOdiL7AUr1jZo/OcB87B/4h0PJrqaRMhxU27IpQ7hAkxZC2Vk37TpOJk08aPAw9rCt0HV9lY2X2XMz+nE8lwTWx8YcU7+CDuMS+8ej5RD6uD+F6VRbOVQbmVr3E0NciG5R2ypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn7OtyjlC0qhUxtvfqnz8R96lEVxMLvEiRCOEevGT5g=;
 b=jvP0G7uwaEWFZ+g0DEnBO2Rq3+IC/Ueu6uyFZvhpVtjDFg6Lxu8sUt9MvGel+Cw7rA2R3rIJa1l0/pnTg5YfYIGTtqLzjQAdF5KdgBJHK7ISz5R1wmptIG832ijYPTQVn3v25wWbdjds3hegV1OiL5DwkOs4qsEL1ry5h7OFK/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:41:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:41:42 +0000
Message-ID: <874iul83ju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: soc-dapm: move snd_soc_dapm_get_bias_level() to soc-dpcm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:41:41 +0000
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e9d893-1223-49f4-b328-08ddd4a38a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A/l0UikKaTlBEVxLD/adPIT0z9Y+jgklzphXa+kTmjN7leCKwEKouRNY6+fU?=
 =?us-ascii?Q?5RyIB4smuTKTuJvR3tD4r5qtv5mH3DWBiPa1xFeTG/oT8WW9jt/SAnOEqs5F?=
 =?us-ascii?Q?Su1h30D+9eo4+v+aaj8NghFmtu8C9hpVNZNPWxQdbEkpw5S3+/Hoo75Rixc4?=
 =?us-ascii?Q?uyLQPzWQNJy9uxlundNp8JKQ25fh1DLIROh4pHVOJFBZmFad6Zeny4l+9CNW?=
 =?us-ascii?Q?w1+1Z3ByWE+AdchHuxAQS5utcSccJVODLLybGZ19OYrY0HWAigR5m8r/dF7M?=
 =?us-ascii?Q?q/9yQXy+m6yjJdULhf+eT+i6I8uWzZgdEVlDKnhCBdSyzDTEmTKTEHNcL/zR?=
 =?us-ascii?Q?E8qvsS5cyyvJKXCgjj76zDZDn3dXczQblTXi/3WbUHT9Yluwmfxmeex5L8Yt?=
 =?us-ascii?Q?+RJL64CYNbiyzYLGnXAT8EjzDJdMeLBXFOy+GS3HLz+2panTHyyeu0jhNBrF?=
 =?us-ascii?Q?Uy0EzR3H2gIyS6cJ5M3rOH37nqYiptKzZ0ycDc9Iysrq8XUtO86UhzBMfF4k?=
 =?us-ascii?Q?wHIN1KvE2jWo/htyNggiZiG9h3T8fvlN1zblW4eCJ4F4eUBv5peOFTDOJGaQ?=
 =?us-ascii?Q?HZS8dVq9SEzQ3zOQYDtCAw03ve15elJzHxJdv0hkcb3sAvA5yQJpeyQJ43wm?=
 =?us-ascii?Q?oxgJR3j7/r2TUNbpf7h3bB9gCbb337NHsWdlsKxHMyaTp1ZBJZyqXf5g1/MS?=
 =?us-ascii?Q?gIfEydbbC7jOMAV4I3K76fa/DwKj0UKNTZ/jPkkEC2vwXhfxuGjAvRB/6P1/?=
 =?us-ascii?Q?HqVkj29qHaWn0KJhl/OAyEd/Pf+9jvkld/PDYR2yyqiUkST01ijJRoIZIo8Y?=
 =?us-ascii?Q?NctWzhLwZSGhLXi1VX1Te4X76w1PlqETdmUIuUlbU8dmYm1zugLTaFAe6F2k?=
 =?us-ascii?Q?xP8bRXF9W5I81cG69FQmjIzjmADlf1zPFgB9SBMythHYTyetSqcfAAy6c7uG?=
 =?us-ascii?Q?DtgULWPbyBqdXhnsEBgo0O2EvgiUkmFUxeI67hoB8cO/DgtKfZIDtlfgDrCB?=
 =?us-ascii?Q?tnTY+2YHozJ1KuTOTeJUjBufRKPCF+LTZ+6CEmk8TId2vFq+nmR//rnOUXGy?=
 =?us-ascii?Q?eGXpmQTt83NuSVktzhEhoTTh3QF4FRUbBnJbVuTD51f76Fxl5qQJwd/AutSL?=
 =?us-ascii?Q?2sTmVXZhzrYiGSde10UN/Xg6QSB18G7kkL8sZA6iPYqFj8pJuywSSm9OBxVK?=
 =?us-ascii?Q?N8PP1S118NLpyW3yKh41socwd7fYLk/MnGzm6x0X+r1Z8za2BUErNhIYlTL0?=
 =?us-ascii?Q?E5X69Rd+ZjeZcD2gsd18IGDWjrwd4cO0XK9+YptX9KVcKpBSk0cHpW0PabMQ?=
 =?us-ascii?Q?mUMB4+nrotyMDu2F3u8B8w/BXpdGkCDoNPs0+k13kTC4ZO98NFUgidwfzvW2?=
 =?us-ascii?Q?J4iL7C7cUrWJZDBAwyJixcXplnmzU/vDE8ta2sakqHM101RP/o4q60W+qfr+?=
 =?us-ascii?Q?j36ABitP1tmu+WPvmUDpAxNu2f/gO0uqS0X+xhHlTirJRx9fACAMtg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ccFvVHWIf+DLCHK8d62+O3+Gx2tK3JMa86qcZtHGNigTb6Do1zm5mWO7fkD8?=
 =?us-ascii?Q?tME85CTsuh+HHDGvQeT8VtPRKJuvKocRvbs9+xFpC7aWSm67l0QmZonCHXNZ?=
 =?us-ascii?Q?5oa5/pbP27c3yvjtqivXWlcgWAkf7IhSvjsAv3ld4tfmd+wewYlQa4CCBJH1?=
 =?us-ascii?Q?6U9hnFXHjKlWDS0Hgvj4hltS6h/Qblg924UPCkfmDefqWPGu5UZjEsJK4/aW?=
 =?us-ascii?Q?mL8JLR/boopLZF4P4Ce8U4fgNCxLe+jaouPxSXwzEZ9KKR6awMSNJyy/YIT5?=
 =?us-ascii?Q?KX1OsNod6LoadB+/aXJUduHndpekrguocXbc02H4Nw/jN6/Dp7PkJpMzQnnF?=
 =?us-ascii?Q?xwtJOB2lXDGbY19VYKcNIFhausYNzpa4erwtgZedJcl3oX+Cz+0LTJ08C7dR?=
 =?us-ascii?Q?fg5blKFIUc8HyYDWnhUzOCBL4gDBCI/IMBPkN4m0COIn6sCEXzVulYGh0aJJ?=
 =?us-ascii?Q?tVNLW037GC+9ETgTIuZJJZzIisFKsBdFbZRm5hIwaVuyuUJ4G7GYVMcmPJ0C?=
 =?us-ascii?Q?XkxVEQ/+Q3OyXpVOz7u1+zjHniIntMDUP3q1xY5Lhkud6znFIhozZfH4U2T5?=
 =?us-ascii?Q?fRD2oiFOxzgplfzmWIPtzdZ+bFQJIWqkESiijUoZY2UzH44kaYMIIX5SGZ7Q?=
 =?us-ascii?Q?pTmF5u/ExdSlIXrMypSi7E7TADnGiE7q2TE9q5AY+96D+QlRnsoD306f/8HN?=
 =?us-ascii?Q?s2DveFZqriT02ww9gQ7WADIoI4E8tTnG6LgJv1iZeLPi6ZCXAnR/kEjorepS?=
 =?us-ascii?Q?5GJpbgA2WhUwOXAu5VjssMh0iWvREpXggM/MU+lGtbR5FlvHKkr6uCjkZdaG?=
 =?us-ascii?Q?OIClcc5iAN/NV90EsVc1DcpZ2icG0KdggnDReAp7z+YtESKKPqtaHiSVuA88?=
 =?us-ascii?Q?1e/0+xygXefn01O9I0/HEHHSQFJroiNf7mAyDE+wHiNDB84327jy3I1hz9zH?=
 =?us-ascii?Q?pnvbEJzcLBeda1QJnjINPtvCQp+/fsHFf7FcNL0ADZFr1NbcPYH79f7fKz7M?=
 =?us-ascii?Q?RWAXU9223eRtE6yiAJCV3u8k5RBQbyoE5PETNUDG+PInlb65ZrPr3YjXMXg0?=
 =?us-ascii?Q?dTfiehREBkZpU9w31Y0ICZeG4mqQ4ApmRVrNhT4Wb+Q8eXOwBtluehHLRnDa?=
 =?us-ascii?Q?8j/8lwoeoRT9YbrPu4TmIDBd7GdEP7qHgVSPZmpYq4NokLH4lFv0/q1oz9aK?=
 =?us-ascii?Q?YflaSscdV5LEzP3eCDoxt7oSY7KckBJwT+Y8nacMZYbKerhVAMmC8qdHKJx5?=
 =?us-ascii?Q?J7tdb7hdNADk+0EPAGxP89C1a+ZcinhKbpnyXiM4FqVlkdPv/9P2R+CEsHDz?=
 =?us-ascii?Q?/imqldGSHERkzAy0ZpvWMTcrV204r4o8eglxHFKjJgGbhbpi9JZ35FTFVVtz?=
 =?us-ascii?Q?vIOYTQswmYwUb8OKHRdnQCT6ysoBu+W3MCVk/cLTHDk4fcGzJnp2ek6VfguG?=
 =?us-ascii?Q?w6Rql7gcfoS7H1vJ5xDjKFbX1qpM8+EvChizNrMkVXLKZ1C8weAjKg7jTjIh?=
 =?us-ascii?Q?ABsz2bScYydDSto02N1dDVzNrCIz/0KZa9JzH5PTmhEn9HvowieNLgQbWNkW?=
 =?us-ascii?Q?CJZk+BPISjAgW0v5AuUbTAkBkB9WOTSzR51Z6mgzZQY6+vHvr0Fp/ocnC2oB?=
 =?us-ascii?Q?bQx6PdJZCh66S/XPG6aHqTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e9d893-1223-49f4-b328-08ddd4a38a1b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:41:41.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ob39TKdl/6pVyoyxpez5dHo0capo1/lI+53wZHpMylUnkTrP8sZESPzFyQEDxMCeluLieyEI5z8NIu/GytuWPYR5T51VtkC+1Z/RVfZM3TH1OGRGqjMzOtjLMEuWLF/x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Because dapm will not be used on user driver in the future, Let's move
snd_soc_dapm_get_bias_level() to soc-dpcm.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 13 +------------
 sound/soc/soc-dapm.c     | 12 ++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 0b5c7e6a90c8..f1318cdcf7e4 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -722,6 +722,7 @@ struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kco
 struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
+enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
@@ -747,18 +748,6 @@ static inline void snd_soc_dapm_init_bias_level(
 	dapm->bias_level = level;
 }
 
-/**
- * snd_soc_dapm_get_bias_level() - Get current DAPM bias level
- * @dapm: The context for which to get the bias level
- *
- * Returns: The current bias level of the passed DAPM context.
- */
-static inline enum snd_soc_bias_level snd_soc_dapm_get_bias_level(
-	struct snd_soc_dapm_context *dapm)
-{
-	return dapm->bias_level;
-}
-
 /**
  * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a37d44cd04c6..6ee03cf16171 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1037,6 +1037,18 @@ static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
 	return ret;
 }
 
+/**
+ * snd_soc_dapm_get_bias_level() - Get current DAPM bias level
+ * @dapm: The context for which to get the bias level
+ *
+ * Returns: The current bias level of the passed DAPM context.
+ */
+enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm)
+{
+	return dapm->bias_level;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_bias_level);
+
 static int dapm_is_shared_kcontrol(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *kcontrolw,
 	const struct snd_kcontrol_new *kcontrol_new,
-- 
2.43.0

