Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0000330D43;
	Mon, 22 Jun 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141276; cv=fail; b=CXnkODq+EX/8KBwBN6uCr55nS30zWabSyI21uatfm3KwQCMJdzXy8mSeVD5uJCHB4aEtUA4sG+lXT3wZg7uLVWlHeXBAUHRXg8l43NR8Nu1CbCkchqQVY9eYCYlBRtmA8qFea/f6oebQqXklSI9xV+JJBDdSamlMLOC4ngBmbMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141276; c=relaxed/simple;
	bh=fMDrqlhEx+YtafSCFE+LDq6WnaJ1Z1IyU8uj5gFKE3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvBoSERljNTiipT5OyJdWPlQ8THoXO5PCH0VIovfUgh/3fJfggu8mkQbOlj/8VInFjdI/VEn/1vsXVBx3Kd3Hm2W0wbCiG70venqHTN1OLJH7tPl1kobABtVNVebDNkIeblvhqwtFgENWAXjYmpAZC5jxZGeALZSa7msNJgMs5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UVTY+ho0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JQ6O4qya; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UVTY+ho0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JQ6O4qya"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEL0Ea3837456;
	Mon, 22 Jun 2026 10:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rUCgDC1S/IwXEE5PHb
	iUYAC6lHuSxiet35w89HhA+So=; b=UVTY+ho0RXj1XhKJn4OeTAJHjGBJv/XKvt
	YT3XRs2ibhj3oihXzQrlk/3ktXCUWp5ij4vLSPkYo9wBNGCzYGujiLcer8ZkrXUH
	L+U6w8Ri3QDM94LUtyHbkuH8emakaYwww0oN1+/sRaYW5wQn6udC3phIn8Z7YqL7
	98lcUtRSCC+xjbYSrmwmnqJs6sWOr51Toqg2w/Shx6uXO3ywl6Ho/nDGP9JIVMN3
	xcS7nJYHQRpveBGg+Z/1nGHrtcqfEA2IZ8JBp8+najij1bJKTmRL2iE286P1PreS
	fTpSMsUxqD4KGIRA4QtBppQC3++EraXwaiLdZhyFdCoajouWHM3A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022135.outbound.protection.outlook.com [52.101.53.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jj4sf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 10:14:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhab4IRNOMOrvYIrKq0TBAy61gU8P7p34vHbWFIZAw9E1y+0nKiTmggLXccX1IDvIkiwotVLVS7jJXVfgoXVhGf3qcXXSqqxSnuJrDGVkWwgSeF5/9luJaD6tdsS/4TbXT4rDW92eKrJ/BTFm6ZfXyBJSf8wt6ThuOF5ElmPCQzQkgXX1/AlAnQiyoLipZUmFsS5q1DahptGt9DhEOhgwY2Q3mgEKViGLkxqx6Bqt6I7taEBRx6CibLjUqKCUjkuINFvCgNOJOMOfzB+5EwNVMnRJH5a/AEJGsJKVCy39jcvhnj8GHMEQYfdxqJxJdty4QmHBvTCE/AV4FkqRnLdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUCgDC1S/IwXEE5PHbiUYAC6lHuSxiet35w89HhA+So=;
 b=htKnA6JRC9IzsRc5Uj6h2K5BUqTlhBILJ6dKN15jkf0kJV7q4fnHNmsF6vgEsOXT+eRETZf0armPr7PHjj2wb1FHaP8/Jdd6ALsX4JfP5TbB8mvtohAVp8qCcynBnainQYGaUps+SMl1ejdJA/q954qVg7AaXLHLN3JhsPau0mBU6G+J9BmFPK7N054i+FO8E+J6nNFpScbJ8XVhM4u3d1B0kbSg1TzWnoFgJJV2oRgLNkZ+JTSQ6Vu3jMakRUcE6R1taiKEerNyPtTPHfD2teKpEG/6kBN4N7bvTk8b/IXhAXdgVKXpduGWVrTakCas4z4xVSw/JRgwulV0Z4A2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUCgDC1S/IwXEE5PHbiUYAC6lHuSxiet35w89HhA+So=;
 b=JQ6O4qyaw+GgPIG3d0bqsBnK1f788Wx/+V3yc0x/JT4kt2DQFGAwset00G4A7llnNcpX1v1yZ3L+ganSO6ZNJ908yjda3M4hWcCkdICjRFvPhCjCubAoBr0CEFjugDgFEoZcbdL8TkGFeLP1n6XPa19nI4IstCfK+CKPCy/wdyw=
Received: from PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::29)
 by DS4PR19MB9171.namprd19.prod.outlook.com (2603:10b6:8:2a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:14:15 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::63) by PH7P221CA0012.outlook.office365.com
 (2603:10b6:510:32a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 15:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Mon, 22 Jun 2026 15:14:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10735406544;
	Mon, 22 Jun 2026 15:14:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED17082025A;
	Mon, 22 Jun 2026 15:14:12 +0000 (UTC)
Date: Mon, 22 Jun 2026 16:14:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: fix __leXX types in find_sdca_control_range
Message-ID: <ajlRQyIq9kvJdQWf@opensource.cirrus.com>
References: <20260622134247.465275-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622134247.465275-1-ben.dooks@codethink.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DS4PR19MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caefcc9-989b-4252-cd85-08ded070ebeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|56012099006|11063799006|16102099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cHGW8ciFlSAwCdkJRD/0vjAxx7e2MgWsiDDeHN/pDZ+cNQoUSDWWjgH+f+JXo1c0s3MgAD28mQnLXrKQOOCYd4cI0ij3YRMDeDNJh+P0jeOlyJzJ5Nch7fjATKDajdMrEKmaS1uHLy8uZUBQzS9CijujiFGw7CqV47Rb7Lwhk58D8pMUXFmgEcbNvbKmP8HikxhIr8g83Hg4nBn4PXOkt/kJxAK88MqLnmHLRSAEjfCEdyZS3Jr0a7Vza5O7Lhgn98PYJS2gAjIqW6BQsVhz2KDffGeV+oY7i8ThNkFyuI20z0BVHhtXQIa5EqZScQ97mmX+Q1c7bAV6dHpsBUz+nOfIrLjt0UsA0XH+Axzysc6akcBNGCx3OFwIevLtA1r0+nRNGia73sPx1ZbbRV3cxI2dGfsOOzNkzYcblda/Gt1SmEl1Sw6VeGgwk9wnakqChArbsTxyhV1uXvQVOUb2tBH/h12vAe7uz8iT4QHZQTq/M6gZrLyZRTAyOGhEDEmG1GZ3t/s6Nfpk+zNPjEQRDZJnAlitvv3HE6kRjZfZaSx3R+L6Or3nOwAgJKCyDRTNHXqTLgqDjSTAE1Yvu4pgsc4zJBi5QUHBb8tUGz2xhrq4jGEXN3L7VNhJR3COQeAyoIuk6vEHwezx1c674rVpQ2QB/tJLXlTAUjf1gfDVF9QyKIweFjIeJnZlh/TL+I0HqflXhno7kWvPylyWolftmg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(16102099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iDglxLQi+tBWqUZLxSDtY9EpddLhuaHUl2D2x4zTHhir+qEZ7ME2fMTnffTMcaJLVytguPncJ7Y+xYsRm1xB120+NrRErc+hVJEZoUgIYftZU+zpxhOBq6sIDvPyXQQQyqo4nzZD+hE8WVA4ZvABOZN0ST+lqmaILnc/UsarSUbQ5i7qItw5H9CjRqq5I3G+BTLn06T4rKZ0nvT3jFiolYAgisZVeJG1K4V6XL/ZsByaxYufmXsn1mHMEgBxt9VKWrA881lfIoxJAaZuR48c/BGwTsYYg8sB6BsSscyLLX/5mU8SJdO5XR3yjiflBJsIj3t44kIuJJzmhpnHQ1XuH/qtswiH/dzTvE0BNgx1+pRd4E8w+Vq8CF75PhJJYs+hg5MOuLli7vvFiobMxCDY9BkbGIr44DVl3IpNtOvA54jaZH/LdcSiQIXkgWxt+6J3
X-Exchange-RoutingPolicyChecked:
	CnD4FJqqNgxtsE83HeFNLboC/Eb317IcEfeSpejouzuuVxSqosYJHqaXVFr4baJHzchQg7kqfleLxENZynHsIoGo9mPCPmwH3QYMm3Pid2O1JPPPnaEY8oIMWEkqZPJKPzx7vb9gGOwos6IclMSsznV+MwJZTbpEYliZZKxOMbcDoZ/Nraxk4he+cbZXtN+q4UIgMO1tCZY6jEEX86yPDoen3aCBas8jx56clXW6JIj02TISCdLz7yQ+IQemKv0KOt/VD7rJLOlFYooCr8Owr2zFP+0Eu8jiC19F/aBoNWawBEheiCcfEcv0HocmyccesOzK45X4mopcHG6vdbFJBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:14:14.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caefcc9-989b-4252-cd85-08ded070ebeb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfX6BJCv2c7JEkR
 qMTGcBLyov13e6eq2K5RPoP75etLikU07I6J7f6ot3GPWgiOrmJ6tPrQOS8tvHwCelvbyf2ZnXU
 P3X2zz0JkJurt3huJ1hlK9Oa7lI3IXQ/PTzDo1LfNtCAQHYMNNH56al8HNWODpmy1BCrJy8o3Pt
 A7fFcH15CQkL8dikoyN9zrpcv2/iZa7f4cJ99EqDmCdZ4sLEpKxMLebvebyTWWsf6XRUaf0k00n
 K+a+P9DhMo99E7T+sB+NFuSPkJSBBIahOrKY55CL1YfCmoxBpcdfLLGnwyqvxxuxRRiHLRhd4xC
 mzFnR2u7Vg6QAFLQrfYAVGAWv+nBMSL9MNOuata8gODuL25Wet88Lv9EeuYZgXia6pju8VnnA09
 T2vRXQwjTxggbQmhNKmL94lNklhDa1wSlw34izHokWJNIdGr2wbIdn0WdMaueVSg3f+Cm7h9MIx
 SmV9/GCfatSEnVlBwdA==
X-Proofpoint-ORIG-GUID: vwGwoBUGnaZ_n2shdw1_cMSztUArCh53
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a39514a cx=c_pps
 a=Ti5/GRJ+HbT0op5tcGUr/A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1EsaE_6oAAAA:8 a=3X86PVi-AxhIlr62kf0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-GUID: vwGwoBUGnaZ_n2shdw1_cMSztUArCh53
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfX8GwkJYpXlBqU
 fAXdI8SDkaXY2sCmABdoPqTrxs2lLAmHx+BBjQ0C7kKPwM+xl13u9UCWKdsREtphuTpxHDUzqAB
 w5QsM8+T4sv4Cz4WH6FkpGmDR4XZfsI=
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 22, 2026 at 02:42:47PM +0100, Ben Dooks wrote:
> The find_sdca_control_range passes u16 and u32 values to the
> leXX_to_cpu() functions. Change this type and for the data
> loop use the le32_to_cpup() to convert the value using a
> pointer.
> 
> Fixes the following sparse warnings:
> sound/soc/sdca/sdca_functions.c:868:23: warning: cast to restricted __le16
> sound/soc/sdca/sdca_functions.c:869:23: warning: cast to restricted __le16
> sound/soc/sdca/sdca_functions.c:877:34: warning: cast to restricted __le32
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  	for (i = 0; i < num_range; i++)
> -		range->data[i] = le32_to_cpu(range->data[i]);
> +		le32_to_cpup((__le32 *)&range->data[i]);

Sorry looking again is this bit right? I think this works because
my system is little endian so this is a no op, but don't you
still need to assign the value here? Or use le32_to_cpus()?

Thanks,
Charles
