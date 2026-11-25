Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604956;
	b=KHfx+BG0o3BCMZ59QwtKQATGK+jVZfsn0FfotpcFDH9wbeyB8or5mREHdvn/gIOadUwS
	 gPAxvuCuLUU6xyYDKRFCA57utlvyTnRB6bg88y0fmJsM0zhMpaHelvftKUnGjWKp/9P79
	 2anLotnmXWsIzsjGKSd5VTbn+zz6GGsdK139Tpeegs0TqAk+GDwScumpmOryulLrqB9b3
	 B8ZtHwrhR+LB8yKo/XlNdwY12rlVtxrh7kFsVkRHFHFnzW/PBuw0Hp+CXKDLi3E0d0+BY
	 pRHyAFP1jFMfNQHagKsjyZNwsmOvLb8jpviXDN5z78Uq6/AwxXYKf1GB+8E+P7jGKvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604956;
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
	bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
	b=Ds2g1T1WA3t+ZreRSPYbaep3jKnuJPNloY8EsSvRBEqjsNwDJEFVyHkfuwrIh998KMHz
	 h0NPHOGt8hMmBT8vqwxdyLueKr0KyxTRveUoGuGbEadE3cUFUBUWpJGxVRBicKgSiFyo0
	 HZtcyIeToWdCQND9YbGrbwD6WjwDhvcwOLKa/UrF+QlFd16/x4gG63csW1lYQmm6jjyai
	 hKBeIzSp8sfBLAitX+tqmMCTkC1Ugn93rqt0fzEVXVZ3XcUjy3+3Sj31qckf+SbNkheUV
	 U0Du5gVUaQCaR4UkOaMPXvK/FV6NBPL1dT9JuXAZbGehetcMWHSi/cDTPAC1IMNQs2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CD79URey;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="I/ixaPmO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A209606A33C;
	Wed, 25 Nov 2026 11:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A209606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CD79URey;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=I/ixaPmO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APAkYcX003569;
	Wed, 25 Nov 2026 05:09:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=; b=
	CD79UReyMCEk4gD+64vmoR3E32TFl8qmdMMfy+ytyXtwz+6oKBb9hsF4JAyTGK6o
	rqURSBafeelvgeJkRXZwkMSBcxtwFpRPxfnbrttZ/tK+OEbEnvez7KECE8aFeci/
	cuCQ0Xpti/VsJEYlrSR7lV6HHfUb4jJTBU8NuUjh9hGPuBfjiJVaEogNvga8Mc2/
	Qdp+YhrTSipTTziDM+H+cm6e5YDl3fwZ5EQXgyzSuZJDSR4oLFsSE7xcHSCdRrgQ
	CXxfI/OZxNcSVb4k2YBDi8jZHWrzMssNdr8CaiEtzmXt/Ed6YGMMm5L3ojhA/aGJ
	sbQmGf6WNdvriJ2fbMKFKQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021100.outbound.protection.outlook.com [40.107.208.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jah1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:09:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV36AbDFhRhw0Cn6oG+A9q7eIOb8QqsHn3qEHUeMhdIeiYJzGe+8ZFpUd5qC+vZnf+xtKxxoDREGis9yTHFksgplEW52MiDtH4huEyrj3HJRY5Lg+hEWIUPDjeVmdL5VmHz5n/4c+BwiE2I0SiPQ1SShrV/9fwa1GwbuU+xs3BF2Si9xQUFx0WIuPQazpHcZSZDM+6rq8BeswuDVTjB4jMVXpCKsdWFkpfQAxJOl/Jl0sig0LGY/YHaH4owIXHRAIunPasTIHXh6vr0fZe2y1CaNks4e4XQvVfMeXpjuDHQVrEoRBgKUIIVWwibP8ucFy/nrun4S5dt35kJYWDHJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
 b=OWxLkeyOvwMKWUjfo7We+2kSQ8Akd5MTiQwv5IEVZmtuN+QuypZLUFWSa5kNX4y7FCWZ9ewjgj6qtnr/BWEFAvO4LtfSduwGJyciJrJe9GFNqdhyC+07Ie4VL6Dj9+Z3NotKN9kuzb515Qlzzp+pZ72ZnFT1zb1aoDkwxBDGbO413X8wEB7xzZLy59nhnkuU1WUGWDgrHDxmbe8HxM+rGfFWFnTwVHUTOgqeE04E9lNk79WiDAsQM6i73WW8oHPvI7a7hiZCrve4v6SiUEJY+b5/EBqRHbRIBGR2Los1al6e2OERwKlBRKFcAu3BMzyxyE/dDFwOYD1J4XyyyPp+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
 b=I/ixaPmONuyf1S2YleViAqg6axs72+qGCokYGB+6GKbB32XW125T8l88s2x941LW8Bd+RUF6YVte3BKn6oMoqyn/sUxjfHIAZJjzDi/x9V6t+8BhdSp6eRlZV3oGdZv/3ZYyQIrU7VOynhaAvAxYah7BEx/9uxJvOzBrMRMfb6M=
Received: from SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::18)
 by SJ0PR19MB6631.namprd19.prod.outlook.com (2603:10b6:a03:47d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:08:56 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::aa) by SJ0P220CA0027.outlook.office365.com
 (2603:10b6:a03:41b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 11:08:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Wed, 25 Nov 2026 11:08:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0B3E6406552;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2E91822544;
	Wed, 25 Nov 2026 11:08:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 1/4] ASoC: cs35l56: Remove SDW1 TX source controls and widgets
Date: Wed, 25 Nov 2026 11:08:50 +0000
Message-ID: <20261125110853.741337-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125110853.741337-1-rf@opensource.cirrus.com>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|SJ0PR19MB6631:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b23e73c2-3d82-41f6-206f-08df4ae47f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|376014|261009223027099003|18002099003|16102099003|22082099003|3023799007|10067099003|5023799004|11063799006|56012099006|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	YbWOy+VecNuPGs2OxFtIuX5BIywOCnng3ZQv0ZcNGXEzSXrc8G6Xr6og7NUcdxa0VfYapbXmh1tRk/omuU/N2w4ARTFfRRvd77fbOkcxnsMx+wtojppj8zaLRWiPb6ANrwEy81hHIeWTpuHeU6WVSQnFY7EXFKVQ22c8Y5wb6JDzdIIL2WPa575utmXKfjDQj+JmKbfY9OHsBAWOGtmvzkY0KGX6w3HFHbB40++BS+3unFBORdhgChm4OcMRyVK0iRM6T/6epHmgzZ3A7iNTI4zUi6S9XvVfCN2lI18NWGOvxNWDQTw5uWD9jx5P0h9ef/ySE/BJQy5gP7CU3joHu8qHpB9cVIIgeCk202Tc/k6R1N4BDIPJZcBonfFcFpS2IS/ZFovOdUpayfKJQc5JNexfCNGKZAvb2/qy6AyMXGBMyxXf/p9zK2SiP3sWsV97bANNpqUka5QoJDtcmtmWd5Rkz5E14BTDDp2esLoLijNxUjcalKeX7A/ABCIvyVjGhgPPcCLuIEEweNkHlEwAQi765mD/nUneESX1cB3XD5hCsvwwYjhnSn1pIc1e0vxJ1HaoB2DUgMZcdTCcKYO9+pvyHodnizI2pQeKL2N0Bj/eb97Ad1LwPQ2kggtlI2IpV4Xv1FypK3zovuEb+CECDVIV3bM9VNKl3U25sCzyI632oGny/2rsm3OIobFuKVGQK5Rq7kVDnziaevA0EHi+/A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(376014)(261009223027099003)(18002099003)(16102099003)(22082099003)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wccgsRhbTeJ95ZAHqA1NRDxmjboUP89xDOldl4/hbIebBpo9vgnYkKAQ9rA1ONHcOFCDmATgdAa4o33UTUNrG6TIo5WP9kdb0h/gKTYf8lK6G9FeVPkV6ZuVJuCC4BcV1Lrzp8emsAS/C34e7w8cItkl8/Rc3GfW/zLS1aNsFkgc1EOnlb8kQYtIvyvR6D7tcr0xA/pultK981oPaApBC7q4I3NfwHgZ/XfCqIntVEf2JiONbqUT4seBUZF7yOJDCatfHXk1mzsLkBIZ6iLvw1Ti7Qr6U1A5rgfXx3w/sUe4Vjo1N4Vwf414tX0dRwIC+xLCQvuSNdQL3ZOzeLxXyVz3nC0e7T2wjue4juOdaG50AqWZDSkfOsK0JxeG2xZDFV0lx7hZUksazx4p3qxrqOJL1DEhuIeds/o05oiBRjk292DHlDJHf6lS9CjQIfLd
X-Exchange-RoutingPolicyChecked:
	P9shm4LZ/uAfuLfkuLBrf2CsJVscYq8lWl7E4ymYsex0VKxTl3x43tev5bByqK3XRRGfrdsYsDBVYqOxr7J+2dAECHW4ZkrsDU7qULCHgL0zqVmkUHnVTkPR/uLLBWhYAY+eGxRdPuMjzKvoXRFpDQvQgMO7DtgurZVStLEMGxX1JG+7VT4KKJpLeWf2xD1T52VzX5gzIV6pgvELMyXrs477we/LpXcrpH8ubDGd9/im78hzXrp8OEgf1Ed2HttXIBAAkBa4MtVl/gz4nN8WDOxqAsOk8Xc5/Na2rqb+9bvOkQ0idwpQk6USCuAItgNzjxO38BaCK0WI+NnOlV9GdQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:08:55.7251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b23e73c2-3d82-41f6-206f-08df4ae47f69
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX4fEuxMGz4JWF
 fbbfBmkKPfZn+aBDuuyS8LpOEGruLdb/VKC8lNUQ1QbuqReABELdn6S93NPK1rbLsSTtXN14wXK
 MdRJshS581GPKTF6KUC2cQltlo/9nusjlRVHbTUb/zlRj8EwluoNgmNPi7qtlVLZRU+2L9ivrH5
 dXY9kvs987HbsGIVHq5D6D57o5ARxH78mOpsIvZvwRBjJ6R54/Hx/mSG5fkgbF6AmdMo7cH329J
 TYLMyAtSwRGEDwYyb1WbuYvzqB41VOytPHVOdZ69CR3Xjml6uAo2IVgMUifxnCYxyGyk0mcFDO1
 zF6tWKmO2BSf6xDVCLjuh57HOdyNOi3eASdMWKsiVdCQtIhEJUyw/k/cs5oYb2GRvXEAjoX7Bz5
 Jlrm2z/gPeNYDBTp7vQCpLJfr6NUZVBuIHMaMfBWRiX9h3WU1+ujxJVVWY92d1HCLu1Y3G3poYS
 6tcWehA3fo3/CadvzVw==
X-Proofpoint-GUID: 3yJqzpds9dE4fOyTpp9NjNRoDDsnTj0w
X-Proofpoint-ORIG-GUID: 3yJqzpds9dE4fOyTpp9NjNRoDDsnTj0w
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c1cd cx=c_pps
 a=EgTKCgcPzLllfVGnvYq9fA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=xy_9i6YtUklqkaMNc2IA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX9ZjudyLWRKjQ
 3iYs2q1Wm51WMFuPV4JIuxERDNiM/wDV/m/sb/Qu1AQ9NWwWa0W0kLpNUO8vN+Wm8aC8UH43Tdy
 epUh12eP4gj90x9PGwE7bcW9h1xH7BU=
X-Proofpoint-Spam-Reason: safe

Remove the ALSA controls and mux widgets for the SDW1 capture DAI.
Connect this DAI to a dummy siggen source like the OT25 DAI. This is to
allow DP3 to be used for its intended purpose as the SDCA companion amp
output.

The implementation of this DAI was incorrect. It provided a capture DAI
for the SoundWire DP3 port. But DP4 (OT25 DAI) is the port for feedback
to the host.

The DP3 port is used for SDCA companion amp (OT127) and the mixer source
registers are owned by the firmware. The driver should not be writing to
them.

Nothing has ever used these ALSA controls so they can safely be removed.
The incorrect use of DP3 as the feedback to the host has already been
fixed in these commits:

commit 86c8360c97f6 ("ASoC: cs35l56: Add DAI for SDCA OT25 stream")
commit 4b7f393a01f8 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
OT25 DAI")

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 16 ----------
 sound/soc/codecs/cs35l56.c        | 51 ++-----------------------------
 2 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 4d76f1777927..073f7bdd3b0d 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -49,14 +49,6 @@ int cs35l56_set_asp_defaults(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_patch[] = {
-	/*
-	 * Firmware can change these to non-defaults to satisfy SDCA.
-	 * Ensure that they are at known defaults.
-	 */
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 };
 
@@ -105,10 +97,6 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_default cs35l56_reg_defaults[] = {
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
 	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
@@ -121,10 +109,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 };
 
 static const struct reg_default cs35l63_reg_defaults[] = {
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
 	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 30835dc56006..acb202559dff 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -267,42 +267,6 @@ static const struct snd_kcontrol_new asp1_tx4_mux =
 	SOC_DAPM_ENUM_EXT("ASP1TX4 SRC", cs35l56_asp1tx4_enum,
 			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx1_enum,
-				CS35L56_SWIRE_DP3_CH1_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx1_mux =
-	SOC_DAPM_ENUM("SDW1TX1 SRC", cs35l56_sdw1tx1_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx2_enum,
-				CS35L56_SWIRE_DP3_CH2_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx2_mux =
-	SOC_DAPM_ENUM("SDW1TX2 SRC", cs35l56_sdw1tx2_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx3_enum,
-				CS35L56_SWIRE_DP3_CH3_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx3_mux =
-	SOC_DAPM_ENUM("SDW1TX3 SRC", cs35l56_sdw1tx3_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx4_enum,
-				CS35L56_SWIRE_DP3_CH4_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx4_mux =
-	SOC_DAPM_ENUM("SDW1TX4 SRC", cs35l56_sdw1tx4_enum);
-
 static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol, int event)
 {
@@ -407,11 +371,6 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("ASP1 TX3 Source", SND_SOC_NOPM, 0, 0, &asp1_tx3_mux),
 	SND_SOC_DAPM_MUX("ASP1 TX4 Source", SND_SOC_NOPM, 0, 0, &asp1_tx4_mux),
 
-	SND_SOC_DAPM_MUX("SDW1 TX1 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx1_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX2 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx2_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX3 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx3_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX4 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx4_mux),
-
 	SND_SOC_DAPM_SIGGEN("VMON ADC"),
 	SND_SOC_DAPM_SIGGEN("IMON ADC"),
 	SND_SOC_DAPM_SIGGEN("ERRVOL ADC"),
@@ -420,6 +379,7 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_SIGGEN("VBSTMON ADC"),
 	SND_SOC_DAPM_SIGGEN("TEMPMON ADC"),
 	SND_SOC_DAPM_SIGGEN("OT25 Reference"),
+	SND_SOC_DAPM_SIGGEN("OT127 Source"),
 
 	SND_SOC_DAPM_INPUT("Calibrate"),
 };
@@ -476,14 +436,7 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "ASP1 Capture", NULL, "ASP1TX3" },
 	{ "ASP1 Capture", NULL, "ASP1TX4" },
 
-	CS35L56_SRC_ROUTE("SDW1 TX1")
-	CS35L56_SRC_ROUTE("SDW1 TX2")
-	CS35L56_SRC_ROUTE("SDW1 TX3")
-	CS35L56_SRC_ROUTE("SDW1 TX4")
-	{ "SDW1 Capture", NULL, "SDW1 TX1 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX2 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX3 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX4 Source" },
+	{ "SDW1 Capture", NULL, "OT127 Source" },
 
 	{ "OT25", NULL, "OT25 Reference" },
 };
-- 
2.47.3

