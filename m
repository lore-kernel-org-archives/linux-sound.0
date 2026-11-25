Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607521;
	b=ZiElHK/w+hkwgLFYxAZVivxd5d4ePKaPFHsC9zlRmtKnEIeOGIyM0mY/6J7C/KRpIp3O
	 V3OO8W8qQ2zcQvU6uJHnqqxwRM/6klKcLT1ZUCOGL9kzsSF2QMRwODBdtpo6JcIWHx6bj
	 rmgk62jSYqDwDmyQYKX0EYCbT93osN2VQzidgHj9mWN/lisAjf9hCu1AM9RsmJeygRtj+
	 vdzQ5AxcEoNxQ56dX011OZVI+1TUejs4cAx1DOrrCQqvFtOGjc7GYfZzqN6h5F7L7uB5j
	 tGTS1pVK7RFNhwE0xt19WTLtgPcu94vWxtvOC8LHimaL7Gj1S/GxcyCCtuZ1KdA960A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
	b=C0rz0cTc1qxA6sAUL8Q+zTUqg1Sb41G6KBeiYduaa3z89T47m8wv15HLalKIbmgp9sEu
	 FzAfaNAaZApSjy0EwTXohejZLHrfgiLTCMzCvIhUedo35oFThTKig9IShnuonCPRXo2If
	 ZHq13nvhr3Rx0TsXeO/3M/froSANZA76Fql5nfxUIqfxzv9b9ky/ZY96Lh4kRtHbCLL5/
	 vCpTu24gaQIgnZJlfufoHYzH2MZxz+KRPUt3KASjbgx1uX2S1Oih6vs4eTrW1pBZtRQ2y
	 MLNCuf9epUHh7XX4arLmrJYfA9Kfij8BzpwPd+tzuDj0jg/8qgJlJjAYMpmTtNhlI9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kqxOjv8v;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=E44oAF5q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDB606A321;
	Wed, 25 Nov 2026 11:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EDB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kqxOjv8v;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=E44oAF5q
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVLC102388;
	Wed, 25 Nov 2026 05:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=; b=
	kqxOjv8vugtzrxbySPzAUR8s7hWXZ+Sngqgm7o6lK8yyyi7OVS7rlb/3gyK2G4KE
	tsF/3Obep222l1He17vfRyRib8zNoxoG/sZnpF/BScz6mtJEAu+cDDqgBm3RsvH0
	LcwtKwXYaH/z2Jz5SzpmFNvEW9BKiNRU7oJ5VoCTDQCDLHgrNnxs3FuSEkilQ42+
	7DUccZlFo2jw3KHqv22Rbi5FJDFFKIVMK9lnrH9OSu6ZSbERS4RYvOdmCm3S9/GJ
	PrehIu/i4YkC0esK39xEdZOeRx7yzzT/0+WnIAou7VzHerAaZ2yx0qgv3/66A4Eg
	Jo9q0WCUZeiDrhtF4VJp2g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020095.outbound.protection.outlook.com [52.101.201.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZMbkDUC2HzkTNfZLtSuYH0D21MprbIkSvJg6fa03WdVYXrzYeiKQjNgWTkpSaLba/2EtbKCGq7URKNfMyXmPqQwlwMOtPClivsokhnuKt/UtJORGgCLBtXJX/y/TnjNKR4cG8ZEgz72uffyOOMHoPILEzXKH68/S5Egu4cXs2oHbr+tbYFtYp64UdUD+l9KThpLdmrGQM2+lC858sLN6DmB0GkPD5exFXZ26s6R2S8Qjkn3mPXr+CMwvxih41t4JmTbC9xlasH8hGqJJwBIRpPbz9C4pfe/Mvgf83SoP4jYmChFh7JqnfvNSW6wjaW+LcLLN5QnG/WAaTQ1Uzhbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
 b=gPrHzlh9GDXnKPhOKCvQj6wU6l2tKucK1lYwQEHPq0fjfE+c9tEgso4nwotKHM6TRSZAnODRrlORhELcHcCTeX5PpTbnRW1OKpA5M3oPK25gEqgp3RDwCC8qB/XfOG5CzzUI2zjXWXq6Oj6XkW61/CgOiyDHm2kweFbMrzH9cZ0lQoCPWxqjoab+Hk55kI0TGl0+NgbbA7mHMrHPkIpmoETOfPDg0KUkr/5MaaqMD3qwGdKT+OY+8JzDsuY+KleGLQJy+rBQQptGpGwp7ya8bWiHxN6GuHXSo2LlkdXmTKdUnZmoR9KS6whFzoK8qIP/UFWNTggDS3BNq2EFeL3Fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KFd5MiQ60uBF3UC60eFTxmCSngWN3R/qdB8PMOamRA=;
 b=E44oAF5qkDxzISsniOWekKo8bOlGE2Lr8NDxTC2X6OJSfgLrxNJBMmmbvLIwO+bat7rAvXeZPb4tHv/KvfPZB3YEhLjMLMb76fO4vLXDHwgX5eU6z2O9PfyVL3GOV1/Ape/6OMJxpc4eUMYDd047AbKlxE/nF9SVwZupLEH+YIc=
Received: from PH0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::10)
 by SA3PR19MB9572.namprd19.prod.outlook.com (2603:10b6:806:492::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:51:37 +0000
Received: from CY6PEPF0000004C.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::a0) by PH0P220CA0027.outlook.office365.com
 (2603:10b6:510:d3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY6PEPF0000004C.mail.protection.outlook.com (10.167.247.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7C82B406552;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4137D822542;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 1/7] ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
Date: Wed, 25 Nov 2026 11:50:43 +0000
Message-ID: <20261125115124.9130-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004C:EE_|SA3PR19MB9572:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81690f31-369b-4a76-549f-08df4aea7541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|61400799027|82310400026|261021123027099003|10067099003|11063799006|56012099006|261009223027099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	o5iShJIzaSwP57QcUsfCZqIjOuTOq0cbPHxJ3GTORpXVr5zAdvwJkji3Udq5Ig5GA2VGyJTUxrRCv+LmfPg7oaqmwHVd0G88bVHslT/vlHX179irYQ24CFvvZJaU+lHcFJFM31xeVH8BVw0IlLinXdzOhCgF2fNUmQpKbHPabGRYhLFc8tDKciPBcKEYvGr0cb6kbNAh5DHkE70552joRCDxLfCoVTftuFwR09j/EY0Lu9rAHqMCg++TXmLxdNKhWTVVHoe9xICpUqVe36TX0aH4hxLZp1dXB3UBlvJLyItid1HKhzV0rP6PZ96uzm5wU5K9N0cr0CQRpEpWCWW5rUyn6hFlLWqaX8O/V1KbW6DzfdoFPsDG1Owr8mMdItNnuDOdvadbnwg0S4zOudDnU8WsWImYq/yLMIqEWPUo3UWpVmDL4+O8nTYzpM1q8GQIlHLnIxVDBYYrc35+q0yS0HsEOx6VlZEGouRQL+7RwH9y+UmIAIha4Rcg20QCD75TkjsNO92GVmLH7GkaoCOM/Mf4RHOAUX5S2+Yded9MiT6BFAallhPDH1qCH3ccNrJbBIYqg1wq5tYeGeB/WNM5Wwd2jCtKr3JLKg9Cs92D2dtdu37oxPm+exXsjUjHFdkPqmqCiJr3QP3M9fmBoBr4yjRQC6VKpoYWhe6Xvt9p8XIOxyJePUZrAtih7HJHMHlUVd/oG1HK8Kgyw7WunrGUKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(61400799027)(82310400026)(261021123027099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xpjZ6JNjK15enyTPh7heQiObuz2q/Uf7GwU7IkSYvdXBWPJaVeROTOrRXvUJvIB3ud/v5xESD3tgyzV0gw1iOsiViy5iWr04/zr28MlYOWria9kgJntJ8A38uIl5hqhc3JBtTGyF8U1+dn3p9oDrwLDSYukw9ft+QiT5w3wmMMZDQHLHso5DCQ3oc/1Vkbro4Pc0OH3cbupNj5/97nIomy5YOTawoNLELkqdVdxUDZrgDol8X+v/3iEzH9U+TNJo0+c1WhxzRb/RN+6cwr6B9ecThp3K/bLHn3T6NzC52OajUy3WRQNDGnQ0u3dJcEBEfbuEGYNAL4FzULvP/FKRx8q76GHU93F7PVJwajVYb9oeVIKLDW2CykGbPHs94ipVJPzzB+GIDxHs1cDRMXQbPcaPF6yOh52m8lr465uDQWE+xY5wZbc4GDc7jSlzoRGi
X-Exchange-RoutingPolicyChecked:
	Y/7uacCWDa1sVwFQRtM7eGSlnpXckyN/hintXmoUIHpvrV0F6Zpqy3Ec7HLVSTBGRNjdqDEJQijeHgnjJdrnA/WVNILvmH35QtyyAxlWeK5U5rz9tSuLrOjB0kK6rBvqzsSGbDhPU70Ml4g5SO8uEhe6suv5gFsAXiSTAyCMt8Rv6LJTD9xXdEnn1ob08PMP/9fl0vUnfYrvxCv8gcPtfPcrooNNJ3GP1H+BCPIYJwf/p4z5MRzbnVTYuJToEJFEHNNiy4rMuItP7S8Czc5q8JAhdnQMe/r4uXNFB4ElbNOO1/v4YlmzxDSQkDcEU9ebaS5uq7laLxbeTCwy5w/1fA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:35.6973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81690f31-369b-4a76-549f-08df4aea7541
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY6PEPF0000004C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9572
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX5He1ttIlrUy8
 MQiXOPdxmc09JSOAYdfboa9OS0lgxN3VgDTaV2WEwdsj7sreqo+Drc7blBKr/v+LAvGHKSB/9MJ
 DV3JmQLztSzFE9A7VxvjYP/uL68M/xcTJvSuoT7qi2w10cb7h/l9DKXkWML1PwnNR8k1etEXcKt
 Hk32EP5fFP3dpwv8UG0li5s620FQeUnKR/Ofe5lG38PGaNPX64K+X8VIo7xAnaUB4/8kVX+L41C
 6jwW6LLWpLeDjgz3efkg1K6ZwUVjIHxdgAZqfY7zpvTqph54A7KHfJ0osL7aaTqWimEWQ67mF5h
 nFtaDpBuHssxUTQ+6vCqZVZIc/3ZtVmlv1xDNWRriJrkAMcopMPlUsX38NWt9oXlYphdCOoj6EK
 Wq/h644M2jo/hE5b5kyx4h6B6/PWvqIeK3xyVp895QerTxxpp+D2kZ/PaO3S0eWXMq2LCrgPM6r
 mrV4JpJIQAc86VjptUw==
X-Proofpoint-GUID: 3B723pC6x6znukXF1TQ4ki_gE0eQJekh
X-Proofpoint-ORIG-GUID: 3B723pC6x6znukXF1TQ4ki_gE0eQJekh
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbce cx=c_pps
 a=kIUNUHS17e34GyAlH7lOBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=Zas6cWl2SmAYx1GdacIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX9z2j5+uvS+vA
 OZb8uURXVYGCF3ZnZWjrGEgLuekosC5mpcMWnzsnVQArx8Zi1BEBzqcZtyKw9bjOOHcfN3UiYRl
 ckuC+v/RhGL+rP54WmM2mAKFJ6pNwRY=
X-Proofpoint-Spam-Reason: safe

These calls are there to prevent sleep when adding or removing device
links in the bind/unbind calls. However, since these calls occur in
probe and remove calls, where sleep is blocked, this is unnecessary.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 919630c11018..f6910916ad47 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1443,7 +1443,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	unsigned int sleep_flags;
 	int ret = 0;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
@@ -1492,10 +1491,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
-	sleep_flags = lock_system_sleep();
 	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
-	unlock_system_sleep(sleep_flags);
 
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
@@ -1512,16 +1509,13 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	unsigned int sleep_flags;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
 	if (!comp)
 		return;
 
 	if (comp->dev == dev) {
-		sleep_flags = lock_system_sleep();
 		device_link_remove(&cs35l41->codec->core.dev, cs35l41->dev);
-		unlock_system_sleep(sleep_flags);
 		memset(comp, 0, sizeof(*comp));
 
 		cs35l41_remove_controls(cs35l41);
-- 
2.43.0

