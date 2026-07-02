Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83A223DEA
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955283; cv=fail; b=bwhi7C2L9EHyFuneFElYS7dmkcf63ZhB2Kq36sw6oyAG7rqNcTQPryPx9aOctP9p26zOHrKJGuoo4aK/ALesWlYKzFZfhY3deyyUKJ+do6SrLeGD2DR7iKoUixVglwbqmtYJ22DdoSoz6wdUd0lKSibh8CmFzU6R2Zmdqp/R3Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955283; c=relaxed/simple;
	bh=483UtLA4kqrV20j8xdDICYkmatTsSE1HfIhLSmPX0Pg=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YAPbw2aIfxatA6dQCixLQXCk0xIRA/W1RIvyZBQkKGNqO/dBG1qhXaS99KRC4+IZCJoXhMPbzw4Su0girSey21mjlQoIgojv1plEjXfCUoAIt+wbItCTt3Mz40EspFD6f3mYjCBzUnTWIB3ckmjkJKiHZ3zlIdY4JDq5o4pECnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gYVhb63v; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gYVhb63v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulEuxHt48fiK/v9VLFRSSx9HmKZCqG14U8IDJrTF5g4SF2/pEN9KMdxhCcl5ieKA0KPVAWpWvr0nuEuapYBCY+s0p9uOzsFN9+1qEmN5A1vhjWOnht0EiwY4ayit2FlPuJDHCfJjcbXf7rj0L2Gku3bRsr2CZTXTTY4fatPVNUGMOAVbqsHatpjOrKCmWi+lIl7/VzGszlSFURcHOvvcA8k4F2Km/Tx3m72geTbMk0n0XZ9KTCrT6FJj0Hqcey/KWeRb5e+XX8N6kmtAlq3PA7xBfGbyWl2WMNGTNW5Sym1vV3ssDDVWuhaSd5qEAPYWuDiC7zzyd6rlbE3HC5MLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMtVT7taWf1RCtWyNgDxWNgtMKZqb+1qmkU9+sSyjo8=;
 b=DFWgK2LpLRDeY9XbBCiH7xGYp6DzJoGvtYc374S6QxulCTgtlWdzUphOjkkpJ6QEGpp5VJEPQhpSnu7qfAs87e0kuo2TJsiLKETVZSflldFFk88sTd1M0RFVdP1gSw9IoBqfLN5BV4lt/YG1hQxCneMlYUaIgQtSwsXssFxQfygPG7S1zOaR65J3RrWywwllCcYXtyG9IEgw3URynE6P2wAVFv+qjeT2mewE5kmjN7CL+HMUHF0Ic22wUpbcPfHKLBu1mmRJhdqIYmIVhM3sh/1y3GX8emXCKrtaMBaxI6o/EIvH5TiKXtfjIVzPEP9fsyoerGwhrHTBRMfYNn3aXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMtVT7taWf1RCtWyNgDxWNgtMKZqb+1qmkU9+sSyjo8=;
 b=gYVhb63vdX3AuLCmfuSsClJvN1DTiulA0H0im9ykZjD6Le/IxALejwkAmPBBZNry+yjClFTIH7emgAco17vcbZxg8oQNw6+qr5eAQ3jYTIbMOlfeZNtnP4VaXQsmEuy6muU0DsqmdF6giaYbS5bg1Z073gILHCWNMDylQlgfyiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB14981.jpnprd01.prod.outlook.com (2603:1096:604:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:18 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:18 +0000
Message-ID: <87tsqixk36.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] ASoC: soc-component: add [devm_]snd_soc_register_component_with_name()
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam
 <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam
 Girdwood <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:21:17 +0000
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB14981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2555775b-5318-45c4-597e-08ded7d837bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|52116014|376014|1800799024|56012099006|22082099003|18002099003|11063799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	SGE16dWVaxqx8+ymeFEsoy72Mjg4HN3cebQPuuFp5F/uKCE5Mj4kCu/ONGlevkTCWw7o0xrMxnxUHP9/swy/jJ6Xql7+oDoV1P2E5fMcQRtchpisohVetmWoFb+BZDt8GRmY4tZTAI70Mjk6MUYu/G1vs7oyQt2A12pkT0VJCK7WVJyIo088YgO6HsvM4KVtv9ytruqLdAvwsamD2fR/ghZ1bd2F95n6uT2LUxatKxyXDd3y4wJ4mAAT1RC2H019BA/pNIYlAmRT1mDVrVsPX+ECmUxdkertF4nU8H7cx2owGkXuX/RwetnMJ1qBYjUPvIbNBkvRkd2anVGLsCE4JeF6Nekr6ib3LGHPTI8LjWM1E2ST7NXkBdH+kFrcifvQFOnD4PwrqAVnAdFoK/8X/w+aqVjb8Qvybva9kLVSF7qWi2GSM5VcS8yjlDHwn/IqceQmFroDO+dLjN3bSGhH0Gr6at8HifvbB9xVUnvEV5EbUjoxRj4mKroS7YedURYgyRwlWu1ZcMj7LRYghBOEwthjvK/tr21HgDHHuE01IBNvXPDRQJb+n+sE9oLDp3DFOMZ/wJzUL5seF7NMQEJSdAwMe37UzoQH6BFTAQbQl9DjECkhD5riK8n2Rk/oJdGNRhQAAS75QUqOyFsp21OS9KLbwMq7CQ6cLzIOvP8YZlpG3Awda4Lc9yBvmBe/YPh7NrEjSLa0mdEGqm0WcxoI584JbGP25NXJqCaQw6lC7xdjDmvaqDs77RoYKYe6QAjq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(52116014)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8omD2QrIUHqTyF+AzxsEVLILAf/iXt5DmHnjUpfADxxgK+bBooAAQSw7nV6e?=
 =?us-ascii?Q?ZyYsO3IvtoCc+vma5/TodfPTOtCg42oZ63n8kQzAVYZ2dlf8flB62QEeebV9?=
 =?us-ascii?Q?PAMaVYKKqGa9SvYhpD9fu8Yxog1btuwJIcXt40oSW5zH1X7S8fawrdgBXgnL?=
 =?us-ascii?Q?oyoTMAc/QnTbyM4sbqYF9LGi8XzyQriKsFPmeaVFAvw9ZfMdXlX461kjjowZ?=
 =?us-ascii?Q?HGRex7hHhptbywG5yvCyFVvR2+TqLCqGd0N5r+quoQ+W70rZGOXv3FOmaqJi?=
 =?us-ascii?Q?VbhjNz/4EvgocbEm5n+hNtNvTWet/raYzs3dCrnykppyYbVj5+F3XpxXrlOZ?=
 =?us-ascii?Q?bk6tfK3Mv+DoXDYiTf6CEEoigBTW2+i1i/e5TQRxj1soGVHU9LGVb+CIyjwD?=
 =?us-ascii?Q?sWrqmUnHXG7ouhAtpTLeb6FQKAWP704MaOqB8Wf3NJlcvLAS7zlx+tWedCBc?=
 =?us-ascii?Q?vJTnWKwfxHqBCI9G/tdOi9VGbBoRAFxuP+qkczgFXfW1c8JM6anMNcfsFZZj?=
 =?us-ascii?Q?Xqtr2fhGzAhHdUH02/aC8lsysL+fpz+jBhT2EC+uTdJu3NcOYizn7qfm1fTb?=
 =?us-ascii?Q?kZpyENrCpIlaxSduh6nxhMhkzJYwdY/ngeom/YG4dkE+WrflVDdsjRXhmAV2?=
 =?us-ascii?Q?dNEZovpPUpSfq7RCLJaSRXZOiwRGbQYHWWcPrB/l84c19I8nSyfQkXddG3KK?=
 =?us-ascii?Q?dzdUKno2fdh8Rdc/QLcXqSnKuivHJwnu+faCDHiSk8E+rGlnxBzzykr+TBIV?=
 =?us-ascii?Q?04VOpVpvYZWYtqH7Lh7jDILvwrBw3eT4nQvdO28AKfQSfuquGmB4qvxi2ps0?=
 =?us-ascii?Q?y2rRQ8Xa8UVVjH8igUSLLeiVwXaGBTAsLPzEZRJm6U6Erf5Vtll4siokgeMd?=
 =?us-ascii?Q?SEI5joPGMSDOa2tc3+NF+S76vkLhgbKmCk9e9p0qsDGw9ELyR7K5TeCOPAzU?=
 =?us-ascii?Q?3Y4LQ7hKyDGTI84LZeGh/vkKwtKqldJlw/dKVidzFah8kG/vKKFZjJwuSrPm?=
 =?us-ascii?Q?ZFZj6fPuaXUw00Wa6j75jg2lMMMEsaYjAkwXS5hETOrvS//gE/EIScR8dDFr?=
 =?us-ascii?Q?qJWvDZ9X7RZh8bfqRNb10R4VZRe9zdzr9qpNbG3ZJ3m4dKGTijSFfYQuMDfi?=
 =?us-ascii?Q?2wcbPK/Qs8g4/uDRpGE332n7VeCCpWIkcqEhTlj5+eNY726hcqpS8lH4xGCn?=
 =?us-ascii?Q?tBaPlo53jxvZ4kDhQhPW1kQemJyPMdGDuxQiWjRsqhSHyRQBdP7E9wCWKmFF?=
 =?us-ascii?Q?EFWuydW9nwpOwlXqeMLSEn9Do/b7w8TFy3jA5R6m2jiTGotSMpF6KfX1LWwo?=
 =?us-ascii?Q?zy41U7Exmw+gVl+ZUH1Q5t8JQnSU+u6O7GIFiLkRJFVAhBFZFNydT59lAygB?=
 =?us-ascii?Q?Ph6bLosoRolGwBv8idi6DXkJPgf9Osg1CdbnBdJvcm6THwj5jA7qk/JswCGr?=
 =?us-ascii?Q?Kd6jojoMDh2bTtIpuyX/c+GaOwuTuoU+dBwaWSivbgY95gh/g/143+ylAid/?=
 =?us-ascii?Q?puf7OwJ2nhHMzfJNxmnhqqYNSTrGc6yJxO+IVBdOq1gxJ6vqWG6a9/rl1xnJ?=
 =?us-ascii?Q?BQtpYxI3oyRkhCEVHW9CwwppXJk2mgcv8I77LW/vnEpJvrJ3y2g/B0W7G1Ia?=
 =?us-ascii?Q?0KeXoxaZmgGlUxHeuAZudSB8ShK1Eu3bdZqCDwNNXub1b0DX4dSXlA8WC2oo?=
 =?us-ascii?Q?HlFjzmB8Smcop/ezSjJ/BQJTj715J0bql8xUqm9wzMSPBMiE01ABQ+7xRJcE?=
 =?us-ascii?Q?JvS48jhxU5V4ns90KgT4J1Npu40mEHVx1M1eliVi2ZVNGPwCmil4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2555775b-5318-45c4-597e-08ded7d837bc
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:18.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWGLrlF9kkKOcz6qat+TIaS/2jONU8Qjw5glM+HPdYe78XE5lBbaG21nwmUA7m1gHN8sSD2i6UooCQReIoP9UWPtVSCMlnKuYvVugx/ZFogLGmI6WO/zflFyztqO0ocd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14981

When we register component, basically we use
[devm_]snd_soc_register_component() function. But you need to alloc
component, call snd_soc_component_initialize() / snd_soc_add_component()
by yourself if you want to have own component->name, because you can't
access to component->xxx.

Add [devm_]snd_soc_register_component_with_name() to add own name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h    | 22 ++++++++++++++++++++--
 sound/soc/soc-core.c   |  7 +++++--
 sound/soc/soc-devres.c |  9 +++++----
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 10ad80f930c2e..c91f416846117 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -453,12 +453,30 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai);
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_with_name(struct device *dev,
+			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-int devm_snd_soc_register_component(struct device *dev,
+static inline int snd_soc_register_component(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	return snd_soc_register_component_with_name(dev, NULL, component_driver,
+						    dai_drv, num_dai);
+}
+
+int devm_snd_soc_register_component_with_name(struct device *dev,
+			 const char *name,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
+static inline int devm_snd_soc_register_component(struct device *dev,
+			 const struct snd_soc_component_driver *component_driver,
+			 struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	return devm_snd_soc_register_component_with_name(dev, NULL, component_driver,
+							 dai_drv, num_dai);
+}
+
 #define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
 void snd_soc_unregister_component_by_driver(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..ec69fd52d9e86 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2775,7 +2775,8 @@ int snd_soc_add_component(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_with_name(struct device *dev,
+			const char *name,
 			const struct snd_soc_component_driver *component_driver,
 			struct snd_soc_dai_driver *dai_drv,
 			int num_dai)
@@ -2787,13 +2788,15 @@ int snd_soc_register_component(struct device *dev,
 	if (!component)
 		return -ENOMEM;
 
+	component->name = name;
+
 	ret = snd_soc_component_initialize(component, component_driver, dev);
 	if (ret < 0)
 		return ret;
 
 	return snd_soc_add_component(component, dai_drv, num_dai);
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
+EXPORT_SYMBOL_GPL(snd_soc_register_component_with_name);
 
 /**
  * snd_soc_unregister_component_by_driver - Unregister component using a given driver
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 718165ba84ac8..e39cef5104106 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -17,7 +17,7 @@ static void devm_component_release(struct device *dev, void *res)
 }
 
 /**
- * devm_snd_soc_register_component - resource managed component registration
+ * devm_snd_soc_register_component_with_name - resource managed component registration
  * @dev: Device used to manage component
  * @cmpnt_drv: Component driver
  * @dai_drv: DAI driver
@@ -26,7 +26,8 @@ static void devm_component_release(struct device *dev, void *res)
  * Register a component with automatic unregistration when the device is
  * unregistered.
  */
-int devm_snd_soc_register_component(struct device *dev,
+int devm_snd_soc_register_component_with_name(struct device *dev,
+			 const char *name,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
@@ -37,7 +38,7 @@ int devm_snd_soc_register_component(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
+	ret = snd_soc_register_component_with_name(dev, name, cmpnt_drv, dai_drv, num_dai);
 	if (ret == 0) {
 		*ptr = cmpnt_drv;
 		devres_add(dev, ptr);
@@ -47,7 +48,7 @@ int devm_snd_soc_register_component(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_component_with_name);
 
 /**
  * devm_snd_soc_register_card - resource managed card registration
-- 
2.53.0

