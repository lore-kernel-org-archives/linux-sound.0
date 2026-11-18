Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999294;
	b=2DJXP5aiKNZQvTwDSJAHAghRBxWgsFy+w2O1ZXDPbsmzNo5IHM/gPLC1q58F0J+wXh1Q
	 WHQLZ+O2RY7DlhuPoVhPAoaZOo2GxuJKo5MNXcDALQerYBZ/037xDg2xJgsuQ/Nnvt7c+
	 FNRmXnQ8dxmGVhASWsWrYNXVQbntwiMX1S96obiFUk/NnpBS0by3XjasHaoZXLDJnmPXO
	 NGa20vCt1/KZt9d82qefOEhnLoxukqoQ7x4/e7bLHjaDMmUwMbPifdyRGQaqB+tV0r1ra
	 K3vz0u09ytifQK7Ekf7wcwyqGf6PiZfY9mtIbCRFnzilNE7fwyKTJqk12oLgwRHNhTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=8+GIjYIgu53VALUzbF0KV/RN8Xjr9o+63PvbPIzxXcw=;
	b=1oqKHFbaMGXTQ1cJfF/PaBFiXE5jeKx0t6Vb/+6cAu5DZPTgw+T7sbdbepJIcT3ft3M/
	 yTX4eU82HTC61bXUQEBck7UcVMsHIcBjX/gkDz13RicBP7xCJ5JjL2Mgw1cYRnJ9CJ2Py
	 /scXNgO8tBDaaAMtmv7bJ0FXV3YGSbrSV9ZUt0nt8/nUI8yyIsoynkXdisp7Lg6FlsEX6
	 yJaHUuvgLF61TPffbrm8tyAmo8r4C9e/agYKkp3e28bZpfKTz7kx1BsEO0ClHNZyso5O8
	 v069JdSsFTSMjjmyOtZMnxEWnDPbrlSBKkI+2W6ORqtUt+RNBlwNGRb6b1Copt3sV0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=STNi5BFT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=g6ViDPrF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5C606A31C;
	Wed, 18 Nov 2026 10:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=STNi5BFT;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=g6ViDPrF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9ZwHb3721351;
	Wed, 18 Nov 2026 04:54:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=8+GIjYIgu53VALUzbF
	0KV/RN8Xjr9o+63PvbPIzxXcw=; b=STNi5BFTtkjqYo/eZI6GbLQPC19sOHJB37
	hJWKBm2jr7rhhy5xW+qYaZ5c7O49L5w4ccFYRhEluYG8OU7TWIQSRv9TmrdgNMQW
	fRi69c0iSxO2MwJ2ChLYQWF+BY9GHrwgYV26xBLe0HppBQp/Sw134zKD1UyzRDGs
	vpSxqG2rUf8qJdHeEZnFZbl/3DaO7h5kHIx6ZNpA1J9WUfFsQ9Yx3YMhuJNWGSML
	Fy/DwbWkALflMhPDUNFwbSNBOUklxj8NSUa5yPcE20AkTv7hIR9Jb39i0HzSMrjg
	dxfZHGyFjnz4v/Dj6y4vL2vjDfGRhTnCDTocrbkLeLbltciY16bA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022114.outbound.protection.outlook.com [52.101.43.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j0ytsgq8n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 04:54:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw++ZXFCHuM60ovVsFEPUutY5Zll0GUjRF5YUCb/5U+QKAUa/b5p1gMAUpHrQefWi24uJ4+mLiX6vqWOFuzQmV6AvkFkWYkZNi/PGjodaCcaBA5m4paT+kHyOOhwULPoi5KUBRG/D/mXfaKIz3j91W/Y97msFZjTbecUZlYzAi3dWFfH2ZPnA7u63wwrDx47e8oAknUFit8L6pvPpt4a3g6z5uP1ljUPANFjLXOyecsCPYsfpFIugTY7jFoQHckwd1LW4f6qCG5Uc++s+ZD4yObrKBaCgzmv/6eUB6sKwWyIJBBV7gw4BCP+CwetpjzU7cd3y5NziQVcL1lT8Ug3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+GIjYIgu53VALUzbF0KV/RN8Xjr9o+63PvbPIzxXcw=;
 b=E0/MrG5cE/zS8vESZgiOXsdZ042G/z6xIdh56C1il4gXeP2B8dFl/2VOuR1+Fd1fJCqbsKd/FzfZ0Dz/SPzMF960GqhhD9XK5jvS3Qg0Yy5+gZwFqVlcCmbzOFTrGV/MoJhr8NrjdE4iQuABXeciDzsLPtvgpxJg0i6hxB2R0nj8J3kecEpSbImZBTvyP0KMy2X8uJYAvhU+HQjgCMJ75Me69o4KQuXssF1cmh3bku85aKynQjvYtg1LYW2wI1KehDyS9asW6Ly7KeKLxINvo//T6fV224nIHiofxq2N3xPU8CzOQBHBG7sQXQLmVZtBSURnV2my7EewFJDsmn26hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+GIjYIgu53VALUzbF0KV/RN8Xjr9o+63PvbPIzxXcw=;
 b=g6ViDPrF7+KTThdr43bD9xkbaa4t3xL8ehrmMnmO7M0GhKQyhKvj1dsZ3uo8Iya/3XWq/w3eHZx0jpguBTmYzxENHa2Ob4agl9yTVXcL483xD/iMtER1qdpdp9rbQ/3LCbh9F8etS9QaTGsBui6BH1aOAcfqLC4gf/sRWghdiSI=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by DS1PR19MB8722.namprd19.prod.outlook.com (2603:10b6:8:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 10:54:32 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::2b) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 10:54:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 18 Nov 2026 10:54:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34929406542;
	Wed, 18 Nov 2026 10:54:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 113EB82025A;
	Wed, 18 Nov 2026 10:54:30 +0000 (UTC)
Date: Wed, 18 Nov 2026 10:54:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Use Function Extension info for FDL
Message-ID: <av2D5PvUiopWIhFv@opensource.cirrus.com>
References: <20261117144853.2357660-1-mstrozek@opensource.cirrus.com>
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
In-Reply-To: <20261117144853.2357660-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|DS1PR19MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: d5442e77-f0f9-45bb-8ae1-08df4562530a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|22082099003|18002099003|16102099003|11063799006|56012099006|10067099003|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	RKT0MiH0w0sCjrtxPXV4yNohXQo3O3TxguczwPkXgM+ZQuQhyEDUxVPdmmgW9fEDG5tAg2EbY0MC18jFUHJPi4+9gtfORjEUTgN2MbY1SCTLksHCrivxTtqDIZabaDlbwBLpBj6WFEN9TaNHZGXFWJXLaCuByuW5Dnj7yvay2P2lwoQMp8OdRAEdpMQ8V7lkIE2vgRGgCAtxsBCrwzX2pRv8b8PrQXJq2uttVyjhmZpy4nV3lhzFmqVj4TJZ/a2UeFdF439s96GPLy1tPrAPKepCefaz3//EJSRB6d3QG/T7NzXHHjFRQUFO6ZS6Hr+dXiAjr+R1Az3kwUZDvVXB6ixj6rk+B1TxddqurdkKUWRnnITovNgb0+LSDWeVJiHyy5BsWCCHaPdi13k80J2i6AV3c81OsUSQVCO7NgGsRAMikqaqC0A9u/Ymdss3Fnf4veQm30qG8wqSsbmTFDH2ZlqWPwzGq3OtK4nN5gkl6r7qBlUAmyTh78fS3y+k4oxzMQyI8FPKLtGD8ae9Ln1Q9wP5gIwE1QponfGcbNqCtRBUfTS6iWDLhTpPLfcuE81sxx4kDIHiOmrFeD5t4iXS5Z8XkDBz9vp4U/MBfTzEG2JPRyFRZ28CkApufUTJ+P2NOPvwjn5rsHkfjwxa1mbs0UdKEBk9GjGWQjvaW7PF2BrDP7w1QW+HHwDbZnJLH6i2V2z9Te581DK8avsKBr0LQQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7zkSuKO8sLfZPaVgy3IwOzP8R6OC2Pnrx9WAyPNFN5AVs+cQJsBr4o2Y69erjd5ZYI5RfJzowRC/+PWkiLt54A3LaMCY5J6l/qB8b4klqRfLItb+obz5Maj0gVFTR1+Kc2UOUof0I7K2oXk6pxbQQtcFItQoihniMx6iihZXOYnf+HtbwWo9aWvkLRm6CG8oZQg57ybi6Jh0BOmRJ5N3KTB77vqKaav56jpAJXolicd3n1yP0Wli0S0VJb2w/EGaAEWGTaG5OrSaTlgBhNW/Oc0R/1DWHZI5NVvkAiF4F23OuCKCyvOC5Nwk61K6dpko1/UPztkQH/H8/UtVEBqtwZpDPxxlLdAp2j+YNAFJpwhMrjIoUmVZnLNCAK3N32tPzBsa2maF2WQqUVIvKrH29reLUZMLC/GgQtrzHucwP68hP2VYeXxWZN2luWC8TA7o
X-Exchange-RoutingPolicyChecked:
	PzKnHxEyisGoXvrrFzVv//+F583e4LV7WRRaAjEKO8hauMlLvpv43P/zgl4+D0d/AzY6f9eiPgBIJ/CvrXXTemWbTfy4eFTj9dSjwhFp+hkWJ1ZJgMWKw/md0T1Jrz7SCOa5VX4rXC18nlYltdV95D+CzucfZ+89ajy0J84sCWVNQsNqxkbWmnlI6SpCfE1zqIeESSEYJ4trlmehgG7ZE/L0zAmaZ7AnSlnWHijFcb6BOcQTkw8VpkP9r5hRQN1NywH26yNWBU1c1iURqvnVWlW0a8gBZFy7Z/n1YazxkeggMtnwPOCC+czyA59ef7U2ZqLSVPc3zrq/go8OpBkImg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:54:31.0084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5442e77-f0f9-45bb-8ae1-08df4562530a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8722
X-Proofpoint-GUID: OeErngygnejr7kA9_igVHsdDkekiFeR7
X-Proofpoint-ORIG-GUID: OeErngygnejr7kA9_igVHsdDkekiFeR7
X-Authority-Analysis: v=2.4 cv=V4ToQuni c=1 sm=1 tr=0 ts=6afd83ed cx=c_pps
 a=ZQLENUxQXoe8E0vMiJlD6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_9NFkGloLf5p-gctM20A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MyBTYWx0ZWRfX4GfNKArkitLN
 WL7pZq2/bnQuddxkfLBALYIx0UiTSPVqlD2awvF349oMmUdBnUHLNGJd7J+6hiTmCaFmWmbyOzz
 k5Yseu5ETWYW4kMReYE2xXrPo3ZC3hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MyBTYWx0ZWRfXx8tqOkn8Ty0T
 imtnYm04vPOQww11k5xh1xrv5qb0ppKy8id6CqQnaDayfO41bWC/wQIZMeUQquJUOQB2toRYkjO
 sqTl0rtgmnCRjCw1Pnk25NyGtLtC/lyMZY+kufcHoJVojeDVGVDnornqobJwF+fW4BlgeAPUwj2
 8ByAxcAZL4ZSUj3mNYLz4nQcNRWa9ICWjLAxPRQ6P6ogrcu7GolWJL4zU1KrfyOhNk2gPyh8BKF
 StUmTiFLEX+GQmPvg7D6B8QSoiuxlE3AOJe8qexGOBxuH+pJxldto8rx58B0unU8rciV52QeJa/
 v7OS4IgD3vuxsa+KpRuKtEyUc7ohiQygogWvpFqRMV39jgKrNW7Tx2/xp09RzraPmdEFct9I/HZ
 czZ4FMINDRYBKcavUFPn1+8U4ILsT+qJh2aWeOz0xP0VdRtrqHWoS+h64xsVIj29IqrV3C7j1jV
 j7KoyTONMILbiVYisCQ==
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 17, 2026 at 02:48:53PM +0000, Maciej Strozek wrote:
> Add additional way of selecting files for FDL using Function Extension
> ID and Function Extension Version, following Windows' SDCA driver usage
> of those controls for FDL.
> Make sure the introduced FEID/FEV search path is separate from the
> 'legacy' SSID-only search path in case some vendors choose to re-use
> SSIDs for different SKUs and identify them by Function Extension
> controls instead.
> 
> Change-Id: I6ac1a5e5c85b67c2e9e0eaff930bfefd5e89afaf
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> @@ -231,25 +263,21 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
>  		}
>  	}
>  
> -	disk_filename = fdl_get_sku_filename(dev, fdl_file);
> -	if (!disk_filename)
> -		return -ENOMEM;
> +	ret = fdl_get_sku_filename(interrupt, fdl_file,
> +				   &disk_filename, &fallback_filename);
> +	if (ret)
> +		return ret;
>  
>  	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);

We should probably drop these FDL disk filename prints since the
filename is now printed through source anyway.

>  	const struct firmware *firmware __free(firmware) = NULL;
> +	disk_source = disk_filename;
>  	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
> -	kfree(disk_filename);
>  	if (ret) {
> -		disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x.bin",
> -					  fdl_file->vendor_id, fdl_file->file_id);
> -		if (!disk_filename)
> -			return -ENOMEM;
> +		dev_dbg(dev, "FDL disk filename: %s\n", fallback_filename);
>  
> -		dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
> -
> -		ret = firmware_request_nowarn(&firmware, disk_filename, dev);
> -		kfree(disk_filename);
> +		disk_source = fallback_filename;
> +		ret = firmware_request_nowarn(&firmware, fallback_filename, dev);
>  	}
>  
>  	if (!ret) {
> @@ -259,18 +287,19 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
>  		    tmp->file_length != firmware->size) {
>  			dev_err(dev, "bad disk SWF size\n");
>  		} else if (!swf || swf->file_version <= tmp->file_version) {
> -			dev_dbg(dev, "using SWF from disk\n");
>  			swf = tmp;
> +			source = disk_source;
>  		}
>  	}
>  
>  	if (!swf) {
>  		dev_err(dev, "failed to locate SWF\n");
> -		return -ENOENT;
> +		ret = -ENOENT;
> +		goto out_free;

We shouldn't mix goto clean up with the __free clean up. Probably
better to use an else here for the UMP write.

Thanks,
Charles
>  	}
>  
> -	dev_info(dev, "loading SWF: %x-%x-%x\n",
> -		 swf->vendor_id, swf->file_id, swf->file_version);
> +	dev_info(dev, "loading SWF: %x-%x-%x from %s\n",
> +		 swf->vendor_id, swf->file_id, swf->file_version, source);
