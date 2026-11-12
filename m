Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443475;
	b=HP3LDkiAbCwvFALa1OEtRxoiASAtpFVM9bvdG62G5jOMTThHg3gURql8xY5oudz5IGOC
	 EktS3P+G0VmOutaq1kkOhegdQX3fezVSB3pqE5WiribZ/5VMSkGhPOKEGa41/i0rTVkDU
	 08HLuxRaGJCPv+iKNzc15ZjZgiYjFD1W25MZUZGdlBLXDw6a17fsx5uXAyXEgZ3ZyGaiD
	 /zGoHSYAUnEa/WShQRiLwGfgcVekejNzwnhBPpLWGF0L+DzZ62ejE0G5YRqeTNgQUuGMb
	 D6TonaL5uAiVgf4ogppxD6+eOqbv/SDqOHQ7fc8Lyt2qYsFEMS1PYPfc/lkCbx0lH0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443475;
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
	bh=ogpVcvlWJKyFxS8QTdUER4jC9lwXhnuOJYgCS+8T+y0=;
	b=YMWRiCbUBwGSzt27KIc9sMkX9+Zk6b/BFDy+iPnNI5GJPwtAFnwpviBTdCG8t+hSUodu
	 R+HEJOithQN7XfKd1sl2EUAHzsNw1gZlCW4Tl90OrrysVI/BoQRuvbi8blA95pykoJg1o
	 4Si5F/porxCrLiENrrb6aOgOs0omYkmaE3UUrA+k9WoLWjb99egEpL4Eg+UI5+E8abViU
	 sDiLhems57ToN99XfnVLHX58SuKCXZ+ops0u/3nqbWIdFv6d38INu0uteEKf8mUIAW5uf
	 xWCLAzYsth3AZIDj8yJBiU0x+FAn21+KDqEMiCwtDWH5cIWGTfeq4wx4xRQEpeZF2BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=loaOgCXA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45BA606A32D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45BA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=loaOgCXA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgcI+o75Zklz0ljlMDKdlJGqv2AR4Y6xSfvohCKbno3F6dyeve63kSDHAXXb+XRfGdPfIMUofphCMehAc5CWOpXvWXpwsnNFSLAEiXpznRN0JqNw7BmUljx2GD6ytQEJ8eDkDLj37hAo6Tds2XoKvfJQcpL+y+X9mOK/9C03nOHgeEz4dVHkPSe9OUwwuO/l4JiNJNmCoEtVlJ40t9LEUolAHjoQJ5wJXQ6eMJfE+hFmHVTXbf0R4wd8eEEib1aVbElLQ+dJXpPTMMYbsnFVCOHvkV8MTtuBiHFVXq+Z3ZUDpYwvyyEKOelVmfUG34ersuVm0tXX8OOqFc+YGTtb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogpVcvlWJKyFxS8QTdUER4jC9lwXhnuOJYgCS+8T+y0=;
 b=ocr0VRHf7/mAHkWXPizT4h7n4flq5UjLW5BO3iEHEY9gc6tp9fah3ijqUK3gze0MmDDfRxcXrqxQ9pwE6XW4UQhWsSuiOH5xnbeQMCoPnTQyoNWkEBFF6WSyPiLJzhNgIdhJCTN1UpfYuzTX/rZkt+mksXTzulJprDVrzIhYgwuVvMzg99WVcyQEr+pwGk5ZVZd6Zbq/CevnCBX07Q7LHqRM7cTVjki/hxspCrVtONX2PZldrFfWGRfblxGlIQ8KtR2B934EDF77KvU10SK/MXCv2kUJ8LQkvfXb4zlnKGvHVO+Ns0ICBASO7mYa+hbvup5yV8pkNQA/ZidciL3yKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogpVcvlWJKyFxS8QTdUER4jC9lwXhnuOJYgCS+8T+y0=;
 b=loaOgCXAmMrRmrLh0MiZLHR8xX4G3wZCQgSPpDu3S8JZCpQvGdA/srP1aD0gRW2ZiRl7mqFxwIRP5Ri4gFoWzSYfVbBdq4Q5Qw6pA5rpKTaHj7A/iWwIIBYJT1+YeW+4FjIqCJaI7Q6bwrgNKIbLk1pARA42p386/TaLA4miGjE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS7PR01MB13650.jpnprd01.prod.outlook.com (2603:1096:604:359::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:31:11 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:31:11 +0000
Message-ID: <87v76228mp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/27] ASoC: soc-component: rename snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:31:11 +0000
X-ClientProxiedBy: OS3P286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:200::13) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS7PR01MB13650:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b88f6a-ffba-4ce7-a693-08df40544081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|261026121527099003|261009223027099003|10067099003|261028144727099003|261102130727099003|261026140227099003|261021123027099003|261102123227099003|261021121427099003|261022105027099003|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aho4KdO9QMlGErCfhlS6T9DZLRbfe3PJ7D3fp8z9tsdsaVbyFX+9ujpMYA0q0YHpza+8PftletUFjLerk3hhNElZ3sX3ysxM3hXWpa9xCr/AaRz6BRYzqfOPiNgPwcTzv2dcUbu1cqp48ssZH2acq0jIGieTEVspzvHcg7ftG2N64Z7Vyj86/1MCFlagUYYDerHwpvALHjURpvzfkyF72rYvAkhe4fKm63zgAIbDT/yQ4trBCLfBXhI7yFEFzq3AR0Bgt1f6yS6qqPEqX0VWUL9CyDK3+UVv3GS61jqx3DSqDpLOpZQMD70Ym3EV+go380iSj9o9GnDQrxDehLbyi2cGYtr8mfmXyhSif7EoPXU57Tmf3bjIJQx/elumBxt37hNXGGoCBkKphCXaiuXjgzgjfmT4tcmu+WCceGZtd1T2HINcj8SVrxo89sBbEobNp5Whovl/jqJBJBsuRsSmW2LeDo1ho913HlX/MSyEU9pmUsHVDfeXR0MNTDC1N4/Dl32lVOKErkQiKMJjWMTgkFTEzje93PCBn03JUJDvHLdIGMrItph+jxdPrSuMEd5y4B9m1yVcfr8z8REs7V73Sbt1jeFFbJ3AtYIEeccpHZB6a+s+ylSAhfsS7MIHW94PqfpU7MVt7XxOwSSSMdIhy2nj8Gygs6I2t43QqklM+bLy6LkXWLTpvaV27qWKkCdE3EtmYkETYhx4dZrd3DbdxhToDbEmG86kbJ2vt/mBqEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(261026121527099003)(261009223027099003)(10067099003)(261028144727099003)(261102130727099003)(261026140227099003)(261021123027099003)(261102123227099003)(261021121427099003)(261022105027099003)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+MmnS6hmo4OzRG97i9jRETONbBIFN39X8hfzpLDPHa7NNY2EIe7SZPEF2vHa?=
 =?us-ascii?Q?yn1DtftnVMIV1NEiZFhm35DkgSB4HspFiz1ZZlo81SDmv/NlxAtCwk6EF5i9?=
 =?us-ascii?Q?1kZXGIUVQEPo9TdyC8vJZg+FLTTDlUUluubm3qh/V4nwSvhoigILz8+wCDc4?=
 =?us-ascii?Q?19MMq9Nv1O1gZ4JZVlXuZF+P1p0uT/Qhpd2Pi/ZgHIXQ+i3SlQk33+QGDfe2?=
 =?us-ascii?Q?sAYjRMIwbZZ+f3NDfF13Wk78MHAVb084vpHeDqJlEkpJehikAUknitnZIP8e?=
 =?us-ascii?Q?ARlNL6AimXTSmdngkx5fvjKNVQa5YeKK+ox/Xs6z1IiLIXi71DZ19nDaxuL4?=
 =?us-ascii?Q?MGBf9yXZXQSEarfMK2JcQV+y/Oel5GSJA2SwdsOV4iPYDhvOerA8SrXaQ38U?=
 =?us-ascii?Q?pg/3StmzB/1KCgXhNuxxIxe5dlvfxvQbxHUatmv7sj0f7TD2aGcJF1yGcUDX?=
 =?us-ascii?Q?BFi8idXYRBSLs/G6H+Y8boA2k6SV8fFqPjnS/NTLfsC3w99rcVqnD3Iw70gy?=
 =?us-ascii?Q?vBxQx093HT3pYaelPb4CmPCsg4tfJ7G07qEfpuQaWrvNR+oDbOQkMNj+vARN?=
 =?us-ascii?Q?8kZKegrJxFxFucCwBrSbDlIYNEQTajvbQ0V58w607qINtKxO1iKyalCmVh3I?=
 =?us-ascii?Q?y3qlgVkrdSWhpwPOGjYUoE5VGLIGV9jInH7ZGd4/caZON6UcZwwIW0593FjF?=
 =?us-ascii?Q?pTPlu5EUS8OSVAfZqSlg+ronroGlSSIC6WOB/Kzwrst8NVr2hIhuR21CmqgE?=
 =?us-ascii?Q?FZb/HhNYJJ9Ug2nnTVG45LX8kBGcgzzMZ9YxunOkeVgjAuKIMRx0bkI3EtO+?=
 =?us-ascii?Q?7sUmz9nJsHjPQXDck21lpAC5FgTJZKrv54YKtaEJcczrZokHrMGwkDw8E4i4?=
 =?us-ascii?Q?3SZniADle3ztQeL6BsH1H7+D+aLm1NDXFIK3dslKKEyOQ2HhEcuTMP65m72p?=
 =?us-ascii?Q?onYts/zTw8sRr0UD9Xj4yXXw0QUG7aS5u0EcU4LaJO4UrkvQxBWBcyFQ2HiW?=
 =?us-ascii?Q?b/RdtEh1/WNmFtPxGnz5cD9yDfEYoLEjQry/uLOumnYaFAOLpmQiR8OHj+Ro?=
 =?us-ascii?Q?VCpq8AlGa0HJ0i81x4HjbICLbv3/E5LvY3X8JCf24tQF7paD3RB4Dlg7t7bY?=
 =?us-ascii?Q?CMhm5K7WEyVhqzgI2vTxxwQ4lsGTxIHpk22PMTVV40RAvUETgHaU/9eNDdlJ?=
 =?us-ascii?Q?oNG85D0u93CZShwZMLuQ6DraxttkqNusNekwQUTIxEj5iYkQz3CqxhouLpLh?=
 =?us-ascii?Q?KTrUMC3d5tKs+7YGWxuBqkxv9dvOHTddbIFla4edP8gZvrkB5Mf55jOLJp65?=
 =?us-ascii?Q?QK6fVeGQjzvJDBvuCKKd6oI7zn2c/V8fpUQV9NAlJ4eJZkhM4wUTJ/f8L94I?=
 =?us-ascii?Q?Q9zC5uguwBmuxaQl+S9mgWZAZbf1k1MuJgd9N8R0aL7wTCTu4PgVCka73bKQ?=
 =?us-ascii?Q?sBE4oPQ5Xk3KM/TBQ5FT7Y/hhTzb2S0G+a6dUV+kkRrTe/LpMmWKuwKk+26a?=
 =?us-ascii?Q?0LleMmFuKu7ACElYOESKEGR0zB0sB2FfgC23j/7xbnWvWc/zWOmBc1EYKCt+?=
 =?us-ascii?Q?nUwjElt/GYa2o8eIyKm+UYp8P+xQhyEh4bYdxo2k7mI2Rd21/QVlnZq9Ije6?=
 =?us-ascii?Q?vKUpoMxMIXks0eq2TkHWnPRhVz4Kj4M9BW5bdEysi5aLof0h59AJYcLVe8js?=
 =?us-ascii?Q?Kf4iRncHyjsi5NbMCLsmqzmYaLFzDSc4h0U6R8KcHDtI0m9YCfPb3beUVAYp?=
 =?us-ascii?Q?h4TnuJgTSm3LT0rMZvMVfAYKhuMBrd4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b88f6a-ffba-4ce7-a693-08df40544081
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:31:11.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOJ82EZTVTyFvsm7llRQQxAqJuffAf1YnpKJjpG5LUzoK2quokwSpe7CqBO/pdYWcMVJ64/FOtS2zYs/r3Nd/Cc12EnOdXRBRqPUTM5awDPFKVuPD3QA9CMWM/rpFMkL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13650

snd_soc_component_regmap_val_bytes() (A) calls regmap_get_val_bytes() (B)

(A)	snd_soc_component_regmap_    val_bytes()
(B)			  regmap_get_val_bytes()
				 ^^^^

Let's align the function name to original function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 3 ++-
 sound/soc/soc-component.c     | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 4e30a22a767e2..fd2db8992b248 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -333,7 +333,7 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
@@ -448,6 +448,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_regmap_val_bytes		snd_soc_component_regmap_get_val_bytes
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 1f40caefee8f1..41fa459d954be 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -386,7 +386,7 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
 {
 	int val_bytes;
 
@@ -401,7 +401,7 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
 
 	return val_bytes;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
 
 /**
  * snd_soc_component_regmap_cache_sync() - Sync the register cache with the hardware
-- 
2.53.0

