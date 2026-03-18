Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC836C0A1;
	Wed, 18 Mar 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829664; cv=fail; b=jt7Q2ZR+eXmX4CJXwACxD0uhBH0UN+1kXgcF6lN6AGsOYLuz5uyF7B1uKI37xqqwxl8pRLRgwNlXf0t6+55MnkHYc3LOP0opl/YVtrA+RqCSyfFrjtkvnZUfJipiDWzw32sPGJh12PmpZiHD4tu1s9KoJYm243QqawAIxFysee8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829664; c=relaxed/simple;
	bh=K+rg8keGV3cfyOP9jZQ20TF7k3B2e0GlALZPY+i30SY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o9cFAu5im8mVt6X/reJW9KuyBZCrFYOHb4QVSogONP0or4jw4JcPYDWmlAYwCAd+q2meu2GFt6Wt283GLgI5SRGPGwbUXORhKMBEk5Pfx+qV4jpQruIC8kmwB29nP3yLQ1WK29WGUbE4ya2QEnryrBxYXNdRIdIdcPe+glv2y/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z7cxSAC0; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z7cxSAC0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMq6YXeE7yQk/svGmW6OCiEooCQYSrQpC7fMQ6AMlFOD5L/bckEZjLVs6Bowccqh81AH2Ybdexzst7MFXojb5a0GTLwed97CQ9ywUQ/NPt6su5uU8pvwChdfPXlkGyHxdQDpMK4VDlCkGwq1d/4er7mUpxEMqO+mHwz//QgzpYl4yrrmeUU8zyfEZgk3xqZwS2xfEYI1KHoNiNe2C34BI+JzaPNJiSqxx1lLQ/sB7HoJ7BtSFD0a9c24431mn71p9qlttP/4hjYJF8RI05Nk6/ca7xmQFrvx37JaSW7nbp4IsmPJvPHWEXyJW8vNQGtepIEEi1gTNZVw7kn1QhVWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0rqH22CmijDcS8wWc2C0EeeJ11+ngq4oAY0rQaST4A=;
 b=GaEDRw7prcIqQl97fuktNn9eyanFEaF9AWcyLEAJjxgIpwgwHfe3y1+Vqp/whneoTlyjgybWdcAsWAvG4ltRWuucPBck8eO4O03w5Z9w20gyMwo1l1l1mkp+etUidd5tOMbejkUC7M3M9Sg9hPE3sQFx4bX9Exq8ZdOP3yl/GEzfvxtP7jCflOgyuKSzc7B/WwiaBRqZJJ95+zZURDK+L6VOcNbyh8Z/k9wdXtX02G4rXulbaADboKUhETu5ynnKjncM/pNpsJ4sRytgz9At3BHprid/8MlW5LK9b/13IM04ikcVabHjLhEYh/yE4PjPjsFnYE18Sf0k2DkyTkZVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0rqH22CmijDcS8wWc2C0EeeJ11+ngq4oAY0rQaST4A=;
 b=Z7cxSAC0sJpmBlV8gMo6iK0AWV2IjNBJt/51vwV60+MlG5JZduvrcpkLO9airfUMA3NhLiGsSu3pzvl30FOJeP2JxxqJrXyRHhUArCDVhV3S5wR6da7Av/Fp6dlCe9aHvCwh5+qh6gnqnBDKMXz68gGUQaZb9zJuLwbhWNEYE+o1KPlb3Y9OKJ61TPCEUkIFW75QG9Ct4W3Jk722zqRd75LWTK5zLsnFoPEtZNTRkENwPR3N/qX7Pi49HzJUUpPY2xi/D3xFVEywbbfEXoMzlEdpLd7VfHUpN4bXhbbGqq19dAQk/87uSopXIkgf0VUGCsdoBc1DIf2xoZ82d9aSiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB9514.eurprd04.prod.outlook.com (2603:10a6:150:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Wed, 18 Mar
 2026 10:27:40 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:27:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: [PATCH v3 1/2] ASoC: simple-card-utils: Check value of is_playback_only and is_capture_only
Date: Wed, 18 Mar 2026 18:28:49 +0800
Message-Id: <20260318102850.2794029-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
References: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf0bab0-5522-4f78-aa55-08de84d8fb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	A3dYmzoMN1+3WTuaXQ9D415BWBz03BpUwWQmMd0sUS8LtlzsY/T+iG2w8EhSXN1c0Yh2Nu4q4MJRFWmEWm9Lkg5uemBvx+XMaG77gYqJQ4pfN9snpx0rs0nLtnrdz51+mmCksasnR+37580TBbxTtwBDVHhvGl1NdX3zflWQfASSUeyl9oTSQFa0lVKE61Q8+CyBJE1YmccdFbOxXPs3blHd2gTXw+EIi6/cAMBj746tVCbqk8VuaPRtX/uOgWLIwCoJ88Xjx0dPGzUCrXYVXzX64WKQbZMhp1cNkrGfzaa59y+IhhywejCD68RYIRJDYf4PmqBnNSD1Co/P/VQ0FcojSvKl3+fqt/VsH0tDxh6/6OTYY1B24/dy6I7YbpJX8IpKNNalSYCZYMPEIdn7CTxt9nYL7jwAST5JYmWUpMJREgRwVA8VUHkKFPyqrztyMcyV9AuGdAN4tD97i/gfygdJTLI2EA3SzkfpSAZBoyIBlqaWRwKxzmjUtBkEw8w7AYyxLlKZg7tj9/IOauRccfI5VVc5sNq1Cg8P5pndOC+ZHsPjr9iaXI9275RDYiFDRLbSBOxkRGlnkKoHICrvF/+wcBvg7PuuyFTo+GlHduOSIH3cux75WP9BhOYTXmcsj7HIO5/ss6oXdTluBys2YoJvuMlK9bI9gDLsaW4zTr7yezAIxiyRF1B0UKjnxWVUhF6jsyU7XuANCKvRKO9ZYxmJLfvFWW6aJhqUsDWAL31/Mxt1jVP8pJuLkZrz7nMaFvl1mWrn2Y0OHlRL7+jmk+/RXlkC0Fr5i/bPqZGRjNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VJ+x4DiTT3SJHiKehivBv5T8tvGmhti1ScEWZdrCpdjwPi0TWUogmohMZCtI?=
 =?us-ascii?Q?vSL9ftOl65fpMJTt/sOKdsq+Igqr9mZp33uaV8xliLZ2+TYMjnPsI0t/WXTy?=
 =?us-ascii?Q?MZZFeFkNRzTrtVTU5VMpK4e+UVMFyD8ETnXBAMMGyyqM+4jF4edrBltCjh+w?=
 =?us-ascii?Q?Pn9Ir6WLcp6OcFfV2yW+odJfIgayxXVeTbxweNKjfblRqN9VKHZq18T/MywD?=
 =?us-ascii?Q?JVqOJcXAw98NOcegUGcB5kiZNQMmvtPhPTk+9dIP035w7m14oYQq/VlWDtIw?=
 =?us-ascii?Q?ZEh0K9fEb9010mLXiF6gDPySlWCogfEmjFl3gvLGejSjL0J0mWyNCc1VScBi?=
 =?us-ascii?Q?3W9fGce3Gk8xZvq5mUgkmZZjnw267VoW71Lv+cH5crA60vgO4Dd0xaemTE7v?=
 =?us-ascii?Q?YzcacBNk4NKPxAvl1HHOa31gW3crbzdME0B5Qb8N0aeXNTNSjZ978T/xWjtG?=
 =?us-ascii?Q?8cl+Dinvi7Lhd6u9Qi5QqcSv4MUq/nsa7EXB8myUzFyV48RPXi7yz+L19n0F?=
 =?us-ascii?Q?e4sLzwg5JuQAQaE3/YPdFo8QZwMGouSiauRdisI9o9pv4xyzgfKvtvSqxvEj?=
 =?us-ascii?Q?Q1SvSkMnChpHT77DKUebyViHlrVLxp9w4cH7m3eamm7NgTkdwkO1DCUywjfB?=
 =?us-ascii?Q?0aBwaBpyqWtcN62UWQlOEML6mFlJ2tcLFiOqxOlYEB6TyPxWegQXTsvHHkX0?=
 =?us-ascii?Q?YgRf7CL5B/KC00hZtOHEz7Qh2RVNvaRj2ZCRKLBimZgDAIsxVuuE/sJvJ8Al?=
 =?us-ascii?Q?cgcytpPcZIaqwrAtecIR/lWe/gq9oD3JeKngOxrshfLy1q4VAy52HNm/C4p1?=
 =?us-ascii?Q?nk/+u7h+NpCFc879WUGPmXWPxfQXWHXeMV2Dpifaja0kO+8nZo7nbN/ngUlv?=
 =?us-ascii?Q?S0362h9neJxeSQVVw8c7abnq9DlNUBEBzu3k/m3G4k7p3c/T3bOFZePl9tI2?=
 =?us-ascii?Q?WTqEcsWvSh7SQHi1NAO/EY/rF2iZAuPJCR21n71uuYx8U2gx8W45pUncvw/L?=
 =?us-ascii?Q?ld+l6Jd1Qk6m5d5u0PqN9pa+X/efog8QMqj8k2rdGQWiTW2ZdpRrzeQ5zCEU?=
 =?us-ascii?Q?RG5WRbb+1XbybL9YzJrxq/QaEcY9P1ufjguZLWExv/+phPuCc/SyE3hKYy8Y?=
 =?us-ascii?Q?gDYYtECcli3rVubLKwk32KfmPZiLV7ENdlfyaaxWDCZQotZe4oObGPs8aU+F?=
 =?us-ascii?Q?423W/1OnxKksvXdQ0Ch1R1+IgKef8zzIA8lyaiTXfWunO2gwS9kprqSqtg+O?=
 =?us-ascii?Q?S8g4uZ22Yrfnj4jp/xmpvnIv28YXlgfT0iYXytkoOUI6o8JmiWSMSlyia9v5?=
 =?us-ascii?Q?t274TzXxhKcj8oVUTRaVP6BoXniNDcXvMG/WmoYMlMAg2WjPR435Bh9keymt?=
 =?us-ascii?Q?o1hyyOvIr9Z45TD7M7EM112g6AvVv3QTBylH3PseM4snOSBvfHaBo9cg/qRl?=
 =?us-ascii?Q?R9BzT+QoJ0rGUfhWaYOQig+mbALuOa/PoUMLFthMdcUGo++xG2pc6wDuOwNX?=
 =?us-ascii?Q?FEp6xgDy2xS41Jt7uHNteEqKPd+2lQUeRRnx9FooHL9iV38X8fFW4CtOmN/P?=
 =?us-ascii?Q?oIRF51QCf0oeTfdA387xm5eyaVS0y2yoUqEER0gusHnYEeHYS0R0rw15tS9U?=
 =?us-ascii?Q?sai+6IjYjYhfKbg3lO+5hWA1mlEWr9qDT8jn8peohrZxxvpoSQnAWOE8RAZ3?=
 =?us-ascii?Q?vMXOG3YmZugF/55JXA8hFLTExyXWB2GBoMjJzqe+Dtiv/87NAlkTVli548ck?=
 =?us-ascii?Q?lKSJeoMt0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf0bab0-5522-4f78-aa55-08de84d8fb45
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:27:39.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r0auyO8CTLQSWACter+dug2f7StCxEWPdUeQaYT6QrX0NkeTEoA6OHmqhrn8ESl+zikSQ06lPCfsxvqHJTvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9514

The audio-graph-card2 gets the value of 'playback-only' and
'capture_only' property in below sequence, if there is 'playback_only' or
'capture_only' property in port_cpu and port_codec nodes, but no these
properties in ep_cpu and ep_codec nodes, the value of playback_only and
capture_only will be flushed to zero in the end.

graph_util_parse_link_direction(lnk,            &playback_only, &capture_only);
graph_util_parse_link_direction(ports_cpu,      &playback_only, &capture_only);
graph_util_parse_link_direction(ports_codec,    &playback_only, &capture_only);
graph_util_parse_link_direction(port_cpu,       &playback_only, &capture_only);
graph_util_parse_link_direction(port_codec,     &playback_only, &capture_only);
graph_util_parse_link_direction(ep_cpu,         &playback_only, &capture_only);
graph_util_parse_link_direction(ep_codec,       &playback_only, &capture_only);

So check the value of is_playback_only and is_capture_only in
graph_util_parse_link_direction() function, if they are true, then rewrite
the values, and no need to check the np variable as
of_property_read_bool() will ignore if it was NULL.

Fixes: 3cc393d2232e ("ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction")
Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before overwrite direction")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3115e1f37c0c..4cf3a5395763 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct device_node *np,
 	bool is_playback_only = of_property_read_bool(np, "playback-only");
 	bool is_capture_only  = of_property_read_bool(np, "capture-only");
 
-	if (np && playback_only)
+	if (playback_only && is_playback_only)
 		*playback_only = is_playback_only;
-	if (np && capture_only)
+	if (capture_only && is_capture_only)
 		*capture_only = is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
-- 
2.34.1

