Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B913A169C;
	Thu, 16 Apr 2026 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382128; cv=fail; b=p/ob5cRC9Z4j2kBdTakk/gMW+g7KnIcNFLCBc9KvLuGIOZE1/2Yi3syAaXRWaDmDbmwI+idcFpQGbdL9o1pX3rNiCk8iliTZG1m3LK5MVNalhlnJ6sn2QvektWKBDq6zDd9LUNN0KiVuHi1jmsrCqDwsPmGK6UzgwnFmwgqyuDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382128; c=relaxed/simple;
	bh=Ol7ptWqhjRe8/yNXMcIAV5YMPhMMPTcu0i+jGYLJ0Kc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ByDopyfGirTTk8E/PjjCQUEwAM/59iDDfRSuCIHPbcBbcv30YpK5yjr12UQ1YOaj88ZZQYg6rRL836oi/0dzyL2iF3H3vL1fjGpq/Om7ShhTIhO6xYJpeGLyA2ei3lAXd0sTEpRD9gYIH880Tt8nhxIL5ZLcVAXKr6AQItyL56w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tJXEtdzA; arc=fail smtp.client-ip=40.107.209.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tJXEtdzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2AznVKtY/uYQ5z830+WwpoWqcQfTXFJmoySK+7zvwhICfDFEKujEdfuJr07c1TN1Ya7PlDU6jE5MEcwfbQsjwSbbnnFM8mYwBJgajYX+JzpnohgoF5xiwOEpGPrM9Cn1lYMZxudp7kcQWz8phsiQ5CPBzvtcB0l2G27+INf0FMBFwiE253e98ATh2mQUaNobMiHD/JDnhCXuYhMMBHwj1yuREzMBBBXRVXSvcboN9trEi75DztXqWvvficnx8FczLaksVqAth+tvE8SqK1FT2N8uO9bzZ8kRtpP+fmeSn2wLyoJoNMkq8cY68bU1d3Qbfhiik5ytKu7IqYvai6wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMsaznJRahmGUBDW/uasebR5ajMo/TawcBuKHgAZQEw=;
 b=DY2BuXHkumcLjUEhCmIfJQRMa0dge1i/TMbYUdlR3Nvo8rrKtRimSEWSS5U71hU/BDEc418nUV7LJRc90u7V440DpZavPI0NWFlQr3HTcW47pRqEM1JQLhA39mBoVSXBFFQo1Ua+8ZcVKEmw/qLyyyCErbUGK/TRsSOnE3lUqloDybulN0+Nz4O1ueCHpIzuPEfBtybaale78MAur0fiaKk3nnt2eehBQ4BqIx/rLLFFIYu6jvoVPgGNvaSDAlyFwm8vP3ByMUKVY7DBfIX5aF7dnQDDYjrDxWIZ3cuNv3rdk8Myz5oUC9Rnn9ocqqJ3U6ch3yQv/69nI6COOvLk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMsaznJRahmGUBDW/uasebR5ajMo/TawcBuKHgAZQEw=;
 b=tJXEtdzABqaLbkQk7jJGy7tixkix3fuRIRDBXKwHMU/VDgblXyDjLWfYb14+a1Zt+NcR0DEjZgFYQa5ySuodQtEI9MEI5NTvvRkeB8nz5FPNcWT7WhAw8yOHkdZsH6R+dejLQCcJbGuaL5RehyE76JXeDAHxC4DXDYb7Z2ioVls=
Received: from DS7PR06CA0024.namprd06.prod.outlook.com (2603:10b6:8:2a::8) by
 MW4PR10MB5702.namprd10.prod.outlook.com (2603:10b6:303:18c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:28:41 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::a8) by DS7PR06CA0024.outlook.office365.com
 (2603:10b6:8:2a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:28:39 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:30 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 18:28:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 18:28:30 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GNSUGl868553;
	Thu, 16 Apr 2026 18:28:30 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sen Wang
	<sen@ti.com>
Subject: [PATCH v6 0/4] ASoC: Add TAS67524 quad-channel Class-D amplifier driver
Date: Thu, 16 Apr 2026 18:26:31 -0500
Message-ID: <20260416232640.3084132-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|MW4PR10MB5702:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee9816a-abc9-48ff-aea7-08de9c0fe3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	d+XByCH35Y1AGVbALDUGV6k6j6JdzOz66g5LwQGTAZPUp6HN9LxwNZjeJUXf/l7LseIl9qUngnRdjCgm6LDg2SuX3taeGEljZb8yQ0hEIt5ieOFJHwre4ODqOOVQJhzqvfoF1f/O8AV2kCNaAo+rD3Wa80Xp4/qYTzwKl0WxcvNb+sR2NSJHM4mZqbF0/zmWTDoy6NrP2mga/8nxefocOmqQB0QqW7VZFwIfCMf42tl1oOQOmcWxJ3jgTwhyWV/lG927Y0keuTOs//h56nTcc0ST8/FV1d7ULxNhv7PJXhC3gv2vq9B7BId7N7eC03rHdale+J1yMRfHHq5v2FguBGBO7Zx7ZXmpSTVPOfcJKO3zUbY24jeLWZZhZCYGwK/tuAZecbYB2uAsgOkFF8f+ceTvoM7vS90u8Ym2u1YNmF1FRd5IjCDLZ1/rYhUgCEJcYtI1m17qNM/WuehmCEJE0cZrYBHkhCIeudh7DLhVne6KJCCPfGemvXC4D6a6esjEpiFqB9dBf0jzqnoaToh/ZP4GnC4JFfz9toHRAF0cdHOt3nGj2TLDUwFzvjyisU5yq3V8mmDr4dbK8Ir42K4/LtrZSp+H1LWikHssIsSGHl/pHItBUF3RmfNLxXazA/JU5xtmqiQGpM4Cvep1SXaZvRFDbnovtSgmUAj7FYpV42Fghis4xd8ZvOa0dPlAyZtUR8M81jLAsRtXonS0OEuI0JgJACoA9tlVNSZ17WZPQOPPmG+xxMXWVzCpfnB88HrU+3qohihLsZ2yBIzcJu9Xoz1xeyHbH1M4pzNAbyJbc9I=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RrTFjpmH8niHHVfM8oxMH+Om25UhDN01oZpvs13L/9l2G13s9I0hQJBblspwzM8q4F4hYWKysRH1w7VMmJIKLXIPMMNzk85EQ+QaRI5BCyvK93YzSNWePXmZwgPGZ3LaIBm6aTQA6+Eyw+xZ7a/g6w/Nn2T642XuMr5pA2kj+GYUn4rZgSbvvPkEEAXGDiRF4eg1xIeqJwwJqYmKE7/N1rieuMytXO7Bv/jq4G23vo29YdQ4lcR+LdYVPwnPnuahIqQoRiX2GOeU8af2/bBWkiFbCa+7CpOEJZYEJijsXzHBR1xFkQ4AsDmD6Tl2QEy5eR1vc/aUFTGw4vSvWfH4dwkPoFJzWjQTe32OjvVN4x5NOUyQSEJXgh+Fqv3hvcxec/iH/raxCowNHwtvHKhHAuLldGatZGvKQngE2I/xQHBPiOwXV7LyFU/aslTll93M
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:28:39.3405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee9816a-abc9-48ff-aea7-08de9c0fe3da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5702

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card. For setup &
test procedures, refer to the GitHub repository.

GitHub: https://github.com/SenWang125/tas67-linux

Changes in v6:
 - Cancel fault_check_work and disable IRQ in i2c_remove (2/4)
 - (Report by Sashiko) Use regmap_bulk_read for RTLDG impedance to prevent data tearing (2/4)
 - Add Fault Monitoring documentation section with register decoding (3/4)
 - Links to v5: https://lore.kernel.org/all/20260409220607.686146-1-sen@ti.com/

Changes in v5:
 - Drop ti,tas6754 device id reference (2/4)
 - Restrict RTLDG threshold max to 24bit (2/4)
 - Complete error checking for set_dcldg_trigger (2/4)
 - Add runtime PM reference in IRQ handler (2/4)
 - Links to v4: https://lore.kernel.org/all/20260408053149.1369350-1-sen@ti.com/

Changes in v4:
 - Correct dt-binding compatibles (1/4)
 - Revert v3's change and made tas67524.c back to tas675x.c (2/4)
 - Links to v3: https://lore.kernel.org/all/20260403050627.635591-1-sen@ti.com/

Changes in v3:
 - Rename ALL tas675x filenames to tas67524, removed tas6754 compatible instance
 - Change pd-gpios to powerdown-gpios, cleanup unnessary .yaml formatting (1/4)
 - Opt to use disable delayed_work and re-enable on runtime suspend/resume,
 similarly, use disable/enable IRQ on system suspend/resume. (2/4)
 - Include IRQ_NONE on ISR returns. (2/4)
 - Clarify _check_faults() function which now returns need_clear boolean (2/4)
 - Add register section (3/4)
 - Add addintional notes: for clarification (3/4)
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

 .../bindings/sound/ti,tas67524.yaml           |  280 +++
 Documentation/sound/codecs/tas675x.rst        |  820 ++++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas675x.c                    | 2194 +++++++++++++++++
 sound/soc/codecs/tas675x.h                    |  367 +++
 7 files changed, 3679 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h

--
2.43.0

