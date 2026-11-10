Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288296;
	b=p3WMfxHqHImMDI7MNTdsoXXppliIxhtu8LkIiG1EHUtHCASBQmEErOaue44JnIBDGC62
	 1TL0HKlwJ1csw6llE7Vqum6tjAW1Sg/JDHWWumxY5EOVHrb/IAY6dWT7234WHRf7YeagH
	 rFmztM5yWWBjhjdk6Aj8zhDcNIby2LqTPl/eUY0TgOX0/GYbgBOzpsK8hlK0/bog+Snyt
	 0TmZX+uExnvqn6MVxnIdtWyrDTqBcCfVuLzPmue0mXcmm8QFA/pYu4PM2R/LAp/q1COau
	 JglWy2rcU/1rRIZthppWkTaLY1d/iE+vTJR8xcmBq+ZQ15gOqLr+zfiXcc4nMa56IkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288296;
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
	bh=TU1p0x6dvKvZVg0vm0ZF6SrqLS8FJoJ984hLXMJYdxM=;
	b=h4+jsSfH82EvlTfRBhEdyQ0lDI5lrfE/ReJ5DRrcn6NQaH0c57TsTzjLhboIQbZds8WT
	 MWnTUSM2Fv66/j9cu+v5IUu6XkqrXJrJikWKpNERiqTD9YkRF1vt9tMFj0bkrISpjEcri
	 OA7zGXXH0Uzb9DxLbSczT7J4cQ7HQpE44GYWjOVizhShCLYmNT9mDi4sUCu7cRd1H9OfN
	 nBCQH2cn75BkYTea59UbghBtHLDnon/utA0C7GDfQBFRWYveCDw0pLsQiZ83idzZGiN+O
	 wDdUB8DqA9As1hT7oRx8+3rJhKzx1whWunhCNPivV4OajqjLH7RnFvA18n+uFwTFCDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mN0vsfYk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.6
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8E606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mN0vsfYk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgDkqkpgH46cNgevdeBj4FbvbdqNpbNRv5MhgO2BoZfs+6+h+y0dzRupcfjLJp7DYJJaCFv7btzy1msvJ64O1VvHqHV8PRwRXICkIbdldpGAaOEs/qO0gr8uIQJxHE6FhXF7PLeMgb3VpG+J2j+oRMU/oTesBnVfdv+eBgkyoEC1jySRDwHCQz0kQQPwy4yurIS00PLkizMPi7Q4hv/jg2+I3pDzvu1REWwq+HYmQrkMxta7+lsekf5lDQ7uMAL4FqK7YVIaAFDjxjnjo9axKtiMqE1kw3SKffNSr05ab47aeDY84c7ROVsvcmnv/KBfT6Ew9Buw5g3MFFMUNgRtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TU1p0x6dvKvZVg0vm0ZF6SrqLS8FJoJ984hLXMJYdxM=;
 b=CMoTK7OH+bLUZaJifkj92WMIod5NKbZ3Z4CTzNv4z8ASVI3sC4eD+3f52c7qHvuUF5I75ESpvqs/nGYJmlWPvOTzgjK1Vq2BvAmrOEc81wZK0MsbFHTTMehDEsOS3HYWU6tQyu0D/Lar5IIywvlTIYN20fDLAIEXwj8bmC6ziBzF2F/eMVHSX5shNSEU1XF/XQ5SZSywIJ3h6VIgISDpBgwAVM4z9upyLdhj76RRxBF5R7pID2mLAU1TmnlUvNNqM1xHH2YpCzbrU1ZBr8OwZF64CXYp1tty2LPIq8YLQ4nzyOyP/D0Nfv7KAO+vekMFBBlveHtYuYszmSXupf6T2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU1p0x6dvKvZVg0vm0ZF6SrqLS8FJoJ984hLXMJYdxM=;
 b=mN0vsfYkQvADoS/yNwajm2vSqOprf5rYiV6dgP6dUAAEisinD6+P4d1TzRh9dJbeZiPbeB64HEEXgUug6wtGnr1fWmaBSropz584zHpSaRCbVk8FYtIYNLjm3XMapCNHfAUcwoeXu0d8S2YVcgZ/oY6kSXSvL9F/n5XNfITEYcI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSZPR01MB6956.jpnprd01.prod.outlook.com (2603:1096:604:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:54 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:53 +0000
Message-ID: <87ld71mf6i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/20] ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:53 +0000
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSZPR01MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d792abe-9172-4348-9afd-08df3eeaf35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|261009223027099003|11063799006|56012099006|261021121427099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q7SQYDVj0XFFdHe1hWhcUnvtXYQ3vg5OXox3A3wJdNEN4P5LreXY3ZzdWxx30Xa7f84JR7PuDgfQ3MywogDKVsHJqyv8Xciifyf6M0Sm+Q1/1+tFXbfYoJh0U2ns0mqBudTv7e2B/dhgp6eyjydJKqIb+c09mVXw7kc27SRUqbzxvDtc1i6yYw3y9twmyykBm1iXnjAQkeNtzpAdWtTCNWhFscSmwhpW4XFAdQ7i474KnuQzgQ1xsEgc9pnSkjc77coqvk/+52xmHp4+Txb2JMzLD8+v6BoXWN8Hh8xsriEBO7iNDui89rbe5l3nQZT2ZrAhQCv79O1wOkoybV4wymzWbubm03FdwV5oTM3VLo3pingDedig7rLACfJy9cdhsb3V2/VW1TKP9ZLk56olX/0SEUF3NI1nvez28GainfjlvjVxMo1V22PgDYb/GpqmSrJnd5udZzt+FdXF0m+UJt6URLSBDwEO7atxaNEQOB+QHbaxsgFdWb8ReTFwS+14ky+OuZyo4eN64dwp1eV316FF5yorPWeWRfP+TgfRDvuWzUyhf9xop0UUl1MTpvk3VqTnvbda6w8GOkPx5dzRAQskF09Hs0XDkf3pcTI0jiZgYcTbwLdqnNF+SzqBmLya0mpNtGWK36qRUFPenOwOsWJOv955VXawDFrFkWH29gdu+QTz8BCzB2i5kHJOVLw4+WSzYw4ETmQ9WU7sePxSrCaaU8egUeNiDKuVyN9Ns74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8rvGIXnRNd97ykg4bPql5cNgJ3bq8Nfb9CRGevDgch5trYhMdeWWAUlSfxL9?=
 =?us-ascii?Q?PAVthU2GVcxTAATSWJgIgnsOSN25Ub0BFW8WKAkYaMv1CeiT7O2m2bW0atyw?=
 =?us-ascii?Q?R1uos3ITyEXm4JRjp78oH9kOkdXhpqE5CoO9EoXdoGpO4LjT2Oks+obagy5I?=
 =?us-ascii?Q?7KLlLjflULmunJgFtGCQY5QacBQKvCVh2ic+RE7kRrmWUUol6ZHVh++th0Wo?=
 =?us-ascii?Q?IwTEctMCHqCXXK0vSZd29FBriuTqSWWEW3/Kexwmls2M8p9/HyvE8WDVU9dx?=
 =?us-ascii?Q?0a6KT6RwsXT4KH6KqId5UtEyDwGuf8T8hicbr8ZW1lt68+qa+gyyEwIaWuSy?=
 =?us-ascii?Q?AHG9W+vPhB234yQn/fvBV4f+BvsBYG//ChqwFOG2frol0iQGrE6MYlHa8WqK?=
 =?us-ascii?Q?yXKjmXPsmFmYTXnR1guMeEoWscqye4aiuYIskpVBo33nxudg5w3ODJS4rCDi?=
 =?us-ascii?Q?/lzMYzR0Bclt3XcaRLvgBOHQwdGa90NVAR3vcp2MYfpmI1Dusvk18R80J/SG?=
 =?us-ascii?Q?ow7hoL9r6wFeTk1oGtk8WQn1n0pMsxMhTrHJ2DtLXJ4OeMOy7HIkqyjF2l0N?=
 =?us-ascii?Q?dTIhlFPNDZjpOuW3s+al19CKQkbQUpWiZiAon8YGDg9bFKcChMzwf030Kjv0?=
 =?us-ascii?Q?j+WzsENf+saBsl5UQpHRiGciFRHoFsMy7b+wHmVjI8WV/esG/i0++y/UGAPS?=
 =?us-ascii?Q?zMxu2Np71gTjk94kOFsJxcbXJ8BBLJ8ORJNKuFinG4PD3to8scDYJRjQfbC9?=
 =?us-ascii?Q?eVMrQ4WJSJGpalvWr4ctaEs51WX/pBzWsfGcMF2I3l4N3VOGlYHrOAU71P8L?=
 =?us-ascii?Q?8tCLICUjiEXOSyZHdVnrDXSFkJf7Jhb5rf1LyhgnWrkM1D3jkybhr1rRFzt/?=
 =?us-ascii?Q?VkBX0C5UlHmM2kkAOAUpu4up3DDNEeoxHYN9Lz5E/GZhoWPxHzb19lbp2qSm?=
 =?us-ascii?Q?Sgpxk6fISD591YlmgYFz4e3f884NYPyzlvpT/ZbY46y+KkNKHc8wUeBnxb7g?=
 =?us-ascii?Q?1s3+NmL8bZmZzd/7Ki5XllnuoL9hdlDTD/1Ey/pw6c7kBpZ2L2GtvUAPkG+3?=
 =?us-ascii?Q?xbvphBom8gRCb8+hZ5nDmnZrecG3VRZdV3Fd4gxgEN1vKLALRoYFlfeY4qQe?=
 =?us-ascii?Q?jIHjHi4SVYebKJTEHWuyisijz4azNKR9Y+5gX07Bwg1IfgwMXNj8pZ9YPvZ9?=
 =?us-ascii?Q?Dh/8BeNxiinqikKIOAaisP7++rQMo4n/PO3xxC56qqLb6+mVW/9Cxrn90nRr?=
 =?us-ascii?Q?nvxPj6Six/hsKf6b9jzr+PC7GKr9JiKJbU00ooSiOqT/q+RoLiQ903XhzRIl?=
 =?us-ascii?Q?3z/PczzEf4hDt7wFWMdUAxKnKgAo9Ig/N+DdBkDC1aFhQG0Szgkfm7UPNFfw?=
 =?us-ascii?Q?ev2eYbkR7Gvtot6PwcbCx/JMIw/vJS6niHIjfztuE3nKeG6IE9nFKOpcGdpL?=
 =?us-ascii?Q?shJOt4Nv/1b/0OygnOnZhJQ7uYgsieEcHJR/BfS5qkhYuzGIQ255+r7Vwieo?=
 =?us-ascii?Q?gNNGVzJL+6AFXIj836KWWzxA0oQkVd50pNxBZefeFOZusRf73qSSAuxVyUP+?=
 =?us-ascii?Q?jPbTXoMp+Br2mNbgC4IzIC1lfoAuNdR3YJWfLBYJTNuHy3+2SIteVQUbd73G?=
 =?us-ascii?Q?pwOPyrrk/khIF95JVOydV8lLTjB5En25RSoRrG7YU9IPGcQLUNguOrg2g3/q?=
 =?us-ascii?Q?kP0n4af5VFNon6ZiGsw/5sm3EbV7caBQIAZiTSj0xeLHNmvTBUkQjYVCeuuL?=
 =?us-ascii?Q?aQ5Ioi4/D5PQ4K23d8m6kqdQTYLdWjR3dWFuHtcXSVv89SEzFQs1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d792abe-9172-4348-9afd-08df3eeaf35a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:53.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fXhH5OOHDSwmNv9DvvC0zCzcmcTuujnR/3hN0Evfuyrq+2oWyLwLKH4jp9JA283UvIiDQV7bH2I0NpP8tgQYGov0zR2BhIB3aiZEq6JTxwuRsa0sEoqG8+63wXTfVMG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6956

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regmap_multi_reg_write_bypassed().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 89ae650b74f87..0a8beebd7b038 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -489,6 +489,19 @@ static inline int snd_soc_component_regcache_sync(struct snd_soc_component *comp
 	return regcache_sync(regmap);
 }
 
+static inline int
+snd_soc_component_regmap_multi_reg_write_bypassed(struct snd_soc_component *component,
+						  const struct reg_sequence *regs,
+						  int num_regs)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (!regmap)
+		return 0;
+
+	return regmap_multi_reg_write_bypassed(regmap, regs, num_regs);
+}
+
 static inline void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
 {
 	struct regmap *regmap = snd_soc_component_to_regmap(component);
-- 
2.53.0

