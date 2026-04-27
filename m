Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88B3A0E94;
	Mon, 27 Apr 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279715; cv=fail; b=tvRJHHUelKd5TdxC929xhbMtOiUurnhxNpgQgByAUdNIS32c0Kf0YHzsjngoM1pGV4k1kE2BO08Afv5ERCh2Yf7BNKLSvi+CDKrgtCHLreQHJse5Gb0Mwpifo583+qR1xF4+XRTryK75rl5td4OOt3Mxt2+syrV6mXvJf69ZtX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279715; c=relaxed/simple;
	bh=0rNjbWqFEVyGwWhUV5HEMXahgGW9zYsypbVriDxYxmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRni7aJU9y2bEMmjQ9Oha1qwq4xQEm74EDYYl1cI5Yfu0gOUokQ7NZRokwZSl/6eAVT5PmDtUpULTffQesyDrucG+Y8207dgyNVj7jKH6gB/f5rT0UKMVIK/1rnVnDnjHuBvp25Jk3J++6eo8JlDrUq2V2KKgbkgOJwciiK9jHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n4fTxyxi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y+heq+c6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n4fTxyxi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y+heq+c6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3hwPu1793656;
	Mon, 27 Apr 2026 03:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ni+UBGsm1xEp4G9HBi
	mbRqSB610lnR0mvePjuw8UF34=; b=n4fTxyxiYZiG7mA6Sb9gwymw57J4nTsJiR
	cds+pk8wipe1E0kCcO5VGyFOm/HXiTc/13SE6iNO5MV49mudEhUOfl66ZQtkc10/
	p4md0dLOe3Rs/BLcx3Mj4lPBfFZ/6FRh/6x0Fng5NetS4Oh+EyeMQk8wNuLIbxTm
	yL0JSaaURfbaEm8HNQDEVAy+LvxwpzhqeEaniGdP+2wX+tKZc0ZyxqSnpFMCUPut
	Kt7mPzu+v7FX69cXxy9piGicG4H4H4B1MpD3wko1dPxfBpA7s8S0DMi6nmzdVQxo
	xEOwchtJZN6sGspbtNgLwRBJNlOR5q9JuqxjQf62/Y3n/tdoqB+w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023116.outbound.protection.outlook.com [40.107.201.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jj5p4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 03:47:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCc9K8an1U8j5hhW2hC2X+c0ulIegRFrvYAtabyC3Ks3J3lWXqbeqjAwBRi8SvkBMwQOm2VjGhL43ZNRwCvCv7mOkhU6CeA5wX8zjxpNZl1e8REvl8Odo+hy/HCVANcts/yM4DY2LLwO3BUMWf/wFFYvCi3YXkAEqpishrcszCnexais+p5qHralIqLqKBcA+ZE6qJwBQDI/7St2HAFwlJigXUyJa0D69afWIaVlp0AvnMahEfvXM9a8oBBalWNI4SRHEOTbRSDQIaxlphLdya0/SdQXAr496touWFfoMlVSRokIo4l7iOarc6UDKIe3gQp41tabVd6DDz7nq88PGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni+UBGsm1xEp4G9HBimbRqSB610lnR0mvePjuw8UF34=;
 b=h+NmZnPNSHk+Q3Vt1B1FZEwdQSqp3uKIxJtYtS22ign1NN1Nxck+l4JQq4L4s1i+ztIjIZWjnFqrUmxn11kOyiJO67wRj2n7cCXQ6zZwRv8Bb/OiB8hKOU+f24kse79N426nI6MZ4ME6VYueYm4m6R7z6eRh9S8pLt9o3Dwm6XY5oUofy4g4kddFF6rNc1LqYw6SyFmxPLLnjy3v07bLflydFzac+nMQJBjXeTCSz5yTO4lUA6ZV77S6O75rZJJW7IyZp/4uDinRaGFGKd8QGMR6aPnw/VOSKG2HOfxV1LnCZHWawwSoc/Pfb/LLVXrhW+b5DDZKGcinlow8AB38cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni+UBGsm1xEp4G9HBimbRqSB610lnR0mvePjuw8UF34=;
 b=y+heq+c6MWvTMBNL2KQ98KULok8UexxftEyUE0o4IxRMl25P48TrqhEfCVTttDX0dnrRfOfX8oYhcly/7ArcbXpT1Cbsnp8S0JQ92dKfQOEzL+/KONXiyVgls1hyHdRQ/md4sW9sAtGqeOkBhO094GWl6crP5ToRkRNBDCWhzl4=
Received: from CY8PR12CA0036.namprd12.prod.outlook.com (2603:10b6:930:49::29)
 by BY5PR19MB4036.namprd19.prod.outlook.com (2603:10b6:a03:228::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:47:52 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:930:49:cafe::98) by CY8PR12CA0036.outlook.office365.com
 (2603:10b6:930:49::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 08:47:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4D21406540;
	Mon, 27 Apr 2026 08:47:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C5BD2820247;
	Mon, 27 Apr 2026 08:47:49 +0000 (UTC)
Date: Mon, 27 Apr 2026 09:47:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v11 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <ae8itEyCI6Hha/ab@opensource.cirrus.com>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427082401.2118-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|BY5PR19MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: 698777b1-62a9-492d-68a3-08dea439aab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|7416014|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	td9eZBBCcdv7cLTc5RyJT0UD4Gj2HCKu0qLFcmTudiYGIvtYBNCl+Asbke4T6+D6UbjGnDsQOSPB1zZ0tOneavuM1VDwTqJ9yaUaoU/XvgNsSiD0nrHq1t/MF1obCR+Js0h3zsLSC4XF7zhHKgTl0LQnnhMwBGn0w65FSzMG4Q2Jv+Z7JibF4IDmLWZZYvUU+N4Qun1wHsHEvKdMsT/SxS+vnI8UaTmOrD2PC1zLQrycdutQ6RtvWXvmgzowVGQfNQ6jJFRyfaFYnXSXLo1eVZsUPdlczEKlsK2IhQyZTEHdcD/E0ieYE70Y/XevuJQbfqNGEmDr2Au8XPl7J3w6e1ogqS0axmRc3gQUQ1Bxz6/4Xo/USB/z74sVCdqDLeDlNRi2tVe0xIR0oKHXEVA+bZ7zkWwCAAsWs4E5Nj+IIGe4KmacLTxWLHA+2Q5bkPwh5h3pt6B/JfxsGnwyFbEyoV0KkKaIq/xkR7dGP3POMtoi3pKng285x8Kmy1yg1DFfr2DRU2OcL+Q4t5Mo9CLKFUzn71jQGe7qEM7i991Mx46TAt9MxvrSFgnJUtSt/mHlvaJxC3lpdlPUq67RTDYgHaSa9EkO+UTWs3gx13v/CiiTuPcoeyPHqUilnBIxxiGnF4P9BHxrUTNU9DXfTPAvz90KGoFYTiYuvWQo6UP0QUcBgrQ92IA45sIHsXVT/lwttvV+RP89hlhLokoxWuy33Ih2asNPdjYmhNZdvLiPVQZ6DYOBOxczyMouSqwCpINY6yDZKVCyUslUdxKNB9c8BA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(7416014)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sEHsSzcKFj4ie3aNm821Eyf9IfS1O2xglJey5iwD33EOILnh/c/01DEj7py40PdZrlYM53uZmNPzrW5sVLoHquA7SmZ3XwNNEIIk7KdJ5MtNuprOYNUSqXS8c+2lMiBUIpXTmGAQQWlFAC8LVDka6PwuDl1mZVsHiYCySvSpChX9oziNU3Dzrc5UpLi+KSH5vXlWm/WknXGa2akexiGsGVps4nR8TAyFt+DVzVx27+A8FCqR16PxnZBAmMzBcx2NM5r38TVUuL12GZ9IX5EPi2Kv2Kt4Z8GQIsNtNxQiHInQWp4u+LVB98546CBBOPbiZ6gUZ3fJHCRWiqE5i0UdC069KhRCdw6UrlR9EKQKstce66oWLk+s8HqCK6VtPxWKPqKS8UIJF23uGQQIJmzS+rw6/QytN9qVlx3VxApJ3TGDxJPP4Ec9XajuSMSplNlf
X-Exchange-RoutingPolicyChecked:
	OpNYZ3qOE2IqQne6bmfhcJnpV4Uur60kf3vqCaro1rgbKNtlLIivaXijXz2YD8JHkHA0PL9D2tC98Mr82J5ffocdHAQZUxH5wck2eI1Qj5ntQrKnBIjrVL/nSXmTQEuqBSMCQT2QcXDpnE/PxmR7CNt+rgMTmMa+6UQG1U+KVjnmO+MstdoqPwHO0qbDuLhSkSTI/wd9lVo5k4Vrixsevd9MRQl8Om6N13z882LJ80U4pODWTEufriZRodVybryndzkFsgy36b5I0cFPccoGdIs4AbtlyDknmsS5kyxYj94Ad8X4FOeKl+dA0gUrtQdpual0VF5VIpC0eRJ9OuCpkg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:47:51.4343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 698777b1-62a9-492d-68a3-08dea439aab4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4036
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69ef22bc cx=c_pps
 a=hnKMlhE5OLNSgTrTPmU3Mg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8 a=e7yRUnEFdbXuKGm2py8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ZSYoYRQgTJ1oRYubJBJFuc_sPl-fKtJp
X-Proofpoint-ORIG-GUID: ZSYoYRQgTJ1oRYubJBJFuc_sPl-fKtJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5MyBTYWx0ZWRfXwUtufWIh6iGY
 YsgqTii7wQl5pySfnqepTuzT2qC4AapZc8WLULYwOvoEXUX2sMlFj3v3MO73bjRJfS0KkdAnRGq
 Co5lkIPAqbiWKgNidb8u20IETDP/erVgxpODieMKg8swnpB9tiCWekV/SFIqVC5Y/Zlbp8FG2uu
 p8QvfpUVy1zZBLgLboZG/wNaJTcwa1C3nZzFHjFJ/oLp58mLkEqK0bUmBR0fTNo33+3waac2+i3
 h4xPgjLBW1f6MtQkYaa9MV7p3fPUaQ+SB5OndDM83i5SVgIRtahcDEewEK9uuIAJhdDVhhs3Pvg
 gRxVFYGz6c5QUyB5QGS7OJqZx4SeaZv5ITGk0wXAOhddWfJofwfrzhJ2ea4sTbeFYbOp7CrZeiw
 pzsaJeh0i1GHI6uZ7FeiQtctArCwepuFY9kbYGDtIVQH/+6CEjeEkVU7JPF3iOzL5xZ3Ro6kXmj
 XsxFzMHtfUUTQaewC3A==
X-Proofpoint-Spam-Reason: safe

On Mon, Apr 27, 2026 at 01:53:58PM +0530, Niranjan H Y wrote:
>   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> power state transitions. Per SDCA specification, after writing
> REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> is reached.
> 
> Changes include:
> - Add sdca_asoc_pde_ensure_ps() to handle ACTUAL_PS polling with
>   support for device-specific delay tables or default intervals
> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
