Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443541;
	b=KPf6WQQH2z4p4IHz4Xb+BkzG9VQP2H9o7a7suzrSjrYOuhYy2M5bd5ZBxZqgEz9iW1LM
	 AmPo5rlED7HfZ6/QVMEMJlYGI6UCUR5DegpetJVoCmlcSsAlrJ3PFCRjWRWHpgR5C66tg
	 5N9AuLlX4z35pM+YDUyEcHzMTkCli+OWHn23kMuZYMi+DMP7elKVTR9AcGQhMGPOu7jmU
	 qK4MyI/mPcuWZP9to05OKC6w51rPMcBOWvRBqvcURY/3we1tKYSijA7zTC55Q66s4gQok
	 aliKUdC3rRKdgzTwD5DcMtBytBDC4rw5z/jk9ewTyP0Bu8Cz6aGdyrZuuG5lsQ9oQDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443541;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fbFCO3D9/UnsLwmvuvuomaVAVKxAexLJY/uzLykim20=;
	b=3EdkLE+LkP4pqLqBC20jJ8n4ewfvq8MewNzYgwoV9BwrDff6pgxQG/V7rNGPRILH1dqb
	 6CCyNbSGamNjbvu/F1p0vHI8k2VF5BxV5zuE2TnBS5NZuJ/qDG9EsFaWXapB7Yx0clkIJ
	 2CmVapxIt5HGdFAtf1NKi9l0lcobKsrDO70oriEE0lYBndrO0b6+e3jU4qdb6J6bVcPSG
	 6jub7n9kBhyxRKtUB1YQwH/D4JH6ce6sk9r0dOhUPtloUNeF88shy87EQRFniKq8edXz+
	 dqd/9pynstW8TyB3wfLBWAshISb0NztzgIxD58buJhrM0k+OV1fiqNiAvlR32oW7b2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HiVorD0e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0D606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HiVorD0e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcQT7ekm9gZzyZZCbnZ6Ax6nDJyCI3O1Ew6qKW00ETfsPdcKBNCmimP6Cq5aH+2joJ3c2G0Nh51c5UDMXnAECCtQB5Le2+Tl+mt1AkA21hfwJoJkAjAYYfUepZ20XTvahwNd/i6wt6Kqd1oNvDG9vd6U55vPHk0GXUKN3l+773uciiRRCXGXe63NGQEgsd1xKiEtNDgiSgvcT+rzV02vexkkn84oQeswNfxXuqfnwbg6SloLS7cI0iYaRfDD7UF4oH6DrLDnutcCNuh64fT4DEHIZPKSHwpGin80xUSKlPUxborWPwT1nFKsvK+h0FRzn70T05FRn2iAKEomRgq8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbFCO3D9/UnsLwmvuvuomaVAVKxAexLJY/uzLykim20=;
 b=AAnd/vQwBBxTemWv0AmsIEtg7XwjSKw9J2LHh31y6Ab6OQY4dwzQN3evL2Y8XoimJD0eJ8LicXJRiP9Bgnvp1WWWtpm9wRrI+Nwi8M2eO7U7hKCq7HoXSN94fS4he1a8Lejo+28/F2/fdMrLPe4DDSFoS46nuFO/0dTSi86AInu6m7Y2cNrm2XVFhN3SJdaH6SVHd/Pir7qBA+DbYkotv6zigpae0f29bJftkpbgSHNbBVh7zFzoa3X7zWiEH6wTyUfbW+6qUK8/fkjMZtKH7ca5cIQmEtA06YrLyClp8bezU0JkXCfHPiWZYfo/CpD0s3FHNHW7XPSlCg4jkbPKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbFCO3D9/UnsLwmvuvuomaVAVKxAexLJY/uzLykim20=;
 b=HiVorD0egNbeGjWpdToi3QTdTWgk46ocOGrOzvXVq4GEdT9OrwfE/7DKQQNxiLfC+VOCa3DdeTcmKCKz5GWg9hdXYF500vwaFTma4cqdIvWMv51UgvJ8oRtOMzmgeGOTimNUYoHyPp4KFHQ4EbG3/je0HuSqEnbt0l7mfoGk1OY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:19 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:18 +0000
Message-ID: <87pkwa28ku.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/27] ASoC: soc-core: add missing snd_soc_component_unregister()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:32:17 +0000
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: b163d392-b425-43ab-7848-08df40546826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	joyDO4NZHX5X1/vX6Qs7/N/ER6WZ/U7VjGj8sneQN2PRnjEYhyQUVzXRTfdbo11y4UqYUK68qvDCSDlq9lXNzSoEIm6bd9SG+IfpHM3BHGZD8WmtzD1E0EFAe32CLVwQ56WzXLK9ZFlh4wzhAZWJtTP+6KkpMkNm7zEDOGt9txO52lstVyhnnmHvdreyHD/fUeKVFtG8diMz729Ty6OwGY2XDXrj9BciQ5j/8PenXWTaHJ1g5vL4QskSPz9f90hr2WdopAdp6uPCxX3ckurJvYVKK5nRnjBpzgQwbTK5nro2XD5rVeCRifqCCLIKKqcMYq1I1IS4sNOQ/9iwqWhJZUbCvPinsafnysle3JHdIMmVfamecMvFbz4QSkymswnl4jh3Jilcm3NygPjkbmmOxr7wVv15hsbPFlVCp2fE41jcgGoe7KLSHMTq38p5+L7oIuc3f2781Jx22/jXspEOL/so+V0Co/C8b4/NtpvImiG+iOW5T9da3XHJbc6RQHkWtJaqJ+HYR7R1f8UsPfrp2/jzQHeupa0RX4PKF9wBkCmYRFwB9G+UcaLMTBK7mNeAq1C/1BD7bMYBh+La2dug2ojMoCeHk7xNiF3Qacz5l1x1Mf7QaDRPQH7gD24KoaaOUEJT9EKJPedS6ZtepuczXj36Bfkj2gcQGRO5WgMuQ7H2atokGLuQJ/LA+WnAm9Ct4ZnKLg/uGJS+NA+yb6MUpAnNuG1xF3cREpLPJrmDEEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ivNFgg2cIGQoJ32J1CcxUpltNPe39ySbr96erXdk4JUdE996jo8t0lClBa3J?=
 =?us-ascii?Q?C9pV2vqkkj6ZpFzSh6agu7cUscFAB5X7+OEc/EAAlXfut5xV4dXt5d8rlkAq?=
 =?us-ascii?Q?CFNbGitrccLclBo0/CrTwH1EbkAUyKukGwXegENphb0hTzt5tL/7drg9zqMH?=
 =?us-ascii?Q?FK+2yBgZgZBSD3Bwg+KTrvhbPcSjFLDiEq1FHnceX/uAaboPAGomCxlfKhtm?=
 =?us-ascii?Q?28djrT7jPjMHsplxupcmCli+EGWA/Qo6DTpl/koq89+lO6Bmcu/sMVUE+tvH?=
 =?us-ascii?Q?VQJWl/ANNZ4N019U+W/PQoaFAh0aV7UyX4rc3REnkwnK75g7kmVHLerRDUww?=
 =?us-ascii?Q?TltTCNpuq9DqYhh8psyFhnEZU8aHs0r4I4/iWwPk30Iwb81nsPm3DFPiIiP5?=
 =?us-ascii?Q?3+yWM4WY27hif5lOh+YPh60Lxs3Tll2+ol1YNQ7nK9b+f1mlLNjSlav0jjuY?=
 =?us-ascii?Q?w+gwJh/Ik/37Z0n+QGYY/40xjM/7zJ8s+OkbHM1+yrVzUvBBfhOOqz50G2hm?=
 =?us-ascii?Q?PH4NK4xXOn6JHUO2CQcMtHxlmxBfhMppgJfZ0IzlEHUR1dfHvwjMKLln2SP8?=
 =?us-ascii?Q?bXJfLKZOR/JETDtcNNm9VA7aVUVTvNoIdHPdpEJeyphH2xChOB/9Yq5uy/OG?=
 =?us-ascii?Q?2SPxYHIJb5Hh+kNDmNdfpWn41cmWuD1KWUfASvEqQq/8XEM9BEvHp6/Xsd8q?=
 =?us-ascii?Q?mUbwwY5U1olM/LKAeeVVY+qwRtuOGPF3HldcMFmylM9q3fqMb23xxEp8QxBd?=
 =?us-ascii?Q?yzQf5gf6dMLrPtisyOSsyFYFzrqQyllq9StZMWdqELXO69XV8ADbp/TJG+Ix?=
 =?us-ascii?Q?aFyUAYeRd1nfLjZ+UOgOxyutUbRQMc9IlLiPSv7hKsiSpkVVY9dfuFAEU90U?=
 =?us-ascii?Q?n3BNDrDz3CWeMF5r2J8dXh3IEQtlNIZeEvruP1WAYdQyZ51FeUmH8nBj0mbc?=
 =?us-ascii?Q?W6NwNIZrMDIVpCt1FyV6lTFjYk5A4bG2yPBOE04TeStuYUZjBJ5BxLZuNpVT?=
 =?us-ascii?Q?OjlKdXh8DzAVFFsiOnXLHA54PBs6Kzyjax+otQV4ftH2zJ4rgh3MyzO0ixn0?=
 =?us-ascii?Q?NJQ6alEfOpypg397SFJu6h/2/z+nlM9ClLAUtKR4VQHY2Tv2zjL9QZ3YivCt?=
 =?us-ascii?Q?gcmLb/HOW+s1DlCqI0rrVj1HTsnrgF4p5sP/4UIgpdmcfQPhlPSJdY5Wuwk1?=
 =?us-ascii?Q?loDjHU0xjjHSjijWzUGdzm+L1Xz564Ie9Uv55wdCuqIRunholYRAkokR8Xjk?=
 =?us-ascii?Q?zXE7UJhhM5Rc/g9CeHIJ9DtGg8l3Kjmxjzshxo5xLTxVxIXSh+y/m7Mgv25i?=
 =?us-ascii?Q?kyG4DfjLlH9fvf6XS7V++SVlHGkj9R1YHLRWlyKEDSxGH0H1G4l1VHLOqjG3?=
 =?us-ascii?Q?aRsRPe8z7g4lYb29aFSEI4PwyqCiiW+jr26rUtDQYXGsXIE+mHSM5q12CuFM?=
 =?us-ascii?Q?7rXwX2+6j+c73Uz4SKDNcwjPClhZx/VzQJGTg5Ul/r/EKclfmVMihHAr0tpG?=
 =?us-ascii?Q?TbNUt0r2K/F3z9mVN46sbdWE7MDZIQZ1GOUKVnVM1sL4CfXUssCgvoJD7zbU?=
 =?us-ascii?Q?BFuaRyt7HGtrMuGq61mbZKu1uLraqBGuAGLyDBObhWCFrIt6YpeEQispjc35?=
 =?us-ascii?Q?d46oJXmERYiE1WdWjNPlivkTO/z3097bOfSpRWv1IeBnUFKEBi3SEcNCgctu?=
 =?us-ascii?Q?1uMEp1FSzzPN5WLicrl6QjtqxjjjZg/aBMqIK4ixPp9Nf9tyzFCVkn3EVzrw?=
 =?us-ascii?Q?OH/1Oxr4ht8ybAleMOj1eBRx+tBh9WTd3Y02gXQ38NL2WNNHSb6v?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b163d392-b425-43ab-7848-08df40546826
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:18.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH55kQFvFPAyTGHF1OW2U/+p8M11LKYtaiJKF2xTUId6E57qnMDSZWCrhTWN1EWq7ewF+i6TZurkyd75S2q1sp4+/7JVHS8en+JeXnyi50McFaZ1nyJ+1ZHLc77ToNot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

Current soc-component has snd_soc_component_register() (A), but not have
snd_soc_component_unregister() (B)

(A)	snd_soc_component_register()
(B)	snd_soc_component_unregister()

We can use snd_soc_del_component_unlocked() for (B).
Let's add snd_soc_component_unregister().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-core.c          | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7476923c60d0d..d6685812cad76 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -275,6 +275,7 @@ struct snd_soc_component {
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
+void snd_soc_component_unregister(struct snd_soc_component *component);
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ebad67d6f898a..1cccde174c22c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1492,7 +1492,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_new);
 
-static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
+static void snd_soc_component_unregister_unlocked(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 
@@ -1504,6 +1504,14 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
+void snd_soc_component_unregister(struct snd_soc_component *component)
+{
+	guard(mutex)(&client_mutex);
+
+	snd_soc_component_unregister_unlocked(component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
+
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai)
@@ -1539,7 +1547,7 @@ int snd_soc_component_register(struct snd_soc_component *component,
 
 err_cleanup:
 	if (ret < 0)
-		snd_soc_del_component_unlocked(component);
+		snd_soc_component_unregister_unlocked(component);
 
 	return ret;
 }
@@ -1583,7 +1591,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 		if (!component)
 			break;
 
-		snd_soc_del_component_unlocked(component);
+		snd_soc_component_unregister_unlocked(component);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
-- 
2.53.0

