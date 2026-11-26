Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692132;
	b=KAChVBPAUKk0s041hJrY9xI/LPsyiIiVF9VuGj7umvtzuDdAgFb0tBdgQ//wsgHuHBs+
	 IvHcA6QJiTx3yVPLjExxcFvOMifWzgXB2ohsePZdV0M1YczrvI9pqd87qKGxyXSMCI+Vw
	 KWAx8a/1qIsLFu3NhhX57zU83j/9FUldGv0i074H3S7b1lqIgKBAXxC1NETEKh+VmdIRT
	 lWpCtJMf+MYiujrI2vclClcAw+L/RK/LTjLtU4jNKbyTZCZ22q/L7mZPEsdd0GA9d8zyy
	 ATz6f6ra97Nds/V7FRmNdC7EzAQc4Kc5IiXk9IyQNUvLAL6xcWwK+B2EYO7Ri7c4wHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sG8f2nGzKLbq+5tWS9iOW7XpmAk4T6lEkSX99Gj/Gy4=;
	b=ZkAq5BCOrOni2dhCM/vG7BTdHpN3EvYmpjyGBCaB4kN+8bEPDB03GspLmc6RDm6OCwqV
	 Z0yX9LYuJq/ide3YE/zLhtN7bPmq0zrCpa4/umrx5/UILbvhIoVEPdJwAryqjFrznpqL8
	 OvR2oeGMGIUwe/psmO2r/aDJdpr94eIMdYJbgCONzL7jH6oCje6ewFYax6XYdTR5aRJc8
	 uRCgYOtxlaY67jxiRvlgcU7xOMrSuujcU9oRKt7/z/RtDAdN8Reg4JlUuSQjW0aYvp7cM
	 1BW6u3IeY0StrZ+2GM3CDl3Rv/pO1XomXm6skjSPZMgZO36pjlsQTvgXyropGSMdtAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DWDs3Eho;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=WFJGA9EL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D13606A337;
	Thu, 26 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D13606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DWDs3Eho;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=WFJGA9EL
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AQAZcwt3380159;
	Thu, 26 Nov 2026 05:21:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sG8f2nGzKLbq+
	5tWS9iOW7XpmAk4T6lEkSX99Gj/Gy4=; b=DWDs3EhotEAT+6egneTtJPWPbl9HI
	WdrDVLiiUvrULuLn2ikt5cIwpT/WMDTGunlWKS+OXLOgP1hi3l47suqvrTXZO7st
	ZWaAZrtGgeYkWpuRvS6hJqpjYb66XcK26CRN/WJTNv1xt99aMwXttttFKMSJ4biM
	VHI6banwHdwu7ZMJRgUZjb3lgx/BtHJN0ACMO6SOo5gKf134h7BYQD2HOw/cRYB+
	uGBrNSlnpIsYmqaF8iAB8VyepuLnWe5Kny+gEVHyxlBvv8qUVR2tEreTx26W2uN0
	xN9wuXLF/rXbKNCqM3aq1gZqoP+fdqdIp3dUPSuPDBa1sMMmAWlqc+dKw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j6a1dk1fv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 05:21:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBop4FFn6q192frd963uNpNETKmOG0AKWyEOpPC9bCGM/TyfbKn2YkvCEGwmbq0SCXVlP7eSdUvbuWdKNB2w1VgqKqfQFomQtwPoK7s4TXa9iQIrpHTKbt13tr8+E+HkqxVdXDdLc48rcTSCGHr0BiZIiq/2lICZJ/ztOhMxRIvAOBY2u/Ct7ibhc6M/lANmoXSGZt2aAn/mmnH32tVBmKQZyXddBCTIK766CTQhzrv1LnZM5LRYFbJ9kOCgsZLht+1N9KH+qd4yC1ksLmcm65KxKH7GWXVsvN2s8G9luERVDxsTELlUoP7NC8nLpDnleF/W3cu0rXr0cKqw7Tn+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG8f2nGzKLbq+5tWS9iOW7XpmAk4T6lEkSX99Gj/Gy4=;
 b=y4PRo59BgGzq3v9fxkxcNO86ecVT6IXNYeL3+PCcJZXsFYW/QP6dHL2wQQM/iy+OII7SGdPt7X0WWa/bDsqIJWATIn3gWwntyUSf16UOividauum4qsdeLEndT17V8kcV7YW2MOwsmBd+Q8r3Cr8BqkiF+FhFTYQaTZsknMmaDpvnCYSJ2Wv7MEMOWVYKE4Awuqkxf7ain56L+NoN6Y8KL2zJ5r/51Bj2+90iPMAgc00+M49HMkXxeg5IPGZTQdtgxDZU9tQ58Rmfkiib71+rhljsBzjc/Kag6GNekxmYjz9NKRCwbsMRumUKMp3y5twDfFNOBTZJAyjBLH0+mykyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG8f2nGzKLbq+5tWS9iOW7XpmAk4T6lEkSX99Gj/Gy4=;
 b=WFJGA9ELZlvnsis/uluFSeMvmebLpvjo4k3FsZSoEt5dPbt8xUsFjZbY2okK0qNHcZ85WjqxeAJHszi+mqNgRCV/AjLg4ua4ENL6Cc0zQlKdaLlIPggaFH2qzSeuwOFjUCn8kWt/ZvEyLtMyk9dzgrhlavlaP4o4MbSla+K/MXE=
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by MW4PR10MB6678.namprd10.prod.outlook.com (2603:10b6:303:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:21:18 +0000
Received: from LV8PEPF0000006A.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::7b) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 11:21:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000006A.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:21:16 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:02 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 05:21:02 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.250.64.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQBKwHT1596498;
	Thu, 26 Nov 2026 05:20:58 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 1/5] ASoC: tac5xx2-sdw: add tac5272 support
Date: Thu, 26 Nov 2026 20:20:19 +0900
Message-ID: <20261126112023.29054-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006A:EE_|MW4PR10MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 84daf10f-a3ee-4082-c97d-08df4baf6322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hVkvUVtJOEgStcYy/019NyLDTF+cA/UVhPTVlR5RSFKXWB44bV85M/EFkS/9oBdStFOjDeCwcPADS1dHRd0K7wJP3H1x0Vuwjxe+kDsipP/xFx4XBnBX2jNpEm3SpGaRcRabpLnYmUhC5+JRwlz1x8vF+XHugLx/ryEGYQNes59a2vG/3uROT19zGqQXD1QtcLh6yZHD+XpegD4ze5Vl2U1FmWSKDjzXNgRrSrTUEUTUlQriUhVse9jOtwO1n5hgrwFITM++yVDagyaZ4cuzcOparl3AdQ8BNBoKqb7wfPMgThgqpqjbaklgSbtmsusfb6O9KCkjLFOQUpxToPssPksA5LHlvKWASElRPE5Ea48V9SCgGX0BhqJJjYxbp4qTvQXAs8kFNpUcG2vw6Bfb6qguXQD2OLi+glf1yxRjnqQ3AijiyLAfPiDCWQbUydCjf+DVzNYy5PoQriGQqfqKUBLz10F24qeOQbgy/2Sbz75BFojPBunvMZyDQruxlp6mPpMHw/XPz/DE17/sD/Czy4BofspszSmATWykpVDBFSL93pTZEwS1LJQfunOI5QTVxoKjIO2IOtMxhq3IA1br5zBQCh1u8fTOYYVoQ0zLI4/ENgk6VodnnCam/SGUYoddVUijYFPbSwAD/bfAVnHd8w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3RCIkIdLDFpgOWd+QxxoMYR//auhY3Xv1LzpjeJOWXh4p9hPiqmOSsTK9wbe1FEO/UsQ1wx3mcb3b2c1shHd78151uUQtDyaSnIS2L5hPbAiltGr4ecsmws3Uk76GTflbqXi/k95HeEnGSJegB1GLAoy8hMYBiFAjFG/RNoqUH4OvSM/l6cW3ZnXW+EghKWR2NR/kEntjkIHszwqnPsxhDNkw+xdozi64yH+nrmurpCq6Zey8lzV4NRXtffKzUFetNfnkKmw3FGCcKZXow9JMiY9LejgLPKlX0yRMiQwSvN2L/J7OGJWoN/3ZDgdvYX2DAWuFx3aGv1LgsNxEEVgDNaI0WuYZ8V1qOU3OeJDURrbNEmzhiFqpQBG+fz6ngI3yPlL4LD+cR3nWyTQ6HepkMPPowmjJmNzZCfPJyq9qJy0Dgq70tjUvGRLh3cmuOKF
X-Exchange-RoutingPolicyChecked:
	VO9J0XUNnFNpmWE/YCyTf3227zsXgjEYY5t2RQ7IlRKlT1nea1KezOR97Vx5bPgEUvFyx1Q8d7eXLOxG3cfx5EVhN9AJL4D65PsHldMPcDavzMAh6KILrq2/vAd9HBS9YiSIGDK74U0DWonBXUwlL4gRmFvyEKl1nxJnaOBL/hZzBOnayD0qETBvtX7Y55hPUlbOwGdpliwr5BIrMjbeqqSoi1rOEOkQOj6bADffHGBFXV9P6jcMob4DfgMascKPlxKvQXIE81buDCIRUu5StiNZAGUxyhkhJdDrPS6Dj63dLfYRWuyklSpbYbvfOSGkOgnhR3h1ZG9d99INHlpakg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:21:16.3354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84daf10f-a3ee-4082-c97d-08df4baf6322
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6678
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX7HtU5abAHIcC
 UQEX832AReULAFFsqHRh3lmtZ4EBWCxfrjp8txRyT0pI+05XY87nTg7e9eq/2VmdY5uBRZks4ok
 Hma/f9xOc8LG96+X5LO9mTIG0mfLY40=
X-Authority-Analysis: v=2.4 cv=LNTz05W9 c=1 sm=1 tr=0 ts=6b081634 cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=9niUjbxGTpza2x3D5uYA:9
X-Proofpoint-GUID: q1nKZOZpemvaKVooVJxl4JoECcJu6Dg_
X-Proofpoint-ORIG-GUID: q1nKZOZpemvaKVooVJxl4JoECcJu6Dg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX/E7agfCFr08e
 GFH1FyAKiJvW6NElVcT2NzgdTJzCaogmx4AI1PgpXBtA5YSY6rgdvHkGs05nguW5gKVr5t9mEH1
 ezZt/BR2yi1xBoTSJiU5H7rjiruHLbK+I3h77+dqPmtmZMjZR2f3YwFg+0yJkEBwXLp9ZCcH6JU
 rAtmbG+OpNDJjltUVEOAaEwQmiHXc7W/DPQQklTk+89Ha9PxlexdtFvibg/x4HpP4OsyiKTApox
 PnNO8gcxW+UD9gGcN8V4GB22aeThoy1YZ/UCobyj/PQPO+rR1MFfSSeEI+F4IpwFP80dXkzDo9c
 MmD0CdB0Wg1me7rBRltajaSlLbvrmdyVXuC9XuESW+6ygvDpdBN/iPs3OHETcREyW8p7m1eOtS1
 ioqYlmUSZECoE5iU4dO/bPVjAEykTacvPk5DFp6YeAcSl3L5S3UB+FBWKfS0H70HXu3b+ifVE5f
 ifsoBKgizi6WbKyiIlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

Add support for tac5272 which is a UAJ + DMIC
variant with no speaker support.

Refactor tac_component_probe() to dynamically register common
DAPM widgets, routes and controls per part id, removing them from
the static soc_codec_driver_tacdevice. This allows tac5272 to
register common and UAJ widgets only, skipping the speaker path
absent on this variant.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
changes since v1:
* Refactored to add the widgets dynamically based on part id
* add DMIC support as part of tac5272
* link to v1: https://lore.kernel.org/linux-sound/20260908032757.389-1-niranjan.hy@ti.com/

 sound/soc/codecs/tac5xx2-sdw.c | 127 +++++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 43584bebd..a541f95e4 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1168,6 +1168,40 @@ static int tac_interrupt_callback(struct sdw_slave *slave,
 	return 0;
 }
 
+static struct snd_soc_dai_driver tac5272_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif3",
+		.id = TAC5XX2_UAJ,
+		.playback = {
+			.stream_name = "DP4 UAJ Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP7 UAJ Mic Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+	{
+		.name = "tac5xx2-aif2",
+		.id = TAC5XX2_DMIC,
+		.capture = {
+			.stream_name = "DP3 Mic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
 static struct snd_soc_dai_driver tac5572_dai_driver[] = {
 	{
 		.name = "tac5xx2-aif1",
@@ -1353,40 +1387,78 @@ static struct snd_soc_dai_driver tas2883_dai_driver[] = {
 static s32 tac_component_probe(struct snd_soc_component *component)
 {
 	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
+	u32 part_id = tac_dev->part_id;
 	int ret;
 
 	ret = pm_runtime_resume(component->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
-	if (!tac_has_uaj_support(tac_dev))
-		goto done_comp_probe;
+	switch (part_id) {
+	case 0x2883:
+	case 0x5272:
+	case 0x5572:
+	case 0x5672:
+	case 0x5682:
+		ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
+						tac5xx2_common_widgets,
+					ARRAY_SIZE(tac5xx2_common_widgets));
+		if (ret) {
+			dev_err(component->dev, "Failed to add common widgets: %d\n", ret);
+			break;
+		}
 
-	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
-					tac_uaj_widgets,
-					ARRAY_SIZE(tac_uaj_widgets));
-	if (ret) {
-		dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
-		return ret;
-	}
+		ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
+					      tac5xx2_common_routes,
+					      ARRAY_SIZE(tac5xx2_common_routes));
+		if (ret) {
+			dev_err(component->dev, "Failed to add common routes: %d\n", ret);
+			break;
+		}
 
-	ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
-				      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
-	if (ret) {
-		dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
-		return ret;
-	}
+		ret = snd_soc_add_component_controls(component, tac5xx2_snd_controls,
+						     ARRAY_SIZE(tac5xx2_snd_controls));
+		if (ret) {
+			dev_err(component->dev, "Failed to add common controls: %d\n", ret);
+			break;
+		}
 
-	ret = snd_soc_add_component_controls(component, tac_uaj_controls,
-					     ARRAY_SIZE(tac_uaj_controls));
-	if (ret) {
-		dev_err(component->dev, "Failed to add UAJ controls: %d\n", ret);
-			return ret;
+		if (part_id == 0x2883)
+			break;
+
+		if (!tac_has_uaj_support(tac_dev)) {
+			if (part_id == 0x5272) {
+				dev_err(component->dev, "tac5272 without UAJ support is invalid\n");
+				ret = -EINVAL;
+			}
+			break;
+		}
+
+		ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
+						tac_uaj_widgets,
+						ARRAY_SIZE(tac_uaj_widgets));
+		if (ret) {
+			dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
+			break;
+		}
+
+		ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
+					      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
+		if (ret) {
+			dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
+			break;
+		}
+
+		ret = snd_soc_add_component_controls(component, tac_uaj_controls,
+						     ARRAY_SIZE(tac_uaj_controls));
+		if (ret)
+			dev_err(component->dev, "Failed to add UAJ controls: %d\n", ret);
+
+		break;
 	}
 
-done_comp_probe:
 	tac_dev->component = component;
-	return 0;
+	return ret;
 }
 
 static void tac_component_remove(struct snd_soc_component *codec)
@@ -1399,12 +1471,6 @@ static void tac_component_remove(struct snd_soc_component *codec)
 static const struct snd_soc_component_driver soc_codec_driver_tacdevice = {
 	.probe = tac_component_probe,
 	.remove = tac_component_remove,
-	.controls = tac5xx2_snd_controls,
-	.num_controls = ARRAY_SIZE(tac5xx2_snd_controls),
-	.dapm_widgets = tac5xx2_common_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tac5xx2_common_widgets),
-	.dapm_routes = tac5xx2_common_routes,
-	.num_dapm_routes = ARRAY_SIZE(tac5xx2_common_routes),
 	.idle_bias_on = 0,
 	.endianness = 1,
 };
@@ -1419,6 +1485,10 @@ static s32 tac_init(struct tac5xx2_prv *tac_dev)
 	dev_set_drvdata(tac_dev->dev, tac_dev);
 
 	switch (tac_dev->part_id) {
+	case 0x5272:
+		dai_drv = tac5272_dai_driver;
+		num_dais = ARRAY_SIZE(tac5272_dai_driver);
+		break;
 	case 0x5572:
 		dai_drv = tac5572_dai_driver;
 		num_dais = ARRAY_SIZE(tac5572_dai_driver);
@@ -2043,6 +2113,7 @@ static void tac_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct sdw_device_id tac_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x0102, 0x5272, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5572, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5672, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5682, 0),
-- 
2.34.1

