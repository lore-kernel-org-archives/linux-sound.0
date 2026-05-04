Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8CB39A073;
	Mon,  4 May 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899471; cv=fail; b=JXOi798i67Oy9avCNRJOI1XOF24jX/p2kkQfca4KglKSZPBko0IZjse+xFDArYNW1JSWaKZfXvfj5nR0E7dKHQA0F3VH5sRh0XuaphpBbSrtO3eMewwNP9QbZfr4kreGLe+ybzUEQFoAc3bTS6lsksGEKu/f2WAL6IlRgytqqZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899471; c=relaxed/simple;
	bh=2eGuNbqTqQpYuP5pd3feXTbAdetoU5FTszgYawDO/6o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dbuEnwQ/0EIIP/nYz4NeOGHSOSqlzwf74rIyTQ9M3RXHZFEtjqxId1L0VU/C0NlZnd1jhH/KRjHVGnnZV46MQqtybucrb3Tur/syTnc/afGJwuq9b4BjRibB5bK3PctI+UPNI39a7T+tvYSsvxwMasWNpO1DxaE7VjxUrKpYdwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MykjPsTr; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MykjPsTr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY2bjTGaTaYg5+Hi1nQ2anKBoPLDqJRupgCC/tm1BoSmEOa2/Sw3pJocMhl8eH9xt15AkfrX6dN7ZAnbP58CTGTbVrAGMUrdFLRgjkDAT8KoaP9PucxjuZVSJOPcb+zHW/2g0zuzKtTBmXpmdcXwjyW2lMobp7lGrFM0XT/97z+vmnr+OTlNlUgL+q5bzscrkKa4+DWebfcyB4JmVHLNvgYY65qRBLr6vKev/cQeVTc8uaquaLl+Nc69S6WLPDisUMEAde0ZZPDSqC3y1bI2ocDSEBCZaYYPUJ5eLF2NHjy8Di91lZrrDZ3kA3agWEKCPVenUxbhX9moA/0t03XDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V9stgsfj7kqRlAC9LR/RpuVwAgbw9NrJKibppor7EY=;
 b=RPj0qyi+fYJvtEnv26H9W5/8RaYrFyQvO2j/YvfMick2GueIoXhRLdWSniggnExCjo0uARhfJ+jQE2gzFL9IEg+c1wkNWqZ4Dw/RhcHVzT9P74ThvesBX69OOLeoIc7rMc/mwqV8XL1Z+nmOd23ckmpwqVvjYsHwv4e1bbWcDMhAIWNhtI10+kTWgtnDWs72OI7rCMrgxE2qXa/v8+RmUCXrfVWrUzRKEJBjHiLkFZh2q0nmsinTtfA6SfbbU7GTEu25130yAni/yJPSz8C0ZLtzOJAfRmveGjz5uSHR1As0UCyYfj6JBSPLTEjJKoPciCyVs9uwBfzZXZUrptDUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V9stgsfj7kqRlAC9LR/RpuVwAgbw9NrJKibppor7EY=;
 b=MykjPsTrAHretmlIk9/Yli8KLYFwScQY0rYvY8y49G0nn3ie5mqDmATapSQq5Lj3P5ePNPQefzh0Y1Zihlrr6tiasFBPPs3InGAdZhsY7LCfl7rvWGXhYLcbtG9IOFSn9KjLjhov0VNZSIOpRQfEOGhuo6g8TmO0TGUHZ1QnzUg=
Received: from IA4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::11)
 by BN0PR10MB5063.namprd10.prod.outlook.com (2603:10b6:408:126::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:57:47 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::6e) by IA4P220CA0011.outlook.office365.com
 (2603:10b6:208:558::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 12:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 12:57:46 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:57:46 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:57:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 07:57:46 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644Cvep6762893;
	Mon, 4 May 2026 07:57:41 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v15 0/4] ASoC: Add TI TAC5XX2 SoundWire codec driver support
Date: Mon, 4 May 2026 18:27:12 +0530
Message-ID: <20260504125716.2015-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|BN0PR10MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f25d51-7aad-48bf-d3c3-08dea9dcbd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IoXdQUkPr5aPq+Lyp2Pr8kQ0DzEcIEhhxW1n2TJqvxcA7dHTicsgBGo1V9PMDrEaVNPezNPXrtwZicvjcO4c4a98uXPmb6OhrtiTSpdn/qftGZgR34K3W+gQONNgFSVsRE/IVQ4V8oWfdVZ8O8xw0p3gR3cd6bVmIrVn5Z3S3kvT5iF3k7QLpP5Bh8VLIUz6NnOmlHtvmb1NLaSg5SALr1CqEvNqeFCWEkiHupYgZorpZJdD7Q36btG3OPOdd03qgUZxqy6LEEiWGRHjhH2dRqcnHNqqXVd/ljEx2Uq6JWV3Gq4gmoGQmjJvkL7ZFiRXd8mt7/k50VxyypEqS6dLlt6Z6b/I18ZQu/9Oc9OZTIBkjjP6YIZGV3tNt48T10kjg+yDSFiEAFwubl24A5JAQ+w6znMHoPxP8HqCesjEp6ttz9r8ttlgAVF2UPkvlE7krIxtJUSCD5UKHkyHoDy7P85YCv31ja+LX9d/gXG2GFKz0yfQdTyaWptlqk2hjVHUV/RtKpQqnDVry92JMQQ4xTivCuJMW0lKG4AWFPQJOk6fVCHMf2WFIRi3Pt4F2nj/Jff+qUnsIN6TmN4UiODzLXez3KBDIDV8VniDFTseyWDvX2Nz4oDfhUJxAc+BHAxqxZzFHgqSRwy3iV6vJkT02BkvXPMaOZ/NSBLJB4817xMGPMqtOCOrGa+WglZg8R8FSkuT/RacupSGZtKoKi2Lx/0dXD3or7YgqLfr46fdvlE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	16uWn/WFJj039HHFDR692lIp8pZyyQh+sn/8/S3s1RQh9ZjeV4b+VPp8hwhi5iaIZ+w58z4/HHZaJbKmNGNIGAmiBJVP1mYgTUp/Hi8CNPnZBTtHLt/XBYkYFf/yCSmiwoPvUEKNzORljPL6S4DvKdzHEeInQu/PPPHOtoSbamUkWCWsXSemeUi7V5R2VJGeayPZKUuZ1RC0aDP2wcMcMXUP4QLixeF/1mrx1ZtSz9YFHO0G5NoIMgISc+yjxvsKq5DYgv5DcVcDt4dLFhXxTylRexQnDNIbGoDkHqFfN8WMKoxmUGWm3ego+r9VwCGrQvrru2Z8+36ddnultCjC5p9HYoBbGa0cEbWVsmE1IDJ7JO0pw+4WgHkS0A+u2SeyQtVUfzLt7zY1Z2tN5QzPggKRVBbNgH5hkXpH2DXuZX+F8o7nD2xGY/9s/r0cT1Vj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:57:46.8575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f25d51-7aad-48bf-d3c3-08dea9dcbd76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5063

This patch series adds support for Texas Instruments TAC5XX2 family of
SoundWire smart amplifiers, including TAC5572, TAC5672, TAC5682, and
TAS2883 devices.

The series includes:
- SDCA power state management helper for PDE verification
- New codec driver for TAC5XX2 family with SmartAmp, SmartMic,
  UAJ, and HID support
- Machine driver integration for Intel SoundWire platforms
- ACPI match entries for Intel MTL platform

Changes in v15: (Patch 2/4)
- call pm_runtime_resume instead of waiting for
  device to get initialised similar to other drivers
- skip reading the uaj and hid registers in the interrupt
  handler if the uaj is not supported
- remove had_unattached in the dev_resume callback
- detect headset in the dev_resume callback only if the uaj
  is supported
- indentation fixes to use reverse-xmas tree

Changes in v14:
- Resending complete series (v13 1/4 was accidentally sent alone)
- rename the first_hw_init to first_hw_init_done for readability.
- Removed dummy tac5xx2_sdw_clk_stop function (Patch 2/4)
- Added pm_runtime calls in .set_jack callback (Patch 2/4)
- Improved error handling for early .set_jack calls (Patch 2/4)
- drop uaj_lock to make it simiar to other drivers (Patch 2/4)
- move the pm_runtime_enable to probe and keep only
  pm_runtime_set_active for first attach case. (Patch 2/4)
- remove tac5xx2_sdw_clk_stop as currently it is dummy (Patch 2/4)
- Used xmas tree style in .hw_free (Patch 2/4)

Changes in v13:
- no code changes (v13 1/4 was sent alone accidentally)

Changes in v12:
- Used correct namespace while exporting variables (Patch 1/4)
- Fixed missing entity information in logging (Patch 1/4)
- Removed hw_init check in .set_jack (Patch 2/4)
- Added missing pm_runtime_disable in .remove callback (Patch 2/4)
- Improved error logging in .hw_params and .hw_free (Patch 2/4)
- Included part_id in firmware binary name (Patch 2/4)
- Updated firmware header parsing (Patch 2/4)

Niranjan H Y (4):
  ASoC: SDCA: Add PDE verification reusable helper
  ASoC: tac5xx2-sdw: add soundwire based codec driver
  ASoC: sdw_utils: TI amp utility for tac5xx2 family
  ASoC: tac5xx2-sdw: ACPI match for intel mtl platform

 include/sound/sdca_asoc.h                     |    6 +
 include/sound/soc_sdw_utils.h                 |    4 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tac5xx2-sdw.c                | 2049 +++++++++++++++++
 sound/soc/codecs/tac5xx2.h                    |  259 +++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  132 ++
 sound/soc/sdca/sdca_asoc.c                    |  106 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c          |  144 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  151 ++
 10 files changed, 2833 insertions(+), 31 deletions(-)
 create mode 100644 sound/soc/codecs/tac5xx2-sdw.c
 create mode 100644 sound/soc/codecs/tac5xx2.h

-- 
2.34.1

