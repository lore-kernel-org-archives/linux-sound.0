Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48291A5BA4
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228406; cv=fail; b=IzZYSdiGImB9D0+9cYMQ2nVSX5jGorUkdasm9kUd6MLlNEXdTMfPoYd+mJPI0AmoQRpEgD1OM94KJhDA+mutW2MA3HztRUPFR2KhjYO7sPZHszESA8UL3RJoHTvqLoFyUsvNripy2B3Zb4RQgp1jiP0x0YOaDFUpVntgcKCjt/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228406; c=relaxed/simple;
	bh=Nh+xFxydOSVzmL9x2hUcOPF3gvqF/cq1Mulc2bvUPU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ro5TuvwGSOKgvlmJFiwB2sWhDmH3QnIAPu8PD5p1zPt9DCpQGET1OAWC7JURix9dp/IzNJPkR0s+ELmOaLBAAW82JxTiSQbAkl+4gK9ZXRJitGHE2s7UD/QL+rPx9TC55O+S7Fxv7IRmNLugvkJRYxyeke2tpDuEFK6gKcufCzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mNo1o+/c; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jA94e61V; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mNo1o+/c";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jA94e61V"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5jAKF028134;
	Fri, 11 Jul 2025 05:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0pMju0eMA3yWG1t8
	O+P7kaOngDqd/LFwNhC/5e/wuIg=; b=mNo1o+/cFV3yPPpScHHIA4hwpcFVmAaz
	yOE2kJ2kr2mb9Ny1oa9u0Z6VO96qXpAE/ye0CCxpunOKkvHOu9UOkonW5FWXA39e
	JRWVtSp08QtIylRUNGrWtouiW4YLV9ctSW4yEiFV+XhKYeReYaJqtQ3KYm++tUIX
	3YXevZ7DFl40B7nJ6IfnjcDwi0Z6f8kFxJk1UYvUnfqx7+vR7mdNXie6UiVgVHIm
	lgmpiqCcHx4pn8w/CnEi+kV4WNpPqJIMvRgd/lInKW7KXTxUWWJdQD7MlmohzoEb
	L8yKqk6TtL3AyVlbgrBeTvlL8kY2aO0ZwmudQmsuDXJqBlOLfHzdxQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2126.outbound.protection.outlook.com [40.107.92.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6dy6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 05:06:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9sy7GF1YF0uWOTB48fmjPABRzIhPnI0XrKx9eQiLv+LwHpx1z+9IJbTgG36LuWwW1GV/iQq0sThJfK/n4+M9up357p/ru5kZ6Rda0EcpZHSCaDpKPEVMoNM/UaLRSnfMyC/6HkyigsBntKY3xopPUu/dBhNFCUHDHPDO3dmKZLy0txPapMHWuhhUqDn+myWN2hsLV4ceigPn1deg//XEDDDFPG7BGIgtMY7BzHRD+AICOHPlRAYAJTU3yULUI73BXaIO7esQEghCmFer7Sjp4iXb+f7jtKdSU+QYwlaU14zRXYtUcCFmDal8O/3Fj1tneY3EH2wJXV4Dw7G3+jRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pMju0eMA3yWG1t8O+P7kaOngDqd/LFwNhC/5e/wuIg=;
 b=lWj/yi99KNEjwz1JlpRY4HlRREAE1wd3h8OmB5VhRG6f4GhvUzP5X0PB9VVWKiJBC1UjDtMeheLPqcM7lrfYTh8QKTV6Nopu/+7g4oKzdgfk1eon/PIhucrDdx6H5x9y1QiF/jZl0Zkl37WSntFyzJlJQNAtOILAsjxFsFGEwTvpeRIvWOLkM6fhO1rSmeIenRtamXXtNN2sMkwRdnrH+VE8vr3xUlaAMhny1HVNQb9rtHfTc7Xko61tQV5QWznzf5hB1DXl3UtFI/FIn5QWR/IP547ro+DRI1oZM1Mb2ev9qFLre4WIw0qUuVr3cprlPfpUIAKgj2ppuMlLKFDBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pMju0eMA3yWG1t8O+P7kaOngDqd/LFwNhC/5e/wuIg=;
 b=jA94e61VGHcWLXF761KDdBb0COSUZ8IidLxLHkDKT5wXvGaFIzIE0HIiq8bDws/dVJUNDkRj45X6FLxQ0EsRd/v2alkP6cQdKML2U7ysXQTJDP5uObyjXIWuP+vxFvZH9WBCHhCQGcJlIM3yDXjQd47wCMQBD2OsiX/Eu8vMkj8=
Received: from BN0PR04CA0186.namprd04.prod.outlook.com (2603:10b6:408:e9::11)
 by SA6PR19MB8675.namprd19.prod.outlook.com (2603:10b6:806:41d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 11 Jul
 2025 10:06:22 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::67) by BN0PR04CA0186.outlook.office365.com
 (2603:10b6:408:e9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 10:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.1
 via Frontend Transport; Fri, 11 Jul 2025 10:06:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46A7D406545;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2159C820249;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] Update SDCA Kconfig
Date: Fri, 11 Jul 2025 11:06:14 +0100
Message-Id: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SA6PR19MB8675:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad49fca3-2f71-4c5e-3683-08ddc062961b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lKTu+N+wwVDxlfjW++y8ULMO+umTYveaXM1Pnf4oxz9E4XPJiaUF/oAo8CV1?=
 =?us-ascii?Q?zpyqT3TSfwiXSL4wiLmtTYDZE2Hx/2VnKmnarKlt+dNQ7DL7VBAqPDLDkdEx?=
 =?us-ascii?Q?hCpfN8J1ULYNTHQ5fe9f4OdcIVUPnbhdoyze+ZUbEDK1NuxlTO1qLjknavJq?=
 =?us-ascii?Q?DCTbwSM/WahRgP/c6b9kIbbOzYLzqCJkHdK9ThA8A47qqlLiRh2G+eXSPqK9?=
 =?us-ascii?Q?PE3RYXXA7o5xgIXc2idKohT41TTjTdBFENwOAE1wl2vJHOeeso1zkMFx9uKq?=
 =?us-ascii?Q?cfBYZLPRopUWH8IxnHZMmuWZUas+TyR+HItLHqhJ6LV67YP6ty0L9fce8DpL?=
 =?us-ascii?Q?eNKlFo/Dw5y6DFNeDzTlFrJiJh/Ou/zo9WsfFI85I03x4at5GmwS+oplOzXF?=
 =?us-ascii?Q?xzw++MZLir0wvAa4kgLAQtpzrHs+M3POggQn7dlY9BNLRxKIaHqWsKAEa3K1?=
 =?us-ascii?Q?Iqx7d70OjvGnpE7/KEgYB6BWI+Bw4jMlwbq2OZk0xu70dmaw1s5G6VZQHYrX?=
 =?us-ascii?Q?fIOBNh4MUmFWMhvoY31Pqg2MTKiluCmQo98tsIPqtEnLDAqeoXkV8e7jNLGh?=
 =?us-ascii?Q?qQlJ8tLpVcETNpfCLM79/+nrYg+enwIb6UnWnebRVbvWqztnEpntRxbkS8yH?=
 =?us-ascii?Q?kUrb8yTZNHUILnpz7mZl+O7pyIy9wT1oHNvpDqKin6syYxmJcCItlHCFVDuv?=
 =?us-ascii?Q?Delihuyk8vWONIzWwuJ9gROJd60hy5i4ScLyDYC18iCLUSOLl7rpYdRwFy7b?=
 =?us-ascii?Q?vQA1SfMqCle8xkKa92XuVXOple/0Ce3PWAdsuM6wiyg/gUQIEh+YPVWojHiv?=
 =?us-ascii?Q?/kWlQZ3aJYV9AguxGUBZ+XzwA4Uyhsm4Zr2qRnS/FUVzweWJ8Uy2ZmJzDLjn?=
 =?us-ascii?Q?84/Jgz8irza6XHkvKxaKJEE/ztJeHMorhRHcUNNG9Cu+gA+4puigo/LdGNNe?=
 =?us-ascii?Q?fUA/6dhHjJDg/DQqUek/i20vv/LBdy37Et99G2PorWT+Mb6x1NJqukyJOYfJ?=
 =?us-ascii?Q?wpRb+LQe1vgMNGIFsmsycNuwDo1rQllRbagn/3hClnoAFB9F5CwtqM0O+2/c?=
 =?us-ascii?Q?mO2N18dJWZnOHityMsKAAhbA9DI1XrbXX96A+Rba1tMsoOJnWec33TJAEjWU?=
 =?us-ascii?Q?qhz7nkas5g+J9bvrn82riD+WFntdKQIhLm5d0ouYWss0LTP6ifo1PN6gPQZ4?=
 =?us-ascii?Q?sEhbstYyYXdan/bmV9GQNvJyc2sivsg/8oMZ78TjLzvPZ7pE59ys7Ibw+CJb?=
 =?us-ascii?Q?uGmx6VNdj1d9oQGgqo53KjkSc/+zltqnLBrGM4v4klAT2Ly0MbRjTYrRGXsG?=
 =?us-ascii?Q?tLanM+92/Noci3f6agMj6QRGclUaQVGapb6waf2PzrdefA8Dh4hK0OYTi+BP?=
 =?us-ascii?Q?1obC0mbjWMyJmeQxxOQp9pRGKjeeXXucV62j8XppmO3IJKPeUzJqiHgTRUbI?=
 =?us-ascii?Q?GjVa+jIU5Z0vCI51pENbvVXU12HCHyzua73VWgMMEef8q7leIbXb3UHb9NQE?=
 =?us-ascii?Q?VvIKD6quWCGh8O1qMoHqR+Q7Nir1TMVPV/Y7?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 10:06:21.2020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad49fca3-2f71-4c5e-3683-08ddc062961b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8675
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=6870e225 cx=c_pps a=va/c1KpByD+DTLaclcl+AA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=gsErkJAJOjhN9HM1uo8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MSBTYWx0ZWRfX+Z5II8iyeuy3 S07l3XOdHXnmsgI9bH9DsR3bwmn9BuvX7V2WXJegTmqXp4gHdSo6u1bv8la+/Ksxv3rSYcNzUAC j6E+g4L5wKyJV/8x0oS9tS4PHzZJLmNZJI28KRXR4Cce75oFVpxz2126uMIqQEcXnsWoSQTPf/+
 n8lMkI6cLZM++9BU2RffL+/AbaM/OQGPOT+c+mffuB4QClvzkf7+/jim1gp/seCbqp2WA7VSi2I VckFU8WkrZ6LlC8+8/9r25jhKs/AyN5G6NPBzKDL349FjELSRLtTXwRTdH5/tD3P1W/3J5IVsG5 Us+Xvq/6Bs6GDgCvizOJDOnhM0Mlx33pXG2GAFisIASXRu0W8fQhyrsxb/i4qPnA4d6LY/z5D57
 kOQK2nIq/8llc0CATf6h4KXt08uHteaLJBQKjrMGBZRRyBQkAfEkpJ1q8p1iq7q0WGxR5KzP
X-Proofpoint-ORIG-GUID: 2RzDZu1B5IRi6oOCMCd0IiDG7oxi2nhi
X-Proofpoint-GUID: 2RzDZu1B5IRi6oOCMCd0IiDG7oxi2nhi
X-Proofpoint-Spam-Reason: safe

Tidy up a bunch of makefile and Kconfig things, and pull the HID and IRQ
into the main SDCA module.

Changes since v1:
 - Don't expose SND_SOC_SDCA to the user
 - Simplify the makefile bits for HID and IRQ

Thanks,
Charles

Charles Keepax (2):
  ASoC: SDCA: Kconfig/Makefile fixups
  ASoC: SDCA: Pull HID and IRQ into the primary SDCA module

 sound/soc/sdca/Kconfig           | 13 +++++++++----
 sound/soc/sdca/Makefile          | 12 ++++--------
 sound/soc/sdca/sdca_functions.c  |  1 -
 sound/soc/sdca/sdca_hid.c        |  2 +-
 sound/soc/sdca/sdca_interrupts.c |  8 ++++----
 5 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.39.5

