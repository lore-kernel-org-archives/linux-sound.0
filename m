Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F91805E
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652720; cv=fail; b=eCuuzoS+G78iHFX1XQS46DHHSf2mmRg0iLZGg/z5emi1fKowJhTHZYzBaGm/apf5UE/cTH08i/XghcSVJYFJDVs6ygIdebQ/B4/CPPq0fLaumfzWfiLeQzIoSqL80jv5AbcUAf2xzZtUw2EouDSFldwCsJZLePvJ/h9PoKwZ3qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652720; c=relaxed/simple;
	bh=Mrl/YYCsc4hPMFmx7sgi69+dClJ7E/us8ueANNhlJyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lym3FRwXYUflMzjPYoVX9cIFyc78QO5TI7CD5XUtQKKQClon3alIs63/jiFF/CaFfy8WyaDj9G1VHOz34gj8sdIg7hy9IumC+lKtk+edBYuOtDTtTzYbDkd9rd9KTEA2q3vi5UAAOEFOZrUI3Nc0VikI3z38dilIO6kw1cJ0ocQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TkYdG86S; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lTFtHYH8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TkYdG86S";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lTFtHYH8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCpaYH1058789;
	Thu, 20 Nov 2025 09:30:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kWTooyB2ke9IMuSvxPTPxHcSXrdj4FWaUlI7M4TGjmU=; b=
	TkYdG86SWfPM2GECeXXUZhxkRQ52Y2nE5KQF0UZXyYRAD2MnRF3KsmSLsHa+WdDE
	7iS9APSmPa9jdNcklbHqizYcOlZ9lbS21vUZPOZ+lzLo3mIuSZ0/eGWol4BqwCiw
	dMQgZWZDWFoVrxc7bZwoqsX359bt5Hnr9/9/AOZ3PLswjfI3282BNAjxAbatxO8m
	PcYzj9PPIRstkP9LyK2/vBuePj9nFeFcMjZ+ZMb3hrS55y5agiSllAPY0vj9HJAo
	IrLm+4+S0YCvdy3OjIrbBsmY5LNkQAq/7R0T0VMdNvK4fMYOajqlmPiNM5t0z6C5
	ec3PbsPsFKYU3qXExWtg8w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020077.outbound.protection.outlook.com [52.101.61.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMoCRDCGTXfixsXjNn09W08KfqXZ8e0zbQVXQ8JJRlh19ENC4hd6V4Pg+I9NbIZMwtpe08RDYqO82w9qiWAGiYeka+NC2OfZradRC/8ClPD1GwX3EnyMshKfqnD1c+Ys2UqdXId2nrK0LJBA2QYW+m5CoOQ23Xx6/3Nj1MqiY4d0EbXAzxDIa5x2p3lrhgSC9H/V2pei774tk45TsDj+cojZy0YOGoqlaOvADf2YYDq3wrmdXMze1hMEhMbdJnRCfQGUKd1PXsBlhLPoKOPVzcccAY1JQPv44ujtilBDP6w2dFLqrvBgHECjYEE6SJqeUfTP1as/Wc6d1rlwpiO1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWTooyB2ke9IMuSvxPTPxHcSXrdj4FWaUlI7M4TGjmU=;
 b=rMFDdChzOzBv0dH2OI1h/4qpOxhBIbjPPofNoH2LfvW38nmz39EFtrKsgbZ7EPxBITOiGUkT0zcKrCoxGRtP77YFia7Hak2rGI25cBbD2UUxX/rdzgzgfopioZe9Beq7mnB1ft+D4Ey1LwO3Wt/zf6IkdkKl4KY5Yky/0a104mQrKmQazDiWPkw3nYF3SUYeJWFsWS+rcAd+lYQpvvbUFekOWCY31GpHqNHeIs0htl3tHyOPeFV3zDTMZj0l32Ioa+auggVheaMQrv52RFQWeTfhOtMPp4Vy+Zr1A/8+GPJs939B6LE+p8wy16kLiz1a1rc98J/lhGf4bXdBHNuKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWTooyB2ke9IMuSvxPTPxHcSXrdj4FWaUlI7M4TGjmU=;
 b=lTFtHYH8HHK3aapvhonQlGe8QpV28iHfjszrVA/ktT8MLojoFrcotfeMibRpGHCFqn8iubJ/62ygNrUnqWzgceeGp7M9hYt6ZXniHkhx3OBaoukkEsG/e4tW3NL+CnkGGJaGmUQqfmwKxvXkODIDJkzFK8p1etBNnbyAlqkcRik=
Received: from SJ0PR13CA0095.namprd13.prod.outlook.com (2603:10b6:a03:2c5::10)
 by LV0PR19MB9592.namprd19.prod.outlook.com (2603:10b6:408:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:30 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d6) by SJ0PR13CA0095.outlook.office365.com
 (2603:10b6:a03:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Thu,
 20 Nov 2025 15:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C45B2406555;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9FBC882026C;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 04/13] ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
Date: Thu, 20 Nov 2025 15:30:13 +0000
Message-ID: <20251120153023.2105663-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|LV0PR19MB9592:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8331fb2-843c-4724-afda-08de2849bc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?96Xnj6VTlDhrehpuGiOE0C/FivDXq921uFVCyHrOgQ0y373iY4lhqrDn5/II?=
 =?us-ascii?Q?QMKeoFsNGs8jTAOW7SCNj/mfCq4MAz6t2860WZRWGwx8L77NvKV2aDb36Car?=
 =?us-ascii?Q?JCkVF9Gw521sxYZg91MKRrjetCoVElnko9qG6/Uhom8QTQWxji1R0i5rXNi7?=
 =?us-ascii?Q?Y6GEVlOsYST3eneRWIk2SeXkxOfeIET2rUtj5ai1Rb1/GJMDrZ2QeBqUGQ+0?=
 =?us-ascii?Q?ZCh0jBn/nHiyQ7MKVtSnEVLPMPgDPraho8rT0qKhjtkSoPQcbAb9y13Patbc?=
 =?us-ascii?Q?ACFs79WTveex1mNOpW6fsNrY5y0RmqX3pbvsPuNyE7UmDZH/s805hKfKIE1y?=
 =?us-ascii?Q?Bs7Py8X+25Rt3O7/e+SHzTrQ+0WaXi6kzde2q3Zf9239m5IvALylcB6yE5Us?=
 =?us-ascii?Q?H2YpwHF20xXpn+4h6uWTzLlbRdZIerDQ/WydQf1Gqfu7CwxwfoaPwfRMf9pC?=
 =?us-ascii?Q?JtykROUr+XgKlFO77LUVJC/2gjRAwPkOqM6lKN6MRaIUA0IZNxArWV59lBTc?=
 =?us-ascii?Q?P0KWeaN8QawVPdmpkG5+q8yMlRJ4H/XVRTJcLIqtZH8id7L5/mS3yVIk9tA7?=
 =?us-ascii?Q?sqWGl57iQrkBiyolaBUCqxQc+fZVY7B5qEIOM409IxYnV9/sZrhjuSJw0Dal?=
 =?us-ascii?Q?Vy2mVuigLd0wfJwmu2bV9+p3lgpiWMD2GdVJAjxPXUh9FV2Dr1hGz0fCV5OU?=
 =?us-ascii?Q?KJZOPZk4y78zbYzyYYVWxkELQoD+vHlHAtS2AYIj8s4dPNHkbHrCT+Ng533R?=
 =?us-ascii?Q?rPcnYOSXqg/S2AvW+HYfgf/9FuH5RIdPrnxun2qDeKT1KX7/sqOAkEnMRqWc?=
 =?us-ascii?Q?1f94jSaTghgWjWNv/RsXBtFt/TI0fH198BbZ3kx2Kjp6qQ5plBU36PYpRXz7?=
 =?us-ascii?Q?3HjVmjsgAFLPqJDDForeFIhosXKEbI76qsaw1InPr34/GRUg2phW4CLcmIHA?=
 =?us-ascii?Q?CmqzMQoQwMWNGc9SgZtq6KbT0+SCrPhEk+VsEM3tV2zi74dlIwnNj0thwMrG?=
 =?us-ascii?Q?eHCBtRlJLcV5yg03qpNp+84BOU2dgSWtqFMCVL1AvBqIJvDoOZF5HEfABuEp?=
 =?us-ascii?Q?oVp67hvBLTt99Xw/B1pA/+edvYH6pxSYZ51X8f7ca3DUR6JB/R6SxgFNoa6b?=
 =?us-ascii?Q?b2DbSCipvcQGvXVzdZWCLsud1Rz6AjboiWqtW3Icf0hh7a0w/0FmiBSL1pon?=
 =?us-ascii?Q?CyiPOGzINjzua0uYnPndsWb0A7loa6p2ni6kkcEbEJyP5uH26K7vFEXGqg8i?=
 =?us-ascii?Q?JDD4PmA9zvzA5RQAFQAnoZm0gsxvsBUYMWoAdue/qN4kqUgNXTWYP6ZJmgyo?=
 =?us-ascii?Q?KEQjZLTlmzTm/hbRG1m3OCGBgRmK4G+ZYzMTJQIdmpXtY97t3rH4SfP38wZ4?=
 =?us-ascii?Q?rd1j34z6bgTLmSwOVCZN43YaUYBSXYzkOUDTx77DVpcSekhj1S7lwxmu7pOu?=
 =?us-ascii?Q?2mxSQ5sJhmdy7GiHy2p7qZLgym5BAV6aQHRbne3mBBlF2H39xY2cePUOYNFa?=
 =?us-ascii?Q?rmQmyP1FucET88f/RE/JIbtMpg6gUABsGuT8X36tMrY5YVD73BSWTac4AmrN?=
 =?us-ascii?Q?ZQavtBhEaY4RBHW+nDk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:29.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8331fb2-843c-4724-afda-08de2849bc88
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9592
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX6q+vCIEK6da2
 0Kxk/4AEMIO29VDwv2CqrVz6MA4gJZTt1BdBV3F7iqob5Kqn2VBVdpDNtpRHuSxSWp6wwr5nuu3
 4ib6ivKG+/V/m/V+ZhR+t7wiXP+n3EGqohWuvSRSpukM11LMFvHyi7UXzMSyvRQdLzGllUdzMAW
 DJnP6IPsdHiOqe7hNCjxFzUVKXX9pj0ofZy7NR6rSaSdn5cbtCQxH6IgSiY5nYSLLxKQRlXjHXf
 F6pNVyad8q3+5cg8EeuH28QNVnrWLoUmpZ8BphPHEnx+edmQ4NdAhDHR79rtXyF5lPz7TkjDS/F
 Jibj4lmGQIcbD4eShywG/9TCZLC+o/wxOWrCuLPPfpXqp5OR5fwaqgzBYNSr7FZv0Z9g85206XC
 GQCDTu/uXrIQ85E2caaKPe2Uk9P8tQ==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341a cx=c_pps
 a=7U4m4OLb/fLdbCINIKyQHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=VGyL4Ep1fbuEhtY0TiAA:9
X-Proofpoint-GUID: nk5_8PrtMwsS2HBmCFX9dAZN0Exkl2a7
X-Proofpoint-ORIG-GUID: nk5_8PrtMwsS2HBmCFX9dAZN0Exkl2a7
X-Proofpoint-Spam-Reason: safe

The current locking in sdca_fdl_process() locks over
sdca_ump_cancel_timeout() and the timeout work function takes the same
lock, this can lead to a deadlock if the work runs as part of the
cancel. To fix this use scoped_guard and move the cancel timeout to be
outside the lock.

Fixes: e92e25f77748 ("ASoC: SDCA: Add UMP timeout handling for FDL")
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Move back to using scoped_guard, we can't just move the guard because
   there is an exit from the function before the guard is called, and
   the mutex would get released before it has been claimed on that path.

 sound/soc/sdca/sdca_fdl.c | 89 ++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index cb79dc3131b82..6568afacdf1a1 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -402,8 +402,6 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 	unsigned int reg, status;
 	int response, ret;
 
-	guard(mutex)(&fdl_state->lock);
-
 	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
 				      interrupt->function, interrupt->entity,
 				      interrupt->control);
@@ -412,56 +410,59 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 
 	sdca_ump_cancel_timeout(&fdl_state->timeout);
 
-	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
-			   SDCA_CTL_XU_FDL_STATUS, 0);
-	ret = regmap_read(interrupt->function_regmap, reg, &status);
-	if (ret < 0) {
-		dev_err(dev, "failed to read FDL status: %d\n", ret);
-		return ret;
-	}
+	scoped_guard(mutex, &fdl_state->lock) {
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id, SDCA_CTL_XU_FDL_STATUS, 0);
+		ret = regmap_read(interrupt->function_regmap, reg, &status);
+		if (ret < 0) {
+			dev_err(dev, "failed to read FDL status: %d\n", ret);
+			return ret;
+		}
 
-	dev_dbg(dev, "FDL status: %#x\n", status);
+		dev_dbg(dev, "FDL status: %#x\n", status);
 
-	ret = fdl_status_process(interrupt, status);
-	if (ret < 0)
-		goto reset_function;
-
-	response = ret;
+		ret = fdl_status_process(interrupt, status);
+		if (ret < 0)
+			goto reset_function;
 
-	dev_dbg(dev, "FDL response: %#x\n", response);
+		response = ret;
 
-	ret = regmap_write(interrupt->function_regmap, reg,
-			   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
-	if (ret < 0) {
-		dev_err(dev, "failed to set FDL status signal: %d\n", ret);
-		return ret;
-	}
+		dev_dbg(dev, "FDL response: %#x\n", response);
 
-	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
-					interrupt->function, interrupt->entity,
-					interrupt->control);
-	if (ret)
-		return ret;
-
-	switch (response) {
-	case SDCA_CTL_XU_FDLH_RESET_ACK:
-		dev_dbg(dev, "FDL request reset\n");
+		ret = regmap_write(interrupt->function_regmap, reg,
+				   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
+		if (ret < 0) {
+			dev_err(dev, "failed to set FDL status signal: %d\n", ret);
+			return ret;
+		}
 
-		switch (xu->reset_mechanism) {
-		default:
-			dev_warn(dev, "Requested reset mechanism not implemented\n");
+		ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+						interrupt->function,
+						interrupt->entity,
+						interrupt->control);
+		if (ret)
+			return ret;
+
+		switch (response) {
+		case SDCA_CTL_XU_FDLH_RESET_ACK:
+			dev_dbg(dev, "FDL request reset\n");
+
+			switch (xu->reset_mechanism) {
+			default:
+				dev_warn(dev, "Requested reset mechanism not implemented\n");
+				fallthrough;
+			case SDCA_XU_RESET_FUNCTION:
+				goto reset_function;
+			}
+		case SDCA_CTL_XU_FDLH_COMPLETE:
+			if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
+			    status == SDCA_CTL_XU_FDLD_COMPLETE)
+				return 0;
 			fallthrough;
-		case SDCA_XU_RESET_FUNCTION:
-			goto reset_function;
-		}
-	case SDCA_CTL_XU_FDLH_COMPLETE:
-		if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
-		    status == SDCA_CTL_XU_FDLD_COMPLETE)
+		default:
+			sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
 			return 0;
-		fallthrough;
-	default:
-		sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
-		return 0;
+		}
 	}
 
 reset_function:
-- 
2.47.3

