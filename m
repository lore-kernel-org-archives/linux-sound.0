Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250D36F8F5;
	Thu, 30 Jul 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406868; cv=fail; b=nFtxEX4QZYb5+Zp6ydg4aZVqQezvswnYVtHsYrUgdujZKp56u9TJvXHDLtxarzX2oZrGoqU1Z4fxAIDZdsKkBacaV5vXVNSq8jbEYYJ/WFhiCJD7+Dx7b7bUXBp9WJeoBJXvE51VNk6libDAPbhkYyB+qUcyiWpIteGIFLMgu+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406868; c=relaxed/simple;
	bh=9L0+BlN8XNvR6KINKiYCelDVNwFjs0OFlpe4ifXxzvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSN4jSWNCMalEs8SVkl5GAeFF3q2mLyPkoQP6RDXMP6kGx7PS6pLTIWi5TBJOVhyX907/+E1v3LUmD0yLpILuxVsh7deeU7U9eDsS9GiFcnQ8vQcDlNz1twMIjSZy0I2m8NiWep/krooKHK4sc/4Th+ONoncna2M9tejVJb4w2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jdULrca9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uUNOC2fP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jdULrca9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uUNOC2fP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8p1Lf985167;
	Thu, 30 Jul 2026 05:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4T6TobA1jtBnNDOOed
	XjtXaFUntjKtls2FrhpmnqzvI=; b=jdULrca916DO1qONm7+GNoZk8ecgyPWy9S
	6UEaAacwRtsQicxX8wPdblw8uno0RMavGWryD+GIiH68Sb96JHAIu0oM4Am2izYk
	cccSDpDOVLiajgyalbgGJNwj1PRR9DVCnpQqE/fCS63D0JyfOD1YUuPUwcY6DIu6
	oZN542DfkhAEe0jzzE8a2I0VZlnwY3sAje39jqnI1+e+7DUOUMXZlv3fYjugf8yK
	Gl2rNJR1apeCTBjgmppLplpEoy9m54yZsIimfKiTJ6Fr01tbhX+h6p5xlLrZ11za
	6kQIe7iUGGQz824bROSOIWZc7lVQtR+Mc9TgF63Ai9IE8mTg8zBQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020087.outbound.protection.outlook.com [52.101.61.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3f9r37v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 05:20:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSuw/kpdxaIwVKvD+7UFkhiIOuZndU8LlfnTmAmM45EvATbx7DUp9dwfjBZ1SaUWBQyyCEYSukwiicRXb8X9Pd/W7EhPwKcjJpYfdoS84oME5HDHuf4PmYDvj81uJ46Q0nPSK1dwWUVVK26E7rg0AIed+roEy7/Op9AOfoFm3imBkKhrVROoqAe2u/LlRfuO1axq8XlKeVTJT6/G1ghbrBJpzfg9ceEcT79nFxTVGMUx4ZF6TI2nHCVS7VevW3RBZZNOmx9PgtJPqmf49MDFrABUJ4DshGShpq2b9VxN2ssVXlAPfIbRmdiXxxTxkHLFU0GlgFV18rVPFBLOhM2ICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T6TobA1jtBnNDOOedXjtXaFUntjKtls2FrhpmnqzvI=;
 b=EkWfxuGjQcHFx/Aj+6iA2WxrG+Qd81rBuah+YKN+0vAgLSqvhgVAeXsJC0iGc/oAMK9M/oEzj51RNkF35C6dC2E03SeYwHWxF+Mg4oP31Lmvaw5MV5rYYPuwuZF5F7xvj/h72ZgZURy2bfTCG++nZYgjAQqiZkwTCKFszl/JM1j1EZsN8bo6nAAlxeqKgbwvE0ZSM9VuTuBnWTEvDmoCOHdSb3ZNDuA6tfsc7FtU1MOjbIgbru3kWEZr1rAduAWwNq7d7AjorOqSKim/1EiJ23aL77Sw4eDErmHBOcjkeMuqANsX0skq4Kd+2ajoSj/RwPmqLhCNHqxQRowB7W2slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T6TobA1jtBnNDOOedXjtXaFUntjKtls2FrhpmnqzvI=;
 b=uUNOC2fPq0S3i5N8rrjJNiZYQpDg5JSCwkW1cfzxCG7D4Z/oZdPvrvQlb/PZr6lQib3SIZ+4LscAPsVIsKjASiGFPcDHVGbXa/j//XzMdV5Ji6zo8pEP2K5t5FMXQoElPrSryn3N/fezL5G8Ha3aVRhFfArpiaKIAkwrw8RMymY=
Received: from SJ2P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::12)
 by SA1PR19MB6599.namprd19.prod.outlook.com (2603:10b6:806:253::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:20:39 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:5db:cafe::30) by SJ2P221CA0002.outlook.office365.com
 (2603:10b6:a03:5db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 10:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:20:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B37F406541;
	Thu, 30 Jul 2026 10:20:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7735682025A;
	Thu, 30 Jul 2026 10:20:37 +0000 (UTC)
Date: Thu, 30 Jul 2026 11:20:36 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
Message-ID: <amsldHHER2lRaoqf@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <cedd89d4-28ec-4a86-99ab-249637d81736@kernel.org>
 <amsUlWAueA51eSDC@opensource.cirrus.com>
 <ec991e49-c23a-4c11-b0bb-32c12c427eee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec991e49-c23a-4c11-b0bb-32c12c427eee@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA1PR19MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3047521b-351e-4fde-f3b5-08deee243407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|61400799027|4143699003|56012099006|11063799006|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xfJ9NzNOAB642642qSfpjKhVVseRGqvVkI7+CiStYMo9LxJomSF4XI036S8seHEJVCcWkSCLIi+lHC4KTdR2O0WPGR1qsX2Z7kF1Cd5uptnnBKPBMq17h/G6Nep/47eD82HnJDqcpFGjRsMBslJ5zv8JEHQ6XGXKSD+tZysfP/zy283Ahuiwb2XMJg6DbXqBhVwIdflhOjEHOP0F3BV7/5ZzFEdFpi0sbF3jnPvGTZoSMOxfGJDhXEb8cc6Zz7DlpE4VrnfRDF7IIs8e5bKarL4ahb71UPPUsMzyt4lzx5kxMOHnTh2HisQEgbEu074YoWhHb6acrblwPjiLvrNfR+iBWWnCTTgiIgCRNEhKy4P4HDzzqAG3xJfcuLqyNI9oZChM+cTKxpBXYtaNxmxNsFyV2jCyicsmPm5lDncDvPaCjhutVTgM9W5EAMVnnSGjoUkBiPf5FYLR+Y/Yxjmq/RvPKPRUQiTagwniD6ph6qMOfXrdyLcZtVshOuUEMINGerdzTx+j4ZsCQNNZK4lC+wIPp3r9/Ut/oGabXeQL2RtFsd3kpcJQ/96pdP/oUJt1TgwIvdxIoeRricZIkecYPDz+00oQlz7KO8Z8TcY22cnGEmxc8NoD1bxvSDlCebiivzLxBC2pn0/fUf1w3ujhkUZb4BqI2mc1H6ia2zf2oScasipEsuz3KLUK3tTCAL2wczggOxanKTM6IcT4wcfXVg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(61400799027)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A2Lzi1pPwYD4bXLAyRhqMTjdncqvHPfYKpIRiNfIb1IIzF85aHpRPvVQrdo/OnAjKkLkOPGdqcs2MdyPWWQ2frA5ZlJwCMwcdkST1ZmtZ6jPsz8SaMEgUsq11WUBWxOSpy5J1CM0QBwiVOprRuGhMfAKPiU/WM8n438MDjPxH5Q+qQDiR6JasYGCVvsqDv8bYVSFl8PXYIYxGDjEna3y0OTNbqvloa5FaDohl86n5VrQluCfxLRXASTNWcxW9+ckXqDGFSuK8z4OlbX8ZP1EQ8sJi9KHpU80eX0OnTcvKqQCLTYZfLGPUZLvNGpIHikzEJiy8LoNm0ytfIMDyOEVVAHMSOTpROysmnnHWNinYp1JxZfLXxBfYA1SNrFUTwwqVedttdj751nsjI1+GB/Kvy80q7sP5wSPBsN77MllrI1B5MCrI/43Bref/fHEBsyn
X-Exchange-RoutingPolicyChecked:
	WwHfICx8ull/mOyZvm6W2iXuNFZCPxhOAGRBdcJNKZ5T106VTeT6qvxgnJ2y94XTheNZUPEtnlLZT69tuOt3xd597xd2ZiRmPhqZ/c+bjn3UhZG01Csm/CWp9vQMa8aalFzvZyfru749BIun/ktR8UV0DgjaRUP9u2bcvC5Kkt+dzwvEleggW5Nnyed/aj4LrLEspM+kKMhR7FZdlgWXYxfMBcetX/8JUMTJI5yT27WNpT5VPG7rxL5DtDAglnLbsIiOAL3vT7mXxkkEGfV/DcqFG4wt4NGANSRSSe13p2i363557UxXsXLGoGk5zXzkOWCSQVLO5en4VJPDO2m2Pg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:20:38.9141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3047521b-351e-4fde-f3b5-08deee243407
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NyBTYWx0ZWRfX8W5cMM4Q28bD
 kzvGCLpN4xN87JI1FVwf+aHxTHX83razqOd5bQ1iv7b4/KS4rrmb3xx3R74Qu7xPEvWjLPhJJj6
 CuwzpWNRS0x2I9QOo6KBP0VP5a94XJIST1tlFzmP7wglnXJDOcQOeZ8jngbxMr0AcjODGXU0POs
 IosGv/Nuogvp3R08dWRkUC4uwmbzcF2kTICsgW0DDAwL00EHRztsnV+Mb7tpXyD19nWNgQWyKt/
 WKusHAV2xtlo1SPujFZ3F8nV0QKaN8Zop5UCwpFDCE9ZERPsIos3OF/332kcoCaZg/K24wbv4yZ
 VeuAOOQMTi0swo59T6D4sVtf3clDYyVJTGs3dNmCtxZQrq/RpyHg/qArQpkdQNveqTRUbPdDha1
 EnNxd64dL3QxMGSdSJJcerV2EV+gTpr4YaWsMXUPFmAHckmBd20zrUgUmoEK9tzWWZj/N7xqY18
 CkFk8MiAD9EIC7mC4FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NyBTYWx0ZWRfX5X0RNGcgNE95
 It9OxJoBKcHrkGzqLs4ZM7c1PPGRR7fNmIsvKrjuM5jv8J7+TBUuit/u75Fpy2ZLhH4uPBjepf2
 hP3nO/m6PeLaa+YvA1DdOZXxfxfycMo=
X-Proofpoint-ORIG-GUID: gQ7Bh80D7gZxpmRZqqwAzoCe0dq_WAwx
X-Authority-Analysis: v=2.4 cv=OOIXGyaB c=1 sm=1 tr=0 ts=6a6b257b cx=c_pps
 a=uUOONCeAppmmVOxUvBiRog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=X4girxIxmzGjDV-CX7UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: gQ7Bh80D7gZxpmRZqqwAzoCe0dq_WAwx
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 30, 2026 at 11:11:41AM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2026 11:08, Charles Keepax wrote:
> > On Wed, Jul 29, 2026 at 01:41:57PM +0200, Krzysztof Kozlowski wrote:
> >> On 23/07/2026 12:17, Charles Keepax wrote:
> >>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> > Do we really want to take this line? It basically forces us to
> > do "board files" again, which is the problem DT was solving in
> 
> Again? We since long, long, long do board files and they are approved.
> Although now they are called software nodes, but same stuff.

I have mostly seen those used for work arounds where the device
firmware is wrong or missing information. I am not sure I have
seen the sort of extensive use you are suggesting here?

> > the first place. I can't speak for Qualcomm, but at least for
> > our devices the SDCA properties can change a fair amount
> > between different laptops.
> 
> Sure, all properties which are not implied by compatible make sense for DT.

This is likely to be a very fluid set of things, at absolute
best maybe a super set is implied by the compatible but most of
properties can and will be tweaked per SKU.

There are also still plenty of advantages to the things that
are implied by the compatible being in the firmware. One of the
useful features of SDCA is that new hardware could be supported
without needing kernel updates (admittedly we are not quite
there yet on the Linux side but that is still the direction/goal).

> > Also there is the fact SDCA is already a thing and is gaining a
> > fair amount of traction pushing against it does really feel like
> > it is just making life much harder for ourselves.
> 
> I do not understand this comment. I am not pushing against SDCA. I am
> giving you guideline what can go to DT. Are you saying that SDCA somehow
> received review/approval of DT maintainers, so that we are bound by it now?

Obviously not, you guys are the maintainers and thus free to
merge/reject whatever you want. I am just highlighting the
reality that SDCA is now a widely adopted specification and
trying to steer the DT implementation in a direction that bears
no resemblence to that specification is going to be much harder
for everyone involved, likely including DT maintainers.

Thanks,
Charles
