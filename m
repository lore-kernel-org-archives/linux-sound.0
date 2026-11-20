Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172701;
	b=igQ3YitHX/z/yh/uXjeS31rww58LKDKojInUSAtio+uzz+wN3T42BGz/WSVZ6l0GEYp7
	 EQt3LYCVmAS+bx4Juh8fFh2snQ/SoU19fENFD6WTTCxU8f1CnTtq+EMuselx9dOUpPBz3
	 Ub4OHzF6Z5iJExE2Za9NAF3Hlg+LB5hSox8iTwiuLmnPsH+b8kf0Kl5tMgCdOGc0zrj2v
	 4SdE1wudb1YxM1iKfulFRCB9XFAsGRNmWYRninaGXiFZMlRjIyEm9xo7xpCVrlAlOy0ek
	 YhAt+VyU8+2UCgYpQbznSU5dwJcXMFnfxfW1TIAHX+1ZePQqnsyjdmvD10rLXPtPxUQ==
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
	bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
	b=ea7xeHUaj4XK8JUJuOX1BcM5Y5XjrAHxGCtwjDScoxA11JycHRxqU5wDVfu9SQeZBBzR
	 x6B31Cz4RMfJWUQGV6ecxguJqVihnA3M3aD8gwZYvrmNsJoDvBJ8pIpdlpTVeLMcQIXvq
	 HvTvS6pHolCKtzFm4aSp9H1zRy+Mx1FMPhrQzPikg3I3lzTM4+oSRASabBJ8Ue6iSYDee
	 so26jG7d2e9rsS8hx68XDWe1i013JUW7uYpxFdghyamuM7cX+Ni9FQrE66eAVz+L23hCU
	 K4zLByb7Ce905y/ud4lziKiO1Sn1RuFcpSPuad/e7eLpyDSb1Ipbjwov9coeUfu+KMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YxhSzTYN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=vXvrj+4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA8606A33F;
	Fri, 20 Nov 2026 11:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBA8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YxhSzTYN;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=vXvrj+4u
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7TLEY065740;
	Fri, 20 Nov 2026 05:04:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=; b=
	YxhSzTYN9H08aIkZS1vHPFw80ggxxgdiqOe5+4BulQ6DtffT34HLB0MkqJxOFaln
	mPrddjTNhvMimuT8y5j8awDjtV3XYqNkTt2rw6sWGFYKC3T70fimbkaNFwgFN5YJ
	EAzRky8eHzwCLcxNcLUEClpikwce41kRwBJITBhVDSVhMeAMNzkUA8OgxqN6vnL5
	csKojExPIqr2EoBkRavrUA3HQ+bti8CdQ12WusrdAvSZXogcyUXX7u9Zgs0Gh+NM
	L0w2Eqpwy+r6GrGNnZbBk0JBvW/B4fDAkFBTQSPBvO6dIYhQ4ApJJNQKf1E3EnM5
	6wXECMjzBEEA7JzgxuW6/Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022143.outbound.protection.outlook.com [40.93.195.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mhtqk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 05:04:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAtfEKWXGUtquhLS//WV2qX68/doWA2XAUBxiksrEm3Z7+gE3foPxluu9xI2Eq5vv18tqLolvlS8097fUp2ZknoTLG7yowfC08A1TqQt6UDP64BshwaGaYstUYcogLHK3so/5pCQkbA7oH5/Y9D5YEthzrNQipg+2edem5cQ0gjed0jwSGzHgfVhgHRZZeMIk21YzhYwoicMDCZfcN0EQpydD9b2v4yDumg4Vy1Pm4Y8KD3Np746EVnKqh+k+m2524qobesRpqXqhW1CjbnVT9uUF8C4b8PfJkLZxqkbsJnlzKAIotfbe0eE93evyPt1fKYG56Xa9LO5wUyEH3HeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
 b=PGqlAHfy0OowgNssFk9mRCG0ciuTMPGm5mkRtIOPE8SKfI/l+eQquYf5niITTgE1HBr+VazSdh2kbtXjxK8Q+7dEORI0s/tYrOoNRbQKPDPogF2g3hgFwEQgan1Z272eeBxqNw9c+BLnTCcIr+MkhJvrfnvTFa/WaSnew8eIk+eC0NYxXb3RLHcD0zJhVkMXxUCQluaB85oMlnvenJGHfOoVhS6udW3ZXuch/r2LYwkIB79KHrrEOJxo6gooNTz0T9WwLopn4c8dHpefM03sWpen2LXV1cgmaoFzVzPPc9HILhgjA4WfjTmtqocK+c7YdbFbO4Aqg0EnKR8MecCSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
 b=vXvrj+4u1+HCKZpiVuen8keeAFcT6qKmJu8ntZIB5LFt9qY9c+F/5Q3ZrecDxvhRusVWG0E6syTzxABseQZCUaiiNpzlMlTMp7QDQEGS2jVi92137KXdmMnWewAfHubylpABdc7bg/cRiZOK+OgqwPJeWTHAzjA6aF57VHUlin8=
Received: from BN0PR04CA0061.namprd04.prod.outlook.com (2603:10b6:408:ea::6)
 by LV1PR19MB237799.namprd19.prod.outlook.com (2603:10b6:408:514::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:04:43 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::75) by BN0PR04CA0061.outlook.office365.com
 (2603:10b6:408:ea::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:04:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 11:04:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52E76406556;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2392A822544;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: cs35l56: Rename the DP3 DAI to cs35l56-ot127
Date: Fri, 20 Nov 2026 11:04:39 +0000
Message-ID: <20261120110441.2163567-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|LV1PR19MB237799:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91c36984-ec3a-4836-5e75-08df46f614ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|82310400026|376014|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026140227099003|261022105027099003|11063799006|56012099006|10067099003|16102099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pepY3+WuLzBrNN7Rrh4iO6Xop5E2SiQ5iwcTt6/UhhR4eq9LtyxKk9jI2c2spUNO4Q4e/fq/2xYvIFMt38dleCMEoSwXzN0K0y0nzmEaKTjsk5J9hMC79eOUapLVQ3cJWW+FJxbcwYuAt0vc50mbdvK5DVJzafyRAT9Q++Gq9bKj0rmbZArsnGC3Gadv2ewBy/vaJJ7EUINus50FrN5JCyMyrmT9ARqN+JzzSJ8P10UdVV9ONGrgaJ/oEc4Q79YLgun6OYmzObkbHQj74U4iqYN/NF36zJNZYGoMAPlk0YoXnYbcV+tU3GjRAFCbscpHWQxg2wDM5eRpxP9d1Bp7REFyZVpFXhFzDx09GYRtu9s08YnZdnKHB7EdKxqYkVmzjvA43+JPH6ZJr0KVPMWHj6oOJpb6ErsDdbXmbadx89cLk0i58XpNrkad6TcFjyc6NDzGK5bHhEsHPJozslUVldI4R5fA+cXwfHYfufxkroL7SFaJUuH5Isb1pRV74NwCaXngE1gr9WwiWUnCdEMxO3vt/NhK7YKnLAhaQ1hKsdCmYAPsPwSJjxRr8nGPqRldKyiG/KZhg/bwKrCYtuvE5fknnOgokjAOk9TXFDI2c5NaQhUZpU4hYxEBHj8C7o0eDye07Q+FfGx0kU5Ds1GU6ecA5Wuzz2DGZRC0g8yedhZjlJGvHLRagHHrkEvF3eElTI1F+F9O0G23kTI47clmuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(82310400026)(376014)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(16102099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nLDFVEhaD3WI7u8Rolh1symWnTcSJVaRYrW64AxxPTINjSWBS7hQwPiK8MBGBkDjm3UGNVAX4H0u5uhTurms+UeEcP0byt1wvfZygC/2bDKmdjacir5+a6zK2eL7wqhZLXyJhmfSReho3K5YDl5xY6sbzPBl6T8sDp/gh9Fnh/4KlEy/Hn+L3JLW083wJZzthtSpDrKrT+w9YhUAiPaZM/UqFTcT44KhCEKw5gIfkfcUcuEsnoPszeBlRS0GTGeVT2KVN74XXSgqaj8bQ/acDFqI+x0aftkP+ovbRCCaU3jXn5/ySnWWZn+5Kg4xS5QESYAYL3poNPIOOaL3j0vjTsSgeQ/2zztzmolzFO7Yd4mn3QJK08UFPm6OQ65o1QJYN0ibwDwWx8r3rBzY55MtVGt+d6fXkufTbnvW9hYkbA7ONCBq02CtDCn+brnPNYbv
X-Exchange-RoutingPolicyChecked:
	HG4BfMg1Xx/wZBe9YebvyIXXdSD91IizgrCNUVbeSEvahcReFNsfiHcrkS7coDZnntXqP03G1cQl1Rxv8OW/1R+85Nf2i3WL2OT0Kg7YHDBBbQEceCNbOSEQgBRntyqd2jYTLlIffBgcOfTMKNTI9HQd15E1z46xHs1nk1/Tmjl3DojO4emHNNpP6wbE9LWetyboslIhcq6vrjChqNEDmnY0a8GWf29hb1OwJBl01n8+/uBnsE7SODutMC4EYSFyewzDpEeBw7EXB+CaknT/RS5xNr0eyMp0E8ZzUPHTIgJxmJJ7rJ3V7LNJEgIoipy1mw+MLruLXGscO0SDXgXKPg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:04:43.1425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c36984-ec3a-4836-5e75-08df46f614ba
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB237799
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXxxQyBZ0zmLgC
 /FmlHtJJXvb7crf8L+otI/DetFlbxPVgrnGZ32LzpLdUiwTiu4u+YkhTX552NqCRMWFWY7ENksy
 i/sMpTXXIEUHBh2YwG6TY+aL16OnUU/pf4dY/d0YnQKTZIdTdAjyJla0Ow7JQMh7Wcz+lNus+sz
 zHYfP9me/tv1RcvpMHoiNHW31DSxWusC6Ti2LSjsKSYdHeF0ilArU63g5y6R5cPP6qSB1vY5kY2
 kZJBdq+t55raw+VtTGXX3hHwfkZoWN/CKrmqCjX1P4yP4XoyGl/c6a3EqpHQN5p2Mb1JsBRJQVC
 K0aVCcLi6WArXFiVp4UAwt2472XHB9ZZv1m+6Cund68H6zvYfiK3WC/YWBHGYwNFFlH0TnRgUqu
 +a2zUUFjRXyBmiaVTM7IYT1Kt84is+vdW+5BboEudGCWFtF0F5W68uX+iT4dBK+GUssF8OMKV/f
 EfP/i+DC23AYiRLwIcw==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b00294f cx=c_pps
 a=ZgU9I8B0O1PKiENeC86Haw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=4lrPNRuSzXD3DHeaKO4A:9
X-Proofpoint-ORIG-GUID: 8MCvYRjjoY0rC97xNwb-kNTDL4Hm3Vg5
X-Proofpoint-GUID: 8MCvYRjjoY0rC97xNwb-kNTDL4Hm3Vg5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX7uFT/oNOfOCq
 bPWNhvFm5Vb7pOQsqp/rDtkIaWZDvqs06X6HPIajMe8gIZ/FJrq99lehKCr6CpaNaSzPB1Zr7G7
 d+fNgCJigSfliUa9LQoMJ3npibZDtcg=
X-Proofpoint-Spam-Reason: safe

Rename the DAI for DP3 to cs35l56-ot127 to match its actual function as
the SDCA OT127 Companion Amp output (a type of codec-codec link).

The previous designation as "SDW1 Capture" was incorrect. It is not for
host capture and never has been (this function is on DP4).

The use of the old DAI name was already removed in previous
commit 4b7f393a01f8 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
OT25 DAI"), so there are no users of the old DAI name in the kernel.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index acb202559dff..439063084d4b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -436,7 +436,7 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "ASP1 Capture", NULL, "ASP1TX3" },
 	{ "ASP1 Capture", NULL, "ASP1TX4" },
 
-	{ "SDW1 Capture", NULL, "OT127 Source" },
+	{ "OT127", NULL, "OT127 Source" },
 
 	{ "OT25", NULL, "OT25 Reference" },
 };
@@ -855,10 +855,10 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 		.ops = &cs35l56_sdw_dai_ops,
 	},
 	{
-		.name = "cs35l56-sdw1c",
+		.name = "cs35l56-ot127",
 		.id = 2,
 		.capture = {
-			.stream_name = "SDW1 Capture",
+			.stream_name = "OT127",
 			.channels_min = 1,
 			.channels_max = 4,
 			.rates = CS35L56_RATES,
-- 
2.47.3

