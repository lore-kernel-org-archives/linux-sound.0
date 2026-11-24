Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536701;
	b=tdw/Rc/42qwZCBpdnAgCIO9tWyn/pV4P4cRkYmVNYzfEZY8DRuooXUU1wmsaKfBRC4R5
	 fT8zCd4rQEUl5YLLs8Z7KIO5hTK3ZJaYYe6QLlbAKbzqJw1Zccx4rPWgXnI+rXx1gTk8q
	 uDUoTzI9fpE9orTThBnbyVxU560dyzedZ0/VeoZqw3izlneCzx4jMRIql3ViLDHhaDyc1
	 IGjsIiyTk/8My7VLhWIks3ykjGGmmVP6khNDDH5xJQNPEia2cc7BFx++a4WYd51IbYGP7
	 bJEGJAeQdrBokWZvSrfoKSftcUNpmkk00OSSXSgo7FLXhbYfzWrAqGfS74OzRQ7XnVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536701;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=TvU+U0s5hsUUrrCaWOlLgvsepiiAMJjwK/0dXJjYe3g=;
	b=s3j5taWIMYJMjJ93DjTnOCALPz2DMWRStfRhLlaOPNNbACCPTs0GbKQneUdupht5Fp5G
	 dXlJAbzDrsgPTub6/rLzgw6RQw0wDnXBQGGjYGJGzMdmL8wxMSuuT4u5HP/iM7I5et31S
	 HmImqN5oMIj1uDBC0UzZRp8h2Qn1Oj+K33jrIRRfQu824hsVZLKRNykxxzd5FHq2ZDHE6
	 Rvq20/erijfCR7358jEgzBJwryP9iFrSZ/mVOm9GKC5TmJ/8Sn9cRFcdQ1SLC3NCsZNUe
	 bLZ/5yoSvsnz2zZX39TSLMXSUN5Dw9uSObut89wx25Qm6V6n6BhFrKLf3CmLc5W8Ymg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Aoey8XrI;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=c4Y5KY06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90B606A31E;
	Tue, 24 Nov 2026 16:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E90B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Aoey8XrI;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=c4Y5KY06
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhQ5M2257389;
	Tue, 24 Nov 2026 10:11:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TvU+U0s5hsUUrrCaWOlLgvsepiiAMJjwK/0dXJjYe3g=; b=
	Aoey8XrIOyw6a9fEGzV7ymY0kNrdL0aY+k3mLwNMm+u9pWlj4NPZJIM1A2qrvMa8
	+mli1CLLL5to0iSlr7dz+4JvCl6pm/kxtCjP/57+nFpAuuuWxVOSPooZybHJnDWz
	/dutLKe2yH3uKg/cfiRUEWlpWfN4NHrCT0wRE0hAfil1BPJ8VRCfOQNRqw+kZY8v
	VN0z6AN+hlAwqIBewaZWCXoFQjIMg9vlh3Uy0n9UeNnsMXuTMRm8QxSQdGXl7CdF
	s+2HdxYYJTUCZ7osFnLW4PLCY6VLoT1CtUTXDJg95nVhRptN1GG75sZWMYYGpbgR
	X1iQP4VDM9qgQp0M7+6I0g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021084.outbound.protection.outlook.com [40.93.194.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519j90n7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 10:11:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyWgiyGYK3iRZiteg7IyZPCXVesceZUc/IOwbGEppc6w8s8s4/FmecJ8rRWh8cOjb+KiCjKtQPtGimS+62EFJxHAkige799iBpK6aKj+m9TNBmK5lMUkTWs35k4fqiMBTtCq4ucbXE1OT/IKLKr9tYdikGH5auSLBIjLP0OzdVBO8WYLvY489iizOLiTmsHcEddA4+18b+w7CoT24IYP6T7RKQY+DIVqV/kxKvNzYPUw8w98EATaFrtKCUvkaE3ifyXKPnlOGuwoKsD99sRhf/ZtWqgxNBE6qmYD93gg0SDzQXKe+4Gx0/5C6mK03wsVztu4UxFBtU8GuPNuy5EdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvU+U0s5hsUUrrCaWOlLgvsepiiAMJjwK/0dXJjYe3g=;
 b=j7Z+z2PpMSq6OVZLz3asdIfHx24ravHPqvONi7NHvFi0W+ihnvZUBcMDMoykuUT5mF72fAIyzf1GPtPFsbGAeCHNQc+Wkfkd3YXvlvLABALHDQm807S1e5cEe4fZCGEtESAltVcCg14a2IgL0SsLEhI29oDY4f8Zz046cc6EHiu74JTLgPEI9DeL/DPWdvAWiRI5VEYi8F9+0AsPtG4f/fHRornKnTga6FVQnAH3+mzUYJh9OMGBgtllzL+CMZkylGlWfywD8pjEZXWaiqrAe7uxGfNgU66KXfvpZeMbLaJnKQ+oD0txDSQh2iTfPKPkKGvSow9agPY3Dht6QZvnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvU+U0s5hsUUrrCaWOlLgvsepiiAMJjwK/0dXJjYe3g=;
 b=c4Y5KY06bgH6G35nVFg8qAGI76BiV7LcHODCzqj78vrioP4GNd1XMrOcpOM5eRncGBQWgS/9ymgVRRcd0lLzbOVMxTaRbX+iUN+XrvfaxQGHsTZfPEnH6TN5B/HeHXI6kJZu3q91SWN3BtPYyfUwZMmZzTGKP+9mIHaARnf/ISg=
Received: from CY5PR16CA0017.namprd16.prod.outlook.com (2603:10b6:930:10::6)
 by IA3PR19MB997649.namprd19.prod.outlook.com (2603:10b6:208:62c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 16:10:07 +0000
Received: from CY5PEPF00000E7A.namprd02.prod.outlook.com
 (2603:10b6:930:10:cafe::8d) by CY5PR16CA0017.outlook.office365.com
 (2603:10b6:930:10::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 16:10:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E7A.mail.protection.outlook.com (10.167.247.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:10:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3CAAE406559;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1BC0D82255A;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 4/4] soundwire: intel_auxdevice: Don't disable IRQs before removing children
Date: Tue, 24 Nov 2026 16:10:01 +0000
Message-ID: <20261124161001.702882-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7A:EE_|IA3PR19MB997649:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bdf75a2d-aba3-4515-cac7-08df4a4567f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|36860700016|376014|82310400026|10067099003|11063799006|56012099006|261021121427099003|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261102123227099003|261028144727099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261009223327099003|22082099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8esFfFlAhLMOmxiRTJ7OUz/mXqn49nKANxYtWCEA+Z5zzs8V/lYyiuLUAQdsRs+bDfGMK8GZxZLdFUVwCyrZBxMcmTjNXBDu/hC2D1QAnWLHwh3eJJ/6qAbwZmQY+EFjjDGBZftXxIRcVlSng6jvJOazuE0sOHefDLiWXyFHW0aLEQZb6dN5wNglujDMxJjHE7tuEwUCGN5f9f0U0406UAttj643GIDNwrMaxm6vK2v2uCf/p7Qhb1pELaq2pPXb4HWtEAaAZrzbCfzxiG7F9NiYEXcFxbpSeA4LEqZ5Zrbk0yuhWTvQVUtiGEn/o2OhIjwjEJI5ShC5ZjK+hO+GKqiC/ODNRYbhrmIqq1eOMxzNQOI8X/yO8lD7jm0yi6eJ2da7kYG929KpwyFfjYTp0TxBZRsOLBw21ZPf8K/2g4eHV0/GxTCshwqF2J63CCtn43T1ERPpVtEC1lCUeucYdfhXwP1kaOFzAGKZVzLoeONmEdCg2AjNnEt4l4xLvFnbPPocciXtBPfQY8OxHbRRpssRfKxoud6Tf5a9Jf2bCuLnJQiCOeh4eWSP1TnccKeyiKey+/jIv6AB1spUnBQiRvsIfva4CQbwsLDDK54j0tibdCwzcjAevqM+N+ZZ10ZI2zdpmh7qxf7N8h2ox4BRqyMV3BakKRmL2wOnbntmO06UV9qiY2ddIaAtcB1RKG5D2ucKoz4XOg0I0vykdB6upA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261102123227099003)(261028144727099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(22082099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tWyCup7j3Bw0NEBVHWGHjufee9Z7arkUPFDCgqofFDZcpsJmlDFjxRnaY0Nd4icTDAS+xI+2+HvSSpzxFjyGyjrwGsILIyLA86GplYhM1sjyFXqCeYlQd9uI3ns2WJ7d8ZCyJPFswGIVULIagUP7BowrOMX5SYZhjnUheU6BiLyZR3nj2FkBbCqfUOA4iqs/hJDfQQ+d0O8ekkUjRrOH50qJHcdKCGl+UfJ0epsn4DNbFVRTJ6N8wN4jYBTEqD1oYkGa/fnIT9+5IcW5az0S97BYAkfA7u6qhxt1PqH0eka39iUhOjCJzsJigBgtnAf6/Y4R506zdHNFx0K7cC8wUT8jPfldyKF+DaueAcuOYDxUsaEcsBPjQSSbOxtrgut31bSrFyJ6PkjDvIvs/BAUSiY2txvObsB91WDYLgGEiCOb1pGzrx4bdRFi1WnmSon3
X-Exchange-RoutingPolicyChecked:
	hteM0J9dj8C/ETY7SjqODlKgNejP/LEIn6DRP88BvZhvpIa6IXmdV9jByuaxJYQKRhI13MiZwHrR+MDnIaKR2+OW7w+3SUzUyg9CES7nRFx1pxRm3HhnFUJ3nSdFIkQGL3cOlGL9TtZp14I1fR1MauYFrERZXB0fflYjwHV/5lCixiggp8c6e3WZhXYYm8IEIA9G93QwOXJRKcWShuFmTNFhC10bMt8Fr+7hgLppjogodGVfWaSxuSfBfbjTGWmojEc2IZ7B2XKn+ART1r98zOPH00Bz7lw6UpvbyEEBWT0j7xIZIx5jr1dqHZ2lirtnj4yKeF/5ZqE9zqFMW7Jelw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:10:06.4145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf75a2d-aba3-4515-cac7-08df4a4567f1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E7A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB997649
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXyVnBNQZh4Hu7
 Rzm+cYnyw6VQTAWusufoOSuUbgTP+dp2GaEmtz6PbtSqC/QHXHDzVTO/w8XCB0Y1Ea3dJDFgSqe
 xCTt5n9h8Z1anZUUJYxaLF5Dk3eDUmK8HPWpT3vEtlfe1h9BFfTyhmoV7PR+sz11+8JT9MEBJ2E
 cOHk2DnUxsETkNqFwODHNRld11aLH90tgxGHe8nZNteaUT/RESEyLfbODrhUIOxocN3eRPs4H8d
 hWAKE6RA6/4FLnuekD7vawfDfqYzeNZjWSLkPCjM7Onul7smMmRWgfUc7NqYXGAWjK4MTUBqAPo
 fVsWn8R3UgrtBXSV3kdw+aEr+Ysdeqm47ZCoETcjVF7IwLNGAxcFZoi2GOCAXBuRPalErvTPZtz
 5vd4LSwVZjg7HkDKxkz2r+0flXSMo9m8KukduOXNAVMnSD/WReikiig9c7CxU3tvUHOLUtlLNTG
 k3/Ibaam06y79EPAcyA==
X-Proofpoint-GUID: anvxYUvQJeJR1-eKoIeuypXvsl_-WgXw
X-Proofpoint-ORIG-GUID: anvxYUvQJeJR1-eKoIeuypXvsl_-WgXw
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b05b730 cx=c_pps
 a=FdfMFdOEn1VR10XCui1xPA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=M075o84dlQH5HKZUfIkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX1use8DgOBbPE
 E9201iFDC/qtwJTYpqdDxU/pt4fSNJ4MzVub+aKpuy4nriGVidxVmHSQAC5UEXa9Zy+PC8tA1aq
 l4xUuEtZSbI5OrSGHuGMMj3KjzpjkRw=
X-Proofpoint-Spam-Reason: safe

Currently the auxiliary device for the link disables IRQs before it
calls sdw_bus_master_delete(). This has the side effect that none
of the devices on the link can access their own registers whilst
their remove functions run, because the IRQs are required for bus
transactions to function.

Now that the link auxiliary drivers register their own IRQs and a
core helper is available to destroy the slaves before the master
is destroyed, it is save to update intel_link_remove() to leave
the IRQ enabled whilst the slaves are destroyed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Dropped all the link lock and list stuff and just use the IRQ core.
 - Removed Pierre's Reviewed-by as things have changed quite
   substantively.

 drivers/soundwire/intel_auxdevice.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index d84fbe716febc..450c3927f0910 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -511,8 +511,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 
-	free_irq(sdw->link_res->irq, cdns);
-
 	/*
 	 * Since pm_runtime is already disabled, we don't decrease
 	 * the refcount when the clock_stop_quirk is
@@ -521,8 +519,15 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
 		cancel_delayed_work_sync(&cdns->attach_dwork);
-		sdw_cdns_enable_interrupt(cdns, false);
 	}
+
+	sdw_bus_slaves_delete(bus);
+
+	free_irq(sdw->link_res->irq, cdns);
+
+	if (!bus->prop.hw_disabled)
+		sdw_cdns_enable_interrupt(cdns, false);
+
 	sdw_bus_master_delete(bus);
 }
 
-- 
2.47.3

