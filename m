Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6352930216D;
	Tue,  5 May 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979942; cv=fail; b=Q3eu4y7Ez/S4kb96f/swDK64+KKmcWsNdeZO94G2DJ8wfugM76ltRYejylPN/yZ9O4TIp4I/5Wtc9h5ZSjCXP5Sq0+u1VrsiYcWD0C2ZMgEwZdpzTXplhCFLnfQItv8LIMwJ3VL5Sppu1/PtOd78/j+41UoYVb4Fyxqcb5YvAQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979942; c=relaxed/simple;
	bh=xeIyujxIuyKOrPccWT0fNsJXLJxMFhVgoXvgu0cAE88=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R3Zk4mDtPWQ764v9HDeQofA3+1d1A4b79IEMsgcTrwFgDDWcNsNGy6n6xxNEwE2u/N1oHCHsz9Uw0WjVLHQ3N23XE7qolk7coZ+7jz5er/zL1XGgNRvGwerkKJaJCvRv1zuiz5Mfae/rSPgn+STXgjo3J5wm85rPDIhO5vLq7U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kgFJq9ps; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kgFJq9ps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCNjyiFgvWqkBlVP5+dyC8d/WjjfvqUU+aiQ1MxysG0FHbJ06UrGg/MM4C+EL33f7CtT93C7f0KJO7UOSqpnFGgUOju8vy0pXN5QCV0rwDUQpewNPF4NVkR+dftandrPyiGXNhZu7jXZKfVjc+M3LQyUepUo4ZmExdEGVZUD1DVW1FvFID6Wu2/YNg1SUvL5Dgl5x4Qd7FpWt4dZjx8X9tCkuyTDKQsd9X6qmxoZX6eLxxxBZwBGNtJyKfsbnJnUAYmv71MT0MCt7/45QJfBvn3638hytvf9GNBOeCxX0zYAYfvgQFq6+1Xbc+5ujtqYPY8ntHIYFVsDyOslh9GN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG3dgsYDS9Lb0xzXk8rsvmVVtjWy7OP7KZUJBHQN0tw=;
 b=kyh2rh2Knyzm+fAd7bzjieX8od7Ma/jg5E9DlGSroeVKCTffh9c7K+RgVYwaABdSWS5VMftWTK+SxBc1iLMXZvEQFtpLs6sgLCSfpC8qzxG7oumgGfuqnPAky4ykgew+1LD0Y9hOOPD5tGIkY5Nfd9XoiHcC0oqwWfto3pBxlDW8RFxWi7K/KLN91ELNfKegGUV8tdeoT6nT1mWYPlT7joO9FCElanBSHufRuHQ6PRcR5SuWC1smCEBxPMVBPQZBZq3bFqPw3fJ2nDDSkzKTWlWpiLvMX6iNjQxF7X2aaTz1fMKY28v8Belqj3d09NYh0QzyKlOiPzQ717y7LE7aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG3dgsYDS9Lb0xzXk8rsvmVVtjWy7OP7KZUJBHQN0tw=;
 b=kgFJq9psaow7NnSURTa3YXOfJUfLMCIYPKJm3p6cOnDfGhHw8e2BhjA48KidF/3MgFersfq8nAK7i/77wIpUHSI0S5Sl8JFcaB8q7yjPak6t931irkT3bWbudNORUwmStQXKIXuts5OjAlLsJgldJ6HUuLuh4CHEjSWBrej1Xlk=
Received: from BN9PR03CA0962.namprd03.prod.outlook.com (2603:10b6:408:109::7)
 by SA1PR10MB7789.namprd10.prod.outlook.com (2603:10b6:806:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:18:57 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::44) by BN9PR03CA0962.outlook.office365.com
 (2603:10b6:408:109::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:18:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:18:56 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:18:55 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:18:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:18:54 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645BInUl3137036;
	Tue, 5 May 2026 06:18:50 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v16 0/4] ASoC: Add TI TAC5XX2 SoundWire codec driver support
Date: Tue, 5 May 2026 16:48:02 +0530
Message-ID: <20260505111806.2280-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SA1PR10MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 4119abfb-c136-489e-19d9-08deaa9818f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q95db2V91NhSAca4cXk9MxpC6GluRH8FsuSJCJsaeVzmt/yLecnvPqZeIyemq1YS/pVnUSrDYbXZtPYXR0d8p68L71e1TO4FAptizAX9IwUzKjNqzBYKqffq6qpBgReIZIYH5vQ6CWInI1ZdTEEhlriqYck6oS0Q8ywfH4G4fotYB08Izwl3CU1ggzdrxrhK6gW640RJtQozmILj7M9UsbsON347X65ARCgZpqEnPu3S1cHPPnqx8oWb1c2znUFH/EWPtltgaQVXaLQo2kKc5BA6GBeQCQKho7EDklinL0fhhXRN69At4Xr2DiroCCdnKb/VXCPJopyoXpQqAQxkjfT7+PSTp16dDHaNG2lhqWyKg8D0OTJotFxZ8gCNqoM/uZLHYX3NotYsorv4Fod+XBxBylKx661AdpmxnzN6pkPvfKpPSxT0qnDVI2h2dRFfFbtPHJlUfFB4mu4tGVJy7IGp3nLUoCllaDuIdp2JYRR5P2Bep5fal3Eh0sWxluB8CiRYDILSL/kVXUL7Edskh13xF1F+T3rR6GiB0gYcVxbVuA5xONaiFL2paSzIwjpHmoOvyLykGtZ4xSOWGPfa5jnnAtlTQVIv1ysRW6eM5rZv1f9qBlp9gRSpanyHpWhcN/plYJLD/L80Jtd0JpjLvIvRUWdMhvbJYTSBPJCTDjqLHEk0ek9MSArTN6KlppAo9Z+KoUf1tYQfvjx3QK6unDBwbsL39CBSvMjzBq92s/k=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x5FsisI7Ev1thvipsz+z1O7KcoBKhEsp27lqSJtj68/fB5orhuGwjfiY5JE8Fts3XxEqrOyFGav7P7uVzbJ18PMne/E5f5eqjRfBZ3i7autgVLbDRR10yB+h3Z6gBp8DJu8VRZUzgavnwYQsNyytsPs2UPixa2nf2DyYPDV5CPjC6178fyBa0ok2H+ndLmi2zcftOGL/gYcEeJDRGzIAwT35lpMhOWOH6+WMgsx7W8jtmZG7YSnxv/q8+Ps8Qb65iT/nQ6P90KwUp2FPxayFc7QvUPV3ZesWtjeCxdNRZqOq8+/DGtC3c+GXJQsFLgTGvHx9+G96Y1LJwjVQ1Qjbx314LKTYO9b0btJB/4SF7fhw9sU/lJ5abOnzOZN3sPG7yU1j6n83cG7YWaPmUfnMjrtZeVlsWcMoWj+DvWipZvnHSySnMCZ0vXU3eJUxXcns
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:18:56.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4119abfb-c136-489e-19d9-08deaa9818f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7789

This patch series adds support for Texas Instruments TAC5XX2 family of
SoundWire smart amplifiers, including TAC5572, TAC5672, TAC5682, and
TAS2883 devices.

The series includes:
- SDCA power state management helper for PDE verification
- New codec driver for TAC5XX2 family with SmartAmp, SmartMic,
  UAJ, and HID support
- Machine driver integration for Intel SoundWire platforms
- ACPI match entries for Intel MTL platform

Changes in V16:
- use EXPORT_SYMBOL_NS instead of EXPORT_SYMBOL_GPL for
  asoc_sdw_ti_tac5xx2_spk_rtd_init (patch 3/4)
- remove unwanted dynamic memory allocation for local
  variable. (patch 3/4)
- reorder to read the uaj status after the regcache
  sync is done in the resume callback. (patch 2/4)
- rebase and use updated sdca_parse_function (patch 2/4)

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
 sound/soc/codecs/tac5xx2-sdw.c                | 2047 +++++++++++++++++
 sound/soc/codecs/tac5xx2.h                    |  259 +++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  132 ++
 sound/soc/sdca/sdca_asoc.c                    |  106 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c          |  140 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  151 ++
 10 files changed, 2827 insertions(+), 31 deletions(-)
 create mode 100644 sound/soc/codecs/tac5xx2-sdw.c
 create mode 100644 sound/soc/codecs/tac5xx2.h

-- 
2.34.1

