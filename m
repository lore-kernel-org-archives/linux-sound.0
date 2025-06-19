Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022088.outbound.protection.outlook.com [52.101.126.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374514A4E0
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298964; cv=fail; b=baIfXngGOEwTzm92y+he6cKNoQzy6xGFk64ItJLfABEzFZcM5iAH8mKNd0QouKXIaCFH9PFbq5RSDc/BfjUAVVkp4lhKiDUWlYikbEO3MNfzTGBxyU4+qt3yLNE+wGVNSGXyiJdeIv1q5xKa0TGh9JoY+dF48rEokFcunhAWlOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298964; c=relaxed/simple;
	bh=nlJEHGozifai3H/kJKKQWA2QrduyL1NR9lY3UTQybR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pipam6HUEkb/Tg9m3tgFKhiqB4xtbl/87lVombGsrPUoXSkU4eDcJZwVWRrBIDTBeZ5Cu7tzjkgcbQ1Z9OsHXrOA48/W1xEkzsspCaP4q1kMiOqVGuozG429tTU9C663RT7eqsR7DfxrlrMr96CtQ24NUzpp6eHZ0FhGbuoEiQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipaHpFGQHIcGFwq6OY2/V9WBOiucvxAqaAUKMCLeNNEWKnDXvkt8XRIdYbfl3l6kPwGDnMDFPIXD+IIQPJj0CQzdQakzawgurO7xF+WYKbiwW+I2i2K9s/QDeZxMMsJ8P5QgZOUHPmj+YCphLqMAa/EA62vfKcQGH+qHCa+UWGSM1vHSDmYX91cBGoash7hp45JMF6Jb4ilX9hQbURiCqy9SA7mkmZSxgmQCtPYon8gDLii6NO4VdSiaVEZHQz4befAUXwRnggBFlDi3nPNm3qWvnXu7oPLzCEmNsNf9tctccj2DFxnGpZA70RIdkQ7JrgYusIlw8Pr5zzNeiL+Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjmwPcKrVdchVGfXyBd+6ukOE1RnArf+DMp8HwqYJhY=;
 b=lJyyngEMUWdGOAa5BUpvaHQ64RrtbduOryM+6OwN11rqriBl7HqgmYWsR1vcB5IoCrpRItoKmwV+Vkzz81GHJvqOqygyH+MYfc6XErzmJRIMaXgYWKJUIRn8CEJ/KESnI3q5g8n5i7yaMT1yFyW5nIfe7jsDr1nxQCEQdnwtWIdL7Xv91wukV16nT4gbNiAw38ChlSz5VDxwaqf7Cn1AnmrxcoEeFjjFUhQnYx/Rr0tlfqMUztLKQj0i+m7jI/J5d+7wok5zFZkDdSuQxoiFQVVP4zqZ/ohH83iK/oM6FMREbYK9F1ZK3+N/SWBieCEWR0+lr+qT76FJ469hzZQMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canonical.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0025.apcprd02.prod.outlook.com (2603:1096:3:18::13) by
 TYZPR06MB6499.apcprd06.prod.outlook.com (2603:1096:400:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Thu, 19 Jun 2025 02:09:18 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::f3) by SG2PR02CA0025.outlook.office365.com
 (2603:1096:3:18::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 19 Jun 2025 02:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 02:09:17 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BBE8140A5A01;
	Thu, 19 Jun 2025 10:09:12 +0800 (CST)
From: joakim.zhang@cixtech.com
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 0/4] ALSA: hda: jack detect fixes
Date: Thu, 19 Jun 2025 10:08:40 +0800
Message-ID: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|TYZPR06MB6499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0f28224-8996-4d98-fda8-08ddaed64ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aoFlySInvwz9xku88sEuVXmxGODSPG/EvIe4OXfr7ULco8kNK6qcJv8C0iMK?=
 =?us-ascii?Q?4Aq6KrVMWs3UO9T9H2C+pjZ96EsFXVGYO9KN+67ef/GD2kxWbQiFGW1NWnoh?=
 =?us-ascii?Q?QjI4Q6rIy96XccWRSAbL7SEKLl6fO9GS6xNQMOUjZ4bKVDFTmyvjopP5IdHT?=
 =?us-ascii?Q?8x1dqgg+MM/qII4yJyx6eW6vybqefebKuxyPyeVqnVwPFdriTpEAEFxDzorb?=
 =?us-ascii?Q?0LaYSie0yFpnD4wF3A5+/paZZupDmbrsr+z9kLPPunotIP18XUtuRicrmgyN?=
 =?us-ascii?Q?PzkLH3kn3qwRzjUFwwvWYAZfDQJfAUAuvS/cFl4AjooKrp1S5v9VgQ31248e?=
 =?us-ascii?Q?WgYNfjavUoaC6uqZSdFA36BMdoTGuBPF7ybYbdpUnTOtqQc18rI55a1XAvGI?=
 =?us-ascii?Q?4xSdMoXFttFxez3UwEhbP+OA6LO1ATxD5vxlXvII3aG93wqA59/TNtgg8HmA?=
 =?us-ascii?Q?wPj2XzpsyFh/dyqGpwc0t6hZT6EnTQmOtnPUkKjg14G/SAq5mLrYCiHkFYoD?=
 =?us-ascii?Q?BFV5sHIFMygqE59PfVr6AhyUdwjyYoBHNU45ly/n3VlZyMbQ8D7YhLJ/+oyB?=
 =?us-ascii?Q?/wXJiFHZrrdAZsIgbgDAt7UekYK3AsEYf9Crjmv5czSqe6fCuVS6I2NZaZto?=
 =?us-ascii?Q?UYLrvmSFG8KeVOSTV7/pEaGzklfEpNc5CDfjHh4cMW8T4497TGHgaXW6GLdm?=
 =?us-ascii?Q?XgKpr1+7GZReMgOQrHFK8hrBTbgb0xqm58IcNQD6taQiceNOU8OJobduBkz9?=
 =?us-ascii?Q?9PzpUkmPnZpTypl+jQ16A5A8wFwsIFT3SyAfYTNH5/HvX0B3bgdyj7ZdRCva?=
 =?us-ascii?Q?PXcVmRkRvMM2+tQtz7hoGUjqy8yV17bmGWF6SMYqQDMriPUxYiFgl1bOrm7k?=
 =?us-ascii?Q?n5F4nb/x73Az1u4O29v1PMznMk52hLhLFA4mfh3V81NLR/4y4Ls+yds3+iBC?=
 =?us-ascii?Q?XSZwyfnB0OFm3aDd5a3PGBdIK1PNoWHLGZW7nIDgrh+PexnEDUH9EpxYIWfG?=
 =?us-ascii?Q?vgSPiQYt8xW3qZuZOSoH0+8dCnc5JStgpQ6T9u7i2R/Qv7P7hAVcXPUTQaTU?=
 =?us-ascii?Q?a+On/5/lVe6+/4zR9nCbSF7KPYfMe8rAM72P+E+2Y8yc1vVscBvqsINaAuBR?=
 =?us-ascii?Q?wk60YgXkmZpjQTGOK9fniSuM2UsiiaMEXI7v9WjZaM+60MXGt6Nbc3lkSBZv?=
 =?us-ascii?Q?osQ5m2K8feDa49ftiPxyZkpVJMP0gNlcQaFF/aeQXRZCS78fwVVqmy0mSSa/?=
 =?us-ascii?Q?tyb8MOCs5caqQdtvrPsrBLF79rMfPKEb62x0y4R65oDx4DiZv4SV7fDf5iVe?=
 =?us-ascii?Q?0+KBZjVA+szGjlz1y1samTZMkpnRI3DX/wKwzR6LRHzo39a9Lbu3n4cwHA5n?=
 =?us-ascii?Q?r7tVrZMA+N9CDUeQrMtAG+LHM8c/F5vYk+LxBBR35AAM71USAxPUGdMGv7Vb?=
 =?us-ascii?Q?pWpZeG0DfeXntwFk7SWI/oBZo/MaQcBw4v6bU9e/2eHIhEoR/VejpE+i57o0?=
 =?us-ascii?Q?Ui7t729GHCYiPF/NVyA2ziGn/c5URQZgHpH8?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:09:17.0264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f28224-8996-4d98-fda8-08ddaed64ba5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6499

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - fixes for hda jack detection with polling mode

Joakim Zhang (4):
  ALSA: hda: fix controller cannot suspend when codec using jackpoll
  ALSA: hda: add no_pin_sense_update flag for jack detection
  ALSA: hda: disable jackpoll_in_suspend when system shutdown
  ALSA: hda/realtek: fix mic jack detect failed on alc256

 include/sound/hda_codec.h     |  1 +
 sound/pci/hda/hda_codec.c     |  3 +++
 sound/pci/hda/hda_generic.c   | 11 +++++++++--
 sound/pci/hda/hda_jack.c      |  2 +-
 sound/pci/hda/patch_realtek.c |  2 ++
 5 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.49.0

