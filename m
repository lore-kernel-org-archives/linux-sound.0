Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB34431
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455311; cv=fail; b=mtpXBUQqXqk5D+hv05P4dRtuoeipTZhfhrjnuor7SYgVE8Uw3m25/uEExYdSeEvwf/VOB7H7bSsXyWmtuJTfJ+Q8EoK1I2u8ibbG81k6jj27BZcnM1rDL/cC1Ph1MY+mQuZFDDqIPA292UBoYNzsCN24aIXA2qGIbNCmTnW6RRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455311; c=relaxed/simple;
	bh=mrUwM1sH+yefgdKe1Bv9ngVOieD8aMDrE1ZYdwzqP60=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lVs4ALV7AoCawNy0Uz49bWEeMOExemF9q4ItvXGnA3MkK/vtgXYqVmULt0kgNELjtBooftgrjVqzmjZfucINOLjN5GkLkPlLvbfos5OTZX37uO5BjflTgZAZw9nSZqxCAmALA4kdz6WCQIsMOa3zIR8mlgAr/387UY+Ec6hkFzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VUr7OuCE; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VUr7OuCE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFzyypX8TjQrhJUoZYrxJ9uI/OuMO07al03r02pm7te8tMaeog4eHtmdCxgFnoAVgCjSwALUAzQYO45oekYcxEeYPNJBw13dFGjRD9EDTanE2szaH7EwihNIM7imzXS2WWsG+NEQ+axIR79pjkKJp7T/nIxskMQPdQZODpjUNkE/Sj8eha/nq1nn2dlEAgjYB7gXfM4XTNSlTD6P30DNKxdCFEul4sVSdLhw8zi5xUnCaWz2YT8LLrhV+Bnh2COAU7r6ubPT6V2ucFy2p0uRS6d9aMpN89SgUQYKwZqIVx87A/A/GR+rq2bd0bkHhgdIT8ookyAKPAPV+/PEO6DQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQV5KVKofLAK+51iqr8/UvqJXZPA+Tbo2ehonda0Szw=;
 b=Zw7wN9SLFGUoTSbF9Rg0QPF4kvEfCLMv8DJDMLrJfFswRzE4RTrpai55lupS0Rhyduys4vsPRH19aD7tjjBEXx2aLPbzjO2Ue1eNeVtiOuneHSBAJpkL2qZKs+4ZDlAvRGKhMncfppuTF9bWyh94r+TaAILvXQY2BHULo2APw+Nm9x391drpjVwIp9E8Cx5Xug08ZwmsvEKRzJmgRSWC3RlLBkyWgmL/jcXi8Tu7kAKBEbvnOSS001Ya1P/rksePdvs/laHUk1XY4S2AKNtHy0zyO4Fd4/L1Veuk6f3CK94Q0QaczkBFfEbn/6kFbw7mCY7TUxolIULxUoJa34YyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQV5KVKofLAK+51iqr8/UvqJXZPA+Tbo2ehonda0Szw=;
 b=VUr7OuCE5/YPo42/nzogjzjUirUoFEYT91FiFdcMtr5tHWS1PP/etRHmEk6aV1cKxUgTZwg1xC9hMGS+Q5gP5bfd2R/aEdT9h7RsWwY/OVZbcu7bNpXVcYUPmEo+01GT7bcU1FsywuR8fJhkZZqg9YV74mojTr5OT0w54N9S9Og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 04:41:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 04:41:47 +0000
Message-ID: <8734a583jp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: soc-dapm: move snd_soc_dapm_init_bias_level() to soc-dpcm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
References: <875xf183ka.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 04:41:46 +0000
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: 723950fd-0f27-45d2-43a6-08ddd4a38d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VzxXWHp7Sw2OFl7OQTz9QUNZt32C/nOYEOYiOSoHPZA3Zp+hpXSTXhVfh5jU?=
 =?us-ascii?Q?wohiONHA/PAHexJOtdihGbGPcRUEBX8NU1i6VzxtdhGPdKe4WfceJKlKf7PG?=
 =?us-ascii?Q?QkNRZ79YRU7JthBILzzDT5EEf35o0o/gjjeS7kfHkyW9vO7yjuiZbYek8M28?=
 =?us-ascii?Q?h95xJxBqMN+gClN6CvCrTnLy4p5zQJjytmRDFBV22uURy7R0uiwURl47eB1k?=
 =?us-ascii?Q?jpHrA2RzPNApnuLYEN+NlE50xKgvQJ42oJ7eXfwYTrUQVA5H9SryULjdE8dm?=
 =?us-ascii?Q?fCFr1elkdnGZqtwy03Gq1bTZH17Mzh9o09NqoXZAPKWpsmmmEFIRuSwQey+S?=
 =?us-ascii?Q?KLGOYXCQPIlEDo+FNobQT+kbbCD3stglFNtK9CLuZYw7zapy1PVmX/YLEET2?=
 =?us-ascii?Q?guBRPoyeCbcZOu7PDi3FjAxfI27/Qze51Oa45d5aYOzVQhuCnbrBos7P0pyp?=
 =?us-ascii?Q?1sBn54vHEf1ME3akJF4pnau25LYZTya6vBspc7O3uOW2XYjHHdwWF3pPnKHA?=
 =?us-ascii?Q?BgtiTD0Q+9T6UZ12vjT5eA/lsIZWK8DFJDTZtJ4s43uwjdvMRPraKuo+Qn62?=
 =?us-ascii?Q?oa04p4VzNZPq90pl7TcipTHtfvAwySYS82ntUoiCRlYDwfq/j9Y2OmEmVdGN?=
 =?us-ascii?Q?EqhQZtjqqDHkxoRdzoteVFzn2/JznUigZEYZ9/8Ig1I5ancF32aSEX5KuMvW?=
 =?us-ascii?Q?wk8T4KUSNnLQgEAXl+OpVUa4P+giyZWXFuhKF3e8bHRb/BGf8nfmWvlLbiT4?=
 =?us-ascii?Q?LzZJXyRHwS7u4N+Sr9LdSIgUuf0CI8p1oEnWLCslmxUfXAWbiLYRTbJnDfD+?=
 =?us-ascii?Q?ap12kdPJLDg6zl6yW7jK5KSpFn5BLHzVMilAMWabmZ66uU3ouF3h2tTZsi29?=
 =?us-ascii?Q?ToTNW8C1HRny1YhSJnGYjp0IoAZTvW9tOlgPG3/W2qgKCEPYkU3erpNI2FRN?=
 =?us-ascii?Q?5QrN4J5e57tIVGRMr+Gc3y3FqpAzl0qid2WjUxgDxLF2cezrDjSgK7EHRVCQ?=
 =?us-ascii?Q?3AGvNBL5u18ucYVUDehZ1PVcSw1OwqiigDjlc9OKKVjTD1KqEYxjmNtGBLHR?=
 =?us-ascii?Q?7Tko9yqvkxWg/HIJ2CbGUzk/p8GUpnBXJfWqZnjCDCyI1/0rsWpT88QU+vEf?=
 =?us-ascii?Q?hgEy59pYO2DXM5Q8SUEP++i7N9SUapaGSVK7TzCKwapMQHKA4L5WwfuynwjP?=
 =?us-ascii?Q?aZCTTbMxBy1fiitm1iEmJj9+Yzu0YbxStqyg+gSmwZXQAsyvEdOk/8IQkzEr?=
 =?us-ascii?Q?iBgthSmNYOlgCBaFGXz5jh2E2j0Z8wRRzCuWiFIUqnS6w4FDdLens/OMaD+U?=
 =?us-ascii?Q?NLwS8NesNKYZI0NJ5H09AYGLAQxpzTBl1P6zDr9r3ILm748qpwu2JjeOeLHm?=
 =?us-ascii?Q?BrcFTRB3BRLZXXm162TmP0JQVcfiYUuKjKLot0mDcp2b7nXVuGcc2ymhLf5a?=
 =?us-ascii?Q?ixbMpgOHyy2hg1Mrk+eKL+CyD/NSW3+LtkLdQ7BRDfRexNEMmJLq2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dz+NeXNbQhxvoEYoFNUpOS3s01gdsTtNVjE19Xvvn/Ci1nG5nXhHGZzjN6qd?=
 =?us-ascii?Q?0YfRFQ+HJnEUuoVqot/z2ZGWTqlxDkLAEJpqVs1pmn90+NaN+SNCCLRvAg/h?=
 =?us-ascii?Q?tT+Dfk2jdQ7nXNeYay7DkJxPxt+4FrApy0hhxdJDQ2SMu0anDndWQD/2Flwn?=
 =?us-ascii?Q?GGRhzJ9Ql78VGGgFdNKXl8WsqHjsfW3SM/DFTNCMnBj9SeAQhrIYOW5haWHe?=
 =?us-ascii?Q?Dod1AGjMWGRxUKW4hvQ5OcOBiAt3fN+vmAdzfoEsTvgmIBj1fRa+R7M8kdjk?=
 =?us-ascii?Q?7iTq7TwKdfN7DA4F1jvX2Tk9dEeRugy5BljuDQO5hcLeafq6ElWXm4GPEnQJ?=
 =?us-ascii?Q?lauUV87KiMywlCGoPdpf7iOz0nUs/BBO0TwtxLLV3Uhf8GbhYCuMqV+aso23?=
 =?us-ascii?Q?Lwcn3G1KTB5v3el9xMO/sz9bDxy6Qa7EQ80v99GVvbDGEv/5Q6NduxpU3zwi?=
 =?us-ascii?Q?3dSka3RDZXw3z7jd0bBLvVAqA7IACMD2zUN2+O4bvU9mEOtO1OykWJcujZAU?=
 =?us-ascii?Q?K1yGI1H1pus51/LioTdljWQyrn8Sk1NAJDqBain8w2feZ/ffBjASMVfCcdEE?=
 =?us-ascii?Q?WbwVH5M/7gIlkKjq89asXapjlo6FTaJ7cu1MDRJ98TEedEUAMPaJ6DLb5rxk?=
 =?us-ascii?Q?EfyyUmMuIrs5uSGwbQNj3VWOeblFDGx698w9ddCRlVtpi2ekS+JKnCPoHzbV?=
 =?us-ascii?Q?HyQkAY9SGxQa6g4v5rDL8HxvayThq9hlAQQuDerqbzXy94yWlpibk/Noys7x?=
 =?us-ascii?Q?YRLh4A2nYbsR+Mnsaa5jLT0BykHRstA8VunhkeOujVDSfflEpcmqfobOHf+V?=
 =?us-ascii?Q?2L6r3q4Q6FjLrch8EqBuIAFBOT9qsz9VyNqCiRmG+ZKQ3phERdXXkwo1nkYN?=
 =?us-ascii?Q?Bq/n8xmmD/rltS5k3XgdBOI8E96wYW0cYB5sYKVJ35h4jR88oHLFczsvgNDR?=
 =?us-ascii?Q?4/zj+jztORR0q2EJQgFY3yhURcT89vXbOFjk4tZA/DW2IE7czFITY1BkgVqU?=
 =?us-ascii?Q?Cl2g6oEBAuQ7Wwf42fgB2k6oBS1SWU7jWs/YCnQc8nxbY0zLQzZYzYJG+K64?=
 =?us-ascii?Q?tPQLAJ2zyN630Jx75H03Y+tXvoHXAf7aNetib1M+5b8jZIyn/TfoEFPGn0RJ?=
 =?us-ascii?Q?8Tu/E9TsK0pB8EjD+D6P99uCJnoy1sfXDw+vQmW97AOQwZZf0XzY9IXXRp8p?=
 =?us-ascii?Q?Hsh3yhahA5cQIDdVfuwNuSDA0Ewh8GWNNZNoFA0NnbllEMyWBSoDOv30MzXa?=
 =?us-ascii?Q?loTtXiEDgcpyS4iG6nn9yM4ii67S4hc+Kl7iwNO5gYkf8OSkgsNZCtASkqyn?=
 =?us-ascii?Q?4rQk8w3PxwsE4qPDD7EWBgdDO1bLmcwsNWpoNF6n6BfXmf/px50r4dGtBFpa?=
 =?us-ascii?Q?WiE7iwY65MoHxUo3Vnquy2VZ4JG3PWMzPbcnglp3pl3Qe8OUXRt7eEYdtfvV?=
 =?us-ascii?Q?VBv6Btxew3AZwafGHDcOraFbGZ7tMAdH9PPNplK/9fU770GqoQB17v/7lSdA?=
 =?us-ascii?Q?OZlgC1bis/evUtE4QgfpZ6hEUlzbBKsLTdDkycT3XLbvVxeWCg/Z1AWA4PhD?=
 =?us-ascii?Q?5lLgkl+3lHXVQqhP80inaMuMKpK79zGLilbkNFKss7xHdkMQcll2rYqEyUv1?=
 =?us-ascii?Q?B7Xt79P7T6MFHW0lIL0VV78=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723950fd-0f27-45d2-43a6-08ddd4a38d28
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 04:41:47.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YF7k6DhIncjsl1HX/7M1g7s6lXB+YeX6HHbPlC83f5jMGcXl3VOmcP08SdE/IMSB9Bp2koMXPVTKZLshWIqjFf5TxOhRn6ut/o3mW/4MmqAQ6bmnTDCu6wzfQ1hhYVZh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Because dapm will not be used on user driver in the future, Let's move
snd_soc_dapm_init_bias_level() to soc-dpcm.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 20 +-------------------
 sound/soc/soc-dapm.c     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index f1318cdcf7e4..53bf6590bd4b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -723,31 +723,13 @@ struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kc
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
+void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
 	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
 	     (i)++)
 
-/**
- * snd_soc_dapm_init_bias_level() - Initialize DAPM bias level
- * @dapm: The DAPM context to initialize
- * @level: The DAPM level to initialize to
- *
- * This function only sets the driver internal state of the DAPM level and will
- * not modify the state of the device. Hence it should not be used during normal
- * operation, but only to synchronize the internal state to the device state.
- * E.g. during driver probe to set the DAPM level to the one corresponding with
- * the power-on reset state of the device.
- *
- * To change the DAPM state of the device use snd_soc_dapm_set_bias_level().
- */
-static inline void snd_soc_dapm_init_bias_level(
-	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
-{
-	dapm->bias_level = level;
-}
-
 /**
  * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 6ee03cf16171..6782a0d6cd47 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -999,6 +999,25 @@ int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_force_bias_level);
 
+/**
+ * snd_soc_dapm_init_bias_level() - Initialize DAPM bias level
+ * @dapm: The DAPM context to initialize
+ * @level: The DAPM level to initialize to
+ *
+ * This function only sets the driver internal state of the DAPM level and will
+ * not modify the state of the device. Hence it should not be used during normal
+ * operation, but only to synchronize the internal state to the device state.
+ * E.g. during driver probe to set the DAPM level to the one corresponding with
+ * the power-on reset state of the device.
+ *
+ * To change the DAPM state of the device use snd_soc_dapm_set_bias_level().
+ */
+void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
+{
+	dapm->bias_level = level;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_init_bias_level);
+
 /**
  * snd_soc_dapm_set_bias_level - set the bias level for the system
  * @dapm: DAPM context
-- 
2.43.0

