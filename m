Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443485;
	b=MVKb87FOwD/2ddsmlIHPKNqjHviq4h6sadE8Soto4f2BZMMZMpBTuc0pxGmlgUUqSgbq
	 xAD1I8faaQdV61wnt7AEcItY4nyfisL3STjeu7aHOJ1pvzu9YIgee+YDpoU3bq7GaMEFO
	 1WVNtVmELUOPAeEbEgAKYiHMALK6S9VOhbXBY2zIivjEQD43/bDg2WLvBTy4hY0uPwtzk
	 ZltXECZZHYNbuaEYbBQjroZHOilDHL3RJYPeHtATeU0PZIdVdKSHCngQkGSmY9h0tfVKz
	 Pzhr156cBA5axW1iRW59bq8QoCcEGHPpc9PG9mMdYpDxRUhOg/4EP4tFZw9Ttmd3l2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443485;
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
	bh=amOxLGpL/1Ka5ok3i1e93WGz6gxRoO4dGUg7NstoyW0=;
	b=IRFtQ/IxMKMLVBMsTk+viBbC7xXzztHjsm0qHP/FfyXGhfcVe37H+YQbyH2Pm2ygqKWI
	 OgIga15CCrSZT1YJ0AnAL0cdsw/NjPeng3Jbk64z7s+S90+bArH7Uz4SzWVyc/7MN5ys8
	 INVHEUAtcjBkB6zysUAG00iaBbwB4qqxbtunUDMOc2+4yeXL2bl09hkBUPPKj6sFuQW1A
	 75iO2kJNaw4AOdddMYQ/7r9UX/4WqgR1jUHhZ7StkAeJXm1qBR/FB67obyMgdJD17G0C9
	 aGkJ48b+LtjzCfyUZYJTpm/c1K5s/ht1vBLB0r226+oII8DuFYJOUDMk6tdq2mWNcag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=p4qZYplO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.32
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD6606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=p4qZYplO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvIaRzmmNs5bKhDSLo0pCPoShxMKyBW2TUeC/U1t613oLDpaqk8fN1E1gAXxVc8+GwlEAFuwYUzocGg6iyhWTMf80eky6K+HaNxL0FwdtRUweJP42qK1cTMVN2j5siwMLIIJaJMBQr8knMlYIQGmuD1EqGkeAcXLNPrybc8oGDxDTO5CmklRiMQDV8Jue442VsZdRfiEJ+2KDvZKNVTaFr9MCv+/wazjewWNMo569i8suUOuMNELKxe0BPkgC4chxOOeWpT6F4PscCgWmEnbl1b9CSdcW6lzM6AZ8B4tZOZfek2C9cwE68mi/uF5WBBRxsQu3pxrjB/d+tpOXqsMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amOxLGpL/1Ka5ok3i1e93WGz6gxRoO4dGUg7NstoyW0=;
 b=Ua6TZb2qz1Oz8SXZsyv6h9YVYAu5fHEGPSptEtTa/MgsAR/Tc14v6k2D7S6im8V4I/QtXt5rvYSYez/O4JrwrSEPF0AkkJLhuY7gLbb5AM6GUl3eAPg041POVEpQOHjtMSKOJpdiMdPKf4BMlFaVYXjNTZUd43DGnK4Z5aEmvwfoCTuwmqBPUP700OdUp+KmxFovjAUMKBKgTimtWBO/HV9Mq8dyrloxKP0dIFUuYCPmpkb9vfMbJcLZl+bptUVONI0j4YlK6FFfdPftmUz+D2isP64/fUmvpDGbBcQP7oT/nXuhZctZpf7lCvocQTEvMYyVzdrWByuGrBM+ssPB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amOxLGpL/1Ka5ok3i1e93WGz6gxRoO4dGUg7NstoyW0=;
 b=p4qZYplOqukuoLoJGeEtdT6Yof4dw2NINQlG38g9kG8nw28aZ8S1E0/Ep8+TV6meWD+im48ff80KtxEca8NvRhQUUt91xB3iBMMtobwY0LhEeMJgJPfg1U1M/vB8QUZmg1L+X/gondX/vFB49+OwxBK5OZNvEiUIgfwZJVnS8ew=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:31:21 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:31:20 +0000
Message-ID: <87tslm28mf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/27] ASoC: soc-component: rename snd_soc_component_regmap_cache_sync()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:31:20 +0000
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 7eabe349-1739-462b-34ad-08df40544612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261102130727099003|261102123227099003|261026121527099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	er7vPfnurAq5SIN1konibbrXfIrMIRyQ4Jj7bddwxO5OkCsnhihQFW+qIk8L+Mf3XYiVyHdPooYxGJhwdjqxxCtJS1Asyz00iUxDWXSebxVJGefFhUoQChpkSlQGb5jc6OkVoIeCzuL7asvQs8MVI8eFABZZso8SooyvcCfvS4Oqi+9TVbWgGU3Hb8E+B0xf949xsn4OKpENeiKhTUtg6i5A2y9Z4r5dmHyvz8BMW1SlfMwPl/XC1W57PmFE/SPW3Hvl3GhOQaq++HFuhvjEctD4s6bKf/b6LgF8CeGIqhEhWyrrG4D3fszrHjiUOkaewYUyEw0SHwGyLcxgRTskcj3HTAWB2z+4iYrMhlmh/TQD4/4x1kRGa8NIpOmcHJd9dDWY37fMStK1qZ+1f84mzp6G84oeyeJcM535Oa07T7SVoKL91p3Imex9HPTzY4C4/4jaygQK84+A7jt+ouNwD7tPhHRWxBfY791t1+qzdBO6hc1ZnMh3kpVhqJ8zptSNxbSUr3Iv6xKnhGdtLiZ6mUAd5/aD87IdMS6S89x5czHMAD2JFUQhGNDLIFSFgsR2sG4XZbuNiJAnEAli7RRAHjlXXOydG7aKAc6zWno1D0iLcC0R3f0FOEWOp53QOyDd1jcLfQbw2AZgjYMCSyBDeFS4s4iXFvAPjKD4XWVmfBpECSP9+07s2A+OoKpPDR2ZnL1pUT8gLkAPn0s9e6ntvl5eEFh1m2miv2rZZAVuXUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JiFHGZr7wBOSchtCOfBkGsf1vC+BmFvlXCRRwhj0L6ZsFdQ2iyNUwH9bOx+a?=
 =?us-ascii?Q?Kj8lCQPIAE3DbGcX57FTfCj345EhNHCLEOnK52/dsGW9dDt3OwEKbeoz9w1P?=
 =?us-ascii?Q?Sac3oL5HVOvcx7oQhKsEwiZABNTApibz66PfKyZyRSqFCud4ICnLyLwYFhKO?=
 =?us-ascii?Q?XsgfqWC9hy3zQC+z0fcarWltCvyYaXtWnq8nQoFCiV4iY9gHQvHNJZhSSuK0?=
 =?us-ascii?Q?jcV7RKv5YcGl8EchMPR8xhgw1BlvFkcdNcBoh9fiiNfOOXFMfDMUrvnSoQUU?=
 =?us-ascii?Q?HiwEe2ulvpVxaTqiA9OSAEaZAdeXsLz51EutY1YpO7u7D6f4vfyW1RyLMFUZ?=
 =?us-ascii?Q?u7QW+UgSHTFtfWvhv7/qwqCcP0h6aPM+agqFta/1xRqxSmDzSx3MI6dy7Uos?=
 =?us-ascii?Q?PVRh1F8eyzh5kdIX6tskv6+SNOKDycnI7NaKlPqihHXhrOSwUOlOy7EjnW7q?=
 =?us-ascii?Q?dB+ZeYXxTn+DhjaWDAXAmST7rrJTd7IhNZDJxatz/SB1YLZdzEwiG9BHcFXw?=
 =?us-ascii?Q?U5bwQ6JDNw3kosV6EYMLBHFL6GUFn3rq9tkFtRS7jVmGm0uyl0wJy2yxht+U?=
 =?us-ascii?Q?BcxNiE+isuv5Yhinucha2+k3+h5WZSPJChW8nMhaLblGW5ZTcQrvqjv4eOll?=
 =?us-ascii?Q?9M7PKoUKWu5B6zlJvgqEA/8UcsiTGy7uCPmj8mMtgj9p6lHSln4mX3TbXibZ?=
 =?us-ascii?Q?2WZBWpfwiL6ZIExp+eiHiQH2SxvF4yxzv/kzHAdd9z25YfdCD0WMHgF868Tf?=
 =?us-ascii?Q?nkvLB2y2uNWLEjUEErc4qcf6lknMDMOurSs4HWCkL9vfv7esJ1z4Hke3MkMs?=
 =?us-ascii?Q?MgePaK/2q+2Obo6YEMnZSY2+/iytIUnSO0KOgVddk4g4kYvU1V8OqhxmwYe4?=
 =?us-ascii?Q?tCKTsHJeaQQ65+Zgreu2t79TSjKGrjbYBPJRHUjzuEI+PHo3iB6on8q9QPTg?=
 =?us-ascii?Q?RG170Bq8ehq39ZMwBj6AgBJ9FusDNwUsKb2BuqDDJNGTkLS+cXv9V+m9Wr8y?=
 =?us-ascii?Q?Wb2f4pUwN6AGy5PbNODPEi11BQBP2jthQkYeTgHaVyIf1aCQQ5U6/7zR0KYB?=
 =?us-ascii?Q?xXxbzMG2AKoijVZRR4YozbUZLlAZx7FdgkgJpyggeacJonR5ETiaCCAeerRz?=
 =?us-ascii?Q?yiBQaUuszBRXaxZJ30xZAh3qWsZJUc6kVvLbCiMcVacKNB0zNaKKXtf5H06a?=
 =?us-ascii?Q?F0dbHuGXXScSfMFAMclpisMMDf1D3fLeWm97vf7N+kEyR466zstxOLOqaeMX?=
 =?us-ascii?Q?4t2Zr/hvv9bJHgaGrSoojelS+Gwfjf6MltZDPKmj9j7+o1OfLD9M5WC6i2nO?=
 =?us-ascii?Q?LjkqA3AYtgV8wJuoUVkaC2Bj0biK9IksSdSws4OMxJzPReQtYhWbFHP5rnqh?=
 =?us-ascii?Q?zpII52jovxoLjFIqYfzo3mOqI+73f2bkMYJdojYsNm9okqZH6+emU4cAN8k1?=
 =?us-ascii?Q?g/ZaF3gdZZqd1e6c5KOa5a+FMmyF6LM5NihLQ38mnGrOBTWFGEjqPiL1+z7N?=
 =?us-ascii?Q?CptwoA/d4OA8nLtVILn6buCSyTSge6Xp3cfan/WA1YEo0p4Icq3Njkiy+/U4?=
 =?us-ascii?Q?DIBPKCoxA0dh4awEBKeZWQFNjzE2dlN7Uz0sHEPj6RjxPu2LEWC0L/PqiOjP?=
 =?us-ascii?Q?MMYsk3zTdYH/ZS+Dgpde9CAnmQE0BSWuJKAlOcdEPNcGJCfBWqlPVWGRk1j6?=
 =?us-ascii?Q?A/wi5sgpTmFGk5WnE+mY7y7jiUmgGCCF8c2/0H8c2Ss5LgDUWkaBWUe6FYOk?=
 =?us-ascii?Q?0QjQnQVbQEAAEK3EHL1UlrOz+EmDVNM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eabe349-1739-462b-34ad-08df40544612
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:31:20.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEfePBbA0BERhlZxiinGfnSAJBJCOtBBJIoG3C5Ob3/QgLghFv0G/fkVZHixBEwHzEj+uSXjPspoFWMf6BhPpd5GOGSdEnmIpz06q2yj3Sm1SNEbbB0K8YPlsfUqSZWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

snd_soc_component_regmap_cache_sync() (A) calls regcache_sync() (B)

(A)	snd_soc_component_regmap_cache_sync()
(B)			  reg    cache_sync()

Let's align the function name to original function.

There is no snd_soc_component_regmap_cache_sync() user yet
(function name change will be happen later when all new functions were
ready to use). Don't need to care re-rename the function name in macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 4 ++--
 sound/soc/soc-component.c     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index fd2db8992b248..d4fe3e02347eb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -334,8 +334,8 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
 int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
+int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -447,7 +447,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
-#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_cache_sync			snd_soc_component_regcache_sync
 #define snd_soc_component_regmap_val_bytes		snd_soc_component_regmap_get_val_bytes
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 41fa459d954be..2979d2b79ed13 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -404,19 +404,19 @@ int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
 
 /**
- * snd_soc_component_regmap_cache_sync() - Sync the register cache with the hardware
+ * snd_soc_component_regcache_sync() - Sync the register cache with the hardware
  * @component: COMPONENT to sync
  *
  * Note: This function will call regcache_sync()
  */
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component)
+int snd_soc_component_regcache_sync(struct snd_soc_component *component)
 {
 	if (!component->regmap)
 		return 0;
 
 	return regcache_sync(component->regmap);
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
 
 /**
  * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
-- 
2.53.0

