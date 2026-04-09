Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D0386C3F;
	Thu,  9 Apr 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772422; cv=fail; b=DNQrZyqK904ZnqGZB4g0L9BeiGdo4hjT+IPV5SaKm2jS5ACh0r8R4O5rQvF2ucYVqzfWxRI3HhGzzrBHDcrw9HgG1pdfc0XNZp79i117SSoHQGWYm9c9K2DQYNqGRXUieg4fxO0S1W42xBiYUok+2ac8c9Y/DQ9y/mmO/sEU7yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772422; c=relaxed/simple;
	bh=SVN8RK6t5iCrczHTqjkg0f73rjkmsVj4yCPx2wZLCDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5PUV2nMolAmPFGhWhOh6miVEoiyQoVwBN2vU6HoMG70QJsu1aNCaTIoWGNIeGyRpuunOe4kdQuT7W9dXa41Ec4AdC3fU49nyetmV01OjhXPezPnDnqdGDyB2xRLunm3YN659nV2UVyjniOSgZoX1589llAEhta0D92FqLFKcWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tXNbi1i6; arc=fail smtp.client-ip=52.101.48.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tXNbi1i6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcWHKuVz1aq/1xqmt3UJBRXeLWldegk+mE5YftbWTi5ifq0umEiuJZjr+XCj3pl9JpMm5Jh4vJDAmWVuB1ThMg0AAluvev06q1HVmWFxiBqL6bcNlxIIQjpTfMW2eNJMhhJBi2AC9ZNPK9hVzqaG1TXFi4NNF7MSReGhC9Mx+JF+sVZXioGUyAdy31UlsF8FAX1O8NYZ8bWrpOnZhH83udWSkiHKA9Lnv0neAkSHf6MGX5dBHAtLq0maDYV9vm0owPiqtgnxkonXpeAKp+2+tZTcfB6f08DDh6S6FAJTtVqy3yfmePo6pzAsxOUAHFKWgqJMUAd4LsV4Co7a3SQZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fILuxeyIumz5Vd6OzcJl2nKcEwZuotrnTRDBBoqNeNo=;
 b=NQctkQRX7+0dCVhZWADCvMrQPBQbM1iXF8T+Bluqrjr6ss/ZXphWsALYKdubEpVr0evOxVQ7WhoZBZ55TVP45NgVO8ap06AZSaSyq5bzJHthXurxtoIks8ZdVZVxXYSXxBUoYr7K0q2LeXx5cxEjPkKBksPpOD4FzEqBvClB7nXqX+i5x5dNBnAkEcKynQcM/1+TCSutoMp+nwY6iwSmZROPB00k/ffIYuAC3EVVCAwyFXNBfcN/8kZ87U6eAze5AYv1PAzEyLskguzPpRV9JEwNAWXINfWkUFDOGT89CJ1EPk0LcCUeRwVgxPuGY/ABAD8I83R7MfrE8C2txtCmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fILuxeyIumz5Vd6OzcJl2nKcEwZuotrnTRDBBoqNeNo=;
 b=tXNbi1i6D0xePthF5aQzGAjtBOqwdppbYmbaFQCs98GKHtSGVzUamQxX//SIsaOBYTC04QicXzTmrXdVkQxiGoMYjFyxSa3RjA/tcn06XrtQa4b9at4FMs3oDK5BUjoA0pdnerFGOhEMZkiKTtr9S/d9PMvpJZoSsfkn960DEPk=
Received: from LV3P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::25)
 by SA1PR10MB997583.namprd10.prod.outlook.com (2603:10b6:806:4b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 22:06:59 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::4b) by LV3P220CA0015.outlook.office365.com
 (2603:10b6:408:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 22:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 22:06:57 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:55 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:06:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:06:55 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639M6t0o295521;
	Thu, 9 Apr 2026 17:06:55 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v5 4/4] MAINTAINERS: add entry for TAS67524 audio amplifier
Date: Thu, 9 Apr 2026 17:06:06 -0500
Message-ID: <20260409220607.686146-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409220607.686146-1-sen@ti.com>
References: <20260409220607.686146-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA1PR10MB997583:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c6b54b-354b-4cb3-92c7-08de96845177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ilkv/zSYJoMlmgprqLg8VUeP6R98T+9mFTcD4Mz7TZkT3BgjwC3bxUeElUPVk/BHP4bivG6DSC9cPbBdWII+7tvF3CLcl+PnRRzEMIF8WS1lip13UvGgOcV8aHgDKj2f0jEWCcnACl3v5jRpibe/qIr7JzIOxNc2et47bFkXohVaDzSTYVtd4yAAvVPc3BtRT/PXD8hhMLJxY3BQSIFXXSzMSgdH1e1m72nKXczt8UfNxGcWwkj8SQ626wD5DAorLIHlMXOqrY4fz+b9KoEt+9z7zEmgRV4uhBM0weuqqmR8f6pPPf/H1v9K9plKcnIYASK66jL+M27Df8afFLOEyRbi01TER8lrQcm3v/QcIH03xlcal2PKHTHoUn/cHsfJLLWDIHUl7e90TpzZV2NlrVTZLHuWXEIyQN65yevzzlGpXYNdHM5Job2Q/kqoXYdZS1eQj+068/xTq4mdBt+STH+fXpwaTz+jnbA47Vv1mEhYZt1mwF+OBZaY8jwPYZdqYLbJgYKjju/tpcLi/U5ma+tL+ZAz085x+zs5NqS/D+lS0iLi+Xuigd9gI+DI/4MPS+ArexxgNw+7V5XQPg3NAVOyOxQJ/1i+H0XUspo7/R5s4TtVL+LKxMelurKTAdQo+y/5Bsz4c09OCxuw7NsG9YFOP4EZ0QNcpEu1KvQo26q4UMzYEb8qh5P5UX1RVdVeXx4G/spv/vsHe211FQPTeNR+JPK6gDAaQT3BRVKQPOPolXq1IPSabvHqNVP9PLWv4VG+c8HN3y8tSgBT8A9XmQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KvMdx1zomrix56j5SqQTG8XyWSWUT8fL9swyhdYDmMdiiu2Vdj7c6BKJeW/+n/r17+YpAUUugvG7xiNY4mpFKTqWvYwOgCW7zF0HD7AD+li2vYDt7cI4ywWYDTQanKrMuadM2yNd9HYAE6d9yOASvdaV/dMcPcuN0D99uuBUHBvSXCHBexj1tB38oMR+hCuIDai0sIUvy9nQoGG6zWNCAbrPLZGvPXRE7YqzIWLGsSh4E4En5ICTkBlqN0dwp8fE0BEJTa9nFmEMdVR6jPZTMkT0U4bWwrjzVYO5ud3XRRoazuITDkqqhpiN380BzvcHK8VwSC+vEhQrOQjnJYkeZYOzc/sM7TCcPh6o5BmOH/YSRLzpv5ueCDSlRMWaeElsucd7/PEV3swMzgCqrX8x4mnPWrt9zq/8jNFrBqPL4CKqymhiVQzX6MFKn699L647
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:06:57.8608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c6b54b-354b-4cb3-92c7-08de96845177
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997583

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

