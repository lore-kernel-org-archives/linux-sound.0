Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998751;
	b=r6McDMyIB36pejC2a+kS02Ntg3Cpn1+kwMIdo5CJHnktZuu46Azz1DxXM1ZWiEpqoU4i
	 TS9FLf4gkJKl7qnCpMRbJEK9utOjUVIvBat48Lt3d3LCRqcRJU3dHGAmyaltsuuSbA3Nl
	 DndgjntU+tS1PKIi3WqZp2Xcn1LgmsHGXuf1DFfP8ww6jetO1ld1DF43AGwhfAS9TVMBK
	 5eGAbMgPxQTFTUT5LYMFe/6Qucc+haX1GIcs0+oVzeD0OyvJmFGij8cy5GSYxN234DS4Q
	 wXH42OayguZxe4Z5gcbhQE9XGS9a721k0G16SkYuSNRZWh/VbtFv6pSo6Tt2LdGTdPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998751;
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
	bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
	b=MA7TX6Br+yCKNNuQ3ui/JD/ZE96m/nauUY6yxJgkZ1CbtLRRpK6rcImz3KFx8pC4EXdI
	 Er13/6wsKCvGaNe8htF0+q/RXpq1J0Ar85XGHXn4igB8DDY+VMjPyNMj0GxRzfkFJVSa9
	 a1n2oPEtY7U7OPZnr9IrI5ans3DdqvlDzOxltMvaOzWB75iL891XgEGvN5KahVkkVyK7p
	 NqaIX7Pp+saltXhanM/QlLBt1uN+VCRzYjqhluUxfK0H1VpASQiGEaVsY7AnoRWJW1+Ri
	 FGgje4y6DiuaF32fDHoZbnOZCuhuyEHnmwrXo8EBQiNLreczU0m3XDqGvC6aCqQbjwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="kQVT1ok/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.42
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC6606A325;
	Wed, 18 Nov 2026 10:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kQVT1ok/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRQqIMnrKYVPCSq4/HNZQt9E8Em7pNSRusdRRZZ3QVDDHgp4KYeeWK84z/LKgjfWU6slaPR08Fdhz6FPvPivM/idNFGDaZBQofMrIomZaT/3UaHrGqaUprFQX4GpOcH6jKsGT2Uzur69iIOAGg0bwkIBuG2h19IndKhGByQrA756c4rd6x0+OBsk9AsG1yqDi/NQf9EdjkURNujssMz9i/9nzQvKkdub6zx+l3P2n+in8FC8vaOpf/Y9/i1y9w9YGpKgrXfDHGBZLPpcGsYCSJIn8UvOFlRpKMFO42fOHZ9TudVs3um0SOoSAxNWhKmO8w+ZnHx3Dba28p4NQZVrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=fU65S3UBgTEF9zht57NvLFKbAF0+pNDyws7qEZccbaFAtjQ+LsR2hdWGXdm4+DFIsJdw+mKWI6CNzjk/PucB3O4ml1Gdv96lCRdFwgBvctJfpLALcJzII0Ax5dM9Lnb4K7pVLSdj5wbtOnLLIrBtGkxT+g3w5MnweFGDyOgiVx8+XCdRTk+p4N03WhcZWpFi/Yis9N46ETV5mq7YuS9l2qqPe/mA5Ki65s/fm660OKXAT3xts9z5ILFLGs8kNBnq0oWduruKiV/aUIQd4AoN+9OBSWDGL1ZMv0bFDtzCCUEtrH2Fz64NpJGkaWJpWrOKMprXlYb3LO/7ubQ7hJ1eoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=kQVT1ok/wvDL5ZLzbw/41IpSmvx1dL9PJwEVIRbKtixCRsrHVkQ7b1cIFfWsBFC2NJMzoyUS4/zueAL7YKYG516mCcnTvBreP3ztOKOtEGrbh+1vdBCDKvf4LW/DtQ5CUrD0rCSIA+e2LGbE9xDohEktUtO4T9RhQ3dEiP3gkmY=
Received: from CH3P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::27)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:40 +0000
Received: from CH2PEPF00016D4C.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::44) by CH3P220CA0009.outlook.office365.com
 (2603:10b6:610:1e8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 18 Nov 2026 10:45:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4C.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:39 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 06/23] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Wed, 18 Nov 2026 16:12:25 +0530
Message-ID: <20261118104353.331556-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4C:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2e6ca7-f419-4921-5ae3-08df456116c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|22082099003|18002099003|261009223027099003|56012099006|11063799006|10067099003|261102123227099003|261021123027099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	UdMcZa0SjSuJgv6V99klnfRUh2u4Eq3kn6am4RrgMGQ55pSw9sqkAxEcGGfjs7hn5utsZg8WD6Y6wPYxnDw6fLzkcxkF93XjOm6iHNrfdUS8oY1Yjk9HunvsE5dAFrL7wWlmxlCtUTtzHTT9qHGXWxX1A8NPGkzFBGW0J/mbjRGaxn7O5JtmHAZDF5NMRgBIjfrrdGGwDObynRJrsQwRr64GBgut5qokIcZsEw04RZtbEmlovkSoEeJ83ZgCvN1UijB1sKPrhLgNdi+2nqXFix3RMtFaqJrqphOA5aFw2dhjlEWj2lx0b5cY0opTeesZApe6/AhXA2LC3PKaMRlO2cX02FKjTFWHP3Ns9HsBLakTgFseRisJ7yJt7rJeskFI11JhwaCv0aWZ5+tF8jkWEOYsG2rqaKnu6IB7Od/LkTR7Ok/+3bm8tRwguRApnFC5Vks+MhohuiePS4BfrbObEe112dYMRm8JLZ2crybz8ZMLvjgxfgDHIBGwiyIOFXLQN1P3L4olAhuea+a7fXyYS8432JX+2hzPKSErxnMFawZ9CVQSZepzCZH/GgaTLsNPRQQicGZumb1SoxNH8lSOjyJMsRUVJwmQuwp1xvGjhdUExpVZha9cmlT1NOcbPf5sZ6rEleUkv4s0Y5DW3UhncPurH7lIacC62Nj9w+Fry5rKwOvVwiGEO5CQr8IjJ2/ixWzycwKDJp97GgGukPC1rw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261021123027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NOLCSuRIQ+C0I2V2wqYQJRHx3apyRSF8/4A/xy9wjoSaQ+JERsHV34DO8BlzwcjMLBW0E1pWT8+xCCCW8K2iIjHusX8zfI6hj8wwD+J7LdDW47J0JDIzqIqPVE/mg7YnC3UtiLh5Qu8tZ3NGiIMhoBweTZvcf2AYXpgMddfN7RTfVXsrBFRVVKWM+eudazulazlJa73qtYrjlnBPem+wyKlfuRQCbipxUnbwLg0hejbErw+mxfA8F7fqh3ByDdE9cBcoVmuJ91gCcqPvdtyZanXUnP02XbKOhHkx4hnjvL4s4skijn8a5WwvaDbNUoTVoisbJTtwRLvLFZq96/fVrKF+xYNNlKTN0YEA1V/gMLDh0h8JOnoS2jiZk6n+l0bcEcdThDoGBF04I84ripx5xAmbI4AsNOHjipgW/Rt+ohHZzkduudF6cIaMSp/XGwNL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:40.5632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2e6ca7-f419-4921-5ae3-08df456116c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089

When a wake interrupt and a device-state change arrived simultaneously,
amd_sdw_irq_thread() returned early after the wake path, silently
discarding the STATUS_0TO7 bits.

Remove the early return and fall through to the normal slave-status
processing path. Clear the wake bit from the local status_change_8to11
copy before proceeding so the remaining status checks are not confused
by the wake bit.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3d60bea82792..65626ca590c9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1110,8 +1110,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
-	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-		return amd_sdw_process_wake_event(amd_manager);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_sdw_process_wake_event(amd_manager);
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
 		amd_sdw_read_and_process_ping_status(amd_manager);
-- 
2.53.0

