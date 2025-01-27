Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C441FCCE6;
	Mon, 27 Jan 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737966789; cv=fail; b=BobsZMoR9Rk4s3PJ3HNyQcv1+swWW6XzpOfT88LMxG5GJXByX8NvbC7dQapBtt3E5STJSQHpfJgDwc7yL5Dhm0oRWXCtsjATc4EwVmP4NoPvtMkaHOdxlRSPzfYhMJDN6hued8ouxmg03wiUxaG6pXt43X1qXY1565zYHcf5BiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737966789; c=relaxed/simple;
	bh=KpIvWzs2p5QkXTw6iD5gS6wOCjWQ/3cYPbKeKQqyh7w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J3zf15gm9wNZ4VCZRLT4XcE3ly9TkUrvOttQ977dvTRmo2zDKKIRALw1g2B2MgOqCR1EZoqhDBeVg6UDVxwwDsSo5Ruz2qDEc/C0fvLkt3af7NeSDxeoEdaG6iJgYpV2qiB0LksLbf7xx/HPni//LgPiTlYylMzO3nniZQvdh3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I9FUJ1tf; arc=fail smtp.client-ip=40.107.247.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I9FUJ1tf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OexaRE3SKKD4hs4Zp33hEibWHps7reXB9ySfn8jO3I5+9MNT8KU55s43U4lR8PG354y6WxOjBT5OlFpcGsMiSbf5cQ/DErVFF4rWpzxOzaQC8HISbLGqCae/JFxNoLBkNXDu2ma9ULWmif2+eHMuSrmcZSxX5oRvZT66c1+xHW4wj7VYvHLBfIWVqOgDHAwKtNq5kszOc7IIUwx2sGERiZWU3VRzZuTf8gP6KI9pWJLTu2cwnPmixXPzxlsm67fWvTdnKcgKD5PdU6sBL0zrdxFgrXZcSiCAiwxmoq/+/Pg2Ej1vCrY+9dwzIOLBpcapUP3QoE3ey5/B4Jlpw4tfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUcWDvp0HmoDahplOoWPa/fyaCUIbbKNimRxSDzQJ2I=;
 b=WG4tn0AHTyw1ZbtC7XcRZdVJU02iO3obMPYDsvPtFwQvQHvCqMzNi3jV+Y5YCRe+4ZS51+x5n35BMt126/1AbbI4O8FZSRNlVwEy3sXRfYkYTlkVdHhBsb5+4tTbdRZ7M6uEdUK4FY6U+XkH2NXWkKoYvJX+mJ5+Uefzs/M+GnsqPgPyPa4233vMnhlJggjW/6bp/U6tPSbtn4OdxgFc9IjkdJtV+nc6cyi+EYfT2AR1c8XX8osYF5oprUaU5ziZeRb7zE2whoe+W/ri+aESUUPM0QY4+S0JXipTjtpEVwikQnHprOw9IZEgmKVCWMiiXqZh0n8CyBU+/slkrVLkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUcWDvp0HmoDahplOoWPa/fyaCUIbbKNimRxSDzQJ2I=;
 b=I9FUJ1tfbfCH92NQCjUslq5t1YTtU5z93HeaeYNpVnw9p4Q3CMnEBxEiGoUjxwKMXu2q3AxxRp3ZxUyXDsVQjH6QbltowGGclURIzyzgbbXeaFtaxi1obZrYzTXbVFIdOTa43iIeDmdu7QWziycQ++0GPAXpojBJapDWLmnqRpW7WiAyYEz8c3nciBMmXqkeGh3JJZAX0aEiK1kOVwRSu7fZncPh1e0zUZpJ5jqrtI0Ibd4Yf3ZOvIlSqPlbOZmFv5D7pQfMuLFIsCpaUtvI0OwWqxOgJKfWyDHGe4e75fotfSnjmVI3mREISebkt2zarbTn5D/+ylTjfn/5BZu+gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 08:33:04 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 08:33:04 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: amd: acp: Fix possible deadlock
Date: Mon, 27 Jan 2025 10:34:22 +0200
Message-ID: <20250127083422.20406-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM9PR04MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d375863-a401-4375-91d2-08dd3ead37e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uG/A32qg61787PBXyqsq1TxAMAFR6NEzhiwrmHQhgYVkIUfvfpaDiNnTr9c8?=
 =?us-ascii?Q?xjUNSrgI4rao8g6Jy2DzkucS98ci0IZwZl7J2v7mfgb6g3D7yNW20LMKYWcH?=
 =?us-ascii?Q?6P4doHJLzACh5x2PFx0oR4dw2bDMHXwb2nMSPAwcmCarUJyij2HPG/iYkT3+?=
 =?us-ascii?Q?2yZWXwA+V1QZr1epoe4eIQJL9FWDsH94buP4y950uWFGaWhCRT3Cedv1tTF0?=
 =?us-ascii?Q?PfZDAJhO7gFajP8O60znWHzlF3Dune3p3qBj1nzO4oFYwVjx0+Mwd8LUJvR/?=
 =?us-ascii?Q?qSLNXFgFS2My1SC2+KxWOMcWJ4USjJSGiVAGdHRY0pWjtC5i625l5sl2SbRd?=
 =?us-ascii?Q?75BXNT9Zr23xI0EXDppWz251em8Y9gXnwCuUzMWpRdpsZFRdW+0Oyxwdswmd?=
 =?us-ascii?Q?SpgLlZnERtupQvzeiitU/h8wWkfHBYzhM486Vp9mmXO1j4EdqBnjYYWOKmao?=
 =?us-ascii?Q?7KzGPxrXbVJjo2hJjLkFrJH+sBEuCH5SOc4kUnCqzqhvzG64JAkIlYD/2JmG?=
 =?us-ascii?Q?Jm1ZCMY91edpyeGXJDt8OBrF/qfGnhjERt/Uj4Xy/7gUffFc5M0UzBjCjACE?=
 =?us-ascii?Q?22lEqSMA6x8Nzg2ik12cP+E9eSLyXxe5wY4cwP+6la206QFemHXLcCLl/Z/x?=
 =?us-ascii?Q?kfzJYBDmbVcMBbEwQ2+uVuWY7Hfg5j6Q4fUpJEp6SMAS6co4anpWLfi9wLvo?=
 =?us-ascii?Q?PvikWKiAkEFtMi5sQFNRcmAFpFgOa6aZ2qfXugPBzLu9c6S+GAUQHwE3Eo0b?=
 =?us-ascii?Q?CRIW6O1NCx3shoG41qXjEmiwF6bKaMhKn9wZZYrgneAs12UQIfsgrym4DBMD?=
 =?us-ascii?Q?uRLgkeu3ZHOrpXfrY8bL8uC6Kla+Ji2s/9cawm0Adg+7Y/VjR00kEgvmiKnX?=
 =?us-ascii?Q?74F7wCLV9naVP8+RXemn1qi+aKDRObCqqAmcWWw0+UDUGfw5Ezel8blFo4Ns?=
 =?us-ascii?Q?NCx0mR8bvnfSFaiTSAIWvK2fdxthlIUDKU1c/ioPlGZfxIrxbAyUQzFENRYS?=
 =?us-ascii?Q?BL9sOMRCuAs7o4UBvn+MZVtveshz6Ch0WUh26Ocfl91R38SO2WIn4FXe7x6k?=
 =?us-ascii?Q?Ye1W2z/fijVucCYs7mhFP954USky97Ay08x/1nJVUhTvWam+Omq945WazL8F?=
 =?us-ascii?Q?vmNGTY3Y28ZkQ+fvk/A6jFCuMYvyBIvuxhuzjZ2imz+gjKXT45v6sWKYFZ+s?=
 =?us-ascii?Q?HZjR9t/WijmutrBL1JSzuTJE2nDR1397h8wK+VLILLlKf80KmwjXOS5kHZrv?=
 =?us-ascii?Q?U4hfKd9SFfNhYM9aP1G94ko9Zn1JJnYsI4AjLtK11IxImreaWhyeEDgvRPYn?=
 =?us-ascii?Q?2WPY+rfGDDA/ZBamJakPYTIWSS4vcTiCIqj1P/yU7xfmt0hGLUkFdoGd4Jez?=
 =?us-ascii?Q?tZFz8uE3zl2hsMN/sQ+J4+X9rA5I2QRp/bwCbeD2JTNTBrjuUUvLX0pXEwvT?=
 =?us-ascii?Q?z/O1LZVEgxxY1VYHr5yZVCeEiFELpLJk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YnYn0FFLckrYj5vwe+6WUL5MhdCDB/cSshaKMDp0SkuaPPVEW8SZ//QFmgbs?=
 =?us-ascii?Q?hwRvzNQPTr9Rfq+DmrVfNimuuxoI8acAJJJE7otnUu8tZR/dWcMm3gVBdFPq?=
 =?us-ascii?Q?twIla5aVH6v2KH0ZrTyp2C7hZav2Gjv+cEs5JatHIWaj/dUIXkeomYZ70hMM?=
 =?us-ascii?Q?aRKOvuRpEjLWhsqwFdwhCjBDre3RWTcE/1nATFGyZYaj6tcICZsBvLoPG8/G?=
 =?us-ascii?Q?iRbC6M7BzKZVVyohe1kOU93jESLC74dMwtO84M6GTm3MoFRxJM7QLdK3ugoJ?=
 =?us-ascii?Q?kbNNggSTYF59UBrKsigsPFiBa+xcC0KBVT9vvyiI3Go6bF81QNMUmpBt0Yed?=
 =?us-ascii?Q?9Oa0C69i78GWDrolLflG9AM95AURF8q2SkafzP/kySduZBeyRABL0WML5Uot?=
 =?us-ascii?Q?gpkSELZXPUOg8al7Mp7bYYi/wgEpylwmdTHIRzxtuHrx6ltzjEJjRaCeXxjD?=
 =?us-ascii?Q?YJhmWsoM+FpDhBK4XR/fau+ne+To7ZefgbUFcoOKwT90N2dQmA87Sw2vyZ6v?=
 =?us-ascii?Q?HqmvSIl6jnIB71/cjLeID3BFflLGB+OjJcNyft1MxvbY+hnbptRX5qTz32QY?=
 =?us-ascii?Q?a53txQ2iRooLlY+9F54O1GdCMv1VXXNBpeZNHsCP7cW/fyoKmJ6YFa33xuv+?=
 =?us-ascii?Q?YIfQV47iHyVSEQ2R1X70DZ5+bBM8WJvlaQ+UCnG6f4wB8PASujqh0k8lhtIQ?=
 =?us-ascii?Q?3FvhLDRqSumIrsiRB9uzu6BMxVw/CsWbepu7NevcdD+lcLUWTizSxgGcz0sL?=
 =?us-ascii?Q?JrzGOkaEFseH2db0DjYCpv+Eex7kndIjsygUl/fyhMu+0yPdBJmnkRorYAqU?=
 =?us-ascii?Q?sQc8s3fUjeE+0enluPasY+vDUIYZBvKeBX34cY3Vf6u5ZhUvwQjm4hjMKeh1?=
 =?us-ascii?Q?gNe24qZ45+GP5lrGXo0f7ta++H6R9EQXaElvCU1v78beBB+DpSeQ74v473Wg?=
 =?us-ascii?Q?DA75yg8tPcTUuPILHW43laEQiWynPMuWx5/38JsYOinr8sZSFHLuu0Gi+KpK?=
 =?us-ascii?Q?z6jzSzsjx1KQvuIYmvHtk8SNYGNWaR45AMqQ3u36xA/UlSEAiMyg+nNkPA23?=
 =?us-ascii?Q?sYeftJUDO853H4ExJRxxt9gOJSlFx41PQqqZVfcdkLQZDpn93t3ryA+9tcOg?=
 =?us-ascii?Q?1wAjBc2KwgnH0i1TmWcEVWZedcQMb8bGyKBLMXeBFS4FFFoz3k+vvZO0FAlN?=
 =?us-ascii?Q?z8EHs+cpxTz6FYfVenBSIVW9egWzzPQiR7TNX4lc5hAgfEDp9xnZ8fvEmUKF?=
 =?us-ascii?Q?3TxbZ7scmY8QBBxMVkuo4avlCmM3WeUArc6oBDZ3Wiqq25sA7r5t9mhMaI3c?=
 =?us-ascii?Q?FowAN/7LaYJ1b8xED8WtyR8k+kjLY4HsMYWC9lWIGJD+hcF+AoPj/7caScWd?=
 =?us-ascii?Q?ADd4kJmnbwbz82sm1NZRxatGONJicSXvlHpb+Szz6s4AYuuo9qx3cx27xr6b?=
 =?us-ascii?Q?aq9TsKiKT+Xh1nYUwAz4XBP0sgm9/g5MNZ3Lcjs80rOqU1VIvw3zsOjdoouk?=
 =?us-ascii?Q?jFy6MRXuN+mxS0gbOQrPKgLTbDjkUCyTf+iGapZc2z5xDATDcdF7MDFoXzzn?=
 =?us-ascii?Q?MxIb4uGJ1S8c2CHpkLvLO/PpL7wR9CoYfh6l7Xwh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d375863-a401-4375-91d2-08dd3ead37e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 08:33:04.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPAaOONxIgvYvaOPFa8J+tTKk1sywtNgReQo7wo8Szg9vPS2HJksnw/cRw047tA34RUM4+Z7XzWonjuONxf06Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8242

On error path, function acp_i2s_set_tdm_slot returns without releasing
the lock and this could result in potential deadlocks in the future.

Error reported by sparse:
sound/soc/amd/acp/acp-i2s.c:95:12: error: context imbalance in
'acp_i2s_set_tdm_slot' - different lock contexts for basic block

Fixes: cd60dec8994c ("ASoC: amd: acp: Refactor TDM slots selction based on acp revision id")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/amd/acp/acp-i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 1f59ee248771..89e99ed4275a 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -181,6 +181,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 			break;
 		default:
 			dev_err(dev, "Unknown chip revision %d\n", chip->acp_rev);
+			spin_unlock_irq(&adata->acp_lock);
 			return -EINVAL;
 		}
 	}
-- 
2.43.0

