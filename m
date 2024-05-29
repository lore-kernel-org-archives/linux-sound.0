Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B0167DB3
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716972707; cv=none; b=S/eXSI3GlONNPOtDMiYXmsiKKkTI1Xg6/7t4vLR3zFgc5DiB8CprKSe6i6FvMigrYIuAI7CnKcHyI4HteqOJNq4GldWE/5Rv0FbRmlZHlFn8hIw5Th1OFV3E6tgoETJJfasK33twPvf1iMZ2oyhVzNivPxtXLc06qhiTMuIE7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716972707; c=relaxed/simple;
	bh=jNVKiNgDkAsBnYoKAy2Ps+z0ugzzdZzEwklzW+hysfI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krMxv5rZqLIw4oWTrA113PRmyJyK/WbNrY9pgjeC4Qla9N7SRgN10OSgziql8zM30tVJp1UZb3m99safShWotLpwkAuxsbcj9l0mXQ/ZNKZfIz3HAnEACLXwUcGfeoSHx1rWhqS5d3WEfcB7nd9sBGXjP8LeFfwLABpG9mKO/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gaq3V8gE; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gaq3V8gE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T58VS2001831;
	Wed, 29 May 2024 03:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HnhwCfqGYqlEx05vQE
	5A99l1D3HRCI5OJeUnj1keqzM=; b=gaq3V8gE/O0pE31kBaZRSnzzZFPxl3YflL
	HzqRsNhiZKOEnPOsF4s5QdMQqXbgdhKc3Gt+cmA9qTQ0a/wKMfFrWVh4Byf0zhvj
	Bup4hL19yNhSmjwZehf8ahem7Yo5eiFVd0wnCRzBwl5cYr+BFx/QMMOvnSy0DLDE
	JzSsVqRfsSJc2dfavdRgx+zQTkB95ZEG5DABFAA/77D07gn1ODXzDZkO0zNb7xoM
	MFfxrw9cORNwAO7+n53kIQq8+N+BPWGYaV9u0cdWwbnF+9qaQQOXyANd23X7o/Sm
	Xp0jSIn5hC19OUMrqOBibHZTqOnEoMVHucVY4oW+pYWXDLOVNDNQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwuaf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 03:51:22 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:51:20 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 29 May 2024 09:51:20 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F2FDF820270;
	Wed, 29 May 2024 08:51:19 +0000 (UTC)
Date: Wed, 29 May 2024 08:51:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>
Subject: Re: [PATCH 11/18] ASoC: Intel: sof_sdw: Add quirks from some new
 Dell laptops
Message-ID: <Zlbshrm0aPIr/V/F@opensource.cirrus.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
 <20240527193552.165567-12-pierre-louis.bossart@linux.intel.com>
 <446f90c8-87de-4a9f-8f40-ba544754dd15@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <446f90c8-87de-4a9f-8f40-ba544754dd15@linux.intel.com>
X-Proofpoint-GUID: nlSa1_kuQxnqPKPOgEJwqM-3IaUT7H5q
X-Proofpoint-ORIG-GUID: nlSa1_kuQxnqPKPOgEJwqM-3IaUT7H5q
X-Proofpoint-Spam-Reason: safe

On Wed, May 29, 2024 at 08:25:49AM +0800, Liao, Bard wrote:
> 
> On 5/28/2024 3:35 AM, Pierre-Louis Bossart wrote:
> > From: Charles Keepax<ckeepax@opensource.cirrus.com>
> > 
> > Add quirks for some new Dell laptops using cs42l43's speaker outputs.
> 
> 
> Please hold on. Dell just informed that they have not made final decision
> 
> to use Cirrus Logic codec for some of the SKUs.
> 
> Sorry for the inconvenience.
> 

Yeah just this patch the others should be good.

Thanks,
Charles
