Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3102BEC5F;
	Thu, 30 Apr 2026 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561833; cv=fail; b=C/nXAs5HUuLVSZqUC4xmioMLXUuKM9Zq9NnBU3jld24SpYJ2A1cViv9i34jlqDZw0prn/6FgcE5x/QmuIqxzpMn+ebaWEbHBH6YddN9hUvG7wZbN+mgTTfcdLzHuBCiPWvJd/8IJ/PP09TFt6IZrCZSfzzsq8R5u/YA2hiTRYRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561833; c=relaxed/simple;
	bh=G2uO8QE+AMWDOODubIYorzRL4LFJ3gqQmGU5xigEf90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I0u4CFNcTiFZfQ3Cs/wGB2BFX8AlnD+rpisOA1+svBpDYsJ62TosXlYnMDR+Q7ODz6JMezwnbOMXcO39eKgZXJTXaVVh6+WYbuPQkiJvtsdaDVOVKmes9R7ktl+M325ia/P6Sk8lO56MIwGTheTK0Q+7N39FIBm5KPr22LWG46A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MYUfpP/I; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yERVwkvZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MYUfpP/I";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yERVwkvZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDXJfF1587864;
	Thu, 30 Apr 2026 10:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YRDMQUM8NQUGgFl0
	Q9k4uaACrBuHQmikkoa1S0Q9z+c=; b=MYUfpP/ILJT4zDLocLl8eFuoWjucFmzK
	0axRwdA2xSHgUjnS77brKbE6tJY8TxYlQmdnKDiHuyLtjPJm/mWx7qo6QeffGA68
	dT1m0wU6VKYAojRZnR+T20icwWOlUlxt5FADiROYNnKxy5fdqLXJSNdOTcL3t9gT
	2WVkG+S+HmeapJEZG1cLn0glOzfNrJU+clxlbnOLH6WenLyuV+nJyVwCUtlXAkA+
	nM/40FxNQRlYcB4KV/tyGdia+lP2mRqtw4B6o0Tg4HtSoqAyoqZsWO6FM4jV13TV
	Su45NSv65oluVLRaUyUBBUNsLLniAqPw7sPUM4zqgNk+AzDeMG63FA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020117.outbound.protection.outlook.com [40.93.198.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dv82e84vh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:09:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LD70MFoFJZH0yKDUGznjJz7Q+Jp8iL9FBC8H3NcPq5Y/KlvDbPPNFNxvZHVs0T7yitLBWJktldJXSSwEGxaA+Juy7mJdxD8KBcKeg2yqiFusNnOi8VWF8yZNbBt4tGNgTO3xIGOwe0p/5teCk9c/GnHwQ7tUlNcDUIaJ35O81pVXBwWvIx4va8iKF103Ls4eV/9EU+zP33Zg0pP1Lc3ELbjfR7q98DBdEE10ajcCS3grjD+H5Ua4XKERhE5BbKr31hxnAlIjlykdqfh+KOOfDJ9lpKDOoV4PVoZlO1WiPRg9fHFOKxncZlaZ3TViqITiolpzPrugOyexNL8GEXuBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRDMQUM8NQUGgFl0Q9k4uaACrBuHQmikkoa1S0Q9z+c=;
 b=moDPhNsn3Hc5Swd12Ia+Vl7koefMc8so7QVw4k/PpQ3DQ0GjRJdt8j6LWU2zVGh8K6RZRJjusPtuqxLrI182aEoyfsxidByhFte8jk4/2U9/Bc0mB48n2RymSJRHH9AGX5LuQnYInMB3QsAaPqpYlo9mvm/H4GCTw4QRU+Ttg3CVyzr9ocBxTDvdp0PbJk0C7gDt0zPqUuSSBslQEDWi3YuiVwZz7ZfFgTH65wqqbTsK2J0cViCx0sZpeOi4awaPcpSnc1xyph3Vm+g7c0Km5SmYzC8uMf1n85g30MokvBW8a+agdn7a926qMfxMhePiyknOCiHIHxr1AvTsS1tKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRDMQUM8NQUGgFl0Q9k4uaACrBuHQmikkoa1S0Q9z+c=;
 b=yERVwkvZ+TMd82zATnuXXoO1Q8mV+XIPep9XO0qELqe4B4YRKltr5xxvqHZMRFdHwttHr8OH2qyKAbNgYuatwu6Fte4MCK1lF729VZ+9ykCI127phRwxkKHpvUx/luVdo4aHRd7swNF7JFt4AMEthNcnd0wf7D7RxsRWtx6PRc4=
Received: from DS7PR05CA0076.namprd05.prod.outlook.com (2603:10b6:8:57::13) by
 PH8PR19MB7096.namprd19.prod.outlook.com (2603:10b6:510:220::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 15:09:36 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::8d) by DS7PR05CA0076.outlook.office365.com
 (2603:10b6:8:57::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.7 via Frontend Transport; Thu,
 30 Apr 2026 15:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 15:09:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7534B40654A;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 51C5C820244;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 0/3] Improve SDCA support for duplicated features
Date: Thu, 30 Apr 2026 16:09:28 +0100
Message-ID: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH8PR19MB7096:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae071f8f-db8f-4092-f6d9-08dea6ca7dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|7416014|82310400026|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S0pK4rpnDZ6yFlnmf09dIqzVrmBf3f3fqgwPDiQ8NBHrE2E94hGLkU+ZGzKp/3Bsd4INm1zuKpKTZlZIbSzWOKj0duiOKR5fEH8Sal8TCqIHRc8ZxuNdAHb76UC5b0q/uayE5TCXBgQyrK8zpIoaDEJLeI3oXiPvRFDfvCBZZXEEqJ0hM497TpQVhbO+Mr6Jv2XWo3M7pUxa3LC7xkSw3VxUXNiH+BjrzzDSmhdK/n/ygLrUFKCB9wmu/AvisdDVYopBc9JITZU+VQ/tM3XgDMjD/0htVxxpUDccL/MclUQ24BVjaWwvUEl6Y/Nfgu5eUJkxMDyb4kB/rozUj2IIhF22YQi8Z+YvHOe9EcS/c+FJBKhOnjo8jHJtHu/3u4Cu+BGhI4siRa7+Lohp+w425p/CcQNe0qzamxqzr8LnuDk+gCK1u31B/SHLvGIus02SN9azWfEjEsA96D/b6H+Tb2Iwgo6CvAF/gq6GmTZDVznRcvxgRJnEbUU46WNGxO36W4CqnmkuzS7JU4+nv6kMniDuOq2mKWiqXojoyAWy9DjXfCA9EP4WsYQyp2VCAcQCPX+xC5mvM+WI+yMdFrlPIir/zK/FgHIzNPm+I3xZnX6xntEk0IIIIMMhYfK34hs66yYEyaYbm+h2JF99+bHGhisMg7cSZfvpurE2Zq+Gm5oiDFuoOMsz3Oqik7EtIWn9xSITiYjntu/SPRElwPh5C5xhOMQ2utgyxPls9jMf6fAEi4IgsVpYMgWCND6lGOs3o6nUCcapMO1Mjc6XgCeRaQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(7416014)(82310400026)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PrzMmJ5oclOQOFFKbSolcan1aBJ7f1SPGZ/1Q8yx/mwzT7eet3FdOPkZxFhFGoi7uUWcXyYuzv6TKSf46FLh1pRG3IeowdL2x3UXWGa7A6rKT1pZGEvv+YlS54mAlm2WkLCuSArmmqWFMwH0/VKBYfPTo5FXWpJGECGBff1ieZ8S+3KBTw5kgaQv75JSvpDmgBaV8TLM6GjJGDXNMZPDSBmGXVPWvshwCj3CvuXdH1+GYMq8ToCC5gnmY8S7YmOk02ULs3XxS/fx+sNHOKkEkvK25u9aOLa7G2HRdxDgAfV14BFiorSAcMBLAFFM1yi5sQE0YbSvfs2Mlui1V+ObM/V62QmxVyPxImG1qBNWYVR69qKH4Qsm9GC6hlDebo5rxXCQR5wO7HGLpop2Zeol0n6wwGQRNvGkSPgX5n2smFw299EjjOCCUn2EDV+lhsuU
X-Exchange-RoutingPolicyChecked:
	V1qzngObZ3bLvBdZWIIqIOqMDyXMgAjDNL1qW2EAp4aJHzlk99ajvipHF0Yt15vy5DVJRRoqV61IimkIecqNmKtKVnTGPf7YQ9zdn3R5jSt7b0q1iHAPEpRtBg5Efo+zLiuZreV2C+FlY+m7c60bYXvYjNDC3QoRJusr0iWG36y144yvur+eu+Sc9ByW+NtTnHPWFcbTlD/qSGDOPDLOmU/RxP5iWZmYfOUoWbR3IdNcbE0/HWF3/P+q3n1q8jP/nuQoFcNK44a0+fEzk2h3FqSg+p6DxLNpNp3+e+RsUjR1RTzG4xHD4Sh89t03vhGJr7vVzYBq2rWnxNJRBCTSNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:09:35.5676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae071f8f-db8f-4092-f6d9-08dea6ca7dd6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7096
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NiBTYWx0ZWRfXwfim3Xja+og1
 XTbz2hk9QYYNecHrJqdAvW+mIu1JuRQWuFbLiGoEieboZ485PW4irDdplxZedvE2mUN4rpcqdsz
 cu65ZHa6cDYZgwhokttYS5hYc2LmF8d+OX215arTzD7Ghwvcm4aeSK92SBbPujsUL+qy3nGQzyn
 NB8B6j1zMhlJlA0JajtJQhGCs33zWASWCXJmh25qsASMYYkicA3f1uisAwZtHRWIK/msGKJQz6Z
 MXay4kfajJ9URfm5i/Sc7HE66SznxwqrsNO9+UClkgQz5UNi+vkbHuNBblQkSrux2yDs6nFDMq3
 ON0clkEkGvI9XfrjXL1jPUvYVINFzWrhH7jEGzmztSgVvL/EZrUrMxkRF2w/GI02HL6+zB9A/RQ
 A+dYmhrZT4IbLIb5zpX3pPSDfF+tGqvUoOSNA+vpr+Cy29b3A6DD/zDBJDnr5/I1HZxs2XZDnab
 QviIIHWGG/9yAB3U+9w==
X-Authority-Analysis: v=2.4 cv=P64KQCAu c=1 sm=1 tr=0 ts=69f370b6 cx=c_pps
 a=UIcKv52QUy3ZqpRAVMOEHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=4hxbN7GjTgChUVpeMBQA:9
X-Proofpoint-GUID: YzA6PE8JbTEL5uRjP8BDcTcfjosKe1ap
X-Proofpoint-ORIG-GUID: YzA6PE8JbTEL5uRjP8BDcTcfjosKe1ap
X-Proofpoint-Spam-Reason: safe

There are some short comings of the current SDCA class driver with
respect to duplicated functions and jacks. Fix some issues in the
reporting of jacks when there are multiple jacks represented in the SDCA
topology. When a single device contains multiple instances of the same
type of SDCA function the current class driver will create duplicate
controls, update the code to fix this. Finally whilst working through
this also tidy up the handling of the sdca_function_desc pointers as it
turns out some duplication has crept into the code on that front.

Thanks,
Charles

Changes since v2:
 - Add missing set of desc pointer in tas2783 from v1
 - Minor reordering in sdca_jack_set_jack

Changes since v1:
 - Update tas2783 for API changes
 - Correct kernel doc

Charles Keepax (3):
  ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
  ASoC: SDCA: Remove sdca_function_data duplication
  ASoC: SDCA: Support devices with multiple functions of identical type

 include/sound/sdca.h                 |  4 ++
 include/sound/sdca_function.h        |  1 -
 include/sound/sdca_jack.h            |  3 ++
 sound/soc/codecs/tas2783-sdw.c       |  6 +--
 sound/soc/sdca/sdca_class.c          |  7 ---
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 ++-------
 sound/soc/sdca/sdca_functions.c      | 51 ++++++++++++-------
 sound/soc/sdca/sdca_interrupts.c     |  3 +-
 sound/soc/sdca/sdca_jack.c           | 75 ++++++++++++++++------------
 10 files changed, 94 insertions(+), 80 deletions(-)

-- 
2.47.3

