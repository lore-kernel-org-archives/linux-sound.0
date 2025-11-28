Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5A2FCC04;
	Fri, 28 Nov 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325376; cv=fail; b=mJQg1DzsnXoFcCjFwCKCzsajt2gpLs6WKIWzPf+QASs1MM5DlzCdZEOmaYM5luD+QdsIGHmsHnSRTHJ1dBVyPQhUhSkwOqB5MLhoUx/osOGMBLabfcnPTL28ceOdIWXwk/sQQMV5vVMozwip2ioSVl5Zy+Oe3Ud2cP+SwhxCNgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325376; c=relaxed/simple;
	bh=EYJkoPWhrDSzbvs+CR9v3TVVb0rBk/yRtgDCVdFyqeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeMs9B0UoFKF0zzzV/YcHMk4dsLj5OLjw9AQ6FDwODAeQnUccsjnEOKBUrJerayNffcF9yUl9OLZzOavqn/KqAMuubluXgWaYuH9NdJ+AYXRBRybylVeegf61rKLSHW+YYjTQ61KsaUmBOe6Q1DCI4CYQoM6hzODUaji5owqZR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cKvTAw1T; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i7nHaDMS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cKvTAw1T";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i7nHaDMS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91e2Q2747797;
	Fri, 28 Nov 2025 04:22:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=j5lT3ffqjsq67wdXQctjmPx2kHOeODBZNZVZhGPFXa8=; b=
	cKvTAw1TYCXz7BotbwOIPyrjEJOl/ZK7nQBHs8S+R49umpAqrt1VmQfQxcdHiT+R
	z2Fh7L+xzV/BZqCXUrrV3iHAXk/rhBN5bsdCYeLqX+SMygILWgKoZbp+mA6NjRJb
	1U6acS6v+0xUfr/VebNchoFYMBqbTwQvbHzI0Gfi+C8eeBvRo4XUu2dsbRbFZHtZ
	l8t2frl2kNTIcKu4od+PhpDbQV9W5kcLjYh67GjMEvsX9mtqch7nIACclqMyeaEL
	NdWYdoKvcQncQ7xHhH2/ohJBcu1R91eXHcAR0fAvso/YdmuU5OQCzAf/nRSQxxr+
	qoMiy6N3VyvdMHHaW1x03Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020075.outbound.protection.outlook.com [40.93.198.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5kdps-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 04:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKW1Fs/KnUXpB1G5Lf1kkdQ/JgTqNaZEc7skxKSTuFiD3DjEh4r3YsGvfBCC8o0FrxaOr+TzendPj3ZcypmnCdhrmPUL9LITxBXNY37bnG+3MNdX/+7XckhvyvBq5ysIerL1qatU9OF3wkYJqP8fkCCDqPpNlq4UK6MB8n6MLuYwwgLepgqolP2/lwalGuHWY2F8XT/+s9mtofKDfoIwasXy/hTPMpT6hd6ItkzCQfiO8sEVA0OJjhwQ0Y1TZv7zA4bPbsm0jlsiEnoXPjT1DsB0V013nuCptW4r+mLTaZ3deCpDapfpWOYahwq4U3mV3WgywB+hU9Wn7Iw0MKNgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5lT3ffqjsq67wdXQctjmPx2kHOeODBZNZVZhGPFXa8=;
 b=KaStIQs2kftW3y0fjyZ7W/wa2uGlnhXRt6fRY470QPiil08ShudwCrgUFseGHPeqFpyjsY3mC5ENqo5PunGK5qvzFzCXZPvC4We+ROICl96PNY0ywzzs/9Nq8Tlh9xicc/3PmPNrIbDbGHrGY5fHXCFUM8isN5OMGtSUb5PZ91+bzbWjLiJs4Di+S2CvnwgnZINe5hGH3SOTsNEDchr+3MODTndTX310LDQ29nLqqaSbGeAOHoX+GmFxN81RVhBqUU2V0kbIoEseOHV9ri3rIAVOQSarEBVPa5E6f/KhkJQTilAEraM2EhDOxeev/Z+f3nBIoieesYOZqMnvfjQCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5lT3ffqjsq67wdXQctjmPx2kHOeODBZNZVZhGPFXa8=;
 b=i7nHaDMSEm+3JsD2WhxLlO9m+1y7TB2CzzlOVpSpx1WPe9n5xX/2UbRDVk+PXBILfy73SHiu8E8XMIww+ipmVTkFMUO+htEA5zp0yuI+D+ul2xc4i65AulhpoKhsO4zgm2+MZkFy6Gg4CPSQmHUYa51i987Mhg0xCxGaX2AQD5g=
Received: from MN0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:208:530::24)
 by EA3PR19MB9328.namprd19.prod.outlook.com (2603:10b6:303:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 10:21:36 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::5) by MN0PR02CA0006.outlook.office365.com
 (2603:10b6:208:530::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 10:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 10:21:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4780F406543;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3440B82026C;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] firmware: cs_dsp: Don't require client to provide a struct cs_dsp_client_ops
Date: Fri, 28 Nov 2025 10:21:31 +0000
Message-ID: <20251128102132.1575177-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128102132.1575177-1-rf@opensource.cirrus.com>
References: <20251128102132.1575177-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|EA3PR19MB9328:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 942b264b-9a39-4686-7ffb-08de2e67e850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sMRyF7sBCH9xZwipzwJ208A6ptZQr6pKCyGumaaEcINzDW9u1HKTrISQvtLQ?=
 =?us-ascii?Q?6c+HqtT37+Z5YxfLFAu2c4hSrqiS4KK/pLgR6oyqNIz9Ing9lAW4Rerhgcq2?=
 =?us-ascii?Q?GfEK8HTuoq+EqykQyydSTAb43gQKsC4Dz5pVs0XPg3lDqb1dhpr3Qufv4un6?=
 =?us-ascii?Q?WlTV0Cw8ykcbiEaAavJdWEAxZMAYuPyhkA6hPf19f+W0P/x23Etzk5HNWQlZ?=
 =?us-ascii?Q?M9X8b/NmfJ+6+hcTws1d+DNd43ds7SzPNi81aNcfk9SN2I0tyOveg9+OaZRR?=
 =?us-ascii?Q?LO3cIVoyjvmrlHK/5tZ+62+QaYAX7cxpVkjH0zftldT7PABXm8WQ0sH+7JG/?=
 =?us-ascii?Q?4Ogb3V18bBkglbr21McGEVpTLXFs+ECClXfCXvVAT13n5/Dd/a1EQKu3x7wA?=
 =?us-ascii?Q?oCQPL9bnLOghXEK73M7VWBdyF67XFIKmrXth0e8BeG2bFK/anbCeCfKiHNQW?=
 =?us-ascii?Q?qbH2VprYNx6rDJEtv30yudLFs0jVmpuI3Gm379t4aEodC5KHZaIL0j7Ut7e+?=
 =?us-ascii?Q?YU246lVl/hpZYeR391kSnVd2AHC/KFolr8l6UMQDYZJEfSzPmNkaqTrTqJBk?=
 =?us-ascii?Q?xFgHEOczRs0g9FgM6vejXej4CeqDo4/+/W+Q7EwboC7Hqx+T4Wgt5Lt9BV4g?=
 =?us-ascii?Q?ijKL91ubOzu57vRIdAp1fwXfgdcRLCIbDxa5O0fDHhO8wVTq6z8oUXcx7trP?=
 =?us-ascii?Q?SDscXuj4reGq/en32KzLroX7AO3up5Wvhm3bHmp7mTuZCsQPK8B4xW1KB/jd?=
 =?us-ascii?Q?kmtsrnfXoAR8hw+S1pfgkBOekrAJWvt9BnOO5nfyYqSiu2IKpyzBZn07A2d9?=
 =?us-ascii?Q?G8U+cK1aOlSfU0bMdgrREtjWyB3a1cnTYSrr4q4gSziq7lkCSb/vyx4UEMOq?=
 =?us-ascii?Q?1GjpYxLpuuAyJ/bbqBIEk2jUXIwLpwWtwmTRbRxqmb8YrXm01vZfKfglofYf?=
 =?us-ascii?Q?KtUcQUwDnggSbyjQSgpWawM+X8z75md/ZYIXNDw+j4b8wJB7ogKpwN0gbM50?=
 =?us-ascii?Q?VpT4RnbJZ2sJ2O7oCW0tru8PzBhR+mGT0gxxS+g50opBjuXMBYIhetIOYqFp?=
 =?us-ascii?Q?asYg85EIgqpYaVMO4A/Gch93edrZ8Kmgwx0MHnHrhGTO/fAeazi3uw8nDo3e?=
 =?us-ascii?Q?PHLJndJQMqH2bvtYCuPY/oGRuaVZDTlsZ4RzmMUAh06Z72ju6QGppVGH1lXj?=
 =?us-ascii?Q?ZUBbd7WtO0/iRcdt+QGeR+JEokoadwTg6KXwfQTHmF7PlpiJfckzwR2Vp9jl?=
 =?us-ascii?Q?AO/BcmabbtyTE5rNUMzp3lHUjEfO61BMCv7s1OoM7rJuCGyN4imjMXeaJ0vL?=
 =?us-ascii?Q?ggRjAGUkizK5cr0h9zB4T/TlVLuWUOq+E9s/bLQo3ZSno0UpNMrUaUIuA08B?=
 =?us-ascii?Q?oBEb/+yy6uad4z+0aMFbg5FJ7LOrchbwHHY4lgEQ378vrLr0Q58LgB3lkpbC?=
 =?us-ascii?Q?HeyT4pB/BrIIjWCivYWYGwpvVIikWog0hvpXzD0D2HDuaEdXADNazvV5/SvE?=
 =?us-ascii?Q?Wrxbcm/8OiFS92vWXi0nCfiq5Bz0f9tIfOoDI/dFbT/H+d1MIIJVuvVFW/wf?=
 =?us-ascii?Q?JYDyC7pp079X3V2rbJM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:21:34.5048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942b264b-9a39-4686-7ffb-08de2e67e850
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9328
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NSBTYWx0ZWRfX4MIWqAKtD9m9
 aZ2iVvsH6wtFZk4yt7pzYSmf2joUGtHvYYZZJCH7QsB0cloncOz+OywCB6JqC9+1bJNYpoMTAdK
 lhax7SrQkSFpm9o7bZ1WMKqjRK7jNqxUjaDKWgcPXTuxFQzpIKHAURw1UM4AU9GDhEsspUJcq8M
 TFZznLWzmZh4NN+R3788j8tqRw/cn6G8ZngK/4tZcOTYqBhltdQ7jqBzgYeC6KJg+hWi0cNiMw4
 zn8Fe114d7+dCWR1DJFi3jwHJjKz5dyK4Q/8SZzm7xqXi8YdZODJjt5WYaUDt4sOY15TgOmmDXz
 W6fBxxm8a1eSdQbppZ3y+0NgGRZcKhNnVEJT3dhTN1hnAs123eyaEIN7gsNta6+RMTPD4H/uc0X
 /F9eA9yaoQpOIfxqsqx3H9u480rVwA==
X-Proofpoint-GUID: oq7EPyvA_Vosr_anwcukZ7MittNAMb0w
X-Proofpoint-ORIG-GUID: oq7EPyvA_Vosr_anwcukZ7MittNAMb0w
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=692977fb cx=c_pps
 a=ST2n4ODNysMJ8B86qD7aiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=m-yjnkoSrHUS0DxJIW8A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-Spam-Reason: safe

A client of cs_dsp does not necessarily need to implement any of the
optional callbacks in struct cs_dsp_client_ops, so allow the client_ops
pointer to be NULL.

This has been done by pointing client_ops at a default empty
cs_dsp_client_ops. It keeps the code cleaner by avoiding having to add
double nested NULL checks everywhere one of these callbacks is called.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 60a2061c444c..525ac0f0a75d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2329,6 +2329,9 @@ static int cs_dsp_create_name(struct cs_dsp *dsp)
 	return 0;
 }
 
+static const struct cs_dsp_client_ops cs_dsp_default_client_ops = {
+};
+
 static int cs_dsp_common_init(struct cs_dsp *dsp)
 {
 	int ret;
@@ -2342,6 +2345,9 @@ static int cs_dsp_common_init(struct cs_dsp *dsp)
 
 	mutex_init(&dsp->pwr_lock);
 
+	if (!dsp->client_ops)
+		dsp->client_ops = &cs_dsp_default_client_ops;
+
 #ifdef CONFIG_DEBUG_FS
 	/* Ensure this is invalid if client never provides a debugfs root */
 	dsp->debugfs_root = ERR_PTR(-ENODEV);
-- 
2.47.3

