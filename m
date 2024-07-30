Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C7A19308E
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328992; cv=none; b=BH82r/XFkNrAyQfvPk9bG6iukX4/0ZAd7APiptVJPZ0TQ4fpKyFvXh6TP5QDOZInDGk9dQqBBfqewyqybbOkGkR98A3wNOTy60xOR2vVwm5aRTq5HKczmNwMRe707eHgNsl9lJCJalDh3ZTn2/xd1MJGn942doHXPp9cBu/1g74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328992; c=relaxed/simple;
	bh=sh5qUXkmLCuV6DmHvHcEJysB+t82/LnCNI8sKdOIVQ8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euQCI84nWsS/Eh8SEc1aHFhcNNGfwGyo9C/YojyLuTkVpTw7ykRaw+RjMffh2PSIoC/wE6zJbsFun7ehiWYj19avJtBIDJ6Yy9a8o2MUHgjV3N7G0tW5ZPqKWHDfUzfY9Ff4p5vIoSnsICM7rLhkMe2TJYmQPlAmi/bu+8umGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vuno9b0r; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vuno9b0r"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U5LV55006061;
	Tue, 30 Jul 2024 03:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Mspl6XHxNoA4ZFPIua
	Vn8kFSs1wAMwtCp/cRic6+13E=; b=Vuno9b0rVmjARbqAs747G/bJ5mIrxZfx4Y
	Rjnq0X9ORbJdIJRmX4l2kLeFKbppDCvnI3wpc88gRGyTEA8nkGPGff0mHoHu1ril
	8vttJMxIqiIqMxK8j7rqoM6grroXmzCrqRITLHTtBOj5ve+mZ2ukO6pfN9Oh7uOj
	bkCeF5hW4HNkonVG4+RvwFhJrypkW6Vl+E6C+/ryOMeLBLq7ooDfmQYaDPOVWh3R
	t6Bs9BnCnxZNYLBuS5r+u8Qp0GQR4EWznDw2W3AIULSRdxHbU2iVOWiCYTHVpNr+
	Lrb8xS9ood1+r63p+IMqm1/v4z5IVbH8E8zfItnbIBdNGEv0DhsA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40mwaju36n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 03:43:03 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 09:43:02 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 30 Jul 2024 09:43:02 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 0F7C8820244;
	Tue, 30 Jul 2024 08:43:02 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:43:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
Message-ID: <ZqinleaAqikxdQGr@opensource.cirrus.com>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de>
 <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ikwo9etj.wl-tiwai@suse.de>
X-Proofpoint-GUID: eyGPBTebgaiB0agpMKUiI2SJHKYeQluB
X-Proofpoint-ORIG-GUID: eyGPBTebgaiB0agpMKUiI2SJHKYeQluB
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 29, 2024 at 09:30:00PM +0200, Takashi Iwai wrote:
> On Mon, 29 Jul 2024 18:44:59 +0200,
> Charles Keepax wrote:
> > 
> > On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
> > > On Mon, 29 Jul 2024 17:59:32 +0200,
> > > Charles Keepax wrote:
> > > > 
> > > > The microphone/speaker privacy shutter ALSA control handlers need to
> > > > call pm_runtime_resume, since the hardware needs to be powered up to
> > > > check the hardware state of the shutter. The IRQ handler for the
> > > > shutters also needs to notify the ALSA control to inform user-space
> > > > the shutters updated. However this leads to a mutex inversion, between
> > > > the sdw_dev_lock and the controls_rwsem.
> > > 
> > > That's bad, how does the mutex inversion look like?  Generally
> > > speaking, a call of snd_ctl_notify() from an irq handler is a very
> > > standard procedure, and it should work without too much workaround.
> > > 
> > 
> > SoundWire IRQs are called under the sdw_dev_lock, and then in the
> > IRQ handler we call snd_ctl_notify which takes controls_rwsem.
> 
> snd_ctl_notify() doesn't take rwsem but ctl_files_rwlock.
> And rwlock isn't taken except for two cases, at a list traverse at
> enumerating from user-space and at the device disconnection, so it
> shouldn't race.  Anything missing there...?
> 

The trouble here isn't the snd_ctl_notify, the handler uses
snd_soc_component_notify_control which also does a
snd_soc_card_get_kcontrol, which eventually calls snd_ctl_find_id
which does take the controls_rwsem.

Thanks,
Charles
