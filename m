Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B433AD91
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061450; cv=fail; b=mPtBG3eD6jwZuJlxQ4kwWPXcIu//PBudddzBbzIDHwQ8OJNk6Q2pbNA8Yel7UsozV4WUxIH+I7ygOlOMqIObK7IEnE0c/8jJMi9gEZthVIE/e2nAmcvQGCiPIvPbyEMbaTrmJn1dRTUvb9rjluVEC3mIXnz4sJfNLxBaqKlYwv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061450; c=relaxed/simple;
	bh=azxDquaZ8opa7ozgqeX80r3Gb7OLAaIdHDr9IQ4i3l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU8Km6qHvkXgbBQ7MhO/iPRHXxLs2AgbvY/+aAUUG9R5qrTA0OVagZCwlWiukvCXO+/yYGEFIuv8DkRgA/edjwgKeUjPlsIWkdn4P5CVk9FhhP9gZai1J4wKB+Pzly/eVMAJJm0pBG/RkNc2JjPgV65j8HrO8SqNLVxoDuGPVeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XHvoFUIO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kOMEUCEO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XHvoFUIO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kOMEUCEO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TCIQmf1584143;
	Fri, 29 May 2026 08:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HGmXbZ8oHiLVYwQwCL
	8XAPHp3kc4I1+GY9BXFBXfxkA=; b=XHvoFUIO9H9uvW/SvMOn7fc6v2oiAnjWKe
	Ov9uCcTZWUKQjLEEv44RoxMrsrkCsesLD0ORpt8l+1yFX+44pnwyM1CZZ2SuIR56
	H+HgRUG9VgbRtZ+Osdhr0bTpS+BJhXfDO5Civ0KMdit2lmDpmxpWH1mGK4KhCLg9
	mXo53uCp2vCJFXhsNNjT1Zxe9A/twIDYnI79tVXmRJbeTPwWXPC20m0xm7OlgVd2
	M8PxeJ9xAe7RJl6VnEyyaSCVSxVZGTMS2EyKpdFJWOVi47IMuZsc65/dGFGs08YA
	yTaL0RiTcXPhADB6C5y1pGUsY3o6pqZz2LZkxa7BZLDgR0fDgfFw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021141.outbound.protection.outlook.com [52.101.57.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7x22fwt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:30:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPbwmgAP54XdRbv19jyGDF4+4S5itqnxONZyfoAqzrfk5TBOttL2TYny7WbwqtzHKeKGTIEEY+HC6ZHTKO2+RgSoAC0WSe4lHWPLtDkNll2DOItr6jTB+JQy8Rt0Dyt5OYIKanMy1FNkTFnji0nc4M0JtFBrjlgNsj5SwfprINox+fVymEXy4X7HRm6LgfB1RVwRLpn61O31qNg/Mnj2nhzWFeAHid/uJQpWO8AgkAFDFwEmzXFVoqYYGzBV/7cLHv9LYGUyVHXZUaSRm165J3KNKdcogbvV46AYvMge8VUYvyiR3D2LBOp/Nst2ELMIsoF/180pJAGaUQaguTGUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGmXbZ8oHiLVYwQwCL8XAPHp3kc4I1+GY9BXFBXfxkA=;
 b=tnTsNTS0SC6ScwA1iKUyeZeNmC1xDzWFIZ9D6pLmfKGrFmaDaiKGbxnT83iOd4lhQkqrudLdB2EfhEMR9DwZXDZQe8vgf6coZ8KJlANPoswEik1f7ijgGZXO4SR/geeS+NttiO4rHrmQ1WAlFpMJpI/SAaLbHaJrX0AJ3FqhtLTRf5P5TgCqADAVsS70tYC6cj8Uyjwmf/Kcmnmb+nxx12OlFIe1m9obJVYuk4NSZAPzq6ca7GISxWU9YvJ5QPAN6+P3Fw6hXA2cWHIRoqfsOMzK/9HSq3PQyXUux7U6w1YeWIx4cNeSh7aySfOhBy8q8yljwWYYs0nfTihHXQ4alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=everest-semi.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGmXbZ8oHiLVYwQwCL8XAPHp3kc4I1+GY9BXFBXfxkA=;
 b=kOMEUCEO5Me4Qdhro55fPfiZyN1hw1qgkcjTSS6dzsCzsm+QNZ/NabeuWQWHUD5Hk5mTEfPzTcbPbTJjMnrKnGhwrlq1fs7otNCPN8j0vwkkUaXSXvlZmoJD1AvmnFyiNQAvHYOJaitKwT4K05Y5mrfHReXdiPNPVVUYJGhYPZo=
Received: from BY5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:a03:1e0::27)
 by PH0PR19MB4986.namprd19.prod.outlook.com (2603:10b6:510:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 13:30:09 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8c) by BY5PR03CA0017.outlook.office365.com
 (2603:10b6:a03:1e0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Fri, 29
 May 2026 13:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 29 May 2026 13:30:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D2805406540;
	Fri, 29 May 2026 13:30:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AFB1A820244;
	Fri, 29 May 2026 13:30:06 +0000 (UTC)
Date: Fri, 29 May 2026 14:30:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Zhang Yi <zhangyi@everest-semi.com>, tiwai@suse.com,
        linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
        yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <ahmU3dj4eti/jZId@opensource.cirrus.com>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
 <20260518224657.GA536765@ax162>
 <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>
 <20260519162352.GB3527449@ax162>
 <b17f8125-89bf-4032-a166-725be94466d2@sirena.org.uk>
 <20260520231420.GE1607511@ax162>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520231420.GE1607511@ax162>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|PH0PR19MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 047e0e6c-2ade-469c-4c83-08debd866712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|61400799027|30052699003|82310400026|56012099006|11063799006|4143699003|18002099003|22082099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	rEUMDVzCZExx+eJjxlIUwtrTf24jAWwqUSRqPIqDiQOww9K11DR+QoPYImUrbPLFw1Vmfm2/kymNubItAn2rW35c2ZA6B7ml5yzeIXUy2c4o3eo/BGM6QBuSrGibA7mluNmWu587EJFGyGI8AcEXZ0Ry6dyBDqtRGgvEUM7Lc7euTgYduAnFCcQyLT9ThHkX0q0yv1AIYj7LhMNZ8Q/vgqEB2LOe2sf3ikNyBnkpYVzYxXeWzjsFVKMdDThr7dzTeoPVtD/ktS6iWHjd42NVu2yGz+yHsdJal0t/TyXEZCceTi7FnBZZH8gPiTWtDmg9CC7N+vYRi62sHRkxM8vRSkJzyVw4aUUy2m/LZnnN/i5olFTcvJI/s6ZT0egkCTSdB90LzDcQf8mq2bYPHXOeQZmvEovPcqO23DxjtlKfaInidoTwb9sXpp7BO1G74Dy5GGdIS6b07FxwWMRPfSrBxBdEHL3+RnfCPuEzNhSo/e4LhSsksPjUA49/pal+VP21C4q5YIvA1e8stZAWtMKKae+LQFjKZ5MnF46sLSIvErcbSaUW4CzPHfM6I9KmZOjgcDkOiT0VgFA2ew2ir3MZ8iRFm+qG6WpozaWcEnt1HXTleJBGQ8GQT2iLk3BkSUTyRA0huDX0YhJTAO3jjWPAKLp73bAkRPYFP/jkxQpErnTZXMdQJoIjmkG4NfLhqF/XO5jmIX4+dnn8/mU8qy1dLC05b1ydSxPg9xpro4u8Fn8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(61400799027)(30052699003)(82310400026)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nmgpJFcZo8IaYhiFlsBmvQPlif+nwlUP3vcaSfj/rfE5JHLCNFbALsKI6OrsMAPpPIalnpJTl3Ku8I+30n6T0AkKUEjuEl7LKUbmuhUNH1+MuleeY6HbEC1HIRfvsWcrDcvwcq3BpnIWAh4ResiVfCFWR4rtwJ2qwD7N/onohSEFjEXP9XqdBpSp0qBpJXEiVg8Q8csUMaGvQ/VaRurgMSjIFyXCZPqMoPGqtP5/1Y3638gWJPfGTulDy4PWs1/QB5pABLYIsfWc2YFbYYPq5T6ofgiGfFjBvBOvRlSlKxxbQzNToLkZhNfsx4in/Bv3+XfJdbjO5HxSoBfbfaR4Nx5RKkfCe+tGZCOkC0266r0ETq19DqUWi7gRuOb3BdQ+OnZTQAFBWYYnUogcdRn7q3qyG6bF3sb9Q5ODSjO/cywdh8IAPl+q9+Xwjafi7EFg
X-Exchange-RoutingPolicyChecked:
	DyJRa1HsNMLBIzvsGVBD/qx6hZ1GOTyqD7hqF26cgIm9qpw+vW/WG5B3Iyb4P33ca5DyAI724I4UfN1no/5UtrH4bzvdSAguUs0TEJddf6WvSq8C4TZplGvMlf8XkLquMm29P/5dO1zPKZ7gdNpZ7mM5WsFivgiqa7FrTp0967n7WU7qEmx+QH7jRoh0pQwepL9+vGP1ADDE/QllvTFe5VBltLKNmMr5Nn6uHw6guYItDJndgwkmCN4PvDSQMUZSp+5OP53M7YHSxAyoHflZkZSVwKPqdslWwqzJrKdoZwOzAwV+gsDqUKKtjHRTxFzyYF4it1gA6Szlk+cWCDzJYg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:30:08.2491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047e0e6c-2ade-469c-4c83-08debd866712
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4986
X-Proofpoint-ORIG-GUID: Pmab5tQ1fjI5HrQ1GcwUOUlO6Bn9DcTh
X-Authority-Analysis: v=2.4 cv=H/frBeYi c=1 sm=1 tr=0 ts=6a1994e6 cx=c_pps
 a=IXZk8buBm3K+4cvqFqH88A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=1Q4-m56cyJmvEtZjL08A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzNSBTYWx0ZWRfX1N+8ZXT511XC
 PL1mmx8CoSKR62IGAPdXzqJoU7ySq5jrFPba9zWEtWVH3SrLnFoX/lcyRY2MQIOBP3ftCb3QwXn
 w86bqoDdkd9uvaUrquYggCH4TY3FhcOrKkN8jWLIeJFwMPRhg0WMp8p6VPuTPy/SrfeKyuJ5G28
 FUmAbsyrQXc7aTM5MxqSOXkT6b9CHxmhp1H/F/6+/2mgTLIqBtgG9zl5N7M5NWBIjmTIgG8ILFM
 5wXn3IZ2O2naEEPAkrDf6syOF7cU7/jnWX+zzzy+gk9Eh4UJu1lbMO+tTwAmenowxLTP0Sm0974
 czBigIDYBgsmvmgnMxHIaBpIftpiaENmIJ9INgsLA54gFN5Y1mu0VETVLQ+XvTZvJWQNz88ciOh
 3YNGQ0bzuea7413vBTNwb308tDhk8SkC4o2XcDoej0WnGIho+5CNW87aPvMm3z91JAfLYj8mnE4
 ZXpnyTT+82NIPxVt5wA==
X-Proofpoint-GUID: Pmab5tQ1fjI5HrQ1GcwUOUlO6Bn9DcTh
X-Proofpoint-Spam-Reason: safe

On Wed, May 20, 2026 at 04:14:20PM -0700, Nathan Chancellor wrote:
> On Tue, May 19, 2026 at 05:30:41PM +0100, Mark Brown wrote:
> > On Tue, May 19, 2026 at 09:23:52AM -0700, Nathan Chancellor wrote:
> > > Yeah, I realized shortly after sending that suggestion through testing
> > > that it would error during the Kconfig stage due to a recursive
> > > dependency issue. However, CONFIG_SND_SOC_SDCA is not a user selectable
> > > symbol and I only see it selected through
> > 
> > >   CONFIG_SND_SOC_ACPI_INTEL_MATCH -> CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS
> > 
> > > so is it expected that users have to enable a driver that selects
> > > CONFIG_SND_SOC_ACPI_INTEL_MATCH to get CONFIG_SND_SOC_SDCA?
> > 
> > That seems off, it's not like SoundWire is Intel or even x86 specific.
> > I would expect either it should be user selectable or the drivers using
> > it should select it.  Given that it's a class driver that probably means
> > user selectable I think, some devices might need no extra support?

Yeah currently the class driver itself is user-selectable but
doesn't make much sense to have SDCA selected through the host
stuff.

> Yeah, just turning it into a user selectable symbol like
> 
> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> index 87ab2895096c..4c0dcb9ff3b9 100644
> --- a/sound/soc/sdca/Kconfig
> +++ b/sound/soc/sdca/Kconfig
> @@ -2,7 +2,7 @@
>  menu "SoundWire (SDCA)"
>  
>  config SND_SOC_SDCA
> -	tristate
> +	tristate "SDCA core support"
>  	depends on ACPI
>  	select AUXILIARY_BUS
>  	help
> 
> --
> 
> appears to work for me, in combination with adding
> 
>   depends on SND_SOC_SDCA
> 
> to the symbol for this driver.

I certainly don't object to SDCA being user selectable, although
yeah in my head drivers needing SDCA selecting it is probably the
cleanest.

I think a lot of this stems for the slight weirdness around SDCA
and SoundWire quirks, there is a weird interaction where
SoundWire calls some SDCA functions really early to do some quirk
stuff (see sdw_slave_add), but that makes it really easy to end up
with weird dependencies, because obviously SDCA will call
SoundWire.

Thanks,
Charles
