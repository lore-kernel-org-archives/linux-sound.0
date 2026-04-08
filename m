Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82AA37A498
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641147; cv=fail; b=rxdcXhIzZMkMU2K1CqtL8opuVgF1ccwUcL1NJ2V5ITBjiASV1hPtPuL2yCgp4dkevCsp7EjwfcDRnQb7isG0VVIAGyRq/IOy89ZtXVS3nZ47GTS2GV5+zVIuq0vo2uhvhcxefUUam7JfnvnT9M04izpKvagbam8qxkjWP4kH1v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641147; c=relaxed/simple;
	bh=No5AIA1tGMh0KZ2DSRkE8QCtTP7U9myaJ5KiULxGUmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=meJklu4itXDs1t6GhzGCvcabmyqJpZuoaYKpYyrr0RkJPGbGwTq/mls+y9Fj0iG33Jt6y1w3B3oJ/RbrrkydGkXE9HCb3Vf2G+4upvToTYjXn7Vodnb+dQMd32E1F6eRcf/O/OU4mzoWVmBOH6/69bcoqdV8iRItiIieh/FBaAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Kt4Vqcwv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=az0tSWzW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Kt4Vqcwv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="az0tSWzW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eULV683500;
	Wed, 8 Apr 2026 04:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HIStjXGe5BUDoIN9ZWdh3tBkMV1iyywxbx1F5jhntWo=; b=
	Kt4VqcwvFLgHxt6Z9b1W73ZLr4iqXEGzhEIVEv/a1h2n/CZEqrKJ6Rnz6bB90dX6
	L0Yl4Plx4X6K+Gd9qnFucpkVIMb8iOM8idFuILWYyPP5SY9bQpt+GfnY6d8GEL86
	ac/vhI6RtsrDo8lOvTfYOZmB89p4YKM2POLjrUs1XlZD9XoD2W1/qu7PYna+ypde
	wrGCljrZ6gjyzQtZEQZ2yO2MM1BQwRwZ1qz6TnoLqEwbDwzqb88+HJl487o/KFUl
	QsvsB2wpRmVGG28sYrEKwpILfE7+XkgUlqMuHhKTjnskOLZ0RMSnbMu89NhowlMJ
	5l5otMku1waAZR1Mkz6x5w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022129.outbound.protection.outlook.com [40.107.209.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7j1x0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3FCHfar14KhCGJxsVOK8B4uhKCv1UWAuWZfr3lctTVpbOTFVLUc8dLf5+jfTqF/36PRDmTN4+VwTj1dRZ87oNQGKKLLP236WvhTuMChdhOswtyG+CBUMFeDBxkm5ppZX+lWGUDXOFbCjetLCIjgINh8Igf8BStKkms5XvZytT6JqXjT5FKNctJHCcMxcyAogAZrNqWsEIXMviglGefMnD4jcfTTQJvMqlpPKUCIp4kGGPOUDPyLs/HzGBc+ZZyh7Ad8rGypVRFm2KGHjc8huCwvNJw+tb78m7ZSyn9d6Zw71q41zc1kQoL9p34mduoGKmAGCg0VBczWKLwEOcLwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIStjXGe5BUDoIN9ZWdh3tBkMV1iyywxbx1F5jhntWo=;
 b=l2X1bUXaCX5BNNQR8QEWXrIRPpbgv7rvwdfQ7ey+Et9T88sZQ2NVuG++pqDp1pFFrSCnmg6LQJa/RVMcSDSMsNzuU/llgiH+6A2iB+21dQ651esVR1BcDIteZMrNECzLmFVdOmLzRJYhGGiIoPg0K9CwGq8axwt7Ux+zVSzc1nWp73u9kRtMI4vB8ZdPsdpwUuAda28kA8B/LWdAgHcRfkhDr/y2FizY1NS2G0gVpt6nLVB01vqysCjrAgfXn9tirCY/gy3KBWsx5kltvZH5s+Xk3wSYHRJqKjdtj6oGzevB00NF8t1rSwtCXLi8U4I8PKIAnLxaQB1gKo4ELlqf7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIStjXGe5BUDoIN9ZWdh3tBkMV1iyywxbx1F5jhntWo=;
 b=az0tSWzWQ2AiTZw+oQLuQbheKXrYVeKtpWHP18FB1yWP4iPsGnfESl8L9Nn4F/huRRn2hQfBvfBbKlJHpLUrv3jzd4xnRKSCPcSGOmnorBf1uaN71RLwqVWy6CUZ7Yjr3AKjWO6ie2KcU/4xaH9ttGpjhGVomQG79QoQOGnYBWg=
Received: from MN2PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:23a::13)
 by BL3PR19MB6443.namprd19.prod.outlook.com (2603:10b6:208:3b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 09:38:41 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::85) by MN2PR03CA0008.outlook.office365.com
 (2603:10b6:208:23a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 09:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BD971406542;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DAEA82024B;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/5] ASoC: SDCA: Fix overwritten var within for loop
Date: Wed,  8 Apr 2026 10:38:31 +0100
Message-ID: <20260408093835.2881486-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|BL3PR19MB6443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c383408-6023-4e4b-7bd9-08de95529e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Tbif8eGEhoN4+Pma2uSMxbQIFd3QfFHdq4EiqhUt0ZkdDySbUrPR+9LtId29zohpAGbkLs0g3dq64IQyCJqU3ScxGdhMtv6bY9QOneKHuKdiSw868REgxJ7TRJwRGiaYE34J5YiILOecAsmk46aV5KE3deEkIFF6H7c6dDaCLdbwt6TBZ5LVVwxBFqaKy6Fg6Mvn6i2spnwEzB3xr1la4j1qPh0JQO/8fEULeCVdd2hwrTgZuHFJ/GstzxT6oB4RJ3aNbnEuJBmsO6oqPUJFlO5nKuvZrTu4tyu/MN7ufx+wIKrNCgugRoIFo7JSidRu8dsJ9MKabc9BTLgFzYL3TqhsqAanQzWLC9zV+Z0eYsxa1wjd3OF++IJoiz3oODwKCXrHF+86do3WsouSms3M5Xeft1bXPvGnhyp3pm2DTqSd7wvUQivkkWw6GX3IYVpbG0nXP3ci20mc5hFfsven9bzX3XBryuGI/4piGeerwK6BT+T3RJg/ygPia+Vq2YbE4mS0ZgzDfkDf0khCMkihrtm1Ve36gqlcA1ftGAIlPHdSCIeDOxw6XCMamLJ+lwDaUnzpCYKkwNcFxKCVCLFInd9GEQUxf+1OCUYF6ROxCvhTDclMkAl33eg5WZxqAj0XcJGDANOMY0Rd9bGxJE9EO1AH9yRGNzSJa/8h75pn7eio/k1WG8jB3tYMfTgD05moZDUrtUQxbY+qIgEGN07yEX2djfm9YDgH3yuC4nK2P6t65xt1QWtthJGF6NAe1f+nYvOxgb16E7ZN75Udyawiqg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wLa50vH791KnLznXoBWmLHiNqtVzh1ZmRKetXGH0tW9kxZTgy6mkHquYCEJzyzqDDuqym/CpmbMB53HzHiaMqF7/WfaHnsuI1XJwFMQ1f+QA7uOn20xtlnVdviT9tEIUZfSeRkJZto9I5woije3pie+KTIThVMYSMzy78tSZpMJ6ifnXhTOnqiFDgLo/iT9Q5Ppt36lQNzEueUCS4CH9rSyPx9lHYb3Wa/BBy9zZ0kfpH/xDbWCQqcS1DeeFjmR6GVsajdbGe1tf9NhXa15cWyfxURhtWWmoVf/5asuqxcUdTuyvQB0SDnrDQ5YeWSlsHiBRnBdkKPRGGsHWXqxOI10Ew0bzZOg2eVDB5GaDZmBGgN6d8G0fModZ+uuW9MZqnKjn59LoWITlIzfQd0GtvnnTtp6xWCxAJJHMIRKP3O0UPgXiOFXiVi1giv2AI3t5
X-Exchange-RoutingPolicyChecked:
	sg9w3ixg/pPUfN+ItoCyCNHizVu+0xMTDZFIjtzBrKCF4L80G7i0gV1cJiAch8DqNeaaMksGY5ScNupRiLR4JG4R8abhwYe+tqkxeqEAiq/cztH6XbrOZi/JkwkrDjLrSasodo4g9igMcqfB9dSS3syI/sSaF2kW9ix2DQvMMfEyUuZp6S/gfTQ/vtiQJ6EFTvxiZSo84aX9I2rCJDfGfZNkr622gL8RWGWCpycRgu5xEkKNp3kdZDc5HvQ9nweiZ73kwaitEcutQ/sDbg0PAatkNQxLfsg6i4hTJrbGO7aniSmI9Ynqe+GG6u5wnqB1Hfc9rxa5cUCtdJsc83JyMw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:41.2037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c383408-6023-4e4b-7bd9-08de95529e9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6443
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d62228 cx=c_pps
 a=6Bt0GI45FyvFQl6hnU1EVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=0qRfNv-9e7SNSmDTLn8A:9
X-Proofpoint-GUID: g5UVPn-CpW3t5Boo97N_NQ08iW08U3ZK
X-Proofpoint-ORIG-GUID: g5UVPn-CpW3t5Boo97N_NQ08iW08U3ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfXwqBUIRwa1y+Z
 HH/Bs10OFeV9QrLyhTfJfxGfEIQ+wz4366qvo91Ofs1T+BXVpDXT1LZiGo3YSouIwfdtNPciP44
 9n2e8y0gbN+BLrT3iA7DtAVCSPWkxiGRXHK9TjL1zJSLZn8dxumOS8wAlrfD19WvcH+2oUyldw9
 GLWm/M7Zp0lrE8RLiZUeR0iIaCS4DpwDjFbuB8/U+NgL4FATZc9zGnrewTgwA0sQgXXZErOMV2v
 YJhJuC8O4Si9yNw4zS+26TrbNQ0aZKsqql4gFzHSgM3ZZYIhV8YD1ZTu8XNElkkC18s1isilYh/
 BFvgoDRTwcuanuasy/vPuFaS7pzTFFBei8zdf36N+0n5wj/daCPhS5nk98NWIHRhQf23vapqsGE
 m+4oHcnlV/ZgiOf7+BTuH0mCKboHzbFr2CQgslI7l84nyh8QLDh8eSciT44vpvSF7uXrGr2Tc26
 PlUc6gqDihmlpR2yHHA==
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

mask variable should not be overwritten within the for loop or it will
skip certain bits. Change to using BIT() macro.

Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1838dabcdf604..9acb0be84674c 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -117,9 +117,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 
 	status = val;
 	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
-		mask = 1 << mask;
-
-		switch (mask) {
+		switch (BIT(mask)) {
 		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
 			//FIXME: Add init writes
 			break;
-- 
2.47.3

