Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5F19259E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533735; cv=fail; b=bQTNvFFw/DEkfpZpepsq3qhkPL8R11y/6Ct9nLHOmbbOTfkOpwnyomO7Cgz3dgH5ZIG4jEAu8bC6mFpCAaQRc0ypfKaoGfnFBhUSnLpunV9vkfc5fACZMQ7LFbG6Xur0upFks5cOzmEmsrPrC7upmUvsbsml5m29nfl59ERstS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533735; c=relaxed/simple;
	bh=Lc7H7OcJ3az0aHw27GyFzMFi0Q2Pwmd2Gw4AqRPo2bs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YBgPk+4gjnDSTAlmu+xY4ayphnL+idpvJSwMk86o797d3Glou1Slu8+QaVxiFPt6Flwu8cLhYw3+nga6iUXI7jBc9Zd6npEFbOhuVV0x7w/APWGxHuKNyninffhqu+8cOCus9SFICzpUg0rrwMEp2MoTM69Cym8OiG2VCs8kzZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Bku2+HGQ; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Bku2+HGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwYYq15eJDM7i9JqBu8ciJZ0BRTazJREIstrdWGdD2TxJSPNVC4rmiO11RgiRDxNay2PdXOHuYAmuUvOrQKBPcPO6/y5ZAg4EkKI0PfEvnnQcC3oj19MW3k/L13CCQ9sF/QrDNq5fIjamm0MOnJyXYNOJx0+WemY9VoSeuz51+3NOMHe3HNeLvFv8rSurU5ky8F+yWeOfQTUJktSHZgg99rw+u7H18tWhNbOfHfa4K9APi2Ad4H3XJagjGx4klaYJFkdrP1evCpNWxxoss52lREdDHaJd2eK/3tcR1I+FbrulCNROddrQlkLYc0hJs+xiifnKXA0jJCELlPaCn0B+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9kt5F6n+TPZQh4v48KHL1Skw6459wOB2s2xCFib6rA=;
 b=Z2B0S91+i+X6+Xvg6C72uaxNlygsLk2jdIpDGiqN0YSg/KGmaI35FGGiVjl5gZGRb0aHHKZvjOXu70Q45WFFltb1yPqgIhEaIRusX9+3O0fHmSknMOufM+4SWhl6tTkdDsE8dPS199JdYD6QgpLNgCSQsxGnRc0Kmco7o9GEsbqNz+mkcR+BqrEJ+g5EbIggVTOkLNj85KTOWqnta9LxB6hKUzAVRHHB0hb/zyne0OKd6qh+KU89dO77l4Lj6FnmtdEJKa7yvqAkjjVkGN0BBQuy8HnKRzhZltCuHXm3ZCKnmbQiN/DmebsrJfeGc2YaVJTdaWK1CoG5RyhtJnPOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9kt5F6n+TPZQh4v48KHL1Skw6459wOB2s2xCFib6rA=;
 b=Bku2+HGQq4CcSewOSuTP701aMNkxVaG/l5vCwTqbRrA+zAvZ7W/aREkRPYwloWD/huJENdvOFdSMMiHPS4627SieTdeDVjSOMcr9QRIS3mkSteIO3jxjQH41FB8h67dm2pGTAnErSwXYg2Z4I50PYdMQyc8levYR51oofvPJU9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:33 +0000
Message-ID: <87y0xtbi8r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 087/157] ASoC: codec: wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:32 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d0c455-f6c9-40f6-7067-08dd5605dc63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sjdXgmCMBcpm12dgw7JoDbvRZv7IczWh+sPQpFrh7VaTQLQY78omjjwFIlMn?=
 =?us-ascii?Q?CLqFF/Zlg6sgXllnGal+I7bDy3PHDjgIZ+6YFt6I5qIgGtB/k53xj39xVtdd?=
 =?us-ascii?Q?29apr9ub2xLaMADseMAGfhao9Te0UTWkVh1Q3Fnvub4DSqbpkdT8IpAtp5M0?=
 =?us-ascii?Q?X/0Anzt21a0yJreFFe+DdNMHDcYWYjyqi23Sf2ur9KpR8D4YgaUENf+GVIZ2?=
 =?us-ascii?Q?ULkhUPtqdmzTCuS6pOaUaQeXrCJJ0vheJGOKLnz1THDMKIdpAPQ8i2C4eNjl?=
 =?us-ascii?Q?9aGGBe/Du2/7/RjOhGh6rWG184fS7zYdcDHo0WcrqUtf+bXENXshquGgbZ1g?=
 =?us-ascii?Q?cR9gaKwMVzPM5NMgTlxcn2Y48ttOSoPvu7A/WFzgisd6NTM5EFoe+Rigk1PY?=
 =?us-ascii?Q?RFBg0SCVRrKEwEoC0PO3Bbq9lRDZXai3t1Ii33RXr4sWG+Salj67VNx30+I2?=
 =?us-ascii?Q?wjNfQ/hZzWN7PblKfv1kEN3/5dlOmxofI8iwYRBJlBLpneRCF/QawZ47IAgA?=
 =?us-ascii?Q?1pUu/VJA2S4oswGyaCZWzppytK8d3UNEVDhrD1Lfdb06jufYXuco8/V8F8m+?=
 =?us-ascii?Q?t6LkL7v9I6knYSX81Q5nyG3asBGK+kT2vEPYwbB/chuvf/V/gCyMS8M9TaLo?=
 =?us-ascii?Q?xfiki7FaXmQnANktIcAdnoR2VENQ2dzqawAVH/eYdaLZ3riIsNyZvRcjIrUB?=
 =?us-ascii?Q?pS83cXwJHRNT7mVmW26JTKRhD+7lZwORNuUQX6W2I37eC4M6UvhJZatPPg/Z?=
 =?us-ascii?Q?wTBw+Vrf367O/PZ9fsBM7gI37np1jKi1UIjnHMN6+7Var7Ybpc6h1i7jRzF4?=
 =?us-ascii?Q?Wss6gW8qmCvxtb9O8CjG77JgnyQjtcWJhihGREiu8I76uY0u2uxO9ILMAFTO?=
 =?us-ascii?Q?ssR19q4sZ5XS27Fq8UsUXVjCMxKLDM1v4vTuCopRCbbhMSu0WrpSRmgxDzNR?=
 =?us-ascii?Q?kfd7+/V8lvDET0+hUiYDDi4MmrwWX6M/kaDjmyU8a/VHiBPwpLArJ5jTNq4V?=
 =?us-ascii?Q?qWACl2aU13VMFIG3vRX2HcIrh0GNckckx1cj1zhZ2hdTPQkiCxbziOsmV/1t?=
 =?us-ascii?Q?uRRqxzOkAdTyP3ZufFhp4wsyHedwtEc8OOB1uPrS2bIKroCJMp7ieqLzHSO+?=
 =?us-ascii?Q?9fcbgbilQPyo+hnW5TtGq0UqrJLriw3qKTycRVCmJ0gxI1wqVkdISOxuCH/Y?=
 =?us-ascii?Q?7fjOH6cT2zOb9lg8rOZ240Yr8UiEJ27IaJ4vLgEGB1K7gCJP4JkV3R+jS1ho?=
 =?us-ascii?Q?NNDV8boa+eEwaPoBltNvnhFEcG+KUDLS1qC4HiB0yOZjxtitpdagYyNoF/aB?=
 =?us-ascii?Q?bLWRHuUsXVuuhdLRoP31g3aWo1Z/DREP+miowIDLDLZb3iYFwxkERkwvQPch?=
 =?us-ascii?Q?ByPtzl3I6ZJuRurZXm7lcDAVEo4E8PWlOjPxhKgU8M07Pq8G1smysrooCjQz?=
 =?us-ascii?Q?JNO9qsplGULIPhF3ys+Xgdi9yewJAc/n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwaNGSZfKNC6lpqdaR8JQYfcPp15jAGPbXDjzob1JOIE8phhq/OI2JY9zd7J?=
 =?us-ascii?Q?GJ/V8Fps6UC9skXvAX7t7DDpXim6zMIPyBN8NYJIvVltV/t8BdRc9ODYUSKx?=
 =?us-ascii?Q?JOxz7b+YexvehP9H7upJB6vGj9neZ6s6kAhD32q782uIpxFhupCYZs1embte?=
 =?us-ascii?Q?mWrQDFaDoHmE0Pil4M8zqbVT9c8WAjhYTSPceS9Xq5OuGIirKNxO7qutoaUd?=
 =?us-ascii?Q?O8gi91x0t1w2juvf6+i9cfBoWHo/gxSiza6VePCNz67JGFz7NhRhPmdBZBjC?=
 =?us-ascii?Q?rJ/kaNcHvuFRh3Kv6I2H+yXfFbTSvK/qG6oPCkUujYAOX4PjQRA0dLTsctkD?=
 =?us-ascii?Q?/kKLVC5KCVnA7zgQp+/3ibk6vjdGCOClkygh5u2QN62HxUXBCV2ARHwseaVs?=
 =?us-ascii?Q?wJcxqtuxy2UxtmuZ0bJjB6u98K6nw96I/q39KTTVvXtGSWf1rUvR3hoheDAu?=
 =?us-ascii?Q?ILy+EIqiLIROB0pOPFUW8WYlHSEa7nKf6Oe2ag+f7l0bPVN33rBHslGinQVk?=
 =?us-ascii?Q?FO4Kf9+1n6xx0jsUwniHyVi5yWa153WAE7L1vncQDaDfFcpmAN9SAb+KCGLl?=
 =?us-ascii?Q?duU0YsX+x2UZqhf8v+9v8ja2OnvWYze4tpL9bqDSkpAmbOe116nI7vcA25i9?=
 =?us-ascii?Q?5HbB1QhT4tlaPNB5WIlH9SvihwnkN+pl4T723rhO5DDJhTw2Uot3zX3JCtQ5?=
 =?us-ascii?Q?ZYPF25NgvB43RYY1wwZ324jxrERdMViLzw45m4YBR52I/hv/zv8+7JQPAPWL?=
 =?us-ascii?Q?bgqXyJTW0wuB50GhsnqD1yXYGtFaWsKTv1PR9m4sjeluqRvnaKlLgWJBh/1v?=
 =?us-ascii?Q?ceXQZMaH3r435JOSEphHrH/iUBOrPSFm6kdtaNf1zInj1FwKU91Fp3zJp9NF?=
 =?us-ascii?Q?czpU41WKhccUrswlbQyYhMD8B42uv9UjIZhu+MLB+AC3jRbtg8crr5TCKAe1?=
 =?us-ascii?Q?/CVV0s/8M0Db0qKm2KmH6TRS6gMQsVh2ZtGTW4UKq7p/kLXFgEl948nkwxfN?=
 =?us-ascii?Q?zWDYp51raUG63RJTYK3WZmVfz/A8vvcqkMojZCv1jwc1XkJBoGyu4hXt+KzU?=
 =?us-ascii?Q?0ctiaE+dPmfF50uSZhF5A2s6aD4twut/t7BJjsb16YNIg2B19hwlMpj+gk9P?=
 =?us-ascii?Q?JXK5ZabEQz5fPe5tqgi7AzFgC9yk4G2vPWoyk+hlTES4j2obJNe6EmycOI/F?=
 =?us-ascii?Q?+FQbfURmXyPfAs9lAoLxfVot4H6Z2nTsOEhAIEwsqFe7l8G9J9tF6VwVBp7y?=
 =?us-ascii?Q?iuEF3csLlwd2teeBTIv+sG2iQCmQH2cyECXgapF1n4tlCOIxT1Mhh/2Z5wNV?=
 =?us-ascii?Q?oiqAgBP7k9RTT4BovbBQEZDnl3jBRtxfk1aeATyqEVE4S6vcGoGEtzdBi2oU?=
 =?us-ascii?Q?pEYQYQ9NHDfdKri8zld6850vnmJqyR07C774Kn73hOUDvApzDpKokjZGY8dL?=
 =?us-ascii?Q?w/fxWM7CDC9iOWjKyB1FuXdIZ7k76tmedMotm1fCJsPDhWzt+PaJ8Zpjnmqf?=
 =?us-ascii?Q?SuH4PGDXF63to543xC8L/3wLHkhBU0UtqogUc8s73cAb863ej/ksYXYWucF0?=
 =?us-ascii?Q?EnfLSZ10zJfBVSSkGBfkoraNwz3zmDdEDwVTh/lSO0KRJ0JVvAyB0cooX+FT?=
 =?us-ascii?Q?nHpCCq9resiHb7/e9U5Plrc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d0c455-f6c9-40f6-7067-08dd5605dc63
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:33.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nY9aHDRAu/Eny9ZIDLWo3etTHyueKmpdao/dzDR9/l3gYxMu47lr217XfWorsQyoF/T9NWn7piCalaJ/gSGTorA73xcwVk3Ck+v49VPL9RD219bV6oTO7I9Km4WAXJlQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 00858b9c9568..e6525b4cedfb 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -540,10 +540,10 @@ static int wm8960_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface |= 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

