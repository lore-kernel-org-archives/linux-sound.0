Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243493;
	b=WRC4O1CCAcrTXtEt7IAJ4iMlRbaE1rNkxf58e26jVGxCddeV8zLpXhZ6VGlvnmoy2vGx
	 HpoKb84VFdKQLZ+vrh4mOVV2YpDiXI0PrwZP4zjft1W2Utkn5NQoo0fvVDcryY4XqvZWD
	 QZYfqXbq65YgFdB/Nv7fWxTCiKZ6ZxA3PiFRJQ2EbeuUV77QwgpY5xs8QOevaV5ARTHR+
	 FPyiMPqbTy8YpSJ6KdPzl+7a4YbjSMXT/72hSNMtwdgXPp891Xor+9YPc5adq1auaj07a
	 dehb/8ilRi/7whFTDuFzzXnr2k3e7xNNS6D4AE4syDDKK1pXIpgK9sGqJ0culUPdKtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243493;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=+Rxkv8AaDQ4JtsnOqlthfn1W9chnIizkNBz7GnvA6zU=;
	b=G1cDQUHl72t5q7toJH4Lrj1gZr7szdLco0Mqp/HC6dpj+qytKuZWn5ZJMNlwPgUoq3kC
	 8yP2XN7m8R4HArEZY2acisjjPv5CivSe/GqqjJW1anPzGu64IzRaHmA+V1dRUlcxLy3VO
	 NhE+mkpKApcvRpzr8JDe4vtYzOclNiGudC6A4HnKGw+eB+mshQjPBHRojz/oFJF5hFy7Z
	 yjfS9HlVzilL5Ao98Z9rNoHjL5gX6RZCRzJ6x7MQL12mIiNsw+UvXvxc2TNnDmbBQgUZO
	 BzPYPhVHzDdh6fPuYrikGibvOJo9OU1O95mYotMRtnyOK5BZGJcmmagC+O04tcZtCvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aoZEoZeS;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=e1Kqn6xA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56283606A411
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56283606A411
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aoZEoZeS;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=e1Kqn6xA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FJgKn2615299
	for <linux-sound@vger.kernel.org>; Mon, 9 Nov 2026 10:58:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+Rxkv8AaDQ4JtsnOql
	thfn1W9chnIizkNBz7GnvA6zU=; b=aoZEoZeSoQj4WGrdSDca+QiDbRMlen9VAZ
	mNbggtSHqCAu1EqA/VtaR/loammstFsVS+VBx+iDJmOXbMv6d1C76ns0pJK2WYb5
	zzf1KqASbgz+YslnHnLqCk0Dx8LfuC9krV/ScuF1md44lrSqp71HVpOOkSsY07Kf
	j1nmE8YRufRExVUQ6PKWw0J2Z5BsbwP7jNmR0tT4X4Cnej2nX2fxFPwErvm4eCDn
	mXlbsA5UFcjmA5vPcFvTzngP7HHfnN5SN3aubKxOoLceJ+xf18dLvSzkYvsqybea
	zc/NKCYBlKtnvQG/B/ai6rNBtz8sm0Ob8Q8SQ//VKVmT0IKtF83A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021110.outbound.protection.outlook.com [52.101.57.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29habf0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 10:58:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zseft17SIPNJkK/3ao9o9liONt/pBOgYTMHMX4syCEUG6Qk+U0c0mUDDt4RO97FG1KNyHUqZ7N78476j/wSx/sSl8YugBT90MgsCRfIFmypvinWe4N+jKJb/VAQ/zj4j4uSgSBgm4mbl5PN72HdZxcEz/yCsM/x/ltl/Nwce4nBlXPUWeKUOYMRMHVRvR2bnwEpsbHUDZQE1nkIdZOoyECn7LlvPahgEaXgg0OYorw7c70Vpk82lV8wDZyi6aUIVOlvgVcEc2jJOf3FbdI9xVVK2Ep/ZCt55Wq0UFCLA4xRfBCfcEeF19uk9hEI1d4eBVw8Rj8JmBHFtqWpLybq6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rxkv8AaDQ4JtsnOqlthfn1W9chnIizkNBz7GnvA6zU=;
 b=OhXdL6j6PNKcT1qD6inTuxuyIkaWNdKaFdLGMNBocob+kB8+RgJRaNAy6weBusofc5GuAMWYJHmV/p93X7ADIgscOjr2LpPQaXNrpA7D1fty0+Y4QGUFJ+wvoP0zD6r8f+JKF8BCU8Ucf5YzOSWbsN/kUj/+RWomB/fRoZu51K98PYl+nxIrDs7QtOHxJLMCyjp/iVjnpJH3dfnzgYa2T0ceZ1HPQECVPChIXGQfxymLL2vPtO/WhEmFHFaBnqKikg+QoHpV3Ik8s+BJMETm9A3Bb2S3saEAwigJ7Sr16E6nU1ku4FAscHi7XcGybHg4+BxT2Psxyfgd4L4jaAfbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rxkv8AaDQ4JtsnOqlthfn1W9chnIizkNBz7GnvA6zU=;
 b=e1Kqn6xAfLFPL66k3+POz9hk35KdfNiAMT/9ZhCt7jIDD/ekAZWd+d+5eATkmJnaCEkl0CVY4XPgQ4H+/waWCw4/Rwkg/RupeCmbWAnxZDMgu9zMqnMxuxrs88/fp9DnKWROxIh/dyWwNNfgYSNoQbL3AcGn0cv+uo9UqWnE+JA=
Received: from MN2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:208:236::21)
 by DS2PR19MB345805.namprd19.prod.outlook.com (2603:10b6:8:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 16:58:08 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:208:236:cafe::21) by MN2PR05CA0052.outlook.office365.com
 (2603:10b6:208:236::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Mon, 9
 Nov 2026 16:58:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 16:58:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98CC040654F
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:58:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8952482026C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:58:06 +0000 (UTC)
Date: Mon, 9 Nov 2026 16:58:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <avH7nS1si7dxs/60@opensource.cirrus.com>
References: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
 <20261109155106.3727597-4-ckeepax@opensource.cirrus.com>
 <sashiko-outbox-205218@kernel.org>
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
In-Reply-To: <sashiko-outbox-205218@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|DS2PR19MB345805:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf71516-b3ff-4880-d1d8-08df3e82a11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026140227099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003|16102099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KUzUI1iIsVhzNjG7eiwZUOFvrqZGrkuwSAJty2y1IEQx9zjvOf63LZtqH2GrX80wvc+G+S0ajsK495Ox6FIIGFEVq4I/lSXftZgHBRiN1u+EmHWwCCDnrX6Py+SeGoDvyVKv0WbSwIUgvOib/WYd4lSTGAm/sF284IBR4mYwS+xH8eH1TiEhUYda3PH0HGJfpFJtEBrr9CU+C2MC7PloR2E4iYlTbcOSysO5qdLN2naodJyi0L1t7OX2WH0D6YTt6OsuWNJ7T4uOEj7FJ9a0umCkTp+JHUm6I+W5FHBPssb2GLNYZWNZ0kpdlZEOOzbd4K3kPgxK7EYpk90/qw4cpy/Bu7mys14ru+xuHGh2LtPTvcBpdkGEySq8SA1XmCI5y4VHknIfg3UQHlsvpkOExdzkF94KOvsFEE8tv/sbPpUOo+GIc3F1NmkVFIEhdteZ/d+tknWn44nVcPQegzrRY9VYCP2UxHkCx7ROMT2HYTaDycHqYZhlpSvaERRyjuCs4VKvFjrVlTbSBJmjZPlf+Pu29CQ2RUFpRclxfp1PWIhCBjuaphPZKjcELO05RDd805qnely5q5Ygf+CV8lGMS3OP09PWjVEuIgL8agmmEjhXjeWIWuih2f2APnN6BkqiIvyr5kr8sAbVZt1CyWJqQ8btuDjzWCzLDtaQa5v5T7Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(16102099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bIaVnCUlT0Gr6byJKQtHDM6W5FaVGvArM3lsJO2Yz9PMOKx3pAtWUOAAe4IAiiBJ3wKelOMt96U1Nj+zRve2j3inkfJO7bCmwnLiPhTDFaNTaydADsiyrCyjJCMGw348IREzEr6OBxaHgumYQCQOdyP+o4CtkoiOiFhwuAzcZWK3vHXCSaH7v4KQlUtJb6rEAavRf73aNH9de4IdzxZwcV9QzBmPDvrJOGM2xGs+ecG6mb16SVKkPu93cSumAz+fxVnjaFuhBURdD0t0xHCdav4f8o2APDyaomQVFVe1+nWl3XD+mo9x4Z5l/mz1Lj9/O2glMxlORpAbKKllp2ppQCAacPc0d3znmH7XWfigFY4Oiq18xsQuga/1HDJqMsl8JBlac/zj4QknVgicndf0Q7WkWcRGde0ssgsAMyMhrOXA/o/36Fsr2Voiz+7buUsn
X-Exchange-RoutingPolicyChecked:
	Bl5W9iKPMYjgVq7p23R62hb++t+1G7aBLc4mdDxg+zvVrIl4pG9OJhII6SGFMh59a0CssCQxQHwlrIdnE9R11gdunM6DfPi1bR/Rbf9d4knt02vDWk4jUquJAVN46ENJRaRdA/zHdxzpPONvDWaIRYGVjsT4bbkwM5t7dxOh/c3qMdRLR+MxzZXHXhHB/SY4avDXqZf8gXtGPB/aUIGmr1OkraxRpzktdfVk/4DrHJmQkP+5R68xBbjrXtI9WcB84s1hhb6+VvW1IKRONCPnXX719u/5irCApjnZUM6pJdZE9Si9Qn20rPMfR6lYRTj3knFwscU187bo2HULn7qOYA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:58:07.7067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf71516-b3ff-4880-d1d8-08df3e82a11c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB345805
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1fba4 cx=c_pps
 a=Lukco47usUvZlN+GeMSXkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=L1Ju3ZaxFok_D8TwtmkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfXziEIl//OVZ1Y
 QxUcGNgBiVOZP4mzyx/rHh9ugm1hOlMSSIg+d+hasEFGlrFsp29qjFe6I2N2inrSrXzv8I5z2Vw
 +Gno+lN/L2TRDQB5hPjU3h9HQ/6Y4oM=
X-Proofpoint-GUID: y1uCrFuDhIBpX0NEv1VuAoeiQ_O_NLxa
X-Proofpoint-ORIG-GUID: y1uCrFuDhIBpX0NEv1VuAoeiQ_O_NLxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfX8Mk6f+RVbsKw
 Ike3kb8usIiK2aKwVfl+AQC30I9vTE0yb8mYYM3wz1pdLGu+OYjQ1WilH1hSHymVTfE2h50IGmS
 +tYtKRZXUy7Kprh879zktYN3DwvZz6QPuacWigT2TU8b6YEnFUGvt5jMF6czEn+ALvopcxMKAaT
 m2WrzvyyYbKDj4d9EtqG3y0x3Fr0xGMWdJUa/fXYVksP9d4ahofBuaTKSN/eTF12A1AZzFsr7Oy
 xMjeIQupJ7Xh5m1BArHQchMH77iY/Rya3kqeG1C2DsI5wUbbxniC+dQdyjZ1UcPH9vzeavyKlf/
 waMpeoe91Spu/Dt7Cr08XMZiv4brodT+yREzh8MZuJnmmLhgiGTKIRChAcL75EE6b72PyXYYUVr
 92/YI/6UjrSXtpjpkcihIv0mrtRrXNA6TfZ1XJInp+CIz40DGYTcTW/nlpw2vuri3LR8W0ZMrxE
 6YX+9B/2o8kgTdcD5fw==
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 09, 2026 at 04:16:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: SDCA: zero word_mask in get_port_masks() when wordlengths
>   are unset
> - [Medium] ASoC: SDCA: 1-channel port_ch_mask in get_port_masks() when
>   min_ch/max_ch are 0
> --
> > +	for (i = 0; i < nprop; i++) {
> > +		if (prop[i].num != port)
> > +			continue;
> > +
> > +		if (prop[i].num_words) {
> > +			for (j = 0; j < prop[i].num_words; j++)
> > +				*word_mask |= get_word_mask(prop[i].words[j]);
> > +		} else {
> > +			for (j = prop[i].min_word; j <= prop[i].max_word; j++)
> > +				*word_mask |= get_word_mask(j);
> > +		}
> 
> [Severity: High]
> Does get_port_masks() leave *word_mask as 0 when a port does not specify
> wordlength properties?
> 
> The MIPI DisCo wordlength properties are optional, and drivers such as
> wcd9378_sdca_read_prop() leave num_words, min_word, and max_word as 0.
> When all three are 0, the else loop runs once with j = 0, get_word_mask(0)
> returns 0, and sdca_asoc_set_constraints() fails PCM startup with -EINVAL
> because constraints->width is 0.

Argh... sorry I had this in but then it got lost when I moved
over to FORMAT instead of sample bits.

> > +
> > +		/* Only handle the number of channels for constraints. */
> > +		if (prop[i].num_ch_combinations) {
> > +			for (j = 0; j < prop[i].num_ch_combinations; j++)
> > +				*ch_mask |= BIT(hweight32(prop[i].ch_combinations[j]) - 1);
> > +		} else if (prop[i].num_channels) {
> > +			*ch_mask = GENMASK(prop[i].num_channels - 1, 0);
> > +		} else {
> > +			*ch_mask = GENMASK(prop[i].max_ch - prop[i].min_ch, 0);
> > +		}
> 
> [Severity: Medium]
> As reported by Mark Brown on v2 [1], does this restrict *ch_mask to a
> single channel (GENMASK(0, 0) == 0x1) when the optional channel properties
> (num_ch_combinations, num_channels, max_ch, and min_ch) are all 0?  That
> constrains the DAI to 1 channel instead of leaving the port channel count
> unconstrained, and causes sdca_asoc_set_constraints() to fail with -EINVAL
> if the terminal cluster only supports multi-channel configurations.
> 
> [1] https://lore.kernel.org/r/179413707633.3630016.13654136728294242171.b4-review@b4

This one can't be fixed locally the problem is min_ch and max_ch
are channel indexes. So both set to zero is a totally valid
setup. I have a patch for soundwire that applies the defaults
there was probably going to send that up tomorrow. But could pull
it in to this chain if we felt strongly on it.

Thanks,
Charles
