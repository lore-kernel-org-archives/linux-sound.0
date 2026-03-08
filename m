Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68B1531C1;
	Sun,  8 Mar 2026 04:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772944942; cv=fail; b=p8y2S/JOzCBPSDR2Z4bSQOsZxKm0lNOjLoML8F/TpKqN8AFcWvFiWPH7fkBvb83OjJp5hELYsVNV1jjR6QACLPGyTwtYOCrv8mf0Ys2tknVawTS//mwjTRHKfmQ3QzD62NYoPtnmqEcnCNuvP5DfWjg68xwi6BQ0kKXeb+DHwM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772944942; c=relaxed/simple;
	bh=JkaRXXZSD5YgVcsqoV/Vkp6AaNjGpCWs6S3aOk7S51E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I5bRbO4tQwyPSEZq53EjT+ELt37s4MkhdfqnWZPSSAl+olasfa5xCwkHupq18aLzP+jMXj5xdbWw/k4iJy3KlCg8PQxFVF5XkpgwuSw3qLATLnxuYRic8hHZWpv9VaiymPMdqQKWF+Me32RGyBd9mb+7bM7ctsoo3u3H3BELZ3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XRsh5AqS; arc=fail smtp.client-ip=40.93.196.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XRsh5AqS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL14XC5PHDpYBTVbH7Of8nyBJXdS9GIm8uaO4NRpGt6wSXI99apEWy0aSPhrDWMYw9f0L3mFAop9yNdJqMLiI8nslUAj33PZO5X56vbudlaKA8tFhbjHD5qk9FHWiG9VY/SzaKgZ8CwrrPWZC4c2R/WgwCuOPQtK3pFsDkMM7uCc06gV2ijZNZNGQsokqj5ovLtAPTX0aJgJASD+EsxHjqkdaLon9cNo0PquWDcJkTy9zD04dJFK57Ox+zl4lgLGOpGN+n+aPqJD9uQA5bWqT3n2EIoO5Ilnn0VCRjjEGsQ2BbUsIUk+GGZ2+GTigaEKdjJj966IONhbgRwvr+D4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4O/nDxAOhT7NPfq+liK8iPE96Fqxf2XrruXCCcb9vg=;
 b=oiEpnKX3BXCGJdAgnEKZOnf18Ap1n+b/c8hZlwx61TTTjMMzn2OrA2Smh5+2TJpbcfNsFWTokJE+oB7L1k8ovkR6WrJ1nueLPBz2U/rMTeCOxH0ByIm51CPDQpuZUEt9yZw864Z5f8pKCeToj0Arn7Pl3eRhvrQKMufYfxxAW2Sjve15zDz/p7xiNSXCs0gAbf66Qz8ue714oDzBnTEsUbLz1nZ0YMoHp08bWdLt3a3NGHhhf8MtL++fox3BW0fEgC72x0Ucm2IDXG75mxv7lKqOAfBuGubucNwwVTk9WLduT8+M4EWinspEFAnFkT64z315IPQ1BgeHJoo6wS23uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4O/nDxAOhT7NPfq+liK8iPE96Fqxf2XrruXCCcb9vg=;
 b=XRsh5AqSwd4Y4mZ4N1+VYQ69uPTIx2tiiYySdetRRyrEdOCWIMZXeoelNMSKvCt8E33UGx6bNfRLT7yLNULtOG4MsQEY0R0VLNHrUxA1GJTpdliiI0DFbryFqslVAR9xk0I91ZWfmG7GsQTulPX9aF7hjTH8DY5yMx2I9TKhEns=
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by IA1PR10MB7516.namprd10.prod.outlook.com (2603:10b6:208:44f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 04:42:17 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::c2) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Sun,
 8 Mar 2026 04:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Sun, 8 Mar 2026 04:42:17 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 7 Mar
 2026 22:42:17 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 7 Mar
 2026 22:42:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 7 Mar 2026 22:42:16 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6284gGje2920028;
	Sat, 7 Mar 2026 22:42:16 -0600
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<devarsht@ti.com>, <v-singh1@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH] ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
Date: Sat, 7 Mar 2026 22:41:30 -0600
Message-ID: <20260308044130.1991091-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA1PR10MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ed8b57-f241-411a-6716-08de7ccd13c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info:
	TsHNGHnjXPi7Rpm0ik76RTBda0pE8aNWFnnSMpjUQqdmgfdcpvdvEUhmv0ETmwOahyETrApP2U1uso3CG+jcjBhzvsfp6q2K2TWqw7x2pFqTRJ8lRL4UT/C5biiTCPpmLGYRGfKOEU3DfvkymW2yDzyJz7HaoNwf9Qf/kfGsF2bEOMoxaq5fjgEBkj3bTKfxDs5iFP0JVdkrj5a7Qfh36OtfoiY8i9ORmwYXncpCtqhsSOWWCljYh+DTd8+o7zR5aJPGG7Vnt73Yt41uCHShrP/pbHg0UmFuVbis0/mfh6RKDBxKb1BKELLayVYdHuDhMNCGJvGnuK1z0m8nQdDg5qAuHeKS6lX320VZoLZ8iIKR/bpz0ySR8gx7bWRS1VevHvFMWNwjSyllbLAtuXgSbzgoInXOAFo1kqSFyJwkegjrsARUOc69MTZ9T/UhFPi2kH1ij37R8Qw23z77PK3GNhz3IkE6cNuoFx7HvacwaqGmXSm21kGXt6xHHdPQ6SeSkj+aTxL0clAZQ4QGf+jhdHXO8MOdtTwvQXNPx+EPwCO9iJlFj/F8UiyE7oO9kdOXYAztNs58zEjWZTvA2orLUDAejZZGnHOqutVmqePeJ0osR9RQCMtnqvLhn0z2AgklYHV334OTHGytKLQFJ9PlcyBqKxq8sWhyaW8E6zX9y7KnKibyjbe2zoujqC95VGM+ep+HyDwHQ/NMWHzOUElTU+MJ5PrP7oiXVhLIEfHrgjGXTFk1ZfbiUDFQSz6uw/v9T03yYkMViKseHO5XuBy1NA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fh3kmaHh2ptfwqZYazP+EUjXo4kXgty+NZgmNes672HHIkN9rrN9CORILumVHxNEvW1vRbKj+5ANcjWzkdTueoes2GR9E6pnQpA0DQG9iUyTeO7P6/I36VOyfcwlg5XjdmDtHJUgweD1vsDuubnU5qB5UlQ5klTfotCRgza/LDmiuhCUV1zPd64SmGDdsJbtwdC7HFjcEbmuTbiqJ/lIvF4z6b8sFuabyk57/lw7cbaxsWPxcG+MFo343nv8xeO29uG9C92kg7l6CS1EKErDygWqF0ADPh+Ad0aycq4fuNk+kZTklQEp4ZQJNI9QmAQZ5gnlI4nVj69ls45lFSxxmtl1VabIBLUCpJFTOThnsBlaWCmVqrkDAG4fI8QC3vsdfaIGQHlXlcm+9yRRngiKOUjuNenomY01r4dDmEFiQg2nti6Plos2/VBCEP8wEHVw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 04:42:17.3864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ed8b57-f241-411a-6716-08de7ccd13c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7516

graph_util_is_ports0() identifies DPCM front-end (ports@0) vs back-end
(ports@1) by calling of_get_child_by_name() to find the first "ports"
child and comparing pointers. This relies on child iteration order
matching DTS source order.

But when the DPCM topology comes from a DT overlay, __of_attach_node()
inserts new children at the head of the sibling list, reversing the
order. of_get_child_by_name() then returns ports@N instead of ports@0,
causing all front-end links to be classified as back-ends in
audio-graph-card2. The card subsequently breaks and registers with no
PCM devices.

Therefore fix this by string matching the unit address in the node name,
instead of relying on sibling order.

To mimic the original behavior, the function will match against "ports"
or "ports@0".

Fixes: 92939252458f ("ASoC: simple-card-utils: add asoc_graph_is_ports0()")
Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/generic/simple-card-utils.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..8e0efc78b490 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1038,11 +1038,12 @@ int graph_util_is_ports0(struct device_node *np)
 	else
 		port = np;
 
-	struct device_node *ports  __free(device_node) = of_get_parent(port);
-	struct device_node *top    __free(device_node) = of_get_parent(ports);
-	struct device_node *ports0 __free(device_node) = of_get_child_by_name(top, "ports");
+	struct device_node *ports __free(device_node) = of_get_parent(port);
 
-	return ports0 == ports;
+	const char *at = strchr(kbasename(ports->full_name), '@');
+
+	/* match "ports" or "ports@0" by unit address in node name */
+	return !at || !strcmp(at, "@0");
 }
 EXPORT_SYMBOL_GPL(graph_util_is_ports0);
 
-- 
2.43.0

