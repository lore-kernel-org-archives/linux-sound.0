Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510374;
	b=eim3OdY8T8O5atYqVmCcCzWoKVs1cnB9jwXIrlrKZHSKrMJaMTHishYRZfzYONdyz+7I
	 2JWHyCjCyFv72/TGIqtzEAtVry9pZ4LEfctCwqbGTU4XsjGJDq01lcPSgQHB8q7/KCfwk
	 qWxsbItGPmqHRb6X7Ke0+zK+UIPgxF+Qtr1/kXQpaFrIa6WkMfJ3EfQ/VcUr204R7i5zO
	 74ypFNYjRTsYajXAtrn77F060apV8REyO14Ch7pJXZOVIE64ur9qse/IUoDW9qh0W6Lb8
	 RVoEG14B+koIvrwiwe+FHNDg4UqS/5JCBcztdcNEOc4vdLKu1iugKlrWXVDERcn95Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510374;
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
	bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
	b=Q0RjATAeSfRXYF3cZC1X9ljZRC2d7wJsS7csGaWrwu4P2rUBF1MqkaXUExndXc08xSAr
	 GOpuKiOpnfo6Su/dE8W9iq5vAi3qKHrYoh7tuDTddsbePWnAyq45xTiPhdTOmJ1vt6evE
	 WRAfDclymKndVdX379VKlT4Is/UGOJfob2BiattOxlsa0cL6UKiHYQl/nB9GU8fwYWtT8
	 fdQHG97OR9ZAq4mwjU214aZVTDYb+TAEh92p7G9d9xOdCN/K2MbqBx80m9lQAMggPn3Vo
	 Cx/jr9ay2fl9v4U1lG5yW1jPqyiEnbF9W/0BBga5ekeQng7G6Z7bQ8ppeLn+mRh6GmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x+Zt025d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23F606A689;
	Tue, 24 Nov 2026 08:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC23F606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x+Zt025d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8dj1Y2oUvt9STtSZmQ/8LskcOlxO585QFqZ7kb14d7nK71TaMJUaVutk6o4/h1916fXiXE2Y6tv4vhbDhhX7BJMDXCfeY8CmYvz2cjkx4VzWvDXyy8g5aUVewjdlhQkVGS/GLyHfkoCnNtlHzuLCeiUzF6GCKK478NYyDIG/4V9WvURsQiCZ/O2Z3R410sEhwQ6AIrT5jSo5baHxawo8UutjunjxjPBaWK0OxvB7lATNMOmlQYeWvlZfcGLreX7cecNi+vwguzDd1LCb1dm80RHXZBCLLXWSaBm09LY9KMFwDYPmtIn/4OfEfVhnKbQx1IOJwe+/VAfQMQUlBdluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
 b=NajfmNNrOFpHiL8rgNFy1+B8u+Byjg/4lp5zq9+pq9pnv5EbNvSNDLNnKoQNPqkLyk2d2/0WwLF1yAVGHWwYlVtr05zO1li1Qoo5f86X/MFRPRlNq7ljTyqApEENbuG8rlXkOszb6tcTOBOgNt7YDRQVwTnCLVX2MyzR2UmSBYaCPKXqKPsR4+LV8k+zYWhbC2mxchOeyBXvAhVZwvMRSxQCJ8hHNB8a659CXnK6ps87Jj2zO6MzIiSW7tINJqPHzO1sG6dHVuNX1OVeWlGE/9z/7CCVBnEpJBReSedRDay9Onx+F/Xip/kUIpkhVL5PLSkS7OlgCswt/HvtCuQPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
 b=x+Zt025di89dRMoOqG/PlRTcHqcU1oARsPvOEpMCPTrE9HiKgetIA3bU1kWlrJojXSOD13EJxSgt3hrTwTuGMUJANsaAuE+0qOZOP7eiPDXHOLSDGryh4YNhavTXw7ZfsuGpKCap413/OKNen54w23mncUs4rjw5DQxDXIFm0GE=
Received: from MW4PR04CA0360.namprd04.prod.outlook.com (2603:10b6:303:8a::35)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 08:52:50 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::81) by MW4PR04CA0360.outlook.office365.com
 (2603:10b6:303:8a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:52:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:47 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 17/24] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Tue, 24 Nov 2026 14:18:23 +0530
Message-ID: <20261124085033.682755-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6a4d78-d59d-4024-9559-08df4a08514f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZIoYECBpMgW3VrIMpmRaueXdc+zfsvHH15fXi/AafX3vrG6cC1giMUW+KjFnwMuMFvXQjfytwZpxOrZ4tAT/xNEjsHwf1SXYL1KJRaN+LZswjGT97UOvzDI/BZ8HYea+aE0yf6SDrxKb5u0pCQTl8Fe26eFscjYjpMtM3DRfiiPabnU09xMip8ToA1SLPbEepxjgks5SdQ5ptHXiWazs+KLzwEAxcPrevv04o40O5duA8e+Ri4AMQ5pDGYmePgKssfeJq6dyt79xfk+WpXU23i+TQjtktMDjEg3VY0gEUFDKfrLJh4gKJI2EeJuR6AX9q5ymwkWwxDaHBDV9Vwshn+mGOghf31RfN4GNlTNhenN29PqZEb7vd9RbFuYYWdG1/4gfG9ahEu69Cfjksv0tlz43kZD5ulO3Y03C4PRYO2wRXxEG7WkP4L/n+yBo4IEnA2Dx+LA1lRTQdQzgA0aAmRwGIL1hJ/BdjJ6V4YGtcwWsmY9uugbCPgvje3f2HNbG1S52/8ob44PJkO7j6YG/9zq8gt1Cx6ndS0HAaDNOpBEvGvU6ehxi/N6f8tMnNEQckyuSkZaCpvc9gRV6EhuYVrxBQoSoj/AGyLOa4B3xcycZwQBRnzFQxtN9uvahB9ItuYl0Y2ZK2x8vnOkkZPcuvOjVmVpvQsGM0KTpuCwjayElKds5qyxdSq7tufT4yt6P6YsskM4/AjqGA2Evl7uRLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1J3VE+WX8VAzhikOIsiP55gHbIInKeDyIY9t7NC7WOLwVoj8iPkk5r/Dx2AoqeBtDbPDjnXj+PuQRqBmICVlfSvvp+ycf1GwtwTyfRAwEscMo/xx8Mh8gm8wnCK5+9AHEYGGfB25EfKm7b5+dc2xXcOPN9GNet3+Cm7Gfdx7rdvZ/bnYvBINjrbf/+eVI7imIfLRbpX4fFfw8oJRjbggeuwi8KqlVzHvdiiK0yDqIbNzN0BzGpNo99URaFXTtGchoKX2GXYuNdA/bCSLelCZ7rKrSAYuQVAOikakCpA4IuiwA3iIWuC3bFUzF7tut2PfjBtAAIhewqaa6p2a7LWeFyYbmbDJu9bn5F+lSTe4j3dVZrJM/rfpkQK0cn/BzblZntmdfFbDvjb1jHR+BSSFa4lpWD2BP1qCz88pXPz4876xX7hkWGoQhuu5mX61uiho
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:49.2996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6a4d78-d59d-4024-9559-08df4a08514f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f2b5c855bbbb..8cb661690f96 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1612,7 +1612,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

