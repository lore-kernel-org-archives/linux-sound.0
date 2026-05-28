Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30D63AEF22;
	Thu, 28 May 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980323; cv=fail; b=LVU2do+8cyJz+GmesNr3ly6UVCs3QqrFGBOD5sLozcoIx/skp0UApQmSBg6+V0RicPbOrfP9hQ/KSrG+wuzeuVCsxDqKD0W4aG6Z3Tu8qPostat/QgbKYcnsU9u59Yphiw3CaW2Zs01AD7jzhg+T3st0QKdWWHQ2tMhPAb5nFRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980323; c=relaxed/simple;
	bh=DOZl6AaqXpln6wO3rwdNFtzp2ixshBJ2Xa9oDI3TXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lfcuXkFRUbE/CtjX6bCAM7Y9AghbCSKX7RwNEVkIcu9Fk3/qwR9pBARqWKzkGuNVH4stlWerohZmC2n7t8uI9844eZ3XI23C/s6DPz0ffZzLUuanpGZCzw7sN/rQz0M83IOm7DKopD0QnCsSPr7w59owUgR08/hT+Mmx+guWSFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=js5iimMn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ziLUqv1d; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="js5iimMn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ziLUqv1d"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SDaMZj274022;
	Thu, 28 May 2026 09:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=sTlP9qSht40J/48/
	bSg3rc+AW/tvP/r9az1SB8SYpck=; b=js5iimMnQFsUryV+eWnuADLCI8w5seHN
	ztixZTX6h1TRwCp5Va+pmUEaB6YJY2XsA6jUmaVE/j8UCQz+Mqw7A8B1bfjSZ/NW
	DQeI0WoF/yvfyOH+FAE2lx9WYJnbLUyb081bLZ9BFOx/h/kv/M2XLSypT0BKdd8G
	CS/Zg3zCRKl4Pa5hJP2xkaCY9ZAePdv6wCY4xK58zBSoh5NHrmIdjoLpO09nEprS
	RxGyocpENEfYNMSMVo0Qrf+wheAmoF4UWQdnZeRKJCJU/2ariLLSPHU8//LFAyqy
	mnoYJUZE7+fkRKIOl6xbnbj1nnZNdUu54CEA+lF8/ndOcoQjSGqhKA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020136.outbound.protection.outlook.com [52.101.193.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7wt91qc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 09:58:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqR7H3J+EN9ZVNykNLZTOusNYmSHHzUZqaBGMl7uG/dlr6yEOQDr7kNGTKMAzaKcchNsC9/wmpGXybV4AWvwxJ8XNVX33AU0FuQ0XyV4xNVm6HIh1E9ZGlYeYdKwaM4dYYrfPWXxKa23+FMdQw6sRWjR2hmfRNwOFqWmP7j8Ky3MuxtS5OvgSIdgDjx0bWl/+bvgxp6ZtaLMdsA0aHiwltMuj6m0R4puIsb4erf8bZvWjpJCcnAXfnQVfedTYUsKPvf2LZ2fUo0hTCjIXetqnwEsWjQ4DepSk7T0UaU/bBZLcD5KyKYc2uojcc7hBpfRhZFQPy1ZvYmdW92zQ4CD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTlP9qSht40J/48/bSg3rc+AW/tvP/r9az1SB8SYpck=;
 b=PLO+8FJosgOyoFbv50Y0rK9RtcT1D4pcoJyP5T1J3+7LuXGvHS2WrM93AK0L39Zij0sBPVMAazTXiFlnUurvIBXWAireptgAGrkKxZ5PgWhAMwjz2Xs1wyvpVr2n+03k9EGHCAbJIuOIOt4H2ZrwiX2cg7giYvaoF1yivuzDsCBSBt+NGoUH02cP5+qvt9S0koxPZl2mB6K9HnHObcTz2our2Tzh7o8KKVvOyWe4oM56U7/2Oy5HnVRQiMn6zkO/8yb9XEzUhT9ZSCTAFIzb5BOXGZOTlIi8Xf7ZOc+UZXsYTZRi/JoL+Db1R67Uy6YatagPYh0ThUFeKijbtbEgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTlP9qSht40J/48/bSg3rc+AW/tvP/r9az1SB8SYpck=;
 b=ziLUqv1dqFmZs0f/MgJvJJdy8pvFaZUCH+ygQTVddg1vPDALXT0paVC5WUE5uB/2qXCp919/daLb6Mmb+2Ym1jQ9zH5DuKViN7yCj9KwpTkjlB1sOFxwvbPKwQp7HAnwgs42nx53wU5DMBaWCkScGwMYkI4+t6Eu4z0EpuFmtPs=
Received: from IA1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::16)
 by BY3PR19MB5169.namprd19.prod.outlook.com (2603:10b6:a03:361::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 14:58:29 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::49) by IA1P220CA0012.outlook.office365.com
 (2603:10b6:208:461::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 14:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 14:58:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EA739406540;
	Thu, 28 May 2026 14:58:27 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DCE2C820244;
	Thu, 28 May 2026 14:58:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Share common SoundWire interrupt enable/disable code
Date: Thu, 28 May 2026 15:58:27 +0100
Message-ID: <20260528145827.137898-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BY3PR19MB5169:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 566fa60f-e810-4fd8-410c-08debcc993fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|16102099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	qvjdGeqCLpgd9ByCuXOCtwi4L3F+Kj7PprbdrWZOwmsRiDDgq+4da3DF5bWkeeZQKlaGKfS+RXzXLCaJZFsAk5qo0rEg5mOCh311/mDBlg6AORHWXoqw0odcEo/O6hQepUfASHcnD4Q166iIAJ1QUPvHJgoVepuUIowbnTJxo01Kn3En4XnGJhZ4X+sF0J4nn4y/EhIqaqLIPfIH6iLIkyFehBCsBhoWEeyY71G/CEnxeXY6zIzC3XGLHs0m4TLQz7gJ+R0ceeWB0UAFxCPPMX1Szh8x7xqeBT4wcW/sGOygkpQQhwxDKaEG3PJ6ZBKE4a/q6olUi2SWit4JjcniXoO+cjB6XPvFgLPbxTrKp5vSHSnHB41D4a4Ou2lEBiVHUINkVa3s3mIRiTX3ohw8nttfafsQsHLHIjEumEKGycMF2GMpCg3FHtt92P8+jsU30bu2iKAZkaNvxRrNx9KpgizLHti4aEZVm5FaanKo1aCNLBvGbwsgAD1e1DC0b8z2aFrhlappk8wT+MjaHCEopZBEs2TcHsm/e//UFuZMtJo592ot4A+5B1lbcFv9r4zDq/nCUrC35QmxzQwWz4Z1aaIfOOOwCVEuDuyRgKg3dV1UGNaNS0chtH9epmaap68oqKeWyKUgue8AZjHpBDiJo/J0tSpqEk++ysKSCJD5wkZNT1DHxascJirwP7DxF1wVq7gnJ+F6Zwx7CKOSodZ1F/UygFPYQG4TXsGAqQc1nR4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(16102099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bKjmeaPRfssw//r85/9i0mUagYh2ljZ+yRyzfu3OW27bR++1SaLkTSl9beikmVeCGnNZRuA+YYJDt9zDAE6Y2oWclY7LdXKXdx9JL0Zk+uXMcx8EMHTy9kgpWvHt8cjV6ssnkjLTZ/SwiNYFOWktlnYbGcMk+Ze9AmSGqEtIjB4EVHuoq9ju0VvyX+oVtLgODhlDyqh/0Hbk+8tQmzSwBc9XOhQsnludX6UAj7pKYfZwBWtT2KP0q6dX+yIbLaSFtyUxdSqTsoj4T+hbyTK8+5ZexZunYS5R3KPHB9BoC9RZ2s4R6y5xfDQJqhADGoO3qpgmATiGPUw5blru78txPrG2WkKJx8kaF5ZNWCo+GBpf1jNccoWRTZqRCNuoNv1CWNqHN/anHktpoQ1bike4D51UZi2BnpJAcpWVJ87BxrMtBe7Cgue/MEsBu3O0lanC
X-Exchange-RoutingPolicyChecked:
	f2ZyOmymARTyLE0BLPpBVwckp0ETPLCRYFTU3ZJ5mM/WyKOVyWFtwvKWp/QN3ascOgxe174pd0BLVuXeeeiatBAhkO9OGwDa3kreMiEMRF0TuseS/dXTGd/KoJ67Hp5rAFyuGZkdY7AlkKewoipwlk+PGrG6G1LgtfBhMntzUD4gmH57SFTGK6iyF2cpvBs90c7Jw6iFZ8Gm2PPbejajFS/XGrFeKdX9aAvGDd5QpVmltDRI0OmTvg6Bu3OghWjaXv8MMrqwdMzN4W+Dk28m3MwJQpUxZZDqNzfQS2B5H/z2WzasTXjp+bLgxqYqSlJEdj5c8Tj6QI1V1PS5bRpSrg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:58:28.8428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566fa60f-e810-4fd8-410c-08debcc993fe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5169
X-Proofpoint-GUID: 59FsVmfMPglLqtpC_gqNbo1PxkKKxBJ5
X-Authority-Analysis: v=2.4 cv=J+qaKgnS c=1 sm=1 tr=0 ts=6a18581a cx=c_pps
 a=7KKYEoKmDP67vAiH5G4Tpg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=K1VpkZIB_MQl3lKWWWkA:9
X-Proofpoint-ORIG-GUID: 59FsVmfMPglLqtpC_gqNbo1PxkKKxBJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MSBTYWx0ZWRfX6qJ+oy/WJHq5
 6J4j0N/KyduGCLGPDj+BN5XfCNNqJ5dRlI8MgS/IJ0jKOGQpfh7E1li5+J1h1VBwRXkcBk+it2C
 dkJaExLOJeahW9daelTjaX2kOt+LbXPYp8ak6AxOWnQNxOvMtDXCfq+xCEE01oQET9klWuhv1gy
 9CNLgbm+e4j7dwk7g2ZrYsgjyAZjd/AhDlYIxDR5RQhXQJKqg5hqmA0S3dk06ZXWrGVTZq0qRYA
 O3Pngw7pVd5xHS+/jUc4hHO1+ZN7gi1NOiN+0CA4u5CNC3hRTSdQg06dBqAuImPgjqOSfibIWcA
 4WupIEWGakfHx5Fq/7vAtv6b10CUYWGOG+O3kTraw1mCsgsTZ1rRb7ckG3vjakZHCJn7iJijBek
 tkH+G5VLtNcn8LHwCz19ORWI2EqztKyfPStrP+kZkFVQH7PPw7BzmDVuD9QpmBy3IWaVLEHNDk3
 rrShXsiMqU7AcMq/SVA==
X-Proofpoint-Spam-Reason: safe

Move the duplicated SoundWire interrupt enable/disable code into shared
functions. These functions must be in cs35l56-shared module to prevent
circular dependency between cs35l56.c and cs35l56-sdw.c

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c    | 43 ++++++------------------------
 sound/soc/codecs/cs35l56-shared.c | 44 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 16 ++---------
 sound/soc/codecs/cs35l56.h        |  5 ++++
 4 files changed, 59 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index c21568f57c631..847e88f3b2044 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -230,11 +230,8 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 	 * cs35l56_init can return with !init_done if it triggered
 	 * a soft reset.
 	 */
-	if (cs35l56->base.init_done) {
-		/* Enable SoundWire interrupts */
-		sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
+	if (cs35l56->base.init_done)
+		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 out:
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
@@ -259,15 +256,11 @@ static int cs35l56_sdw_interrupt(struct sdw_slave *peripheral,
 	pm_runtime_get_noresume(cs35l56->base.dev);
 
 	/*
-	 * Mask and clear until it has been handled. The read of GEN_INT_STAT_1
-	 * is required as per the SoundWire spec for interrupt status bits
-	 * to clear. GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
+	 * Mask and clear until it has been handled.
 	 * None of the interrupts are time-critical so use the
 	 * power-efficient queue.
 	 */
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+	cs35l56_mask_soundwire_interrupts(peripheral);
 	queue_work(system_power_efficient_wq, &cs35l56->sdw_irq_work);
 
 	return 0;
@@ -283,8 +276,7 @@ static void cs35l56_sdw_irq_work(struct work_struct *work)
 
 	/* unmask interrupts */
 	if (!cs35l56->sdw_irq_no_unmask)
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
+		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
@@ -441,9 +433,7 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	/* Re-enable SoundWire interrupts */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-			CS35L56_SDW_INT_MASK_CODEC_IRQ);
+	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 	return 0;
 }
@@ -455,18 +445,7 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 	if (!cs35l56->base.init_done)
 		return 0;
 
-	/*
-	 * Disable SoundWire interrupts.
-	 * Flush - don't cancel because that could leave an unbalanced pm_runtime_get.
-	 */
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-
-	/* Mask interrupts and flush in case sdw_irq_work was queued again */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	flush_work(&cs35l56->sdw_irq_work);
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	return cs35l56_system_suspend(dev);
 }
@@ -542,13 +521,7 @@ static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
-	/* Disable SoundWire interrupts */
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	flush_work(&cs35l56->sdw_irq_work);
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	cs35l56_remove(cs35l56);
 }
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 8e3538e28fade..eb951313c3ec7 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/spi/spi.h>
 #include <linux/stddef.h>
 #include <linux/string.h>
@@ -26,6 +27,49 @@
 
 #include "cs35l56.h"
 
+void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral)
+{
+	 /*
+	  * The read of GEN_INT_STAT_1 is required as per the SoundWire spec
+	  * for interrupt status bits to clear.
+	  * GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
+	  */
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
+	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_mask_soundwire_interrupts, "SND_SOC_CS35L56_SHARED");
+
+void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral)
+{
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, CS35L56_SDW_INT_MASK_CODEC_IRQ);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_unmask_soundwire_interrupts, "SND_SOC_CS35L56_SHARED");
+
+void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56)
+{
+	if (!cs35l56->sdw_peripheral)
+		return;
+
+	cs35l56->sdw_irq_no_unmask = true;
+	flush_work(&cs35l56->sdw_irq_work);
+
+	/* Mask interrupts and flush in case sdw_irq_work was queued again */
+	cs35l56_mask_soundwire_interrupts(cs35l56->sdw_peripheral);
+	flush_work(&cs35l56->sdw_irq_work);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_disable_sdw_interrupts, "SND_SOC_CS35L56_SHARED");
+
+void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56)
+{
+	if (!cs35l56->sdw_peripheral)
+		return;
+
+	cs35l56->sdw_irq_no_unmask = false;
+	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_enable_sdw_interrupts, "SND_SOC_CS35L56_SHARED");
+
 static const struct reg_sequence cs35l56_asp_patch[] = {
 	/*
 	 * Firmware can change these to non-defaults to satisfy SDCA.
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 80158913a60e0..ec36a9a9c1212 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -790,14 +790,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	 * Setting sdw_irq_no_unmask prevents the handler re-enabling
 	 * the SoundWire interrupt.
 	 */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = true;
-		flush_work(&cs35l56->sdw_irq_work);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-		sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-		flush_work(&cs35l56->sdw_irq_work);
-	}
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	ret = cs35l56_firmware_shutdown(&cs35l56->base);
 	if (ret)
@@ -849,12 +842,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 err_unlock:
 	mutex_unlock(&cs35l56->base.irq_lock);
 err:
-	/* Re-enable SoundWire interrupts */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = false;
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
+	cs35l56_enable_sdw_interrupts(cs35l56);
 }
 
 static void cs35l56_dsp_work(struct work_struct *work)
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index d029fa3f86565..6a27ef2b7569a 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -66,6 +66,11 @@ static inline struct cs35l56_private *cs35l56_private_from_base(struct cs35l56_b
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
 
+void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral);
+void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral);
+void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56);
+void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56);
+
 int cs35l56_system_suspend(struct device *dev);
 int cs35l56_system_suspend_late(struct device *dev);
 int cs35l56_system_suspend_no_irq(struct device *dev);
-- 
2.47.3

