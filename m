Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67932DCBEC
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350235; cv=fail; b=X+CWt5vcLkPkhjQIMwuXkAPX1zn3tEvMX6ErgatrGbLFw70pb2nCFvKnoogBwfElV+bWaYqzzOWNhGfonLBsqwmzb6mhw8UsMybmcC2RV2R/g5hRHi3SDoxoaVEioOS83ENsbM0N596SB0RzL5nKshuXinXdFAJ7jkjnIK/DcLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350235; c=relaxed/simple;
	bh=EbtRnYJpEvsJYA8Hb3IBQQ/RcrC+FgXaJ2LQ02tnLBc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QzCJ2mths/v4d06YQv23NQ6wjWvqQRx4qREd2mXX7yhDUKGBI87RqTZ+7S20yIzG+LDLotWG/O4WOnb77Jb736mgUjqo7CLKKki2FBuZAP8jX5JPTWoZxsprLWXhntv6Au89VBmvfOrDF/EF0bqofb+J5EtmobFKDHMMEQPXrLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SNk3P7ZA; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SNk3P7ZA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQSeurlPuzNbO6/uUXwan5bMs1LERqskOOiPM1Ncne5YvBthg4I3vbI9N7Ubuwg0B4cDzODEV3X3E2I6oSBjOddA1jx+zGkVxHna0ImYIHsJSu1otChqeuGmYIQAIdQi6z0MnBc4ZWp4zz+dvjU8DKTpXL6JawtuWiym7a2o9UwBSm11eKyt+Om9LmvGALCegU9/EbB3vq83qAmUOudgR3rwgEewsybZu5y0q5bMzgc+CdxE36vQYaPASwKFL5CPkELrmUNkksk4fl+/E1uOzdug1YNzsxYcEWc3TvD9NyFqPC2RCrujmiT0jxtE8pa89P3xvFIWMORH1RbdVyMR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyIbfwVLuc6hsanSWf/5gdVbBL21kWBEMPxUGZv89Hk=;
 b=TNMyKpVnqXrJJk6pZVsS2NXgaObVP8P5AhWbzdwLoz3grBzY8dyzTrZI2tgFFxaBh0V+vSdqRh9K+lcidCtSKL/C84GYP3GMwjUA1GkWJgEA9fnfXTRIthVAeBo1OK6rBE8JflBfmYifTPZf9V3qjA++FKmVMvxijCmz075F+t30xci5Uj8Fw0pN/3dQo3RHKgxKrfxx3WnPP16jD7YTlF2R6eT6z+pGWESkqU1fCZpY+jhDg/PRD7hmvbdCySBL/lXFxBlopyAMJGWjTB1aRFqBLGKuymfwUArH7/H4yvYzpOYamW3FDFAG1JIhfUeZrQD6zIBI6j/IH25JykTcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIbfwVLuc6hsanSWf/5gdVbBL21kWBEMPxUGZv89Hk=;
 b=SNk3P7ZAZmx7Hjcow4R9bgJIQqL82XxpPwCJn4IjgBmPupHuo8wR3l2SlE4ig6URwOdNRW3/6068+OdkqBteQzfMgF17YzMoK6QHrUIvuL6QCKhx3RpzVvJN1MpknEZP+yLnTcSaDJU84OqmtZOoiiZSkxf/rV0RTZ0jSwi0PTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY7PR01MB17747.jpnprd01.prod.outlook.com
 (2603:1096:405:38d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:43:51 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:43:51 +0000
Message-ID: <87ld94li94.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/10] ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:43:51 +0000
X-ClientProxiedBy: TY4PR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:405:372::7) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY7PR01MB17747:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ede27b7-4b74-441a-e03e-08df1201a0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	67Tgsv3nvUXX/OZ0DW1O7PLyudGXFhBBBnmO0Egn6vX09jqPg0WidtcH1U+yyhYf/poV41rVsUKcopCCnAqfa1b70++tNV6xQnN5Z2LDE2FucEQhMkrPMGkLHKo5EtciVqxCM2NtNfTG2k8qXgPFT5lUd0xAfxEfCpkjPVHNc7uo+LDcWplbd89wYHiptfgYqu6SWBvSBan1kIu6R91e8aFV4SEfL6Y5G4LTk90+LP2PUH9hO8UYCgL+HkXJP01RtLEYzmEcPbQV1uByvbP1xPVeF7PSaCM0nR6OSLXverf4su/uayAua1xpajYX3DhVobOVgM/i+TNow+sk9ibTOQkT8YJf44t/B3c9tcZo53E9OZTmOM9mNt4swKuURgDpMiHW7Ti8oVwx8LBenFG/bEKdN5m8zpOc+6dBOuy7lvqj9qP2KUWgGqFwlxP52qSd9NUbBbwqy5U0ksLT1/6QbDUPennqfWXedyT5QPGls2Kx423kS/uECwNOEsquiSltVzpgwhAmsV9x1xaXHaVVd//aUrlVTgiQBLgzacyYeBZTeGm/sTv0ypTUdF9xbpdM/99nmu8wj7jxLJ3ENjMZbHXLGPOTuUtEIlyaikSQrYUFF+SCdSqKSHU20TkbBk90FzGGmRFM8qQIQdCE0DSlUP+pytgNYyz8u7wNzacS0QyYKoXGdxDlFCun8qW/eYqzzMDI8uOqD0/3+JXzWIm1sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CEErzpvv+gdv6URtlvi5svCkaCosFCEEZ5t8aTOnGEnLab3op9pc7LcpJcxd?=
 =?us-ascii?Q?1RM5SAIG0g7Mz5QCorUz1ZIB1k4Or5+Rf5RSZW+M0LXMBgvNGQcbPVvRiOp5?=
 =?us-ascii?Q?sEFrL58wlZ45/PY06EjtxfxMtY4/6lyU0ydqcTQr0/jDNZE7iryTBuzCxWBw?=
 =?us-ascii?Q?nTuoyTrIBQqACl8I62oe55DSk3uLyLZnDmFLfgeNW7CHlOVoiWkjhpeWGIcr?=
 =?us-ascii?Q?rWfN7ueItoIGx1Dcrg+ThxcYVTIgbqB5rOsrl+z20Avhe0b08n1QJL6+xdjR?=
 =?us-ascii?Q?CsazLTAqKC365tQ5FmVN+8PwW99Omzb5VzI6t2Az7+wGhhpQxkisldY69M6q?=
 =?us-ascii?Q?T/zKWy8gc3IrrhGjahEV1U1KotGtTa0h3a+b8/b/hfxVeZnO0aDVxaM1eS+D?=
 =?us-ascii?Q?pmD7FfGE+F6JAQCqcE/UxPcNjnLCp30CRbjnl5tXK4uaqB+upwdHoSIm0Xwn?=
 =?us-ascii?Q?1s7wFkoZ6tOW0RzkjWMw99FD6YCAbbcpVPohTHyBcKrfrqK8rzbZy0Soj9jl?=
 =?us-ascii?Q?7mJ4yun1T9vebx6a9gEWF8lMcLRSAhanaMYg24w2OU0on+eKr3yz9dKQOqCG?=
 =?us-ascii?Q?sSsJCL9qwNX+q5eMnYkV3yF/H6eSRH9fn58jeJGZlZjBR48eU8YVQ1qhJTp4?=
 =?us-ascii?Q?kbi5x9/Xyu19I32qvCnzxVbtwZIlDovbjXmtuF7uc1itvomyrVoG61WlF0tB?=
 =?us-ascii?Q?5LLRq1ZiDFUasTv4HnDW6GiXWgpoR4EyIcB6qtG8n+VD6yw4Omn1G0OMJ66b?=
 =?us-ascii?Q?UqnHQfBoO17H4SYe29F5B4gMEbD2XkUcnYMJt84rLZ9tvZxuQcJjC8lsqwIs?=
 =?us-ascii?Q?JQbZQtX1jRMV1I/pwVhsUkaXqB54RFhs/gOmFzndrup9/16XYjrdctayDtu6?=
 =?us-ascii?Q?m8KbSYjfUVyDuO/+owDUHXpBlxFEPBECLlzA1yfVY6TMmxrEDNoarqkhHj4j?=
 =?us-ascii?Q?KrDumCoC9HbED/nBOzVp08dB53vh33cqZMDJG77NhU3UTxrewcCXZee8WxFA?=
 =?us-ascii?Q?NTD1VBWcvy84tfG+oSi7PtabjZxqP6o/YLLOYylVQ3YaqcSGrqBl94J7kxbD?=
 =?us-ascii?Q?Llc6QPNtn/j/mY5Ocm0nh9S5Fv5ZYQgrYpznLD9c1Ld02dzJz6tqJEUFWn7J?=
 =?us-ascii?Q?mbD6i9zu76ciR3p+hP+bdOQa731VodMqVygC6tnBkvs4PPgyy7gAo72LOWRp?=
 =?us-ascii?Q?2UMLTgPER6m7+HUdjxtnVI5GANTAol6rGDTs/mkg1QjxDcDGu5udVWYqEM3n?=
 =?us-ascii?Q?sIlVlv55EDRB7OwZVj5lHmW75skdkERPtLQAqo9AWdLuk0g4rB9WZE2gutJD?=
 =?us-ascii?Q?Gr8nDnBCAqxyKaNPoEdZ3FTjS9jcWk0Psyz+fZyqEAS4v/ISVTnHM2erR7vS?=
 =?us-ascii?Q?ylSylHzeg1urO0i42TTQvZIrQfxG2TvzW+rN7gemoh+x6hh+QN7KCHNO3pqo?=
 =?us-ascii?Q?JuPapc4lVeZX00cTNlJbySw/emdxj0D3UOw+uAE+mq70DvqAC7LdMXFR8PK8?=
 =?us-ascii?Q?EBlhyjuvUhaA26eOVWxtIPdyklb8l79djAI5nkLZwrcZUGW00rYM+OUSK/HX?=
 =?us-ascii?Q?Ewx7Q+M7AVZEJ6QczHbUHweDLAo+TlT5GSML/llewkP/Nt74J1pEknf7OGyb?=
 =?us-ascii?Q?0f2Iwfa14OgHaZ/kwB8eJzXnz4UFolizQvDTn7uCqJOPOuT0cz1i0Kc6wFMg?=
 =?us-ascii?Q?0GlQixgj3U3cTUeclfwhkqYbEPg2Ldcsk6pB2NxQw9vX15XnRYLt6Vq7PhkR?=
 =?us-ascii?Q?JRCPfNaTvV+jizbr6gAWYe1bkyuHFcXo7ZZUUHgO3MwR5rz2w/zQ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ede27b7-4b74-441a-e03e-08df1201a0e2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:43:51.4727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIB0lOnATpuy60lO2atMW47Ky1Jkxhx57krAHEPgMBGcY8mNB8Kf4W8ZRdJIvtYT75WY43JBfKiAgLkGf4KZ3YFNJhevNzepA3Of4rEdsEV5ZXExc2wZnQ8yh0nQKFzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17747

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. add snd_soc_dai_{to/from}_list() to use for_each macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 14 ++++++++++----
 include/sound/soc-dai.h       |  2 ++
 sound/soc/soc-dai.c           | 12 ++++++++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c49b59630101f..6c1acc984ecb0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -258,10 +258,16 @@ struct snd_soc_component {
 	void *priv;
 };
 
-#define for_each_component_dais(component, dai)\
-	list_for_each_entry(dai, &(component)->dai_list, list)
-#define for_each_component_dais_safe(component, dai, _dai)\
-	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
+#define for_each_component_dais(component, dai)				\
+	for (dai = snd_soc_dai_from_list((component)->dai_list.next);	\
+	     snd_soc_dai_to_list(dai) != &(component)->dai_list;	\
+	     dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next))
+
+#define for_each_component_dais_safe(component, dai, _dai)			\
+	for (dai = snd_soc_dai_from_list((component)->dai_list.next),		\
+	     _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(dai)->next);	\
+	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
+	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))
 
 /**
  * snd_soc_component_to_dapm() - Returns the DAPM context associated with a
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 375a8674d1452..bd714c3bbf3df 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -561,6 +561,8 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming);
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
+struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
+struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
 
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 3254b14c1eb76..dba8a5a63aad6 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -32,6 +32,18 @@ struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
 
+struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
+{
+	return list_entry(list, typeof(struct snd_soc_dai), list);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_from_list);
+
+struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai)
+{
+	return &dai->list;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_list);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

