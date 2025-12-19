Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06C306B02;
	Fri, 19 Dec 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142079; cv=fail; b=HarovaCR3or8i3Xr38fSdHI7mR2Fo/Y+DMz/UNHxaAvycalXDpXnXfi2S+uJyyXjx/saf5GrG2Zn8MnLFxatXfv5uXuxFBYCW2cs9sCIZAVee+gLuAJ1kc7OqD+59SpQ/wdQapi0Q/t1rtC0+I8kUrnASoz2HBlWccqI9iBKu10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142079; c=relaxed/simple;
	bh=zMNchCezP+sG9w3tdgUONMNumKLV3CkhkNVX0gEjgXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP700KiH75qn4JkZ9UxGGU8YerYm1SRtlxJjHqyxFHRbQZu07N+t+D1+Zie2oneVYgD4kOY6uPSU6Je7UzVv8jx8G2J0vmf2UM+2/skoQVPAxn4TRImSjd9jdDKBixmh9EAYvYuwftwzh6mAzN3nOwIGZEx1F3TuxLchpOSECuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QSSF5bQN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NQob7Xmw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QSSF5bQN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NQob7Xmw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4OkMf1277904;
	Fri, 19 Dec 2025 05:01:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=tIfiY9e+507OyNhS0R
	2++ESVWZoyaYH05oSoDa0LKTw=; b=QSSF5bQNCKl/9dt3WqGXcx3Dsued4XAGzH
	8WO+7d/RicrX7jmfAD2uO6KjExjSo381GLFd0Sqk6BM6D+nQeGFlAIpY4pNTXOmH
	Q7NDq24l+mVwIarA2IlHzYMjS0X3oYN/ELixMhzqSe8PVbJ4Dj0OKeGo58aKfMqh
	dbwkYwwl7ZEW9mgXK/jzbTGlVfHNOCyNGMDA0/xD7AU4NfXJs+VwZlM1bHUNR5Jy
	AXnhSathXdJgx+s9mOoyN3IQy+RVAF9harVe+/3drbqvrmyJbP21vPNAuRB9khL+
	RzOpvfsypNBa5FVby7URdn7tib/D73YaYiFfQI4R70JwpROwJ0Bw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020110.outbound.protection.outlook.com [52.101.193.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b4r40gqs1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 05:01:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkfkHt6zS0I8tua9J47T7egY8Kgu68nIvvBme2IoSntKu64NmregidP0YagY7dO3rLTkQia5gvCuYy10a7bijsJHs9X0OAaEXED/r8JzGu+NKMkqs5sM0gCvnYzX11lO0Odsx4Q3Ear21rcmjWGJ2m3p3xB0ohq8nDBaFcdIJnOuvgbJ7OsCSiZZNpXpuomHikIePx+iuZj+h3Hh4gxFwjWz6y2Ov1p2DyUUp3rO1pmg98hXbVDjZekZtWtu3YQ30iI+1WLiIKgJLVKH7i9kIs2HnA14iPkQI9/WF2zffozTZ/4CB+17Cds4y/IBJX7G0jgRtvqODZHiy3LZsI0RIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIfiY9e+507OyNhS0R2++ESVWZoyaYH05oSoDa0LKTw=;
 b=SvhizeSD+vx2PCmF4ZDs+S4PxPUgpZNLTKbJczhU6i9zrboxero8AacIvfNY4pNyLcwD7npkEsuEiVDR9VCWBNp+qghVawBmrMVoR1wOHBNeJDpom2HSIjkaOgoHMb5Y3K9UNdK/6aU+/8TzZpbGsUfjWciI8lNY5SgV6zjvr9dxQsaeylDJT+RlTKAkxZ92fgae67TnPsI27GIszji4sOYFR6hJjSDDI7kZ0oyx097b3OC1v6Xih5CiVNUOMgLurkt67bruVzuhCz/V/zAHGa0+jVXdEvdpt7EBf21isdlilMt+kSLj28BoyFLi59VuSQD1ht+tjZc2cS36kBg7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIfiY9e+507OyNhS0R2++ESVWZoyaYH05oSoDa0LKTw=;
 b=NQob7Xmw+B9Zq2IUhWp+9NbwM74l8vCP0hWtX+GCb8IcZbtNleIsjDoYcPyKRdSRzrNkMxtmQqMolxvaIc2IjX5PkDvWzg08Q+JZ1XVimQEich7qpxONHw7g7LFKrglh+JO1MDHszcYrkYzVSIBmsEwoAV4dTkh4Fo0cbyQN/AE=
Received: from MN2PR10CA0018.namprd10.prod.outlook.com (2603:10b6:208:120::31)
 by PH8PR19MB6644.namprd19.prod.outlook.com (2603:10b6:510:1c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 19 Dec
 2025 11:00:57 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::77) by MN2PR10CA0018.outlook.office365.com
 (2603:10b6:208:120::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 11:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 11:00:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 422D2406540;
	Fri, 19 Dec 2025 11:00:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2CFDF820247;
	Fri, 19 Dec 2025 11:00:55 +0000 (UTC)
Date: Fri, 19 Dec 2025 11:00:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 0/3] Add support for CS42L43B codec to CS42L43 driver
Message-ID: <aUUwZpCBr/p6LUz8@opensource.cirrus.com>
References: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|PH8PR19MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbf29d2-2bd1-46df-e835-08de3eede285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cs1i0VJro3T0N601ZK0zk1Y4JQ8LyDH9LFV1iL6zIm0Tc79ZZyvWJhokKAa8?=
 =?us-ascii?Q?kDfsa3B0BNU8Ab0sH0YcsJ92OtwMu6dTu8G8hJWYYa5Va9FwrLouR92HOkgK?=
 =?us-ascii?Q?GXC0CfcpTI4IJHSRv0JqqHge0dFtUJZuveaXgBnxPzEj61TITPD8FVHt9gbo?=
 =?us-ascii?Q?NAHvoYiDUrb39aIpfnuiWL3PBT4whk7/5UIBachu8UvEZCSCtt9ZQsx9GPBh?=
 =?us-ascii?Q?p+X1W1l2zDzIxOkPGdrT1RyCJ3PawKuV5e0dr7CGqAtzNJW4FPFNIJL6EV41?=
 =?us-ascii?Q?W7eT4vPsAjnmBzE8a+8B9c8hEqL3AdKTcCJXnL9q1dWnl6JDBVb9rt+Q+mDH?=
 =?us-ascii?Q?iwQPQXD4DW0seXsyzVT1tg/qkZwP3HBMOmHcW7IzNLil19JkQC8Nn/EVAF3g?=
 =?us-ascii?Q?gq3gNRo2ms8F4jhWQ6WDAZSUBpNWNgPMjUCcjS/0T7eNo0j4lTR5NFe9yiYW?=
 =?us-ascii?Q?yOMuR187rR/k5j+XcP5sVi+m959oMQax0CssJ1tCvVLgcxlpb5J+qBPzK0ls?=
 =?us-ascii?Q?XNkKjpFNsxWjkBLtqH1rEVCZFxUzAjah+UmjEnzFy7rbJyLh4barkjcf/b3L?=
 =?us-ascii?Q?YfNVOz/0FdRjl3XYlpRnuOUqKjQyF5eXooAyznxpSjIz8acFd86GomKOpo/U?=
 =?us-ascii?Q?LAl2cBDp57Ggj5w0kTy0WZRlJv7T+UicGHUDROLo71UhjHCEN2RsYf6OISWj?=
 =?us-ascii?Q?5XDgN7Oay2fhiVaty9uwSF4TjEvQGqJiOYY25XPt8nXB3D0hPk4vDNTvxWza?=
 =?us-ascii?Q?xzxB57DwSIklMF+K9TV2lT0i+4hRM/E9mU/yGbLzK4WdiDb11xoGQHbeI5bl?=
 =?us-ascii?Q?WuNOEwPwEoxTirx5wcGeVjjyzbCH9E1HdhwZ1zgVaO7JHNdYeHVe0t7Xr/fe?=
 =?us-ascii?Q?en/g9yxpZCtNc6M0bZ5NfM2tcXJIh6pQN58D/idGLnrwxIYwb6UbcNQn0W7P?=
 =?us-ascii?Q?o0NKyCeuAKh3kKctZFuuQwZnrhoXc0lKo2UXw0AHeiaI3+RHGnFPVupRctqf?=
 =?us-ascii?Q?LPtNRMyqx1yIRbhTuV8D6TTDXrR7LsdZHcxv6jXRhxQIDa/4wVxG4vT0DpKp?=
 =?us-ascii?Q?HTv2ErPARa0IofEnrMT76evpfnD1b7Sm38XO+otK6mH0fMZuCv3kdr8qROeV?=
 =?us-ascii?Q?TI0zIqcPgya+6/taUxi1EZEoTnCzNiuA5v6fsImNVqCeS6NCQapN8Cgq365f?=
 =?us-ascii?Q?powITMNbuvxBo98kUK0yrEXYILUq2nB4Gr0ivFA6HiQVF0sLBLxYeXu1Q109?=
 =?us-ascii?Q?L9gEv0xZPUtwcdM2n3QKz+iiqVr4vgS43sXUvAz7KQowM/fvnFt7UgyY7gVi?=
 =?us-ascii?Q?txQ+rIie+40nCPt9y28ZkbMNdnJQegNooIjqgtMRL2IA7mPt7HrZGYawlGgv?=
 =?us-ascii?Q?yoFGIQfnEEiKKRZ9TO5JF95r47tt3JH+LcthgmdNRitZG2gczdnQjhxamtxS?=
 =?us-ascii?Q?k+uq9S2UWlP5dNUtH/h+T1qr2Z9dD39OTRnRvK+v/anul34enRgO79o1Q1xe?=
 =?us-ascii?Q?9cRCg7tFu5rwiaaCgGsG7DBYJTZjtLJ01P1Eg37YLHnSOpY9pSxMAbBPdaac?=
 =?us-ascii?Q?sZ4UWarKEL8flf9+k90=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:00:55.9732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbf29d2-2bd1-46df-e835-08de3eede285
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6644
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MSBTYWx0ZWRfX9GOvczb9pieI
 RN5xNZBNxqEosyAyxbKGdwdmg3ePngDpV6J00wmXrA9uIs8LQm1rZMm8k8LpwkFpT8F9ZjuhcGi
 mxJZTUcMr/Wa2Xgw57ySnX5ONa1i0yrKLWof0mgUtPe16xSO4i9Qu10KmjWOf6uolpBVGNOZII7
 2xXU6f5s/2Hvsckr5OSnQGr8V6fYHj7/8UDIVv5qynjm4VVe9C/7uSuOIw32yC0K8hTE/i7RZP9
 zXe0yxwhyl5LsdCj/ze/fH1GRKSE2eO/ZYoonJZPGHnNTuYlCDqkOkBIdwkyJfJTwh24WY0IlQY
 zdFwaJNO4CI4kEaYSROzJkqivkRZphOkJ1uyqNJbqM60hzb71XEhlmbkqMRyauIe7n/CfW88P36
 2M0aAIbP77+dG7wDdomerazhv+E99NI9Ikj+n55ttanuZeCcsMXM61JdG8MFHQmorVcpwpNgEr0
 U2l1W41nSfXPTSWXu5w==
X-Authority-Analysis: v=2.4 cv=K7Mv3iWI c=1 sm=1 tr=0 ts=6945306d cx=c_pps
 a=pY+kOdcf8RAo0+yonGAjpg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=-UP-5yntCM8b-w16K0IA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: STSge9HawpUJh_MH1ClNUrncd2ylZ1Uq
X-Proofpoint-ORIG-GUID: STSge9HawpUJh_MH1ClNUrncd2ylZ1Uq
X-Proofpoint-Spam-Reason: safe

On Fri, Dec 19, 2025 at 10:01:52AM +0000, Maciej Strozek wrote:
> Hello,
> 
> Introducing CS42L43B, a variant of the CS42L43 codec with changes to
> PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
> ports and ISRCs, and can be supported by the existing CS42L43 driver
> with some modifications.
> Support is split into three commits:
>  1. Add CS42L43B codec info to SoundWire utils
>  2. MFD driver part 1/2
>  3. ASoC codec driver part 2/2
> 
> Regards,
> Maciej
> 
> Maciej Strozek (3):
>   ASoC: sdw_utils: Add CS42L43B codec info
>   mfd: cs42l43: Add support for the B variant
>   ASoC: cs42l43: Add support for the B variant
> 
>  drivers/mfd/cs42l43-sdw.c           |   2 +
>  drivers/mfd/cs42l43.c               |  70 ++-
>  drivers/mfd/cs42l43.h               |   2 +-
>  include/linux/mfd/cs42l43-regs.h    |  76 +++
>  include/linux/mfd/cs42l43.h         |   1 +
>  sound/soc/codecs/cs42l43.c          | 745 +++++++++++++++++++++++-----
>  sound/soc/codecs/cs42l43.h          |   4 +-
>  sound/soc/sdw_utils/soc_sdw_utils.c |  54 ++
>  8 files changed, 805 insertions(+), 149 deletions(-)
> 
> --

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
