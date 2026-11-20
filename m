Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191131;
	b=QQi+i/s3MyTzEAToUesjfnmjTHWjucOfCfgTpglfEEJiyFkJvlVYOby3DcNvX/OJ+2pK
	 r3+eBrTj8NwcaBGjzSeJG++YiVbC5B5LwQxNSMwKJ5gmLg0RJRciB2PVYxzT9I2kNAWR2
	 O94hsiH5V1PCXaAXHaMGTYGgM2f3seao5IWRV50twJGT6ORGPeKYXjTA6yTUId77Pj5+v
	 Hy7o8I6oXfd8YTFZV4w+6umPFTu3TFv+A3HnsO57utIzWkmYPh3vKhmET4EQ5tnl+UU8P
	 IT7Rr4JG2wDEfy4OU0FPIGCGGwWCKjN0OlXEEEn+PdbBVutZ7XyKX+c6bsMTZCCoGrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191131;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=LQEax2NQ7r5FPdFdHSc0aVClfLwm2uQe8t6l/Qp+ouM=;
	b=EelgLQBCJBiJdm1+UGl7bcdJfBS7TmMowZi7T0T8mQpN7yTBGUGb/sJcq0NUzx6015bR
	 MEqWbnQc0EDoUDlLseY3MhRZT/cqTkEC8rU3EgJmwylyKUqjU4JlIM1GgfluIzkwaxF0/
	 V6DhnBCRGog4PxH2GpgGyDJLRd8zJ3xFwCkLujP494cTPNzG/hIjcy9Yx94HYbxa8QrpR
	 HarC1FCZKs/9KjIgjUDzn5Hc7XDbTemvudUOWdem1Qy0AtSNMzkgYENkayyS0+bDZbf4U
	 xxyAYJzt56dK3eBPM/b901FJAkj3HNubp/HIsJUB+j2pUe7fuaXlGjkfe5OI+3ccIIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GhFFMaYX;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=J3Ndf9AO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4224F606A32A;
	Fri, 20 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4224F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GhFFMaYX;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=J3Ndf9AO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFqo4O927894;
	Fri, 20 Nov 2026 10:11:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=LQEax2NQ7r5FPdFd
	HSc0aVClfLwm2uQe8t6l/Qp+ouM=; b=GhFFMaYXq7MAnN8ca1U8ssdPrSZ5FtnK
	ADBHAIA+h50wL4Z2hUfuuCUDR3WyUs2f+AUH4vU+IFylf2LDYylbJBt9lsd9k7jl
	0i9oen4VPqQcpa+gSS44L9Aj4C2M4r7qqNIxYhpEC4QdHxGrAttOXC1wQrjV+paM
	goWB8d/7fJF2n061gflFYlvIr4LSohW/CqswyIXUBRfhlKvULZn71EV1iPZiVSXo
	7UAnyal5d+qgGowMwlIcx9NwP6Hu+IEwgftKavv/tMJH80G2rIyCTAPQ98cjSX15
	oztlAGUrEDzwtm2sn1u4sEyTIZfdl/u7DshET90WTF8eKsSRWtt9VQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022106.outbound.protection.outlook.com [40.107.209.106])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm2D7G6dgmlh2IT1qHGvxmHxYAFgzE4KRjn/XPliFFVwAlQMr7wykhk7vMumvi7i7h5l0rPctYDJycJFn9rauDlVLEKKc6ot14n9aLSPL3oDAB29hnQc94bZxop9DPfTmN2I9Z+YchMmnElqcPrWlIwQWhqGH63JgQVSHZzeK/9WqWWQK10VITnEqm3OkKP/Y/y+kCxyvrYLphf+g5qDydKQSSVAfnoDgGibv5JPWmrf7w4pgQcc/Q6SFNHXK7uOk5BllCsunqWrP7eUzUhCIYpITh2jbz13stKWbhYajuuXkuxQSUZ+IvFifhdN85tUmijItf+WYPtbVzP5rAShpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQEax2NQ7r5FPdFdHSc0aVClfLwm2uQe8t6l/Qp+ouM=;
 b=UJcjWxODw6AoFy6nKZjfv/ejQF+YptVSeFQm46B8CKx5alj+9w/5JTKIWK81glsYy8Qar91Ezsju5G9JYUGcc9VqDjlPrTR2GDZXEMEoKXH29nvtUm2KAjRbS48/yuUEuByapqBVDx3z20wHZtrDYsqxTnGcAgyywfbnaATMPr8L7nEOQ7ideSac2CFOqH0g9xn2D3NKhhZGCpOpNsbNkX2P/GQyhKOLycJoubvGQY84k1CTcnz/vouGreuY2VR8CzeK/cgpVZsATOfSel2BgtLps4qwm27sbz4Nt42+tQYQjKb6No8ixSWAkzFd2dcQxXrqCv1XHx+BOmWixbfhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQEax2NQ7r5FPdFdHSc0aVClfLwm2uQe8t6l/Qp+ouM=;
 b=J3Ndf9AOg0zPPYIFOizn8yEObGZ7G4YnMUKRMY4sIk/cXfbkMedMFHYPPCWHTzws6uE3/LstEzbZQY293N+abJudwrSBTQ06ucaEP8RbpSLSr3FMDXN/RF6Gcdws3yiWOBgT6RrNEDDBJK8UrLD0kK3OjMVQQX9hwKi1tBgv+JQ=
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by SJ4PPF6C1389973.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 16:11:48 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::5e) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:11:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CEE6E406545;
	Fri, 20 Nov 2026 16:11:45 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 97966822540;
	Fri, 20 Nov 2026 16:11:45 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/7] Fixes and improvements in CS35L41 HDA driver for System Suspend/Resume
Date: Fri, 20 Nov 2026 16:10:46 +0000
Message-ID: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|SJ4PPF6C1389973:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 69bc79f4-1a0e-4da4-bce9-08df4720fa5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|16102099003|18002099003|56012099006|11063799006|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sOYlcH+55My3BKAzMitlK0u942xLQbDpURflT4uW1NFSmfIip6o1hfsA0gDiEHo4vKqZtrUjaQTGFLa3vs7F2BVkRWdRTsij//Up4KaaVO9YtWlSh9LBtHrsUbr9IsfgMN20ABpeXeADw7HCg5wm3bhJ0gV0P72V717tELtape1KJUhVGRwBOsCIwyRGtA0/YSXUpVsXc6wIO3NKARNNtgr+UHS4TKs0AFS/iYcdb9883/sEfxs8utSo1cC9i/Si95nWIajhltqCvx3ZpJpEAEu3bzYJUb5C/TZfMjRfenrHNZ2bafmtn6mh/TodKsAYC4mwEfFUqAyMQZRIPO6n0k9tllEp6iAz/lFGLdVPm0dTiHliht/9VupW10jPz54CfRR+9419envvUJ66nlGXH56a+hyXBtp0rwo4+xyFconOsTrvmpAWr16+sbuaXusn0YfkCAmgpiKs1678jRpFo1n6v+OYdoeKgJ0B/jZXIGOyOXU7hqvDXKbIPblBxZMvl2KVxbne/eQs6BPqSTRMuPuOyZ307aw2WfB1dgrIKZbxj8k/cD10t5CUC3Ga8vrnq1kgByx//h/CisnFHRC7af8ogn+2qvI+jy5fWgqiMmbMnukOB93l3wkwqli2M+gyWcMyar2bbb3FxIym/ee9squvSaBrsgPulXvnZW2ER1NAafnU28vSrj5GXj+hlTuMZZePzoNU0fE0uMNJNmgT4Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(16102099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izktL8rk4nfOpGqJD1KaGQ0ZG/7V3q45YTWDn2AGkxm3+nPmPm3Ov9bBaTKUuXHeApXlWEmIwwhvUG5RWxA1cX0CPgZzf3Hwha2x+N8Gj7vMfjQSUXcdiD6KaPrCPANUNiGTstQuLb6aldBKapEmjNNoriZ7a3Eu5gb8MM/PXVw40axYz2Ui0JcdFXpoWQbw/OMh69eqKgeiV3pM/9GpTX0OsZxKbptIS3SBR9TUAr2CxeKpZbnpuRzZLUFjsmhpu1ix9gRYyzpGTl7RwTctCXBXINXQzN6SJ91nsTB6m63pJ4c/J1NRvrinEpGhO0emjfXMfZD+mUdIlvsfOgWkdnKJoABbdIphF4ox5QNQ4F0Qe4sJksgFaXdUSH0epYH2AbpXgBftnZRSk64n8baAC7z5iwcqDahA6R+tdaKwyrh+1eRsAfP8lF+5CKl5cFH2
X-Exchange-RoutingPolicyChecked:
	b/KpylPKJk2zDF3R7sulw0bt1PxI5waE6btYjXYK1KkmnQYdczVI6PTelvfT5l0Z6qJP0CAxBhPzdab9At8uJm5NglSrlDr4Nqo8TNDpzIK/ktXJlJM9VkS4UrTWEkeoHQ47wtZL5S9h5ngBcYWx2X6uuu1ZYHZEyL3l3LIE7ElWdHB/ZGE3fjTl56MB6vahFW2LAt111lsG5rWE0sky4WD6ACdys3W3Kf7xULldH+4nYOCwzIErUKkHBzhJ2Fa2TL5ECNh3Si2rOR7RSY7+KTj2krcaEmHPG5zxwc+H1uCcNe7SBAgOsDBapr23jqzCwqSJJ6m4STcXDkFxKKv8qw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:47.1748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bc79f4-1a0e-4da4-bce9-08df4720fa5f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF6C1389973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX9rs7SvlWDB+B
 ZNx06w9TWDW30GGGwmvn+9BKjmxDHb58JPo7vpnhD8eTQRCw8h4fs7bwgWvx6aCd9/wup3aUwjR
 yq9i30PktqYcW799a43b606gX2TRtrnDV9llVKsBKXZ7Ct2gfgxyuBl49V5HoMht/OQI1jSZVOu
 i9ZxUISQTqMdeLTuI2BnGA/CsU7ZxruGKB2Ov7yG3XFpSdAOd+t7cKi/oE2DLrB83APsxjsv85Y
 mtDn2NAJy728BAnTPagDJlKcTPtbTsZ6t7SEi23EDiyG3oI+JWLdApWCZ8JxcBtp7e2ffmayLnE
 s40P8mtssMJUJSWGNKG/ifUkBX4wNbI+U1Vgg0/05jMY4I9948c9WRnaNjD3cSSUss4/Mbe26fE
 r5t5sNSzZKwzSdbnYHW1jRkW4LOcvJWjC3PVOU1/RUt3hnD16xudQccdLMucYzV9RTd9wIJ6bHJ
 L87QIixcW/XXWJ6AR6g==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b007147 cx=c_pps
 a=gLqebe9daP1HpZHHAZsNzg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=9XY0gge0qh7VRxIiEJ4A:9
X-Proofpoint-ORIG-GUID: zXXBcHlW6bWyVHMqYr5DuZMHFs3BjKGS
X-Proofpoint-GUID: zXXBcHlW6bWyVHMqYr5DuZMHFs3BjKGS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX5Dde9eI6x1a3
 iHCpHwJxkyOlr1BakUemgzAQKLfQ5KcSLXEfZq4l3EybIGRnc4W6zQMR83nS0fht4pLXPCVLbCC
 99Y+6e/pXeuz7pAH4js1V+I8ii1pbFk=
X-Proofpoint-Spam-Reason: safe

A number of issues in system suspend and system resume have been reported
on the CS35L41 HDA driver. These patches fix some of the issues, as well
as improve the suspend/resume code in the driver.

The main issues resolved are:
- CS35L41 boot issues after system resume (on SPI systems using S4 hibernation)
- a deadlock during system suspend due to a race condition with the filesystem

Also included is a patch to prevent issues with IRQs during suspend/resume.

In addition, there are 3 patches which prepare the driver for these
improvements and fixes:
- ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
- ALSA: hda: cs35l41: Unset irq if not used or configured
- ALSA: hda/cs35l41: Remove support for alternative firmware types

Stefan Binding (7):
  ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
  ASoC: cs35l41: Prevent software reset when using SPI
  ALSA: hda: cs35l41: Unset irq if not used or configured
  ALSA: hda/cs35l41: Split System Suspend/Resume callbacks
  ALSA: hda/cs35l41: Remove support for alternative firmware types
  ALSA: hda/cs35l41: Store filenames of successfully loaded firmware and
    tunings
  ALSA: hda/cs35l41: rework how firmware requests are queued and flushed
    to prevent races

 sound/hda/codecs/side-codecs/cs35l41_hda.c | 362 +++++++++++++--------
 sound/hda/codecs/side-codecs/cs35l41_hda.h |   7 +-
 sound/soc/codecs/cs35l41-lib.c             |  51 ++-
 3 files changed, 275 insertions(+), 145 deletions(-)

-- 
2.43.0

