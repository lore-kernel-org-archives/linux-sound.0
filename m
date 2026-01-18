Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1597260A
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756058; cv=none; b=LQ8Z3xTWaqP+O3DqVudmThAf2bZW5xGeVeWkgIYs7cOUjILiRToGgYGgFKYd03JbB8djd2ue5zbh+ogaGp4wuSradJbZNq7XuqCcG/sIhqgN1FoQFM68EL8MCht8wJwpWGktQjfDzu1LMa/7hJKm6sE3KCebr+FeLv50rGTOVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756058; c=relaxed/simple;
	bh=n+7hF5zZXpCrnBW9e8RVf483wZUviCHYO4yqqnBRrHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYZZ9E8kVR77PIj4vIJgbMzLdoC2GJCNs1BgYIqIqRpmiofgssMWhLNcFTmPdpu2YE0HfRKgeGuxINg5tGDXU3ypmwmCQ2WoDS6ZC92dnNBD6LN75ZshVoyWJ2H7ZrtIJtaFAq3A+JfwkU44hVJ5l3LJZ1B+lE0giaKKrame0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=fail smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=nhj91rLO; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="nhj91rLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1768756041; x=1769015241;
	bh=n+7hF5zZXpCrnBW9e8RVf483wZUviCHYO4yqqnBRrHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nhj91rLO/66fPBR3NqWCyRLOeE45I3o/xlZvewuMYWdmlqQ+jxtFAs+AHAd2D1FJD
	 coqQJH51o08eJr/P36AjGryhq3hByiqzgjY3fHbjgToJGUHUuGb3SV/Z1dZExNXipv
	 98cpVKofjNgBPoivJbNWea3SJlxQTnX8OmOnhMPcv6G8HHbZB4+b9W4nsO1w5WGxDB
	 BVNZmlQO6vAO/ZlneF0QmPUPVIC2acjOVFlZYk2jMiOM4J4WqkeDkLIlO+JVnGQ7xU
	 23+RAz2de1dSawxHRRES45gjhteV6QoviimgCbGI2DcYgmG5dViNn/aZUxs1r28SR/
	 Z9XuQat6fRozQ==
Date: Sun, 18 Jan 2026 17:07:17 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Asus Zephyrus G14 2025 using CS35L56, fix speakers
Message-ID: <XqnvvlnwyZf0b1xnGu9hIpjn5vpqNYWkSLQA06lEc0AI2Qp04CY9TfAy72LA_L4ONvU9ZkYSKWiTPx0xhpxkqRtx9gQRDwz9F-tX_22jspQ=@vinarskis.com>
In-Reply-To: <87cy3dr988.wl-tiwai@suse.de>
References: <20260112-asus-rog-audio-v1-1-513957b4704e@vinarskis.com> <87cy3dr988.wl-tiwai@suse.de>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: dc2e7f93145373d5491f7ad2ba0c07d28e60f0a8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Tuesday, January 13th, 2026 at 13:24, Takashi Iwai <tiwai@suse.de> wrote=
:

>=20
>=20
> On Mon, 12 Jan 2026 01:06:37 +0100,
> Aleksandrs Vinarskis wrote:
>=20
> > Just like GA403U, this GA403W needs to remap woofers to DAC1. Similarly=
 to
> > other Asus devices, headphones/headset MIC is not working, however the =
pin
> > config alone is not enough to fix it.
> >=20
> > From Windows dump of GA403W:
> > 0x12, 0x90a60140 # Correctly set by codec out of the box
> > 0x13, 0x90a60550
> > 0x14, 0x90170510
> > 0x17, 0x90170120 # Correctly set by codec out of the box
> > 0x19, 0x03a11050 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > 0x1a, 0x411115F0
> > 0x1b, 0x03a11c30 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > 0x1d, 0x40663A45 # Correctly set by codec out of the box
> > 0x21, 0x03211430
> >=20
> > Even with all the values set, MIC of the jack is not detected. Until a
> > complete solution is found, set ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
> > for GA403W which fixes audio volume control for woofers. No need to
> > create new quirk with missing pin config just yet, since its not
> > making the situation better.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
> > As per commit description, enable quirk to fix woofers.
>=20
>=20
> Thanks, applied now.

Thanks, I see it now landed in linux master. If possible, it would be nice =
to have it in 6.18, 6.17 stable as well - would you like me to submit backp=
ort separately, or would you be able to pick it directly?

Alex

>=20
>=20
> Takashi
