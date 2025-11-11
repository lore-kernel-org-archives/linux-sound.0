Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C613959D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820445; cv=fail; b=kVTK+bzu85yEA65sp+RwQPZ6UwacqYmKqZlOo2l82LLsSK4yAcFfU+1RC+5QLTgk2F5Ukv2n3an9avjIbaW7/5zvhdz25C5oNhn8QGyoDMCpx6TJ9IFzzcj4ORoznsxu+42F+i8uk0akTjdNfmlHzwXPJIBYx5lL/CAV1KA9Oho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820445; c=relaxed/simple;
	bh=I+EuaTl1TqUYmwg9j+ngoH3sDexw5NhyVcInWBUwahk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TNsTgX576R3QoHLFxz61/njJPaDVdA+IzT46E/q4UlNBxlXWs1S1khNJgrh0qrwcGm6kE7c/nVFpSek6X/+rR0B3ivwacWhSLnjETwJn/1xL783fcK07rZdNSgR/pl44S7wAz4nY3Zm1JhDg4Y6fLQTeD2tfocGmSginyn2X0uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ajq2GqJX; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ajq2GqJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuNL39x4CW3IzYyDgHx31TLWGZ0l7OPUIfcTZQuaGeo3Qz8bIch2FLoWsoheLnAyyuEfZAGT0fObd+qW/5Bfp1cdWLnQNWMbLaAmcOngR/4FRlrS5cfEOSgd7zjMioiD8wAUkTwnW85+7X8noFyK+J0SrdxfL1SKFvFNLW1AHzOgZvuZJ1lk0II/7fpoUbHkMk6BdRyyMshOq3u89SrvA4dSBXmILdxP9aZE40oJy6OfDJWP6BtxhZCqz/byos0OwQL4aKLxn6+LJ1oK3gT2KtkkgXHYJMi9+j1YQ1+FPQ/ngwGqHwmnle30L+vxw01am0lGd3uFlWO0wnCzAs3UOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxQEANTg5Ao5odt+3oD0b7QKj5ZRLieWH11EWSsteWc=;
 b=KyoA8LFmWHE/sra6B4vQ6xiWWXPl2o4rnElVowW7rG8lF0ipt2kdnG62uplXvIj0EQxH6m3X1azhAiPMU6DX185zUK8ZQsr7mbrsNvvHnw6mStwbYy6IrnE8y3jLZTIxzmBK6tBwm8lvQ3trRl1743VE5tBKh0oSX6iAbZs0VTBe33SUFTWPjD+YDLECKFUv1Ku/dK8W0pcuA4MCmHM4PZWo1hmH5ioQecfAHyMxhwNGj0jhKjDmtY0oqrGfudJQ6NrugG3dL7wkYc4RKJNFTulZ5HNOgxZ22ot6q4kGwx80df1m7lzy+cPMTztH+QOh6BYQYqVGzHMwED98WcnnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxQEANTg5Ao5odt+3oD0b7QKj5ZRLieWH11EWSsteWc=;
 b=ajq2GqJXqZvwH9hx5C+vHteAaeVg6gzytBOl2GNDnrQpEB2M8uXy9v+U8WmPOXeWF7hgTdedKf6NVr2b/4C0a+0xvdinCGZUisuT6MsvkYcXKymuOJJ3swCL5WfXyn68Ybw/tyCWky/PQPv4IFjtBG1TKYLa6sDrQ5UYqo9TjrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:41 +0000
Message-ID: <87tsz1773b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 037/292] ASoC: codecs: cs42l43: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:41 +0000
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c47369-035b-4e52-a3fb-08de20b825c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pWpC/2sm+02SLl5UWSAhVCHrHbIHquqp+9RK83Yr4Zn45KKW+qQfAOwJvg8U?=
 =?us-ascii?Q?Tz16sIi6/f/tWnIadNS+RoqV0jIUJ6XsCAWJJYp+lAs3TcI8D6ivznUIDK0K?=
 =?us-ascii?Q?xrBcv+032UpTlq9RNdk/edNHAUeA365kZD7xso9za7/aJerwrZtG7ZkfIFsE?=
 =?us-ascii?Q?dpW6Cwm/RA00CRxZUin0gM729ecxWUPFFe7jYz5Dci8yKCWu1IL0NWnrCLkg?=
 =?us-ascii?Q?/rWLYfWBlMitjjLv7tfNM6Pg0ZSAUKvH54mC+7NOMhNret8j99BqAglyjWEO?=
 =?us-ascii?Q?G1ZU03xyFQuwZuEkgWq8RaG+mpeJH5oEo+0Za/AzWXu717AhSMDKkEkbiSGC?=
 =?us-ascii?Q?eQLcMztFhJQdPKCavANyut5aC5dep9lLeK7bqzbgHa5nkIlCQzuxT/5Ha9EA?=
 =?us-ascii?Q?405A/Hw+k3P/g8j5ta9Tn8mLMccs/41c74Op4y7V1AIEVhXYhmEnZOv0fONI?=
 =?us-ascii?Q?CnTaHVZ/duj48vkfWYa6YZ1wOT61Can19IGwCC9ByFZY09hbIBSedvjuQ2ck?=
 =?us-ascii?Q?1HZp+Mtd/nF+hIl1rxP5SPfvBbbkBOD63PvYEE7hmJ8bbVUuEVIrl+3yot8s?=
 =?us-ascii?Q?es3yWLZYX6kkGcj3pR0bTi2HTTHIooVYeNn+3gFN/uAobGVizid93xuLULTH?=
 =?us-ascii?Q?cB/hFn3Qn+hsdLNXbZew1zdb/sjlS5F+S12yuyAay30zk52DEmuNNgTStG+A?=
 =?us-ascii?Q?CBmKotqVrLv9XIqT5gbip1j/quvECEv8XcXzVqm4oPh+zlHXn5mmhG0z2xLD?=
 =?us-ascii?Q?Mdkv1K9fdxa0SjhV+wvKS8675mGYEs9hA8hOiQ0lRc+YdofWhtgdWlWzViQT?=
 =?us-ascii?Q?nVnXHU+1bQw5BN3OySEp7pBvLEbLZwNJn0uipeZAQ6zTHuBGHXQ2ti9AS5kJ?=
 =?us-ascii?Q?L6FxF7AmhLMS5rD5cxu5vmVTXmM6niYEAwGBcYvXmYIASVYc8O7ypZita7Lf?=
 =?us-ascii?Q?DrZYcLCAaAIFVoKi0f79Sx/i5QHqMMoJYAB24YUfFQIW+juf2LcJZTKL5JOA?=
 =?us-ascii?Q?rrVB9GjLaZ7JOp3jYtBqysuo2NeriaaJpCS1k79Pe2hlTw7IEiiI50fJ0TcJ?=
 =?us-ascii?Q?HWQ8lq+6L8JgCSKSr2uUjfY6aMnufipErz4AmA4HkSJdxlyGBpSL2zWHGsRq?=
 =?us-ascii?Q?R+0pfZuPN+7H46J7fxzGmuYIYBnDEXG+JFPjzt9D384/1jazKtqqCZ6AstiM?=
 =?us-ascii?Q?hwEVPwG3XFKQZXVP6skx5gDmmqGsMnPYE8rM10277/lf+TeixnZHIcYdaP8S?=
 =?us-ascii?Q?RnWwa5AycKcfUAlyCVq9nP62NHlZg5Y4ccbTgIOd+XtVaWZwmjbB8QaInndR?=
 =?us-ascii?Q?/UabdqDejJK7JNj1iNZSpayVMB516+9xLv1GXcTSU/4n8akByCfgD5ciZXBX?=
 =?us-ascii?Q?c1XQWf567PQ8lvt35mxqm6xjaOz/CTQw3u809sqAnp0smivuWdd2y800OwmK?=
 =?us-ascii?Q?f2YfLntPgnAc+pivxEvETUWMDFJrywMbxmgLjFEFNQ8fcK0RywhuTz41rwaq?=
 =?us-ascii?Q?FlxqxFuys6F5lYkZAHf9sK/+EBaEKxKYkN5n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wVeqRz8y5Co7eGfDBhMhuhfZJaJFkjtiDMtjLodDKVu+dPAEx7Acqks24gxA?=
 =?us-ascii?Q?v3L5wLw8heVegtALlzRwIWH9vJlwAU0TEF/RVSrwTMboRngwAk4CEc0zjuRJ?=
 =?us-ascii?Q?CzTdqKvxECMwf6ausaaBI44CNcAsrkKufIfji1ax/eTRWBaNIdY25iFBIxBm?=
 =?us-ascii?Q?xiodHMq6Fo+Ml2UfoHakQLquxiva3h8wrK6t6nsasQ1j4pHacXf2R7jseHIX?=
 =?us-ascii?Q?wzTQtfGSX3xdEBdQqTWESEl1ks98veVtJxqhAuRMKvPbdA2yTJNYp5T30xnL?=
 =?us-ascii?Q?NF9LFk13wYn4ULrqqtSHbiBdNoOk1JRJRVoFNjjvPvVXLTCyNAlO/AE9kwTn?=
 =?us-ascii?Q?UblwsCeGLq1wbHo93gwkdm/Zwl0i5aXPAvdeVUYmksxwEeTDl336W/lWsEXW?=
 =?us-ascii?Q?Sw0EOK70TIueNz96W5ATSLeZuEOXfz/ENnPGcA4haRCXeDG0RuotKJa6ys49?=
 =?us-ascii?Q?VHkGj3uf2V6+Hb3x9McjtLKR1u7VhDshYRmjb5pvtqIqeEFqwmX/pFgPNSwW?=
 =?us-ascii?Q?h/e+tuZvacG/3MC5TR289TGPI5zE3zBrzFae9wsKmmfDMkc9Wgn1va/g4Lnj?=
 =?us-ascii?Q?RaJmwHW7KI+7qC4Rb+gAAXSHfgmxj0gyBWrW6R3ExygNbIunnR8biDmJhJQ5?=
 =?us-ascii?Q?mLF6tGd8WPlG5PEJQrYTabxbaXBbjSaJpPPYPWk8azWLA/CYksyhcIle+N7Y?=
 =?us-ascii?Q?sS19EDoGAsYE3XVsJ5CBBebG9iB3PLX2ICpUvFaSvb08YpHdLoYxxPFK1v+u?=
 =?us-ascii?Q?hW7s6f5cy873Zt7fuwRynxSpebtb0BXzhWi9R/ObgpGorwQqzCgjOz4J214T?=
 =?us-ascii?Q?ReplRqwXdVECqR2xN9II1ERxG4fjfDn13QZ4Yw8u3W991qSTn3m4FGHsPAKf?=
 =?us-ascii?Q?i2fyiso+5Le7Kw9w723tVGSdKjAYtAV1VmQGOVOulj6VCB3eov70Ec0/MaME?=
 =?us-ascii?Q?AJpwrV6cnqdsNYOQE0wGVQMID5yo+qyfHqacH5qQS7WlaxCNr7rqe9oArU7t?=
 =?us-ascii?Q?84SQhLfD9Q7eBl+RZaju0WibmmsgUugdUVBILVQ2cndKL+hZdIsw0m3zmzZv?=
 =?us-ascii?Q?7du0rWHuRK95FvdQsosWZLs1Y40CBT2zdvmhXgUmxv6IcK5mjI+Vr8l3Pl0M?=
 =?us-ascii?Q?XjqFZFFAyeGP3Z8mz9fBMVkUOxNzPBi9MV9YUy8jwj3igLZohbkqNlsNNnvs?=
 =?us-ascii?Q?t5FT5H6ru4JLGZXYqyc5kbKFFU2lEuzM/NDg1ZPHqBLgGJlR4+YTbzVqMeLO?=
 =?us-ascii?Q?p5+spJfKFKo87LCxclsyMGHvk7yEjlr1ENPmCvlpoR26UGPETNr+iDjEyAb1?=
 =?us-ascii?Q?PpfuJo8mbnZrcjhfaS0IyvkxrHb7zUur4OvBs3OOUAC24qU/aP5quhi6cOV4?=
 =?us-ascii?Q?4inub8E3VC8HJ7qRKWrAqvKq8PeC45NgO+/aPy+/LoLOozfeFQX/1YSYBZ7K?=
 =?us-ascii?Q?6UDiC2zntnxgp8osTPpx/cP+Utfv66mKXFBKZjk+6zQFya1qFh/egHdjyVhp?=
 =?us-ascii?Q?HNpb2FJSw3ly2vRdGeFHNlz5PJDYr9v+pDh6Uhnx0EUmPSEIsLZGgrobxDW7?=
 =?us-ascii?Q?KZieIPxuUrNCj0S8leQ1nHH4i/+WyJ4dviLzrCXvby2W6iHxziyHRri23F04?=
 =?us-ascii?Q?QOn11CvjfCIyDkcM5SNZSg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c47369-035b-4e52-a3fb-08de20b825c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:41.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HFItw9aDXaKA8pFKWqwozVBjA4B5wZlwLcw5datND/1NDEJB9kWntGZUQd15BV1H/FzyjehlT+ROFuTFpb1iZmCga65sxdahPPGYTsVDJWvVanTsMsKjqT3xGJ/jnQ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l43.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 3a7d76cf24dcd..fd02d8a57e0f2 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -154,7 +154,7 @@ static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 {
 	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
 						  hp_ilimit_clear_work.work);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(priv->component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 
@@ -170,7 +170,7 @@ static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 static irqreturn_t cs42l43_hp_ilimit(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(priv->component);
 	struct cs42l43 *cs42l43 = priv->core;
 
 	dev_dbg(priv->dev, "headphone ilimit IRQ\n");
@@ -451,7 +451,7 @@ static int cs42l43_asp_hw_params(struct snd_pcm_substream *substream,
 static int cs42l43_asp_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
 	int provider = regmap_test_bits(cs42l43->regmap, CS42L43_ASP_CLK_CONFIG2,
@@ -950,7 +950,7 @@ static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -964,7 +964,7 @@ static int cs42l43_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -978,7 +978,7 @@ static int cs42l43_dapm_get_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -992,7 +992,7 @@ static int cs42l43_dapm_put_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -1017,7 +1017,7 @@ static int cs42l43_eq_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
-- 
2.43.0

