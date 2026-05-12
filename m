Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830F38398D;
	Tue, 12 May 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581899; cv=fail; b=PueN2pIz8CnrzoVdbhigxNFAvyRcpRIUitqgYv6P3W9+rPnAllC8GfppCMPLhzu/2K8CToRhNQD8zp6HTjiLY2/weR1pLjCYGO5Z+t06mF8m8fRidiKG+EWOv1R9tu5HsTK/MYt+f1poza0EsmYbHv2q5Qi2CxUnshVV/0JkF64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581899; c=relaxed/simple;
	bh=7wEDwfdYIa6HcfB40Wn6EVB4sShNjxegSDCop4ZQ/+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGrM6LKOqMd1ZkVLlQhI6un+MVVEIy3XqrQhxSRpknWh+mZNP3faMhi36PBJmIjb59tffr6W/yfJg8NnjhMxDvqfRLA7MSHn191wL7J36DkGY7iYrRPOFJFNjhw3olrZO1AcHAXrixhPRlTk3pyB+8MkudmQMDnunJmWGEPzY7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=is8Xd9yG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zrJkEAlh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="is8Xd9yG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zrJkEAlh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jn0818502;
	Tue, 12 May 2026 05:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=89NrP5wnDCIemaXR0W6+OdqR7MjHop2wtlmZvSuWHTs=; b=
	is8Xd9yGJsH2RDtZJzrYUZJZJnTvBSu5k+HYkRX0rGzyzx2vVtGoCwkNQc4Zf4qZ
	fhzCj/EohoBOZAFJ1Gv8ykOR6iHsxapLkmxm2XMQIT0d4Hz3AWkai+n+Ev4H3P/1
	OtiIcMIltCtM7i/Wj/i7ZKcNTZDVcidEAcve/HlkA1va4NXPboCdRTU9GfktTAhs
	A5Us9dIhMrypHTii5HI+gQFbaX4nxC6vC25oAFe8BNpA2hAY9akifc6J0URER1MR
	LJMcdHDwl7yT5dLoYCa6yoYfLuKVWqk2d83QVBqv3u1+C3QeoodvWsY4PYUxl3gu
	Q4Wa1rF51t1UPH6A6MYDpQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022125.outbound.protection.outlook.com [40.93.195.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1BJFPHijx86JmW54vH7FFzOrFBVwbzeVJP8nej6F+R6lhDp7D71codBSzgvZQIanpDNSK1ymJfOQAY+C7ynZ6eo+99ATpfE4CAGffT19mElP9QJz5mkg9Qnk/77X3SzNJyqn08O29rCcRpc3XnowZXnA9MvAdXoYN/UeBBWHroJF1fSupaRhtzKKg9XlN/aV3fr8TDy8Dft5pm7MYKI9BBlA9HBp8onduJuw6NRRxESQaumNUEBAxXcwkgen1YyW8eXbWFVtyQuOZyprNIzaVHIMfSM8x30sWANWIu53RQwRGf53z8A4Omx2l6GXjDg1HPTxbtTupQe4YBe9wa2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89NrP5wnDCIemaXR0W6+OdqR7MjHop2wtlmZvSuWHTs=;
 b=i6/d0IdT4kfygXSZ/yH2EMB/nNoZ2XTL2L5NGCtqS/Dyl/TZDCEetL65LP/HPKg2PyuJGkEN+u5SQrRDfqstE+hYT00POlANvLfbkSmqfx6+Sxu6EsX86qUUHouRjzK1q3hLSm+nFJIwI4W74viBw/rEXmuT9Nlet/+83X8bx+ztJdQIcXTnFq3N0w+Y0cKvgtM91WMtd+BdJWo4D3YQTjj/1bKdBSHvDhe6RoAPKfMHaEMNWJGPhqMes9uzwmYKfWq1aX2/nF8qhWJCW2RoRJxzr6WQ5XnJdWawVWiDiuY3F7CD/xpIlfhf0nzxZvnnVYKedKQQm/y7eqDyfiwZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89NrP5wnDCIemaXR0W6+OdqR7MjHop2wtlmZvSuWHTs=;
 b=zrJkEAlhNK8Yi3dVbbQ+QK25qAZjzOP9LkgWYD1tkVvkyt+cG7c1nP3Wc+LkNxV9v4FPQuBAnHAxlxKKpYBlHlYKAjM4o74GuYRu4DVotq/mDS2hcbU9/zof7cdfMSFwA3oGD4iHOlaeNqyqY+RQriStUSO6QlGNtJLzW6/srOg=
Received: from PH8P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::14)
 by BY3PR19MB4978.namprd19.prod.outlook.com (2603:10b6:a03:369::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Tue, 12 May
 2026 10:31:04 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::d7) by PH8P222CA0024.outlook.office365.com
 (2603:10b6:510:2d7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5D51F406555;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2D87C82254A;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 01/18] soundwire: Add a helper function to wait for device initialisation
Date: Tue, 12 May 2026 11:30:05 +0100
Message-ID: <20260512103022.1154645-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|BY3PR19MB4978:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 648cdea3-af52-45d5-0c0f-08deb01191ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|7416014|376014|3023799003|11063799003|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Miy4na5drY0CZpS2O85nIgRbubOaqpJihoI7akH7IPcaID6g0nhJ9Rj2S2UT9hQ9Fx88LomOB/JHDhEtzfJPNvNmEI4uoldH7iVJZhqGvOH8Z2URK8L5fe9F2lhQmnKK027I00eAyfqo17WWdGfqX5P10NLEt8H5F2TwngJArMlkTXoAwdoH2wVidHQrBk/XijM0Co0fOPY9Vdj9d3tekMC1DV8CKXqZa463q9Ui1ywus/vDjpfzdEI1/r9iYvprbEQND9RaX88/B78i/8Vtq5Oayx7jcoZd99oaqgj3qbBClVB5Yd23Dk+2XyYbR0iI/z4yYGwuEALzepE+OsnyW1zzUfTH2BK9wVyr0CYo9TvwsOlrOqWL0HSzcop66R0dboviz6CfqyHqw/1BTPVFHTw+Ovwm7kfj2rJLMzuOiwCIWo4GbW0C4t4KiXnvldGe8Cxj4xSzboQ7xV+n+Kb0qE75W0atHH4Z1cmOEWEhlSnFfn+GNKAJTsAKSZILWde1MXMXMIh4kMGi7hDYA4HnKu5D4eqpAbUqOrdSxgQtXSkyY6BRRH1O8Wf0NH0BQjGOaVaxCuSlnLJzEAx+iDeekZuRNd4P5H1eiB7DhkYKK9xMgKNwJ5ZcYxcWkCsXUuKMCuE52GiJXH8C8UDqZJo27b991028doMe6bDIBdqjknXXodDQniAd+xnXTmyni3kP8NPasyBsIroA+GuZOPQjP2DMskvivSiBsuys1CH0160=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(7416014)(376014)(3023799003)(11063799003)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vl3d7b17o8P0HA0ziFDuByKJqVAlJ2as0D6JslDXUzNCtkQdjb10ka5TpUp2/59sjh36DEaMbpTfiNM1aCg8ZW8031/LO6gmZxGGsbvaDrQ993H1NiXdqprA3xvKmElATFmekD5KEDuaKh2803cgv4cgcSrdV/1EzRqvA6WUtrwaSlR71gAe38YuafNwnGxw7ZWv9w0PffPUDefcqdAUj7IHs/OEosqJO0X0OPzNpizErOQmXMVVnk7jVgajfFdE/XUsgvVm7JZQMPgRJEQaXNqTaqEQ5lRmRcHITmNZyERymYvrN7oTlOms5Simvkw1QzA80P+Kg6NrFyV16trdjIJzfdaJ7ztL1XzkWyuyXOGzc8gsM0H1qwV2xzOJnNeC+YxDr2g8IBnQpXc5XBGo96GckopMiL3RiGYkXrA5jcWb/lYu5cVS1oaCELw2DMvx
X-Exchange-RoutingPolicyChecked:
	K2s/oJpq1Q7ClnARdGJY3+0XEjIjKZ3twxohE17TOlWxUndIFVGczAZjsGOoaSSGjiAueA9ohBJVWJ5cXxhd2c2KL0hIsO1ccQQW337oQFUBZdJVF+w2Y36Qs710VZCLeSZMSTRcktcnZpR0qM2r3yP07pYuZsFngWVO/RgSAiAW0bDW8BokCpntTUyNOOLd/tARH6lfLpQcJD2fH7EhvYByA18Yap+IW3uzrtPorRB6mC1p2m2FjfYAY8ZmoVioAKSTxPjmOEeKDvyGOo9gv0awXp7X/nnPgNUFhXhPOSELghGIN+I41Dae0r1CMP5sQBwPd6ENsnq88c8C95RUDg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:03.5247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648cdea3-af52-45d5-0c0f-08deb01191ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4978
X-Proofpoint-ORIG-GUID: VApnoKyJlsGDUuNdaMMbXukM772bVNw9
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016c cx=c_pps
 a=Cjv2mA+u7YWQeGlDvlytMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=G7TytVl67iZrf8OmxWAA:9
X-Proofpoint-GUID: VApnoKyJlsGDUuNdaMMbXukM772bVNw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX5OkFnmnUOPRZ
 YvF/GOAQylZxguHPkR5d8bi7ARSzYop0sOmR3RAzaPhHXRiDcPxcO2WcMf1BjtnjY+CFGE8N1H7
 lqzXCwmrULerDSYiVFPf+lz+J3p4Q94WqGxn1y4Yl0rg4TRhOsIkUsm/5DyKWpx6n5bjxO/ZpoT
 vnh109qnW/u2f9HwDpTv1b4QWdwIzjiv3swU8/g5fJ99fWnwFN5f4fGzj3XVB9XH15WXg9tPxMe
 B+ZoxFAp9OWJ04g5nwCsUmS1DW65Vb7EbSfaRwI0q32xHTeWa0lBc7I98P45SKbU9/mLeesHkZE
 2Cd/UWxdvU/BofLcp+GQwesbS3kdpXyZpmnJlwqQVRsCFVAIqhOgmzHVfsbONj6HhxxUBBqx4+r
 Hr/XIuSmozQt3WJnDrBu/JrvjTS46ZBqPCBe7qWbg5C8HILRS5Z4rd+lXNbvS04blrKSZuz1cK3
 QHBbnMVH5uzuc8EoDvw==
X-Proofpoint-Spam-Reason: safe

Add a new helper function to wait for the device to enumerate
and be initialised by the SoundWire core. Most of the SoundWire
drivers have very similar boiler plate code in their runtime
resume, and that boiler plate tends to access various internals
of the SoundWire structs which is a mild layering violation.

Adding a new core helper function greatly eases both of these
issues.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Actually fix kernel doc

 drivers/soundwire/bus.c       | 31 +++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fefe..ea3a24f805c00 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,6 +1372,37 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
 
+/**
+ * sdw_slave_wait_for_init - Wait for device initialisation
+ * @slave: Pointer to the SoundWire peripheral.
+ * @timeout_ms: Timeout in milliseconds.
+ *
+ * Wait for a peripheral device to enumerate and be initialised by the
+ * SoundWire core.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
+{
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		return 0;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout_ms));
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
index 6147eb1fb210d..a46cbaec59491 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms);
+
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1136,6 +1138,12 @@ static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
 	return -EINVAL;
 }
 
+static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.47.3

