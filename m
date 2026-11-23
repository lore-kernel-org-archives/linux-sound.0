Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453703;
	b=Mv8ZH9+Suyif+g+zwjlVPRrghYmx4iFxW6Zt4+QLJJXSkWg7r1hl9STFPXvmRfUW7DDj
	 Jkm5g0OkY1bMt+A8KJ3Khv2RvVW2Ky+evPjF6huIHrf2UaCTvisgOpvrDOBg8f1Myny7I
	 +KhMj4HE+baaD4EFDUojLU85r52iIuWEodSdMflxnUKM3Ml6xUDVxTV2fbhs4MAj3LVke
	 uRN3y04X+EN7xvOpJozlRBd6LDlyB2AJwYPe7y7RoWjwIQty/6dGtnADuR03H81g4a/zv
	 COxWGmQwgAQUuLllq70tVrSTdSjVY3XLTu66zNX+691yUx4VbpwShYgrIektJ0RHg2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453703;
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
	bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
	b=3ghF6+efGgAs3KAvBiiNAdEkuLzeuxffBFk9GelMucojEhmHJzZXchimdHAHXqbDzf3f
	 qKDxWL/2G+72GNjLkCY/o3XEhbo+eRikCcE5kwbwTLgqwhCdLPc74rjRiAdg71C0k/YIO
	 Nu5Kur5UbtommiV7XSoOEhF2t11pDkeFUS8eGqYJS1wdn8hBOZ4NoXzgvB2QgVEj2q2BI
	 fffMF8BusWtB0NFuAt0J5aqJ2okMhVOfxC11NSVJIiOf7+kWy6D6d/or5/qfucxFXuQwL
	 TVCeAo9iYHywMl6/qllRzODgZHbzVhbzAe5kAyVqPR7cRi/qCsA1z1s+Brm7EFYOWbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SpSfC4n2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.61
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251D606A31A;
	Mon, 23 Nov 2026 17:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0251D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SpSfC4n2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ5ZfiH7dVP1PLpAh+DnoRnD29cGIG3VzZGWQkVgijg4thj2IP7BJA3R9jGtI0kLlRngyHtJvQP2z+k5BBSA+vehCfJwR33MhGFdlurk16fm/wOFO+OptgUDxRGeXX0fjKfMricCH+f3PpBYhDXLa5+UPNZmAUcg75H+OSS8eudNdyCI5grNMMb3mY+J5cfhZblvIDNEZRoCqCtwulCbgbk9w4JqYCN6qbhLLeUsidsOwFLnHDo+gZtzy/fZyKhz7U0NETY3a2W9LrqfgCOvdhW5vQme073r3lIn6kYconZ9Kbl4E+xubQgRVn/mLvBusg8KWxhvKPG0T4BvQlNlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=QbdsgNmMqeCePkRpbxBUMUBjw0V7r0awOoGEBgJEOvrckZno1eU2+Et/bJsAfB1TUd3N0kENQXfBTCWhbXQEvp+nIaptlMbMeRRx+4qg9P8FY7J/wdVqYUKh++KsXz7goDmqvw7AuyVywPiWvRT1zNMsSj5DYvWnnye1aO+WWM9xncqweSIUanYQUpE7I6hV6CiAqibFFo+n65GJMIe1G7MjbZ6VYixp1TLkijn4RLrC9e923zMpkGzztt7rwauI81WU+dS5Psg8Cxzrj1/HuElEAFfUpyhpLR+9CtcNzupm4JU5s3/1d8gveOmBddyNmeBRsIcX1alJB5/LC38N9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=SpSfC4n2Xd3P5IHBruv8GgnF+v1xckgbozXxHUooaN220vYPaDhfESbhm23kOb/QZjMRDZ9JcRzVGGwiKCWUOyCauT3o8NkmyROERPvlW3wE7fFi/ID633s12/WQlvcVizK84WA0wfdSghTCurH8UshGiZcEhVrST6gQOZzLgFI=
Received: from MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:07:09 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::22) by MN2PR18CA0002.outlook.office365.com
 (2603:10b6:208:23c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 01/24] soundwire: amd: consolidate pad register macros into amd_init.h
Date: Mon, 23 Nov 2026 22:27:22 +0530
Message-ID: <20261123170520.1380924-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: f1085960-ac11-438f-c970-08df49843592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|261009223027099003|56012099006|10067099003|11063799006|261026121527099003|261102123227099003|261021123027099003|261022075727099003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	M2fLJjJF64Y6TvoBUQDd6t4d5C//JoYZWIzZOUuDcF4iskvrby48I7PlemXjsrweLrfOgJLGjTUjShoeWxYY67qPuW/lwJDWOXjaIjCg4P6rHJi158RJXa551HDIoYgkcRJNF9EujJUgvajhf2nLd78JJl3P6Dq2/4wC575RfuJHuTzQ8i+pT/v5FltDe5Uct2kCkLkALtCpbHRX+5QTcJToWJ3BtbKR7KrjBALd+bWpeyP6mZqBjhSd2eE8YVyCMOcQoGYRjvMjqUkGTzfamJ9vWy+rObPYhsMCHvurg/RN6WYT2gqhYcDtqORVEz+fz5kRV7c+e4s30xGjyFs+oy+LdEsnY65Fd5Os5eq80bsjX2VJn9n8c8PYSVo2V8MgdvfRQ0Nq09WdNy4F9JCMzpzVHTLfI4wRp7t0DUtDEe+2x3Sq36SyEVWlx7iO1P0OIqwYK46Oex7JQPPJ23AurhvMktZEw+YSwUHxz4/eKB0dp4W4z55PM+9kDYxhD06MNsv2hsv8Hu7gC9vcZ1Drsp2qDBPRIfY8Vro8yQRLM9q3JypEgrSOK8JOqzkTBOfjiovj0Ayu84zmvo1AXpoSovmw8NnkNEn2QlZTECAKVP+0/B+AgVFwhWjIik9fvqZV9r/4+euRTn0tqRIkDujQIx7tsVjzmhrtPdLUfQAtKBONcB3N7DZh+Wr/fxtVyLQtF6RRZokQcMftO0F/KiMe/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(10067099003)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(261022075727099003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s1qbOzF5+Mdd53duurHTXx8XBfLTa76QLz4alBWaFx9fJ3d+ErBLo8N4FdVaKUz7ENy2yBU5+aTPi78OpPxEdektOOTtMSrf3iRX0mUNxCDMlDa8bLMgVKxPlAar+FPZ7uUUb+lU4WXsDA/RD3C2BllhB2fOtZD9tLWHfSmkg4leJy+NI1JcAQKoA+wDxs+pUO7ksBf+mXpM95wusxCwCduFcosWG3w68X1OBdLzVlpSR4UoPE4TzSsnFC0cJ46oxWNGOGI2qwGcoD0j52RNNfyUliR3vWueJO9w936+MtBSxKgpfLFKgDJWbSWwsZNRt8G/8LCvi1J+BZkHjgv3UPBp1z1unEzRPEfEuC5PYHfxFBZRW9VNi3q9Zwk1tEm/dseqERf1ypk+PMGdPvInJBNj3kbin9WS7kM/7D4qIE6Zd0mmGLsjDQO6JihSfzcs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:09.2792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1085960-ac11-438f-c970-08df49843592
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051

Move ACP_PAD_PULLDOWN_CTRL and ACP_SW_PAD_KEEPER_EN from their duplicate
definitions in amd_init.c and amd_manager.h into amd_init.h, so a single
canonical definition is shared by both translation units.

Drop the eight stale AMD_SDW{0,1}_PAD_*_{ENABLE,DISABLE}_MASK definitions
from amd_manager.h; they are no longer referenced anywhere.

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    |  2 --
 drivers/soundwire/amd_init.h    |  3 +++
 drivers/soundwire/amd_manager.h | 10 ----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8e419ddfa516..b4f45bdf3c17 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,8 +16,6 @@
 
 #include "amd_init.h"
 
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define AMD_SDW0_PAD_CTRL_MASK				0x60
 #define AMD_SDW1_PAD_CTRL_MASK				5
 #define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 5e7b43836a37..106852464dc7 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -8,6 +8,9 @@
 
 #include <linux/soundwire/sdw_amd.h>
 
+#define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_SW_PAD_KEEPER_EN				0x0001454
+
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
 static inline void amd_updatel(void __iomem *mmio, int offset, u32 mask, u32 val)
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 88cf8a426a0c..98c814d5d7cd 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -11,8 +11,6 @@
 #define SDW_MANAGER_REG_OFFSET				0xc00
 #define AMD_SDW_DEFAULT_ROWS				50
 #define AMD_SDW_DEFAULT_COLUMNS				10
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define ACP_SW0_WAKE_EN					0x0001458
 #define ACP_EXTERNAL_INTR_CNTL0				0x0001a04
 #define ACP_EXTERNAL_INTR_STAT0				0x0001a0c
@@ -180,14 +178,6 @@
 #define AMD_DPN_CH_EN_LCTRL				GENMASK(2, 0)
 #define AMD_DPN_CH_EN_CHMASK				GENMASK(10, 3)
 #define AMD_SDW_STAT_MAX_RETRY_COUNT			100
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_DISABLE_MASK		0x60
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_DISABLE_MASK		5
-#define AMD_SDW0_PAD_KEEPER_EN_MASK			1
-#define AMD_SDW1_PAD_KEEPER_EN_MASK			0x10
-#define AMD_SDW0_PAD_KEEPER_DISABLE_MASK		0x1e
-#define AMD_SDW1_PAD_KEEPER_DISABLE_MASK		0xf
 #define AMD_SDW_PREQ_INTR_STAT				BIT(19)
 #define AMD_SDW_CLK_STOP_DONE				1
 #define AMD_SDW_CLK_RESUME_REQ				2
-- 
2.53.0

