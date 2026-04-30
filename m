Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7DA30274D;
	Thu, 30 Apr 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560380; cv=fail; b=bl58kPUrCiunYq1X2412CiOgOiUM+APAkE3WnhUNDKW7F7/cA+i9edraXEYDkmnX3NtO2wmIdTDkWUwDvmV7Qh2i+/DsH/Oq7bdyRUrShXrtwZraKSaFcH0OsGcSGp6GXN/1RHMBHTgmq2jcoGwGdtmyjQiDgUjfEP/zMqtgqpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560380; c=relaxed/simple;
	bh=OKycDSzV0/wUYSXDjx7j/BvsH6l0tr9MvT4yGRjJcRs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UGY6onhX32nrkdeLAGOkUlCkKaraYuTyMU8d5W7lFUvMER0ti8AVbtc/ipsEy7qWdtrzwDeGoEecJ8HeTuK16OneTjnridyEI9OX7qWQ518dJAlFKMK+WaLoeILwnJkgCAN/SpgTQZPuW0Py5OLI8OwmuTzp3apZE07WndwHJ+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=If+/JhKc; arc=fail smtp.client-ip=52.101.193.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="If+/JhKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rhluy5hlzRoyid8FP2+RYFamFEuy9cE3rvS0P4vxzcPptyBeAz5wqlS1jsVZhgLISitFadc0qHvo9QUUcnJOMm6s4rljEd9QJtCYsmDZqkqHBJs8gn5q4b1vpH7NXhQ5GuKbOWaVTapc7anUqBOF0y82LD9oQObJYwXpQtoxzUNcRqIvhCtyJBE2Hu1fVRMArhVUUoGAZkLyfhSIxLbKoJ+xmq4RtwsxLVhXoYKX49xSBzB21sGmmMJhnAQN364WtJJypmRaydfIVhJJPt9hQqWdN09r9hTC4ITFXjgottgc7pHVgtyA8Nl8OnTNUqc8sQ1wcqmwS500DJ2x/Yq0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ5xpmzOrKnyN50hMSVLB4xWOIBsxyLg62GHtnl57bQ=;
 b=G/KCwFCtHcwgz/NcBLbwXj62yu2XVWJzIHunamkg1x0D8hcid64PaA4PaeYRS/g/GkMBFwOkVhkgsPOVeiwvGhGtKvxLhV8gmcnbze763k019VuIl1F+MQp5ZCVrPP4o49hFY8YJ+mQ9wZKWhn/pslu0iusI1XhVhfoNBoY1TpoEADiUu29miZFUmdyEwURLD+FzHqfMUJ46Lems4aHhMcRSjGmHnaNrH5F776/lHsKmS7suBPxDn9tyISI5QBZcUTs0kEpw6SEmXhnyD99rsP5XfwjNP+nk6Q3h+CnfgODhXv9AX5PAfGAy8tfhEldTbi2OTffsNk0ClL6rTN5dTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ5xpmzOrKnyN50hMSVLB4xWOIBsxyLg62GHtnl57bQ=;
 b=If+/JhKcOxrXMGl6d68zv8a9cV9oWtqBwkHsZtb9B+QwzWVHd1wHm6Fry9KBrIXLh8C53lQI/Ix6qu+9d5MPNaw7g5FSWgEPtq2b5k3dw2EvGlwxJzYcW7kNPE6K8rO4Ad6gyzpi0pgJtyp4T7vzj77gvuAsHr1Gack0Tk8ir7A=
Received: from CH2PR19CA0023.namprd19.prod.outlook.com (2603:10b6:610:4d::33)
 by LV3PR10MB7795.namprd10.prod.outlook.com (2603:10b6:408:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 14:46:14 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::d4) by CH2PR19CA0023.outlook.office365.com
 (2603:10b6:610:4d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 14:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 14:46:13 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:13 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 09:46:13 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UEk6Mh1332278;
	Thu, 30 Apr 2026 09:46:07 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v14 0/4] ASoC: Add TI TAC5XX2 SoundWire codec driver support
Date: Thu, 30 Apr 2026 20:15:50 +0530
Message-ID: <20260430144554.1335-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|LV3PR10MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7e3792-824c-4b8a-4d24-08dea6c73a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z+DQpxFhrcG4sLhKU3DydWqHW56XeLJRUcy1Fexk1CVH5iK4KyQ0I8SCqjpU08twPCukQ/HpFJISW0XIKQxpgqqmLRv+busLFiVbuMl/43slnwcVREjuKbkQqscKJXqaODeI0skK/y/7ImrtJ0yd+gwMv/DpBfNQOPVrF3SGMIz+CmSIOadJzUqsLAZ5OncU6a64euhhKCEso7LUyb8efMyp/vOmopaqcNwe7+FZQr5Q9kRGOA7++LLKTZHxECZsKq7IdXwx8m2BUIzNHE28GOq0L1k6Yak7/uCR+BfF1NbpHRgRgXkoRSwx6u722DKsAHjsmxJk4F/zZH4SQGK7HoLeICpBAa1SFz/SveLUnNpmI62Ysj3saftqskgFDAgyMXMb4ImvYxrbFzwk4uDscVae4pmHr5iZZSBMN8As0iD7OOEGyAZwcwlX97WHg0b8tagZD3w4UF0tboa9ovr7/T1i0UfbZGX9JyTqRubf00iAFhCk08KndAAHnhgv9m6lZxRSj/hy235SucqQFbfoftM1vE8u4kdTaI2y5mPd5VnPMwFImgb8jaynoHunYYYeV96k5P7dB/SxacLQ8wzP47dNAlLvWLOvQv27vWa+MVLk5WzUufvjbSIzWFQprBgbxsSeeQoPthSS+Xs2DhxeImB+ig1YHWG0toEsIaWpruiaDxyg0MyuxfUZZoMXRiU64EaJRmuFPh31zTXVP44b0yBj8J7tkjerJW7MfBCKPZ8AlQ47AHnSyimvfSCEuAbWXz60saguXuzXsac/GDSTkQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hzAMVGhLd43aKMejhkNMvsDWqGtzVHmj7oRmU24Msr4ySXPyq0U3+WC/CzXDkWQh/8156f+Tw+cc5tM/vp5VhOHRNZLaFWrRDjr8LXl4zwsyJt2kRwgarfPAulgb1yhOwe3ERyqk4MA9ta6/EhZsLn+r9xZLslH5HhhCsyASFboo4idBO9el+zm/73WPDDRXGZI/+5iYP13K9JIGI4QgqV0dVdNJ/M2ev3pxImqqyMHONvzQbLdksv4wu+sBqBgvl8LoS+kSw9s6wY9/LoIerFz/2Hy6OJUJQnpkgvK/5gvV1K5HA/0j55WeMTlqYnQOVJ3EiXVBUApZTVFongq562BEE0YLgyfD5dvoq7uhzt85+YIeIsRYyZU7QZg/iE+nPYYPNcjTLKVw48YpuGBkNB+vFOE2762+F9bpqD6ymj4ZAmA047BuYQ8mc3hlTuRi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:46:13.8527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7e3792-824c-4b8a-4d24-08dea6c73a48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7795

This patch series adds support for Texas Instruments TAC5XX2 family of
SoundWire smart amplifiers, including TAC5572, TAC5672, TAC5682, and
TAS2883 devices.

The series includes:
- SDCA power state management helper for PDE verification
- New codec driver for TAC5XX2 family with SmartAmp, SmartMic,
  UAJ, and HID support
- Machine driver integration for Intel SoundWire platforms
- ACPI match entries for Intel MTL platform

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
 sound/soc/codecs/tac5xx2-sdw.c                | 2057 +++++++++++++++++
 sound/soc/codecs/tac5xx2.h                    |  259 +++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  132 ++
 sound/soc/sdca/sdca_asoc.c                    |  106 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c          |  144 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  151 ++
 10 files changed, 2841 insertions(+), 31 deletions(-)
 create mode 100644 sound/soc/codecs/tac5xx2-sdw.c
 create mode 100644 sound/soc/codecs/tac5xx2.h

-- 
2.34.1

