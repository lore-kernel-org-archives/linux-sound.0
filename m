Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176AA1A8BF0
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415800; cv=none; b=rPPMX4W1PPa+XihP/i8L4bQk4o3JOsSbVXgQZFU1tKHNszfGpm3dqLhSANnu4c7zKZhAaODrUFh1zRYhmUumEusXn6T06zpbtUzIHUAvLTFaFkekDex0ufT443hxny5tT04zHvpC5ZwuZ5B5sEATCZci72xmZf+CjZr7+vJfh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415800; c=relaxed/simple;
	bh=7KSUZ2yZgPJ8YS3yHNTnmaQelT8NgTUMEua85R4REsw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsXNktxQVy4teTk8esFJdYVafH11ZA7nYql5wjQW1zdzB24UhE+IE7iqdiqTpIl8N57oZoproDvb+fcCFw6M22YZvK7v+zigIJ+rUEExCh+VhlGJoC+6VpJLNOGhvB6xW0JBGrceTTkeI1sgke0oPaax0FurVd7ccvD+k2hlbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SrmeVtsP; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SrmeVtsP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V6nj94024296;
	Wed, 31 Jul 2024 03:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7+9c1LrgeH0FFeJvG4
	6PbP5RoZ6VEKS03eZvWxaGGYE=; b=SrmeVtsP62GiIYn3UEBYoqYpPJuc3QWj+2
	dLiQzFAD6KOWC2uOfg0/tQjm2w5oPaTjCY6bx6f7O6o15tTk0vO/fXPPuf8fwOE4
	mnh8ZUBygBv0M4ewsVY4eac0uYH6oItrlTYTN6jeaUcgJr3ViUq/hmdML2MVP/lq
	Y80OeUOQlGd+3VgZvnaIxy/Qd2aoNmv4icxqWV6LQOpLFK8mHYOfXXSfeyTQRxiC
	QNBj4wL2+89IPuzq5lWV6ZcWbR05soRtftQt4DjVUjV0oZXWz+xnBEVMlEapvyLX
	V7scKER5na/u95rdsI5KZM/z/ilvpXbw5+vfVLVXmFquLrIfYVkQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymd7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:49:33 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 09:49:31 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 09:49:31 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 3DD62820244;
	Wed, 31 Jul 2024 08:49:31 +0000 (UTC)
Date: Wed, 31 Jul 2024 09:49:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
Message-ID: <Zqn6mgRkjdtkf2ob@opensource.cirrus.com>
References: <87plqw9no5.wl-tiwai@suse.de>
 <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de>
 <ZqinleaAqikxdQGr@opensource.cirrus.com>
 <87ikwn3vqf.wl-tiwai@suse.de>
 <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
 <f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
 <3615b393-64cc-4983-960a-44bd2b0773fe@perex.cz>
 <c555e200-af4a-4b71-9e04-d03f3f10c8d7@sirena.org.uk>
 <87ikwmoyyw.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ikwmoyyw.wl-tiwai@suse.de>
X-Proofpoint-GUID: VueUZKP-DR5Pr3vYxEBVLAQTYccCXAIJ
X-Proofpoint-ORIG-GUID: VueUZKP-DR5Pr3vYxEBVLAQTYccCXAIJ
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 31, 2024 at 08:30:15AM +0200, Takashi Iwai wrote:
> On Wed, 31 Jul 2024 01:20:40 +0200,
> Mark Brown wrote:
> > 
> > On Tue, Jul 30, 2024 at 11:47:48PM +0200, Jaroslav Kysela wrote:
> > > On 30. 07. 24 16:44, Mark Brown wrote:
> > 
> > > > With some of these slower buses it's not immediately obvious that it's
> > > > worth the bother of caching - the overhead of doing the lookup is
> > > > negligable in the overall context of handling the interrupt.
> > 
> > > I don't buy that argument. We should always try to write an optimal code.
> > > Every CPU tick counts.
> > 
> > So do the bytes of memory you'd use caching the pointers!
> 
> Adding two more works would be even more wastes, that's the beginning
> of the discussion :)
> 
> The problem is the order of ASoC component initialization, though;
> AFAIUC, the kcontrols aren't instantiated at the point of component
> probe, hence you can't get kcontrol objects there.
> 

I think there probably should be some way to cache the kcontrols,
I will have a look at implementing that. In general I chose the
delayed work as caching didn't obviously seem worth it as Mark notes,
and also the sdw_dev_lock tends to cause a lot of these inversions
and the delayed work is a very safe solution, whereas caching makes
me slightly nervous we will find another inversion at some point.

In general I think that is the actual problem here, the sdw_dev_lock
wraps too much stuff and frequently causes these inversions. Although
fixing that may not be possible and certainly requires a lot of
thinking.

Thanks,
Charles
