Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998737;
	b=28LbfVjlci953CBpQTHK+u7x2wVXyqidxrx86YdqKoDnb4OYnTdlHOCGntQgJmoFu0NV
	 Tbjt5n3N8ixmVrVj5Y9+10PgZU7KyFOY3wRvZWvCwwNwFSh/j3ywtMsAMytXJf11Ty/9o
	 FkS7QaW9zBYihoYq0lb8V4J/LJDezc6uoxXjWtNtDvSJf6CfjpMOs37KgaizUQZ1L9Wn0
	 NAhW4fzODtvelNHGekbzZOX2ChQmRvsP3u8NddJ9+CCFO0637wRpMqSWp57GJ0NsVhkaO
	 4v0Kl8ZttHlXBjO3jiPIZ2lN5Pc16qZJSIcJy8ktm+8nvSd8uO/rr7zU8GisyUsSYTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998737;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
	b=tl4N+6hVRigSl0Ml5ycMQvdY6WZ9JlN9nKfsGiJlsSUxjJ2WqV5KAnaAmccpqKfbUsiI
	 TCKokjTO5gU805WTzbKAWnyAFR3CxhCN893qT5kGnZsBjqREeFYKsKoqVjqFCNGFNR5IU
	 zXeTU12P5AhIj8y59Y90jfgYy8faW4PiSS5XVx/8qOe+gQ3B4rmSBRVqjac0ZXoBrPtA5
	 I/cHflyMbRe5aEX1zkIr0aMqbh7K8+fkUOexgw+/gEAhxk3lIY7ib8xwxt8RWJ5Wp1YU9
	 KMXirrVPBNHir4+sYgN8wQkBx5RgkMh5EtHk+Kjl5/6AlP7zkZ8ysswxXa4BNmIfAFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bvRgvCKK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.23
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196A606A337;
	Wed, 18 Nov 2026 10:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5196A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bvRgvCKK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0eMEDqQkaVZBy11tvJmyOWgyKGNKHM7TdwTm20x91wmg65J8D5FIvjGarsRDrAuPL6Eio2ihSpcFUUppCdwJApBD8goJdF1Aa4/A6ufPrzkuAgAsRw30+yIx3RtFEZ0eI2CIhXMImTM6yLzX3dwmnYKu7G/XLlrNsm0u7CCdJFj8u+avxohUMZ+tkXfa9DifyufTxwdMJuzXxe99NxyUa4MEsJCEFqMJBLF6z4VZw9zR7CJEqnh+MiOCh0iAGoH2c3qPk663G5PIDGKGpfQR0HTFp87ZZEutKFIT6ls4qa4P05Rb3a0ArA9a/6vP/oeL7GrzVVJqOjalbMyPFgfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=juQSGkPB9KivRTSw4BQLAaVULIb9uZ1gOf732pcbTvrdFMy+VMVop7KYV2QuZRyJRPrjGHy43SB3l/tB8olq7z3KzH+5VuF7PlV4FRqh+b3pklqugVR+AyHeOLfAahAufYbNOixKbMDsu/KNFure7seHpVqIyhVC5515HwsRPxkdLDoQQqMY0H7U94VMxwjFmpKZ1ZYxlqzy2vKm80nYKshBAhkOsaBSwP+oJ1J4oo2gADRjg6wStS8HHzljd9kqCAd+tD0vuy3gvQ97G2gWGHgprj1Bo23fbskNXKpl6exa/THmhvw3SEa/4lDNmOPViA6BOKEFJvhW3Qz79s/3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=bvRgvCKKhbqbtvUPAFBjeBlIbfF1bpgJQ5844NA7o3F+iUk+9QfEzlya65vbxDzaDnI8OWgf4Tk7k61T0cwJfKx2LjHk5M59DFs1hFx7ZvMuzYnfdC/kCjYdvPaBYA4n/Ij9Ar7IxB/yhqOYMFRrNOneU0JWLdSCQorevkzZ92Y=
Received: from PH1PEPF00013314.namprd07.prod.outlook.com (2603:10b6:518:1::6)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:32 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH1PEPF00013314.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 10:45:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 04/23] soundwire: amd: track full pad teardown across suspend/resume
Date: Wed, 18 Nov 2026 16:12:23 +0530
Message-ID: <20261118104353.331556-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 596b236d-2721-47cd-1be9-08df45611207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261028144727099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xd0hCAD+cJWGXznzspgS4hjBGDnbOABd73cYoaPeUjLh98awurgBMINyQf6HIx4klGJ1AZu1nZW4NacU79xcoFqbd598o0Ehwy3qmzQ0+ivC8cJtzQyWgcDnb57iSW/FaoZPFLgiEFOk2eg1cASBF5G/qFtjxm4R0nji+/jqoz/qb9pvQ2lo3QX8XPBnQNSe+GRueEEO9NV91U6/fNaR7E0hhdK3zuBbYDOcEX933e8hh1QJerwWmGB8In2Tl7mkrrwTx9NzYBDiWlEu2BE9OHU1JaNW8zTA/P5n+JR2MJbZXaYcJuoXKpD+itkmocRqh/V0cDi0ofS9JS0xtm/KWf+lkXiFsd7nDpaI0Vg2Bysww/9j+BNq4g9iStTIYzJEpvmGbuWPX/+9eTe8BOpTKdPGA/U7Kvw+8yD5VJZtqlT61fFkJar2o88UDVUiVJpEE6RT0GSSdVnh8pEizgcuSTaROtzvzAirPxZJ9x29i2fcRk3AqxFjir6StqlRddRFRuzDdSxYlboaAL9ey30aocP8bNECI68tVxcaHsZG63RV9C9B5PCNIWAXtAzTBzw7LmgFvUrmEW2eBPqeGw02dWeiAUHeNnDAG4pjEMaGw1xSVvGfk/Ttgp+6dFx9DTFTCDhnfj5d3JKHiH04vzcN6bUcTHKDv6yw2IOPmkYKSCCfu2EzuEDT9v4/mHIplqXNzsPeXAwCAStYOUljEz65zA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261028144727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UoJMKSqtb3eN01FylUuD2sSsWZ+hd95+IEBspnKSr9jv3VBLPX4lMdj+ZTGDSvt7OfbaToNOFUforxHPjDOK+5fbl3WJibtZft6I0QeG8jL1FUI1WeV9qW3QX44o+HQ0LXdx+qw85CKWYvGeTbYIh2DpmqsuZQm5tPFLN2E3vQvVndg/+NRjO/1B+4PFrWV4xpaToJ6TXo9rW90HV+yHC6KA1Sj4Cs/KibDCKSfxZ5uxOtYxnxWbeY6YPIRzqYD6Ll8SGARqQDIH287Ap1uvsF1mUoAyLlIORstLSPYqoF8dl4/t2kmtfzWBdjxVsRaqfopSnZO2+1UFybymQ9q7/BhoSln3gHqvRLjHgFpuGojYdRFyWNbyIQLA/8Xqf8cBol00OrQuM8SCwMd8d3K5ZMY3dDVlQNcCQspvaJtRexFWTxqFhfnLze96Dd4VFM9J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:32.5193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596b236d-2721-47cd-1be9-08df45611207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357

amd_sdw_pad_ctrl() performs a full pad teardown (keeper, pulldown, schmen
and OE) for system suspend, while amd_sdw_oe_ctrl() disables only OE for
POWER_OFF_MODE runtime suspend. amd_resume_runtime() must distinguish
between these two cases to restore pads correctly: a full teardown requires
amd_sdw_pad_ctrl(true) on resume; a POWER_OFF_MODE runtime suspend in
which only OE was disabled requires only amd_sdw_oe_ctrl(true).

Introduce pad_fully_torn_down flag to track when a full pad teardown was
performed. Set the flag after amd_sdw_pad_ctrl(false) in amd_suspend()
using amd_sdw_pad_ctrl_supported() to gate the assignment to revisions
that support pad control. Clear it after the full restore in
amd_resume_runtime(). On resume, restore all pads if the flag is set,
otherwise restore OE only; both paths delegate revision gating to the
respective helpers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 12 ++++++++++--
 include/linux/soundwire/sdw_amd.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b21691652490..28f5dbe131dc 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1418,7 +1418,10 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
-		amd_sdw_pad_ctrl(amd_manager, false);
+		if (amd_sdw_pad_ctrl_supported(amd_manager)) {
+			amd_sdw_pad_ctrl(amd_manager, false);
+			amd_manager->pad_fully_torn_down = true;
+		}
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1510,7 +1513,12 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 				return ret;
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_pad_ctrl(amd_manager, true);
+		if (amd_manager->pad_fully_torn_down) {
+			amd_sdw_pad_ctrl(amd_manager, true);
+			amd_manager->pad_fully_torn_down = false;
+		} else {
+			amd_sdw_oe_ctrl(amd_manager, true);
+		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a2723c..c8bd8e1a4771 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -75,6 +75,12 @@ struct sdw_amd_dai_runtime {
  * @wake_en_mask: wake enable mask per SoundWire manager
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
+ * @pad_fully_torn_down: true when system suspend performed a full pad
+ *   teardown (keeper, schmen and OE cleared, pulldown asserted). Cleared after
+ *   all pads are restored in amd_resume_runtime(). False on initial probe
+ *   (zero-initialized) and after a POWER_OFF_MODE runtime suspend in which
+ *   only OE was disabled; in the latter case amd_resume_runtime() restores
+ *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @dai_runtime_array: dai runtime array
  */
@@ -106,6 +112,7 @@ struct amd_sdw_manager {
 	u32 power_mode_mask;
 	u32 acp_rev;
 	bool clk_stopped;
+	bool pad_fully_torn_down;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

