Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B5F35AC2B;
	Wed,  8 Apr 2026 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626322; cv=fail; b=bsssY87jK5ZzNAjohIJ33bXixYbaWDn8BGcl4JwgDDZLI2DxbL/zu0EW6KYxEvDQ7nLGknXiR0sBYa14hAEaFNBt+ImkR9NfnPdOHol9X1Mq5uGPGN1VXrW44DxVErFd2vG2ScypGAbAz2F6qhTxJAxmrV5XVS0P3Gzz+FSyadw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626322; c=relaxed/simple;
	bh=SVN8RK6t5iCrczHTqjkg0f73rjkmsVj4yCPx2wZLCDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UncWRVsy7WLWJy6pHXy+gTRbwm8841Tvbu/4O9XJ48bIpDQHUR4ByVxpnykhlEVID9/ypQZZXliA+tKYzMdlvLxq/4IMvvI2cjg18ckTFS2e8Gn61YZ/4ZmyNdrKEh+tALijhwoTBAk83pR2FC/pt1XB1bh7EZsFMkAijx7TMm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CzQgX19w; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CzQgX19w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsfBsjeNQM6yo1HNaza2BBNEGrvHswywQ+PHgtCclAKqMwTsukA6oyB1vGygKB8Qbat8moApcEIrBAWlWHjYB0HxBr4MtRmjDzuiRRi2k+n1imIJqWiE9HZ5uMxcDnm56mcQJAellJYjtoDE9M+K6fGVOhneJ6uY/Tp2ho50x0sakNGcn2xFZ0448EbyPmok0ORojzCpnw1p6Gv3qnTgj4h+FS0DVyy/FM4q1oz1grVJTfXdANUfAjFD9/tG+Wa3Zr7UizHqNgag1nOpj2rMAvDb8u0DdBsjiHuozxNTcr1wtvTj1De1EYVGeIWZuodKfCRJrVpFJfeNsUENbHjEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fILuxeyIumz5Vd6OzcJl2nKcEwZuotrnTRDBBoqNeNo=;
 b=yYX2iCfmQCm0zqGkrQQ7pYl/My2sgDgkpvgWWy/URE6IQtcmLjF1bR40H96Chh4Zn8eDYMIVuXwCdLch/VTGmgIchzmRvdKyR8f1V+6h46dl3c7vd1xIq7HfGZrQ7pC1MZtSJ1on1h44UuPINQVPql1/YeaWJD5UDraJFzrktJf7DdTeceopLWCw1H9NPDbp55WWNV3kpj6Kcm+sVUoVOakCOYG2+fYLiRC3T1AtWX7v8qSXFcMjXPDRqBzNYF2qsXPo3IgDKprx2ADcLBVlJz0JBB+7kHTNzSgwP7KYpCMFY197bLbeNqluMidlDaCdrN0JLtEAwtz1xUC7eUFocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fILuxeyIumz5Vd6OzcJl2nKcEwZuotrnTRDBBoqNeNo=;
 b=CzQgX19wmIJF+YVPxR23fxkM3WiYvCw5jJAmSNUXUb+dU8gfH+gx2rDdI23On9rMYWaKohFezqcnlKAfNz8178Jrsu3tHb3HI9ybKbgbrTotRjzqAihjzZzBZhwr8ykCEEQ5DtQ9T5pQVCBkgomLQrS5JAkuMSWBsrX3z8/Dhjc=
Received: from SN6PR04CA0101.namprd04.prod.outlook.com (2603:10b6:805:f2::42)
 by PH8PR10MB6503.namprd10.prod.outlook.com (2603:10b6:510:229::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 05:31:58 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::8b) by SN6PR04CA0101.outlook.office365.com
 (2603:10b6:805:f2::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 05:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 05:31:57 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:57 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 00:31:56 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6385VuOL162470;
	Wed, 8 Apr 2026 00:31:56 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for TAS67524 audio amplifier
Date: Wed, 8 Apr 2026 00:31:48 -0500
Message-ID: <20260408053149.1369350-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408053149.1369350-1-sen@ti.com>
References: <20260408053149.1369350-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|PH8PR10MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6447e0-c50a-4ea9-2a67-08de953026d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QHMTPdOqUmhE8SLVoGqZgbGLfoeJwB2Meur8tadZNOLGzgII1Xkd8YLSI9JKHhEAoRwOpX16iufv8AXmB4sHSK2kgclnHelLh1MWVLanM1k7MyNgE048qxRIyAV1TAiqkk2fPK/EzJzE0tQhvJ4eBAktJZ7i/+PilbbIJS6JTAhUIqvKJ7O9dpl4Gmf8K0UdYvN6vp85AskLFju8yxU9HTCjEKnbfxBww+Tloir0XmFWHtKKD6SL1dYEq77P8RJg1HC4IguXRUYuRe3ymZOZSFN9ywL8EqRIu2IpiDU9o+TqwhleVIMWJs0lT5QR9PkjkCOsAf3kH14E6n49bA3sgf8vZcr6FV6AAbwr0VSKEgoNTXkGPRk9tybq+ds7oUiWIjWoqegq0SVEQkAf37VbNk++DTu3FvNXQQzME0JKoa6QqcT1DNavR6Jo4yip81vXRViqZAoqLj2zUw89r04EMNCfvpxyJFQRJAl/QQJgheaqQufkn7NqBwAKMQM3AKIDeanA8I9e1ll/Td0EdcqAVwrIsi052vMso9l2B+pzy0lu5rp1T0yZEwGyr/9NMaWgGQSnG6SllTZV21yGJBAZtlVoWnuFU/lQnTtVeKfFvnkA0+KSLYg/EbPBFbhFcN3reAUgjwqIFqX2lJB2aPnFPrH5SiEv+LTgaeRg+1BBVKCIxM3ZOWVPog9O/mKI8E2qJI8/beye/vxay578j66SUyETkEpUIydf/xvk6YhS4vgSpsa5qwvuopiijGuVLWJjtqE8dKu8aFuOtB1sXm+IZA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j/sdPxFJwCPAqXej8VJYehFR00KAAbv/7gU+T99AEGGUoNnAn3wHkhFThNzSm1GpW4cJZEEgauloR6q2KiMVfwAEDhIHvrwpE0VI0BzlLjcotuu81AGKjRSii10ubZJkO0Lgk0azIlvKJ/B5/zU1T08Ipb+DTTp2Sbq7xrk1e5mSnUvVP7W8eOlc2gl4ymGQowV95XtmpkBNMH4Bkiy9yZj+uvCV2VLPJdDo/ZQAf8KgR9r/T+I2zLngb9NRjU0eTYx1/bu0Sfwp+GQOryQIHw9fWCk0OM/nLwthi7niAQaX+i6slSLBfWEUl2Fj1LYmLDDNtekCPb8J3A7nmPTXmIvaFncbZMuI/ReQPyca5w40ATyUtD4FLHPKKgtGzqpWqAuq9EMF2Ci+HjzPebB64uRT/TDV+os2u55CeFe+6y3qvZ4QgWuYpmqhwIKx5puq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:31:57.5208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6447e0-c50a-4ea9-2a67-08de953026d8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6503

Add Sen Wang as maintainer and register file patterns for the newly
added TAS67524 amplifier driver.

Signed-off-by: Sen Wang <sen@ti.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a626dee5c106..a78b6cb9b907 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26191,17 +26191,20 @@ TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
 M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
+M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
+F:	Documentation/sound/codecs/tas675x*
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -26215,6 +26218,7 @@ F:	sound/soc/codecs/pcm3168a*.*
 F:	sound/soc/codecs/pcm5102a.c
 F:	sound/soc/codecs/pcm512x*.*
 F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tas675x*.*
 F:	sound/soc/codecs/tlv320*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
-- 
2.43.0

