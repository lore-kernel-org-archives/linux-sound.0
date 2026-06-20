Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981CC357D0D;
	Sat, 20 Jun 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953400; cv=fail; b=ELRx3qCmdW5G8F6+jezQlg3mOOHP9weIvzcBJCFOqRVtVc2ULPCC5tD+mghKGtSbxRW3FkuGSGkOSVG24dkmO03nmVr+dqturuWMS1jlv4cQ4TCAvFzwfxh8kbhGQrGRsveXdhNzhmx8jggDNgchvIAjCf9yZdhI8sWc0togjKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953400; c=relaxed/simple;
	bh=T7wd9WU2lWp7ti1cYYXUT0BBttx61xpNZqexzzMVXrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9MjA/C28VUj8udU7/yQieM5nhYmqjS+KiBbPuVHDnXbychR93OUd7+KEReEwuO5KNWa+GLiGuxfcH9IBnzWvBLqfxn2I0k9gc2609wV0wjpH76ubJR6qrvTPVRy+rPipPlpWURV4R3PKhkoT0tur+G9SzZz939e+LGgLq8k/VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gQDwmqtN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Bj35iGlX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gQDwmqtN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Bj35iGlX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAuMdG1315645;
	Sat, 20 Jun 2026 06:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=D7RpolRGRBEy6YpSCFGgW/L+knD5tqPN8Si39GCHp5Q=; b=
	gQDwmqtNiPXhwaVkuxFse51aUQBlw47HQHWuc4OhDTmSdKw40WICBQ6+193pwHwi
	C6/nhR4jjnaDTPj5+iLLuC0IbErTFTiSJ26pi4Wj7lY/R0Pqh0KKgjIHomVjY4Fc
	iR3GE+VuJqZITnxXG1K+2apMNuJiS6g0pEket8bBbqF8pGZEWRBWB8pX44AdYKNA
	dCehuehkHvlzew5mzlORQL9jvWtrg0WH9rmZCsdDgX0LdNK2Hibr+fvCtPTT2nn+
	VmxtISpwC7Po/+ZQXBedblKJdKwcz3+PSHVMCaLI07wC46modmedcxyb5t8VrIRj
	lv7xEOzo8fO/7rOTqwNACQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021092.outbound.protection.outlook.com [40.107.208.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x01tw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nm09KXthNmF8N/FpuFMvmBM1wn5E3AcC6yS8dWdfXVal7WDipDi/Ae8m37NjdRZV67Jy7LLfT5LAQcDvH00M6pFd6l0Jt6HXsjuEk1eizAz7VwxUfTq6kewwQbRSN9PAkLQ/Y06zZPGP57SaGWOTwa0S8tKEv4RvINmFjooVNjxqR5xlJuWO/HgiHfSHbv02YF6ewnBS4nZNScW0B2YGNMbG3VY1OETk9vFS6/Tdj9eQSQkehKmQA/RqocKZaIJoS0Ano7VAXxLaLwQ4Ju6QQwbs01xTE5nmzANGdLcU8fQ3v8b2PYO/rWnq6vG8wvO2ElmIMX0Lm5Ok6ZHayg71cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7RpolRGRBEy6YpSCFGgW/L+knD5tqPN8Si39GCHp5Q=;
 b=sP7lTr6AJYvJ3rHy7CHl1xaPhGPdULD0GZ2dOfyiYS9XI3vnopE+jV4PrmWd9xi+F5SDvjOmZnnVLWGNo9aNQIsuLzL1LQMCwomc4DyaXmsonlxWcenTSD9yWvsH5g2XAjuV8u/85WN24RAmPSJWJXXcxgkolmgy4vPq0CdAu/tIkZ2PGPC1AdUF8Z84WARWi9YtLOGmF79kl980gwAUfy44T2vhpHLVr6xf+f7BxfOLOmXFaV1oCkWlSPWXXA2g+rQ3ysiF5XGLxpMsdKzZrayFzdVDBf2HM1Od8uXC0x8SXqUBIPSoIvCg78u5mnnmgMLhAPAPlIZ/Q5VH6ZP6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7RpolRGRBEy6YpSCFGgW/L+knD5tqPN8Si39GCHp5Q=;
 b=Bj35iGlXTOzXCSS7ATDjn/F/3wu5gKHuY6n8junCAdWHg1AV4k0BgW9FAsk1aIe5bPEWhmRHUiYa90X+BRtGOkaGSy/9lQAMMznR6HPj9EsBBBYDnxrZR/fW9pbClM7IlM7qoM3dFsnvtzcTBaSatO4WCqT78UTd/T4o5fhieq0=
Received: from MN0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:52c::13)
 by DM3PPFE0B0E9B58.namprd19.prod.outlook.com (2603:10b6:f:fc00::760) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 11:02:43 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:52c:cafe::95) by MN0PR05CA0025.outlook.office365.com
 (2603:10b6:208:52c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Sat,
 20 Jun 2026 11:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0
 via Frontend Transport; Sat, 20 Jun 2026 11:02:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5A48E40654B;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3A41582026C;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, arnd@arndb.de
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/5] soundwire: Move wait for initialisation helper to header
Date: Sat, 20 Jun 2026 12:02:33 +0100
Message-ID: <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM3PPFE0B0E9B58:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b098fab-3bde-47fc-221a-08decebb73bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700016|23010399003|16102099003|18002099003|22082099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bs+zTkpet9tHoeIng5aT4+SrZIMAgVsOH+Uar1pl9TQ7MFLDHlkbcv4ka1vvg3o8R2uxvABgeiJrNv+5rPdhkmgR4/ndNDAVPfOSrkX6ywDT5Gpx9O/2CU2+J0s7ZS1ON+H+8l9ocLBIlU+yP7tu1rLnmUsrjcwFZL6CWqkjveV998mp1QNU74YPcC1tbWMxyVD3VNKQyk4jq1pHbIcnLfKBRhdd1he3rmqOKhkkLIe9MmT+QTsAPGZ6Hh3VIUm9TjVZpoIDK87O1cd1smA3zKVHKuHqjXyBy1JgN4/clD7QUU8J8pRR8lNzv+20On5ZT87T04Jwe22c2xEuHEE3a7EbsOjUXoX5DbDCtJJXVCQCzUvfbV2qRpYqhebLc6ePcJTZf/iNqGcerASkVwUPXTiEQw6DRJJZ1TE+vdPmiK7PU+e5TK0YxUV0Fsw0MtYW6I8GaV4dMFUMpLUxbOt4UGVvDk/+/yi0dJ9gC76ItWm64WbvbDjr8YS2vkdyjGPD2NU8bauLx579k71yeudvsUjfKsOFfKKiDCYI8GPf6Sn3ZgbO3428wBY8J6CIuVN4y4bXIE8SwQSvx5bOo9JaQ/tD3/hfzHVxeJMI6gSnvW80KrDMlN0Jha4M9Y4SWKbe+HrJ1j5yys5nWVqhz69w+Ywx0J4E772/XCWTDmA2q8Qd4+PYgN0Q8C1fiq6MIUklgT6atmsJShmcvaPOeDWDyw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700016)(23010399003)(16102099003)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rQjDY/YLMeiiKM/ZIguHr0L+0jyR3iesjgOHDhI1CjBrxA75c/afAIaYghyRCqjmO1BCMKsdUcQIsn2Hgx5dc9c/x1QT4UFzLL5nq313D/y86URxf0tPzv87NOjvejmxOuLti2Us1WOXyhbzOpTR74sS2/kU1h+sxPyqdz7NF7RJwiv3fiAMqSlBgK9y1VwjD9VMR2Lgn/X5SLxcXebX7geRIwjvDoYk7eywyvLuJ7ffoa5fuGbdpC/ra1KqBeJghiFxO0rt/kAUJUeeS/+j2/DSRSVXwaLOT5kllJOZKcnAu/jj5B3S3JmKUmdz/Nk5Eeo+hQ5rbDtLhSstzlt2CRI5Ballnz7ZODUNGAca4pamVwaWT7HHnoeoVLX3e0zGFlWdXn+cLYLuc2nSGswYKgzSTQIEdCKVge+aHuUMh7TWHAG+vYxnl3qJUItCpmX0
X-Exchange-RoutingPolicyChecked:
	ZgM+88wNHpGpyPO7tFg3/nACrzyID//ATrbHRK57Y4Qz3jMTrFYByUmJlCq3l40cfO1/9ikE1V6wPflGmvBIYfEz1DxkUaUQe+3ZkqGpxypXuvwrROUE3oJvwlf+vrkmAbGMRkIw9nz9ATKFtwXx0rZ97wUPkR0HX45UY0dovyS6ZjnB+HTKQQ6rOEZZXnre0+yUHPZFeRVdzKL56NSlWdriAbgNTXv4e/Mc00DJSuquP/c5+gi5H6P7IuWoEx7GVCYmEiyavWyT8DP1t4RdqZXetIpnS5bW/oVYXCJhwW5fd+UvayGi8Y5+BFnglXl1a58yx4Wh6dhABoZZ0NJN1g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:42.7179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b098fab-3bde-47fc-221a-08decebb73bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE0B0E9B58
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a36735a cx=c_pps
 a=N7hQvVYZfm862vJ1WlRLdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=EN7iY71ns0HJhtZGDpMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX/chau5JpfgS7
 qXHjD5DM8srKC7HG9IVGj8pbKPlM2GNumpoU7MD1RkcwCdGWmarzSuDyGDhAeNtZHJEYIEKiyZd
 THdS3GisAVyiTfzhTH8gbDvD/5lIqJM96zvjRwR5acLnLchb7YLK7Qiu3Fl18Duwj5KXiKMd3TO
 W8HQkup0iJeYpqvrd5vSwDilXCWsXjE4DMrAxNvIoQdkSepIpaUg4+FQjSY6Z7gYSg6WR2CxGG+
 5R91MAfAhAXkHW4gUl1BSrdeZSrSLXrLChIcU/CpjQDunyaeKOqfNNBCzm79ni0x7eOIs1Ratgh
 CbJ25oVX4mKJYK/crA+QJGagevFtSrzeQ9GuGv2It63jiQvbgrMMTEmC99Dqz/ETgSGImMSx1vz
 qVx/326OouFg1m0NeuIFVD2kMZpx/ijYhYhvY/zqfCy4G2/L20na2zmwLn+ufUtZKCWkmJ2qZXh
 HFiYawY/XDCUkYuCSkg==
X-Proofpoint-ORIG-GUID: p5sd1OsHkzeOPxVRo7fsRFTg6dHF-Ci4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX2Akch27sH0Nh
 G/9Y8ZSmHYAN6ATeKEJpvyMRe/u2TFRjfVdjamKIpW69UWxkfAx2IBWwhPn2oVvR4FD1vZlEizH
 GHWzifDG/Gzrzy/qYmVSxAL08Z5+xzU=
X-Proofpoint-GUID: p5sd1OsHkzeOPxVRo7fsRFTg6dHF-Ci4
X-Proofpoint-Spam-Reason: safe

As SoundWire devices tend to enumerate on the bus after probe, drivers
frequently need to wait for the device to initialise from common driver
code. The common system is to split drivers into a core module and then
a module for each communication bus. These two facts tend to cause
Kconfig issues, the issue tends to be when SOUNDWIRE=m and DRIVER_I2C=y,
this usually selects DRIVER=y. The driver code then wants to call
sdw_slave_wait_for_init(), but this results in calling a module function
from built in code. A depends on SOUNDWIRE | !SOUNDWIRE could be added to
the end driver but this seems slightly off as it adds a lot of counter
intuitive depends.

A simpler solution is to make sdw_slave_wait_for_init() a static inline
function. As part of doing this add a check for the slave device being
NULL acknowledging that this is likely called from code that is shared
between control buses. It does require dropping the call to
sdw_show_ping_status() but this can be added back in end drivers that
used it originally.

Currently this is causing rand config issues on RT5682 and will soon
also cause similar problems on cs42l43.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 28 --------------------------
 include/linux/soundwire/sdw.h | 37 +++++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b7bdf19ebb42e..fe5316d93fefe 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,34 +1372,6 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
 
-/**
- * sdw_slave_wait_for_init - Wait for device initialisation
- * @slave: Pointer to the SoundWire peripheral.
- * @timeout_ms: Timeout in milliseconds.
- *
- * Wait for a peripheral device to enumerate and be initialised by the
- * SoundWire core.
- *
- * Return: Zero on success, and a negative error code on failure.
- */
-int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
-{
-	unsigned long time;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(timeout_ms));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
-
-	slave->unattach_request = 0;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(sdw_slave_wait_for_init);
-
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a46cbaec59491..92dc051b71b57 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1093,8 +1093,6 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
-int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms);
-
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1138,12 +1136,6 @@ static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
 	return -EINVAL;
 }
 
-static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
-{
-	WARN_ONCE(1, "SoundWire API is disabled");
-	return -EINVAL;
-}
-
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
@@ -1207,4 +1199,33 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
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
+static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
+{
+	unsigned long time;
+
+	if (!slave)
+		return 0;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout_ms));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete\n");
+		return -ETIMEDOUT;
+	}
+
+	slave->unattach_request = 0;
+
+	return 0;
+}
+
 #endif /* __SOUNDWIRE_H */
-- 
2.47.3

