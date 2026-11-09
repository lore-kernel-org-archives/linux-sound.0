Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794218309;
	b=PHclX5CAKMP/m2ldo0EYyOvf+Ycw4XvRWE9fYXcnrkIcXbxRKQKLvJ8cjMsZIzm7njBX
	 8sI7HRGLMdS1WzF4p7yzVRWn6ZRePqmeAc+zRkhufxw6ThzXTu3nMOzki+CuWHMNWyd/i
	 +5BQ8S9YNaSov614515qVkKZYjEz8gvLEa3S70WWhdfIaTgRN2cZWPY0lMSEcIGqXrYIm
	 zPiRZa0ufQkMwILnjgWrBXYOzudFPOFUibzlW74rbhdBzuliYyx6A3BtE5txCZRhvxvww
	 zyzpT3EIqaU4PqepP8L1sXIgxFkY7rJtZ0fve5RAHg394LNEZK5LJ02g9SIY000UIow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218309;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=cSKtbpzzs50iAXdWcFw9dD/lMOasVdNdnS6jLSaxBuQ=;
	b=Pb1qmC8gMPdVbCz+KdddFushUNOfqIW3zoUePn+JtbqEsvb7/SPdRs3oEQDARl04LZar
	 g/+kufRmF2mAcqTONPuNznUZTD+ozaL/hdD2vkWHEVrXDKgQoMRMMVMjM83K7Ovcd9bzO
	 m5SAkRta+Ney6Y19Z1KkZEdih5CChBTiE6YhY2BZkca+89G96/jEPLN6dVqDVVMvdWWYB
	 igUMLhBvpQvy6OESoyaSkSGSAWhWzJIYqTW2mTCY2wzxHS95WgB8w2Gse05DtA0Bpa4WT
	 0JVw7oUbqd+2koNJBwWIwNr9BN5Pzm4mNn5p3QCfaZwEGflxGp3zcVSTjl7YV2cH06g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Z1QC3ZQz;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ji3cI82l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD1606D805
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 09:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BD1606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Z1QC3ZQz;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ji3cI82l
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99R5bQ2700365;
	Mon, 9 Nov 2026 03:58:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cSKtbpzzs50iAXdWcF
	w9dD/lMOasVdNdnS6jLSaxBuQ=; b=Z1QC3ZQzcBZ305pN3x4i/k8t2kRs1hWkFN
	h64QP0yLIGiSL1wi9prJbdJHb0vb0Y5Kf23aKY7XxBX7uk2fQZ4xEv+gQBKxhl8D
	FrBBgSVTPam0uuBgaOOSaLut3/gvMjwJY53XBZ4mPY18/U0QUsQlJ4JN+lGG9wUC
	EYesEMZJRkkubuPzJ67RW3XEDMof5KJB86q54b4u/0qGWKrEz6Awlbhv9jILpDS0
	fe6UTA8C9jsKOKeXee22qM6cvaycjVopZcBi0q3BgI/vDCGZxGevrfy4YY37TA/E
	m/jk+QTmK6zmwElxozcLFx5N88thA2zMPAqvMcvjQhViyDP32emA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021117.outbound.protection.outlook.com [52.101.52.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19p9vw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 03:58:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRasfR8bJhSfwXk6Y5WcMo+3yd3YmyyrAgv7o4xr59TkxL96Us5s88lJ2OaTeljV4cyc31oojwFw1/nCNBEAHvZT3KQtV7kSq4WSg+Q3j54UAiej7BDTCgc3iXY3rE7rwsKut4DEEaivAW/+/spTGstArAlqZz3WQoN8lWyu+SGxvh9/hvnoLxdzXoI1hSKORAVt5u0yTHZ7CNXT4ODfTgzfOxRJavN4f1uu1X90xSVeV/XD/JJisRZFt2kADhdGFPPnlDoXizSqfqhv3P6zIbhVG9g624xuicu3HZybXHcMAAA+OrkmKICrtO5Yf3j3Ph0J070O2EM13gHuSr4fwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSKtbpzzs50iAXdWcFw9dD/lMOasVdNdnS6jLSaxBuQ=;
 b=j17EvpSeCyuK6wFs+v+7FqfUHmtvj1M6rNsvdZVGiSAA355TOmvogfmF2cepuTERahyJEikm+Y7M20+MVffaswHiVm8xChxIGpzxf3hW4IPbQQba8CfH3ug3woABKW5gHglz+qtD6WAGC74iLGc0Z7sIB55G87dZFUNopou5WuYMFBWacnO+moLI1RigFKvLJJw8oFi/SnhdWxuvwakE4C4Y3CW/fdIo64vxIdXLP/wrSRfnLdHO39+ILKn6Stdu8uQgJyi+x+b9411o8rYEq8YIZofJTkh0nZJvQMFIYhbNo6l+GEYYv8YIWResKdUOoFNR3rSlEcT9bH376vcSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSKtbpzzs50iAXdWcFw9dD/lMOasVdNdnS6jLSaxBuQ=;
 b=Ji3cI82lwOTTiJFlt3CX0JILdfL9yLSIbpnWBVICrzgjP8iGD/u94T1PJjuiZcq0kWNDuDU4bH4bc7GomMHB9E6M9/CznubprSqnRZQJullJaycTronAKiSdtGXOF9nWgXDYzCvuvSk0D8FWVlbUguzyxBmYrOOWrqC6YttvtQY=
Received: from CH5P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::27)
 by CHBPR19MB983042.namprd19.prod.outlook.com (2603:10b6:610:40b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 09:58:09 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:610:1f2:cafe::a7) by CH5P221CA0002.outlook.office365.com
 (2603:10b6:610:1f2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 09:58:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 09:58:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52DBF40654F;
	Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 30FD1820273;
	Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Date: Mon, 9 Nov 2026 09:58:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v3] ASoC: cs43130: Power the playback path down when the
 stream closes
Message-ID: <avGZLYM7b8EOt5p+@opensource.cirrus.com>
References: <20261106214230.17417-1-olivier@mgcrea.io>
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
In-Reply-To: <20261106214230.17417-1-olivier@mgcrea.io>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|CHBPR19MB983042:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5262fc-ee98-41aa-2168-08df3e47f538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|18002099003|16102099003|22082099003|10067099003|11063799006|261026121527099003|56012099006|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	kAc/Njwh6QClNDqh/ZFfWC6PNOy2Uh7rmn14u7sA/SQIq/12DijPP/Eh0Mj5FbznWZeNpskWeBpcf8xYQmuBv3S4suTqYnTJgnbwSd0pwgot/nP7VuF83oRcTw9v4dkzf/mXuKac3M1dVx9s5mJDYWAp9t3xYLtJ7r6EjpviWbmyp2IVEoE34Jm8cThbuvLJCPyJaLhc2biHJ/rE4e0xuaFcR2FVAgKXlFahW7/q0PynPGKPFDiN98JRXXibQDbaeOOJcBEhR7cL8+rowg7bYzJU+EJKfYAhvn9De8DAevNZIMIn0KsxiYev/+HxaOaO+ybZRSktY2rjKwo7o06tMoOJxiJRcYmWk9JJOZt1aG2DLnCK3G3Lu/gHk8OSgBuflFDeaiLEsR3XpJDLQRCooJtjrMk65cDMofF7EcLLpCI7q9XyDR8siLYu0s2rkCRuG4E7VQHivOtv8Wy+hRvfr8C0y3cD7FrEGxULBUnuCYDFpQDOmsdeunbxqNuT3xUEZYY+odtcXtTQXy40oTQGUXTJehpYI9ZwUSHorgRQ1JE1fXe1MeJvjQNOxWXdcer8yc7n7wf/rKkBJ1d49BjOGWDk5lxiBOuX78KeBVKppzeNVNLWkurVbBBAkVGEm9FDyC5XP5Bmy9ebQvHQYLZs9YUCMkpGFwGFv1dqxus/1MkjMWTTba+Aq1bshdzUgv1uYBkdcfeogrQ6AGNXXBqqaw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(18002099003)(16102099003)(22082099003)(10067099003)(11063799006)(261026121527099003)(56012099006)(261021135927099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yLT2xi8mMtoHZWXBaKckddva0B7SPRiofClCZPOzpVzHHWdp1TtRcKkBiSQA3gtwjG/5eG2aOlS1TPnp9lZc5zwfYeJBxWE+Iz+BKJx2VXxY9B8wUtLfbQNZeFGL4dnRdWGgZ/aqJd4etCdrJC7ND2mx6gCTQvaBflz2SRinlx5hwoHfV54MEW6E9snkkN7UgDAiMV7BpGdKPWF5DrR3qGPQ8ZQ0j1Dy3slE7ezCYNlXc1DBp0kD6NHj5+ps6GoxbLNkp31KYm5dRYwKCf9yNCoqBT5vDOvNcy8gFuwFnnwC9ELOMHlAfn6VKlxKZiHt9l6Od/zmPm8mWV6JWaKNa+quHusx63BucofMA7lVDKzHVqgTOY+9x5FfEBkNHb579NBiUQJlpZBDpnU7xWbAp9dsdaj9O4Ehuv5EwIlajdK3o5XdLXzpbBK7nxaFliUV
X-Exchange-RoutingPolicyChecked:
	PcGnZJtiTbOFTrCg1K8HHRQJYp+UOBBv6D+jlRAU5mjnQH+OWeaiItDqbZio7jAEirQmpBJ/OpU4LbjajjOwzbfTmdt/40DypavCRhTNkGb3f407QuXWj+aT+TlBtTyKB8Os70iWGb5WvxGTh8xLYW1ZtSpWUjykQMef6tviQ1H3wVIljeq6O4VxO9GJDDI2HK3Yohlp2o+2zV1BtcnT2rXZKnPHo53AI9pRy3kPuhZMZ4NCTDceR76JIa0M4BUQQDQQ5sKFf1X88RBOmfMMb+eU/10poPV7O0RXfc3HE/qCjgcSZXRgatID3c4jcV7Kp0b0yJRYF70Oey24Us2xhA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:58:08.5384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5262fc-ee98-41aa-2168-08df3e47f538
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR19MB983042
X-Proofpoint-GUID: ty5r7gpQrm8lNXeOydL9CssIF5O_yp1d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX1RNC3TI8AdXZ
 33zCp9NCJbebxCEjZLA76iFpbYe7V6+jYiput4iZKaPMeNoGGEyvJlYP/yLU4Z55nDyBiVdLOyJ
 JNcC2ipLBs5086z2V+/3fDBR1GDgzw4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfXyOyJpE6rO332
 VnwLazUXoYGGrcUNzyy/LUWCcu37R9qeUnjjmhUNXuEJ3tAi/mzxo54ueC7NIGUD/93nDzprYv9
 Teyo8sS/rHtgJxVlHOaOh6pmje/jYZm0AOGA8+fUVfq0bC6KxpYTQs5g6+JaSRk1SAewYuUenwv
 Lwq3FqV48QI1qeOJLVFoYOBV7FMPnPdXz8auLCAJriVQI3r8uN33Rl18uxYdJ6uFM6gPUqW/XXc
 3MQDokgzh7EoCsU+91AYR6ZHISs0HLiEYe4w4KpvOqAKolrRiN/SFxY2d68nBpHJ7ZWAYUKExIb
 2fHQhJZmN5Zx8E5fJqrlFCpgpQsmxXinRnsazb+1eC9nMKR5dGil5N/yx5MuqqVLOEdy8xv7JNW
 rjf6u0kSpyS7JQazFqxvREEJUhhyWOqmQeThWUeRUXbVwfcaZlC8xKx2XyhoHesm+VK2+xJFg2L
 XKyHzqbvwzs256DGkHg==
X-Proofpoint-ORIG-GUID: ty5r7gpQrm8lNXeOydL9CssIF5O_yp1d
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af19935 cx=c_pps
 a=nUtUY41U26iC5jD0qKn5yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Vbbp9j2FOOQku0hKiSEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 06, 2026 at 10:42:30PM +0100, Olivier Louvignes wrote:
> With use_pmdown_time set, DAPM keeps the playback path powered and
> unmuted for pmdown_time after a stream closes, and the DAC plays
> whatever its serial port carries meanwhile: on a HiBy R1 (CS43131 on an
> Ingenic X1600 I2S controller), white noise once a stream stops. Drop it
> from both component drivers, so that the path powers down as the stream
> closes.
> 
> Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
