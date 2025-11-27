Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022097.outbound.protection.outlook.com [40.107.75.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DB322524;
	Thu, 27 Nov 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236599; cv=fail; b=CrpWP390b0D3clC6oLGotURJF7Co6vYMMmw+My3TVRC1omRcadCMTTADvtBtXbSxf2eRLI+1KxvttzyjTO4+HPL2EDpjcOIJDISho//X/d6DFqoq+0/6LMP2HZ2LwLMa4ALKcK6uMKx+yi3lg2H7CfJeAUoWN3sGcMEygKluGjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236599; c=relaxed/simple;
	bh=EUzfdqrDDX26jK5OunYWlPnIJ8UAZffueY4QFfEPylQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bJSfREAseQjc5JJVl5W+1Rv5pDOL5BASMEYAwVl7yjbVf6tmIAORFA1adgw8Wp7/MQOoEJM1d5px0NY0rOuOIL5GTLuxO9O3G36q+yPFSbbhJ6RgwD8PV6AQg6myKYrir0M1KPTuZcsPz6cP8mRLEsewckx/e2KftWkFmg6GQtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujjvTQEWHJwXNXahsA+jaDYbdkXuqEHu6LzJ8ww9W3Q/gHwk3+3iwhGpiLjEWVB97LCIUdqaxoJHnZnMOkFmP7zePQz9F7yGNODfU0NjyB6tDRKHNTBN/dPzqHdTjDVP6EWP8HQSshjpxHp0//ZqbshPxdoXRHrazu5kHd/5jVfgMDVQjgqzssc+XWnIhYcaJk+Gn8Z/BWwJlQ9m0hpaTuIfuW6P3IkKkZoKI/6HhtPqgE+Tkky31dIf6r3USrAPJLOL4CoyzmHUhNBtkaFQzwj1TdfVLOose+1iQ4oVcPdLgf4CCrl/LHEq5EPHHfHZsxWWGy4EWW48i2SSAP8NhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVqFcXmFp0WQaKE+R7XWQOubm+NAvWQt2BB+IluGfY4=;
 b=RDis0W4ZTgSZyxCTmSoXK4OBDnbDysZYFefeoEc/fjk0ES9xuyYE/SDUhLU8cB6WjNSOPNYKcv3uJz8WufostIgUDAzLgjuQoVm/Abin+3AXL+AOSrXdkKa0gIPcwnROPdeuiqc7CO21GPB8Kanl5UO0pY6drCyEsnAJvUy4fd+uVlIp2Xr9uvtIpalLxe3J0sncWs45VkHzVVPAynA2769mMe1epuwTW7CJ/g3n2vh6jR5zrMwOWhVOSjYCmZTRSiAynmUT5rw2+xc+mvdXCrVzZqUcNUUeubIIrA9qBU8Nw2o55DQFsdVW/owvD+yuAisuenR70SvRQG1VPBplsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c8::11)
 by SG2PR06MB5131.apcprd06.prod.outlook.com (2603:1096:4:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 09:43:11 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:3c8:cafe::3b) by TYCP286CA0293.outlook.office365.com
 (2603:1096:400:3c8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 09:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:43:10 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5C5F940A5BD7;
	Thu, 27 Nov 2025 17:43:09 +0800 (CST)
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
Subject: [PATCH v2 0/4] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Thu, 27 Nov 2025 17:42:57 +0800
Message-ID: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SG2PR06MB5131:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 014343bc-a436-4046-24cc-08de2d99607e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?amTOUy278amTkOQaY+FpPe7Uu3lgi4bBCRgQ1jidBaYbqBl8XoGbu+rfT/IV?=
 =?us-ascii?Q?bStplDeDY9Ut40OUIbmFrj5x4D04QwfRwLEusohrSTF1bvVxqvq57W4DtSN1?=
 =?us-ascii?Q?qkWqP4BS44xOgfgihEZkGu8VV+YIXSXIaL8AoYTOzkvlQYwv8K9YTN8vqNBi?=
 =?us-ascii?Q?kzmu7QoHJyM2bShp1aSce1ZprUE883baluSH3/ewvEXnLuerk2Wj+mtqvuw1?=
 =?us-ascii?Q?Fz2m81y86ShTivE/YTAtDYz1ekns/trMYyp37pOjURgBH4l/y/C/jXaFBJ5S?=
 =?us-ascii?Q?tBhLp000L2igkCMbyXUl6QKZL1V6kbHxn2+kDhLeXy7HjoM73nktefHBdrCZ?=
 =?us-ascii?Q?by5B1irvobLtSOmjBXvctwJpSC8bKY1xTMdC1fe9oxYUmP0bzxNsE3rNFndS?=
 =?us-ascii?Q?k1rIVBl7b341Yf4OkcIrMUMf02eecDGGIxr1eXrLd6KCyeYiJQh5N0yaGH+t?=
 =?us-ascii?Q?q7/X6RwDalkzuiR6WEPv4xftJCF9V5p805xXbvnSx4siqIQK62RECsr/srrg?=
 =?us-ascii?Q?JEkDPgl2HBG8SDb2T6j5sHSyExhd25sHQytf0O6W9Zl4mDRPgwTqHdjwB6Jt?=
 =?us-ascii?Q?0X1V7leCrgosbNZP4sm4Dx8+543igBQloUR6Pr3PnklotbwbRi9AQRmE/nM7?=
 =?us-ascii?Q?KcI+5oj3buThMVlT0YIsVnGHU7G1K8HnRlNnCoi8fAweRs/3f0cr996qB1SD?=
 =?us-ascii?Q?UvSaQHNSC8fxohOAYtTSRTzkzi3lECgg38Kc/kY0UQIXgJve/POagH9ferTC?=
 =?us-ascii?Q?4ncGZ8DgAgiovrJCPv7B5imQKHPI8am8IRpGPhl//+fi/DtAR6mKEEcT5kEy?=
 =?us-ascii?Q?90mYD3wwLMta5ETiVD//hNhn6Ff+6ZCPAJAIxeuCdim6ym9fXCtWcmZ0YsTA?=
 =?us-ascii?Q?L++vTPFjFm4W9r9u2DR7pi1bgMyBa+i/EX1wt2oVGEhs6NtOCAbtRoRuCCBK?=
 =?us-ascii?Q?FN0wdF2oPHIWSfRigH3b8Dp99PGgFOqB+5Fslz+X69DbQrspgQHiXlz+/xUw?=
 =?us-ascii?Q?xMZw8kBcAy0O6a7MzSl4mARuGfiyb4GCorCR5qptYJf59VCgE+bJqKS7A0aN?=
 =?us-ascii?Q?RCbcPmo2rYS00/L/lpEMunT0cOlk7ntpcMjpOErEJFUWuytqSotQcBgLcR1a?=
 =?us-ascii?Q?b1GGit/mMRCppW9iKyG2GNf2dK5kdVxyMujZO9NrDulgMttqitXHLBjoUx5h?=
 =?us-ascii?Q?cSukLJCLKtUGogek/RYKZVLurk3HRDE889fHJPTFyTOzu8QS8ivjOufQdyfZ?=
 =?us-ascii?Q?hgMUWho66A03nMadAvxWizFjjtv+D2ocHzvkaEc08zF7b5umoWbyDz/zM5Xa?=
 =?us-ascii?Q?KQGG7TZ5hY9OVB+qdp5C5UzbAD4pd4YZKKM/v+TNu9eJUAhV/husYJKN/n7x?=
 =?us-ascii?Q?6V41tFFiibpKpf00hOR+2cI2ECvLRRkZA+ZOfbMJ/HTKuBEt9yscKGQWddyW?=
 =?us-ascii?Q?6te500rUNLcHp8d4MLxs/mCx5oZ4495+zvnu3+KTn7W3VSx5Ygo+GnV4Gt1A?=
 =?us-ascii?Q?BXqc+a1un1bypQ8Cdi7JzYPFDw6QhzpwtzN5XZ48KVKUVPUr/Lpc92WFzI3a?=
 =?us-ascii?Q?UNPtrBJAaj4K65jZidQ=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:43:10.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 014343bc-a436-4046-24cc-08de2d99607e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5131

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - add CIX IPBLOQ HDA controller support

--
ChangeLogs:
v1->v2:
  - fix dt-binding issues
  - remove delayed work for probing
  - refine dma address traslation

Joakim Zhang (4):
  ASoC: dt-bindings: add CIX IPBLOQ HDA controller support
  ALSA: hda: core: add bus ops for dma address translation
  ALSA: hda: controller: specifyhdac bus ops from azx_bus_init()
  ALSA: hda: add CIX IPBLOQ HDA controller support

 .../bindings/sound/cix,ipbloq-hda.yaml        |  71 +++
 include/sound/hdaudio.h                       |   4 +
 sound/hda/common/controller.c                 |  17 +-
 sound/hda/common/hda_controller.h             |   6 +-
 sound/hda/controllers/Kconfig                 |  14 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/acpi.c                  |   2 +-
 sound/hda/controllers/cix-ipbloq.c            | 452 ++++++++++++++++++
 sound/hda/controllers/intel.c                 |   2 +-
 sound/hda/controllers/tegra.c                 |   2 +-
 sound/hda/core/bus.c                          |  17 +
 sound/hda/core/controller.c                   |  18 +-
 sound/hda/core/stream.c                       |  11 +-
 13 files changed, 599 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

