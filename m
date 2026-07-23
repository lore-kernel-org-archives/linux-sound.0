Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC573BB69D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788501; cv=fail; b=al7C0BkhZQpQblzLH7m6hpY0jCAs8UefuPYjIxcmxXh7YdmIFIkLeD7cjbWaRK8zCGVHz53VLwWFt2nw1XaBz6vSH2HbP+Yie5wSIJBexc4vxWkNdEUZQpDDIONGdxvg6b72DX/qr+Gic24YZCeDjjQ4+nrSpXKFuPTAyiuLHcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788501; c=relaxed/simple;
	bh=P+UV5G2YtvEzWoJuo3YuJf8fcjSbhOi3FvuMYCnasWE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jE0TshaYRB41iUIg2YODvJG6BV768SDQHHd3Va0kuNcGju68rGxTDCulNJVLQX0fe50xWb3q+sJm1KMPb6//uA0TxPhJzzB97aPzsRmtWmDERKyA8OJFOZPuoLnU7BVNPDYvSJjMQnCULjhdvB4ac9cKxHJ68gG44BAoZvVb0XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fKD1IWah; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fKD1IWah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWOujJu4PhjvEAvOTfUYEONZlboS7iH1vm6WQWr2G38NmJm++jc/HnZv69+wctqAiN+jqIzSmzM8uDB8KclOwLou7ggi2fU/E4/QFwS5AubTKAg/o6o4fmCYt7/07A7yg1jAYs55oIjn4z2keHZXRwEy58Ija/qb59KH/QHtt5PWjMihWEfm4ZdRKLjcZDJrMs9s9VilVxg0m1uW/N/rbwIWJLuwjzCFr0N7F0rn4rrIaYnxvq7/9kOVvklVpTyqoihn6DrJuT3R+kpOdsO/owc+gu7cPzaHgUpW7zJUP3PywzNGSsYDhFYqMqiFwrFNkMidcFuMukU4Kj6VfFIVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFE6k/LWm9yIgUic/V5Xi13sRpMsMaW46xDjddiodDY=;
 b=ODx2R6FmCpi7kq4yhgems9CHUMqlnawd1Oe8OK1ik8kz8/kV+f3eLTFJYoGuWALs3x4PAGO9NoNDc27aA8po9/7h2aRCdpTqjZHeWTYMwh0/WaYadY6N4BKuDkD0WAHNF9Sy/Y6nVImN348DeQ+9+rzDW+zf+2HVTXP+1WiLkWMCGRM2x3NLbiHgor6EIzwwrluQsZ5OsCNGBwSPJo/sKzcfPSjFsLyL87/l8WHdYE4uaAAv/f4vmiPgWaKoyth6vuGd6yjS8WSGePztRzouX3Yp2xfPsHUczpUNFB7vZzp7nohKOHEyHEA73J5T/q8N1sHHq7jdXOFtJ1BK7nJ5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFE6k/LWm9yIgUic/V5Xi13sRpMsMaW46xDjddiodDY=;
 b=fKD1IWahcaqI8JkQ0W8OXQyVJs2y+35wBenaYwO6WpYpw8dr4TkaWTSbkR4H5eZgzJ8DzRoaML6imD67PV4ZzAqr/HZueXZal7bnf/tVOlAEPCpb+WAFP7JS0XyXmueXj+oSLnnIbUsj9JgyEB4WLpAgUJbChKIDel/3nmD2p/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:57 +0000
Message-ID: <87ik66rz73.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 11/12] ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
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
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:57 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0058eb84-7779-4a06-9f33-08dee884837b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bOb6ln8lYDZYwh6WmpkOLNKbjbg0CMPUEzUGIUcYjQ5+D2MVKEJ7isrRQo3YocTtheef819xJk4E+Va0R5YEoYIHpJI/lXAkTvoKESkJs8mVTO5nUKLM49tp+Svq4P+/HCBzLwZd0PKG5v1kq9XrsCqFJa1ZrQL9oPz9yulGTINjDIZU3LNo5AAQedVvkUhDygH75fSr2ds5hNv9x4K65CqrWkQctz2/lqWYIRe0qt/E8dfxg3KzjcB7TCrP44UNLuosBvzWIK14F3TFb4XQGnuvKfnGU5NkNYH3vs5xkQS4ok+4nCDZbCzjdTqoMguCy5T0jSsna6horgiCxeTN7saRljQk6jyAbeBoRHFXsaS8FGgtqE1VrbVsFAguyvyxcCaOVWzAYkXU3kZoI8q/XtI8AFndJoJ+KJRCMUXmGi1F+NRTxV75KcANfva2IRVb0z5PPWclo2fOKUZCRDrm4BTGrw4BJzI9QX6/jnEvwkfbw1BJcPbiiCu9tgAd4OARfkBIBuckFHYdrL2H/SBMXf7L+/dNziIxYG+hMrxjDqXfwavNoA3K1OCrpyHLog8/RW9v3mFL1+31EVqgD5u81xa9n3dpBbObiEhgcsAkHGIisKYr9yx6f4hQTWl1ThxFmceIDfDaJgipQP5EKUBJDNN30O0vJoZZnc7Sea6fW5LS0xg1q6F12IsQy821nzURqs/E4oX4Y/L4l+Lar/fPEF1+pG29FUBafVx3rtLaW1XakQtZLhG1AYr4d2mTY9Zy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?29FmNMGaajqzeHW8CE98+ImEbjYmHyrGCIj3fcxvwg8v9f1i2EhcoifWS5gc?=
 =?us-ascii?Q?fjBcmUr0llfJ8Y+6FLStHDcf0cqz5i8YUP71bkdxn8q81K41BO4aZ+5CSux4?=
 =?us-ascii?Q?/S6ewKiV8qHG41SzcKUoD9oJHOEq3yD9S2AL2rUGpPe34dnOIf52h9pBaPG+?=
 =?us-ascii?Q?BKDQjKqFNu3SVfHbCF1m9wAYb315HS53+frIKFBr9DFy57Ck60g9DVSN6HpY?=
 =?us-ascii?Q?n7MRd+0qSJmDQfV7Nn6HHKW0XJ1OSscMM+omV8VcKHQRMteudfIJYE01oIRG?=
 =?us-ascii?Q?5NbDgwY+RhA8O++Gx+GzQqvojhnliIMaxh+o28UMjdvAwbPiLq37/YVAqKbt?=
 =?us-ascii?Q?1N467H476BS1lmejrj0fnkGYTG+pHsLeZ4l9L8Ru9d4mBK4pdxWz4+IQga0m?=
 =?us-ascii?Q?ZjCjccsJJezxuOffVFUPHSSxs00+2GW+8FBPi7fhAbarrKRk4ujVuXiFJk0e?=
 =?us-ascii?Q?neNjMQ7qC5TwIpGngtjAMOmeOZfHesLkTqv8QDRfQE9wayVwY0eBWe6YUrnr?=
 =?us-ascii?Q?wW3rCKtAoyK3wMtTbdZclriYMaVYxeBgrOu3Gd3VtCjrz3mLdVC+x2TOOHcp?=
 =?us-ascii?Q?+9bQckZTpvHT1JaiULswhmEAzEszmL7ytOB6t/TI4rfrNlHTCYWwy0xw0HxJ?=
 =?us-ascii?Q?M6/UP72XKTCqiD001G+e70Sa2krFCpbITRDn0aqyaol+gqudK46sVbcU6tCN?=
 =?us-ascii?Q?lDs73Rn3xy/gUbhHcFeZxFF3QNhVapy7k1y4XJbjMlqT28vLjdZCNkSZvyxB?=
 =?us-ascii?Q?6CJ2a8Lo8BwXcNRQH4wpkdBteZXL0ZMLFEK8vDRIEGiLm2g1CMm0dlUIfXXV?=
 =?us-ascii?Q?7/nu4C6B+uQOvM5h+DP80h1vj2F1/aXlwydUY7a3kSjbSx11K/wg6JL90sJb?=
 =?us-ascii?Q?WwsTWsGMLruzwkNcN3bzfD7Uxabn9+BQQboGGy1wXg/yVKa6293JdYbSlpO5?=
 =?us-ascii?Q?OwR/AcbvkEW2x0kFI7QFNcQwWi/SqThgA/k+g9gddsu+S5ycb19NzvZAt/6M?=
 =?us-ascii?Q?g8UkJh/BMjfkrduhlBIHT/uSnh9oKmJV+ub1LrQM2BF8JojzfPJdtBT8Jd/k?=
 =?us-ascii?Q?MmlAMDm4stePsZv7gs78PJ2T0ad2xdloPiePXJHyfKbvdhdz2fi053+H1zRn?=
 =?us-ascii?Q?swrSid/VjC+S+yR3X2Byea6n63U4PDPrz3fLIuOypDAe1fHis6w5YfJhMoFd?=
 =?us-ascii?Q?+tM0uupqPC0Sayaw2CzlrkT0CAz3VI2662N2IXbDIEnUcXkAaUuu9aN04u52?=
 =?us-ascii?Q?ADuXwMJYgWlH2pemrUKiCvC2r7pd+9SxDTAny1da4C/S0TU52ShJ3whKHXLx?=
 =?us-ascii?Q?QnU/HvJNPwgUy5UJOCwy7udYHVLqq12jT49Bb2Mju6mX+mAlI2MQFxFSJ8J9?=
 =?us-ascii?Q?wHEJOwE9f7s9F5q/6YDtzGnuGvFFR+Dv+E48VpGFfA1byGahTzE1OmxotfWB?=
 =?us-ascii?Q?74Bq7Dp1i4fhXkHPCZplzftE3S4le4e7K9pdeA04oh+ucEAaM1N/0ArhDv29?=
 =?us-ascii?Q?MCpXK7yrUlRTd4JsAuhi6fIBsPMPX+8kxqm5XXkiqwjtevrkob76lnHFpr7L?=
 =?us-ascii?Q?FNwLQt7IzGjQ10mY+v+t9da2Q/veNQgK9zdlXTgG5pxK18dj0bgG56M09ruY?=
 =?us-ascii?Q?zD1r2ZNtFNxk3OVJ8OlLHDHzaftPdNoRNaxkH6pm2XFNhu9d9F02x3XsBj7J?=
 =?us-ascii?Q?w3mPOp1q2lv82xyZ+cWYZRNflvMo9wA3gDtGWZ+sSeveFGsU8dTVI//UIqdE?=
 =?us-ascii?Q?RribcuDuRebfklmxZQ0NiPbTUYZkQomxLwDDQN4RGz4edVGi0Df1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0058eb84-7779-4a06-9f33-08dee884837b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:57.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRy4ji6XNbF/QEzjZaXc7yeRfr7KJZM9tJokcTCPsisItrkVuEJPBbPVKMaF/GvfsNzWb+MBD0gdoOiQFyRvxqkQBmlRtM9E6Z/lLMF4sUH9RijCMJyY0WD+PP/yyVsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

No one is calling snd_soc_component_initialize() / snd_soc_add_component()
calling from driver. Makes them local functions.

It renames
	- snd_soc_add_component()
	+ snd_soc_component_add()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  6 ------
 sound/soc/soc-core.c | 18 ++++++++----------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index cb0de41e2ada5..f46b2bc2a022b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,12 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev);
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai);
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3b1d18bfadda9..f1368bfe3fa4e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2702,9 +2702,9 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
-int snd_soc_component_initialize(struct snd_soc_component *component,
-				 const struct snd_soc_component_driver *driver,
-				 struct device *dev)
+static int soc_component_initialize(struct snd_soc_component *component,
+				    const struct snd_soc_component_driver *driver,
+				    struct device *dev)
 {
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
@@ -2730,11 +2730,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
 
-int snd_soc_add_component(struct snd_soc_component *component,
-			  struct snd_soc_dai_driver *dai_drv,
-			  int num_dai)
+static int soc_component_add(struct snd_soc_component *component,
+			     struct snd_soc_dai_driver *dai_drv,
+			     int num_dai)
 {
 	struct snd_soc_card *card, *c;
 	int ret;
@@ -2773,7 +2772,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
@@ -2782,11 +2780,11 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = snd_soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver, component->dev);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(component, dai_drv, num_dai);
+	return soc_component_add(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
 
-- 
2.53.0

