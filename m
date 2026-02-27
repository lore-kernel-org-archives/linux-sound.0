Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2B224AF1;
	Fri, 27 Feb 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191029; cv=fail; b=VtDGiu+EHPN1+rVRvuZSaZevVOs+BZGhzeAO7H8STkKY7B5Lvu6jMhmIVeFt0Km0uS4XqmKRasK0njbuoXyoepoyMCDJVXNdBjC10KlUohYfR4TxKvlxXhquOarcoZW4x7Ck+5wcsGWN8MpIuu8a2UvEl/JyuuJxHyisFWzVHlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191029; c=relaxed/simple;
	bh=WdbgquurnE8ygtiksxxTp25/vdZCFtcaSWa/ZlMkuc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cw8QvX5lsP4n9TYPEhCRjlty3BmKM12dgNArfoP8rHVZ2O8qXLvH6mNad5WcwlhIOKoJPPYxudtc7RssReTzcW27zq3X3bRiR21S+anA4aI/dl6WGYF3/zENqocOeiSR7IjbEyX5B3K7J+hcXQw4RdnWG6LB7/YBoKNcMyooXmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oTOZABSs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j1mVtQiE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oTOZABSs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j1mVtQiE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R58q762937598;
	Fri, 27 Feb 2026 05:16:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iMnyTFlbVdyRMxBo
	isTz46ehD0wnTPmzpTt77ctXt7A=; b=oTOZABSsiYkqLnpTR6axs/kXY0tyMcQ8
	vZEU4IsBjKIQXwXrs18HG945Bxbq+xZInVoklcdmakaeO09gmWjDxm8DZXjf4laW
	h6/Uqwdb2RIxucQ3tHXahVunqcS//Gzbx2FVS2I0E8mVPzwbexflt3M6ZWxydnOX
	lBNWArK341Nrfzd3U56ASCufhRx6eSFHuuAk5stN2nKOCg6bWKQqMHew3ARJi8Nt
	6S9FaAXUPl+ks1K3JXbF/2fMF1RRm4XITHDWFNbYh1VEr0XR1XNNk3SqOiNLFHla
	aHBzIM7Lx3ptqntpiiZ7rINUzDodXhFOPHNmdbDmJwJTOixDOYQDSA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023088.outbound.protection.outlook.com [40.93.196.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j73y8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 05:16:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI30DSos92iP9AX4Z5F6guXbUkfO3s8+3RiG6MyZzctltIn6EXWIt7vynHyNbLHm0N2AMyenRdvHyfIhN7fjy5l8gMSEfTHor0KgE9ntyI4XMAzHaLFbwry3LhYa0pOKN79nRNJ5Z0qP+aXZaA+gZnTNjuUdgAagdfNSFRFGxHb62viLwg3LlDfSxXju4KG0ymrMraea554+pPM9ZGPyQr3x6mcUcM53VIOC+McPoT8epxUz+E4MGsv1vROqUafbejGKicVbGRKdvfl+GWheWoQ0KQODTullqIN3Y6BauwXN06G0M24NXua00ZNZ4KSVJAX6hIxiGXiwTT7xXSOfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMnyTFlbVdyRMxBoisTz46ehD0wnTPmzpTt77ctXt7A=;
 b=xfrePbYu+AG1LvcLQXUuPlpHYY/IS+HCmYIEF1MYm03TOg7uV47GhkCscx6nnvBJ5RCrJIQAvskIiRz8c6dbvyiP707paM1YggmNDqokYZVHmhbDk9uPr1G/acKsG/bMz0A2xaSIkW8ohAzymBFf6fToRyI6jcfkQKm6MD5JAepukMstfPxVc1x1CgaGPt+2tIVwK166WrpDDeoRydz6fpmtqsIV59AivMnplMWc9xxX+p3OdKym7kkQ8Ghh+gL1GiJfylhdmnpXQWprLDpb9MRwktGbWqKSf/3gYtclYJGhUbbnIVxlPhaKyoomLEMHiQ7rxK3YxjXvSpELSz3NGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMnyTFlbVdyRMxBoisTz46ehD0wnTPmzpTt77ctXt7A=;
 b=j1mVtQiEK8h7TQmQxO9A8/YwawGtjHOaEgIsSm90kpsFcyiH/KtrTf8vZLjsgyYmG/Eu930i1q/FrzvXRO42zqf4m1fGHsL2XDYCqge0+1YpAxzsDa529XZH8y+OEPud6ZNPi3BHwjU33RvOd7icMe5rNZO6RfsobJd1j8Is1/Y=
Received: from SN7PR04CA0034.namprd04.prod.outlook.com (2603:10b6:806:120::9)
 by DS2PR19MB9337.namprd19.prod.outlook.com (2603:10b6:8:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 11:16:51 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::fd) by SN7PR04CA0034.outlook.office365.com
 (2603:10b6:806:120::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 11:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 11:16:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EBDBB406541;
	Fri, 27 Feb 2026 11:16:48 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6B6882024B;
	Fri, 27 Feb 2026 11:16:48 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] soundwire: stream: Poll for DP prepare to avoid interrupt deadlock
Date: Fri, 27 Feb 2026 11:16:48 +0000
Message-ID: <20260227111648.175548-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS2PR19MB9337:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fa22d384-d99e-4b93-b4ca-08de75f1b460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	beXrASPqo/eLzwJWY8ygiUK2pYAF5Xz5eYsMr0ZgbMRBB4Wa2as8X/gnuZg5pCM38IPgYeK1FgaLc96CPAEe4aMcs2/wndScLjLyrTwUbpToliMeht+rKdfrWRLr7c8dJ539D44igj3r6V7Fqvgoe5V13AsT2JsE637DGX9xMKE8kManNhfDqt07+17DgEuNl2Y0P/q0fhRBR5Mc8GWMQFOJimCeDyVi8sTzzY5d4umdZcMS79DBlJaqcrdMfRwmuqPKfeb1uYShBKksj+UWFGSgb0sUohilLbNDt6yftDP5b5nUeFfdgGVj/km/5bpR0HMen52s/2XMkTq3JIPtgKMB1Pe4bKVOWj+xwPeBE6sOL/GNXw4JxwLST/D1tm9MkbMpP8hPP7+3fKeyrUXa8upBlLiF6UYcvhEdySK5+hvTuknLB8nNj+1kC611o3HyUve9RXLFFmyMV8n99SjSWcrCMX3flthKzZxDGLyQDJ0GSz/Ir0F8nhckUWLs2HHICzpjNNHiE7EonsU5xaW0YJK35jiErTu5QzTDG47UdmFKYHC0Kl9C1EQkOkXrfTvXJATdmtsqGJ5s25Qlk/yUTcQSBkH4OXuT6JsLNZ+swXh5Cx4c6Sb2fiAI5m+RJX4aLpSFOSdFT/pjrD1IhwOJUlC/30N1kISJPH3b+v0v/T97Fn6jNTuN0ltbfR3tVSuFqSp1igUie5AjaZVltVwtCd8/3IvbwqxQ0VZnpxfoIu7UlZ5fHjgbDCPfnomygb6UXGAEjDsolpJ1UotUmCFZCt6wmM9JGCUxLHFuU9Uvmx000SOeUCfx9ahxxW9agUH7GUrt1/jJUOO6jPpmyjSDaQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dYzkccuqtYMTiYMOjIKmIvxOtmYRKa4FP1OWtiG39RaYsjmS+Wri42VvRF6Ruik9/9JQPo/nKeqieDBFAslPhwY5GJR/5vIpWVHSQz4DvC7rt8dSAPsQTTR/DasZuNV6kJUOlMobwsuRAd5ftwc4frAfFKzXOQrFNHzRCEcz47bN4eZDpJ1NUXE8/LjeY+SutpmUm3g88/RlYttspmHH4rASP8jgYo+XVLS9nIfH20wHMgVKUUfsFRtIFvAlUZg7GNCjjn+2TCgidPX9UexkASVPNJvXjVo7bUFcgsXBHUVQy1hocvC/64oBoFRvPgkOU2BmvBznmPNtagtXvBV1pyuHc8r3GV30XD/HopaVfHg2yn3/TGBda/CFUF83qr6Tdk6UmlyvCFsAvgleWqsCOWIoHNsrW4nnDwqzuWiIOTbBKcgYJLEM50M5tSh3DJZJ
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:16:50.4163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa22d384-d99e-4b93-b4ca-08de75f1b460
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9337
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5OCBTYWx0ZWRfX/DGpAt1XTh5S
 gNI6CrZslAU4NqGU1sSmXl010p1afmFqtyRk73Hy47rqJr+SIOM0anLcfSNz6e5bSwphXmowCzp
 LWKoi7C2p78uUZitVIGzpIxl9r58X1WUhKpHPUj2Xm6k7DrNS9q3HCm0T1OoJQ8Y0gmgSDFIvMC
 +pANRYVWuhuZNZIow0jiOHCxzEPS+nhR9sZOxgE6Hoj2LCU92BmtnIYY6RAGRIUYrzeASSRvf9G
 CjKZ0t26NMpNm3dBZPjMu9ojFtiRPWPfPTxcuQgp0UXRPR9cN/FqzUJfkqpVdXnyiBtmRiyRZQW
 pl7YnWlY87XVMlwbhO2vhkm/6kMLjWT23EG6S8y36gqUKQHrslvrVz7gh3gUKq0DTcR6uxxFTrT
 eLAoVk9RDNYqmF21qzJ5OG8dv9jOtSanJy9m+66h8ZXRKYUkabhR5WB+YHFJ22t+eRCUFIUpeps
 y9q5Hs69B1BrVVUdbHA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a17d26 cx=c_pps
 a=baSawIpcEEtupL8iW46Hvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_K46UHIJAJBd2ueD7XUA:9
X-Proofpoint-GUID: xH75meqjAsrlXWVrVHIrWazI8oMZMXDd
X-Proofpoint-ORIG-GUID: xH75meqjAsrlXWVrVHIrWazI8oMZMXDd
X-Proofpoint-Spam-Reason: safe

Replace the wait_for_completion_timeout() in sdw_prep_deprep_slave_ports()
with a read_poll_timeout().

The original intent of the wait_for_completion_timeout() was to wait for
the port prepare interrupt. But at this time the code is holding the
bus_lock, which prevents the interrupt handler from running. Because of
this, the port_prep completion will not be signaled and the
wait_for_completion_timeout() will always timeout.

Rewriting the code to avoid taking the bus_lock carries risks, and
needs careful consideration of the consequences. It is safer and simpler
to replace the completion with a simple register poll.

As the code is holding the bus_lock, it is already blocking other activity
so consuming control channel bandwidth for polling isn't really a concern.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index b6982f8dcf17..4ed8fb7663ad 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/slab.h>
@@ -18,6 +19,8 @@
 #include <sound/soc.h>
 #include "bus.h"
 
+#define SDW_PORT_PREP_POLL_USEC	1000
+
 /*
  * Array of supported rows and columns as per MIPI SoundWire Specification 1.1
  *
@@ -443,7 +446,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				       struct sdw_port_runtime *p_rt,
 				       bool prep)
 {
-	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
 	u32 imp_def_interrupts;
@@ -518,14 +520,18 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 			return ret;
 		}
 
-		/* Wait for completion on port ready */
-		port_ready = &s_rt->slave->port_ready[prep_ch.num];
-		wait_for_completion_timeout(port_ready,
-			msecs_to_jiffies(ch_prep_timeout));
+		/*
+		 * Poll for NOT_PREPARED==0. Cannot use the interrupt because
+		 * this code holds bus_lock which blocks interrupt handling.
+		 */
+		ret = read_poll_timeout(sdw_read_no_pm, val,
+					(val < 0) || ((val & p_rt->ch_mask) == 0),
+					SDW_PORT_PREP_POLL_USEC, ch_prep_timeout * USEC_PER_MSEC,
+					false, s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+		if (ret || (val < 0)) {
+			if (val < 0)
+				ret = val;
 
-		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
-		if ((val < 0) || (val & p_rt->ch_mask)) {
-			ret = (val < 0) ? val : -ETIMEDOUT;
 			dev_err(&s_rt->slave->dev,
 				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
 			return ret;
-- 
2.47.3

