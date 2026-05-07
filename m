Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5330FF21
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180055; cv=none; b=N4/+VfgS21x8Xx8darELScoDddyhCmQM0iiiKn8/gxaV9WVLacMpWF2/0lFZZIUDpZMu9U01B1nNWwnNKkS+xTDoib5eesjpWXgfU3DE5i0+DGr/dqqXV97vCZsxqMkewWFuJaTPCHEoWiX3k2OVUzQXwfHlFPpuo+UhV2QFe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180055; c=relaxed/simple;
	bh=P0EQ0y8sVgRzBs1TSAYyaPqy3kgwKl5dc3p3aNEiOUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnWztwWqRRXAktsq35Db3GSyV5u5WM/A7BXg4pJD925Uz2cYFDfWQAQrp/nxIycA831lOgZHuIimjYtRx/tMa6QuJpZmJAyYe0la+b2Ti6Kx0cDh3h2z75PHt9RfJRMJcUTgMaZAsg5v1EKQXh9uILHIh0YJ8gTCMJkOYtoFkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BKkyK5jP; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BKkyK5jP"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gBLy95jJDz9sc0;
	Thu,  7 May 2026 20:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778180049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmLHACYY1O+Sxsko/zSD3Lwa9kMNgy8zFKqlY9YQPZo=;
	b=BKkyK5jPQ2TcBh8nB7zMvJjTKNHS2L5WuMcgragPOYFbtjnRQm/MowW1O2Sa9/u9xMkvLg
	wXinUwC7JRSKnwEv1Jc8CDFAcc85Xeu+nNwnP5kAtKRIRk7gAaA3uXUsHInRhvLLLUafOF
	/xHZ1v0MpyRkwi4RF1DodZV40BG2B2+tJy9WZUwt4tWIF0UppM+1Os8z1meBgNgiF3aGU2
	NHQXIRKGiqhU/n5PBhlac4FmoEWRzYr+YTMEVuvRm1nKB29R7Mra7Bb+pbIWMFJWWk3DIU
	s1f74MzYE5mkNYPEb20SiWkyJP5Tu56d1eXQ1itTviAbCc24Viqg3IqReTHLOQ==
From: Tobias Bachmann <tobac@mailbox.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther Lake;
 chip stuck across distros and kernels; worked initially;
 still working at hardware level
Date: Thu, 07 May 2026 20:53:27 +0200
Message-ID: <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
In-Reply-To: <afyxWuMCcawIE2+v@opensource.cirrus.com>
References:
 <cLVwl4lrR76pLtv8VxMSaA@mailbox.org> <y6AZlQCPSdCp46upW40QCA@mailbox.org>
 <afyxWuMCcawIE2+v@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-MBO-RS-META: 1idkdpj685mfbwn5ng7rsnnt3bhp99wc
X-MBO-RS-ID: 096520186ed1868b6aa

On Thur, May 07, 2026, 05:35:37PM CEST, Charles Keepax wrote:
> Yeah I am afraid this looks like a hardware problem, enumerating on
> the SoundWire bus is pretty much only dependant on power rails.
>
> As you say there is a tiny hope the device has got into a weird state
> but isn't reset on a reboot. However, given it looks from the log like
> the amps were reset:
> 
> [   14.603448] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic CS35L57
> Rev B2 OTP1 fw:4.2.1 (patched=0)
> 
> That patched=0 means the firmware has been wiped and that only happens
> on a reset and as far as I know the resets are tied together on this
> model. The very very long shot would be to let the battery run down
> and leave the device for a bit to try and super make sure the power
> rails went down which would also fully reset the device. But it is
> definitely a long shot.

I figured as much. I can take this up with Dell as a hardware issue, but
before I do, I wanted to ask about something architecturally:

Windows (or the Cirrus driver?) apparently treats the speakers and the
headphone jack as independent functional paths and can drive the
speakers fine despite the jack being non-responsive. The Linux driver
currently appears to bring up the sound hardware  as a whole, which 
means the headphone subfunction failing to reattach kills the entire 
card initialization, including the still-healthy amps.

Would it be reasonable to consider a degraded-mode behavior where the
driver proceeds with partial initialization when one subfunction fails,
as long as others remain reachable? My particular case is likely
hardware degradation, but I imagine similar failures could occur from
manufacturing defects, physical damage to the jack contact, or other
single-subfunction faults that don't render the whole chip unusable. The
current behavior makes such a laptop entirely silent in Linux while
still usable in Windows, which seems like a worse outcome than
necessary.

I realize this might be a significant change and there may be good
reasons it's not feasible with the current architecture. Happy to test
any patches.

Thanks again,
Tobias



