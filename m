Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8251922F3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533755; cv=fail; b=JS8v6lC4B/IlH0FDge2MqhC1noTs0x8G9fHybJK0qzIKjtymSa+Xwbd++IOEXEsHY9CXvbtysYIlcjBcfOg4OCY0piVKMgAO6X6wnVplEyvDUYjmj6Zknw18jNTizFc5gXAyJzpyM7TrV1d5yRxkAjGDzWt6rStbXZz4T1+2ikw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533755; c=relaxed/simple;
	bh=pwjK732SnxLd7hvOQ2hDi+w94B4LhdYSt1hyqjccCpU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TPsIjKoyG04NGbMhJGLQ8kaM7HbAa7jC1/ewiluwe+9p3EyuKuVk2pSFqI/anbspbaClJaxWaEUIT/EijQGGeC4WTE9vHCKSrrffhlcCT2tk74KbiMas2U4uXwPFEjTzQISnA/ixWmmuxaElyeCvX4HDclkCyhI0DHR5vuv+KnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qmp7ed1u; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qmp7ed1u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtRtFtQjxymHKK/dD6Ghx7McRNsEsnOQB4rQFeU3y6OUoCuZtwznKfopFyuv9lelBN4eGAkRJmRRcmmg643oMqtMZy1fGwqMyazcVkXNQlkxX4iVW1QAKKpIRmwDnW9i+l0yAo/bA/G/QzzCYMbWa61SJPQXT9MC36ymMUtRyHyJrBerUkRscLSC0HmI2qBGXubKQh1EA8xuWtzexQRg0nv3k2AAit5du4eIzT/VWR301yYpcsnYbMsKcDEFie4g939SP1zz9tot94ZNF5Rg0z9fiUaacgqy94UX8laSwatoOemLd9uicRWYk+MLlemtYaFsM0I7Rn1GJcEqepJV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSbt1cxi8DNZuslEjHFROiX+qCAd+g/j74EH8Uf1Xsw=;
 b=hkAma4VtJmXt87EGn9Sv6AMB+rZMQkRf26RupJyfpFiHzUAvZPupClygUjtabQOUx0fYt2P1lG//WZWR7D96qcjkuxVxmq09nkNL0CPM1UwY8P+wu+4WMz/tlssn5A+nQWl8l3MUC3wpSMoczg8d/bLrT3635AXXrP1xW3VfDSq/8GkH6BXZVrJzlWfV1npWCXidSvs6oYjOF/7or/BXbGCDVOWGCENWCU67fc06FliOk3XdeY+atjIimIK6IUfmmiGa2TB2eIXGo5FSxIdet5mLE9RV6rW71/0shNc6uuAqcHulpz4Le7+/xqybFjsHAz8WEKgOZw8VUUXjKaBJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSbt1cxi8DNZuslEjHFROiX+qCAd+g/j74EH8Uf1Xsw=;
 b=Qmp7ed1uZyAyI93m46e4R9ZRRdWuEz7AbI/V6cafFrrDx7m4UGgw7QoAcJpGPes0bIxRfDf4HaES63Qux/VMtk0GK6od/GoEenjGbNda8GXAIDpXDXE+/DNrC6huE4Yrhvn5j8n9QbbVMoMn2+NJYexQuSDK4k3tUotj/NsAQ2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:51 +0000
Message-ID: <87r03lbi88.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 092/157] ASoC: codec: wm8978: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:51 +0000
X-ClientProxiedBy: TYCP286CA0346.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de18a90-cd66-4579-c2d7-08dd5605e773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aSUQ5dtc+TdMc3sN8Ol3+JgLtzdDASHiuZ9PFui8NqGsRA6PEdofxCdpj5EG?=
 =?us-ascii?Q?Zt+5c56iSduYwdEvw0PIbkbTpbC6EZ4a0ZN/ZNU0hhl0LO9lM0XoLmP+m+Nv?=
 =?us-ascii?Q?17iLdPfAsbBO2ljaN22AG20ce4zXWox2sE5fcmaFL+Hf5n0/8pUG4Zm3Ww9d?=
 =?us-ascii?Q?ebuTur1G8h2kpIe45g07O293t5btZzdyuCsTClAUoyXiBKIpVlsg66hTVe94?=
 =?us-ascii?Q?IFYQ9HBbfgEhMrNT6HWhCNBQ0v4hBYOQxpQaiZSQcrr+9EooWwp0j16eWxmF?=
 =?us-ascii?Q?XpPGsCbSeqspemXkk6fMRgwHx49BdcUqN8s+17Dzsrg58cNoY1k+KWcB/un0?=
 =?us-ascii?Q?dfbXbLT7rYa8KuEque6U5XQosvLmt95uVNi/HTgb5I8LNk34zZ/LNN7/zLr1?=
 =?us-ascii?Q?p29yFod2OrxFCNwUuRZdKf2AE541f83ht9Tg43t/Hs6Cml4r8JPh6NIUga9E?=
 =?us-ascii?Q?/ZjcODIWN+p6dxPSg6JSb7DEnsgXJ1RNv2dmHCYcuU1Aehp6AnxU104MQAKm?=
 =?us-ascii?Q?fHSerSb/7UkncqKFXdMOeYjAhEiS2mQtLm+JoEAFW9dLLgQwJVUfXApjfc6m?=
 =?us-ascii?Q?5JKGHGmQFZ1nNYfFeMg/2R76TwK4yDUr04KujXZEQBpEBu/74aY9b5cl6ljj?=
 =?us-ascii?Q?doja7bsUXMhCkG1PZc6G9JCcp7RYORPxy0QdwoLnzkFQ+bkVMn4Z8odsSqAy?=
 =?us-ascii?Q?npZ7CPGS1QxjeqiS91oA6cCw6sN261JWi0xU3PaiVOXkZbyI0AYbg2Z0zrJZ?=
 =?us-ascii?Q?jOm9L9DdPTSJFtGvxZ4k/7zKAPUZgC0jdLdW7d65D2CrfghnlNdD/sxZx7Sh?=
 =?us-ascii?Q?vAJ9cuajQ9B3nRXmp+od9h5U229tr4lKNWPi8sTHYH0iVP7xEl6WQzUezEv0?=
 =?us-ascii?Q?khDZNRP97/ldlprG8pPMcElBpexwqLIGL+8wmQvZjDqj6l2ULI98nPFeP3BL?=
 =?us-ascii?Q?8rae7TVnuHwC+l7OImS6hhEht54Y/jrUEJLdU9IbCnr7oMgoBgh6kHOK6+1I?=
 =?us-ascii?Q?kgQ8TxeHDdcwluDt5AncKTQYtvolQ6q4maadIw+Xq+LCh8hCEcL9El6WYb1s?=
 =?us-ascii?Q?6X2YzTUz3MCQf0DJc/q6v9mO0faHGgKTRgJWJsSHDn5njco91Cog86q/rGDJ?=
 =?us-ascii?Q?eVagKZfWjjbqUaLKBCMqCcObgl7x5je2rLAZQbcBlD3kT2wPXtJXYNqmsynr?=
 =?us-ascii?Q?rXgfx5Vexu77xkJ9Dkz6wUa0oqjq9T5CRMyxHm4fOcxnq0v14mtdh0en8k6e?=
 =?us-ascii?Q?yhu25GCsb0EUA2COZlEuL5QdY0I/WnlSLNWXiAuBTnXUU8jGY1UEKwo757Wm?=
 =?us-ascii?Q?wAXd8/BCfitJg91fA8/VpMWreUHnaDUw7Fe1+yUtE83QMVVQOIp0bWVPWbsQ?=
 =?us-ascii?Q?xV9gu2oFHShuRf9P6xlk/OAwuie41rO9k7lpT5QLhaOQL06H0fLuBkL9Imrp?=
 =?us-ascii?Q?4c+7SS8kV19GnDq6iTogyMyFurcbZr4M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zXrcaHlKk6BhhxiqTh3jhUQG6zCRXy+G/twYjKdHrLQsCPJ7gsAhx+FRX7TB?=
 =?us-ascii?Q?fdN/PohEuXe+pc3RKK5OwZKEFryWVJg+e8akIDwwyf+oc1ziUV6tnPlcKgNx?=
 =?us-ascii?Q?n9lmTSTkxXTW74nmATdbl/1k/h8NsxhmerJSIeaA2h3v5I1+XMkor9f0ypX6?=
 =?us-ascii?Q?RBcvFukIu1spoP+J9dqX8YZe/Sqf6i6jnhH5100Wzc195GTmhWP6Br3FxFsi?=
 =?us-ascii?Q?SvtzCfYyoXqRgwK+IStWlsX7E+z5zaEQuwd+QZ4n3cSdSpdyDwtbHXu9Ah+J?=
 =?us-ascii?Q?zNxvT/f3NMorpUSJfsP/+7DoKIzNYBkUJDWeEAG2/qUIT0cs7lDOsL7Ej/Jd?=
 =?us-ascii?Q?R5hAFLT6DKJ+aP0ALLl+jHldt/25tiTt8N+5d4RYKHawKnfDF0WAsdmkFhhO?=
 =?us-ascii?Q?QdgwqRqnMuX6TV0HtbJ5LtiNK8ADj0vQKtJQR3u7VGGR7Ga5mWO7Otn5zq5W?=
 =?us-ascii?Q?/TXxp4BggWp8TOSjS8reQHj8zBQLaGzKc6kmdS6zGDB3HstMSvTm8Qn8tlnz?=
 =?us-ascii?Q?IfH0wPuXAFVDqe3gbsgqUFFivxEgSCiBTaRefQN2VMdPDlWudZZzXr9stEjC?=
 =?us-ascii?Q?yjJEQkzJbasWVhkzQPFji7F9R1EkKNKbIauRXHi2LSbBqvbKYO/rG0sfTeVS?=
 =?us-ascii?Q?Eg0i92LTi+soanP05ypd8PtcgVT4xP9AVQdF/ytSPn+vsCsQwwG6ygyBK9bi?=
 =?us-ascii?Q?3qoekte42XsMzD9Y6+kt6W6nisgAO/ftiwkCmvqcGhqiWfdNKOHHbmz7JKCc?=
 =?us-ascii?Q?cterLK4Aa+vp215jNw6nY9oZPSfGz1OwClwHrH2hz3xIXCkU2Hh4fn2spnD8?=
 =?us-ascii?Q?WBrhlOMPTPfE41eZQOv5+z8KTh8wpxbX6GE/vBMfpPSa1AyT8cmCHOXhqaQ7?=
 =?us-ascii?Q?Zt96fxuMnmwNABPaFs3B8csdj5s+Q7q+uRbZ+gyoaGzx3s7fNoZGwDGd8Wcw?=
 =?us-ascii?Q?RoXe64sq0lFNIujCZOn+ZJqu4kzTsfXamsKox70HQghpwKyFpOIw7vmHXPpc?=
 =?us-ascii?Q?R/e+xw5p4UiuX69U6lNca8aBmoIfurT2ouFfCVz08Us8p5/zC+c7nduAzcQ/?=
 =?us-ascii?Q?YXXGTEPqYCdAf5qFHbYxYdHm2UmRtrhiiMcW208Sy2wlytZL6Dh3lwLlkbtB?=
 =?us-ascii?Q?KSb9xiNm6Ff+zAgFGmVOn9v0WUJRJYydD+eKKPeY451Sk9LplO9OY9Ic8Y72?=
 =?us-ascii?Q?1SQUZ7QTN1Bf/wG+9WJGoKy9uPX91fD6tggWgxRGnu9/Tdo5XsYKaX12JJBU?=
 =?us-ascii?Q?EE/Lj2uan2/cOE7gmqFkLTCird9MyVq6CfGl7PCHk23zzTuJhB36S0faPewj?=
 =?us-ascii?Q?KfKdD2bYukq+YwFglEBcKC0HefSUOeppbNbTZ5BKFyoylMhyLaDD2GIWVw/c?=
 =?us-ascii?Q?70VH8EKAaJJwA5JaWKDgg9Qi24Z9Q6U95PnSMItaAJyD/3bOrSEXeLGTbpEJ?=
 =?us-ascii?Q?dYFlVs9sbqm9jymzAW2jYrCTDypfpchAyPIZnZ7UbuZlXrAbMvhd2j5AMhfC?=
 =?us-ascii?Q?nAogMJtEJfubHQLbej3ypSLznsSMYOcMzOCyt3CbWl7CIeQM5IqGna/1t/HV?=
 =?us-ascii?Q?+OUe5ypdlNFUvjYTSp6KQbZmCCGBz/w7jtkuBtzc6Dcx77t042SweEZPQAbV?=
 =?us-ascii?Q?HLW1r2uHgBHtstw+kKullgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de18a90-cd66-4579-c2d7-08dd5605e773
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:51.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXMm2ZbY6Wz0RpcWM7oEwignl2ASmr+wdrabKp6MrJ7k/uE5Yd5aMredggg/FrWeRmV6B9CnFgaajz+o17DtORn4Y/qbTDoDEIVu5vK5BOG8lB4ICkRb/gjVW0z4W5/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8978.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 40d22b36b7a9..8c45ba6fc4c3 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -660,10 +660,10 @@ static int wm8978_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clk |= 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		clk &= ~1;
 		break;
 	default:
-- 
2.43.0

