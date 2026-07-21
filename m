Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9622641C6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596658; cv=fail; b=uu672/EyZOtDArMONtBdA4+/6oZNZE1o62lizLXfaQrV/xf/2AAnU0aqj3CXurdzOXSGohP8fGmsTNKyqmP1Uu1ElpWf4SAHC74Pk2akMYGsRUHR5R2/2k8rcKitgo4FzyjWqkzUOvF0N4iJLH4oFa5wpX3WkdzTZEnv/zBthkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596658; c=relaxed/simple;
	bh=6BDHYpCwsLTFffppOU7gWEd1VH5CHA64WvWdblJsgi4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mM4cnoO3elle2XmOaUzmDtc3AOVJxCDPMXraAo6Sbl3D+/ygSkvEtHt7LEBp6rhYnFioRP8h0GyHSWIoC7+I+Cg7AjECutFNrUfzV7KVqdzVFeFK+rBAbYpA/fdwOaknYOcnM3meO9FubozrqRP5mP7U10VypeEU60psy7u+jkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dhO7k3Mp; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dhO7k3Mp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htZS2PrSEJ9Cwn64ipL5h6K29SBntjMs15tTiCb2qiuZJON4PgdWSRoWF9MyiwmLdonbo+plmZ8YGz4zGDCMffmLtPpAmQKfrRRZXP0u6FDQam5itMXyZuxnC8RQNfyT+kMuK2FM/bB8vZ0n82SWQns/2AHW2moJXQxDu0hXmQvl0g5XtfL25IJlrsUEGaKePJHgloX1wkHCcAnOJCAREdXLYwPJDNSEEd0ICow7flbscS/lHl91YRbcV/aANP1XtQ9rS7DpbN02yA+n7G4lk8DtlREd58mjI2jeBczqh5uwS8gH4ncRRoYsjT7LDbuuErleiHG62RJrhd+HhbWZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8nqEOa/AvKSTIxmY3AoyyuE+rYsJrY2yybbBCFHV5M=;
 b=xNu6t6ZvacJBLSaxdwrywA307cWLvBxbzzGN6WXGPUxTi5a+jQoa6xT9/hHiWwQDkQGGT7aedhCYaxiD6PuMJksPFDHMKDSmSjit9gsua6mepH5UTV6/DBXgrdcdsc14sn1YDxwelZbLqLMGqL5kV7s9lQNx59B2/7SbxrKKn9tsdWz+8d49aG2K1INol06YggRqkfa/D8ey8+7F7czUAKNH0xUxzfsvPD0bfFC+PEVXJs0JMdHZQ9Lsr8nVbojBwsGGKi9lUJcdYvPCkqhYtvFOJxi3OX7Ypxeq7D2FbIUNKgK5wfspnqc5uNeM5hbVcXnE5A1NbBYFhBGj8kO1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8nqEOa/AvKSTIxmY3AoyyuE+rYsJrY2yybbBCFHV5M=;
 b=dhO7k3MpK7tOpXqWouolwSN7LuzxP9/4n80bwHhP6KLGPkrFOaPkL5JHe9jITMgbHYypnQ92l/0lxS8IYwLoyZ2hPoNyH2OV2aBz6MAHbVWZH+N5dtSGc2v4q62Kedvz2NZXjn3U7JIDKgm/xjVHtEGr75mDjBQ+9YdImctCsCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:33 +0000
Message-ID: <87ldb5jg42.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 04/12] ASoC: soc-component: add snd_soc_component_{set_}name()
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
Date: Tue, 21 Jul 2026 01:17:33 +0000
X-ClientProxiedBy: TY4P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c94150-b5f6-4c6e-1948-08dee6c5d7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	jOU2OJgzUU2Af8OKd+e4cmblLO3eZaGpQzKpi8QRieXKke7m3hIvSMB+051i0RP2xHj4WgZ/ijsvMisFbvMAVlgiHL/XQp+87uksN2EVOJUhf45Olw7MoG1x2CVoRCMy60rhWJbfwazD8g1KBOOon8uGIYXivII18joybW3P+rUcpJi6neIZw1FCpz+moiSrhiuXydbzYa4rWlLIWckG6zcnHWvPYhWfZIe0jUVRv7NVXwAVTi4TkI5G19WX92c8yQDo5WiApg2yGOms5P8ckGQjddb/2vtKd5/XL/p8qdu2pVMJC9RkSG3uV0Subeefnt3PopNK1s9KlmhnSXtJ4wSYqUtPDbR88JBsfA8lsxABRZQyGf/ebPCXCGUwAJfHshzbhuzwq2Izu/iNXv9NVSK8c/rkpZzXnecWsFUayonplPqk9Wmoqv08gVzFGCaS29Dfg8EYWh80xfcFFFFZtVNiOc2xVLBVyDvmpxMKtlnn/qyObk8UqGIzUfRr+EptRTZgj+d/aT047jBikMW3+2+7FsZ0qNkvJi7MfXhencQTYxkBgIqpWUvkzR449ue2UNnwseHpwjKWStYYM+m1BGWlD7QXP/+ayA6nTXdibBeDAcSuhXgNBj0MbUMlPOYB5ldq3ZYjVlPkPht8tb5jg+ZVP0vpvOfO9ZyvuK4b7KvtXjo+ISoWOl1EE3jaa/MgwHO1nVF+pH7Xvv/HZzim17+yOGvBewILguBpR1L/lckq0KgyF3RSpTnp20rtLOD/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0JnQpnPf06dqg1uVjMwbqkynTv2E8LNrmql9dXrHCVleho8Ade26bsAz/ChV?=
 =?us-ascii?Q?0meYzBpyxD2/QIJufmrW3ImUXOsaT4y9CeGSKSh+Pkw+m6wmAh/+gBgn2lAU?=
 =?us-ascii?Q?LhPHyY1mS2F+QbB0Q57+FS9LUZYwkgJR1njo7JoGT3+UvHZpfFN7TB3NkOVw?=
 =?us-ascii?Q?sZCSrwfyNqICEobH0+jiPcaPdBpmVAkw5DKlSaznN1rdyh6P0m8Ye/eR9tqT?=
 =?us-ascii?Q?53ltKRtu5CeUoYjBiJtfotmwR1X5PhzdaQ4pZdWaZAX+IWnJuH8TY2LfDaqb?=
 =?us-ascii?Q?vUAOUADp3pmFK6VRzBENORq7fr/beXmeniTCz4WGJW8w3SIBYGTvM6fpnXI3?=
 =?us-ascii?Q?Mo1AYVzxhYikefxcYRvCbu6aD2+s9/eRHkDr+LSAXLcknjaMJsl8WKr59RG8?=
 =?us-ascii?Q?FDmJDnr0kmlM0Mihakuc+GsFexwr4S/PrefxDtJJemqO48bw0ZWUjwHevLc9?=
 =?us-ascii?Q?b+kr5Thoi0QtDMr3+RKL+ha0gbf/0fjdNiCKvwe3cNnyYHVUP8W6QoVzD8Dj?=
 =?us-ascii?Q?nXYmperU/RRoNpuVMt9OfIUqre0LpW8/s/X+T0tvrawbDLg/twA4MNVxppkJ?=
 =?us-ascii?Q?KgOr5Ows/9mdYWor3TunQZbOrUyWEwp7EKAZkN5Givk8dRpcaYYbYlNB1PY5?=
 =?us-ascii?Q?S16TIDgHWM83hTRVIwChzbJASoU4JLcqLgNJFnKWfPrr5/wr+/7Qcnl+RaPO?=
 =?us-ascii?Q?bxflS3i2bbxshrsxZs+Nf+dvWNurRVoxSZMrUZN2QuthpFHinMoetEt/LbZP?=
 =?us-ascii?Q?JQVRRltOXLUoIo1KB8wUTziUitfnv9rVuzpSU7UwQwQKS5aflg4Bp0CkRV3a?=
 =?us-ascii?Q?yFCp6fLv2jxqHEEwtXOaJUS7O9SOh3hB2s2Uovti0qzXkRVAn+sjSbgaDkSC?=
 =?us-ascii?Q?XzxdqI2nAlftrP3ULgkLRIIMDpjzaT2B4vvP/I2Ds9vQm7TlNUP5PINB86YM?=
 =?us-ascii?Q?8tpTfBzmqx9iDyyM/a8RF5PGhqu955vK0O++FKY1iGfQULRB8bWAY0lkG/in?=
 =?us-ascii?Q?0vUTGdeN+2DirgHhW65gYVzgQAZggXNj53Z950SOj5Zd8J9clKAaCfU0qJc3?=
 =?us-ascii?Q?Hq7KpBQZs6IqMsNl74CvpfD9MCju9sTcSC8GOdVCBo6hJbtMOVcUsKTcXL5d?=
 =?us-ascii?Q?98meSuTk5ZM5lmP/Zt/CQ3C+JCvryHit5Q0zqIazM4G0ScWo5PA/NhXEKvPE?=
 =?us-ascii?Q?9Mtjb4GghXfhmcjLFOBbl5fZ85UxvN7v1YhlyU7/7DaKw0ZjXB22vNo4QUo/?=
 =?us-ascii?Q?Lal1lHWBJ1GvXlrvZecML5blfsrSxhxEMgLVwg43i/ynZ1RHukgNOBb6f+w0?=
 =?us-ascii?Q?u07ZkjsnnKHINEJpWl+NUoCdBJYtuNI2ItNcbcPXrUsc4yu+hnIlA+p21PMJ?=
 =?us-ascii?Q?ekabTBewH9RZ7UkswN3HYDmOUw+PqANJAkaOdMLqsdnSGnIopYVswJRHwHnw?=
 =?us-ascii?Q?RLHJblMbhSjsJaId7rH9mvSSep257lPnu1fjW5CsV+EykUSHDdoOnm5zKTvf?=
 =?us-ascii?Q?SockVKUQDkpj9hY26TR3B7j1Ebk20vXOnvnqV0t5h2yG/5JQk8wl0eRlJdeC?=
 =?us-ascii?Q?XAEB7UTmDb3eGLSBdYAGGmH10RnjtQklEdqR1ztfMJz+CA6Z8tKSY8sn4Xry?=
 =?us-ascii?Q?b/+QYR834GyP92ZHRSyal0GAJY66lKtuSSRYicAmnhoZ9G8xqTFNypr6+PSo?=
 =?us-ascii?Q?yc62womhrN2wVYbesgl9Nkk/m5doUNvvnokizTbsUp6N7mvhLAuy7FL94esJ?=
 =?us-ascii?Q?NiuqzKU9ZBDhoiNkAOWzjQzsMXPJoGE+/+MntpstyqyQdLiTXMZx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c94150-b5f6-4c6e-1948-08dee6c5d7a1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:33.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1rMSqmwGKRIXo+3mVv+ZI+g6ODFr+MvxhzYkdLKgTCUq2Dqvw9GkmiGJ2FwCNflPWlAHeitY88obLOvmirqaM49vKlHkhvFDxs+quPrjWVSmSPlRXQxbpXZ/FDcBUfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_{set_}name() to access name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  4 ++++
 sound/soc/soc-component.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3c628402e289b..61aa6523f2f75 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -283,6 +283,10 @@ static inline int snd_soc_component_cache_sync(
 }
 
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
+
+void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
+const char *snd_soc_component_name(struct snd_soc_component *component);
+
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f0506a9c36ec9..625714293fbb4 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -42,6 +42,18 @@ struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
 
+void snd_soc_component_set_name(struct snd_soc_component *component, const char *name)
+{
+	component->name = name;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_name);
+
+const char *snd_soc_component_name(struct snd_soc_component *component)
+{
+	return component->name;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_name);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

