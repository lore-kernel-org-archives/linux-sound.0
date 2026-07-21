Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5D32B103
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596653; cv=fail; b=NCxqcmbVbGUqt8KDEJlX2K7WUJ1WEk+FPaVmLVa3HYtcGBc2aBMGN0zdFyq44SxmRUu/06Px/Oi+u0nFcDr1eyO860oNhCnxPFqjZnYr27Ac2XILmebEh7ONic+ueu63QYTfJ0bhdQeirfpa9mCuDsCZloVveJtlEoypak/crbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596653; c=relaxed/simple;
	bh=/2yoTJiuKGgxf8RBVinqHdZh+I2OOmA3m6CxGXjIVdU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t4eVtJ5xV5/Cki7HB3gifDenVg0QbVTjluOCGr3Pa8rpwoL7BVZgfZVYJ9L5Hl4Sk7bl12+WAVVYxLwXuTpqxs5NpJtOZVn51pHdRMYI9z0ZG+A0Y7/SY9UJzTr43Y70vBziLES8ycBpQGCUodEnhbGVPnbIPzSmX/p3GTKSKkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OoBA6Mjx; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OoBA6Mjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bew3wZolDpyeaitRR8cqrzwSNWR7H8Gr3VF+eQbdDJspDME5y8Cclmw/okSaEMhJjHGpx+JPAnhkiOrr0GnU8G/AB7whmvu7bnVOMnClBCeBoxGeL/tsRPWCsouIF7ud2KrfmCDvJTCeuqcQhdx9Wlb0Ug+lojVPwpsmeZ2i5jN0BOf61JHjydNUMg/wyocbUQYTYLqAW780ZHF/utuIhhyKKJJkVHChFdnJCS6/WnZ/tdsxv5aPCdSixp97+A5Dy4Zmk7f6ed6qQbaFColYirbWkLte/YSMf3HM8JeIA1+XAhFwmSsiws9tGJrUl0WAkABEFalo079GzlQVvp+WSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lj/MRlAN74SQoNwMxho+aRMSUlmwWRQ7lsshLskClg=;
 b=spolAt3fjY8Dob8im2ZV8opmdDWM5W1QwDKwzm2wIGcH2r1+QHBtSEZImWPvH12NnFti2LZQK2gVRYE0qFzg1LzJOGwPR01FRof0x8Sga0aKCwQLNx5ApqiJZKT/ZNwBYAi3bhQkHm/XLw+mIYF2vlclOiDZPOQRsNs+pfiErTbDQSyxZTafFXYY4pO4QpnRlK6vtV5sfseS++gsuMlKdOKEnr4/fZUzEWOvLFI2Of/Xe8tj18oHfrq3R/31JjoQhIkGdaCqojfTWgeEW/cW4VlbuxGNDrltoP+c3L0PA2dQgo83Ji4OwmvSz2nbrlIDWxRLAUKgv+O7dLxX4kK6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lj/MRlAN74SQoNwMxho+aRMSUlmwWRQ7lsshLskClg=;
 b=OoBA6Mjx3e7r9cEcAF6aLSzmEirh5Jcg8izJaco69dafFIJKzriyeu0E2DJYwoRP9XXu0Ygt429EhKJ9U5PkrMM0bE9yZy5MjUfssDBvW0SO7LmvVi/faP1ybZplWJx3UYtYnqZlUKv3X57vhGEC4O45/ccRSwZGiJnKMiJb6jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:28 +0000
Message-ID: <87mrvljg47.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 03/12] ASoC: soc-component: add snd_soc_register_component_{c/d}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:17:28 +0000
X-ClientProxiedBy: TY4P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d4e45c-fa2a-44fb-4ee3-08dee6c5d4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	q+M1r8i3D2K5FPrt8N22IWI1nlsXB42bE6hMGyYakR63uLxha5zx+CZwTbs92GsQPWRhPcDgILMJjUIrPtfBqI6WqfUW5RA2k/p4a1ELHeiCpwU+rq+HY8jyvHNQp/GjaE2uSsJssIQlLSEWBS+R6A7ajxqdgXpveByYdAIC0WYHt4VyoqQQQzqRfj8vB8jV9IXSs9G0mXW4Vrdy3x74gS5OzemYRCI3POI+RTHS3ijFgVgCSgJ4rYISo1t9wp3pOCad6XZc23vLClhgszoHwYKYHESNY5FZyMnl09SPwdCUSimgapHOpNslBB46jWzn/yurf2WxxEHVR4+VWTYi7PltaP2ScaSbYM+6AWAKnDa094Xd4GVZacNhqenzc9YgEA1KZWyvknDHuf4GxnEnpkK5dnQuHQcLPd18jPyVdw5OC5+RUG6fpJjzVEwWZyeFX07w/yVYZlxfNQXqaA7cJoakJHzoEVS67x08GjLO4mRAxp9VMinDCQnzYWLg9rFUq4SdRiBmTAzfypVgSLDy7I8VrEw6GZPQRrOexOBhuyPG9aUVime7qxtzdhotnfHcEhYAqVoYyRN5PA0YVPGBuyJ9QSQupVvfzryfz85BVgaG3yE4fGzzVd57Zm8etx7GLleYJlAYZmQR8oC3NLGA/MAykFhds4cRukj0EeEVcdI1wxx91LmLQvjNnQ7c5KxvXyHuYtTgpsL/vbZSs7azW9OgqM1qbAcTQFHjbTqIqmv7MDnDuZ57t5FggKm70lZE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mLawe8BdTizgd7FLzF/ilWQHI8TT6k1VGrufeAXRPgn/pmP6cyfk89MIEgsF?=
 =?us-ascii?Q?CTem+qrqjMt+XSNq2ivDJ28NozrV4ZSw9aSKNORgP+mmdnms0905D2j/P6TO?=
 =?us-ascii?Q?9CjN/Xt5cCNhzx+wbef/gBFYJSNAyK0wIqL0M5PUK2qI2rEhaJ3LGElme2Js?=
 =?us-ascii?Q?p5orxkMUk4vyAeMrSXoY+TdcQ7XPXyksoYs7uZRy1DgE1PtCLn4c6KKe2eMr?=
 =?us-ascii?Q?VA5lBOO1SKzSbAyl9sI540w5BpGu98OHg9fTQlU7fT66zlyG5tONRDhKOGr9?=
 =?us-ascii?Q?q0/rocr9byCy5IpiSyL0Dv+SCrzHAB3bENe6HIaMbN4RXKl1jhDmce89v4tX?=
 =?us-ascii?Q?UvH0xrJ5vVoY1kapk+dRzD4c7lGnoWCKVP1uZgOlDFUzOTUf4HKv1U3cPBZW?=
 =?us-ascii?Q?JtSa1rJunRMHVFDw1NMgYnjZ6mS9BJLM62wpNKoHkW+nfGhcnnLdxr01Mky3?=
 =?us-ascii?Q?Qpua7km/Z7OKSypoZmWJshOy5PM0T0E7HJzUVY6HrZ5EcG+qKUi3Ldv0qzz4?=
 =?us-ascii?Q?h8g35ddxWxGRVu5xDyr4AMNZiHqjMEYJb0+qtIAqmm9Ud63RUohjaC4lTOoX?=
 =?us-ascii?Q?AHcAMFnCWiXG8r1pSsW9+eBL6awGjRoYzGwpUj2HCokVB6ADe5L8IjFhZ3kV?=
 =?us-ascii?Q?lRlyL9yAqYfZ0gd406x9/s5D6mFLFiUuJJd5+aLKmLT8bdY4gqDcXJCY2Iqd?=
 =?us-ascii?Q?S+qm2MZuSq4HeLhtyltIuqA5AMLLT23/S+r0fbEr1a/+rPRb9ljroJCtDClp?=
 =?us-ascii?Q?E4ZFmJ6IbsGsmtkpPIAte3JjJc3GAZvTmUcpvrQWY5Osg2EmNAgbhX17jfGS?=
 =?us-ascii?Q?d4qnLfiiOU7lS7t4mvmcaR2z0Ewsxg6MwgNMwanzWDDFyZMt9fTXF3hSKlIP?=
 =?us-ascii?Q?BZ+BFJhynBmwvWAZiqfajr9VWkmvmEtFnHUlVCJEiUYpSaBwkVtGyBQlAgR+?=
 =?us-ascii?Q?NFvLW/7eSFlV5X7MKSx8hIuOutGGGcQaWfKXvlPo8gib8okcaZTu0vH4lXaz?=
 =?us-ascii?Q?F+iouesKOmXSxLd77kOG/BJdTa1YEGje1Sp+sEDJdlTdlSjD3MAcJvp6b6Uz?=
 =?us-ascii?Q?BtAs9apqEkPHKK1FHQTJ04SoY01wKNKthgEsrxd6suw77hmSJ2e3L4RtOLIs?=
 =?us-ascii?Q?ngoqkFMml+9/fvlz6VSgvynIig3jEaaOwy286t7DU9h4Qbw4mzqzyxsV330k?=
 =?us-ascii?Q?3uqEO2G33rFRqNjghOa8YicHPX9ROrkf/V1X337k+qJzOOaO8jfZuvaDYsAs?=
 =?us-ascii?Q?IdfTMGMTQQLUIfkXfH07X/UaxX+mRvTUZuQ+F8Xrz/eC5bPBFWyAjM8PffHM?=
 =?us-ascii?Q?XJLW1YZkRgZ7/enCOGIum8ylEYX3w5sPbQdbRVJeN8vIjp1AMRXen55TJlsH?=
 =?us-ascii?Q?rFGKZCeoI6dGNfrmNAUhCOhxEs8A9m9Y0RWUW+fQnEsCfctsotVWU3ziFXMF?=
 =?us-ascii?Q?Cm0UoCY6jVFlqbfU85UnuqDLJHmZeb7sivQV17vP0vCPtWvc4+6NFVtE1cnF?=
 =?us-ascii?Q?fZgl4otXTAGZvbj81B6fGGBjvplKyVXPAbulOG+Et6D4DCvKpY36lc0dRIWv?=
 =?us-ascii?Q?gLFcjQFh+0QAMSF4q2nCEfYwVuDP3zuipbBNAmc31acXH9v/bKr8JM5ltrlT?=
 =?us-ascii?Q?ednuBcUE3bYTrom/zqLgbYJo+MglvIJnp7SQW8WguEAjj+7HwTZNhPEeayN5?=
 =?us-ascii?Q?E8kJvaziWNFPv2ZEi1rVUMfA2OVsDYZgtd6eK+n6vSVktNu08UUNBvu5EqDM?=
 =?us-ascii?Q?JnLXgmwVXonwriUFrxTbIzQxDdVGA56cB9I5P+4i0fnVfXfuLxBD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d4e45c-fa2a-44fb-4ee3-08dee6c5d4db
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:28.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQX6FefRLMIrnbEQtB51ccxowfEipnNR3Eo012/X9LCrsg9zKEaTa61RR1DBhkJp7sBMxwTQS3WoamwIS4vdTZT9DDnxQpSmYcHnnml1sZEts/O7YkSLxKQbdfSzfTkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

We have snd_soc_register_component() (A), but we can't setup component
specific setting, like name, etc from driver, because component
itself is allocated in that function (x).

(A)	int snd_soc_register_component(...)
	{
		...
(x)		component = devm_kzalloc(...);
		if (!component)
			return -ENOMEM;

(B)		ret = snd_soc_component_initialize(...);
		if (ret < 0)
			return ret;

(C)		return snd_soc_add_component(...);
	}

So each driver needs to use snd_soc_component_{initialize/add}() (= B/C)
instead of using snd_soc_register_component() (A), but it looks
unbalanced with its paired unregiser function.

Let's merge (B) and (C) into new register function, and allows component
as parameter. We can use both

	snd_soc_register_component(dev, ...);		// already exists
	snd_soc_register_component(component, ...);	// new function

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  9 ++++++++-
 sound/soc/soc-core.c | 26 ++++++++++++++++++--------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 10ad80f930c2e..cb0de41e2ada5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -453,9 +453,16 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai);
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_c(struct snd_soc_component *component,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
+int snd_soc_register_component_d(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv, int num_dai);
+#define snd_soc_register_component(x, ...) _Generic((x),		\
+struct device * :		snd_soc_register_component_d, \
+struct snd_soc_component * :	snd_soc_register_component_c)(x, __VA_ARGS__)
+
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..3b1d18bfadda9 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2775,25 +2775,35 @@ int snd_soc_add_component(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
-int snd_soc_register_component(struct device *dev,
+int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
 			struct snd_soc_dai_driver *dai_drv,
 			int num_dai)
 {
-	struct snd_soc_component *component;
 	int ret;
 
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(component, component_driver, dev);
+	ret = snd_soc_component_initialize(component, component_driver, component->dev);
 	if (ret < 0)
 		return ret;
 
 	return snd_soc_add_component(component, dai_drv, num_dai);
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
+EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
+
+int snd_soc_register_component_d(struct device *dev,
+				 const struct snd_soc_component_driver *component_driver,
+				 struct snd_soc_dai_driver *dai_drv,
+				 int num_dai)
+{
+	struct snd_soc_component *component;
+
+	component = snd_soc_component_alloc(dev);
+	if (!component)
+		return -ENOMEM;
+
+	return snd_soc_register_component_c(component, component_driver, dai_drv, num_dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_component_d);
 
 /**
  * snd_soc_unregister_component_by_driver - Unregister component using a given driver
-- 
2.53.0

