Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58760407574;
	Wed, 29 Apr 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479740; cv=fail; b=UUKA8ZU6LSnM85Eg2Kew4ma8Q5AUsdUndhVXaDYn17YaLqaD3knzjijna1LZvW/RwJWLdmTvFVz8aFaVPIKdiHcS3azn+96Zj03/kcovTJiIC/56X4i36zUSWm9l0Dj+5wV0DYIAkc/pR5/apqGL2vo+ovwTZ55CuSIsgs4OYUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479740; c=relaxed/simple;
	bh=2H0vGY4HZWDYIiCFL6X6SrxwDjqHY9vTBBhkYUXxRZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehTmDcrhc1NfvjU4n4H2XqffDREmj4dWnQWephBXhxlQlR4hl/HasqurPslMEWyuEwX90IcaSb6/hlIBWM89TM7ii0aBe0Y+G0wGN4NSOHW+ufB7hZ1YUG+nzo3peFmZkPO6b6o7K2xYtD+wWT3j3ZpimYoc+o2etnGLdxVsHns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ijXjPFfA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YHlp1P4t; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ijXjPFfA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YHlp1P4t"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5QPVJ2565692;
	Wed, 29 Apr 2026 11:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9/Nh3hOxWfOYoWU5qJ
	dnfs8GuIljMuLpEXXCEPXOUF0=; b=ijXjPFfA3PGXH+JRo0WaBuKMf1D/yljxF+
	h89FqtwlLP2uJSz4VkON2EjncXlk+JzQiq/sN8tYhKZpY2ZygU12b6uOQP5JJeee
	qz8SrE2k2yWH7RmEdbUIj27yR6gfHF+u5GVZZ8vag4Vp3aNm6YcdI1twBv7Pe+Pn
	xFV/Ba8NGE86X0DOm/yjtFMuACrwfFPUtNp3KAAw+r2I3sCDr7Rc1qVhEMhpGekx
	usZ9rg8HJGomZUFhrLdvxPBMyXCC/hVgO4MaSN/J/zSguL5iJfYyBdZhWaCPkt8q
	Z6Fkxn0t4/RSinw9Pj8rnHXpICbEwSEIERk9HsV0heOS0gMs63Ww==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020130.outbound.protection.outlook.com [52.101.85.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jnvve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 11:21:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxjIoQlHKBO3hXv/PAul/vgMEBCvwXAgAmgbz5Z+aFAGkz45JStNUfNomPaY0I7LmCOmVsj2U7pGC5l0LMBhRip9Yc6wFaI+eiW9dqqpLiJmeL8KUZJKac22CEYVdZJLgqHxBfIVriMwm3KaJAZaxTtFniEZ7U8TSi/mtVIIJfOpeyCL4g6hORaGa2sLnMknXguZ+0Jzz2D9J7hlny/IBZ9fX2KeP0W+sDtI9johMTiGJo+MD3LkFqkYHSiOos3idpToflkNFemw0AhCz+UHvnMHvMV+vLUm37QNUbqx2rTCQ0IiCmDqEXXRrVpGETVfztnTQfZRXoNKuqEEPDurzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/Nh3hOxWfOYoWU5qJdnfs8GuIljMuLpEXXCEPXOUF0=;
 b=j9xRXC91n04vnBw0vLJVeHs4sXRbt9SZE6sSdCWgrPQn8xgHs3S7jwqTy0e6vvpZrMnugBx+9u25T00pj3ZaBrk1V8e3lGuga/Qh8/jpHyd7mDlkSGtzAcvNQU3TNzAIShi6EgLaA85osTpS7DI9zyJrJKHDzDgU/3NG/DPd3HkMj6JQtdXSGXHON7djyM/niN5xmnHcC3gHTOTIrZXICw9vTMIwiq3ATDcoh0li2C0gINDV8LMFEV8vhGKQoeNJWZ7GSFWO0rYMW7G+0GYxo1qT1GSrx9y2OMpR2Y1TX/E21KazpesA8Ok7QQkS4HzCXiREreXeRNTHXc7Y/Q784w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/Nh3hOxWfOYoWU5qJdnfs8GuIljMuLpEXXCEPXOUF0=;
 b=YHlp1P4t8zD6HdCsJT7PDYFW5v8udHJFNIfStPc0TZg86wiT+eVhgvOe+T0CXxcY8Hh4Lt330LfM4W9Wlm3KvRO6BRpAvMxkYBV5tJDMNzBzF22ekVnhkhl98cZ4H7UkQCv4j4DMQ6IhMVVuhPF7XVMHjKsqjsoqaB5SE3ffaIU=
Received: from BN0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:408:e6::17)
 by CYXPR19MB8403.namprd19.prod.outlook.com (2603:10b6:930:e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 16:21:50 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::4d) by BN0PR03CA0012.outlook.office365.com
 (2603:10b6:408:e6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 16:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 16:21:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3CEE4406554;
	Wed, 29 Apr 2026 16:21:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2447982024A;
	Wed, 29 Apr 2026 16:21:49 +0000 (UTC)
Date: Wed, 29 Apr 2026 17:21:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v12 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <afIwHKUHPEkbGuW7@opensource.cirrus.com>
References: <20260428162911.2372-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428162911.2372-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CYXPR19MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: afb14587-6285-47a2-1ff3-08dea60b6af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bDtHfSZkB3QUPxZYfwoALbgxFh9OjB1J3eee8EDnXI+iwHIbTtBNGPIk1X3LsV8YeGjJHM1fX5uhUQlf1wnOjcrVJtRgQpC2SybJ+g5DQNIVGw2oAi2fjDBIjeSMmIcRilFxvXSbC00bPuujrctfk6YeWPmY97nmsW+cDF+s5Ggaef2XU/gM63rMorCdshr33EElwCMnMM4voEoMo4Vvy42XqmAQ6e1a4wUpkyEr4QKUiafJim8UW+nvp5YmLNMYi+EfKTL2OIvp5sC2Bsko7LLzmn04P0P4fSc4/YU7VxFq6wJx69hCItw8viHl7dBoxQn7IjlWU3ooZFXftgKv3we7EjkmZlNNzZqq4RO2NSSKuDjakQ0GsST/70cILYv5rTHTBC5wP4bPci6s+5rbQ2WpfY7PwoCeVlf0OLpNr80vN9xPmSIeEOLNLDOKi+zyF8tiQ0QNYIbHw5xCgtQNfJD3VB06pHjFr5UEH4lVes1ae4esnGS2llZOVuSvhqUHfMQyY7/i2GzJg8Sn4fUGGjQOBNIKT1+/pNnAQZRhtGPokXa5iBft5x21onRCStJlZjRxC3UMW9ysI/XMbixPV5zSmNQOfL6O+WvPkOJfq1vFnDJSFcNPZZdf/6VzgSu8gDzkYm5uzfnQERQIeV/uSuh3E0tMDhaLT0gNWEsbJ+ZFrO3AY9rAlvTUAUMefL6f6T+GZZxwpVCschQQ+VeSzX+swbbQJY7eVOjgPBI1d237dUSKFHa6vCOcqIL8wjOZDVsMrJFRBD58klJZ9RQIzQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Whbldn153OkWrQFzJPD2cJ7XLXmpdPGjSIsIaOyL4SpHH0ZVOmhWXEPj3tZK9ivZ9PgWMe1UW2VdDTTR2PSijbcRDpY1S32z/MRM4y9gAGvWTlcKxv0idjqS/vSgxeUOS5Hdm7n1KxJdDceWl51AwHWhqV5JfaWg0bUZgiBc8tZ82lIxBSLNGEP2XL4vrluvPPviGaQPw41oTGuE7/lFb8Pss4thlY1K7RzWKjs6PsAXby2alYtjygig84GOKcLUUuPfUuumJP5o/xhmmraQqCZDplM/3Tg06Xju37MYwgx2P5yGZnzuio+iRMl7PrsM+q3QqgB0ATWBTWO3JQwLgMPAI+F7P/an2tqCX0D6uJxAw0ruSVWFP2SdAPopcxPzvQ9DRt4vBYsJynKSjTgtWA1sMR7/ynE1nMr/ODcMsL3E3QsP3cc2EmJauj6/7Vgc
X-Exchange-RoutingPolicyChecked:
	nR4UROeDo3jIObN7y6W2E+zaUdZNZdpuQlB7ipwCeLPS7MovEq9VVXlsDCh7Cw2wR9BqfJSOysx8AQx52lhEant86raB+XMSHQN37O9MsgFSBQ1xC0UXZZ3IZZecTAQ89KAWuRPwuW00CMVlQ+zVpSU6EgqbfacgmCjmznOv1ymM40hhpsnN3QAIb3+Wfuu9A4W+0lsZ5rozc6YmAPORMmQO6Jd7vNtZypZY3sz97BaRoy1cxMNtEJyJRmymlRY9Y279ANPO7QggNsBAzh7FBY9rrFXZ3Tqpyvva9gYkBBCwroQg+Rj/7R5hMSPCIlL3AIMfSL6dgvZfO0BiXCosQA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:21:50.0259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb14587-6285-47a2-1ff3-08dea60b6af4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8403
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f23023 cx=c_pps
 a=X2L/u1ma8r2rsimHZpPbHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8 a=e7yRUnEFdbXuKGm2py8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: LPhWje-8QXT2e2vloORTTr06WadHed9e
X-Proofpoint-ORIG-GUID: LPhWje-8QXT2e2vloORTTr06WadHed9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2NCBTYWx0ZWRfX05gajawbyItg
 4jzNNnpDSdwmReKEvuxziJEGpO2zsYYIuy0DITMm93vmewpiuZkM0uGfobHL+Mg6FKAcxNkHHgv
 RYDucBj1KvIM68RLwJKbz2eeAwQKf8+OQamz34uKQxMa0wqSUgwyLzbWEHo4dh9g8T0c0GdUnh3
 sizI+M2+Dc+G819q7JWcn7FCByQ0ygprQnlX317qWP9DLb1tqmKMD1vk4z8Auvz0twohzNwjRTB
 e9yO3J6qWq46tt1DKzduIw6PkK0yLpBt2BJNCCbl1CFjybxKI/qCpl11wbReab9rhJ63DLseFZu
 GfKbj/qFNshbB/szNntHOqEeU/tsOc1kNtHLij09jxbSFYz8H7Qt3QpGO4VxoDRuWfJMuFcTpgN
 URA2qridbKcNzIsQIezwSKApKDPZzUmUrgkLpY8KFgErKFtozHiiJ7n6uvFBXdjm6BipI7e7FF5
 4xahzl70i85bkkNBAVA==
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 28, 2026 at 09:59:08PM +0530, Niranjan H Y wrote:
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
