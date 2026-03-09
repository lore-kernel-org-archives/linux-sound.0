Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C763271A71;
	Mon,  9 Mar 2026 04:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773030107; cv=fail; b=sW/XhOncfz/VokX1OzvgxW6tb+7gZG4VBkPb3jFhB5cIbb00DpFLaTgoRQIvzqgFWul3YWHJtV60xY6tzgFZRmuEPDFWEqNImFfPP579lCfqtsDi9JjN3E/G3pRjzJvk+EAqOMvBKU5TBYuq4l+wWvIemFB6cAoNrcilnIZkBrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773030107; c=relaxed/simple;
	bh=XW6U+oVkcL9OIX7Tnj+VnYyAE+vT4I2sexAY0IN7oPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bFo8S+5R8XpI/i3TaqLkFpq+V0wLpvEk6ItExIAPEPpV7NK1kZRH06TAXNQF6vfzMEG151fgozw6nBnclkpAew3wCaVNesnTS6q2Nl3vQJd0bmj6qYLzlitBr4Cj8u1szSj88ND7exI1zvAbEYAsDmPZ/NhJL8qNJNzEMFbWj+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QKsU8CvW; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QKsU8CvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekTJjoRJAGm2PYdmhBk/mP5/BbU9+Yv7wuDwjSlS6ei9nh42PB4VtMt9f5pEuON55NKnxJkT0ZDcqfBrb3I4/n7ef+WVhqwtTUWjAbmRwAdMdJ68yNr1lW/GWVkd3N+D8lf6s5Y2gs2MHTObuAPat8Kj/wW7rXXuEMJiRJoylvzbonLbqoXHTguUHHgZfYVk02lbsJiJZjNE92T9yfeWCNEu2D+idjjZIV7ZxbH1lXBLmf8TJIokZzDf3joEBRnaR1L1iOup+nQp4zB6kDdVdWc1wLkFEgNDsATpsRTXoujqrYjFUDpJm0aLSF8qOhaSmJTZ2WvyyGFfS4QJVJR1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBfq+FNv2O7WMd35ZS1fY/XlY/8ixZcvmtnzFhmc9qg=;
 b=hvuPdEdZKscm1j2I/LCXbWbU7iFopvoqoH3Q4dmm4AcbCgyduteWNYFz+nnhfdBPlLUPRCIQq5Bo9dU5578H0md9CgvqXM4TLwxNiLMNZNoh8KaIPYjRAJ9QByTKjIvNgCTFUYjoXs+oJ5DAG6VGyxpo28GE9YI67uCDKbrVh7lW7LN2rXNhiMIRGCcs6RgqxERbsPXBOKezzDRexd7Pf7XnuO6qw8Rhr+LRrTyTncKKJDGxDWivAiSmnAWiMS/q25TLdtv4is7zcnCwJ1e5P9ReVNWvPMSBXPmgR6vJAl6cR5SxbL0SrgAbT8PzqhvmQCdg1Y5O0CmX3WtLsz3E/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBfq+FNv2O7WMd35ZS1fY/XlY/8ixZcvmtnzFhmc9qg=;
 b=QKsU8CvWnosIF2vxXXS2cPq/A7QpzvwatK+WaDlD6GBpNADbGKqbpnQeOCkElX0jLr9q7pw4OicF5kA6ZiUpL8/hbl8kQlyzhiPK6B+i0atvBXVMaD02g2tYBEDFi26seYCD5QlJMBybWKYM7z9nA1WNRhsifiICuEx1ZbM4NgI=
Received: from SJ0PR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:334::19)
 by MW4PR10MB6656.namprd10.prod.outlook.com (2603:10b6:303:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 04:21:42 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::c7) by SJ0PR05CA0104.outlook.office365.com
 (2603:10b6:a03:334::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 04:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 04:21:40 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:21:16 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:21:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 23:21:15 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6294LFQG370125;
	Sun, 8 Mar 2026 23:21:15 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<devarsht@ti.com>, <v-singh1@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2] ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
Date: Sun, 8 Mar 2026 23:21:09 -0500
Message-ID: <20260309042109.2576612-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|MW4PR10MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b416a2-4e0a-49ae-0394-08de7d935cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	ESZYTRB7hTDexSVS9+ugUOVpkO+5qeAXBC0IJXaIzTfXeGtxmAIRLUIL+2mQPdA6wBeKH63jKTZLEX+ZkiLnOhF0eyDdD7y35AR33+ti4t/Hu5t2Ru7/mWCBvqCdM6i87gIlP+7bSR/tmKyeRZsZYlYX+Wu1KDxW+GExlTOb7ppwGBFeXkOJvBnWn2fd0Z+LH+zFo1OOdKpCpYpLYLM64yB2wWDcg1cjKai/b96FZnXp9/NXcBiynBltXWMRXVVyCF/YOQlBV6dx0FlJdLpBVCEeACyPezNlAu2EFZvyXHdTLbww/1aWFyUZeP0GMSYsfiKeWM34KyUcz34Mx+OQbD7nKI4SIXzIMgvIgI65Yf38Kz2Kpq7oDebbHy9kB/e/lR2D1t/z5EODVhFRFIbFBc3a0itF/ewPwmBb1fmU4AJvoMh+rQU8UTaMGi+jz8k2DmBK3SLRelHpHlT7nD/l8nhAMm3Q7sjUGNi1vC8v2ssNwaR4hb+mnExCqivepoTu92BoXg49oI+PAups2EpOJoj19Yzl1lwdv1AC83NX2zeRuLR4+zBbT9WBqDVXZClZ11fRSL/BWmT+R1uLHkrta0a+OwpaCQH+YPzleydfWZ9in8nCHUjQbRNaDj53cecgIPOvEyhN28ikpVmPqHOrdtby6nrvBj2oyfm7zOhW0iThgu/xhWAQ4SHQLaYDO497kyAZYVPZazWIw9pax0nF3Dim1vx8340DqnojhrOiyL8tF7wRtYbcHf8NRRITrD2VP3+sia+VkZ92E2b31/PIvQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x5Jhr0VbmKIWNPAy5yzPmZudbbuusDz0vAiQIeqUqsxS/SzNWSZYKgO1N4H7V3ePIyrgTWNzOxf9QbDvTKMxLZMCwMZUhi0AGOJviBoM83jCfV07oVBcIK6DgCphXmal7nZpq9+y7afrxgm29vF2q8YtctoHGwrbeMsg59ZBpxuOVaSxuEMR+wuV3FUHZrpIyxN7mtA2mpK3mT46UzsceHdFmMXl33xLXod9t7pEhSD34BuSWNsnCcrhkfu8ueJakij9LgARQWVHNV/vsLYlWsk45vCdaJGrUWV2l9nneKWJSN4odcaGIX51RB4ljw1VSleAx+Ex5C7JkS4SEfuRORCrFtWQ+cCHV5xhosg/vN4rfyi8CQ1NVpjToJLEAmz66lkwO6S1ieW7MsUyD5rEpCU8obRezh0mO0/StYAA4+ElHG2Cm3uY505UWGhjdeTh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:21:40.4335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b416a2-4e0a-49ae-0394-08de7d935cea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6656

graph_util_is_ports0() identifies DPCM front-end (ports@0) vs back-end
(ports@1) by calling of_get_child_by_name() to find the first "ports"
child and comparing pointers. This relies on child iteration order
matching DTS source order.

When the DPCM topology comes from a DT overlay, __of_attach_node()
inserts new children at the head of the sibling list, reversing the
order. of_get_child_by_name() then returns ports@1 instead of ports@0,
causing all front-end links to be classified as back-ends. The card
registers with no PCM devices.

Fix this by matching the unit address directly from the node name
instead of relying on sibling order.

Fixes: 92939252458f ("ASoC: simple-card-utils: add asoc_graph_is_ports0()")
Signed-off-by: Sen Wang <sen@ti.com>
---
Changes in v2:
 - Updated code comment with rationale for string matching approach

 sound/soc/generic/simple-card-utils.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..9e5be0eaa77f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1038,11 +1038,15 @@ int graph_util_is_ports0(struct device_node *np)
 	else
 		port = np;
 
-	struct device_node *ports  __free(device_node) = of_get_parent(port);
-	struct device_node *top    __free(device_node) = of_get_parent(ports);
-	struct device_node *ports0 __free(device_node) = of_get_child_by_name(top, "ports");
+	struct device_node *ports __free(device_node) = of_get_parent(port);
+	const char *at = strchr(kbasename(ports->full_name), '@');
 
-	return ports0 == ports;
+	/*
+	 * Since child iteration order may differ
+	 * between a base DT and DT overlays,
+	 * string match "ports" or "ports@0" in the node name instead.
+	 */
+	return !at || !strcmp(at, "@0");
 }
 EXPORT_SYMBOL_GPL(graph_util_is_ports0);
 
-- 
2.43.0

