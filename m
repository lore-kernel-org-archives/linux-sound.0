Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792591189;
	b=PaQjd9mpyF5ok98aMbrWlqU+mjEUBsRuiZnRhpb/rJok2r3G8o8qt4vRpqYN9VDixSuJ
	 fpJ9EqVNkAg3b0RrbL0yClliUdQW/xw+FexTHCjnAXK8a8Yvkd8QG+BCe47hkBdrPQ5Ec
	 KN+davLscX6w5Hby0vZyvZTzIMvIxlKePil6qNhclf7CcUw/t98chPNOxcehndjD6vH7K
	 tK0xdHQBGXxLQecGkEq0BjQsp5A62uvqezDQZEo/OKq0Rlq+X4R9juHLZjSjypkgbhTGN
	 nx+H5zmPl5yz9+oDAcmqM3abgjz16LJLp4oumVxiV6Jatlb3BNINQ4u3ibTzMGRT9eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591189;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=IYVJgQTTghvPGlsySqOCVVxwVYTqG6fYdt7AGSPzo+Q=;
	b=EHWnuV2q4x/DkgezC+ITHl9l66bd61jXRpL0J1HrqIEu2uOkOb//nU/GodOiUCB3K/c4
	 c6JTFvbzoHwlD2zTa3gWTBcj++gHefLWNJHcRqa/Bhjvv28lswyh1UKGF7DvyKGwxHKet
	 fJOcDKyiVR97ojibtF8NYscZ2bVWT6QdcNW1Zyd8/R5l2k1kbqwdLsPoU3t/Fs+PtenQE
	 5NaLCx+LKcPtCimwkwMbZW9jV1imrNBBrTLb0jCfHuhwRQpIH2Jsq3UsIcCKVCBiqF8xi
	 7tmQQRQo064aAptf1iWKEBhQCBQ5LUHb4SQCvqHuDdr8xhmKu0ilW7kjYGUt44mPZPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=df7jHIFg;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=mZirJX+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6A0606A336
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 13:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C6A0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=df7jHIFg;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=mZirJX+J
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDGKcp2954231;
	Wed, 21 Oct 2026 08:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=IYVJgQTTghvPGlsySq
	OCVVxwVYTqG6fYdt7AGSPzo+Q=; b=df7jHIFgisRKJPhPLUOeKQ/V+CyscjNQf0
	W+UpKme8omkwHB/EvZUryQt/RGWwzouA9I/jA3Zd/aFdJTJlYwJcEDJC82JmITxJ
	HC5RIFU539Y3LtQTNE0u4iJLK7zz20d05IRzbatV4Ia+/oPs6VAEaEACVk7Pxub8
	w/erApGS4oG2Iyb08xG5ih/YWUutlH44B1Weam0c0yhFXySzt8tF+0V1/dQMC027
	ll2rzNnFQb9aQTvzTn33G0P312fmqZPB1oJhh9jej4bxYO9Q9+MNaW//GvASKM+A
	tNxljzkDd8Hcn7yjSku13XQcRMrwYmfn4iFXZS21TtkTIE7e1H8w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020078.outbound.protection.outlook.com [52.101.193.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw4vu0cj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 08:59:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVxtb0qbzlJut1kZF4t+tPOq8y08A9uhiCcq18C88jotziqo77mjQthK1zEkvsIALT6wmbX3V+gb1e8+DQD5pn2kR9ZRS4Q68FHgOS4CIS9PHu4ZfSLfM6E5jQ7luu+sdF8RD6zWxQ7xktX3OBOxqNmt+Qy+VffLHDOTz5d9k4xUd/9zmS0Y96Tgm5B+BAnIxT5qb9gxmQTaQ83SUWLomkh5LQ3gFHovFtw2Fga7WjysRAM2vvFtRGZ6yfkcx0JG/gHOtEZg5ZvO3dw83BgepcmpLJRXHnxMuaYOsj+kTU2ZBIaE88fVE4gsWfl6ivlwcup45dKFEYQnb+pHhyjHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYVJgQTTghvPGlsySqOCVVxwVYTqG6fYdt7AGSPzo+Q=;
 b=eDgPN+bLiehebe8/Tknsflr5SmrKI63CZOFYWuSjWEqKL07+H/e2RrEsyfMPfmM4n2ueb/k04iREDljhMFzVWmZYzFZ2/KBvBj2jjN2fstx250++PPOe7k4KlD3elEoI5H5C0PJ3ONYm9gmum7PotR2BL4Nmg5v+7hqHpHwTSU0OHCsQYalwUm4bTcsgo7IVm4OC1CUx+59PjCkX7c6cuJksyUAmDDMNiCJm7B969a7uTngajoVb6bPUXJ7l7+dqSUldCNaPstHWyQGDJMgDdHY9zAXcdj077vrqvZJpFaWOlcEEyzctnI/+sKTOAB0K/Zksri0m0cQy+0Gukic5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYVJgQTTghvPGlsySqOCVVxwVYTqG6fYdt7AGSPzo+Q=;
 b=mZirJX+JozomNd8q8VPrGG8HsphUSFxU84oc9ZJ5lscNbQga5jnggOFO0IDfacmXijcAGHmvscGUWHPaE11bXvCgQcaO9hxBMi3gojcBXV7i99WjO2cjhlywOfAXKkB2y0AwdUqmDaSP6FoynAgHGq+rM2xTALjjPetkKHGwg0U=
Received: from PH8P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::23)
 by CO6PR19MB5401.namprd19.prod.outlook.com (2603:10b6:303:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 13:57:43 +0000
Received: from MW3PEPF00001657.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::ac) by PH8P222CA0005.outlook.office365.com
 (2603:10b6:510:2d7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 13:57:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW3PEPF00001657.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Wed, 21 Oct 2026 13:57:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6964406540;
	Wed, 21 Oct 2026 13:57:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AE2DD82024C;
	Wed, 21 Oct 2026 13:57:39 +0000 (UTC)
Date: Wed, 21 Oct 2026 14:57:38 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simon Shields <simon@lineageos.org>,
        Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: wm8994: fix MCLK index used for setting MCLK
 rate
Message-ID: <atjE0l21RJ09Wphj@opensource.cirrus.com>
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
 <CGME20261021101817eucas1p12f52573c1b2b05e6e45e672eaab5ab48@eucas1p1.samsung.com>
 <20261021101750.3297770-4-m.szyprowski@samsung.com>
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
In-Reply-To: <20261021101750.3297770-4-m.szyprowski@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001657:EE_|CO6PR19MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cce42ec-9240-4b89-1685-08df2f7b4688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|6133799003|18002099003|10067099003|16102099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9zukibCVCVzD2Q6dl1TVPlvarUShNzOjc2OBqyLdw9zu7R7/7ZNMjgWbb3Np8UzLrPwcED/1ZdRCGQrXnjH50O7IKESJg3AqMP8JDVpf31K8/ZSVpeDjK2E3ieG84o+zX0+ss5MwxjZLJmCCpMeRp0RZ0ivMWscosBUE8L1mgafy/n7F9WMFkA8ZI0lpk5b6TTOtlOyq1vfSNOm5Jr86KGcMBKn/VEgfsmeRArEQ+8D8E59+9ds8EqYDnW6JLpGXCtv920M1HLmStcsxJmca1O28yKutcWVS2rv4CPbTz6O9Hp6t1cJSm1KbO05/GZ7CMaeRGY+nrk+9ovNVI2+MjjesOxayG6u6eWdZRZ20ROv4LBQE7LPucvEbj6X8ZVGX3T0NtTVK4hsm2aC0hgpU8QKD5bTTAGEbJ6jVfzRf/Co9YLL++Uzxrjgc7HGYM+EF+drBt5iPczSQa/2HBAFzTLJh+a6qp4ZHxDhv4eRUxtCGldx18ym3HEze9jIN7DaKyr3j49PRDZwknCzjH1yCRphFcu3YCU8fw5o2yygPt4qwJVfuGL11sS8/RcMSpCxdNerEzdPPoIy7sSYjtYTwDczygzvWXJQIc1orCQpkcYVcJt1NzOVdb7mPA/sBJWFK1Rrk6MNBcU0N37+gnDyFHz5B2ipdjDc5WsGxhcR5rRiz9qE8gmi++zyiPChOo8FslC6PvzCuNfuY6KCCVKj+7Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(6133799003)(18002099003)(10067099003)(16102099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/MTOMuCSgCHwaJEvzAbUfjnwdYeGfMr15UI3VkYo4b1MC2YV50+IR51mJciHmXBPcSNzPoL76MtLYQdVuSy6MaFAKmzHsihasmuyZSPZyXUY5PbofONAymsef94XuuECR1WKLpJubSWutYiobZZGu2qh3UfkzCX/6iYk0PRr+S8CFUSM+VL3S1oMRUEvPSUYkqttpGN4wXGEhpzc7n5SJCdAf34RSVUalvkU0c2cNkqh+FSFQRuJjrbwjZjz1poTIa3prHWoHraPiHjUsMj86Rip8mOHrhB4ntMIWi1K2U7nHlkuv+aoJw7TXIp8EuJ+OsItAEOslQAOXQT/U448aHMfshiW2/2Yu9v8TAyB4UU7Ww7x0dLQujdebf9e253R3On4/4+KdfoABzFRIqIn0uRe8rJ5OvD8raGhDO4E9sSYF6ViD6d3ZnGHiPykv7ah
X-Exchange-RoutingPolicyChecked:
	wFX050wOjTJWZeuCu5oPMuavbFuj9g4ClLmmMUhA48HoqtkXhJMPBKA+6BMA+lGk9bZ3wzffPCRKYdml68Idpk/e63Gtubo6xLviXJzjWBu6zPPfcAoizUBu2NDOpN0kUmiKvkQPVD+BFBG/M4nM1ZfSvIxInQnJDbQolFx+glAygAla6xp8Cpaynp6Kjf5ke53JybwXNK0srdZZTV+FY4LbOE1PSMqsDgeAB84ODJpkcu/bhFvotpKhQULz44ainVvv+begEuQABseSDlJ3X9GQG5/F5eRI4YWmIBikdJ8I9MCCChLDMhefDRaPi3R2+oLNdTIkyNwF2eOTTUBSBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:57:41.7457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cce42ec-9240-4b89-1685-08df2f7b4688
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW3PEPF00001657.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5401
X-Proofpoint-ORIG-GUID: 9QYAl-zBV2ioPniVR5kDX_v56a0uOUqd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX9WCGip46Cv71
 6n9hzYfVIuJimSL1H3FfYjHxLL/aR+yoIyHZIHGhAEovFN1QZBLTPMOJkakcK+Gkt61x4vRmrnD
 1xk6UEqp4z2/ycgYVf/ic1obGRgsxak=
X-Authority-Analysis: v=2.4 cv=H7tOUOYi c=1 sm=1 tr=0 ts=6ad8c547 cx=c_pps
 a=ld1257TWEKwLI69vH4Sekg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=hD80L64hAAAA:8 a=w1d2syhTAAAA:8 a=S7jNF8yTtYYbxx8_ivQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 9QYAl-zBV2ioPniVR5kDX_v56a0uOUqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX3+msMlGpWACl
 tXeNoSKfkDfzXQMVbI5j/E3g9nyPiQlFtVDoi1vavUMaxuqGBDB8LC4MAf/skFFjt86EnXSfxY0
 BHoB0P3EldyyM+quUoDkiLbbhNiabTe2xCxVEWpYlgyyyTKGjPzZ5gwZ1uGkgeTMs8J86zIfqhC
 8KcGYPDSvvRQJyU+vV4X8iU+OZDLkH1yt8gcdkwCedPZCByNZDT+Nt6hbnBBnTqouFt6ET/w//I
 nLMTqdEWKdC++/qJyEMVRe40K9Hbjb7ci8/rTJpRAtKEio/K3dZBq5A8RiNsEpKEODmpE5FiYII
 2be4rivuZ2GjVpQ/fl6BdrWY81F7ievGYodXuFYcaCswHadhQc5gcBtfAbqXqXZGZgjegSHeD0O
 vPAmQmVQCokj6kfYK50n7Wr5ntCi/8kcXG/9RuwiKcjPLyTdJM1o6ptivLTU6Ku7Uzk0sg0oOcq
 VsFVQg+jKgKFZGN20KA==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 21, 2026 at 12:17:44PM +0200, Marek Szyprowski wrote:
> wm8994_set_dai_sysclk() passes the AIF index (dai->id - 1) to
> wm8994_set_mclk_rate(), which uses it to index the MCLK clocks and
> their cached rates. As a result, selecting MCLK2 as the AIF1 clock
> source sets and reads back the rate of MCLK1 instead, and the rate
> of MCLK1 is then stored as the MCLK2 rate.
> 
> On the Exynos4412 Trats2 board, where MCLK1 is a fixed 24MHz clock and
> MCLK2 a 32768Hz clock used when the codec is idle, this gives:
> 
>  wm8994-codec wm8994-codec: AIF1 using MCLK2 at 24000000Hz
> 
> so the driver assumes a 12MHz SYSCLK while it actually runs at 32kHz.
> This skips the 128fs AIF clock ratio setup for low SYSCLK rates and
> makes the mic detection rate configuration use the wrong clock rate.
> 
> Pass the MCLK index matching the selected clock source instead.
> 
> Fixes: 419e2f508336 ("ASoC: wm8994: Add support for setting MCLK clock rate")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
