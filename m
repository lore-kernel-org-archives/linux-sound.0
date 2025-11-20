Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C50376BF0
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652652; cv=fail; b=MlRonCPsh7Sri3vKjCxAbwJ8+sRdAAbDS35BzCwKOCku0b/zeQBOMe80R1Emt5VX9tJ/vRqKZt8lSOhJfihBUbNuJwqkwYwv1dl0LCXbLKsETDZnW0Evbs1qFgi0bGu0x2qFsYMZVfDyP2eYZBQrpVftwirw/6v1xSOQ6jAGKfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652652; c=relaxed/simple;
	bh=PZSmg7Yxr//yUmJdAyMODHpwijO0aACrVoqcX3fOcm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONveotwZWacpPxr3d39f2X02/KH6jm5C8m33XqdBcNBI4TyRTAL9DAzRCeM1l++rZ3zvLbwGRBt37YwfZQboca2AAWYuhtejnFrKHHZ3OB4+0Kokj4DnbF4+M1STCGURfR4kNuSUJI4aj1tlQivRZtK+sH6gDdQSmCOGtoC65FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dLMq14MS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DaZyV232; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dLMq14MS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DaZyV232"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5sZPp451043;
	Thu, 20 Nov 2025 09:30:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=51FmMiK7PpF8Aek8lI2tXJ87ytGYl8es/dL8RksG6IM=; b=
	dLMq14MSnxIhK7UZSy/WojotlVHmBmrmhexI1D7dbT2br+eXbT88G1y4lLlPgCK3
	HAu88KKzhPAgMwy80bzjct9Q2TYziNeLfLJHBrTQFwJjQcl2dDRziW3Bkb1zCDWC
	1wETS4E3FY4KQ3s2GFqxevVhEqnhMd7aMVKixtQbpfDHfadav41FmsUeyowI3a2d
	dBGaZdOlTCHWxyCkEaorIikFLeWWIeIhAUfyqTmZSW+wksvBTcN73VocM56wR8zl
	Fg4JULCsEPjFn4TFbygg8FcilDXWDvmqFSBvFCMSNpS7NYiJ2D9FBLPzjdK4rB29
	obPaDurFhwooNYkKq+ttsQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022131.outbound.protection.outlook.com [40.107.200.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiLIzjfejlkQX/nNOcxt/KA/3wu2iYHi9s8dQzI5BGnfthCopA1CwUwHEnjycjvFKVmS5CA+aFkpvc3opa7frJLq4UMc8PRBK61wlcCjrW11uodEDl5yW2nO9vFtw1WD1FAh7yHkI/AkPFkOemkR8DrJ/s+HyJ2dl+Z/eV9nnrnFd1Z9FawJvbOlvuXjOtMW6LvsTVb0DWe2osz/HqXIR3F6xtf4Yc/IemSInLZRSi0OOiGHq8V7bj7O0K8ReIXpsa8nqzfM3MVBKdu6FizVNkKHVLklwMCT6/gLqUZhvirbKm30uicLPoJU52eFnJGwg50r1KnL+ll5qB4HLnPqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51FmMiK7PpF8Aek8lI2tXJ87ytGYl8es/dL8RksG6IM=;
 b=dTZ3uBcwgYvFrIdMlGoMwMphA7Y+wPpemE0TlVcJMx4LyMOucy/LtsW7J4jVzsCDPTu4XNO1J+ser/e1A7VLufZA8c+mQZtIomsdrVolWhs2RZRPPcJLIzolEjjo6TJcmK9g1v0DXy6t0J3JpycgbuR1ysnyTS7JAGPEG7yvMira/U1tq39xU6CiZFovEyycSEnWT0EYJEc8rjtPkunNYT8IxF9NZ4ULI6iIB+n9QW1HLD3Gf2+VP5o2Jui8fHh+U3SemOfku+IbmsucwRKrX8MMjn6xVVGnUplTPLkRpY6HmIHzbUxpFoPvI86SyOSI9nWqRC3DoszmW1buVRQwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51FmMiK7PpF8Aek8lI2tXJ87ytGYl8es/dL8RksG6IM=;
 b=DaZyV232lHYPNoL5NFKM/xS6ws5JIviVtDteL+LP4Hqswnq1lV9XPhlYF9iRZk3pjIsBsjp5msQ/a/r2Q5+YB45bOUpi1us7JKAoGCUtxHjVovha404syhFCCndGEjuui5Vgghqn2+MUopJ2ihrDy6jBAWq9DuU3zNc6JMOtw/E=
Received: from CY5PR22CA0070.namprd22.prod.outlook.com (2603:10b6:930:80::14)
 by LV8PR19MB8569.namprd19.prod.outlook.com (2603:10b6:408:261::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:33 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::22) by CY5PR22CA0070.outlook.office365.com
 (2603:10b6:930:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0C59406557;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A5952822548;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 06/13] ASoC: SDCA: Move most of the messages from info to debug
Date: Thu, 20 Nov 2025 15:30:15 +0000
Message-ID: <20251120153023.2105663-7-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|LV8PR19MB8569:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b9d2b11-8861-413b-0464-08de2849be7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6nSsJ+upc9g9AJug6LQZHDzsL1++W7fRsk/2OlRLSZmpL2oTMnZPjYX8aq/7?=
 =?us-ascii?Q?Ty9E1QeTmrnSO9ng8+sv0/N3I8etRncnQvywXySiiaShsWdiiz4FLhfZBFyx?=
 =?us-ascii?Q?UFWtdPitwpgHIFl26eUWukiYIJHjd5twDM2BicIUjL4R+lx+d3bR+DGEmtT7?=
 =?us-ascii?Q?sH3i+PO0YNwjDKsJ+Uifyltc7Z06ptJcUwd0SSPUi0SKwI/RB8ey4Jf+xIZM?=
 =?us-ascii?Q?N91R87JK25Lgdi2Ghlmz5rrE1LRliWMf7sEDMEAbpeFEEwS6eaXFC7xhk034?=
 =?us-ascii?Q?56J4MmROkvbnKpq4jJ63At8AAAriSRatm5Jf6HgT45MV4ieO42lAE5nAsE6F?=
 =?us-ascii?Q?lnFvsbiucRXzlkNpsbw5pRQYO8LlxG55o4oMxIwc/HmDPipregxOSIHbDPz0?=
 =?us-ascii?Q?VN4I5ucndZzHP7R1DlOv+OGJjlSU9paF+7fPrZQ8y0ZExz57h85r37Pzqg+r?=
 =?us-ascii?Q?ZFuqUCiA56K6r3mp97lUE7vUScKHWcSIsexL/A4iflUlWWdCKZqSBqKKXwPn?=
 =?us-ascii?Q?FsRJboh78044xPLLFqgsaEx8bnW0WCtKh3qaFNxWNeuah3gcQtkCuS+wCza1?=
 =?us-ascii?Q?+qOJxbE4TRrnkerGSDXNKF9KD8Q4hybnliIgDRVtiHQm2V++yH8HDJ4BUtZt?=
 =?us-ascii?Q?ZzIbSNwszvctTSXFAvNd38IDQFkuuhU61O1HPfnP0i1+PF05LJZAf3O5z4gl?=
 =?us-ascii?Q?jyv4AEqIO9cYqWq6OOGA+5SojHIrl2bYusC7FS7rK7I2bL/xCVd7jscJtMMj?=
 =?us-ascii?Q?XP0t8Ca7v7+3X/IwsRoF9TXy32LCD2qIYUydBXtDrTL015G0VGc9vWmdBJ1m?=
 =?us-ascii?Q?ZxEgweO3Q/vWFCFSCOMDk07fTJcsr1UYkzCmllJQVDIMecNk2UU8DI4lTiIz?=
 =?us-ascii?Q?HjgzitGFnh5eVz6vGNpQ0NvzhxY10cIUM1W7UNbtmtTx3fmpvBKQBfqp71s9?=
 =?us-ascii?Q?oVbogckYrpXRVx5c9D1SZtIBdREXxV9uYENIgpaq5XfxgQrl+c7J0aDl2IB1?=
 =?us-ascii?Q?sEaBvG0OLxc5gekSzMvbw9cSZ27t0Rl9yKOprFRz4UlduUq586UpMFouoBt8?=
 =?us-ascii?Q?sY6cNT3sE3DI95D1sQOmEbH50QSwFM6OeArjm7L2Izo+W5knBoEnbxO7FDXg?=
 =?us-ascii?Q?rfpCOV3+YyV057POaUqU8Pe2Di4PPLI8P1UFvTHn+YnVdrBGx5H3J1wYHhPN?=
 =?us-ascii?Q?0HsM4oIqDZunoCcDXqdShgj0nn0a5mOwA3WNH+LsRM6jkoQvVwDI4M2mOTsO?=
 =?us-ascii?Q?x7lN21aNajjyAD5Rhk/3hfvO7rr8B5Xl/09JB3SPVQvVb9kQwLFtx2AnmM02?=
 =?us-ascii?Q?IXKpKeY3d0XjbZXPe2X8K+nc8i4sNfR1Rk4nRcD3hLM0m3ce7FFxQsXtKdXl?=
 =?us-ascii?Q?yllsFn4/1jWP2hyrND6q2xiu+7d0vGG98vx68nCxJS7NbiXt2vK2I1q+tcyo?=
 =?us-ascii?Q?PpkaNw6tkLswt7sOBwQula1r3xtpCToUrdX1cMfDnl9cLVRalbrSJdOedsQ6?=
 =?us-ascii?Q?AVux3ixINgEc0+M59pmQIZNcN5tpAITb4CtKmxtoCAwRyID+/IGUaV0BAQE/?=
 =?us-ascii?Q?O/9l/PEUPRYuSKHjLbY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:32.3791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9d2b11-8861-413b-0464-08de2849be7d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8569
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f341c cx=c_pps
 a=YuZhOgY8ddb7gdPWH8k3TA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=im8fH_rfAkxn4tVxPXMA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-GUID: _D5aBpZrG3Mi6o1MGrHZLWfnsu7Hg_GV
X-Proofpoint-ORIG-GUID: _D5aBpZrG3Mi6o1MGrHZLWfnsu7Hg_GV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfXy2ncmCQ4Fkhv
 8KqvYM4UDka8Tz34tDblll6YcblDrePnM/KoXrw9Rf2KGI/mqvCpuePCcVcsFNzwjDBHggsIurK
 P7luRHCM69uCK5I4R+MtBYjguEgEZUmUA3jdtk4OvXikf6/NJT4YCE1nroVEJHpn2jD8re6JQLQ
 S/KZNi6hL6TKisI9q7ePQJ5aw2qeegPNaV81XpgykUwmPn6AhJwaY1sfRJuSyuPIX890Y95vbXg
 Q8LQ0/yNchSDPehTqqlbmdw1QmeXVLly2gdoMl0OWR6XPMG0adtbaXNRpmDnfsR/zME830zmSHb
 TdFn/8I/+BVvmpsq9J+zdbrgfVR9PWYRXic7bgzqr0InYTTT/VqwnIU09XTy7K9CKsZs/ldKKnv
 2YzRM0vqvKmjJ2DDBko5Cpj00Fo1AQ==
X-Proofpoint-Spam-Reason: safe

The SDCA code is very spammy on boot as it prints a lot of parsing
details using info prints. Now primary development is complete move
these to debug prints to reduce the spam.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_functions.c | 50 ++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 4cc8420af517a..e4b3efeb30f0b 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -6,8 +6,6 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
-#define dev_fmt(fmt) "%s: " fmt, __func__
-
 #include <linux/acpi.h>
 #include <linux/byteorder/generic.h>
 #include <linux/cleanup.h>
@@ -1013,10 +1011,10 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 	control->type = find_sdca_control_datatype(entity, control);
 	control->nbits = find_sdca_control_bits(entity, control);
 
-	dev_info(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d %s\n",
-		 entity->label, control->label, control->sel,
-		 control->mode, control->layers, control->cn_list,
-		 control->interrupt_position, control->deferrable ? "deferrable" : "");
+	dev_dbg(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d %s\n",
+		entity->label, control->label, control->sel,
+		control->mode, control->layers, control->cn_list,
+		control->interrupt_position, control->deferrable ? "deferrable" : "");
 
 	return 0;
 }
@@ -1137,9 +1135,9 @@ static int find_sdca_entity_iot(struct device *dev,
 	if (!ret)
 		terminal->num_transducer = tmp;
 
-	dev_info(dev, "%s: terminal type %#x ref %#x conn %#x count %d\n",
-		 entity->label, terminal->type, terminal->reference,
-		 terminal->connector, terminal->num_transducer);
+	dev_dbg(dev, "%s: terminal type %#x ref %#x conn %#x count %d\n",
+		entity->label, terminal->type, terminal->reference,
+		terminal->connector, terminal->num_transducer);
 
 	return 0;
 }
@@ -1165,8 +1163,8 @@ static int find_sdca_entity_cs(struct device *dev,
 	if (!ret)
 		clock->max_delay = tmp;
 
-	dev_info(dev, "%s: clock type %#x delay %d\n", entity->label,
-		 clock->type, clock->max_delay);
+	dev_dbg(dev, "%s: clock type %#x delay %d\n", entity->label,
+		clock->type, clock->max_delay);
 
 	return 0;
 }
@@ -1217,8 +1215,8 @@ static int find_sdca_entity_pde(struct device *dev,
 		delays[i].to_ps = delay_list[j++];
 		delays[i].us = delay_list[j++];
 
-		dev_info(dev, "%s: from %#x to %#x delay %dus\n", entity->label,
-			 delays[i].from_ps, delays[i].to_ps, delays[i].us);
+		dev_dbg(dev, "%s: from %#x to %#x delay %dus\n", entity->label,
+			delays[i].from_ps, delays[i].to_ps, delays[i].us);
 	}
 
 	power->num_max_delay = num_delays;
@@ -1447,8 +1445,8 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 
 	entity->type = tmp;
 
-	dev_info(dev, "%s: entity %#x type %#x\n",
-		 entity->label, entity->id, entity->type);
+	dev_dbg(dev, "%s: entity %#x type %#x\n",
+		entity->label, entity->id, entity->type);
 
 	switch (entity->type) {
 	case SDCA_ENTITY_TYPE_IT:
@@ -1623,7 +1621,7 @@ static int find_sdca_entity_connection_iot(struct device *dev,
 
 	terminal->clock = clock_entity;
 
-	dev_info(dev, "%s -> %s\n", clock_entity->label, entity->label);
+	dev_dbg(dev, "%s -> %s\n", clock_entity->label, entity->label);
 
 	fwnode_handle_put(clock_node);
 	return 0;
@@ -1673,7 +1671,7 @@ static int find_sdca_entity_connection_pde(struct device *dev,
 			return -EINVAL;
 		}
 
-		dev_info(dev, "%s -> %s\n", managed[i]->label, entity->label);
+		dev_dbg(dev, "%s -> %s\n", managed[i]->label, entity->label);
 	}
 
 	power->num_managed = num_managed;
@@ -1808,7 +1806,7 @@ static int find_sdca_entity_connection(struct device *dev,
 
 		pins[i] = connected_entity;
 
-		dev_info(dev, "%s -> %s\n", connected_entity->label, entity->label);
+		dev_dbg(dev, "%s -> %s\n", connected_entity->label, entity->label);
 
 		i++;
 		fwnode_handle_put(connected_node);
@@ -1893,8 +1891,8 @@ static int find_sdca_cluster_channel(struct device *dev,
 
 	channel->relationship = tmp;
 
-	dev_info(dev, "cluster %#x: channel id %#x purpose %#x relationship %#x\n",
-		 cluster->id, channel->id, channel->purpose, channel->relationship);
+	dev_dbg(dev, "cluster %#x: channel id %#x purpose %#x relationship %#x\n",
+		cluster->id, channel->id, channel->purpose, channel->relationship);
 
 	return 0;
 }
@@ -2065,7 +2063,7 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 			return -EINVAL;
 		}
 
-		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
+		dev_dbg(dev, "fileset: %#x\n", filesets_list[i]);
 
 		files = devm_kcalloc(dev, num_entries / mult_fileset,
 				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
@@ -2086,8 +2084,8 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 			file->file_id = fileset_entries[j++];
 			file->fdl_offset = fileset_entries[j++];
 
-			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
-				 file->file_id, file->vendor_id, file->fdl_offset);
+			dev_dbg(dev, "file: %#x, vendor: %#x, offset: %#x\n",
+				file->file_id, file->vendor_id, file->fdl_offset);
 		}
 
 		set->id = filesets_list[i];
@@ -2130,9 +2128,9 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (!ret)
 		function->reset_max_delay = tmp;
 
-	dev_info(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
-		 function->desc->node, function->desc->name,
-		 function->busy_max_delay, function->reset_max_delay);
+	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
+		function->desc->node, function->desc->name,
+		function->busy_max_delay, function->reset_max_delay);
 
 	ret = find_sdca_init_table(dev, function_desc->node, function);
 	if (ret)
-- 
2.47.3

