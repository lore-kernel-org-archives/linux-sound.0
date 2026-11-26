Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692132;
	b=BMVEdDKNMVk8sjSFBLaXptZrzi+ZicXhQVvg9two5sqPvYd1q1IzkyH7sFoHtDuPxs3Q
	 54DVCN6LuPs5diSsQKrb7ZsBK6u10XYM2SaLqGrGYjVtnvtmuFfSkPYr7LJY8LwBCLqux
	 31BjaAKckPTzpQ42jjQZE9/Xgz29T7UsXImuzxEna/fZk+whNr6VF/vAcsGrOwShYta36
	 NAmI9z+ZWLgflYCPgoMXrLiK1aGEbOgPeAVu9Fen+EEwQjT1tNSeBDKF2i61DIinr2ngN
	 plwjEsutkbTTpzRXdvJrObHIPkCf11vEsoxNb123rO2mhQz0qGmn0UTG63+rfu+/lqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=tzfIR+4DjKbTWISnGGmSWo4FYvPhpDbgE6wjEHAWXlw=;
	b=lxcTzSsHkHC1iGJSlbXb/QNGc+/qXgIbX3/MGJZNc43LaQ97OxSoMKTLx0dIyYMMY86H
	 8D1md6STmr1v43iXuWYUS1NGBydKd3wi6hbY2IcGpsmWIb8pSjjaf3mBrEkQkA5QGAGAh
	 u0/wya3D3ZepB4pzwLDw9Tnu5+DTNT57DXrflVil8/PKUkdzMv/ovFYvbZAfMJIQyO9vo
	 romCINFSJ1FeU80GGfDF6pACq+Yt2AyJQpu6Jg+d4cZAomelItEtIMrTc9ykQ4JeDAekF
	 +Z6NaDmYhyk9gBZnkbetQJkicmAosHbcez2K9yOqwiaUfX+KsTKwhfUllbrJHjES+iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ShiRkWPH;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=foaRo1dg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998C606A333;
	Thu, 26 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E998C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ShiRkWPH;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=foaRo1dg
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AQAZcH33380146;
	Thu, 26 Nov 2026 05:21:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tzfIR+4DjKbTWISnGGmSWo4FYvPhpDbgE6wjEHAWX
	lw=; b=ShiRkWPHrHzr7FP4njy93R7FR3vuA3Wnk1+5EhSC++1fMpO/GsAJN5peq
	lp/tvVcDo3FkEf4CErTdanQem8oQpwIyHqXWoQlZsUogQZ/NLHcNOSGMNlrhj4dM
	HpOBuo4fqLG1sFD8vHjjm591eHHs3tndqNKIzsEhbJB6NiZcNOKNRosFlKU2ryoE
	CQ/4BVmo086VG443HuvAckC8onJwk1XOJXbOA3POOmZOAZ0jn/VhaXWV9h8tZ+Sm
	MeK706hAVgG9w1tbgel/wTB54bAZvNluBpQwQsrU0eEoOYx+cwxIwf1bi7IowJyj
	Wo/mZ/8y3aj3iNG1UVLpvhCL6yw1A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j6a1dk1he-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 05:21:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyxXhfIkpIvg6SVxkqHvOcu9cMnNx5sw3WbEYo3wcBHfKyXUv1aiBq7jWpiyfUkP1SsJhvU3RsSaYflG1MEQMuH08T0GS7pZ6Tkga5eczIg6ujIoASJQU7vsmFwxm2fTRLla0nOcMuOGDjoOXCAsr+aR3lV6BMkjvydnOxIC0lKvGSZy8PiMmg3+j/M42CSPBpNP0xWMYZ/p6SJjQaG+krw2NaKeibnaPU7PpHBSbCplb3ABAbiN+FB6nTtpihmn6CJxPMEmRbb4EUcOKauZP5vzWdRvXfFb0c9buiHBo4Jqz33NhYa6YsPBvZk76jGhuU9xsGPbC8zOZuOzNEgleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzfIR+4DjKbTWISnGGmSWo4FYvPhpDbgE6wjEHAWXlw=;
 b=FfGmaoNknFNI4GXePseIt1f+BIs6HqRY4EA7RGDRsg6DTO7eLFqKzYsjMC03U08XUmJ7z2HjiED9BNNtE3bPWnH6iGNNTCORTV0xw57RZaDKgZFVq5tNN0qfxULg9L3pUJl1H2y7DAuivW/a+5HyrO19F9tq1LIxWNy0FEG+UmDrK6NpGiT0x3FGSOS150Pw0qTC8ti7QZxQcI8z09IAmwGRPDVvFj3kp6huAyv6ib758Yn77ae53H8bv8HbANzuhKQK9Fe9k3SXAN/4MwhrHQVgiR3zk25CietEXsVpPfQFnUXqge6xhfKIKJwZT+0oL0wmQHqm92urJMHX8p6WOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzfIR+4DjKbTWISnGGmSWo4FYvPhpDbgE6wjEHAWXlw=;
 b=foaRo1dgpsqG94hVCV/iLyBHKs1kT2fdltIPUj1i7vYV6Fz+VWB+oVXnzMQNTTuUS1y8dfVhMZ2jbBGHXyI9o7PeqgqzrIAIw6lKiyghJ6gNheSVSNkuaBIIX1Bh36HINnZOxy4nYH87ab8Q00vFZ68wxIwKINZEsIyYNPoMiGw=
Received: from SJ0PR03CA0197.namprd03.prod.outlook.com (2603:10b6:a03:2ef::22)
 by CH8PR10MB366183.namprd10.prod.outlook.com (2603:10b6:610:704::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:21:34 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::8d) by SJ0PR03CA0197.outlook.office365.com
 (2603:10b6:a03:2ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Thu,
 26 Nov 2026 11:21:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:21:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:17 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 05:21:16 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.250.64.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQBKwHW1596498;
	Thu, 26 Nov 2026 05:21:13 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 4/5] ASoC: tac5xx2-sdw: initialize volume registers to 0 dBFS on first probe
Date: Thu, 26 Nov 2026 20:20:22 +0900
Message-ID: <20261126112023.29054-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20261126112023.29054-1-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH8PR10MB366183:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a942220-8002-49b0-8e52-08df4baf6da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261026140227099003|261021121427099003|261028144727099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	2agwBe4+kDR6+UmjfDH0l0JHFNJTLmnI0id3psOu0UbFAf+GBGSQR8nw5dkOWL/j8nvMbZPg9TPGxiI2Vj1s0EAVjqBMRB5chiB9wh9pG5YBA2lwty7w6AEwEC1dA2HeG1haRbUtbohtwk9t4I5SdDoWUUDopQcBGSSpJppfMUlpxbYRCQgaSxwUO317lAhYwTb3arXL70S/g7Wel2OiK3bFUfPZuUrW9/o+lHWMUF3g4BgRdjwK0NmnaSelsbbQ0d3581mldAYMzaDXeg+gJAgUXckwMvqGIkg4aGTXGT8YfQ6O2v6n8ax9rZPAt/CB/2esRez3hjpVDiM9w2y8k7JqaoXbDimEdhSQ3T2ks6SnBNm9+6H9N8IEfENblHNW5M5MrnKQOMhXtVuds5v6q+FNGdA34cTEnP2a0fpG3nTBQh1NPSpPFvIoBn74KWUB12Zkfsryjc99y9xcibvJhObeKGHxuQZ5drD7wKMM6MrgdTRVb0v1I6BHIoJ1Q2W06oeioXKWkRZXC9sUua1hobEmvOAVhv7V0sGPG3l0rNit17E0pHHTEQXnQGa0pR7KjGiiQSmYM7CS70SPulf3jOd5nrF/YxfbZPPnFvzKRVboH9R2lxLxwfNAhpZhQAQMfN4ip6UoBniq2VLUVTQGsOdz82MutIY0P7VCI7qoA0CkaQlN5EFhOV/2sxx96zUka3gvwdLmf0hAaUWA/hrSbw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261021121427099003)(261028144727099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Uk+2LuJG49YDm4RLEzDXYy6T/1xTSTiJquxSTEzgdTKW0t3UHmvMZv3uyFA7KsAZfu554hId7DKxcJrLXnNjKWHz2csy0N305++hwY53ZNxxi5ePquu4q42EdfbJYaUMfBXrBi+5HNUqzIOEVzF/G12ZFMuUJRXzjXaaf8oVKOWQCfIgvLi6v4qrmq6Yb3rp3zZxL9M8BSZP3/y0XoWMX6Hlq3B7mv/baaGtjsSSoQJv1iuSlGpE/vrhY39EwPqBCaFp9hGxstLwPcbbcDceaAs50W8/FYOZPFXfJPg98royZBMOBqwSE7wHDIMsAdu5UkrmlWesY6iiKiOrLiCiBMDySvDIMs6qDlw0Ee6A5njeXNlwBdYoT9dsbMi3H7e9DD5eCwu7MDAx1OVQrqlXLsMSh2azelCfIul7LpiTXIS7DN3ON9+wnxfJJ9hhWgM2
X-Exchange-RoutingPolicyChecked:
	YwzFQabJJ/0SGEcLlndKnQbDRax5BtmQExdiS3sWxkVKF+sDgoL3kfKsY7em5lyf3XiksIDv3s4HQFc6xKqyPMxQg0VFWfj4O83OYYbSXxB7ZZKVpJB+66N3BDLJyzPpceL/XXSNjvzGXRrpMMhisMVLyYp4/nYiJeC3+wsEhnHIH9Zv0fUzlMr0YoziisbGkmrrt0YZOcX1LUxBkH0OrgmAXiGg36D5158BEYQHb+XWD0FSr2aDiA6h80RGFTU54gSoMxWBbHBhLukaDGw6waAi8ugDcFfBaS4ZiJG+cMj3GmYkrzEfryRdEMRYL0+g3QBox/3IStmGJZ4bWXdEMw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:21:33.9534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a942220-8002-49b0-8e52-08df4baf6da4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR10MB366183
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX5B7t7v3heEqh
 ScV6qy7I8grmaT3ZFJQj70tNVt3b0827Zdz4OSLdXP7pzuzvwK5742lRCp2DHSeuKo6W9qOB6H/
 I0tmXgOHHU6F9AV8JsgeM+JVXXZRE7Q=
X-Authority-Analysis: v=2.4 cv=LNTz05W9 c=1 sm=1 tr=0 ts=6b081643 cx=c_pps
 a=zf46e5KlnE+iQYqYCeD52w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=gxsXeXsAEhJKVXW8ElAA:9
X-Proofpoint-GUID: Xi6mHs9ZmOiNN6kUZGiSv8SJvn42rvXP
X-Proofpoint-ORIG-GUID: Xi6mHs9ZmOiNN6kUZGiSv8SJvn42rvXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX44fEcuERcWtE
 LMdL7AwYLA17llbV3YESYAvdoLI2FiFUnD38Z1Qn9uJ9vc9SGLsz6IKJXd+KFy4UuIr8mympVPZ
 AVwcbqGdA5bMtIxzIuYRkw+vWb7d06k3wxY9mBZWWCzdtGLIK3AITM3qA64jJLKGKUGNc1K3/Ee
 8Q+ECV+Z+lqc6KhTDaNZ399uEIpUOQhH4I1hRJJ/+LihVCqurbN2U/hjHxY/RAGjlYaJgd0L59F
 Tu32fBdpNa3/llR84rnFwWduuP/UM409NN0Iyp+z2/J8YIW0OnDJE8zGqsO2KakqZb2vBATBDa1
 u4W6nrtTgEnVElM6SeEnpa2i1rzAc/FTRXYKsJiRyciyLt3dab6a22+yjRnUmVfKofGFQ/5dMxn
 aUmimmBqnABvaENHDRgreHF6G07BMz0VC4BlJvg25Q0DebRZa3h9vW/R0fJ9lw0kvLmxLQqh3ir
 bln+TccC1o8WlgWt+2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

The SDCA volume registers power on at 0x9c00 (-100 dBFS in Q7.8 format)
which is below the mixer control range (-72 dBFS to +6 dBFS). Write 0x0
(0 dBFS) to all volume registers on first probe so the initial HW state
is within the valid range and consistent with the regmap cache.

SA FU21 is already handled by the existing tac_spk_seq. Add tac_dmic_seq
for SM FU113 and tac_uaj_seq for UAJ FU41/FU36.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
changes since v1:
* newly added patch

 sound/soc/codecs/tac5xx2-sdw.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 1cea864a2..d679a4194 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -438,6 +438,18 @@ static const struct reg_sequence tac_spk_seq[] = {
 			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 };
 
+static const struct reg_sequence tac_dmic_seq[] = {
+	REG_SEQ0(TAC_VOLUME_REG(SM, FU113, LEFT), 0),
+	REG_SEQ0(TAC_VOLUME_REG(SM, FU113, RIGHT), 0),
+};
+
+static const struct reg_sequence tac_uaj_seq[] = {
+	REG_SEQ0(TAC_VOLUME_REG(UAJ, FU41, LEFT), 0),
+	REG_SEQ0(TAC_VOLUME_REG(UAJ, FU41, RIGHT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0),
+};
+
 static bool tac_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1854,6 +1866,15 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 			goto io_init_err;
 		}
 		dev_dbg(dev, "smartmic init done\n");
+
+		if (first) {
+			ret = regmap_multi_reg_write(tac_dev->regmap, tac_dmic_seq,
+						     ARRAY_SIZE(tac_dmic_seq));
+			if (ret) {
+				dev_err(dev, "dmic vol init failed, err=%d\n", ret);
+				goto io_init_err;
+			}
+		}
 	}
 
 	if (tac_dev->uaj_func_data) {
@@ -1866,6 +1887,13 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 		dev_dbg(dev, "uaj init done\n");
 
 		if (first) {
+			ret = regmap_multi_reg_write(tac_dev->regmap, tac_uaj_seq,
+						     ARRAY_SIZE(tac_uaj_seq));
+			if (ret) {
+				dev_err(dev, "uaj vol init failed, err=%d\n", ret);
+				goto io_init_err;
+			}
+
 			if (tac_dev->hs_jack) {
 				ret = tac5xx2_jack_init(tac_dev);
 				if (ret) {
-- 
2.34.1

