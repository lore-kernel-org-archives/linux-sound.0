Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5291990DB
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533907; cv=fail; b=JTS5/Z/gIu4/q9cI0zcbZEKFhPljMvyXSy5aPl3+TlfmFDTwSR8Ya2jb1weVlPP9wlDMDbGUigMvQg+GvJU11+0QjgGYExbOLElEM5LS5XW8S9lbwz0VHh4fjeWk2Rutd2eBQn5cXIRyUAlgQc51ul/lwlTGBVKVKutijHD1OgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533907; c=relaxed/simple;
	bh=NJ6URItfUvkC6b0yVW8QqRW9ufeecJFf+oq0iNgBTSI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DCrwjuKWKyJna+Ekdh6asflf1juC54WPcPm5nB+N4dAPvmDzIiwHOfz87zt1+L3yz8fv8BQpiEJGgaYWBjSTXNdMomVpMMk76H7lqS5oWAOXycS7WTOtfuudkVMO7lqUhUFvpR6bSUbOKeqoeV8IMtXuVL2/DiK+NyRkxcATnIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ODzF9/6M; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ODzF9/6M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQCviSC0QNPZAdWa+yxVYfS4tJ5zmPQfEyI9SVKbX4OpiDErnkEvyI4Fsj0auhLjQjdkGdiVRQnTE6k9h8D89jaC62o2zwmVDFxE4AFfmboi3RpUqzylx58E8wBHHwE3xzcqbXWXNdkJ2mhcuLzZQlhQ65Qs0V3w2LeYjg9I+AWt+2a1zd21NcUxqLyQtfEgSYpNCgLJaQcEhEwja5nJYO/kucZrb3qFevJW9wuJFdkv/KulhdfjU0eYF1iEWOj/wDfT41InkJpKYsUjjcvSlU7E6Xz1hzTcM/Wkm0R6yESfu7clNk7P+3AYS7q2BVWGqCcXhpPzxvAON3sm7N1iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPNOQKZ0SUBYq9T2YqnSw+rWQa88+Lz1o+rNDr2K5xw=;
 b=N+v2x+UR2cyGNH+0+qZhFSAiliBlSWGYk2Mlw1pJ8fKSOuR0A/miyrTfyEeRcnlzAlwhS8WKG36CqjHYFAe/wLjQ03Ca2NmbbiQ3BKYFgtbQG87f1Bkwg6ofcGYQomQbQ9Bj/cIpiCAyvu02fNXQ159BDYc2/+E2dPFF2UP3OpQ8xLbBxIdS4VFJ9wPBoPE/UvFmMLbrNq19aLSwqa+7Mb+m/Y30oMZfVCeE22Ol6VwBk+PP8P6W8fxCNe+9mQiVisLUGBaLbH1+HUUKZHx9LgRUaPpPJyJc1GF+tOp60CxTw3c5aNEgLs0TFoB9mmeP5P3zhjKUp7WbVyduHgNyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPNOQKZ0SUBYq9T2YqnSw+rWQa88+Lz1o+rNDr2K5xw=;
 b=ODzF9/6MuOf3p274fzO5uNa1NhO5r1h5Ax3vSCn1p+8WrXZiucMu8WBcksh4mhkm3/1mubQixqWvhwT3NZxIQhkukjIq/kVU4L7Qr2kkZkbDQ5QkFWjFSweRGMUQRHrVC+5RVyjigbts4Iwr4u72ujSb2FOeuxIn6LUui6urHVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:24 +0000
Message-ID: <8734g1a3jj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 134/157] ASoC: samsung: aries_wm8994: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:24 +0000
X-ClientProxiedBy: TY2PR0101CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: cec94572-5b3a-494c-ee8f-08dd560642cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZuez915obkdZHTTuSV/4JFuUz3V5+iPRqrmy6FFSJXmgSO9Bu4MMto/Wfvf?=
 =?us-ascii?Q?FmXID3r0lVjT+WAOE6jN8J5zkDfz7kX0H3gfUkwB9bisrxwJD+9oUxM1iaDG?=
 =?us-ascii?Q?AdtPEuFx5YGEhBVtCZdI8JcUO/kLl3TK/8SWtTFYq50E78pRWhOZ+3XVQcbf?=
 =?us-ascii?Q?3Pi46byh8rYrjADRRVt7fd683KWWpm/fPp3HdC1Qex+da0fdZRDy06IcJzZS?=
 =?us-ascii?Q?5IdH0EdAaThIrM5MZKuyvI/pcLos7CqFUXZI1NeYyFQ7ef/E98iS0tBsqgsN?=
 =?us-ascii?Q?wp9FZuKFNpo3n7rHtt9UrrTzAa4eIMfO79AGgIRHKd74+XyXdH5RM5LVWGHG?=
 =?us-ascii?Q?rfy8G+S4Ny1wwgqh2uDxrRyrGlBJw8bsF3ydyXuZH7265+3M8pURzU4p3kb+?=
 =?us-ascii?Q?EjPA9OCoTVg0+6rKFgiP45bykTFqolP2loloVFIthEuLssXvdyo4wFkSVbII?=
 =?us-ascii?Q?OWiNpuDqAwCjb+FGBPQzJ5OhG4Y6/d4YjxJZWrlsrdqiXbXpcsXMrPNF4zEZ?=
 =?us-ascii?Q?xps1IW13bGq+OYqQipySUiaD0IKxqTSIOEoYBnuxeJlRxFtBtRffDnsxhLwD?=
 =?us-ascii?Q?BQa8MvEi30amP9QOwsWZQEq3fXt7h32yne0fF+pgXVXZJwgwIQfAaokzod4g?=
 =?us-ascii?Q?Ql618kSJzt6Qw8TfT4GiIWp0yvcS6ac+/Wi/M896E8rf644ufJCsjb00GEoz?=
 =?us-ascii?Q?7NF6ElS2f5+K9DN8AwmHlpQ4+4tGitT0Fg+0gGolosjmL2GW8E4qCsn62eTz?=
 =?us-ascii?Q?N8Sem9ee4trh542ZTzwEAl+19HrLZu+11MNlo17u3otA3CrZoMgnZNsYJbf5?=
 =?us-ascii?Q?YdocmwpMwkiELYs6NqAa2LrRxGp0mk3Y/bvgRE3kwzf/A773lzynLuIYygaR?=
 =?us-ascii?Q?UiwQn22O1jAoA9z1PEoiGUeF0i1lnZMVCUhuOpX5sQ+b3JEPqaAXua3MWo0V?=
 =?us-ascii?Q?SBBqVYqTQWQOVIDYWS2kIdMXAU1iLCtTjWER8H6rHpzqD3/sUY7CHYa2xT4G?=
 =?us-ascii?Q?/HsD6qmzdZXcNbqcryINghbt+fXQ7R53NYmtWU6oUceQ26iNsk4mb/gb82kC?=
 =?us-ascii?Q?+NYhznduGjrKzI8D76BJQOoabwC8AVaHqtl3pTOv0XDB/ylAFllw7ntJ/+t4?=
 =?us-ascii?Q?Ov/xMzFjiVvD9aYjUqpk8F9l01fwub/Wc4XBvTDbJv/CxIc3nMpfJuqEN/3j?=
 =?us-ascii?Q?pfaKyMiBhqr2ljVWU7zj584nYo6qVt/2XL1ANvs7L+6/NkCmrrJl7kFEioLD?=
 =?us-ascii?Q?cS8kxjj5xG3XeTmoUlVCtXwQjMW3EZAYqebR3bsSvL9tOHJqC47RpHXXEt76?=
 =?us-ascii?Q?9+Vff9B3Lg3TfN69H8HlOEJ/jaMLIbSOrWtxXnlEtVjBs8JF/xFYrvHxCc2A?=
 =?us-ascii?Q?w/KkyiiwKPggGVOi1rJ/b9e2qyEh4HzhBipEHWt2yEJnP+ykvYmU/wwUGYKW?=
 =?us-ascii?Q?N/1QmRtMXXZLReHwmnPb42o4YeH06tSa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7vOj/rHf7F6GxaWWFAkhUJ0HVDrXGANwvo7OgVABz9UBQnC1cg7Ji8N0N+1o?=
 =?us-ascii?Q?BP/APvTD+RoaAJzt1YI/wsC3SgjpjNygc4z8C9gM6d41cdWBz46QvFfFZpQD?=
 =?us-ascii?Q?ExjYkvLD/Dh4TYVEyuI7lZd3g1k2NUgwpMkyJPjlwXZQsNCjqyZZrtR5Gcvd?=
 =?us-ascii?Q?0xRwUDmrhAw1my7OrIVzLKfeQvwTEEZJbIEqOUdC/A9b4PIuoWNT5DDKs6Am?=
 =?us-ascii?Q?aE6eNc57++ZgBDSCag+dYlH0aUO1oo4B9DGuhGgtAeGQ7imElCowjMl72bhy?=
 =?us-ascii?Q?oJ9zaB+qGgjYx16gkuyT6h5Tf2Y5AulWiwCpAe1/MhiC8p7jsxmngyznBHp3?=
 =?us-ascii?Q?BD96qNDeE6cY3ByiqqDcMd5p/DdJDy57v2jma6pAHEgRG5RdHJ03zJpYdXIY?=
 =?us-ascii?Q?bX3VpIwBuDTuQJC8nu7Sg6lXHeSJ4QfEgslLHEmdMDqjT8nyyYvJW/sa31p0?=
 =?us-ascii?Q?58ITL7U0J+ZtuLqsE5rWf/bN21vL/Wuhit/U0e/fARmdwBHA9Yixsk2g5G/e?=
 =?us-ascii?Q?6JIiynoP0wgerJsX1QugL7nQAoJVyxtJHStiKg1rtlH9emW0tip69ZdqnzLS?=
 =?us-ascii?Q?FVgkfW5+COkRkXR1p6uSxhqB4xWkiLD/G09Vi/CHG+v5lHFdTajqy01C6/c1?=
 =?us-ascii?Q?51aFvDJiLfO1tN5sQbcMTRuIFLXmtq1eXopUM9YL102cmjmMfAePQZsr/xA5?=
 =?us-ascii?Q?Ll+XMK6KCZ8cRq6SW6BfFSiondYci6wvH0rofr1UoS0nobZdObj8b9E7UAzK?=
 =?us-ascii?Q?ikY7OkTKK8BCfqiioPd7a+i+cOHAl4TgrZ7htxcHWGGjBv/ZpYtZaEkpuBtg?=
 =?us-ascii?Q?2tZjfKzkctlGhFUyvQ0I94LrT+jQujJmGZFjtaajkhDtPkc4c521zUmqFHHt?=
 =?us-ascii?Q?z8STWuHyOiJ0pGC+sHA4MxEo6VgZeQrW9BZnc8MGlw31ZI4FZe6rdYciGwd9?=
 =?us-ascii?Q?39cJ00fhy9yE7kXJ1F6OyzBrylCDIVpurxyl6/2yzIncvZJ1WSMxTe21wGHl?=
 =?us-ascii?Q?TN4WBZ/nsIJo1QPvIx30eGs0TrcyWlP6dwXvHLRs6k7Nj6ccppmwCj8sMwKy?=
 =?us-ascii?Q?zHPXD9nccplXArlQBmrwEX6i/dTxs3FbgjtQg/YaelFWqnIMq3IGnMHWEgHk?=
 =?us-ascii?Q?+dlkiCnlO9EVqUpEq2NuvVeYGvi8lt5D3tDONcDuX3s5lgYo/QlKql5hArKO?=
 =?us-ascii?Q?l1NL9i8LYby6olX2JVGoq9acaTDhYxrvb+xjLLY6HI44fYj3xFnyXlGmrLm6?=
 =?us-ascii?Q?Iq3pbH3aVE8EPCdoENOaebWQsvTtgnJtINW/NEdvbiw7C0rnf2Glu+4vAGXd?=
 =?us-ascii?Q?OLe29XoZPluEwMZqU8iJxk/pilLtbG+gRsmWSz/kKUcvn3Fief9Kx3HTFkPA?=
 =?us-ascii?Q?cPkn/N6AqAP3sg09rMwSa6vfo39zLN+aLPIPkoiZPala84MfXaHB79+S51gh?=
 =?us-ascii?Q?+JxKeo7oAuzBwpkvY1RGJwdQ/ERrxx3G6nFe3a2uN+0rhLINTKV3e4eZ9Zvc?=
 =?us-ascii?Q?W3nfsf32gThA4FwefduMbZ2IdjlaXd3goTfYKtfa8zYn2sIy+0oOwRxaSXVL?=
 =?us-ascii?Q?FOzczAI/HXfh/jO9isFKZyDYlqa9oFrN+wieVFwss345Yoq1qXItMA8VyDZb?=
 =?us-ascii?Q?gFFNs4LYBXLvu5jL0bqvIyA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec94572-5b3a-494c-ee8f-08dd560642cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:24.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAf2bCqtgYjMNB04NlUoMeK8dvnp+WrcTdocqWQWC8LHnA6GIyKd1GVcVbvvYZRtdsViJt3LaRe5wOQsBu9mi/WIW2o1erijH+9wXWdmNFR9CeCHpRpoPl9dXetEeP7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 01716df0c842..3723329b266d 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -474,7 +474,7 @@ static struct snd_soc_dai_link aries_dai[] = {
 		.name = "WM8994 AIF1",
 		.stream_name = "HiFi",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM,
+			SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &aries_ops,
 		SND_SOC_DAILINK_REG(aif1),
 	},
@@ -510,13 +510,13 @@ static struct snd_soc_card aries_card = {
 };
 
 static const struct aries_wm8994_variant fascinate4g_variant = {
-	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBS_CFS
+	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBC_CFC
 		| SND_SOC_DAIFMT_IB_NF,
 	.has_fm_radio = false,
 };
 
 static const struct aries_wm8994_variant aries_variant = {
-	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBM_CFM
+	.modem_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_CBP_CFP
 		| SND_SOC_DAIFMT_IB_NF,
 	.has_fm_radio = true,
 };
-- 
2.43.0

