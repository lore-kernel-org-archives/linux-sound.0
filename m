Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172701;
	b=QsInflI0LjNX9L04rvX3ZAtUOGxOeaa4WgB3HoWZjXY5j7rCG9bVfOZHuiPF4s9nQbnY
	 DsjTzTclcfjfDGudA1UsNcUoB+LV386Qa4lXsylUzmNkTUb4gd/lLyo1gHnLNXO+2JxnM
	 oTaVYV/ihoshEb9dEXM2NKPT/+cDxn6Z/7NwVLqnXC5u89CexqGaukzqLCo5uxlxFN8j3
	 9xJR0zK7ooeoVJAz2FBLhu9Noazfog64WBPTfQPE6iUn47w8iXsAEj593B67a8fyyclHO
	 C2w06fI7goK/zENDzorxUHBwHcGPb6qHmAqMIZ2BNZ6SAj7NdQSmq4S+fZTRlaLpfBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172701;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
	b=y9Ls6vu/CEoImpwdlooPauIjWwuNhxGNoSHBnISjcrQ4rvQnfY4JAxU/c9QyMyECvTq2
	 HASddRISFihPStfJOPYohzF8Yt1fy2DRV8JNJdmgVZ+UX82dE697/ZZ93qjBZyXlII1zV
	 nt3dh6JTOHeVzvHX81IlOs2Ku6WYXIFSJ622cmzv7ac7IoXF/mikQsn5iNVdwIh2NHgNn
	 6ZbrfnhmbOamiuFN9sAeEdyaDGq0KN/YFWuO3tBhsdx5DpzTGCYLp70PpTqjnJYWRRT7E
	 lq8KUzQmnzoi0eJr38JpRvit6q/kDWpgcy2pBHjvaX7K6DtGO5VOwNeOJO+4S94Op1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RNpEdcYn;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PGaV0HKo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4860A2601;
	Fri, 20 Nov 2026 11:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF4860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RNpEdcYn;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PGaV0HKo
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7TLEa065740;
	Fri, 20 Nov 2026 05:04:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=; b=
	RNpEdcYnQ+T46JRG+dTNtthjUdkHYc1S7aRuPqE3L0rgxsDtrQVSr0bfsOFIJW3t
	9GhbN3+g5B/9++FJeF+gFbAJeaRIzVdpQZ2GQoTtqF+rIcijtMS8T4pAlszcvLGX
	8W67YKr0uST5o77x6tHtvfd6QLzDxUz8TloIIaQsNDLJ0DfdtsMzFpPr6zxaSA8l
	HhY/AVYMWBUGPuB1GM1WMKZNItZwsF4yVSspBArKvcACMdtDm7Yp1jTmGp1gVVRG
	3DDcIHe/5fnRArzn5/lCT84LRv9/A1F1IemNYgQrFwzpEXHGbfp2GzS92n8DboqP
	HdLuSaJHkM5PEgO3VAwDaQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020109.outbound.protection.outlook.com [52.101.193.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mhtqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 05:04:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiRqgYkNBpTkAfvs0qmWgNOvKLugBbq8rbm9f8s0SIfZNYbVfuEjYu2es3+sdl2nLNZpfHxQ4paVpsFTtx3RPayvpwGOUNa8iMTV2CzOXYUrIgP6jpaIQmnfWVGoN5YphEOnI4qqvelI1/ODXWq2LResxzN+xTFBx5xx2vw3tUOi7+tOgS9Q8/saUe+nD0oEcgjg3KHRLVIY8VOIPKSVHISCPWaX8UV8ijy/Jd9LRdYYmnlhg4DPw5MI56/7xzW2269//01OX3+mDJm/YjW52V2EYXzDy7bvwBtJmJxOAy2+FDZJUIqyTUxsOR07MDIrqeFJa4xv791HYIutPwAIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
 b=JigDKS7IXTYHf46dBP5ViBuy4wjq2CpYKqLrPOZnavvIZB6jaYX6kBAaXY7o4r3VE8Dpeb9QSfG1LNjFdH1KMphHMY8NC02Y7cZGz0nUjhbUVEXBpd6YQqfQdfB5bvDacQZmlHsOOd0O852zG707Sj7Od4bDqlyls89Njq7S3s3UFQiTMaBD/FJCqhuGl8L8Qu+zlFmN37XkGCFwLcttMxf1gSbMQItyNDESKk3mjMnlYYsiryGcmrdJI1Zm9pp29KucTFJ5YncZ0lqMzEzdAKEvXnj9J+PghoLk9hVdvPTkz8vOflYW0d3PYlMSZ62xhxpU5qGl5m0yH3LanlxYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
 b=PGaV0HKo8f5NRmN/Kx4FfUNstquZhwPpQhiMBEaM9Xw7fj5nQSehnWb+fTg6TiGj2tucT4kOLVWlOtP9m8UIgG04XBJxxaXmFSdxvZwceFRNd742Aj+ymaBlm0cJgIIr/ptyMRB2bqYoBH2sPPwWWQTFUAyezCFxS0rObKx5l/k=
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by PH3PPFA6A2CF0AA.namprd19.prod.outlook.com (2603:10b6:518:1::c40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:04:44 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::72) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:04:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 11:04:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5309E406557;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 266C0822545;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: cs35l56: Eliminate trivial regmap patch
Date: Fri, 20 Nov 2026 11:04:40 +0000
Message-ID: <20261120110441.2163567-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120110441.2163567-1-rf@opensource.cirrus.com>
References: <20261120110441.2163567-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|PH3PPFA6A2CF0AA:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b25ffca3-9b08-44c7-d344-08df46f61560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|261102130727099003|261009223027099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	a+0Hj8w1SS8ixPSPZym9ohR9ZwndvfUD8c8GGjErghJUprGfhgM3J3DmPXdiT4v9w2WBjEgEQBOOgvMuB5fHe1YMlgA+fmBk+FqEMeviGP2az3y6T/1i9o3Gu+AmNDIcuty+yuusJTMKvek5UojqRJoPPhq8QTZgU86jfdiCOrVU7Ybt35ZAcIsGhY6Pr+WBV7v2rzPA7Pwupd6LF9SzoQdcQ78EMq0wYbXGAWyGqCUwmFE2s7zeI+M4InTrdkoMeMrCjELSthiIqiUxYcdY3dnK5oQzyE55EL7nsfjY8XmetzgCAlNTmbH2d9aJM5Gcim7KXXMJBRppfVUFtM0ME9HQU6pYFND9r4r5xqqAkw0bYtJfAuZ0DeoGBZjyiUSGHeNPQ//wEmncPJF+Bl0Y9InPWp4H7k0f7WAhi6fC9Jssi0HufjpBcftoIk7NmGByK2ezWFPag3f9k6Ocpvgl6968SqFvoFXOoppESNrgNDGfWSGPYowgH0M4LYs4ZaBAPUR5Jl5aKn4yMJRb0iuRG9k2JkSRPKL0ACl0lYSdvvtTLIOu1sLX/24Fa91k2CN1KZsdxIU9e1LvPKMYUNkASDjyqAeDQq2U2aCE1uU3gyxY4wDdYwRc3FGh71YLwIoi90GglRn2H/tpeYDIPLPRq4Cuzh8RVzhFMNTEq2jztCuLyFctxywMmqcohI1ZEG/NTM+2thZO1Zbd7tb3cpPW0Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(261102130727099003)(261009223027099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	asfL0VT89MZfL62BbSoQuAN0wLSuyJPm15SgL04gVypR+ts/QSZO87bfWv+X9Ju0BBvrTIi7qsMNipt/l7C4CPEEg/l0YuxZxcty498M3/zMfK2IB0qPntWHaxQmjSVJqB1WOkjhvfVLuJxGjn2PXmxTtvo5Z542CvjXxkRNGlkamTffKJhzf1TMsawfnWAezKGNVf1r1yVfQFgwTGhgsPnrRmxI0Kwv9SkHV9K/V/u4hOLuolfI/ziQ3xWRuOOnWW+XWy8LG/UN/uPaedyWDwVKesErnRvybakSRFQ+0a+ciN+26WnkWGa870cGOxMJFyD367f7XUmgPN695XAeb8ym9dpC+R1Js7cySZf8Mq42+7TJG64T2DujaeD2wGdMMtSV5P5v7vL7eRfKAykOGhiQB/DpyQUdmNxX0u1knkVR2VB9CQMktoyB5/a9HI61
X-Exchange-RoutingPolicyChecked:
	Ni5AtN8L2CKWI3bTr5dsHVymAnkQOKWO2bdbaDjDHJQxtNwjI8aNeC5wOex4+BUec4so4rGANjlKeoO2/ZBe14sqzlruC9aFQDN2awKfeCbrIoc9cg5izye4Bd7RDk8ElJS+5D4S5+FYRXbzbFi97f8fZuj9+/rGqUrpUj17XNDJmGkTjY6sOzg+H7puAH9VCUh38HYPMS+2GfR/RGM83mDNRMD9b8CGLickJRJ05WAG01IvZEgZIup+d+7drvmcxJRsJpyaGmAp5DCEameuNuPuLtXXaum9dV+bj9uAvTvZEnHcB93XKNKdWli8N4tncGHsL+9E9VW/tWhFGC02TQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:04:44.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25ffca3-9b08-44c7-d344-08df46f61560
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA6A2CF0AA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXyK8Tne+Wa4Fc
 KYLpsCLe8OHurOUPhMl0wC3IeTqUAbwJ8B+Fexq9mm5PZsrJt3LTITLJbaAHDvbOM3Uakc6t7Lv
 rpvPt+z2xcHcfj1FndYdu/pDx86O5TzpyxqevPZ3SPQwnlMCLRasoIMBL/hRwVm3cLk2fNQuv+E
 O3Ii2KojTrtP4D+vIObFxpixxea0eZSaIe6kduVAwDb8g7Mneen6XzjS24ky3UlF5vnIeuIcnS/
 gnhKGc2G6wz0otLxkb2wlHDM2Kt+opSzPq//0/YAHkeQ6OwfahClog2mR8v8ddFaDU684+t+CGb
 8VmSYuE5l060J4Jj5CUr+3NttKYyDntVNXFqw0S7JKwiUug0MaqkyeZIDzs0DPkhXdGELGdPfBx
 0AD5UQ09NAOh5Ui/57e2pFBgGh/y9VR2phIQMzQJ7MRUtBgKcI77dJYZcy+26VYBjRVks4utRcD
 arac6sSHzPSqSHNQPGg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b002950 cx=c_pps
 a=cqkZ7RzDZd4RD9VGRo3S+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=NFHPZ3Yl8IAozPUAK0QA:9
X-Proofpoint-ORIG-GUID: q2IT8Ar_elLtdaCX7oyhGwsbLKQOyRer
X-Proofpoint-GUID: q2IT8Ar_elLtdaCX7oyhGwsbLKQOyRer
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX8zvuoDI6THS4
 KoOxDYLs2Nt3gyCJle1c+ux9MVUHdfQQj4nOPRJ1GPPhZnDkkZ6frI8GWZQFM1HMI5tEEHAau1B
 kaXmvFuta8pPlEFVuA0LzEdLTwgXtVc=
X-Proofpoint-Spam-Reason: safe

Previous commits removed most of the registers from the common
cs35l56_patch, leaving only one register in this patch. Move that single
register patch into the separate cs35l56 and cs35l63 patches and remove
the trivial common patch.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 073f7bdd3b0d..34aebf81f4a4 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -50,16 +50,14 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_patch[] = {
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
-};
-
-static const struct reg_sequence cs35l56_patch_fw[] = {
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
-static const struct reg_sequence cs35l63_patch_fw[] = {
+static const struct reg_sequence cs35l63_patch[] = {
+	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
@@ -68,31 +66,19 @@ static const struct reg_sequence cs35l63_patch_fw[] = {
 
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 {
-	int ret;
-
-	ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
-				     ARRAY_SIZE(cs35l56_patch));
-	if (ret)
-		return ret;
-
-
 	switch (cs35l56_base->type) {
 	case 0x54:
 	case 0x56:
 	case 0x57:
-		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
-					    ARRAY_SIZE(cs35l56_patch_fw));
-		break;
+		return regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
+					     ARRAY_SIZE(cs35l56_patch));
 	case 0x63:
 	case 0x62:
-		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
-					    ARRAY_SIZE(cs35l63_patch_fw));
-		break;
+		return regmap_register_patch(cs35l56_base->regmap, cs35l63_patch,
+					     ARRAY_SIZE(cs35l63_patch));
 	default:
-		break;
+		return 0;
 	}
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
-- 
2.47.3

