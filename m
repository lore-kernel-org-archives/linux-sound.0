Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2065D38A722;
	Thu, 28 May 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958327; cv=fail; b=DxcgizkSTcNKSM4IbVLG4VUL6gB8z8bG7vgJRgrI7iq5jX5uOzMMZRND6X/XWWOWqwUtHzNx3+uVyD5ee1rP16u4gPrjX/AzZEvBdPTnXnIq6/vKlBBfn8WE+kghg/Su6IwuCPVuyTSoY6ytPZX1+fL/KCClgy2YcWbk0+f968s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958327; c=relaxed/simple;
	bh=J4TK6hPZX9DHIdHbsFlzzje80UOAwlXHdbAFkMqRj2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWkCLneTRYFfdYbuRKpbmvCzUGFBZ4Qdb1tDK09fv/E29X/7U3J3fPtBS77iFfzbzaucUctGH5SSwI1oksg929xEhGSpoL3vN0/yVKICML5Oj+Y1pVdod0hnnMIOwogLLC5wsedG1moc3GlfM5iRiMgxyV8+uGjpor1b8makeQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OQSzKMTw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lU3wgvLr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OQSzKMTw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lU3wgvLr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S818hH3897224;
	Thu, 28 May 2026 03:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=MOx8BvIxzefdF+o6JC
	0joZqhE1IflvVaX+gEbWGUIbY=; b=OQSzKMTwcjYpyg4F+vUNyxwIR/kKd/oBMX
	CLyo7HQL8c6ggojqqtbPls/ilXSBefrY07ekJ3/Pxj5sM8v9h6vsJcv4EYBIS8VY
	45VEek7pm9xI1Bd1GrJ0Jex6E4RzG5TrpiWMamKn/OpA1PH73cg2ccmjCsXs9BDO
	6NxWfnA0B/2xp7iIMWX0WktYj/3BLi1cH3JU60Xf3BeJtGAbyAnAOyzi+b+26TkM
	2G7S0hffqvxXmhzHjj4PuJDOHLX/yTPeQCOxl6p6/kClL9BNCH9LfVZBRMaI/EHo
	OW3U0ykKbKf8RcLDknLJ8puySDF8TuctFZeYEn3RM0GCvErM/Iug==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021086.outbound.protection.outlook.com [40.93.194.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7wt8jdr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 May 2026 03:51:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxWVgY7IvJ7LR3AmQiE1CvSAovyXNzNg8z+Q+8IM3pMdhgaEEbVvvmYwk9zq3XMfL0PC/Tj9FSQKu/AoRVLdDvXYKVibDaZGhv7pXmxoanqIIGzXAeLqCWqvvQKggBxD7tee7clX3cEsaqRmu8+R7nk2+NMhNreUjuFb68bK/jsHNtS7gknGAm34yYBChfD4+xLgx7sv7wGmeBX7sNv/Jn6wDL/Wq2k5Gsc3mq7KPrCc8JkFE2vYqGszOm40aI3xFUMpdlpyXxiY5v5UObJix8XvJ676MIcXywJBQJIB2kGlVaeoJS9m+Dm2Ibu+ithsTLc4vi9xl5k2FhGSbnbkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOx8BvIxzefdF+o6JC0joZqhE1IflvVaX+gEbWGUIbY=;
 b=ZUgACgUlOn6hNz02rootp8O1+wX1VI+ZFQPXwefj2Cx3s6BwNO00Rvg28PB3VfyHsZmxvB7YQU0uZ1K+Y1zAPA7IM6GcEOqC0j+Vz6di/BPPa+/oE+TQ+6sOInNbSpKYMKKLEQ0EKzg8e+DmOUxqNUHm0QijFyRodSSoRa4OSKSNtjMezW+XcZUVvFyXbEFqoG1Vw3VvDBn5atq4Qm/sDKZo4porWl3DbTCphNk5fVZnrgSy1KXWHg6QXGVljbJw3syddxe+r+DsVq2cZ5kftVvxapJ9DO7PVfVgVmNVlpWirwNonSPvJgV7NgrgBYCoOxx2CLQ87sRTVUMC0bL6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOx8BvIxzefdF+o6JC0joZqhE1IflvVaX+gEbWGUIbY=;
 b=lU3wgvLrBFq+ttWeCRcFTPUMmqc3EQ9nMB8CanHyldivgJZz2CDzvMdfVVjP4chUW64WEtSPGllIzRbqrFoBpakYfOnN/AhabloLnpn8XYbRfq1X4spWQRjezbpq1iO3Kwphmo1hi3vB56dtla/laavg3HDlLYGuF3bjnSJ8jzY=
Received: from MW4PR04CA0320.namprd04.prod.outlook.com (2603:10b6:303:82::25)
 by BY5PR19MB3873.namprd19.prod.outlook.com (2603:10b6:a03:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 08:51:17 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::48) by MW4PR04CA0320.outlook.office365.com
 (2603:10b6:303:82::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 08:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 08:51:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3AE2B406540;
	Thu, 28 May 2026 08:51:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15AD1820244;
	Thu, 28 May 2026 08:51:14 +0000 (UTC)
Date: Thu, 28 May 2026 09:51:12 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
Message-ID: <ahgCADn6fwqLhFIQ@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
 <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
 <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
 <ag6/q8O737wtHB/z@opensource.cirrus.com>
 <63015dba-c88d-4de3-970e-769c5319366c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63015dba-c88d-4de3-970e-769c5319366c@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BY5PR19MB3873:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afab828-39ff-4963-0184-08debc964778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|7416014|82310400026|5023799004|4143699003|11063799006|22082099003|18002099003|6133799003|16102099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+EFiUrD7D0wl+v7E50yU5rl9DMpvlAMKygQI4ODYB/I3VCPncP7WbxZuhjwXqh+CSvzWAis7VtTLBaXQKE81MczuOmjBxqibMjxpocu2tLojMtjyiMFHGD2V4VmSN+LXkAEH1SXAnL46/6B1kgFbDAL2CQ9jshk3FzeFX7QPNepodFq5ELeei6QQla6kIFKxY5eXxKabvOIiPfnWOy1VgF31+DkTm21yoz/BEMl8hddJO+aUlb3MDVcdFfIZzYKZLsuB5BD9trnGP8CUuC9j4BCKO++Uqe+TBj8ztitdQ0EdTA4EajmNeZZjm6MVZcuFJaWvomwxWIhF3tMilscBeIy/StIFDi1e8YhhZunszhVOngcPPDGwvrOzPqVZjoDZWAkHrrAthYaZDiMh7fW+ZG+HbaI4EPveDubJe/eay6lvU2SvdxoSS5/DJ9fiYN9o4a6jtqWIsBG0UriOVldlKFjW1CoxUto7CU4T61ChVOWaLK/JEXQZBWNBKXE54u+r8Vk5tL9qK0OBIi7OZHYY8gFtXvVaVBORuBfr/Yazekf6OeCE5EC87qzLydenLokMrHj8n+Wwn82jybRN3FjLTuBLOfToFWBSgoYRXrfy7oOHtGuKyYQ3XKv+082B6NbEZL/BZx4t3bGB3hH85YiSCZGJcFo6+R2DDewsGu7FxEJSyL8ilZrvIEUhkI8ecp9DyS3ZR0m3rxAc2mYiGGTm0b0FAAR6vduMx4UjNg+8svE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(7416014)(82310400026)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003)(16102099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sirH45CDmiNEBptOu9GMNlX6gBNu9HcC5vg35N0mz99JepzJI4WAnHTBH4711uxGvnLUHOZv3JB7zAp4dVQN+2N+tkAuqwlgBvuTrnhJdEej7tWIOWGh8JdtY0ev04xuzG8IYuQn1RzT6U+nnKCazP9w1XGYm/VeoUtNQrrIli8hU4KEyHE1AUOCwLNcuuc7jPAnm73D3G2kmeAN9152aCdTxFmFmRXtectY0E7+gWUmPuxeadJJQJobUwFliydBxcoADtrFI4J/fWM5ZxvDKc2BqJyo4uAE5McfXPn1XNHRHLGmQtdHqBo53MtSeb7w8s/bRyvP3xOIxH+3cLB5VYjKpGBGiXAUCC74FW3VvYYmBKSGu6PcKp7+27PM2L/ztAbMiiqhxVxnJ+9LXjPI4BdC6v7Q/xtCkD7s6I5ZTYvR14+Ibig2nqdGLO8a8NGl
X-Exchange-RoutingPolicyChecked:
	GY83EATYNWw+o1btpyOFE1/laLe8fldM3m/yBhuEdjjzKAtCa1cscwwPja9acIBr3Kv9fXHcdkCF+RL5Zbzs0H/6OQIKFSTjkwUzJJ0ylqEROKAjTIYvsKFeyMBkepktLYj4uzHQkXsR4ElnBUD+lRBxsxbPDjgC1bSaqVinL2Lv4Y73NTYY9QygPL913mnXhAWq3+3wUhbWj+6dMNckbTGJd5gQ5HqZSB/2xCJJu+MdkEGIjv0bChpODvhKPuEKrKaROi37XmlVWWYmZI3qvNte12ZSf7YiIHTF9rJjDB2BPegm2h+PbB55v5osIq1ODDOUjmxGFM/yNmHVz78maA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:51:16.0065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afab828-39ff-4963-0184-08debc964778
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3873
X-Proofpoint-GUID: jfxBOtc1S_pUc5uh2PSoF75M539U1RnO
X-Authority-Analysis: v=2.4 cv=J+qaKgnS c=1 sm=1 tr=0 ts=6a18020a cx=c_pps
 a=9uorYk6M2NiaUO0sqEzvdw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=CepEtph4yAMROsJbDikA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: jfxBOtc1S_pUc5uh2PSoF75M539U1RnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA4OCBTYWx0ZWRfX4jFrLHV8MFmV
 Hueqxl6z8p0eaALvqsMsXaeEN9ysYhqI26nvz4x78WgllL8/jUiicodsaX1uBTlmJFbg4tMygVn
 zA00WeelwqfYip/iMXw4YX5ReHHx9mmT37xPjdg+txNDHcD729DOs+YSsg3AoX6jDiLSq5f4HEm
 CkUWUj9wAUeofx9/F6AdgPzS6HXdYnXWCn7oZELD/+o4+a9L/GCC1yVnYEa2/IchRTfHCivVanh
 ycAY9ULxoxUa/IONEx6yEwQtsuV8udq9nRougY6VYmir8VDvPiRiFG10VJ11MAr7kUXFpWBDvVc
 3sdkzLHobl0+NpMLkvkgDfUprFa7o5pBPFtcD1tqZi8lPwmmBZXBWbL3Tg4WXreP8OyHsgrJG1g
 m4kwqJNVQs0xUADb35BiALjIWWqjo57coB1a39CIkhgJHa9KSGx2VmVd8lSriJsTRJatBrEQxIf
 XqEZsNOBDHWJla5UHWw==
X-Proofpoint-Spam-Reason: safe

On Thu, May 21, 2026 at 03:36:59PM +0200, Pierre-Louis Bossart wrote:
> On 5/21/26 10:17, Charles Keepax wrote:
> > On Wed, May 20, 2026 at 07:16:55PM +0200, Pierre-Louis Bossart wrote:
> >> On 5/20/26 18:36, Charles Keepax wrote:
> >> Could we filter instead those 'ghost' devices if they fail to
> >> appear in the new ACPI table that describes all the endpoints
> >> and card topology?
> > 
> > Eventually perhaps once that makes it out of the standardisation
> > process (I believe the committee is looking at it), but for now
> > that is all Microsoft magic that I would rather avoid.
> 
> Nothing prevents developers from reverse-engineering DSDT contents. I remember seeing all the information needed in the DSDT of one of the Dell devices.
> The standardization was supposed to happen before Covid, I looked at this in 2020-2021. If it hasn't happened by now it's unlikely it ever will...
> This DSDT information is interesting for Intel platforms, it could help probe a generic machine driver for the card but raises other problems with deferred probe,
> c.f. https://lore.kernel.org/alsa-devel/20210817190057.255264-2-pierre-louis.bossart@linux.intel.com/
> 
> Anyways this patchset isn't wrong either, so 
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

There is I guess an argument for starting to attempt to work
through that stuff, although still very nervous about it being
all Microsoft magic. But yeah we need to merge this guy anyway as
doing that will be a very large task and we have a lot of
shipping laptops that are failing now.

Thanks,
Charles
