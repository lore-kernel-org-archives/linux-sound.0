Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298B22CF12
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777386; cv=none; b=bYF+uWN6iulY/cR68aeXB6klkbwuEhG3xmjuYxiHmJT9UY9Vz6CZyeRzH3D2ZH6bKZBkovfZGTmda+WDmGyFb0GtEvz5Z1vI2ESbI529aEoHTZWkVIjANlXd2PMIfp7CS2e9lcJA5uQDRvTOSU1DQiBCbxvpCJeExTnwywK25Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777386; c=relaxed/simple;
	bh=fThMq6ncIuEwxv8JMLrmK3dS3O39G1l3G8QHea5br2M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqOVAWedvNc2isiL6G+4NgabhCfLq1Nb1T8C6aAocPY/lxvjprK3LODTzBr9XmmSmLhO3F8aqXz6un9QwOmv+49lrAU13rvQiWdzb/EOfwoCd7bXk2TWfkIaaPXe3Fmtr6us7kScosAFvle88fyPoIrurcB/Ri2wANjk2eU5jOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mko/bi6m; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mko/bi6m"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7nWtY009306;
	Mon, 13 Jan 2025 08:09:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7zd3kZFxxIvynLleXt
	57uS4at5uzbvSAhq1/L2TYjbg=; b=mko/bi6mqCDDCLrTJEk/QONPD0J5eKjx89
	YWSPoW8q2QjXVkwLuNQyfxQUdkSYxv2zL6EuaMS4BsiwCRESqZDMlZDJAB2hnVEX
	TQgtgBd9bN9ReLuuwIdBftJrdCuhiv2fydzPryuJgvrK8Hx1RVofxTKSGAUP+tZp
	E9VcT2xjQNr1qMacTZq0DLG94GE/p6xjCKrsWlE+YJW9QZMdYEg/LYQICMu572B3
	/tzekTSHIXaFBtVhcVxiw+SsaA4DOGdY0GhxoPhVOcEl3cUMKw4vbj81d1dWCmIe
	UyUysAmEEKHX+0BnSIq879s3AgJDlfqjg0MFk8iHoAO+ss2sWqVg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 443nxma391-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:09:16 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 13 Jan
 2025 14:09:15 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 13 Jan 2025 14:09:15 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 02EEE82026C;
	Mon, 13 Jan 2025 14:09:15 +0000 (UTC)
Date: Mon, 13 Jan 2025 14:09:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: "Liao, Bard" <bard.liao@intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.de" <tiwai@suse.de>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Message-ID: <Z4UeiZ4TDwllJJoc@opensource.cirrus.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
 <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
 <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
 <SJ2PR11MB8424334022EBCF6B4C375DCFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E5B23AF2CFDA5D4D8CDFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <834e34eb-b293-49b8-a71f-1ee14f3f9684@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <834e34eb-b293-49b8-a71f-1ee14f3f9684@linux.dev>
X-Proofpoint-GUID: _BJveT6P3MhWpXIKFzCC7nznXGVgVVyt
X-Authority-Analysis: v=2.4 cv=Q6Eo452a c=1 sm=1 tr=0 ts=67851e8c cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=A5ls6HzxGQVCpTY1uKkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _BJveT6P3MhWpXIKFzCC7nznXGVgVVyt
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 06, 2025 at 10:09:19AM -0600, Pierre-Louis Bossart wrote:
> 
> >>>> This laptop ships with a different DMI identifier to what was expected,
> >>>> and also has the DMICs connected to the host rather than the cs42l43
> >>>> codec.
> >>>
> >>> If the DMICs are connected to the host, isn't there NHLT information
> >>> telling the OS how many dmics are connected? If yes, then the
> >>> machine-level DMI quirk isn't really needed, all you would need is a
> >>> rule that sets it unconditionally when mach->mach_params.dmic_num is
> >>> non-zero
> >>
> >> That is a good idea. However, we also test the case where the PCH DMIC
> >> and SoundWire DMIC coexist in the developing stage. Maybe use a quirk
> >> for the different DMIC coexist case?
> > 
> > On second thought, we will eventually create the dai links by reading
> > the SDCA functions and remove those DMI quirks. Not sure is it worth
> > to change it or even add a new quirk just for temporary used?
> 
> If you have any NHLT information, that's a very strong sign that
> the platform does rely on PCH-connected DMICS. If you don't then
> quirks are indeed needed to select PCH or codec-based solutions. I
> think it's fine to add such quirks for now, it'd be up to Cirrus
> to remove them later on when all the SDCA parsing is available,
> which could take a while.
> 

Yeah I would suggest going with the quirk for now, then switching
to the DisCo information once we have that available. I think
that is likely to be more reliable than inferring from if the host
includes NHLT. Undoubtedly someone will make a system that has
some host DMICs and some CODEC DMICs or something like that.

Thanks,
Charles
