Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC66198E6D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533940; cv=fail; b=pf0H7bM0283wXBy1eaM9eTD43jYZX2WN1yNbyC0qEiuP83O9nqIltw8lWkvmTORemDxZMwU+7R+HDkheTuMew7vXtGUmguD9jh+lNEq59BHVvc/PSmkM7m16T0fDp8v/OpSTdm3AWLbr+kZaELyQjhjIzeGI2RaNzFeGcd3l7gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533940; c=relaxed/simple;
	bh=YONXyOqZB6ZvF5N2/uDR3vJJiqVmF7y4xCoX7EEDus0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OoVEJa/7DWGWew10mCEpxSwZ9lspSOClGbGHPy2gR8CjED7lZgXs0WgLKXpSyQ1gQo6lMLDCQeFAFtAOYMfDVoUAqdc/pB4DaF/wWU1n/X1RfRvbpWmayEpAV0bUHP4sG+xLJeCsJp/QioP25oyG1tJRDr6+C8YAeuavAE9jwB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=puJ6PEbO; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="puJ6PEbO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3I3WwwqZuxuvwqTTa+csbIG9AzgIidzvxk29I2u4lfcvxZtSZexOPhogRbyu/NXD/6OrHft/agkUh/yrtr9C8E2p1y0h+9JidARQhs3nxOxBE5gB/he7hrwAwlOxT2JKuuiQqMjVdbjTLbiejErVjU7Gx5u0nn78/NQYU1jLD0WYYZy6ynMJEnX3DeXQxO4m617CS8apc79jpSLJ3WV6bY9tpTiKl4F3gWet4njGJT7dKgPrqk71er8QLeAJfhikgAXQvDjIoZ80KYTbUPaJis+5XlPW4ABh8oMOhEiEiI4FW5484nJVeOn09mbKlucXkZCVa/e316/TkdlNoDqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/iJ1jzPPFCeTGigK68If3KnM3R6iNisl8sf35Dfzjc=;
 b=jPq1j7biz7TARKJCSH4iqEee2PAQCbY8f7amKANWWvq5q//vjS7Q9bifhV417Kpxd3lKDsJwh+Lx6zO5fStcEOBggMW6nlydk/3LPdP4MfJzrI2fk1cpgt46JhYRsHIdW9yVAOmZ/cuuChWeJlPSgTwjRZ109KPP4LsbqQufgce2PqdSY9i9DjmI93KCYgVLI2/JN6YPrFRvmJaTNi9aebJB23CLHgMzBYFloxR4IT2TxsNqYwhsgyGA/ghumSZ/ZbIhzADS3Q8dvCP1pbENyKCrLz17CnljFMuHUGgHfYqQC8zl3PbNdLv9qdhMEIBVCyAWOQhoDWB+b38dfH5ixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/iJ1jzPPFCeTGigK68If3KnM3R6iNisl8sf35Dfzjc=;
 b=puJ6PEbOi2AGn5z1li1wtw9idPCwmFmyl4tRVrTwLQtItoNUp0gE3Jd0GsCJ9dD0BKcV3I8E3xsnQIOBy3K4LPJDj+zHtjRwi9vSTP4YYE0J6Vv+8XccqFWrz4A03LA6rsP/kbjHb+uEG+Zd+Xppq0ffP9tK/svarDrf8p1WqSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:55 +0000
Message-ID: <87r03l8oy8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 142/157] ASoC: mediatek: mt8173-max98090: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:55 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 750ee0ec-37c5-4a9c-4e70-08dd56065537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dIE/hIqqx5vBkfjRb/UWX7VGgzAFLx3Uw7G7HGeW/15nZVzE6SgqCbJR9BRz?=
 =?us-ascii?Q?/V4K/dSXAeCY5h+FRzRpO/q4XWkq9mWICZeVq9iJrR0DeP4Z+ii0bwZCNM8y?=
 =?us-ascii?Q?gYeI5A+8RdN5DeqZXCBG5f7F5ZXkk+KbvRK+/n2n5EyxUtEDxgNkgNBRceIM?=
 =?us-ascii?Q?NBXHbMnwuXHKDg8lA1Bj4rlX2BNljMhNMN2y2fk8sPfqSGjRbTxKqbYzzt5X?=
 =?us-ascii?Q?irphHWQeUs1FD1aLGgiwA63UjGmjiCeeSmFrBaKNXnWaT/MnlQrS9+0GwGJh?=
 =?us-ascii?Q?CuKy6Y+8Y1KPEe+JXtdHsoM+xU5YFtQa2V3OlVEOffhhIGhJF5DT2t22KIEy?=
 =?us-ascii?Q?X8k9zyCQTo1KquksihSpXrl9V9woXIpIAGEzrFw6Yu1/Q2y3rR2YtrcO/E6j?=
 =?us-ascii?Q?YGakrrM6fiDHxA6AMQcaKfGL1mPA+4Y9yDEr21qgkowZBrX67zOSDspsGs2E?=
 =?us-ascii?Q?sjDaOFNZ16irPdietZHYw1Xxkzmu77k50fT/5KGWY79xO8WGzKopeYLToIFg?=
 =?us-ascii?Q?sY+PgV/zu0yGbNS3xLRmuBnstXxzN8x76K3w9RErpOGNH7gEcZc0MW7LBoeR?=
 =?us-ascii?Q?ZTCFrSbUrdwbvwmMNj5wiHfhWQTpc3pMVQ8kPFxIvlUzSHCv7RxTBAX3A2E6?=
 =?us-ascii?Q?11tL6yu/+jFZNJsW+jUEyJBIxYOE478f2XYTo5tvLbDXV6NxUG/SeuEKdZo3?=
 =?us-ascii?Q?Wr7kdt86HHFpDjZWmAZkjKCz7WZHsYy4QzSWCP2NRNoJwfqet1ajwwi7b325?=
 =?us-ascii?Q?nYjN409SZDnLnG9WOQQWLcAz85v/Bw4/MwCAswL8bREGTvL0PhLFO6HDtZnY?=
 =?us-ascii?Q?5w4nd1VX67hpDA60bJOtZDaftuK6Ji+vnJMuBmwPsFgtyGKyA+ayoKAQenT7?=
 =?us-ascii?Q?6yhZF+wgNIBzMPcwhZy0sfNhWO7i3oJ/yC9icq7uIhY3xZNPd3DGlIWZeqTa?=
 =?us-ascii?Q?O+g+UWNODjzZCTcEI8ltsbM4rzWUQqhgHZltl+WIHTsTBpltzKwIjYuZO/lU?=
 =?us-ascii?Q?p5akdbr+NZh1/TA8EfKngJJ6o6b9Lw5BpeGywyeElehalCLuo6KAbhVASF0W?=
 =?us-ascii?Q?P0lW3jdTR2iYWcicL8b0z2NHYDpbTQ4Mq/pnvjM0ymaxvWKYZ84C4UsqsQcs?=
 =?us-ascii?Q?3D5520rgd4N2o6KB5KUB4PpOA0cIZy0fQd29/lTWMs/Wd8SgcIO+MRToKazY?=
 =?us-ascii?Q?bDDQRypEnkVpJj80j01S0oftphApVXhfs9X2H+em/bcUMmrw3kw2slKalbtk?=
 =?us-ascii?Q?nhnrPqWlKk5tixv1wW4BOLQtG6smYh0B5m5+82iBWM1WEs+1X+e4QwUDNsIf?=
 =?us-ascii?Q?Ss173aLyUw+o34HTn0vuJzFCVIBa49jmZPzW7cnj/ye/skGUJz4PNc0YrpOx?=
 =?us-ascii?Q?4RRNl9M6gEfH5nkJeHHmGBH9awvMzSIxB1lDbhX5TvDSsHk4gNz8qb9r7Fql?=
 =?us-ascii?Q?hkSODbhWeoUXpmfNF0hGTwcgSEP5Ab1+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GK9pD4e1DdNuRw98Sy8Nw+QKfSR5pEsd/FY7BgwpTbHHbR9bQqqk4KN+bkjW?=
 =?us-ascii?Q?5/JMO2zJ0pZTevxrdZmK+ixA3fJh3GytEmn+uwgBCYkAD0leLWreCXbamWr5?=
 =?us-ascii?Q?YAHoxfdDJ1uUu+oPq72dKp0fvv/7SUpEpMZkuII0uEXhqgJpfhxsv3U4T3s2?=
 =?us-ascii?Q?DtJsXRJ6Js5TLmmQErIpNFg0q1scfVmJ7+ldP2oj/+hsmxXFTf+GcnNjU3J2?=
 =?us-ascii?Q?b2FTQfE2ucrmq/OBHUrYbcqBuJGER2YMLF75DiLgufZ9FkW4WRONL/FDnVrQ?=
 =?us-ascii?Q?I/n8L5PCfSVgM51I5WXxTXoxGXFvF6DhVF+wCSwJWZF0wWvHCyhQRP5ScUpm?=
 =?us-ascii?Q?AVjwTdoyYJFwYJn9xUQIDs75AvwAk24ka6sDm+M5s5KWdDF8toMk8JJqxhy0?=
 =?us-ascii?Q?Sy0sGlrtCn9lvC22se5cG5t/cMIXRII7qFOAStL10EfZb9xglKBb6UU6BMi3?=
 =?us-ascii?Q?PmRJpjE0iM7tewXqeX56JGCEbj/qj73uc4gwwXo4grfAxIY1zPllBBXSia6Z?=
 =?us-ascii?Q?Ab6Uxme8XZLFB0u10ebyO+LYz1Gm4yvcuaWBrsy49XPXh+HAb7mDuamMXPcq?=
 =?us-ascii?Q?X+tyPPjHj8yyjOR67nRgLO+o6VZspoeGX7AjM1+3VHhMEaW53+/R/3uWwfor?=
 =?us-ascii?Q?zBuJNX76IM9xuYmmC0sT3pZFg1mth3vY24A0rO4hglEGkblmKSbX9bufBbYL?=
 =?us-ascii?Q?BaPnMBPIdEGMeU85mMAZz83MpLWHABp5Apo0PB9eop03MlYMuO9iGZ8r/YZu?=
 =?us-ascii?Q?KuRP6Uxf7uUikST+GJnITz+BF/mLSJixyOP4/333PV/q82ADiSPiFzdpbC/R?=
 =?us-ascii?Q?TLVyTWpJtSJDfl7Y/jkY7Ir6AexE4fSmE26AG5EBHxaug/ksWLn5gs95hUsb?=
 =?us-ascii?Q?nY5K5zzIyizz9WVxg7P5YM7Ti4/0R7NYM2W9XsQMA95yRKeVJ4aTuiP1S/ff?=
 =?us-ascii?Q?QAUHyiBHqxiMUk2XltiQP6rWBFoj7nAYKgLkmdefXeub58RMHMY37lFVlJ9X?=
 =?us-ascii?Q?K5yU3WGnGONZnIpUlCroLOLii+TRpPrxd9RE7v0+/Bd83qek+hIskOI2mZWk?=
 =?us-ascii?Q?2rFxdybGdRpWo832cKIjd6931eXJQYZbMU4QEpVKbMTqw7gx11gNc6UQyidd?=
 =?us-ascii?Q?wVNxsCGBjq0rqWBWTbUts3BzGBr+FMuKAWR6IfnyNHLjzXYmaAdAGb7kWkp/?=
 =?us-ascii?Q?XooPIMdeRLsQtF5RFsqXzmRW9tKce3Crn8eojbDn8EQeWZAfK87a58ku8Umy?=
 =?us-ascii?Q?a59zO92nRzuR2P87fn3rtLBOIVZqMC4ktziT0kowOm6R3rSlcL99jcLh5gXw?=
 =?us-ascii?Q?ZqYIjx3FewFokEsSMq/N8hYrbZ13hu+aid0TuiNNGGNZIx+1oe9iD6J4TvW8?=
 =?us-ascii?Q?yRBVcBl3/5Ot/p7Ps3bGYwGoluma5Ldz7cpIYVq8rh7tAlqHQY9CD4YR24tQ?=
 =?us-ascii?Q?Eo/PatixdxrgZD7h0+tr86RaNlpFUcHqDp/T/M1ZrduA/5JYvaQrqoaRthxz?=
 =?us-ascii?Q?z6Qdsk7rqziKrZDmGZoApN+Bek9IxANZITD95sbmpn+WhPJ51JgJNOZPxezd?=
 =?us-ascii?Q?8A0IuNcH1uKhg2K5gak3iQRJucwyqHx85SqRMVqN0JkY8eaK6AXfG2JRaezn?=
 =?us-ascii?Q?PTL8E/cEWCVLn+815IaePsY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750ee0ec-37c5-4a9c-4e70-08dd56065537
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:55.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gnn76bB/F094C0ngL39JCJMQRs/dT+i2Lh8MZU8PdxzTfF0uZE26zZXsb+m2xKkOtxm7fnlTiPQ9dsgpevgb8/IQ4WvunMsdbwaQgjq27MHSTW6t/6SsCqyUwF866aPk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 0724564cee6a..49ebb67c818a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -122,7 +122,7 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.init = mt8173_max98090_init,
 		.ops = &mt8173_max98090_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(hifi),
 	},
 };
-- 
2.43.0

