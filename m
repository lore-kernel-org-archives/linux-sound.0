Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6014B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533491; cv=fail; b=eUciruEMGEI+LaBxI7szPvFqY8qGDa2tOUdKvkAx/V+9j8ao+NYULO5l+ML6SOgPPoXK7hBSWfZ2lPc4JfMUGDqqo4XTQDWp3InV3NtwIQc65BLIrlJ2yn6iQExIOjbSxt1JTvS2a4Kxo2ZGWUmDDeinifYv5riFwt2oy/zPCw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533491; c=relaxed/simple;
	bh=emg20mlSxKvw2hgg6tpFM4xVHb9ALfdhp7bOma/WdoU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=APUbC/Qrxb1iqgS43eBLbFRtEMrjO2c2mcFS4J7hfr7Ni8S7HpFDoBAOR4KDC30+4VIdXl1Pha/WCp8020PLsB0JJGHUUb08o5IuDMF4deSj0xYBeBD4XFdTsSmHPFGVvRUd8KkDP+vEoK3dtjzG83AAAHlgKehd9HPHRz+EoHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bgmSKkpC; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bgmSKkpC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUKPD2ZTR6Zgtynf0NZE7VIiTeSkzn5PqYXBriaeen6P8EAD1+Q+qsMykePhVkVnZ90Mvx8sn7O0Z/j4Mqu81b3Nbl7DCuApqKrfyrEtQD9RX3KJYTV7qWMLJKHlcT1HEZh3wLNTmVmvd8MVyF7IecGqnw8ErJ0QaJhz29/cPvwyrRcu+H+RRtudo/9AeU85JKcwy0aZgK7esaUwxCUhtQ604RzwHRWlVRG5hbIqrWCNl7bMfCk7mHTHBZsT1L1HBzA15LMrPfRHtqcGWG5Uz0bPzDrW4A3xmObl3cFGYKbAuWX8jyRqcIvUJP5TI0aqFNfvEW+SXhhVhdGbBFcg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MLhQ1NFI4ZCuwjTfmW5cZKLRppWybYrCUbZk1mhvSg=;
 b=As9vtkOOk5H0VVPCG2bEKCHsDr6NIIN6tBJPFn4GkT1HDAIEXlpuu3vKr8fqE5Oo0rdOLMfcVobNd51TvuhPW7k0q67+pCLhGF7ezYOlTWUPcsrIaXeVYA0xPedqxztz+nyCT+/1wikoXi39O3VqebXAhvcONY7V4V06/+3SFw7qMxLqnNnwtiPJb5PB+5Q7KfXpoxmobNjVJKY1UQHu+X3pdBbWOvcmbLOF7y5FS4fiK3Mx85bvg2YpDXC+8rAnMP94rAvw7DDNDg7aABngwldhnOXjJedZ75GeNOFWk7ugQo2SW3uJTe7cvNoCzeRAHJ9ubAKAOTJJzQxUCffbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MLhQ1NFI4ZCuwjTfmW5cZKLRppWybYrCUbZk1mhvSg=;
 b=bgmSKkpCFdU+8zqVXEpLKlemrHI9iQxtYeXuRdzGzM5ApoDRihjTo/m7zDTV8v2pl+09bbbKpzUrp5rPEMrFaBKiIyZ2bmmr2srBTI0LutyThLYGoQZLSOr2juuzg72br1PWeMF6gA7PiwEvn0NNBXm3Ll8Tfs1IYhUpDPu+ooM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:26 +0000
Message-ID: <87ldttfq4y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 021/157] ASoC: codec: cs35l32: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:25 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c7f430-8e6a-4ff4-9027-08dd5605493f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ml2RamAz2rEjEK2NtoMTr4YbIWYGnIXCaL2IlzcA9UugDYjqz1YtofeSLkOI?=
 =?us-ascii?Q?XWNhVd3L2gd9etq+ODsL7MKkJ3zRPa528esmE0RdRMy7eoB1Cnrh7GLVGGIw?=
 =?us-ascii?Q?/vsgdtXeT7ehk6mk709m3heehnRbBnkOI/3LtNG9MDDIFucabmHLe2iPZynp?=
 =?us-ascii?Q?jGRMR4uI4ws/WKhyBbvgOH8dL0NDQTyzWdTBG+7hX3c0P13H7as2UTA14Lj+?=
 =?us-ascii?Q?AA6rSChQb+T7eYUVzt+1rv78FYWPKsJj2s4IJ/m/ucdwAZ+F9+xoyvjIOxgx?=
 =?us-ascii?Q?I6oUee4kUleQgYBNNh/D4XuGfOOVQifpjI+HlLG4luJ/IqHel6T7S91EMtAq?=
 =?us-ascii?Q?qgj+2XA6Mu3rPhFnjT0SrcrTH1Qq4RR3nzyaRDcw/rSjy3TvKcrLqY5C6vsA?=
 =?us-ascii?Q?hqFdtXznXcW689eRQyF9cdNRHBr+FKgri4/D73j6wTwnaYhpjup5U3tSR1zb?=
 =?us-ascii?Q?wC3Fue9/Kd61V0jebGSmWY6rtwR0yEexP29Xu72PnOsu0Wd2PMXNJDJX49BX?=
 =?us-ascii?Q?KKS5q1fllPuBo8eVRx2ikJcw9Z21b8/PgoTOyloIak1BMmpqKZAXdZilQ82D?=
 =?us-ascii?Q?/XAV1qwpbygi0ECaCLqLiOPAD2E8lLNFyHMxbgEN5qc/1fVt8/cdtTCicG9e?=
 =?us-ascii?Q?N2Kfb4yAXQcnKKgEGMPcFuqicmXiB+Lp7u1wBOcATdz6VG8Rs5FPEcaezw6v?=
 =?us-ascii?Q?+/Sz4VVTw5MQ1gfElM7gNmkLdQpzhObe9AQ+AT3t4bh/3ob0Kv/eknAo1VDt?=
 =?us-ascii?Q?bKNReY6dkgzvIzugj98omgsOTkqto+1QM9hYM0rPKYwWc50W6OPrVDlxsgpe?=
 =?us-ascii?Q?wVVHtJiVx+qLnLD+sKaZ1Alv6/sGPd8HP3A05NvkZN4kthPktRWEoQ8dHVR6?=
 =?us-ascii?Q?1FtVUi51IYiDKYYbiWKit+yajHc8V8diNAg+60tXHValrKpM4UaiXvXoCFO4?=
 =?us-ascii?Q?JRiO8LvuP0zX4IEotwczVQbbNhA0MDjLAfzNBnH27abxCnKhrj7UCGdKsDWD?=
 =?us-ascii?Q?d5S5gCAzP0mxnb0c4fBiIvKMEbly+ySYXSscAo1IR6rK0yi1kxjXqP3HFZ6J?=
 =?us-ascii?Q?tS2xKRzz+bJvQV4NWNlAvakzFz9A+SzvhzD2Mf5jA+CJWyfhJB/ab8/jy1zz?=
 =?us-ascii?Q?MIk/SK/mG8UoB49Tc9vCmutcVqnW+GKYueiuQLie3vvZtCwktMFfipCXbofv?=
 =?us-ascii?Q?Q8YJgU2Dtyb0mEft7vxeO4fxAcE4B2UmhILkQuWQLJK4JBu5/Q13xKyOUo7P?=
 =?us-ascii?Q?m2+dnnoo/OTJK/kmTvjehAjS82bXbq+P2D2mRexYu0eUIud7QZW4ASto9/k5?=
 =?us-ascii?Q?HI5pPbuA/EoOrBHOgS1qs4UYE4kRBLr0i6JkHTbDISaUKfl7o6XPYxPSL4WN?=
 =?us-ascii?Q?fldabKETAP5nOJCMp73T2ygJXQU4YYbYu59OWTfVhwA7jAh1TGdPqMWnLJHe?=
 =?us-ascii?Q?4gsEZwPiQ86GQI48mDORgnjj1x9O1Gpz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZZ4tAFn03n1k7gxyGcVOhG/DEQvKb94rL3IuUAnkAqsPJLupviYZekDykXc6?=
 =?us-ascii?Q?fQmx1YE5zMfnymnbvIwdAA0SXNX+CWqA0DzUzxKLDk6Q5BdppYWdEoegjqi/?=
 =?us-ascii?Q?M6zjcXsoWZxe/k82bCc15gFaqppckiopDC4cLiibIQgBLGgLnhet3HYDEJTU?=
 =?us-ascii?Q?kxvMSSgutVlERg6iPOMN1OsSIt8sy/3P0dtwB0r74tgMATLcJn9cvqaKmzxN?=
 =?us-ascii?Q?Xh9WE9h0jpsKU8UsWyPZaf3ND/s2cTeU9OQQzPYzX8Smvy7NXuqG3PzMOt7V?=
 =?us-ascii?Q?GTF1O+1+1S5q06fQ94AHo0C++BNDu7Fa5nBtZHsTCiZ0rEnOcv86Lxb9qXfB?=
 =?us-ascii?Q?U2P7qdJXPVe7OxXCbZOQ5mJDGLPPwfFFsbZSSaCrHIpdNDgfG/6LVu2UnCg1?=
 =?us-ascii?Q?+Jk3z8f076fBNrDf1nqIKZgkaXOJmkXZepSwekpE4maKmbtZoTyd0Yv3We7G?=
 =?us-ascii?Q?lu/0Qvv5UQ8IJFoLb5PgUoVu9zmAsSx/Fa9FQqZpvZOrdtIrdnGIcXpV/Y6b?=
 =?us-ascii?Q?5gxCQHkAj6u08Rz7yZ/8SzOlXw+C2rE6HvtWyq5tyxOzpqx3c428ZAGEjB9C?=
 =?us-ascii?Q?CodEOl9NeBqpsmcIYSxBu5hCuDnSNB3ixQnC6rDj9Z2Mav6YIIgWv99f2LVH?=
 =?us-ascii?Q?mGuYV3iKdhqcJpuij2Necs8fdC8UAtYhE5WW31NGyUWev/VwUVDpRgNlBEcO?=
 =?us-ascii?Q?pqs3wLiS0srVbZdJSe8eKS+O3HEhCdT9C7bZEMRtIDdgKBoyORSShS4pgjIx?=
 =?us-ascii?Q?FBuKm4LEovFZrv8BOkk8cekFcQqfZdvweA6bphhZOPrNN5SAGvfT4IZlBaFh?=
 =?us-ascii?Q?4YRFJ4N5xjgyS4CdlxXbqXAa74x7lzbOLVdbPJlaxP97omWT/U40bajpUN8m?=
 =?us-ascii?Q?yaKso5P4RtKfLZyv2YudF25/fSGip8KIYJ3s+OWBY+td/v2+O22sfTSdSQTr?=
 =?us-ascii?Q?nnYcs2+Vc9/FozbNDPFT1wvzQ/ls28mG0IlzAoUk9FDjZQnL9kA80f1W99yf?=
 =?us-ascii?Q?C2d5TyYMCcN0Y4NV4Eieufv2jS9hbvd6VEffwjrLQarW37GA65d9I9sqyViu?=
 =?us-ascii?Q?0/nzQF6vlq1Ej0rE4xw1HFwF6TjwnOcJb/1axCl2JZYotWX1g1eQQt9gOD1D?=
 =?us-ascii?Q?UZoBk5bjJ/XSXFZHyzK5UibWXZ3b8+FRRNQTbTt7APkneKDBPWgrbD4Pyufk?=
 =?us-ascii?Q?XK1J+E4w2bUrkN9jm+km93zDY1xvllHC7ZatFJBjjGjBO/8e/OV8uMxsAV7G?=
 =?us-ascii?Q?bp7JfdPVUbWkUfiro+Q3/xqPwvo002a4mkESxnumUjgUAIfo+kf3EQWYMA5j?=
 =?us-ascii?Q?5a0MQL2Q5kEpFmoeJhcAI6XxeobIyc897j3y/O8Lm4Ty2XTZJK2lybhapPfK?=
 =?us-ascii?Q?EEga2lBXOEcm0PjuiV6ntieVbZ5d/IJk9UPTL3GWPn90cmoObHXR6SqQ2YQQ?=
 =?us-ascii?Q?CZs0bM2HAdJYau9USwv43RTCuGWLaF7DzV+oTjElAAitbsT6iHvF1YRLtprk?=
 =?us-ascii?Q?iYz717edA1THlba+ecRq3VLVfZ6bRZgesf0wrFLRZRbHM6ncruwM3m+8bcNH?=
 =?us-ascii?Q?ZlSn+ZTPr2iuCAjbQ7H0qQs7W0PgGM2k+lhAImnAgqEpuOpQ6QnC0drUYT/1?=
 =?us-ascii?Q?ksjvtkuUzatHX/wQbQtVtmU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c7f430-8e6a-4ff4-9027-08dd5605493f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:26.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNeUjAPmUz8sVuXNvWZYohNTunc1GVgG5YMHiiA6NJhiIAJkDCWVuULJto7Pv1dSdiQ7e5tR49nKwbaEVZaaQ49zlCWaXdoaIC6REDwble6E2JoqVAKY1Busr88GoIEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 96555263e10b..6d78fa953c89 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -153,12 +153,12 @@ static int cs35l32_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct snd_soc_component *component = codec_dai->component;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		snd_soc_component_update_bits(component, CS35L32_ADSP_CTL,
 				    CS35L32_ADSP_MASTER_MASK,
 				CS35L32_ADSP_MASTER_MASK);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		snd_soc_component_update_bits(component, CS35L32_ADSP_CTL,
 				    CS35L32_ADSP_MASTER_MASK, 0);
 		break;
-- 
2.43.0

