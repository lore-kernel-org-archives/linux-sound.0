Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF33FFF9F;
	Mon, 15 Jun 2026 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535987; cv=fail; b=Y4Or0ILLdS8DTGaKPn67emuJZRcDgPM8o2LKIMN5eHfFpnTQnTL1pje3yQtz7OArB5c35kx6MR8kzUZO8Qawx0lLSS6LS+hh9dYe0h+InLqgKDdf6/lI2iqCaoCTUtXxDJ5D5pl70+jkc2uWelV77/o8gHalarbJPX8i62B0IxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535987; c=relaxed/simple;
	bh=TGcg8WIPmzTOn9Spai+3l3HQCIpCmPH54ijn2AMpHLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AcFRAf1iz+mzhqaYspiQbbDrRfjmDhU8wNUX4FePnQjZCr0Gu9Z/eYWmV1Fq8AVyt/4TuglJObJBvdHGv10TUvefH2TN2xPaTPl/BshSkc42DjNjoJtX/SAFs/9Kqyl23dS8dhDsto6/xCfCQFAGsT6DRWEvwjodtgUinr9pRr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SKJpmRnH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pTjpzCXh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SKJpmRnH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pTjpzCXh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCKaZj3387487;
	Mon, 15 Jun 2026 10:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nq7u9E4ULZb/cDJ4
	uow/LfebeKYaT6jbcWGVTCH6Wb0=; b=SKJpmRnHhjyf0/jSqS+RhGXSBkWPecBX
	fKr77jy2DYTpTePsBX6E29qv2MeZrjN0Tmd1s/mxvqqi/dJHB5mfqjt3/Bm6mvAN
	tENPpeg8wS4h4iTVC3Yb3oNTISNG1bqbgb2FTNGY+OKY4en7SdiMxxJABNZximV1
	npMcz/2KaNUmm9/wQJMsH1ctOvm1viJXqLjyTaJlPFJn2VkjPKL1HdPmype8k/mV
	pv/x2gJ+6iV9HU9bPzvvrygtSktdr7chbSVgzUScQT9/osKMy1yQiE8bISplaov+
	zjZ8sj1lUPxaP/Sbe/FB82YgR0+PyHW05DAFZVQ1esxBhHyTREgmYg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023109.outbound.protection.outlook.com [40.93.196.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4es3mftfh8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 10:05:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5/jWxFAOZ/6zAscM+iza6St81416F1Tv9ms7iQkoSccipjFQPHU3MhHKf8pY5PTju70hzI6gGyykxsXSK5F+sWbrbpgMTCyRmgO/naQraq8XoLphnyvNAA8N4am3IFhk/qlRcz9CTQ/mgQypU7qkM7X1idKC8Po0Gl8oTLCXDwTFewEhszAhWwfiKIIlUs17ICBZNYnAbM17KCu5qwz3SiVKgDOhZFzXSaWHyp4hYO/6G3PCQ/MXiEH2ebv2A/+rxLvOsdUAXSBnpZ+CD56ilfQtciPP081estsAvyd67HloKADbQnxm5Z7Llf2ZCSjfR3oITU2csBb/j1n7LU1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq7u9E4ULZb/cDJ4uow/LfebeKYaT6jbcWGVTCH6Wb0=;
 b=wlBVIcGPksCoEG3GYrN5IREvyiHd+gimn7DvL6o0bZt/26+H9ZRUhwb85XKNah/asFhq29doX6EYgFvYJAHkxA+sDRmQQGxa0bPqliQvmFOBWfoSTopJnQC22UeeoG18zGFIc8l8qf2sfPpkmBWwLLMDYcJJ/hun2pFgl4Nti7/NVVfD0rcISbHVmKfM5XIKW8PEn2pDiynqqeerkCQH99O856ZuhefeAbMAkHu3s/ndoc/jVo4eGHGLFY/mUoqlDRiH2xjtqhIJ2thlU/e1kHaTGLBGyfDqWg8pn6i0xX6TUsmlO+c07zL9XJjbyirorTDWP6AMc/cTB3/C8MeE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq7u9E4ULZb/cDJ4uow/LfebeKYaT6jbcWGVTCH6Wb0=;
 b=pTjpzCXh8IAqf8WGjpDKmNOHO70oYh5rJuq8oAiVIBStLEDysjvpU9pPm2NSqnDXEXQjEmd8BC5woWluIu8uC+L7QUE45Xl6RHlVWq+0rmedYKvuvh+i5SyWSC5Fo5pbt2PqFennkG4uT58GgCbmQFnxyutlg8IMQ+q9a0LMzTg=
Received: from SJ0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:a03:3a1::13)
 by SN4PR19MB5456.namprd19.prod.outlook.com (2603:10b6:806:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 15:05:29 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::41) by SJ0PR03CA0368.outlook.office365.com
 (2603:10b6:a03:3a1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 15:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 15 Jun 2026 15:05:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67DD0406544;
	Mon, 15 Jun 2026 15:05:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 58CC282024A;
	Mon, 15 Jun 2026 15:05:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        broonie@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: Correct ifdef for stub functions
Date: Mon, 15 Jun 2026 16:05:22 +0100
Message-ID: <20260615150523.4006982-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SN4PR19MB5456:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e807e317-ee80-4983-6528-08decaef898a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|7416014|23010399003|18002099003|16102099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	HemJaJWG/IcC/o7k+WgJoVuMrwOPyNREXwVhw+mzeZgfe2U+Z9gVREOxhOksuQRkONpz0nKPMaivsFxjIxyxd1bYk8fBZPD/rCWpfgkqwb0WrBHGlt6IgCZZwWFU+ma1WQaszzgU3xYFza1sQG8Rj/JvliIXG8KtyMLveswZRtUaNlZf/DwhT7RBn4JMrj9ofYKhjK2wlZhaC/7QF0+45nwSs0iTJRrHTQbFkFxDeNeDpI8enPEaciJukHlesCTYYsV41vzS+bn9c8O/2lw6LtWhFZtQVIWa4FM4v9IntiDOzo7pdh2EINq/FiehJbJVmA4ckOmRxJwygcFnH3y3aXc+IyyxvYYj8bU7EZC/IHmfzofq/Lr7uAj6M6D3MmP7bO7fkzewt5CwX5UFZRFh+VHvt8FTwT9meqag9mTPf7aIXLCS/H7qzagg5gJGyNfFy6CjY2zYUGMyuE3bNLL6GTJVICIfZJk7rH/5Tev2lHh4wLWoEblD7bMIlnUGw7kmV/ex+jLWoQy1PH6dU1Um7ZaSp4hTf8Q36xhqUoru8nT117DoJsI9mbZ4SMIbGnWstW4+i143zTdikQCeqmqE2sv74ZOsp+GNba/1umUymDGnuN9uaEuVxI1UvAYNtT95LjqgUokuaZQmAB3VyIrBAsxWuUaAtXPsGOWKbnDvsrlkFlepWwTkjBN/MAYV2yDH8bM6aQrjxI8c4kLNgwkbFv8WwtIkjkp1qzcwJloKiDM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(7416014)(23010399003)(18002099003)(16102099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tabzABbW/Ba+04U9QMCioqth7Zxx7mNVzFLfH3YdLRcLMRDBNfpv1j9ShW1L8tP+ERisdK6bFPIdSs1ubJZ/Aje56IE25H76Gme2vvPH9tr0gkqxjutt2Z3r05tjSuzqpxwUyDzOTWCWDXFsctAq2Kw2C3l8Kp6iBdyYxrsfNU5aZFkZR8FPpq5rlKjNfLaYbbA8k/gVEZs3qnq1XAQH6WWNRq0dULTVCNsYeqlAaebxR9UHC54N0eqaoEJXIvimmN+BXrp/WDkR8Xp3Ek+lLxklze0X+k9SHjn6cZNb/NxnfWa8jIhM1n5iQlyZUlDBNeTs/AsFKT4PMWRIqCvixPIxAgL27SfRLEdAolztsjIOqBs7Z/Tlr9X4z4ExaYfCVCOiahNdHuDUO/5EOs7gbBprW+mK2n/V5NEaj/o8MHKk2GYXg+tStcJRu5kGZxtf
X-Exchange-RoutingPolicyChecked:
	qX2Xo569q3TuJIRqsD1B5P/PghyY0FqcwebHWf5ZMlReKy91Nm6IbVmzSvkCEP0Gmr5DSOzr3VCyvR7nsRVwxXddtFo5lYjm73qUNothxka6tAPA6go0ieNiVGrzvkTL2KQvIeMEhufi8wDqUQ0FrSV3/VGI5g53B60/V7tWzzdQjzcJl7QxOsRq1pBRV0CpBqSijDk4daltJf3BgI3BVI58GjARz4c3gAgQo07//7rPe81wMZdiKvICEGIY+oQdl9K1TQzkvM7s2c/Bu2TEGxIPQRE+UbXw52evDkvvQmZKMEf9IA1PNvlWfQzV98rq2J+o3FKE0qdeRoKl6C4UGQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 15:05:28.3340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e807e317-ee80-4983-6528-08decaef898a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5456
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1OCBTYWx0ZWRfX0QJmBPvp7jAx
 9Qq2PPOQGzizjtXd9GXpFz+zSWx15ocKQGy9irjCij/V5n0AvAx0MbPx/6eLwsOdsqI2JWHYGdn
 MCiyYDCgVNoVkxFNibT0g27EsysGdpY=
X-Authority-Analysis: v=2.4 cv=ZP7nX37b c=1 sm=1 tr=0 ts=6a3014bc cx=c_pps
 a=V25D3nnXj/TfbbJZ4owJgQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=kqG5rOjYqxWc-y-_koYA:9
X-Proofpoint-ORIG-GUID: XQBx6Wq_MTcH06GF2txVMrPdVt7jfbUp
X-Proofpoint-GUID: XQBx6Wq_MTcH06GF2txVMrPdVt7jfbUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1OCBTYWx0ZWRfXxWM6Kw0wa1to
 n28ytjQy9oJTYT9vQw2bz/53J+iTHjd/9z2w25cxKUL2LxzZPuYlLFLvkp9cpdrD5BJGIItduti
 GPW//2hCYmU38HX9viqKHtENNiI4M7BkIcuzpZBnHy873oFAcwSewEa8h6CDqqADyEM5zFQIdoe
 hl/mAaxYjtPr1vA90xwo8eiB/c4ljJWEY8/gRDOPW/iQrk+nKUllC3TGCUk88685VQKjqe6KBs+
 dXKUscQrZGgMV8L/7xd9dvZe6RjN0qW8xw6Q1eKoEeyoqckaCSEu2vQ7a0Jr2mW9DiSAh/j0qbe
 vynFjKKAMIDPHvVAmyxKPByt8vWZfmze8C260PoeTBYorHjBS3ZPbqQzR5nuGfsZm0pAQ2NhAZ+
 p7tugwzxuhZGWHbiQcJJFto+cfEelCtdg8tkiOpeeDh/xFB5MJ8l3EgtFSIOusjCB2B+Xf2lURk
 i0AWkZK7QxAPL74j5WA==
X-Proofpoint-Spam-Reason: safe

Currently the stubs for SoundWire functions are enabled using
IS_ENABLED(). The trouble is if a driver intends to use the stubs
it by definition also does not depend on SOUNDWIRE. This means a
state can arise where SOUNDWIRE=m and DRIVER_CALLING_STUBS=y,
leading to a link time failure. Update the stubs to use
IS_REACHABLE such that the stubs will still be used in the
above situation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606151303.Erj5lfRD-lkp@intel.com/
Fixes: 6726b47a2a60 ("soundwire: Provide build stubs for common functions")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/linux/soundwire/sdw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6147eb1fb210d..b96f0310da7c0 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1077,7 +1077,7 @@ int sdw_bpt_send_async(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_
 int sdw_bpt_wait(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
 int sdw_bpt_send_sync(struct sdw_bus *bus, struct sdw_slave *slave, struct sdw_bpt_msg *msg);
 
-#if IS_ENABLED(CONFIG_SOUNDWIRE)
+#if IS_REACHABLE(CONFIG_SOUNDWIRE)
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
 			 struct sdw_stream_config *stream_config,
-- 
2.47.3

