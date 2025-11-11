Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F7824A3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820287; cv=fail; b=dBQRBMtjdkwgL7nKpwmqlwONxFQlkOKI0qPgF6fcNNE0fzq3Svr1RU+NfzARa3JL0dykXVlWEF/LzlGKj5iElCvZnD79b1PGQACyo3yWr6BhqLoIZ5VKptm4qJWo1rioSdCEsAYWJs2ZA4uuFp71LZIu5s/UkiouadpRpF+/MP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820287; c=relaxed/simple;
	bh=8OmxnuQ3pX308F/NSv0IIkDKhNMBTvtSdiynyQyUJH8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qBw97zr7/PIp2Wl4QG6PLB9XTaBLYJlVLmM09kv4XPRA1IFacSX4yhFhfUCXdy4cc/Qqf6tx9Na1CBHYZWLWZrZLqal8vql27hr6hlgzCNPKPKjLvM4JQl2A7kbWBSIJdv1vM8TP0b57Qv6FIp1ruJ0IFgghzheRDazU0A3iGbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DbsGh31l; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DbsGh31l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMgXCcRAC8kPzMSXg+lnI74EXxpDL6pxlZKU4u5MPkw37huISbTIfg28mqBrGE7zZJRTJ8uKn6z8HF/5oKRyyBAPXQVII3pg2CR1VO+Fc/36Ohjp1k8KrlpAE1e56c/15iKyBr881/md2+8Ory9eti1zm8tAF7mWrWTN1r5WITO8kuO/eIoismEPy08JSWn59d6HmSRZRQR6w+YgjBDSNePIKZDywOiMD14ruK1vifcIaI+us+H6xTwN5JSEgCsIHH1XVNYOb+LK1r2im/Naj4l9j3DB54VGWLa5tf6b8mNI6Ty+W5ps5IKcIemI1fS8BNjg93trvywHqskMvFc82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUr/tYtm6LwPWlXbJwC6JzsLGDMQ4GQHlxKhgju9erE=;
 b=V31HPyw9FNY0cMP/WIqviXSGTuyXradsA5rYh1WS53Ndf5IzJvBZCXU8jUsdvnfL35z5Ij2LITzAdXQfXvxkA7M7vW5iquvR/ykdPIRnHtRjwylYDUqknY0+i5GHaWMtDScO+ftm96PVELgcyyTrGx3qBojSM6srieWF2WE3GAN9jqUPh3gLSVOiLd7sdPYWArZByl2osxsC07/sFZmuhos/Kv1cIHdj98yJmFE8kZ/MiWfm00Utj8GYa5oNgurKOufVQkytwIzdfnrvEDf8dUka4R+f0BQopirVTZcbE6Nbe9pgWxgj8W9iET8HbCaYqkAQ/Dq9eF9xlXqTJskjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUr/tYtm6LwPWlXbJwC6JzsLGDMQ4GQHlxKhgju9erE=;
 b=DbsGh31lG/DatDMcOHd+KqGzNQUKaABpFdMkav8huxvoKANeixVx8xHaXJ7A7oool77Er6CBlt5YKoHQZFFfY8Z/jhulfHHKGD1UlnFpYeHQR6L6yveHW6vqZ3XjPRhAa5gQ3qCSdvrvVOTHRPQ9yyvR/+gjk9IVkUHuXhh0VkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:04 +0000
Message-ID: <87y0od8ls4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 010/292] ASoC: amd: acp5x-mach: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:03 +0000
X-ClientProxiedBy: TY4P301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: b65057da-d981-4c71-352b-08de20b7c7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fd213gfkE7/d2mlGFfhpPdB4U/vAKUQJiqb5qoRvX5V7pJFL1o69GpHnS9wD?=
 =?us-ascii?Q?IryJ9N6r7IYbC12DGJXpbz7nGcWJB/oxOfc0Qa26OteKQON3XZ9dEzskRhzM?=
 =?us-ascii?Q?3f/pp98yp611BSI/2PXoL8ZgPDrpfDIUjUcjUTZpqc1sBMmQnANhZBoQQPev?=
 =?us-ascii?Q?ka3tO58SZ/T/8doEqgiw17Lt2j5pP7XofF8FojlCanmvBCLzV/d7JSs8zeM7?=
 =?us-ascii?Q?HdAQ9BLqD2g2gJdEKvZaOD0azmLwZFwzZ6ReqLqnh1PbMc8+O/5VMlNC7SXX?=
 =?us-ascii?Q?PaFV5xX7VC1bJYxXSCFd8tZkKyPULyhvmlVaZhrlDqChv8PV4y5W9qzZ8izJ?=
 =?us-ascii?Q?2Hn9mx3Nioy3OhcIf9sWnVvFsChX64p7xonVw3cpQ+KR+99LawSy6ha5nzCV?=
 =?us-ascii?Q?6R3w0XjDxi8M11lz21hIkaltTt5rHhQxVISbVdoxv1eAZmRyCMvmm4pNiZ3d?=
 =?us-ascii?Q?162sAPWMDwbx9YcUJA5ZROES1tBvnhDKA/cpIaS1v5N5MtReE9dEk2JAil+K?=
 =?us-ascii?Q?12azhc4dUuWmKavw00Qpo+2VFuVEXo5wxZC0Nsq7x3Szu2sfVu5xHVgnsc23?=
 =?us-ascii?Q?YWGUkOSunU2Oi8idOq7ucIkDJP56im+IARO+wHd8OeFLj8nXcW7SUZ7SO/BR?=
 =?us-ascii?Q?1Hq4F2m9QsK9Lh9BiuO3V0a+yU/7v83XXE0iap99E8phmQUSJtrdqO8o5RA9?=
 =?us-ascii?Q?uGB+jtKkdyu30mF3HuWrqlN1C4Uf4voQETROgRLS4RAD4YbAED3c8IF//9dv?=
 =?us-ascii?Q?UCoQkaNloiRG6Cka3LdsTbpQpQTibrivC2tE2eO2sIdcONL0zdjY/JzyZ/ep?=
 =?us-ascii?Q?caLQ2ctq6bqHhMmbeRDg8sHTFZUXn6n9TC2gxBvpG63Thseu/mdlD2rC5Oki?=
 =?us-ascii?Q?q85qCFL2iCdSVYH7Aq7ujRghk5PvMFBwss84qVrQAYAJBxfna0kdKmn1Wm3n?=
 =?us-ascii?Q?QMCO4zbunAMRikxx0ZvpmrGGJ3OstdvSqjQlx5cDGRHkADABFxSBTJy2VMvS?=
 =?us-ascii?Q?UjOF/9pSJpCRVvGa6Pji8A/2q6/wjdii7pqdLyLrq9Qoz76voHz5UafvsIQ4?=
 =?us-ascii?Q?+mtoW48R6lkt78KuZBv2IvW2SUDAAEjg+HmOzv5XU3uFJ+momzG5U5YmVpqU?=
 =?us-ascii?Q?JNw/r3NS7gDYCSf5uBA1tvYX9coHCuYXRXiCz6ruX8sUqoX//+ovWGosZPK4?=
 =?us-ascii?Q?AVWgj5v7bhslneLhM0xtV09b9CWHdA33bAVFPOzAB1QXPYaw0B2MiI8gmQGo?=
 =?us-ascii?Q?n73FcbZSh61j7OuwORUD2pL+hr04d/c7AOZs0aRZrzj/MNT6KpkE6+2l459R?=
 =?us-ascii?Q?fZMWAm08/Jo2Gj6tKV0c+9L/tuQJZ2301+R27zKriRv/NpIb5FZ00A8HnugU?=
 =?us-ascii?Q?6c2EUMgv1f/4A+4kM/34uJ7SEXAY1s/RajrJbl6aDuBeSNpggVe9nDzccRrc?=
 =?us-ascii?Q?Ta168hlBqZlkLwyVrWgPQakhUrrnWEhpB8Bqx0qmGA3SPaqFii17xTysLqQg?=
 =?us-ascii?Q?N+YBFEv2Y63TA+PSiJqMryxg1A8ta/WjyT7T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WdRyGYo5xjrKjhl4PgAw7KgBdOSCGZ7bv0uJrB7dWZ4NDAhfEhsbch75Gwzg?=
 =?us-ascii?Q?Z/4AnD591EetOe+0Gbv2QkzrSRMK4VJnwCauFEU0Si51tbQweuJCqu0YAPJz?=
 =?us-ascii?Q?FIKmkhWa7Rlg9mfC7ZfwPv54O+vdNRXmiGFTmLNEpFDa/BH15YommUj7f3C7?=
 =?us-ascii?Q?aKescT3w/DT7CLSqDBkfcksBwt6peSRSHi2iajGPbEsG56pF3EDkHEg9y8DX?=
 =?us-ascii?Q?k18O4lG+pmXSHz9U27XATrF7OAgJ7fj/9p9EIKg6fojN2t4Om+LlzFmsOe2G?=
 =?us-ascii?Q?anCb3wXV3dAeYTvBdHABnBfYrYyicqEUyQWg+cI1xgSdu9/wjLXkLZnN0J/z?=
 =?us-ascii?Q?IqisJ5kMWoXug235hUSFYGNZC0dLOmVM9NwVhZOtObFTeWlS0tFJoz6iR0BM?=
 =?us-ascii?Q?IsMBLB0j1vJZ9jyv8xKMGl5mecq58Rl3OutKKpluvWj/Xef8ySgp7M2kmPf2?=
 =?us-ascii?Q?uKDEVBSGpFshuhfMgwXn7HOVY2e8x1K6c39R4lR7Ylr00G+GNfAia+FHOaEK?=
 =?us-ascii?Q?8QgcH1bPwqdwKRRpZkBQdbfq0pHvoJuO/t4OPGhodPOQeo9uJkl8TXKizGgf?=
 =?us-ascii?Q?iNNmXZhvdAMOf8GVloAu7ofM8IZHc2Tk3aOlKGORmt9Kom6AmEatsTv/PpNM?=
 =?us-ascii?Q?4db6jzTT78PQPyiTpfZnapkDaSDD1DKwoG365QYq7AwmzyB/8TRC+6PXQ7fI?=
 =?us-ascii?Q?F+Y+EcuHYCH1ke98jb6vsB9M2nqUHAeS36jDGlUuTTX84FNf9VOWSnmJa8zh?=
 =?us-ascii?Q?97xC+alBPGlvg6MpjLeybaBiI/5w5MIDRlAYor8BBXUKwl2PkyYkQO/w9Q6p?=
 =?us-ascii?Q?/DCN958jZVI8I/q++8r//UpAm8h2XC04N9yx2jTEkp5MsUZgIuOTIIodQjBt?=
 =?us-ascii?Q?zbGZtU61ICTjK9RJuo3OmIqd179PY/UvpfV7aRskLj6O30lSsn9RfjmCDjeQ?=
 =?us-ascii?Q?zxMjXpsHZGqeHd+bH3LHD9JeknSKJ0IdnkfFgb06baJS5dO/f9jaHPk46//D?=
 =?us-ascii?Q?YJAnXmxOtCsOVTTBEX11on9xb7kxcss6J/H5jFy0wNpN4qUs2j5C0aIjk7/6?=
 =?us-ascii?Q?rYFJjyInmQFB/tKuBTFVUStalGpszt/yFRvVI8fOdSa58YHhXe3qZZ64B5sI?=
 =?us-ascii?Q?Kg2q4JyRRQ7N44rWs1DZQB5pRLMURqqe16jLczL4ClxVDXfr22+IBAExQGLf?=
 =?us-ascii?Q?JKFQ0yfsIQTLPn7IN0napT0xgLRGQIbDAyWYUrzGTu9QaGRd1l4G0JzT9Vbb?=
 =?us-ascii?Q?BBnJGOwE6mja453IMUsSO7ESf1prnwAo73I50hP3KFKFoXIs/Ykd8iE81zb0?=
 =?us-ascii?Q?V/HNTq0dopmSH0rayM5QpuISXEdLXSaqbeCFPSNOfNklLkH/u7MmW2Y6ezLD?=
 =?us-ascii?Q?U+GN4qmE5YfF3awGlVDj1xAxq38fX0StAyu4KWAACKxV4T87Ra2+wCP/Vb2x?=
 =?us-ascii?Q?m/08RRSKYZP+xXkCFHlwbTpLNKChI/j3BJ7euAs+oNmW0EuUZ385pD5whhmd?=
 =?us-ascii?Q?ZkSlU+UjGqQmonBCt7EztKantFxjVyKGjERXZ+UyAA6gqBtIXQoxWxO2cA5v?=
 =?us-ascii?Q?YLceSKMBjEFWfQ2O6CdWfiwyDau9s8J7e5bQRS91d4I+GNA9r9IKw6JVXXjr?=
 =?us-ascii?Q?s5NtOK+p2lRTHlZ91X7khTM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65057da-d981-4c71-352b-08de20b7c7ec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:03.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIOD/+8m7dhlOSIDlJzEetFMHsdBeBXZkLCnek824IZOv7QiOy1kE8UAXK9QJVrEL/4vFiHG/90NUje87xDzvpTac/1u2GjNCEsJp42RnYxybff4TK3obX0G3Qetr7GO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 2ca904db82abe..5454de24fbcc7 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -61,8 +61,7 @@ static const struct snd_kcontrol_new acp5x_8821_controls[] = {
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *dai;
 	int ret = 0;
 
-- 
2.43.0

