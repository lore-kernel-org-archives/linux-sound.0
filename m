Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510349;
	b=H6f/ifwfw3FtjUk07xr/dSUzUjFoAWe2WmVKFFobICmEsJG+Eor7DGdzCEagc+QC7+Ji
	 yzzQ6OXWCbMy+BGgPi1Py7b220mN1eo+8MVESatM6J4QhKXitykqj0fKX3nmKG3IF5xVd
	 A3qN4VNjwhlNiEnY+E+4PbtU2ckLjKm6MmpGDQRkF87YqYzB+t4PIVMWqM4lKK1dmAOcp
	 8MMMBON2KwbMTF9z3xv8cZurd+KmR8mJFhrITqsulZc93pgw6KsoSExx50FZF3uLSTamK
	 AWIDMGv2esgt2k7duzzUFrBnkc+BgTHdb0/O+xYIl+AF2V5TJ3MCQtQcIYTUzC3VgTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510349;
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
	b=IE3HN0/Sj70UkUqeByAUHcr0p1hWTK58OH2uso03yOaQyW+oo2amDVNRaB+XD9E6QOqb
	 zXqDx5lyCKf/iTaD0DPr6ZHOrcboHHB/SkOQrAyW8tQ0uOV0iry38jEWPjaVVHOCH59Ql
	 tWCF3H66LUOxJ2zNArerKo6yZVhrxTjrtS6eaLtL0fLFqjm/TRm55dwWJ+QrlIlGKQ6G6
	 DfHkzvySwjZEuWVCv7gl1fWubYd9nLNhidJteKerGAU53DeuLnl3xrnZYDhkGsAt4IbOq
	 Wn27jtJhxffm5QxhUIntg7ZjQF9KRXHEA86azx2pUqo9LnIIH3h7u/WYpJjmb2pyheQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qfQ+iun5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B7606A31E;
	Tue, 24 Nov 2026 08:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qfQ+iun5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAF+YB41Qm/0DhEHQQ23yfoZPdaBKsA1CPSSvWLYdvRI70mYlqm8J4HcsIUbfU8ZTIhcjHHvCGYKk55RMth5/OEnwr+Cw96gGjbrz9lh4V/KP8fypye5Penf2QuIVE5RzcBIcpM3/KpH57PRYuk13UQMnjtcOSGHXBmIDQtbHnPMxCUQ1Zo9hTLM/e/dBlVZmViJn9KZjzXb3/YOyHRe+FQgDRAlBimzWFYQZQJtH1ZvIA8mpYg1mUS/ZmAJfRFQoumxF/AOJ5DSU4g/VYbrChLFSEx6lhKGeRWXZ8Y6cqi3KqU9TPBZ8nH2k508K/nl0be6CxLHYrAC0S7NVy9+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=UrnSf+Jumjk4vbaL2gcsgftwmskxZ4nufkJg6Wvq+YOW7ROgPredvf0qlHx24pzo5pXiv5dSbaFrWKi77HhuBVd5Dk6S/f4Z4Y3cO5xi3zMeKvZtlmUQlDGQGG8flnTSsmfLGxXDMA0xL1+tXleYMkUDe2ssAdOhbsiSFu7ZLPJFCtVO1F1BdzH0mAb1LnsD0x757ncdzmrlX0MkDJ7Zro+ZVT1imsPp110LFjUO4PLol5+42aHNSdU4qH2iUj9rwLg3HP/pN5aCDXL25amyB8fRQwVu957maKJ/yk+k9ONtURzpd1mmc+IfRwth40s4mJYC2qdSdHqWbILTv6Hhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=qfQ+iun5/fawn2L6LyUclmO5j3hNFHF/sd7iSLzYYbSijcTvV3jJyHI/vwENBs5a2qTlW8q6PY+oa/7VqmMeBnn8SdIBFcuudEncpZYdZjHXZFsqXQSVP9oz5dsBLUiLPik/nTEgHzc6bsrWLheMMDbcVVh7V0ygSRelADdKTNU=
Received: from MW4PR04CA0069.namprd04.prod.outlook.com (2603:10b6:303:6b::14)
 by CHBPR12MB377964.namprd12.prod.outlook.com (2603:10b6:610:403::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:52:24 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::86) by MW4PR04CA0069.outlook.office365.com
 (2603:10b6:303:6b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:52:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:12 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 08/24] soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
Date: Tue, 24 Nov 2026 14:18:14 +0530
Message-ID: <20261124085033.682755-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|CHBPR12MB377964:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e13e14f-6af2-4e60-461e-08df4a084217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026140227099003|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q7ZQmnHA/e+M0PLVvmz+IdwErTBVnUT1OLvFvTAXMx4m7F7GhkTbeyvNOMwy2Th9WRCmn3gpUI2AK5USEZzG663upQfE2i4oH6p71RCxNsA+c6i6mtWH9iXx8l7/Uo7IBunolvw0by1TV3DY4inqeZqNIlnCL3mWROM7PI3rLX/ahOcDqcRif04RgwV4crWsEeJqYC/Ea6aI6vYDga8484gxAhxlLB6XVE3D6KUHONMR8JbGcJNkO99ODKcWfrvwYdHfaHENvhO2lgI7DM72GoGvf1lN9vfNqPajb3S+CiBIisn2Mt8i9/7bwdxTSX0Arz4W2EKV9wVMR9GlWvLJ4stBm+5BLUJzB0cWTuFO4VHw0PR6BThRrnh0+nSMB9ZRZMA/28nH3cKmJ1ttwsTNaqZgcI1EdKZDTjTD3dF/HzP9PiWHUlHuLwXcITBPPK+O9JEyfvGjybJOF8nHOTV6cElnl+4+qlzOXhudK5MUrWT94mFnlyNNtJHffNr0CojoLduDIzfxkF+mF5z+IelDFXYg3KZDRszQYTQ8Ji+dBfzXHN0kYLkf9+k1U3uB2N4d1EDsYe3c+PSYPemZetWBnJAAyePxwY5/uYS1JyDSo0RWJUXlbTMgfo03JRz48JnHXDBiQ0u3uRnNwpFpmf0eT8XrSnB1F7Jwy+wccDamRCXQPZ0cEHb2QAzx/Xkh/XE2yDjUe37GHvSK621MgNCx/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026140227099003)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/QiSsektV6e7irEAM9E+XefIWI41K+BglHHOLKkJCY1DGGtD8oM0W7rhAOIsv9KyqxZywyt5JTrEoFANpF4iYLlT+LX/JZ80QaGZqNfuu0V+JciCAUZKdK5t5RzzaOuCQt5ktldN2i5RvFAAiSK484Fjnbh6CHr7KXgssrkbFr7+iDY/+MF0SsW2mXz02PXPxTZ6JlnEO9gcViyYusjBni0N8cci40WWSd8t3sGaf1z7XWH1OkHtNcPxceESgPHTXsn0kXMWbxZinAuSdr9+SFkf0tS2Y5kE2NYR6Y/diem0qfdYStiqJd3Nz4f4s+X14deeOsBHdTYSjBX4p6Pip51vsERUEem/D6RTG5go4whNq2kEnapcBWbJ6Wo3KbtUWH85+GWEcMZ0cJemTcfgKlmSSNKJi5Obe4sUx8ACubgJv/fko/IBd6afVciyPobO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:23.7565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e13e14f-6af2-4e60-461e-08df4a084217
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB377964

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

