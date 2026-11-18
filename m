Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998806;
	b=xbhn4xmzjkAtb10fziztPVq3xNNMmTLpbfOg//pNMgcouRrInQGtFhSGG7SRflc0jj2T
	 HC9K/LuqKH3Zw7zjtgQcD6Hzb5h6yKi1qDKgeIEHHJl7siVn63T4uQQ7doR4SgIwvP8xn
	 rmVVg4c/l8WuKJx4mrW/ZNgBqwwSfPWZ/5sDgQpABaqB5ezA87264romrQgG/swt2Uvqf
	 rSt1b6NRly30tw8XbIpOsL3tHgjieFvjPhdGYew6povYi7odZcjdPCKancNBcJZtcVjg+
	 GxNW+0oi/HWlasYVMU0wJLZFiQSndSGFjVF+JahdCcobLhd/RbFrcQtNUB3b5mO8O/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998806;
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
	bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
	b=vTeo7p6+P4RDPc3Lz5DlGrmYCO19dAQsOQJKT/hdmPQLCtRonhZkmZMwlkb7IOTAvZPO
	 eg2iERN9FRaegVVfNRM+/z7I7N6n/Qc7kepO/Q4NtC2S3VT/Uesh79S4vSnFRjf9dC2FI
	 YuuoCgMwEmvJZFWO4cdocLFfhK2mIMg+w55dRzMqBmeVy90MCfTljLzBdJB6q0O/W+xQn
	 kuqMawTghUfY6HPym1FRn6jWZ2dnsjQGyWwB7rBW0qpyUvngiatO4E6uA0M4QOfrICc8c
	 EwK13kzL9biofTkXcwd6OQC0nPG9GUy/JecQZdAcFHmc8sp/rjKPprorkJYTJATf72A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ljhLg26d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.20
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7083606A32C;
	Wed, 18 Nov 2026 10:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7083606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ljhLg26d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6oflpQfEH31VnUcZ7bxfKLbrceZOCmy/yjVTsQ/yCiNFDE+iO2WBycCWY3WvJlg1WPPCgy8FXR2TSV4iDeo35tbPYkDGXR/RIkxUSg5xpj4hMsbIzcNyzNb4DU025xlcAZFoextsV0REjPUzcTkzykI34nnUx0HPvBRCERTuZ7garRB+HHyHsHjBx06aUX9t8FAVdLa3zDmEhV14dkR1zTdmHu2bAHWCcDvEMQbIBSjVQR7U3XmYnlGKUP0OSaJ0cqfBxjeYdeuTQq4sAsUECXvCfs7A1uiljV9LR6TM9zxcyrPACqbI8piPFBkG1dEBoc0VMKGv8yJ63gyrBaN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=R+WJyQs5hWie6j2gE6mWNDGLgMUy48UPXlNAjPPNCNdPA5uduiUPKAGTr1L5u5XqVXzXYPFngjdAn4HgHpo23nWVqD4XuVBZdRQPtOSVYNB3difhVZBdIU92m4DDLRXbF329pgKX3AIKrNZqWDZZSX7Z2cbe8RGhAcnyKQ2ZEymKj7HZf7aipHLKwK2+WQU5e39a0tmsvWE6oOUzE8J1JrIcjAxyDBK9ppga7XDZ8QrAu08f+l8eaOWGDEk1HW4xX6a48gpaHbYrX1IxeT2YN1+LlkKEimxCnIjKTSXqw4+1iPPr6JUsrhvxn/5Z40UXmQW2nsK0hMZtMTqBZVu+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=ljhLg26dE82E+TBOWQ/tZ8Y0S+9Lk3L8QGlSbpM9uz4LPBvvpjufL41rEDBiSjvYch3jbwraY1zLPpGRDk9vc5xn3+jctUgPPeonksxydZOtd6LNwkpK2MnY1d5pNfNQ/MS5RFE+TkZMEaExMwkAQi7TtA0aOHi75lM+h1U8V8c=
Received: from PH8PR20CA0003.namprd20.prod.outlook.com (2603:10b6:510:23c::16)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:46:42 +0000
Received: from PH7PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::ac) by PH8PR20CA0003.outlook.office365.com
 (2603:10b6:510:23c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:46:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000B.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:40 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:37 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 21/23] soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
Date: Wed, 18 Nov 2026 16:12:40 +0530
Message-ID: <20261118104353.331556-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000B:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 776270c3-81d1-4a19-241f-08df45613b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|13003099007|261022075727099003|261009223027099003|11063799006|10067099003|56012099006|261102123227099003|261028144727099003|261021121427099003|261021135927099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	PA8DJR+P2sqD0s+gfd3mLeaOKW2oIM10AP/qGfqK+89HArHyhxSB3gzt6+hXJT1llojEzvZ6pfZ6PVjjV9N+NyCHdl3PO4ODP69HLuOWc+i1eDIsSP8fo/OXrESI/AfcpgBF+XtAAu2aVHFgoJsGOAnAqFqXHZqcyr05eWJHxCMWUR15gim/kGN+LgmMYv9OZ4MyQVXDuzqWJyy5uwZ5JsSWhoPKqNyFL20KvvKwSHmBjAPUcpC9wv+CUjcsVxA0LRbFZsOnN+gToC8Ofe6WT1lhiRbcLBPVLd4fOyufHjJNnjpaplj3kKL2kHa3198B5lNUlnZD2+UTnsMeW5F0c0A69Rxu2+vD/RO8Tg7PYrO86vPhKB0kIriIPK3PxD1L8b0AOxRaNYVBWxEjZZc105cUuTdN2ut9RsE922ZE3FNmrXsAW9hE8hrJ7ubmMPfvkBOTYR0OLTYwsl4vwebRbgtXKvEPigE2jUD0TJ9Ty6izZfELmq5F30+9kO03jWXsvmHuXerEKZMc3Ginx1RYGb+pE5a4KhloiEFMpIv6GIgQxbrn9+u/nBJ0P0igMYPVbFEYPjrOhV51oBIh0qlQbLZ1UznLsWfx5mjn5FxLv7dJ0UpSqWlwjehulVkufSr8/iC4xOlkOYwN2LEo4zbpMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(13003099007)(261022075727099003)(261009223027099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261021121427099003)(261021135927099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ors3+qAqGjqN2VVuZoZcGtEFNrxpYVuarokmxtCNJ3ErRIKIhAPwHG55RCg/NjLq5c7KQQ8Zi3V0mGn7+d/ng++4Uu5Rrvw8OfoNb8MA5HeOyNxmWrIonHqzzd20jwDjKCTaqeBOwzsxe1ybrJYXFlySMW4ICjTzRcq5dcXoxyDJYlGS0/u1JTQ4rwy4dkgEIzFTCsts7qPf+dc8+rvHNJhjmVkEOxhdh3T1vUX+S9AXC/PyAoTFwdh5HcGlAiUFDDkmgJwX+nU3CSt8Pcc+cjSlA73ALAp4e27rjFcv+NNC9FBV/O7TTwrzuAY77qeYU+HtouFFW9c3yDl7ETh0+S0l1VpgO3TgL/ZTuAJuMxQVRsUr7t1cNlB0sXIOOzLrw6rBRoivsLKzoc1btXyNjZT/RFRiuCn6EcPvCFvaieIUwqKabnFYk2rNUjz6a2Wc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:41.5591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 776270c3-81d1-4a19-241f-08df45613b2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143

sdw_amd_startup() calls dev_get_drvdata() to retrieve the per-manager
context and passes the result unconditionally to amd_sdw_manager_start().
If the platform device for a manager instance was registered successfully
but its probe failed (e.g. due to ENOMEM or a deferred probe),
dev_get_drvdata() returns NULL and amd_sdw_manager_start() immediately
dereferences it, causing a kernel panic.

Add a NULL check after dev_get_drvdata() and return -ENODEV so that a
failed manager probe surfaces as an error from sdw_amd_probe() rather
than a kernel crash.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6834a8a0-632f-4c73-9174-0fe7e06b5303
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 50e487e409a9..4f1c2eaee70f 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -172,6 +172,10 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 		if (!(ctx->link_mask & BIT(i)))
 			continue;
 		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
+		if (!amd_manager) {
+			dev_err(&ctx->pdev[i]->dev, "SoundWire manager not probed\n");
+			return -ENODEV;
+		}
 		ret = amd_sdw_manager_start(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

