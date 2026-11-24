Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510324;
	b=Fm4Q9NxuSfFAX4+znoVgPiM56t0pdiADEuW2x66pZ1Aw0y2oAhXZbJCqiirHGzfhSCAP
	 Sq2XCfOrLuC1kvjSkQa/OE4t956JB0lzdE/KIn5K9lGlOAqp+sc2hHr8unIxoZtE+YY57
	 L0H2ZbK7eIHcFnUVBGmc7AADwm4qemgNWUdNoDIYNhllBHkmiAVvukWlVm20EODX1ULw6
	 xesNZDZt8u8GXown97Q0A48ZV0ObQi19hDKa6RlOq/7QWtb9hBsJ6tBoeUIUL6FrYm+yA
	 PfARF0VA/kqRPLlpcDo6K4++nrfGUezXcwqk/wOcS40uWYlboy39N4y4OvAOXUYNWwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510324;
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
	bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
	b=GIXCDGjRqsE7VrzF33/IiGITrBne0nye8cHuibkIO1nF3nYiGRXLOdy7atKutwC2p5Ei
	 Col9LMS9ip8LowWF74GOXtkcX90mbBFXcHtdcC6RKoJFDGIiM9UR1R8ogL2K5bDG6J1dU
	 beoyhx/tyjK5PbiSMlWQeApYA7770+f7Q+m7LKk6BVA2Pz9LxSAqmE9kbBzepAHcxAvmf
	 +1X+rLt7p6OQZgjUlBDQih6fdyrADSi8uuTCzayXyCmfdjg++h2t4vW2qwz5G3poIflaJ
	 BYjhtLPwzo7vgD639nGs5FhiLA7j3UuILIQ5rmL+gRT7mMuA14Ix9Ujs2XW0v52OKvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tgPYUoUW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E292606A31E;
	Tue, 24 Nov 2026 08:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E292606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tgPYUoUW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R51+CRVD/+idnyFEcQi8h8IgHKdsyFIGZgWmL921WAELFBYJ2y7b81VSN46H1ud0lUvecTxUZ7xIicraUmGeBiz1dtG3754zuvig+lhHq3WlV70EVj3Zlk/9Cd9vUPHTR5PtZ1bv2cdEylb41FnvlVXninC7EdlRTsf9LuA98MOiADUXCffIGGKCxHS9S4S/Mtjkwk7KDa+TV7yJDM8C9Bb+SHsvzJGaO2ornqmNRmMjF6F2XRhLFaZBkS2wUpz6acYIDL2yt+kOyhITvaKKECrHKrPsbvM3hKkPPbfzs0lbXDetuEZMX2lRFnAObKp0D+tckd0V3xfog331TBnrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=eBdAM2fc/kE28hEZVw1Kk8300Q7ZMJHb58p2Ug4wxdIMqd9UPVuc7buE5lyWXA3W8OdwBUV+IY6jlboEyMv4vsrYhqHLljZWrJQ178wwXhIYIlpoxdI+PfE5vw4PZUgKjt4ZnTdPvn7AxVcgTP1v2/ZT9vwk20+pOCc/RiQRZKqtmTjVWVE5AA04VvbyRfjUqIdd1oJdY7MNyZ6jytacLZu8muRWNjLLlK6as9PzrQculM1dl3p5EjjHEWWtwXr0WpaprsRLpEJ/EYVo6HuTriBP2fbdb3VXGC2tVxQZgF+USEoEkH9kEta4hL6FAwPgtadzl6kjZ08422PZvwFETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=tgPYUoUW1GRDmnZVFoq2KiAl75D/gzLJRKH61Fvtw8FkyV6ZdK1h/+PsYoOranSWOQSTjOamGm0zM3PF8dVgKTie/55ewc730qKLdAKCp2ZU31hciDu2mxngCvrJatLeHzGbs2zrCyqUa78UI9FL0G+/WDmm63rSalubBe1Fe0A=
Received: from SJ0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:2c0::33)
 by DS0PR12MB7849.namprd12.prod.outlook.com (2603:10b6:8:141::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 08:51:57 +0000
Received: from CO1PEPF00018862.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::72) by SJ0PR13CA0028.outlook.office365.com
 (2603:10b6:a03:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:51:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018862.mail.protection.outlook.com (10.167.249.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:51:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:55 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:51:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 04/24] soundwire: amd: track full pad teardown across suspend/resume
Date: Tue, 24 Nov 2026 14:18:10 +0530
Message-ID: <20261124085033.682755-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018862:EE_|DS0PR12MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 074b2a28-766d-4438-b670-08df4a083205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pn7Uq2ig3iOrZh4203yWeZo8EZbZSmY+xpB+HT6F20jxKUFT6njz5V1NjJ/U1MpISAw6SH/PEkwT43O8vVpUFlVd4ZzaovV+2do7FOwhBMhHryy7uX9FUeOM0DzcOZy6e7O4RRZeabw5ICDTPHzuaj0AqDcKIS1Rk21BHrr8uAVWCx36xmyPU/+TY0NTm8ALLi2YAFykMsBu1jIapihXF99KRQNTwX4ZFH9wvLtQR46eOuxvu0zLrey47nd1f2B6tcsiG0gCsiJ5i1j7XS1410YG40Z2mbLuwn6fKxvNhEMFH0MBQlFJrS+7wMy6VTW5kb81cIbWEQM/kIeQk3hr8l8tNGbr170AuM4298fVkoZFsbaP2lnCYcx4qd9lk1nZfrQNAXzxYd8Qe3M4RQZ00oHK7yZ4PP2D3TjsFvop+wMHP7Ywv9YERDWnCUJ0TRTeEka5+xMS9YxqJIn414Z3iQVG8CqpkzZdxe51MXA9ykQA5yP8c3qruqvvp/Osbkeb+7NGnEE8UypfadWKrVemOsdTEjqyVrq/EZDHa0YH0+nSsaGyzSu2syjN9qIjOX2VcKqnAeCLLat2W0CNpmnb64jNpFRBXimXrJ11B2ao6+KwSh3t/y631itaGIo1vM6k/JJmcLb/dwZsVe1nlYb8g8L2v3bOpKrQYU8DwH0HQ3oEEdsqM/S7bO4nN4pi3hlDV5Ae2Oa2OzLAf+u6Z2lZkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GnmntrMowZK9P/IhVnGh91lvoqgP6Bs7tCv+VDuwj0c23jf4FdtPgenICuO0Oh18CpS8sPxaOxbVio6h2xFy6GHoG/QBRvLlkXs9ofHRY/0Hfrv0s1zu0MJbz4debavWrt5np2HL7VPgIq2167ugGYK5fi9RdHuxjyBUrFlwcrhMnzECq5x+wYLC2ts79c5w49pJA/EEo3EM+RA1W1/XpOy2s3bOtmyhot0Kj8G2NYQnXdKZGsXoZvHatYEBrv81NpLp3VDkCA717ZoQRTBW15YuyzUGnkjSl/2CmawbwN2c92Kz7umvlgp6PkJMCuodG/opbAl314pvcNHtc6auql73MCSDtg1DdxOmBZPHGLDw7Jk/8rAsiixL4aSI1CC0f/gjD7Zu5EiUrdPwEvOnCDDFH7fpRD8UmxOwKuJIUvLjJc0gBUbvng6z3S3JxhWf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:51:56.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 074b2a28-766d-4438-b670-08df4a083205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018862.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7849

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

