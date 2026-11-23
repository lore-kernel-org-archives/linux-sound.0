Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453736;
	b=iIm/Ru5Z42EsuGVqxP0uT8XxTKC7QV4/cwL5eSV+g9E8sQnVP7VyrttB6p4l1d9nSEuD
	 prs10z4p61vFYyoG0TSzHQbhHSUAcF78LxM8mmF1rsxnMgpcZEFtKlele4fEEoPGcZ1JH
	 8/VsMn560pu2Wo6qrK1Yn0BiZbNKlGsInmMKmqzPqxreezJ9uo3GrFylyD9mcGBIO/GBO
	 bx5Twkvwg0cnd0Krk3FlrOnoEtodwCXmOg1LJyUxBy8EIOJ9QpEhsY1vvZC+Wadty2CXo
	 tVodpHKa9NchlIhCm09mPUfKx6CiZIaeSVq/KKiRDX6jDhYP3ApA+GJhVxq6MtkA3Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453736;
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
	bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
	b=RfeCHo5YHwlOF2hntrAoHLmZOzX3o9veeIEWrsZKvCtWseD07DKa7bU30C+p3TdC1FIH
	 wj1l30EohjKmKAEf+QL1eo8//+JK0GX4ga5DZIe8M0Y0s5TSWA/iNyXlk2ygkqX43Kxzz
	 e5t1kr3nYWsnpxPr8ydvT14noq82IDJfnwKOOvVpneubi9ttVLDDIwrfM9EgyVkKByK32
	 I+PjQy9f3bSHXZA5H7n08sUhdc7iyGkA8nsBmXeQR1dRgm5qQP1EV388w0N8AvlJnAUQC
	 cvavBeE5BPRARAf6mjbsLMjq3xM+7dCBOT0BmZitslaG7GfIF6hKbxCg99MOHTUWJHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VYilt4Jg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.31
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA82606A31F;
	Mon, 23 Nov 2026 17:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA82606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VYilt4Jg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6Vrkqym5TNr7IBa7zc0yjtZhkYT5TYdz5DCkfzBB+CGR9EvYugY9HbaxuD27S/rSOB6QxlS6baAOBnb5YR73LD9zV3h7H0/bJd8WCdqQjeoGCTHVSGeb9fotHTdxhZ/W/StjPHZO54UVKD0sofMSyWTAOLABHOrX5Yy6MfC/0lRgYA8/DnOwFOc35eGFbPzpbplaQ/Nw6uBni1MC6u5903uNtR7eURl6A8ZenKAnEw4qGd3d9wOeU5mT+SNEseczVKl47/UVCt1SoHGke1+HPsOiNIhAM/7izhyDdPiDilPjLyZbMTxw9ApKRyNQuX5dNEFhfTXPHtsS8EmhVdZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
 b=NHKvyYS6Hmli+Pl+VLB5YIL3gLda9uQ6iI/Ax/5+S/bgc+DnRY4xGo8zFQX+R6NRK0u45BOnzaiD2RPEef/6NQKICOV9tfjvwxo6aADG2M8iAB421nNXpoGAFDzwwTTu2+80KzDww+QERkL9RMkEis+JozSLpSqGfYMafO9EH38AfvwcPn1efSIjMsQuxkDgHA+LyC1MHltnY0h4/rGxhiWaYRc/gu8XoFmpgW10wElycFTQRw6g4c8h0vnKQi/NGvo1e85NXrr97RoIekXCBtlJsfF8QEN/M8PeTPem3LdpHQO2WDmwpzER3VsiZpVyK0ydozqTm3T8VlPm5wRVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
 b=VYilt4JgSxHp5IS/NU4F4XuZ/wWR1rsFfut5AOuIaHTnzGrW+q+Eay++rX9IYXOknf/fLuRwdfeTnm4HN3y4hTh2hkrK0agD5sfYShN3CqgIov/jHlQsMgH4c6oNZEsOdrPgr0CBruW0Elfm/CQU0U9x9Zm13qt5OsRvh30RLCw=
Received: from CH5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:1f4::16)
 by SA3PR12MB991115.namprd12.prod.outlook.com (2603:10b6:806:515::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:52 +0000
Received: from CH01EPF000BE945.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::31) by CH5PR04CA0015.outlook.office365.com
 (2603:10b6:610:1f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE945.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:48 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 22/24] soundwire: amd: fix shared-register RMW race in amd_sdw_set_device_state()
Date: Mon, 23 Nov 2026 22:27:43 +0530
Message-ID: <20261123170520.1380924-23-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE945:EE_|SA3PR12MB991115:EE_
X-MS-Office365-Filtering-Correlation-Id: e6af9c0b-bb50-4f16-3a13-08df49847325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	P9LiZc6q8dNOSfKHrHkzKcjsjzFfcZuya1nfauAL7jIuzquxU9ggfBiCWpb6y7Ta7WSv4r1zEmgHsNYONI8V7wy9kyB91hn/rQ8AKrxuD5lfLaUQHTLj6v46t9wetMmPlylhmcF7bxTajESlzuBE4PvSeov3nEBeBpVmZN642Srzk6OUPIAb2EcPg10gEQ5VxdXXreo8SfQYFqcud/ragvuMgkQxgg1slEBXIPayHCfSRFk3zfzA1Z+wZ+eBw5AKxB3PBXQvrKEz4tpg5DlZaiS/0RspEiiAg0wfSlBDhlTGi+PcUYBc2dekkWoR4+Heuag3MgD35PKhdtX307WFp+mdxXxpN43DmCXpnxWO6+vBkJ/v6zsBbABBCXdUwpF7iWpYZZ2ZVeh+VeQZHVBJZo8jgpRrOs+dBlKTKmss1OATgzTTSaedHp9RaqI3o/je6XWzwwyzYazH1ICy0tQEWwIHkfza3hvisyE4zUoS3FMfwjUMfnhzl1SgXojHPPurWflf4CwEbeNRKPrbKT8aZIpbgakTAzodqVtvxd5kd9DSQdjUx7UhwIY2JPlKypt+bQk9GLqyGemOyZe8OT8PgX32pI3AiCtf4vbQGcu0oXYrhxNCZxLuEMF69YqMWCcSdTn1gYbgrpnJiU3n9T3H6Sg/WG4AnlHf7m6qbBjGCa77yO49llpOSNqLxuMFO867l2Z7i6Ab6LunCsmA3px0/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JDK2mK6d7gTQXaefXtRsebPS7JI0naC31ZsIGIO36KrV5+DllHcYCz7XgumhgUkWM+hJa5yeJmJ1oBtQAej+HCrci5irGZ1GsKz7iTnDpS57h8tYOVJmrkmoFEB+tukCTnlN5vdC6CuHOeFrW9hY9zr5tpqVlMJFXIWEXf7HOYxQaajAbNGuWklsngvsKMXEsk8oWBNgFw2R13nO6az7omyjmxT81gsPSvzkVvPt1ZKRwRIzxUkTfKfnn/uFRylh68aPl3lva4SPfqvn8m8rFbiQw1aeFpIDhwUKdVYCEiuyozNDvLebmXD0o0XCXmUhLES07eq3GnzJIbafaY51I6+FUwuBO15XOblDUIiKRrA37Fq8+Pml70DHl9tskiF0KfZzZMKXjA0km9RYp0FNOaXPpqwsKQ8b+6Bs2azMCJHTS57cKA8mwiJMTqhTg/4D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:52.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6af9c0b-bb50-4f16-3a13-08df49847325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE945.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB991115

AMD_SDW_DEVICE_STATE packs the D0/D3 state for SDW0 (bits [1:0]) and
SDW1 (bits [3:2]) in a single ACP-level register.
amd_sdw_set_device_state() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence. Unlock
before returning -EINVAL from the default branch so the mutex is always
released on every exit path.

Fixes: 829c3e1cb4a3 ("soundwire: amd: set device power state during suspend/resume sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9f717a9033e4..988e879f1599 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -292,6 +292,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 {
 	u32 sdw_dev_state;
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
@@ -303,10 +304,12 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 				  AMD_SDW1_DEVICE_STATE_MASK);
 		break;
 	default:
+		mutex_unlock(amd_manager->acp_sdw_lock);
 		return -EINVAL;
 	}
 	writel(sdw_dev_state, amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
 	return 0;
 }
-- 
2.53.0

