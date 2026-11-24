Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510397;
	b=ly6aq5KBHGH66YncbHNSafvQLt53cvj6Tc0FBmMv4S/ZXZefpxgo/o7j3T6H+YQETfyF
	 irylFc0ciDUe9bWjp6+7K/SShTL7HQ3xNXqmmyUacMbzwUKHL1HnjGvZQig3t3yBMWjbW
	 7T5qrgNVwlNRq8QWn/+n7Cpk+ZiIcyXkNQguF32U+5TTy9GmblNkuOdCSgvCpo26bwEoc
	 nZz8+py3/J8nc9Ed+ukV2UcSO66hV919snrDNm/+Nkl5TzekZtbKpVPuHqhbpSWFIiEdU
	 z3wr5CHX8fJ9DLwwEq9bwpt3za2dBsevb8z2x6V/lZB3W8V2iBaKKcl52cncdHHT+eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510397;
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
	bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
	b=1yTD21lh51IHKb7HrysmrvRE5FAdm+/kPloJiSVFgU/AeP4O0dO1jPTuXTBtQ7CVYc19
	 0zuRfWvk9SQUxl+eWK3CXRsFOi8HnkVBiFAx5CdZieWYRrOADvw4ZOzDdqumpfyAyiVU+
	 bbcbCi+U3ff0GhI/paiJSidKEM1XVHPlzUPAAa4Tq7gREzVF/mfeLuKga92WONzLdXPOg
	 O0YuRjDnUx3cRe9PeUHIuCSVNFJolbnHOFDZpIoo3djbOlkJCXav0hRJ+2yU+Jxui4C1j
	 CmmSrCBf0VDbfVcXBfUd9+c02sA99BY85mWYvlk8zZbet7xmT93gltzbLjvG1jM9HhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HzyfqZox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.14
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61695606A32A;
	Tue, 24 Nov 2026 08:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61695606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HzyfqZox
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFJMJD0M5k4xBRiSYkjlTTi6gTM9x3FtqbL3M5O2Zyo8UVineUc3yicduttQGb4QwLgPExktmT+oSpO5HPACnkBEvQNuv8XxLDVrTKmVJy2BVpamVP26Iekq7D6fBOuS1pHVUm8RZieAXPewDDaP8VCUPX+4V6zkTt34M4r/S46E16YogaFL1z8vcqu5D4FeYGLLKcBo3RmFv2po3YSX3A/OhxNU/E8vr7noEteY4vF/34yjgJKHBHQh/PfMIMGrsRAfS3A0VHOagjhZLVLWI3pY31ccsoR4Ndwu9zSbo79WxM+7AV33oGiaj6448DXry3BdAwYk41uZMUqZLF6a1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
 b=P34Xp5VUP5h8Z7aLax7lJLQKgU8tg2ZcXJmrv3S2YVF2DqDyH2Qbz2XUxXUtSXoqBHTH5Xj2YFmEia2TlRriHbrOct8oqlFhBY7vMFx12GvcPtLj8jfrHlc0Eq4naZZgGI53T0bvDpYcAyXCP+s24i6QrIUIXaypMzQJ9bU376RS6XgddCNIRjYAxekScXVpMNAZO2NIw150T4qfO9S20br1HL+8tEJ4e1687vUlV867cjTGMdEhNbGi2BLU5z9oG5wMj7Ccfw5MlWLQIrSNEe/JuSdKEgVIz/ShhSAP03yg2sJSVOAcqsI/3/Cb/0OFn/FOZykRyb1F/lrvXa8I7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10BYQCMTXD3TcsKEtvJiB/8eD8F9kbw9Nw4rXn+4gVo=;
 b=HzyfqZoxI3DhRYI/leD4nRGbypPG/IrKAsyGWE6myeIw7x7QBXr8W0tstOJPM16mg9Yc+UHJ/eEnuJQjpgYcgRN+2N9KXSdFLjDDNoWzrru+GTyDnTO7+Zojhf3PqNLaR0eaWwGpps/aYPVJGaey8AeBoPjJPe1Ch4O1M/8cLtU=
Received: from MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::28)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:53:13 +0000
Received: from CO1PEPF0001885F.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::99) by MW4P221CA0023.outlook.office365.com
 (2603:10b6:303:8b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:53:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885F.mail.protection.outlook.com (10.167.249.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:53:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:12 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:53:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 23/24] soundwire: amd: fix shared-register RMW race in amd_sdw_host_wake_enable()
Date: Tue, 24 Nov 2026 14:18:29 +0530
Message-ID: <20261124085033.682755-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885F:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 492a145e-84aa-4603-ae1e-08df4a085f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zX3IoNctaGLFBMoFowGsiSYzpwk7lgKUX0STMmZluQn2lQ7Hb8uISnFek/1mHHxfnBVHv0mV5GthOxfu7ujqvcJzOhj5XBErUspMcnpoUD/CQtXevpcwOr1fN0eQdkmDIXPX4FEl6QXF31m8vNVk8fox7sfYLDiCgPuiLAXmvuc8uC40IgmYIm4pReRK9HE93CUD7bPmrGHHlZQQLlWp+TELFRQ1STNoUqQyVF9vDjIQ5SOQgdsuEu0h8pfoIb6nDDUI6uuJzmxMME4gpGd/372lZljt4PkEPlUxNyzEg9pcF5EO6v+aCcbceTNvNXxN2uU5qJW6kp/BY+00cTmPtNwcddBLV9IAK40SVsBzMGQV4cvrB/OZwW9SLRjWJ86kygbKSLfEhs28ZW/5eMXBVL+0OtsMuE2mCk+TLm98jvIEZTA06P8r/1dUdIJo0mRWuwJCdkHCfTITgG9RTVnRU3TrysW8VRPUyWoTDyNbeVePvf4fCMVr3MAwiBKn+cUaGGDrU48iCxBiB9EBKApeW/DgmcI30SF49Mtk0m/lmMvzc6aslQFcinSjca9yqqonErEc9Ddu3Zi5ueZn78dWcZots8yzZS0HHElSJIbskqFJpBq6qRivf2pfKkoMTkOJEfWuVxFPzKCnhFozojfVuI9kEA43iLuy30zqAX75DV6wPG1GSTeuppyD+eHk4FcPElmLh+q+YFKCpYf61diEoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z9p1kcCCiPrx+aFBVtSz6vM/jsY2J//VRt/olCuAqD1Tkd0fMF9NR1J3qUwGB/8qd6VvBxYyfz+Yge7aDHMLAwilKVDJGbTam+k5W8BdAFrhBr1+hQbs38gu5BPFZn+NCTMGsz3L7nj5trykBpADvXe1wFAMRQPs+Htwo0szTYSnK4/PDUAm4rQXb57itVMMV295N6jwd6SLrug1ZeqD5AVtO9RH3NIwvfxIb9miPybYDaDlN5ol3BdoSSgkDHYN1LEHitbkne8xk1/q/wVwrs9xi4V1N88n86KFjWoucWl9RLqFqcWzsuBAMRls6PityEsyvCPM6kgs0IMh3N3J2n5FtotZwzRpxuMGGAsn3ngBOQjRkPD/mc+WGqL7xQLptEgLws4GTWgglJHUZmw6AAgrIs76wH0AtsnEp8VKB3acNy6IyfLhRSZHKxuYHAjz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:12.8388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 492a145e-84aa-4603-ae1e-08df4a085f58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207

ACP_EXTERNAL_INTR_CNTL(ACP_SDW1) holds host-wake interrupt bits for
both instances (BIT(22) for SDW0, BIT(23) for SDW1).
amd_sdw_host_wake_enable() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence.

Fixes: 3df75289ddc2 ("soundwire: amd: add soundwire host wake interrupt enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 988e879f1599..b0e40a1c808f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -333,12 +333,14 @@ static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool en
 		return -EINVAL;
 	}
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
 	if (enable)
 		intr_cntl1 |= sdw_host_wake_irq_mask;
 	else
 		intr_cntl1 &= ~sdw_host_wake_irq_mask;
 	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	return 0;
 }
 
-- 
2.53.0

