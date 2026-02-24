Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F1395DBF;
	Tue, 24 Feb 2026 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938223; cv=fail; b=Kr2vbv0TT3vA6Jzb4m8L9UffrBfOJ4BSt7l/jGIRlvVtuEwICM9QX1jKsK+uis9aonBvC4QUNAZ/A+UqRKDIey2U3yTkNESOhnK9mCqMKwtS6/M/G5I0yHe0Ho04/r9WJ5S/FOr6UKo5fyO/loR3FSFb6sweTCsc73KEHe0q03g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938223; c=relaxed/simple;
	bh=w2ETjqmT2axlA8U/sh2cmIDfdMeLXdv7FJGywBKy35A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YdO1iDY5vsdKRzptQ2mYKKcKge9TMZJ2nILn6WuSFdc4M3WjgeCwHNz1GQslt/9f/tcNyrJ0lBjZgMepmF+M4vdPS9OuMcSDPCE7OYhOECWsm2r4VCBcW1KB5SPPV0wjz/wy7CxEKJM/hHZ80eU5RjCH3in+6D67y9NqicJfG10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RfU9FDiX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=so0lDipM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RfU9FDiX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="so0lDipM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4w6IU3523456;
	Tue, 24 Feb 2026 07:03:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=euPmyvkmUD9rKMLF
	CNACJ2yfKfXFKsk7qfm7DTrTyD8=; b=RfU9FDiXYAVK+iL85Y/Touv84RnIs8YO
	uiSWhm6Kr8NOunj7R6lQhe5BY4OlpLrmBnc+jUTN4KPKVadOy6vq1oOG7LbDN1Ke
	jeE6W/vwSsjKPREWryHTmBxDLEEi2YkTyZ5lKV+oPhKA/xEcroapL/iB2T74ujDS
	Lml/TRXnb9D8PaYxc6yXcMP41wOLznzgoIa2r0iynHGGj/f1nplEA9ScYHGyTiWs
	mdyryKE/6Gm4XJrk3zbVjhnnzxoWE9W2hUHOnxHksUJSd0tlrtQ18p/Fe38PTFMX
	wkg2LcpeXMka3ZzCiUWhCKPlR3udkwHpIBbAdwxbgkKO0tpjvV9csg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j2tyq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 07:03:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/MIwywXJZRIc25tog8qEGyq0dqGH0b2jwsJneM1CAeIKPtOe+pk+ApUL9ROMVtDhrUkxqJYsHk6IT0ixvdKb0hSEmij/22ZXUIta1F4iRncCOhXMni8dHG0YPPK3mcZ2QcnTESYwjfc7W3t99jx09Y2n4q2cWR9wqsgznKq2AqDnVSgfYPSaPxv8h6/H9ZjbjJPKu16d/3ztq3ofrq0QGvVKo8WjuJrlwCsqkzp1I9enHPLx6jSDjBuLxOXMgtDT2/faKZSdtdk9owVrvqF4qCIieoAaaVdMhMtNVTkhRtAQdhr4rargdiAYnTlDXYfjk5iGFev4Yi8xKFaJT7nPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euPmyvkmUD9rKMLFCNACJ2yfKfXFKsk7qfm7DTrTyD8=;
 b=U/c09DhoD1w/OjpfGo2dUqHgLkpzWjU5hbcvuJlfxSCoqrEtPf9YsKhJg+GFAVh5yGu4IdviP5y/veh0VsoJcj5rx85TSxBh5QtvWDpXet/75ysdCKWgBawm5ZYrg+81zEplP8rTazTpVALjhRt41Z6Ay8+B5pVPBhpNja5ymebtVrcWNzI7O2Z2ir+PxgUL6lNwu6YxI87ZTUat8n8LTXNyePrpORbGgxw7Awys/SHsRT+uDAZcAs0l2u9Z3n2H5Wl7vLv9HpJRsvDomPhcbHEL2VwfRuJ88ek6XFsvMPa+yKB5B12leiBLIUSvYpZn1kVtQ8ZJcK8A5dlbFWAWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euPmyvkmUD9rKMLFCNACJ2yfKfXFKsk7qfm7DTrTyD8=;
 b=so0lDipMhU336OJ0HU0l/p9/0DVSV90gXbTs+lj+pOsyC4d6gEhRnNJEaHrhcs/SqVuyyzMF8ykIT2VNim3Lc9txgbd/JlfwZShH9pCXjA3KYj2reIcEKO4gqS4dijjYuc29H6J+gJvBw48AmeHKslBmCGnLryUXtSD3oi+E/8k=
Received: from SN7PR04CA0080.namprd04.prod.outlook.com (2603:10b6:806:121::25)
 by CH9PR19MB9323.namprd19.prod.outlook.com (2603:10b6:610:2e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:03:19 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::47) by SN7PR04CA0080.outlook.office365.com
 (2603:10b6:806:121::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 13:03:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7FEB7406540;
	Tue, 24 Feb 2026 13:03:17 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 18DD182024B;
	Tue, 24 Feb 2026 13:03:17 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts
Date: Tue, 24 Feb 2026 13:03:07 +0000
Message-ID: <20260224130307.526626-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|CH9PR19MB9323:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1030cc7b-001d-4512-a670-08de73a514d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OC21BNYVKEUj2iSUU0V9VYU7N+sch1js5hV665PQ50faOsZvm6mZ+8KUwXn7?=
 =?us-ascii?Q?W6JQrB958d4gTaFe60vuGyS47lKpzW6/GiP4Tp59bVebqcu0Cy7dKdEBFdhM?=
 =?us-ascii?Q?bOcOy6Zch7kOApvb6bStLkgUAowA98Umw/v915ov0eEx58vJEWrHByUALlzh?=
 =?us-ascii?Q?KbDkds2F0tM3jGl8TsJieX6wDxVxL+m3aLZp3pZf57SqfP4HP6zyB9rlJ17Y?=
 =?us-ascii?Q?Xam8itjRIq7zrg6NJzHmM6DeUgCZ6RyskZiHkSWSKTOBjRy0hxumM6Atppxa?=
 =?us-ascii?Q?jlrTOO65Y+dk08FMqGlsHm2wcz1IR/XYUJj4Q2z9GRcDpBFLY/Fk5DVotDu4?=
 =?us-ascii?Q?Uu7/He3et1sHsaOXN7IOf5dJHmbBgwFYM9GAYzJh0NUIZCuKpOQZYjyudQAq?=
 =?us-ascii?Q?ZO3eUPqqvpGr+qHuFRo8yckOZZds6IB/DFAfik+Kae+moXhWoG9dbzZuDQf/?=
 =?us-ascii?Q?wi3hrUZ4wms1XqF1mnPF+huz1AztSRQTHFzarVPasLSo7Gmv1t8qSe5uJOMp?=
 =?us-ascii?Q?RC9pydED1FqlZW4ORExOkfVwT5VPQmQ49Y5InicPqNt3vC9PQztTa8yXK+tP?=
 =?us-ascii?Q?VsSCRsTgp3uEKVsZjdc3fY9SnXV96aZACd9S+sS4bxOkhr7q4+YtwdwYjtcO?=
 =?us-ascii?Q?jt/GLBb7o9qsIhFUHyScTkARZPZVDJGNV7gpZ3bW8+2xOTivOAmtLihOBnUa?=
 =?us-ascii?Q?ELwf4v/u2Fdwq38IPOn6PaKU2O62C78xbQ9QftkwbAmzxBlOsDlXEHINsS0M?=
 =?us-ascii?Q?VbJEm0VzA0eO5/ax3DuhI8WdkOfeJDKqXCDAM8FJvnaLo7yZKXaHU2k4scDF?=
 =?us-ascii?Q?IcWOxiPq8ZApT6Uw8Ui+gXfQSfqPC7pLOFSeatXtgf4aYD70qQfMrDxhB+I2?=
 =?us-ascii?Q?D26W/03w05ap344fj3i7ldxqrlTM2evZqgdwE8b6LjwvrumEvOX09a1j3rmL?=
 =?us-ascii?Q?tp8i7gWBCEOgiN/3jJOa6eP3ia+woAnbs42eec9nJ/4ksWoOypyJDOVamF2M?=
 =?us-ascii?Q?98U8EmYRuMxzVHljmvjpGPZE6R5EDVxapBz5OJOTYFhihqSNggEsQXzbVmvV?=
 =?us-ascii?Q?Og0S/cuA3TqH1JaVnEoFNbu60BgbVus63RPXGf4UxbHlsSkPkcdSqsAzI0Bt?=
 =?us-ascii?Q?dMSNtqEv/qMV6TSfDIv5Rd/hXTJHtJh+ZfJne/sPfC/3LrTHrwivP6dcChsL?=
 =?us-ascii?Q?4DUhyQCT4LHX5s1FPjuqZIyp0jADMAhJVStTE/Ivl4dTIRU9iN5rVr6CJZJK?=
 =?us-ascii?Q?tYGG+TuvyTF8132rhDYo/jz+ICZmgU5LYVD8xhcPq2rzgRtmxook9EGiFFRy?=
 =?us-ascii?Q?29fa+MdRSHK+p5g3fKs8c6FrQ8kHFiScgnys2m4eZHxZrez9gSbavjgmEJGj?=
 =?us-ascii?Q?j09dwhGmo5rX73NaHl1hIEK17edn4CweYufInB2B5dl1QWmsbLfB+mpIdwCN?=
 =?us-ascii?Q?6Z/mZACkZiojcy5sFwkqi3kwpYgHNQYs+ZQ7LUo+n1UzjjSIJQCG2sxX1Buh?=
 =?us-ascii?Q?HEOvK8AZvWghNS7kfKcxi55YTSTPlRS9vkCkmdfcvElQCrTg5yzY6SSxiUwf?=
 =?us-ascii?Q?e5sAou9SNUwbddI7+zj/bi0eB6DMSxOPTXV8gYAZaVwcZUP8Z1+BhU7d/WWG?=
 =?us-ascii?Q?iOD+zDTA+y0N9ss1wsNvee8AB6OaGV2PZj7Tw0F6h944I5qGXS60K8ZQbvPd?=
 =?us-ascii?Q?87C5mQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2BgblZ1QblR5mMauB9QUx3dW1OOAlr5wH4sIylfpkW0UR5gfxU7zkJbEguVSxvqZ+yfEhDfVqvth8pO4Oh2pFrWgyKfLfPRzRlKD2nv8sQc1oYmv1v7hkGgnHUl/UBSHjxBJYSj92zJBOZ+IHBXWCY3Wjal3z40e2pZF/OIlR3xAmDkgbWfqLvg2fL67uYmZ2tVXtMD8SQVI0GQVHL3U2+bHntvRikvgxi0rRXbSljQ58FyHxtRW0ARnIm/RoOiwlNN7NTZ1JX/5V343eUUrxQ38oTrf5zP5Z4ZXPEK1nD1eEEdDM/cwpz1uTadVtKu0XrQwsgEvSpkW+CpGdZULUNDNEsCALpu108HiPosJqDmkSLBPf8utjKuhCZumI+ktcglUbK0F1rXIRB/weKfgbHnc++bX/U/dl/ZONssKsIvIGM7i39oQQ9JgweeaZKFG
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:03:18.6542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1030cc7b-001d-4512-a670-08de73a514d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9323
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNiBTYWx0ZWRfXxA/FHeUPBQSB
 2K9jpNKzWl6q2ZVbmpKXO7sWP1y8kkTvs3ke3twPLjvqrtiPw0ebbWNEyQon0HCjwF9carrgZRJ
 RKAqxIRcW9mN3KePMzl3EkRMz1oV8dSLiyTeHBfMZxpzGWTRGGZ+oYVuocLtA401oACwmXCN/lz
 hI415QUmYKSNwW+5PkwYEdVo4uynnoYGcv4W/yAVJu/Lwwym2OwcBPG+u11iZjr/IXWbIh/iVTC
 Ml10sv3lhzybZGAtLMgMY47BH2wpjwroCkojieyV11mkDi8Ouv/ZB4H3YQmRIJjNtBpc/8q2PPO
 VQChQDRuWdZpryAfkLw02s3Ux9KQl4VC52+14zyyt1WtEJ6vmLxKV+cpwnU7pCuOzkxZk0K8fll
 bB6fYR+bIo67r/pUnZjnOXtuXkUNx+zAfPELtCrpvEE89EL4D/xZo/BeaeQnsP0T1Rswa/whaCh
 wjlF1KgzTUZHaxfcD6w==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699da19a cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=LpToAOy32NlWtQKz7EAA:9 a=WonHw0LWvj4Cx2or:21
X-Proofpoint-GUID: fL4Mj-Ixpa5zTSxjcKxv2pHBbA8oTgsI
X-Proofpoint-ORIG-GUID: fL4Mj-Ixpa5zTSxjcKxv2pHBbA8oTgsI
X-Proofpoint-Spam-Reason: safe

This adds some match entries for a few system configurations:

cs42l43 link 0 UID 0
cs35l56 link 1 UID 0
cs35l56 link 1 UID 1
cs35l56 link 1 UID 2
cs35l56 link 1 UID 3

cs42l45 link 1 UID 0
cs35l63 link 0 UID 0
cs35l63 link 0 UID 2
cs35l63 link 0 UID 4
cs35l63 link 0 UID 6

cs42l45 link 0 UID 0
cs35l63 link 1 UID 0
cs35l63 link 1 UID 1

cs42l45 link 0 UID 0
cs35l63 link 1 UID 1
cs35l63 link 1 UID 3

cs42l45 link 1 UID 0
cs35l63 link 0 UID 0
cs35l63 link 0 UID 1

cs42l43 link 1 UID 0
cs35l56 link 1 UID 0
cs35l56 link 1 UID 1
cs35l56 link 1 UID 2
cs35l56 link 1 UID 3

cs35l56 link 1 UID 0
cs35l56 link 1 UID 1
cs35l56 link 1 UID 2
cs35l56 link 1 UID 3

cs35l63 link 0 UID 0
cs35l63 link 0 UID 2
cs35l63 link 0 UID 4
cs35l63 link 0 UID 6

cs42l43 link 0 UID 1

cs42l43b link 0 UID 1

cs42l45 link 0 UID 0

cs42l45 link 1 UID 0

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp63-acpi-match.c | 413 +++++++++++++++++++++++
 1 file changed, 413 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
index 9b6a49c051cd..1dbbaba3c75b 100644
--- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
@@ -30,6 +30,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1
 };
 
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1
+};
+
 static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -103,6 +117,345 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
+	{
+		.adr = 0x00013301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00013101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00013001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l0u01_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u01_adr[] = {
+	{
+		.adr = 0x00013001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u13_adr[] = {
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013301FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x4_l0u0246_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003401FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003601FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA2A3B01ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
+	{
+		.adr = 0x00013001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	},
+	{
+		.adr = 0x00013001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00013201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00013301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l45_l0u0_adr[] = {
+	{
+		.adr = 0x00003001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l45_l1u0_adr[] = {
+	{
+		.adr = 0x00013001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs35l56x4_l1u3210[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l43_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_l0u1_adr),
+		.adr_d = cs42l43_l0u1_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l43b_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43b_l0u1_adr),
+		.adr_d = cs42l43b_l0u1_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l43_l0u0_cs35l56x4_l1u3210[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_l0u0_adr),
+		.adr_d = cs42l43_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
+		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0_cs35l63x2_l1u01[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u01_adr),
+		.adr_d = cs35l63x2_l1u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l0u0_cs35l63x2_l1u13[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u13_adr),
+		.adr_d = cs35l63x2_l1u13_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0_cs35l63x2_l0u01[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l0u01_adr),
+		.adr_d = cs35l63x2_l0u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp63_cs42l45_l1u0_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp63_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -135,6 +488,66 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
 		.links = acp63_4_in_1_sdca,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_cs42l43_l0u0_cs35l56x4_l1u3210,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_cs42l45_l1u0_cs35l63x4_l0u0246,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_cs42l45_l0u0_cs35l63x2_l1u01,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_cs42l45_l0u0_cs35l63x2_l1u13,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_cs42l45_l1u0_cs35l63x2_l0u01,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp63_cs42l43_l1u0_cs35l56x4_l1u0123,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp63_cs35l56x4_l1u3210,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp63_cs35l63x4_l0u0246,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp63_cs42l43_l0u1,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp63_cs42l43b_l0u1,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp63_cs42l45_l0u0,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp63_cs42l45_l1u0,
+		.drv_name = "amd_sdw",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sdw_machines);
-- 
2.43.0

