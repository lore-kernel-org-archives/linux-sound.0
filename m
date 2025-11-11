Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86710239E70
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869998; cv=fail; b=jV5f5jyE6Hr2gT2P7oMYYUPzAKYb2iyXZyDMFWZmW7qjeDM4VwEEHiYl+FBeu/huOi7rmPTT8wDscC+TI9CgVfWdCURaX1TYFZFw9bmkdaf6+O+pSL7M5w7YkmBnMciTTuBBAaCHRvcDaehmPyiDGpLekI2rqspodpP+N3wPVL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869998; c=relaxed/simple;
	bh=mbTxT+Gi6lpBYTCAhOER8rt93Vkeu7dV/hM1lMy+l7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P/FvZapRYmkbMCNxtSz0NcbMNRLusSR6agmQCy8I3hrM5LzvwRx7UQ0GCdJQ2BGRo7aRtjh4d8XuSRiK+heH4D39uPaB+H4EbItcJ1R3WIreAw72GyrpCOCIkECsdQiNSACmdvjigGuQzJuwX+RhBzITpA+VUR46iXHy+GlsC0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fTc0tDjW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wwiIjsxw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fTc0tDjW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wwiIjsxw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5x5Ok325335;
	Tue, 11 Nov 2025 08:06:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iHFAsPY4yr2sWf4D
	552cG2xrG+Oivj/q0Lo7HPEJDnM=; b=fTc0tDjWGL9Ovicp1qQEpdWFfa390JOo
	8zD7oXy8nky5gvvDX6St1kcvMMwX6S3MmIrFgTB2NyyvuVJKwG3bVIbkofaVvAq/
	ohcvV4+bgy5HxicE6aJr9WJO3El+PU1nd/B66oJSXphJI0HDhA1Ju1CerC/aGAXH
	7asTdroeodIdllyx9mJHnD0jl9XyEXmsXP/WGidmJfWgsqhwpZbvUFf7Bo1QVx+s
	1Yg44vSNxp4XqkroAV36cWniSB9pTvUlGVeJkcOn9vCzlVGSgQtalfIjg+1/lcJp
	nugoP1wEwAHHw3GW52Y0Uj4YooWLZGnsVuJuKlwIZBSvyB4IIXIrXg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020108.outbound.protection.outlook.com [52.101.201.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4abfvksjv4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 08:06:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArHV8HUvBtI0eo3hybDbFkt6A8FzXE6DsdcNLhYY3KUNKcLj1d8qfjBlJiUBR0/gJbhZmMj3fzzVCYujQl2yRXLFVfdIDq+9LKhXLBYrt7+WDfXN/JIVWoSswaEuNInBZ7ZeHMhAKzHOJJpy3uia1lA9CVr+1kwVOQNu91lzsXfK2UfPcBmoss+r7kPP+Vj/idAOuyDS2J7fTdA8Qp3CP6ZcD+q+/HRjOzjAER9MpKat21RnZTwmVG1cjPiEvMkdq5V5/2HV+NQQZJA/yQR8+pr9JZ4vl0Z0bVsMk7Ul3EDctQzwjw8RowFTRx+rAJuD0vxnvLpR/0rtZ9Lmhk61WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHFAsPY4yr2sWf4D552cG2xrG+Oivj/q0Lo7HPEJDnM=;
 b=M4bzsje3G2x4puPUpKUxKJr0BL9VwLlydwBP1WQJSk8aEddzlLqlnMpc0nGmvyLpUrk6GLEmMGdevwa0M0aM4A+GLFyCl/sZXdk+32HcUI1j4+K1VvVseBIU8O/gFCySrZE42KonjCyvtxYly+3eNdA4NWvOJMrp3hNghFTAObQAJdk9BWwKNGryqe58ZA7d2bRIfHUpQoC4+UOVgnpXLsK93jruralPsCxki+fCO33Ch9wpFXnH8X8IoCiju1kF470qclaMPMdsSuQfaDxMfvE1WdfCxcDuFJYlaDN9Ry/05tCfjsDfLkQtnFQ8CPLjR4GnHfPHKcP6C0fYBJfpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHFAsPY4yr2sWf4D552cG2xrG+Oivj/q0Lo7HPEJDnM=;
 b=wwiIjsxwmtCkGJSE8Flt3brv9smkw3CrnkvbRKgDQ9m7F9w4WCm4iBUpEIK1aFWIZET7IZMrW/LRKD2wQtkiNCCD4w/uWNGh+Ge6hP8gSVZvobi4LgMLytz0IJXDCuhXLbdPW44QuvE1o/ilMhnYDnYw1gihFdf0gfgn2/QwqaM=
Received: from BY5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:1d0::34)
 by PH5PR19MB997174.namprd19.prod.outlook.com (2603:10b6:510:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 14:06:26 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::45) by BY5PR04CA0024.outlook.office365.com
 (2603:10b6:a03:1d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 14:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Tue, 11 Nov 2025 14:06:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CA9D40654B;
	Tue, 11 Nov 2025 14:06:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 156A9820257;
	Tue, 11 Nov 2025 14:06:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Add companion amp Function
Date: Tue, 11 Nov 2025 14:06:17 +0000
Message-ID: <20251111140617.2997454-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH5PR19MB997174:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3db1b364-0fb2-4d50-d8bf-08de212b80b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZXk9kRjk9TrAttPOvyI5Kvd2mf9sjNU8YAVP16JXJTR45K7gh85x3tV6LWLY?=
 =?us-ascii?Q?DjadcMCQ9HkJ4P6AXnP2bQDpK7KhQP4UkmdVBbsAJ4rjkk79/PK4ydaKoThr?=
 =?us-ascii?Q?niDDL/iy8y4FgOV8SeAn6bnlCUcch6ReuB7EGe43t87u64sFtnqYUQHee3bH?=
 =?us-ascii?Q?AI2qYLxCRtLQkFKK39uF4GM/cWpW4ykl0xiYdXp3yvgsAzxzivuZ/pVO/tQx?=
 =?us-ascii?Q?boc07zgc3+0o6Knn9P4haeqW7fTC0GEhvlYwxwaCMF6AWiZ5Mo5De6xTsRCD?=
 =?us-ascii?Q?ZOlV2hv5vcX7WiGhO7UTvoeOfA4XZiY1f0T/3/DsDC1KqbsoGjno6K6QoJyl?=
 =?us-ascii?Q?Nc4b54jFi6ZOH+70O+yNyHFtgSSObqoQX1FEa7HO8xG/3tckFQYjKdjDS701?=
 =?us-ascii?Q?0rpgrdYOvk7JYvsvHLnQK8Z5NqhSBnad5RAMoo1KiAMUQUXyQku1zo5avctT?=
 =?us-ascii?Q?uVAAKKxdeKvOULs/NhKwYrx7kdhHiJ1sj7kBCfJU3o2c7Tbc2K7U24OJingn?=
 =?us-ascii?Q?uK5cHZgVd/fRI2q/WEPR+GVcX5NoC8pRBx4siAL9Jd1hO6U2SaYvonAgLzTU?=
 =?us-ascii?Q?uIjXlJ4dIb+HxahMult1HjXneIJitNDRt6UoXPguM9MkLPQ/qfqSJ/ZUXRPH?=
 =?us-ascii?Q?IVcpYrURCxe5zDqiXGQ1qujq6Myzec6+ZM1bCd7wMYq3l3+a9cR7GNmUTQv9?=
 =?us-ascii?Q?l1dMBNCdBxDyx5kUwaFO9jTxdYx7SY4yZT1yWxEJXcm+OcFbV3E5DAB6Kgvk?=
 =?us-ascii?Q?JP5xhBzlfV3CSgAr6dHLAjhuTfSxa53dpY09/CtoTcnl+8yBJ3Gs2jwEXARj?=
 =?us-ascii?Q?FH0bYQIbVr3Vr9Aw5XQN/OzKDayF9g2bX1NTdSLPkEhmr7HLnAuROFcFVnH5?=
 =?us-ascii?Q?vP9YBQCuelCUPu/TD4SpMWc1W4mltav8GTCUZ+Hv/ls6FdUOrAzgYNtFKE9W?=
 =?us-ascii?Q?4jegDVLAj2GDeWdlYfzpx0UwW4zzY+QYkDAKLpmNQhla6epcq4d6rtEPfZu9?=
 =?us-ascii?Q?iAl+TxZzyfdN3AUZgNRAiUJlwDrT0XRRx1sgprv+ISnKgIC+lgf6GT0iU0Ij?=
 =?us-ascii?Q?Bbzsme9ctupvo5MsBpRjhXFEJ58VVWy6bYrn+zTFFkHqk89oyoA+dwL3O2jo?=
 =?us-ascii?Q?5l8mf8Y0C3COMycKZeKpVbtTXUMNDK6rR9YeSR9E45fvNnO7UTBGD7UhRT/i?=
 =?us-ascii?Q?UFVjjMT193IBjSsovcIocxnYzD2eqwHPiAQhl4CXOpz/KUnxTGBpWSkvj8V6?=
 =?us-ascii?Q?le47QlbKHmN13zqqrQv+aKZbjf96/mLEnt4+DI6gefMLBPCEhUADxVSMrUHM?=
 =?us-ascii?Q?YKaLoTF0iFjLK4lwHeUXjtmkhzKysKYNvFShm6ghu9ZvI4BFPy5s3xiNC6Ga?=
 =?us-ascii?Q?r0RQhZSmu2z0eaxTxGzMSb3IFWmxSP+qJZwqsEUHRiIXNKR32Oll16J39BjS?=
 =?us-ascii?Q?D6tFhvt7RlPT0I3bXnnBqOMBr0TKW9lnVFWFCf7khkB9p7YvY4ER+drjdJ0S?=
 =?us-ascii?Q?Fuw+At33NgP/0Wl89QONOM8wm7wByYpbLPwh7qTsiArx+n7eI1fJ5Jjbkp4z?=
 =?us-ascii?Q?3Cwdjq15v2Kt/9Tpqa0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 14:06:25.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db1b364-0fb2-4d50-d8bf-08de212b80b3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR19MB997174
X-Proofpoint-GUID: n3UZ-k5Ect4rmAD6-GUcaOI3kr5OHlaf
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=691342e6 cx=c_pps
 a=92GwzG7YO648zpZZqM2iiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Jo4QD_9Ec1RBtys2nc0A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExMyBTYWx0ZWRfXzVJmFNieI3MG
 kJsObVsl5/rjy9WeHZK6rxLi3ZEd3x8/6H9OaHN0bTmvj0RiN2eNTA7XfLXJUxxhYuOq8f/BJ3I
 8s1tkNv4V14ZXeLRvCocSDvBcVuMXhDXcUi2FgEUFvJxUtmOeZ+FqByzAzv+Uu5ekFfEIqK8Srr
 neJa52psVfL+cxGvLWjqypScRGwjCGIz78ayAsxKj2zLBu9VfhIIBIU2LIwA+T1dChddn3Xk9cD
 JImZEVl2E/HdCVuQf19lUZN5KpwsRC4GN6ZD1SMDmINzAxCbfqZA6TCsjYYkuCbP9tC6DrZYCif
 TrLsMrzyzw7SplhX/ln5orZuAjJG1fUz0E2m8dKw+O/Vt+mIRcqPV3y2dBWTUu7U+/0j2FZAWju
 fjUGvFEJh2DUxViCGuOppzcYGZSlRQ==
X-Proofpoint-ORIG-GUID: n3UZ-k5Ect4rmAD6-GUcaOI3kr5OHlaf
X-Proofpoint-Spam-Reason: safe

Add companion amp into the list of allowed SDCA Functions. More work
will be required to fully support companion amp, but this will let parts
including companion amp functions boot and it is a good first step to
proper support.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 3 +++
 sound/soc/sdca/sdca_functions.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 99cb978f7099b..c97861508a158 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -64,6 +64,7 @@ struct sdca_function_desc;
  * @SDCA_FUNCTION_TYPE_RJ: Retaskable jack.
  * @SDCA_FUNCTION_TYPE_SIMPLE_JACK: Subset of UAJ.
  * @SDCA_FUNCTION_TYPE_HID: Human Interface Device, for e.g. buttons.
+ * @SDCA_FUNCTION_TYPE_COMPANION_AMP: Sources audio from another amp.
  * @SDCA_FUNCTION_TYPE_IMP_DEF: Implementation-defined function.
  *
  * SDCA Function Types from SDCA specification v1.0a Section 5.1.2
@@ -83,6 +84,7 @@ enum sdca_function_type {
 	SDCA_FUNCTION_TYPE_RJ				= 0x07,
 	SDCA_FUNCTION_TYPE_SIMPLE_JACK			= 0x08,
 	SDCA_FUNCTION_TYPE_HID				= 0x0A,
+	SDCA_FUNCTION_TYPE_COMPANION_AMP		= 0x0B,
 	SDCA_FUNCTION_TYPE_IMP_DEF			= 0x1F,
 };
 
@@ -96,6 +98,7 @@ enum sdca_function_type {
 #define	SDCA_FUNCTION_TYPE_RJ_NAME			"RJ"
 #define	SDCA_FUNCTION_TYPE_SIMPLE_NAME			"SimpleJack"
 #define	SDCA_FUNCTION_TYPE_HID_NAME			"HID"
+#define	SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME		"CompanionAmp"
 #define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME			"ImplementationDefined"
 
 /**
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 49b98fe2d8543..0fcc8e82041e2 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -79,6 +79,8 @@ static const char *get_sdca_function_name(u32 function_type)
 		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
 		return SDCA_FUNCTION_TYPE_RJ_NAME;
+	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
+		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
 		return SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
 	default:
-- 
2.47.3

