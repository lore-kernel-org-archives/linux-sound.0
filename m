Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012023.outbound.protection.outlook.com [40.107.200.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A144137C92D;
	Wed,  1 Apr 2026 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082782; cv=fail; b=Hi/Vry4McV01pZvOB91HmU6T44cyJxUUq++9SjXqyJZMEOqCk5SKA7x9t4Lx41Afvz5mc/dliMtYaCkbf12bWEv4jaaUcG7Ab1i1r8RwVvp3nHdKpjmORFP/9eod5savK7oMBLdvFoTtzswmj/IiGdkYt8qw1/rM43sduDc57JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082782; c=relaxed/simple;
	bh=wbMEYiFDpBQGZcBdArTVPcAh6lViFyNklh2qydzYGdI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kub10z7BPEZIrOhu0Q6HbBNnFleEbb1kQqCqj9u1zjjYec1W3wvjB9NNkHZuH72TmIo5SICzDW4ckS11nif2R3x5qSAXrIVvaUTM8df1hkuT794W8JCuBx82hF1hdxnHDMQ2oJWUiQy2Go+v18qZdRCflBAGY5SbJENKByQslZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wC1McE2n; arc=fail smtp.client-ip=40.107.200.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wC1McE2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOf6GsUUGVIycrk21JQij5Zaz71L3X9xt5byeIeiqLGPfle2i0nHr+KlJwWvDkr+iLGHds3GQeDkbQWGPzL+xom+w9r8ZL1jHZnOL7gI/RdcOrE74iF/yR8cA3inLjKxelkhY+dZ7nLii4WA96H6qOvwUHH9skCuo612Ix/Z2WmLglxL211iSXsBGp1yO6zt1i+tR4oNRL9f76zkbjhnjtPhx8RgGMX7hfPUc1WOffkTKjJPDQDdAYHWzZJaQl18eWPPGXXgSyJUE47681m/QknryHq1tYGidkg3SQ3UQc1Tc4p2sIihSHOGl4N6ZsYuDjTb8MqCZKM5uYOIlUMy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UnCnRD5Ko+FQQLdnJmet6ISscVn+4A6UfrDrhC44yY=;
 b=tIoFnA9cca42PNV64O7ukePHaMb5mnXudiebr1RMcCE1yxlj/zAXq0G7ldq54qodBlQx3DeneG5CsKDQYtqEnDuRspNXa/9rBUExfNKXFZYlgVizOimjCVnpJS/auqIzjVrqrV5MK01VP52znO/NV6hyFU2Kc4Dns+18ls3Imgd77O245T+/yqwxfPFHZKlmM/sQV05czDBAUq0fH4LnbZz32aqJOnFggsc5Q37LWKYY7tX7RAkiLsnoGpbitGUzBXdqFqPAhYSNIlaQGDN5QsIPpzBYCRSifSFrX24eIk9H8tGK+pJedkPzlG9fZ2Cqu8/u4RWBrGqRwWWyYw8q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UnCnRD5Ko+FQQLdnJmet6ISscVn+4A6UfrDrhC44yY=;
 b=wC1McE2nXFvk/pcnLDOnh+QoziJRanAU3pwpKqekAS7hFHOkZn5d3UCy0tOYdYhF66pW81SX1m6SO18bBcM9jpYa6UqgoyghmOI4BGrimhW0HDT8OoYm35VU7VMTzPRJz4Zpg/BJGJFrVeAgd/FDFWhBZDmPOER1rDRRWsj89dw=
Received: from BYAPR08CA0056.namprd08.prod.outlook.com (2603:10b6:a03:117::33)
 by SA1PR10MB997736.namprd10.prod.outlook.com (2603:10b6:806:4bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:32:51 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:117:cafe::78) by BYAPR08CA0056.outlook.office365.com
 (2603:10b6:a03:117::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Wed,
 1 Apr 2026 22:32:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 22:32:50 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:50 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 17:32:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 17:32:49 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631MWngD887108;
	Wed, 1 Apr 2026 17:32:49 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 0/4] ASoC: Add TAS675x quad-channel Class-D amplifier driver
Date: Wed, 1 Apr 2026 17:28:41 -0500
Message-ID: <20260401223239.1638881-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <message-id-of-your-RFC-cover-letter>
References: <message-id-of-your-RFC-cover-letter>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|SA1PR10MB997736:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c3b0c5-f10f-4598-3b21-08de903e9ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lh8KDownsumNTGsBEnHm8+QmbCwEWWMl5HYuUmovNRmPlzgjf6qGbjeNVLEpcUgOHKxGUoxY9APkwmWjefH7zgcW5cdPXi9stkqh6OKa0bbdX3JnD5HvBO0/5a2ujjZzbsYW6VxzKJUyBeoImAp2vN9nDALEfEH/Zx4/Y0DxtDdLvxNyUTJroVCqBqZ4Dd+/GIPWE5MLOVpiu4Ot2J9iKAzfbzJe2hIEtgYm+dhu34G1ewneKUzKk+LO1yohW5+IK85ZJ85VwPxOfs+4QpNoaui/tIuThipD4SMbwCZkM9+VJcwt2xsWAY8J8CHGk4HBIz1uY+38XzSat5TeMkwBaLEURGWdunYqm3R3n1HQIZrcV5jSIgr36b6YER37lU70SzHlyvPkUfagIPL+/kygwWuiaHHOnKoxKWcmp2ukC/OrFT69PUF3jLQw/Cn8Ct3E6KU2+iYAfhH9hO/KP0yep03YMBYOKztsAJVgrSl+BgUQqo0weGcd1zTp+nImza/w3B7/ozKtUBAzC6Bct7CaW3C825EphkUQbNjTRs8IVCkm+Yq4Jq6su0u1o6WRy6dJxOs3290on5flA0Sf7PezSv9xYuaJ+JDDIpFZSUlz/YzbH7mf6IBKfFbsU8FMiG96rTkz3/A0AO/U6ih1JN9BasfxGzdQnirKnSGOSWKTjAWS61Tz98WzMEGBPVZMzUMWn2ALaghrZnRnu47LpR43RGgwTQxTR4t2ub/E32TYHKmw9ei0rpSD974NKiRsQAYrGw6yqMnGW1EemMbtdlWLt9EwlMzFqd9bHX4N/1piCg0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4hu/jUrDdZ/ocDTz99Rz8YVbxYEAps6qcTQ4dfny6wAu5kIr63TsZMn8rA1/bxM068d7DA8pOaRhFfkab8QojjX0gG4v4tcBvawn/GAQK93+KC9A1JOLdtUkIVT81rBySUe4m5F68968jzEsYdELg7XsA9f+xR1zre0K7CFshy1iMd13ppUVtxq+pNSHs4R5HofKVMnVE7rx+IBTp0mk7VnnaQyaBNk0VigwR2kSOl9cW06SBKGjKchuMODrN4sdBuosbxro/o7GF0oUz9T2SbVshxaHoVMdnFmByIUpDEILWIzEUzrr+HkidwXX1uCsRCTX81vVh12xhaag4UWhZ6pGlgIOWO+ZWFbQpIhq6M19xW/74ZJYEv4GGRVMgCBSAfCTHG+sj2Yyl34vMLcjvU740PZLIpBM4NI3bJl4nuz1xHSUOsouLLnloviCOWXR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:32:50.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c3b0c5-f10f-4598-3b21-08de903e9ba2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997736

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card, on setups &
test procedures, refer to the Github repository.

GitHub: https://github.com/SenWang125/tas67-linux

Changes in v2:
 - Remove redundant DAPM event function (2/4)
 - Move IRQ request past power_on, so regs can be set in a clean state (2/4)
 - Add delayed_work at probe time to accomdate no PM configs (2/4)
 - Change .set_fmt and .dapm_routes callbacks to the same tas675x_set_fmt name (1/3)
 - Links to v1: https://lore.kernel.org/all/20260401024210.28542-1-sen@ti.com/

Sen Wang (4):
  dt-bindings: sound: Add ti,tas675x
  ASoC: codecs: Add TAS675x quad-channel audio amplifier driver
  Documentation: sound: Add TAS675x codec mixer controls documentation
  MAINTAINERS: add entry for TAS675x audio amplifier

 .../devicetree/bindings/sound/ti,tas675x.yaml |  278 +++
 Documentation/sound/codecs/index.rst          |    1 +
 Documentation/sound/codecs/tas675x.rst        |  618 +++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas675x.c                    | 2158 +++++++++++++++++
 sound/soc/codecs/tas675x.h                    |  367 +++
 8 files changed, 3440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h

-- 
2.43.0

