Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707863;
	b=yoVMqDujMJodXjoMfrDvhZtb/njezmN0SxBYdWn2/mx6Rc5G4Bq4dvlN7NHSir5qqrqr
	 uVLxYiZVJZ3E9LCZ5qn7LumibJpvJ+d4QaHJJNJQMt5ZBq1j5wkbpV7R1hcuCGazmcb1P
	 tQLRrS3Y3H/Q9dIdoh4HnJ64XfEph/IdQ72hP4JFZOf0oFpr6rawVTgzYCOIHhv3Nhhic
	 Q9Sg4ydqHH9gPVsAtRAs+s8g6MM0UA4HwlHKDR7RhgWIwwM1XeQonfErLw8WKF3RRdgJr
	 EOHkES1GrfcPMr63N+dvHQR+tEOlVVpA/eYRMaMGLvKM5U4v2zJhyvvBNre/LrY93pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707863;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=+NA2Uw64pVtDud7P16D/Y4a6snqCIkqxA4F2z435s34=;
	b=Jq9v1pN7VcLVzhecpVwOY/A2GiIJIJlbbOP2wVuxazvtfY4KXUY2zBqyaNSa4OgUaAOJ
	 iSnLWxkT8mrQRilv/WJLkXOG7BIJf2YuicTxyJENRQQmdG3xTD4wl/fXz5WE11FFDcjQc
	 Bew4vq2YxlyLy4acRmy3MOGCbnjJ7+rciXdG4RRApmo/U/tFozUCf5GV3PIOvjTJwG+M4
	 bRwdKdLoHxZQkJGWn2QglpBktlzEe3el8UyBT2yj3Zo9nDOOiZZ1B6jOLQCD9raqDj/0R
	 Zvy4SDqUU9OaPKBYvOvtW0/UQut231TvGpbLsbahvy6umXGSjPLgkLFdk3+wPr+ax/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UHs8AH5o;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=iTlTbgBd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459C606A31E;
	Thu, 26 Nov 2026 15:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5459C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UHs8AH5o;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=iTlTbgBd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFY8ck281478;
	Thu, 26 Nov 2026 09:44:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=+NA2Uw64pVtDud7P
	16D/Y4a6snqCIkqxA4F2z435s34=; b=UHs8AH5oq7pucxn5BwkpxcNAEktzGm7B
	L2INeMfm+qgAYfTE/JcfASchSJMkKHCuEvztmOdEYZQitpVKtFXgEKuQRTXVCbl1
	U5870cSt+bX9H4LvwylBTl7iuGoS/ykpOttc47yI+FZ6gFSlaev864guhEJv+GXp
	X8E0fdqchVKdWMAkQDSAJKp8oEMt3lohuI0MmIDCv02/gTq6OmdUnDlmKFHOnR7h
	7916AFdXXB+YwP1QCkebN25AIB74uOHswr5S31k53nby8iY785/80+nWSXlVlI8t
	wP/FZF3Os3EQzCMQCE/CB/L5CteeNPQ/y3zlAJCwcirtDi3smb6oPw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021143.outbound.protection.outlook.com [40.93.194.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51884ch7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 09:44:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb+kK5ruZyTGBkfoYkwmX/LIXA2gy0+fxfNFnVja8j1McWamqtOs2YyDW24obp8F1AMti8buD7/kXD+gpryMr1uCaQOyQ9mSbWaiS4znTSyodwc+m7RNMf9SUbq8ZuEMcIIXN23BJhRwwldpg22md5Z1m9gsdwYaoTmvEaFsJtGTS+4HjNiMp98sj1ZArcLx4/i/1EKaOaZouBCZcJDXRkjD2jAIXJqkb/2Dl/m7mWEw9vtDsHDJBxi1AUiAFXgL7Hb882RXLlP7YoDrPc+n4ijsnEj7k7yREL7lrPWbmnID3fNWBbYxM72VIa7R31u7VmxiDeKc0g1X7tw8SLsO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NA2Uw64pVtDud7P16D/Y4a6snqCIkqxA4F2z435s34=;
 b=VE9tAFPfo6QLbY98s8T+lwlattZbgwr5s9HsejSJreVpFG/cvcIM6C0LoQBrU0CUCZ0Xc+CqD9GtcjXrZLv0yMHP4GInXixukWOmGEk1Lx5KNu+zFPtL7pS4HUREm9s/cs7XAEdVic4f7jsUX/BYDJKxumXQ1Ca7S3OqCCEKDVAeOSlSaf3U09hylwwVQuw/UxAv3+DvOy0gxmro7nszh+bhfmrpF+mNoN08GLGHxhDLg9EqL4dOf0i08ynTzYJ0OduMxM8NbIHSb7ySBOfbb2po2FUkISi3iVBSbr5vwMpItfPVXbrYMmz6ut/O4ZTwovAnePvhWynbzNKKWf3D5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NA2Uw64pVtDud7P16D/Y4a6snqCIkqxA4F2z435s34=;
 b=iTlTbgBdpWFkDjMb/M6i3s8IboQxGVvtWPkWLRUHaPaOxhzkNXr6pWMCyeJ5utY0KHez07h1Hfttprmty6LaHk1qk0DRCTaM4Te9wATfP1qhwLdYctBru1+0uHzdn2cVBZ/qodfLxxKvBEPb35e4T2Ir/RK/yKxqEhb4PL8qjpg=
Received: from MW3PR06CA0003.namprd06.prod.outlook.com (2603:10b6:303:2a::8)
 by PH0PR19MB5573.namprd19.prod.outlook.com (2603:10b6:510:12a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 26 Nov
 2026 15:44:12 +0000
Received: from MWH0EPF000DD30F.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::3a) by MW3PR06CA0003.outlook.office365.com
 (2603:10b6:303:2a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000DD30F.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 15:44:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 35364406553;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 17A10822540;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Bugfixes to series "Prepare for SDCA Companion Amp"
Date: Thu, 26 Nov 2026 15:44:07 +0000
Message-ID: <20261126154409.1665214-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30F:EE_|PH0PR19MB5573:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37d14766-9085-4690-0d7c-08df4bd41e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|376014|36860700016|16102099003|18002099003|261009223027099003|261102123227099003|56012099006|261021121427099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	V9GmnxGD57eH2t95XSMc2Qwx86PiqYtNwgyoeGg+8Z5VmjvfriMsD8q5XxQL6Ds6X9BKEoew7/HOJ9OF/texdTt+bfmHmGEldCmZad6SVf2FpfrXqllt2CSX6mxsSGwUT3UYC5N3Z8rLeo9nVuVefSXJs0opaA6Dip+xqw1Q05iDPByw8MGoZCnXhpWfV88hJi5wQzn5zszy0XpfAHZpGjfFPDzgebRMBHfoAjhQ4CL0+f0Z/sVWDs066q/DB5/2GT5otBwQ1L19XM4Icp9Yb8grXn4Hcx8kVmZV9Btj2DKt3LgCXLWEks/V/pFtijRQYXBr7h0veSPYRxMYfs+RH60m0+0/6440fNv7SWoERr3OlMbhmnDB3Gpu1KFKPFApHbiFhjMtR1EWAJgnmRGRKMdPS7T/eZ8hMjMAH7tyoeJLa1mNk4yoddIoGUL7kVuWUpDJAgFs3ncGlhc0Dkokhh+CZ75wigY5sQivV7eHFpg6/dXwfupMdEX8B/7Sp4Yc614p8KkxpdZC3NiHwgWv+dYFVLLgj4RG73OU68ebiAeQNfDcpguFGgc9d1aGINLFbZIFwnycqUM+5W5kYnVN95qsBhr+YqkjLYchgJFDdm/ESySW5Wq0IkTjpCdS3R1RMdJAxUvvhegyi/nvY6EUi5IxGf9uULp0jo3qOBnXEsMvgMAW7BPZCKbiNVWGt25GgLuH4oxmxRovO146qPnhMQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(376014)(36860700016)(16102099003)(18002099003)(261009223027099003)(261102123227099003)(56012099006)(261021121427099003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c6q3cbZ/MT8dKp4FiufJb2RhD9WyoZVb8NsdG9dqstlOv6FmY91YlDaFxe7x/H7cSP+V6mAXZDmGTsyuR30AqhBgfoDxLx+24Nc9gIi71PpiaYcT5XHoU/aQyJkqWSx0TLTyNSy03lZNrUbsU7kPEtJzBFXCARTrYnohtMK5+ibQjATFLMZus37sIQMc0SCCM7I7+iCf8DXWA/hg/0w/aI3D20a6JK+ynLyEn0eegdbRL96avBJYEijV0K4hDZesdi53W96+7nOWa5hlXHjnWxXXQHKFtnZ2Z0/gq936meorHN7WBU3+zE49AotYefcjLdGsgrbNwYjS0yOxITYi4d94/YJScPPMZxdhDOvZV9C79Cc8WJ/pdHQvlzfzo9Aw0rCLz821XCgmInMcATPe0N/YNNr2XnSzJtpS/FcA5H8/JWJRBYPtPEJQ4+pL4Er3
X-Exchange-RoutingPolicyChecked:
	RpckJqDnkFbwXTLTzc4QScmz09U4j2NTyy6GceFz5K7Ww0MahVmKAC8RgQ56ywsrQUob1U/s6lqlmQEAWegLNrL1764MimdWcgI++R9a84g6gt70w5J2i+Np8fyKsFsCS4y1PgcRTiwtIwvQplQp3vcplDbdzZQSpRSRWYh9v0hsEwqnL5Zj+QSpZYbxWLOGeRJJddqy9FTVH/mqM1nSLz85lCnsAIEkKsichnf+Qw9xHP5tKPEOl6i3oSpQ81J/N8b6g+DllnrgVsUhWDHbpgmhN6hTk8SgeqSDrzFaGdJWrRNvVJMsjNmUQOe7sxhpVOcObuk9ZC06lqF8gjBE/w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:44:11.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d14766-9085-4690-0d7c-08df4bd41e00
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000DD30F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5573
X-Proofpoint-ORIG-GUID: 6tKZZNsXAf9sy7D3gW3PaCadZZDCRLIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX1rz0yCwqA34M
 ZtewcmqYHBPuCI6wShKBJE8uBySYXPsY4hT2CzgvYdmm9n+zdEqXL7Bs1R+A4X475fvwfttNh4r
 pta72jgs22C5XVaxiRCu0kJwDnpzjAi+9SZhWLneuaBRlZN98kkgWrQJbqzKUQ/2mAwt8Cwt38H
 JD9jCpXIRDWW2/+mkujP70FC7EsrXXM+MC8RmDNj9aI+unekzKdYd0ndMGRTdPwudTLeu+rBZWo
 KiUx9WJUoLQEfrC00FRZe3PmfzSP+oTmsHfiaIwqWZC4D/LwlbYED/DkWZuBZ/ehZpnx1FKPGJl
 lBYn/aU2Ekn4QPdx3JPaD5Noju4LCUHYqJT10KCAbouP22VC5oEyaChU3Sm4VWgCTC+NxFjsQQv
 mQmXf0eB8KWBoY4HvyEe9LolyP1Tz8u43cNP0s+3dqrCA9s64HtE5tL2p+OEQ3sWzb9FXUqjN2m
 NgwaPcZlVClP7yqN+4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX1/U6JjyGUsNV
 6/5nPJRyL4VDpehd7uPLQDzScXqLNVWcXoys/6PUcFbaT7YDSZ35Rjy9+wRyGAYcjH+XEt7WpYO
 5Y1ZiH/YMt7+J/XTp6pLB/iEEZ3Yf08=
X-Proofpoint-GUID: 6tKZZNsXAf9sy7D3gW3PaCadZZDCRLIH
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b0853d0 cx=c_pps
 a=kViImvuebRfNAtAc6SJfCg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=v-JFf9Bi6_FnY3m-C78A:9
X-Proofpoint-Spam-Reason: safe

These two patches fix a couple of bugs in the previous series commit
f5419389a940 ("ASoC: cs35l56: Prepare for SDCA Companion Amp")

Richard Fitzgerald (2):
  ASoC: cs35l56: Make SoundWire DP3 mixer registers volatile
  ASoC: cs35l56-test: Initialize DP3 mixer registers in mock regmap

 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 sound/soc/codecs/cs35l56-test.c   | 1 +
 2 files changed, 5 insertions(+)

-- 
2.47.3

