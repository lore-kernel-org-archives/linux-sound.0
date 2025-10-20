Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E12773E9
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975755; cv=fail; b=KFXUMpD/cIcK7nfoWJYHMkc/k2G2JN5B8NSC2eOxg9XBtMqudeOkY3tKeO3bDsCQ0bs5lawZkUQGEDEZDCgytP4qTANkVFkFVods9SBfzRTfhMhqseUsgdHcoMIE8cm87I/pxUDHjKcKWzFLVsMoZDvM6ioMfCVZvwCgd/oYpjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975755; c=relaxed/simple;
	bh=8dyxcBxrwsRHVptWV55QVTLrZ87JJmZwnB1VulIE5rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oudaAkwiz8GXMeIF6KavCwGlaClxizdF0Kv49iWy50urd6bPriQFsYMkC+fdbEjwf4TGg8G/AQ3S/QBHnZZEvKbIxC4pPFUSnElyA1PYfI+hRH/6gTYyhlfAOTXcN/IJvQuoFyRXtJp2QWaA8bX+1qTgjzkHbYdJJZwYa8z/MRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Bppcpnjk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wfdbLC+r; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Bppcpnjk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wfdbLC+r"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAeTo941384;
	Mon, 20 Oct 2025 10:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=; b=
	BppcpnjkCb5y5i19Dn0geZr79ARpsZ5o6Inzx/qm9Uo3S3UjPkRTnm302cL42oYE
	fZjVQLOpZgUH01eQ7NIGAYTU7NHy56DKJE0ENtR/e9d+kC+ExbN/r0xWyuswBBXh
	OrCZXmZvM7WAfSCPKZUDUZK2uGITeZUCZ0NJfr4uDFW7+EEURFJasDm/miGQiMWt
	PY/UuTtCadSdNlF0KaS27cXI4wP1TeNS8POl172KS+aZmf1uy14N8S6xKhebMMQZ
	QF7oeXkG1PceF9Y+3HOJF0VOHS97n8KAqkh6vIzqLL39NEfFqz2Cqf7atC/vsiMR
	X5vssAeMOiPTBl1Q1rAI1g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020087.outbound.protection.outlook.com [52.101.201.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aem-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwARrHdMzl7CKMT93y9ywzq3hXiaoLFJ/gcLdJJkL/lXz7jGYS41h3oj7s/FZTRmqeim/FrRT6HD57/UMRQedw5YCLmhINliDRzFM0zBwSMNBLbS13JQXuE2Ucc9OyQtx7cIP3iu1jGu6M0AEbVq0OFWLC306yeJIrhP9PIx6OKCCnJ2hW4+fE9baBvVLhYA32kW9eWT5bhOTDhcqWPiMd5a2LVVE3q/qL2UfyDypHOQc9rueKvQWjebNMBCDbkJppYghTpUKWlq57lwzTjD1K1HO3KkLh0hXRqZ5dwYVIn6cJYN+L9E6/raHB4GqMbSfvSxkZlS9qXU58fzItxSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=;
 b=GeAtQhqETpXqUpmieCPT80yLC3ddiGKImptq2vS6gCjen6DsMahx/ybKfINwe0T0WWGhijdrA3k8PvO8czyrjz00CV7EchwNgplIbhex5iVAFl6zhODyFAX5S+hPrG2hyOAazZei5FJzVufC1die81A0bEj8KXl99zH0Irw5Rw/Jn9WfV/cer/xj/zAUr9Tysaa6nksBHXvkQY3OL8JzD5Ns38JwYRpzuyOd1ttLecsRmEQLDL52OeVMNbsCT2JOzbBTVFEe5ASGLng0YSwiRyOw0AiG1xj72iX9iYFJMQ4HALdpdKh7LTOLFc/a24WvmjuPFmfRbly0Y0Wn6/gkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=;
 b=wfdbLC+rvIuLtmdNgWRm2jOT/0Pl14BpIDbHJFKwfax82gcRL1ZGk2HOByfLKZdPc45T4wGi63droHiE4QIsBF8rxfV/FeGs2SVCyi6JJ0B0r74rVfOpD4j+E3xigaN/OgaCMYvRIl+Ne1iygMkqKYR19BeN7kvhB5HdWLa6Rp4=
Received: from BY5PR20CA0032.namprd20.prod.outlook.com (2603:10b6:a03:1f4::45)
 by BL1PPFF538FD133.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ede) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 15:55:23 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::7b) by BY5PR20CA0032.outlook.office365.com
 (2603:10b6:a03:1f4::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B649A406579;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AEDBD820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 12/19] ASoC: SDCA: Add UMP buffer helper functions
Date: Mon, 20 Oct 2025 16:55:05 +0100
Message-ID: <20251020155512.353774-13-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|BL1PPFF538FD133:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 060d7693-2fdc-4650-23db-08de0ff113f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sglo6TYQ5p4lRu7bxZO0XLliGcnU4qWWj6kEGQ2nhGONJolgKLFjA/4rv4RB?=
 =?us-ascii?Q?uMGukwhZLIMtrd9VBIC86OQQaOrrX29TBsn7clJXqhd4dOe+PsQD7rSz7MeC?=
 =?us-ascii?Q?j0InDfZSdnlKocboYtrN4vXcfS4/rsACRVSh2JT+iaLAOWS14wvFmEYbaM7J?=
 =?us-ascii?Q?2/K8bDXqmnmEj8A6kb21YYkLUJTKuXXgcssWeFsLfiqYgvaPcuTLmJykZIrN?=
 =?us-ascii?Q?q9I6Bp2bNJetS9iYQ1zwpQk6eglKQZZsXVDs86sWE7VV+IC8b9OfdKimx9IC?=
 =?us-ascii?Q?JSGX09kRK/aBOfkAvOMniAmCzjwuuzYIQmQMmZJjj7M7VYRLTjXnD8VBUNNI?=
 =?us-ascii?Q?Ju/vA+ten9d9Gjm5NGFTfqofKFcL9w0MwS3/nW5XsNU/GlXTaG04XltRAfPJ?=
 =?us-ascii?Q?XDIVhcQr5nXaV2UtJyNDKoQDYvpwDgNJJElNOamySDAMrHtdtnL5VEtEvOGz?=
 =?us-ascii?Q?YhY6LSkH7aaz+3sr//UPWU5cdu7UMU0zbK5ISiFqT4EnbpUz/l/ts28E5DmK?=
 =?us-ascii?Q?7YXSEtA1fHvWbf13atUWXLQtdDQNy2DIwTKF6ALs1OgcFG3us6e1TxbSwtWI?=
 =?us-ascii?Q?uvCRt7f409/GD0HTaXrrxAuEjf0OwqBzsUs31E6ZtYRJHzAbIlB2R/u5TUNs?=
 =?us-ascii?Q?tDfLfkw9FWGtGYZcg4hiI4Wyib/vI4lSWot7ZJlcQd5jhr6Pzm1bCqrec5bF?=
 =?us-ascii?Q?uSK6bM/eitOe0y/dRVYu0xJ8DRIVLDR+xe9Z+gzK9vcm24oAnPvDEzfxy0cf?=
 =?us-ascii?Q?kefNHj9drT+ObxP7gjD8Es26GkXC5NRs0crZZu86ZFAp/+KEuowcSOYJHWh/?=
 =?us-ascii?Q?OP7CFvz8CjoDEh3HGYICM91cUl0lsMm0s0s5l/yJ7CRX2sZZvYm/BYGva9hp?=
 =?us-ascii?Q?p51d3hqR6Q1sad0+PQl9WYqWzIwegi6Qs/H0cbZn8/m7jKbZMLava1IIyKjG?=
 =?us-ascii?Q?aoMPgDHztJQz1xFrt8WvofNbAERXRqroYffHtunhkJE/re26wx01Uvh7Eunn?=
 =?us-ascii?Q?SjhkfokcZ0rl7D5yL0+NAH1z67Yw3NF4e/Q0zO6elKBLWkZx9Z6gBva7NoPr?=
 =?us-ascii?Q?AqOGVD4P1ANMiGPchZOUg6H/DFJRGWQ3/KA3+yhkCZchuKeF6SplISvhtvlx?=
 =?us-ascii?Q?ZS2L3H2UYA0GfdHCNuKQzSTGtVW7EbeM4Og2wV7uql+p8jDxjihUK761RACJ?=
 =?us-ascii?Q?9wASZaKlHJGt5Em8iI7x3f4Nocy2At41pSqSHwVmO2lWjfQ/9AmmiH7sWAkF?=
 =?us-ascii?Q?WRVbMF2/HNQZoo7uEXUHUx5vNWsLze38I8rmfYlfzvZ/7JOU5xrf8ZKFMgXF?=
 =?us-ascii?Q?ehAtBbhE4Qs+73PLYnIp4YVADYSMUCA6u/XxptMFGXhnUEO9GisvQ2DDlPFm?=
 =?us-ascii?Q?FioFGPR1mOxO60MGl6zMqilmY2iKtVgxVhn9wBd67+Iz/XIxdarnZyRufvoB?=
 =?us-ascii?Q?Ggr4hYRmyidVzPLfmwQ5/UapvKCS430bBmRagfEumMkHMC9yVlicJVh4XIiQ?=
 =?us-ascii?Q?ja7vfwONuh/Yvv1+TrOLoi3xsyVRssGDaDC6eSuLWedVrN0k8n0gnR59HSEC?=
 =?us-ascii?Q?cz0eENjnhJDy917P+iQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:22.6107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 060d7693-2fdc-4650-23db-08de0ff113f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFF538FD133
X-Proofpoint-ORIG-GUID: EI4AQ0kmnL7usk9C_aHcRof4beebfWLH
X-Proofpoint-GUID: EI4AQ0kmnL7usk9C_aHcRof4beebfWLH
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6d cx=c_pps
 a=M3VJd0sitle1370pw5NXFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=QWniJiZs-oX1o9d3st4A:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX1J9cvkPBI4T8
 tqfttBEzRTqkgg+9sDR7GL/MF1UmCyQRH0g6A+d2Y0ner5x0Hk2rpX0gukKNTLDGAhuZD6ZjaCd
 TbVKGnKQKQVnjYes4kFPy9LoBks6wjypBJKPSJ1TIaylECDFd0YL/AOl6cAoY2o6Bt1k3rzq+7U
 VX7ywKi5eiQsrU2fG0TknNQ7F8k7e8fvVTeWk0WW0ZEMkwE4jhG05fMtajhpKCflYYBMHNBukic
 pyTWuym4jnPLO8LvFexv1/HrGcYpuegh6bzz1OgaNBjuWyKRJlV2zecz52qpClzQIFMGcU5YGOA
 usY/QwiqZIBtmSrYiZHPY8XUEGCeezk4ZNCxqXDwM4tZHfSjfAJguONlHEZXvNUKmWRyWUQnPKO
 K3UAyZGaiZqqqzrqzO1n6wtK9Er2Eg==
X-Proofpoint-Spam-Reason: safe

Add helper functions for handling Universal Message Passing (UMP)
buffers on SDCA devices. These are generic mechanisms to pass blocks of
binary data between the host and the device, in both directions. They
are used for things like passing HID descriptors and the File Download
process.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h |  26 ++++
 include/sound/sdca_ump.h      |  45 +++++++
 sound/soc/sdca/Makefile       |   3 +-
 sound/soc/sdca/sdca_ump.c     | 247 ++++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_ump.c

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 2e988a30481c7..6dd44a7a8a359 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -133,6 +133,32 @@ struct sdca_init_write {
 #define SDCA_CTL_TYPE_S(ent, sel) SDCA_CTL_TYPE(SDCA_ENTITY_TYPE_##ent, \
 						SDCA_CTL_##ent##_##sel)
 
+/**
+ * enum sdca_messageoffset_range - Column definitions UMP MessageOffset
+ */
+enum sdca_messageoffset_range {
+	SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS		= 0,
+	SDCA_MESSAGEOFFSET_BUFFER_LENGTH		= 1,
+	SDCA_MESSAGEOFFSET_UMP_MODE			= 2,
+	SDCA_MESSAGEOFFSET_NCOLS			= 3,
+};
+
+/**
+ * enum sdca_ump_mode - SDCA UMP Mode
+ */
+enum sdca_ump_mode {
+	SDCA_UMP_MODE_DIRECT				= 0x00,
+	SDCA_UMP_MODE_INDIRECT				= 0x01,
+};
+
+/**
+ * enum sdca_ump_owner - SDCA UMP Owner
+ */
+enum sdca_ump_owner {
+	SDCA_UMP_OWNER_HOST				= 0x00,
+	SDCA_UMP_OWNER_DEVICE				= 0x01,
+};
+
 /**
  * enum sdca_it_controls - SDCA Controls for Input Terminal
  *
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
new file mode 100644
index 0000000000000..b2363199d19aa
--- /dev/null
+++ b/include/sound/sdca_ump.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_UMP_H__
+#define __SDCA_UMP_H__
+
+struct regmap;
+struct sdca_control;
+struct sdca_entity;
+struct sdca_function_data;
+struct snd_soc_component;
+
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control);
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control);
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg);
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len);
+
+#endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 5e51760cb6513..a1b24c95cd8c8 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
+		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
new file mode 100644
index 0000000000000..5dcad2f7ea05b
--- /dev/null
+++ b/sound/soc/sdca/sdca_ump.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_ump.h>
+#include <sound/soc-component.h>
+#include <linux/soundwire/sdw_registers.h>
+
+/**
+ * sdca_ump_get_owner_host - check a UMP buffer is owned by the host
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control)
+{
+	unsigned int reg, owner;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_read(function_regmap, reg, &owner);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP owner: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (owner != SDCA_UMP_OWNER_HOST) {
+		dev_err(dev, "%s: host is not the UMP owner\n", entity->label);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_get_owner_host, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_set_owner_device - set a UMP buffer's ownership back to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control)
+{
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_write(function_regmap, reg, SDCA_UMP_OWNER_DEVICE);
+	if (ret < 0)
+		dev_err(dev, "%s: failed to write UMP owner: %d\n",
+			entity->label, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_set_owner_device, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_read_message - read a UMP message from the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer that will be populated with an dynamically buffer
+ * containing the UMP message. Note this needs to be freed by the
+ * caller.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * retrieve a message. It is the callers responsibility to free the
+ * message once it is finished with it. Finally sdca_ump_set_owner_device()
+ * should be called to return the buffer to the device.
+ *
+ * Return: Returns the message length on success, and a negative error
+ * code on failure.
+ */
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg)
+{
+	struct sdca_control_range *range;
+	unsigned int msg_offset, msg_len;
+	unsigned int buf_addr, buf_len;
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	*msg = kmalloc(msg_len, GFP_KERNEL);
+	if (!*msg)
+		return -ENOMEM;
+
+	ret = regmap_raw_read(device_regmap, buf_addr + msg_offset, *msg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return msg_len;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_read_message, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_write_message - write a UMP message to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @msg_offset: Offset within the UMP buffer at which the message should
+ * be written.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer to the data that should be written to the UMP buffer.
+ * @msg_len: Length of the message data in bytes.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * write a message. Finally sdca_ump_set_owner_device() should be called to
+ * return the buffer to the device, allowing the device to access the
+ * message.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len)
+{
+	struct sdca_control_range *range;
+	unsigned int buf_addr, buf_len, ump_mode;
+	unsigned int reg;
+	int ret;
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+	ump_mode = sdca_range(range, SDCA_MESSAGEOFFSET_UMP_MODE, 0);
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	if (ump_mode != SDCA_UMP_MODE_DIRECT) {
+		dev_err(dev, "%s: only direct mode currently supported\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	ret = regmap_raw_write(device_regmap, buf_addr + msg_offset, msg, msg_len);
+	if (ret) {
+		dev_err(dev, "%s: failed to write UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
-- 
2.47.3

