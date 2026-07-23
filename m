Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FC3C8C77
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788493; cv=fail; b=m9e4hne+XcfdhO7pNiqmBhk65wJ+hlPK1P9BXPTpIl5QiDtCQK3HKl/EKWbSYN3DHkUU6sB7aHtprH4NhlaVm6zQhBPqEHxJTr5IOku9ycd+TyHFGX1iQk8FiqmiArS4+9GWxICM6fhJd5PWmw97E5XmCJ82kpAvoJAGVWU4WHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788493; c=relaxed/simple;
	bh=ll6Uc18Kd7XCYd8OjL+I6rHVUJAbm4T+OagY2YALRAU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fwUzXi7hMnWvcqqX6aJMWCP4lXi7DdI5sXFYuBuyhMhCS3b5ItkMLqXuY8IW/1b38Z6gac/luFHOg86siF1RtcDT+iITD2Z/ReFGzc+DbmUQtyK4JuNKjoMFyu7HG7sR+mnszTOWFun6qH7auNTMLn7s7XNO/trK/dbboGHihAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oc+OHORr; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oc+OHORr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmrx3EiaZsOl/epybr4jQBvzfNVL18nYAN4ChOTqLxHAoqBjX7UdpVgeVHhcwpCShgVzYGLeN4XiAZsHoT/ADzsiw0J1rc/bENB6xauR/hE8nBm4pl2E0vephWMMk/FpkfWHxxTFTfp1vAZjFhI1vUXFg3/NWdCWoMmTZvLi/0Q5g04fVTbZ+SEaNGzfyv+biEcvtU7fJEXljb40P8JIPGcqp7pctt2k/o8LeIN0F3NRnty8eEEFXpzFMCZTw9AwiYuThNc0jhA4HevcBbSaAxfFXOzZ/CjLt3hD0viJhgm3gEwK+gKmNfoweMWqh5aq96iv40wvr/u3M9qSs9Jt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkvO7kobDpjwznxomZaxn7jzG7rdVfebMAa5Obiz/iU=;
 b=F8eo+JWuAPB0e3PtcCryAap1mjru2bqBflDcR1QoPF6KW1QupLUxC4fYTfubA+ihyJKXLekMKddrV1D9TiNvYbx2OubzFqIzTyq532M598NeBPxoD0jNEhhNhp21REIwwkHHVWfPjwHa+njaChzx1JH7KAhNzZ2XqVx+1i5nMtMNOkk5dutvMn5Wds8ERfYhn49eM176UIz97gf80Jmnhfig+jvwvTaZfArGXScDqC5a8v2bewb9HVkXxwRpgTRREP+DvqPkRZZWplGJ3bdP8I2d0hRYrIcsHCyjtypEU0ci3T8oOoDSmNTNCcuS6mjRwg2pTyW6uXwNeHwhjCcjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkvO7kobDpjwznxomZaxn7jzG7rdVfebMAa5Obiz/iU=;
 b=oc+OHORreBatdvlCVFoeV6OPRDZFxplimNZU444ZhRy0shWoO9MdXm3RhyvB0HexUlpQ4Mjh7R1L93hUYTzTlwqUnqMxlaU/i5+w1hLojnTeaIHbveZRS4dLEspSBOfURLgiNOk1CusouJHbak9Gvea7/gAtkL4rdyNdl3nBp58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:47 +0000
Message-ID: <87mrvirz7d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 08/12] ASoC: intel: catpt: pcm: use snd_soc_register_component()
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
Date: Thu, 23 Jul 2026 06:34:46 +0000
X-ClientProxiedBy: TY4PR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:405:372::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e6ab63-e14f-461a-9a08-08dee8847d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|7416014|921020|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+hbsuV1mzu+RYdTl6NTYEHdCZ92/w4p/HDHXQG1iugP74HzTR8lSeeDzEF/87hXtLHhXwDcGKmJRssd+AMeDlCHZcYurW0aIjFgxlFPLWwoDbcIusNlvU2l5Wq5ga5fmm1XyCA4wZa4GAIDgW6oUdqhR0kjRJZwMOwPKQpxjQr6WBltOSLh4xsVpRUqbm0qSZ6wYVB6p9jYn2807Wa2WmwR4GCZHcSvbmWxAavmjyV6v/v3joPRtOSntLc/Rf7PhYEFuA7caz9qk0oH4kkBxgCAZVSByo5cBG7l/O2HAqNjLDikWsX8ziyYReiuQYyFNHMWGBkQXJ+tJNqVkL1b/qQQT+sT9HzDsAtK/plhDzGoPftMlFF6Ejvc4ytO+sQMmYr2AmvKL0dHavNIRrQtcBcaj1o0rW6CEU+VCQOrsnR7BaUytMa7vORzvGZ989TrIhknS192wexVoNtF1Su52lEVo3RkeP3By9RwWCpkHY3iU/sJZ34SZhwxd0NicdcmLwdzf89qa4ftguX26qQ4+v5ikiurvYln3TLg7Y9r9MfKAHlRatpVo42IiEp8EW8fGq3px86c2UyxPuCdr/4T41tamK1mxksuw0nZrFm9Yv4rT1+pKDZOvck5LcRlWxZUHg1K1OZHUbkRyqnC2kEvqEEp0kCRHnvk20TQV4V82IwdYRWmYiGDipzCrVN9kQqi9nRRarQ+zHgdmxA3jtcGU0kQYk1XwwtY8ojFNrLM94ACynZXsizbxY3c1EuP+RGCg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(7416014)(921020)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5vHjr1mri8uDBFAsYbw3ala8DPlXYJKrvCa+W1rm3pDN9Vyj8b/yCEc4gBYs?=
 =?us-ascii?Q?QhgAKyCC9fyJdvYp2taPxpOTlDmf7rS7agsSEdulzDFSHryDNUOzOy4UsKfs?=
 =?us-ascii?Q?opTVakS+ygbqX0lWpUdzW2giqk/0z/BCTS6I4UiOrjIP6aAL0wC/uAUVxuoC?=
 =?us-ascii?Q?BZqLZJYKUjib/vp5m16UY3TjkK4nMVOayq4k9OCk+1J3lThDZ9E+eWpOlaSQ?=
 =?us-ascii?Q?In+CNFmltBK7IQoXgI7PBjLJfT59USoLJU39Ur22eXnjOtcgCDKo35pFlBv/?=
 =?us-ascii?Q?yNmoOt56Cg9ZUCvQWV5ZcDghkKKf44JNEoWpA64U9mYXbrvUs52hFCz0XytU?=
 =?us-ascii?Q?DPz9KiftdLUTQJ+TpyHmK8i6tRHsigrYm9n9mjL1/5TWVRsUSwrpJMA4oCvM?=
 =?us-ascii?Q?zWO/Vu/QNO/9yhcu/RCJi2CNG4gZ111oijn4Ss+RRLxTuWh+jEI7vGFOVLle?=
 =?us-ascii?Q?3XEpgATtYK40mKJdBVh1fpSy0M+WSkOw7v8eeSlUqPkzaMrEvUAKawZsfGgO?=
 =?us-ascii?Q?iZStozPFafm9Jrk0H8+TW5LtYI1s8BKiRscQtT6SAcYwY8Ri90NY3HD8JoVp?=
 =?us-ascii?Q?n1ktAluVSMwa9n87i6em0odd0wVA8Q/WCcof8LwzKx9/a3cFgx/WPGxS/Ulo?=
 =?us-ascii?Q?DvCm8qRY0xi0kAxYftETBwDZ2W97zz268LxDlMJacrKzBe5DYzPmVY3+1t4P?=
 =?us-ascii?Q?ehWXBaxm8mnfX35no77RJolgs1RRILaD5HbRiTcTE6Pr/OsZWH9DTGV1Dux7?=
 =?us-ascii?Q?KLM+pD4WpTy6VvXjVUhUQzY36nSL+N2+TN+LMLxYLYfTpBULCBWjs1JbdHpq?=
 =?us-ascii?Q?Qxr9aykBkmKT9dmtpcJDRqMC25ktEo4PJXOniPf5hNsQoWw7slhvMiZAlFK9?=
 =?us-ascii?Q?R0fcEa8I0IEDgfbRlXODzfVkWfILCJG4ZZ8zNUrP7ItE9we7QNgGdzOR4d7c?=
 =?us-ascii?Q?zoYeuOEMcbjA8cU+r92PhKwx0W/iWqhcbiEnJ3b5waqd1VfXgjU7N02gvhb0?=
 =?us-ascii?Q?4/+J1Qwzj6IfWz1seshm1BkQpOz2VZ3FcoWlXtlFZbav5cBsLHRBqjIezvHZ?=
 =?us-ascii?Q?uhwKJ+Ew5nLKU9LPPAzkFQpCRT2bnEsTxTBMTaRH7BnehEhe4i5OAjR8FVvA?=
 =?us-ascii?Q?wubIIVmPvN8tj4xhzzklUIPx1ZByt1frELjwRvd9P62bUC+o8qYmGTi9mpPI?=
 =?us-ascii?Q?fnG1FItos6Dbfr22H4athHxbgrbxGemhYFpSGG///bIe2ZJyrwAk9yaNgcQz?=
 =?us-ascii?Q?8DR+4YF5sognjwZWiZj5gwgcYEUCAxK/u8dPhyfh3LJetHwVg+PS9cXJdJNI?=
 =?us-ascii?Q?kYreXbm9WZXIUrtYZhkvHP+bbFUFVLibz00e+4Zn4vxIOtsfSeZ3Pc+D0bA8?=
 =?us-ascii?Q?z4q84TRLojX94UnljQAzyi8NmPkc21gAHxtm6n+kCMlSnorvZxMBlb1BrvV2?=
 =?us-ascii?Q?IWGgjz/XFB1e95m3nwGuPFi0BONfYggKgzKOGy5OkaQWvJceF2jZPn4RCU+1?=
 =?us-ascii?Q?PnnuDdLvjJaKbFE7vE24pUT598exgoHqUCsUk7SV7EV7Thyevcskx+9tVeqD?=
 =?us-ascii?Q?4PLSj+XREk3li1UAicljdYUB/Jie1NtHu8t4Q8/fVUJ6sFVhFfWWJXRIoxiE?=
 =?us-ascii?Q?kX0pBOzT9hCTo3s9YCkAuZ5KxDxonib6WnCKfByBQ9fEKAQb4cNE1r6aGg8g?=
 =?us-ascii?Q?CsnNRYt9+1ExGTlbpeAo99OHWYTd98Cz8PiywyiUQAsUUUmIlcySENVedV8j?=
 =?us-ascii?Q?7ShIX3dS5Vu9KQjm8SmU5fITmBbS0Gm95wPQhXuzk74yrfJsfoVP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e6ab63-e14f-461a-9a08-08dee8847d41
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:46.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SihoubReUx4bEGCYHElfiaKF5NW1vvtvheYBjSOsGehdji3khLNczT6rnNPGGnIOHNgTc7t2e0LY7ohJLVfizRcgVIiML4M7nHjJLXsg28B162FYxxLX1oY/q5bRpL7A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1d..6c1b87d9fc4a4 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1073,18 +1073,14 @@ int catpt_arm_stream_templates(struct catpt_dev *cdev)
 int catpt_register_plat_component(struct catpt_dev *cdev)
 {
 	struct snd_soc_component *component;
-	int ret;
 
-	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(cdev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
-					   cdev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, catpt_comp_driver.name);
 
-	component->name = catpt_comp_driver.name;
-	return snd_soc_add_component(component, dai_drivers,
-				     ARRAY_SIZE(dai_drivers));
+	return snd_soc_register_component(component,
+					  &catpt_comp_driver,
+					  dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.53.0

