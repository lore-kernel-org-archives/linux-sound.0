Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B143AA6;
	Tue,  3 Feb 2026 00:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079150; cv=fail; b=Ve9U++YuC9flURluZnOBOLgDdpsAE3wvn2C35l2SeQ6IgpiNI74AgFkMlxdhXxLm5dtxU30GAJ/3N4GZEA4bKKkjN5pueIoU8Tb9W6ZCKfeKKUVAeXEf8gyTeMJ85DhTQQy2vg/EyMmXeIZzFi5XaiPACHklW7+6287LriRPoX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079150; c=relaxed/simple;
	bh=Mcqjg2DxWCsi8ZufL2GV1qfBonuZWziv4S+fkeusJ/4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dqzLn8YZl0LD0rhomqPUdFSROfNp+2FZ860amk+WnvSfJD8mSXZP7zaW4no/4353QZM97gDtRenaYISLiBu0qslucXj4ackwyLQa8AVupLYpoUP8qwWDSHsf4gGAv5GqIm+sYjbc+Z7Jv/xwwT7uYZ38HJRtEkIEkr/+IOg8q4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OWPKsdPX; arc=fail smtp.client-ip=52.101.193.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OWPKsdPX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ70EOUxeaJq6i+C2AdfPxnZZr7ZJIGBefwS4ecKiqnYd+H/dDQKBQFTlArhWYuy8Q88sC1Dxwx6e6XnXd8LhG+w33twoR6PmiLpGjwVBtxpo9z3Ieogwwu8K0q8ak9psNE1ZvYwsu3Bn3galXaA0r8kMUNNIeGHNVPdj3QgooC946uVwXmuNmgNim+n4uLZPx4/KSqtpFc04nP76pMRHFJtsdJkUFriAd4j4PYL/4idI4fEmVVg5EOyX9essemdUaLWO1PKhqnyB12IkR2vnTLhO1GiKxPL6zUaisCqTDZ7CG71va8vKXLbAEaV/NhIbRobB45eqp8ZFTydCN9CAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht3cgbuDSCcbreqGYa3kf4Upxr0hhuKDEt87Z9J5SgA=;
 b=vFx+75d5+gs00Y6lRI7ITfnlTr7x4fELYTrTxXeknNktu+v2fopIvdeMxizmLGmCW2w3NmCvDRbuKJ9gzMW8aTRmmJAPao9/dQvXGKRKWwKUlPVfHjAX0eDpUgJv/SYvoYHWzWKstEENCIB+HSzQWILIE1wCcEt9fNXADc0+vkWxBxM+5kLIUrHfg1Q1TR8VQrCfeZ3KItMDCeJkb2GdD3x9EF4MhbsE/LDAbSFyaUDC5sj1Yn0n/Bqksg7J9ug9aGnl+P4Nsx4wCJcm8D9Od8c69MkwE/w3FnCUn5MCWuXf9B441fIaAf4S9qYL2Vb+iXyb0CJ+rPYLa/tR3dHOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht3cgbuDSCcbreqGYa3kf4Upxr0hhuKDEt87Z9J5SgA=;
 b=OWPKsdPX/l6Qv7W7UrkCA4GEHh9Bentrqjx8HL+MafnZhmhaIQFfx81DkVcwJ4QOpw/WbxY6glIJPmy/GJNM+ElmcCVc17tLRgi0jnYfVNSlTYbXaiyfKydyq0qJglndGUuMvE1I1XuF4q4ROtNJ6Fs5MF62vujXW2E43RiiZXU=
Received: from SJ0PR13CA0200.namprd13.prod.outlook.com (2603:10b6:a03:2c3::25)
 by SA1PR10MB6416.namprd10.prod.outlook.com (2603:10b6:806:25b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 00:39:05 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::71) by SJ0PR13CA0200.outlook.office365.com
 (2603:10b6:a03:2c3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 00:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 00:39:04 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:04 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 18:39:04 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6130d48e2625623;
	Mon, 2 Feb 2026 18:39:04 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 0/4] ASoC: ti: davinci-mcasp: Add asynchronous mode support for McASP
Date: Mon, 2 Feb 2026 18:36:59 -0600
Message-ID: <20260203003703.2334443-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR10MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 58398b19-8199-4085-ef11-08de62bca260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9IzBJYxDMF0MkYpGQRFCEI1ayaduEcPNYMQZ+wG5B4rH6aWwaDQo5isvrgwP?=
 =?us-ascii?Q?6IokbjMB8GjrFPST3xaOFHl5juTrsOuVF4QgCtIkDlx4k8vbYDx3yhpdyH2x?=
 =?us-ascii?Q?feq4mjwl/H7unU1ehYmmyt85iAnGzNZzWkqMQownAGOSoJCX25HylLweuG8u?=
 =?us-ascii?Q?szo9u16tR98qhurB1KCAwUXuCpADmZ+4LLMTIH3kjo9n7jLGtCxM2Y8MA+20?=
 =?us-ascii?Q?lhVdAcqMO2/6D0Ds87ToWGY1KgbL++Tm8EHgRgbMo1REN7iWXVdwYcFYcjdK?=
 =?us-ascii?Q?/ruMblsyGLF66gXy0KyBf2D/kYRDw8Kuvq9KX2lnPuibGPN3B3Vt/aVpyt/F?=
 =?us-ascii?Q?zbdaASkGSsi9ElteTWvm55rGpi0LI6qJmLk7aRzHgNOPEP6L3zPyB9tU0QhV?=
 =?us-ascii?Q?eDAUQfbxD2wKYi6FU+nnxscR94TsSs2aee3JzoYsq4nwhplBEPILyuHCNjc8?=
 =?us-ascii?Q?hVPXTbF+4Ve7JUlSzEj+IUqYf4IJBra1cGlThrEfTq9mffWA0ybrz1Af6ssS?=
 =?us-ascii?Q?OzE3C0xd82dAepgghwsm5i9oFbzCpyPFhL1m5D9ZTEK+CSbK5PpEcdxXgLE9?=
 =?us-ascii?Q?jxEiioXqpYwTR5kNyHW/BKE5xvDsMtFW2HiRN3ckywqFMr+CChhL8XVcu8O5?=
 =?us-ascii?Q?697RHtmF1+ltSe1b1LdAjXz95nGFpxn2PLT4l/qerbHHMXP6a2vQUrIE7sN7?=
 =?us-ascii?Q?c8XAjnlDJ6Fwj93758jkF0drfiVXRNcCTxWRCRGIq8I1GfyjVvT50AJnpBN7?=
 =?us-ascii?Q?GaOHSNHn/sjoC6savHdbQoMlexfdfdCp+z1KkJGSAC9gJlj/t9tRXzhPUPlr?=
 =?us-ascii?Q?+IE1co93w4SXGPfmXqsD7f0Fk+IYa0ujnIxeVK8h779iScnn2keYSlI3XMbz?=
 =?us-ascii?Q?54Fk3fqrR7JbY0K+G09hKq72RON8dfAgVlSar5bpBHhUuI/Ot/VdJGyzS5ca?=
 =?us-ascii?Q?BGL4/cQOzKgEYEAf6ZRxh6ghCB/27l6YpJt19Jsjo0yfr0I88YcBK6RmNjoN?=
 =?us-ascii?Q?Isllah7TPc8jOsmPdf2j8W2NkpY+JgfyhptbN114n5rMc3zO8OSqO7LlHztC?=
 =?us-ascii?Q?OY+7MHJiCEHCQ4/n/kzJk3G2+NMeGwuNFRHgcH0OoSct80HGQsKkhbNclQJS?=
 =?us-ascii?Q?HOgsMf/jJJ2x5jw9ct0QIBv1kW3aF0Xmqbv/XoCB5x5pdy6eXcRgnaMQLQ4s?=
 =?us-ascii?Q?59GATuHMctiVTApjwhU8hnQRuMsXRJnAjWwf0s8MbYi4XulexdseRVk/swhj?=
 =?us-ascii?Q?YSjwi+UkSsWANgYBLKBlEAYE04vibgBZxqYb214J8Gijk+tBG/dYjwuI20/8?=
 =?us-ascii?Q?dV62ChEsCXvAMnMZrSFuK4FSca9r37XS/3x+pEm5zc5G0Fzy7VwROkTLqSBf?=
 =?us-ascii?Q?2oRpSNFm7uxnlq8Ib/fuxRRD+8l7CuK+bd3gxv/fe64q+B6J0yA3fholWHfS?=
 =?us-ascii?Q?vqG5/Bn/xyBtzCPCCMy3EdKRrXbz7vqQaC6EdfCiuUqE/vJKDJ02C2OT4sdG?=
 =?us-ascii?Q?JB0WYM3dg0LvJuoHJGtM7SphkPMyx5kZJIa9LPmBQ3JmXLUnLfiL/sSHtRwB?=
 =?us-ascii?Q?k9At/Q8pZ1QD4Lhw/VOPsvxG37Z+Ae39Cek3YKiSuKTBFsIxzSRNQxV6wgak?=
 =?us-ascii?Q?EkhgIRSo+CoCUFerbLheGcY=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yAXcWlfNqgC/C630QkwJipMtlIKwXnJokc3inQqHJsNPA/Ai+8UCXt7lo+bfa6kZV5ljqR1nPeuX1vDwu8+cP44dWIyjMrTtvRMLSI/7NEHyRUsH4DLAvBZv9TH/Qvf2KJyfiP4kvbYv2oW32HLBMIYkIq/lbY3jaWMcKzyPdRZnHIlYcSoBiWDvwKiSSdNG/HPMEoLLAFE+aAZzqUgHjtJ9P2yt23mMJUwrB0W6yw3xIfzupV2SSJ/jzlc50aClyYyJln5I/aIoavHMrsMrDb3gjUNT9FheTFhrYSBBVwDTzVc9oZKvA3IZDB+EHcOzsKdYF0vpgl1PZ8Z7CamlF3o3P6geWFJRSa1zikWwOkMyEK9Iiz9bQ81zvKs1Pz65wz3F6j76Dn35Hxl0Jnwf/t+rXqfb25W1Yo7tgjZ1iskjf2ZBBhtz2FJFX3z6VsKH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:39:04.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58398b19-8199-4085-ef11-08de62bca260
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6416

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

Changes in v2:
  - Corrected patch 1 subject title
  - Retained original order of operation in patch 3
  - Corrected code comments to use inclusive terminology in patch 4

Sen Wang (4):
  ASoC: dt-bindings: davinci-mcasp: Add properties for asynchronous mode
  ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
  ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
  ASoC: ti: davinci-mcasp: Add asynchronous mode support

 .../bindings/sound/davinci-mcasp-audio.yaml   |  71 ++-
 include/linux/platform_data/davinci_asp.h     |   3 +-
 sound/soc/ti/davinci-mcasp.c                  | 510 ++++++++++++++----
 sound/soc/ti/davinci-mcasp.h                  |  10 +
 4 files changed, 481 insertions(+), 113 deletions(-)


base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
-- 
2.43.0

