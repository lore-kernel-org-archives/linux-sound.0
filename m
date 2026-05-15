Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB03E008D;
	Fri, 15 May 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861698; cv=fail; b=itZkyehdPVMRkxOoWJ3CG8N7EuruQW9s63IJEKl2PAXqyPGPFsPMwk0Wfh50D6hIkYUu6VZvCEHeoNVYbGJ2Q+C1H+BLQt6nH4mhxIPROYLAgdN3PLZno3POnId9oP2+mYdIvJpS2wO7Ysz3c0D2x6yCTZcnEk/KNx4qWx9DkDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861698; c=relaxed/simple;
	bh=ooApIbW2C3Hp097nyAruDRRAHb7Q8tjFgAlprofNe4o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K1jXw4gBFbGppD0yy5aACUXUzoK+sNsimwu8JgpoK4bXwUqSuMLPolzgRKlSkMixdlUdDRL3srkOIBSyV2PBx5sb8ZGPMXnJG90UNumYbzMTWqZmmiwAya2HZkJ1xn3GtnaE/umGpr2bRG688gbPD8PUMi0ftg5G/NLiJrYbsKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gn6ebXhw; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gn6ebXhw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmK+lGWEvyptCEo3AcIOZY6WqDiBYMaaEoDGZusCAgpaiew25soHuT8pP+L0u0vSaJkd5ObKFWnikQEvchOk+PL4jy3AH53v2qGYIfguAvg45GMtkN9AtTeBGtzyo6mEQ5pvVjXLZshXMq9SPiVr2+VVmjk5OntDy9bpWcThCUiKxPGrUxFYbsT83MH9evx9XElp+ZUXM+4qD6uEUK5YviNuHbc9zrAKzUZVEeHOnGcIi6dtNN/5pPrg1CcZaqv9QEXhJ2Mpi48Ju77YhbDlnTSw5LgCqBxN7C+7KZwYJkdZiBMz11eQ9/Efft4yQR9vN6nJ+Hh5uoQ/G7Xf1nGQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejyZlKoAQZjWbo6p1Y/WK3kqZuY29/BLs8aqDJCETak=;
 b=oDGpbCFhbo8t9Ve+xD9tpOajIP8mXJ5NdjL3UzHSphP1648n7QMTwXUd9bDAyr4RoFOT307RP/GazobL7ctMiVT5x0QSrdkq6zXVW8E8VreGbs7ybkBjIA8/8kIRJkUZFZjWXs8xNFYsJiEjFSjwWwvy9b5rRU2dAew6tsi7CQC3ODDNeZnW3zlNWmB0NdmSqFEMBR+zrFqagYfR5V+fBY4AsduCCyxBGUzrFrb+ZWE85SswTmt0hRO7n20zyjFkxOoTv+Bu8oxqYXPw0dojm0Q59/XvE7RMg1qoXXG3zbQrGLtTVwSm5LPV1H5Ja5ZMUbNWt1IBEZSS21bFnxnl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejyZlKoAQZjWbo6p1Y/WK3kqZuY29/BLs8aqDJCETak=;
 b=gn6ebXhwiJNRgE+aRtV8InQpz32c4g3mSHNpzzwMHX1+rTdCT0n79I5xW1Um2zkUbRcpYMLTvDwLVE47Nj9o7EBEVnVg+4MZo2cO1RaBiq05UW26frylMpPKHuryoXzg76VML/4K5QJ8ikEKnjNoQ75N3TgpLtvaipTqRg+Lraw=
Received: from PH7P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::13)
 by IA0PR10MB7546.namprd10.prod.outlook.com (2603:10b6:208:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 16:14:54 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::3f) by PH7P223CA0013.outlook.office365.com
 (2603:10b6:510:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 16:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 16:14:53 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 11:14:53 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FGEroA023480;
	Fri, 15 May 2026 11:14:53 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 0/2] ASoC: simple-card-utils: support system-clock-id DT property
Date: Fri, 15 May 2026 11:13:56 -0500
Message-ID: <20260515161358.1462453-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|IA0PR10MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: f12cc27f-a9bb-4301-d311-08deb29d1955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BZIaYs1t32qPMckPPWtrgsmLFmsOAFrrKGHGMtsFZ9ouNijlahusEdttKFbjh56Ye4X+ECd6hbeYZll9MCXEFHi6EDAlmiXVYn17INZ7k9UAfLUOoWUg6ilVAs/HUhI5USOoSzpMVvm5n0UnvC5gPrvTE7TEAxtg6VBys7rvV7Y+UUw2VKOERLxs+flfd9a9YYYiSvauDdRL6WJcLN9gLsZFbHy1+Yr1BIrgVyRqKiFN3twuNwBZwLPCDugFhaaiZhuxMJXv1dcPQklzJP8WK9KjBvmzGD24nA+gbXpSZpmrbBcyCcl1veZ1B6NVb7y0vi2/8yCeyHztYA0Ug42QApSZBQ7s8eEWNPEexgEICzxj0TRVPwRobVXe8hHiiVt4hwb8OJVQPL4iyCaBVQijsmzz+yQiLZ0BWK8FaVYJShMdt/cjYyeSTgmFBRRgDDDckWLMZXbtmROEYCRWXcaB9smH1kSnofb1JwKhlae7hFrXw2hJkJw7JN5n/2+INzhMlimPl9XLdqjcQMYXQkg8UjL2RmVjoK5XO4vHXSIBT9ydIltZ5l63gebgeJCbUWFRMl6txCjhpHVlhYbJwHQdvm9RaYkfj5OCAboJY04vs6zTB3aRCCZnegiI6VeMvmZhEWfOYdcFXto+p2ErlNmBE63i37AJz6p8yzJKsZG7NN3f8ZI1a1tpjZfNcc0+w480Fs+svM8mR57rxeM1no8unqsnnS0Z4fMp7J1mCcNmnlA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/FTomsJ7a1l1GLiO4eyISfU0AIHs+TnmGDM6uZEAI+GGxZRp9n32fSt8go24pP8xvTIP8N1ArUkAiIQStKofqGtAqj9NJXtoR8NbE0ewr4zyl9mcqvD4NdvxVr10agVF1TQnS53cZuSkFWr04c1yp4c/AX4tByssfWC0b1Qvlo9kpVRZl7v7NzgpH+7cq/aJhYjIkZhOxENsUuOosoUhiasXLFhAK4yQkCkw2ja98QskJi725FbsjIPe7GfFpeAC0KcPQQvkes6/jEuFUf2lfr1NcqweEDyrM+vl6GX/Ky3+WdMfWZltxAc2sqCVAXBKdcdbphgYtCt5r7EBidQxh4Zijd/FI/iegJci9LicNBdSeDPSlnMVIj9D0eQ+RKFvzULM+1lhjq0ALLUkvEeb0Y9zNo+zUZWFkYoTzXf6Dir8NeLWeKZAtCzLsBC/1cYm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:14:53.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12cc27f-a9bb-4301-d311-08deb29d1955
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7546

Adding an optional, u32 system-clock-id DT property into the generic machine
driver so clocking topology info can be exposed in DT.

Sen Wang (2):
  dt-bindings: sound: simple-card: add system-clock-id property
  ASoC: simple-card-utils: support system-clock-id DT property

 Documentation/devicetree/bindings/sound/audio-graph-port.yaml |  2 +
 Documentation/devicetree/bindings/sound/simple-card.yaml      | 10 +++++++
 include/sound/simple_card_utils.h                              |  1 +
 sound/soc/generic/simple-card-utils.c                         | 13 +++++----
 4 files changed, 21 insertions(+), 5 deletions(-)

---
base-commit: f5ffe03e0678 (linux-next)
