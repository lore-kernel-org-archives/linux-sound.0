Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB31355C;
	Fri, 30 Jan 2026 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749854; cv=fail; b=mrI50pGM4BB6F4vIE2Dbi4yEZZrFYcC+ovpMY6ZRsKYunYmwtgIBPmQ5XaWn/+dMXcNs52l1qDcqiNOImzmuZnWSf3CeERIKw1EQLb2pTnPxmT+yI6+lxHQHNSPv02XZRZOqqyn2OhwMoRw+kepk1LBSw9IXrimMcVkUFGNRUsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749854; c=relaxed/simple;
	bh=7ZURVIwatqPaLpzY03e8PDw5JjVe66Nx3g9Z+AB4MMg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jIOXJoLd0iSgXQBzcZfjhwvtVrheB+ysX2cUhD7qZDMoagIgKW79tNNO1Mg1A1U0L0gH79D7fnCg7IF5VJ0r6UZzQlefGsXiYheTpz3+b9qh6YoEtoK1xCFS6PH3/xbH7+Jly4XjOLPJGqBkGT+9a3MN/Er5hEyyDl0wHv0iWko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KqD+eCbu; arc=fail smtp.client-ip=40.93.198.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KqD+eCbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEvmRmluwjmBtNtnfLKllX/bIQYkrWh1ZdVcWlfgKy5YiQMmfajCjmYkNAw/ZnvEIsgGGycfDuYrS/tra/6t9kshyAZ+TkhRwpYWMsc5LmqoMAWBJNBr7FVTcObQz/YsJCjEFa+SPo/ERjgs0eJihhfhhvnsUQpL777AAp9SNfLOIQwiE5mWXtdu/6DhL2IEnxZ2zkO2EdwbWHNuMKeWXeCVeGq6Ew3273jtzgAJjGY9W3r9MTwvqTDi4b+ltMjdCpSK7PUxbwkfusB0xbRNqhYeRA9pLnvG1AGHK6LH+lk9m9NRzmJ56rTDwx4m1F28nfpgxml92pwLYbaXpSkldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyyf1qS1lVa1/r9qL513RDyuUsVtF/LOTVIuKgDMR2E=;
 b=aqkjExjEwWTJRRlFEfPc60WISp3DH7nAPzJk8OCfF1NGKiSIXsgc2wTFk3otk+5n6USmzI63l0eeFfbq2vWoYEmgin5otumEOklGenSDznrQznUIGEfsWGS97CSpptb6fqeAiKq0PcXqKDecVTh8rrirZ2Mqqw75smQomm6dG74u+L3qV6MtZ3JeWn4qRG4ZfZUkSucmItOlPtBszIf8j3FTjFa12NXOTVMeihd0czXGo7QloHSzo/JB0AraC3mPLTeF+ceyoZIk25ssIiMpSZgLywtdisA0cX16FmmGr2ABdwJ+hVY0L3u6u8u44LVKsbyYeWyJSxDYSc96JDMqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyyf1qS1lVa1/r9qL513RDyuUsVtF/LOTVIuKgDMR2E=;
 b=KqD+eCbufWk/CODfrX73Bgx+A302/mEndUqd9DFdkKv5gTl+XGZfv3fXPGhistVVJUaIo+78Sw7DXNFCsEU1dlxakH6NwNAEDlUXRx/V0t3YrebaGhN/PZe3nWvgIUDiZUWf8amiYeNDUfRDAjukfB2SydQ6a56Sk5GM3yOyW9o=
Received: from BYAPR06CA0028.namprd06.prod.outlook.com (2603:10b6:a03:d4::41)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 05:10:49 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::e6) by BYAPR06CA0028.outlook.office365.com
 (2603:10b6:a03:d4::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Fri,
 30 Jan 2026 05:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 05:10:48 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 23:10:46 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U5Aktq748608;
	Thu, 29 Jan 2026 23:10:46 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 0/4] ASoC: ti: davinci-mcasp: Add asynchronous mode support for McASP
Date: Thu, 29 Jan 2026 23:10:40 -0600
Message-ID: <20260130051045.1898892-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 366d4983-eb64-4ecb-139e-08de5fbdee5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qMvzzIecsa2lEBwoJe7Txp+pNM0YbQMVL/MAr7wfJMQkNZP1A/+7OhLhA2Gm?=
 =?us-ascii?Q?KhVRu/JxQHaxrqZsCNmO3ELriV2YrLyLWw2h2ZHccgCIhYF/j1HLTZbL4Pyk?=
 =?us-ascii?Q?SZwxNiOHMhXqReOmg4V513qdyeOcllAuyVJGN2kh0ixZR2jmyPCQtAwPdHb2?=
 =?us-ascii?Q?saadx4ED+cXE6gitDSaetSASJRt3WOOZBE0cFnYCLJ3VvysyuL5t95xxPIGZ?=
 =?us-ascii?Q?AlDBThvMA9NuHo3y5HfpktROLQ/R58PZ9n/BFjFdKMgzGDFHEAUlhxYwOGUj?=
 =?us-ascii?Q?Ls+kfFxFG+5QCOEQqnucFFQ8EY/hwKoNKFKwgscnusaKiCYhfGq2iQ27SaeT?=
 =?us-ascii?Q?bMgXXDYB+O0F53f8VTBGVrEn+kuTFimGHhN4wCKACzzIw3DyGo6zugv7PuTw?=
 =?us-ascii?Q?bJpwuSnTuj3AlnEiaX1jBWSjyhrLuYdcVYO7qozVmFyqzZXTQWyGlskOfPv/?=
 =?us-ascii?Q?5/XiaJhXChixrDqGSIaDwcJ1eAn0Nq+xGzYb5qJSNDPnPdg5237zuT3uq89i?=
 =?us-ascii?Q?K66mIuP0+C02K9/zgpAF0gs+yFT1BHFCLM9B0AzdrvM8kxyFUzAWT0ZJbsdQ?=
 =?us-ascii?Q?n2LOxQIbEkXQJ2hegbA9xrYCcM5H4QJLMUlvirEiL24phjCYGU7aU2/aKz2b?=
 =?us-ascii?Q?4nParor5XIBI6Ax7uWI+Ptt9gtwYSi4nbqF+u5qKubzpwGZ9IQR4JHeEp/Ex?=
 =?us-ascii?Q?JrIDZHOL+HG+FZgGf9TknL8pzMIP4Kz09BseHOQZK6txNAr5AcyFCeSXgUlB?=
 =?us-ascii?Q?5UOzsCYNtJjQcyDDtri84jo8TTKTxbpzPuRkGHp+dSWhGf6XQKAdhV5bvI/u?=
 =?us-ascii?Q?Wy+p7R38UIrcQ+Qzv8Gnk9ohUvcMrSm1qxqDUim+VL5hRDzDa9Xrvpst97kX?=
 =?us-ascii?Q?AF2/o4bAjg4mFSNJZj9939bxcnPEzP45fr9G9orRquesgGNIX65uEZ3FzGyJ?=
 =?us-ascii?Q?KwtVvu8ro7TR6NQ4OPdst+BSlw8w1LXMBZg4XtjEWRxYC7hN72bVAD3Nw448?=
 =?us-ascii?Q?v07xZlxFeihrc9huyFmJt9oFm1jW75wyGot3B2bCZGD8I43ubQx9ImHsOLrc?=
 =?us-ascii?Q?xgahdHXyTtabnMRhq6oa+X4o2DlT+vp7QAt3+lTqGApogiLzQtaFsiwCH3Cw?=
 =?us-ascii?Q?IKcP3SUgosF78buSc3OX6uUekQvQZRhCs9k+mufeSD0VxQvtITopffeng0KC?=
 =?us-ascii?Q?qQfYMapokRylPdJ/wEq3WfAjbZBnBzql+KmMmNsKWp0+ldoEpjDHlksLXHnT?=
 =?us-ascii?Q?V9RqeTrdYwkyzWFfaHYjM825pkzZ93GNjARNh/7NeXVqgUob/DWBoE1rZxFu?=
 =?us-ascii?Q?KUgBQVbH/n/4qhEY1vxb2WiniujKxdGDd7B395/eeuA66+2XKQWc/aps+00E?=
 =?us-ascii?Q?c4/C3IXJa0OqaUaudxSOhpTZBhi4X+xJXbcNcA3h/Wy8x4ZpSFQJLHm8qEf/?=
 =?us-ascii?Q?OmpmjDH/owUbgv3jTTSyTuXKpkhoKcj6aS64n4T3l0s2fk37rkKHvhAArWlH?=
 =?us-ascii?Q?a0T91LRBKPtzEUNTRBe87Lzb90mWai/pRyX7Kz1AeVj/zvlXgjD+3/21KcPA?=
 =?us-ascii?Q?1Yo0UDUEWYnyrKyp5hiKOYlZChHn7iUJrkkA4+uVRvfIfPKrVc1cce5p3BsT?=
 =?us-ascii?Q?iw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TWqk0WaWo0lENCu955txBxhsbsRPd5xNuIFVbHKi6uKMZ2X+cDCLbnILDy0vcW0bISrHm6B6QxGI9pb3Qs4ErYdcjeg0TCUXqJQkjtlacSJXdWp+/qmWNcP+vw7R9+q2Gn1s8Vnn4hP1S0LKYdwTo+2JInQHta8UEb9+fgzUO+9OsBHw/3gfrBFEtvcjxD5mFkhXdQQLL1/WYo0dUpLjHRYORmo0fxjOxToaMAy8Uom6/6CQD/Ak1HbBjp5Fe+CVNntZhIMhvYHxbY65GlRGadekO1VS/Q12O3GNTa/kBF+zxN1GluKo0Vppz3WVp7MiGlgVnGwug1ukT6Dy5Kcql2d0HxdV4aRfQRWCZoyz7aPva2g+7Pzjp5vWZxaTZ0w9KsjSoZKjh5cRf4C6ggnVRYGT7SvPCaZHOyq4+r9ROKtqb5tqYO8ItgOpcPD52wps
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:10:48.4201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366d4983-eb64-4ecb-139e-08de5fbdee5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966

This series adds asynchronous mode support to the McASP driver, which
enables independent configuration of bitclocks, frame sync, and audio
configurations between tx(playback) and rx(record). And achieves
simultaneous playback & record using different audio configurations.

It also adds two clean up patches to the McASP driver that disambiguate
and simplifies the logic which avoids the async enhancement from being
too convoluted to review and analyze.

The implementation is based on vendor documentation and patches tested in
both SK-AM62P-LP (sync mode, McASP slave) and AM62D-EVM
(async mode, McASP master, rx & tx has different TDM configs).
Testing verifies async mode functionality while maintaining backward
compatibility with the default sync mode.

Bootlog and Async mode tests on AM62D-EVM: [0]

[0]: https://gist.github.com/SenWang125/f31f9172b186d414695e37c8b9ef127d

Signed-off-by: Sen Wang <sen@ti.com>

Sen Wang (4):
  dt-bindings: sound: davinci-mcasp: Add optional properties for asynchronous mode
  ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
  ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
  ASoC: ti: davinci-mcasp: Add asynchronous mode support

 .../bindings/sound/davinci-mcasp-audio.yaml   |  71 ++-
 include/linux/platform_data/davinci_asp.h     |   3 +-
 sound/soc/ti/davinci-mcasp.c                  | 510 ++++++++++++++----
 sound/soc/ti/davinci-mcasp.h                  |  10 +
 4 files changed, 479 insertions(+), 115 deletions(-)


base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
-- 
2.43.0

