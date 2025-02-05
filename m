Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3F25A628
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714841; cv=fail; b=T6SN/Van+w9Omv23T0eBFLAwqap4T0DzswnT41VSgdu7ZMxalfA9UQGZAgu+WYiWDcs+EDkIFt9uYbmFlqTJv5qNQLMnjMqJH7C9HvgaILS8cgrjG8NnR5jrxbk+YzRtsvrTKpQ1gHY9S30Jw9Dd2EkErqrB8gon6odCXjUr7ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714841; c=relaxed/simple;
	bh=LYa7lxzDOpExhGpP4LJq1bMZf3fa+HwUeAIqsmqjB6A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EF6k1ZFebr/nrU2o14obE943vMMjZ7z6zMW/yhCtH46MGNRa4obmbvEOBlAx0V2k8us8Hhet1RCx1rz+B0Jj43Uuh1vT5uKqiJqe0jPIUm3VgNYnMCHTayrH+9c3snxmXsyVxwsm6b6FJ9tUuLhO/DXo64ZkvLu/ZduF0eQd7wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pa9EN4Ta; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pa9EN4Ta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNWpvCPNCgkT5aovzPiFjX4dSu91vaFbJhvv8cLRSlaiEregs3h0ffgN7WuqfAUitF3wnwaiSqqdHx2Vwpf/Sqg5dBI4YRS4JqnsNVd+Uc8Cx3y2V0k0Ui1B2Fm3q2I/MJ9Ggkd4oGdAw7eJSWBrd8tzrq8Kr42f61Yw/Qr6YS0Ma6c459b/VUZQnS+AUa/m6j+pjQSXwc2DmXqRj+/muL11Cv0PPINf1Y37+JrIPnwLbYXIX15mIbcx46z7S+X3pwsWpSpN7eFhq4eZtSfQxhjrUzS6ekyk45f5KJKpkxJsLMKmUspW9ArqS0eqz1VpEY3+rpnLZkxZ7UfTnJ3j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhXUa0HyrYB0LRaidaaaIJ2aJ1GyiTUBDc+56GKnoN8=;
 b=rKVEs9WXbNw5A8HFidw8A4c0Sx0uEhZ5TQ7LAbDe2P3kpM2OzpzhsBMvsn4UQaWmmMAtOhWOkkWsxOx7TkBuOt7jN907pJSmaNOMrVZQc4UuGhP8OPvv1aXEEXk1V98dUWxrKB6ROHK05OI+iopp1dOLOdXMIk8+z3p+ydMDYjGiVAGXGJ6DiB9jAb5n2+FaQkiwTT6IbNE/mxHxVSc7TOjo/1e4s+WfLrHkEp0N5un5hLHtfZR37uGqqWAq/fg1TOsJ4x356sGUMlEIgdZ81IIBuWpfIqm9NrpEhKaYIM9qJkOgYipXUwQndZ4nmbr1vwVJVWlX7mxl+AQ5ZeijjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhXUa0HyrYB0LRaidaaaIJ2aJ1GyiTUBDc+56GKnoN8=;
 b=Pa9EN4Tae+TOnRYJ+sInOpWOEkqmlqLU4lsghW8rarJopgAf5wB2INHZv5z+Zq4pVxYn1kl7jcNRBGoMh1dmN4sEOJDO3u1qUar9Lp0E7ielSE+OuffDJMAji8rPwL4qplskDRx/P2JjIC8xfM3LnaUDCNodexn7DklwbsPJh+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10242.jpnprd01.prod.outlook.com
 (2603:1096:400:1d4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:20:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:20:36 +0000
Message-ID: <874j192qej.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] ASoC: rsnd: indicate unsupported clock rate
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
References: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:20:36 +0000
X-ClientProxiedBy: TYCP286CA0311.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9bb9f3-8483-40c5-3bb6-08dd457ae9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYVptzRdJNSDRC+IBnRMxxPl5ukTuYCn+DUQoJgGelcXBf+w9dsI+nOujo/R?=
 =?us-ascii?Q?KWClUae+wnzUgMgj2r7jF8vVNhlf751+O2f3pZOdXm0sqRe7OvwjaqNE3We3?=
 =?us-ascii?Q?JpKgLxU/P0mS78NONmgw8YjRtq+mzNqEM1vmQYMDEmWoegnQt+Atle5wsRmJ?=
 =?us-ascii?Q?4s8WHZY1zotLVw2zqy3TfiGlh7VkevSb8e5BudzuBxbKKhn0vofd8pDHUgry?=
 =?us-ascii?Q?YPYe8cNdG8qcUT/ZTNc/ll+PS3qyO5AzdPtvf2qFv19yrRMtx3Cf47su+Pk+?=
 =?us-ascii?Q?RF6QwgQU3fzGdYALGJQ2EUKS+b9B2Fcnm+KEZNFjdqQFRa/SC+KyzMov+saN?=
 =?us-ascii?Q?qz8B0QmHpP4Y5aq4wATUW+S0fhFV6/fCEVWWG4S+WEdta5tu6iimwlXWLPxh?=
 =?us-ascii?Q?MoIlbT0nMhYe5M0MFyN7yREuQKWmEJuBXdiHo/sXOU/IQvz+04AglFaojgWb?=
 =?us-ascii?Q?hT2gjA3S9Dzzg97nmIwvXM0VOXi1KtguRUKNGj2y9cQzMLoSRETctdWLdfKd?=
 =?us-ascii?Q?fviX3pwPEGekuCyHs5o/FLFKuhn/TYsZrA+5s7lBBy0c3nizdbE44Q6bkN1R?=
 =?us-ascii?Q?U+pISBhc6OzsONYO4BwL3sKOOWU32B+BHkVUyASDM9Zrh8Cxuji/wZBL7GtY?=
 =?us-ascii?Q?6Pb2kwdWzLYODaZoOT5WSzmqyiPJJXelcwS8ev8Vfq6g+nmWOCtP0l6brfMX?=
 =?us-ascii?Q?i+OtcAnEeondgLuqF7VAKAOHPQQi2kVukqJwQXY4NWsRkHwroBmqpyB4r3wg?=
 =?us-ascii?Q?H5gYC+xkPVhXZUbMJPkCpt3hqW/gf1oOKAlAxbVQI5HBPxI3C6LUuZmhgqYZ?=
 =?us-ascii?Q?nXGfol+lDiXJp2WtCUA4NQXGcckD3B5omhTSs04ks+bYrSCMCwpYwG8WTbOm?=
 =?us-ascii?Q?OTdoEXq6lGtQqykX69TvPVAL5MSQdptohYwL6r3ODesf+YnGsvhDj32yyGMZ?=
 =?us-ascii?Q?lfPqu0eP0plu0TxVeBa9uRonrTGtdbh2EwEK2OE9ZvSusEdgAhN66lDQovyI?=
 =?us-ascii?Q?lTM80vGHSSzLdv+/b1j1jG2oHj7auWNgy9QZfBXhLUReqwo2C/FqsTpB4qMj?=
 =?us-ascii?Q?6R/BasIyylOyTByfnGREdC+GER2q1PvRs3P+wI/Yxik9VjQTegbi7NiAa0DM?=
 =?us-ascii?Q?v+PTayvhB9dAG7gJD8dGlft8Bp3I2eiLj2hgaUu/CzcK+TkHqAbZNAOAbs9+?=
 =?us-ascii?Q?/AEiZUg5YZE/Ffc/3LPwdyMGq9VzdmWIl8ZOckwi52eBdn+TpfMKGnttLE3K?=
 =?us-ascii?Q?syz+0K177bMyHP/UielcF5cM6OsWluBiALetU2rnsgi60yupPXzmGMKwY9Hi?=
 =?us-ascii?Q?e8/phn4G5ChLy7K4ST/MP2vRL6vbqzCsgT/QF/EjvCYh2W8Q9OTHWm/jLhEs?=
 =?us-ascii?Q?W6fAaGWHi7UiEP0ClRTylBxsNqIbbCpdqo80onoYKlGsjlmXmByfhL0t2jv/?=
 =?us-ascii?Q?ledCZcROVevEIxXPVvtEO4fvUnJlYnpx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B529tOQlODTFlxA9RU1kvcQca/ejSFyI7ma27P+34Qzau1RofuMJwWJkSa/Z?=
 =?us-ascii?Q?4Iqj6P7rqkrptA40EvY3Hu5XoEW4Dn80Tpq511F6nEaD3E8Lt7ny66+bqFa7?=
 =?us-ascii?Q?Y3x4VXJl52PD5fw5N8ikkD+ZfnjacxAWMRvuIO7NyawZ5rjtq4kxCQrsIpSF?=
 =?us-ascii?Q?Dn6X8LYIrpMo1JZStVrJ1IEhrSKdxlzsJ8YpYv7NardQeCQX9PKNuGWGxo0T?=
 =?us-ascii?Q?6OVLSaZJHrqL29wKYrYPqUv/i2aP9YvNiP6xOV+sbQ5g5nmuRPV5u6aS5sas?=
 =?us-ascii?Q?8LZA3sUnK+QV4zsc5j0h0RIplWr8djsI33T5fI5Y/0VoL1xwEZTh1pN7rTlw?=
 =?us-ascii?Q?9gIsOnYWxX1jmPjhGvkw+hdLL6VHaRHCNplvrbprHi8Sua1qmJSL6KnMjs0w?=
 =?us-ascii?Q?pp8EEsh9E7Vv6+UlhZGYKOFPVwt44ekqpamBZ2KdQ5wDfbxZBXB/xk4Phvf2?=
 =?us-ascii?Q?6GxkOXTN5QtKnxQ7DZKrRP4UCe17JHWIUPyXTYl/TGKDU5ykfE3K1s2t1ZUG?=
 =?us-ascii?Q?Il51jB3xOzBPfTkf4Y3rPot8Tf1fdYz6PSptlKBauD5nACmY8aY0qpvsdepW?=
 =?us-ascii?Q?MmDTN6+oQzhZZPpI4aHnieB2CISFipq2OYK2PsrOWBYy8XOCk4d4Za2RwpsO?=
 =?us-ascii?Q?UjAE/98furDRGpJpsw0NQ1tVDG5jr0Kj59QtH1DlDa2LG5jwcMujhXvNrbsb?=
 =?us-ascii?Q?CGbKyFxNDwQOEoJUXSIKHuBq2TKMuFFpaHsjQ268QOYRrJq6WBE10GDN0P4U?=
 =?us-ascii?Q?kDmS/zIqZuJXnNwSpstJ1IzE7UmjMaRweOqTKA+dTyaVC8A6FyJQ1NUnqsYu?=
 =?us-ascii?Q?8zXupnPhXYymLdgTn+O6ecZYXgx0WcIucqBoPsdBDEG4T8V6aNOngLM8s6Q1?=
 =?us-ascii?Q?cXg0ZFKPO4KgwfEE+RORLeyTriRyAtTiQsAYR3fFq96lKbvYJMEC9u3FIl0+?=
 =?us-ascii?Q?TNVqHhTzEmkQSoLBwkszCOygONPcRcILCZmP2qOTAdn19CSWLhcp/N9SBObb?=
 =?us-ascii?Q?xtiWganmyxqWD/FMoAGCqbXB0R8T2m6mTR9/v9RR1vbY6J/f+ls7Kj1pG9Z5?=
 =?us-ascii?Q?lAeFJclaqcERy9jOhA0biTtA5Gj5voTk7fQh84yM962KqtTT215kVIXCjRVT?=
 =?us-ascii?Q?w5NofaYvpwTM3ebg4zfJkFpML1JzdY/yOv5PhcJvfq67xMUMptppSrhcXmfB?=
 =?us-ascii?Q?g7T5kNjoF2fl8WdvEkANS4kO+sjI91H4cv+s4GXKhq6d1thLgRp1Bs4EthhL?=
 =?us-ascii?Q?v3kz6R/FhSmsUc6mManGwzqoyUqX+JFITsXy3sFT5qv+jv/RtqsCeFuYyC2K?=
 =?us-ascii?Q?qTXg13C/ppSgV20q2ZhNknbT/MEzgJ7Dhpt1bh3rqQOMT7rnfhpovqPfTV7s?=
 =?us-ascii?Q?3+LT9HyIyZr2N4QEs2RgCP+7tX2MJ/HfSQqVtmIhQrnc2x0GL6LvOMdzmIUg?=
 =?us-ascii?Q?E5U/dFANKX1fly2gJFSpW/P43WxSkM85a4ygP42Myh0Cu9sLtu1JVTnrPKi0?=
 =?us-ascii?Q?85NkRs2uc/QZ+B5i8DCv5ucVucUZVJEIb0dA47tUbE4yCFF/cpT0AiK2Wprh?=
 =?us-ascii?Q?ZWwlP6kh+g5WmA4q7vqC+wHFSMLjzs2I8iskOaJcQcOKKT2U1bC/82f1eqED?=
 =?us-ascii?Q?uwYLqYgSmAVJRiS5nK3jfcE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9bb9f3-8483-40c5-3bb6-08dd457ae9cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:20:36.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+HYKp/iN5sIV2lPS8btnR3FauSMPG4NfKE6Gph8lc+8+c8PaVYMrGrF37dGdg88ibaSWc+WRkNxCzqRPyK6md4gUiXJhyTBvjXWWKzjJ/EqzbSCAn6LvY6LmQzLr1Pc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242

It will indicate "unsupported clock rate" when setup clock failed.
But it is unclear what kind of rate was failed. Indicate it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 sound/soc/renesas/rcar/ssi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index b3d4e8ae07eff..0c6424a1fcac0 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -336,7 +336,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 	return 0;
 
 rate_err:
-	dev_err(dev, "unsupported clock rate\n");
+	dev_err(dev, "unsupported clock rate (%d)\n", rate);
+
 	return ret;
 }
 
-- 
2.43.0

