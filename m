Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADB2773F4
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975757; cv=fail; b=AcZbqeg0hlLJ6ujcQt9Hwy2K0TxJcBEtpj2mVDzJuA1DKNe2K8FDex9+FnEwcIIQni8EjnklRoRZAqrsC7/D5RoK6jMr0F9s+FqzUJ9GJgL7ZmJ1hMi9XaCnUgfMjZcqEXxMEC4erNKBzI/BDGYRKiw34SWVgjjw9rzS5XwRNt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975757; c=relaxed/simple;
	bh=6grs5F7DkecznN0ASecuNlAoNW1mlEXFWDvtYX0fdvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQlLJJP6b9xGuHkQJp24Ed6KHoiMube1g9q+pxyLJqZK4sHHCrBiDAK52Areg8WKF4psE1mE+Cfl5A5w/u3XNnMMSQA4WvXCz1URw1MC9FxHQMSkhtJsGv1N2cdyCmndAKQrfzLC/XdxMGK8pH/AP0up1aLag/hcnifl94/mHbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qCgXV7Nu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=X29K9k4X; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qCgXV7Nu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="X29K9k4X"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAbkY3744837;
	Mon, 20 Oct 2025 10:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=; b=
	qCgXV7Nu+3/h3hFDvoP8GaDY0+UKpx4Q8xfWlAo2hi7d6j8nM6y75mBMc30/IVSd
	X9JE7ysr27DOTMx6v+b0Ipm0c4oV+//AdSR476P7DhbsStfaM5uZoRyZlzhzOjXY
	P2IEpkRW+3ZPB9VuzGmCDwstD8yYxPIKsZD6mlEl9GwxlBEBtwIndHkAlz+zB3h7
	fNlis/0Sui7G46HXSFi/rmfqv/e6K/bYDBnDX+3dcY7tYG43nT1KIspOf+uJNdyV
	wRYkrYibdWQkAYecBNTjXFwGFu7yhX6Wtu5WfbgA5laAfZn8UhpLMSDT2Jb/md13
	gwhWGRw+32KtKDxOxoNKWg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022074.outbound.protection.outlook.com [52.101.48.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8dg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX83V1PotWWlEbjk8WQpusZmX/9zFDXoZRFi7eVAcbEryCIY86UjKLI8/8sv3HILldmxk3RRHhv4q2cnSM3rdAKs9Aeia0t9pM6WlFzlPZMkwouqIi+kSSw+k7JM0jlE5VrGVE9ILXJryfJgtZ8c14/9Q/PWsn3vMMyYtN/NW5JgCDuFPkUaQHnuSTPh0VdkvZm8LxZ1ambzJ+//DwPpzMmiG/hWthVf+xgWHEHbKvxTigqRSSd2t2mTyS0LXrU/6bIp/aNRsK/RJSKY4umlS9xmTqawQfY7nLgB78RikSFRxzMR/S+MCwKBHoJiRA70nY5MzuBfvZAMgUKMPHuiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=;
 b=Ag9vu34y1xbnDWh9c/gWBxp7TziW50OE/S/X8+FB5/OUPrhU+BvF0v7DI/kVNQVLXu+FeBieIWVYAZjO/AgdRs+WoxzfCamJRZS51jp9Ojq31md8Q8R0hgBXG6rJceU1A3QPmGwWkaTEWiQYqwyKlCxQkDVyyhbSHHlgUweSfFCauHLhmggSututWiRUg5Wiwdo6lFitVahpPvIVYWSxooYaOhdRgKdPjXQviPWv18+k37GxulynF/eDhjxAcKiDR+CJttPykvmyBB7bAI1JzO22EgaFlmJKCIkvAOq8Sdovndqoccq8Rv14Lbg4k/QQwUOQ/KLYLv06FadGeEjLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=;
 b=X29K9k4XDNgclXElUWC4VzrpByWJLmAKCbHlZtfdNz+t/Ktbx6YquIR//jRTwrxVUgMu53220tzLjfSpYSQiTm+rRfu35I241C82cKbQR8ur92Zik5ZT9eQku5wzLfNs+8Lpjcbo/jLEzCiTXXQgN+zDH4nP+MDZWx/OFBQn+kw=
Received: from SA0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:130::18)
 by LV2PR19MB5791.namprd19.prod.outlook.com (2603:10b6:408:178::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:25 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::2) by SA0PR13CA0013.outlook.office365.com
 (2603:10b6:806:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Mon,
 20 Oct 2025 15:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CF917406642;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9496822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 15/19] ASoC: SDCA: Add FDL-specific IRQ processing
Date: Mon, 20 Oct 2025 16:55:08 +0100
Message-ID: <20251020155512.353774-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|LV2PR19MB5791:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c34f29da-d696-40b9-2297-08de0ff11490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LuhtwcE+KhRGZrPGaakqitB/2zS3rM0LDD8cJE5639AfSofzjBtYBvqeNNms?=
 =?us-ascii?Q?Xi4GON4yXrN5W9W91UAHUX6ZB9R4POzUCTp+mzBatECp6kdEwd/j75vSdvdH?=
 =?us-ascii?Q?GSmTQQF7/xEnbrahv2YU3CwYduvPBabEUttsHSfX04nY7U8tBSxNOFdlCqtG?=
 =?us-ascii?Q?2BSacDOsOfIb/1iV2yirhzINR1nC1znJkHxqUpfP72Q2soh4YN3RsW52mqPN?=
 =?us-ascii?Q?gtkupAWba7fym3aD0CA6Ha67c9HeNGSTRXPd5CySnTg7DV0IYlQUPtYuwe1n?=
 =?us-ascii?Q?itBP5os3MpOazAAbQCPEEaMMSwY97pbwsq3fIBGFEZCOsPTzFkie40/I4beL?=
 =?us-ascii?Q?x5aYG+nejkDklzaeflqK2EYXJJ9qlo9zV6Az0+3qUoDJVw6Ex4Pk8nGIzH88?=
 =?us-ascii?Q?yCBJz1881NWH2av8GAk8WmP7S2jkcgW5GMVSvxUs3inmfE+yrDkBayhuZn+X?=
 =?us-ascii?Q?6wuEJCJkFk9XI9ly/SOvMcEnyfTeFRJ4pk1FGyssjxvTQq5vmYCjlYlnmZYF?=
 =?us-ascii?Q?HMfMqRAybmcXWKh32LACaheqiJWitAg5sie1MM2BDNdCAGyWuVVfSSIV56el?=
 =?us-ascii?Q?lM0sKdME+0Pzq8Xy4ZH8B2UkiISgqNRIdmgbREBJLUys8Sl8Bmu/Sey3h4U+?=
 =?us-ascii?Q?TgZN4juPrZ34HgvFCE9jxfM3+WcObHo+tXoICKbhVOdzG5kfHfEr0qTmAWWX?=
 =?us-ascii?Q?cURmoq+t3cDBNF6ig9E5M93i5lcRPWkY5eHLsyikWo0tUUN3UN7i1MHbtRlp?=
 =?us-ascii?Q?VHCcdGSKWPo9hecZPtX8qZLEBs/ocEyYRl93FN6n4HoaQ3w5znHczo5ugkmP?=
 =?us-ascii?Q?EBS+Z4bM19L63xIC4KbVm6fksylNiwJ/7nNuhPfv8RIQd7F/UDvxXzLdx3kD?=
 =?us-ascii?Q?039FOTuwPhzubk48eseRdtOQ2AC32ZHxw4EmhIY+KVElwCpTaVLw+B3hlgEx?=
 =?us-ascii?Q?322Qu2kqUNzV4SJB1C/KwKe3UaQPGS69Km2mNNeHwTIHAF/xPWxh8Vf+Cp6x?=
 =?us-ascii?Q?kHsGbwJKJDHVJiUo9W+iQYWsPrpV4k5G5t2mv0AZEq6doNjr1qpwPz+lS5Rw?=
 =?us-ascii?Q?LveLWA5vjXx3/HZ/1LaMKsfeb1f+iW17zWYdPoi4ppnDaCKcmU/h1xNhlOqC?=
 =?us-ascii?Q?wuCNzXSXXa00bOZJAcBvHdQ+e2c0sYKM22m6G4855+0LMEVurijnCqmBeQ+I?=
 =?us-ascii?Q?mmfvHoc824Q03Ge84KlGjqxbF1VZi8pU8B/cgFAhFD9oJFiT9MzQgDy5iV3k?=
 =?us-ascii?Q?rxe8gfZxAGaSCvRMFjkwHG+R2KAdgPIY9qhDQX+fy9n0KFCx6rb+tj7nIRNS?=
 =?us-ascii?Q?qUbQMwj4QV7teTxQ6nj9tZkVqmz5epCnkEFM7skqwcglGTwHDgA/45fm3vaM?=
 =?us-ascii?Q?lFE/sgFyEBUAc364GU/kSizwr3PFKxj4tM57cwgBNjWk7htcwNwJUAyp2e39?=
 =?us-ascii?Q?Qgef4cp6+YFrmmmt/TY0uiTxuFhQ5ruk4JkDumwlHrtCdkiU7xwhKQ+yDavS?=
 =?us-ascii?Q?aauNhr0k5ohJAQakhhx6ZlBTCRBb6d+CmASZ5FSyPE9BnbTZLCK3EgLDFuZh?=
 =?us-ascii?Q?GgkhP2JQuSiXAsfQ5ws=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:23.6999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34f29da-d696-40b9-2297-08de0ff11490
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5791
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX6Yp1fpo2BWGx
 XNDL/AVs12vimGwqNkptCFZmhZdRlztPIZBLqrbs+SNRE/ljeLAqAXYupJJg6bgpaKlDh81FSAz
 3T7lz3s/Hsy/XMhPkbfWF27c44HzvvubFdzaGTGNKEbNUL7EBSOeECsRtISqN4+LgoVLplHlVi5
 t81e0PkdSGlSqzoY/Gk8/Lfo69L1rfzjQgp/Yt4ebOFnWQOTHMZpPtMjIQbz1ER7HWdm0qDhWsU
 YJSn8VFWkwgTWBYO2VhdM0xfA3npIKbau/jEi76UrcU6NqQy8tKvUkm2J3Kwu7QzWcIzoT3yuJ/
 fmjCTcX16inqQh4D6nYSmfil3M83lVMxscjnkHjvCcFtr/Gk28U6o/PHMf2IijDgSAcNfUis6Co
 5RarD0jDMZdeQ2zixS96Ag0FKHNqxA==
X-Proofpoint-GUID: _pnZW2EdOGKgmV0v_TDEs6oYOR1YipgH
X-Proofpoint-ORIG-GUID: _pnZW2EdOGKgmV0v_TDEs6oYOR1YipgH
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6f cx=c_pps
 a=HCvUzjoPJca0/5O0yIdMFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=vrUAae3nbITHHW_ohNAA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Hookup the XU IRQs required for the FDL process.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index d0894c8e0552c..3a3b966b5782b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -18,8 +18,10 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/sdca.h>
+#include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
 
@@ -245,6 +247,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t fdl_owner_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for fdl: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_fdl_process(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -423,6 +448,15 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
 					handler = detected_mode_handler;
 				break;
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
+					ret = sdca_fdl_alloc_state(interrupt);
+					if (ret)
+						return ret;
+
+					handler = fdl_owner_handler;
+				}
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

