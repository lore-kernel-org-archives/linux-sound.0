Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86113C81B
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327005; cv=fail; b=JiwT9z8gaUFzXV1NLwZbmr9fqojgoLAffqW2SbfT6JMRYn4L4Txyns+2LUu4eFWPx/e0VMqyZnbYyWQFfDZpig7zuFwyWidMaOwR5ewpdJh/xTF1Yir6ZXVyzNQlnFmLSNhpNjQc9nQL9rD8e2LJNk+sVE6BzbXwZ8xpAA+tHs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327005; c=relaxed/simple;
	bh=DQID7BZyDnTMvcblmrS7s8qlYDF6i8aGZFERAWol2ds=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pXWqEahlTCReFWxsx2iq3Ui9fI9ZL4ucZKJfgbXKY/R3pl1RiPYho1YiraTWmDS1iyD+bWn9Po8V6pUDEyxdZ6/YF2VEoE6ABtwAuSRe/BSFZfH+/7l9FJDdrywmiVaGT0K+Xi1GYL0xn1HI6jJP3T2qn0RgtL/x1qSyJX93Om0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UDDBrDDy; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UDDBrDDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbPZjGH1gCsuw3sr4ZUEVkttVKTyNt39qgVBKCiABHQX+lQWWVsPvJQW0wpaFpIgaKHru+JlraeazIrpkj6mVRiepLRYnL/CNKfw/VsOTSUDsXmkJji+3eo3/SoFJNf+cNSrxYI6xJz5XngSIyoN48CcaEGslwS2d6KdHLs8rnRx17jPAd/O+4yw6sSHqrFGIhsZHUaMMJ8c3Z1qzNG5SvQ9mrOKMfBr+PfCkIdyKN/XkPUpWRoc05MHq/aEeDF4e82K7rgnjWkNTTRXTCFRuKPNbOsnHVTNNgniVs+OCPqYo1egq2oIv0tb8lXmY+CsXIU96XA5ywCrEyVCeI9z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCDlbOUVKWTXbknH5XsewLnBhT9qpOL0rYEe1xCECAY=;
 b=sdoofvX0YtbjCyGj1qGrAWte46UhjPP4YJDmqYJpCATW3fJ/jVdrzAErg6zdRr11QG1A3DpnojSEV7W1aHh/tvIETUGG2z4NPmQSBPEEj/4PvUxmZk5eVGtyC8cYGKpPfNsfdFnXQ7eevO2NCSmBSB0KLyVv5bBOeR/vjh+lhasNOHiKAbvjz08WoVtFP+1lUQdlmXjdzOL/VTLLtqJln7b6CN6+h/VFSz12glsScznrZmoshxq5fmSX87zi1i40RnHvsMhJjIBNqRSPjJNK+vou5b8vgZ+YEis9iRw64NrRhZsTHhxbhtggMSr3uZFvDQPq4sFV+sR72D0zVIsC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCDlbOUVKWTXbknH5XsewLnBhT9qpOL0rYEe1xCECAY=;
 b=UDDBrDDygQzjuA8JPovNGp5VvayVGpEwtD5O/iTlIHivStGzdrr+l04DICa1PxxbZKCNq2ax9sA/CGn4XwPp39Xa6AbsY95khzgN0FGiJddMl4X4M+FLIWoKQESndSWhhLFsHyNn8aPyNeKCZR/o0AjsIPVzSB+ORPK6f/cmANc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:23:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:23:20 +0000
Message-ID: <87wmdvyk87.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/12] ASoC: soc-pcm: no need to check dpcm->fe on dpcm_be_connect()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:23:20 +0000
X-ClientProxiedBy: TYAPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: afe31c82-cee2-4800-4604-08dd4b0c3804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nfhLRLhllPMvl4qJ53mhsqi+30atrZdhUffucKfEIQgpDQu8H2pcg29z8tUW?=
 =?us-ascii?Q?2QV2smq+t0P4kTVYTSMs70o3/krr96C51yf+v7GoxsquuFidwvgWkqCPuupM?=
 =?us-ascii?Q?q4qIMxToHG+uFKnlA7UIgRB1NRiK3kkLwK1bDOxjgu3wcqHFqzIvLxZY+dRP?=
 =?us-ascii?Q?w2lSxW0tqqBHLOAq+9rSYswYFANRQcy84b7DoEQvjjdlZCgxBhiDageYbiC0?=
 =?us-ascii?Q?fopyYtEVR9YFPjRL3izHJPmn6ubHN/VZu+Tk73LGiZZ3MJS93xmhI5vmiPck?=
 =?us-ascii?Q?tAjDaBptfgTvQESGNAZCOPKdhY0MQ8e8FC1i1y8C5z8WvkiKkIhckaFEjMHO?=
 =?us-ascii?Q?xCQU+Ig7cwlIaRmpkvyOGVz7s/GZCSDnVgHixYTJCjhOGGjrpFO43eexSAq3?=
 =?us-ascii?Q?IPBzSOWAeMARqO4aAk7KEzStiWZ0GWOKy/act4S6lELa/upj33g2sVEmNeB+?=
 =?us-ascii?Q?uXunTKuXHYl5+cT8ecHpgQFgmDqTM3oZIyNDaObGLNdMc7xi8Wb3BcfUjNEW?=
 =?us-ascii?Q?v1xHGxCpkt7bCEu7AtCsG2oWKceudy1YF2ShipTfPJMpCZVv41QFYIAsDINV?=
 =?us-ascii?Q?KyJYxsNc0wgu+6pKE4k/zyxJQ7LpSRgcMfpP3vgoUpXeInVdNCTa50coi6S+?=
 =?us-ascii?Q?JPs3LU6UMbOjuFNCofqRYv9xcLPpnaciWo9OjmYSoJbdVCbxKeZzEDqAyUbe?=
 =?us-ascii?Q?7fvat9c3893hgqJUp945a1aM9aWyR5odj4BH421XK/kHbfy9czPoHYmfIMhX?=
 =?us-ascii?Q?lf0a50c/1hZrQlmfZDI9E7KB0jmx97sJeGj+CSsgSzOBwp1tB20qt60V3JHb?=
 =?us-ascii?Q?QFZM93mMNYR/AC3r0azi1cIZDEjo8Q7F9q4UrSIzpl1TbikOsXvFKuM+JDet?=
 =?us-ascii?Q?sVZkWDy5KYLg5loNR7RRJ2BSrCtCr83wM5Dut8rjUXWbztw+zGubaBoLBMQU?=
 =?us-ascii?Q?rUetLWrYdrfl1LROFTFMSbl9Q3F8yjYFIYdNlF4hE5KCydV6yi7aI6A+AulL?=
 =?us-ascii?Q?IrSgI0O/Jc73JN2NCB1aAzYRofXC02eyXKlTfbk7R4zcnJl+XTYAJiWAsdni?=
 =?us-ascii?Q?vabhIhsCSieGSE5MpXdZcVI5dC+08nsGxmyuP6jsJKdH8RMO+FpoqBBxyN1Y?=
 =?us-ascii?Q?1D60AlU2CV4+4QxYd5zWeEDz73nJVWixqOSljvOp8QJEjiVrBFcG8Md4hFBn?=
 =?us-ascii?Q?pStcDaoZ7xHho6XsyzW9ohRWJOOmdngSW2tSiFv87DzNRdJpiPEVD6YxKMMQ?=
 =?us-ascii?Q?200Trv3XUbOL/fpfqZ5p7kxj50H4hsuQd2+shUVGRH789PnYgKJ0F5c5QH0l?=
 =?us-ascii?Q?Uq6um6NAFqg6FEyh59AMIR6Xf4nE6Ggmbe14ut3qzAuMsA8zcmoEOHJotMV5?=
 =?us-ascii?Q?uCbdNwLW2PZ91ib8JbXtEvyyyOwd3Zk20Go9tMhHxz4ZWGkvAnYuf5eXbrGN?=
 =?us-ascii?Q?IorPAOGeeNZ8woAYdpX3y0yxgnhID2Yb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uHDOQoRwBtFO5xd7rJGj8DpMLz2fQ+Nu1IQ1obXOhFMBJM19SGgpKSIb0JKa?=
 =?us-ascii?Q?cqXIYPIGVFWxD6g/xH1l21Eoi4/Mh56BHXJ3J7zQoF1iLLFtJRJRRNxVh43v?=
 =?us-ascii?Q?zt68zL00PskTMwVbTaftlNVYmbQTY6CUzf6xGOipmSdvBQhFcJGyOw4w+87G?=
 =?us-ascii?Q?eR2r2DF+YKMC+mio8dBEywxHxVy1C6o+551dyQFl6/ntgqRetsTABAoEh/CS?=
 =?us-ascii?Q?cNdo9MHV1+OOMAnX23ke/VF+i/Wq+965QGpn2I+fSajnac8QRWrZBXmtYR/E?=
 =?us-ascii?Q?7nZqFVJeb9bdE2yvDNE9t9ignkMyZbBBzAS5TAHsVKFTO5xKeVLtWi8wzBTO?=
 =?us-ascii?Q?wQ3aNnhcOQf0petOM7QBsQMZwLO1stQiDKTDBvtfPab1pc3/0HAhrC0GaoKx?=
 =?us-ascii?Q?4Gl1wqalnNbdaPwD2zKH5QSvicYt7/cXCFuOlKxBFjt20aEUp42QANpGt2ie?=
 =?us-ascii?Q?3a2Ll+ZgQU4ZsAyGicedXko/YFQJhsBmaG7lyYzWuVJkQPDVrcTyFDqwdnOW?=
 =?us-ascii?Q?z5W0iWxXZ7yQ/+6LiEtH1WvW/hN2Z9CkZtwp6oGQjYgJVd+0n9SubvpPljc5?=
 =?us-ascii?Q?gitsZn5ZdY9BkW1nY5lUoLY5sLe0T3+XFjddswjY3viGDBTRRF8488/+YwCy?=
 =?us-ascii?Q?lazJ34hY4sQZRakZFsWDZ1rlGtb/NVSIGSmTQlLSiAv2jaQbKXU+acTJFUqa?=
 =?us-ascii?Q?iLUW6gqREL3UKXan07DE6GOMy/0mPe66uyWfbP+KFfGUBX0DUQI/F+nt7FtO?=
 =?us-ascii?Q?VOrcXKbaLsAxTNyn0QsmBBFeseYvvesHa6DxbUFklx/zCybUF1Y4h4ujFVRd?=
 =?us-ascii?Q?RaUbk0YjFU8Cp9x+BvAojGCa+05FPPgHW5q7I7V/eBdZ3E0QFOFhjbgIBgIy?=
 =?us-ascii?Q?Fc+dKXO0mMZeodm6cVO9JUsQHrp336VC7Op7c9PPNn5T/ooToieNlutv2OWu?=
 =?us-ascii?Q?txQZwMzjMSqJY1orh5j12CIM6ZkzXHfYQ5wKwLGX0GUm64aiQb6LojZnfeFx?=
 =?us-ascii?Q?lnHCWiz5d0vCtLixj5eplXt7u9bZgCdK4CEeT09/mf5OqC6VykLXiehnMIId?=
 =?us-ascii?Q?D+D8qkPKXsAP3a0YWSmQs5bLWsTw17i7k8gKNe/VLKqGk0bJJhkQh6/9N+YD?=
 =?us-ascii?Q?p9xpKTXKWkGtyksQw4FU8sgedfvFHCx9Sf0QKbu54nAc5lB9fj77U8lA3Pu+?=
 =?us-ascii?Q?cczH6NMh8xQSNg+8fKzCqluoscbnLzcgAi4r/cqeHNvkpcPxBnpI3gkPFpve?=
 =?us-ascii?Q?NHQ83pC4u2yG4HrFaDF54sVQqiW/tIat05FGheZLxmh2Q9fKERUr0RQxqNOe?=
 =?us-ascii?Q?g7jPZmluLJMSodXnDeAyWc024FZDcBb4WHXx9yzTQIC4qYPorZK3oP1quGcS?=
 =?us-ascii?Q?+zS7oR3Jp1vzdqZM28WMPV07X+muw0mtMrrr1p59a4SkS1g2Oq4x8vIg/pRe?=
 =?us-ascii?Q?cqKeBIDp/WnKVyYGAGLsbXfjKRz81b8qvoK13lfGJLW2xNgm2nBEXnv98wSb?=
 =?us-ascii?Q?yX8FlWOsLfneKVeLuLLT1y/WCW4FZHEIqkS+GceXCxKlNFexh8tsb7dCJbOk?=
 =?us-ascii?Q?WZDL0NTgfjk5wPSAFfazb6QNOj2w+rxK3IM7WFjev6XKAeY6kGcoutNtKkuG?=
 =?us-ascii?Q?ygqA6Fm/3xNnKlD+Dv5XL7c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe31c82-cee2-4800-4604-08dd4b0c3804
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:23:20.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2BGcznuJothUcCn6Cks/hCf7ah0VaDsHdRoy6itahLQwWoTjf9y5lXvsKehck2KGor9uK9uXN6AQf14vjv/e1TbxSl37tWXNMth/Nb2Ru03caSXzg8HA5VW17tz4seg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

All dpcm from for_each_dpcm_be(fe, ...) loop has same fe
(that is the reason to connected to this list). We don't need to
check (dpcm->fe == fe) in this loop.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ebe99d369ca9e..0d556d3505602 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1304,10 +1304,9 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	snd_soc_dpcm_mutex_assert_held(fe);
 
 	/* only add new dpcms */
-	for_each_dpcm_be(fe, stream, dpcm) {
-		if (dpcm->be == be && dpcm->fe == fe)
+	for_each_dpcm_be(fe, stream, dpcm)
+		if (dpcm->be == be)
 			return 0;
-	}
 
 	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
-- 
2.43.0

