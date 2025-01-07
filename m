Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D81E3DD1;
	Tue,  7 Jan 2025 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245687; cv=none; b=Urtc/zE1GDGCW7muYz2MyAXVENrehw7F142cA6VuwAvPMYHvRCgB/ilRi8Y1Oe6oCOM1sjRM7JRNfM9rDKrdY6ESkRMWjlrJn276xI/QvyQ32nrha/j4Df6RYyWiUmzbf+apmWTBeRN2QHejGEUTxrkQB39uxuOhjhJ6qaZ9+VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245687; c=relaxed/simple;
	bh=3a11gxd6wDeJMEh9BIrlAJ72NtLfUqmxVqxPvOTlWsk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9eOD7E2IQq1lOsDQBKlh3Az3ygsqXDSjP9JZgdKAdyK6d6TeK7US3dlYE/R163VxulYZFgqG8s7hfRHrdmKpxhgKl928FhQbiOd5fjixuDzQ6lZ/TaD7YuUKY9muUQx8x8lIuBTOMK59JBJffbsJOzVaKVveMFbtZqgO44JBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zg4c26kx; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Zg4c26kx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5077MBwe027419;
	Tue, 7 Jan 2025 04:27:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=K2oEnyheiB0p64OC6u
	uM9OhhQ+l4GsKRjtRncocKv3E=; b=Zg4c26kxB7PCyNFDkP2dvzG2DeU0SQGHpM
	1l5Gd8fdmtF7LKoSAZmPB8aYr2em1+VMIC9erjFCUKjQjrAZbp0x+HYTXDQGr6X9
	HhIcYPIZ53tBhKyickom3++dSIMnkKfv1yByPau6yzUVPzIiGVCdMb1L/saipuo5
	YgPhR3W9mMuh8Bqw7Dnm7j6hn17qKDh6QvR0O405ckpbxtlux6ZuuOjuZZPFJP46
	jHAZ4aVDCzoO1hWj9iRnzgkgXclhMk8Rh7VEWKACy2RCt5fOMYAIj278p9g9O/HT
	plSXBb+ZirvL92xzhjuZ5LIA/jVwzJqYQlA2/RWxRjaL2g79M2MQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kb5sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:27:53 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 10:27:51 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 10:27:51 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8E7CA820248;
	Tue,  7 Jan 2025 10:27:51 +0000 (UTC)
Date: Tue, 7 Jan 2025 10:27:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
CC: <broonie@kernel.org>, Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran
	<fazilyildiran@gmail.com>,
        <oe-kbuild-all@lists.linux.dev>, <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8994: Add depends on MFD core
Message-ID: <Z30BpixgkmEG5iTY@opensource.cirrus.com>
References: <20250106154639.3999553-1-ckeepax@opensource.cirrus.com>
 <202501071530.UwIXs7OL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501071530.UwIXs7OL-lkp@intel.com>
X-Proofpoint-ORIG-GUID: B1mK4FyoX1vtfdivLWr7BuFKWI_75G3F
X-Proofpoint-GUID: B1mK4FyoX1vtfdivLWr7BuFKWI_75G3F
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 07, 2025 at 03:39:31PM +0800, kernel test robot wrote:
> Hi Charles,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on linus/master v6.13-rc6 next-20250106]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/ASoC-wm8994-Add-depends-on-MFD-core/20250106-235153
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20250106154639.3999553-1-ckeepax%40opensource.cirrus.com
> patch subject: [PATCH] ASoC: wm8994: Add depends on MFD core
> config: alpha-kismet-CONFIG_SND_SOC_WM8994-CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811-0-0 (https://download.01.org/0day-ci/archive/20250107/202501071530.UwIXs7OL-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071530.UwIXs7OL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501071530.UwIXs7OL-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8994 when selected by SND_SOC_SAMSUNG_MIDAS_WM1811
>    WARNING: unmet direct dependencies detected for SND_SOC_WM8994
>      Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && MFD_WM8994 [=n]
>      Selected by [y]:
>      - SND_SOC_SAMSUNG_MIDAS_WM1811 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && IIO [=y]
> 

Well I guess this is maybe an argument in favour of adding the
depends since unlike that issue these are actual things one
might hit in practice. Both Aries and Midas appear to be missing
selects for the MFD part of 8994, fine as long as it gets manually
selected but will blow up if it doesn't. Will send a patch for this,
but it needed not block this patch, its a separate issue.

Thanks,
Charles
