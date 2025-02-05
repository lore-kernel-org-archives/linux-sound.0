Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A9623
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714576; cv=fail; b=Qp3QpZ4Orrr4eFMus+I1iEYYDbROiQEzXy8ku2JdjeFPff5WKtMoipBG88cj8EkrFadrLTFa89iL5xEtmo4DRXr1YRs19HrTeDVIyUYTOj99xO7vsg3wha5pNQg/Y2Z5rrIZL/8tw1iIKoygaXMYN6Znxzf71EmSTzpUq/gexOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714576; c=relaxed/simple;
	bh=M7KvZq3HaKsC10kf0x7t26JUqzm2xYQcLuIa0XSM6Rs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=apY38uTFBEGpvTS27B+eoNCp8TrI0cRndPRFNSxdRKkww3amjPLskZvkrhv6tZcaLktiw+m42babokpI1pdCLBeMo4zj6/9PGGuGXFnGMyBSCpuVnRk2Szy/X3goVnj9d2+iViK9xBbFcvxJ4XHCUfvQN3J4xq5p+H3GrNReo58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f7a9ki4F; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f7a9ki4F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD6xuJbx2oJuaBxm9mssbrxJ5ImIEYfxNPVT5rg1IaEo9ec7t48yg/0vGDeRTithnFeyb+2E4popVX3XhOy7ZLiyaBzh+oqWxz5U4XtnnRU5/+rJiZdvt2+wMGHRD+QgXxU4XvEPljXIlwVDpD+XIXkLzkOtStpyGYhAjURbYtBqeDJs92YurLhP5ff2jkwDjNRGngg4WPptuoOIfgNqZm23Htt9/UJJZ9dRvd9Ub1tnyAU7s5DGMCPFpdAcL2M1WubAOSFwBhGQDmy3vpLW4bohH/tnNoBsK31ONLhN1ft4xY2M9zZuhg8wQFEEbbcdp3HfjbWVE3MQwOzvA8FKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFlu4SiIrgs35QgDmbrkGCASX3EegmPiHwMNnKIDVOU=;
 b=yvwp4SjrE8IpEybTzqRU1Bm8dZD5JntFcXv+sdVQ3kKhL20XpjGJZCiAUUiBuhzhXIlA/CUGrF1WWZcCyv/1yPGeMH8zNsAvssmG77SZR1lDjlm7wwpPlOAjuT5fFjnZUs8vPemiaZXdgqfSATcSuPZS4ySptczhvhC3+PpaDfdFooKdqO8OoGZlLo3NnHkTvx54kDkAc4kvYNNLMt7hlumxzyU8LLI76qw42WqrInM8VtWSos6SoZMJZi5cCk0flm1vmWH+r+Bt2FAGnOIeLRdd5UOkD6SpPJ6npiYAAAomwg60qn39yQ9lM8kSfBMZc+GYcAQi1Xk7l4Kqn3HGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFlu4SiIrgs35QgDmbrkGCASX3EegmPiHwMNnKIDVOU=;
 b=f7a9ki4Fagn4b4cV/FikFBqyM8t7UjDWA/U3/zdCK/CnDx4yh75EGA08eTcD/ZE/SDUHcW2u7hluwIWSpvqYZwKNno/UZkKaXE1M0qgXayIpBSA1rKL46tj1A4H7WE3jzf7TSbeOuLT4CLaB9vxgwqAHij+buNkuqSAta6TZ5ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7036.jpnprd01.prod.outlook.com
 (2603:1096:604:13e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:16:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:11 +0000
Message-ID: <87frkt2qlx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/7] ASoC: add common snd_soc_ret() and use it
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:10 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c515ae9-87db-4e52-40ba-08dd457a4b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XsAOg3pbqOVuvHiL5s4k1Qn8k3HKuhCzIYJUg4bmLqthaeb+nyIlhRf9NPgE?=
 =?us-ascii?Q?7xyeUjR4ALXckgzBqhss3KcZrDWsLKox5u+lGVd/GB57M3QJK/waVxsw0HY1?=
 =?us-ascii?Q?AUNV2JXB8n3ieNe2CK+NSkWKrJI+SVQOWgBWk5DRZIO9aBnnJdxFBhfPhqoL?=
 =?us-ascii?Q?HiQtMEJcJNwQPbzP7O46bC7fTrTSqkGIijBZlWa8MFZBqP5gZK4E9OIf7bxW?=
 =?us-ascii?Q?KUf0U3w8BzNh5r2oj1KzBtLk9m/R97JRr1bVPh4vjVfUsI/tIIKZFVkHxEes?=
 =?us-ascii?Q?nFQLxIMoSh0uKSp3s6SdtYUiwuclJkzzX0h3VnluRxLeVn2HtkSp/Rtszl4j?=
 =?us-ascii?Q?CQTU8g/VKUEbAgKXpwGsd0ecp4o7UTZmn4/+DgWkq4aJWfKNbykEUzhTCJ6x?=
 =?us-ascii?Q?xS2DQN3Vey6qUU1Dq62Wk64MLHtqxzFFpeyel8w0B4C17egqgrqxT/b6z3Gc?=
 =?us-ascii?Q?BgJ022OvSdTJzSzv3mX6tH1RZKqdyx0TuY2d7Ea7CYiiDPGwp8EfEuMXp4ZL?=
 =?us-ascii?Q?Nh1h2oMUycmHGTG1fuTQ9qWyU+oPy0eGlQR4ROnzkb/qII7wT8hET8XVPP1Z?=
 =?us-ascii?Q?NoQVPMsAyI/7G4A/A7SsUtAZqM+bcTEqz7XtMWSQy4+vW1fahqADTEey7Ui1?=
 =?us-ascii?Q?i4nGcq6F9N8MI01Y/pZ/dShcxyNsvL8ImwNxmAgK+gnekSKD2N48q7qCRfVB?=
 =?us-ascii?Q?oUEIt/G/2nbtDDIuu65MSQLrDFaavttEZhVSLxK7zr9Bfn7/qlEE7xrc5BOY?=
 =?us-ascii?Q?6mQ2LJS8VPcm93zV3gz29BrZQ43yKylUwz323dwDbzMEkSSGSWI6cTpncK9L?=
 =?us-ascii?Q?3CO0ZITVKS95kHZGkRJmznZ5/LvVIjKuHm9rUtl2eqK8ht3/VF8kmTzfeDDD?=
 =?us-ascii?Q?hzl1HDxcRtA7vFVsiY42c+i98mWwD9akkYeYiFGY9/ZW+Er0gW5S7ZVNou/1?=
 =?us-ascii?Q?kMuF+z397dh/qbRmEwdWEEuI6daEjkc5Vl0iiIahe76/H9opedfRVJBCOpv/?=
 =?us-ascii?Q?pqz8DrTNMydllMIW9zi1AbABMWPxD9rUOKKV3qDWbVGLWU2C1f0ZarN+c3Rm?=
 =?us-ascii?Q?694vyANLGe8xxEmPgJ8PZ6iedYUx3b/XYYHh2lFsaxiVkEW3/EHhxhj7EuFv?=
 =?us-ascii?Q?Q2bqGCTU3lpoK7N3NtnxgqrACEKd/69VGQ/3sABXgpKnIZHRgN8XXP9AoW4z?=
 =?us-ascii?Q?WpKEgrYst60URxlrgO37TVNXl+UCr65xhtEnIicTt+wa+UW7L58j70WIam9w?=
 =?us-ascii?Q?Ah/PAsuNapt39L6y+HXSTfH3Szt6+E2Rwb5x7j/YP9S8QReSeijhb/sqPvtj?=
 =?us-ascii?Q?JjxN979z5nltEv96L7NYzOOs9Cdw7SF6M+7XiIqzoabl+19FPP6dZKq5J8aE?=
 =?us-ascii?Q?1TCDNqT4d8ibZC0nGRcUkLmfXSWVlK9AOfMD6yM7uj5ZT3g4b6QRA8tnTROE?=
 =?us-ascii?Q?kQ5V7kDDdCgC+T/nwkrOEDzQS4Zjri/S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GRxcfWtg0klNSyo0xdalXJbuZBpdU17ZYYG7I/mvTGUqcC1TPAsxsuy1oKvM?=
 =?us-ascii?Q?UpcDO5NV5RbBF8/nADCoZbcrAPgv7QQzrISzAIMT5+WHKpO9We7BM5asLG69?=
 =?us-ascii?Q?ySWuwSHVjDs5FcvAZIVslHuDwYF7mfe+ows/ACIQU2MJHVZLUzhUBxN2w7h+?=
 =?us-ascii?Q?BnJf7dYgBfKw+e8WzQQoz3M61r9iwrmxJ/pmwJU3XTHxBRVqj/NqgeckdVw7?=
 =?us-ascii?Q?cy2xXVXlvMTHTfY6TiKMSozFGENJPuIHTxPWOgikyY2Gv7/++e5bhGwgBKI+?=
 =?us-ascii?Q?jJgeUTjEaigEyNFXG21G2oq3JnKF7FJLD/yoVieWT2uOfle+B0XSS1OJ5pY6?=
 =?us-ascii?Q?/G2Xi6Hb0ii4u1NH3dABEmpGt9lnYOgQOBcM+NmRyoG2JosFH3wcJoMDMT4V?=
 =?us-ascii?Q?JO0iuEfvYHFl+zSAn4t4w8iRiDr2T5eWzTdxOgwC/DZO0NWrOIB5WsXnkH7V?=
 =?us-ascii?Q?OYPEA2KOIM+0R0LLIDINTuaOSEpyJ95Eg+1bjUYN2yXasLF9sn4RpP71pvkh?=
 =?us-ascii?Q?Uh/TQj0hMAvMYULYgFzTm2SOVkiZFS3uHQMS0ioAnAXd9m2GwUi8bWuEVUh1?=
 =?us-ascii?Q?HOXLT9EBA2c1FteSWHoVbXUQrjCDwVJ5ho86GQlOLl9oXplm0IfIje382fXr?=
 =?us-ascii?Q?P637+u5EJhatMtYvsZZTrtLWkDfAo6ExiW+QLh0nFAPqwGmmoyOy45C2XV12?=
 =?us-ascii?Q?OODvKm3J+5IJdBc5RO3cFkDA5vK9bIfEWwcA32wkfzOH8qXIRJpmHmEt0MlK?=
 =?us-ascii?Q?Idi8LhSIAyWoGA5qpyYWnZmCB5KVCHssU2QlTQ/ct7VjElrSxd1ps3icq4TP?=
 =?us-ascii?Q?wlAe3mr/hljQVzP32CaVs9neWnQkPwTkZsSJHJVyf9nfNvcs7Llk9hqnUrci?=
 =?us-ascii?Q?jD7r7Oz/SKcTNQdecm1pE6DzXPJPx0mB4eYDjrbq5ZCxOnskBcmRbj5uhfDO?=
 =?us-ascii?Q?UL9W1PVbjgiVS+yYuPULAFE+evfFolmgme1PPsqFSENe9xkPoeJ2AjlFOZ2k?=
 =?us-ascii?Q?1paKPe2c7AGo6a8pvw4oCAgopVWmafamtZTcFF2Qw6HaZuYNen0JqX54N+L0?=
 =?us-ascii?Q?5EAQtnAY0zPZ2HZwdSiv1jPnrx2VzwDlq2aC1+ixO1YfahcjERmZ+WbmYxXV?=
 =?us-ascii?Q?VFAj0rLhtYvzP+4ymHYG4UhrChsHXUcIsBJ3s81mm4ETPz3POHS7PHWoi36a?=
 =?us-ascii?Q?HNFCI5fZRcRFAdzjCE1M4j6b3rzwJ/7IyoQyFjC61jF71LbyuOa2CUAKUisv?=
 =?us-ascii?Q?wStrVK9ie0Zlzefw9bR84DiaerGd7BQ5TXOgr2YFNqeGtXDRznAa+7PPRhEq?=
 =?us-ascii?Q?E3J5fZfrleYOXxDm+/0t8lI0c3KPmsezlQDBG+mebr3I7ThcWCLH0InHJ4fy?=
 =?us-ascii?Q?iqLER+bjbyYoPSEBUWe4UgyTCoXAzwVRGESW7j8M4YIuk70SIkhuCLNxNdCF?=
 =?us-ascii?Q?cv/l8XeiaVXxJHrrZgK0JtFYfH6aYldsJaT9pJzTyAs80Gj091n6UHPs1W7t?=
 =?us-ascii?Q?FDRaJ4zeq7sAzmeGoHIixzkeBtAtcxz9vn/lJFl9wzyzHJt5hMoMtKcv/Cbu?=
 =?us-ascii?Q?J0HM71u6nXJTQ2UVV0jI3fFC7k+WGMgy3LzqjCgk+2+0Tic6B9wD2XKrnrWD?=
 =?us-ascii?Q?MCG8790b/4N8Ou6nSr0ZVdA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c515ae9-87db-4e52-40ba-08dd457a4b4e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:10.9207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2X0ICX94i1cJdds9VRMMAI3qxjnShRvA3W4flJx2XlW/DWVl8atuBoEW6fORgScb7J/C1gA/zwhvNgKQPcOxyVrnQ41yysmoF4kGnLf9uvDAgLWRolW4t3+RqYyAjqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7036

Each soc-xxx.c is using own snd_xxx_ret(), but we want to share it.
Let's add common snd_soc_ret() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h       |  1 +
 sound/soc/soc-card.c      | 14 ++------------
 sound/soc/soc-component.c | 38 +++++++++++++-------------------------
 sound/soc/soc-dai.c       | 18 ++----------------
 sound/soc/soc-link.c      | 18 ++----------------
 sound/soc/soc-pcm.c       | 18 ++----------------
 sound/soc/soc-utils.c     | 26 ++++++++++++++++++++++++++
 7 files changed, 48 insertions(+), 85 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fcdb5adfcd5ec..16e4e488521c0 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -539,6 +539,7 @@ int snd_soc_calc_bclk(int fs, int sample_size, int channels, int tdm_slots);
 int snd_soc_params_to_bclk(const struct snd_pcm_hw_params *parms);
 int snd_soc_tdm_params_to_bclk(const struct snd_pcm_hw_params *params,
 			       int tdm_width, int tdm_slots, int slot_multiple);
+int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...);
 
 /* set runtime hw params */
 static inline int snd_soc_set_runtime_hwparams(struct snd_pcm_substream *substream,
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index e6eb71b3010a8..235427d690617 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -15,18 +15,8 @@
 static inline int _soc_card_ret(struct snd_soc_card *card,
 				const char *func, int ret)
 {
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-	case 0:
-		break;
-	default:
-		dev_err(card->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, card->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(card->dev, ret,
+			   "at %s() on %s\n", func, card->name);
 }
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b67ef78f405c3..25f5e543ae8d3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -13,32 +13,20 @@
 #include <sound/soc.h>
 #include <linux/bitops.h>
 
-#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret, -1)
-#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret(dai, __func__, ret, reg)
-static inline int _soc_component_ret(struct snd_soc_component *component,
-				     const char *func, int ret, int reg)
-{
-	/* Positive/Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		if (reg == -1)
-			dev_err(component->dev,
-				"ASoC: error at %s on %s: %d\n",
-				func, component->name, ret);
-		else
-			dev_err(component->dev,
-				"ASoC: error at %s on %s for register: [0x%08x] %d\n",
-				func, component->name, reg, ret);
-	}
+#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
+static inline int _soc_component_ret(struct snd_soc_component *component, const char *func, int ret)
+{
+	return snd_soc_ret(component->dev, ret,
+			   "at %s() on %s\n", func, component->name);
+}
 
-	return ret;
+#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret_reg_rw(dai, __func__, ret, reg)
+static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
+					    const char *func, int ret, int reg)
+{
+	return snd_soc_ret(component->dev, ret,
+			   "at %s() on %s for register: [0x%08x]\n",
+			   func, component->name, reg);
 }
 
 static inline int soc_component_field_shift(struct snd_soc_component *component,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index ca0308f6d41c1..7c4c9127e5f3f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -14,22 +14,8 @@
 static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
 			       const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(dai->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, dai->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(dai->dev, ret,
+			   "at %s() on %s\n", func, dai->name);
 }
 
 /*
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 7f1f1bc717e2c..02fd68f2e7028 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -12,22 +12,8 @@
 static inline int _soc_link_ret(struct snd_soc_pcm_runtime *rtd,
 				const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(rtd->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, rtd->dai_link->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(rtd->dev, ret,
+			   "at %s() on %s\n", func, rtd->dai_link->name);
 }
 
 /*
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 88b3ad5a25520..a2caa146cac2c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -30,22 +30,8 @@
 static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 			       const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(rtd->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, rtd->dai_link->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(rtd->dev, ret,
+			   "at %s() on %s\n", func, rtd->dai_link->name);
 }
 
 /* is the current PCM operation for this FE ? */
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index aa93e77ac937b..e8958158acc11 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -15,6 +15,32 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	/* Positive, Zero values are not errors */
+	if (ret >= 0)
+		return ret;
+
+	/* Negative values might be errors */
+	switch (ret) {
+	case -EPROBE_DEFER:
+	case -ENOTSUPP:
+		break;
+	default:
+		va_start(args, fmt);
+		vaf.fmt = fmt;
+		vaf.va = &args;
+
+		dev_err(dev, "ASoC error (%d): %pV", ret, &vaf);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ret);
+
 int snd_soc_calc_frame_size(int sample_size, int channels, int tdm_slots)
 {
 	return sample_size * channels * tdm_slots;
-- 
2.43.0

