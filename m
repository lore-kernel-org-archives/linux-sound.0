Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750625F7A5;
	Thu, 18 Jun 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771536; cv=fail; b=WDVnjxebx2ci+g5b1v4xHoOkzz+qM+2+2w54qIUs2I9T2pM1REdn50N1gOrbkZy36rpFu02ujMQp6MtPjDTfCJPPZhBtHbrwVZOHaCNF7g4w/RlT/SJneXvX319YuhI5Dx2GpVcLQvZxy1jZS0RL7ZPl1oM8I6l978AMSSqVaFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771536; c=relaxed/simple;
	bh=lBR6UIFZ9t3uqXCpdSWC822JBlk7SchmJPeNrcun/l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAqopkbY5VsXGlXArNh4EbTBVtSCS+5nEZMRSiNlTkYIoRV2E2vABtQBrQV7U8OOWYNUuWFtvAzkMEy7GNHZ97dB0KaJ5DuZQ0tBkl0eb7pDioseE5iUl3m9MWUZqEQnTiu0Uer9338Bfx/OMFiUevDAxnYu+wE9a5WQKtiYVsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RvSggrb5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nDaGsyrY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RvSggrb5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nDaGsyrY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I3Us081438936;
	Thu, 18 Jun 2026 03:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yQkKjqxB2EWjFp2e9h
	M4U35YEtv8LOjgbbBrqu86wjM=; b=RvSggrb50+5lxtd/tFpvJTGSZ1D6Dxwjyn
	FjvEL0rAs18fr/pCnc+f6DVllLcfLdOzL1IDA83JfBtCMAEAm3cQPZ7AhmYk5+u2
	bcStazo1Ima3JsusO0yNmRIDlK03D7LtTmF5nKARbqtPTuFslLOvbPe2cH9ZJsZL
	u+jUrERSFN/kTK47eEpRT9XvARn6nuhNdj+XZNz5wZRwKnE7FgBGNrXenysPNolf
	4Po1uwkTU+a+/1+Rsur/kDv9exgyyAvVHTBDWG3rlkIu67tXWihlfL4wg3FhPePg
	gWjuJzG9QlBDpN2100g4etacDT9fps8VbNci5EghtCXj+1+RyNOA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee3acqn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 03:32:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxkgcY+xygdHPkGVuvPo6c4F607GEhJSqqGWG+ItrZpg/bvbT2Le6nif/UBF8eBzo0CsAIxtdMSa5GRdECR7j6naInQoOuavePkz0MlzjZW/xPjAa41UjkuqDjR9AhQuoD9Kk1i8d7kF5SH07CiWQvyQRt+c+Tl2lQRMvY7VdTzyUspWJndqU3cI+3lyTYGOWlNqICzyn1o2E4X1Uc+gEBPYMFG8dvCDuXF+vFvh0/TkDWabK0TtpLTGW9rKGrQgUReFMlG/wmrevcOpGqC5KW707GRIIKlMDltGbWRcV9KrbiqNm4MH0in+HTCnThwCS4nGI7S1YkdBGMEe0Am3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQkKjqxB2EWjFp2e9hM4U35YEtv8LOjgbbBrqu86wjM=;
 b=UGd9vtyBI5Z/bWVA6WXhuQwSmNS0zFEsbPxXIVxv2mHwaYTno7u2T4AC9O+9zy9oLAFHlAN5Y3M/gwaQWdFYbdeYCvfRv3VPRvcQ4Qqm8bFUd0cALZvLk9dkKZcxN866DAxAn0r53eohurLoMocSRI3HVOIfDIe9bcMgJNgmO0n5Vs4Cz8xlISEFFDET2F+CB1Lzhx0FpHYK4a0xbEAAsKn/hklhhW/bLDXJVQKEzLXljoaIdMpop5pEoV78MMvT5MXV0bAquFhTnZYBl/7v+PIoXonO1M8v7INVFq9bm7jXKXxNspK/dNp5RihJG3zoHqZeefX0ajq4jwfslbBuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQkKjqxB2EWjFp2e9hM4U35YEtv8LOjgbbBrqu86wjM=;
 b=nDaGsyrYNhft5fD9hm47XPjywIZ6ltcJUBW0fXDyWY/ZX1jZYZkQgsWmWcJ53pJKwYMfYTIBVDMDS23gqvphUm/tltlQ00oDVnQ5/d5RdxwATkUdKddxknp8Dv2sE1MFkXr53G68GGU5IY9t8b3vSXd5iVKg0GZINr9P49bU7Bg=
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by BL1PPF7C39D9BA6.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 08:31:59 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:59d:cafe::1a) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Thu,
 18 Jun 2026 08:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.0
 via Frontend Transport; Thu, 18 Jun 2026 08:31:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2F8A406544;
	Thu, 18 Jun 2026 08:31:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA61882025A;
	Thu, 18 Jun 2026 08:31:55 +0000 (UTC)
Date: Thu, 18 Jun 2026 09:31:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Julian Haarmann <julian.haarmann@student.kit.edu>
Cc: Vinod Koul <vkoul@kernel.org>, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost device on Lenovo
 Yoga 9i
Message-ID: <ajOs+nmrxVPophnh@opensource.cirrus.com>
References: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>
 <ai2eWeTlhFtNWpr9@vaman>
 <ai+5CrWRj5lYv4F2@opensource.cirrus.com>
 <d3d88133651998ec4cee5b831978fe8e4c16b14b.camel@student.kit.edu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d88133651998ec4cee5b831978fe8e4c16b14b.camel@student.kit.edu>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|BL1PPF7C39D9BA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d64f29-d6d4-4acd-952d-08decd140fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|36860700016|376014|13003099007|16102099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FDe3cYAPe4A4uKq+vRKOxcD2wCrPrUj9jgK4X6aWfccZbrDVMGRC81/KVCLyT77oT90hxKK7UESLlin8Sxz8SEBFeo6E64yp6K9aWNPCenypcRPp+vl81pHrP1zqw72+SwWTAJ/0H/WtKI80JsTCZ50sBBaQ2goEKz+GxQUcUsZme1e6aZ44X20tTTHjOz39sNBGsXbqszk0+nJTIQJRa6iP15nVc0iT7BxdO7b0s6obC0I5G+aLgdZFmjzEGVwK8Zx560wXpsnN7X58KNdEvdECcBeq+n53nGzPldlfYc5ru+cwmus4iBOcb5ue+XMFX6OoF7/8pgN0mfJbgB0lL7mqXnMrPJFVllTtCFbTj0Lz1Otm/W5OARFjV18fZdCE2sfBvDISyHgFKKcu+BuwJmpQbmCHVz2tsjczHL4Twu8BKAZve4Th+88owvSQqCqJE1Y5x+KorR3oEegop9+r/6ImAZ7nQMlusfuxsmTYnt+TryR5LUnzZaE2l/I3A/WTpa0xaFjeCd9JvZZK5g6HIgIOxysX9AGbX/N1eczA7tFuLKq7/Pttk8CjeTHj6SbUn0iDpjjCi4rCVEvsT6KNMFv3dNmSaMHi0pXF7nmUKyvlO5bhhY100L9ROiy9kFRXOAX/tGCpsmJU1D3t5uUFCJY21jL8jElElCb0rFWiQAhDOs8G6tW8hiFcUXuj6RTnb+RmmpCU0LAAIh8waAuSTsWaQtVt772v9BLPe5sSW20=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(36860700016)(376014)(13003099007)(16102099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LPhMgNH3BgrCxUjiUaz3R4BzfBi5O5mlWyDILKT/ixB+8DZSpKWOHuAqUK0xmWcnhCxHZUlE2SxN4TAOM1Zf1p4V38z2XYaGSKRkNnPKHYIek9K/cp0F1Pt888cIvdDp+/KZLpA5i6hTfG+6mNdhx7+mar6jhwWeYAKCeJls87sCpOQDLSp01WrjB9F26WxJNCNJZlbpnh3vFV0wOONvnlOIukmBL+JjBtWlnsj/iGzDna9fQ2Hs+eDP4D7xj9HM3Mmh7Vv+1jBG2JkfU78+LC124FUlOTcPY/IaWNRwH5Kk00VOpTJbDQ2Sx08HUakvRwC3d1NgpaeWzauYND7u7Rui12Yi/jEDQBGo9fC+xFZX8uRBWeMaHoc02DE/+iw04QLTzAFnNRI16SRK3Yt+kxqVEnALcCUf7QEgoqfrkXsU/us5OxqmEUo/YOziKhww
X-Exchange-RoutingPolicyChecked:
	cAMeEbxfuApJ/YD7OJj5m89NLodbX7U7jCJR3wxWNflnQcEZdU0m6FPXO140cXOkC5sPCC+uhJ5d9aNBrghrKbNuMlkqFW07uj2MxjDv2o2kD5weTKfiP5IgkieznN4poKItmiNWYgfHqehccX/zsZE+Gg/TG5PYjKo29dpSkZBL4Hfx5T7ZFxhIZwAutkOWaHq5wcjlGoz93eH9SgM1kJKiCqPn3/tlPG0NVoXDDMyd18qboTAo9AVfluB7p9IRCTiyJs39MX9ZQlEAx1Xc37GagK/y8Ug2dJd2wpojebb+DT3tQIpKiDIUNjXGPPdxyhEDxIcSgjSE5C5ytUfdFg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:31:57.7872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d64f29-d6d4-4acd-952d-08decd140fc9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF7C39D9BA6
X-Proofpoint-ORIG-GUID: FkgxTj1Qb9dYj6jxD92f1EdJYQ5bEikY
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a33ad04 cx=c_pps
 a=kzlga8Pj6Xs+ezKxcisf3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=6vBxKGGt0d0uFLgCzegA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NyBTYWx0ZWRfXwDy5wWcuQ62J
 CLkV55VXUJQvJVtB2i3FttFS9h3F0VCqW1kM2DE+e/SIpjgft51qvewX7mh4jYZv0c5d0meMdFN
 HW6yoRk7/eHmjoe35r8k8mfITU4sa1Y=
X-Proofpoint-GUID: FkgxTj1Qb9dYj6jxD92f1EdJYQ5bEikY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NyBTYWx0ZWRfX822mDzQoFha7
 bPdN4Q/AIejno7xS/i4JzrCN8QpkjlOlGukkFYmQkX+NkdyHikh1IFDESwuRETQZZ/IW1t9a+u9
 CC9FITfJrA7SsNo8yCQrqw+VMk6DJ+b+CgH364GqmQtqvknev5cAVb073gmHEyy3CZZaaNlNjfa
 ggYtAlbSsrv7m9HIW2QlXIv6WfovLxRXxrRBJhk/9PPx+jPsFXpiIzDs3gGGKa7G7BK54Lgcjwq
 bMhmf5MbPpEJFzQ8sISWA7ndHS2pvJEocC2L5txOgErBsWA1cQwkCWTkwniz4KNCQfgysXS4iRI
 BcFyY8E71ti9OwCGx57sxLCwEgGs7yzJGw9yHF/ZZkY1BjOYzPwtRIIzXKPkARy5Jy4aj5Lys/9
 1eRG0VyvYAxsKKjDeyKPitJKdWysy/KeiWMy2Xbq9FzsKsnphxfjr49aNEpXBvxnCDhCKbE0tHY
 x1jxw2gYvTTqy7vG5yA==
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 18, 2026 at 04:25:31AM +0200, Julian Haarmann wrote:
> On Mon, 2026-06-15 at 09:34 +0100, Charles Keepax wrote:
> > On Sat, Jun 13, 2026 at 11:45:53PM +0530, Vinod Koul wrote:
> > > On 08-06-26, 17:02, Charles Keepax wrote:
> > > > There is also a "non-pro" version of the Lenovo Yoga 9i (83SE) which
> > > > also needs a quirk to disable a non-existent Realtek device. Add this
> > > > missing quirk.
> > > > 
> > > > Co-developed-by: Julian Haarmann <julian.haarmann@student.kit.edu>
> > > 
> > > Need sob by Julian.
> > > 
> > >  - Co-developed-by: states that the patch was co-created by several developers;
> > >    it is a used to give attribution to co-authors (in addition to the author
> > >    attributed by the From: tag) when multiple people work on a single patch.
> > >    Every Co-developed-by: must be immediately followed by a Signed-off-by: of
> > >    the associated co-author.
> > 
> > Julian, I assume your happy with me adding your signed off by?
> > 
> > Thanks,
> > Charles
> As discussions (https://github.com/thesofproject/linux/issues/5801) are
> still ongoing on if this is actually the best way to handle the issue,
> I'd hold off on merging right now. I'm adding my signed off anyways
> because I'm not the expert here.

This patch is fine, its the other patch for the weird unknown
device that we are still discussing.

> Signed-off-by: Julian Haarmann <julian.haarmann@student.kit.edu>

Thanks, I will get a resend out soon. Probably after the merge
window closes at this point I guess.

Thanks,
Charles
