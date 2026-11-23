Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453728;
	b=SMBuzk8W0OQzlq7cC09Wt8Ya9mO+azON1cP5MRYd0kTabeUzSdcS3oPPEnHd+qDUEqkY
	 UNdTwirWmV46prpbV66B/MotvpkOXXVA2v1QHWvfnvT703V0w4zhgRR/wi0hqq0uvyI6x
	 W5WyhyierXYbNkFH+6EYHEu8MaHMSO65KFqQuiGQlWbySnW0tUCdXQf/2Tdx5/u8/x+v1
	 24ziwtg0K98zTOhBIXHmCybyaWIyQjfRdTkzcQu4+W/1kYOjUms5Ku8eLwbyuNpTgLJOS
	 /0vL6fhyBT4Iacylf9o044gTaQOZNNIfssWd1CXMWH8d8nGCPz3V83x/a230uyu4Qjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453728;
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
	bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
	b=xM76WzcikvguFxsj1H7xLCRQ7cZxW1cPz6NwqJLhgxdOQr6At8CSIc5PBSSlHUDYmah7
	 IuLg/oU8LLY+89qX6goNODHbV0/e5T5cV6A+1St2RCu8h8An2zzK+aZ2ItV+NRpDkpmNI
	 6f/5pW3fmSCxfEH8GG34l7C5SFH3ZlHRq0agjQ5G0VUeznftOc3whscZFJJSf0xNamO3M
	 iDq/uQtVnzbQNjb5knGf92DRjpxT3eJySZr6et+Ip/EMrKJMBhiU66f0GPr1X2niaZ/Su
	 VNcONpgCfEmt2rT+/8vb+PJp35RxG6cRZW/Oxg7nqfse5wjlNF+vRbhmr93kr4WIJsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CnDB4zbM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.44
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD8606A6AA;
	Mon, 23 Nov 2026 17:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BD8606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CnDB4zbM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQjuy8F3WJnAu8PtKVuEheIEm1rvbAkk0mhSWFjakBNSTH2/EETizaAbV7OhxDRwevL3HRD1pTKA9/lqSqk1M8Fa0K6kIoQJD4I+L81U8Xz4HbxJPmUywOjtNIeWtqu0F/SDyCn/xcIeInRZ4XarNKqKDbUldUWD+YmunaaCIdnPY4gpU430/OtZr137ANkOAypXXpec6a8+e/a6w2jBZkslfVenAV13HOdZET6eGU9cWidBSTIKmPljnMbaakkklR3Mume7XzGHUS/eRORQqk+fIfrgGjt4dAp5b82pvCTXwPZ1Pp14dwml4r8P2OU+TSilfOHkZziDC2ulQRwGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=XiEg16DYTcXes4ilsLNIWpW1DDvzxzzAkNjTa2A4g/sXOAw3ABvdCPBqeVWg2zTXxv4WR//HgikibfWcLrFRDsYwQJBUP2KpFMUyJQEyGpTIjH87/gJUS8XIrw6HIkxjdrMLuTwp4MexTRtu+6ZzRqMSMcoCcpTWc444iU4rUNgQl6/k2sGIZ8L+ou4e6K/oYEVIBNfddqdN8TjgVbfBM5p0BJwMJfLzkHPQeSmFG4QXOckTnEZx4IJnY9fgPGrneeIR5FswNsfkUSTvAoeJiZP9fgbVW+oVum6YuU/05+Vvz419QaEWob7unqwGP83fKX1WXqjSidofyYJn5/R2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=CnDB4zbMRC+SHYhKr606XwsCPy2IybcIslVRTAxB3egzPl28g4bGMzhnMv/Ma28KUTO460WnIPlVUOCdYdVdclO3JI3j+ZNjxerWlEHViMO45cTaWl5QbBE96ZMsYZO7Ds+LygWRQXYvWnNQScSgscI7ODxWEMj2FudiKTjL+e4=
Received: from DM6PR05CA0059.namprd05.prod.outlook.com (2603:10b6:5:335::28)
 by IA1PR12MB9497.namprd12.prod.outlook.com (2603:10b6:208:593::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:08:34 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::a8) by DM6PR05CA0059.outlook.office365.com
 (2603:10b6:5:335::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:00 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 08/24] soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
Date: Mon, 23 Nov 2026 22:27:29 +0530
Message-ID: <20261123170520.1380924-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|IA1PR12MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 254a3526-be68-489d-272a-08df49846861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|56012099006|11063799006|261022105027099003|261026140227099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	nngeqOOsfFtz/DzRKxfDkT6/d2DMF4JDBTNBE5aLI8mXn4qeB7+rz/w3bdaw/ZEsR3u9Anra5V6oxWqc4DRV6uquBeL7E9h44prGLuUjUhDyB/SF8fvgNESr8x31uyVOGIwm46tDnnzsI3T+/iu4zw28lnRwecfHLF3gfRPhYPQwKQmjvlbQnPyCeAfoOidAbfyu4RXdW+eklWacWdEa1GSfciOO//btYV/QQwfTdxYWPTKQjQZBKQbPZXGVAQRl5BONHRFQCuGttFke+qMLcgrhtCLAyymyqkMLhc6onljmCStHjmMgGlSGgIpaWhBvh4r7YAD4iup3B9e5S2wz1pKk7KV2r4HVwX2rcjubexwAw1MXKdAXcd1MJKHscWV+OzAgsQODRZyVbcMoIHN8bXjJ6ZCKALkP9Krcqywx+njTGBHc8e519/dfxm8/aQhDMbL51VRsvO6Ubm7BiBjLowlegqPXe3/Olefbow/kBqIQBQXTLvSXaaVDFqVqH/ahIvtXFY+4/EY/NgMo8SvWPPoJztZ/1Ufxeze9jSsGJjr/crHXrcqFfmFAg9DWNxTQq8h3jd1UQt9yPV4q/ZMEHMJOKpHuWaEI/m7mW+d/1r69org2EqIC93NjlLo6jwCBPJ5Qo7t4tYVxEx4uIMMlcR3b8UDoqmbEKH6t/39c+1yQQiyJkjSrYRNYu6sjmssRW1t4ro90hFr/zJ4t4WsSog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1iNNj2zEuEjfet+hFEX3EZOcGa/0m1h457oP44JY6YfIjkDJZULfYb8xicPjf8lNszGYgXKh2hH1hBFj1Lo9LVUB0Shcwcisdqr2/D83arTPt1TallrEhcyRXN6dTt54dF/xqMC7+qaG/a/AvV2fSSJ+NvyExtn2aDPNoCqjNoJB5bczSU6id7sfDq/fCNlnJ9npH+VeFYjn4gTkVk385/ixmsXP0cKULQFymqyvq+IzdHrpL/NcLbXkGYbrOrCKU0F8souX7LyEDv3AFQoGI2cvru5ry/tylNf09QsKOObanJxuQP2ByfcXjYco8APPuX+HmCcGLFp/bUiY7WEnxctUOvNrv2GTOUfolV93+7zeSxJ18wgFoa1kOcr45x6scHPPaL02Cj7TiTJp8eYaRzj+V3crc/ySEQHoQG9gm5UW3RtyjcDBlNuZf8XyIa3q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:34.5312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254a3526-be68-489d-272a-08df49846861
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9497

On some OEM platforms based on ACP 6.3, with a SoundWire topology
where the UAJ peripheral is on one instance and the speaker peripheral
is on the other, wake events from the UAJ instance are silently lost
every time it enters POWER_OFF runtime suspend (D3) while speaker
playback keeps ACP in D0.

On ACP6.3, unlike ACP7.0/7.1/7.2, there is no dedicated host wake
interrupt path (no ACP_EXTERNAL_INTR_CNTL1 host wake mask bits and no
PME wake mechanism). The wake event from a suspended SoundWire instance
is delivered solely through the standard SoundWire interrupt bit in
ACP_EXTERNAL_INTR_CNTL.

In the POWER_OFF_MODE runtime suspend path, amd_deinit_sdw_manager()
calls amd_disable_sdw_interrupts() which clears the SoundWire instance
bit in ACP_EXTERNAL_INTR_CNTL. After this, the wake interrupt has no
delivery path to the CPU.

Fix this by re-enabling the SoundWire instance bit in
ACP_EXTERNAL_INTR_CNTL after amd_deinit_sdw_manager() and
amd_sdw_wake_enable() complete, when acp_rev is ACP63_PCI_REV_ID and
wake_en_mask is set. The acp_sdw_lock mutex is held around the
read-modify-write to prevent a race when both instances suspend or
resume concurrently.

Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 438cf52a212c..3f3fffbd529a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1467,6 +1467,13 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 			ret = amd_sdw_host_wake_enable(amd_manager, true);
 			if (ret)
 				return ret;
+		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
+			   amd_manager->wake_en_mask) {
+			mutex_lock(amd_manager->acp_sdw_lock);
+			val = sdw_manager_reg_mask_array[amd_manager->instance];
+			amd_updatel(amd_manager->acp_mmio,
+				    ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
+			mutex_unlock(amd_manager->acp_sdw_lock);
 		}
 		/*
 		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
-- 
2.53.0

