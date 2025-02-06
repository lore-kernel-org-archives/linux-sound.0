Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3C870838
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 03:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812165; cv=fail; b=meiysfNoWUZXi/23eB3Z3CiLHr5s8BReqbdR2wQUjD7ayfaNmwGY30d7b0lkSNfI82te9VAhdP0Nh4fJ+hNxHV3WcITr5MZrykkxl92COw+bbI3gNrmYwg64YlscML/Mr1FZ1DiEwBz38Lhaah7bhhY9DwhFnSQ85JCk5rIPa4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812165; c=relaxed/simple;
	bh=XclGnlDlHDoezT62HHCuPgJV2p2a7wOrDWT1xfAa3CQ=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=U8+E53NyNFaBra0ZubuDjIav4ywQADGSgk5MfFg0v3y0uV/5IUg2G4RvAXqC7VjF5CYvDON2TjGgHEhZh8Z3y1ezJf7izyCC2GZP8P9pn/Xi2bNJ+HyXhiIpXeHXbUDywB+r+N8puqabVPSQNg+N2menJVa2ba/CeByooQe07g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hpgKUNtZ; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hpgKUNtZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9mg1sp17TeBUwmpdcjQsvQme/hutxr96I0AsQ/YFqOTYhDXgLz9iQOi/EsGCsUsgy3diAUDfIR4qD8zSe96rWmzURzwmVKD0XZ11rw29t6QMUXkbfGZDyAuqOd2WagYx0HeJug/kwP2oRptiuxXH8C79UVgrwRaJ52wfDW3KxAn/5l3oNZYxqsvTtPG+P3HI/O1lK03pi6fAZTNkgPbCUc0s11QEMX7DIgB2mdTHnWooo7lwysfiOd+wqdc0PcphwZ7lfctI9cQuvqMKKDSOmDlOS/GrnzLaSPP+rBvdrpFQKyXkDWFVNyqUwRcb76KFY5FZ3eF4/mcwDoFrqnrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueDFjsClWwsdP0M0tqb/NR4Omj+lQGHVeQJz4wECDAg=;
 b=IawZy/HsTKz2P2sJ5V2W4/mqAxKscPrzMjMJDo3XRsuL9aIBdKs52znE9Q9BTn/bNBHeAYiuitGEQ9QLnqjRUvtZZUL6tAg6wAKmJ9aL0J3HcW4EsBEv+jyVGiUoRQ6Eia5Pwt3hIZyZrNZNbc7/Yfhy3j8y5H0wO6kqK8+KpM9Nx/RAeI/R2cTZn/1ErndmYIJnZu4m9OGNtGm/5f10N2hUdmEfdDdRYEuL7aEO81R++//eA42dLT31kL6ywZrwF0Fy7jmJ8pTFl6v+Yd231E2rWt4y+ZcI3LppgoLAbWFp+OsI9oouwxSiJ2Kn6RemI9EILDWkc0Yy7hH8Yut42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueDFjsClWwsdP0M0tqb/NR4Omj+lQGHVeQJz4wECDAg=;
 b=hpgKUNtZ+ByaLISeyb/syjT5uxPjlTy/Gg5wLLf9yQi3HvxGvSdd33XYkB4fqiBNkJP7ZDPdAY/V4yy7usuAVUWJpyJ0Nf+1z6R7ATAsNQebfw/eeSYZfOlOU0gOK82k9SojAepK3s2C76iOMxL2Y59rFNfFVd6WQ5RQ9Vx+a+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7214.jpnprd01.prod.outlook.com
 (2603:1096:604:11f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 03:22:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 03:22:39 +0000
Message-ID: <87o6zf3gg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: remove verbose check from snd_soc_of_parse_tdm_slot()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Feb 2025 03:22:39 +0000
X-ClientProxiedBy: TYXPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:403:a::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d019f20-3c45-44dd-721e-08dd465d8294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQPgS3JO/XB/XCOFTDUd0PhwFjVz0/nwCw1Jmr6jJG9b7OAaJ9XIB1J6wzjO?=
 =?us-ascii?Q?pa7kbKHGbzyKOAT8Tj6j++A5njgcEVGO/45TRB6tUSRBGh52sekecuwSABtM?=
 =?us-ascii?Q?FmbRu2aauLClxw172AwKSK8Ov3I1zyYQXpKibsiK4e9IF1i8P62cj89bW/ka?=
 =?us-ascii?Q?Wxgxz4spFgYaoqWt74T/T7sRYRe1RbkiuJlUXTCZsCpYC4g8h644bdcd7HBx?=
 =?us-ascii?Q?WNRKZs5kCpW75RgmXMVRiJvsHCUBg8BsHunxjvi1zWHnOAn4a9TXnqgJLpB4?=
 =?us-ascii?Q?EhOSEpI/s3roUY36ULo0Wo8PzPLts7vg9CV4j3VMZiArCmtLJBacn0fjH0Fb?=
 =?us-ascii?Q?AtCeZQQrALdHuTxLdXUtyg/5uv+UIi5Do8J7xjM1IU0Un/YiQfxwlb58teXA?=
 =?us-ascii?Q?ZFRShAZ7N+Gnm+EkW3RFWpENn0A8Qk4lEzxuQrF9BcQPuTmoxImvFcO1M5ID?=
 =?us-ascii?Q?AeVS540IjcXJRC1fwZbW5M91+5G/GWraF7wT1GL8ZDNjagMUvciuR36nbJk0?=
 =?us-ascii?Q?rwiXM5ACWewBNR/aMlMtroWH4gX6xfOBHdAJAM8Fqy/whn8k4g2RTjFAVTAc?=
 =?us-ascii?Q?9CXZFOYJpi4Tgz1WY3wxcWbzIH1K38hN+7DBnkdRS5M4m1dURUpC4qVzwKCp?=
 =?us-ascii?Q?t0Glwfx/3mAoDQ2Ud/1a6vrKGLfIY/El3XBwb2K56Ei8FxVlfdZEbXQZK8K6?=
 =?us-ascii?Q?LbgYZR2RtLa/BYEaXrtagh7uwcN3IvUSyjbqxTcpNC4/kuEJJUwVnINUGBJp?=
 =?us-ascii?Q?ac/D/y+uivyXhSD0Yr3dMVcalxXtBS/Ihn6JW8TwxV/k41Hjo6zBZVF9ynMe?=
 =?us-ascii?Q?DHJw8oIkn1ARDi9phihc+fkIesfnjIfxLihZSoqxiOZN4P+eAnwFXPC+/4cc?=
 =?us-ascii?Q?kw6nqmvwhR7985514xNeDXlXzpe1NMyRL/WAZidtHTzeL4ohbCCxugDme6iJ?=
 =?us-ascii?Q?01/zPqbcVqe/MjwDIQ5UVRipH+77JmrNoWtK2YJa9EjpEW/VUJfXZo2OnhTe?=
 =?us-ascii?Q?lc6TUZlzM059kiVKZCd4iNGHOcMDQptqPfRIHJPTHlTyyllOq1w5NJmz9qbX?=
 =?us-ascii?Q?oUs51VKgWcxwCf7DQ9HpBh/GtnD8mi8WFVkP8GjsB+0PwP4oUc4GsuGWTIG/?=
 =?us-ascii?Q?CRykKyV7vtcowAx/iGqaFie8Xtfni/PUZNsnALghNgI3du4l2s99jrDVtYnn?=
 =?us-ascii?Q?P0dB5Fi8v7Woj9Lp+1YJbJ3B6kXvBd47ZvMTV/dK2OnUXngcWY+OA9s9UdkO?=
 =?us-ascii?Q?U754WBWfxw9ZUfJxowg1D+tGsZW0y/vEU/gbcrTj1olRKDJJp3BiPqbDSrqL?=
 =?us-ascii?Q?90feSvr3E5xcN40Jk9ZlB9o0pUtGBDDQpGHWw9JmXpCGeLbXTs5fLWTn/dI5?=
 =?us-ascii?Q?LDwD/wSmcNFQi4WOX10GCDfFVqf8P0RuxpQR6Nl5BJFsiRE1Qx+Yzx3e33M3?=
 =?us-ascii?Q?32z1qQV8bke5Kl73W8XXTpS9PlUC2MKL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EvWmH4uGNWUAkVOmj6h7jms0d38wTycKzTwUz07CtMOrZQ/wESJLjdXCzOcR?=
 =?us-ascii?Q?YDr7fzJGlqBwgJUrt1LWDa8GSJrSS3HQWOxp1zT56lPphBl04LhfyZuM2WDb?=
 =?us-ascii?Q?pYfr6Nlh56KiQ03qcG1ertlWJZpqi5NAo4Q3wYI3RAp0L+5KosenliNRF1T6?=
 =?us-ascii?Q?39bJXJh+EpQIAhdSxiE4tzEa/ih2IgT5VLnTyv3vZsEwWMp05jOnKjhGfmS3?=
 =?us-ascii?Q?p7cUC2RoXqlDuklO+WUOSDPR5ZoxaHxylo5WHR0CB0KCBumNz3Qfi4COjetz?=
 =?us-ascii?Q?gnBca0u1b7j4uPbgjyDvpuadA7CajvoCHS/IcB54aK3remKiCXQoiBSYkN9J?=
 =?us-ascii?Q?tj7mSR+VwFZc1csKuEphbkKXd1+VVLreHJuhHtovmYYtrfDe7RGsnpjX5wUy?=
 =?us-ascii?Q?VAcHvqlH1uXEr56Lt26ejimudE79KNI8Q+meKZI/EXAUFM7N7Wuy/S3GX7TR?=
 =?us-ascii?Q?0/yyWXbIZik0gCaKH7CMWryvqpO8vMOoyhUz9tJlL4sPP7kVNpMZl641EUDM?=
 =?us-ascii?Q?EV3o8l0sCksmlochmgntS1ra1O7oDzV33bLzwCypD4ElQ5zDkrOW3STt/bEH?=
 =?us-ascii?Q?/MXhXecD1mrl2OH0/V72aGJB/bjWUzAnCmHVfTkaMBBdixy2yjdITJfy6xHI?=
 =?us-ascii?Q?Nw8oFVOFCPC41ZIyzLqWpc6o/23EkqjhsP0JyJ1Qs99e1uHHXpIfHQkJZoXp?=
 =?us-ascii?Q?d7AgntMutnD5FJtkC7/GWqTIGQSuBVPkPLDhZDU568qdZHNErnyb1/bdH/Hy?=
 =?us-ascii?Q?LM1EQQPgszAqgIGOx+aNENmuhBDGWamQnH9vwXuuqjDHZYrVko4YVoW3y9HR?=
 =?us-ascii?Q?2KO9okA6HzoaI23JFVkFQzl3Ue4PIlCoumkJfDN1qp7Z3F0PTFcXTljHQTg9?=
 =?us-ascii?Q?uUZjqDUwt9kn4zCD+V07YtZA5wE5BX6ZTomR4Ab4XGcPBd0Wd15xeiNdPIDw?=
 =?us-ascii?Q?XIuZglZLAy2RZ5i5ltRkAusdFJpBZNetDi659G/mH0gUZoBj0aEIOJaa9eML?=
 =?us-ascii?Q?F5WmcoyQ7+elGsRxPzuSh3/fP2JjXGfjH1IMCP3zuFtEACiY8nSR7puCzJ5b?=
 =?us-ascii?Q?9unmrpIQ7yBWsoDro6fs1NPYQGiS+Hu2VtHwxCos18XdS67aSNS6TCXoVIQG?=
 =?us-ascii?Q?ru2kBn5TKYPrF9vcYuLLZ5vxCHuJSH2MvxOoWy1YcRRYsHdPCgzBLTU7m3F0?=
 =?us-ascii?Q?1n3b4Lhk+clmEk5rXGAyFfHX+vCV5zF39E2UMAy6sl79Mk7jfaJpCu8vj/k0?=
 =?us-ascii?Q?wAfJkXGYE2AtTwELsXOqVOIbGjFssiB6QwmI5cMMq/PNCEvgjqeXs18xP7Gb?=
 =?us-ascii?Q?i3392u/IE7vDU5CyksGkSKc0kec8wlY7gS9eL3CZP64AYgjJ3MFBcrGte33x?=
 =?us-ascii?Q?RKOKo+tX5ZCgs44EWFQ0TW4VYIe+2lHoylHlkIY4SYlMR2xVIVH0a1tPlmcd?=
 =?us-ascii?Q?7beK2AeNSPVcaRhWKnR9mYrWF7v/hc7S8IQBXavSuuNXuU4zi9QKbmu0j9en?=
 =?us-ascii?Q?CG+Uz5RuY2dWcHSjvOvZUN1C8G16OhIh8pOqxP9RPvRkeVFf5ngw5M/mmGtV?=
 =?us-ascii?Q?ZpiAIIlFvCNeJmXN6cB/cGP7a5YiL6eoTVNFhuK8IWjVSy8BTsJC2s0vNEPt?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d019f20-3c45-44dd-721e-08dd465d8294
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 03:22:39.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGf0Vg/FUT7YsNZtg6Q1UvuPMm4EzElM1b6aj8Eh1qhUi2YKot8H+OBrBSy1SkU5qCoxEyriKxL2AO9WB0ZyJdtiXgK3yle3RgJDbLplknk9dwUFuD7xetuExjmIUS6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7214

The reason of of_property_read_u32() returns error are

	(A) -EINVAL:    if the property does not exist
	(B) -ENODATA:   if property does not have a value
	(C) -EOVERFLOW: if the property data isn't large enough

Property does not exist (A) is not error in this function.
So, current code returns error if (B) or (C) case.

But these are handled by "DT checker". We don't need to check it in the
code. Let's remove it

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index af75e59dec377..1db86438abf04 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3117,14 +3117,10 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-rx-mask", rx_mask);
 
 	ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
-	if (ret && ret != -EINVAL)
-		return ret;
 	if (!ret && slots)
 		*slots = val;
 
 	ret = of_property_read_u32(np, "dai-tdm-slot-width", &val);
-	if (ret && ret != -EINVAL)
-		return ret;
 	if (!ret && slot_width)
 		*slot_width = val;
 
-- 
2.43.0

