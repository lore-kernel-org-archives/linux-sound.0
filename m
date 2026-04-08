Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549F274670;
	Wed,  8 Apr 2026 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626321; cv=fail; b=jEYJY7+3nSEaUxdE24T46nhdZU89KHYtb79nVqTvsb9RqDsfcWDmciIoeXxo3kSFVKCrcgqBqdCx3qdJ6xU6Bs80OTEgG8iRgZeKVQtHl+J5rp3IMwMR6JWaOVxQS5fzIMVj3a29CKimGWi4ZFe/pOILN35Y3vUzZFhIFHu0TAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626321; c=relaxed/simple;
	bh=/+oF2gRGYv49tlBu9tUbiQkzm1vgaTD8yt0gctW/K18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fHw8HyAdjnOhbZU+Oq7MHQb5cQnr4Kfe/NscuQqSkHB+XsTedXm16RAqwQmQnhSDwAHjWADke1738bn36L6AUyPiFseNrtJIBX4dwSeVpIxuzmYHVV33BwWmXRhjzmtg+0V/qpiW5JDRRD73Wwhj3VqjXkvZxnwNDuXAi7XoPTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oqSDJHbE; arc=fail smtp.client-ip=52.101.61.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oqSDJHbE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn35S+8H0PXzBM3wEE351s7FycNR48wrpmrUa1iFWG0h4+3BUUgUbjnaAueF5jI9VkvbdzTPfVXEb4iNbuq2W+s9ydZCNAaeLLxLPus/i5J8oYRTa2PZPKLGAIKHHG1J3bBAX6if68rgaFxVzmnRV19WlMxZspz+DzqGSlJSDRz62QbP+hDOBsfwjgwxvazMWbIi/BCdLvfdPBPSL3uI30Z6oKh2TV1o+OEpFzbkO3wDlhbnF3JG2s6VOewUiseMLiXkBAyLGRTYMfCb2VMS2X4jIwnojdi3LW151I98oJrCgGgnWFyCD9nIJtwsc41et83hpNSR2GYHtAsVpfMkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0rk9Z8eu4WKXmhzsAgnSFlFtW6GO6QHs+/Kewf16jQ=;
 b=jU/xsM7ND9SStzTZj/Sv7MGBV9mS/M2GOvbWhQ+jWB/K1XTQlas7Sc30J8TV4q/jDKUk7xU3IYTXbP1kj08UIp2w4yuuTkeBE/PsJQ07zFCX7VaVGmWzyrvFO4+qNFBAGR7aSKQbO/Xla4Kqe0ChQ8XwiJljhqUkHyojA9drXqpetYmSfb94CcSqt912h7wMC76PghxToIRcJuxURpzLvcknbkl+T01LZ66108H9iXWhKwJH6oy+cOUylObkvh//WA3VTsj58s/VZ+R34FN+WaX/V94y12tnZuKeDa99a6CArAcyWW3V9EobXemAP09qhvHkJ1SReXhesFa4uVdBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0rk9Z8eu4WKXmhzsAgnSFlFtW6GO6QHs+/Kewf16jQ=;
 b=oqSDJHbEwPGPu4A/0StwVBbyR4nVa7qBnN9urcnwDutWq0+gOOobJlpw/WNYDaHJW1p60pDlYvsO/zetBYWyPEU2NyNtoDveP11AbpvjdhRbDHvHVAP+jYalTIWOpMNews1buet/woMemdSfw0XjO74ha/KOKvsMu1qZrxoqEw8=
Received: from MN2PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:c0::19)
 by LV3PR10MB7963.namprd10.prod.outlook.com (2603:10b6:408:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 05:31:57 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::e3) by MN2PR05CA0006.outlook.office365.com
 (2603:10b6:208:c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 05:31:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 05:31:56 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:54 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 00:31:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 00:31:54 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6385Vsos1351837;
	Wed, 8 Apr 2026 00:31:54 -0500
From: Sen Wang <sen@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>, <sen@ti.com>
Subject: [PATCH v4 0/4] ASoC: Add TAS67524 quad-channel Class-D amplifier driver
Date: Wed, 8 Apr 2026 00:31:44 -0500
Message-ID: <20260408053149.1369350-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|LV3PR10MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: b1139b36-d354-4fe8-d7fa-08de95302678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wlnhXAQX3yZLkUNHd0JYEywVoU4dLVibEtZfkty883uCCsAAvThJvgxuZeP9Fb7s0/yajo7lWeFFPd8Cs8xmro6V+QkjpsQ7a+eY26rkXiluqeecwlgW0ILVe7bLBN8OK0TXH1PEIcTX9YsM9voH1yUDBT++2RqdzQXIWOMhBBxoIzc7EAqnn5+3AYLTfrF+T1D3ouuzcMlw2ooPTjQj31eDA6+Jc8oefx84KXcy+uzoFhZqKFckYomgqkxcvUnKBXeIwQcSJh0KsWGEKuBD5r9mX91sUb9+LNTNkLKLrv4ToD89idrgBfAd44bqg6R/YuaFLusWlMLmkJU7fFAEIfkPG04t1V1YnJuk+ZApk69oJDR/5tJnA8yOEqXC6MdzcMbo0OHkQE35R8rOOafIiag38Y8xUvT7bF7iR9R9gAEyZHjHTGaaoFF06OMcwNVecRewN20bZxcZhIMe4/QG6BEeTP1nSBG58fasLT9aNZjfIWkIeWHJG3VmJpKWsbnIs3ZsxerD5uYVLVJV3qGYhc/8Zu6FPjTw+gAWB8wYRHBWPA7ydmHBI5TlId/moKq7GHuUrdMvS4Dlx+08jqu66tcvp7vfQly0DWrTXxXHpDPGxPenljufjdZmSeDIir7B1px1xBW0qXBt/XsDDyV4bt1cbscsDrkbMgv86tOGZF4aNVrra6xvz7whlSOmR9KKIR16fNhU7joYeOZtX3xw58+2FKDUp2mGlJkPG6REMAuKL1Tr7BdPBGTnhGZm0ijdt1c2qmHHRad/zTWm3VGGkeCcu1DApd6JOPg/QsO0b2g=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F+Qu9oD8bD/fUYajL/73TlaqH9I1tEHDzvgo3vQV2l35ijT98D422Tfwtc8TZxnQik5PCpq6kjgMoj1rJFiu1KK1fDCvfPjzEVax6+zBE/7AX1uFsCeHGlBWrYW9S3TkxUiNNdeC2o1GIglkoNsIbSixb06p9QQymPB0UK0W+0b65zryPcwM2F+aYkknX2WDwWUBCjWTSbAxIh7mI2G6TkSDXBFYDaURtc/QFDPkPZ2xZ+YyW/z4fKUur6i7Y76P8cKQerBiV4NVThQG/cvt5CM/JjRQvIpR2IfpSQOyZTa+ISF3afgd3CEhfvynXyUCgQ4dF4SedbuGiJ3gg9kUkic52sb+KAglLfebIqDMAf9jSuUvVRgr6t0lAjjtYv1vDf3xYXvtHvzYfKIsVZ6Br3B9ZxvL+9U5LFlbhyFGgj5xjkFFwqWGXuCE8wzLIFAR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:31:56.8393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1139b36-d354-4fe8-d7fa-08de95302678
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7963

This series adds support for the TI TAS675x (TAS6754, TAS67524)
quad-channel automotive Class-D amplifiers. The devices have an
integrated DSP and load diagnostics, and are controlled over I2C.

Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
entry.

Tested on AM62D-EVM with a TAS67CD-AEC daughter card. For setup &
test procedures, refer to the GitHub repository.

GitHub: https://github.com/SenWang125/tas67-linux

Changes in v4:
 - Corrected dt-binding compatibles (1/4)
 - Reverted v3's change and made tas67524.c back to tas675x.c (2/4)
 - Links to v3: https://lore.kernel.org/all/20260403050627.635591-1-sen@ti.com/

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

 .../bindings/sound/ti,tas67524.yaml           |  280 +++
 Documentation/sound/codecs/index.rst          |    1 +
 Documentation/sound/codecs/tas675x.rst        |  686 ++++++
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas675x.c                    | 2172 +++++++++++++++++
 sound/soc/codecs/tas675x.h                    |  367 +++
 8 files changed, 3523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h

-- 
2.43.0

