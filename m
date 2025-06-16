Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903820C030
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090752; cv=fail; b=p9ejaicqPOgBWzqXz/x3ZzVDVzECVhp3//2NBfhPOc8xn3xvq+dWHsZop1V0iyBOUs/IY8Je4RHW6jt3uYQxQrwEO7VLW8m9dtGNnsPKvcX+xkJSKw8LOXhp7CV+niZVJtz8fs1BIgZ6mEknS6yc6Lej4QTgMBCKirNWqn+dvug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090752; c=relaxed/simple;
	bh=+egpKDzJc2qnsLh3DmH6/0E382avSq4pOZlI+HSQMgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ1mRc77cTry+Fm2QHQc37Gf7QHVJ6fC+S8uqOAaX0Ibd3T4xe0rjQEY1uMbuM3XzFpiP5Sw8Xh/Q2O1IjmMfAzE9sYN+ZQN9LlmzBUiqBmIlmoBdFuM03eA2rtbhB+iEEKXK5sjBzhEbPfNFD31djc2GCKZFLX3quEIGjhiJaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZNokxeuy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nnPf9Fyi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZNokxeuy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nnPf9Fyi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GFiteK026825;
	Mon, 16 Jun 2025 11:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yMO8ZY53G21J4pvVO7
	LKb53U3XKLcJSMycTyz3mmy1k=; b=ZNokxeuya02+FvPVfn1rmDpaROuAzTXdOt
	S6L8PO8PMoOnfWr9LCASJBoIr+xivG0YM5/RkQWPj1Qu6UgjmICbvHz5J0uVnJGx
	JJhSC1x+k+MHlLoGbmi8NgoUTKEdI+u+fnGWhPxP4K8GrKaEGA+sb3D247Q1Vj4y
	W+9gMRTTSrHZbhgEuEONwvepksK7tVSWRoR56xPTXVtyuMj4b4HhfuPvdvHmd1PH
	SdJtKgx+qfG+eO9KwxknalZ1izSQMcRvSGvBeqf7EziU9B/itU/PTNHgPrfzpIdf
	e+F3Fw2mzpOqzQ7ApgbOin6y5Qs+LVpMuaT8ynhyPOnF2rt/N7jw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2126.outbound.protection.outlook.com [40.107.237.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47ap6ar1wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcq+lUjSMPxX8//AWmAiLtk+0GBvdfVnlXA9g/nQpukN3UaXv1jy9i2eqt6wBr8ZQOggnLy9zSmmZijSAOS8QemV5jK+XVI32aBRRn0IhGa5HxfvpqBx1xU/IluPAnKOHtVROrHR18nj7AiQQeznDle3dl4Eq9Twj7ny4O2s0Kek5pI1hsjYUt6TsW8A7Q+8nCUJ6Cgl0+l02nyoltuXs5QOspUyPpHRcHFVIgRyLSieAxrL8zttvyXaAN3wiFq2qL5baMU/0KM+NJJHivKkT0+GnR/yTiLKQVY4rFrMsNnwNbGsTYwS9zwah6P6b2+895Xu/4O4iajn9f6tMVtjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMO8ZY53G21J4pvVO7LKb53U3XKLcJSMycTyz3mmy1k=;
 b=yuPObPRi8JXeS3SJmp4D+luibwJv0E1vdNymRvtPeMvZge5X4YhyOF992n/zDzoWIvINNd8/kdcWzMIV6dFm/s8JkoAhG9OMkshv7aUYyUT0pfapDmwQo8yR0ZZpctPRijbBOhb3y185/h1OiIMOF9aRTgzhmjkIh5m3LJgUOStjkgBE93TDYS8YX4l4iTwmxi3DhWVzWWvP1jYgx86FqdlLwOXnBPR+wsS1lTUrUCBX3KYYVZ41htKfzGOwpgjDxQEPggKr1YuhFzmKtNmbBG0wvhA6FQtelT2f4sGkAmz9tLYHkYy6j94L0Y/N6TWlRuJgjClGxB3gRXIl6mHnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMO8ZY53G21J4pvVO7LKb53U3XKLcJSMycTyz3mmy1k=;
 b=nnPf9FyisdbwYBXnqyfPmPvNgyIcNJjrqxlDwAVO3pntI6oiKkrjo0tOhLEDz00e72n5LROZcLcRJyTKg+DmcQZ5tL6NJabdJKtORWw61LTdVmiFplnWuIchLQ/Ro5lHB0RcdA6atDrkL4ByeeBxxWrFYOwycachEdJMM04JXQI=
Received: from SJ0PR13CA0110.namprd13.prod.outlook.com (2603:10b6:a03:2c5::25)
 by BL1PPFE15AB0797.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ed5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 16 Jun
 2025 16:18:40 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d6) by SJ0PR13CA0110.outlook.office365.com
 (2603:10b6:a03:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Mon,
 16 Jun 2025 16:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 16:18:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D06C840654E;
	Mon, 16 Jun 2025 16:18:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B56B3820249;
	Mon, 16 Jun 2025 16:18:07 +0000 (UTC)
Date: Mon, 16 Jun 2025 17:18:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, jikos@kernel.org,
        bentiss@kernel.org, linux-sound@vger.kernel.org, lars@metafoo.de,
        flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
        derek.fang@realtek.com, bard.liao@intel.com
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: add a HID device for HIDE entity
Message-ID: <aFBDvofAhqwRYtQj@opensource.cirrus.com>
References: <20250616114929.855496-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616114929.855496-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BL1PPFE15AB0797:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c302f8-fdca-4c04-cdc3-08ddacf17427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94OXbBYD6s+k2lqQYiEMe7hyx8c/XT4aXweN4qJFiYcAMmd0b+rnxuGu5Nea?=
 =?us-ascii?Q?vCntM+WYk1kETgpR4KaI60p2kGJpmVhJpeLyScHhU+MlpIo3doDAkTRGKE0l?=
 =?us-ascii?Q?OIULSfjMyQn0IY+gKZ1sQqCWBTbURsEXRdCz6AdoNJE56PbIDnlXXbcFJ/9Y?=
 =?us-ascii?Q?FjRo6aJCbmF7h70U9DStC7P9znmNdR0UVOrg0dO8Y2Qsk8/YYBpIcwjaH2qU?=
 =?us-ascii?Q?RdtpjkPMLtkql29DI9w4VMJPlqAwbWYEHEUlnw3X9FQLNVji5Z6GAfxhGzKm?=
 =?us-ascii?Q?5st2q9pTOStWcSJtQpuPKOSeD3zzW6axjNfSJbOAFN7mm5edoRN/6mDLZnSQ?=
 =?us-ascii?Q?TRwWxgaNRO8gGWdVZFFPWMTOivReszwLcEv+Tg1VphUrQVN//3MRogPMec6S?=
 =?us-ascii?Q?7EwjIrmol5SeCM+vjo8BZ/sZ5my+Gga01iQfKss41ooNptk7RzYfPWgzJpAW?=
 =?us-ascii?Q?Waoey9gabbmhOkqZZqqihMYrsVrKiWA3+mIsgCBdGkgf2Fk+Og8D/RpD6U2Z?=
 =?us-ascii?Q?IAo2v/gmgh62lC33RJgdj4V4FlOuHtD0aZ75eoxkM250Z35osmIySfTTvQro?=
 =?us-ascii?Q?bu2ssRUGTzZe+DvkP856hGoUpUQK95XfUsDFoFWtxA3wJtu98J0iu3rpRLKr?=
 =?us-ascii?Q?6umJY+bXgfEqJKLfX14ZHgn3r2z0imrokCr9xURZYPGD7ix+WbrXOoratvve?=
 =?us-ascii?Q?uGeSI2B+qORDPdbO7zABvfMwCrsE1YaJFXQujnwFd2IXEzONLnI+Fu7ao6SZ?=
 =?us-ascii?Q?cL+k01p+ExtK7KaZLG9NB6O8C0hm22yxZuqaO34R5ecsL6LIsSgxZI+l3mUz?=
 =?us-ascii?Q?7OESoMTZtHpdzTnYc+P79C+K1q0kSarF5yNT5wi9W1JJ5SFsBgZ1cievKISd?=
 =?us-ascii?Q?pgzhKe9WKny6OUZCykz+S6lc3bWPpU2/p/khLmrsYcJNan5FHDfEFKM8+a5/?=
 =?us-ascii?Q?Z2yLN+/9osnk85vRlIzBsZatFf4xoRiHiTWE9P6PbR0gJDf5UisynjPViyVO?=
 =?us-ascii?Q?RvF7upgjpQl8txHaC5qqKlZYenO/vw8iVgulc9viLMtTpm5TkKh9mB41GMSw?=
 =?us-ascii?Q?jE4Z7PGGO6ELtzluhts72m9w348BrLUpMlhqPXah8UKCPZLfvc2E55Su5dhL?=
 =?us-ascii?Q?jwTMexzLghzw4kBXuX4Pkf/I93XHg+WNqWVN4Z0Y46xscwyCfV3HhSv0Wke9?=
 =?us-ascii?Q?IZhKj/orWCRQChzXvspzHUnb5+X6Yt8WJQL/g1R222guvRn4Ak6+wJ5S0dTD?=
 =?us-ascii?Q?ziKI1XCzLWsrxEIhC/Yg1NhGt/GwChQv58fG+lmwvnaeVLDDQ0FyMttUfK+N?=
 =?us-ascii?Q?Ylv+c0Dd7pwx3yyDp1ax8lq1jeMbhohf7Ib05HhcIB/3Kz3bJ6pCIekVzfJK?=
 =?us-ascii?Q?C/mLnSXsojdSkA7mqdLOVMsgvHuV5YM5rVU/nwMKKFuCfdPnA2LkGJ45ZS0K?=
 =?us-ascii?Q?V5LJF3AFT0/btpXftagLJzhlh/m+AQIjSU8OW0+i98qFHNaZhhNiIngnY5e9?=
 =?us-ascii?Q?ExM47NDYIZWqB7Dt6Glixpl7Q9MUyKmV3Xlw?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:18:38.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c302f8-fdca-4c04-cdc3-08ddacf17427
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFE15AB0797
X-Proofpoint-GUID: mCK5rOctcx4no0Tj9KxPxp6jZS6Z8XWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNiBTYWx0ZWRfXy3SQZi6yT4J7 5y8c3fOldwTeKBCsKE92LAEcsQuSDF1Fdj+2cdAMh9v106aE9t7rir3MZANm5NW71SzozUqw+oz 7svajxB/YNGdXzKFhbDQMiZDuYPViD8MAbD++m4GkKdGXyyV80EInpwHtVM0z1ROh7zYobwBhei
 LVB8kqUvYnZoTy1ZanAVv6i585LcLSkSBb538q2KEqLAC4qIbQ4tB2vosjVylye/0nfOsKXnzOD W100GfGR5WjFCmeSD63OR9ew0zZycM1lSOpl27BjVXvcG/PbthWWxEtddISew5JxCbA9Sk8TyPc F/K5bjAXMWj684rX5eI07vb/Sn+LDsWeiNEgtxYkpBA0dEosV1/bNAgQi9GczjrdvGKP5xtHR1Q
 fmIkMspUII1wy/rl0/563mYLvqgnmQj824ecWOhPnw+UsbpcephCZZAe6VERzfyC+WGjfOGh
X-Authority-Analysis: v=2.4 cv=F/pXdrhN c=1 sm=1 tr=0 ts=685043e4 cx=c_pps a=mheSnGZCuiWODCuZ7kyVQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=SJ9c3p3Ju-KSpBgfNLwA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: mCK5rOctcx4no0Tj9KxPxp6jZS6Z8XWx
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 16, 2025 at 07:49:29PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch supports to add a HID device for SDCA HIDE entity.
> The codec driver could call 'hid_input_report' to report events.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
