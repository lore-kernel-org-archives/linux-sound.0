Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999013;
	b=3H/I++V9foZNVI/P5vDzWUwXg21yYNt1iLl0e+zM7LlQxZWC/S3s+hTKnuDVluwzUVrD
	 bnczt1GBnqk0OfnnB+79cbmkBTgo3v0nBgkVrXdKhyysZ6ugE0OcB3D2SYmlguWDFUhi9
	 TwHpRw8nhPx79xAtVPJMLFNFqLegY9j6XKCUcV13v8VgZuStllXXkN5VHf5nL9K2OEte3
	 lj7GCfnguJfM8pDRErrTaVNKx9REpenVW7BmT2dYwaTjIirRAO3v4nj6IBUEZY9yr7kM/
	 VctVARkbvMh5iYSSG+ukdENRFEE3/0snfYNE3eywcp9tLJBbItHFlqXFUlVKA0NsEwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999013;
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
	bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
	b=1Lh6jCBK9/iKcXXIJhvpe4o/7F00rw+Im+bJ+33w26b9CIHMP2r+oMp2PsC/xhLbDtQQ
	 jDM70bI75jroSRRJRzzHuhfQvRfPqarP5I3zUMD06LBcqJ84VW7kkP+85mMOJai6zBGL/
	 YvF9nX6DFSgl0Bg7sWJw/jDi7tlNRsmLR0EFo7V3SI1EiNYrm/30gLwMtLkbjgOiTrKue
	 lUqyYFcD+pERL1+86ruSWnUN1/MKhWILGWa50/WImvOBLOmHc5EYKPdwUXIrqOSoBEpuS
	 vAfFs7kJBjhbPYOUWMIHfes94rRuBObfZL9wZ2+W0wps1syGNZKUn1zfyllB1yGHCYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QW2P5Nom;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE49606A325;
	Wed, 18 Nov 2026 10:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE49606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QW2P5Nom
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPXuJyt2KXSl1iu9d7Z8GzBatx7MeDfzqwg6/0JiHej9plSL032HWiFYUE4hGTLz2QI4q3hjYpVWYWj42HEOOdGwkXmFc1ngPM04mTG5mbxHPR3goZa0UYCn0eMxESBHsdQ7C/J2RIdzwotiOAKzDUL5vofg7UvnQQWkcK0MPAuAbKUCV+0iozd727QpuWGRnwSMZPvCvt5un4lXw9q5lukC6YhG5qbP1hSeKFAg1KLBfTX7doYFSa555a71qoK8ddMlmYXkyX+sHCOoTdY5AFkd2dY5uPC5rOjt9sAeG1zk0FomJzMyezTXEWbMHx+jp8GcsDLobrt6MMDTlY7wwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
 b=GkCvq+zoF8PWzXdukaAjR3crv6Jv5qtzKwPwObIBFc13VXVWjBZmOeKjYo73M+hpK7w1PokRFPszXCxGAOGlgSnSFCaWYUnDANzZ/Vsdv5OsHFk10x4vqerJY69Ka5i1cPD+2nr+Wi4NtKLfzo7NoDk+seSRqBoaC8B/9cezwIEmIBtJ2blGcmg7MmRGnkHhEpYI1FZO2eG1pueGWCsf9ZaCnoAyBdeVM1FjBqBXfN+kD1AsHaN4Lp7YRtBmYNaAzSOoWbtQEMqa1tuGXBsc6ZJd3f+v8ELmupvrngmFOBLK9jgbwrFa+vAHOtp2zj+QzhBcZIidwJarsBGkBMwh3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
 b=QW2P5NomZkjfAuCkK/0vN/78X1U/r0pfBxehlBD09pM261nbG/QEas046qxgIigiMi447DUXlI7+EWcxGZi19mPLsoWCcZlyldEfXaSquSjlsq+cN3cIoD8MTLTWpZmpKNdKO0SwiDfIiFQpOGrOeQIQKAqEdLgUe/rpmPoeL2c=
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by BL4PR12MB9508.namprd12.prod.outlook.com (2603:10b6:208:58e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 10:46:45 +0000
Received: from CH2PEPF00016D4A.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::2f) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:46:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4A.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:44 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 22/23] soundwire: amd: fix shared-register RMW race in amd_sdw_set_device_state()
Date: Wed, 18 Nov 2026 16:12:41 +0530
Message-ID: <20261118104353.331556-23-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4A:EE_|BL4PR12MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: f4465310-24f0-4e2d-46f9-08df45613d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|22082099003|18002099003|6133799003|11063799006|56012099006|261022075727099003|261021121427099003|10067099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	zovCIiKi/BtrKQVrjforE84o6vCpxkCSkk73XSH467vGnH9L4oV+leKCfsg25Ctev2yWKuvhtoDA2v7bFPZJaC6ESLPB7L6mdzFbEAIVX9BeIW3Y4uVXVnmXTNR/CBDSAT8vAaTcm3nAZQt9GyyS5AGfxubWaUZoKNxJLdaWgnVdTr+KGrNmifZaXDhl8ozakqEne1qKAt0vmSi+2nMJNkPxdeyamCGMRAtf5Pi9+jiExZYXwxpwcb6d8GW3L44EKTf8RiZzeyclEiyVMOky3uFTLjdypn1AHX6+J2NpY7nUnIR0xoTw3upI9hd9+bzZ9hREgX3fscD03C8dz0dLUyp65qDVALu7OnGfvVeB70GyZuz0J2zYinl++BqFKEkInTt6O+xpgwhKD4efinUqgFZZE4pqIIkEyJYiKmX2hfNfkmNZ8ffy06eEwHV6V8jNee4+md7+UWDctOoSk7K43DYC251RiJJCnu7SJAPSshs2KdkPVqxhHazSZK+nPhDHMKW92fL1s2pInVVmoy9t+gp7LquUVYXkUyKhwXJPINfEyV5SPzZveQp+KuYup7rtkjhJf1JY509Cm65LXBb4ICIhyLtDjFgZLcHETvNc1EbpAkb5gatrPn0lop6Bz7/xXoqZo5j2OFU7pXW6ias14nAdMX1aJdd6QreCxK9ah914C4HleVBUH10zqB9gXxUifpoEZ4oaJjJkARFtXEG1Sg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(10067099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6XFSIVaRM7S9VhBlNwN9IYRDpdBwJRl0abSvo/VSMq+rR7P+zUMglKrQVjmIkgB+e4Hcn3kNGIcIabKeg9oLDsuxyMgSLdWN5/5tGP80VTfWvzfpn9HdvdbHaot2aAKFPn0J/RbFCUBPzVmtJPA96MKtTA03x3yPBfb9GN0DdfZRn1hB94OBhDIT/o26+R5FMUKrkFqwUgiGnRZqBcFBBlamx+GfzpgpKoWYnuQJI1Ro0Pjrray/2SWg62ztXztv8dM7L4sio2KvfgcHc51oWMWMcmMur++r92iVV4/cRStIK7o3VadYnKEmlMnAojC7M/KlqNFWO11kjyGohaAb4g94pg6cJVjIHvnRJz+h7IHyxDCRqPhv7w3I0cZhatOQlgbCwszwwkvFabxOYmbNgxc7//dxUAf/cIAiFo4JmMYFNLXHZVK1uUESYa/Fjj03
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:45.1825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4465310-24f0-4e2d-46f9-08df45613d4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9508

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
index 4f997198f5fe..b882ec4d5cb5 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -282,6 +282,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 {
 	u32 sdw_dev_state;
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
@@ -293,10 +294,12 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
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

