Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618B46447
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702613; cv=fail; b=dcXqKpK+eq9hJV9fHpUSUKU4ZW8qVoSnD0wBxzYcAl2IgZ+vgQaPC2QGvaSSIJiUiuMf6B/Jk48oIIzlhEZbh+P+BO4UD9Kjb1G4pPBdlX2mtMOte1rc045fDj6O1/VeTxYCBxA/Ty0fwjve5MLaG+bNFZwznf38uZ7CwIXf+0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702613; c=relaxed/simple;
	bh=f7Ch/mKxJGn54fqXfeQqJyEbwh9UBKPbog3JtHVQAQY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p6CMGpCs3cckE8paZY5O6FNxtAMBo/NtjKQwqRSICRiSytoHoie9mtkaBmnTpNv35zYQsElenGXmMC052Yhgfk48aSPKA4YLvntWAQHWHBenxPsQcddbPrAE0Ee6HqMFfmR1tvdpSf2vbnduAocR0YpFzFW8GffJj183XRXMpnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f+3dxUOj; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f+3dxUOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdN7t1pEh7cGJwK525k6YovEAw8WihekSoY/u//k3PtkbxNJ34o8rC8Yikk0UIx9Hb+9mCYB4wu7sWg9cfyjsmw8XU77PsC6wnZHwDijUPomlh4xp9wTkT64u4zWQMgcOlryAjky7Td7AyZnW6sPNlPCjGbD4ycqoZ4SMwINSjnSKjW61aarGliBxQ07sYoUeydAaKpeSG3xf6ZUMM9BmWdeZ2MSlA7hTuU+J627kStAX7W6ne0cTwEqIJun9TB0ehnVfx2HI+jdIUyKVEmBc8Xo+q78y0WXPddjZMR0I4lDcghLpV/O6+jxB+pcxZZI6ZVfwU28fT9BR2pKMidiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYdZLvGSeHPfWmDCwq7UzoFNzacWAMPE6+nAiNZvses=;
 b=hHms3z1bjm9caGtwo9Ww9CdssQl1wk/46iw84uOxRnPu+tm3D+kb7eiwU1lSHVYV/cMM8bnRTumW24JXc6k8lNc8OItyLdHu2dPKTwSg69/bVYTKmkCuIodJXN40OY8Lk9qwU2QAAN+8AVg5riKw+mcClzr0EyKxCJbSEMaoE/fHPc61euR5Nq1OvGxWaelj8BveUKPHgjw8TqC91X9cbWroQC1G0iMpusBUEbAzB5XkTutc9cmHx9RbMWHaujzl1nhDtc0J3FCvmdLzzMHZCws6N6qD0/wBuEoy6ZQJe+UDd1wpCS8tzWnQ9YCUB395UqHdmoPNMvAUh8U/IAAOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYdZLvGSeHPfWmDCwq7UzoFNzacWAMPE6+nAiNZvses=;
 b=f+3dxUOj9+vXWo9CXwwFW+v+hNQvEgrvfIdl1euk/FXAPwWjiHf5IVsPbf4uIjgFNPybfeV5EWJg1rKshOGAALzF3smLbz4nyxJXu4H3jDZ4ML3tsqxDEQXjo30pUxkkeWFbN6llRC6lZyDZZ7luUKwfesMT/Mj6JJ9vlW6lbZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10257.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 00:30:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 00:30:09 +0000
Message-ID: <87cyf2syge.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] merge fixup for simple-card-utils asoc-v6.14 vs asoc-v6.15
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
References: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Feb 2025 00:30:09 +0000
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10257:EE_
X-MS-Office365-Filtering-Correlation-Id: 507f541d-ee89-4957-6ad6-08dd578f0eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VELf8/zrglaOT79Wdk4OqQ+frQ039zfzPnBczrzAfV8kEzYbF+ckgdWaCkOX?=
 =?us-ascii?Q?b2tPmEvB1HDLXngz4e3/+s6GESYZwoBOK4kyZVBUimR0MlAJeEFmKBwOxHfX?=
 =?us-ascii?Q?ZcelyaV13Wawg0x7xEUQTLSyIf4TAcRL2KIyzsb1GqlwDX8av9W3wC1B0xuA?=
 =?us-ascii?Q?DlFREidrpo32k5HRFA67fsk4xDauG/kwm3roSATxSxEb1H5wR7gckVWJ0ovF?=
 =?us-ascii?Q?clJ/sX4CVclx1yN/B7juvzmefQwGQxvYXwRjoXSByOF/e2jX/kkAb2kvgw15?=
 =?us-ascii?Q?yFaH0kDN8w/Mu62En2DlIt9HQECPQ0UvnU4JHibSPb9kTwqKWi/TL/WHgiTc?=
 =?us-ascii?Q?79SgCxMo6/aLMHMbcsJsJdhEg7e1GE0QBSyJDZNHPORFL4bGheLqYZMMbekC?=
 =?us-ascii?Q?bTkJeDaAmSAspySEiu05BpM1TfT6UtUqbUiWILWVdF/S9cDrlzGn7+wS/B0l?=
 =?us-ascii?Q?SjfCptPFCeu9nif5QBX9pebGGB/tEa6SEGv1bmbZ1LkK9QQvPaQ9PeaTc0Ig?=
 =?us-ascii?Q?A4iyZWh7A9h8ejeKe4BQudxrzvL/5ATmUgmvwoSw/Zgcd1F30SZAEHVQrMev?=
 =?us-ascii?Q?k3UdXXSIyF1O7Anb0jNGGNbWhQQFbJJhvkwgnDre/G+ZaA+q8Irj2MP9KQd3?=
 =?us-ascii?Q?AhOVX9XHEUsmEaiXCv4X+KqovYBcouyB7RnzHQJ4eXX+MfiJnQctyO/gDP/x?=
 =?us-ascii?Q?XaRuA9k9vMk6qzSUhArU3bwvjh9fKkqdEYRn4SxIYrgepX5vNSRlYwAV9gvt?=
 =?us-ascii?Q?LgFruj1WECkGHJbVbIBBHDr+v9u1Lim50Z99cYNptAPDvuxaW9/THlCv9I02?=
 =?us-ascii?Q?XY2GGzfdEtuCndA+t70Q6H2zV5Uzs1wOQ98fvDfCCv7HhGYS2MjWsLp8/Lv4?=
 =?us-ascii?Q?WHd8aAabZBfSYCV1j18YPBNyCK70EPyH24yA1vl0oLZZ3t0yWOGcUfuge/YX?=
 =?us-ascii?Q?5dsSE3A+qr5txchhk2fhx0wIw7HQ/tjS2QbpqM1E3qwSojs1aMWRCVCNwQRw?=
 =?us-ascii?Q?dBhXSK+e5KU3A4nv9h0kp9N0Bm0xoh8gptD+qAA04oSNalXU6BzxD1HNyKyQ?=
 =?us-ascii?Q?j4SwuEv0KCSxCh7dw/4g2egBoT8gX9wYtrJtKnW7rdqV4ivsM8UeL9cDFnN8?=
 =?us-ascii?Q?GQIkE9kQMHsUrftGngWuTDWJDLHk3Iir4qZcQs1emRqGg5zd7GCcwvzq/xLg?=
 =?us-ascii?Q?drAkB5g1nHGSfKPdLHWKdiA/JMefLAiM0O9dqiKna7Kvrd/z0saJ1E4VJU6Z?=
 =?us-ascii?Q?vcTUF9hrBs318nIUlR+HjBqhQKv9tkmJLmu9tIC6sW7QeLZV7G7as3R3+CVt?=
 =?us-ascii?Q?ACFwku5omdSoiEI6QAaQPoU4IVD+nXt0A0AYaDGb7YcwqGwpBGMAYZ5w8BoG?=
 =?us-ascii?Q?reo/69p5YX3wcnMShGWKmIkkVhuwqEIMndr7CEyHipJmqFidkZhQxEZd5pNp?=
 =?us-ascii?Q?x4Y1kkqjnpz/Mt7xUy3PK6ilNqpkpn7f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/bhMrAOY1uQ1UoyMjYiZkDE0vVIQV1ZZC6Wm6H3JFEx/NuwjC0UvyOgYHIcR?=
 =?us-ascii?Q?rNmN5kBjUqduKWHMRgMv/9gsG6oVr7tyVrm+oRHQeqVeFkEODUFQuMfpnXEE?=
 =?us-ascii?Q?RtOgo6oNrSoP0rJut0r2gBd9XYISwCdQVzv6rnf4xLUMy+F6g1iSAqpsLUQQ?=
 =?us-ascii?Q?CzCHXuVsgxdYhuo+6Dan0q1FBGrpnlyuBFZIfcag+1tVaaJ441X5Ahb6pksB?=
 =?us-ascii?Q?wyFgG9udBQVr41X2jUobhMQ4qvHi9Fdnfgf9zEm9ahhQhglDgQR7rLT1/KEi?=
 =?us-ascii?Q?TIhZmWhLtKlynCj6GGSvfoLhvA/u1WnsW+njI5rD/0+hd5tUuNEYEzuh7M2n?=
 =?us-ascii?Q?6eBMCDa4ZSndREFwixXZmmoOrL03dvfK/I2fmN8euWwHN1QZN5Izl+qyyPXM?=
 =?us-ascii?Q?uccXgQAzE+tqJ6j6ZGR73icR1d6TSPUq0ulNBFsZmQRySffztGVgCa+J0N6U?=
 =?us-ascii?Q?3qXGRSHWojZvr8F808EQYjIqn5sh4+BoP8W3O9lfc2WXE1Y8S5IjX/tcNITV?=
 =?us-ascii?Q?rg0IMnqz70PYfcfa1MmrlYWRDAC6IEKIemr+MiCVgK+qPUm4V/8L5yAiD/oy?=
 =?us-ascii?Q?tPXxy0S0R4gbpgco2DVwGXeZ3WBm5Y+cP2rAD+9uAQQxNik3zf2Z3McM4qAH?=
 =?us-ascii?Q?q4rNDdUpxu3o4ESlPCDRb7WOVYgt2MdU8gx/oGhkJFsvgfKIB6rHXbEzs8as?=
 =?us-ascii?Q?iW1WVUWdk17qDL+WgMT3jr0ZhyRK9A1ubQ5FHYRpjyAlt84IBX9MoP49y6oT?=
 =?us-ascii?Q?c66mCzmmDwe6fBPrQ7N0WETwOhftcafuHcQPSDnO0jHeNk9DdErP/7NCWQZQ?=
 =?us-ascii?Q?JB4itYytgNhOdhFYSmHg15F+KOFnQYE38cmzOpNqCUbkAiBUaDR4W7ydXTL0?=
 =?us-ascii?Q?mXCoNpMqWFTb8nI5V7skkV/AUcEbyNisNZ/kgpknL6aiVqYQ8Hg/B5u/8MUG?=
 =?us-ascii?Q?svNC4XHLOl4AXYMfQCV1DSfPUIk8aB/+akK7pfKzCbZsTG96K8FMv18Bz1tF?=
 =?us-ascii?Q?jyBGilMHPYTYzYSu/lc87Jf0LnLI/WCiapEHds8WDLjPdv2bYiUxDz51/ipP?=
 =?us-ascii?Q?ba+0MMiuTf3uU0AZclOjjKnfdLu5uJTGQ0MlIbswIbM/7XNG9cvjHl7udD6k?=
 =?us-ascii?Q?wu2QjMdGxrp8+wk87Y3E5lezpD+AaOq+celg3JtpEBVUHjZjmTSJC820orv9?=
 =?us-ascii?Q?MDe4lnL05j5ZfAti1gtTFvVmpPF9TFC+aHPVwE9/SNj5XGDrqIhp9XCo8fwg?=
 =?us-ascii?Q?+iTQjotLaFTFF3fEKK8MKPN5xF5Bvbw4XXfkJpsRH/n++IsRhPgfCDduqbSm?=
 =?us-ascii?Q?br8KOx93UrURcsUC7U2lYnQ87RlUS7hMbgkhdOG3z0YmUwAU0KqchlGlq6b9?=
 =?us-ascii?Q?mwOf7jjpG9SIfWXhz6AxCGjd9C5Bn0KM0k86OA4a8W8UPPEDOPljDbY+LJ9P?=
 =?us-ascii?Q?MXanBgoYYK/w3RK/LlOCL/D6t/yr++vBvLq20wPV19NSohHIalAgw7UFzItJ?=
 =?us-ascii?Q?a3klf7DPbnV7PSfWGRmj3GaDOGe0xDcpE7+1Y+y4F6QEJYmGeaGqf/OEVeW2?=
 =?us-ascii?Q?n6xbuAVBVfm/tlonB0D89cWmRVnJtdUh5bHE6XcPMV0PfWVMWfGHP7dw1Ni+?=
 =?us-ascii?Q?GgFFTnMCOHrQkcuOXapaCbA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507f541d-ee89-4957-6ad6-08dd578f0eb7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 00:30:09.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qL9TOeeKHc5rzWXSvsTvIm9dovI3pT66OYY7Swbp0VLhxS1kvKdpIj1lihVW/Ayy1w07ckHYjAuMb1yETAPmFHGXpSqrKdlsyb9Aw8q/UiW8YPQkShG5kHRBTvGMrpi8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10257

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index cb658d052397..a1ccc300e68c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1102,11 +1102,8 @@ static int graph_get_dai_id(struct device_node *ep)
 int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
-<<<<<<< HEAD
 	struct device *dev = simple_priv_to_dev(priv);
-=======
 	struct device_node *node;
->>>>>>> asoc/for-6.14
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
 	int ret;
@@ -1157,15 +1154,10 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-<<<<<<< HEAD
-	if (ret < 0)
-		goto end;
-=======
 	if (ret < 0) {
 		of_node_put(node);
-		return ret;
+		goto end;
 	}
->>>>>>> asoc/for-6.14
 
 parse_dai_end:
 	if (is_single_link)
-- 
2.43.0

