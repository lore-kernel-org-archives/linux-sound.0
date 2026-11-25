Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605554;
	b=kkZqxANn3I7LfDScODSatLAIq14DiR80fHBsyg7d0/rGOKFOXCN1hPbWXjysOSw3PSji
	 IJ9148Oj6Aca30FbXMer5t2OfKJNW2wFH7OY7tyI3UYe5cvfcEpsMr13Ax/omeoEjXcDS
	 xGbWskGpkV5P4LOtjUjIedfERA7+npuISg6yKE4PDDCbbbWMBYQ5boTa2drKfjXYPQ4pe
	 9SEcaipjYclVppqG6z+Vfps1/nmUW50jpOgwbPAgZyVYjoEp+qx/U3XZFJ1pZhEIeS6U6
	 Am5coSDAE7hfqGMT7rtcyPgM3EwM0RVnhp0IcMZSVd6tKJ8PQriYXJreePI1vBQIlCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605554;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=ylsUtXfCfKjMVm/LCNy/6pTYOHBJOOpSovuIwMaBODk=;
	b=U2UG7Q5VX0cXPzCcDSEseuKIJvxYOYYQ6NRmGHrxbwPME+O5J45nxc4kcWZ/OlDVJvPH
	 YBZvjZ+4xAcDXb2M99U4BLYPsOGKNhdkKZKxv7IMDC3aee0yunTIkbtHOAQBQ2rY0Ab5w
	 KJIJ2WHS/NNdOg3eCJCxnwzW39t0wNtsDHqrCQOQyJwER+XXYski4rt3sgryq7hoQFdie
	 z3FNllUAZ6Xe2MKENGDafGlNbOmYxO22i5pLEGEw0XDkl2Iz4aQl9xJfLJ2nV2AGShrW9
	 l1oDU8tBWP9U1N/fPNN3SAsXDxiLWGquOmwN1rltU5ImsqDHHrxVwHWWUkawGmWm0+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=j7E18p2S;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=JA5JLtHT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F5606A321;
	Wed, 25 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB9F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=j7E18p2S;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=JA5JLtHT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APB3nu0034946;
	Wed, 25 Nov 2026 05:19:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ylsUtXfCfKjMVm/L
	CNy/6pTYOHBJOOpSovuIwMaBODk=; b=j7E18p2SLj2xoUjhs2Rv9Xclf/dCIydH
	ujZ7DQ40BkYKcp+O5pCjF8PpxTWv/VHKcTwZ/dDevrbz8jfHnA1Z6hzl5lGcOvnO
	5M7Ajat/1ujt56tbMkkQIMcFQ3cECVQZBALelmAoogESLiH+WV00MOWvBnxrpVId
	oLoWXFAtOJZwlvqU20qJ1b7sPtpYO8pgcbstHXzIhWFYFJqDqBwRt2W8hHxX6QkT
	MDo+o8TB34/h0MENwtRd7QHB7YyNQr9j1q4CW4RXCOVI6KK7duurUtweAQgoGXUA
	WBqgW2XqLsA88M+XQ6FL4tDv0kbPdBz+APJJJtXWcRDXXuBZOSFiMQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020095.outbound.protection.outlook.com [52.101.85.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jahk8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:19:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNlDP+hQDANIRGhqq2pnawL2L5UgE3h3Y01fjE4Dk4SRTBN/RnZkyjRcBHkDHNI2UE7Nrj2wGuHo32a4/ePwDyx5QEIVVh5PNhPawDiXJl50cFAM9EmPNKcBpv18xUD2cv63ZjAq6wfY2KK+4a5igwKygmLOIPqDQNPkd6ZxlQNw2/FG7QI8hj48jDpH+/RncAiOBAIWCNvY9Hx0MSavRvzg5LSYPhZnfLbq6WQRdacFyNN8oYcO9rXxdIXdpl8RV8OYoNYkOWATFdpLPbtwpBF3GjolpO6ZEpwiBou5e/Eyk1glhqwEdgZf2o5xJXYO939gyG7KcW4dvtHqo8n59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylsUtXfCfKjMVm/LCNy/6pTYOHBJOOpSovuIwMaBODk=;
 b=uwcTdUyvOtGI/HS6Xwir/og5c5vS/Lrv4IU0LnSGkGTJdVmQ5+d9vC+FR73m2ir7Nk7SyKJwYJ4V6xqUTgAiFv7ze3DOxzxkj8j4JfkjK9Rqi/z5vUT53vUI4jz7vKuLxU233DW/6IVcejEeB1PDA0Jcsj8XJnTK23YKRyy3hh5lWZH8Eb4ozTb5Rm+eFAImOr5cELjxMalwxoWyAA9bhTUJZqg+3l5QiJ5hhmDfP6zrdL0Ftm0+qfGUmH50xDRr5FQOsu8H77LJNSqNg1FF+yhicG0XJN1rfs03PwAo3CDC6ibJPoMhZ9hieCEWcAl/12fDdJUZQCbWHgN0V8J9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylsUtXfCfKjMVm/LCNy/6pTYOHBJOOpSovuIwMaBODk=;
 b=JA5JLtHTc+O/f+b1DJy8Mj1AtKdZA48ObdTqPw8DWdb0pO/OWx6K53SVjwjAOAYSFZk54zx6CILyy/Gu6gojLPdXmnbIfdahDQ20ZWGz5zRuyrU2cYYitPkoDTUcKSOgqNXKBtlBcQ6mtyEOEzee1P6aUt6247fpMJx0yRLx08I=
Received: from PH8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:510:2d2::18)
 by CH3PR19MB7284.namprd19.prod.outlook.com (2603:10b6:610:150::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:18:56 +0000
Received: from PH1PEPF00062F27.namprd02.prod.outlook.com
 (2603:10b6:510:2d2:cafe::96) by PH8PR15CA0012.outlook.office365.com
 (2603:10b6:510:2d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:18:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH1PEPF00062F27.mail.protection.outlook.com (10.167.243.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:18:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 87D8D406552;
	Wed, 25 Nov 2026 11:18:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7AF3882024C;
	Wed, 25 Nov 2026 11:18:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] mfd: cs42l43: Add new register and bits needed for dual jack support
Date: Wed, 25 Nov 2026 11:18:50 +0000
Message-ID: <20261125111850.1380699-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F27:EE_|CH3PR19MB7284:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c10de508-5999-4313-990a-08df4ae5e485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|36860700016|82310400026|10067099003|261021121427099003|11063799006|56012099006|261022105027099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|18002099003|261009223027099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	thVt5AradYyRTIXs+y30hCgOoKvLsTpEKgxTyPYa/QfYn5LSMPC41NfKB6HNVIHAqmxS7Vf9Uv8r1uFSKnK+rBl6+3NMff8/mwRRBKS4MXSW7aB34Vr1x+RqkLpkHedyOKu24GYjVchOCT62ifCrUnFCqGmDqiJQkiyZ5E0W2BWZBzFsn7YYhWWMT5RA0wmdRzQtgx6s6oZ8lMJPA/tk9yW5qoeRJ6NkYOxV2X9fU7je+hk71MP32dbJvCZjClCghVOK+r5ePborpIbwrfkMoUSUmgROOGeWnXWZOY/+gCSvVG44V8Q//5kP5c+OfdQcy2IEkACsAl8JIcQSG26nP6erv+PDKw3gGqvRaQCU29TrmEWK6PUlnAx2tsyqhRt0nXCvamW0NenbI8eGdMjDw/XibIDXC2tzm4PhPGJ0A1bPlPgKeyIhdKMU/lVxf0Asdc8AKyPQnYLPR9ghVQ0vaWD8N8FNNo0I9G6kZy2YSJ5BfqR9w5XdAgcaK3OGx6vfbAWdOWZA7Wb39LiafwKy9xC6KcNdRugcZiE8quFVMeWievH7F4AVBQ834ueXI+hwk/b+UXQH8iUsJk45ustbo3eR8kvPug0qrQGgbP+QB+HH/U6BxD3pUaCrN+4BKh6NqVHczNb0S/z0HFmWIGHR0MTeY4WucVCqjsbw45EkE6wTigJ1gtbW5JI8Jd7WOhe1H+Zg/2c0G5yX8da5IN7jGA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(36860700016)(82310400026)(10067099003)(261021121427099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(18002099003)(261009223027099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jbzn4fmbamqAdKzqDTG0Tujbv437l70P57JpI5cr/plaVE0iOCjmgi4eF5KY7exQa+abtj8nlucbSlFUrR7214g1mh8nyHfo/68abZIO+6tdxxrJASRIhOx42YGlm3d2HC5rhcu902kI01Y82qpW4+LAU+dNul0UDaB6y/vDl56SNT9GsyZexsjPs7bl1xm0BERALU6J+66pP81HpH0Hj7gt/7ltaZ4APbDQnze0LjmSpGvLogmg4wN0FeSSPfJtJXVc/Bhsn17VB1oyeklAXFALu9UGqW0ptHwsCd03N3G0YAIzW/zBXwLLy2Bqcaf0AhR0ezcWABy8U4+/+i9tqsz8nqwRtyo4lEoBqNF0GNWYtJkBRqr+14vcdgEYMp6BtnsnpeN+DMOwJaRVDjgycB1a4z3mkY3YTI4DK/4kIlxtculqTD98eQEUpNwfN68v
X-Exchange-RoutingPolicyChecked:
	OrVj8JsiexeYlYvWE5iTmT93j/daGsBTkl3hC+d+Ex/5z6Uu+WgFqxJJcwoYLdrDIuVCuqcpq358fTlxbYxAGoWSgiuXqMyDn5EYzmzvrnp/RjSqYbQu9v+5acl44ggKwc5aoKb19zeEa2MYWVYBpzA2Mu/7krk+hgxeAP3Vb3X/AbKinGpN6DzezvkXRacibux3v2dPH8D/ajzI7QQalNEEa4/SM2S2TnWalbu7611GeDrBwCkaaTBkA/aU1WMyEdOB3cE1cjSQTVMKE0ZZ433097paD73+q0Gsz+mF95yHoqdiuh9G3KnzYDMWfVFj9fQQSipqP58NTfQl5Iq21w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:18:54.8648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c10de508-5999-4313-990a-08df4ae5e485
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH1PEPF00062F27.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7284
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXzcO39ujfq+pU
 XWEh6k0Rq8E1FEqhCBWQNIzdXVT/2yexmLl5wOByf5flHhIgEAf5NqE9N5yB6GHK0cKhOWGEBws
 6SUPVn0AZD73YKnaG14vtudpHM1DL+gCVqdYpIox8A1CwCq5+a7GJx/cutEiAfgRqrLrPqGIXHk
 eOSiSnFGi7WVrvEVbAOEDinI1E1cnRcWv2HCWHXBp3dnp99rT+CD7DnrN1t3d9GNXzOZkr7npj2
 gnsjCwcdJLTEYYfHK1jF2F3wLKfNrpPQZweP/0msC1t773og2RIm3IxtGXRXXfjsMTXPO/tJKS8
 Xd4esrVPVLkKRp6LzyFde4lLVaXx3oOj76eu0AKUZbeouW27Z83MZagEXWtSeUHvDMhOHm14md/
 k4ZSiMgKaipkuYlTLmrOBQr1Emx7MeHmmCqMRX4+wZOBonf8mdeSRNqFy2F4U8Fp/oFs/h++ZoJ
 U27SQh+xzDrw8S+4HDQ==
X-Proofpoint-GUID: l64BfN_1KfYo6NqM0tlfD-cT6dlSs8Xl
X-Proofpoint-ORIG-GUID: l64BfN_1KfYo6NqM0tlfD-cT6dlSs8Xl
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c425 cx=c_pps
 a=ws69a72eWNNXWagsEosLDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kbmqLHme-_bTq81Z:21 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=4-7ntvbR8lKZeFtm-ogA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX2XoVptX1xL60
 OJOGglHYyDgvAA322N/whDibbCjPaDMvHj4MxQ1okz2uQyjcBBNH21DfSVQyRTb6qkkLq5fU+J1
 4/LOFCIaeZH6tRTtuzVoftHvemXIaOY=
X-Proofpoint-Spam-Reason: safe

To support desktop systems sometimes the jack detection is split across
two separate jacks. To support this internally in the device some new
control bits are required. Add support for those bits to the MFD driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

We are not quite ready to send the implementation yet, but as
the required registers are very unlikely to change at this
point, it seems useful to get this merged and hopefully avoid
immutable branches etc. later.

 drivers/mfd/cs42l43.c            |  2 ++
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 13 +++++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index e568cfceacf55..24d2af3d4180f 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -215,6 +215,7 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ASRC_INT_ENABLES,			0x00000100 },
 	{ CS42L43_ASRC_DEC_ENABLES,			0x00000100 },
 	{ CS42L43_PDNCNTL,				0x00000000 },
+	{ CS42L43_RING_SENSE_CTRL,			0x00000040 },
 	{ CS42L43_RINGSENSE_DEB_CTRL,			0x0000001B },
 	{ CS42L43_TIPSENSE_DEB_CTRL,			0x0000001B },
 	{ CS42L43_HS2,					0x050106F3 },
@@ -358,6 +359,7 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_AMP4MIX_INPUT1 ... CS42L43_AMP4MIX_INPUT4:
 	case CS42L43_ASRC_INT_ENABLES ... CS42L43_ASRC_DEC_ENABLES:
 	case CS42L43_PDNCNTL:
+	case CS42L43_RING_SENSE_CTRL:
 	case CS42L43_RINGSENSE_DEB_CTRL:
 	case CS42L43_TIPSENSE_DEB_CTRL:
 	case CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS:
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index 862bc6fb68cb7..f483e5decc2a2 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H
 
-#define CS42L43_N_DEFAULTS 189
+#define CS42L43_N_DEFAULTS 190
 
 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index 4c00ceae8b461..81cda309c96ff 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -134,6 +134,7 @@
 #define CS42L43_ASRC_INT_ENABLES				0x0000E000
 #define CS42L43_ASRC_DEC_ENABLES				0x0000E004
 #define CS42L43_PDNCNTL						0x00010000
+#define CS42L43_RING_SENSE_CTRL					0x00010004
 #define CS42L43_RINGSENSE_DEB_CTRL				0x0001001C
 #define CS42L43_TIPSENSE_DEB_CTRL				0x00010020
 #define CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS			0x00010028
@@ -453,6 +454,14 @@
 #define CS42L43_OSC_DIV2_EN_SHIFT				0
 
 /* CS42L43_ADC_B_CTRL1..CS42L43_ADC_B_CTRL1 */
+#define CS42L43_PGA_WEAK_BIAS_N2_DISABLE_MASK			0x00000800
+#define CS42L43_PGA_WEAK_BIAS_N2_DISABLE_SHIFT			11
+#define CS42L43_PGA_WEAK_BIAS_P2_DISABLE_MASK			0x00000400
+#define CS42L43_PGA_WEAK_BIAS_P2_DISABLE_SHIFT			10
+#define CS42L43_PGA_WEAK_BIAS_N1_DISABLE_MASK			0x00000200
+#define CS42L43_PGA_WEAK_BIAS_N1_DISABLE_SHIFT			9
+#define CS42L43_PGA_WEAK_BIAS_P1_DISABLE_MASK			0x00000100
+#define CS42L43_PGA_WEAK_BIAS_P1_DISABLE_SHIFT			8
 #define CS42L43_PGA_WIDESWING_MODE_EN_MASK			0x00000080
 #define CS42L43_PGA_WIDESWING_MODE_EN_SHIFT			7
 #define CS42L43_ADC_AIN_SEL_MASK				0x00000010
@@ -634,6 +643,10 @@
 #define CS42L43_RING_SENSE_EN_MASK				0x00000002
 #define CS42L43_RING_SENSE_EN_SHIFT				1
 
+/* CS42L43_RING_SENSE_CTRL */
+#define CS42L43_AMP3_4_GND_SEL_MASK				0x00000004
+#define CS42L43_AMP3_4_GND_SEL_SHIFT				2
+
 /* CS42L43_RINGSENSE_DEB_CTRL */
 #define CS42L43_RINGSENSE_INV_MASK				0x00000080
 #define CS42L43_RINGSENSE_INV_SHIFT				7
-- 
2.47.3

