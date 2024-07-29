Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544815B113
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273023; cv=none; b=Woz0hWkTUPSQXTZj6AvbRYYr/6VDv10HIPCaFovI6+jnN0wEHrj1+zbbX2TVkOUzWjrOkIx+Ugd/Vj3dlPCNq/0CYWw9pDFngo8jH3Dpje2zCrM0aJeGuy1QjqJyk8lvMapdUsBnwcKwusps190v0YuHRM3ZsoLiftWoCkIBSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273023; c=relaxed/simple;
	bh=63jSjtosk0IkDTM3W8dF8mS0+BpYpk8SPXmoTjhhvR0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=car3aCTLMbOIaQVJw4x5miyD8axrLBXxDuvq1mzSbZEDRYK+Atq+xbojh9dWA2lx6N50HozCr0nIFO0c/+vdeCEXRE6PgQ60C0bHC38Z8CFVp2Bs+PuqTit4WAPcSNUR7wk0wq8AIfSIjLlinTY6AXv2WauYA5+Y3jNlf8kzLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MYEcwoYm; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MYEcwoYm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TFGU4p027804;
	Mon, 29 Jul 2024 11:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KUcGu/CYzXK8U53nuT
	TrAXcRbVZ3aln8MhnwQfJZLaI=; b=MYEcwoYmsd73SqTc+i1FNSwn72x/aeK8ee
	QEbVBJbrUdqQ/fu3seTQl+QynzetCq8bzo3sSHTZut4MVvcRWHTbahpYICJYyurJ
	P30m/RICcVs0PkWT7gxA13xYozbZkFU+FnHtfjYexnhH1IjhVk04DrSqQRgHyUTn
	jV+9+36GxwNYwfFd9FPOivL61532BRTqnB6aQpfQRIhVDaJbemY9CaNsiWRc90+F
	Lfmf9c6wpbgdPCVPO0aMpWS2gPyuxYpk3KHeSG01rfmESibUYo98RtunkU6/vtgm
	AP2QEn4idYkmhhv0pgWnFpY5uIieytFz12OhKV91DNpKK5MeYHEA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9yjcdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 11:45:03 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 17:45:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 29 Jul 2024 17:45:00 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id C101D820244;
	Mon, 29 Jul 2024 16:45:00 +0000 (UTC)
Date: Mon, 29 Jul 2024 17:44:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
Message-ID: <ZqfHC7IodobTlVT4@opensource.cirrus.com>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87plqw9no5.wl-tiwai@suse.de>
X-Proofpoint-GUID: Z0XDti4xI_OSxwo4ovMtgXaI3ur7FzzE
X-Proofpoint-ORIG-GUID: Z0XDti4xI_OSxwo4ovMtgXaI3ur7FzzE
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
> On Mon, 29 Jul 2024 17:59:32 +0200,
> Charles Keepax wrote:
> > 
> > The microphone/speaker privacy shutter ALSA control handlers need to
> > call pm_runtime_resume, since the hardware needs to be powered up to
> > check the hardware state of the shutter. The IRQ handler for the
> > shutters also needs to notify the ALSA control to inform user-space
> > the shutters updated. However this leads to a mutex inversion, between
> > the sdw_dev_lock and the controls_rwsem.
> 
> That's bad, how does the mutex inversion look like?  Generally
> speaking, a call of snd_ctl_notify() from an irq handler is a very
> standard procedure, and it should work without too much workaround.
> 

SoundWire IRQs are called under the sdw_dev_lock, and then in the
IRQ handler we call snd_ctl_notify which takes controls_rwsem. On
the other side, in the ALSA control handler which is obviously
called under the controls_rwsem, we do a pm_runtime_resume, which
causes SoundWire stuff to happen that takes the sdw_dev_lock.

Thanks,
Charles
