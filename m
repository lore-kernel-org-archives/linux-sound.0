Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023079.outbound.protection.outlook.com [40.107.44.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1431FF7C5;
	Fri,  5 Dec 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933407; cv=fail; b=n/aDK/43U3iiocZmBUgM1s2/1fVTtLec8Soboxc2P8o/EYaHcxjX/JdecXg8lKmLrcvghsVVfJRQarFJZwOpU3Kjmai4UXJkWYVzX8bQJ5TjG3CxfptJaYGWukmekruO4No2DFvmEayyu9y+lmewbRuZPJVA7JMYvLFSQ9WEtoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933407; c=relaxed/simple;
	bh=1X6Axzo1fmABUEzXMqghSnwx2E5yJ6NFCtkr8nwrvDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ve+PeAUlHxQ35sYVtTqRTWJqtWjuT53uMyZWczEG7THGk1yTx8BDl00lQWJ7DmH7gLQ+9H8ftwDQy8NV2X43736NdhtMG5bOKnlSmc0h6MLpc7DCMLB3J9MrVupof4NLsf0Q3cugv9rLVmfgw8KEji5uxyVwJ2XxO7A+MCkpAHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhXa/ZZ+ncyPPOElR38nHujCf+x31xiYbBxSplB8m94bDnUIuX+XbgP2BGdTw3/O6JtvadC8sFJp6Dn8H+PLrnMfMNCBDO8ssblZLZnU4QNVYWK9kDG7fnxE4rp6v03WSZ7ylLVgL2gS2lIFSu0YoMWVNBDBou7KFFeNmyOv4D2bw77SAhiEeh/BT58hQgqLQagHFCIt/yT1VuSyX3l6s30EiGoqM536pAVmWVprNmrIJTR+LIte+/5VdV0Q6L+IjFnFc6VFgBBwdXuJiNm7LgLiOjQE4nQdvG2xRzhGpms7TvyIAhXHYHqNdHbaOrJ+wc10jYzF3vJiRfbR/0b66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R8K0Havk6wL/zR4z0v+kqxkRHAQTZCphY4E8VnmkXc=;
 b=BpPmlprlnV1aJMcNwVONjOOuFVatXPEY379W6Cxtf5rR0zgjF/Ko+LP/HQLfgg/45W0oPFWm3lSW+cHodY8Lr0M1DfkdpJeQb16v8jhGjM57/H2EB1PWm43yA2px5pXNn9JciD19rKhciwP8X9t5mn0Bs9tJ13jEzS6lThFL7eVBabDY/SX/dLnlh6+C6XKNj+OX3hq2Io53cCgbXUP5zt1gYadhBdzc2/S2IV3IfLqYreyYuWy0mGj0kIhiLsZ/LHfEqqP/45nXGP4/4Vbt91Pbo/zYe0r9uBrxMLi03HE4dR6S//Wy7u4tJbNsWeoDI9YgEX9pk7gjCUz91y/jKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR06CA0241.apcprd06.prod.outlook.com (2603:1096:4:ac::25) by
 KUXPR06MB8098.apcprd06.prod.outlook.com (2603:1096:d10:54::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Fri, 5 Dec 2025 11:16:39 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::f9) by SG2PR06CA0241.outlook.office365.com
 (2603:1096:4:ac::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 11:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:16:38 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4959D41604E0;
	Fri,  5 Dec 2025 19:16:37 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Fri,  5 Dec 2025 19:16:31 +0800
Message-ID: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|KUXPR06MB8098:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 449b77d9-f69f-4b16-feed-08de33efc29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqXtRBqCxqW4bZimQMb65cZa5A/rl67Ew4/tTj3oNZWXhFBukgDMLKhmhC+6?=
 =?us-ascii?Q?VL5WIMdDhP6lfMBwV2JtTV/wgSwG2tD9cjP1WsqPP+w4oSW39MwRL+I5n0LQ?=
 =?us-ascii?Q?vDI9zTZ9ptoOH1IMCRxUJPlgKXK+DaP+aLw2zcLmQOpNVFr5yp9mL1owh/YV?=
 =?us-ascii?Q?v2riOfpnhqvLesKqPOOvndUAmjcCSjEvBCMlSxUgQMi2dTqC6s4Vdo7kSCOo?=
 =?us-ascii?Q?NZgsNrRG8pX8MsE6T6XMYwUaIUwdVfc9q1Mm70C8q7YVCXiZbCOEB/iQQARH?=
 =?us-ascii?Q?NAFtgbIiXN93sVAAwbWUfnhyEyMuNRXPj4ZZGxJDJpz1K/cxLOo4g9cboLnN?=
 =?us-ascii?Q?f+x3FwZm3RYoCO+T4ChMy355v2fCEzIufjOMtS8vZHkSijyApSPCxm8V8cs/?=
 =?us-ascii?Q?YJeZbtLTESyDHiPV9pCuaZhWdLfuk9+KlOhnibSjDypXVm3SCloMMbz0f82a?=
 =?us-ascii?Q?GpgXTnz3gW2qIEx+iorOT00NV7dmaEY+UrdZjhipPfPJp5ZXu/nCoUPBAeOR?=
 =?us-ascii?Q?BbVtzpiv5pU7B3Vp9Nmj5u+XpDfD7xLmU1ESoYUZZ2sEldwQEHracpTbFotM?=
 =?us-ascii?Q?A6d9badexk1OqLU8cobesSd2xX8cllHiSrSsPEgmmAMPrZrHXEmLIExSFJ5S?=
 =?us-ascii?Q?GzHhH8zkJXQ75KxyFXQdA9iDmwik7oFikkl2/F2uznv8qRbYkd3pAopMuotV?=
 =?us-ascii?Q?MuUple0IwSgvrp1LarKBXqRiw2DYXO+b6skr9GG0KJqoSjXIHgF4I/cWtW/M?=
 =?us-ascii?Q?UYxfmqk4Q1xURZWWrcKEojQH952VE5kFugvrJKXSt43CYwSwZtDAs2ctOe8w?=
 =?us-ascii?Q?e0QXEJSe5pMdr2qGpxE3MBVDyx5z74ey/KYonFVNoAtY6JfNMQYjPDOm/N21?=
 =?us-ascii?Q?OrOxFBu5cNG6CdJOdRa/rysWB+WZOa5zwHv7QWuMnRUmuFW8rbkJ5KvYc/GT?=
 =?us-ascii?Q?GUmvigg3VahWgue8c8M5ScaYyf7eWaD+Df1eTv+OVB7DxJI/dVUz6C09GsbS?=
 =?us-ascii?Q?aUkyGwn1vM/Hr79i8IL4TJu0xZZfl6FOn60PM2HktpW6k3MNftePvNS+w74S?=
 =?us-ascii?Q?R1f3vSkoQ95r82fZDKeKNMcssdRVhXrSMA9YxjdptogS4lpSvZqJGuGzoIAP?=
 =?us-ascii?Q?cuniPkLL7usUKqHBEx4pkT8OFft/BsSEXOSBeTCMN1QYYZD4iD+2YDwi0sKk?=
 =?us-ascii?Q?Ksjp6QtR/aweR9UzHwtlRAjP+YHkrJyMQqHpxIqwff0YAkWKkQ1RMr6yMLQQ?=
 =?us-ascii?Q?qJfskW8+PlHfzUMGajv1KX3ZO7eQilA0FXL9Ak+WXxLjS2+1DAC6wiwDoG33?=
 =?us-ascii?Q?1YQOm/ggnhXE7gBvQpl3OCxd+aZ4KRRUXL2KDj1hNkW3BLzVabE0S88dFXxH?=
 =?us-ascii?Q?fbbe9kuBXJ537XRczFuM+d9JeWd1F4EvmD0Jxt0XIxinbtUwJtLOTnf/lnGU?=
 =?us-ascii?Q?KwGrA5StdQYz3pIeTUPCmH8G+6pUFiCAxO4kwwUJphLRKevZtGLLPm67v0fD?=
 =?us-ascii?Q?2XxenmE5+LoTArfwaKXn2W0L48IGMTz22o2fJWZuQf6EQ+zLEexIGRqS+8k0?=
 =?us-ascii?Q?x7kxQyPQ4BfS7t+OGO4=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:16:38.6517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 449b77d9-f69f-4b16-feed-08de33efc29b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8098

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support.

---
ChangeLogs:
v1->v2:
  - fix dt-binding issues
  - remove delayed work for probing
  - refine dma address traslation
v2->v3:
  - update dt-binding commit title and message
    - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
    - use full sentences for commit message
  - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
  - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
  - "cix,model" to generic "model"
  - change the addr_host_to_hdac bus callback to addr_offset field
v3->v4:
  - describe more for both dt-binding and driver commit message
  - remove __maybe_unused for pm ops
  - fix robot compile warning for 32bit system
    - Forced type conversion for CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET
v4->v5:
  - rename "clock-names", "sysclk" "clk48m" -> "ipg" "per"
  - remove "reset-names" property
  - remove "model" property
  - additionalProperties: false -> unevaluatedProperties: false
  - update the dirver since "reset-names" removed
    - mostly is devm_reset_control_bulk_get_exclusive to devm_reset_control_get
 
Joakim Zhang (3):
  ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
  ALSA: hda/core: add addr_offset field for bus address translation
  ALSA: hda: add CIX IPBLOQ HDA controller support

 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   |  62 +++
 include/sound/hdaudio.h                       |   3 +
 sound/hda/controllers/Kconfig                 |  14 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/cix-ipbloq.c            | 436 ++++++++++++++++++
 sound/hda/core/bus.c                          |   1 +
 sound/hda/core/controller.c                   |  12 +-
 sound/hda/core/stream.c                       |  10 +-
 8 files changed, 529 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

