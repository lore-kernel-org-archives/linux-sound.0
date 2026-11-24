Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510344;
	b=hP1EMMG0lRb3Kds0Lzl6kdFaCSFDRXZsw8cRSYSZU/x8C+rmYb0TaXYpmZuFQwA7hTnV
	 EzBVKYWSeJ7VMODYr35PuQ3eqbr/Yy3eIj4+I85CZMp2RD+6jq2r/bWGg0tsCpx2Ly6I8
	 W13zKzIdIf9MK0M7OjjdyovDVCfEs2dKa1bP4p25HJLsU/TXe+I5ikuPleL/QQEHjIqBl
	 1gJ84WC9JMJe9uL2PBaHKRc39ZMxJTrfKfVzBMZkxMGTy7k9GHdJCD4pGHQ7whil1r2pt
	 lmSaP8EM5u8KsKEhs0fhp+Gx9WUYWo323hTz/YJTiyagd77s/KGyxgEmXPiWKRpfJ3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510344;
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
	bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
	b=suQA/XpJo+cLnWgfRGon4/w04J24d77I9TSoXhVBYIzU93llklFsHYzXiJQhB4ssep/I
	 FOpu+wzYFkkkOLzBP3gQJxrGP9bsT86X1UChsKYtBDVgB4Kt3Wx9IyB9bXiFiHHoneQPj
	 xYvsErarCH4bpnndxzhjcb0BO4U1sqwOCrw5x/HNvn0fcmENzdE4z55OJhXjkFA9Qu4ge
	 eq/V7Hg2kHoYkKEozgegevc1+5n9RZj+g9ZJpCi5WWOIp9WTkwEUkAiUA82X6kmBjUoc7
	 Ij+cYqVotyK3tNLWB7grT6NI6RkmAKHxxhcZc/PIz1Tnuz1zGg5RIuizs5AYmF165xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U1y7rZgr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.34
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E63606A326;
	Tue, 24 Nov 2026 08:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E63606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U1y7rZgr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4yGhoBR8CK/v3hjDVdcLnsX1e3YcqQ4+Tfuzfrfjcz0pGT+12HHeaV9kG6jxIrnmiMiSacT3us6wceVeBSWmMLtkYLUs9fB+xSCGcU1tzpjY0yVDkl6yhcmFGhFOD5Dkp0WHNNFvc7gZkHbYSJwJruJTqmmKkGJGLwDtQTIGAnQ3LxPELHYTMcH96amcszPebTB9O+VIFlNQhIbci2KpZ+8UzOQlhDdIWLjPVUbETcaDQC5JC0dUw/pH9MHFEvA5zHzd+cWLWoJSrhtWMdiTWXtcKv9DqY4acYNwcsJoXAyNWxcoYy941oVTbuiNUg2XInAZ4D+G+Ul5HhmP/7YPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=fAbmt1aUnb/39iOiu4LyQc6eOyCr+06744fsKJfEz3jqBMO5GiF9HJ72sL6AY7uBjT6HPNyR2HpItBxXA/NH7XWDeaxDDYfn5k/ESZvswdJzAcJeR09RPc2x/c4mNcOhDBQnGstyz5OG6SaRB0WD4TUDM4NpQ36p0lrDaCV2nGnuN/asRFahePJJiGV3irfRA/F6P8dV3HYXepzaMGw3v6qCz7Rh51bMuNydxkcP9sNLAAUMFsoLUwrPfOmZJmQMtWjXkgsLK7mNkRiyBd4VFOrrLqWOrcFwvki89O1IjvZhK4Pu7zXcHb4hoON76LhnSxfW9XRF45ty+rC6ExgoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=U1y7rZgrFGxVe2fQvmfEc7Ye9qLEmPgR17hdp9mmuzPAx8A6fLEyGAi5wwQqMn9cg8tr8U0gd+tRIoAlUU/qjdNMWauNm4QrBif6hEONE+BrFyuSPDue0cB/b/FAuTbREblNTt5SgPrgg6EjXMaxBcCjrrZ7KXNWGcMs2GDGuls=
Received: from PH8PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:2cf::21)
 by AT6PR12MB174769.namprd12.prod.outlook.com (2603:10b6:170:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:52:17 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::6c) by PH8PR07CA0026.outlook.office365.com
 (2603:10b6:510:2cf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:16 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 09/24] soundwire: amd: fix SDW command timeout return value handling
Date: Tue, 24 Nov 2026 14:18:15 +0530
Message-ID: <20261124085033.682755-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|AT6PR12MB174769:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e638e3a-69e6-4d08-37d3-08df4a083ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026140227099003|261102123227099003|261026121527099003|261026130827099003|261022075727099003|261022115727099003|261022105027099003|261026135527099003|261022113327099003|261028144727099003|261021133027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a9wD+R+0AfNucfvxwdgxlgMXLgsbnMywOQxBBBUUmFUL/unvoIYED/P2a1D++HOQsbSpV36afRzoPjWfOgr1S0IU8BdhypOpA8M8uV98sROIlsyM41AWBB22j+ZA4TSQFbXUAfyWfajpxQR14DXYrkWnLyt4LrmGvwjVpZ2XLwrMn12LlOS3LMun8LyWIiWRNYvvv5dkO1cJowxc2KH/fH8dGhB8YTI3Cb6biXm9UF5qyAcyjpD9VvIxXceFEcq7333ANoScoTHkEWSKstknpJhnpQBax7/w2mmpr9nO9zBKrP21K9avRR/SRTeojnmdbYcB/MltZRHf3mu4xfvdzgTNrgwANvbOdHosfxM4YXLDki8yT0bfoKofAGExCBFvB8PCrqkuZEA+J8evjEeCgY2cDr9Rgo5v8fp3mf+uV8AvfIEHoKzAwhx+7VF+tzBcSx/nUDsSm8MMK+r1cfNcNTLPgM6y2+d2sAE41hk1Lc6w9dqscRuuNxYBCmnAyt53HdwzdunE0SxmqWfhPtmi0c7GkJYdWdSSGLn4CfU8TzgVvkMykzP6ThxAfyvbcDRa8lk6UYp0pxCS7RRx+1ZZYkZkQl8Z+UbJk/WRHspRTKYiBbKRrJGf5x7M+dvrvCDcM5GAeiXhhlnLrRt1sRk2PQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026140227099003)(261102123227099003)(261026121527099003)(261026130827099003)(261022075727099003)(261022115727099003)(261022105027099003)(261026135527099003)(261022113327099003)(261028144727099003)(261021133027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lW88T0EVaWgY+lTE3i//cOynCGI3H+O2m2HMtc0fuGMj8DAaRJ1dwAkDWxmhN/7WROC8SvhfNNGDE9K3S8Uq6aJOOcqapsroz1VxVRNbReWFJ+aA2wvfpv0ctH/yIDtfdwe7NUflYvzT5ho+gcnPs1CTjq7SreYlGvEPlPPKD/+/7KY//R/6Yuir0eWtPRRLlIpAQYWe+sytJ9hsX9eMM0G8xZ/BEC476P9A/5tKGIUCS74KiZ1rBf+0RxzYD4a0bHXrU3BEVf4pgyGh2TFVhjbKsz15T3vYp3I3LgTQsAWBobQ5XlJ1UnuyaZNu4iLRyzMx1HDreqc2WH0yJFrYC2krEdV/lnn/xwd1mLAygYDI76w58CVrffJGpnXsID0fY0sdxCVIN/C7Hg+vvP5kquKbL782vu1Er7RDIJ11rpBkHOc4svUcfrpnBiIL/l3f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:16.6666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e638e3a-69e6-4d08-37d3-08df4a083ddc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB174769

amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
(a negative int) on readl_poll_timeout() failures, which silently
widens to a large u64 value.

Change the return type to int and pass the raw u64 response through an
out-parameter. Timeout is detected directly from readl_poll_timeout()
return value.

Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
to check the return value and handle timeout explicitly.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3a53ed5-eb8f-4982-a3b6-db189e009b68
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 49 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3f3fffbd529a..18ddd489ad13 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -348,10 +348,9 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 	*lower_word = lower_data;
 }
 
-static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
-				     u32 upper_data)
+static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
+				     u32 upper_data, u64 *response)
 {
-	u64 resp;
 	u32 lower_resp, upper_resp;
 	u32 sts;
 	int ret;
@@ -389,9 +388,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 			amd_manager->instance);
 		return ret;
 	}
-	resp = upper_resp;
-	resp = (resp << 32) | lower_resp;
-	return resp;
+	*response = ((u64)upper_resp << 32) | lower_resp;
+	return 0;
 }
 
 static enum sdw_command_response
@@ -407,19 +405,22 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 
 	for (index = 0; index < 2; index++) {
-		if (response_buf[index] == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev,
-					    "SCP_addrpage command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
+		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
 			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
 				dev_err_ratelimited(amd_manager->dev,
 						    "SCP_addrpage NACKed for Slave %d\n",
@@ -464,11 +465,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 		if (msg->flags == SDW_MSG_FLAG_READ)
 			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
 	} else {
-		if (response == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (response & AMD_SDW_MCP_RESP_NACK) {
+		if (response & AMD_SDW_MCP_RESP_NACK) {
 			dev_err_ratelimited(amd_manager->dev,
 					    "command response NACK received for Slave %d\n",
 					    msg->dev_num);
@@ -488,7 +485,11 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
+				    msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
 }
 
@@ -544,7 +545,10 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		mutex_unlock(&amd_manager->bus.msg_lock);
+		return;
+	}
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -555,7 +559,8 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
+		return 0;
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
-- 
2.53.0

