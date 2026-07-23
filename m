Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44B383C6B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788468; cv=fail; b=NhTB6dgebWBOHHjlmouf/XC9Nq52adnJssNCtMbL2B+qFWF6hRMZ/M/raTbJGaOsBqF8wHL6UTfqBcp5zQtiMhjebtQ+k8pjuKWnGFXRvuVtzLr3bdwHNlyaRI+CezZ/MHVFarDsXRTGeKvqr4U1eD6Jhl3KHvUJhTyIm9dqm44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788468; c=relaxed/simple;
	bh=Vk/aFgOzn2kpyBSyzTYjl8eu/jkmCfFTDkZbEWQf2t8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=isLrABJAaQLMvXUMthK1IpJNCtFn3shN1ox6J0orYmUOB+3QbQjPI9FwSP5LB7st9HgX2wQ9Z1EHBldwbLkvhTO0XU4bytk4ueZkHftPBOjRfLGtfmKSC84mT7PIC8eW4S7KHJ2RiV+C4mBhTbz5gi+vG1+/ZKZDGwP/XsiKNJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jatf/YNL; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jatf/YNL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVeYc9dW4fCloQhQT3s/vXqLZrB4FS/vrQlQQr1BDc05Id0dL0B/LNGZpBy0X2kfemgCMolKul+Y++kByogq6D7ZqxCpqlYy8PXTIrqtcrIJT9TFg1o1WpzxlT/TCbrzswzt2p8UxTl/y+aGBfdujGn7/YOszH5ONdOL7BfDXWtyClsRpT/oZfFfKOfq+7TKPO6Zy73tJnqwXJr6l4xuEQSmL6UgzlVlPkVh6P2Ukhq+SOUR661CB2tqPb7XyPsSNYqxbrWoqYK41HXwFO/3a0Da9s6V0PtmSzr7jUSN4zDAoP0+UlcibXnj7JNbOEsj2r2BiVG+3l2PbOEXKE9iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Tw8dJupkbd/jte6Y8C1radPLhnhS7SzArMU1G/RIY=;
 b=VPCy9CWK0jP1FMPwSldssKr677cugWSOwlrOWFqY3GPsRTdLnN1eXL0/qtHdEetw+j02+nBPOxTHabriIyP28sV6FGvvHhFu1lMZGKr/uAA+SUQ1VsW2m+Bq9VX0jlN2v7+0PjyOVOq9JHnLQ/6h21WGRGuGRW4gHqLjjEbuuFukrnXpYqBu7Ac2dGm/XzClKRGspEAiKjQPFuCj97KJpsps0OCkfceRs9g1CRagHkgBr+4mlkRBkDnH5QVdJmaqkUOv3+b2/D7v0BvKMOrzV3zWqntBCbtLNdbD9Lp8awIMbDF/x99WUFtZlIEG4D+m4nMLvaZL001o+fDb54zqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Tw8dJupkbd/jte6Y8C1radPLhnhS7SzArMU1G/RIY=;
 b=jatf/YNLdQpfydOGZGtsgMC9SWEN+gESFGif7/nQCwofPl8OZFWk85GlnmBbIOvth7Pb85XELGcJwwvTduXDUhgEWMpOQ5mp4LsmRFt0eF2NrZXWtEYbIBqVROS9yoiJDO0q4xSk0/dr618OAVCwWRYtnqjc/NyDWdy3hK8aeZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:24 +0000
Message-ID: <87v7a6rz80.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 02/12] ASoC: soc-component: add snd_soc_component_alloc()
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
Date: Thu, 23 Jul 2026 06:34:24 +0000
X-ClientProxiedBy: TY4P301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 82923d46-9ffd-45ad-a422-08dee8846fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oSZu6DiWbwpE/qmUeI7jSi+n9CJ/cFEV7KTGbd2vlwDn5fybgZXZkWCRso8gJWwJsPHhFh1O5LAPKMKhiqd1FH04Mt7KAp7NAGyRgPNU1euS0c0AW3jZvp8egmm5TapevTlBBbsQlFBOtXg4B/gBsFag4pSlBf22xL6ku6pbXZ3yBgIduN7ODkITFdj2KigcFs9ie+3avcW+dfKtE5kZD/qoWaJIE64EuCd3yF5S+slrjY4NRDJMvcy/5BMmPKmhsvQiXV7P+Yj01uzeXnss4TorahWDCr9XAJFjY18wyw9F6XlzLhi2CjdxOWYD3mO6JWZSrJWBUBMuhtf6iO84mKzDnQ15nboMIwqHjm8A2NodAc/62Fw+H1X72HygNxZ2/1U0EuhsAo4aKagAPtRqJDhKHZ0sxbFqxdfprilzKut/UreFX5PqcoThZJj0hYSt65P1mPGArT3Jpu0TUXLoQfxvpAz7KeCXr1Ga7UPU0rYA/SegFtY8xp3m84hMaC+8/Cv/DIwsgEO95YvptsGfBItaQKCf7bO6OYQM/JlnZ4Rvxo6fw5U72ISeRYMdIoe1Z2vosT3btnUAIexP8jgkCX5/MmioYuZMyMGZHrcK2Ze3D1SB90/QFtEdB8bU+NLrviZ+KrJNeg/a2sd1FzIpfAG/uRJZ+7GpSTND+rlEZQsWLpwCzpiYPy2x4NclvF09cUYyYAQtKOZm9e4KG7gvW7UQf/VRqwZljePXUkHkfnSEdH/9kCqiw/ZzL3bH6v40
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n+ipQ7t9K3emS9VHDB0NAojjBLe8JKjsOgIsXGMYJohk+Hum+Nn/Madrqhbj?=
 =?us-ascii?Q?1um7D/1y5F25i3otzV6Wv+6KDxPdF9yqRUd4Z0f0AaSad1RR90UHT1irxOkw?=
 =?us-ascii?Q?L5GjrhtOgeBpUKUfAKYZrzeJCXwpIar3FLzmqKcnhznMteGlNlXKi9Mgnccg?=
 =?us-ascii?Q?4v2pHPBLAL0DgrXN0axyxgny5g9lPzjpXb4mLEGXHwTvrblcD2T7x95DdShi?=
 =?us-ascii?Q?oFWtYAfMqo7l5lfjQur8uhD1koPRPuDBCIWD8eXv10BZtNtxO6oRfgjUphnX?=
 =?us-ascii?Q?PIcwCWKJaw6XkpHGjLhiPWRfurxu7+p53dKx8Ng17Sc5R2/6xK+y0yyeXufC?=
 =?us-ascii?Q?SiE+nK4JCeL2gIX65xTR46M546jP86CEoVIzjx72cXo5HWcXKp2ufZcdnOGc?=
 =?us-ascii?Q?VGs3kT0Sw9L5r771EjVrcx0Z5FLMpf4lYsYCi483B2PEfjXixJ8KUdyBlxm5?=
 =?us-ascii?Q?xhkEV1y/vSmXqwykHmkS5s3yUFuNSBOoTC/UWMZRgF/jCXTky61mEUbOXeLX?=
 =?us-ascii?Q?tWv4j8JcJxbLZwUGz+/eyOHAuSpbRac08c+BUs+xv5y6yLLNExZ1gLn712JK?=
 =?us-ascii?Q?+gbhvZ/jIlHovt4dWc0nlppJb6+oRc7QZcbIfOiVRIuJI1F6vVh/GL/zG5MW?=
 =?us-ascii?Q?V6e84uqBxXGWt1ayHZU0jmuN6mSgDugnQyVWTh/KU5bx7R2VNE+xB1lxSNuZ?=
 =?us-ascii?Q?whsgYroRgYa5SAldbEQJT9yv2A22gGeZs3eZTGhyEL2n5rG6gy/Ar+CQ39he?=
 =?us-ascii?Q?H3BJeZFKK+oLlYkSUuKlHWcyeeoAAoy4QgRdMOzyO4K/x3P0PtAVVX6rAn6Z?=
 =?us-ascii?Q?skNM91EboY9l7feZGFmxpAKlV04i9WXvZmoPEGHvt6M7nNi/1LqTINRxn47c?=
 =?us-ascii?Q?/cSBkY9pzWIAcocaA0k8E3ug0b6LbxfsC3D9v7P1S25KQbfSL43pN8EVPcu+?=
 =?us-ascii?Q?y98NN9qHAJIgcSmNQmrXhkIAXXZqlPhbjI/81r362TCI5dyBQtwELJDzAdxS?=
 =?us-ascii?Q?4y/+m7NnRYnkWhZvXp13zJ79h9knXSIJDNnZM60Di2FhmJ4IW1B6k3AJ4ALt?=
 =?us-ascii?Q?ndq9X+bltMUW9qAzIg4zaf5iQKscUtt388rNqcJtAaXogeTM5yvF7OtvVzXE?=
 =?us-ascii?Q?f4M7/qHqfPKgSGPfMZLzjd0hf07D6p7bK1l/6WP+69upWVKB4u3QZFvowZCj?=
 =?us-ascii?Q?Ux4DMQqdFIUvv2UovGSowC+byy+BaAYzD9XJV1yxqCWCzTtRQJxnIclfWOIx?=
 =?us-ascii?Q?Tcw3pAC65IF6lWQqQVHFqNGIgJA+ZCji4qnjFJrZR5v32lt0g1W+t8ctiXsC?=
 =?us-ascii?Q?9HoqXN4/V6DseQ/3UDUDVu0xzHuoiqi4W4ZWk33H+/Bi8AeRN+EYWdu+ldQ2?=
 =?us-ascii?Q?dyU1v7Bi+TaKLF0vxOO6rYpQ3hpfOhpMu6JQlR6cVq7N5spEjXoDSLCRaOcf?=
 =?us-ascii?Q?GZqsX6M60jbpIvEj1SRrxVLOKc/3ccajbnVVhCNbxa1NqBIIX1WZ5w4of9DS?=
 =?us-ascii?Q?WXFvkLqcjPyzN0sVrnEOasxpykF9QyUzBqAHZkYbXHxlkfZsz12YGUL7THim?=
 =?us-ascii?Q?UZdk5biXrpVDkbgnyOY8ghCAdqon8NFWCg1PQElnkk1Gj2kCVaqyWzetkZPY?=
 =?us-ascii?Q?Et4X8+66J5pBZAnpd7IGzZS7gLZjHEBDlanBrbROzIn4rfw2VN3y/f1CPhHF?=
 =?us-ascii?Q?SQBai/vt8C4h2/e6uPyn9Hbnqk4jMHug7xfjEpgWVgpR1Q5KC9EAaT+R0VIw?=
 =?us-ascii?Q?n7JeUD8TcTQ+oroS9pMfmccFNKerEJ7Gjmp4FaPNrQsChwqTANb3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82923d46-9ffd-45ad-a422-08dee8846fd0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:24.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+Lq4S9jVrk6L1Agk14Q9bBhTLFUOjJCFknrn7iK9SC6LVyr7cFVzgxCseip/VFBZL2gkl2tDhZzX2TN/CjoRa3xqz7U81GCKXhQ4YdGAlhvkF2BXYcbz5aW5edRRvdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

struct snd_soc_component will be capsuled soon, then, we will can't alloc
it. Adds snd_soc_component_alloc() to alloc it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..3c628402e289b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -282,6 +282,7 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
+struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 718246e53e896..f0506a9c36ec9 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,6 +29,19 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
+struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
+{
+	struct snd_soc_component *component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+
+	if (!component)
+		return NULL;
+
+	component->dev = dev;
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

