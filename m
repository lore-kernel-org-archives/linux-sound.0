Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960C471263;
	Wed,  5 Aug 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935974; cv=fail; b=SZVzsez4jeAccSEVqg4tGDR2HNWTg5J3ocGRzTz18TfnBjov3VdNhYu5qWuy173fnbWnFirlKkxPM9+tJAe7liiPDu6GqibsCgQfsiv6KQgw3Hm7FiACNbADKvCcVErx3hC5EYikVWcyHeLubdvYfWG7tW5dmJLUSHPRZ2J40jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935974; c=relaxed/simple;
	bh=mzKZTEWTXZmmwdL8Fa22oT5gQ/OyXNsDTTaSv0VMO+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLzRLUJDUBE+iDHtd3JRY2V0gCbX7vTPNTu9QE9kkVzCimagRpcuYL3DBVL6VswzE4Hd1+bT3IGMyJl+4RAjP0tfMQdoANfJ24dP6GdVMFWSJdQT16zrdHmMPyB7r4yAWTxayL8fn4mGeuF9t380OeuEZWSjwtp/XwQ67NF8GLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VQeR3/zJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uNaJNqoB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VQeR3/zJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uNaJNqoB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NPT6A2014368;
	Wed, 5 Aug 2026 08:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9cOM0gxnbr59Gt12Ao
	OCaecsP3uaVK8tIS2YmWac+Mk=; b=VQeR3/zJNjERE/glud/BzIX0BjceneIKpW
	6CW7F6/7SErhQJhTa40XUZrDhaZSmdCU+/mKQ0e5aqGxxn3nrwwSWw3chR/zazfd
	u7dliAYl04L85WCS8NpHGF1gJ5YvMpC5TgKt4c74yZdqxGo1hDTWGXMp+nPZGISw
	SFeFG8EHoqbOghX71wsEiz3aP6IJXXceQJi1tZlNbyeGcnFcIG8o36iVaD4nHD+h
	aFByfyujx24sr/VsQMRlIYOroLNPec+z4Xkib63062fR3n3d7Lo5DpDu9/cTxwJB
	t18PO6bBI5Tte4iDlGmf+P1gsd+ag6WwNoW7FeN7OjFLD83RvUBw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020105.outbound.protection.outlook.com [52.101.61.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5rjp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 08:19:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEhib0dgzKZnoa+VwB9LNORNQ7DQ7IfBWiIggTVSBWgqnxiPAwDQ2YH/evr1tmCX+QENkZ7RPRdfOYlwja3Mk+mezlwQFW99B+AeZrS/V26SAfDqY/xwIQxk+kXqi/L+R0IfR/JxVntTckBv0BBdOAClynLj6SEYCnJWPOdDFbs6nY6SdIV34MSgqRF/N4TG5qYn0hyqv+jMsCfJbDwPL4r3SkI15CKRG5Y8745kkdw0KzhaquHmNSRggyX6BjI4BVWomOUoqEju330W7ObpQnNOcihSyyXwgXnO+fNLpgw4vwXRCxkOmYDSX9ghu8OHT3tV2mkSa49KW6Cnlgnj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cOM0gxnbr59Gt12AoOCaecsP3uaVK8tIS2YmWac+Mk=;
 b=nz0OSrAU70Bps4FoKe06s8iy5TqzOP7T+5XLVnklJvaJZYtu3yqzL9y7uJ55XYGJa5tgeKTh5/gDUVNz6PTLXykkq9MI2fqq2DXTrHRHn5NZieMW4qDT1EJTqKEWVGTNrvvEIzHi1lTHPNW3HwFHTs58/aXDOO2SKdqMEyfEq6QOuVahoXY7qgmSgSu5DU3u9dfSFfQrGrK6rVGR8kK1AVMFynyjBVxQLtkacqddMA/VM5oGRBfrsFnLCy0TK7WiowIoPYP3sWaP1j1py7CQE6WRfLdayEu0rrtpay2yrqbrxokYd1HaJO38AaBcG6Ul9yQ0fFZg95EN4czeadfW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cOM0gxnbr59Gt12AoOCaecsP3uaVK8tIS2YmWac+Mk=;
 b=uNaJNqoBznsDq0YXWa0GxjrNA5kH5UYQP7K1bXlZnwZhr8PM6rmHpGG4xDLzjotCn16XmP1fI1Sm+pWdUfuIB4BDFVOvqco7bh10k7mRDlaH6cxfyPtXtt0EZ6OQ9Ls7OMHfNmRXtSzTp7zG4om0QJ7OIevFCLp7lf8KlYC8Q7Q=
Received: from CH2PR16CA0025.namprd16.prod.outlook.com (2603:10b6:610:50::35)
 by PH0PR19MB5460.namprd19.prod.outlook.com (2603:10b6:510:ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 13:19:22 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::77) by CH2PR16CA0025.outlook.office365.com
 (2603:10b6:610:50::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 13:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 13:19:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 81E44406544;
	Wed,  5 Aug 2026 13:19:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 687F182025A;
	Wed,  5 Aug 2026 13:19:20 +0000 (UTC)
Date: Wed, 5 Aug 2026 14:19:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44
 variant
Message-ID: <anM4V7rxmAfjJDbM@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708140039.1993489-2-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH0PR19MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b43b58-988f-43f9-8482-08def2f4299b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|61400799027|82310400026|10067099003|11063799006|56012099006|4143699003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hytY9tJQ+I/XaAV8LctXiJhz42BX6TZar8GzQMrsrGS5XivCcvwZtsANaq0D4lgzJIb+aIPqn/4egezSUciqLs+rvtKr0gmsWGaMZuTLPsM36Lxxjf3PMpVZ2TbdNw40ggzIw0DRxPnxHn0zGhXnctvwEfnPwYJPLXyw+dN4mLIGfSxIkyQEMIvD82ugOskJ7r5fQiA0wqCUZc+4zQGeKjYsQ6PWofNyBFSXq1X4IuhoYgva56k9IB4lu6AaFOQM+n3aQSpPC2Jvb1tX9mWRTu8sU2M3HheX1KWjbedxFwKGh+LeyJQVXWPIV/vbu3lrASWvfPyXv2yYkBmtbSZR+GMLxiG6QrIKgN/QcHtoGsLfQOjRW7B33Sohp+dQE3Ie3LTpKqnRdrOaLzmhmghJZBhHwgZvWF+jTFOFWlvvuyiYaxkQl4uMwAPdZpLxSpTr2QvvAgl6MnSxXG7jatUx7KTbi/HMGLc6z0KHgsKYvCkK6TV2SBOqoFM68+r9Ms7H5pVvEBgqRtGhyRYNA7UE5llCmfNLsmqddolbCiOwwO4X9hlZ6dvzKirghSY83KDSEc/4CMX/7vF5brQ3HzuUuiX6/cVXaDvUQPwwqCJgwSJ/uT1R3eakEltJCRg93cUADliDmNUi1UjH8ezHAakB/aMpj4HTpnDYjD7+Kj+MzVqJmOBSS9xNnEGiITTN6JGxzDLNnHgRVBQa9+A8/qWIqw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(4143699003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	El9K/ZN492X0g6MtdLCSAj7SgoiP7xT78i0giYLcY3O1ETfOnq34584JiutTAZywwsO/iVwk6ri7THC2W3DR3hT52flb0sV5aWK83o0jMepmCG+wh/vF1fGwH39kzIVfizOH3ZtPD0CdY284q64wrrvYvrYp+xMBPk00jjnjY0aqhfg/X8Y6Fs2q0Ogb5wshq7vn+P2Z3AIdXcua2bKyenighNJnr0bLyx8C8bxMxDyk8ECUTKUEYFsAqhur7To85HhkPLj3V2MnqRhBKREo8vaxBFe2VZCOajWHY5e0i1rVt4YbIzFKEz1LuyAZ5Y54i+bc8TsQpIOAn6akwBRBIb5WKclEbGdTdRD85G9NOaAiShfQ09YB27uFWPT266NA8ZvTdngRkipCs351sJtu7HMz7vOij4KcNuLgXky8ad9OnRb7F6Nzsw/QNwJUi5Dw
X-Exchange-RoutingPolicyChecked:
	iN+gPm+1GPlJ3toj74+W/j2HaFD3xThkLOjKCUn5x+LvtFMUOgASN8eIxPk4853EkwWv9Augv2CB3W2gqpO1sqHANVVviYZz5bbwoKZJAl845rZygc1eINZ1jhf6tiDtEmCH21mkeB3X71nTsfIHKeCDX/q6xpg8FuZYkMX6GbfYjYb/ekypEBbWnoXLRarX0+rDE6p5ylqErSUZccdMYvxcsAT58Xix8dAp24BvXc8i9ZDoYemPK0vaiVWtPJvuLfil/OqGu0RqZgqNj3Vi64/n5+QEA7TOAJkLYu3z4izTWCtKKUasPhcNu+7VepxvaR10EivXEAQcg83WG63Ifw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:19:21.4871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b43b58-988f-43f9-8482-08def2f4299b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5460
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a733862 cx=c_pps
 a=SfbXOumlQYQ7ptoTXzRROw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Rg4ejjFovljLIydp3aIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: _OA0frSHb2C3nWeguawl5kL4mRPTG_h2
X-Proofpoint-ORIG-GUID: _OA0frSHb2C3nWeguawl5kL4mRPTG_h2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwNyBTYWx0ZWRfXzaH0WS9Ij7ZE
 X8eQLFo15hJQBUywcwm4o03Oj6nCBamcdP1byTeg7bRNMc94v4+uxKX/QE538UJbywOGS6Zs3w3
 xyvOem0tTcm5dpIHeXUlBDw1b2N89COV9J4bWlUa2uol5wNWJqKQqlEOmqq5+igYLSoWwYbgaQT
 rsMxIst3r+hCyT1Js4olckoLLJyaGBpe+6XV1SBVj67zJ1+bLsZstR7wVzvAIMoLoCGX7645sC0
 Zdz+RlKG0L8av/bnzZQSLBCHlJPjLPrellciH/hISIEnexT3N+R57Czhw3HCqeAjuvdjTnkn4jm
 F5m/f03ebp6/OJRWEgYB/vy2aJ2LaLHj03UW37uup0qvy7hMpKz8fyJA/dqbVAqueNVe81LWGB+
 i7KvPvGRDu3WXtMxTtu91e0j2OTnM7dXhbx37SJ26Xiq6SvMoagTDcrMiDdlCwAEnr0c0wWMQT0
 2R1tDqcYy7UlelRlZkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwNyBTYWx0ZWRfX3MTa9TiYdhC/
 HOAtnpfxP/5vzAKNw8MBuo398Olw4WxSQaeZjZzDQj56De6CrzcQQktsvVvTINTDEdHFFlLb8ON
 +FxXTSxlPiy4wO1x2URleRzCNp4dYvk=
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 08, 2026 at 03:00:37PM +0100, Charles Keepax wrote:
> The cs42l44 is a cost optimised variant of cs42l43b.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Going to resend this one separately, there is no need to delay
the binding change whilst we sort out the device table conflicts,
the end result to the binding will not be affected.

Thanks,
Charles
