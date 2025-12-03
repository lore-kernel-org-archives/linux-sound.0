Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243F2206B1;
	Wed,  3 Dec 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763308; cv=fail; b=tLcJPEZEUJxnuQVVHzkY1QLZHGXE7HpdzI4YGlgd3UNOyiSXoHEa9wRgENNwCgMQzSbRaTHftSIPenCyLYrwMSspFbqSqLk9vk0qb2A8I/VMOQ7vhw2HOTo41FGMsaZiHYL6nAkroSyKesCnDKdjDOb2gA0L31T+5wXq0jgaGmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763308; c=relaxed/simple;
	bh=GhcFzO+bnRmBZOPK9vYKQI9r0ordZE8RS6Rcn27L3nQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GTe9mCPyD2l3/EE4Mt+gMJKx7bKbDiZLfx3nOhdyx1zkiTdakR7UxJnVI7wgOsd1+ZXDhb0b18VpwGztK7w1f5yOzVQjO9egUwlKDcydHh0KnhUDec65NOueavPyDxgaCKyZikF5+EVXVgJxmlEtN9xic+ooBS1Lw3X3TOYyG18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f6O3UIEm; arc=fail smtp.client-ip=40.93.196.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f6O3UIEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGw2Pdwf2NWdaaZQHjbVD+s1df2RvBX2xOU/kr4H91dRtv6xRxplvHeYa1jPN86DoYT0SdJYX+I0l6LLp+qDOCLFqWEbzPhBX8heLOxcLlxWXdE9l4S0ejGmo7MEJ0PUDKH6k1duHIKVR/Aj7uRJsY3uWX6NIjiu4jzGU8wO0wJPSWi2Drl2CIuPUBbllR0T8SxnqEJ4wz0XerLiW2+VyC4LyesHzIdOlid3RjaKmtJkMDxLpck0dOyg+9j08wCm+SOn9iRb3nEhaGXJ+uPkSb3rc/iWZRC17+MstPEcXSSQgOiNHppZZH/lCwx4ywmxNoo5ZV8g/Tb72oRHRX+diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6JkdwLYjIoHpeBPT42A/mBrSylGtQbpQBzypBhOe+k=;
 b=jTXKNys7Y536W+RvSmrYmAxZerCJos08vnvykOXH0scQKBdutmZYSxosiOyr/Ij43vhNbVdGhsaps+dDMdr0e6URzcLpZ7QymGj3DacTPbVf6+Nvy5Hx+VoXDFQ0nP0z2e9JYlwt4Ktv3Hs+Tm3B91zyqVoymUdTWdw0UsJ0f3DVmy5Hnm68UvI8fcD4+7GiIm4e7vXdmn0ZOwlz4bbdSR3vdw0hYPoVEtgaaaEgL6StSAJhFgFYLgnn8vAvpjzzdPoH5N657I94yuQxvyT4FdgUwIlQMS75zrT1pQyMRPJxPJusaaKWkabcCwmgoKz3GYOPT1je3JxjtzBKfL6k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6JkdwLYjIoHpeBPT42A/mBrSylGtQbpQBzypBhOe+k=;
 b=f6O3UIEmwq/HkduQFcobJqtu0pOQa7bgI/vdancNKxftlBv58ONvlxSC1/kdPLG4SoB7dpca+qWapGRG71Ae+sYVAaKz0X+u8TN23iuIUtDvaJG+pkI15SvGzP6EdYfN+LCbKP8qYXbaclaE3LGe4VrJ2bF8ZP4ev8UEuZHfjWs=
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:01:42 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::7c) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 12:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Wed, 3 Dec 2025 12:01:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 06:01:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 04:01:40 -0800
Received: from drvdevbldsrv2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 3 Dec 2025 04:01:36 -0800
From: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Hemalatha Pinnamreddy
	<hemalatha.pinnamreddy2@amd.com>, Raghavendra Prasad Mallela
	<raghavendraprasad.mallela@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ASoC: amd: acp: update tdm channels for specific DAI
Date: Wed, 3 Dec 2025 17:31:34 +0530
Message-ID: <20251203120136.2591395-1-raghavendraprasad.mallela@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 563f8a31-c34f-4b06-0540-08de3263b88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZ7XkATnIRX+7nsCn1+GAXenUcF//Q1qo09LZdpud+L5MjpT74vhsIz8cJ3B?=
 =?us-ascii?Q?lFOxa2U2Ib6Ma780jS0u6nfNOeTTyAFvnYr0cSEx7C0wWskptQmmHZaTMGUb?=
 =?us-ascii?Q?kWcYJrGEbETd9ytUMDW1dQ2AeOsJD6jy35PMlDFd7s+mU9v/rrqEtJvI+Al0?=
 =?us-ascii?Q?ph58TDPAagdjRm/kTcphqZK72lvK3GXzC9nA2efTUWFZFZqMG+7SNyAIfsyv?=
 =?us-ascii?Q?04aK1yw0QFFsu5OE4xGODKSIYEz6p+54hmNCjUnDvO/0G/3RH+SmHCuuaJ8R?=
 =?us-ascii?Q?9PWJHxTf5CkTnls9cRErFqSwoGEcAi1Ta9Fr68q0rxHwR6E9+f5qrCrMcvz9?=
 =?us-ascii?Q?kDCKCNZNUfdYl6gSpFGmzk8RY5/qEVGv8xlDA8GwhHYnziUYCdL3rkXsX732?=
 =?us-ascii?Q?TSxCwQasYSV1wnJF6cBtsDQdREPNlNdCPgsNBE1g8kSpJOQQqRic8YhfJo5j?=
 =?us-ascii?Q?sXxHQTw+5THLaRw2K606/el2QRKAWU9F04KkMPJ9BzFrbV8U1cArhdBAgV7M?=
 =?us-ascii?Q?FLETFht7ZRg9juSxN7mSwm9QZPGjq67Z6LcPSbsVHTpPtHr9RNqp8Nw7jM9T?=
 =?us-ascii?Q?AN4hC9m528g/N2G+ZR4mJUPq/UzVBAzEJRcDZW9Ge0f7rrKX1euMzrvTOofX?=
 =?us-ascii?Q?jWtZYnxCBC6bLb3nkxBmZq4bbP6wNZUM8I1Rk6lQRdt12gU1/1SWSmCsFxQ2?=
 =?us-ascii?Q?nWylBCJjLcXewOpmMZMLYLljhkn7jUur1+Ed2Mwo0WDeg46TATxl9NDzVYnZ?=
 =?us-ascii?Q?YxR1NQ5v6zGtpSAZCn72DHNoOrl8rCTwiiT+rT7uyCA5mSEJcCwRn4Mt2ZHe?=
 =?us-ascii?Q?21HtRZ3rjPQ3yYkbtro5weayBGe7ydyqf7bntQppAZ1qnrHRwNZLNjLX5sax?=
 =?us-ascii?Q?OvIzIsPP0F4FsrUKI3EEhH6Djmma62IbPhU1TLPh603VsKVewxwoc1sUS9r7?=
 =?us-ascii?Q?fumJGL5N0NXhOFyhRJzXxZu8W5MXZOVu2jGkTOFCtYQndJM+nVjAJtXd/r4C?=
 =?us-ascii?Q?bUm2XevhGPRyM/FqlIC91BvoJJLVESdV6H04N9ofD/v596q2s1mBFAkEliyL?=
 =?us-ascii?Q?ks8SVWu2Eagsm/iB2kJFDwbFgyb+C/ndCWtbSlp9cqG4C7FJYpQGiAd2YwFY?=
 =?us-ascii?Q?N+ov7jSqa8Z9ejQL/aFWU6GDOrbU6MeSWTKdDT3XtCojHH+5L4zvEErcokp3?=
 =?us-ascii?Q?X9mKXXCiC/W/aOLLcteGZNBxsw4AMgcKWCuAjPLF3jiNmaS4iR/+WfZtSHoQ?=
 =?us-ascii?Q?pjvzu1J1TnWMN2fOORGTvyo0Q2jZMps5xOwLPZAbDjsYCZklLT01cR6KORNl?=
 =?us-ascii?Q?AcMiT9h3qvGXcvQJ8M+jO6MtkGr485dwgaJZ/EkdImuuw+FTcfYChOMqOUKP?=
 =?us-ascii?Q?A5s6QJP0QYg+7qJwEXrRo0JXNEamoQmPx5UpnOAdZUSJnDGHcF+KAfp697qE?=
 =?us-ascii?Q?3wi6WPhAiq0lblfXXTwXVsCm+Y2TBse6WjuJ5fgNM11GuhQylj+HgFLY5l54?=
 =?us-ascii?Q?JG1Z+uRE/1m+441yvkTd2X58vZ1Sk/DA8B4o3hYjSpxJcvWjMupozYb/Fxnd?=
 =?us-ascii?Q?nfXoRKUZPCnLOwfi0z4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:01:41.2333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 563f8a31-c34f-4b06-0540-08de3263b88f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027

From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>

TDM channel updates were applied to all DAIs, causing configurations
to overwrite for unrelated streams. The logic is modified to update
channels only for targeted DAI. This prevents corruption of other DAI
settings and resolves audio issues observed during system suspend and
resume cycles.

Fixes: 12229b7e50cf ("ASoC: amd: acp: Add TDM support for acp i2s stream")
Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 4ba0a66981ea..283a674c7e2c 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -157,6 +157,8 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 
 	spin_lock_irq(&chip->acp_lock);
 	list_for_each_entry(stream, &chip->stream_list, list) {
+		if (dai->id != stream->dai_id)
+			continue;
 		switch (chip->acp_rev) {
 		case ACP_RN_PCI_ID:
 		case ACP_RMB_PCI_ID:
-- 
2.17.1

