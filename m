Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184245;
	b=ORkNsA36bC9FyDUh1SZX2xpJHnFoIhVySOTMbNq2LvqGGHhoh22k+dZ/vMtKxfhdzfLl
	 zxYBnu10vcd02fEhcycC7+VB4dU3NcCQajmTOem+7PUrq7ENhr77zh5UX9dpt5whq8DgJ
	 vouQDI/jXa9QDdrSDYyejhrTVSQx3azIPORNbGVh7Wi4afZz6pXd1x5B4oCXRCFcnk2La
	 /hdX5NQ7MXUlO1rozFwyrkCaHVIYfDsHtRyDj3WKOPYgU5wH3ri/eRPq9+IY5J7XJ2LNR
	 ug2GoAbfO9kr6NTXH0UDUKDMnbQPK31dBmNKINuljQ89BDB/eA5q8/neKlVdOTWL04w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=AgeBYxdappDDzd4LbPhp40dsXTI4194uFN57hoxwoVE=;
	b=EoTVWOu8yi3FabPDJ+rkCsAbf6kSa/khRfIqgtNENWoCVuOdnuv9VRKFn/Shi26jcyxU
	 Va8NLg+medSz3btB7vFJzmyDaHxa+ZqNPYJ4celdz3ce1dg2Z5LR05B3bkBEReFL/61/O
	 pzvgWxW9a7IqsbGcra7EUiCAT6tkzFYli7w3K4YcGwFqMfq9Qo5/yLnITIRsDaF+3ka5w
	 zMRZciPM95ZQW78Aos2r4D+LQuAKyCm5w3x7ApXieoyrCW6hrVuakGCME+ZMIHM90zamL
	 PPphMEqemKKO9at7Fnd1Zikpcbtk639n2e7Nh69PwfC70Lirsu5h6FEfSMu2Pjv5KDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="ian/9RqV";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=OBP61yLe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63116606A320;
	Fri, 20 Nov 2026 14:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63116606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ian/9RqV;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=OBP61yLe
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKDTE462885874;
	Fri, 20 Nov 2026 08:16:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AgeBYxdappDDzd4LbPhp40dsXTI4194uFN57hoxwoVE=; b=
	ian/9RqVrluZeucqoM5NT8ajTl8dSGG58TQUD9vnOlFkHF984owuF4wFThJ101CD
	C3i/V58VRe70qkxAFuLMZ5o4IiXpd54SbhVoHBsybRVbIS5W5rlMhNiFRq44/sOt
	TxKyc65AhXl1Hixn62NOSZUv2s/9c/ZrGGlYNLsI+AKOA/m5XLVUHEw0rfQuFrLF
	QmCXxQoXaMAPQlboCA9KAUsRiVG3jnkwnI1nJ3olDsDiF/DIuZikj06tjufS0y3P
	Uir7DDnJHmg8ILHxujEBlxFZZPS0PMsBWnSXD2wytd8/j/7bP5Jry9Mu+04CezaC
	CrJrznLYwa8kE1o4/jG3Qg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023084.outbound.protection.outlook.com [40.93.196.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhnd4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 08:16:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDnPPe0YJW6qL1s4uMAslor1m26tfDuM9lp4Rz5eVrP8LDVIrL9J+FwSaR8m+vOWVEzkLnk+INiaveInCk1YrYFnpaIrTVuvOojfAXOSxC3KsXIR6DPVQEpmbmo0/U96MYPtVMJT790JFMByaLTew7pJQNxobKl7f5Ki2A1NXxcKn27mEeuMoUcHRJcoIDsH30M8bvqY5bSQ8QIiyrQsfKHxFYmQu2ttbNRfSgGIQhwbkV8ycCBy5t86yjtim0qsrnnZ5y7jqCR+iZOr8iswqNgTj5nXY3tF+O3c1cMdKKN1iVI7xtC3BK4eLxjRFCUQsRG6Bga97tDd5uV1KIS9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgeBYxdappDDzd4LbPhp40dsXTI4194uFN57hoxwoVE=;
 b=SukwTlOyUkBdl+Ad/bhb7r+2nXSE6NgxCRjFncDI/BDn5Xv7qQ1tg8n/dRO5C5vNshsWKa9Gp1ZzaZCQ4mAkkALlrhjqCy/EgRRZISk7fyH6H0hmqgCrRcEFpi5yaLlVEY7fg+t38WArsXdxUg21PZCGqcnpnCM2Y0x3OW82I9NNE5QJlF5HfS96ggoUu0ulQwvF+k9mECy1uY2Ci+ctYT8TJF8JQfidKxhAG6mqZTLDvoEKXXcbLxE/LA+QhDxSPcGIq9GUEZlsRVYzcxNQrtl23UQizxxSgw6QKDN6+xRbyRugPh8tOLYQi6+vvDAdbqEsuv+4o79Eh6uLDYE+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgeBYxdappDDzd4LbPhp40dsXTI4194uFN57hoxwoVE=;
 b=OBP61yLekX5eHfesvo3huRM0aaHxyCfQYff56v8tGm6kn0Tu9yiiDNuVVKmvO4Pdq4c7Sin9s8IRn7qCXoeOKZ3G0Oex2RIlEfopIDqHWVkdVT0UN8u7CPj3sZ52d+bIBRTvkeXoUTfYnuzEncTmbqf9EnQ3xee3E5r/daxNpmA=
Received: from BYAPR07CA0081.namprd07.prod.outlook.com (2603:10b6:a03:60::44)
 by PH7PR19MB5487.namprd19.prod.outlook.com (2603:10b6:510:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 14:16:52 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::73) by BYAPR07CA0081.outlook.office365.com
 (2603:10b6:a03:60::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 14:16:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 14:16:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB4EF406545;
	Fri, 20 Nov 2026 14:16:48 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC4B6822549;
	Fri, 20 Nov 2026 14:16:48 +0000 (UTC)
Message-ID: <249f5a50ed481dc03a9f2617468136670898f9ee.camel@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Use Function Extension info for FDL
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 14:16:27 +0000
In-Reply-To: <av2D5PvUiopWIhFv@opensource.cirrus.com>
References: <20261117144853.2357660-1-mstrozek@opensource.cirrus.com>
	 <av2D5PvUiopWIhFv@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|PH7PR19MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a3e63e-388f-4f88-39da-08df4710ebaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|23010399003|82310400026|10067099003|4143699003|11063799006|56012099006|261021130227099003|261022115727099003|261021135927099003|261022113327099003|261022105027099003|261021123027099003|261022075727099003|261102123227099003|261021121427099003|261026121527099003|261026130827099003|261028144727099003|261026140227099003|16102099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Apct7fSTv8KRxV7koU2Up8boaUByP0URSP4mYNpm0yWcRUYFuoYwRFvnYsWtZAEARzAHpiVOIzDWDmA0CJYv99+RocQKbzhSCk7hfFoj9N/kHsThucrNGHtxl0EFq7mNOfKdqAgsYKji8XNixOfuK8Q2wdCQa2vRBAacO8c1GInyvy1uHxYVMPSYvXhKpMSDtZwvwZIMJjuZeZpa4Je8Pn8lUFr0tajjFKi9L/ffU1LDDNKV/EnVTdikRzXtufGv4GnA8HgJUBkQXrHd4G84xWCC80BIRe8LqtoBDy4h7evVnXj0zS+twxkbBilgUV/4Iibcxm43xPl7mSfSpG47NCUWhhBKesLvqNTFHtNUbq4jB3dqt/SJeA30FJ0t9P9xQTDUl9Upl5uR8rVGq7/psTldnXzOKBLWoz8kCigKfFo27OLAdB+xTPYX63PIZLQlATgE/t0oxjTpZi0bVExu8BnXas7G5r4wcE+i1mQudBhtjt28s57LCkzJyVeZvgV4LimJZ5aLkFxnOz05WDXp0NuHHf6+T3rh2OFIUIh9JusejITws7fLwnWOEurvVQnopH9xvvsaW/1rIpjokztx4oDtQTDIne/TyCNlJ8f/gdDjvHT/CQXG4e2ssIEPot6871TdaoCvO7lh8WdI6PvYXlNQmEDqhg3XXtAEBx1bmeXOSBTSGpgHMegF6e6hVb5axOXPSDzMfA3GHPeVtcIEyQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(4143699003)(11063799006)(56012099006)(261021130227099003)(261022115727099003)(261021135927099003)(261022113327099003)(261022105027099003)(261021123027099003)(261022075727099003)(261102123227099003)(261021121427099003)(261026121527099003)(261026130827099003)(261028144727099003)(261026140227099003)(16102099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iKHI5niEV3o0aWcr9o1Px8sHr8D8HFl/a2l4h4lMbbVBmEo/nlEUn5e3Riqlir8GRb2njNsP9dmKGGW3mjoSxEoBN00H0+/wQRE7ez7Q/RTEgTMPB93mgw27hyBu74ZEwXfxggPMh5WZO80MK5InR1t3xUmxfe6y3z9iB0ECPhnFYd3lbShaSBgFUQGOqlzELL1ICmf4qpZ3BNeUn7T/JoHe2m6/smn0uzSBtXpJd7sjhrjMSkWs0KaXwFJKpKG26qCHeSJZSqBMADqtsuXigk3PxFmByBGvAok2N6OtioWArEAbGBrIXg6FSRTC5xL+UoOirO9VQSpxMU9Nqd1pdGGWAWEoVSQhbBU5XwKMQragLnQbXpscjL553xyBG+V74PS21Gf1BkpN+7HJtvFOV6MzRqFMl3fyPrumxmTy9WHZNTsDPOEWkBsUYRJ7EL14
X-Exchange-RoutingPolicyChecked:
	ced4pMHkXnTKMZPyXHSZU+gK7P+LqBxt9RHoHqUb1WaOuORPdhy9ZdmSHZo5vGrqEjAcN2ZmXCosw3ZeC3kvuUgl/7kLVixEqF5C42lNgeStRAIIdY9DKFrsC9DBhuD0szngnLRnQlVeBwRiLQexseVPBbwZa2afCCO4VeD0m+6Hfmc2S338dEkYhTf5A2gaeag9T7EqvMxuVXcL/3T/354XYL6jPItDYHCjr9jo7wH1iskfPi9Z5DVh/+KDxQKoYpNZ8CePQ54c3oOvnvouBSZmpcjLkNhakrAFd75vh1BsfjSYX7IMCLb2bukhA3nal5Mk115yvumey0fxDcJf1g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 14:16:50.5909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a3e63e-388f-4f88-39da-08df4710ebaf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5487
X-Proofpoint-GUID: RJ0RqAF9Pry3bKG5pzhRs67nXCXWONhv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NiBTYWx0ZWRfX7iTDotOoX4JD
 LsHC3UUckXqiINN5dpeVFqgSIqBHCD/1CcIst9bNKgjgOw5FUR/QvlPYpMtcuvIgSp+eiw1h0/O
 q9FOKvr2m57A3Xo9M+ouslcCbo2pkk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NiBTYWx0ZWRfX2UPM9UwyzAbD
 /ccHK5sHdV8UWnHKqlVt9a4b7BcRouATWAAT2nKvnWQq9WOZ9t54o3pEAA62XkemDzXTNz3QF0/
 iH7F2KmvO0LoZKMW203I7IL+N94X7pCNQGvm2SCqCMHMpOBT4HfUmj2zTNpMr4zwKqqpyyCsTdv
 l/PR/9gIQ5GR8hR1hfqopy8vHLKOoOrKy5mkb3crPFmjomOaH03ThrywIn2MXCkvIjG5h1BVmvC
 kSm5IQvtuasbHZWBHagIBGFye1qBlm8LD+2v92hxHnZLze2v+IwqTpMD2Dw94PrKedjrWhgtXDI
 PEm5mcgBJmUj5YKacZ6VHqOAHJU1PTbEWrFcgi/cX39w5BTSe4TPygsKgC646cMh7OBjYv/Wh2+
 NRL5yBDhvCcwMMQ+ZyP0htItszu7KRb7FCtuHfyOQc3Q/4OX6s3TfOEuK0AdcKzpENYU1bv3UA6
 /YP+M07jEXKxGHaxCRw==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b00565a cx=c_pps
 a=V/GvUwJ+4XAyQQCxxnOR+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=LKGN4hsmrryXVENZmL4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: RJ0RqAF9Pry3bKG5pzhRs67nXCXWONhv
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu =C5=9Bro, 18.11.2026 o=C2=A0godzinie 10=E2=88=B654=E2=80=89+000=
0, u=C5=BCytkownik Charles
Keepax napisa=C5=82:
> On Tue, Nov 17, 2026 at 02:48:53PM +0000, Maciej Strozek wrote:
> >=20
> > - disk_filename =3D fdl_get_sku_filename(dev, fdl_file);
> > - if (!disk_filename)
> > - return -ENOMEM;
> > + ret =3D fdl_get_sku_filename(interrupt, fdl_file,
> > + =C2=A0=C2=A0 &disk_filename, &fallback_filename);
> > + if (ret)
> > + return ret;
> > =C2=A0
> > =C2=A0 dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
>=20
> We should probably drop these FDL disk filename prints since the
> filename is now printed through source anyway.
> >=20
Yes, in case it finds the file, but I think it might be useful to know
what it attempted to read for debugging if it fails. Would moving those
prints inside the (!swf) case be better?
>=20
--=20
Regards,
Maciej
