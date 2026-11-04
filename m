Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790039;
	b=hRRMWbpjbs+01enD7938orGfq1w7nXQbHD8yQVhgoeH0wwkhukNtynEUtRBaYOpFRge3
	 xk5KvqV0dJNw1kfsC9NTPLE4PscZuLGyZ3f5CiVS/shHYg6DYV5gMtkxzFmsJW2R0eb4e
	 MJmXkX02iC+ldwT6tAydZ1AczqGQYlg8a9Cwme4/36ATc38+2IVL9io+okwIAKbNVJlLt
	 nqts+foqQ6HnQBhUSWwvg94568Z1VXOF7eFvlOSwCRHofnGq75+aosW/rKcMdKVYz4PCp
	 I/8zZFhRzffPJ+4+PC+LfAX7KB5ve6fEUQb6uj71YNptbku1QHvpuTdg7LHPf8WonOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790039;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=yaO1GfjSr9ivW33biBH4XIp5l65RbYBnzEJSuT3cS5A=;
	b=fvDtvLvK9znKzSW+bSLcO5qtoNb0Nerg8q5G4pe51OIg99fRn/94PerP9h4WirFoZFbz
	 ooWkZGONA2gNF6uBKXd5Wacju+lI2nPdKb8AvVsPpAbHeBrBM/W1LF3c1+APwukhJwPsd
	 27hlWNsbzK9iv58QL8/8Ss238DcHIY9ArhvdA1RgUljC9T5G8TDSwLncapZmY3v3HaLZj
	 i4SpkfSq4cwvZDc1MohCdkxLIjl/6JlYsSWmiTLiPcU4o0COb5e6JkiwslHFKxGoDpSbm
	 s9RFjpK1mkrQQLqualD3GbUN4CITwkh7p4fGB0TsXoLmF79I6m256PFyPc2fFhZn55A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="pKW73VQ/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=n+G9lZLH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02009606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 11:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02009606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pKW73VQ/;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=n+G9lZLH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43vo7Q2527180;
	Wed, 4 Nov 2026 05:00:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yaO1GfjSr9ivW33biB
	H4XIp5l65RbYBnzEJSuT3cS5A=; b=pKW73VQ/TbKSGIsPjMZ9eFoMPS3yslypUL
	VXibAsTWAZvJIk+dQc1MNiGKwdrssFS5DJbBBzzTSEwY3AaVSgH9j1p8PsmWQ2ig
	TRFlLkHxqdOslHsNoDgFfjtTDtlfnmL6P/inZ4TQo+0/IRTrfL1EusRt4mKJTdWW
	J02C2X2Aw6Wsa9PITQ49XkUZ9XdX18exIJWWCBpTS8lhkjN56zWg13JRzvNwOHAo
	Imk86mCLnkJfdfzy7kNOOTbQhcW41NpmlnKHByt9Na3KP9IyTG6ACWdFcWtS+guJ
	13S8bC5kS87h3trJlyb15UTjDvl7pK7dBVVibJU50DvDY5iPcphg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023102.outbound.protection.outlook.com [40.107.201.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfwfsk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:00:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTLRHPhv6pvsDSjRZ2SfKbKqriJMLmbP374W5jWjwEb4DF2m57HnkBtuk3mySAs0T3476l9+Lyask4ub//mhZXXukcWxwnjD589thobx3ygMqFbqL/dEgVe3nH3kD1AtROrvj8yl6aa1fYF4v+uXPg+1vEtTPx+NfJCfOWkR2HsCcl9yMGELe8TAzZ5X/CwxLQL2+lPuvDn6exa9GvL8Tcn01e8FDZBGHh8J+nI9hpcRSYYL95riRti/g3KyY2cnpCDIJyTJ+0wQy9UM2yU1TupLkKU6ijsHnTdUFKDrxGmqsjNA0lBsFK5QxOXVdGRMzyVO/A2c+makTlWdFKz6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaO1GfjSr9ivW33biBH4XIp5l65RbYBnzEJSuT3cS5A=;
 b=iFwlyXh0cShsKrDX1kcn86w6nKGIaDaOn35E9dxPrwt+7pRn9zGdd2BR7j6xbV3WxUULnE3yQnjE6m3EzdcyY4yNnsy5+JsUhaYhAit7nF6LCSM5wKLxIzpvQQRWKeiu0XgP9Fe/pdt5/yAPxLpp/Gt/aglMryFJtEvvSCg3wLJFj/EhRLM1D8kDTIef3sIIB55EFwzYn7W5YxyrOeF9Frni/wtc++b9PVhLpAtnWfrD+PE0oG3SM7dY6IE+OpULh19RCrFxceEIC6Krw4FcpVCiJPlyV1rGKQHXM6Sjq3I59C+m3qhfUhvxjoAax56JWbQy3rVvc4LCr7Bfnji/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaO1GfjSr9ivW33biBH4XIp5l65RbYBnzEJSuT3cS5A=;
 b=n+G9lZLHjgwfL8SWeTUQea44S5CHG+9criQ40kPa53Hg0Zdcw7pqsM58t2X8o2EUFvXKbs4+7u1HspnqHUhxuWuP9Kl1AFXNN3u/TTgiHu/voU377EyQQrcElmSPekIpv8uOvgFlNo3ZPDa3qxUoRDY7jNEDEaTggXR3gPBiVnU=
Received: from PH7PR17CA0021.namprd17.prod.outlook.com (2603:10b6:510:324::27)
 by EA3PR19MB9640.namprd19.prod.outlook.com (2603:10b6:303:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:00:13 +0000
Received: from CY4PEPF000392D8.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::88) by PH7PR17CA0021.outlook.office365.com
 (2603:10b6:510:324::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:00:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF000392D8.mail.protection.outlook.com (10.167.247.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:00:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF3C140654B;
	Wed,  4 Nov 2026 11:00:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1E2B820273;
	Wed,  4 Nov 2026 11:00:10 +0000 (UTC)
Date: Wed, 4 Nov 2026 11:00:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: codecs: madera: release runtime PM ref on FLL
 config failure
Message-ID: <ausQOTONkoBIqYrf@opensource.cirrus.com>
References: <20261104022814.1484284-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104022814.1484284-1-vulab@iscas.ac.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D8:EE_|EA3PR19MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5b5645-97d4-4d61-c846-08df3a62ccdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|82310400026|376014|261022105027099003|261026140227099003|261026121527099003|261028144727099003|11063799006|10067099003|22082099003|56012099006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gdkCqNGroXb/yhx0XQxcVH5aHA4dd23OIBRF3zEYFM2gFHFlwBjmKr9yizFMFgwTb4sVsG1ULvzDUn/ie2QE/WklNApU+kPdWMzKdLzAyAp+X90b0BrFDKSNBsjAK0Qg9Ji0aC3XK+RJzbMUp11RuYtX7ltwvgbkRoQqMNRhT6LkA90+ZXmhlBfvMMLLVtFC3UibWo4I3GGaUXsuAjDss+Unbp5RdUKmX4Mqb/e0chSIyHuBOnPIIScq0cw3vFZceoWhB4UQ4yXHS7UnFcTxPcwyjCaCNZJ+URiHmtvrxOnFCfl+l3DgnIPcupXQkPOwVWH09PHAgl2jTbiKVjXgt3mV8yzT3QOlUjSMJgXd1y0A9w0jnwNGFrzHuIb8bGpwu8Qv3Wat55AY6ssiI1OAgE/RWQj747gh1cIPFNwCIPt92mX9qck1YlVSsp+cx3ADyJuBzE6Kk2Z0zkGFKW1Ll4emQMyMfP7/wQIxypKAoTmQ3EU60MnIJvc8446J/qj0P8CgIh0Huhor+/UIYljmfREOuQD9uzxaPfOrp31qbaZNhb/h7oOgYxraqmbTnU47Ii5Qx1TIzZCQ1W36dJf2A6I+EiU4vHzH7+wm/aJsjeAiTbO3l9bOhBgi/zZFhK1legBK29V82hJT84B0v6C8TYalcX4HRT+yO307EppBamY5Sf9BXLVDjAGvXQT10TGg4QUaVCg09SbYM0eyq51hsQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(82310400026)(376014)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(10067099003)(22082099003)(56012099006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YqE5dbgbFmPxwHO89u44GZGZbx2UugwXvruXXAHJZcRT4BZZLimganL/sTNyKbQffRwlQx0HBS+XqaTyeTJdhf0GO0Oec+/wiRP8OgMEhj6n9Gs0m/3aJnu7rSEp2ef49gwtHbdNI4CP+8byE0HwtRAhHvN5wTL1dnIuMcSBuFvABqhZBQIul34opLLBAi9mCH+0aW11+C/WI4vXtUaH0psXtd8qsSXaFetby4n0mRSvVLMfWV10jFensYkgzx9XnWbmc/56u3QU/M7KEpVdiE6zDK5xz7wZeNs+aMLf75jMkCTfB945b9VKX3NqPMFtAzfbsRbl4BsnpTZ4cW9ujr+6vJQJL2Yp479tDB3sy/zAP4SUIMcTdQfWvN7xO17LRfbHBTYY2fGK5dF28R6tOesaU6qDyna2tfcdpspmoTHQXpZBUJsvlNPUgcRhoo4+
X-Exchange-RoutingPolicyChecked:
	qvb6os6FEPT8ns6/INcYYXc+5o22QxzCYh+eGYpBJAfKd+/djGsv1KEmrlDvF5rcfoELL1vGTWTe0wTAleh9YTJzqNl1EwIZNNx9SG/LfPSTj81jVtHVyT/iaAxof0CjgiyBb0LaHQI4+GRhhRon/6Z+Sm86RdJIAgBwG0E5WCtxED//7CGJJQj/Czng4R6vpGc0TKTYVVowp8XJ0Ag8S/Daeqb+1ld9KHonh68TjaIcT3ReDxHd5izYGHRjoGNEH4RKEYpeL3Yr+Xtqyfw/1SLxAL1ADzNvSmhz4BH+dMLpR40FdeGtYuRmBZaTyVUCqlG0jZPGZ+0HqWNsYBPdyg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:00:12.5108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5b5645-97d4-4d61-c846-08df3a62ccdb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF000392D8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9640
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MyBTYWx0ZWRfXyc4m4sibkBH+
 Bd+LlRwKDq2m3lqSqBgAL/rMCYFvCWwozwRSPv5sgr/rXZ/tr8UOHdDRdnIYk5kz/TYgbBl9uoz
 QPg+aE8y+lC4QqPMUd6BGRgeKSsue702YfBiD68/DrgrWCkc683KJW6kNNNUXTTa8vVjsyx1qA+
 zKBPsm/IsfRM5LTI1DAfSJU4XcEVoLuQHwFiz9vtNSv194Kx84c0FIvSOcqqpWBGk7rCR6/VViH
 9huu8BIWE8ynCwU0N1Fgu7B6xhC7KvcWC8h23Cd1SK4C9IgYF+WJ4Fy9Wt+6W/YyQVj3yZppVgA
 LsBRfU9odu3Of+2jR/v4SjwKO8ITVKLJ6tSO7CdhssLLINuR3G3WlacD3JrfBJkX6nFFoA49oG8
 BR3T0rS+sQLYJjNBeuRR4Ul/SCM6iO0pq1Z3vO3BLBUz8BDHJUewzkCjCeE73Ev+1YT8Fi/XFcP
 hTb4Dmu2ej4jTHapGNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MyBTYWx0ZWRfX8sysuJUDsGgw
 MMCMOmI63WVEXfb4VZuGQRZyrZHsrMODl/UgKCDX/WKDv8eZlYPeR/QUWNyafaKJK0Hr/oeMYF/
 zPeHgasZJhu6MiACFNjkRfAUElMV13Q=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6aeb1042 cx=c_pps
 a=7YB+2G0If1l7sHkNSTuqNQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=A-2iXewP5130HhseGiwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 78Bus_4i7f9i18wCwg5Kte8-6ccojuwv
X-Proofpoint-ORIG-GUID: 78Bus_4i7f9i18wCwg5Kte8-6ccojuwv
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 04, 2026 at 02:28:14AM +0000, Wentao Liang wrote:
> When the FLL is not already enabled, madera_fllhj_enable() takes a
> runtime PM reference and relies on madera_fllhj_disable() to drop it
> later. If madera_fllhj_apply() fails, the ENA bit is never set, so a
> subsequent disable sees no change and does not drop the reference,
> leaking it along with the device's active state.
> 
> Drop the reference on the failure path and skip waiting for a lock that
> will never be asserted.
> 
> Fixes: 6535e831b4c8 ("ASoC: cs47l92: Add codec driver for Cirrus Logic CS47L92")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
