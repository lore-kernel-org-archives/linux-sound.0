Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453741;
	b=ci7j9oDl4rg2qPyd9GeQqziwLzveZGDShlh7b2/tvohEQPUEEs9HhDmMnsDCneaGxmeg
	 WW40KKFZKnHpkhzH9oawlx8xRQ/4ygQfPO7JT3Ua9bwGjVHRjRQG7ryo96mI7mTyC2scY
	 q0hxWKH/DoGe0jEk2q2w0XI+l+DqAvUP0QbHNLhHmdD2zVRhMkHIlYWSv5Te9iAvDIpWO
	 rCCeR5XOKUZwOZ5W9KVZkZrcsU60L6++JcTCfbAMXKkHDJyGiYtEmHSX3tgQRIrajxXHM
	 JGdKWEv/pn3aWhfX/I7TI4lTlet6o5+RZ7EP4QesJL3mxyZKw5/jF4SRn3sYv6miRtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453741;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
	b=y3ZRereOkeGZC4DMGuO+t91LarZd4w/xP8ojqVwoB3pbmsRjVv1vDNXsYabGlBYM7fCp
	 cYEUy820VbIXxyTujZ8Nj0vAckB6askrfgWNLALVCCEipTs5ahv393MUNGGEaSA7feRpP
	 m61P+2+7Z0VIxZmETKvdbCHZEJjPkYvNLIHGGAIa488Z/TsAn6XJ6qQ+RB2a921YeoVHX
	 TzQE0SCjKWjND2GtzjSiJIoUQsPKhBgqN2Gs9RZ9rGvEYxf+cn/G+VVujFYiJ0gwyz7Vo
	 IS3kkYvLD5MmrzhFI5Pb7TeitZK8P7Uu5R4mTi44panZMS0QyUNU4hHl0d8nte30mow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lSs5to2G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.63
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D8606A698;
	Mon, 23 Nov 2026 17:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5D8606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lSs5to2G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtkCStWW7RaRTXk0FuZa/CFwartbBzJGOa55+XM52MAHiBp9GxVueBIHHAGVA1bMPO0F6VFnb3epOkuBsOZ2eRxAYsiFZ/TBiytDs+kMSRbTfy+v9aQx+Mvd1fGFFyylmklqvl7WkYkVZoPB9M2lv2Pk/LbSDKZ+K34I1wtraRtdXhJ7/LqGpzwLyf1UPCPy1iGpU0O7mRnQ7drjCjdCGp28odDkwRS+B7acDawCEIBTHC7YpPv62W6AhuxluYast6V5A0KzGlFIIVJaJce50PUfC/23vnxDkd3M0fW+cIYQmQute8S/BesmpSeP68q2JQX7e+kR+1w7z9lu2FHGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
 b=aLeJdWiApmlphnZ6wG5GFClczAJXiDxcZIi2q8lV5zkAD0SEGYVT5QRwifOpA37WciCChBudAk+0r5/rxTw9Yfgdw8TiVF48QaXbsDmGUM0redaHKLYHm+F8wVUkwLEMIeA6RxzpL7aafcCdUkBLa/aD0LQywjvM+YsZ/15TlbmnbEabCvCLCLXcCl+itG/JcmlbrsppiAFgNWUBzPAYjAqzphcZsgw8ElahR9AMTAypdhmTtSCPpT5pstDWbV6auMn6VBv1De7Xrc4phvljuOLpAFsMmGHNL/LQR9H5nTLwp07AiCLpzFyBWACZkHpYZqUsK2liKodLq/NpH/2bsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
 b=lSs5to2Gzeam2kbLrqcimjiO1P3MEC9FT8JjYMuFP5imCFca8VCe+e37qowMU2RyGub19QRTah7iqlhDMdrJ0gmd3yT6+MZipbOwSxbg6HNprJF6G2KfVPvmQ+VcBZjK3gG+cyIBBziN9kNnR5NzbMaZkZuxLf6wxtu7z8VnJPQ=
Received: from DS1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:8:44f::16)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 17:08:56 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::4e) by DS1PR04CA0002.outlook.office365.com
 (2603:10b6:8:44f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 23/24] soundwire: amd: fix shared-register RMW race in amd_sdw_host_wake_enable()
Date: Mon, 23 Nov 2026 22:27:44 +0530
Message-ID: <20261123170520.1380924-24-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|PH8PR12MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eccf5e4-fca5-40fc-f99c-08df498474c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|6133799003|22082099003|18002099003|11063799006|56012099006|261102123227099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GLMd6FAnTIlkcOzlJozK4ro8ZXf5n2s53yTnqDtP2xKCZgzrX2/lfwmi5DjI2Oevd4wXyQajBo6HBukrlN+NTmqmwv1+Iu0YsMFHcvlF4GyHMmGV/C6/6laEEilYxCLYj6taFp3OA7T55K9cW9zV7TtH3AZnQkClCpGmMvB2gLtd66AIlp9boMcWyHzt0EggxcjHckAK3OTzunFwNHPZgv/07QN1zker1fUrczcHH3oy/RUEvf3rcj1/ikNk3xX2ow+LQtBXgRVA+zhHFJncHh2aFnu6ZyfPXPYJHTkthb5DB3r9r6Ipud2nzaXrVhPS7zNGKU2ADbwO21C8grWH7Quv72rICDXJWNAsFNZi7HGK8p/kJZ024/N36Lh17yYhaN4coZmUgmczDDjQhPg5apDCAH87c4GoducJbj44l3o1i6FluzDvh0fCHdM5cKuc28MrZ5PgHjKC4I64WkD4w7HW4/y65hYBzAtA/RVbRSN/zldb88/lD4mYH8qxEpUB8SMUenaFqZSzTbg7VO0GKszVAS2eBjPzD9Ug4RKAHERxBi6z/iai6pnWqjwRGlXjg9WuRxAmAt5uNbdlJWs1wxR3l8X3r+4YRWIMC5fvFR52jOX/YCdza/gMOFwv/Caf2G+ouD9EoyTAQP2srGinUSThpFHXfGHlXbVTQ3YyV+NPvb7Uaw+AYe06OrqNZMvO0GcJGDd0REPXD/ss9kjCcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3B12jushWqnv4FaMCCRbB7MWGgfX9tsngbTSI472BhEhIu91oytBXv8I7weloaSx5duYrKfZeJfS6/YZCa+29jf6xjgGgOITxL7200BmHrHNl9/3l/+5tQE5g0SpejTmc1MYDU8BOQZ35YFC+/0eNANlFHPfKCpd535Z+RutRw4cU68qr8vpbvlAipKmoAq+GSzNerMwRmvzomuoOlpPY4F0oiOEvoZKDI+/y3z6Z3Fnaz6ElLtDvrT5eJY/+qrlUq7WcoBjDCR05F71vdYuE+sQjZDXr6nknohoiVq11KrLK9gk0iQVf/jcptCeNU8BnWKFkLryuvdQNh1MjWVBXYSSS1PZm3AJYjX44IUcoc5/cokN8Uz8buH9QDYC69zc426cvONB+/QMzVdZQcVZ/SJqbhRgHSk/gkF6Jsll2YHYqp4U7n68TbH3+yHWy55a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:55.3167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eccf5e4-fca5-40fc-f99c-08df498474c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988

ACP_EXTERNAL_INTR_CNTL(ACP_SDW1) holds host-wake interrupt bits for
both instances (BIT(22) for SDW0, BIT(23) for SDW1).
amd_sdw_host_wake_enable() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence.

Fixes: 3df75289ddc2 ("soundwire: amd: add soundwire host wake interrupt enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 988e879f1599..b0e40a1c808f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -333,12 +333,14 @@ static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool en
 		return -EINVAL;
 	}
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
 	if (enable)
 		intr_cntl1 |= sdw_host_wake_irq_mask;
 	else
 		intr_cntl1 &= ~sdw_host_wake_irq_mask;
 	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	return 0;
 }
 
-- 
2.53.0

