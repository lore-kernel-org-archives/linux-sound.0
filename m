Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38573CEB93;
	Wed,  1 Apr 2026 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082784; cv=fail; b=STHMge9A1Te2xiAjC8xFHvsx3KVrJec+p+I6qvlfCu1QvfWHQdWadNIKxFeYOHuklVgAqgFwkhNd3gleCPDCk8FXS0ALRoeB02p/+/L+ziyBLzehm+5YgKatUYm6sVltB9Wgb5G2shAxUTg95zs81fvnIxsbfD0OJW8EGGi/OCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082784; c=relaxed/simple;
	bh=rc7WOsvlMTx/Xz4R+vH9nwj1BrfsJ9tT4FSLHmpHY5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbN5ozJSPFAhPny4qFiiMfZ1Jzw3DMzPKGDtMIVdpEIWslFNDWCAHv1Rvn54Hc7YNUvWYdfvJEtfxC67wK6r3rAmr+gEURhUi/OpJsZmHaK48jtg8vxAH9QFdd6syAAr7kxDscn7X/kNaK8yNZ1EEB2fgZ6lZC1h+Hl7xodlxv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FO0ZrJVW; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FO0ZrJVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRwL7pYDeHjPHImX/vpinslZYaLIbIQyUz9SS4B7iZi6hMdz7Bg2rFuErTGB13P1uPmxfi2dvsBL5j172fI70w4SGQ5n4g5fj1gkOkKSykokuy8MXvtYlzF0yhAN6ScWXHnGywloG7uL9UeTIasvDrBqNVdrkNrHTytwYEeMrihCOca1nmwnLsH0a86LXfBoWTYhCfMiAvceZOLN3veeqa1m8nk1w/t3jPbtO17AKCYOjFkMxKj8eiVrczd6i/w10+bMT0iYMDlclObK6i/2OdL4h2mSM6oQWS0hjT3xUyVxxKYcEJFP+Kw1AHuQ97YYwiS7b/7B7+0sVfRZqSuxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7G4Bq7eGoPEmFv6nBU5TZN96ky7FW5IWX8m0IhRXDOQ=;
 b=Bjo3+YQuEwdqgq1BUWpubDwjCcCGqa5ltmNi25qC7Y98WsPwVF0wykl5Hv2DRtFoZ5cL/sWa3aVJAuWq3iOLlTnrHNPtFv1LS8oUsrPsDQm4adzNQXqYcj+DNhtkJtHLFscMTkzxQunnRM8UUYtDCBh05/FkhQ7cctUbAJBPcV0hVpIUcjNIQFiUbYzGTmbFt//TZ30vEySAd0p/s0bZPsmGT1sjdLkQCIzN18fUnqd5WvOJZF+xxawJuOyTu6xQIrkWiCPFElzyOK4cBZ3EupuM+AgoX7hI0BtUeXQBjpYt7Baa3YNilTe1x8cfCfQarPH8bzoYqHNUWTKiD257uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7G4Bq7eGoPEmFv6nBU5TZN96ky7FW5IWX8m0IhRXDOQ=;
 b=FO0ZrJVWg0bZ4EZlyRQKA4qDQmLxZzwB2Ftgc2gYESrK4yqOJSDJ0J9C+XeYoBNFVkQDQlvVmDzn7q4lM3bJsS2LhgEvcdk3ghhii+F/FhgPpp0IJxsa/AuvUbBodIzCWk8wI/LXqTJQ0aE+u1X/dkocmwg8RSTAOqONfIAhU18=
Received: from CH0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:610:b2::8)
 by IA1PR10MB6736.namprd10.prod.outlook.com (2603:10b6:208:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:32:54 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::57) by CH0PR13CA0033.outlook.office365.com
 (2603:10b6:610:b2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via Frontend Transport; Wed,
 1 Apr 2026 22:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 1 Apr 2026 22:32:53 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:52 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 17:32:52 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631MWqTb887172;
	Wed, 1 Apr 2026 17:32:52 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add entry for TAS675x audio amplifier
Date: Wed, 1 Apr 2026 17:28:45 -0500
Message-ID: <20260401223239.1638881-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401223239.1638881-1-sen@ti.com>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA1PR10MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 9298f095-9c09-4d0f-7433-08de903e9d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kSdrNzbdqPRfzOSRTJlhG3ZERrIIsceRB8zA11UI+IWz8ncpebsKlqARU0QGWP740I3F70SmyCwBsLS0p/6jVZTSyOHvS4BnSXmB1xh5BjUsfYHLahqZPr6tkKjdLw9XVddOQk+f5QKzKCEGFlQdmTvVcFctKIqJH3+cPNV55hgSPOQBje06WKym0gsR06OVOUarmefcvbk73OFY9iK/4fLkNiegnwR8eQBkI4IG9QUoVgrbcStpEqB6IaraToFw83VN9B0X4VjEnqSXpYjGqcUAJEg7hI1I8sCChmj7G8ZTXAMpQ8/QPjDODp9+wc5kikuLZZ6Ut4kVTcDeLrt+we9POQYxp42C/n9bDaFd4oCykAdMzfEnQao+POxnnj/W2FTmlSGUfgolsk44HRrGnlVJGQo7xyDrcboYbaNGSPYmpHi5SwX5WNvk8wsvDU6CZlbJhS5gfm5e6RKk5OD1NeBB6afy1XlMTq+Pfyzv2Q447pFvtC0GJ6758MokNehkJ5jU5SOz105BvlJ6mfJsgWPLektqQIvF8ciGP8M65o5AQdiQGXgxRIj7WRhpZlXq7ad1P84UBhCSFV5deW0sg5CBXjnxX+nxFgkxkUGfhGKTHaIklsF4QX98QxFNrZi+4u5zw4MyRcfrFq6kSg4AerzqyyzSSL2kfXCT0h26vxgKX+4+dsWGYm3kIBg7PadMEXL3OVdHvwG12n1kiqZ/zjuPcjLMwy5HQJkct3jGflBsLmZCmzJi0+2e3oHhZHYWfDNESzgRHFvoYT7lDevKqg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oCG4jYW1dFuGq4Jtn/q1EWPXPkkq+8ZoQPsUs/OkA7Ki2sUIcClCxONDCiVGFhRHuYt/qE7kb4ZrG6o4Gg+KtEwnY/32F033R/Y2EFqlN13EZzezpPoBFNWfNlZidRsn75ObISOKIjl/MUy42ji22B7gdz9gUrl3S33FuMI/e4rtg+fJq4CiV6YNpRjg4xc+clgHKHv/ojXFcDZyDFCtqWPoLIjX5MHabu+PRWPtATRRuuj8UJbWszq52RvIEu6OUh7rf9RvdF2j14LFNm6KiTHqNzhYeXB6Wd1WGfQx8oevuTGEBnjouH6EvixuDl9aXX2vfZa0Ur0Y/hKqHk50VlToeNAR63BPANXadKdvKJjyF11ots/CBVoV2/rz0xYAcePFIsW1UQ6rUkL88f008zCq2err9lr4hh8mqs8m/5NF3Hw7YcE7sifQSmi2vm5b
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:32:53.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9298f095-9c09-4d0f-7433-08de903e9d97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6736

Add Sen Wang as maintainer and register file patterns for the newly
added TAS675x quad-channel amplifier driver.

Signed-off-by: Sen Wang <sen@ti.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a626dee5c106..ea61bb439652 100644
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
+F:	Documentation/devicetree/bindings/sound/ti,tas675x.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
+F:	Documentation/sound/codecs/tas675*
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -26215,6 +26218,7 @@ F:	sound/soc/codecs/pcm3168a*.*
 F:	sound/soc/codecs/pcm5102a.c
 F:	sound/soc/codecs/pcm512x*.*
 F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tas675*.*
 F:	sound/soc/codecs/tlv320*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
-- 
2.43.0

