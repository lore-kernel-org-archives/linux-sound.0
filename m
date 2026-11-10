Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288226;
	b=NFDUN83IbWTx++SOtdGyRCXumfYbmKR2nYhF6HQaRay6Spzgqx4Cza4G4G497STXglkn
	 oDfUIQWyP9VX5bHX6Jhle9sf3wM1xwJWCLTxwDkH2C87dm631lXe2WcTWPPD0+CuNI4he
	 ypmRDbT34Ag/A21DZH3067GpYqMTrl7gqN8pBVgVy6v1Z8goxu5Au8b6Ql9FX81zqWfrX
	 sa1852QV2VtzpRhMmniW0t+LM71hdenn/P9H+xsd2M9LHDXriZqMxsU30shaGoL3ZpBK2
	 9kUEKzwg+wjjdTAo4rTR6NB8IZf7it6DRpcr/UDtCqDxyZqTG71eI5eaOVO8Vfg4VFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288226;
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
	bh=7qCqi/FXE/ho0HgNB0O4dpJ5ynXBwVhO8N/UmjP58cQ=;
	b=MWpVDuTB91K+DWO5uZSRFFfOVj7nikcXcX8Q9iWgr1S3/KiJFCMCYzAbqrtmYfj+MS7b
	 jRFUyk3U6L9nRS0w24xDqi/Xskz3h5bUcLKIqnwKoPQT2bTpGAA9UNugIYNUOoXvJEx2P
	 7gisFtkxObpan1ThA+cIeGJxC6f5aBF8qplge5dAUlOay//ihWdiLgcUrlT/5zAL9iuPa
	 OvOeBPtNYAk2Vm4Xq5IConYyQjRCUqn8dw/iEIK8g2kX9HqG1FWoo+8E3oaXhF1LOjVF/
	 N6Ecsdq9VbcqfQVBmngWb/mGJUqFvOg8YkXRO3t7468Rdfh7F9t7Gs1VE5VRKbGWr6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bKPXosMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.45
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2E0606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bKPXosMN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI6t4AN3G0/U3Wfz4g7k/LJJLUnlmVHZJU8fk+IoDwk80gxj3D/5oO+Fs7j+f7LFCyDDPjllUDZgEBX3K9QlJKLXKpfTMAvcQykZlHf8bGBQon4t5ExFi2+lJXxqKWmaEdQ1u0mMmaYrb7BcUFffK5EqUi0Djxl8HL5CczrO5F8SSEspIe5dDbajrYOowRtNxKfMdyIY9EfgU7wAtQi2f3UK+gtMf0UZveizOCt3+qQnKEgzBKJjGQ2W/sM8t2VnbHutM84XNzOMjXfyVz/Jx2oHWzIB/KJRkFdA950M5u8HdyR30HhXaumfwpQt6c0Rwr0EC0zKaJprPJyYxNDQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qCqi/FXE/ho0HgNB0O4dpJ5ynXBwVhO8N/UmjP58cQ=;
 b=fMvyzlcIjQ570ZxqKhEVWhKk1rE1CDK4n7wf8XStmIedS204gKODQUH/aWQU/JThY1qgACuUQikw7XO1EgcE4Q+hkzFni1AVsRehCrXAwfu7XeaLDszBRasbM7mhGYRY0XsWBoFrcTgrSHmQ8ZfpKiDTU86krOtZZMxR8JsqRXOjctwiddwyqyq99GT8kvQ6hsccS36eXpu9u/jwjZtsjbTNEI2wA+BlYoiRBWjO7ii9N07PQCnbiG8i6M1YLGJZkggALOZdUQbEiQb2QfURRUJ665BR1WB88cBdV+87bgTo21joiIDn/7J+T1V1IcQkE3MeoXIYmT2mC4m8IXLuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qCqi/FXE/ho0HgNB0O4dpJ5ynXBwVhO8N/UmjP58cQ=;
 b=bKPXosMN+lgHHQkZtHe66aW6YV98aGAOw/APAvOTOEg7fcsMqH09+7vfaaMzXiJeN1tyQ54jwWlR5kfEzFhZxwqESnz2/xcXym69uY2ta4qbmNwGasUpxa1mgA6aWAK80UwD3ZqO4Onu5HXV7unVFeNvl+NZE9uERmkAFQR+cGk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:43 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:43 +0000
Message-ID: <874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/20] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:42 +0000
X-ClientProxiedBy: OS7PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:604:256::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5a3cf8-c2ea-49fb-7332-08df3eeac91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261022075727099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	BmRaVWF/p4iz0tt4vUns0i1wt4PXzCuwmXgyGyS/kUdy+cl1uCwl1m9B8dBRdw3nL9qZ60RkTJRN1OpF8V2bkV3Sq39PmHp+rux8iD0CGDnJSxx+29R4knN3W+PyxXiVqbDak95rcTjwHf8CrMKSlEqKf3oP9DO5/cmm42ECHG93+/+FgNttQng/1EKnr5MnsjE9IKQVxlwBIivZzgShhBYfGvwEYRsJMjqhfSX8uqZ57sW/YWy3UPuMh5vex8cU6RALRyLK0q8k3tAvBS34kBRDlFi4YolZY9o/i9pTOG4HCDgOGSJAla2i1p9IB08DNkpSS6vxPbQASRV4eWPVPMM9XkpRY5oF1aQHwNFHN/4SI570PUYLpiDd+X7Wv5PoNeSJ0RiK/MA2lxnADvYnz6yMv5Zb1i2G2/hHgdQsm7e8Mn2+cmriFHWb2HbmSveXIBLfcD5XewkTQBrrwpMkJLYmNa1OeeI9FkkTz7ICYjxsdwfujiaW0QINIdZQtBShSchCVZNf/FEkk2R5iRSrSM9bxdbI00IN+agiOrHZRaXsSzdNCApoD57RpfzVlM2WnLy1s367VZT2qrhR+AuX1h3h7iWHmZaFEErOTjQmKNIIB50K/aXUQNjLLP2YUC60L88Dg3mWtkb5lUUgiv9STlyUkscJOjIjDEcrTxvkzAqJukIQ7KgTRlqnRCflQwCxrFEqbp/IAv8PFvC7zjGjtI0TFrXigT9O8D8aIVTsmss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022075727099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fr+3aJWrrwygps0MU8gWymOC/Al38PZ5eeXXFm8/OgeKQ1g6tdliguqfOrdm?=
 =?us-ascii?Q?X0EB3Nn8vwbt6InfeX6+FLvR2uHmnoeo/h0qN8EsJIv6y4+PkPwH2Ahi+Zn2?=
 =?us-ascii?Q?o6UHUZx1aq8C+EbepUBOXazvT6L7Ye1FF71mnqbjPrEjfvixjy5vsUsrPDCQ?=
 =?us-ascii?Q?jAfzRR32rH2HDR0M6lCTSvz518LzKJnQXVTXWCLvr6htN7xHMeCULBlttTSN?=
 =?us-ascii?Q?rCD4u9Cl945gf4ZYNNwbxyoBrBHAN6nCbt8cCQEH3R+TAgLsKP4juQFchin8?=
 =?us-ascii?Q?ZYodzvCKa6pIKLXdEXNoRMKp+xZAttjXchRryCfldQUeEKNlo+VEoFUXZxYr?=
 =?us-ascii?Q?L2Iz07LP+/BBQkEz8G323dLaUWrzFivp0ifNCMKejZMC7+CnUjuu6zP0mt34?=
 =?us-ascii?Q?qD1onXxy/aqh6qdLuLf+ar4Mi4SS3DDcX55n6aqgCwYrDBM9hU438M4wmYKs?=
 =?us-ascii?Q?YkXTbeOkVxgEaDV8aQxI8XWD/R26M8NCCt9ucPwqm/n9ngv6gX8VKD8o0v9+?=
 =?us-ascii?Q?LMDCbUJbUcJVVOcL2E1nyvtI+N1vWC0mjTOQxNeEFU56bh1gW1t+9kwu2FOP?=
 =?us-ascii?Q?n1PoFSGEfLErUe0p3SX3gShCMPagQr+V5s9mCkO9M4QXc6qC6qFtAuvaNCIL?=
 =?us-ascii?Q?m+KJ4xSynt8ZgGhh73PbEot9gPkmQs63GfP+bZYdljZw1COaJNrNJL43CRCu?=
 =?us-ascii?Q?RXn/e8GeA8iCk6+wufMk58lOECtdmCM7UrFZ1H+TkqLecvmJbQZ0CtKpu0Vn?=
 =?us-ascii?Q?OpjJHSjijuij29urXK0zEo6rIAPC26e0KYyofC3sHxfcExLN0B6ig73IkcWt?=
 =?us-ascii?Q?XOdE0n0Dh40FCC68koKP40s/ojVtAAB6ZgkE7O11ctY/Yhrcdsue6sB5P5qs?=
 =?us-ascii?Q?uaGBe1n5qEhWlAWHLAYSrH9KXD/y0pTGJmJP6wsJ7os5gZXJbz+l9T5iPhyh?=
 =?us-ascii?Q?t8d+zrrbeGSAJiRVQBCIh0ZgmAuX0L206yyETWfpXsSI7PUi+sU8/WGKpR8a?=
 =?us-ascii?Q?Xjm98ybwmDO4LZf93FFZy9FIawwS/iCSSawCqCGSifE0NAa75X7yxf0tQhdv?=
 =?us-ascii?Q?MNM+GoVufvcxuAnyxQxaEGXl7FBIftH3Q7zj/yDkql/n8S4qVr65GIxJ4QdF?=
 =?us-ascii?Q?L7TAqTHLiVjIz+E3fNtEriI7sW/J4E2ztCQW65gcC9dt6NFdfIBloT0WAl0n?=
 =?us-ascii?Q?fObhXPdnxfYqQjGC06uC8qL+0iVpwDk969gsm78/aYVrNSKXZfdJ9xnxX1lh?=
 =?us-ascii?Q?uOBFQTc8x6HEJG4Fr+YQKZzmLpjazldmRCMr1j5q1DzuTQrwkYkH35ALWjY/?=
 =?us-ascii?Q?cIHOVA9pUFpZdZuT8tOEZj3VzDP2fylg6An+vn2hT69M0vL9A3JO1YuD7P11?=
 =?us-ascii?Q?Lg+dwEvHMZVo3jmGwean23MzBU/7+ftWRWJKCYICvqBucPCN2x5vb4a5V145?=
 =?us-ascii?Q?h9f65ucTKUWRwhPw3eaBBjQlgGArtYVUFg2cXFe58nSN6pzr+aX6XRcHiZuk?=
 =?us-ascii?Q?G/yaKPE7YuzwrL5ZvW1J8X8pU+3/eaUF1RbE4WSt+Igd3kqAPFNkEYFvVkc0?=
 =?us-ascii?Q?Pp9UAm3NEaVE9H/B65YfQLgnJgIrLzPYdcLxflhSGhm39Vym7nAxw+NIMbaF?=
 =?us-ascii?Q?p8OsX5ElvDJ5lyWxzh931FozU8fRyZY7SEcNjtgDtzWQR0Vda8elBC0O7vmW?=
 =?us-ascii?Q?G78awz+BNUF4YGLGMRO6AUw2ZpA6ofgV/yzrKeuSl2elfTM0lKJQJqJl3x45?=
 =?us-ascii?Q?8T+fO7RHO2Ann7sLwWOoqiOk1BM+HLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5a3cf8-c2ea-49fb-7332-08df3eeac91d
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:42.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeFYe50onn+6axROYH9EUAW3QKQdjp46WRJflr2BHXlivZw0b2F5MjDiflRcqI/K8TebEg7hb2pk5mkrkObNdOVQpl9+hrYZcONINNwxxbH5rUNyNuD8J8XN0pe+8pf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_register_[un]component() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  10 ++
 include/sound/soc.h           |  11 --
 sound/soc/soc-component.c     | 214 ++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 212 ---------------------------------
 4 files changed, 224 insertions(+), 223 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0d565b6c1f611..009e0140a15cb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -278,6 +278,16 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv, int num_dai);
+
+int devm_snd_soc_register_component(struct device *dev,
+				    const struct snd_soc_component_driver *component_driver,
+				    struct snd_soc_dai_driver *dai_drv, int num_dai);
+#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
+void snd_soc_unregister_component_by_driver(struct device *dev,
+					const struct snd_soc_component_driver *component_driver);
 
 const char *snd_soc_component_name(struct snd_soc_component *component);
 
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338662645b42f..338ba5cf85fb3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,17 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv, int num_dai);
-
-int devm_snd_soc_register_component(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
-void snd_soc_unregister_component_by_driver(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver);
-
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 6dad994009bdb..a2f079cd8aae2 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1549,3 +1549,217 @@ struct snd_soc_component *snd_soc_component_lookup_by_name(const char *component
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
+
+/**
+ * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
+ *
+ * @component: The component for which the DAIs should be unregistered
+ */
+static void snd_soc_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *_dai;
+
+	for_each_component_dais_safe(component, dai, _dai)
+		snd_soc_unregister_dai(dai);
+}
+
+/**
+ * snd_soc_register_dais - Register a DAI with the ASoC core
+ *
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAIs
+ * @count: Number of DAIs
+ */
+static int snd_soc_register_dais(struct snd_soc_component *component,
+				 struct snd_soc_dai_driver *dai_drv,
+				 size_t count)
+{
+	struct snd_soc_dai *dai;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < count; i++) {
+		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
+					   component->driver->legacy_dai_naming);
+		if (dai == NULL) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	snd_soc_unregister_dais(component);
+
+	return ret;
+}
+
+#define ENDIANNESS_MAP(name)						\
+	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
+static u64 endianness_format_map[] = {
+	ENDIANNESS_MAP(S16_),
+	ENDIANNESS_MAP(U16_),
+	ENDIANNESS_MAP(S24_),
+	ENDIANNESS_MAP(U24_),
+	ENDIANNESS_MAP(S32_),
+	ENDIANNESS_MAP(U32_),
+	ENDIANNESS_MAP(S24_3),
+	ENDIANNESS_MAP(U24_3),
+	ENDIANNESS_MAP(S20_3),
+	ENDIANNESS_MAP(U20_3),
+	ENDIANNESS_MAP(S18_3),
+	ENDIANNESS_MAP(U18_3),
+	ENDIANNESS_MAP(FLOAT_),
+	ENDIANNESS_MAP(FLOAT64_),
+	ENDIANNESS_MAP(IEC958_SUBFRAME_),
+};
+
+/*
+ * Fix up the DAI formats for endianness: codecs don't actually see
+ * the endianness of the data but we're using the CPU format
+ * definitions which do need to include endianness so we ensure that
+ * codec DAIs always have both big and little endian variants set.
+ */
+static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(endianness_format_map); i++)
+		if (stream->formats & endianness_format_map[i])
+			stream->formats |= endianness_format_map[i];
+}
+
+static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+
+	snd_soc_unregister_dais(component);
+
+	if (card)
+		snd_soc_card_unbind(card, true);
+
+	list_del(&component->list);
+}
+
+struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
+						const struct snd_soc_component_driver *driver)
+{
+	struct snd_soc_component *component;
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return ERR_PTR(-ENOMEM);
+
+	component->dapm = snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return ERR_PTR(-ENOMEM);
+
+	if (!name) {
+		name = snd_soc_fmt_single_name(dev, NULL);
+		if (!name) {
+			dev_err(dev, "ASoC: Failed to allocate name\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	component->dev = dev;
+	component->name = name;
+	component->driver = driver;
+
+	INIT_LIST_HEAD(&component->dai_list);
+	INIT_LIST_HEAD(&component->dobj_list);
+	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->card_aux_list);
+	mutex_init(&component->io_mutex);
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_new);
+
+int snd_soc_component_register(struct snd_soc_component *component,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	int ret;
+	int i;
+
+	guard(mutex)(&client_mutex);
+
+	if (component->driver->endianness) {
+		for (i = 0; i < num_dai; i++) {
+			convert_endianness_formats(&dai_drv[i].playback);
+			convert_endianness_formats(&dai_drv[i].capture);
+		}
+	}
+
+	ret = snd_soc_register_dais(component, dai_drv, num_dai);
+	if (ret < 0) {
+		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
+			ret);
+		goto err_cleanup;
+	}
+
+	if (!component->driver->write && !component->driver->read) {
+		if (!component->regmap)
+			component->regmap = dev_get_regmap(component->dev,
+							   NULL);
+	}
+
+	/* see for_each_component */
+	list_add(&component->list, snd_soc_component_get_list_head());
+
+	snd_soc_card_rebind();
+
+err_cleanup:
+	if (ret < 0)
+		snd_soc_del_component_unlocked(component);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_register);
+
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	struct snd_soc_component *component;
+
+	component = snd_soc_component_new(dev, NULL, component_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
+
+	return snd_soc_component_register(component, dai_drv, num_dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_component);
+
+/**
+ * snd_soc_unregister_component_by_driver - Unregister component using a given driver
+ * from the ASoC core
+ *
+ * @dev: The device to unregister
+ * @component_driver: The component driver to unregister
+ */
+void snd_soc_unregister_component_by_driver(struct device *dev,
+					    const struct snd_soc_component_driver *component_driver)
+{
+	const char *driver_name = NULL;
+
+	if (component_driver)
+		driver_name = component_driver->name;
+
+	guard(mutex)(&client_mutex);
+
+	while (1) {
+		struct snd_soc_component *component;
+
+		component = snd_soc_lookup_component_nolocked(dev, driver_name);
+		if (!component)
+			break;
+
+		snd_soc_del_component_unlocked(component);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ac72d9357840a..b0dfdfe8d4a29 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1376,218 +1376,6 @@ char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *d
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
-/**
- * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
- *
- * @component: The component for which the DAIs should be unregistered
- */
-static void snd_soc_unregister_dais(struct snd_soc_component *component)
-{
-	struct snd_soc_dai *dai, *_dai;
-
-	for_each_component_dais_safe(component, dai, _dai)
-		snd_soc_unregister_dai(dai);
-}
-
-/**
- * snd_soc_register_dais - Register a DAI with the ASoC core
- *
- * @component: The component the DAIs are registered for
- * @dai_drv: DAI driver to use for the DAIs
- * @count: Number of DAIs
- */
-static int snd_soc_register_dais(struct snd_soc_component *component,
-				 struct snd_soc_dai_driver *dai_drv,
-				 size_t count)
-{
-	struct snd_soc_dai *dai;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < count; i++) {
-		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
-					   component->driver->legacy_dai_naming);
-		if (dai == NULL) {
-			ret = -ENOMEM;
-			goto err;
-		}
-	}
-
-	return 0;
-
-err:
-	snd_soc_unregister_dais(component);
-
-	return ret;
-}
-
-#define ENDIANNESS_MAP(name) \
-	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
-static u64 endianness_format_map[] = {
-	ENDIANNESS_MAP(S16_),
-	ENDIANNESS_MAP(U16_),
-	ENDIANNESS_MAP(S24_),
-	ENDIANNESS_MAP(U24_),
-	ENDIANNESS_MAP(S32_),
-	ENDIANNESS_MAP(U32_),
-	ENDIANNESS_MAP(S24_3),
-	ENDIANNESS_MAP(U24_3),
-	ENDIANNESS_MAP(S20_3),
-	ENDIANNESS_MAP(U20_3),
-	ENDIANNESS_MAP(S18_3),
-	ENDIANNESS_MAP(U18_3),
-	ENDIANNESS_MAP(FLOAT_),
-	ENDIANNESS_MAP(FLOAT64_),
-	ENDIANNESS_MAP(IEC958_SUBFRAME_),
-};
-
-/*
- * Fix up the DAI formats for endianness: codecs don't actually see
- * the endianness of the data but we're using the CPU format
- * definitions which do need to include endianness so we ensure that
- * codec DAIs always have both big and little endian variants set.
- */
-static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(endianness_format_map); i++)
-		if (stream->formats & endianness_format_map[i])
-			stream->formats |= endianness_format_map[i];
-}
-
-static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
-{
-	struct snd_soc_card *card = component->card;
-
-	snd_soc_unregister_dais(component);
-
-	if (card)
-		snd_soc_card_unbind(card, true);
-
-	list_del(&component->list);
-}
-
-struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
-						const struct snd_soc_component_driver *driver)
-{
-	struct snd_soc_component *component;
-
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return ERR_PTR(-ENOMEM);
-
-	component->dapm = snd_soc_dapm_alloc(dev);
-	if (!component->dapm)
-		return ERR_PTR(-ENOMEM);
-
-	if (!name) {
-		name = snd_soc_fmt_single_name(dev, NULL);
-		if (!name) {
-			dev_err(dev, "ASoC: Failed to allocate name\n");
-			return ERR_PTR(-ENOMEM);
-		}
-	}
-
-	component->dev = dev;
-	component->name = name;
-	component->driver = driver;
-
-	INIT_LIST_HEAD(&component->dai_list);
-	INIT_LIST_HEAD(&component->dobj_list);
-	INIT_LIST_HEAD(&component->card_list);
-	INIT_LIST_HEAD(&component->list);
-	INIT_LIST_HEAD(&component->card_aux_list);
-	mutex_init(&component->io_mutex);
-
-	return component;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_new);
-
-int snd_soc_component_register(struct snd_soc_component *component,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	int ret;
-	int i;
-	guard(mutex)(&client_mutex);
-
-	if (component->driver->endianness) {
-		for (i = 0; i < num_dai; i++) {
-			convert_endianness_formats(&dai_drv[i].playback);
-			convert_endianness_formats(&dai_drv[i].capture);
-		}
-	}
-
-	ret = snd_soc_register_dais(component, dai_drv, num_dai);
-	if (ret < 0) {
-		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
-			ret);
-		goto err_cleanup;
-	}
-
-	if (!component->driver->write && !component->driver->read) {
-		if (!component->regmap)
-			component->regmap = dev_get_regmap(component->dev,
-							   NULL);
-	}
-
-	/* see for_each_component */
-	list_add(&component->list, snd_soc_component_get_list_head());
-
-	snd_soc_card_rebind();
-
-err_cleanup:
-	if (ret < 0)
-		snd_soc_del_component_unlocked(component);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_register);
-
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	struct snd_soc_component *component;
-
-	component = snd_soc_component_new(dev, NULL, component_driver);
-	if (IS_ERR(component))
-		return PTR_ERR(component);
-
-	return snd_soc_component_register(component, dai_drv, num_dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
-
-/**
- * snd_soc_unregister_component_by_driver - Unregister component using a given driver
- * from the ASoC core
- *
- * @dev: The device to unregister
- * @component_driver: The component driver to unregister
- */
-void snd_soc_unregister_component_by_driver(struct device *dev,
-					    const struct snd_soc_component_driver *component_driver)
-{
-	const char *driver_name = NULL;
-
-	if (component_driver)
-		driver_name = component_driver->name;
-
-	guard(mutex)(&client_mutex);
-
-	while (1) {
-		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
-
-		if (!component)
-			break;
-
-		snd_soc_del_component_unlocked(component);
-	}
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
-
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname)
-- 
2.53.0

