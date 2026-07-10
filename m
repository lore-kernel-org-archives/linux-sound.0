Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC635E1D8;
	Fri, 10 Jul 2026 04:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783656651; cv=fail; b=AjKUaDraBiog7Ws6oOrSz51Wv7zkx9L/oI2eu4iiPvvzBiJdNDdB8oV620U+hN6DE8nsqnc4y+Pliyj5XKMzzLjNN3Mu1ZlG3VoILkllCY5W8qf9fCCHqV9KCLNP/hRfgb/vf22cZV/rrlXYxUhysdONfElb2zm6K49jPlSAU0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783656651; c=relaxed/simple;
	bh=/wEbLOLe4C52PfAhUMAiBbNDoLk6JY5YYCZ991GIe0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=maeOtae2ZQw0/Oo3sMaOBXJU/f694ONK5ZPCgrS987b0ifnij+nZa86Gxw3SyInF5IPEWMK5e1KKcxomowSIYH/reT+n5dDXi8Np+1XbaQKH4GVkvHm1tQsCL8FL5JBuMycChlSJELijC/bWjOe1CyxQfydzR1lkCoqw7dreQa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=K+bdS9lT; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uWK5Fy8w; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="K+bdS9lT";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uWK5Fy8w"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66A3n37E2857319;
	Thu, 9 Jul 2026 23:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bSkIq6ddZGCSVCTAMW2gbU0vdWoVYLjmQH0ICpXhV
	Ls=; b=K+bdS9lT2XEq4Thk2PCwqvMxLkbqQYgG7s9PdXvG0bPKJ1SE0lEO2jvBU
	yICcnzloTwIptpvTMhXpGp4sZ4klIqIgrchZbgBcXbfKuzOpmtVLD3qYl1vGBi2J
	1mZ5XCdS2i6y0hpWlzfas5XtJxU4llZe+QRbO3U1fTszz7SZmEcwovl0NyhA8rZq
	bK8f0hNHssCym0+YdN2vt8O7Zs+SAAXGQF0kGNWN0pqi5PWHqnh7FLd0445pNImR
	p1Y53AX4ooIthK7zlCXyP2lzZ+m60bSGihazI5DTcB/SN5ENH9pzajydfnTiT5Nv
	7h0j8+f8Z1uFQG0WqSXh0ZH9RwFcQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fab73wdvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 23:10:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gr0GsJRPqGEBMyZYzK7puqshxeh6o0lFl7aQhAfUH5sh1sH9/Ic5lUopnqs6axeyPtDV375+HyH+QE70tQA7Pt1cfrPMY/uzY5joDiFaY7azVWfxA6DlGaj8IzvpLsuKtWMLq8hW90MWVK4ndeQIu4uatdQej+R3VTgC70MV7bupGTjFDyy99a/+rRbjptGrLDn4X5KRyUlr6WSaXb17m9uj05Vi164Z/HwitVJZ65dtNjjwikytwP2ANHL6WZqZ+LpdUn+aROPdBFU7iGDc0J8PfQT52dpwz6gAATyJszyDV8c3aNzZxCpSbpIVsNNEyIoeRAq+3R3QKdduIZBXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSkIq6ddZGCSVCTAMW2gbU0vdWoVYLjmQH0ICpXhVLs=;
 b=bAzroVi/WVbxyYxBQqwNN7yJhnYqQ9q79rZ6UWD4Xo0eJMjtJ0koZ+s6xfAOAjpxjBzaDQBizFg6cq2ktBDfG/JnhVMk80zn8wQWYBtAv/ceox9hjfPFRZ0kQ9HUz4+1RAhHhyPynWIGtkVUdGTYF6N49LQ+TnGIiPMIUXrmtc0f7YLplAbrveQmj75IkECxiJI3eKOzo3ZTi/d6Dhdj+8sX1Zq6w81YXIbEDF0DvQW9KwWlQdaQ/KKjTPQUqasJVCjXkOQxYpMnQfCOlToiqrLdlm9UfT6UXSvP+Ivll+hEYtnrGIYZsPfuPCa0C61zU/LeiLEviL7629xM3abISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSkIq6ddZGCSVCTAMW2gbU0vdWoVYLjmQH0ICpXhVLs=;
 b=uWK5Fy8wLmBY6jwUEiDZLnuybLLIJJVgfjPaWdjpZsbR/fS5ykicpXR3M2orH9i/hF0p61G9EeJPoukeGAyXRGgUbXLo63cXHI5qFLRluwtWBMDqcuaxkKxc2K+wpT2iGb/Su2EvC+wWkGu777oIvSjlEIArY8BYBRH9IM7sNro=
Received: from SA1PR03CA0011.namprd03.prod.outlook.com (2603:10b6:806:2d3::23)
 by CYXPR10MB7898.namprd10.prod.outlook.com (2603:10b6:930:dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 04:10:26 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::43) by SA1PR03CA0011.outlook.office365.com
 (2603:10b6:806:2d3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 04:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 04:10:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 23:10:26 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 23:10:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 23:10:26 -0500
Received: from [10.249.72.86] ([10.249.72.86])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66A4APYR2808243;
	Thu, 9 Jul 2026 23:10:25 -0500
Message-ID: <f814faf1-bfbe-42e4-ae0e-e34c7b2aad7d@ti.com>
Date: Thu, 9 Jul 2026 23:10:25 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
To: Gianluca Boiano <morf3089@gmail.com>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "Jaroslav Kysela" <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        "Baojun
 Xu" <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260709221331.989109-1-morf3089@gmail.com>
 <20260709221331.989109-2-morf3089@gmail.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260709221331.989109-2-morf3089@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CYXPR10MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aecf5a8-6d80-46e4-c028-08dede392bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|3023799007|6133799003|4143699003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	r3+hYlN4aX59bhcJBW73EnDpuyUWmRsLF2+1yB6tQgxGvK4zW6nLrIJIsVAwr1bMv2cdsJydlzLQ5bYKf/oSOsnZoSPULcqVijP2jdwDebx7u/DU8KTIvIAopF5+2OF9vvgZ4S9OWMgmJ9AcGUOYsB1RkLWWPcnRLwaiJk+uVRtnwVb934AXz1UtkTw2WdTNf6b1OPGLD4lIB0WjnUNwSd8s2VAC08VRKd+fKKWwqzhlp0iED2sVQR80RT4iSM+ceVpYJdlXd+G8N31MReBxm9KDPjVe2vsPoyxjAYsXjRadat7vMfis9XWc+gV0sinOX2oNnA5MP1Tfej55Mh1l17vJ23w9N8N2TCCxI2l9KXVqh5DmIu3KiQCmcY8voKDkKsdzCex3tCDfBh/45fDnFukn9YL39+4M0KKlb1cLf8x14A9bgyHRVmwOThkvUyIKK0TD1sZ01h9yhFHb24sgYxJchE43Gpg0NBzfa3f/1xxAgtEy7xS/u63sbnBQ3H+Uz6+pslYB6RFeWvyh9+Boapg+B3EDU455nILBhnm/OEP5pKGn04WWsmEffKIWXDNYbc0qlYDrS6rdzD8z+G+UJRHs5mJqzRz4pWF8uiepsz6Tn41AlD9RJTv4HY1+NGE0Kk7W7RaFTzU6xAIs5EM9Nw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(3023799007)(6133799003)(4143699003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xhfyJdCTwsR7YttLq0Gri/hYzpxFthJc4snoGNENWbRiyxv1F77hsIpsnSg13xKTb9mSMb/hvzBsa486/5sm+xcJt9XT5YDYUuzaJFxyILYS066aPWXx+j6BzJOi4vBtVbLddRymBpHku1WTK4LKmbTQN2EzaawJ8ZbW2+fCBLOuUE+jin3J1Y33X/e8jBthUMYj9j20H7Lw6bmFVoYp1UGEFEe7aGtMzUnAlmprUYlzkoMyuy8X1BVphiwTPKx/quhI+sJbhget7bm0NNmoXpd6vsOvBT1TUBgJtln8d0ZnzBGmqMQa9T2UwP+a5SG7Gz/qs38J736H1uqYaTsW+XfUuN3FSVb4B6ZsqMnoOTG3EW7jvsnrNTpuKclnGmKQ5qKRNNBB2Xzglpvr8Y6LPjWpmSUdyEPRmrdYeIogZkv3TIYi0iFBUDC+sMUJTHjz
X-Exchange-RoutingPolicyChecked:
	huOmhPD+3dsjs39ZlBnymwSsyGSXpzzDHZoli48mPGEwo9ZNOPvUgmrdjREy61PI78JbXL4A7Q49iV9dx5TXkF5WM41EUwtmcyF6Mk/nHn4wMI6+rlnpcWSBEh6v/y+Gt1SPzjfHRXEE+BzpFZImFCOD1lR2l/+q1lB13m2GFSWbgsY3TfWtJvxb4NpHZvvXKpB8caKF2bgAHet2HMWljMgb+VfFjz4N9rrhxd/9rcaFonp3yIp95DyneGlQwc/+dcQ76UCcRgqrl9IZPVzpk1uYcxgbyjG2qREH6JjRNwVYLeayNpcINjQWY4rKVWGVj4EZVRqIlEsnwn5o8pwFIg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:10:26.4993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aecf5a8-6d80-46e4-c028-08dede392bff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7898
X-Proofpoint-ORIG-GUID: zzRHJvWgBNmmgmswa_hjWVecss3LYgCf
X-Proofpoint-GUID: zzRHJvWgBNmmgmswa_hjWVecss3LYgCf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX4SBLmo3LODDe
 U/o5gmlOAv/I6DjpwXvmcuPMWvrCol7CJOA99B3JO0IWHlO6P5nPkfuYPuKqsLc+t4yS+pe0b2C
 I6KZYDo8G4d2UQp6VC1siOV4fH9YJU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX0ZDawgyZmkHj
 GAelEruAH7xjA+ajigNfomfzyJW6Bh9Uy+7b+UgRJx0+/eB+Fl91wW74s0LyTe+VV2MyZ9/EEnv
 tN99+xU/JRgVIBP1HnKClkmG9BIagEskOA6xZDL3wQ4oHIqOHTu8Jd+Cbrm0mWjVG9GkeUzQnEE
 wdwTIvbZf71i1JEbPmh6Di44lXGfBPf1/jz1jet34IExEsEqDp4YrPPB1Xn9emLBYiYc3+wVj37
 4IWUZdJRntQfjfs+PG6FmvekGn+VlvNRMmJFq+uBbBLA9zeQcNfCfO7Ck6OJYlJhVelJAo6p/8r
 w8xug7GVS0cBoLDQLFZ4nGEHgwkk6lrJsO4XoXa+6zZes7jIfUqCugbVCyDp2Nd5Y+UzuiRnO6a
 QLFV5ZSEBUvzF/hSdfjpu3UHsIIBuSr66kYRzIwxcqqKsqLoQj2u4TLlv0IZY9Mc5pAx2U/SnRQ
 tCGszwuUP+I2kG17tZw==
X-Authority-Analysis: v=2.4 cv=Ovt/DS/t c=1 sm=1 tr=0 ts=6a5070b6 cx=c_pps
 a=IWYRGtMsEs392uQhKf0YYg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=gEfo2CItAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=mymKJ--Q_5a40qPTBV4A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100034

On 7/9/2026 5:13 PM, Gianluca Boiano wrote:
> Document the TAS2557 mono Class-D smart amplifier with an integrated
> DSP for speaker protection. The device is controlled over I2C and
> receives audio over I2S/TDM (ASI). It can drive a single mono speaker
> or, as two devices, a stereo pair; in that case the ti,channel
> property selects the audio slot each device reproduces and the
> per-device tuning it applies.
> 
> The on-chip DSP boots from a firmware image generated per speaker
> design with the TI PurePath Console tuning tools; the optional
> firmware-name property selects a board-specific image.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>

Hi Gianluca, thanks for the patch.

> ---
>   .../devicetree/bindings/sound/ti,tas2557.yaml | 123 ++++++++++++++++++
>   MAINTAINERS                                   |   1 +
>   2 files changed, 124 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
> new file mode 100644
> index 000000000000..b1d1183c4a79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Gianluca Boiano <morf3089@gmail.com>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2557.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2557 Mono Smart Amplifier
> +
> +maintainers:
> +  - Gianluca Boiano <morf3089@gmail.com>
> +
> +description: |
> +  The TAS2557 is a mono, digital-input Class-D amplifier with an
> +  integrated DSP for speaker protection. Audio is carried over I2S/TDM
> +  (ASI). The on-chip DSP boots from a firmware image that is generated
> +  for a specific speaker design using the TI PurePath Console tuning
> +  tools.
> +
> +  Stereo playback is built from two devices, each reproducing one audio
> +  slot selected through the ti,channel property and applying the
> +  matching per-device tuning contained in a stereo-tuned firmware
> +  image.
> +
> +  Datasheet: https://www.ti.com/lit/gpn/tas2557
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,tas2557
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the active-low RESET pin.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Fault interrupt output (INT).
> +
> +  vbat-supply:
> +    description: Battery/boost input supply (VBAT), 2.9 V to 5.5 V.
> +
> +  iovdd-supply:
> +    description: Digital I/O supply, 1.62 V to 3.6 V.
> +
> +  avdd-supply:
> +    description: Analog supply, 1.65 V to 1.95 V.
> +
> +  dvdd-supply:
> +    description: Digital core supply, 1.65 V to 1.95 V.
> +
> +  ti,imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX time slot for current-sense data.
> +    default: 0
> +    minimum: 0
> +    maximum: 7
> +
> +  ti,vmon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX time slot for voltage-sense data.
> +    default: 2
> +    minimum: 0
> +    maximum: 7
> +
> +  ti,channel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Audio slot of the stereo stream reproduced by this device (0 =
> +      left, 1 = right). With stereo firmware this also selects which
> +      per-device tuning set is applied.
> +    enum: [0, 1]
> +    default: 0
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      Name of the DSP firmware image to load. Defaults to a name
> +      derived from the silicon revision. Stereo systems typically use
> +      a stereo-tuned image shared by both devices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'

+	ret = devm_regulator_bulk_get_enable(dev, 	ARRAY_SIZE(tas2557_supplies),
+					     tas2557_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get/enable supplies\n");

Looks like all supplies listed above is mandatory in the driver, please 
make sure you list them here in the required as well.

Best,
Sen Wang

