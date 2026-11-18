Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998762;
	b=IREzT2W6PGLxKyXGlvd7YDKxBQY3YyOYaFGO+A/D3T+fHZRewg4KgAUEdT3FOuph1w1z
	 1J+VQ+oYbsBs6u0m9mlPgeN3vMrB39ezwqcpnTHadYz21eM89KNvh/WTaCjGemdZmFSmu
	 IGIsyYyofsap5H15zsBpsi3eMQaZ7Mzgk+mFBtOTf4ol79IklkRVvM1A6CUMn23pVVaQ2
	 YMSCpQ2gwVIuZL1i2QyUmls11H/NMOMphBs/D3CPqh1pBgYFfA/ZmCmDmuqopc8SnxrnY
	 kYEjsgIJbQgcq6hZP7MWMm8sVZXS95mXhWa92LfLc+B0RNAVwlpDHAvABMfvxwryWMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998762;
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
	b=gy/i8uvpmI8CbNNDe7F9nHkAMK0P71sUB+sMDAnLMPflifqYBAH4+QchJ24vESHJwWFM
	 O1xfqmB0/cb7g0N6yVfA71zoDb7mqP/juPWlvGhiWkZzypYN0d32bW1IIyr4AD8GMebD7
	 72yJSuxoX542PBY2zJQ+KX0egKZx2MXbbJC/zIbENq+IHlMTEto5NJzhPqJn2Ahvn40jP
	 8Vm8c4MQRa336FZH+oAgNY2ciVH7staW4ygW56yK4YO9LN86kFKuDXnur/XwrrLFzXa+J
	 8CvrI9s4tn5ybI3xrzuTWv2gPAYj0Qpxx6/zzd7eoZP9gxmz7MvajSDtM2uo2fFJVeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q38HE4HA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.69
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79317606A31C;
	Wed, 18 Nov 2026 10:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79317606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q38HE4HA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZNY56vIB2db6fIUb18qaGtSB/I0JitGV3aA3GmqiL6BrQ5lyILPE/iCtwZTxbXFu1XoGHnBZzn0HdDdIK9eTaw0u/2n5SMUaM+qS7GeYVQ7cmHG5qYC7vgDAjf6cBqSBcoCRpTAwG1YcPaBjkTI/tvkKZItgkD4D4cu5G6HuoSOiI9YT1rcIsST3GH6hju3vIXiL2qPBmW4w2CZC7BdV3Di5G5SSEiP8/RSCSiWR68hvdGiPS6B1fXZVjcjgW+jwunut6Kc23qiJD4g9y46OxNdpxKGcoTxZmEDsS3aYD3WJEDngAXgYvDBPcryoVw4OLpG0JpSfHw0+AXVo3THNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=EKgNS+aY20SPF4p7aCmQRqwWac5Lh/cJIsAza5UoB8c0BM1ts2wEZ+YZC9Ka3Iy4bKJ08rqFht3AG2OD+OGdnKFQ0WT+07B/SZv6xSvL+NFXrCzzEIU6C2u484MljwyvHorPwzeud9KNuRMJgv/apsrtFvaUA4cPcE6xAs8WVaK2pcfhRboizG7oO87WRAU+KwG9UiaEtdq8LjvGQ/P57k0RDdDxIUQnaGikyJxo8CyyokyIQs4lTt3uXC1GipZoAIOWbUO+UVNZPQ3ncojatX6jqE6/4uunN9Kd+dyc7buWAzyr2bcASxX7enf+vuYgNX0wYj+fZoWSWfGHOswifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=Q38HE4HAQK+rkHeQUqpTrLxqyQT111vmtOvdmRKnmrfcau0wvk4vLDkZs4eaJcClMR6lsEjAc671pVfS6vG3l5uLl9U9aBfDDWyn5/1P1qKTc1wJyCFd66qqY9AWbu12ZfoWKMnN0M3TkDqZAWuhe7tyBBRDEIYBsaMj1iYXCkE=
Received: from CH0P221CA0034.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::17)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:53 +0000
Received: from CH2PEPF00016D4A.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::51) by CH0P221CA0034.outlook.office365.com
 (2603:10b6:610:11d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 10:45:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4A.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 09/23] soundwire: amd: fix SDW command timeout return value handling
Date: Wed, 18 Nov 2026 16:12:28 +0530
Message-ID: <20261118104353.331556-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4A:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd2a36d-851f-42b4-b35f-08df45611e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261102123227099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261026130827099003|261026121527099003|261026140227099003|261026135527099003|261022075727099003|261022113327099003|261022115727099003|11063799006|261022105027099003|56012099006|10067099003|22082099003|18002099003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	rJtRSVG90XktFXxxYZmKwqIZ6ZNHNcGPP0jWShElDGwKiMPS5Rs0/wDnTZCYxoQHbfIA5i/Lx69bp8YJ2Atl5GpDUu7nWxkYxsezBnSbt/ZYgBuLgE4pUdUJZfrHUsn7X06zJ/r8XCZYsDMkIKdGgL2i/4uyQq5YTRXe6u1BsTbD6AfHgmekcUEORmLsuaxXuMtm30mIyIwOk5SI+OslQJhO0LXANk3lS3zG/xjcV5cX0ud2eNnwxRy+NFGGLP25GNZGQPbERpnNMdCQ0MYw0yqrty+staTUTws0cNcw19PtZHxMoKASPjzF+6iEJdBSLxNp4aqDS6TyHnASgMVdoJKaXtwxnN5ImvfciTFku+UAVLtGSiFLBISrJJwxUBVfk6XFMzv79nWYFHvgWi464QZx9aNklqF2WM3zFc4bGqrq141GwQmhiwuLPXFIK6aaNWMA+nGZYagAVeyMIZpHOp8PI2t7TQ2EatPHg8vjPpJM0MIWq9ETH7+2HwxUZ8TeZ9EA8o69xAP4O2HmbsJ2K/Sq1UOpTXz1kOFeCQdcsnED1e17N85GlwuFuJA1J/c1+l0kSk4/e2vROkIz/6BETMrMcJpeMj6JgOLA0TAq3iu/I5hZpkn9+YfWnmCIPZWirt8zUvLHmBmgjQWeYQRwVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261102123227099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261026130827099003)(261026121527099003)(261026140227099003)(261026135527099003)(261022075727099003)(261022113327099003)(261022115727099003)(11063799006)(261022105027099003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	52ZBYyw8JS/d+N2FQJVMdop0uk6rqDyOGjG3MbsfuNoQmx28OUfkm4OsgQbwkwhkl14tTmdzLdQaFsc9HotI6i/sLsg+caYwZQIDFAlrcXZ1AqcuGFlIDKHdcahswVEYlGGSim7+7En5GTTfxYGLuFTt2aG/TSIh74wbejY9W6xXVWCdWkY520Hs3dxjawFYS10Jqn1Am0oAVdHFPLxWtMk8DuZvXxM5MpUohw0RFoG4X4h1xZrTmBbvvANs/ssEbkt/5k91XuxewuTBS30EkZbl3HF2Z5+u8682gDU8K/4hwRY7wjbH45V5sFyOiO9tXbrG+iLaoF35wZNf1KKaHAU2RkQeOc3i9Nsdkk5IlQA4F1Y1kSAuIh8WGJD7wVyukRa+usS2Cj5dzIJ8px1RL0zpa9MvMzrMn3qjy/YfVG9MnSecWFMdtETYjifMamy2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:52.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd2a36d-851f-42b4-b35f-08df45611e09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

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

