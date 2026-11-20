Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186900;
	b=wPxxQHLDdmWC7aIG/Pg6iHK/MKKUXmeAuz0y6H/n5TiTNdbV0htTKSLBzoDWT9wyGflc
	 igHBdPvV5yYQLlCOpHt/qe3VQbM9ZIsqDeDss/VB3m5vjKN2CLWeJslUObijNwhGxyPlt
	 w37wnjOy7WM7q4ifv/DEX6qYfxgcqR9I6Al2mxUmZzHMKnXsHYAnZxUIW/aWo7RribA6v
	 MrdGKNUCXUZHbn0NQYIVU71ye0NH5XTNnqV1gp8dYDym3WNwmn7OLmLtO5Qu78G+p9NVx
	 r6CnySvnCYBzUePSzIrXS4Q0Hid5c0krlNGu5LCMQ7bS5+OduRQ/l/5+PiuHWKp1CXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=AayYr22SmCO1NOLdshxxIMcvPypvx5JYnWStvIZ2cjs=;
	b=hjRjbMLFByCUgH8j2sPRSss7kFWSXrp9kEQ9XWLD2JWk+r8USZYhDcbbHm3NqIEZly0f
	 LhVISLKYtbfUHbCx55nx/80x+XfnKji8G4PDFYoMTjb8ZyzWmR0L0+98OkgwW+bw3kvC0
	 1v9jsX2PlwQD/CcJsgvvIMlgQ1KagZFQKryYoN7Cw1KHkRGC/ueuym/biJALfdy8VHGlL
	 b58Gijf8XzQbXv3vMvzv8ivvrYJwLTOc4xH5u12DIJSiawylL9TU+O/Vi2ntG43bAfNQI
	 N9RUF/Ddak1j6Q6XKuP95wPuKqCGb0VceFUHzfp6S3qVBOAOzCmgOuMv40WdbQTL6WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="CmOJvi/D";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ho0Zojs5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA360A6F59;
	Fri, 20 Nov 2026 15:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCA360A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CmOJvi/D;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ho0Zojs5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEJh8l2967102;
	Fri, 20 Nov 2026 09:01:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AayYr22SmCO1NOLdshxxIMcvPypvx5JYnWStvIZ2cjs=; b=
	CmOJvi/D8c9HOMIp/NFfEJz7RiwKv3VXrQjJPtctleGfs2iJmRtQ3p2Fbo5zLFB9
	hMSabAOLILSbPh1wruGnaqmidt4+j818W2L0Dv4BdyDhhTMcjba+Zj+4ONDKT9xa
	h8egsh9mUoMqpppvOv+lPcexW7DqTQmgW6/e2he1Lu7cpAGMwqUjFUd5WMxPPgNf
	a7A2Qq1Rt5/VeyLwh1GE7gK+KpSNc3kOC2NRFhauhgZB1jWSqQ3vtAb1JnlH55Sl
	IojVb1534NRMgXYky9bUmaPOIUtlV09vInywL5DZ4q2qXv2pcWquUnL9tviQzduI
	u38kU3nEVU/MfI207lsBig==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021140.outbound.protection.outlook.com [40.93.194.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhqd8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 09:01:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taAVFee/RF3cqoPgT8aMyvxc/Xo+DN9TYh55VkbNqdAy3WPRqgppCQBIz6mGz6OJtV9vNqprwgN/Ls9tsqmhHrz5AI++vlVx7YMoaTy0G+OvD4D4V6A08D0FL4bc6saSxNd1xaP0OnZVZmk5lbsefXFpYmV61h4m7fnRtcxgT3F5S2UPE7Dd6/E4UtQnelX4kmiRN777tiJDx4huUjkMc39h19h/0liSTKUyfulGjSFmyRJ4Z2cUuNkOwxZkWfuDZx3zIyEPHbmm47OVu9LX3G32rMz6D5vvcLGwjUmxAevnYha2cjE7m8kNemwKygyqsuNYTLJ/9RZ3fm8KPsw4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AayYr22SmCO1NOLdshxxIMcvPypvx5JYnWStvIZ2cjs=;
 b=q8QZPnRA3inB9/GWpu3C0vBMC9LyULkbFrdQ+2erjPj2Bo4+Q5EPpC2Adv8NSYSWpjtW+vD0xfRkPPMvj3YoqjoyNuWuvbVHVIvigzIxheXELrt4JtPAnA7eqOaBnDXXBW54Rb0EXfK2q3qRMNUv+u9ha6HMIhr93SkDUbU/olAx6lV/+qJFtUzxFwK2W1kxxIUh8AxXL8bAnqC2gX800TiTuhylY+NsyV5SlfDEbCUS9Z9SKFldVXHOnmsWMqS9nBsUoT2g33mHvA++A+gSHu22ysx2eNEup/vSdiWlGlygZ1V7RW8XYmTsQKXwG24jo+aIPEeEvnqcDWcJyE4ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AayYr22SmCO1NOLdshxxIMcvPypvx5JYnWStvIZ2cjs=;
 b=Ho0Zojs5onhYjl3AXoFplMPmeUXqxbiQD7kGaGT53jZT+s/iAwde/lvTQBzfa58Vn3K0yKpTvKR5tQSRuL0nB2C+MEv+SVjEjIcAVqBWyseVnKiMKpU+2yglANwnLpwOf/vj26hNwAlV/+hQueUJ82al3lS1lbgdXFDw4/39k2c=
Received: from BN9PR03CA0937.namprd03.prod.outlook.com (2603:10b6:408:108::12)
 by DS3PR19MB908906.namprd19.prod.outlook.com (2603:10b6:8:608::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 15:01:14 +0000
Received: from BN7PEPF000000A6.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::40) by BN9PR03CA0937.outlook.office365.com
 (2603:10b6:408:108::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 15:01:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF000000A6.mail.protection.outlook.com (10.167.245.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 15:01:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8D972406556;
	Fri, 20 Nov 2026 15:01:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7660A822549;
	Fri, 20 Nov 2026 15:01:12 +0000 (UTC)
Date: Fri, 20 Nov 2026 15:01:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Use Function Extension info for FDL
Message-ID: <awBgt1EOuGaMgfLq@opensource.cirrus.com>
References: <20261117144853.2357660-1-mstrozek@opensource.cirrus.com>
 <av2D5PvUiopWIhFv@opensource.cirrus.com>
 <249f5a50ed481dc03a9f2617468136670898f9ee.camel@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <249f5a50ed481dc03a9f2617468136670898f9ee.camel@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A6:EE_|DS3PR19MB908906:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6e7ae-9c54-46b4-fbf9-08df47171f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|6133799003|18002099003|22082099003|16102099003|261021123027099003|261021121427099003|261021130227099003|261022115727099003|261022075727099003|261022105027099003|261022113327099003|261028144727099003|261026140227099003|261021135927099003|261026121527099003|261026130827099003|56012099006|10067099003|261102123227099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	EqWaXD29oMP8itEB3IRfpjqsv8uoSdppZ33lpckeKIMLcHUdS+dVfxceAcre81C20fN4Ebf2e0+nVpjzpvSRk9FGQIAxeoua8Q3o6KVlLNO/klbsetW7RwDZCOEfkpF/WpZuHEkDPsTxbEdZ4GtFB8PH9INmj9mlcop9oOSzQuTDMvwz5SI8svXQtlhzeH1sVYjj9g9k3ipcNazDJws2FrV3aJho10WdCgIcNzyQZIpFgXnL2s3woJdnX7l1Wm1+PYU+yVzeO9+WeBbPdtkFveEF/O6Yecp/aU3kb6o1//32KmTmKzcu2RiQ7bBAmdSryMzNiVQJ0icrNHVD8TJe0Yh568+hzYVukn/boIfBPuNlAApWk7wWYx6Khp6ZTP/2Uy4HT6SpvfunDRbGxLFPZEFxQ9E+GzlVYNtOV8U7UJ8rf3eolVDo8FXie49N3wXYIOWiimveVW8drDNG6wDcU7eS/0P2sSQOyq7lHcXborD2uG1VL4ryvGL4T5U0EBmjuBRwftEq44KtqWqT9wei7iAvN0lBIfFzo6Goqq+fT82F9G9zzigPGG/nDJH0/SqoZW3q42OYhnJ10W40iBMGcXAhV/zhJJWELXFosGMFd1/1FQsBguki9OI8TNpBSuikipjnpy5lxBw4CVWWNlVNmRRvz8NOPMU7s8iDEG/uiDe53wUvO+i3DRgsQRs6WbND507ahobWcB3rXlYvU+wpdg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(16102099003)(261021123027099003)(261021121427099003)(261021130227099003)(261022115727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261026140227099003)(261021135927099003)(261026121527099003)(261026130827099003)(56012099006)(10067099003)(261102123227099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y43+OsrNCogv7nOz6YvIh1AFQ5uujvGsJpHF4ANZUaZvsjNz8RxsEpEJmQo1lh106HtzNhjusmO+w60y1aADSzNWqLvU0QVW1Zw81UihGVvchbB4TQWUL/vEBNkQ9AKv31Q6ZOnhfpY+u3eZh0NaYjBATWuCiL4WAjS88JRbdKXnPsWTUDTbhQ5GwzLXX/oqssR+lEJeVQFIy3JgdOp6SB5wpsWlL49WQswoCDgox1syBLo11aQfR6h3wjCiLvemwd2MPSqKMgy5Fq709gqIG3SJ64C/CLy1m5bNEtQt0ZhO4Sz3L8NuC7DNRCKODisUpO1Dgzg3SSz2m9WProRdtA384BC79GhV9hYiHhRLGvqEJ9MiGAcumqTrFKQMkZX9qIPZpYHuI1BJ7aswMTMVHfB/AJST/rMj/gA6Kfv58OkutW2lZkWFoolrEL3Jo5n4
X-Exchange-RoutingPolicyChecked:
	iw2wPJR7LrNeKnQeGmuJHXs/WtB0QZ9awM0Nlxpa3LdePWdfA/PjfHiZD1vNJWI5Vb19bbYKtb7mFgfFXZI5JnsHwZZSSYi1ZvCsCvJPgwAbMUPf83y5PBVu8/POQaNaxvnEuX4gBCoW1FwjpFQcD6TS7cQIts7VTGYvcuGiBrcHN8fei+hqaMGgQGJygYtP8g15AkkjBb5bmVkp4kJGvw0fcc9rgTaGeOgmVBccLqLOSeoVgt+mLGKgVgYd07Czzp6g4E0vY/Rn+Z1purdTfKVDlnDPL47YFcOmQZMIyLbimKl8WyNQ3Oviuyp8VwAv3XbFASdcxi0Tea9zbUbChQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:01:13.9106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6e7ae-9c54-46b4-fbf9-08df47171f15
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000A6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB908906
X-Proofpoint-GUID: 6J4goIiGY1HgxJwwVCzOQeny-Y1av7Nj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1OSBTYWx0ZWRfX36NbOEFuRfnB
 2UGaT875JrET2ALSvoh9Q86umf5UgOmBsr4NOAxzVnV16KQpym2N/m/OthJaKZokGApx0FyGTGX
 JdOPgX+VaCXZLwiC7PAIjI02+HeTfGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1OSBTYWx0ZWRfXykMDwEF5POR1
 VUVOys2W0xRSaYDWXr8gEAIndimm+6mQGsrNhYha7+kEqMMkHV2GGP1IeihjMXx0pSlMGpiBsqc
 4cx94uNCul7xNDRQP1v7k07ECDawlxoG/oO2Ke6fCyG+Cd2yacYuB+UipYpR+y0PHs62fdhjxrG
 0GwOyhBL4KfuRt9lwT+PEnQw4/Es8hDtSeOw51ZmmbVOBFJHvrz4T1CM4b6kPxJYqJcFHQS3Kmh
 dZMZg6Tj03NiSOWoyB3GAQ75i9vF6Z9QiLfGWd19VVPALfF7oritylg3MPQiGSYaZW4zvB3FGot
 CEkV0bBU46fOaUulrUJbtnO6AE0x0nVGx5y4wmfdPJ4lMEFLLIZfWqRuz7ZamlQ1GZpMTG8QDAM
 AntUIz7r6rbP/FBbEBxerI/L1jOhnin1hZeLIhqy1KXJSB6cnVHh8W78AVTdFZPqaCyNdl5/6Mt
 L12Izsscf3qLf0ogUNQ==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b0060be cx=c_pps
 a=9413hkbT0mE/MGYjVs5kYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=_7KQVCkVTTsOBh3suyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6J4goIiGY1HgxJwwVCzOQeny-Y1av7Nj
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 20, 2026 at 02:16:27PM +0000, Maciej Strozek wrote:
> W dniu śro, 18.11.2026 o godzinie 10∶54 +0000, użytkownik Charles
> Keepax napisał:
> > On Tue, Nov 17, 2026 at 02:48:53PM +0000, Maciej Strozek wrote:
> > >   dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
> > 
> > We should probably drop these FDL disk filename prints since the
> > filename is now printed through source anyway.
> > > 
> Yes, in case it finds the file, but I think it might be useful to know
> what it attempted to read for debugging if it fails. Would moving those
> prints inside the (!swf) case be better?

Yeah perhaps it would be nicer to print both the filenames in the
"failed to locate SWF" message, you do probably want that info if
the SWF failed to load.

Thanks,
Charles
