Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FEC13C8EA;
	Tue, 25 Nov 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065611; cv=fail; b=HoqHjAT1Y8bcs+bxcpuXGjRL9LYFINSfWaizN+VSqmGPHCeaNLau5gUqjgjMx5Jh0UIIi7/rWzhDFEWygRTSwfvq1tpMos9pZ2bPa7As5zzLWp+WMIJ0SsvsU6FdEcJGDqVwgZOJD4AENcqPYvFIt7YLStk0xpBHVI3eI0Naitk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065611; c=relaxed/simple;
	bh=HdFGFm97aClty1nebsONXbfIK7hY9INZyjuVl46/a8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gGwn2+BBlhNfDv9kZikpzJqg5mmAiR6kKiXiGSj1olQCwSxuQrM0ICyXkJMgBwA+LlVB3PgUG4SRfZ6t4FTMeeg9skACtdiJLW9aclEGOrVAJpgEtidLncc2tfjzQ7PVyrcHF3mrcNYoXJlUSXUod77KV9UcdRxiHFWJmvtzphg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BVrE6IrF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dlUgcT5f; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BVrE6IrF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dlUgcT5f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5jJEQ3446921;
	Tue, 25 Nov 2025 04:13:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vcPpcjCL2AYvtH72
	1sNNNVTfdE+a3Y1McgkV5BSvmlo=; b=BVrE6IrFvQcA9LeGde89/xNDLBicCKyc
	2uQOn4WYHy3TQiNzszT8xYvfkngU3srGvGUO0/cGc2vMyV9cZ4mCQ8Xd/M82Rj1D
	3BfzR+kpY+9wiMCUtoyyrUbYXhp2Ri2u9ZsZCPB5F+QHZthlXNeDpQp+czbyBCzK
	jc/L3OwG0OWqZU+F6R/I4/mnYqB7guB7tt67aESnv0ICXiW/BZvy95HsAZ5rqKZ/
	4oJDlNpsIzT7mcEENGY5IAlFj9dh3QH0uHAksSRQ8qQC7AfZl6tZFD1wcGLUBcIz
	3PV6c+9eFGj7Oa4fjToWSBV0Iep+1suX/75sgPyK7wuT2OCRcCVITQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020090.outbound.protection.outlook.com [52.101.56.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1atuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 04:13:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmeLupBC4aNOoZZg+Ts8b9JXI7theXdM/mt0nbq3+13xMJjoojblKNJEjcGBql6+cEBWJs584G7drZ6x64vTxytTWsd1Bzuneplj+EHA1o342MQOx54UFPKqtdRtj5qrr7zUMey5QnzWF6w9KNE4nNjjADcL8bzVv27ZOvpIsqHrE4o6hENp7i85+JGMG9B8HVqrHK3Ub19PwubPLOXnMIE9Q82Cql59JRE6E+RQLNePCOS/1YmsRx3AXu82PS3VsHZl7TQSA/KOB5zjfuSBcIj8XYqbG6CBhUJ4kj7RO0t5t+oVMRk0xzgXPQO50+iO1TmbXsBi7K2lefgJ+3Hizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcPpcjCL2AYvtH721sNNNVTfdE+a3Y1McgkV5BSvmlo=;
 b=OHoM8bj4cetTjiXCaZ0WO1raKk/VygOpgDjPGWdqHXwqzz2VM1OzKf2JFSHPFv9WeyA1MhCfvchdrRUUGj9vt76xo3ClZXXUe1fxkENLxy5WghMBlwptEMwQszcbu41pmdB8+eRD9Ycw3IYoGBRMzqAOMuk2uIn5cg+7WzjUHzrsyPyyMy4TSFQ7u8reFMFTet5pm8fbiB3sRDvSmo7ytwpWrjR7xaqYcztnNeHkesJwawV3MCmDuoflv84UGO1TFK65KGu6bEFX6QRlpBlVAcSmyyLlxI8El6BGCh5gV36IbFJ2An7+q0SYy7OII0l2Fk2++1JdhHK+oyBHDkHTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcPpcjCL2AYvtH721sNNNVTfdE+a3Y1McgkV5BSvmlo=;
 b=dlUgcT5f4S00fMITB909E+M7BDQT4OROTwZyT8ExDlqBZBUTz0kD9Wn8PpEaEWM9bjarrRxPUgUhQ+JhkUy0hduFTlegyx5+FS3w4hC6s5IpxVwDdSsyf5WlESK8JnDz1z40hJBeSXuXt06EObTpsyPAi42/Aywl7zXgPXDHBcc=
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by IA1PR19MB6225.namprd19.prod.outlook.com (2603:10b6:208:3eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 10:13:10 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::86) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 10:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 10:13:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2BAF1406540;
	Tue, 25 Nov 2025 10:13:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 08C5B82024D;
	Tue, 25 Nov 2025 10:13:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] soundwire: stream: Prepare ports in parallel to reduce stream start latency
Date: Tue, 25 Nov 2025 10:13:06 +0000
Message-ID: <20251125101306.248932-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA1PR19MB6225:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a11b9b3f-f519-419e-2a67-08de2c0b3bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwHsOl8+h63O5QUWVeW0aJHoKi7V2caROnI7B1lvUJdwgLzJR3lJ6rMTD3O0?=
 =?us-ascii?Q?0smHLnCrMyEdzbPNExvYXY8ZRSjzdNfBfHl+w3pwIwWtbozqPiXWZva0LKDt?=
 =?us-ascii?Q?UkW0T4XNX3fKKgjvc0MopaXHVrlf07ggj+pjiLkGuHN4jY8IiQow4amiJMWa?=
 =?us-ascii?Q?ezqXwmfcO0Y7WG3FaxTAmhbqPpeZEHgOuTtULuILJ+GzUCVRFksbVHZpis7P?=
 =?us-ascii?Q?DXgEWy/IFfK16Ktx0TJd+iANJnQil1//MaonPmv8c/3iIrf4+HT6b14ZpdSU?=
 =?us-ascii?Q?omqENF8EvMB+6hHA80E6fyURYWA9n6JvELFLijntM2dpNgzES7+eh19V7mqj?=
 =?us-ascii?Q?kIBMwlJUZoE4CMeGnBnr6svn/jMkqIrBzSyFF3kQgkcSROv/xr+3O+1T1dEm?=
 =?us-ascii?Q?mV8nhZZ/appYgFbAskGPUuYAhdN6404fw8EXl7aPdzoomC4MehTTXCLHPPFg?=
 =?us-ascii?Q?nnIEKL+eNK1J/axSEZhzHkszuWSY1Fon70UpyKrb0xh3advP0w0a8Cm1vs0u?=
 =?us-ascii?Q?tOFKFqAhkOBSSQS/rACj7HlbMIpS1shSWDLD1Av2eya2b07dPAj6s7vhftFs?=
 =?us-ascii?Q?GfYsgChkxKKpbdf3/maQd5rXBfS9nSzq7tCZ7dDCiXzgVROaDaKquYlb5Vyt?=
 =?us-ascii?Q?Cp1ER/hGk7tvEon/eMblVG8hvD+gSNwAnlOShL0def/QRfYZeMzGb7tz9c8S?=
 =?us-ascii?Q?TE88a/NMq4tNbQzc/2rpolK2sK0kkqNnLZARTxOMwRGRULZ6m6y7rlNuYpxq?=
 =?us-ascii?Q?kaMUXUDHHbI2oscNRsDZ5FOg2KVliB0saJrart96m5QIa5/dFfJ0T0MsTYn9?=
 =?us-ascii?Q?Qqa1LV2I7WL9f1DAlMsNifP/e1vVpEnrrQbiX32jfJVZiyL5Hu5I650SgCLE?=
 =?us-ascii?Q?tFORwHJIer3SuS0lNMR5cMHDoZZVHfhFucd/slGs1BUqQG9Otp+T95Yuphnm?=
 =?us-ascii?Q?edrCS569/BjyEsBYpjMRAjXRDl1fdfSi1xeBEV4ZckBqUMz6NNgfUsNZ98Je?=
 =?us-ascii?Q?C91hka1ZWpLluQJ6aOzA7KmIpqsBei93alDbKjKKzQI18fTlxMgJBB1In4/4?=
 =?us-ascii?Q?ALeyBdEtT6m/WWXWGbyI4zVnvFZf5rw/UxpBnCJ44uwYXZuhqKQgXAWCT8KO?=
 =?us-ascii?Q?zumUo18KFMc83t8V2usRdbVDFIioR22/4JL3CIRDnrTLrHiZ51fXMWCD/TDn?=
 =?us-ascii?Q?cuHZ+TWzMG0Ytz01Wp3/CbMxUuHrgCdBJVaZj7g6h55Youonhnyhhpfl45R6?=
 =?us-ascii?Q?+bo5fvigInr1veHE68T0Rj9TH9HHQwbsfaY/sQZqE1jp1z1uXQsp3/lYvjAt?=
 =?us-ascii?Q?jicCefCddFO8f/ld8QoiSzMV3rS41/mJa6WRWTo9zYT9W8Jthv/AeCituy1g?=
 =?us-ascii?Q?8kF5/IJHPeTCLnDqKiC+LfQN/dYWliev9SXvlkpbh8gu8d2ykN9HzlblLgE9?=
 =?us-ascii?Q?gSa1e7he3lsc2AzDjCbDOzaZGPI0ZmgKfvw3JEg1PH9wzTOHWVnREM6grQQw?=
 =?us-ascii?Q?ELd/1AmdfI/BMmXHkNJgfKNHYntJU0poHgwX0wg9Z6esOU+jLr4OAAqaa7rC?=
 =?us-ascii?Q?2EbiSQ9xGk30jHTvBp8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 10:13:08.8398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b9b3f-f519-419e-2a67-08de2c0b3bbd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6225
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=6925813c cx=c_pps
 a=Nrvumw7QLgJIaKqalUN0sQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=U2mTfj3WJaeVhp2YELYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4MyBTYWx0ZWRfX6QJS5Co9nD+e
 9s2Yx/asCPZY0TJLWeflLqhZJFXvgtnxAVuSzJH7OfA22d+2imS5f2Ha/0gPnpfIP7gbuZ6BsVw
 Zozh9tAv1ACkj1gSaZw6tbnTZSFJga+pKIk5SnwTkpRUBnn/d5ptuKGGg4+/JOFuWi48ClBqCoK
 ti51Ub/qGM2RziE1TvMrTNtbSCSIaKmk1iottBy/jQ5kQdfQMxovz0Nj/atnI5c3zBJk0sptirV
 fmGk5BLXJy7t3oTgnstEaeuppm4ZKjec9qso0usWZ6b0l4jmi5dmHEPAEAZOboe6WjWpjMp8HtN
 RR4ffRuJ8qFM/cmWY0UNKgrVNscVCF+gUGPRYQPbnTOFLu9XQeCtHA/Ybz89l5dlz0wJN12Vkvr
 8ak4kxEf9ppHeZkSByKIXrRbUpORSw==
X-Proofpoint-GUID: U8SywSTubrP2atMfemvL7Ig-uioUnwkN
X-Proofpoint-ORIG-GUID: U8SywSTubrP2atMfemvL7Ig-uioUnwkN
X-Proofpoint-Spam-Reason: safe

Issue DP prepare to all ports that use full CP_SM. Then wait for the
prepare to complete. This allow all the DP to prepare in parallel to
reduce the latency of starting an audio stream.

On a system with six CS35L56 amps, this reduces the startup latency,
from runtime_resume to all amps ready to play, from ~160 ms to ~60 ms.

(Test hardware: UpXtreme i14, BIOS v1.2, Core Ultra 7 155H, 3x CS35L56
on link 0, 3x CS35L56 on link 1).

An initial read of DPn_PREPARESTATUS is done before dropping into the wait,
so that a quick exit can be made if the port is already prepared. Currently
this is essential because the wait deadlocks - the stream setup takes
bus_lock, which blocks the interrupt handler - so the wait for completion
will always timeout.

However, an experiment of removing the bus_lock from stream setup, so that
the interrupt will work, shows that wait for completion takes ~700..800 us
but the quick-exit read takes 50..200 us. So the quick exit is still
valuable even if the stream.c code was rewritten to allow the completion
interrupt to work. Rewriting the code so it doesn't take bus_lock is risky.
The deadlock only lasts until the wait times out so it's not a serious
problem now that the DP prepare happens in parallel.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V2:
- Fixed missing initialization of dp0_prop.

 drivers/soundwire/stream.c | 101 +++++++++++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 38c9dbd35606..10d7afc15219 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -443,14 +443,12 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				       struct sdw_port_runtime *p_rt,
 				       bool prep)
 {
-	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
 	u32 imp_def_interrupts;
 	bool simple_ch_prep_sm;
-	u32 ch_prep_timeout;
 	bool intr = false;
-	int ret = 0, val;
+	int ret = 0;
 	u32 addr;
 
 	prep_ch.num = p_rt->num;
@@ -466,7 +464,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 		imp_def_interrupts = dpn_prop->imp_def_interrupts;
 		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
-		ch_prep_timeout = dpn_prop->ch_prep_timeout;
 	} else {
 		struct sdw_dp0_prop *dp0_prop = s_rt->slave->prop.dp0_prop;
 
@@ -477,7 +474,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 		}
 		imp_def_interrupts = dp0_prop->imp_def_interrupts;
 		simple_ch_prep_sm =  dp0_prop->simple_ch_prep_sm;
-		ch_prep_timeout = dp0_prop->ch_prep_timeout;
 	}
 
 	prep_ch.prepare = prep;
@@ -518,23 +514,16 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 			return ret;
 		}
 
-		/* Wait for completion on port ready */
-		port_ready = &s_rt->slave->port_ready[prep_ch.num];
-		wait_for_completion_timeout(port_ready,
-			msecs_to_jiffies(ch_prep_timeout));
-
-		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
-		if ((val < 0) || (val & p_rt->ch_mask)) {
-			ret = (val < 0) ? val : -ETIMEDOUT;
-			dev_err(&s_rt->slave->dev,
-				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
-			return ret;
-		}
+		/*
+		 * Defer wait for completion to allow all peripherals to
+		 * prepare in parallel.
+		 */
+	} else {
+		/* Inform slaves about ports prepared */
+		sdw_do_port_prep(s_rt, prep_ch,
+				 prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
 	}
 
-	/* Inform slaves about ports prepared */
-	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
-
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
@@ -543,6 +532,67 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	return ret;
 }
 
+static int sdw_wait_prep_slave_ports(struct sdw_bus *bus,
+				     struct sdw_slave_runtime *s_rt,
+				     struct sdw_port_runtime *p_rt)
+{
+	struct completion *port_ready;
+	struct sdw_dpn_prop *dpn_prop;
+	struct sdw_dp0_prop *dp0_prop;
+	struct sdw_prepare_ch prep_ch;
+	bool simple_ch_prep_sm;
+	u32 ch_prep_timeout;
+	int ret, val;
+
+	if (p_rt->num) {
+		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave, s_rt->direction, p_rt->num);
+		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
+		ch_prep_timeout = dpn_prop->ch_prep_timeout;
+	} else {
+		dp0_prop = s_rt->slave->prop.dp0_prop;
+		simple_ch_prep_sm = s_rt->slave->prop.dp0_prop->simple_ch_prep_sm;
+		ch_prep_timeout = dp0_prop->ch_prep_timeout;
+	}
+
+	if (simple_ch_prep_sm)
+		return 0;
+
+	/*
+	 * Check if already prepared. Avoid overhead of waiting for interrupt
+	 * and port_ready completion if we don't need to.
+	 */
+	val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+	if (val < 0) {
+		ret = val;
+		goto err;
+	}
+
+	if (val & p_rt->ch_mask) {
+		/* Wait for completion on port ready */
+		port_ready = &s_rt->slave->port_ready[p_rt->num];
+		wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
+		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+		if ((val < 0) || (val & p_rt->ch_mask)) {
+			ret = (val < 0) ? val : -ETIMEDOUT;
+			goto err;
+		}
+	}
+
+	/* Inform slaves about ports prepared */
+	prep_ch.num = p_rt->num;
+	prep_ch.ch_mask = p_rt->ch_mask;
+	prep_ch.prepare = true;
+	prep_ch.bank = bus->params.next_bank;
+	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_POST_PREP);
+
+	return 0;
+
+err:
+	dev_err(&s_rt->slave->dev, "Chn prep failed for port %d: %d\n", p_rt->num, ret);
+
+	return ret;
+}
+
 static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
 					struct sdw_port_runtime *p_rt,
 					bool prep)
@@ -594,6 +644,17 @@ static int sdw_prep_deprep_ports(struct sdw_master_runtime *m_rt, bool prep)
 		}
 	}
 
+	/* Wait for parallel CP_SM prepare completion */
+	if (prep) {
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				ret = sdw_wait_prep_slave_ports(m_rt->bus, s_rt, p_rt);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
 	/* Prepare/De-prepare Master port(s) */
 	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
 		ret = sdw_prep_deprep_master_ports(m_rt, p_rt, prep);
-- 
2.47.3

