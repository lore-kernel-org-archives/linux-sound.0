Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12D3F5BDC
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596646; cv=fail; b=FfkI30BVdsES9HeZP/ARBXkTbxV5+CLeNC/nZZA48gzFPI7ds9knVghH5L42zAbS5S7K4nxf9139j+QurWObFHlZdyQcpl3m4WnI6A6CmW5iPmO1H66DmdF4CUyQzhZPPob90K28bBEC4uTtmFy3oC5gpe8vXwF7+Xnn8kErnrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596646; c=relaxed/simple;
	bh=/eWZAuVaWSomQz/UDMgVMlZdNsNv53RkNUpS6qiK0pM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Bb6k41lSBHGG0j8jz59Dzn1N+49olqVPFAXp+TStizJDiLOga7zV18OvEEh5PS8y05WQftWgt0tbIbDsq4lYYKnF66t3KMVE0tvKOVlIDHf4IXB1w23GhGn4NG6wnuN6n4DJGfg8CSwHJoN3TBU+JI91jgwUlTBh8ahioBBNQSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mQ7gu+bZ; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mQ7gu+bZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM16gGwOYf8aSxo8oLu4h8F5u4WORb0o7RpV1Ru3WXfDmsDVoTx0emdUIQhZ6wn0K15eMgfGFVaBTz3dycmAVzTQBiTDkC9DupGX3R0abdHvxA7HILr9wxy0bnOD7mxzcqQ2dckCD5lGqSwWFMAajLhC+aEogLFnIX+GaJdvVTmhNPplf/F+VXNW7Cv8iJe9OymbOq3TQaABPO6z4F7/xJ2lzqiNyGBJM0b2iHzaJGnFtjeu8sWB/QqKyc7zmkq129lOxXvBSUSw4/tY/fNvlEaHwfJAjn6bdLGdA6MAjV/XaJd5pDzkYdyzIQ2UWtCUHn4hGgAXqGB0wdieo2zoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRdyI0Qw9lqHRhsp6twahL6YHRfRdcoFr3/BtbhT5JY=;
 b=cWqawp5ViGobyWMO3/vJYzEee0JZGsRWog2gbkns1HSw6m33mUqHbUle6fGXjNjknIQM+RJ73b4bh6SYsvjcWwgP9XY+rpklAWXD+ugScmBsKuoJDhWVzisLX99K8xf5kzv9wHTtL5Z54IMfy8LaULDYuvPNsYT7r77O9nKTdAVeKDv/rItXeivpaMIMjJB7T+cnNo5TmMNr1gNBEWXWio3ZtIVOqKgX314+QgUUo9DZ+dooLQK3KRy7A7rbR5NryKrIlijXGJVXQlC7RBslpGcbMT4BCwuGTlXSxzbuZFS6PR5r+/mXlj//y1pIBl7s2PPt3bZvz1dWIwzG6Kj+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRdyI0Qw9lqHRhsp6twahL6YHRfRdcoFr3/BtbhT5JY=;
 b=mQ7gu+bZeUSKc53S2JSei2vQoBPq1vpKNo585VKR19cHF7/xUeH2wqv5lMDjA5Zs3mvozCtEl4nWxCCtVgRCQadE1+RgMh40AsSQzZY5fHygjODjwiEOHZENatD/Qcb41RNoA4cbKFY9Je2vxGwCUXYNeQAPWc1+ekgQY9BIA4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10810.jpnprd01.prod.outlook.com (2603:1096:400:297::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:20 +0000
Message-ID: <87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 01/12] ASoC: soc-component: move soc_component_field_shift()
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
Date: Tue, 21 Jul 2026 01:17:19 +0000
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b566ca-6aa0-4683-1c84-08dee6c5cfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|7416014|366016|921020|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	H2J+K86L+bgVmL8/MBwPU76PvDUZnGQE3pm+tM/vMiBLgx5iKB3glAVEUHzbBSnP68XGpbRxLYSkk0Qdqi9qYdAIcn5d5ZJuQszptYQgteXBVld88IObKQua1QA5FTs/L3BWA1OG0sE/WovnocEIdSdirixCZbZSkGqGnlgcjEFDlRw7Y8olM2AslLfh418lrAaPRZuFmGqJWA0j2uxpYDAoINAvp1FLtJx/QgccFcXXN6158GVY90ET1sgax5VczJRhTVePnbO5MNTWxIYCiZ0YI85eauiKgLRxEVH7mmE53vEBjLhMP9B0RGu5Ewgd2utIFePRjDZsbvNB6Wg9kugJMJr9GvrWg4KBq8B2omuCmzJKXKiylb+A//tuV4sOpjp63viq6ddeaAKpcFERR8E8RKFScU1ZyVq+HW1hRZzhL20qnS8KRrFdx7Y7U3TQog3jsfyPA62RN5+XVscK5YmGwoAzM26SQfhAMCfFyloqm6mQQNsTg0/nyLkfCUqX3dEpRKUZZEVrorweWHBluIok8k9BQjTKK+JqYxCJvvOCJKZSy4ge7QckuzHP0vJu9gSEsOIdKD1udpGYDOxpQlFhLT4k8exrTkjgygUu5pCp9e0RhoOvPR0/X7yslJdgnNJxlUfwR8CLRO+YHlM/HEhpacKQ3htVTFZ5IfNcvdKgrxvqEvI/ugFND8uHLAUSG6/3esRdqqCzjoXy/cE2BISOecmXHQNVV0o/qCjaVAE0l8Y/AjHHSHnWXe67hzbi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQeKlz5FrjeD+X6Q5gjuDxUisSgR0Zxe4ZOjnUmf7D05SX7Q9n3yiDz2uwxi?=
 =?us-ascii?Q?YSvAh5x0UAx5vYVagOJQU/wWmsgO3nSfNKUEbo0WwZZCV7sAUuK/DGVTqUZt?=
 =?us-ascii?Q?Bdl/LPgeWI5g8kp1VIeDhHM12OFeRH8CgpNRGPwa9wyPe0Z8PVZJGUYwmK2a?=
 =?us-ascii?Q?Tg8FxPWTj6GxsEPgR6kkYce8FP2eB2WntY3SM80Uq1i5reBUeDOC6/rQSFPL?=
 =?us-ascii?Q?nQGAm3cOL0wzs0H+lrdlAEXk4duYFR4JM076aByRm3Ux0SNVMNwHdYhtIW+g?=
 =?us-ascii?Q?m9o8Bye6YJTi7YVfZ+CG/tcDwP4++eqaZq3nyfPWgty14SFwr9ePqdQIqut1?=
 =?us-ascii?Q?YZZ60lrKru1wAvfCKJbhZVkA9FgZ5kFqUHvuag69LidYTKnEadmZQHzbuomP?=
 =?us-ascii?Q?h4W51preRWzovBgofM6brFima47vuQHNubTUJW0T9MGYDKdRB67Ogx6ZvG9X?=
 =?us-ascii?Q?KHwzcwSkqBzhNuRZuasVSFnPJrujrE71I0Sp3vA+4TxtEcjFMFwhghk8CX6T?=
 =?us-ascii?Q?Hx8Sj/CrkkT/FGca5dzMcDaHa92sh5oZy6GS+DJT8tZN2iu3QEm3qUTUuInm?=
 =?us-ascii?Q?rl6zzsZjb+vDWs4pvbjAH2xIBX5c6JV7Ctkxy0thyLrqAKYlv7gno2hKdL1L?=
 =?us-ascii?Q?kKzw/DzigcTR0BC4xW8i1yAmlowvGwalJUnhQxKSWKMDPegG3UG3ZBUhldfx?=
 =?us-ascii?Q?ePabZ6HX8FlCtBx/YHGlC9v0Qx1c3NZLH8nK4PrIpkW0AZLEicTqq2gp/SyL?=
 =?us-ascii?Q?AU2HN3xMWbPQ4iRmf2ITUJr7OhlqIvF9FwAWtrf8001jgArt345//qKZ7a1r?=
 =?us-ascii?Q?PjFHwrtRWsuw+ROQpMPYnTPyhI9p1KTvxV1HV93n3KFk6lw2kpbWA74t3gB/?=
 =?us-ascii?Q?bABjj1KgNUpIQK4axqoutdhEsPt87vyAIV4x1Qi//fal0oktL1Xj1fO1JeBA?=
 =?us-ascii?Q?y9TZEHQ+B7J0flUb2pR8vJqqU+ILcErmfHBz9U1oF7QZKOrebf/GsuRL9w6Q?=
 =?us-ascii?Q?vvbrRZM8f+fe1xnZH7k0s5n2vG3MTH2tpo+MTNm3p4+usZ8z78NzW+cz1KKr?=
 =?us-ascii?Q?ZzaDZQvBv9QiBbDQY8TTPRJuHpGBL8cR1/ZQIz3/D7VIzXUe+gBxH79zu0hH?=
 =?us-ascii?Q?u/j/LmESFS3mmj1nYKow7k57BtfeqoVWgKV6GtKXyXF1rqI0SkRr3KVUTehm?=
 =?us-ascii?Q?KGIAhL/cU4Z2WL4MOI0LCwnnERA7Ndw1uDO5gTGXhqHuwpeEWUlWLTStEjQh?=
 =?us-ascii?Q?utrZa0PcP3d0AgSXl/MXyHFkRhmWMq/2LPggyp2tbv8Ryt/D6emO8OpDgTyB?=
 =?us-ascii?Q?erz5tyL+JcP1Fjji2wkAnQ46bC07QVzXlMe38fn3UAbtR8B0zs1Dinfv9PFy?=
 =?us-ascii?Q?m3ekrI09x8DbEtTEhz4HLwO5CUB5TCfInMBYajlEwnT50HGexmFRYHNop/l7?=
 =?us-ascii?Q?Fnui5hg2DIYfnRO06gJOCW1DRMAFKmLWV0pRLsWgeWTlfH4nWxuC1jDhDMb1?=
 =?us-ascii?Q?nwgzVykGp39/uCH1fD5HmH45F10jdzGmf4bcat2z8Ez+Oq4oONzTWX9I/0S5?=
 =?us-ascii?Q?6eLIdby1oMatwK5DpVUQzNAsO7MKeZJUl5GLsMWgVaiyyrPyleCbLS0J8lAG?=
 =?us-ascii?Q?gEx/dn+Ha/gkmW51iVqpQC1RJEeDneOhX6uzLaA/5I3MD+fujeyyuf4TFAHP?=
 =?us-ascii?Q?/4HbrEWS2pyWmpOT3dkE4VwGox9liRiWfmIv1GY14bTtkj1eD8BwjoKNPaHc?=
 =?us-ascii?Q?lTRsuYLFceuS3FmleIfRhdlsJAG3OfPJU3jeJTMXpL5oQ2+YuQsh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b566ca-6aa0-4683-1c84-08dee6c5cfa5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:20.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzFm1mP4RW+61tW9J9rpw6ZqpN/DTvfzKZj0BWWIEufRZN+kv98nb8JUAbauQLRpyQsf7HSyaWIUaGntH8I89l+DRS7GW87fmHxQXMsNgMwkfSe5gTa/P2AD7kJlR2nt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10810

soc_component_field_shift() is used from
snd_soc_component_{read/write}_field(). It is better to located around
them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-component.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..718246e53e896 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,18 +29,6 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
-static inline int soc_component_field_shift(struct snd_soc_component *component,
-					    unsigned int mask)
-{
-	if (!mask) {
-		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
-			component->name);
-		return 0;
-	}
-
-	return (ffs(mask) - 1);
-}
-
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
@@ -810,6 +798,18 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
 
+static inline int soc_component_field_shift(struct snd_soc_component *component,
+					    unsigned int mask)
+{
+	if (!mask) {
+		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
+			component->name);
+		return 0;
+	}
+
+	return (ffs(mask) - 1);
+}
+
 /**
  * snd_soc_component_read_field() - Read register field value
  * @component: Component to read from
-- 
2.53.0

