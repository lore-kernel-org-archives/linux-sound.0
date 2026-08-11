Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F6429CE4;
	Tue, 11 Aug 2026 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450793; cv=fail; b=JoOcmFyBCDwQ/a0gbcrXUHGmTC/3uqFENgx+J9Fodad5RER3BOzkqri8o/VcWFuTby8TZmuzufLWFCS3I9xHG5KTeqpEP8UOWMAecsWzjoXkwaNrTJy8aMKus34FrYgldoECL8L9k5EVnEzLJtJCAOlR3QhfSjvKQRj9/zIRb54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450793; c=relaxed/simple;
	bh=qAIvKHDvMTlCo1JXcwji7bCrOZaALKIjX82i/2KsK04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7A+3AOnpSXo51hCocERnrpVUHMUKpEBU7gq++ip8SeGCP4L9Xks3ZD1JsRPo8N6kRKvVNdS7pQtAM+/7izhBYsvxGGEgM7mhrj6lV0gJaCdXIEme8MebTr/kNeyFnrQP2WkdQg3qBxq8h1xZ0gcB1ucuXF/zJBDjY99VZLhsJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SPzD5tOg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EeAgdHrk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SPzD5tOg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EeAgdHrk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B4f2L0315006;
	Tue, 11 Aug 2026 07:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=R7/eOPwE4IPlk6uwMj
	Rlt1ULQA7ltdKmGV01rwtmyAc=; b=SPzD5tOgPmzXj3qis1dPEi0KFEsraYZkgl
	aAUVbrdyJNOwy5w2DERwFdp5MY0JvNrwe51+BTlpMZlV3STcA4VKkXqBT1qdz7xw
	B693D2VURqHNWqTGrKEaZBPkVN9DyRG9waCQF/q8fHBNUvNJDMsv9yC0pGpE6lG9
	aDl2dsoZHknEdJ5WFjdlVeLpg0maRTjdWSNRWaCWgT/qVXvV19AGQAsRJK8ee1TW
	Yc7omxO8rvrGMYUfSp1Ox527/m466ENu7f71Smm5d/Y9U13+DxHm8c7utNQlYasp
	Cv3FBEss0bIv7NkYOgrA2VFrNBMA3ZprxCIfkd7LJhSBinbTA+kw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022100.outbound.protection.outlook.com [40.107.209.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg599m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 07:19:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRfuyEc/0P3g7l2/Fc79sQ5VsqUL6EUXILrcBClABZedcCEunPBhClgNpw2M2Y9mgqETzl/7UTl45EZ46CyqBmbD/PP6iAQEI3M037RSh8IuOp5L20WCeBKLLtcVgrJeHv6H/oxwzjdLXeXsv54XzEcWi87huIFeo9Qj/uOcZJdgP/cvdb0oqXZSp17y7/HpKkCmxqFBe3hSr+YGiY3D6UU7Q2RyO8GaHil/MzwY9uT9y9GSd/xVvNifQ0p0gEyhRt+0hzLYcsBXkHCBtPmxT+uwh8+Z6Mu+jhE9cDPnr3yteNa8F4KxnF4gxxEw8dHf28tksU0AbpXi2zdI9M0A1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7/eOPwE4IPlk6uwMjRlt1ULQA7ltdKmGV01rwtmyAc=;
 b=seTPlkVCowTrI3LpD1tQ4HQStCP536H4feNgWtZ4B2Et7B5Iom9EPkeDU20kyGg8u3V7QXWjNHBxV0dOTi/NAEwTDvy/b8vqhDXiA/Gx91EZbCOzno/Ln2GUdpS/uIUGufohL4UkAv4RdRmrTe7COzsb7nSpzH4i0+Z/JCRqR8q1/lRQIF2HnhwooGAi/EfCdcvgv3DzcP/4taJLFFOkLANCC9kJqd3mTbEHTzq4VUGw/sTx0tq2VDC6XSbj1+3oTkbg/QD/WXZJUZGslHiKKSsUbAk95jwmzLKQiysHLkM8fCvgsUf6/i3uz6aEPuM1ZLiCaSkXgO56tTkH9ETJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7/eOPwE4IPlk6uwMjRlt1ULQA7ltdKmGV01rwtmyAc=;
 b=EeAgdHrkuANbdWpELWnThAhA0bO/OxCtzuSye3mdK7YvV8V98oT01dSfDPT/5wi4SqUBtr5oBMokxdWywmP8Mfjz2ctVhkjytkeDSmCVKJ8rn1olEMiEX1ijsey7gLmPy70iA8jyOdLHyYbzUjwD0GNFDql6xG3ZrSEc6n2tdhI=
Received: from MN2PR22CA0007.namprd22.prod.outlook.com (2603:10b6:208:238::12)
 by MN0PR19MB6360.namprd19.prod.outlook.com (2603:10b6:208:3c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:19:11 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::2c) by MN2PR22CA0007.outlook.office365.com
 (2603:10b6:208:238::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 12:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 12:19:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D41C1406544;
	Tue, 11 Aug 2026 12:19:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B5DE382025A;
	Tue, 11 Aug 2026 12:19:09 +0000 (UTC)
Date: Tue, 11 Aug 2026 13:19:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Ville Saarinen <wiza@saarinenkoti.fi>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: tas2783: let regmap-sdw-mbq poll for deferred
 transactions
Message-ID: <ansTPGgVNoDJlA5r@opensource.cirrus.com>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
 <20260809101541.4969-2-wiza@saarinenkoti.fi>
 <413bdfd6-e0b6-4a64-9e60-cfe25ac684be@linux.dev>
 <51a70023-9eaf-4d50-8b87-60fdb73cf08a@saarinenkoti.fi>
 <b2ae6045-6f8c-431f-978c-63158d3a4e9d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2ae6045-6f8c-431f-978c-63158d3a4e9d@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MN0PR19MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 537c2c0b-f4b4-47b4-3772-08def7a2bffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|30052699003|376014|23010399003|61400799027|82310400026|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uP9eXt5m7Ls13QH49Vb55s6/Akd27l4S8vvaTye6cwVBnD2Q9D1jeoBV7i7iBqdTLlaedSUsPNjXXU1d2ocjKmVp51WJv8qQn8f9mMMKcErJMznL404uf7Ev/QyO36Wyr7qPdoW3IZnxJBHaUFerJKopLWxkCbIawqVpvpNZWsVRWAw6n5pxPuvZcMyxsJKARyuGif283gf1NvKiVVF+86MD7oi8Rpgwm+mMt8HSbNFjH+rMCK8sZ57yrN7NOGP/38hpSdV6PorTD3sXe0MI4m5dzkhdVKCtvBf3/lo0K+bh/Vwik5G0qbsjm2P8IzTAOruiPmsM36zH12LDQn3dbtOJhC3Ea4tdBMLgEVTGy5JKx5b9fWVyLsf4NA4iAYVCkUhM2OUMuOTAreIV7gcSmcfV8zi3Bp6y6+MXt2h901bMOUewlwaQU22zcUkzLlbhI8AXi2fA41hszd0940VflKluKmlv3IBHU1CdXgkvfLrP/jJcC4aBkRmxr6laOl6p4MJD5PupmQdR91b+wRrA9GDlNx7SZUsohscrQ3wE0nEARHz072XIJ8zZdJvyFUphoSLzzJeTkZ8IFWV4TeVmC8W+gQdWQg+g1pmPLlqtIfWnqEPZk7Q8E4w4mJW2zw145YltIeBuXat2rBwDg7LTSzW2plC1CdXB2L3pK8DhSbwYJ6o5tlUZnOQfjAMTewKAGhsTmaty4ZdvQgcoye0WMw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(30052699003)(376014)(23010399003)(61400799027)(82310400026)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8smTVK3z4ws/PuL3X6Qc4QRcmLnwXm3g48Ej7vy+kc6mcCTRZvrMlEsiZVXu25o84cmsy8uVoThQ8zdqJPiNU9cK0kkwHnlPXlAxielz6BDBns++vjf8InBBbONNu/tJhfSRlEt7dtfYtJz01woqRcWJbXB7C+c8uOHrJ/SGXpW7XHLYKNwaqdVWU0zSwBM0RYvEKC8uB1nQws01SJz1sRtoytJ6Yd2ZvR0QIAOfPye8jrDZWJdmQ2akZK37mb7TUGbUYJDlh07fPMR2blBcDg/g10oxdZUMPGaeFbjVnwjPqDidsNrZmfyE+YI+14NDByx0mPUn5HkVsjHddV2gbF//TOC1xvsMf8BN4jFuBWHpQvCWTQCR9u0dF1roMZj+6ETWE0vXAz+6l4N9plTdVuxy8tTgM1h5/MOker3IDGEKnJXyuQqcufvsXYVH8OU0
X-Exchange-RoutingPolicyChecked:
	b8xf/7sCyHnB38PMQHKzHXNC1Hayo5+NyOsQYObYE1D0CL1OuKESoXyzqtcRmbK4aQVNjUPRBOvNMuyFIZXadzyfiD5jkFAvax6J9XQfDsmqCGeqf1nqnvcFf12C6NIIiQXKAMkrp8uVrhowepMVpagifHuIB/pUN5hCqbMnGW0VawD1uw1wdJg6bZhRGBlNkwPpq22uvhr75x8EJmm7bMvC1uKBdvsTVYNkE3SuNjbeHqUbI2A6qYFGI6+vJ3a2euxKwJ7Tvz8E9hLW+RK9OPZBUKJ41w6tSBfeuimrwIaHy3I+AK1quCGVfd3pcIpaEiVi3aVK7eBRcIEmJp0ciA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:19:10.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 537c2c0b-f4b4-47b4-3772-08def7a2bffe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6360
X-Proofpoint-GUID: _YffGF-gmYG0akuubJSBaFlewKZ_QrDp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwMiBTYWx0ZWRfX+0vCYL/Mxy46
 TU5SsiqLesEIaQL42nFb072+RpkklDi3yOTc0HMoNhlJEQ87JSmB0Z0FAWBacFJfeHwy57Ulf35
 EiZkf9ItxuqE88ULYmPQkc2MuLPxTuE=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a7b1345 cx=c_pps
 a=GcMavwq5JhfCzntw+kKzBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=AYHF2rfYMLf4UFdXPz8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _YffGF-gmYG0akuubJSBaFlewKZ_QrDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwMiBTYWx0ZWRfXxK32cb95NPeJ
 GMx4kHPRIzGJBBaGR1xPB8ke1gFq5dpRjS9xXMndX7vaRAsZX+GNxFUUNEweX4ujfzX3DGIGL5s
 YZGo9KYc4BCfSAyuv7ZAMxe/fT0FrPxLTz1FG40UVjndvtgv7lMzBR9ivUhjR6QcQwPyIsq7YSd
 dcy2NvWkFel46pSWRn6Qxk5Lti5uC4uZKSHL0iKvFqPwyz+O3C1wVxI5xGhwF9unWZsMISSbDiF
 w0lpiN1lsopeAMq2Tpj/FfliLUtQURDwQkfFkKL/i10bFA8ZygjhqGNNwed0ob1Ar29obkdkly3
 nbdQIyXAMkVoyh3450fAjMoOwniGHbINMb2ZU9uUiwguQz6cHPJ4ptmbB9mLuXtInot5VyT28rq
 k0ADav7qC/bVOYJyRkKtl43lN9I3PAcefdvTu++8mNs6/D72I2JA7lHdgBIYbqlKbTIusE9RvN2
 ajMh3Ap/78AhLlV0NvQ==
X-Proofpoint-Spam-Reason: safe

On Sun, Aug 09, 2026 at 09:13:48PM +0200, Pierre-Louis Bossart wrote:
> 
> > Thanks for taking the time to review this. I am a bit of a kernel noob, 
> > but I completely agree with you and the spec: FUNCTION_STATUS cannot be 
> > deferred.
> > 
> > I think my commit message caused a misunderstanding. The patch doesn't 
> > defer the status read:
> > 
> > The hardware is actually returning COMMAND_IGNORED for the UDMPU23 
> > Cluster Index write, which is the only control tas2783_sdca_deferrable() 
> > flags as true.
> > 
> > I only added FUNCTION_STATUS to mbq_size to expose it to -> 
> > readable_reg(). Without that, regmap_sdw_mbq_poll_busy() considers the 
> > status register unreadable, skips checking the busy bit for the deferred 
> > UDMPU23 write, and instantly fails.
> 
> I think your patch exposes a problem in the initial implementation of
> regmap_sdw_mbq_poll_busy(). FUNCTION_STATUS is a readable register by
> default, not sure why we would ever need to test if it's readable.
> 
> Adding Charles for additional comments, this part looks questionable
> with a possible register side-effect.
> 
> reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(reg), 0,
> 		   SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
> 
> if (ctx->readable_reg(dev, reg)) { <<< are we testing the correct reg?

Yeah this is doing what is intended. I guess it is technically
not spec compliant to not have a readable Function Status but I
don't see the harm in supporting it here.

The patch here looks pretty good for the tas driver, it definitely
wants those timeouts and the function status should definitely be
added to the regmap. The bit about the timeouts being the wrong
way round is pretty concerning, will need to double check that but
will send a patch later today if that is true. Probably better
to patch the core and update this patch to use the corrected
core. I will look into that and get a patch out.

Thanks,
Charles
