Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779650;
	b=SAlsuwYgU6OvWyPVzrVnnl7Q/ai1utq5dCOCGBtfRgbrn+fT+18aB0MSd5yvZUBP4gml
	 BjSLGJKvwDe80XTbxQOj9pRkGsTXx3BKDmP/KgaX2++JMSQ36fN47Tqu/1l0OBBaIUCHf
	 bPDKckXvGgpymlAdi4Y3beMzol79digZACIC8/B/1XOdLuoKqG9Jvv6ZcECwo7wm35TuX
	 /z8g7sxFio36fBWkiTNVFgB+7sZJxIncgAqOjTKKL0zMtBss9ZAak4tkimr0YiTKYBjTQ
	 KOXYwDPSjN/1SxZqP2VKooIoaiJw6r5ohrKEGawM27MhQEnoyD8H5h+UCbw7C43fp7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779650;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=bN/CJaxrgkHYojzA06Kn13OUTqr1my/nwcQkqrJHuwU=;
	b=PnIHKwa5leeOAGLgI1FBE7yo6iugNSP+bV6ZXI3rCyw4c857nuKziUVToWiRiQB3E/4c
	 dv4/nfPh8ZFuYfUxtxSGXJmU4FhFyjUbu4TCLbK8JO725uRv80Vn/KQMZqIQLUiM4sQvS
	 eVh1oyjkL6qXtuYMkOTGXcPtPY7J2jlrbSIIBnOfzraLQQyy/1TgyXbX+ZnsLRnnDI8x2
	 j1wARt6jdqiUbff1H71Th2KTDXgulPRNAKxdP00Q+R5bN0dSGpXUzpvPSrgbgMAFwrJEn
	 jAhi6QY6MW3Peo/SHl7tzaSokD8YkTLTOUb5rOc4xGseMOLt/2Ad28tPFqQ673JJ1/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ayXQKoFY;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=lLl9SXic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0AE606A31F;
	Fri, 27 Nov 2026 11:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ayXQKoFY;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=lLl9SXic
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARBNDaa749506;
	Fri, 27 Nov 2026 05:40:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=bN/CJaxrgkHYojzA
	06Kn13OUTqr1my/nwcQkqrJHuwU=; b=ayXQKoFYdWwuOh1Js5dYT/vQ3MulTXO8
	U2xq5BSuv4Pt2KsB+OdCFYmMg3o8ects29dEEN47XK9t+WzAtfWvipQUTlKyHmgk
	Y2Dur83bfSIxSp8QYyImvqyfujl38h72KGfW5m7NGsBJ/3vBoVRKdIQu5sNhvHiv
	iJw8CkUuWEE2b132issr2Qdy+pBu12yMMcB4oRfqNzwzTkJ8YkGehmRG+MTFXYN4
	+Ncl1JokiwzLCtoYG8Z9yVu9TZHRclZOc+Xnw/Zp9Tuty7sRrRDL2OflnVJ048Aw
	t9hDZtWKZk7pK8c08Tf5tlT9TYyXGgyhmGCuJ0P+8jyfgqjGaodC7g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020123.outbound.protection.outlook.com [52.101.85.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j78xng0fr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 05:40:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgBi8sc5U2DLyMvbGsCMju/bgNIn9Km9/WTOso7vJCbsYy8P8Wnk7iYTld7dVYpUClvhMUvh6HL6VkeQUUU5JmbKIow4idRTi6Mv/rF89e2L333G+SM1M/xKDv0C4cSeWXqIvJNDcr7vDjheeuQsssHQxiFgMpUsWyP+LPpiGt0OzbvRimXYOqnx1GMaQs8CKharEzcDib+mfk/lvjvGjCvgdpTTywZ6VLF7oGT+lXXvHgSMOr62DzYCMTOBJbidqmN1uBlJpfkAPe4OagX4PRrQriTrhRsoFenswb0hh3vxXmpjYR4ixTYVNKdORoWtLc8DF/8/S/1eYRRSDLMIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN/CJaxrgkHYojzA06Kn13OUTqr1my/nwcQkqrJHuwU=;
 b=eJURFFQ/bJuKxk45iWxhH1ACduWEWzqWt2QawZ4K9nmAmQssB/+UsB2IMXtPVfEEsp1cakmK9EONgFvzFgSV87TePJWq8DtUzYg+oSlhGX7uT0ZsNLqJPyHsUYVFzgZZ7iY5xcJ5lOLi0V0Bs9zIkBdo9lVVw0/F3O4I1tBemBz6gw2fVa3RFeu6ztOiTKWw/FnvSI/n8GkTz/fhZC1m50CK7u17xG0PaS6DXjRwz/q5rRLaM4p++DEtwjU3iE8DrJH4mMWBuigQo0a5vvEBOJ5K8NnubMY2toIZD60AwDPnKbynSL3CM3GuTsh/Oy3Sc/HAr62EzSMZFxEG3B2PQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN/CJaxrgkHYojzA06Kn13OUTqr1my/nwcQkqrJHuwU=;
 b=lLl9SXicJee1+zcOeIeWFI3E5Lj7RgvzRCSvXy6zjE8INX8RKVzsbSaGhDUywl/93VOdnc2mAj38huRY5cTddk7xG4sw23jCWFVLygYXqEOvceTf+1RK7OtUFJbAVO/GzpR/JqUzRTZ5g/jjKPkNDJkqAIj4GZzjEBrLS2x3JWk=
Received: from MW4PR03CA0306.namprd03.prod.outlook.com (2603:10b6:303:dd::11)
 by SN4PR19MB997483.namprd19.prod.outlook.com (2603:10b6:806:507::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 11:40:40 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::1e) by MW4PR03CA0306.outlook.office365.com
 (2603:10b6:303:dd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Fri, 27
 Nov 2026 11:40:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 11:40:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E550E406550;
	Fri, 27 Nov 2026 11:40:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DEE4F82024C;
	Fri, 27 Nov 2026 11:40:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] firmware: cs_dsp: Remove some more wasted bytes per control
Date: Fri, 27 Nov 2026 11:40:35 +0000
Message-ID: <20261127114037.2010271-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SN4PR19MB997483:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 27bf80ba-874f-4601-f043-08df4c7b42e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|261102123227099003|10067099003|56012099006|11063799006|261021121427099003|261021123027099003|16102099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6JOQmlz0OZV83FPyCiuwWRccZqrmNfaUGL+iGjIz9seC8kt7VoC0gqxq6nITrlTfrWheufr/xPtzhepYTPA3BcjDQrXLtWHjU/at569U3GBdWVL7qe3/hU1+QUUUxPO+McfmoeB2u3YjENAWNqUJQDOTHVIDentTMbTrfdv+u9MvzyyHd+E0R2ePCY7fsRSXEnPrsqlNjlxeDzVTpX4Z6Kw7ZakNgDdNNy9C7Pzv8lSmdjT+WJ5pvsKzthISxK3up5Mp99u82YaA6Lc0YtyOCkUtUTa4rwK/anJcBAMtcpadnxJShI07r3ESGwQ1PmKjC0SjmYlqxN03PMPBBypYZRNlYGcfus9AdRd3x5OOPMU1d5gOzblw5K/loFrfRE1XQLQpVpdGdhrntHSGAEmBnL6MUnfoOyWpQ8kXX589cNNeze1p2gusBqDZ7hZrvY3Ly2xN/BMArR1xLi/5aPbWyRbn4QgyaJjCvm2jamyJOLrxXF++mI0YZzCMKZWSGJOQgkA7kfnHUxv4mnS7CPsOQe14kuE2TuWo0USQLteB2DtF0z0z0sUtGgNIaN4cfP4C+3g4OOeeogk61jU1+4S60QOmqWcoCL5h2s6gPt+dqpk9XASpa6HN0wC48+jD9Wk3SEEzmU8BuX4nx6dD7o5MRpM/hogQM+bsSq5DS8oL6moNndkkMACBnBalvIBSyke5Ifw9y+pLIOspZIdgR3kMRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(261102123227099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(16102099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qXIyYtZw+Fys3Dn2zlQSpR9pDdAD9lAJFpoesADzi7YVJtjbQFeWSE4/5WNx1T5pq/mk5XgcAGS3x9uW3RkrFEl9aFQdms7s+OTjm6WZot7PsWuoh1WZWq/locBvPjkzJ9+tZBDaVAb8cLXb/sV+n4JDGTXNWaapWsonipFms2ag4A03fpEpmStWYcy+3XJdKxb7HCiNXNWROzGqlQLguvaMHwQ7lEnVTF1vVy/3ODtgD0VPhrGzGc0inen4Ewm75KayVC9YaVopGQAEOxzAi9xt8xg44PxuBVb4oB2i57uL4CoLWDgp+Mk8KGs+/vOkuu+7iCv5wPbMLLquDM2U4s+LXAH6CHuaDGA4KrXmtRrAG8jGVhrTgQ/d7dnsqMEg+3z6vQ4Zl2WkTHcK+EENaObk6NAI+CJRdjx2GgWwdYGFmKuvTVvcYNIC/Zx6xWH6
X-Exchange-RoutingPolicyChecked:
	HIdY5bDM1l0DjfpBhvdNVI6lMOOLY6bvGPzViyLuwWD0dI9doGKIgho1kBXpUvJ3bq2OBdmCrWhZikdzsYUt/XH9q62UxPdkpbQ7q2dGUtIMKdEkxumwnFGghNcHmviKCR/qscNxk/TsWte++V8IRKEOnN+rpR3CU5CabBd34F/aOqwUvJPbKpoMT5taNs6mLB++b/28OyBJin+8Y0ux2zSoA1+tGxRsSPNq7oJIrvFyFNEoUcac7rHW+e3yiH3hBVFJC/ytJ+6ubuewR8J6EnuB2La7/pIWBeF0QDx4POIbdllFZucsN05HGkwUhL0yOGvWjJgoSi3vaaHtzUfa8w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:40:39.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bf80ba-874f-4601-f043-08df4c7b42e6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997483
X-Proofpoint-GUID: OslEVsliP8xX7-4x_1ciDbY70XZrhhJT
X-Proofpoint-ORIG-GUID: OslEVsliP8xX7-4x_1ciDbY70XZrhhJT
X-Authority-Analysis: v=2.4 cv=G6qJgNk5 c=1 sm=1 tr=0 ts=6b096c3c cx=c_pps
 a=ERcN8ojmLF2LN6E1fAlUwA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DkXkl5hva1gb6XT59ogA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX7RxMmff5J9CS
 UmawSz6yWTHzi6X3RJgRKpU8eV+c9ZKWKt9QwUZjRsjTURRp39jZQYJjdQIZr9+M0GR5pNM80x4
 2fSGTNNzJ+w/3lSrY8Ja8VZBeOsEesDiVGQ3bBCpU7Hp+/ucaXuA9s4+fC81i8TlQ0H0yHNunso
 vQCLM/SYqqUIPqzZbT5kjxcFXE0ogRa1mckCrQvqKOcN5COdQE7/KXbZg3NfV9ogxEZldUCEFTw
 THlS0hSg3iVYwW5vCpZV3NY1I5avcSg1A8xrqMTZTuB4ZjhBlg0LQvGdBu1GCLy7F+uCK69uHa8
 tGleV1c3W8+o6e+MUZBMkzi3HIm3OJnNTlwgEtyCBSh2th8VX6CaYxruBdcZvmMgGS05ppTmkWq
 xypqnahPGO7oHknNMgFH6fkbM/zPP1tGUHoOqjUVmGq6YiW3FygZcSFfoKXA5K3PaubpNAXH2TS
 +teAqqgr/KAMvPMGQnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX16RB0lSVbjMZ
 vFn6zUOI/2PeKRHA9BAyYCSLF7kAR2JFE4Jj+Z3CR1ALj4BK5YoKFBSjyFqJCf6Ny/Z6X1Cr0Vd
 Vdwcnmb/JTV5aGimtWVs17HDtRsQD14=
X-Proofpoint-Spam-Reason: safe

This series removes another 16 wasted bytes (on x86_64) per control from
struct cs_dsp_coeff_ctl.

Richard Fitzgerald (2):
  firmware: cs_dsp: Resize members of cs_dsp_coeff_ctl to save bytes
  firmware: cs_dsp: Store control cache data in struct cs_dsp_coeff_ctl

 drivers/firmware/cirrus/cs_dsp.c              | 34 ++++++++-----------
 .../cirrus/test/cs_dsp_test_control_cache.c   |  5 +--
 include/linux/firmware/cirrus/cs_dsp.h        | 13 +++----
 3 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.47.3

