Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7A37A485;
	Tue, 23 Jun 2026 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209934; cv=fail; b=V84emYkP3yw3geFymYDiGsDU8ZwbfN95zu03TpaArq/+S65TvNAwnBKzuL1sGMJNs6QtdWejqShoR6s3QrrK5qqjApd/xZgjbhk1exDingyTl7ZsgZRLyxzjAtfTBrw10Brx+cIvtzCx1lXd9YMlcWTNUo3E+c0deqEVtG9PZHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209934; c=relaxed/simple;
	bh=WnYjt8Kk0gzLrwf+WbblzBdKxrO5JycZEWwm/KdB8NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPB9bbWLjRAd3+BwiSInBMPpV3aZDXUcauYwoMpOX5mGr73n3C6x7zcyegTtB/g/FVkMOrD5PGtYHZAOknJTjGIuKoyZpGqfUXH7cZiDZaFfG3HTsON8s4aJaBgBsIlbONitBH1Zm/IMSRYOI0nfu9CsEq7+JZuKijTyeJF6Ka0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fA4a2kRk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Nvnm6KQm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fA4a2kRk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Nvnm6KQm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N4O7Wn3485438;
	Tue, 23 Jun 2026 05:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2FDuSrIu0r8VeM5El9qIsoT5FXL2TS4N/CjtyfrD7uQ=; b=
	fA4a2kRkZF609qRBM6ysmPxGcL3B6C2Cpa9tY6kofr5alHLBn6tlHqAMcWTW59gq
	WolOmmRll43HnjdQ3GqNaoamUDxZ82K2thjVxUM4mv/cLa9CF5yX5/1powE90MsN
	lX74YSJYIcLvsTotCZareZk2iHXxMxaCA0QxlSnoDrlCI7N53uLtXy43YL2oD3VZ
	nbtMLR0dTtRoKsObjoOafUG47vR62pT1KC1m7ioOatZcON+f+KvnnLK0hp+MpC3P
	dMJiWd07X0ugJORj46Gk0MWpE0u59L/D+XYzBMsD4aCPYQecFDyAKBHr9vQqFVJ+
	9ZRd6StfPO32VuI2EBhPPQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021121.outbound.protection.outlook.com [52.101.57.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x35c9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:18:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqYYfCmKZ74xupVmYChyMQYbTUXB2QchUteInIfdUjtsLqcfrYBIA646k0do33b2yXgdhG9Yg7JBh/sXWk0dAXMods+pjCmV7mq3IAJgV48QQbZ8/9nJ/13SYknQZkj4RD5Se8w9IgAPpITiUWXce1R5akKwp9MgSp/O0USicitQXyAlDDCGxHj6N93XLtiR12UElQTBRU97vB5AdX4ILPEDmc5Pu5eI4ZA/QS7QvMsn0ua3WsJOYnGEI+LG1esNytAf/T3FxJx5EGux0M3L33cLMDeLT5kxr8SvbxOnDfRy7TpPazjQXSAjVgfOVgPNjp5aKydr6H6RNdGTth4dTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FDuSrIu0r8VeM5El9qIsoT5FXL2TS4N/CjtyfrD7uQ=;
 b=EdOdp2tEDkksHnRx4i2g2oxuAk7qQoq+lTV0Vpk2U66bBp4hFyDCrvxwTXIsQE4xBY5Y7Ow+ZdYBiC6GW/1TCfwORzeSq/up+eYWn8/bPfZ3bBxzFPpVkoMrbeZirga+TIopxllg7dIrH3EwWFzIskOojjfOyAImxNdlFOixv/sVmJYtIboumW8mmognoaDf7tv0s5TLAkRaVWwWf8xHTakBxufahxfUTFdZmwDfJIPH92Q8tOTTavIsZgbJooyyG40MkwH1eZT/HJQ5CsZG650pVNofntZKu4/2oBkwu8Nz7I9hclbakBsx03wrSslfnARWUIKz6zuxmnL0xHNPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FDuSrIu0r8VeM5El9qIsoT5FXL2TS4N/CjtyfrD7uQ=;
 b=Nvnm6KQm2+FG4qYd/vN9etttPIK9wtCDyVPl2Oe56BBmjTvYTo6eaXmi/gtF/huuMVle1m9LfEnl+1RAUs3ds2P/8sAlzllzjIMt5cx2ST1SG2SDjyeVAiaWl21cBxhH62KJcPqiRjFvlxNWKa16yjJ2W1m+IBe70bi+9cuMDP8=
Received: from SJ0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:a03:33e::6)
 by DS6PR19MB997247.namprd19.prod.outlook.com (2603:10b6:8:367::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 10:18:24 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::97) by SJ0PR03CA0031.outlook.office365.com
 (2603:10b6:a03:33e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 10:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 10:18:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 496C0406550;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2131D82026C;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 1/5] soundwire: Move wait for initialisation helper to header
Date: Tue, 23 Jun 2026 11:18:10 +0100
Message-ID: <20260623101814.24044-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
References: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS6PR19MB997247:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2a9dbe08-dff9-4b46-fa49-08ded110c18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|7416014|56012099006|11063799006|3023799007|6133799003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iixgRARVv/9cSYxD0ZdymV+1S16WSFxFnGE64DLEkuggYaE5Vr0QpQAzhlvRfUFOcoz4Yf+V3Tc6wbp3UNN596jhM+bsHtMhfwr6uLga1Jyk/tG62JWyqUcaILYgLozVh1KKBOQg28YAWoJ033bvYSfXNW1cPYxQylbZeQZyF5YFheq5ZmRwpdV0FPIxTER0ToojzTGJSv7HoRyXodQyv2Cors9kRfWMHY/eW0aKnj8kf24V30J5oz35u+C5e/eZAxnpRhNphgvOpWt7jtgzpUlXTQDlCsqfXEWKfrvZ83WkJ2HmESmhYOFCFmZvgv44sPYtLuV5Qpw33V1XNatEearoTHDNSNdul0Uut/1tlrgGbpVFGfzJyrZwBjz8r3EUgqWnH5d/8tE/bKxWbti8EqqcwuiQD8adEMvHGM9Vjd8evbe9wPJATsR2AkaNs+cNAKyAu5Ib79Tr7urD95044qKuQPpuEFbNSR6AJnJAroRvwDZ0+OaKOTvN1o4gvR2qllugIr/BoTjnM7YK/PomIljhPWWhU0i3KnFPbfxa98aLFbTrGvAdJVbGjRX/YeLlFNY4MHQgMuj/LRhWAgRd1ivh4wQa8xEBd+vu8z1VfPNt6bAuxf2xJM/eyyEBwsfOKyXsPsUIVmt5YDucD+0rX6dvEoF/vQ3uUTmLkGa9RXVQ8+zk59S5prwO0QlcSitJA8z4cmtUknjXi1NaQTKpQA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(7416014)(56012099006)(11063799006)(3023799007)(6133799003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gadtk9wDXAvPBGg8LHhNXFlVmUaxGP4bnoVg/dQKDLCoZENA8ZKEmVuaZVIDvkWCFCKnCSwQD8Kt+A1mC8hx77yIi6MhB2YUbg/A3Le4Q2M1CYgbryOWcE49dQ4UmaP2T4nX9hholPsMK/24H7affcdTT8cdiOK0SyZeWMs64GhUSHBZ84ra7AmTab0WRIOCJTGaum6X48ejNJipk/x1Sv361UFalCBziEvAMpRAp0EjqFtYl8k2sPxMrJLqwDl1AzOuY7m41bkSOSvc93RPxmJ07/6SrvZ3+DxDaRWBJQ8WGPyGHnuJeVOlo/RWXMZhNKCXXXkEbGsbt5JLIp16jM3EMxOPzsbUNfvl/OG9B6JaV3Q9pLAd1ZHUYORhq2pEBnxPmSd+lIWUPi8aY8htNjmvIe0Db9RLiFAMGgMgDwFc5Glnu7UdPk0VqhezwR77
X-Exchange-RoutingPolicyChecked:
	E4JKyqxqiWiKwJ01rdz6B6KTM4LiX5L94aMhIjtZBXCDR2P3bGmf+cuwj3mbnbg5Y+l0d76QOzt882mPbuXGFqhsynpjuIMeyJxl20SxsBK5LOv05WS+XLP2hdN4M0NCepwt2nFmv0fQeXJXqu4OcSwiTQgxZ7dmaRQx1mtlLVlsUdTfqi7bTkYksUY2GK2P5VqKMB5l0x5S7Y72SmgpY9WZt5+kk4sLyB1i4CXW6C2nwkqJEBmiwMf0nPtSPy91I0ClqoiGxUgEMwWXBe4bp0i8ZmhAbRgpvmfgw/xEdtmHJTCuHc3/+9rCFwGSbpvFb4YNjGKZe8KRw+NHIG1unw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:18:22.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9dbe08-dff9-4b46-fa49-08ded110c18d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR19MB997247
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3a5d73 cx=c_pps
 a=twImIRnwXVHz+pcTAbAWxA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=EN7iY71ns0HJhtZGDpMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX5AeV7fJFVcf4
 lcXASk0UFVy68vVZJBgFdDaHo0a5DbEX1bfmDVghUItebiZzzYKcM+kjDgnjfTGD7SNeyWejs33
 gGSkmA5AvIrDNKAWd2lFbfXh8l5t4jNAs8VB37GmYP4CW/o9eBOzzRh0LItlXHSPfWxrJg1sIQU
 /bYuta1YGT8oNigTymb09elH67IuJ05U+zSSPDB9ewCKsQw0usWKTN03yVNKEwQlXjuiVoJYRWR
 SdVqI4FQBwfpZk/RUbc/rKsQCY65clyFPOFo+see2hVipq5sVlFCU4iuZMGz5IxKVr8GF2KSi7G
 tWHafCdp9PTqG+fbMTZG4Bk6VzoTRPG54RJIQ8yVA+BU6ADzeZ55MDqmQC0bvlRRLaYKhuXtuot
 nynF5E05Gj/h6QUzmJZ31YwutG8/+BfrZfMfj3oBaVAu+fWZZrAWPeWCaiVIS04KvOQrRYaH2wy
 PyWMxNMctDU2syYaaag==
X-Proofpoint-ORIG-GUID: jZK4X64mL73dW9y9ht27_1q7h9p9fO3G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX1dUM+2+UVxXZ
 HM3h8mEC7QGPgEZeN6wJGMMmwyLCEjWVPlZivkqHCjoPA1H6KkmeuOJrZ4eA+PQHN4Is3d4kOmt
 wo5Dc8YLu2G9Pws996DSSQySPCUaWmE=
X-Proofpoint-GUID: jZK4X64mL73dW9y9ht27_1q7h9p9fO3G
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

Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add include of jiffies.h

 drivers/soundwire/bus.c       | 28 --------------------------
 include/linux/soundwire/sdw.h | 38 +++++++++++++++++++++++++++--------
 2 files changed, 30 insertions(+), 36 deletions(-)

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
index a46cbaec59491..b484784e2690d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -11,6 +11,7 @@
 #include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/jiffies.h>
 #include <linux/lockdep_types.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
@@ -1093,8 +1094,6 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
-int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms);
-
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1138,12 +1137,6 @@ static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
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
@@ -1207,4 +1200,33 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
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

