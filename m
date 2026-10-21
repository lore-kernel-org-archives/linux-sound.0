Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593582;
	b=1XE7Ugc/WC8Vpn5DktzKRl5lfSaF6kxVhUvR+tBMj4yhf3SMKVkNQQ/DepDeIbQ8yKMO
	 q4bUMPgsqL5hJM5UxseK2vg4ianKhSvFZ7Wj6QSxcOS443EdgNrpAz1XsWUsxIwgr7Yma
	 G7zNzrIjBsEtAjl+Hr9b4JXO27I8PhapjeBQrlFLLN+em2vppceuNz3HVCVqBadCSMZAx
	 FkKpaTdgIHhDWJn8udDwWs36BTmaOIPv7FMQTQHAYRNbcnbffjtfAq8clZBo7PfNnptDq
	 NGQlPezqxM8nZWMmyJxjx8xMtLqv8K7Hfcl/5qngrb8P54Y/Fa1Rjef1OGmwFiEbZRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593582;
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
	bh=0gd2f9REWsZA6ypGG6feUqfDq3EjqwzAd5br1ZIMFfU=;
	b=Sm0Ogbb/0MDXW62lbVxQTtf9sPr6p6u/gcKAv96mMO1KjeMn2RAnFM97WvHB0Xp+4qf2
	 Be5/76phsowSXSpsDBFH/u5TyyE4tEglmH1UAu1vj9hkwPmlafVofGMK+8Vp3F8bOZK45
	 271i1KPyHJzjOzXoxMPTD864iMO9kj+IdQTV3rbupzsQeMq312n975V1qR0+/mt1Cpqr1
	 K2Ny88ms3omyXIGBFurbXJ8+BEXJmjo7X1C4Qh7Swhtkw2n+b59wIhWqrhxPqqiaLHEAE
	 nmy24NLQnpGXf2a5Zyyupx8uBiTJjbk+drkpa+mTMFXKLzmGNDjNgkwYKTF/J9+siVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fWO0VshE;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=s8hKxrgL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E1606A31E
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 14:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fWO0VshE;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=s8hKxrgL
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDGGJS2954149;
	Wed, 21 Oct 2026 09:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0gd2f9REWsZA6ypGG6
	feUqfDq3EjqwzAd5br1ZIMFfU=; b=fWO0VshE590R7mm41hDVw/1jEaFCd73kqc
	6cAUaDVIN6njx+5Tv3ofBNySFkrJUlGB+eWPzo0zbReA4LqCY2sx0lkqU835SFJC
	VN4IbxMWN3ZOdluacb2iMk9Bevj0lnR/8S0zrSYE6CWuSHA5OWmtRQr9XbWDu3Kz
	u+fKTolWaEhDXhRp4xqnClMiptYFKybJU1FxhGtQSY9ncAD0n8Ij5ewuV2U9g53K
	LYVX31vZZHpXXPF/p84tcHi4xxAvnXsoGxIUxXM9mk/yjHHVEeHYeI2T+yraa9ux
	leT9MGVVkZmct7dD9zAmYX52yDxsZOdnp+LQ5tJRnY2d4QZX3NCw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020072.outbound.protection.outlook.com [40.93.198.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw4vu3w8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:39:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy34h47H3/v4BQB4KK/yRxurPMgbdOus/tLmZ/rus+cM+h+43vEitZZPI6Nsd6OvIhoNGIY0YQy1S616Wl5V/LVkQOsd1PNfTjz0hWOwubIVTmalL3ls+hyXxQUFro0qn3X/Z57flkrtmEyymwoEmftr7WfB0jiiMQXLT3F8hdhfdIiQ2N/dtoifGmVSw5frH92blCOdELSyNK4Kx+z08qRaik4FQo6iWk9rsjmaiFl/pcRk91kG7zSCHJ+urpDmI7jMzuQooSV4chSZhm4ErVA7wPGz8ur2DRB8Uf40l2DZM7ZG4s7SkqZsjNsddsQv91h54DeTm/G9tBsalM57Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gd2f9REWsZA6ypGG6feUqfDq3EjqwzAd5br1ZIMFfU=;
 b=h9sK6oUw0B6PonZz4bnoUd6oXrG2N2rzFiIkCmEYF1VXnp0zCCM87KV7J3C0fhG83DvrwC5Qctjaf80A7W/5WG6kbZ/J7CueT1CfF2tXpLIkMplIkOI9IEruIGzsqkZQqaeR1/Y3hX1yzuuwztwqnZ7TV+t0Q3NfcG7d70mpmjUufyuSOszm/FDJO7Gt+xkfKNRPSNtbeQgX/D3Q3gghGVWylWSpsePO9WFqqzdC42NeGsSgDL2ots3iPpTQQLj10tzqe0Cao/f6HLlv0WFFK97t9R7HOW/v0qcMY7ihhvkSx4sP807lf6nF5vpV4suqkcKRiI7bIcV2PfflovTbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gd2f9REWsZA6ypGG6feUqfDq3EjqwzAd5br1ZIMFfU=;
 b=s8hKxrgLRgPhvXCAYJZ+qlMELr+KVexhrGp8Ghz0qCSqrmSEMgkALZ3gWr4AYzan3bpuV+DOSNK9+g00D+wc5yMi96IxtCKQUaCmdPeJinu8NpK2l7rwabPGEYZ2/ksUPJ516xWVVQrroEwgHPMuMbOqmcby4BwVdJo4jVom4pg=
Received: from PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::10)
 by PH8PR19MB7167.namprd19.prod.outlook.com (2603:10b6:510:215::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:39:19 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:510:349:cafe::11) by PH8P221CA0059.outlook.office365.com
 (2603:10b6:510:349::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 14:39:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Wed, 21 Oct 2026 14:39:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8AD3A406540;
	Wed, 21 Oct 2026 14:39:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7341782024C;
	Wed, 21 Oct 2026 14:39:16 +0000 (UTC)
Date: Wed, 21 Oct 2026 15:39:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simon Shields <simon@lineageos.org>,
        Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks sourced
 from MCLK2
Message-ID: <atjOk2cuFysWIbPs@opensource.cirrus.com>
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
 <CGME20261021101816eucas1p15ee46759f0c9082a5593ba0b35387225@eucas1p1.samsung.com>
 <20261021101750.3297770-2-m.szyprowski@samsung.com>
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
In-Reply-To: <20261021101750.3297770-2-m.szyprowski@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH8PR19MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d7076d-63f0-4b2a-b16d-08df2f811667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|18002099003|10067099003|16102099003|22082099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2TBb7L01fwNDMH17BTRhCmBIW7p5tk8gQHePvv3PcNBo8iZ40jjs/yC88Yyb8g5jKjVwC7Zy4Tw/FG3eDKQHR2lfj0UlP75PsLi5Sk5Np5ECZPI/KM/ps9uAm4wOsSyBF7upsAmahY7rkvE6k6aDUA5GrTP5kputzDspbp2rDray/Sw5qHy/o/cLzP9cNbNLjhg21zkZhHnJcmbxv7Xa9uiS84kiQxsROnEfW67Cu0Tz0FdUuqOVpWXPrsFlJsm2/zPeusduLlj7C9aAiGVFlNzJ7alhl5m3IOqqieVQEOy73KvytIoCgu1uKrOE1LPTEZo9IiOVdvIpIYGVN8D5bJsAwqwJrUuEm5P1nEACgtDq8dU6sf0vD4q412Ot/OmfRDwyMON3JX+zAewTfhFs1F24wsfc/lxvtJtigXW908rCtzuuhI6dhfTSvbT+AX5Rrb6H+qwcZtFc7Y7nrR5ZT4sd6nng/vSKKJXFDzLd/bdfjuIKrxdpvzSuwauDcyKssxc6jGseokDMhHdlfgydc95I5jmDVfQckg00uMY4Bpg53tuT+1iHq2jjY0Eer5ftc5/jXzvotVQfpNoYvNqvtx6NuClF6eo5PUxHOG9fid+r58Nz3F2znR/pvCuI4ymz8s117AL89g+5eqJ8REAndfquyBfjOR+FZDS/LKVs5+ZqSX9zRt7Ju/EkVhIee2ZF+gnZ1+JKCtv6uaLnwsLWlQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(18002099003)(10067099003)(16102099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7utnKmjwOXFTgMYGOfLJn4uWXPvO6UdH+fNVpA39tfglHdForZa7nyQ9iaJ8n6VA8ZkPwDmwP/oblKzRT0ai/Qsu5JE571vJ1dNHDI7TKF37swUCdGx4owAp0JqY6W+clcyPrjVkXcrSr77fVbK+ZydRPlGB9cEYVkZxIxXnyQb63pfaNrPucXqoeimCSmE46GyA8yhYq8H7JFZhrCEdP7fP6VRMmzIqdVywZ9tiULC3V0FSpdxgWq/MThx3wVOA1J6MKNod6U1xVpvPUvVOuw3kP1lJNiszaVLT0TeaRt5OPol4AISdQ0sOa59e+eQIGeNIjPMx4qW7q+9bQBr2yH6DlJfHcOt/hxdORWdSnibWLbmrUYI1QdSdvLVdg8ApitxWquErF2AtEUqZeeeKRtBiIvdOU+VoleTlx0TjT1g+Q6irfNiFHK4NXZ8j7x4J
X-Exchange-RoutingPolicyChecked:
	bx3Dsr3JPAJbrGhAcJLAa2lM3j+VkC0wZoPxmyZYPb2XXeghwu5N0u2iSXgaiDUcxajLQj779TbWvwjackr3xYobdQVrs9qAopqoE1d+0clfM200+Fmln9Nr67I/4MGBPm//WMNZbCgdFR96StDwWkHSjqjQjnpH1ZUJ8094WutaC/iGkAH9/5nXDI37K492PyX6N6FKXCBinz16NVTjvLa809D60BIjoM78eYZFGZ0BJnUYrXYaD07EcS9AHem+oQ4JF7c9UADmWyWfCCMnsAONb58ODp65OMz2mB74OcGK150phkJM01YQRt5wWEZ40JZ/J9ICGni222Ik7cKv7w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:39:17.9911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d7076d-63f0-4b2a-b16d-08df2f811667
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7167
X-Proofpoint-ORIG-GUID: zEzQ7EmIbHiXK2lWuq_2ULzIjQ2YlgPy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfX7wtTu4VSUsaM
 qUhazcd32ogLXDfbHYzoysotOTVpX9MyPk0wbutMpybzDP5GG0HLS12YtvIL2xIVSCQvx1LeiQN
 IoEAl9T1zukCS23O5lITFBdJszacqos=
X-Authority-Analysis: v=2.4 cv=H7tOUOYi c=1 sm=1 tr=0 ts=6ad8cea0 cx=c_pps
 a=0/0ATQE1JRcUx1QjezCFVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=hD80L64hAAAA:8 a=w1d2syhTAAAA:8 a=R30aD-D9fqzM72Ui4ZUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zEzQ7EmIbHiXK2lWuq_2ULzIjQ2YlgPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OCBTYWx0ZWRfX3ytDmCtas87I
 ZHgaZMB3jRrGqwsOrLikta5Ukr4Jfp9WoUFc/tHAk67xqu+jk5HeR1gLNorcAzMEXMzrIv7ijRg
 bKfVX+62DWGCwBLrE6tGOJ6OmdunmqiuRqsQy8jVBVkvowwzg6KDUfwTn6GEYUnkx+WVbqVGFrH
 WJwhw4aLGs8dPKsHkaPQFkcKQvpr1QpaT/ivRZLCaxaHFhbEowvHeHMuwvVkOuZnG9lfR+eRdTx
 ZIosKdpIF3QVvNCgh6wfgvvQK/mKWZ5EC8GUgeA+yfBOmAt+GLOI+iyq4uCqwjM0cTDme19IzNI
 uwZ5Jw+lCycAdp2UaW/TIQlpZYQbLYP1DaRBeME0dV7LKWRpuywcdUgCpMUgAku9B3fPwlDQRi/
 y6i8csrg5/cYvdy6eNxjvsGHZuguUdxedshP3EIa4byo5bXgnPAmcR+55JQj5I3YGM3syXEAptG
 OSJ/ksB6BD2g8TU1w8w==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 21, 2026 at 12:17:42PM +0200, Marek Szyprowski wrote:
> aif_mclk_set() masks the AIFnCLK_SRC field of the AIFn clocking
> register, but compares the result with unshifted field values. The
> MCLK2 source (0x08) therefore never matches, so MCLK2 is never enabled
> for an AIF clocked from it, and the AIF relies on other users of that
> clock to keep it running.
> 
> On the Exynos4412 Trats2 board, AIF1 and SYSCLK run from MCLK2, the
> 32768Hz PMIC clock, while the codec is idle. That clock is shared with
> the WLAN and Bluetooth chips, which enable it only once their drivers
> are loaded. Until then the codec runs from a stopped clock: FLL1 fails
> to lock when configured from that state, and the codec floods the
> kernel log with FIFO error interrupts once a digital path is powered
> up:
> 
>  wm8994-codec wm8994-codec: Timed out waiting for FLL lock
>  wm8994-codec wm8994-codec: FIFO error
> 
> Booting with clk_ignore_unused, which keeps that clock running from
> the bootloader, makes both issues disappear.
> 
> Fixing just the comparison is not enough. The AIF clock source can
> be changed while the AIF clock is running, for example the Midas
> machine driver switches AIF1 between MCLK2 and FLL1 while AIF1CLK is
> kept enabled for jack detection. Looking up the clock again on disable
> can then release a different MCLK than the one enabled, leaking the
> enable count of one clock and underflowing the other.
> 
> Shift the field value before decoding it, and remember which MCLK has
> been enabled for each AIF, so that the same clock is released on
> disable. While at it, report the MCLK number 1-based in the error
> message.
> 
> Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
