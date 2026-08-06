Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8B543B48C;
	Thu,  6 Aug 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030775; cv=fail; b=iiRDEAedYy1OIC2wT0z7VHCexo6rsScXGJCQY+AqgqJRsniysf/ekYL0+sv9fOi8IH7YHLVUzxn4sFaAE+6eL13mbm6smCSZjW9kuv/wAHbPysqXToaXVfNp3mU9/LiRdm7P64ONVXF0YSLYzuA3JRQbbItVh6B35NUQlELCaiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030775; c=relaxed/simple;
	bh=uQ07x7qz+BzRmqoHOvn7OsgOA6MboMgLCt7tmU/wSiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdNLWULZjG4Dp6VNKeNjmEJM6EIbKg/NXnu2fujipHdIOidtWXCceKZagMG8aLXJQ/WcVEo33EfL0olXivn5PTfkXjWPaZz3uMxJds5kvi5IhVBFptdAvrmPmwPqdXf1OOfjka8i7XwEhdvibKprm4R1qJDfTQ7AoAJnriDha0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OPikvI9Q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rnCHJDTe; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OPikvI9Q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rnCHJDTe"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676CHULp2313673;
	Thu, 6 Aug 2026 10:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=r/xY5JpAD8qzLcfSsd
	mdfEsBUtMaRfAF7dLL7UMn7tU=; b=OPikvI9QXWHljNEwwLoDcvgjldPsgfoRI8
	E0vvu6abOMGRDdg6Da19CuzqQIp+8K/ycne3uduCE9HM07e21qC9slEZmnnG0hSD
	iHopZ/rT0Bn2+f4bbyB16h3stWaAemjwy2xZPiTgK9XicN6xEhMcgX0XV32+vLVh
	+O5K0ngoobIl50Sp6GhCwdhlKbxeumy/+Ga+PcZO2aS45oOtfzrbcZYcHgouPyX9
	0tInJUrZHFRT0PELLO3dqrUj1PJOshdYUnMraaAHv74yi9Ms0QVua4vsuJAa4Hjz
	D508h+IPypWCcAAjJ8YxpecupwFx2AkI2/2Ys84YjZC7+gZ2pP/w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023091.outbound.protection.outlook.com [40.93.201.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vrb60-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 10:39:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpOnfXNsbyKvcVhWWRdu3dR+xUjIpYMAeTdnLljwgxyD9Ih3Hb1EnedAU3alZHOZhVSI4SDv+uSOof01/hX5AVAhGyD/cgsBVwAR4a/2ZHQSt8S2fsrQBpRjinG5e1qTcedxeVgOYxGW8SIilKvfEpyo93QW/yjo3DAzQ3X2WTt2nQgbpH4evpt0wRgdk8o/D+NQzyBjNV4Zfu7kvwnYKCqx+HmyIQLrasgiSo5kmDpZw2e3iFLAbWA/tpM2VcPsI/RHTwlI7DD+ZkSsHIJRSMu+7AOywISqzuDbVDmMJotE0vksOZr8oGjjTBIrsNcC7ytFc7qzy3TbkYb1V4Ad5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/xY5JpAD8qzLcfSsdmdfEsBUtMaRfAF7dLL7UMn7tU=;
 b=rgs7VpLYdluveWczFcnpcXIktnuZgC0nHs860d/Uf86BOcbHsPPYojRcxNwkzU41F2j+JF+W4MicOungJoD9NhQU9hTFze77opKDsUgq6hbJS+IIPCZRKhTXoxcUrHsvyNAWMEfcyZCbYUo8YpfPj8yavmyYBuloAFpPYvYeiOKmfumURqqSFoMPMRBjVBo6O1D3bSi3AflJUtxGROPofp5SWsiav3f2zUoyN6HIBVS6xtZN2V73yjwIoxyJt/26gWY9JGMWkywUqZov2pebrN5x3fRAGjMdDByHXa9rM68lJZp3FAurxWsg/Q1Mmv9ZYe31fdbGKG2VsEm37P9keQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/xY5JpAD8qzLcfSsdmdfEsBUtMaRfAF7dLL7UMn7tU=;
 b=rnCHJDTe67JMV5L3w5+3jaqhwXJySmRjvMGyzVJPF9qViaDGZrML1qATGNms8ZHZ8cba1yGygQ677re5a39sheZJy90Ev72OMKfsO01pVa3oCTlF87dlv1OrUo9h/6pZhZjqbpQUaP+wQsOQ3I1MJyCPMRrKeJ1wMNyf7yFCdAM=
Received: from BN9PR03CA0072.namprd03.prod.outlook.com (2603:10b6:408:fc::17)
 by BY5PR19MB3795.namprd19.prod.outlook.com (2603:10b6:a03:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 15:39:15 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:fc:cafe::a8) by BN9PR03CA0072.outlook.office365.com
 (2603:10b6:408:fc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 15:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 15:39:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25C28406544;
	Thu,  6 Aug 2026 15:39:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0D1B982025A;
	Thu,  6 Aug 2026 15:39:13 +0000 (UTC)
Date: Thu, 6 Aug 2026 16:39:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Message-ID: <anSqnyNOl4LkNu/x@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
 <20260806144210.GQ2869284@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806144210.GQ2869284@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|BY5PR19MB3795:EE_
X-MS-Office365-Filtering-Correlation-Id: 433b373f-d453-4118-9897-08def3d0de49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|7416014|376014|61400799027|11063799006|56012099006|10067099003|18002099003|22082099003|16102099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	7XE9gYlpja1NLyqCaiqGx2xF43mUXGw/MIxmKgMreyFTaSO60NM3e+N02ZgY08bYZIom25WKLKHFUUb4iYZnBIy21F49MJkj+G9Uq29pLSadH3HsGod2+5TAJWTfNdwmjdcIMwol73Be8iJcpipiffK7peWd0sRd9AS727+Z+4+mmG5LolHgIeV1+mmiJTWkAZiMX4M1teO1ixX00pnwq9hMQ2fN5IVmcOZoW4qZ83MENl4EPOYxy0fORMx9Oy5qsygTplNUnpF+1qn4Ze2iehFN/2Rk1dAEK2oCkqlJs25NrrINYeWQBsYjSLZ5XoIF8mXlu2x+Frd2ZBUPq79NE9uIet9cfe5O+FIvxgpakZg8kTikFXWJ97Gi666/AO61dRE7SXsGe3kaW8WW2U77Skv48AInfZVlcKWBt5TOm342EuAQggTatW78tNjEZ0oqbJvGpUeD54uHs6lLcYilmcClm4U4padA/R7JgBWR1XkQCUMMUIKMa+KTeVQuCc7gw8B618h3L8BrIq/6tc2jlr6kJPPuQrm+PoNB2Fj0gvTSyCSLhu7VwMpEMPjt6hb/2Nmdl9kR7q+wjCI4K7vMPlQojWNlPELWGdTh/sB3e3xBqozZtuGB+D7Vwt8529/6QPmiflnwrj0C8zwnXZl7vn6NamR+XKr7LZLVNaGexqCDw4i/V7Gg4zh0SQucyJwWMyZw8O2aINO8ibirrW3fjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(7416014)(376014)(61400799027)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(16102099003)(4143699003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yzjODhjon+vWWKjg0UjHKDoKqHxpSvRI2RVsypPRqJz/pTe20Qqw05lo4T5JOdjdv2O4B7dZjSCJfXeMWyvNshAePw2a9+WL7q6sdRVotZ/lGAas4FeAzx74XSbA8ZPhOYPlFLG2lIz0mHr7HpKGZ0MuxTm6Y9/kWjzyc+y2Kj103WSEw4Muc4CXuX9MOC7FxlZeQ8GFMD4eNdx3TnQ7vLwm983R0+ZxW0gugS6w11uE05LkDYjBxQLZEtIx1s3qTOYBXuVXKWlmy5LN0ozxe5NhK0aP/l6VhSzsxhcaKIPzVm2HtPhPsrFs1xHnmQO+Xs5mlLZN1es62oNVibQAnFwxjvR0a4wX4Du0jeiuPrkgrSDK8AZkvB9bQnV/Q4vWK0v85EbHD5MS1kj5k30Oq569LnxzVgdh0A9HQQdFnAq1s61xppsuJrdtoO+3olWa
X-Exchange-RoutingPolicyChecked:
	Y6DmaOUNM/1Out2mxj48X+5FeyaOyh1tONZ5y2NrAwz4EdflCbLpOT4CrxLY7Oi/ZHUomGzo9vV/pUIkUTQc+e9Mf1HaK8dSdjQ9PeaRyySyChkhCLpz+mxkaEs8Kn4TwLe5ZiMtOfHliasl27oAzdCpnxI/04fHsgLHZEPtauEg39Kppx824Cg3XT4Otl2sWg5NZpWHnY3P47DC0gAA0jrWFxBOjew1O+TEx6sc08K01YnEc6QG3MVRlOPJJNJmYDd27NZG2elTZsWHLPapiGcQ0w33hoktkyQCiTh5JNTtuUK3qW1KhS+dZ54X2sEY9Loxr0JQjNaK9JmmCsgaeg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:39:13.9159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 433b373f-d453-4118-9897-08def3d0de49
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3795
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyMSBTYWx0ZWRfX7ig33r7q97kn
 bnC4G7EbkehnI3yN84LRdMGvrRwqvY3loIOh6FDsDQEhByn4D4IR/Zj7PHPYS/XDPvVppLRFOUG
 3Kl/uDbHE2Fgy73dcWTYkSLNZA3IGhM=
X-Proofpoint-GUID: dE300s_rheb-LJ_b_qHk6kASAQ2w3q0r
X-Proofpoint-ORIG-GUID: dE300s_rheb-LJ_b_qHk6kASAQ2w3q0r
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a74aaa7 cx=c_pps
 a=ASZrmc5qRKQ8mersbOLYOw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=Sdy7y7M3m05LAO8qt1MA:9
 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyMSBTYWx0ZWRfX4HCtZc+pVew5
 bGsKtRjd47/jaiLUZei4uDdptniu0RFlo4Q7qjJ8aAq89zku03wV4wlYXWw06eaobfZLdtx+/+U
 qczyaJn5umapwSZrXAtcpTKzoh/isPeRyNcp6R0uUY0Kqb2RuJ9cqeiCPQ1g3pyZjfolrDKrwkN
 tOG/HgUFBxVpqBon2dXnJdlI6rKr4I2rtbqZS5YGIIZDZjOvmqyUhJTxmXuhKYE2oKr0Z9j3yBT
 3+BzVDyMRtQBHLyPuC5zdok4VQExPlvROW36tAWdUKCe28E5mXPsPplSPxRnjFS8cvpT/DUiEa/
 geF1L45q/iFF1MGcFG3jVLNNxcoejdI5RX1yeuL2iJxGdlDSzQBuBUewD2TM4YxnONSDtOYqbXs
 aYSo2+p31ZM8GTjrlXMiZOnqej/TlBi3LU2ByqByOBd/X4buIQ5LnPqj5P6qZZhGzDXFEqPExOv
 i9qVmpRdOhYGyc2hDNQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Aug 06, 2026 at 03:42:10PM +0100, Lee Jones wrote:
> On Wed, 08 Jul 2026, Charles Keepax wrote:
> 
> > The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> > for this new device.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/mfd/cs42l43-i2c.c        |  2 ++
> >  drivers/mfd/cs42l43-sdw.c        |  1 +
> >  drivers/mfd/cs42l43.c            | 18 ++++++++++++------
> >  include/linux/mfd/cs42l43-regs.h |  1 +
> >  4 files changed, 16 insertions(+), 6 deletions(-)
> 
> Doesn't apply anymore, sorry.  Please rebase.
> 

No problem I think that is my doing not yours, I based the series on
patches from Uwe's series:

[PATCH v3 00/23] mfd: Use named initializers for arrays of *_device_data
https://lore.kernel.org/lkml/cover.1783615311.git.u.kleine-koenig@baylibre.com/#t

As that series updates all the device id tables and is much
bigger than mine seemed easier if I rebased onto it, rather than
making him rebase. My rough plan was to resend this once Uwe's
series was sorted out.

Thanks,
Charles
