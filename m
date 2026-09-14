Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737C3161A1
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375542; cv=fail; b=pdp00gb9G6r1CHa0/oLcxEAgP0yDP/cJ1zEriNI5uMqjF3VDSnDtZ7aHxdWdhcC23fxL1hFnhEmr43IPlpehZhS2kWLpfhbtPO0aBJVIfwVJK6pISe2BYXtkfSBDvl6n/gmPpCvOjd3Vet1K6rVX97HsbNzqhUUkq1tXgXSXA0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375542; c=relaxed/simple;
	bh=I4xXTMW7iJkpi5uxYoxtUMO2l5uPzY9dnhp53fkeu9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaAL/e+pJpFQpt+AZJdtRXixlypG0GS91CBy+PXXsiAP807BxcdjllN4CGtP4sdIoYk0RF+QD1Vc9HMbmskfAe1WqDcDIiFFsfzt3NVZR+5WUBz/IRMiAAjVFRqp+xRQRX+YZqNQHpf7UlEieqWGdwmTHTSv1bhqh8HvjydvOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LjP/s3DH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XvAvlGBV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LjP/s3DH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XvAvlGBV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5goZD937705;
	Mon, 14 Sep 2026 03:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=I4xXTMW7iJkpi5uxYo
	xtUMO2l5uPzY9dnhp53fkeu9o=; b=LjP/s3DHkrmL31BHYWPckj/copz0Gp1q0j
	Lk4ULBy9w5AUazu9hrqzIYGBYzZ8vszIi2wqI1za4dxzjC/GzH1e9zBvQQP/gNhm
	jSN0FMh7nvm5YiyicKVsX6VGDas7b8tPEl0D0UhaaMRCIyNSitQvVvVAUGgitp09
	vHRbq22OszUVXqTm+nuB96BtBgd3h6O+60Jv4RP6xs37ZybFurzGQIgcrurhNobL
	strD7rLCqWh3TYY7WAzUuEfoBZ1shnXQsNVn0P5EymR/s5n8Ko0Ly6iN/pgC5/LX
	87qJkwBXNdaV3sVlqz3RXtRUukFh+UX3JufOnbjWAQlF2SIv2dlg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021098.outbound.protection.outlook.com [52.101.62.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9juu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 03:45:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsXTnNIJcYZ/dsGsXZ1MXZBt3SK/MTdlXYCs0iW4CZcIvTXFd3g1oc+6+Z6WpHea73Gf27XkE6vdX1Q86Y5PVi+Zbj6nrmACfeAG9XWU48LY8U73WBJ0FZNUQcYT9BF5hSR6uayo7OMrg4tFlmr3kRL18JvCMNU6n0x5xlYaPzNv3JtFtA/+4r3G8S2gGngxHGiIpymrd8qbwJbR12ZBS1c9reDw7woJW3J/edinHDjkI48qUJZYN8FC5kOPN9fX3M6w4qS8qJyJRxUdokMUG2vyHDzInnMG1FB5p+0fL0Hdm12dFsz75gmMtoY9pSH3u5yfaeZhxJcIKQ8UQddg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4xXTMW7iJkpi5uxYoxtUMO2l5uPzY9dnhp53fkeu9o=;
 b=M8jRD4eWmREf5XjE5q3vJa4UO00Mv5EFyMDSuweanV7Qb2o5HwCzD26zXBw+r9bbBf8pVTooThp5NflNHaE2hInOfci+90fgVMNo5t5s65Y4j6D18cbuUcrpxycntxuYNAMSd+SF0SGjArvGvqOGEhp5NK5hp3FjYFJ0Pj8IJXuiPEYgwHauUC0SG1TALj7wefO3bkURcC+0n55ynW8G/RKD5ZHfhK92Or6QdfQ0Ja5cm90pTmiI2jfqmYkax7IzPoRlgR4DTGH0t49znJcZluerIMZvHlfPt9D95NlQKp0Ef8xoDpwPBUFuCZ8pE5XIm1Pub2TkTX18YnnolzzuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4xXTMW7iJkpi5uxYoxtUMO2l5uPzY9dnhp53fkeu9o=;
 b=XvAvlGBVtEVem2r6tN36UrNfRRXAsgB6cZjwifQ3LUOstpXkasRgmndf2BEWL9003+j+NbmqF9Q10ePdi6UrBLUEC/eraiFJhYImdmEvFy8Bmm8ow91yNEW6Gx6yczzf5cCr4ZI7nDa7MFOYpFpCOBOwyWq2bHvMOtrcOpz/qB0=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by CH2PR19MB8946.namprd19.prod.outlook.com (2603:10b6:610:281::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 08:45:07 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::6a) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Mon, 14
 Sep 2026 08:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 08:45:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 05A4140655E;
	Mon, 14 Sep 2026 08:45:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CE158820247;
	Mon, 14 Sep 2026 08:45:02 +0000 (UTC)
Date: Mon, 14 Sep 2026 09:45:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Loren Heiman <loheiman@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [REGRESSION] cs35l56/cs42l43 amp calibration broken between Arch
 linux 7.1.9.arch1-2 and 7.2.3.arch1-3 (Dell XPS, Panther Lake)
Message-ID: <aqe0DQuSwlfmpxQc@opensource.cirrus.com>
References: <CAPtxoG3tfOwwkxi=aBgs6VXRy_gTihEO-3-0DfpZM+PBxKu9YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPtxoG3tfOwwkxi=aBgs6VXRy_gTihEO-3-0DfpZM+PBxKu9YQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|CH2PR19MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: dc13abc1-bf61-49d2-0058-08df123c794c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|11063799006|56012099006|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IM5ltrD07YRyT1yQNTpfGJ0Jlcpn4RWUIcFrAPac3dPTY1OQbpwqjf5wmS5lMzDpW6yK+mAQ0vXg93bbiieSKD/KczWsm+KPi9H+vrx11UpLQRUIFKemNKicMNFn9TtuIdPLhtTXwnbYjzFQSkyYlFgBekW8fE8Mcz+Tu3QtbGT1Lra2XFFe+DrttxYkL4WLRJ5MXpUfBkaTMfKly4+qCyw7OWBKwpw5fSL6admDT5hx7NEn0Hxmw+kfuSpP14aEI5291tt9/UX0K1speJ1N4Jha6UncEtX4wFKNuQuGye2xf8crtoE3HxElSyZpcNE6ZWqdIDZFSsue631OdJ7RNvkmhfRhjilItcHR5qYWBRuzv8Qmw2fh3Aen9fqjtS7f0cFingSjmHdKpixW8+0lLulfmcRP2ECYLM7jlieiRmAVTKfUDImDyzIhtdUQDil3I/iuwAUeU6vzikpPF421++tXE8m7jOV7hC6W0UPF5mbQI+jdMJ06smEX69pFLLDoRJheG8UTBwSqIYY2uqtFtWX3XxNP4KlZXcOf8N2LkjAnVFOLP0MOwjIk4nrOaV9Xy1u5Pc9zEjtBXNb0gZULmaHC8s/W1zntwd34C16rBVTcRsBf3Lzk/lJyyMdYf9KV2CRmyetMQ2L8H6tYCSwpM6CCwuBZ2Vas/dwHzy0l1Pca5MV0mQHyr/ICr57plwoZ5qM0Hn4ELuHTMdT67qIsHg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(11063799006)(56012099006)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WffyyfoHwXyXiwwoBvPU1iePq0ThZ40dxZgmdgcNBlDZKTL5dOKfzdshzYf51c7FpVodzl00IH5lb/GT6Z0Y8owXXrm8TA5wQ/FJGbbCJ+kpBxofeDJrFHwMejW5VT6yQpL4iUTAxKbKBMxWKBttIIXeZNnm+vE0h3wb3+nWvAPSgcFFCH37bUtgMZbu6EW7zgSmF8DtrYdyKgId0QcHnDx7423HRRctsjliMjwgCQZXAvBIIpO+m8vwanuO6wx8L4pxhiQDTM4VFqtFO9SfXyuKwFahOsJaiovefNuWlVLCLSQjaMBqZU9+KRz562SHq4e0ebZdbuhM9TBiY0qK571bInpsmIG60qQ75CvQgBEVtBGs53KZDMflL3rM3Dl/4v9kb60FPBi59gRTACB5U96IWhB2nSklQN1crjQa+4RkhrAkulsdXw9u7arG8Ctr
X-Exchange-RoutingPolicyChecked:
	oSeIYVgVjDdrOjwtgPdAmWVXUNuwTs52LH5+g+ZEzTE+x6+jjG+C7shkbhTvPmueJCaRfI9Slws3VG5VqXVEXpQZ2BV5WwqqmfTMDF14O6br+AVkWnw3OrPdm5e95jfVQHgjShyPHleVlsy1r67oVQKUYLC/76SPjTOm7Z2Zm4E4CEvwWFZ65JasA3j+kkXJO0Kr3eHTKWGSKGQB4az8iHOnUS/Miqj0EBI+dxWI+mGojjfFkiJ9pvaiKMPxM4ZZzqXE3m66tQIGBvhFDNhDoWU5q1/rjWSCa95vz/d1ajIqxxkTwli2NeRFbfjdXdlJw5gJ45fvfREh8wf6H2jT+Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:45:04.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc13abc1-bf61-49d2-0058-08df123c794c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8946
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7b41d cx=c_pps
 a=B7IIg8ZWzcecfbiAWLR44Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=iWKtuuklT5S0aPf9imgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNCBTYWx0ZWRfX1hVoxaGGz4TL
 tpX6yUY5wQryNPea8WP4Rt8sJKYkAjJX9EuQfw3CjfHTgbmU6ey1ivDxg/Fds/VsGciLdrCTMu4
 uSVccz9AdQCLBdWOF22ms/LBbSZYpC1pGFT1+8ri+ARThFy+TRPh1Zm3iO9SBMQjDtFXQQRy2qz
 i/SnYytk5oEGmUDGfORRfIiBuViFKdQlSYzMbNJFRmRTfOnua1+AYkKB0HW97S3k+kpcs7GMr3K
 eE5y/ChMPFdsSTglIi+ZL6bSwcKia9y/FEvHxyKJvNvVd9RFZk8Xc174ZIfsOW19qREbrfcs0g+
 F4k5n84N6WbJ+jRgzFrQzKpr9cU3ISNtyjsl7oRM4DLmvwKghZAM28zUGr4/2/oiLW5Rb9poWFo
 qzUr6hg3oeCb7kNYtgKlusuOf376//fKFw82MnlaQbgUzURDbZ7ztlqV2vgrbcrqeSfQLij89eh
 3lUnWqxC9FYHAnMShgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNCBTYWx0ZWRfX/DI0lqoxWV3j
 xudABTZ3g+zXCE+eYB25HgVbZ5MluS/lnSpCZrVhQXlac7RzBMw6RbASgU+k4sBmx/+sQFxVffn
 ekvAgO+aUbo5gynoAl82kjVIRcjD/eY=
X-Proofpoint-ORIG-GUID: rBsna8EaJeGsV5KbSnoe5HE2bhP0izTe
X-Proofpoint-GUID: rBsna8EaJeGsV5KbSnoe5HE2bhP0izTe
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 05:24:40PM -0700, Loren Heiman wrote:
> Summary:
> Internal speaker audio worked correctly, then went completely silent after
> a kernel upgrade, with no other change to the audio stack. Downgrading only
> the kernel restores audio immediately, which isolates this to the kernel
> rather than a config/firmware/userspace issue (see isolation steps below).

Could you please send through a dmesg of system boot on the
broken kernel?

Thanks,
Charles
