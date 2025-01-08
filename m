Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17681F6684;
	Wed,  8 Jan 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334491; cv=none; b=F0KgX4Hy7hwdTWmzlWCBqAa/9ipPLAqgKiPEKumlgt2Swfu3EJzRI6eDcG4MMkQ3/L1RPsYBMh08ghojeePuRD50TBkbkBdXaoYna+ku7ybTGkawo2n/fZuFlEoDuooJ93uHJiKBCSb1mq93GIiTQvs0jCYMa1irPU1Pct0XfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334491; c=relaxed/simple;
	bh=Ptau72Jp3Shhg7577noQSYFI6HYY1F1cArTnNvzjY08=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDkIJKh5MbRFvEnjHqWEDm1QiPMH9CAVImYI43AWWsjB4z8lWHFqh1Rewz1xl0zsn8fYyts/lijg1TNyUgjqFq4G6MIrJlWgVCEKK2g1nkye5S/pIyCC593qbEP0uprwCTyZmiALoGrzV9zwkbAsfxEefQ0rpnerUI4TU6+URfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d9yYTL4J; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d9yYTL4J"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5086KKgP022021;
	Wed, 8 Jan 2025 05:07:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GnM7c0xQa1G0xXruhh
	n+VA5joZUnicO4Zh9UWUQDAIA=; b=d9yYTL4J2g8is6pd5sdrVAa06nrA8Qj+m1
	nzEK/8Nrc7bl2fS17BF2VwfgBxofkhYgVkicqW25A9cdy2+AtP+XDh+9irS4WCr2
	Q1VIawVidvLtQwrav0Wie8gxExkQwi8NUU/PnmeEQLaeQbZFwuZkFZg+LtdBShQR
	/P9kr6QOwice4y83ovgdT+o5KrHmjTNloAiz3FhI71oLGK0/3Nl9njm/zfAkLcuA
	xNLj8dtBeqnTblFcYABrVrfEB9rHpNyl6QXtNdV5gfmam2lERN55McQn9L/rMwaj
	/dBiCcamK42cnaW15jq61oH3LjzKQdf4+8xxGqtzoOQyUsOSSB3g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kcjps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 05:07:57 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 8 Jan
 2025 11:07:55 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 8 Jan 2025 11:07:55 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 69DFB820248;
	Wed,  8 Jan 2025 11:07:55 +0000 (UTC)
Date: Wed, 8 Jan 2025 11:07:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>,
        <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 5/6] ASoC: rt722-sdca: Add some missing readable
 registers
Message-ID: <Z35bnu/50njj9qFE@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
 <20250107154408.814455-6-ckeepax@opensource.cirrus.com>
 <8780fa77-d51e-4be8-bdb5-415ddb03482d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8780fa77-d51e-4be8-bdb5-415ddb03482d@linux.dev>
X-Proofpoint-ORIG-GUID: B_Dtih2bDcWb6eCzBKS8N2DMd8JOH_3Z
X-Proofpoint-GUID: B_Dtih2bDcWb6eCzBKS8N2DMd8JOH_3Z
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 07, 2025 at 02:00:11PM -0600, Pierre-Louis Bossart wrote:
> > +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
> > +			  RT722_SDCA_CTL_FU_MUTE, CH_L) ...
> > +	     SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_USER_FU05,
> > +			  RT722_SDCA_CTL_FU_MUTE, CH_R):
> > +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_XU0D,
> > +			  RT722_SDCA_CTL_SELECTED_MODE, 0):
> 
> nit-pick: maybe we should have a shorter macro when the
> Channel Number is not used? Using zero here means there
> is no channel-specific control, not an explicit intent to
> program ch0 and ignore chN with N>0.
> 

Yeah the current macros are a bit hard to parse, I would
probably even suggest a little string pasting too so one
could do something more like:

 RT722_SDCA_CTL(CODEC, FU05, FU_MUTE, CH_L)

But this is all clearly a separate improvement. The purpose
here is just to demonstrate using the new regmap features,
not to improve the coding style of the rt722 driver.

Thanks,
Charles
