Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8D15665C;
	Tue,  7 Jan 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244057; cv=none; b=tAWNui7yhYLMIhkDpgOI4F9+FP+SGcKk39FE5CTFxUQYkk5hQYIWcTqi+fMAzGF3BJdOtnKJGzUc5dE+nFRm5NBr9s3UBpiFQAHgB+sq2X8sZCW/iJ08hG6EmtuTJkpImjNnjBx+Ys4n8ZWEy+zGLCJIrSk5LbPtfdnKT0IQHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244057; c=relaxed/simple;
	bh=ffjqx5NekeEz18t3MtFmotCdtRbe4D2+NGaS++FYkyU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8qiSM+SGjlRxCDTLMZRvTvHuFh6vXYaysG/yrBC141sXXsgYlmtWYr3rV9bmzRJLJXJMoqmYdf6gUBhztvjCLe4R3JyA11/FTiOxTHrv5j3JcvPvKumFHysZJpzCxV14Ug4JEOyjrEk9vncejQ5TFGuoKe3m3d5NBhShsCYh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Um8QDLJr; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Um8QDLJr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5078dfXd021845;
	Tue, 7 Jan 2025 04:00:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Z1o/xdultkR+cooCZD
	lfEIUB8GK9MOdjVg8g21gomlM=; b=Um8QDLJrlurM3MGbxI5w87siFwmx9POsXy
	EkIKalIFBAiWJBsXi7EH1pbEVfra9dk4Z/sVcjzcG+mlswnZY0RH9m5IjT2/MnJ5
	uf3GgMThiyw91GBs5U+o+zQcZYFireFENo6TjFmRE6WMMCamiKIaucPpTIoZs7pF
	oQgpipBac8JRJJIgdPXXWDKRGCVmEDHP5cuY5s0FyhqhJ642MFAgmaNxd5SdVJK8
	ifplYKYO1dIAFBRHceUqIKiVpH0qMliihf7z4UCJCMKKHYFX9azVOO3quZuyROef
	g88nEtGHuhI/XJxkTjDfqBEUGLUilOZ3FBfxB+YlRuks32+rEZbA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y392b1tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:00:25 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 10:00:23 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 10:00:23 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 0CC26820248;
	Tue,  7 Jan 2025 10:00:23 +0000 (UTC)
Date: Tue, 7 Jan 2025 10:00:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: madera: Use str_enabled_disabled() helper
 function
Message-ID: <Z3z7NjVOlR5DxSXr@opensource.cirrus.com>
References: <20250107011355.2035-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250107011355.2035-1-thorsten.blum@linux.dev>
X-Proofpoint-GUID: 5GTGGjLDcHk8bjxBHN-ZZP48nOg94jru
X-Proofpoint-ORIG-GUID: 5GTGGjLDcHk8bjxBHN-ZZP48nOg94jru
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 07, 2025 at 02:13:54AM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Include string_choices header as suggested by Charles Keepax
> - Link to v1: https://lore.kernel.org/r/20241229174043.781856-2-thorsten.blum@linux.dev/
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
