Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E6D19D065;
	Mon, 29 Dec 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766999117; cv=fail; b=l/PGiGpZoqh26bvycbJ1Qq1AKVLLabULwRrZAMpDHRM/I/3eI27jUMa3Q8CJyZ+8Mcco39KUs/IDIUu0S5EuZ9s9Nz0wLc5bdXCxyKtZgf2GxOB985Q61YlhFFOv6IIA94GkzWQG/PvwwAxz67MuunD0zM3neEOnJTA3TUOq0KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766999117; c=relaxed/simple;
	bh=QLADT2SHGtY2zedqwnO33h/gwbw+0oLGGh9S4/p9WSQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Jgz32xGjpt9De3U43qp/5pqjDKhoh7Vp6da+pSS/R2j/4q1DN9gc84+8o3TEJ950bnjrCyMzVG6kaev8taCjXthIG/TyWR3viodq8VSJU28qrdSqzHqPA7LxNhIjhzC3SQJoc3yrCSqBwJHI2SHBpDz4GLbWB1s9fO1pR4XM69k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M4vYz53A; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M4vYz53A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLTbFN1h3tXdvKU0V8PPDMPcQ/0SBFrnK8ujr9K7S9QUg6VwZEUoM9VqwH64sN/4RqkWIswuhT2Viz48QH4r4k9SVNWZpYpNEYk+WGNsNRfZk7HztlDhCC91o0lAApVRd4t5Eh37cXmLSWBdEFHcATfl7HKfxpt0ugiEW/8pt4ZBWGCUdfLGf0s3uOk6V1rLJaZEafizNPOiThxLlUTtXmSwq5jBCdNQ1/cvxdnf0IpcE2E2iDCVBvLWcd7BB6v+8lC0Jcxw9jwBJcAw1tgmuJ+KnyDw4TsM+MbkHIPeOuitRv7C1MfucsQQwzu2EY7c5W8jLuh53YXpJpJst4n0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jrrax3NBMZ8fQOxdNS9MtvLA588ozBDDY3Rz94Ow+qk=;
 b=rLzffOyELdZuDjzqThqS9C7o/N+toErSXCQ1nyA3QPq3nGbCD9T7ZCZK9kV11b2jkLIiL+SFwsqbOkArH+lgLRIxTan0eijXrQ6Leoe8jbwADEg2o3+W0w8iIpj0fwVyeFI2+Bt/ejYTVfQVM2ETVolKSzvXsYAzi3ahT0l135184NGBpJiX3ZxySqA4J4t3SpzlWhLobY7f355amKW+k24PeqZZyWXfEwLKygnzBxeq5DsWr173+1nd15DbISHJOUwlSR+P40b47qrQ6cs5kTBF46SkJeI3ljBoA1aV4l7uoTwyVePfSaEmQGzMW+T/Y0nF1STc9EToPi6FFbH9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrrax3NBMZ8fQOxdNS9MtvLA588ozBDDY3Rz94Ow+qk=;
 b=M4vYz53AkoqYkn4Se0YSU/DLY6qmzyU6kET3X1mEMMauwl+bFLB63KZRIBl3ERu2+Lm3KVQyeeJt/avH7w6ckk485Zro0Q8tAbFFU+67r4Y+bR5DylUW09RYAe3xgm9hcMKGnOTVQ0T4ryJeOjyO/WVfB5zkNi4Sm/y/FN7gYjHWqLiUgJIGUJop4MEunmBGJLfgOSg57qk/kdivl1IlDv8XSr8ZUswOEFrc+XdUICJAbJ7uaaaQOq+SQflZbc6EOsHWLDGHzrtKIlTWCf47kPGnBqIFywe3mcXumHSOq83qRXHj3DQ3urVPW4IVmK/vY0k2Y1dPZEndTxIqv8/tvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB11858.eurprd04.prod.outlook.com (2603:10a6:10:61a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 09:05:12 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 09:05:12 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: simple-card-utils: Check device node before overwrite direction
Date: Mon, 29 Dec 2025 17:04:32 +0800
Message-Id: <20251229090432.3964848-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB11858:EE_
X-MS-Office365-Filtering-Correlation-Id: baf96ef9-f43e-4ec5-d248-08de46b95fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QjgR3qhl8RXYBqrqz6PeTMPGpav0Zd3G7NU1dxh+9IsbEWnT9aopv3eWS/6W?=
 =?us-ascii?Q?Pc5vbhMJcN2T67p1XTSRc185PbQNy94/iMjRHuPTiK+J7tGc1B29LtjiEm14?=
 =?us-ascii?Q?3cyPW5K8xSODLIBaPyOMwm09Z57LM031yN0QJPut9ka+d71vUnrdZS6IEDUh?=
 =?us-ascii?Q?C56kZID7DnqcUbkYzAXvpVzRSnBYV7QxU3pX70ogOMu1qw8H3wCs+/2/jXDr?=
 =?us-ascii?Q?TdDJqadjn3TA1U0JVfav8UczJVB3vKnB36k1cL56XdzvIrJ69OB2B0MX02jz?=
 =?us-ascii?Q?xceYKE74je3NCqQs4D8n9Yvnb0rqbZJKB6RWVdkDIjhIqv2Uee5KjCrflsH+?=
 =?us-ascii?Q?+sOQcecPwjDIU3wyjcSLqO150XGDXx99J0WF5RWiBJ3RlObAVIhFDTuWJ1qr?=
 =?us-ascii?Q?EsAk4b3eRZHrAnIAvwjImUDu10K7MRhlr+NNZqoi14gnTP8DeKggMFwy62Jm?=
 =?us-ascii?Q?5ZjC4O55E/ZONTg6tR+Pd+rRnSYh+VhSY1b4LDy9E3mh+3PZQQRLSeSu6A5y?=
 =?us-ascii?Q?MH1daEdpAmAHk9v9TrHN+/k3gYBLEWlbPLzOpFoT6xeNyD4qlTavlfHgTzMJ?=
 =?us-ascii?Q?AHfZoMB68mHRIh1sCA99X5e6Dt8DBASJuajf7EeGE5xg+FwBTZaiQPJ7zVo+?=
 =?us-ascii?Q?bHL7NkKXNoOjLsMVsVxKWBQyYSqd/BAw0lBPEvlLVCTuJeNeM7NJiFeEhnfE?=
 =?us-ascii?Q?fG5bcDKpKWsot/+LmKZqHNu+YlLb9s1bIaEO/cSg9aphqm/RvWTCx7RkXGqp?=
 =?us-ascii?Q?tz4OnlVi5VkawEmeIpI3yctX5IwaWz6jUf3pSFGTvOvbYqB7fwdTT6E3Xzyz?=
 =?us-ascii?Q?kEKGoidhXdBzWTnuTUGq2WeLRbhEU2ECjMQkJ9VWrB08V/FGRRBRou9ybX8r?=
 =?us-ascii?Q?Q6sB/5KKFffPrHobMUI0ekt18O9XeiSOkDi9buBJI4cjuvV4JzzQOP6ybyIx?=
 =?us-ascii?Q?rmbYziNpMx22MhTNZD3hoCKf2FVJ3/zEBH6PcvSOhCLka6uoy3CHfUz3XjBR?=
 =?us-ascii?Q?su7nRhP0ckYCQwFgsZm28ZCCEDb5II9FGPkRLv4y2F7QGgiFrIlzWXa1Ihna?=
 =?us-ascii?Q?mGyKGfi5xsfM83M2k3LJZuoZFythfTXQq1dNR1tlYVSETi0uOjf25gCjm3Bd?=
 =?us-ascii?Q?+jiNNPtGDm8QIyim7XKXQKKZnU5BlqE3jZyL1oM94DeCON07eQC1y9U5K/4T?=
 =?us-ascii?Q?zUGp1r8dZ18pFsqMTeiaJRXe/vzXAtvx+TpPoDS/OcjMb7i3dW/OEzmEbHQe?=
 =?us-ascii?Q?Lm0ZWoKsX8hoS9JJiyNW0fWQVQHv7j5KntEitZ40CIHuZ8sQurT0dsGB/RFg?=
 =?us-ascii?Q?qsFl8/nfORLiiFcCzXAMEcppiNKEwK5rJek71ld0XwmuoOptieKXtILKA/PH?=
 =?us-ascii?Q?1Wm155WdCd9cncUMbMwbZHEAZ8qPP6OJ4c88mLgwlMjqvcLbOA6y+i4MHDLH?=
 =?us-ascii?Q?l4ewBQTwWHQDjaj2SrYEAI5+o+sCazvRFsRr3ZyM/0jPbJgIIQyalbbt4xYa?=
 =?us-ascii?Q?40F+unC/Y5enmWUeChBaloRe/BS1bAaZq2LR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cRVydxh4Oe7ydmzlzMkNN8214gjLrOGS3XbnRI319MEs4kMf+lzeqe4tZPO1?=
 =?us-ascii?Q?+KcBnycRoOZ7ltML0dyfP7KL+x126Tb9Yz55Po6U+8mfBoX+Ml0P9baP+8rc?=
 =?us-ascii?Q?FuYIFvTcWJh3VqW9Aifj4xM/r7zqjV8v6nNHQt/55Y+kQIJIZHTNJOc9uOFA?=
 =?us-ascii?Q?+cynGvRIj6Q48qexcMu476WEKdFTHjQNejVa4GG2UMicG6DibacIPPPNWfV2?=
 =?us-ascii?Q?qk5SZvYiZ6CsgZj4AHJGgaQiGvvMwIO7G/VswRMYcn6RpfDLVAgZuHsPEhGA?=
 =?us-ascii?Q?t88UG94a0ICsT3KabxFF/mFashRy2/6ed5aJ0rzDoz4+mqMDWpL5yhCCDWqY?=
 =?us-ascii?Q?T/8kGEr2FBmlkFOopBsfNOlpq64lhqVmv9U3NXTcNamxNZoJQOjrT2M4cqss?=
 =?us-ascii?Q?98l5l8qFzYYkTQqstj71Nj+up5yPqNHdW8X/CUwtR8+FBBAN0b1VoHNOxTfa?=
 =?us-ascii?Q?D8ItSEj2D+SVY2JUwIBbiD/SVx7UHKIwY+D3zpjbrdafI/oblCPxM3BMHH5q?=
 =?us-ascii?Q?KCnYzM1YJ6MkM8Bd+t0ITJeGt2hiqujwYnWcG58BKSrh0MPwm601aq7PbbUL?=
 =?us-ascii?Q?UcaiKLzsxaCZfk+QjSSr36/ei7oq2vSQTp9TDjupwJ8fQOk2s5C4I3I5Z+Qs?=
 =?us-ascii?Q?CRDNWvZ2hQasKQSxkOTzDOWi1RlTAdkum8nhmZeVix84C0lo916Zl2ee8YJX?=
 =?us-ascii?Q?9sBYwL918EKMIUvA+QK6adfiqHFMYO3dgWJlUNMZpoGviBDy38hvQqeKlEhQ?=
 =?us-ascii?Q?A0PRAmQg4VWin0XfArjAeUHXjnqvZu61rvhB806AKME1IL+9uKLXeX1P1O4u?=
 =?us-ascii?Q?PaoOjyh0oxUGBMqLDdZsvQ4LfCwpEGKXVX/5F8TAprKRtUpZyQZwsB6Ly9Xc?=
 =?us-ascii?Q?LSzmjQPyFi85M0T6fMRnhL4GH66kWbtOUg2k7H68K1RFcumY+XgjFEjA4P3E?=
 =?us-ascii?Q?p8HfmGapJs6WFh1NZ2fguwT3sMtoMO8DtBX/K913YscYz8rJzwRCn1nMrbPE?=
 =?us-ascii?Q?xcdri3BVTydG7WIb42G/LoJCkn56gIW0mciKUy+fAXsrHq1iox88IN+G8DTR?=
 =?us-ascii?Q?TWKi4HUSbteqA5gVzL6SnNl2L/f89Xl8oGY0t+jEGQeXcHs2s1N4byte8DOR?=
 =?us-ascii?Q?8awojJNW41oKRrujE8CG+JV5tA1m9tHqcR1a2Mz5YXxel82SEe5bY52kE1Gh?=
 =?us-ascii?Q?RXS9c60hNTyQKRZgqbr1XymrOf6DBduc4yUmt56EpDJN9af+ro1O13whP76V?=
 =?us-ascii?Q?lcvN3y/zvvxuAAkX4bOW018/Sa2is7Jdv5+dwSdSashu5npmP9uFJIUPPuWB?=
 =?us-ascii?Q?SToEtHkLfRaNUS4gBk8Lb742cgQIJL2f9VFpt36/7Q7uENTSJsm/NHdE+HeF?=
 =?us-ascii?Q?83YK7t+Z8hl8rWtaZF/4qeSQedVAIy1ltEx+iKz6dPAuEupaiB0n3AeGKIHJ?=
 =?us-ascii?Q?IZxtQEWrY/mSkoQGWopOfKeAvqKNnNo9r1CX182+Y/YDWoV/17MUpoQtZDPT?=
 =?us-ascii?Q?ubAWY1F7Mgobd1ieOCYeZwaZG7EmaLTJowgxpLfFmncXaZMfhYQ1TPnVV/u1?=
 =?us-ascii?Q?b/26KPdF7KC5plWf/mXRk273bNEkVv58RY7Ja27ZedScq3pE9aZ2sVHZgVrK?=
 =?us-ascii?Q?HVZX2AcbVod2jrrYFOTFwCoG7+QSR/RAmef4HqJQ2m85qwhbkWR9/pkJ3fAa?=
 =?us-ascii?Q?t1omMnNouV3pUTYIO0Acv7Z6ey3Ly3pZhJscq+eDN97IvhulF/AL9uGg2evp?=
 =?us-ascii?Q?aSKSF2wvJQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf96ef9-f43e-4ec5-d248-08de46b95fbf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 09:05:12.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO5Ir6N59KhOM78STTu/ui6sk8r8zh/14hTANMvULgvM43RlJJZD71vvzR/+aC4hBB6E+drDS1p6726JfW7BXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11858

Even the device node don't exist, the graph_util_parse_link_direction()
will overwrite the playback_only and capture_only to be zero. Which
cause the playback_only and capture_only are not correct, so check device
node exist or not before update the value.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 355f7ec8943c..bdc02e85b089 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1179,9 +1179,9 @@ void graph_util_parse_link_direction(struct device_node *np,
 	bool is_playback_only = of_property_read_bool(np, "playback-only");
 	bool is_capture_only  = of_property_read_bool(np, "capture-only");
 
-	if (playback_only)
+	if (np && playback_only)
 		*playback_only = is_playback_only;
-	if (capture_only)
+	if (np && capture_only)
 		*capture_only = is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
-- 
2.34.1

