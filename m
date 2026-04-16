Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872353A0E88;
	Thu, 16 Apr 2026 23:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382123; cv=fail; b=sh8ihV6GzpY4z0tXYi0UArR73yy9/oPtWeYDDXvz8Kjqslujlin25rmHfuBNDIKMmLweEZFDAo6Sn8/OqmO1Rg/K9BiXL6+ERM/cFpbyHbl4zMsePj0jHbVjlYjNkCfVuEzikpwBaIqwNGxccRqxVcJhe26l3ADrkQPag+IkqFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382123; c=relaxed/simple;
	bh=QV3PEDqelzjgaAQqcmO0hBqVq3bq8Hqn/NHL165Ux6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctL1t687cNPX3wEmy0z414pdGTdrDtjA3DSNZ79bkuXBFHT3BC5fJtAA+dBBr7ERKiyMI/htcrZyBtrY++igW4MFHQUq5hBZYP++IFgSdIb/yMuuQ367i8ghlt3axDZIpW3/oQ48Hc7WXFvbXI3czmiKzxf0JMLSXswx8tE0Dg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GmdViWDK; arc=fail smtp.client-ip=40.93.195.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GmdViWDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgsx+9lwYqYW6fzpy7GA3WdnrJf6DRyq7b9tGOLvFbIYsRRV/rVZdOgY/hVFyn0Gez98yvSN2eDU0lg/VkiM+iLLzxdldk75gTuSAxGwgeS81fG+vViNNJK+P0rumbKSNidXwT3f2SltZKuh0mKLzPfpYtJzOwsbT/6oGDqE+WGl0255RmIs/6CbwH2jPMwwrZDwKLZNH5z0Tsx8qsh4UdfjM0wpfEjRlzUcu+4RYwYSTyLl/I4wLPkt755ZZi9vnjj2RZtaaU8z7pP4CBjFbgumTplQM+E3qiOByQHWJ0vvgO0A8ZCawyz/vSGsU2QBvj6Ij1bgILqlPc+XJkalGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF1T9TvasgN2fqFoAIPYuDX6VjHiBIig2kDGsArpJ88=;
 b=WpqfBj23aFYqyB9wm/niRncACNrlYFNNDLYA6PWQMmZTFyg88LIQHvBQdbxCUbbqZtBR4ZHVR/IfvQMNNcEyS7XiFmu1+gRAPVrAZZk0kqTgz1vEmWUA+ebYZgnZD5ChykmTXEnRIbbbS+pVUaaoXiYFUOKYLVC0He/izG3IZ7Sg3JRv/1PwrUK0Zvn1iJgeoMYlBNXcxpAH2aIHk3LlJ0Elx2Lmrow1TCT9jjxubDOyWx1tqqmwEmEdd/zCiknqLlKSY9uUQjdZhY4v+6Nrw8FlYHrg/+xxpGaigWcXepLFYVSPvV1g+O7QhvG6ninWxjO/4esaS1ip8JC+cEcAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF1T9TvasgN2fqFoAIPYuDX6VjHiBIig2kDGsArpJ88=;
 b=GmdViWDKApyAcAGiI7Q1RrUOOmyxhb7X8Hr8XBX8PYjzG448pFNpX0IPszC3Ja2DD0NC0W4L4VPRSKta5Y/x3D636vkm/MrEozGI8TZt/qPkk0USNWQDO+Amp59JmpeeVc20GxtSa4tR2ukL75l9ZGXJnPXvCLrkjrpy0hLZ8IA=
Received: from IA1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::12)
 by SJ2PR10MB7560.namprd10.prod.outlook.com (2603:10b6:a03:537::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 23:28:38 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::ec) by IA1P220CA0011.outlook.office365.com
 (2603:10b6:208:461::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Thu, 16 Apr 2026 23:28:37 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:36 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 18:28:36 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GNSaKl638840;
	Thu, 16 Apr 2026 18:28:36 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sen Wang
	<sen@ti.com>
Subject: [PATCH v6 4/4] MAINTAINERS: add entry for TAS67524 audio amplifier
Date: Thu, 16 Apr 2026 18:26:35 -0500
Message-ID: <20260416232640.3084132-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416232640.3084132-1-sen@ti.com>
References: <20260416232640.3084132-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SJ2PR10MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 39eae5b7-da24-454d-7c26-08de9c0fe28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RkMAXj86T67y4vXCj6Hu9ueNrujH7pVgwPyiaREY9cxbl6rBWi9kkoYZXpa6M/BRdLms9asVV3ZqOkfpT/aWWFvfdz4dNL5OZWvds8ljHyR64llb5ta2ptkYy3vIRTXvextNFPUMBmLPrVuNihaFfo9xaF2vbWLT5tg+tSu6X28Z0NFBC5s/nqHd6Juv7oNxl/bkKEf8Gmlfq5ZaF7xTJhYcwseyxZCcreOtxxW6/u+7zQZXSURrjWyOgBIJt69DzU69HWqa5wL4IfdM2qSxJWQpdG3B1JQpErwysrbhKX3M97zJI6iyFZvMeM2cVBmyDkJ1f5TD6XEmIc4D9Ma6zgZoq7U26nSx4WHk2Z5ndfo1+mGGp+s35Hd3pJ+vNgs9W5ZvKDdjX446BivmfVWN93y9z+xC7bBbKLr4JdrZrBFd0k3SqoLt3133iCAo5//jtDwj6dRTjZAKkfueSv9QN7CrY2w8QJtKygzA++Hu2Di0Yy9Wo8Oo0aeeGYraAn682NTedf0tvJf+Jdr1QvmJ822MU8j9XJTpDKyZA5smPK9p5b0Ji7dCmHaPoQeX7kCtZtLJnLNZ1mb0I5dilMH8bQ6Ha7xPm3sJ5a4e6CxOvWQEu3+dSplVgAt+3HG+YM4LfKXVRdEe2CsnqZVLuQhSrBS2DUDPivZCIky69ougGDhUIBhPvhcJI8eEV2vmu/qAqZecfMPSeWr3LbAA4gnK4dtTAtXlkZKlJGowb3s+u1anLhpvHg3FQfW0jgyV9xWDQbKMHjCPiAfosUJPRamlUQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tIGdnG/Lee0W7RF6OBukjD1jinqXoidK24wVkZQLSQAllAqOMxl+iuDgHGRnMIo6a0hazM+7fSgq553T5MArIuHdHv+Xm5K5YW+zTCa/K1aZvZcyQz0HWIlMQlUHDoJsN1gWRCY0iTFJ8djRihE6TRoVn1MJ9+VgC0bs4NR4mBMUqZIOBE6PMY989N1dTfpJW+F/D17XpeSGBXnE2fP0gBAPEGNFcfHoCamkKAguen1nMjvEQqk8ZUvBuDcUG/Lah0vkuRds1GR3pEXpidZk90tlf2MytUZM4HoCfUlFE8qtl+xLlYRdlr7HwVPggOiNbVJEzrH66knI4FB/YMEyzaoU8CuVh9laI0ApopE/HHHqK+CFRGhnv2Fx5F0C2g99lu1HMnYHuNeqtAhmhRbo5/ACIjeOMCWMdh8mD9jJK2FbzGzqO0AapckImCLk7iNs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:28:37.1261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39eae5b7-da24-454d-7c26-08de9c0fe28c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7560

Add Sen Wang as maintainer for the TAS67524 codec driver, DT binding,
and documentation.

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

