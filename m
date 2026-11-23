Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453633;
	b=RH28h3zhPyJKlpGZsV79BWICyVhO6E4d1rWY7z09vkBrpzUhFNvax+oRZlytDTh0wv/j
	 ISsNzhjTPcd8szGMlToa/SdG/9F4VlbB0UGdFKj+HSgi6WYBtJMqXjvQzyscSxk4snwcc
	 IAh6rC4l7BAn4te/MMZTjdQOfHoCl09EHVUQaot5iNZz+y538S2kL+VCZXr7IMlfSldiD
	 woaWJkJzd4SnIKtiEE2n5kCCLWJL3FLMjqwl8juuYq6DhhByc9ZmEtBOLT/nk1onajZnZ
	 PkABH/z3Z4E/JhakR7P79zb9ESQl3/7ZneJgAq83K4JHfX5zdJePaNadV+LLtdJuweQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453633;
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
	bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
	b=lrjxKCDhqGrC9kw6KYz/O4W3n//Kv9Ao3sb+AJ85bQdaDuzBoqKFDfsqhu/rRz7csFDr
	 EmcB6G2LqZj/kE9W8D8THO+ipc0GrVnsKZsdqgtiAJ9acUH4d1OZUpwJc+u1wXULUz2V4
	 yloisjQwRqTyjzuciyNcQ86fanzZHVi1Waz/rGvcF5i6njJHf5ZW2KxgOV14oZ4J4yHzw
	 e5S3H9HvhpZzRh7mbRHWKGjgrpBU+McXhetWAWn/OEQWktFKMP9Tnb9UafeTRvbg2aCtr
	 uj9/EsoK0dH/4OWRvNabUDjKQJTg17WLEhIpR3VWcFyKLOzQXMUVI6R77R7RWk9Delw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fWYUAuVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.65
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC1606A31A;
	Mon, 23 Nov 2026 17:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fWYUAuVu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldJwlMLXFBpPr/W/indaDCakPJZdTgki0TTlmKXLEvAH6qoIEOX1ExAJOXnOzr40fOcNtEpjERzS4Sh5+InUtud8rjKpNcrTi/LDfnN6gCeatFOQufuuv65N2cSrMNKmT8gJt4j9hkTGQk5yaZ9NyOC59xN/1/5wi9QOfPXDB52ewppbFxbg8+Yq/zTbWvvIDvDRkQzaE/lUe0D8rdT2VEVGE+jDHj/SrBosNO3j1FqBp8Y4LUU25y/ouTIYLUtQJNVVr4Yuv/OLb5hQN+eDcjOltHEsjjx4iXXully8rYVnHA84AhJtMZO66FN2vuLFZYxhCWemzEXflxNr/E2iJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=LsuiF03G2MP+hUxJX4MS7y4+aTRgJdfO0sZvXWUGgpdPXN2QX2OwjVfen2x68HFuV8nXthiET8jOxIyx27va6fPLJfIY991pOLwpF5I/BncqkgNXmCnh51YFJavrqD7otcwbcCN0HE7ajbuhL5KHf72nJwZREZagtYme75jhxDtaO/sj58TwPZQkGd45tTEVIKBSV07Ie3iofuIqFpEDo1uVd2LyH6U5JcdHRHPmZydqfa0GUBIXGs/aW3Djt/YdL+SUL4DmBlCmr6dMIiapobZgspen/Zd9OOZFZT1YQRiwK3au0CWoecEEkHs0SO1WmBcDce0jqSmIoWI3BjTi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GfBBXXXQj8sBNBd3MRVgYuiWh3aPD2HJSkMloaswAw=;
 b=fWYUAuVuvw0vZ3qpla4xKBE995q51tDmiGxzy5HbYYAVAcY9xvGcgNEigQZM1PV5OEHCEUYLIzBf7Nd89JbYWbKVWZxFsrXbADexF+Cnfm/2ZYhp7JCQJ0Hlvp9ZtZCRlHip63/IeUmoytCmyIL2ntGMataRv8WqrSp/jOG9OBA=
Received: from LV3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::17)
 by PH7PR12MB8040.namprd12.prod.outlook.com (2603:10b6:510:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:07:06 +0000
Received: from BN3PEPF00022BD7.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::49) by LV3P220CA0012.outlook.office365.com
 (2603:10b6:408:234::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD7.mail.protection.outlook.com (10.167.248.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:05 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 09/24] soundwire: amd: fix SDW command timeout return value handling
Date: Mon, 23 Nov 2026 22:27:30 +0530
Message-ID: <20261123170520.1380924-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD7:EE_|PH7PR12MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 893b81d2-8560-4816-d3fe-08df4984336b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261021130227099003|10067099003|261026135527099003|56012099006|11063799006|261026140227099003|261026121527099003|261026130827099003|261021123027099003|261021133027099003|261022113327099003|261022115727099003|261022105027099003|261022075727099003|261021121427099003|261021135927099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	MgkoV3jlMg5WLyRfF7zLSbZlfmDXyDrvAyS9L6MSiir01BtHjUPW6CD+sk/++l1cOqVZbLOz3r6cpoiyP5J4r62SDggCRpOOkcxGhqKbmG+dOPdVf9arPe92IZ4ztXh92X1LLwuzerDmUQXbNYkCWmIoNE9P99b0LYYGtE3p3Xwfk3Kpx8B2tn2SmJeVQ+tR+86SRmnuFrN1nxrm2Bm2MXl58RNSASieWWr/cQW9q37jyBtkWPqBluO5ANze/SpH1e+6TD4091ZAUiFyuz89C1euumz9p1kLQKwHejBwXCFB3ld/W7B3tdSE1t1pme55pDbTpRQZ5v9B+Bm0EkUg6Ck0vRaQeFSvsrnTCm6z/cEjSqBUyQBedma5Z/7kL8aa8DUU45OQ0oLp0tgoHlFOmTjYgxrTHhJPD4kNF671VGN1kCUYUd8dm4sT0WR0VUoD18TXI0AJSMpM6vfLYXXFgXCMFdDA5NuKMnzucZlRXmNbBeN7BEoICNgoF/0tavIRUpKzQPJhbKIPSEcjLgxgaGuDo3b/arUsqEL05+giOEuPRPYfVnuxhwqsLMJZgICG9IZWm6O9lMDu1UcdimYv73JdLijTllok74vAMEfG0kpTBGavp1/BUD5u2g7gGATcgvl2eT/K6zTEwqdJ5WyMMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261021130227099003)(10067099003)(261026135527099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261026130827099003)(261021123027099003)(261021133027099003)(261022113327099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+a/4jwJp+P9gsiOHX99FXd9w3XVdRVBxNEsC/g+erujQ5YPvkh2iKkLhlcue+SXSS6t2fX8Mwp+Fx3thbM6JbA0kVHjMHKeeg5QIHMhcKGSWmlzQfyWMzRSmkrhkMB7UD3gaOyshZNTvSXcFMnbsMFNb4uEGjUURq0OWqulgixI3iUjs6ed7sasdFl3DZUDJIo6xNFQGi1MnczlCmbtSG8+fD/IrkBybBBn0Nd0HAG+Y34W2/Z9QM7AJehMwk9BOzOIcQktWrk9O6ExGb1Nbre0HDYKRRzMI5+1RWU6diP9Z8HYewc7fnyAInSSeaAnJv3OxmSOEaO/v7HBKazL4xdvXcmRinP6yjFe3uSk+dBW6JbG9PljpaDJyOD6wxlv7nlMi2+2Qh5bWnkf1D+2suws+jBULkCyu8sqNK5ZOvWt9A2C6O3xGcleJ7dE7YJBv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:05.6653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893b81d2-8560-4816-d3fe-08df4984336b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8040

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

