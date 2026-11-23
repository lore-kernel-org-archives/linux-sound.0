Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453851;
	b=ShKX+adPyyLMYizna+wYGWRkuma8Rqy8uc5CItWJUQK97fA8uUXf14ykdAxBrtQ8zDVH
	 8Vkiqsn5+BfGnu+cCDKi3Q7zKBbumjSNBLMbN9xiN2T1gj1ZSqCifkb4p8N8Sqj63Pd2i
	 haOXIPreKswV0ZiqmdCeAyY+kiIQRJWtzhodKwX8VpYIn/zPalwhBkiiKH+7zgDBLOvLR
	 YPcnJjFuhHPr8xgtceYWe9F9Xu4lPsZmhIaIaZxsjLl5oPYPUV0dm0lXf/kypFh442Ipa
	 QSZjAxhjJKM43Bx25NSfHeObWLoaFKSpkLoOjwZ3s4AG6lLL+3N8aTa2a/IVAsMcf8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453851;
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
	b=5YYmAczVAxSC9xmKhyosHuJUoQFJU62pOtZCxTyVokSHBTD1zqNvcKI2uh+dz6PIWmuK
	 pQ2NAtFCe73Iuty3GM3OHkFQdtPC8UrON3H1TM5iE/qYrqzMEQR+Qi6cX91Vlg1ernZag
	 sPoDLTe1tHvNizpFwDJ3OiKSnU49oIWCsLxkYeI6tnfPrbwjDOqG7jUnqss6DoBX7IUhu
	 p2yP6zEsU6+UfQ2DgMJ29pOp0cmyRJIaOPaqHX+sUzFIk5R821Fr3PqynquNaJ1CDobOA
	 3VOb+qET/OxDOEAHW9oMz/y6fFtpiVbkyEMyMBQ1cX/CSJkiantYkbmZWHnlC+WJgIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="H1vVkj6/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071B606A31E;
	Mon, 23 Nov 2026 17:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5071B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H1vVkj6/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXez2ap8eJBC1fUuTrIn9aOwLHH67/7lr8SDs1eM157Sxq6EHDbFIXsgDLeYRP9+Elvf4/QdRX0E6/kfM/aLrUYw1aH55OOdJOKkFl1muYh4hdWVZgD6p2tTuQ2Ab4ofA7Le38Onogfmh0lWFgiESa3BkI+PWdltATTlVOfN2vaW5xb/3vMc9QaA/6XfJs8YiOD5pcHA2zftAxIo3He7Y92cjsx8TRb8SJUfgVbcJusYzaZ5Uv2WzuFU8P4YZ5mfL6Qpa3HGHsBd/a1cPWJubiFG9y3IAaMCfVcLp+S5KwBp1usYtMd+X4cJuqIOPH8VQ7fqeaIMJoKj+/pPsTYb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=w6EqYqc/NiVs+ZoWwsdBLM2wrfF47j3zoxHTwfmo+OqSVhSRpkUP2IJoShFm4/vCr9bJfnshfaZf1o1kKsc0BcHx38hfNrOWTECjOzf+vteRZr9B8K/d8IYpGmHOdMBhG5X8TtruVD8zvvrrIYonppn09mADRkfI0esmsrSbqyH4gvV/DTcTl8ndDEzwUjhoIHbawfIuDSlzBGpX4QaZPiEA7dmuhXStI2TgM3kDD0t5wmm6URTj+ANHiQy+DXgCcAvAz6MUrfbx8lwSYqHjS09NqxXRn2UlBKPuvEuHxt3QtRGffVAdusu95itxW0dCduruXhJE8+yyYF7RQpMpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=H1vVkj6/U05tWXbI403Cbbn2mFMSssfMZAEaUQEJg5A/E4evRLmmkWJ/O5bzeX0fU+AZQPUguKTkzxPowIXdrrrOh/V5H5gowOQTspOTi2f/d2eNmndNWaZmkqPwcsHLT5VgDKsaSpkuFdSdoQ3IgW69NYhmewMSQvUbQIfhNpA=
Received: from BLAPR03CA0076.namprd03.prod.outlook.com (2603:10b6:208:329::21)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:07:12 +0000
Received: from BN3PEPF00022BDB.namprd03.prod.outlook.com
 (2603:10b6:208:329:cafe::a9) by BLAPR03CA0076.outlook.office365.com
 (2603:10b6:208:329::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Mon,
 23 Nov 2026 17:07:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BDB.mail.protection.outlook.com (10.167.248.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 05/24] soundwire: amd: fix missing wake interrupt and group wake-arming calls in runtime suspend
Date: Mon, 23 Nov 2026 22:27:26 +0530
Message-ID: <20261123170520.1380924-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDB:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 44576592-fe3b-40a8-9204-08df498436dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|11063799006|5023799004|56012099006|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i+rR6NfTwJJyJTUFfIpKM//NXy6/gs+dAiBE9ilRtzFHcy1jDg3wbOuhw4vNFjQd5YH8BarRMjXlV45+yBuv+qfF37O1T2dI/XtXAjablmRGtGxg8R/yYzrUUJEnUi3lexVIOymYjoz2Jx0FUTUI8v0LG2bo6lSO2mdHVttQQZpLu0v+idxPPn7wGStEl460MEv7aWvTu/RnKHxx3Ifncgrn77bVE+1IQQhhponhXTmqU0bYEfdjdLhhZRnIwTQwd9dIYmQPZCYAX8BuWujIKM4SgG+WBDEHcUnVP/SLTgr5m8n4CE9yfwd/lS2daD/cspFNydmFEsKKlEA1bXnYbtNvEgxzDVbZbvoQ/Fcq4CofUhqNyzEZ1BEEmMpDjNqFP9Eatj8I5CIBez2le4CZzk7FAWEO0zZE4679ILclGzPf5cr6MGaS9QY8eEwbdpM9nmvAu4y/XdyBhN77mANWhNM/b8pANQQmabvo87BjnBSNtHgCpWPoBR0mkOBiqJO1ruHEkJ97/bj406QmRBBGEVy6PAmBJ98lGL9l/Rrs9CXN5oDnHUGPyDEAwr+CqGJPf3GUd/z8S7euwYJ3dcOZTHub5Tnl+CVvteMLKzCrhbsgCs20kIAd+KtOe5grpNgVYjmyQsDgazjMFugqIIayZ8heU8eJBYIjEBHDjJBwyCJazn2K4mPacuVFMKQZ7IP5+5hzI+PWM6O4s+g0IzPjVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8B1j4+cBNJU8D6jW9dQBAgE0CMKD5eKcXMULUXJDPLwNMI7wv2s7kQ2k3qtX6pf9TpWE5eCZRGUdOh23x7jgewYRBMkgsG9jVlZgvpRDCaDZyhQbim5i/lV+QBVHxrT+fFMRr1bdPRNkGz82zQoSxBEBF69PXOu1MhQZTpaElNFM9fcjowBA78A7gRySWz1SC8coIccrhDDNVwLNjfx7Vfwki7yopBGTfnb4R1U1u8BbE8ylWErnC0uIn1/K+NPl/vq+N5+t8TrrAfndk0FPIYCNaT/mq8xRd9cnjHY9d/Npd8ZoHk/T0fuN7MExmnguWM8Vn2nRdwlBTiRK7C5kAobJafC4wK1mEIoDq2q3VnVRTuIvTp1B0CBWrNty4n72oGDzjOt7ef5bOgT6E4dW5F/TOgCOxl3U9K8pEEKS+CEVY/mEYmEVbtZ4CPZ82pCW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:11.4472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44576592-fe3b-40a8-9204-08df498436dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BDB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978

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

