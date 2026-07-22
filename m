Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A0339396;
	Wed, 22 Jul 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716519; cv=fail; b=YoNQqSSC+bev/rDIz1INl7jaAfJEu1TRZ0uC4WrRrBAOoeoC+MfdJsqELSi8BrMiC8h7KZlMEtzRC3w34oJNCDNgQjXPUNze9B6AEchvpGSDjIDZYplah20jw0ceN925/eCbSe5Fwb/55kev4RSBL7YHT6XH9ov6YYJ3JMnoFoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716519; c=relaxed/simple;
	bh=ZCVilZr+NmmqWDznDMoK0y4gX62yh0H42kVhBjfNic8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bDmRVYhkNjv10vMZbsgg2yEk1W5FqxhsqDo+lQtOCjIbOJDgJr2LnuFCLY7pLNkD41+sFHcEzqX0dq/egdVhvj1XCsPzgjVxDDk9cx0ByJa990AUeELKiX4ID0LmLgi1o5mcNJ5PQ7QbS/caflL/MkHmZHys4qE7aLe/xvb20hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nyzZE/AI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iciTj9kJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nyzZE/AI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iciTj9kJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M0Ztm93730902;
	Wed, 22 Jul 2026 05:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rPX5u0tCuPO3g63d
	LlHzJqy7DOUQjJ0zjFGRlb+wayQ=; b=nyzZE/AIOL1VF4Hy4OZZ0wrCJ40wI024
	LxLkoqeEVF61WJN/fYZodtjGMCJTwRO6+kdcG91ZGtJLLRmDgDyjj6zkh25+Rj1a
	9EXgOfQ6YFtp1Lg9i0mdmgqDiv3Rm/ACmXl0txoNhW5J9WNONRMq5jWlLHdDKZUn
	mf4cT6dIoYc50Q8MN5Rmje/jSS1+ubMjhudPeIqkJD3fuby75atXDiG0sHJ3OpnY
	uCOKuCUISZw1UG5s/1IKQaq8uT5sJkJybAVrAQBfb4LFJqFcIhW3+ru04w4TJlFG
	3JW008GEc7pw2fh+mAEC5rtvZWqeuzEfhjfhmqQszFkSr5afyxoMDQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023113.outbound.protection.outlook.com [40.93.201.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vynn2y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 05:35:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxSryp+DFNehT7DCIx/jm6Dw3VWj/pJofmeDtTzAg2OsAPquf6DNNnd15lkpWBY04nuPPM6bW/2WokEfzoiSptjC/+DUp+dWWfMtWEpLEM1nxXzCgTi5jf8Kt1iuFRNf9WxF8uW3AEsNVNWxJV458T+SUCnmayn/1YFwOM4wOLrmqJLPgNvNhqyrfPqZP/Oezath8k5NSIii5VtS7w//llvBKKb55r12869XDGLaA7J3QNnWL6/q4F46rwh20Ev+wKvm63Z4uiiy4GsYON3KZ10CQvvcsQXX/tk7yUEl4CHssYJspmiiVfm1xbd3m27TsCeq8QPhJCNhghfiK8E2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPX5u0tCuPO3g63dLlHzJqy7DOUQjJ0zjFGRlb+wayQ=;
 b=AjOJSwngX9jfoZ7DupORswHz+mlH4rrUsrPDARmNABB2rCAXrF7+qg3zCbbafJxJjH2Uj+bZY8jwGv4lTJs/ewj5LBIiZJ4GO7PatvZmcxRmmUiUQ8UbAV7AKiuhU+yrMIr9l+8IRB6q+uApPuMi4S61j+Z8MFg4tUhHv++dTqrny5179g4xmGEIejTgzPUsU63Vdwx0BSFF3apUdrTzpe3BzBIDnM7xtER4fVAZEn1vqcVwfdAtgrrDuaP0yA1B563/c+puI9qM4zO9xZ1oe3EqXrkPkzYwZOCnzIegHKRytuJNc7xcIHzMFuhbGVjkLL7ki7MkXZQ4UCbd+l7nCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPX5u0tCuPO3g63dLlHzJqy7DOUQjJ0zjFGRlb+wayQ=;
 b=iciTj9kJ252EVy83t5wOc+UYaF4eDF1OsP7ZqHVRP525q9v06seDGUxz1hL9m4sTB8AYlnptjmLudqpBiin7xLQ63+/loQtaIRuujswBU3onS9rM11GhnaEp7K+fszDVz2W3MidkafwB6VDA/XbR4fVlXoywnHsSz9MnYLCGZeo=
Received: from SJ0PR03CA0192.namprd03.prod.outlook.com (2603:10b6:a03:2ef::17)
 by BY1PR19MB8013.namprd19.prod.outlook.com (2603:10b6:a03:532::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:35:06 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::6b) by SJ0PR03CA0192.outlook.office365.com
 (2603:10b6:a03:2ef::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 10:35:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A87B406543;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1CF73820244;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/4] Series of SDCA bug fixes
Date: Wed, 22 Jul 2026 11:34:56 +0100
Message-ID: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BY1PR19MB8013:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 75b8f2fc-c39c-4b17-9f2b-08dee7dce556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|61400799027|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	49WpPG9suBUH5bgzjRNb+dfbP97HS9K2uqCkCv9HumaJNWYdXZlC8SM2CIvYkoxQ6lKMRl6slp+V3aZxZIDBcYncb0M0UWr54yLrjxMvQL+ia+/vs4PkXVzXMS8/jdq6ASRpB3tHQLur2mAJt703aedFgAjCdE6m3/2yw+LEDgf5m2G/R53Xtjp4IuIP8yFcH3sVqogWzAgzT+BchIm0ntgMxR+1foycqK8viGEHYUyTWb5mfsscEGGTqsg0USuODOa7/xIXMAeC4CBw+BynZbvpIjvMmS4GsEpvX+9taNzlrW7CzFr7+KF5qqwWLpn6A4Lrx5Tu5UV0CoIn9MG2AlInL/DAb5OFOYNF208d6KPXYyVXGwjXR0cj2pHHo9DAAC0acr1qDAKJx49ZZ4IsijkS8drltIW1cZI4Kv8m8+c8RI59vS1J4YishHF5tmUiZWpRW7Rt6SM6+GQEbGcEaFw06Xgsg3PKKi4bYZAZxem52KTdjiNOrVbRiQqRyPKHJX7a/8XKA3KPVRwWIJ31fbA8d9uKuStKNmlRxCPI6bY4Y9FiRsZHDShbkJBoCcXxrIKQQRv575KpJSUsmzlm0fIkiZ/7cuBmVkzHw5ERvV7O8K/bUuEQHHSr1nuby/MzkpZ6ZTTSwiitIYmwSYS5LFXvx17p1AALBBPusiUBo83cHP3GMWQReguJ+TQJhFeotlMpJ2grceIJgD4PuXn32Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(61400799027)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tGKR/sxh5EJm2aOTK3l69wxSTb7+QvZYd/XbPaY5WnQiVFlbxiyLrbC3l0d4VaPUzbVaQjgQzCF26KWCztyBHqJY5qybvnJefwfnf5RvCTBlYqWGHZuqL43A03xdyyWveIN4LZwLJsl9GSFA6YOnll9UVTJPBvzBJH72CxROfVpP2tqeSTOCs2ZRxVNyX3KBO52XU2XWjljYkyosLnYQxVbJaWsSCt6tnvo2EXy6g3EqGWNeoT6NWI4+u6spmugxvK1W2zfZDvMKZRee4NNN8SToX83rrZK1XT6xsJuZq06QEbWV80HJD5pkKR19yoFEI5CdlrRVbyK/KAgEUUVfhkqffYH6RgvY3KE6zqW5muDl5fi7nArXs3H8bS/xAOMevITB7+IVDtQlfDaqTVpBbf0+rqyUUAiKJ2ijBFQmujo1oKu03cam2mQ7M5D7vGX9
X-Exchange-RoutingPolicyChecked:
	oeStiVXL/aA/zGFfzEhemEJZUIehu7UCs9s1K7ixK1y7zxjJPen/QnWmeINnT2zJDk2Icky8nEu4dW5zXImd3gD1CIn2YE1XJIws8A/p8Cor0eXMJstyjRy534BGofhagKzAarJ16/neymZrBzwL9rcIhxuglzzI/IXo9q+9V8byS+CNnl6Y5jTAJ9AjiVRppD4BBZY+G888OFCyTrWjGCtLR1km72rW0lBpmczGvufl2GmfBt4/2r3QZ4CQaAIPZygujN0uaeXfYku5/n7Io9619kRyqs1qvR1CVUpsFDZ0gPteTQ9v1+Yz8Z2FXwWCzCGmEnv9mi7lbaEjGiwTZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:05.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b8f2fc-c39c-4b17-9f2b-08dee7dce556
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB8013
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX18i4ZKc6ulYQ
 gJQtS2Ky9J5ngTaKXnoqR2RzcSK6i3+i/3XH8LE+2kWNQTYjd7OIBA41c7zp4ir3ctcU8qQ/7sc
 R9zViiLe207DrU34X8sve/SYtCGPHo4=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a609ce0 cx=c_pps
 a=zMw3/4lVTLt0/G0IafOnjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=LLcoeAqWJs0ZdqSxYQsA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX9wN3GWFc3mLI
 QsBY5KDuzm9hIEETJO0l3qAd32jApP0b8bKpgUcqRMTgqAEadnrkS3Q1GbsJbIa5S0TDQVKF3kY
 pYmZUa0WbLRuDiTOjZlaHnK1R5QjFdm8lY/QMsXizl12iq8QPwOorNuZHduStLkWbkmQ6w1xkaK
 xU7dgMMrD2GUGmJd+JgCBQvGvg8CxBkpb+arunVXbA0Kg4Sm0u4+ilPzNijmQomyHJMHV/NWQwV
 ZNqskqN/+dN9Y1y0iRhl9ht2MczR09yLyrnG2m63UQ/DcxevEt5IYTzhOHu1IgTj3nJmuUsgcJN
 lrz9vAeFu/guW3oFl5lZ+WsOGEulJ9Sqv89rEnuKxrviDqqwaWt0DKToPr6Zo2dSie00JYExpE3
 e8KRGU5ujY+l8SAX8Cw+3PF6Qkz65+bce+Tol7uhwNdExR1K7gWGBquFVSezIm1RaCsY1WWv+qq
 KwJOWfZW7yGJACeUQcw==
X-Proofpoint-ORIG-GUID: LUabS4mfAKFXqGTl3m7Qg20cP1l19DFy
X-Proofpoint-GUID: LUabS4mfAKFXqGTl3m7Qg20cP1l19DFy
X-Proofpoint-Spam-Reason: safe

Fix up some error path and size checking issues in the SDCA code.

Thanks,
Charles

Charles Keepax (4):
  ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
  ASoC: SDCA: Always free firmware in FDL path
  ASoC: SDCA: Make UMP message size check more robust
  ASoC: SDCA: Ensure that Control Range is large enough for header

 sound/soc/sdca/sdca_device.c    | 2 +-
 sound/soc/sdca/sdca_fdl.c       | 5 ++++-
 sound/soc/sdca/sdca_functions.c | 2 ++
 sound/soc/sdca/sdca_ump.c       | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.47.3

