Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8143A6417
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432943; cv=fail; b=GNBqOxqiSboTqG7zC5/rsWHawiHUN4Il3gOSc5mPerasMY4pq8TUADqFTHTtoJneJRrWhfo6txN8nsu1SaCTM891n53xWMCbLWBeD18jqGyeGLoZR8J5HTpjTfEOxjQ/EJ79QlirZ1QYnpb9Dxpc3U9NmjO7u1WTVTwZ/qwjzjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432943; c=relaxed/simple;
	bh=hy5CN5yU7u7tBnY6XUeGj4H6+3AozbYASga/osqsSsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcnUjZm1Iu4cByKKnwuHhCFKnqBlXfNhkwSuL9LrGnEeVIxZtMk9uMiSYEc/lzRCaZsF/nryseBb4q835O6B6G9VssbQNY8A6w2kYOHfVGBcnIM1Ipzurf3B0EmuWkgFoStu+b7wOIsCIcEBiiKg4nPMbDhgkOsRMLYrDFCgXgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LB8zTqkj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pPjSo3UQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LB8zTqkj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pPjSo3UQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OKQCWx695310;
	Wed, 25 Mar 2026 05:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eZR8beBlMh18odsQV0
	nMj30bl9YU0tojR19T9QUQUXU=; b=LB8zTqkjruuBpwBcU21N8e6M5VNkuEsprr
	PVerlTowlgmytW6UbSPcJgNK/MWerOGOkumaBvqxbEoK9Etz1kaxtZkcH7wGgklQ
	JAZhuBx/+m/UAb1XEQ1UCW0n2cZDOoiMFyOSm6NKuSkGYkDJVIomArPfKmGB+net
	yfRSdEfsgmLFhiXi9NXGbbEyc+qOUiyQvlUW3PT3oRdA7WOvefAIQnKEwCvLSkhP
	E4jZJvfytGdIVgy8Zl0gORSWTsHydo1kZ3HwrBMTtNKy8Rrk3g3IoC6me29+dUOo
	bb1J7FnY7AdUsJH8axOezruLcGOCvWfV2e9ZCbgd32rbC1PnTQng==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022135.outbound.protection.outlook.com [52.101.53.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfchbk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 05:01:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwPaSH0AraIrny09iivm9qRoEDHjl4Tmtw1WmdLuo2Ay9VEymq1gA4/KbwICyw1ZHzKbgHdMeYcg+e6iHpwlazLJld8g5quA7V9L5MwSD17sRhCx2Yv/MO04t0EsHZSicEvEmjRkkXhWX6qof63nn2Oii8CQNbZr9xqytuOVTLBY+uo2K6sF6o8eeD7WQU7O26ZDQnmTmn7mWmouBZ9QSo+mNaavSZAktwbp+XKg6W9tST93IdLn4m8p/EfgAD0uiYJytTTvhX4m4UZ/+wV9JX3P+Ibb6bvzsOtxBSaYqNkJaf0r1SKRDB/o9n2ZZcMqJfrux2TSuNTsleyPLITkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZR8beBlMh18odsQV0nMj30bl9YU0tojR19T9QUQUXU=;
 b=YVE3SoKnT7i9VH3kCcF+hdbYJ9GjJqzeTxFfuxbkg7N0gvuxnrmTYCfyRlvQG3qoila4bfuMErqZdUG2YC5/O4+cjK7aWiTcUIH4bHgJuYisU48WAxY2l9wP6Jvk9RXFkVpFmpeWPpmL0CC+/G7X3jvkez3sx1WBadgQanFbfVaZ8YLLe6jpLnZp/Mz/rxWt1e/tjwUtPwYOr+3i38xaEIIuLc36q3DE77SqlkfbrQa/asBfrVr9+I/Dxc2TPfF10/XQ+8PMBn8oJllwWWAnK09Y+49cxH/TXtDNzqcEED2s2fakvdiNlOF9RiK+tI4cIh7fgzkHOtDP+uVf2FRsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZR8beBlMh18odsQV0nMj30bl9YU0tojR19T9QUQUXU=;
 b=pPjSo3UQsyZgLUvbOvyKePr4rhE+DoxoGGCJ7rISTioPGGZr/YX8WmWT1gCjMWfs1b6r8w5Q64C2Fqtoe6jxwjnWJPdgetF/ZKk3BUB4mt386vV/uHcqPxNOKxtG8/i8etat96m9cUg/cbKMEP/ryaoTeeoXskDoZJCpubVdXIc=
Received: from BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::27)
 by DS7PR19MB8884.namprd19.prod.outlook.com (2603:10b6:8:256::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:00:28 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::5b) by BL1P222CA0022.outlook.office365.com
 (2603:10b6:208:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 09:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 10:00:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25F2640654A;
	Wed, 25 Mar 2026 10:00:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0BEF382024A;
	Wed, 25 Mar 2026 10:00:27 +0000 (UTC)
Date: Wed, 25 Mar 2026 10:00:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH 1/2] ASoC: SDCA: remove the max count of initialization
 table
Message-ID: <acOyOZ4fxUoQ0p5L@opensource.cirrus.com>
References: <20260325092017.3221640-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325092017.3221640-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DS7PR19MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: a2edc5dc-7732-462f-8af6-08de8a5557c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RNO9L5uI0NujrcCuw2HEqlS4nm884PJUJGtbu4FykGgcEZJM7dprKVaX8NzC5N4AUEzBKmlw5Lnc7+KmAoN4IODwtOZ9aYwFozQA2yOxd4nB/21h91lK0kOfcQHegSPq8brP74iPGCZ8Qsl+4DiPbqSSs5ZVU4VUXT/R6Ku0OIq6Rce1DpW1ROymQDNvUNUDflm2liIpJ1TfBRCKAzgaR2Um7iI4KbZugyGwFEoqqB2c9AfyACUKcLK7Wi4eu4vyCFkmbwRb8DGM9Mx54JjHEGNng/qOFO108lx2lPoPglEocQzboU4ITuS9G62T/jpcxcczktz852Jd88l5wOh9ps6N2h9VKMpJw7mzg4b85O8Xtxq0O5754QACsjVa77ORhujz/48HSq2h3+hTtpAZMT02RUJcvC18IsPh4B59u0/r2P/MBl5JX1rdgqFMrIglQRpz3hAj1PGth77fVUMpmZaAOAIk9JLk/wGLW4ls/mn7oUhNyoK5s21S3GI30ZIeGhi1L0BgptH3qJMvCrwSXc9fsS2P5C7x/zfAXelKPwaE68vBQpjy4vEfzyx3X5ZXlY/3t6kKj3ti9w0Ev7wnusFCtejFbOeQpA4lkb3KLqgeBbVVLBkNPTc0gMDvnL0KJikpBp6fOvWzLNITbFxL2XulUCK7c+hsssI/AgJXaVgSca36B3ueb9IVR+yJDNUXMcW1xwfbjzPnDLla15bFe6fqYiH5Pa2syy/Lv1Wlo7lFRZNeVbW472lJEs/rfc7ruCc+vv0E+opwC4XDvkZCDw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/3vFCOncX3lAM6q0vEzMtuAZ3j87Gp0kT+2Xt5Sp07hFmHfP7MZKV9wn/OG8A9gr44ETqu2V5KvqYONWWaRwDWdBBIcVerMO6FZ2cF60LbOl+JLsNhRR8dSs43X4iDxFuLU464wjfjfwrU6yVmBxqvJNHAV79znzdQKN7gHn1Y0ya1VC/7oyex5E52zW8li6pTC6k2Hnwx4zYl468+9/BFbREpoeXQYkIHV5oUtHFD8+oZ8ehF8pTbOQa28AiJ101XS47RrMtNzGj7PjEgwa9odHziOfPqXveXFZSiCWgVPFhSGDBm86aMlIVovcUPIM7YwoiYkdrFfD+eVXf9mFJeST2gsy+FtTztq3QoqmguLRBE/0h7VKNHPhzeNvxjLswHFgmXQnMUoUG/g4xqv4jxS0FutIcXNcZc8TWzYbUV6ui6EPPJdXY0Ps/olv+tb0
X-Exchange-RoutingPolicyChecked:
	le7IweZIiBll0FqwuhOkqG3Sp0X2XDm/ahIaKDAL4TDZ7czJjw1gXfq1dHuU61LEYhIaacJ5v/Q8jOewChxF07HcPdhj4gx/v5CSt2BjMwzUe2Mi+r1rM7vXyCddjpOr8hth3v9u9eAdeXXHu5Y+GEOWQRA7rEBkbtEGSqGwF2Xs/m3jnUdfi83GpUM6PApwUmKf1UnLMQ/CtqoCRqwhtwWy7jHZQqR71o0Wg6Qs8YTfx02YsgZzfZG3UxCz/aLZ2U72phxykNyr5aDaYbCLRwaQqnkf6SzovJ2Yp+Pz8m1u6oR5aekFHqM1Q3SlzmFtCP457Lg3Gbkb4z7iQ4e02w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:00:28.0400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2edc5dc-7732-462f-8af6-08de8a5557c3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8884
X-Proofpoint-GUID: EMtd8qickWQcoZDsFEnxdMWtSn5vdvk4
X-Proofpoint-ORIG-GUID: EMtd8qickWQcoZDsFEnxdMWtSn5vdvk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MSBTYWx0ZWRfX5u9RCDRW0Sxn
 aMT7DzkfHbtxGdYgjhlhKvTs14tu4gBoyVoXkvmcm47MogqvG5s9wo+BVO0Bb7BeluCNj9ig8bV
 2ovoRZ3V+FIaeDsMt3qM0XysJdjEoNlOLk18VEY38G98TzJyHA2g24iIaoL5tMYeSWEAgZSIoBn
 jIcEd30lebIEt6HoJVu4zDV5aRccgEgyZBjnN4VRl2xwgKJvduBUNIfTU6o+aMKP8wkIKFyJAQa
 VU1mIRZpt81CK3hSR3/TyKLD5IDKGm7kjjA73cbcYOkRIwXNZIpYjrV6jfnmJYcPPSA3lqmPDdt
 nuYizRefQGWId0FJTc+9fN1KqkeL4zlabWDgHCCZkQU7q18/0XVU8+tcb6bljnupoioZzvGq79I
 Gf4rherh2GeyyQOTGcOWVkE5AGKUvVQjyuts525IB2sJi3/2VciCBvHImAGMbU/5MFimFeU6jMC
 30kclq0V6V8jBDcvgeA==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c3b28a cx=c_pps
 a=Ti5/GRJ+HbT0op5tcGUr/A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=VECxkrWD2Q7lsJLE7PoA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 25, 2026 at 05:20:17PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The number of the initialization table may exceed 2048.
> Therefore, this patch removes the limitation and allows the driver to
> allocate memory dynamically based on the size of the initialization table.

We were concerned this might be a little too low. Are we sure we
want to remove the limit rather than just increasing the allowed
size? I feel like I can see arguments for both ways, on one hand
this is input to the driver rather than part of it so it feels
sensible to sanity check it, on the other hand its the BIOS so
really we should be able to trust that.

Thanks,
Charles
