Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C733D515;
	Fri,  3 Apr 2026 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775192814; cv=fail; b=obfQeoU0I0w9LgvFdXwrmDdbQgAYsqbYxGiwLJYY/diItns7u+u4+r7ppk8I83qOGJyHsbEZfj3sLxKWVWiEAPu89bFZTPGhMIaQkHVDA2dF9Dqaca/DbHDaMTQKO0UQmKIdXrQv3V6y68RHG65UZ4ElfDTr5Gq5hlJGia59OtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775192814; c=relaxed/simple;
	bh=4UlrZgggbiiM8vwSZPwUwSHBuj3RKb31EY/qX6OD+Y4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jgGAle5Och9Gen+g+jPQBlpc6Jpfwkw5Q9bKrRV1EmjGzB6RrNyXWgGokT71fAuAhYJUu58bTDrN7lIJMjHlzqZeh701SU0t1V0wqkNbh61ajExC4w3h/hohdOhWb/OD6VL7XkQXOC4dJbOZ1GGml92vNfe6RjQsZqNU1zEoU+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KtD3ttPf; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KtD3ttPf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pO2MS/Di0dNoja+sbf+EmsHMfMHMglbFkdsJ/BuSROxiF1KdUMy7abuknjL9uZGRL2/QxrGB6X3OmvFHdVcUzKYsJodRP4PPfiSJbjNlgv3WytwrMt0+HTboUx9uAnA1cbcmfWAJUbKJtmi9OpwRlAmxjA+U1sfNyS9e2cc0qX5ilBhFQFWmzyNNbu6PZXNtwyUExTFwUQ704GbHvtBPCjkns/GFtAcyWNimaDpQHJB9aiDAPedLjQJbpUDYqdog2iNinePhfpYvGhwOMMZIT59PBRVwFObtXK+K5DmSxPPwqiZJUtHTXkTGNh2g0pfnI/OcfWvgMlcesG9vc10A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvgD22elGtaqKnyKBku4PBUWxEcuGlDwbl+izL63moc=;
 b=s7VK1mXDSrMnkDGujxI1W7YQaKNG8T0NfydrScWOAr+oB/iXbzkbWWaQ480h+hNOfWXtELoHDBO2mwV4+puGXGSbIE3/GK6o93A3NgGGtLY4vpTcb6vN+5ym1dd6TFkBh0xuw44ss2bOCY9tuGF4K6miC+2Kr8PqZXf9ER/WEoSHdFBHx4gfU/jVYly9+VoX2uK9ykPJU8H+EQ2e+ffFdvHTUuQIElIYnviq8gWYxKwYHXA7XbjACGbudclw/85/IbNPCQ5ZY2zTReK1aeKe5p4YKS8GfnnGDFiw1tdUrdeyYKi0hipYiHMGcc/N5mk+K2KHBW8FzVDDguNeB3zSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvgD22elGtaqKnyKBku4PBUWxEcuGlDwbl+izL63moc=;
 b=KtD3ttPfO0/ANBuR9+yAFtxhwR48uEHHG0MSpAcf2CZ8WbLzF1XfFkcQrrE6u569OWAvh0QNl2WOkeMgE85GZRgT1SpULLLgl+zsFkZufdnoE6CpJQ1PdETScO9lWZdTepGWTZvGuWN8WwSlCYKLIRYSatDWLVqd6nxLehIgx38=
Received: from BY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:180::15)
 by BY5PR10MB4211.namprd10.prod.outlook.com (2603:10b6:a03:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 05:06:50 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::cb) by BY5PR13CA0002.outlook.office365.com
 (2603:10b6:a03:180::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 05:06:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 05:06:49 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:36 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 00:06:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Apr 2026 00:06:35 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63356ZHI3389686;
	Fri, 3 Apr 2026 00:06:35 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v3 0/4] ASoC: Add TAS67524 quad-channel Class-D amplifier driver
Date: Fri, 3 Apr 2026 00:06:18 -0500
Message-ID: <20260403050627.635591-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|BY5PR10MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: c20f8782-c041-45f1-b3a9-08de913ed004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RLcG9LqYeTbOMKy9BRUonusG8wKCZWaFkoc/eMbOU+C3W+QNrayuJMiFxaAXb3ZgizC6t8h7wA1k1Zx89ljBxvHygXlNjNNNTjgyG2RsV2TRuSlXuYwTFsAj9ReuAT0Ar2UfeYO0Umkran/fgmIRBt61A6sK5LAYp9pzA4T12JDhYK2RZZvj5p+EEfGF1DPl+f4XHud/A8dJbsBYfAFHYqyFoAlLVspIEFr5AIsJvv11wvr2SEYPlNbRNkdj9jsHnhTzk12IFrXXfDcKnd/7+cSFNjr3lM07X2trYFkcTI0O0NzdJ73mHmN3aNGNZ2YbbUa7zymmdddEzWDg6BDYm/4Ehx3iLc95lcX12g6KMDN4+6S7cSMAAT+zgFfzp1NygIHagdgWb4HwmLIFxd7ejAAH97hCG5Z0vwWd/6TypWk2wOTi7aF9EGPkj2eC/ui1McQaBdJ/GBGToJgtaakPBXsSJvkzackia8y5OQwibvDj5cBET13W+KfEpt3pUBzk3HwdfThVlKn1vyP9VplJ0uwQtGF/9vmqi2x6wODXOF5q3cP1EkDf72CSyMLD7eh/GY1vDDjS62gI+84OlzeyHVW79/3m+FE/C9klyVIiGltcxg5cQm0FOlX3PkFCAjb9i0Y3CeHmti538mA64VAPYrXnZo09X/s3+DcTNkwZw3cE7iyfMqQB4WgHP2LSyQxLoJXDnCtYA8GFwyuJc0ERm4vMwySGeT022qX0vNMgH6zH28v64h/OT4xtISkEHHfZC/trpPzUFfMuHadCkf9zRg7BuchwWr2jV9HUNLHCoDM=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3OfUG54Ua/1CHhVoMNZsL40uZyeUp1PgIf2scuCZIO91bhV0p3kXcnsq3ehaZ6jPN7ExnS1HpeVH3io8CHnogZDHn4cTAXFGNPIrKIVhMgDbH4speWwo13Zyj2oTHGxZCCr3kkQ7CEIJNtXuKtvV3b+lcziGnhAPcv12PUJ8JdIfXM/6cg46iTI2trY9qa2wvPgjGp4J+BQI7UVnPjGh+dDg6QIfEt6IT8aFeI6qnxbxMH1zu9ExclO7XlIIX3AxeZjXuRbbQpQbQb9DUVfTYUlaARCQlMXVO9vBhzB/smq033ymqfoRgWkz8qLvlzKFy/jHZFd7xubLOtquW1+oZHBy3BRP78Ez2O++MWBfpgkrUOZbQLaLr2XZK304ZQsjlmFZLDMxKMX6uqE2vofORyl7vJq94FoE2hfk6uhKWZuNA+fEUKsdYSKsuFlLNtef
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:06:49.5780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20f8782-c041-45f1-b3a9-08de913ed004
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4211

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card, on setups &
test procedures, refer to the Github repository.

GitHub: https://github.com/SenWang125/tas67-linux

Changes in v3:
 - Renamed ALL tas675x filenames to tas67524, removed tas6754 compatible instance
 - Changed pd-gpios to powerdown-gpios, cleanup unnessary .yaml formatting (1/4)
 - Opt to use disable delayed_work and re-enable on runtime suspend/resume,
 similarly, use disable/enable IRQ on system suspend/resume. (2/4)
 - Include IRQ_NONE on ISR returns. (2/4)
 - Clarify _check_faults() function which now returns need_clear boolean (2/4)
 - Added register section (3/4)
 - Added addintional notes: for clarification (3/4)
 - Links to v2: https://lore.kernel.org/all/20260401223239.1638881-1-sen@ti.com/

Changes in v2:
 - Remove redundant DAPM event function (2/4)
 - Move IRQ request past power_on, so regs can be set in a clean state (2/4)
 - Add delayed_work at probe time to accomdate no PM configs (2/4)
 - Change .set_fmt and .dapm_routes callbacks to the same tas675x_set_fmt name (2/4)
 - Links to v1: https://lore.kernel.org/all/20260401024210.28542-1-sen@ti.com/

Sen Wang (4):
  ASoC: dt-bindings: Add ti,tas67524
  ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver
  Documentation: sound: Add TAS675x codec mixer controls documentation
  MAINTAINERS: add entry for TAS67524 audio amplifier

 .../bindings/sound/ti,tas67524.yaml           |  277 +++
 Documentation/sound/codecs/index.rst          |    1 +
 Documentation/sound/codecs/tas67524.rst       |  686 ++++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas67524.c                   | 2173 +++++++++++++++++
 sound/soc/codecs/tas67524.h                   |  367 +++
 8 files changed, 3521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 create mode 100644 Documentation/sound/codecs/tas67524.rst
 create mode 100644 sound/soc/codecs/tas67524.c
 create mode 100644 sound/soc/codecs/tas67524.h

-- 
2.43.0

