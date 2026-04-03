Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D7733D6E6;
	Fri,  3 Apr 2026 05:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775192806; cv=fail; b=Rgispet3OnvEUGzoYjNkq4VyWN/kqYyxFgDoB+wNGrKOvQcjiJOQ39xtq1g1F8lql7mQDNesI+/9GZL4PVSS17Kv/7Xwm7RznMhisnRNxDqchwAKCVlw7bEqZIObQ9kCVfBaB+MB4l//Ph8IjuK32W3NTkJcmwGY2GP7oGmJqKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775192806; c=relaxed/simple;
	bh=k6f6C4PwiKhydJLuvWS5urR98GMz3omtS1ldKJdkwj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFCo0H/XaoEgH7ucCYxRFvGH1Qos3CwF5isKckmybknTJd7r5CflanR6n/OoYwXU5AfBket52vfSWi2MNoFW4RGX2P+hnI8Xvg3qiB2pmFs1wL0FHl9EcySxOPOury1UDKKBrjUdwOo4GDYbgSR+lLSDGsJYPu33QOK0f/o+jig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=scr68zkk; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="scr68zkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InW6NEKKQUjWq6AYVngLx+S8DdaYAtAlS6nn3LzNzLMkANdiCGqtLf/AvoDnNj0XceTXwU33MFyz2mxBkBo/1d0/7R8sVVugiA6Xm6avwgAc0qvPbM31cuNPzCXtAwcEMM7Ogoc1oFLIuDrylW+d+Wqgi19nkyM2Gtfy7aEijNQLq5ziP6obAUBnoT5utUNJbTWE+tBp5xO/cjx5qFiHnBbThzYHEBB/exHOXAmpQbPsQp+NoQzop1+AZsUQQg2qcEcxWMvo8WTDw6QgMRGVjaI3iWt7R7B8N5xn3WlxRq14VyjP4i0tViQdxg3IZWYQeW9rW49Floxq8LHWXHUCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68sTp0pmJScAfC1ekPFmFATa23XIhvz4+aJl4lMGuQU=;
 b=XpdiJL02k2jYrLKLg5CNKPYoVY791RPrCQfheLyhPlnggtsD9+AQSe4Zm0xc1GwvWt0Qz9wmM0qnB/M0JQxkNiCKAqKG7asttAmBImYOYpLblE79CjQcOOMHGJTU6Wqte1HluDHzl9z2Mmn9Hd1hpli4keyOQBR2jmaRf1QPV1+J/wD7SoUAiO0ta3EjWtd863LHLS8UyWyvyCfUrVLrc2HW/+S/B9SAgTBMgxDuVyrIiEfKzfrt3ki4lT5pFwdkcat+NtQwWqVFKqoFplV6TT9ntg4Gmw5lRXr3KmGXHqU7GGmf245MJ8L8voYfiuIPmSCdJqCqNbkMZg8uQWO0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68sTp0pmJScAfC1ekPFmFATa23XIhvz4+aJl4lMGuQU=;
 b=scr68zkk9m2C0wWmuxodNHMRgwbheGuE8U+6AsuAqOXu6/P1C3CfVW1YlaOAKlt9KuoEllKTMIA1k9AahvHc1Te0V197OPOYyLr+Opu6dTdZs6cUeoJvxIBOX/y7ibqwe2PXQpOgELB3RDa5+mKI8UX0Z/+I56ir8bylbZ40RJ8=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by SA6PR10MB8109.namprd10.prod.outlook.com (2603:10b6:806:436::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 05:06:43 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::59) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Fri,
 3 Apr 2026 05:06:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 05:06:42 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:42 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Apr 2026 00:06:42 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63356gCj3389804;
	Fri, 3 Apr 2026 00:06:42 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for TAS67524 audio amplifier
Date: Fri, 3 Apr 2026 00:06:22 -0500
Message-ID: <20260403050627.635591-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403050627.635591-1-sen@ti.com>
References: <20260403050627.635591-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|SA6PR10MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b715ac2-60d1-405d-4216-08de913ecc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wc/Q43T0RRbmV7dA43/Ql2JYXYnEhLp3xUnIwGgfbnhZ0DUz7K2Gg0mERrYUUxQFLvk/4qLsJ3HD+6b/i6WWbFQliQ92/3ttFaTrldwb1MR2YELptPRo4hCB5Wep/5iX0laXdopTRRVCDaQ1M+vTn5y2h1/sPrtb2TTNaegqA+yxgqGzG0LHBt1zDlSjFtUuOJGTnM9Mpaqqk3i3cMrrNEG2j4BicWY06yBfB/WKcXmO1b5CbFJVsBsIyn8go+PJKXmbEDXbYjf+jCURyFvcGFykxk+ryVpnsAzm/YWh+bg0fvYaphtHyRhOsqk+PO9zCldltOcdVDIH7sZs9kjRILaFpd9eeyZYjizPXxnIJUTCoPfGpRQeC3D3A5nclFa9r0AjgCb0hJGyRU9RYHU7E8S9BtpCIGeaHhtLTymP9hbUVS90C49zzMYJUe3xmUahF1o8FUJfuMilFXYaIfSNRdJ8isBg4J9vNn++ECVAdr8Sh3MUL+s653xcgzfxPwiy38whQjhgX1BkLoS2puLl8BziGubCiWBNX9hlzlWjTQ2/wq4YD5/FQt5k12njNPR3FUer7U2U7FmnfChwmpL5csbZV2HM28xKAxuAqmFAkO4ohEhjOUwrZC5xAl/BnLTILcFbvJxBiLC8Lus0GXESeTmAmZ7L4RxGTWSZAGb60g22EFv2S1pw/exQr+wVH5n2JOSu/KM1Jri3syb7h7jPI7cjKRwccxFC8sCYGNT+fncxJsLi/vl0jfLtW+3EK1m/txDGAzOH2LZVUy/Smkp7hQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qPMpvC38+dOJm11OAZanxBLhtmdTxXH8LzUCnQEi24FhlXuVpGXZhcvkSfRhoDmmZkyw0ffg78PhCo1c2x9ix3XX26f5qLeNnhIIxeGJDy8cHNiQA3grS9tW2f04ZdOQZkCChFymiFtpgd1JFF96QWych61fmWpzfV/+o+28wMwXyThDOzeXHVNf4hOrGBfETfPg01z8Qc1ebnM5MnBbdBFbqZx+gEzJORQPWMvty85rzoAiVhi/Z1wjNZH1qnDzqUmdlboaSAXW7h9a30K51ryKg9oJYRmzrgipH0/3P3E8kn9XuapV0Kf6azkgZmT7gi4CH0rPfOAELeOno/gWcbu54w6RKOaQJHl4uapdZvMFPJc6zIOixDdnpjISvOQOip8jCymjU1OEeHgfxn8hTmPmSLzglpfmCzOncQTKsrhtOAZrdbpyiTtli+dJF73s
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:06:42.9329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b715ac2-60d1-405d-4216-08de913ecc0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8109

Add Sen Wang as maintainer and register file patterns for the newly
added TAS67524 amplifier driver.

Signed-off-by: Sen Wang <sen@ti.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a626dee5c106..a3bf005e38b1 100644
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
+F:	Documentation/sound/codecs/tas67524*
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -26215,6 +26218,7 @@ F:	sound/soc/codecs/pcm3168a*.*
 F:	sound/soc/codecs/pcm5102a.c
 F:	sound/soc/codecs/pcm512x*.*
 F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tas67524*.*
 F:	sound/soc/codecs/tlv320*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
-- 
2.43.0

