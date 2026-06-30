Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0D3DD500;
	Tue, 30 Jun 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844333; cv=fail; b=jVwbZp95SVvpcUXFoHeBZ/zx5mIZAFL8gjZ1K6QNB3ANS/xwzkFwj4jLmQISaC8HvVpW6B2QUc9lK8U1nLrqUYeHoFv+I07Wm0uStBER2qW8/4VQvM+WDHgdOKUNzuZzmx85nJ1zgsbt6UcuYDJBFbvrdHIodoj0lsuoFLUHheQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844333; c=relaxed/simple;
	bh=rWXTi5RO9RsbXhE0nLKBEAKNL/jIaBNl5DoLmlPnugs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVDjqff1TJxgAAEh4vU7fX6funOvj67hxUmvRcX4eYJwubDDL9o0x9MTFE/m04TKd915d5NILVjs+rtTWJXjiU9R7GbbMEd3nvLXgrqycnm+vwR4YXij/EHqyMHqNWD7p0yiRsLi8n0DR6XT09X8RF/p27deWTFR9g5VdbJ8urs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nmXgRhc3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rNZTQ2jm; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nmXgRhc3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rNZTQ2jm"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UGkcat1053667;
	Tue, 30 Jun 2026 13:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lP1BuWvYtAPUMQdQ2n3qxR3p5G0zvuFMA6LMSTq93
	6g=; b=nmXgRhc3vrGQbWOCbZe+cOXBm3NqdMqitBt2lIWVW7ST0hWl2ajuuO4iT
	Gkl6lCyNRNNDRNLqVaw08f8Z3sbYk968M2SPWo8esG4DYuev8xK1z4VGiOUbAd0h
	8U1uhb5/CyLZ0iNh4R6Ci2h0TvD1bF3sZtQIf1YFuvjG6fBV7xGlg0M1VOj4zhwd
	CaXqjXfQ/O//X34Y1Ws9VDWZ2XJjTVpsJzdaDZUBSAbTtOCM3/dreS3dSTnTy/Ow
	w/+SLNwK2gzh1+DdOGA6XfKs4L9zrAoo/XkQAn4JRbGNaRcywPCTJmBRvtorHWXz
	gDs8KGInOrhy2jGTqBZMbFJT7Qg7g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqjaf76-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:32:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaQYuklIrWoJ1WIvl5poQOumSINtMrQRpJdMwcbSbL7AbcfG5xl+fKHKsIrhFwvaXB646n2v5jmmgPmahYg6XscWQT+ijX0HH8Bw7AZ6FVw/XCosbjoUH9I9Sy+RjOTj/qaV5YWl6aFWuAN2nDxGfmjrhvrh7eRvzipu6CFJ6A6GcqWgYXYP3RRUR2N/xFQ41PDuR4A4hOrlieCFuf7Fr1kgQjoBfgyCSblPHfmxc58jWFOnoQAYEkE0ZRkw210u4R3qeBZmNJbfhq9SAjgPgyQ3O4Ih2lI1SJHU2NgcHF4Cm1ZsdLE+OHOOjI13dagpe5Ausy2HKK0p7oSGfoHjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lP1BuWvYtAPUMQdQ2n3qxR3p5G0zvuFMA6LMSTq936g=;
 b=S87/uhLNB1n0z1e4qPhmJjzhJMVkXUsPCv40LJtfg26F0yC8JIQ/CeYKRZwqT6d7d9DIopxTrNHbbxuziw6NwRbWE9RMDxHHHeKwg8qinULj6wf2vPKljw1K+q3M87369zR9jIG4BLdunvSmEME0djpHND5wW9M4CKhkv3EptbURkFjICTBa8ndklZZ5UlsgJetrkSk7zbpkFn1fgirA+wVI7JeErT/c1N/PDbbib+LWYiXVKfwJbonsSX2Ha32RM9dm3quk6VYTyeULV1KR1EU/Um6Mx9hZbFatDsuJjZir/sNkppQIGfCLrSDT5gT+7s1kFWF///LmThKdve3RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP1BuWvYtAPUMQdQ2n3qxR3p5G0zvuFMA6LMSTq936g=;
 b=rNZTQ2jmQTcfpI0OuGif4S/L8pPpcnUATvKdau0d5Cq6r0PYF8BKiuSxr6/yDlnYIoOpUogAHKAfpX9NByFFfAHELbpEy/wMKSVi04ziXsP6dKegog4ujrJzSd27V/r1T05aAjCABxfG+jXkoOEqekfCI1XBSnkSC4Ip1q5IPS4=
Received: from BN9PR03CA0049.namprd03.prod.outlook.com (2603:10b6:408:fb::24)
 by SA1PR10MB6448.namprd10.prod.outlook.com (2603:10b6:806:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 18:32:00 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::31) by BN9PR03CA0049.outlook.office365.com
 (2603:10b6:408:fb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:31:56 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:31:37 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UIVbAQ3131831;
	Tue, 30 Jun 2026 13:31:37 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang
	<sen@ti.com>
Subject: [PATCH 2/3] ASoC: codecs: tas675x: Fix CHx temperature range register bit fields
Date: Tue, 30 Jun 2026 13:31:21 -0500
Message-ID: <20260630183126.2588322-3-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630183126.2588322-1-sen@ti.com>
References: <20260630183126.2588322-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SA1PR10MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: d990768f-935f-4186-225b-08ded6d5ddc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	izYspJ2nV3nFNI0wSHIZzCjx1ZJ/QUX3o4zl5LSUkYbYkpwBdfok05g28mSYFhVQIdSUjZbBY6lGv2GvC0RjVkHSbPT5GRbY5mzQuZUdwzIUhqoHXT0eY1UcyuRoxP9bEERidbuUSTZ4pSoOVdHEAHq7Avi/fxvAMe180j530G9FvdvTxB5tGgi3lqidxC/mUAz/hKYfKzapX1qwWpXGNTaQbqYQz7o5IYRB3EETgFdQriREGhLgatGwzSXVaWg+XTriZjUzZE/geLJfAqx5EbHL1DM3jctk8LI6wnRZAounvAKEMEzchlxRm1LcZF9WYBnLWdsMksbKiX0MJkUWFVon0+ox3PH42XIJokFSEwH+23bEygvx2jcp5BmByj5S4cC2M1fmdU9QHVtOC5bwzes51vVgrmaEcrnArytRJdTRiTVEASIRqKjohhGCt3ptpcmtpR3DZCync4qD/2i7jvHLXBIzN98nUNMlyOZEmz2Lf7moQAQ0ybGhY/ZvnyFoAc5MTkP+1y0BN4wq5HOr/rg96lE2uCjEc/pf6dnql6ikLND+5JPwoZvOFWERMJRBkQVvV+PX5zpXsLH9npVO6AHUMTyeqeOA593uCxoZwCOWJMeHBrabA8pwubTvc4O32voo0LRTQx7UrR6XUBuRojZ2jx+ooGxUiUtKFwfwNTkKq3lJI6u9ztBhGesOdBmvhVQAUDUjXIkKJMNfcymjWQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R+9gzOtQZsYmBGd3RlBcuZlghab1CFEbt1uCLYKBCvMJ4AHKet/+GTuTu+6u5ijbesNVQEbj44c6BJwLK4urj72yraQgnl0r8xXoNr32sdusyF0VJae5I1/PbFOrXkEHqxuZJOyOdIghDPBaq/6UgIKQS33YeLNum5JgnNGLSwO3RWEcWzmkZ0HKqYS/B94vekdfVLXd83YMVjhacijePMLJTWkwh5aIwh49a49i8IM7Hpdgf0mxUr7sn868OiNbAEygRITw/DSJvBo4LlPRrvN9UF0Q4D57NSt79H7h1XHnIf0sln/gN/6ZDdnNcYsm2/LkdxN1cCfEUYTKg8uYLcC68NGCDNVVrnvtOrBG30J+38XeHzt5Y3ImDm2iJO+1AqjSB8r6r6pz2U5MGXS4vD9oLOL76gBY6Qz2dvPfzNHxInW3coRCiwzS4oPblzyL
X-Exchange-RoutingPolicyChecked:
	cuMNWqKIa5/dsHEcKlfLO6MEJilUo612XtN5SKSErViIMHFMUqt7YyvMinTyOtzbaXAYpHDguGvyDf5U5fsnOGK5SaUIMJlUl5ymZ+CiRtLfmkeNeX+9cZX+z+pD4843xWpoK1NlzG5Vf3T9U+w9/ryWCv3gXKf1phFcWT25F5CuEvWjIUknOum4sSZ9KSVisN74Lu1TTluk8xMywJD2GHD2eYGEMhwsrdyqOCv3Ny4CUr8MY+dMe6cMYzJoHWdedckffK43D/q/A1Ds7oQQT+LDFFJhJmBteZveTJE9qCBP0XyInThJwTaPtJyHzqB3qtNaHOVMaOTUJC7YG4GK/g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:31:56.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d990768f-935f-4186-225b-08ded6d5ddc1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6448
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX0o3m96DseRQO
 d0TjH2lxc4NhXzeZWA4aNgd8UUpxuPjUzSPILudB3IjbUGB3WWtvx+xGzXpGaRlF/AUHkCpR3ku
 /IHLo5Mhhc3vll9LPRYt4Z3x+hG7FvClnU35eEKWn1z8Cya8CnFL/nV9NLWVQDwjJ4ABXu5GmoT
 aX92+T8T0Jrvv0nEQVlwPzb8GFg51yiuwupYjk+v640YmjghwK1XFB8R0hJoXDbVwHZNxapAB21
 aplfQRscBlX9kAZed9WvWjahFyKVlJl6uc7Z5wUzSC0KS8N26BUc32U9TPF04CU3SujaJ+c1idU
 2lfkXU613EnAQXZUCQg+3ptn+7KR1Sge6Osr16cRu1sFj9kvjsXWNbUNTSCyJ/oowwc/EZ61mNN
 5mY6LaKHGBzmA+MBfhVgZdniVcXWmLeKFaGaz2Qt13jXwNSIdoQe1pA6SJJrHfGaUHbjo0lTSUv
 ZEDgMgy/+zvD4Kmqi6w==
X-Proofpoint-GUID: XBcpip1E9GDWuUdKVzzqGiy-LuqsDVjX
X-Proofpoint-ORIG-GUID: XBcpip1E9GDWuUdKVzzqGiy-LuqsDVjX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX+barbelU51X/
 J2fD/qCbyGbgY8gjKriTCnJXzBQtEEIz0W9wuzm1KyW2ArlWPo/V6QSlqiU/speZeunYyq/uqEI
 viaGTdWRYuo5te5RoBEDDkVbNIfz23k=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a440ba3 cx=c_pps
 a=U89Fr+s++Oy0xugnv2TZpA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=8VxJNB1OqPzlbC-c0LUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300178

The initial merged patch mixed up the bits for temp reg with LDG report,
now fixing to the right bits according to TRM (SLOU589A).

Fixes: 133c81f84471 ("ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver")
Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/codecs/tas675x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 6f89a422f3c6..844cb603d721 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -954,10 +954,10 @@ static const struct snd_kcontrol_new tas675x_snd_controls[] = {
 	/* Temperature and Voltage Monitoring */
 	SOC_SINGLE_RO("PVDD Sense", TAS675X_PVDD_SENSE_REG, 0, 0xFF),
 	SOC_SINGLE_RO("Global Temperature", TAS675X_TEMP_GLOBAL_REG, 0, 0xFF),
-	SOC_SINGLE_RO("CH1 Temperature Range", TAS675X_TEMP_CH1_CH2_REG, 6, 3),
-	SOC_SINGLE_RO("CH2 Temperature Range", TAS675X_TEMP_CH1_CH2_REG, 4, 3),
-	SOC_SINGLE_RO("CH3 Temperature Range", TAS675X_TEMP_CH3_CH4_REG, 2, 3),
-	SOC_SINGLE_RO("CH4 Temperature Range", TAS675X_TEMP_CH3_CH4_REG, 0, 3),
+	SOC_SINGLE_RO("CH1 Temperature Range", TAS675X_TEMP_CH1_CH2_REG, 0, 7),
+	SOC_SINGLE_RO("CH2 Temperature Range", TAS675X_TEMP_CH1_CH2_REG, 3, 7),
+	SOC_SINGLE_RO("CH3 Temperature Range", TAS675X_TEMP_CH3_CH4_REG, 0, 7),
+	SOC_SINGLE_RO("CH4 Temperature Range", TAS675X_TEMP_CH3_CH4_REG, 3, 7),
 
 	/* Speaker Protection & Detection */
 	SOC_SINGLE("Tweeter Detection Switch", TAS675X_TWEETER_DETECT_CTRL_REG, 0, 1, 1),
-- 
2.43.0

