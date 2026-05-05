Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFCA4418E2;
	Tue,  5 May 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999729; cv=fail; b=hNeDbVb9fw1eVP+mpxk0ghhdRqyJYUCOQ/aXS0v5FdF5V9K4RSdMTe1LaGe7vInQW7KHyCRQARobWjCdXvzrOu9bUiwznYCRqJ4cEN3eP00tD3rNCN+lOQtCTqP69Hp2s8JjSUw/Hlr5tNZvzfqxKN6nvH25R5sJis6llmlEQfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999729; c=relaxed/simple;
	bh=y+p9cuYQi17ShJy8VSErFU11Gt7e9kUT+SVzR7UDouw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qtjwcrul1lTfN8iDf7e0NEtmj08CzA2F3dpp/Dh1WMrl4ScE3BfqX3m9jfFoF0PLRI0catPY//7WQMxBKpaFep+bRfeGX3+QwJL2PF9dP6ZmqS4qVdap26sgEoO7r6D2xG2ohoVUIRJWe5redTxbjwF6H+AtoDpCNfZ8hkPDkfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fXXi8GY3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZKTW0+ZT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fXXi8GY3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZKTW0+ZT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Tep51903558;
	Tue, 5 May 2026 11:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2DeNCCkYxRLKcwrFW5QexklO6TqM47gZj/ujvWIkqSg=; b=
	fXXi8GY3KMzWQGtZ3NljRm1IG/uIY2lsOxh3Ovw9bQvcx/RTCv5Xs1/9pMYo1i+7
	/BMjn+/YnpOLCq7iCsgrE1qGTO2A7m5GE/G77NdcrHk5fLO/DQd+v4a1BG5XjLNs
	IDkOBr0dZ1GOaggjnq499BxcGc7hcHHf5ZkCEo6/bk3vt+0qP3VSagorRGeHnAzU
	jrw2nFOE1u8ZgswLugw118zRyDCGRowc8xdLv/P23BxphVx8gPp9bOyIWOw/E88/
	Z4aIL942LmwUc5cMZixackKcbSb4Io+yG5HTpA+Yw6PpRAOLJLPuFjNsd2ITxGiq
	S7fCsAImjVvfBUvpYxCGtQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021084.outbound.protection.outlook.com [52.101.52.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZ2C1Bh3iMEK15nUAwBQm97nKcU7MNKJY7SnZJ/MPRqMRezFNon+nk9wUOy9VAcqbtHy1Wyw4urfHtoYsn619NngBTu7abdwurSHpWgo8o4HYOiSgeeXVv+08wUvf+S3RK3DEBRRwJwQgdXsBaExevxOM01CgMA9HdclLRad0ShMrfhoH1JhnSXI5se/d6ijpa9ruep5hOGJw1EFS7LsCPPZ+JuHdp20n6nCJgjmQozlICbBMFzenYJPT0oLw5xeM/HSSbeNm7XtesySj9QaBgqn0iTK/ofgY7s2yQmrQXLKV7VdjY373BtiQnyxf2rNPoDfoVn69yXLEetqEH801w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DeNCCkYxRLKcwrFW5QexklO6TqM47gZj/ujvWIkqSg=;
 b=Xc9/HNnUyPJtg3FbGlxCT9mxsWecy2TG90VL8s1a77vzysPL5tgBlyY8MWoofZGDx1VQ8DjAMLGmzsfuYxPBCnqxmNmUTKwRjsemUqOVAk5shpz9QRPQPKT1Efyw27/vrZCv+NfdY5FtG/T6cp+i+3wTGRT9n7LVg6ksRWiwPhVPxt3B8CMT/fSrXGOaKPW/IkN62H3EK+4qgHDLofhsylqjSZhI3o9LmxkaR1Mc9/3TzbcoxqyOLOtnPxuYpjD88hZwR2vqpNQA889MsQSJ7fYgym+Fqk+8jFs6td3rzFxTkmG5co6vc5HpUaL04KV+beIqBKdOGggmAV1i0C4hdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DeNCCkYxRLKcwrFW5QexklO6TqM47gZj/ujvWIkqSg=;
 b=ZKTW0+ZTdu9YSPM8cPccvl/i37D0bWyZPb+A7715bMmmNy9rXi8t1SgxzNxqOTi3b3/E2IMcZS0ouVEKUzbIPEsQC08VZzc9oPgNYTkwIZyfQKnvBdDw1fUYzMLo5aA3ksD8iI7fe4kFrx3UFbCOxAzXX5g8EmgIfNWQBpfRzGE=
Received: from MN2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:208:1a0::32)
 by EA3PR19MB9253.namprd19.prod.outlook.com (2603:10b6:303:2b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:12 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::89) by MN2PR07CA0022.outlook.office365.com
 (2603:10b6:208:1a0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34622406554;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E548D82025A;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 01/17] soundwire: Add a helper function to wait for device initialisation
Date: Tue,  5 May 2026 17:47:51 +0100
Message-ID: <20260505164807.4108684-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|EA3PR19MB9253:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 33ed0d53-cfd9-418f-45ba-08deaac6185c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|61400799027|36860700016|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SlKBUvY47DZVCsUfTKTXxnbandxx7zbHALMXLgBnsTgFevHIy6bKiuZfvRrqnnfwcycAB0vh+XRIm3UAhTeagye/iwIz+FtUlvAoOlu932bdDqNVnCiEWXf0in4jnCM+jGePCBVcPiYMcmxlx5I2a7ph6WqVeWAkKJpQf9mzL6UdvOLVHWRWQ4jLVl8AvILQ5zhY4aL8y7GrhKcp5VljZo/FNJs3PZk1t5bQ9vftjV3CMBuodpiJlMAD/+V/8dJtPeEThG1dUZzL97zcAOtXAUOHv77h44UYk9vkuH7R65MaMFkJPAl7/7qpi50ahz87q0JJVGPId5irSGOnfUZ9Mc6cXMpyqBK7rre0mlswVS+2acjHtnpXRtcnH70Ij/adpaAsMm4/PB/aK2iGYT4Ml3RSsi/qK7t6xsdiMDYuQTQJPXz/MqiBsx/qBA6sSiahexSgW8Suy0Lsh62i7qD7OK44vTcQGYGh9OF29SHjZTdQn0KleXlrsdOUI5boa9z01HciAumkBU0TZHJK2t9IWb0OTm2sj9ztwjVVwO6CPE2kEsTxtxdVTho/7YB3y1R6WHlc3mTxS7O0Giv9txwtXGjieCAMTFm4Xhw0lnG3e6lip0co2/bHpJt/t2zDGbolEqzbVbmJQIz4bBzP49vG+bRZxBXIaxv+6QioVwrxgV0SMIlHgw5VmMCyAcI63v+yp+ksJG4A9AU1Jrj25VWjjzhGm/UhIIQeJfe4W8/oEoA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(61400799027)(36860700016)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+alvPhATub15fWVHrwdTdyR4zYKbvGg//DYcbltwKXw6p+58fRmaq3oXATvl2fZGM72do3hhroWWlLxarGmm0hQiTotGYrBJiunNbQezojpBAcvFiN4e2Y0VrNFGK5bdkkprC8JllsI9TalBr09N7Bkuqbnl8seImmcQEn/zkRl3ctSDd3T+LeyJ5eDt9/sm68U0DAJnxgR38aZTHk8AshNj7x98c6B5nwD9yJVuA6l1CdtyKjgMAwnxFuYHd/+UH32iy3VL5/klW2BqhkJ2y8TMHvdpAvKly+9LbW4y0PYpUjw8I3LwmyYkt2tJKpqc6UC+3+lwcjSJOhN2FId0QIjk79guqTaBM1sycIFdPoi7FUujjiU5aK9TApBTLYMLXju/L0tdXlRjlvAbLVi7iUX1PBH+2IY2zl9NEhozQGYma+/OHs0OnRzWrXCggRFc
X-Exchange-RoutingPolicyChecked:
	uIE81b7Kj992yTuR+smc07fAZ5dL7lP5XCmnR6ClEf27FuQ0DcOQNjXTzGczOG5DkIAQyXA8oY3ZUejaxIU5jJjzE7EbEdne1es3wTpuUFy7/mjGitp40C+u6l4x9+mtdCkwdYN9FJErBM/mqtqIFEtuwWzcP0tNsIyvonbFygJQn0omHji3/5bE8xfMx9X2ELmnpQx2qMFJ7B3sSFXoYmjOEoIOU4I5VxLcNu0GRNp5UHTIyMFNYYFsoyhvliTfmliqIvjl9MAxlayCEaMEGDkJxMp/A4eLKPANRgYBpr/hIdBCO6cS4DzjyqjatbSeXjX/BaS216zwDgX7bQfFZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:12.0070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed0d53-cfd9-418f-45ba-08deaac6185c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9253
X-Proofpoint-ORIG-GUID: JxA1iG6Ym6D6v7AmCulbJsVnW37qwfrN
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f50 cx=c_pps
 a=0I/lWAHw6mYlwhxI0+EZog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=PQ1RDjrNAuq0IBKIsyAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX0/rIcuNUoqWp
 /xO5/C08kOFpYJkDUZD9yg0IVRDn0cRJkE4Z27YRaGj0ibU2d/hlgtkvaYAwKAByeW6iRe8TB/l
 ILHlaSpSIojFwP4SV32gFxFQLG4Dq3b8q8sLS2HP8YeSW35xpd3L3SdeQcLDRt0ia8X/BRcQdN8
 aE9wWbEgUvlNzvMqqRPg812u/mLhNa3dagGqlNSf9rAKFKCEEDjjn1HmO3jleOBuhnVS9BOg5b3
 l4lymTYDkVFD4iV/yQ2qKJMRoAJ22fo4TlNCTOotlVLLEFYloWBOvyI3l3IBWjeXokEbDOr8luG
 zbztFz4wbjqA0HZGfM2QiNxERLo6wHtxSUVE4HWiZjmu7EJyRfncoOYRUV+LpyqxAg37qMpcCdk
 mR8guFUL+YShtw2tanfNSowv4pmT7UO6zrFq8qb4cr/yhMmZvtSeMbMmUsM2zQA7QpU7Ls+95wU
 xXfK7gmHE4xXfFqtWQA==
X-Proofpoint-GUID: JxA1iG6Ym6D6v7AmCulbJsVnW37qwfrN
X-Proofpoint-Spam-Reason: safe

Add a new helper function to wait for the device to enumerate
and be initialised by the SoundWire core. Most of the SoundWire
drivers have very similar boiler plate code in their runtime
resume, and that boiler plate tends to access various internals
of the SoundWire structs which is a mild layering violation.

Adding a new core helper function greatly eases both of these
issues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 21 +++++++++++++++++++++
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fefe..b9ca35e530a3b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,6 +1372,27 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
 
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout)
+{
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		return 0;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete\n");
+		sdw_show_ping_status(slave->bus, true);
+		return -ETIMEDOUT;
+	}
+
+	slave->unattach_request = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sdw_slave_wait_for_init);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6147eb1fb210d..847b001d1a774 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout);
+
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
-- 
2.47.3

