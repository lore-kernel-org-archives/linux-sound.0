Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510325;
	b=mIKoTm7WiTh//eXbzm45Jl3eOVwHDNSXoY59GGx8GeCZIG0I7x0frnS57CdBtwqiIJNQ
	 1RsKS8n99gFE3BQtstV15nC+h2DgzMSdVZzOj1vDBrlMJEwkKtcO6/mcSaXPIwJBgzvty
	 9bc+EfAINx/SuhgpyBEa7cUdrr1AhfcjI+zH0NUUfgNxc9iaIbbTQDM0DeznhxgUElDZd
	 cH8n7BvPAAehSoEjSFgVSIW4lt2JdAQQ8o9IYr0jgjhcMz3OrdW7lcec1JpmTcS97Rzds
	 ZK5vCxlYeB2ImPYRtf//xfG78vz5w7zlRwuLJ6VMrQmlsrt6jXW0lPR3Gqg4zmJ6d8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510325;
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
	bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
	b=LREGwGz37VoH0GYetLaMMJj/L+jNlQX5RWS7fZ9pQ+CNMW6Uc7Zfftx9koyxOOCswAJg
	 2UamWwVC2r0dWsrCJ8kecqv4nqcFBj1KGyAcQtwajsfZzuhInhyYp8Hj2JaPDo93O8dlB
	 DtltfKhea+1+i/NaMjTKOUh5M5RL/Q/548nZ3PjFUuWBdlvgiqFuHDfHJ+yr9yNnwkVI6
	 FZRtpHCzkZ2V3ONsaETm/qH11iUosvsOO7Q/r/ahJ3uPVk240qDOZbbSPBuD8IzuT/3J7
	 b48e5b4cTmRGza0cTyYAFJ18GdJiuPJU+Imcm/hKDLXINQqC69FwJO15QoMX7uSqGYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="EY/U/MI1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.2
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07298606A326;
	Tue, 24 Nov 2026 08:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07298606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EY/U/MI1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/PNDmkKggPKQrldHhGzVbhX4t4tCUMSR06fERxMtAjX8wuccAQ1cVaD62afoQq0wcQ0ljVmP6n2QFe0G38VGPUQWvCpoG/7axIe4XNM5NHeFnmjtAjEpvBNpR8rWyd6YlD5KPpCEvbPaANZ9R6ZIPOJyyqJSfwOlnXFlG+/gg1WrQ5mhzQBR+tbrFUluwhlh+P2mvOHMD6HMG6V8nxIyT3blKDGFdyRdHnKYjtklEgM5fvoFhwnFJrRkBNrFGBJTZ5i8Lknuh8fBX+yH6UHUbaAShtWEc3va9ZNgda0Z47nSWFgipx2P2zhUqA38x/HaRG924L6WkKRM8BHiJfCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=D0KfuO3W5vV27g9/qgAYAkagaEelByPHGjRgCKzxTIGzOtuxkg9H16SCwVsBGFqw/BUMb/1SlLruTJMYvBL2mXXRPZggJdIfrCKv8i58Di5N1gTxhINn7nHQBU/BVSBP2rlBtSxePBI9nTAq7Q852thPgg9YLUuAYsYldJ0LvvDldcjYRzTP+FlXP+Jq+W5kEzl6U8LP6A1roW7Uz574CC4MbQC2fj+mTiV7dv2ymb6XJYbpdXhHk09FwEevsmni3VxFqpnMJSl4VqWyKJkHKGyP2Z+BVNFJPxFTavnfUNUnaeedr9H/u5KDW9RkTIj6FI68ps74f6735pZVWOsARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=EY/U/MI1Ob5aWXlpdgMD3ETH1QaOslR6KKAWnQcY/9/7+vQG9roGgRm3lx9cXx7FIPxI96ckyMeQwxbaSJApIidT+KvDjwZEpWkMPyo8l5B+9mATQgIqrsdHJh8FGBlNLabnMZ4zZTtWTi1bCRANyTT6BHkILnhF/KtrvrVnbn0=
Received: from SJ0PR13CA0133.namprd13.prod.outlook.com (2603:10b6:a03:2c6::18)
 by PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:52:00 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::75) by SJ0PR13CA0133.outlook.office365.com
 (2603:10b6:a03:2c6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:59 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:51:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 05/24] soundwire: amd: fix missing wake interrupt and group wake-arming calls in runtime suspend
Date: Tue, 24 Nov 2026 14:18:11 +0530
Message-ID: <20261124085033.682755-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1ca7ad-4f6e-41a1-0f18-08df4a083463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|261022075727099003|261028144727099003|11063799006|56012099006|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|5023799004|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	5BYMBMZPIUdNQWAVOCzAXvHwneZp1ZUPYh/u+fq9ccV8dDqCCoHEMenDmQ+eju6chYrPtgePQRQTZsS4wDAIk481OhBImMrG1tsIEYq4EllyJ+RjH2TfvOsaigLNSKvMJYI9i9UPOioRdTLLH2Wl84HOiEKrXxG8WvkT567Som1KTwIzpHQHdd3me4gjcE8osdyNXJSHTxG71+sFWHkex3ra6FUYCcK4GTKl4AuFcr6tY+zORRS2ywQ7M0D0fdaOxFb1ZRbn0ose1QsQX73D0VA+FJ6Cuvx2mUt+UR2VcZ4WG21qi0jtxgrtj31Nyiynh3ONMFWkIUqob1sursa6nCy0wxFV7UR4I7lefZkVqU3Dgg9yG+X6R0AFXBpHeD21puI+XFnk+VrJbtraFboDOw4zpxdOeSu/mEa+nRS8kFqkcM/aZfMahEWBGdlUQBJj3KOzswIf/GHlKkElU+IPvcNKoqcxz8zJkqv7vXAGStfXNV+Wa0sXdPPGXc9ZYDVO9yTDoaq3Kmv+/g2b5VRR4P2kczOLndHNjfn6+++Eb5gX5vBgPgZjR1mm8+ky6yqL5/tvQpEPCewPEC4CxAM1BoMCBGA+0fEYo9XqcW2a0piapAL1Hy1oOkTm6RazYIgxpaUmCm64D6b8XwlXMoHLpRisRWtGJB8r+m4+kE7w4mnEko9HqqvUbkqzTzz+Em8mFSc5vFXkqQSMbpd8A1zLrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(261022075727099003)(261028144727099003)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(5023799004)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8tAK3l17HpOOdyeHS7TJDNuDVGdt/qUgCF5MRmw5rwQxLHzxCRQrjVFF+5sGQXmXVGuOzLhfeMox17TffWFy5/IYEFx1fQtXGp0niW2EpIMpMcbRPbdidQVjHF0mFQZu1OVZJtlGDs7kGklRgCZb04j6r92ZG9DMBRInvc1kKhfvUyaLgyD4wZTy5zeVGGHO182HJuOvUUD0OOVPbyvXoHQy7CzGvkps173cVnYz7aGw6NKOmHvFhyupKl48nMex2iVmMYes/dRpeUHPXccxHWtl8P+xtit/3+oEx1LBIRUiw9qzOpEpwaFReo1PkZCyH89VT+K1g0ZckuQQ/3UbYE0FvuS4+BUQWij+XE4pxmzOhp+jckHYghtHRNmVOLgEZdqnP4riFGkaAkmJZEQbX5pO7PdUKN7X3M24dZ98jwYDUQw/smg+P1Ygb0e6zNBJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:00.7710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1ca7ad-4f6e-41a1-0f18-08df4a083463
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867

In amd_suspend_runtime() POWER_OFF_MODE, amd_sdw_wake_enable() was called
before amd_deinit_sdw_manager(), causing the wake IRQ mask to be silently
overwritten.

amd_deinit_sdw_manager() calls amd_disable_sdw_interrupts() which writes
0x00 to ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, wiping
AMD_SDW_WAKE_INTR_MASK (BIT(16)) set by amd_sdw_wake_enable(). Move
amd_sdw_wake_enable() to after amd_deinit_sdw_manager() so the wake mask
is armed after the interrupt-disable sequence and cannot be clobbered.

Move amd_sdw_host_wake_enable() after amd_deinit_sdw_manager() as well,
grouping both wake-arming calls together after the interrupt-disable
sequence.

If amd_deinit_sdw_manager() fails (timeout waiting for ACP_SW_EN_STATUS),
the hardware is in an indeterminate state and wake IRQ delivery cannot be
expected to function; the early return before the wake-arming calls is
correct in this case.

Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 28f5dbe131dc..3d60bea82792 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1454,18 +1454,18 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_deinit_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		amd_sdw_wake_enable(amd_manager, true);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, true);
+			if (ret)
+				return ret;
+		}
 		/*
 		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
 		 * enabled unconditionally so that wake-capable devices can detect
-- 
2.53.0

