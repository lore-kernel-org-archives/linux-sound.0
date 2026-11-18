Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998884;
	b=lB5gdEXKfCqRYBKyQ1ZdHKDUaVhez91Uqy+lyRfvdInh/+EP4IX5D27z9UrNF7e9+cZl
	 WcMSH7KE0ghi2iHViXVZk1nvuLpIMGtS4EKfZairvvz13qOUZb72lzfuhrDk1qj6phssx
	 xFtaipXEQxiwSPee3DXxrNYIpjdrYe3jZUsFWjo/p1PRZJz0mxapy+Zj2pxdq3QFhNL1q
	 V03jZA7cREMSZQhLpq6sqWDVtJaO7OcDL4/0kQxzYSAFMwFLUduB1ht3bIGb2tAYqmPta
	 IeFPvqlubj+jPyEzyFf/FDJPX1sxfh3nSb7KHjbIL9JveWxfh2CRJyhsPWZFG7J1hWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998884;
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
	bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
	b=OfvYD9MVjTlLUDBV9akH/JxLJqpIgFRwHbJinyTl5EqMfQx/ldRnDQRygFbC3c29yWWv
	 etXqY6SbtEkWeWeg9yeD3Bm0Q6yr231pxyedteiSCJpe/C0IU1kWHBJzdYPMNX05oQLGh
	 Q9mE/8Nb0paRmIWqMbcACcTo0NEK9kPZQTipAYX7Jqu2hSW7qDTzZ+k151vOcJu+ssXUJ
	 WAidv3YZ55m8Sg9QCtVy8PCLCVc6Q765cZ+G6TXkrEhxsO9bE4l99nrNLitvKbYQkX2Wq
	 dvP6qKYS906KgxsJkkQkfbTrS5QgkxhRA3SVWYy0k7mgxhzgae/lXJKVxHuI5gMUJWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qIjS4nz5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77F606A33B;
	Wed, 18 Nov 2026 10:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA77F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qIjS4nz5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4Y9uekNNWifOGYu4R5vg26qWJVJiimOv280Vb9cGtHw2QqsTQ9dNcQlU+bTtU63ULq/MFqYxL7z144kigG9CfBPHegLdOjjRstl/XxT3Xr+CCs0rObRE/h/DhLA/vYUyJeZldEQKxx7KklyQqfNP3GH9mHMqKjkqDpn3JDHvGs/8VXZbOg8HffhCU41sH+xLTXwqvlAe9Txm3X4ibEIaSpXNBQKrl7w7iRKa/TRosaExlmbV639cuMg5wLIeq7Wr3le9ykXori9skkt/cFhZDeB3xegmji9tjC2XubFZjbqvO4+FY5YrvMBy0/wxlhMGpVVDEg1PevYZWVz8pwpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=HSO5odNNApIc8xNMKfLfDREaqsWYQKBH4yf/ESXSarjybqc62pF4hgY4xlM0VFCO46spLzkjKycSx6XnGc7WtrYaoHjygJjYHdLupErE3VQHihcbf73OX1FTCBc04lnGSeoWb0xBAfrgl+KXQTMGFhWCa7TJSWQpF6hXJXctEyUHSrQeUpwcpqONxblsRdInFy2I+IsztYtU+h1exl/0wR3B3MnB4uPClnC+mb9ZA2V1hxmwEihJ9DCTiPxaKXemEC4Qu4rLUvJ4I3LriJco2bzOqrkUzThKDqzOEXCpSpRN9R7b1OEJY6iGu+FLG6aQGN0oOLk+du23D1Qb/7xyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=qIjS4nz5ZzWdIotu7Nq5FzGjnyBXsdyz9DJyioboN7h18ACKXGZzJ4sw62C0jsTrp2gjmbb6Ud1HtCGeIHE0GBC69AGjlBgtascbiasR7WqcqfDLAmMznnufJQCXNi277+atJGF9DkWiowPazWtLRTF0MhK9mGthT99nkgcw6no=
Received: from PH1PEPF0001330F.namprd07.prod.outlook.com (2603:10b6:518:1::a)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:58 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH1PEPF0001330F.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 10:45:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 05/23] soundwire: amd: fix missing wake interrupt and group wake-arming calls in runtime suspend
Date: Wed, 18 Nov 2026 16:12:24 +0530
Message-ID: <20261118104353.331556-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca67ea3-6115-4b2b-7904-08df45612160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|261009223027099003|5023799004|11063799006|56012099006|261026140227099003|261028144727099003|261102123227099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/x2cGbFT1yrtjN2SPMGrVq4d04a9ayfTvAkJucYszk5IzNprSkeAvWL/2/jxrI/SZ66KiAHNm1BWKmihALuWRFbUk9EHg8gXnGXQnLUVDLKWTcl6jpc2NQCS9BQboAggYAlvI7llo8X92Cv5XWvYbJkvk88zxXXWUpnA2koj1mRt79MOUkIRBnHImCC94JbpRkC8drbT6CODV2k0B/EzeNx2dOY2Pai7wqsA9rRXHyRij43c6TOYofI2mmSSMNNyddzenbWNyUkwNu2KHEIoQ+kwILgy8dc9IlxmOfKQZ88daJrHRN4j6TidgSHjWG8QRzabGLW1DujB6YisU8VaY3V71h8YwmzgOkHeKwBHDj+SsOOCR6C5Ti6ueAGwTQv/J3pV4UMKNxzaNGj1j3wPA/BGVeWb/1viCYCUEwBkQzYHb/ycpLPG+ZEo/a4YcmiO9jbevrmWxxw17UBNOfXb9NBWLj2uvZ/EXbtcIiayptS+w5ouBhKbiy3rKOBJ+INNeU0hoxEKJIrJWC3ehVPGnRMXG/nLr6YjpbK8NgJT9IyO7atoAzqqEgB0DFsVqFPgoNgLERx3ye3sCRm856oOt5AXnC7ec5LPrA06bnnNlUbRwhcsyuVpl6JWyjLmBSWn9WZqySDFdXVoStnalpmnExmrw9vj95ubK8FigqmadbrswtoktG37wiRHwjBkkxSIKXFV//9K1RjD5Ouc6Nfhrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N5/GPlc39fFWwJiLd9IRAcFu8Yk9q/sTl1DOfqDx5sC9J9r/2b/uf/qVzX5nbZSZoEw1X6EKYjZ7GiKeUsJfTklyzrF7Ml7yHNzEIH8Z4p86No+ZT1cQTvVVtlySb3muD/yeuCWSfw143gX29mY4ZUuWRzDFNxSTuVHpb+T/niIbP3X+iibuQHgzxt1O1901t16Ics7JUtGgIEL6LEYmAc3lhT2QZ77TfmwYwthuScSVpt5nruGnAAxLKErzdZc6yMHo+jAANPIpNwRdqqkVGQtZpx5Duj5+UdSuvsLu7eaNjU++w8z/AbIQOyibJhpbCl7p5SfPShWgY9xLRE63v7T0I7KC/m7TmuTsmZEMVC4kj60o8lGMvnjuFs8QYqKLv7kM1zJ71fN+/fcFY033ZUJfac84vbi8GxDvQ8G+rL77BDygXDah0/9Cr4p8b/5D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:58.3247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca67ea3-6115-4b2b-7904-08df45612160
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457

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

