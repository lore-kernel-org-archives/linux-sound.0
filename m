Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEA25771
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728949; cv=fail; b=SkzhQjBmfsi8158KTIRUIyUe9XZ76Yt6kXQE+7HACsc+63W82yOFaBjccZpP0ahAmSzvaANa1Qmlpwu7G0PYQeEhMupATBlqltfLkAo33Ko7iEEiZtumgND9Y+xtesYvP6t/YgY7wS6KMM/n4Bf8E05pCz+57DPy7E7pFh2T5rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728949; c=relaxed/simple;
	bh=rxhAmw39kHaQsGT2DKQS9qLxqhH7zV3yo2yqvguNRjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzQJVOUGoNM89yCj2eS2i09MbgQybxQ9OUamWqgnnQa/qoD+UKaOftXI/b2kecMffF/kCjDq6uQvtA5/RwucfX35TiU82iy7PnGpcp0PzI5bWzzMh6XYU7zw+LX3JGgD2Aw9UctGI5BTATGXMyme5ETHvNGOrIZqQe/kXcqtkTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iGe4W7lT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CIO0Cq5R; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iGe4W7lT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CIO0Cq5R"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394temC3202967;
	Thu, 9 Apr 2026 05:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZIg5/KB6PEJDmVjsNF
	22mXLDXD9dTtOJ20Wtxta0bM8=; b=iGe4W7lTs2Tzx0OE9vVRLxLlHYRe+VpThQ
	YdKdk0i7mdsRhSxIgf6vwc2fn6+SSejycSwf1J9+Qm2ZVuncpSuDjOPWGB5eARQQ
	Fzra5JCe5fFNfanTSGTqm5jjVy+pyLFHyaKiQ9wtXoOaAm6BsMpi2xliY2VJNBSz
	MvS4biN3OpToVj+iEp32LtjZlvBlyKBes1zFMrgfn9JRqR2kfdJpyVXSiu844kbC
	ThxHUfno8duGF5yMsyks4Se0jjY7hW9bphMESbs+xOBUrNumzM72EMCe9f+lkQJB
	4KYtXG6m0mbu1O0TMZJTOfea95aXj9Ln6HMHGLcfUvrWFmmaUQ6A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020082.outbound.protection.outlook.com [52.101.61.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4uha3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 05:02:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/qh1oD3++IYRgnZGRrO8VW4VZSJeYJHB43td7mYa+pTHHTnirnoMl768EYCbqQj1yV92Urhp3R1Qu+hXQU81TjDOGHv+uynX283NKI9qR+AG5UPjJKvG2aGwgPfx4CecJPXTrJNcSV3DdKVLE2K4NJybq/JiDYyqrd0BYvZ0QpQt427QkQUHUjI6bv4a7q3PXPDzOp4zrL0BodZuVVfTFp2na6bS3ADeevO1v3OMU2LAgRxhLAX4Y2quuV/Kr9lub8/T4zRMZdiriS6fUFiGDTdE2MPen3Fhft1MwD538AjXEVMoZtUOOWzcf1usrjIwriJuMHONHeMPIVGANRMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIg5/KB6PEJDmVjsNF22mXLDXD9dTtOJ20Wtxta0bM8=;
 b=mxiRfm9O8rsEIlqYUk49zxzjobFQ+AKbdNkpzRXyG+kYFBBebyYbxJtwvOulKQtB/JEa/CzHm0gbeTuzfaQ7GajUXu6KQoOX0xlCMzkqOhy6Cgium4A79Z0rdRMCwYqSAvH94O9BYAcaoO1D5fJivuJVPNZc17zLaDiS6smAJ54LMpL100riWRoT6H1JH860kBZHCOSqHOflC9LzgtV1vHyltv+G6ckwcwsOVhSvpcVHx6WBiAZiyJ56XmuByM5ys8bXdXb/LdySaa7liQtIBUCJgtzcJMlIOGTrSvRSe1a2fMN8ilqpDwkRFZEJi6yToVJ57B4jZ2GGM4gwFRVNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=everest-semi.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIg5/KB6PEJDmVjsNF22mXLDXD9dTtOJ20Wtxta0bM8=;
 b=CIO0Cq5Rk2Zw3Gu5CAOZzor98QBLg2FkUlghcqdE3JR60ydKcqu/MwJhmfqxBJAGrvAPTKjSx6zdqBte/bejYWAqqL2ABDnboQki6u69VW82HoMdwHWVs9OxvZwalM3ukXRzYVJimjl2U9R38/eqUrXXauZdLFB7X3ROniV5HDU=
Received: from BN9PR03CA0082.namprd03.prod.outlook.com (2603:10b6:408:fc::27)
 by SJ4PPFB091189F4.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 10:01:56 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::c) by BN9PR03CA0082.outlook.office365.com
 (2603:10b6:408:fc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 10:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 10:01:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48842406540;
	Thu,  9 Apr 2026 10:01:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2983982024A;
	Thu,  9 Apr 2026 10:01:53 +0000 (UTC)
Date: Thu, 9 Apr 2026 11:01:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH v6 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <add5EKeUYvmN7syg@opensource.cirrus.com>
References: <20260409021255.1006-1-zhangyi@everest-semi.com>
 <20260409021255.1006-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409021255.1006-4-zhangyi@everest-semi.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SJ4PPFB091189F4:EE_
X-MS-Office365-Filtering-Correlation-Id: 7756c2e4-21c8-42df-18a3-08de961f07c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FBK1gLx+ueWdt6FtxcUrH8ADqqnvlJqgxpNECz+pUDdQ0Q2HA7/ri9UNNuUmRFxWay6bgpp12PSwHXlEz++QUofE990ocs3iV6sRauzI1+aEWFP2JCtPv40vU4QtVmBuYWvkpmZZbSmq94/weBjwNOpZ72OuvFF8GAoGftLb95UjMyHM6+Vj0nHCiLUjSCGrZIBC2S+sMesC86cAADeib+5EeEYXRGWicIfcyz5imMxLhI3jZQ5Wv133rJ8K205nKHqleFW6ZSYU4Fn6GA8NvTZM6LXBwcIkEJcMHNtHELpMYI7f4NEH/g3zJ5IwfRHQJQYczvqJ5/6cTmxWg8ymq79I2ENt7zbOYtCK5iMiRyiuPnPfZEmWIyGYpL+nNxflYRw1kZev7745DoOHOr/U8E2Dxnr/DEEdTHAVJpkBoqpEdeLAeYbdABJqbhlgpxZJpYZ8XgZ8OgUiMdIX54fTmJVHTF7sO8/8LJuiC+4xrnl/7b+x3T91WSnqT473mx+apkRyAy2qDrueapj7za+sxquIT1bp0bGRXVjZEHImcDetPVg/DzsTIT47h/+9EvOQo5gpPWmjxviT70Y7o2/t08W2P/xq/jgkwy83bENIGhkeiGagh7ZdldO8Amcf79KIfwituf6S/sfzKYP4onL9/VxdoNeKVyN3YMybiTsEP8pWX+pi+537QOtAJDS1LCutznl1aNq7oy7JNmHa9feC4PfG/uqILSMR8VyXfIH4MMdgvki+9WHB+sWsMImg+cOztHsmQ7GqiZDZBmULeWsj9w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3jpovk6cSRxbIrkeOdq+Q/nxXGrxdcTHn452qmoMmHImLwe+osdm3xIvknydaIvbjYj+cBE5YPO5HFLePA4N6cL9GOxswj3dr0cR9fW0JgQeJsEaEEHLNU7we8ypX30nelsGb/IKv2kycC9EgpRkA8aO7xW/JnEDtqI0gGz2EkJ/DhDJiUvn9G+p4TxmIW6NNRGNZTrm/0Xg9Hk1enCT3LVYbFwIhntXwqKbGKstG77hgfrXe6B0mA07gqJZofZ/+ToTqwTb/4N2iwngGYP4paX4bulWVJW6MBuo3bJgxGWzUzlgRM/Td6QZu84+9j9GhueQIx0gipyVLBCXfKj01C8im7APiWqdA4DnTpY+T+bY69EMQA+7GcU8ibkmHMnpX/6yAGkN5x+VUJswcqbJBdPC7KeGfXRpf/2pmNWGwlFHpp9jKhLA6czEyTRlzNlD
X-Exchange-RoutingPolicyChecked:
	TSrkGaMog+1nkpe8gshH5nXMPYW/BdB7tpDoKASgCdt7wi60UvyLMG4CrDIwIwfiz0gZ7Yn/KNvejT4EJY3jWfNPnq5Wf9LquA3/WsLJW8C/KPXgdUNb93gKDStiJcJWGfdPeJiwnjzwOlfQArpdDLX/ccxI7xd9gCvzM5L5M3oTu410AvwsJCP8RhPAZRXa88MOXQVrTu0clLquti+Ah2q9RhVGqlldDFfnQcVr+9KCSbtq8rdeYgLLsXBRcCVj8LuyGN1PkNnXLPVAvNwtiWrBBLW5p0LAeMV/Gy69K6CuOdv6UAPQrEb0hgHBkir0qUKgmn0BI0haaTXWc3O5sA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:01:54.9238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7756c2e4-21c8-42df-18a3-08de961f07c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFB091189F4
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d77919 cx=c_pps
 a=sUOy6JvimZSrMHJk9FBmuw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=tdWpEtAxAAAA:8 a=fDzDraiWmf86uRmlBcgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=jllm_RjNYhQZp96B3cJE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4OSBTYWx0ZWRfX1gkEAr5CS7QU
 glbWZbr3HAFrNeCRcCNPxHa3p0CkSjTq3cZv25Y1i+ORO/qZvJNK2SOsnH2a/4hgMrBX7TUn/cN
 4l0N7j2jbEUJ7c/KZQDrvaS5/Wyt4BMVd+orwI+K918SF92YqSvUnKvxokbE4pxVtnCUMF4oBo1
 +mcQC0HKsy2wKdRMK+bQ8x46JuM3KQOL+mZaBUnjwdadEWd185BHe5wsMUdp4lk9AGyl6QP4v1P
 dPr/YeheJV8aM9yCyaE/MLtDRhxn+oDY3oMI955Uct5jKxofcJDJXzo2Ji2waAZwxc5Raa11tg8
 ZpBr9UsyjrvlAa7nbULx0kpoYXjUK4qk5M+5cQ7axczUnfoAcueGy1BJIfsWBIeoe8P3TZw3SIu
 JW+GVQEQfH0BBZAUwCMfmednyUgNQq3Hw26SdUxZ3dGQxMrsAMW4lgwygFpyU2wtUXcTuOg37Cg
 qaivRpWX5Bubo1GH2MA==
X-Proofpoint-GUID: -N1Xz4oqZapo8dmKRCkGFIjzeDxD4mM_
X-Proofpoint-ORIG-GUID: -N1Xz4oqZapo8dmKRCkGFIjzeDxD4mM_
X-Proofpoint-Spam-Reason: safe

On Thu, Apr 09, 2026 at 10:12:53AM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
> +
> +#define SOC_SINGLE_Q78_TLV(xname, xreg, xmin, xmax, xshift, tlv_array) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
> +	.name = xname, \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw, .get = sdca_asoc_q78_get_volsw, .put = sdca_asoc_q78_put_volsw, \
> +	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> +		.reg = (xreg), .rreg = (xreg), \
> +		.min = (xmin), .max = (xmax), \
> +		.platform_max = xmax - xmin, \
> +		.shift = xshift, .rshift = xshift,\
> +		.sign_bit = 15 \
> +	} \
> +}

Use SDCA_SINGLE_Q78_TLV from include/sound/sdca_asoc.h

Thanks,
Charles
