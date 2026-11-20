Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192263;
	b=nlTDCEZ2HDDAyMN2yRWq6aXlvk0+2ALUyXOLgGQ6K//7Ir/ZLlnGyGUUEKmychZTQ6r0
	 gjEWGxbM12Unulj5dwph7Sk+uYp6d37OC6WsHCgNKg7imCijgUKjUrnTSMj3K54/BjtFX
	 YBgNjIpnidR56B1fuXGcXUH34rqv1mXLrHm6wapXYOy0HzLcZO9+6OtjiEAomsE+RysZL
	 RWYDvwyatrH58JO5gGMf3216+St+G0NhejVF3nJykAsWdtCMBucPHdkRj5d8KRrKA5SVt
	 X5Zl9d+YtEwdXJxsrXMchkWT5ID2JIylQjMtYNoORM6JzSn7Lywu0isf40NFq/K4DMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=N0hrCcvyKOlQoYhlUjP2utAw/nprjpoIWdHNvfBgYyM=;
	b=t6wtQi5P5jaomkJnsyqUXixvzgC6B5BIGkcRmPLXDVbPnXkcEHo7mdcz254f2W6jqswW
	 MVWxXJ8JQEFm3kE91TWSOAge8nMWTgm1R4DrkT0SkDfzc4eQXHNZ/Z8U4KMpufnH2m4Bf
	 BNanWOfHHiCKD6RKii/0+yCdnAtmcILS3l+w1Zjypd6u5vpFgYGwLWMF2TVgh3+hBF44v
	 5wC/GKGtD20LxyZ/j3nEHIskCIRKcvmxP16LpIQqtLFLHlUx4T96lnoR/V9F0Ino1DSsk
	 IXVCSArLOnUHz9IGUtBMcml4zsRvmWFksXcHHhdLKoUF92kgVkFXw5UEQNtj4NtH+xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="GAvsS/rk";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=TOc481dw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE4E60A2625;
	Fri, 20 Nov 2026 16:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE4E60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GAvsS/rk;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=TOc481dw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFbwo43095345;
	Fri, 20 Nov 2026 10:30:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=N0hrCcvyKOlQoYhl
	UjP2utAw/nprjpoIWdHNvfBgYyM=; b=GAvsS/rk2rkeoXpfcPWqKZXMUKYE/Pvm
	s30BeOnwpjVAK/uhf7GDeLFnc38yQANabd0mnwPTgwIj+W1AP1K8KXggqIvpuf8W
	d0ynacnivnW5GIm2axCY4KSt5JpEGiPW7WmTNqWoadbDsna6MCLEGFagZgnkWNsP
	E0yoNSXrFFJUMQZ+8h7ehVsWU4LnFdicX5K1IKxi0l+QfRzjYZNsTV9h53912Ocd
	B8Nmby9wjwOLR+8w2GFHBW9mPvp8dEu7pJiwnbBCrNqBNovNIW/9bL9zM0dEOnXI
	ySgmCrsLng2SNbFESkohtcyrYv4kMXWCVDA+Og3HSvW/0Exweg16wA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022100.outbound.protection.outlook.com [40.93.195.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhvx2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:30:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoMm846WRicfRhWryMzoW+LX9hEUzVkWjtZ9vaJbQ20jngJYMly/9yEBG03ozUkh4zmh+hBIgNLpklXhGC8tGOoPoOYmF5G1RBXPESOX58lXcHLNJe+F9/6Ui4KVfXei7idFVcMKXkyhhgM7rypnoO55lyEOQU0mgVw/oMhMHCHmMsgkomfykQmIzdtTIe5GB4elz2fSfy9V4Z2MyoseWMris+B0hh3qoixpqqKXB+dh+WpifX0aN2FU9eDncDxWsHSNvRt7KHEYch3LjffqDbptxQCd3tE7b3b9e89Hs5KpGhfq/soCgKQB+ZFifk1W2sJ6ace2WfcMUhzRAfhOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0hrCcvyKOlQoYhlUjP2utAw/nprjpoIWdHNvfBgYyM=;
 b=hBv04k8RTQoCS0jwNGDUCBBNBl46Wzf8SRu+6QRoTQbLkJUn+tuGeX7mvhTLW156cZ8NlYb1Rv+rUHlTJH4KUtYEUc81xYdGs4kiOGzXL5KE6lct/ViQRKoO7OcQpp6PT3JmKEGmRbbwrKmew0meaCXKwosrobfAPKi+DUQATxosYF/MQCSHSRIWKpVfdOxZ4lCSQyN/7nnhGTyCVRzUDTxwwQll19iHsUh9DyBFfs4QzXqO53SsGQRxc30bZnP9s7b1vH6nIhf/5sb3bONLk2NSAJX7uCT1jb3cNLHgthgZuNISrAHBM5iaJSbKuSX/h4GydZRWDOmejaVG2M5DOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0hrCcvyKOlQoYhlUjP2utAw/nprjpoIWdHNvfBgYyM=;
 b=TOc481dwEc5Bxw+waQlKgJ0y4JuFOr5e2t77Y9R/iLhkJmw0qpV3Mzy/LZEhNEWVCHuhxjcU/SlAwPmSq+4BjOGqKFe3ZT5Gk04VD1sOFKvQ9WU0Y4ajEU3+yELumJCmBwHTtITJ6ryZJn2oSmZf54bM6x8i3nYNGJMYwGdicQY=
Received: from PH8PR15CA0010.namprd15.prod.outlook.com (2603:10b6:510:2d2::6)
 by LV9PR19MB9157.namprd19.prod.outlook.com (2603:10b6:408:2f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:28:26 +0000
Received: from CY7PEPF000000EE.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::23) by PH8PR15CA0010.outlook.office365.com
 (2603:10b6:510:2d2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:28:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY7PEPF000000EE.mail.protection.outlook.com (10.167.247.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:28:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C768D406545;
	Fri, 20 Nov 2026 16:28:23 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B735B822540;
	Fri, 20 Nov 2026 16:28:23 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: SDCA: Use Function Extension info for FDL
Date: Fri, 20 Nov 2026 16:28:07 +0000
Message-ID: <20261120162807.1568409-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EE:EE_|LV9PR19MB9157:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 87dedd62-4066-429d-43d4-08df47234d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|61400799027|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102130727099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|18002099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RciWov9+o5QRyGFVTfct0jSQ5+dlaKFfTG/WGanY1kUAY3KLM8SdNK5s7j8+GzYyQua8p4vlqaXPnPUczsV2uw7Xzu2sA90xO8QtLMFTknlb0x6xe1ELJeBwTGbZwyEyssvDHNZNTsqo5CJtzprnkf0xr1ML2R5lFCWZYho7KSt5hDnx3K8Rf4pbLsTFMTMvOcwnUFO0hGiAUvQe4R5gJkh07Pt39MD7zORv7yOLaSdsfwCeg4nduJ/+k8rEGlNViVY2osCHIJQQ8gPCbuq0gDgWWHij9pY+klqn+/UrXLaJ5ogr+vkrbgV1GYXbV7EZec5cihHLj8m0sbPZh/9TRO2cafqNmDz/Cy9YNfItO3uQfJvO3fuFOjwcnhLluoYqz6mvXX2JbITF7rPW+RMrAMF4019VJEIvvWrXDoJbLgistwRqf+kuiLZ5aQ5W7ZH7aQfUDfgV5LhAjMpI2wqutp9yByKNgvdYWZkSTdClIvI4WthKKD0c9iu7zMMywHi/of6GFfEQH5S04yrA0H/zi1Vbg4iSOrTkcpNWmzmMV6BRxxRI+6k4zdSuoDmiocP+WNKiEAqNWKVpleTTQD2BZs3ex8hH5lts/yNXG6nQxztNQhjG/LAOc3LWdmkItJs2fTNNOOntxww7edFU04zB2PbCcii0WGTFsI+NHyMscnlYIPiJvyBFSZVHk/6wLLzirMItPCV2CAjq2bFp+pohtg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102130727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfAyZufe8YmysyijPe2UeQNxaBRyYHwkMsRTfhvwJ795rxLBerR+1LPtbM3Z/cbWqCijKDVebSLt8glVb2HRNS1IyRjXrv7cMtXxwaRrc0EnBe/pOGzjz3Gls2A2Ax1WtGHqG8bd3bA3hASqO3I5sXUakHVeoyCC3sD4V8ghxoIyjJkd1Y9YTVYHoubzBbVPT/dlsyqWxbum2WfIqWeq9y4r/QNE5VfgtzcuJ3Br7bg4t+qH0mZDKp40+eNkW46xWJWHzPaRFUI5uGrSS3zp2IxMnljZ2EQ9X27YN9kMmogJtnUlpQQTfXETST5uuUGELzVcYVVnZcYunm1pDHzjzjOWrIG2afv6N30LINEWGAlSQZ2ADkf2Sjj3sVHDvzSBAAGM1HvuCw0MBC53MuO2y1JkD6lShGhwVsdQc3PhuZyVD2TfnKh59qBCVCVQR0C3
X-Exchange-RoutingPolicyChecked:
	PXHTlCXF3qFwgRubFM9xqAKOW/9uKJXv0QqT4GXFJ1r6p8HAI0pGBVLSW9xVbzQGX5sIuleKSbrJhXeGT+qVUqmlPzvgkdM/gLTcZL94Quugg1UsYr3bz7lxx0JLQJ88MIAQNFEACdDeA0bcLfUQrQIwZPmD6Abk0Sh6y/G1Z7f1HxpbWADmaY+YaGBLi/DmJ+jZZXXEpZSzUmK5BrRhQMYAeT9xBOSviF8NhQCO7dEK4go1cfAfJ7VHunpbd+F9j8sKLI+tSrdp9nA2Ze4JOm7przKY8B+vzTuaxRzSD0/a40OeIe++Z9HnKnzCy5hKRsdosCmx6oQlrF5LqYSyXA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:28:25.0994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dedd62-4066-429d-43d4-08df47234d2a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY7PEPF000000EE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9157
X-Proofpoint-GUID: v0QZsbDRngChy8UdLQK-DkMM8PGzT1YE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NSBTYWx0ZWRfX23/eXOVvtvjM
 LGPeu6IAWfioEkPWFBO95MKOz2/JSChrzGB90/uzm0sKb5VYSr4cI5Q1ftwVHqaSMOfpjI+KFWe
 bg8cjyjHdcOEMLUgSZg/+Dl1Nk5Dn4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NSBTYWx0ZWRfX4VYXuKo7iHb7
 gN8VZQRc/M/sFzaXmonFDoImdI7i4E3nPrHexWRu7GGlW7kaB+hW15x6EsMI/UZh9K/kIvlGYy2
 dm4UFeBv8Kwvg2QOtjCFMt2k5MTuqco45w6rJ+IRbexxX7mFYk4gDENIdjNsuDKFfOQpSB04JVk
 3VWVoKcTSs4j+3Pb1/M+rDOF6odl5rJAMh4ur5g70LfykUu8xcSjrTuvKecDjv/sNCzQyZAdlsX
 SQeFBbj3ILq5V5oCPQZU7mVKY3s6aVjk83wjoTBZxP5CqzBIEm8XhCGX9DIpVKr5OPvYJFrpfYh
 PQz1QTCVNQkrVaNpoa8NA6zDhwWcK1vkZbgN24vjLKWwOlUCJSIFi/xQQGkEx35mVVwgOlA35id
 Kzv2/Yq9k2nY8U5tVx8GMGaYNR4HGjYnZM/olqKylm+f9Nwwz5o9DQXPJKgZ5elo0rUXlsaWgmk
 v6A1ck+ugqZsg1sDlcA==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b0075a9 cx=c_pps
 a=NdJUlaw63gEkhoowhPQriw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=NI2tKjdqt5RRJgUe-90A:9
X-Proofpoint-ORIG-GUID: v0QZsbDRngChy8UdLQK-DkMM8PGzT1YE
X-Proofpoint-Spam-Reason: safe

Add additional way of selecting files for FDL using Function Extension
ID and Function Extension Version, following Windows' SDCA driver usage
of those controls for FDL.
Make sure the introduced FEID/FEV search path is separate from the
'legacy' SSID-only search path in case some vendors choose to re-use
SSIDs for different SKUs and identify them by Function Extension
controls instead.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2: Removed goto from error handling, moved dbg prints into the err print
---
 sound/soc/sdca/sdca_fdl.c | 150 +++++++++++++++++++++++---------------
 1 file changed, 92 insertions(+), 58 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 7fc809707944d..6c34e68fe729d 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -147,47 +147,77 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
 
-static char *fdl_get_sku_filename(struct device *dev,
-				  struct sdca_fdl_file *fdl_file)
+static int fdl_get_sku_filename(struct sdca_interrupt *interrupt,
+				struct sdca_fdl_file *fdl_file,
+				char **disk_filename,
+				char **fallback_filename)
 {
-	struct device *parent = dev;
+	unsigned int adr = interrupt->function->desc->adr;
+	char extension[sizeof("fe0000v00/")] = "";
+	struct device *parent = interrupt->dev;
 	const char *product_vendor;
 	const char *product_sku;
+	unsigned int id = 0, version = 0;
+
+	regmap_read(interrupt->function_regmap,
+		    SDW_SDCA_CTL(adr, SDCA_ENTITY_TYPE_ENTITY_0,
+				 SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_ID, 0),
+		    &id);
+	regmap_read(interrupt->function_regmap,
+		    SDW_SDCA_CTL(adr, SDCA_ENTITY_TYPE_ENTITY_0,
+				 SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_VERSION, 0),
+		    &version);
+
+	if (id || version)
+		snprintf(extension, sizeof(extension), "fe%xv%x/", id, version);
 
 	/*
 	 * Try to find pci_dev manually because the card may not be ready to be
 	 * used for snd_soc_card_get_pci_ssid yet
 	 */
-	while (parent) {
-		if (dev_is_pci(parent)) {
-			struct pci_dev *pci_dev = to_pci_dev(parent);
-
-			return kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%x.bin",
-					 fdl_file->vendor_id,
-					 pci_dev->subsystem_vendor,
-					 pci_dev->subsystem_device,
-					 fdl_file->file_id);
-		} else {
-			parent = parent->parent;
-		}
+	while (parent && !dev_is_pci(parent))
+		parent = parent->parent;
+
+	if (parent) {
+		struct pci_dev *pci_dev = to_pci_dev(parent);
+
+		*disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%s%x.bin",
+					   fdl_file->vendor_id,
+					   pci_dev->subsystem_vendor,
+					   pci_dev->subsystem_device,
+					   extension, fdl_file->file_id);
+	} else {
+		product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+		if (!product_vendor || !strcmp(product_vendor, "Default string"))
+			product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+		if (!product_vendor || !strcmp(product_vendor, "Default string"))
+			product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
+		if (!product_vendor)
+			product_vendor = "unknown";
+
+		product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+		if (!product_sku || !strcmp(product_sku, "Default string"))
+			product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
+		if (!product_sku)
+			product_sku = "unknown";
+
+		*disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%s%x.bin",
+					   fdl_file->vendor_id, product_vendor,
+					   product_sku, extension,
+					   fdl_file->file_id);
+	}
+
+	*fallback_filename = kasprintf(GFP_KERNEL, "sdca/%x/%s%x.bin",
+				       fdl_file->vendor_id, extension,
+				       fdl_file->file_id);
+
+	if (!*disk_filename || !*fallback_filename) {
+		kfree(*disk_filename);
+		kfree(*fallback_filename);
+		return -ENOMEM;
 	}
 
-	product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
-	if (!product_vendor || !strcmp(product_vendor, "Default string"))
-		product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	if (!product_vendor || !strcmp(product_vendor, "Default string"))
-		product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
-	if (!product_vendor)
-		product_vendor = "unknown";
-
-	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
-	if (!product_sku || !strcmp(product_sku, "Default string"))
-		product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (!product_sku)
-		product_sku = "unknown";
-
-	return kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%x.bin", fdl_file->vendor_id,
-			 product_vendor, product_sku, fdl_file->file_id);
+	return 0;
 }
 
 static int fdl_load_file(struct sdca_interrupt *interrupt,
@@ -197,7 +227,9 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
 	struct acpi_sw_file *swf = NULL, *tmp;
 	struct sdca_fdl_file *fdl_file;
-	char *disk_filename;
+	const char *source = "ACPI SWFT";
+	const char *disk_source;
+	char *disk_filename, *fallback_filename;
 	int ret;
 
 	if (!set) {
@@ -231,25 +263,17 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		}
 	}
 
-	disk_filename = fdl_get_sku_filename(dev, fdl_file);
-	if (!disk_filename)
-		return -ENOMEM;
-
-	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
+	ret = fdl_get_sku_filename(interrupt, fdl_file,
+				   &disk_filename, &fallback_filename);
+	if (ret)
+		return ret;
 
 	const struct firmware *firmware __free(firmware) = NULL;
+	disk_source = disk_filename;
 	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
-	kfree(disk_filename);
 	if (ret) {
-		disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x.bin",
-					  fdl_file->vendor_id, fdl_file->file_id);
-		if (!disk_filename)
-			return -ENOMEM;
-
-		dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
-
-		ret = firmware_request_nowarn(&firmware, disk_filename, dev);
-		kfree(disk_filename);
+		disk_source = fallback_filename;
+		ret = firmware_request_nowarn(&firmware, fallback_filename, dev);
 	}
 
 	if (!ret) {
@@ -259,25 +283,35 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		    tmp->file_length != firmware->size) {
 			dev_err(dev, "bad disk SWF size\n");
 		} else if (!swf || swf->file_version <= tmp->file_version) {
-			dev_dbg(dev, "using SWF from disk\n");
 			swf = tmp;
+			source = disk_source;
 		}
 	}
 
 	if (!swf) {
-		dev_err(dev, "failed to locate SWF\n");
-		return -ENOENT;
+		dev_err(dev, "failed to locate SWF: %x-%x\n"
+			     "Attempted FDL disk filename: %s\n"
+			     "Attempted FDL fallback filename: %s\n",
+			fdl_file->vendor_id, fdl_file->file_id,
+			disk_filename, fallback_filename);
+		ret = -ENOENT;
+	} else {
+		dev_info(dev, "loading SWF: %x-%x-%x from %s\n",
+			 swf->vendor_id, swf->file_id, swf->file_version, source);
+
+		ret = sdca_ump_write_message(dev, interrupt->device_regmap,
+					     interrupt->function_regmap,
+					     interrupt->function, interrupt->entity,
+					     SDCA_CTL_XU_FDL_MESSAGEOFFSET,
+					     fdl_file->fdl_offset,
+					     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
+					     swf->file_length -
+					     offsetof(struct acpi_sw_file, data));
 	}
 
-	dev_info(dev, "loading SWF: %x-%x-%x\n",
-		 swf->vendor_id, swf->file_id, swf->file_version);
+	kfree(disk_filename);
+	kfree(fallback_filename);
 
-	ret = sdca_ump_write_message(dev, interrupt->device_regmap,
-				     interrupt->function_regmap,
-				     interrupt->function, interrupt->entity,
-				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
-				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
-				     swf->file_length - offsetof(struct acpi_sw_file, data));
 	return ret;
 }
 
-- 
2.47.3

