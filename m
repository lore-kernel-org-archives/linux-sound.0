Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBA37756C
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596697; cv=fail; b=R9b3rKxV5wUrN675jkLAwZX3lR91FohotD8Bss+EC2CUgH/JFiR2LXIVeWsuawP3ZOojg4fKZ6T4w15XNx3A76guh1OPYOMEGv2BsyjGD6NCp+EqIPEL2yKLloxM9636oVEbBpGP2kAxp6iN1NMc768nNwKwXDN244vtK8agO8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596697; c=relaxed/simple;
	bh=RDajbSWteOufqgrl+1yfU8QZOQub5/sJV0mcMPaBvV4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n1qdNFplNeKvnjPKm50FXVs+uiF17z0fK9rnYJJTT/u7vy1gWgkwppLbjqSslTubfy/QwGNj3yfubvI4/BNdWYtMV6CEx4gRFlq6mrYYviBfb7aW4Fd3XjfNzmwSFkPUW/KGI5rAshvCfwtxlYWR0s+bvMhNZUi+PppeacJvTbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ce+TaRJ7; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ce+TaRJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0AMybqBFXzz1pm4heBT2AolQJ2lTMpMGXFuLJcddFFuQjAa1+/wd6CQBXnD4FV7+Oq+U6W8ii7tf9HRn5vfg3idWV9Rh/Ee+cwVAdZihfCZGNQ1S63S5/6WQPyE0xfnhk0iTE/xjpzULUiG3GojtADP1rDCMWHlBp9yNiTktn+3y8U1P1m1JwnJqx0kL0TM2wxEX9AVCS0GDCz8fuLR33aeF6wdM2oOk0Hnf0iCQcDPIjh/t5UvWlKoucO40ZaaOWICpQnTVFi4YQYdZ/+nriZE8FbDIr9IhRv+TJIQv2RilUomW736txY9SGAHcmg9FU4R5g0Qsekg+zegGD2Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZULBQB2E+AoqItkf6H1vg0abQPUgfMb8+KlcYsD+DU=;
 b=RgkPd4HO0/aYOA+l7JhRNW0SvkbQfvh2j7Rg3dSfLWT5RYAsUcqcbwzdhwSA+llxiOQt7rqT+Yedi73vAkC2dudKkp7JMX7IrP8QZF3O0nz/tGpmq/kXWRg57P2WIzSUlThXcvvJWbvCYvPI/mnsNxOtttYS3vNchttvL30p4rZRloqdGxCtLuwrB3hcgxkfQX+oYjzqoMaAifxCyENyYYZGNRU+eItQGYadhbAd7ByYK9FSZXZ8faySpxlXyfvFK0aQqOc8+mpHDfw7+i25pSxlmf4z0H61+doybFJYmPVtu3jKuT9uRYe2+tPJMhmGHDkgSHHfnGmksQZqk1vuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZULBQB2E+AoqItkf6H1vg0abQPUgfMb8+KlcYsD+DU=;
 b=ce+TaRJ7fNneLUi5kTZmk25uuOAZcYDksjeFfJci/uQzeSM8q1rNDBF7EvUEokwjF39bfQ7zuTHZQ5i+anhtYR4O776L/dtvXy+bsanjQ+mPL2FtDbuGeZr6nDvsyVVWmhu1ToEpS+wxZf9gZTY9srWZsghQZWa7eq9Vad5YcfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:18:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:18:11 +0000
Message-ID: <87a4rljg31.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 12/12] ASoC: soc-core: remove dev from soc_component_initialize()
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
Date: Tue, 21 Jul 2026 01:18:10 +0000
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fc4913-fc56-441f-724b-08dee6c5ee19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FAlYFGWsqAY/TFqj6Gu7Mq37/7SSyIBQR9eXbJxfn0+pm0ZBYlhKqhG9R3boX7BVnZWoSl4gQc1r09JymphFO0hPbhF8svUOqmd+4nLSHeUBGXp/o73rWdgq0zuYoCFDP6JFu/mEXiM8DBYZYkjix0b68jYZ1agF19P7Zo1e9Aqy7IVjWKK/OG/L1FB86NwuUhTeR3CgupSGbT6l7kq2KU7rOq59nf+FNaFxVum+WfOKb8KvQcyNXqTKb89hTNtCrkW2IiIHOctFDiHtWA2WJ4zusIW76lQ1q2F/J3R6eC/RPij0Si94svdCOG7bVZpNGsomi4JO7ZWMtOA1C5BmEOXodRPE9x6bywyftbJHEUGkGuBNm4eZ7UD0VouNW7Dt9hOeZmffAJXiMSSRhHNZvOIn69AiajlLdnLzBuUI94sWgPu+v1tfy98i7SZOZ5DaB7/sZQhxJ9bYnn22BPRuhvfJ0IYLWF48MgWpqyix2hcrXMhzNrkLMsA/5Tmjd587JrF14uHZw5oLCcshYJo5S4lBh5396jKxlhNDhfKZZy1F0f1MtJpv+DKWco9yQq6v/Wt9YdndZUqvZl6UTkHxdd5vXLma/AiPAHNsSveohlBmwjJH7XSTJnAe358ZrkEEoXxpOUAbe9WCtzB5adnMJ+nbC9+xju3n0PdqB+ZgO/cClQRczN4et+mIdHoC7fpV3U54KGByhFXfh6GIBs3RTJJLcn8OLU/6Z2D1nV/fBgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OnRz7egGcQVFC//t57BaH232Fyl5FeqHVMs5e4tYp97nyWnMqQk0B5ltfAre?=
 =?us-ascii?Q?CLyOPQN3ubmBaRLOQUmG+gb1FikOJsEq5jsPI84NfpPtpTNHt8dEPB0iXt8b?=
 =?us-ascii?Q?YVCSBtP10OH8uLRz+cal8hNz+nT/6CJFNOEQpTjXTRgbz3YlCSYA48pRPR2+?=
 =?us-ascii?Q?5UMkdmMOkwTzO6v/i5fOmV4V+abfwPtaiNIgiwzBAWWzyFBkndsWvV8JqqLB?=
 =?us-ascii?Q?adQFnz3FLssyEu0XjsOWx+3uqtXgN19sKsKbTCae09xyvxV/Db9EqDiVQKPR?=
 =?us-ascii?Q?bBUXBPBp1WQEJvAWe7cItqNIXdcGSVaXKdJoa0W4almRXZ2ZOZ8gFArLGS3q?=
 =?us-ascii?Q?+WAGKYyuVYT/ZtahcwA5GqE32vMDfvT7WZlrdU4vwSpmiWphEOWri/tnLf1D?=
 =?us-ascii?Q?TX6rT01iX/SO4a245a7CoZKPJfCUsdrrtmsEMLpkFzRiFPPVKsdrPmqJ6rMq?=
 =?us-ascii?Q?zjA7dvSJU2lwxN3jsmr00fUXq9HE8H/oU/0ZFcRkf0XPg9/bsxjEq00Czasc?=
 =?us-ascii?Q?7bK4ZH0qfoQbmsFT904ltuvVQCb4I1GJEgxIMAtzPQm0Gxnpz6DOq8cdFgwU?=
 =?us-ascii?Q?0oq8nDHgVreYuvy6U9luFKxTVv4TNW4WO0DrdtpsGpyrrf9fNkCtBEl2/3e2?=
 =?us-ascii?Q?yK5uBeMJvjmpk8Co6yQ/4uRU1BIkE9qQ0Vd+hBSyqxhTt9wMQGmYfnC7vGun?=
 =?us-ascii?Q?JIS2OxBnAVc9hddXP4mmCf/mLAJXoXT7KkdkKPMZTvgnME4rs4Ii+TXReVjU?=
 =?us-ascii?Q?eE8ojJpk4h82ksSflgymKJcWr8DdepbGEz8XOFIfvZhWlebTv4QkxhJFO3Pw?=
 =?us-ascii?Q?NxmUOvb1IYicWlxpIMyPsopb5TBbPosIP+NAwM6lt2i9mJt7OmoTyuFJSi8O?=
 =?us-ascii?Q?KJ/QEFWgAnuS1qFnm0rpfWZW8sfzVyAnYGlqIVpbW+qXQDI68iDvYJtjkqjy?=
 =?us-ascii?Q?GfyEPDPwxjR8P5qhWTDOePc5h9JF5LjuElua4csKY/aEe+Yy41dX+tmTxOJB?=
 =?us-ascii?Q?qZ06JZGB956Ej2sWmGqzffFDeX0g9lH2R5NDZjkRs6pxDQpf5a0uQUzNDwRd?=
 =?us-ascii?Q?HovP3wOXQHT4LKNFoOmBWI17Ip7mW+u82Yd7U6srtVWXDFFkNQphRBt/QJLp?=
 =?us-ascii?Q?cqocCoH8XyuD8RgsJGhRhZklQnoF8WSYZM+cHGbaKInZZhRCDaM+nItq3ucW?=
 =?us-ascii?Q?JcKkNSn832RC5C3667DvugKrUhKoHopP3JR7hXmf/SM3cAbla9oQB/169Kp2?=
 =?us-ascii?Q?3EVUT2i/HEYxopBMWeCa63NzYoplAQSga8uLS4rOqjNu5arxsWLpTC8R89bf?=
 =?us-ascii?Q?InMyaQXxKAiKP7fiOJGEfyf/KkmkBiH9xIoHbiIq8dZPX1QUQXQ1cNufgSwg?=
 =?us-ascii?Q?WC5z/MHIWeVZnkNLjdXQqoUGnRVx0yYPiyKAqmh4sSlesZeXyW9yrMghkXXG?=
 =?us-ascii?Q?g8o4Dwg4+ZrahMfDxfb7fYkjOBUr3ohpWL8U7fcrPv2bKd0YQ9pFdlQker1k?=
 =?us-ascii?Q?MBbPlII4om2IofflF0SzlhWbctVuiHGCOvjwtu9gai4id3+BLzQ1KC2d5F85?=
 =?us-ascii?Q?pgl8/Dh0oHDc/iW36EXUdax/KyGU8l3YtjTIH4UlI/MFoMLz/eSasUivHzU+?=
 =?us-ascii?Q?HLC9xrbJnHaSiQkmEyECGxVLGRk6FOulCh9I7zY3ke/BMSz7QaOA4Iz7dvgj?=
 =?us-ascii?Q?/Xot12c0UJOr4529zkrnYkl02ELcUz7x0Kb2ufS8MMiNCal1MOwU/cJuYFvp?=
 =?us-ascii?Q?NX4mROpYCGRaX/6pUhHmfBbPyEv5i/NpKNc4a4Ms3WcYFHUcBTRY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fc4913-fc56-441f-724b-08dee6c5ee19
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:18:11.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OZ4uIHzlBYL/ZgsnZRiA0K3V+Erq5OrrlE+UAgBwWPT00gA4i2Yf+/LdGDuW1jLAi9KUrFxAKY+jk+ZnvDkgGUtfVETu2jq9nOiva3uqg8oRraS+jGBFX1LITTm6zAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

Component already has component->dev. No longer need to set dev
on soc_component_initialize(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f1368bfe3fa4e..8aaf85db0ea5c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2703,9 +2703,10 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 }
 
 static int soc_component_initialize(struct snd_soc_component *component,
-				    const struct snd_soc_component_driver *driver,
-				    struct device *dev)
+				    const struct snd_soc_component_driver *driver)
 {
+	struct device *dev = component->dev;
+
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
 		return -ENOMEM;
@@ -2725,7 +2726,6 @@ static int soc_component_initialize(struct snd_soc_component *component,
 		}
 	}
 
-	component->dev		= dev;
 	component->driver	= driver;
 
 	return 0;
@@ -2780,7 +2780,7 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

