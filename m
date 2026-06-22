Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA85334688;
	Mon, 22 Jun 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141323; cv=fail; b=hxgLjVAgdjf7kea3Ll6G32s0sFqdQlb9TfPnQvaH2Of49D95KVeRkKSokgZOwD75D3+tStShFGnL0ZYkRoNcxF37fZuALOIJEbzjy17p4UhnmcPUeUuJaoVdM9pZd2ykLKS5MJmTUwIvpsoCcQtk7NsymzN1szzCaxn7h5u9MtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141323; c=relaxed/simple;
	bh=m5hT9NAG40jLvxhNsz6nAo/zTwnMa88u6nHMgKbgTzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAUci6JZ386Rp4TPCef6TzZBXCahpVb9iMbJ5M7J3e+/QR4zStU3Tf+sVZMCvBXomaSiM97q7+75dCe4zrX20JPiEcTcWY1DaQ84rHvD5fnpu6lr9Orq0iVuMDzVaNMCqwXj7imOXODnVCawo8DgDYTM8qZp3q/59cQMRidMLG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IK3dEMVN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EQXqjc2I; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IK3dEMVN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EQXqjc2I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEMA392109906;
	Mon, 22 Jun 2026 10:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=LOsju+A6j4x10YLTVr
	haTqbNNqGMj30nldGOMQetyjg=; b=IK3dEMVN85/57xanehSA5B/pTg4CDCG4/f
	ql550ZKX003x80NKAT12dnYycZmDve0xCZYN1wkVDyhEIjt7dOEP/hfXEFebYrNr
	zNhhr9wT2WcMsY3jQPdTc2MZ2lwi1IubBiaGKTtDBMvktaerRzSbpEIW+M94w5R3
	EnMDyOvX8oGPzn0Dsn4kNvcZFnPXX4zMa91EIUArUyw0ASB9osnTVX16GKpk3YgN
	j0Ibtib4fXemVYTWJ/HEsmi+VgFfZzJ12z6/K95RtMY9TiNriWzxkqa//kYHt6ei
	djU/gV3ko0nGsDpChF+T7mnrhER0WAO71s0ckhYKyGHTMo8mbTcA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021103.outbound.protection.outlook.com [52.101.62.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x23ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 10:15:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv6lfy18I+KtdshMNZqN4AnCiITF2iFxWSBsBjJ8u27rmz0SWX4Zc1YTwYWInaRZgAUznsheNt+imHNGhl3bBMDEJVYm8/ob9ss7rv3pncBexKptpBnciDmE3fWy0Q2v6tHJh+QTpAT+u65VYtPoQcobbG2dSJNM+oVueLAQbSZbsnppgTHTxF/tXfz/z5VeL22c2uwFE95C7P88CaYHkuFsXeUQxxGpiT8/nugv0iwtEDwNkRJUxYXXLSxDlrtEJ6QS0fMHILWZilnRHSFJLevAIW3O1h1sQT0FOIT2QRcaouTXip2kdTfr0R2QjK9rV5P8aygdgkVWEpomsI4Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOsju+A6j4x10YLTVrhaTqbNNqGMj30nldGOMQetyjg=;
 b=v1kGz5QyRiWOZwhqQiQoJMn92cnUzr113priEJksU2UtgGym0DPgURjHblZn8HMYQ+CfmGFjscjRe+oo+uBhAkaL0ap3GvJvZe5MsS0dVdx3HNqteRwmkEOEowRtVsrTsVo1XkY8VetKL63PnKil17SWWjh0YzqLLw0uJBrrvNeSocQ5+ksNDRvHxHmkfN3iDV7qsv/D5e6FvNX9pAh2cc9W+LR3UGQP7sDY0yueyMKy+kKULenHC8Pl5SDzlycQ2LQ9ePKYtsRvgr3pcZgOXFSNl5AJrVHESmI7ARqYo5fssNEW9+vRYNHZC3ffr8x1Im6qv9NCFKiobxiqJnkK3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOsju+A6j4x10YLTVrhaTqbNNqGMj30nldGOMQetyjg=;
 b=EQXqjc2I5HOGMrZWPyWYqJnSiLVRX2Cztxb+kgHjEepNCf1uGF3unJB8CnT75YPOr7P6eQyygn0Kxlfzeh0OZhmz+F9ws1/UeOSUQgu0yZCHgeYy1ZgplGZr74mDcZaaz6C18uEOgml79xxEs+PJWj8Ajs8ejJsFjYfnQJJa3Co=
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by CH3PR19MB7260.namprd19.prod.outlook.com (2603:10b6:610:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 15:14:54 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::82) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.11 via Frontend Transport; Mon,
 22 Jun 2026 15:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Mon, 22 Jun 2026 15:14:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 20B62406544;
	Mon, 22 Jun 2026 15:14:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1075A82025A;
	Mon, 22 Jun 2026 15:14:52 +0000 (UTC)
Date: Mon, 22 Jun 2026 16:14:51 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] soundwire: Move wait for initialisation helper to
 header
Message-ID: <ajlRa0VST7GQ77tV@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
 <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>
 <3d39f181-0d40-47db-8432-2f22dd3aeefc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d39f181-0d40-47db-8432-2f22dd3aeefc@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|CH3PR19MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b65a9e-eb7b-4342-ded6-08ded0710344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|376014|7416014|82310400026|56012099006|3023799007|11063799006|4143699003|6133799003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gsxc/sXAJk7Rz0wtG6YHrRmxAKuxkflFmeV13hBP+pL3vKsvebzMt65B4K1gmq5oUCILqaMNVvTTHvnkn992ifscFXEW1FBUpWw5Id9mEbovPsJi7SjLNSifRrVBUeHudy7ZcRSr+5GYecrWC4gW5Ll0yBWO88g+TI36zUsWt3KMxkc+zouUW47I1b9ZUnl48ilncPazTq3EZ07EUvqUPY2q8Lnwah7RX+uxM/tI1FHmLy3lKJ+2vO9NSj10/6NhEW8ftgrWQ2x17UdXYhh2TlUfDE7OLP49ULEUibCl+Qs38JjYzjJB6f1lpxwpN/QpPX9qFrCO1vxOdEB8uiZP1qEIdwpHFkziF7GpJgcb5IJLtjGKeqYoKoCH/iVzl4xB94Z4+a4M2jienmdywjdEJEdEv4U5f+WvvlYos61izKmdWe549hDoUxjygGQ3MdugnOrIxRwV9hSoVZPLIb5QExtZ0MdonOXMGwypVc8onQhCmPPgGihxKLfHQgEw1zPoo6/xlHhOtKY/dM+wCbAKmV6y1mWJKM2L+O9qlxvcRyZ0TP954ysdpdq3yXwFOWjZRSSujsG6B4jnU7xJBthc8n/x37BUFDLRoHXQ0sib5iupa8RyLvkJbx+DR9q+6Sqvo4n2k+7mfk6Dq3bwFxOuqvwf193tBXia3/3oXBSEyxb7C9eP6Kp2uVyGUl48GKoq
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(376014)(7416014)(82310400026)(56012099006)(3023799007)(11063799006)(4143699003)(6133799003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FzM49DatVRpzPpvBcIV87vSmIugfh4FXLG0rPU9xicw+l6UYeDaQmVizRcBHkGu3mcXKIYSSo7S+XZU9QJwipJbUoJkOdPUG3uzprZV8v53HPFBIqQB+qvbXBaAhY3j87BGd7BMqVH91G7JLtPnFmAV0PUBZGNp5dU1iS6qKaiBHmOqfpWp3Z7h0YoHnj5m3CyK5n66KCgmBQ5Lq0URwCkGmOtfKasH7Qq9UclpHhQz1THJ0mv6xNoaTMqWQ7tkqJM4OrWGdOpw7jmrCAo3mjKpAkKsyO6He1e7FcjMMZbXRFMkDwffmBpEUT9HjYiEl5PYlRBH/YuFQz9hqNhd1+4Ti+QWXBFvYHzYU/GrujrgJnUy1LFldGX5rWYCPB3zMP5adLNEVW8jJSeKsweIJuktsEjzi5G5pC8deBKcsvfBVQhQ3TugquBLLZnjEq0fV
X-Exchange-RoutingPolicyChecked:
	CWQZYIYc4K7AYxAtps1ArJ67+5fUE/8J0r8OJ1nN/tkgo9uzNYIHr5LRvUlpC+jBeTPCjXbHE1wupemEHTeS3h3VPmkKJbucCSjvtSqpSmoEbHIHrxdo2eYmbJ2ISqR4SuRT0j3zlMNzsMtQvG39pg/RyNSe72DzGZYsqHyfovHHAhvoxM0lGzeLFJshzsPwJJmnU+cw1chZv6x6cq1e3U0uyiWlr459EpeJf7O4F5M3LK6p68cqezPEMd8JXsLByuPb5+wFv1ZWJYzwohIyVdlVa0brkU5qi1Oj9tplYVJeIchyGe7OxirlNn8VTPvFCC+9/lnzDUffYcjCdVbdpA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 15:14:53.4648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b65a9e-eb7b-4342-ded6-08ded0710344
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7260
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a395177 cx=c_pps
 a=QJ8jp5v3SeQRmo9gzrsiOg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=-ZefVtVYjzOokVRnufwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfX4daihE7Eb8Vm
 JRwk4xmQBLwgau8iQWz2xG7axyhajIn9h9bGsSwfJNkDBmi/1f8lbP/d87r5YGDpIF4HlKrJnVr
 i6VHbX5Igf+XhwjWAU/nqEJNfPPyeS9O1H6KEmnFbgXpc5c+AY8xT7Uw03Gyul1HPaKLIun8r+E
 r1t7BKNoNa9uWg1BmPEupo4EmgPJE/ieQFamYFC2Y/Np3wuQ4UAGePIigXGfNtAVhUse3AMZtIf
 0GB7UvKRWFqHSHYoRE57rSLGhWwG72he+YwbeHIJnEtsarHUug7MBGDKt9NUfX7v8FxqNdmTXN1
 xueQu9PyT3Js0XD8IqcBDnw9WPcLUE7h2RQyUTubiaNbSOFpK0aTS3HVKGI24bMsSrQ1lL8BGwZ
 XQDkMfKfBKCCVxIwL0MIiLhszrAHl7sa4/GTI5ZEBS4Hqr+dgaRHu76gtHNHk+1a+Ud9+Xp4LoO
 ozOz0luyYmQpgkcX8LQ==
X-Proofpoint-ORIG-GUID: 1MgnTxJsymY446VlQV8Jepn1IM5z8UJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MSBTYWx0ZWRfXwieO10WvSYuI
 10Yv/Q7FG7hGbgn2H5hI5MysOaFdxroj1SB4oAk+iwhlf9CXaPmpZJMxPYlQv6vEGMvNxlU7zdp
 111NhDt3KVK0/eYjzB1Uoi7GXh9qvRk=
X-Proofpoint-GUID: 1MgnTxJsymY446VlQV8Jepn1IM5z8UJB
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 22, 2026 at 04:08:54PM +0100, Mark Brown wrote:
> On Sat, Jun 20, 2026 at 12:02:33PM +0100, Charles Keepax wrote:
> 
> > As SoundWire devices tend to enumerate on the bus after probe, drivers
> > frequently need to wait for the device to initialise from common driver
> > code. The common system is to split drivers into a core module and then
> 
> > +static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
> > +{
> > +	unsigned long time;
> > +
> > +	if (!slave)
> > +		return 0;
> > +
> > +	time = wait_for_completion_timeout(&slave->initialization_complete,
> > +					   msecs_to_jiffies(timeout_ms));
> 
> You need to add an include of linux/jiffies.h for msecs_to_jiffies()
> otherwise we might get build breaks.

Good shout thanks I will do a respin.

Thanks,
Charles
