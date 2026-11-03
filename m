Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717404;
	b=RDmm/LElJzoK9F6JQYOtFkQsLvs1nlG2yihBR/6SjJPEmqU2GgsAwD6OuRtqIAVbVTql
	 mLsmKtfqXils3J6KjR3j62/1+sz3Zjm+7AsXViSO/IL/aB5FDrd/p/j7hXnvnFztUOWR+
	 OoQ0w+xl4GCSS63LzfXrXmOmNtqoxd2iPj5kOFwjghIdNp0bXisH3COx8fe7JmQTQ6owV
	 G3+wRGpOE9pwQHtqnOF/KR5ioayCWDktKI0N6dkp50hWNfy2gSfkMWfn5VUZwL1IJMdC8
	 Rz9Aqc3uud482MiaBNIHLAA+OOzbtRMHM9zWFkafVl3GEXFr0jdXSvwFV/WTWsOiNtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=KpVOmL3Wmdso+hfcQnJv1tyiFob7rX5Jta/4VOZDptw=;
	b=iFTmM5tq+hIpuYW5+7Tb8PQ5jrNjeBjshjvh7UPvdG5FvUoYnv0xObTQn09CBFGB1+yL
	 1Hmi8aqt+UyIfYua0j6Kg3tzVM2PyGkS1hn7DafXzZGq8g6GPz6MV/6tiPNamZ8RFMIhH
	 6oOnaB2U4JpRPojIaHwtGamx7JnAbw+glz5YYve18mUHb6r6depuP6FBcVuJYc3jl029y
	 rQ8oemPOlMTGanr+9cMioOxmn7UdusLDslhUjP2te6IqzLnjh92lEj74o4BLYV9ZR9Hpk
	 KFfBDzQo1JCzJhf5zg5JPy4/qIO88/3dE64mzVpJgpPfRsvIi0IhhK/EI1mpbdqe5uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=McJq0Hum;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="DR/oPS3w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD15606D839
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD15606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=McJq0Hum;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=DR/oPS3w
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E59Wm1102799;
	Tue, 3 Nov 2026 08:49:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KpVOmL3Wmdso+hfcQn
	Jv1tyiFob7rX5Jta/4VOZDptw=; b=McJq0Humfo+seq06SiQPonscpd2bEZSbuk
	S4EvKp+j91ML9TdAm3uUZvrpxdkUpKkm0BUf0xtQ9miBh303gwekZGfwZeclNysP
	NqLddKC+DMZFeldH4tjObaKhDQREM3jvTqZlDSKxgytGj9nlOQbjz+WmexHYVnxT
	Jm31IAqd4UQnjKBq0fhU2ySbaBCOEERp7rc6kYivoh9X13WP2S5WDalVfS5JwlXJ
	35iDct2p2v401JoVdjuUZpqYQyqNV9Emto0TuD+OdZuTWix1zwMeYvHOUShKZk3g
	/3yXg47sJoj5KWy2lQw+tnnrv6jLe0at3etoDjMcai8T29SsbhRQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022089.outbound.protection.outlook.com [52.101.48.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfuwy9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:49:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7qRXjaASFEAHWY6xZpjwVRs6ZHn/EX4KJM6Md/cJmbinQRxOWDWbhk79Nyq72bBGfDDBEbk1wMCFFf/c5fBnDGKsV4mJ16roT2QWyJUGP+VN+KOVmc28AGwJ2RSmEAWD5wHOEeWjq07gmlXcm07s5FVdmz+Tq/Moon8TPMO6XqscicCWFz5PsXJtqIhYXD+MrzBo5R11rieVyhzna0j1D8qNrIiC4vipU4KNU4zAMPwSzFFLVjv8/uhW0Py/THYb8jOUNaiv7dLN195DmLeqDxext+1K3FVM5z21zMCGK4QJaTNxkuBllHu2EMDZCpg59noFmkCQ5yb9DQhfapZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpVOmL3Wmdso+hfcQnJv1tyiFob7rX5Jta/4VOZDptw=;
 b=JmsO7yrUCvNz4RE3Er9sx1+gzjhcPq16qO2hO1WogwGECa3tNXAGb/1U1SDK5sfP7nDr6tjZ8DXY9uabZ5NT7veYnn4YwKdcG/yeTyH+m60fnOhqM2LlbP8ZETxfh/rDEh8y8D4e3RbX1BDpCHFnzRUT6phnaL3slKD2xnITiy61IucH50QkmQm40iYLCuVbBGD6L1Q+5xoAixehKpbjkZ7ltkL8rTExvNlhsz0oOSqIkiFZT/pSAqcl1RdLKpj/SYnMjnF3uWkfyPNjaCpykqaiGqxI7qqbau95tmXQbOhMPOXr/BzquHtBl7j4E79kwaTMMt+U/cOG7cNDC/vR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpVOmL3Wmdso+hfcQnJv1tyiFob7rX5Jta/4VOZDptw=;
 b=DR/oPS3wvDr+0h4mXnXA9+2K9wvkKDTlpQXPQ7EgBdHf1dVEjhfK7jlPO2MNh8GhOMEIhIwpmoQxLUiRTHNB55o8w2FO6M2sWrXPW/yA2ywTOUN+V+Z2yT8sH5y6EWmL4lUxpnyr95fTJY8Likd4ZG3oabBEXnkfLRoYJ7vLq3w=
Received: from CH2PR14CA0024.namprd14.prod.outlook.com (2603:10b6:610:60::34)
 by BN5PR19MB8815.namprd19.prod.outlook.com (2603:10b6:408:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 14:49:44 +0000
Received: from DS2PEPF00006E23.namprd05.prod.outlook.com
 (2603:10b6:610:60:cafe::91) by CH2PR14CA0024.outlook.office365.com
 (2603:10b6:610:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 14:49:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00006E23.mail.protection.outlook.com (10.167.23.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 14:49:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AF8F2406544;
	Tue,  3 Nov 2026 14:49:41 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C41682026C;
	Tue,  3 Nov 2026 14:49:41 +0000 (UTC)
Date: Tue, 3 Nov 2026 14:49:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: linux-sound@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: cs42l43: Improve pop performance of the
 input power up
Message-ID: <aun0hBGiOrOz51pX@opensource.cirrus.com>
References: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
 <20261103141857.672537-4-ckeepax@opensource.cirrus.com>
 <sashiko-outbox-195464@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-195464@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E23:EE_|BN5PR19MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 89923ac2-caa6-4830-9b9f-08df39b9b236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|82310400026|16102099003|22082099003|18002099003|4143699003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DQz8nGjZrow5nMYpXOn+xyqJ589p0ia2gdK0Drd7AqMn51FgpTffX9XsSUbnUMYVMjeH2bTAmPZYfQMfnj3xpJEYSgJx8Hke+Rhiabm2Z9ruxVEnjLnuCPZEpoKbXTQZ1tS0i/faxNxlr78RDaY/sDV8DeK7bT9NNwkd18F24Qn6P+5j7utYDhr0IfKmZViWLQE/j6OrS2c0uTZk2Z/SayvzmwMYhv7XDh/kTljplkELeVVYyxCLOFLQoBL0nJOBZ/deRUCc2ZarMTw/qCfqboDnScXUnKx9iKNZuVD1qUvBjO3+79HR/2opM0CrQUaME3s5HJ7q9xd6kjvRHF0PB7W9dyPZBAeCX3snKreuxKWprpO38vMUAOlVC2tkDy3RoRG2d1SEiyXf4i/HRFsIJUf/+Iydb6K3+oIIovMLdwRiTgX2H9a4Bc24WunKkl9E63FLwCjXUcK4fiI6n8sIMxO5IR32xPkotuM74c1/S6JKXhxTEL0xLHRDC32P6cm6LC1PEXRXn7kigfTdyzU+70NLsaxO2eOcGMN9GJ6Gm4X4UkcXwiG5uqV8cAHjS/ZI59g40aI4uW/q4/y6qftOiDeXDq37aekcWZKXZwI1wG5ebfziiDB1tIwzL8Hzt7tRSw1ONt4cm9I2FQ91kVrDT92l1x1lVb6azl80+9sYWpMUmdnFrsO7fwC/lxCB/2UnrNnVtPS3tZWlNKuUijZRAA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(16102099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ySkpBz9ybt+7sV/wEzDTPxn0KilJ1QkGyM09IBjeIMnDxldkVXYs9hQsuKBGss+jDhl2D7CaIThsMuwkY+nqAccB3fzHqPaskryyE/cDm1++FDiVlEMW9+Y8Se/UxvHrzC+AEruIhcr5OVJzi7upn5WYRMYDyORODFprOqLSsTjXhvsq4YWWOXmdbsqdTQ7CnapIgkfrZ0wXBHydQdvUEzuDbc2dAO6Kd/6hdT+JW8BPMsgoFFqBU6w5v9IM54avl0yKdMBNRZfJl8Z2QwaG65v1E3rES9UzgR2cTXRSC6SfHx+q1tvQNf0tFby6TKRGCFOb9fk2PyPzPKNmnMLH48OXYh1e1VOJG88PoQEbrGe8tMp8lSeHJ7vjFDPXW1vCrb6+7X5PgDDuNdfSXAPCI4m2NGA7/0ryofc9xLZaTYjVKzHuFUyCk9CBpVh1A4bu
X-Exchange-RoutingPolicyChecked:
	5B40ZBBekaJJ/YT8TZNFMr0jvmo1lb8EBM/CCgHn6ZQUttcMH/blELjyaw8Kcmfdl7zA5v7P1qT+B5e8kDpez4ySS6ZWU4HKaf9UQvQmykVUHzHarQTja6tJ27z4gzPiT9WYO/FNBpeCThGVp6zyEhNj1ZeYu0tJi1VhSH6o0ECYaetyyPCpLddHzw22hHdMK0QxUsYm1iFUKXqcdmFEG20jqDkfS2/b4/jXrjGkmgRJACVIVYm2hfCZN4zBBijQdXPIGJkfTzVp5F88WIO/4CTH4MnjeHQ0p4GBjzvUFRMo1OAWTYhpyWwNp17gtQpOZLNH3ATfQkANfIbUb4RsKw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:49:42.8995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89923ac2-caa6-4830-9b9f-08df39b9b236
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00006E23.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8815
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX4E/nB7zl3kIb
 nyKXX2SLJUVX3KoBRNLIJmqPuQ1T2PDKfB23/vOLxTbpK4ZRyGB2dYM5Lh84i8GbDLhjGHKUVqo
 vXysEHqDZPYOmjUvsPT7k4kcv975LS9D04kfKsTeuvWKVjY0EMiHKrIq2UaXwgSXgHlzIr1Nk/d
 mN7/kWPuYfSgATIwHJKvyNKLAkbRm1JIsZC6nNwub+53RBVZERV2vVWREVDztRmCcdBIiVYFs6A
 gutgBs7a1IROz9fTdRTjLZt2ZT7G2nmw9YEadaw1LOWn1Mg0iqKBUtvRHWqvPeHZY/RzAgJR2Eg
 VbgX8gcCfFM+z0y/w7e4y9S3SAJC8HIzi6G7tZNYTIX8hG7Ms/KYWvmBdWYiVQxmuXceKqMh4GV
 2T9nyidOoVrGTbG27o+SA6bpOFvegi0l22nJ4M9zbUSjKEc+KYkXn2HoWHbcBj+YYA1LlORkvfV
 jkVqOaYIo7Idkyo+dXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX7VJ41c/uqn6c
 hRgBU46L1jXCpson07zxmOy3TKbmEbNjbP1WCQES7s3RnEkgW7gdDwNVjaWtezpPHohFel4dULO
 zpXU9Ckus39W3P9Cw0CRQU+Ifi4k6fs=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae9f48c cx=c_pps
 a=88cenwDluC1K+zw7ozncdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=7Qdk27SsdXZ-hJQBwF8A:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
X-Proofpoint-GUID: fTa55-Ee6EwRfM0Af2E7g0UMcrkDbE8-
X-Proofpoint-ORIG-GUID: fTa55-Ee6EwRfM0Af2E7g0UMcrkDbE8-
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 02:39:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ASoC: cs42l43: missing DAPM lock on Decimator 5 and 6 HPF controls

Sorry, foolish miss on my part, will do a v3, either later today
or tomorrow.

Thanks,
Charles
