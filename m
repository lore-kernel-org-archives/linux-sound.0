Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530464;
	b=tzvUVwzHTff1CDgd6NBlkraK2xa1kOlrMZLBt0byi7B7Wue/+lXCyD2gxiIJu6Z8gfoC
	 gOjO75+rfaWBHy4PeGVkOdGN3t3swHv28H3esuPKScnPXWLuIu5+l14lZ/UPt17MZ0xmm
	 qS75d8Xi7/qjV8JrfP7BYCr3/EKTsYDM8dvylJ1n+mpAgS7ya4O3dEANKEkk42YF5Ak5I
	 U3B3FCPDnhNFRI/H3Mr8Sde1TZYIn/1RhPBirHdL6tJ5o3F52ayBsvQF81a3hvNynEpU7
	 08PFyHqqD0Rfg50ilsewQ0DV3B1cElwR/j0LlFIRBLb5fPTObVBXova5TRQqL4UEiGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530464;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vD+ompG3Sr4sn1Kl8ztSbBEVfLziviCek5xTNA89baI=;
	b=ZTJopFMRpLgBC/PZMj+Qw5392csoPuVdST7gxYlXmF06Ljtcp1T/y6DEDW1dCo8IyifH
	 ugH+xCumLyP5lL7IeEQkch7GOls2ewiL32z/AJ/cl948LeuNO1/3n7uPbV5zvfWhZPQgf
	 iod7UNDxz1V2ibip2U2btQesVXUClPhfW023IM3MWG/m2XALp4NC2zpUJcoDM8Rn93zdL
	 xaUVk8V+8acuXGRtGEYNxDocQ0hRmQrIXzNXkZ3+lo6m2VaTY8SN82TA7ZwF60jUIe3SX
	 f0h9drraeF+Rk+DLeLlaonxFNDP18acpbdMh2Lb9Dk4SoDOPs/fqg3SAjhsfpy6lOYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DDXrNCkd;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="hRAjU/Gz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18065606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 14:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18065606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DDXrNCkd;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=hRAjU/Gz
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJaC1682046;
	Tue, 24 Nov 2026 08:27:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vD+ompG3Sr4sn
	1Kl8ztSbBEVfLziviCek5xTNA89baI=; b=DDXrNCkd2pdifiPpryI683+z0V0Zm
	FkQM2kLNI+Y/b2zQnEQZNWWVW7CyBQUWxOYZ2ssAij4HC4xRblDmBtAGfVIUWosJ
	kWnSNvyqbdnwA0gFj2TpNNal9tdsoMwSN/xssP+zJM8Und3G0laQOkb0bHIlO5BA
	YtORpvH8VpGXRNsfDEIXIjKf1C8jqX1iZBfGn1n/OFCTspTViaeEjhIJPCMPqlAy
	quvQ6128JS4nLZzQfMAfbK8uXSuj2jRrrz/XrLvndzgGbL+UkeWIGqp4RwpYa/bg
	jIZlPIlsZ6H2YF3CbpN6lvqX8qwwjezhqWFsai4QkpJFXjEl7i6ns135w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j4v8qdd49-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 08:27:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Da/9zjBStGlsDnm2yV0QDydqugbMBJL4yvLy32fYXnfEDMoFqTgYlwmuHZ7hG3k4aNwtgDiyv02rvJszQe/JeAzZo4aUwNO7g+hVZ95VkuzkvBZR46S6BJ6ejC+SyPXLR3baa13JytzCAVUSW7qbB4Xvu9tdLVTFfwLjO0v+XrSXkLNQyvPE+FRn2s8KbVpKbQnUpZuLt8DZsm4PS25YDszV1FkEibGq8g76/sEUdi3FgrLZKsV96SPWiFbcJHnwAAQlC4dolURXYzKuOaynw37G2JUH/iLdmoescHKPLhZ1RZ7w7aWTWT/Zdgnoh5YzX+7KzPVahtVQVWf4xGVR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD+ompG3Sr4sn1Kl8ztSbBEVfLziviCek5xTNA89baI=;
 b=Flni20cNmJZe19ed/uNbvQeLpGhyN47T6SRlllFMtsNkLq/B6GBQaH7qbssmlg5/q9JOEXmXUHtXSiBwcmCJOoQOu+aZxWIv8mPXjDBYqXzSXtKi/ySKSkR2yhO0/ng14r5zI6jNly9ijIVdVCeiKAYyUJl5TU4uBY+YWF4rblt8aIuOrUMsAQUr4hzx5YJDpTzK0YZQIJr7/ffs3fWeNfaIHmBdLcWRZISEM4X0GI5AY1BGdhSU5bpDQeYRWO+6LFY4O/qjW4q0m7tCd94tbp10cGnWVrpVTEJkYobCt9zZAJRYWRXF2rTI8d8d0+B05Ouu9hya38sGklSJNvCFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD+ompG3Sr4sn1Kl8ztSbBEVfLziviCek5xTNA89baI=;
 b=hRAjU/GzN5jzygJXUADbVFxtVOwKI7F9Uc8k8DzJs89oDFAE3LbSO19zc015Kd2wH54YTm2jamnizEU0Xt9H+TJArC/Bmuf+O2JrHHyvKYMIS2j3F9wzaQi/recAaH9/FBYtaJ+714sS4Aemamf9v+pcQMaigQTHpZv4yqeukHU=
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by SA1PR10MB7753.namprd10.prod.outlook.com (2603:10b6:806:3a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 14:27:07 +0000
Received: from CH01EPF000BE94D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::5b) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 14:27:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH01EPF000BE94D.mail.protection.outlook.com (10.167.244.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 14:27:05 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 08:26:44 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 08:26:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 24 Nov 2026 08:26:44 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.66.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AOEQdUX797271;
	Tue, 24 Nov 2026 08:26:40 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Refactor TAS2573 calibration status read
Date: Tue, 24 Nov 2026 22:26:34 +0800
Message-ID: <20261124142634.1383-1-shenghao-ding@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94D:EE_|SA1PR10MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8b96ac-ffe2-45b8-59d0-08df4a370373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026140227099003|261102123227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|56012099006|10067099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FzbG0nTMtQ6JpB1Q6S22TDg7bdhQ9vD/RJPHs2J1kc6hn97+/Hfo1qRmuuWEA+980yAv1e3Fdvd69PF3oCWiWyDCGJClcec6SFN6hRnNrpKxtK5ZEvHWJqDTHXGAb/BEj3IfM7myqMbR9Vp4yYN84inb3jhVMTLNzTfvdQsM1PIusBwVIcXJSOFOz7RIXm+dCe2KgWuKBiSOcOkJJ0SLcoC4NguTreWtxCL3orPaphtB2ralEVCS8vrMyxD5NkmGvpkmjkaXZlDMJZ9D91A994k62FbcKqnkktIfQjA/FHhumY4Lz+lnPI1wFsql9+MF10JO9wzfRlSbLp5zx1Yyjoy4kT0kT4jAKjrjHDNKbIf3nrfjgqvwaLR+ov8anuVpo9AlEHv4AIMc3dMsakS+GbbnvlepBJul21gc0C/T/a5OwB5k6D43ikKKmhWJmcxSK9D55mzkWPeYxD8gSbr/FdzNTlmYaNhJOrZfSVRwh5U2QG5VBneUEWR9TaTu6tAfU6tCPcV8ofcOXVgWTW5SE8Lg9nP5ph9wlhg4CFkCzJFpUFU7GMkU2tWIxhPaXkr1W4wZO2U/BgcenrLWH3GYNIK0jsYdLmUdsJJ+cC88oYrIvQWYRnY30zwjWzqK/WaK+FPSLdGWid7JromEvY18Mv/zHgBWuLJi62pwr1voVKmnbpw8LmhYP6rX11UsWT+KE+cbLEKt6yxVaw9LFUMxRA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026140227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mBOD5xyOS6TkHzOZfFv/bycMjdEyJOzdORi7xYYJ+OoD+MmaOnT+y8SsnOQ+REDoWON9JA+vvI/2Ng59pFE88uLAxUUi3DtnX7q4gV3tyeMrWqWVQM/oFeb42ewwPnAcuCW89ORJ4najsbT2EjedvHFG/2bIEFyHQU1sCQkMVIu6M/y5yTyBJpthoWJqTBjWZhzqPVjlcrnxmRAH3+sla5prXeo0o1gc4rqwGJMlsi6l8EX3yKI0HBGj6BLJGvj4TDfRwFiKdyJs7X/OqLwcTZiKPfocP9wPtSyHR/46MIItWBi/JxSRi4s+QgIQ/xnDa9tIue9CFK2/dhyHcJ+wdIGVum180HmOjZzmk/p+P+8sUjDiMYlKs0aXi+LftiHAE0nlqMDh7YVtRBXfWN3NiGG2lJNkV6tNlqXDFWKPzSiWTUY9+9z4aRHnQYi1Z1Rt
X-Exchange-RoutingPolicyChecked:
	nbJAxMUGpJ90z1ZMGmzVznkn1xYADikusY5c8UBhFKCNjNJgLSBaD18KTuCiJkToStWRJ+aIQAw6F0TzDxWMz3laYiBz0BNQDOhLreEHqXMFlaBs0qVbRsR+ecCoZkWT0UiHL9Og33eJ91BwLLHpSGxXKOFg49Q1RUYuNUDg+a811vqeIUMI11aToqtqkD57wKZnD47pl6K8Z81JN1gEDQSqxSsZ63VWUR/VJyxnYqxH3f7k9RhAe/8PAQx/EapgYlXrqEa+346Iyix+kObpiRGVfLBGoli1gCsH1H8Lx2n9Epv4DZazKpgbiKMs/wvfX1XeliwyKMOE2gLmKYZaGw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:27:05.0382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8b96ac-ffe2-45b8-59d0-08df4a370373
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7753
X-Proofpoint-ORIG-GUID: w84sFmXT_OwdzWURM8XE7CZ2Hf822TgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9WcByW57YMVw
 5GJ6r8Zyidz5WDDZB6LfpGq0c6lL8Czow0zvfws5ABsos2bUQNZ+cMNZAmv2EP8bWjvIUsluV1n
 7UiK2KI0twaYk09rW3Zuy3qIfZ0gmTj+cOVlW2ZyQI9VMjGbUhqRbocCrY3BBzgutqooCHN+6/8
 lAtRp8bZUhdTNY+I7MbTg17uxuTG3+/rAgwtVftsSoLkQNgaUda1lKgp1QHJWfwuAwHnNRfTJFv
 wNzAzp8vktSGOsRZW1pvZG7aUyDjTOMOf64CeEyFlZZueki/5Vu/3npu5Yl9E6IMDOeme+rUyE4
 xghO0uICh7ent9BSgDTgFBZBSw5xtV+BL3RGvM+VpRQL1JbyskHXH98U3RrPnA0j3c/r13oWbY2
 O03YY4jLQtsC4W6ojg41ILES/UENkdtaer4AByfnYQKq8aCbOEPtP/qnHgNFsZoYYpRfhpFI6zU
 NQ1btrmiu39WwvXN8eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9gJg1ozcM9xr
 qjOKCSgbYn3edYP0p20KFYTRPN9lDCTT2pHalBDpa3b2qpiQbZrISQstcFN6I+ub8YrvL7XHsLf
 vGjouL9S71FmnLhN8hQMvN6KHZ8ngXE=
X-Proofpoint-GUID: w84sFmXT_OwdzWURM8XE7CZ2Hf822TgG
X-Authority-Analysis: v=2.4 cv=CNe/zhrD c=1 sm=1 tr=0 ts=6b059ec1 cx=c_pps
 a=m4QPU8/Yf0DQKtM+qTkXOQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=CXxqVhC2LI_TpgEnjWoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240056

The TAS2573 calibration status control currently builds the register
list inline and hand-rolls the whole payload; it duplicates logic that
is already available through tas2573_status_get_common(). No
functional change.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - Move the FCT status register list into tas2573-reg.h as
   fct_status_regs[] and describe it with a struct tasdev_reg_map, then
   drop the duplicated read loop in tas2573_calib_status_get() in favour
   of a call to tas2573_status_get_common().
 - Derive max from the map so the buffer size always matches the
   register list.
---
 include/sound/tas2573-reg.h    | 22 +++++++++++
 sound/soc/codecs/tas2781-i2c.c | 67 +++-------------------------------
 2 files changed, 27 insertions(+), 62 deletions(-)

diff --git a/include/sound/tas2573-reg.h b/include/sound/tas2573-reg.h
index 4fedc8a3329e..6f8411c695eb 100644
--- a/include/sound/tas2573-reg.h
+++ b/include/sound/tas2573-reg.h
@@ -59,6 +59,28 @@ struct tasdev_reg_map {
 /* YM955 */
 #define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
 
+/* Registers for the speaker calibration */
+static const __maybe_unused unsigned int fct_status_regs[] = {
+	TAS2573_FCT_INT_LATCH,
+	TAS2573_FCT_STATUS_CTRL,
+	TAS2573_FCT_STATUS_BINNING,
+	TAS2573_SILENCE_DETECTED,
+	TAS2573_OPEN_CIRCUIT,
+	TAS2573_SHORTCKT,
+	TAS2573_FCT_OUTPUT_R0,
+	TAS2573_FCT_OUTPUT_R0_LOW,
+	TAS2573_FCT_OUTPUT_INV_R0,
+	TAS2573_FCT_OUTPUT_POWERTOT,
+	TAS2573_FCT_OUTPUT_F0,
+	TAS2573_RE_OUT,
+};
+
+static const __maybe_unused struct tasdev_reg_map calib_status_map = {
+	.regs  = fct_status_regs,
+	.nregs = ARRAY_SIZE(fct_status_regs),
+	.tag   = "fct_status_regs",
+};
+
 /* Registers for the realtime (RT) speaker protection data */
 static const __maybe_unused unsigned int tas2573_rt_data_regs[] = {
 	TAS2573_TDM_DET_REG,
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index e44a1d460c70..2dbbd13f5e81 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1605,70 +1605,12 @@ static int tas2573_status_get_common(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/* Calibration status control */
 static int tas2573_calib_status_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
-	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
-	unsigned char *dst = ucontrol->value.bytes.data;
-	struct soc_bytes_ext *bytes_ext =
-		(struct soc_bytes_ext *) kcontrol->private_value;
-	unsigned int fct_status_regs[] = {
-		TAS2573_FCT_INT_LATCH,
-		TAS2573_FCT_STATUS_CTRL,
-		TAS2573_FCT_STATUS_BINNING,
-		TAS2573_SILENCE_DETECTED,
-		TAS2573_OPEN_CIRCUIT,
-		TAS2573_SHORTCKT,
-		TAS2573_FCT_OUTPUT_R0,
-		TAS2573_FCT_OUTPUT_R0_LOW,
-		TAS2573_FCT_OUTPUT_INV_R0,
-		TAS2573_FCT_OUTPUT_POWERTOT,
-		TAS2573_FCT_OUTPUT_F0,
-		TAS2573_RE_OUT,
-	};
-	unsigned int j, k, val;
-	unsigned int i = 0;
-	int rc;
-
-	guard(mutex)(&priv->codec_lock);
-	dst[i++] = bytes_ext->max;
-	dst[i++] = 'r';
-
-	for (j = 0; j < ARRAY_SIZE(fct_status_regs); j++) {
-		dst[i++] = TASDEVICE_BOOK_ID(fct_status_regs[j]);
-		dst[i++] = TASDEVICE_PAGE_ID(fct_status_regs[j]);
-		dst[i++] = TASDEVICE_PAGE_REG(fct_status_regs[j]);
-	}
-	dst[i++] = 'D';
-
-	for (j = 0; j < priv->ndev; j++) {
-		dst[i++] = j;
-		dst[i++] = 0;
-		dst[i++] = 0;
-		dst[i++] = 0;
-
-		rc = tasdevice_dev_read(priv, j, fct_status_regs[0], &val);
-		if (rc < 0)
-			dev_err(priv->dev,
-				"chn %d fct_status_regs[0] rd err = %d\n",
-				j, rc);
-		else
-			dst[i++] = val;
-
-		for (k = 1; k < ARRAY_SIZE(fct_status_regs); k++, i += 4) {
-			rc = tasdevice_dev_bulk_read(priv, j,
-				fct_status_regs[k], &dst[i], 4);
-			if (rc < 0) {
-				dev_err(priv->dev,
-					"chn %d regs[%u] bulk_rd err = %d\n",
-					j, k, rc);
-			}
-		}
-
-	}
-
-	return 0;
+	return tas2573_status_get_common(kcontrol, ucontrol,
+					 &calib_status_map);
 }
 
 static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
@@ -1696,7 +1638,8 @@ static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
 	 *		Sine gain for Device #i (48 bytes)
 	 *	}
 	 */
-	ext_cali_start->max = 39 + priv->ndev * 49;
+	ext_cali_start->max = calib_status_map.nregs * 3 + 3 +
+		priv->ndev * (calib_status_map.nregs * 4 + 1);
 	cali_ctrl->name = cali_start_name;
 	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	cali_ctrl->info = snd_soc_bytes_info_ext;
-- 
2.53.0

