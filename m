Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8720E00A
	for <linux-sound@vger.kernel.org>; Thu, 27 Mar 2025 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069310; cv=none; b=euTFvfh1X0aL0In6s2K2dltYb04V/OmGlied53qowGG7XuyjP+wRMKVGS3K+ORST5UDNsyQ/JkV+vuZZttCZA15Eo4wpk+noAyDEEYBrYyi8OY2ESFf8ltwRxd7HceoWa87vm4vVXohb1SOIz+mGXek0iqlZd7o0OxqIpkCoI/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069310; c=relaxed/simple;
	bh=vAGIZ75leEabALObSYVtgDvF66kZh0UWOKAhZMqKbNg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GveukC/IJQWOcD9U5NJxfBrIGJ/4qvNTnok/AEVU9/nIG1JMetT07cZsTq3Vkgj91ilchP4eFMp/7GXlnsHEtEz8ijIGvB6udUOAjjEqZOnQabRwIziZbzdPDQ1xyvZ7O89akFT4O5vWGSz3MkSlwtNu27NcS9RsvA821tlMr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=TCNdjDJ4; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="TCNdjDJ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3QeLQr/rpW78jvGKyGKBXc8iojJghQm5jyEfKIVXD88=;
	t=1743069308; x=1744278908; b=TCNdjDJ4SXi1lG/yhbOqs76zmfv3TFpDkBfbBVY8fqQDwhU
	z0ajb5LQJK/DKrCt1RW05Us3q1E9O52quX3zHvETZDQSWDojolOkW5j85BgU5aLKYbKWgecHHf1pr
	Q6HhZW0vJqy1Z8TjoPiJMcU1lrnaHueiLkOQVRAibF7q3eQZh0rVU5V0LLkiiNjtUPAXS77rMDndv
	0ve2Lu3pqlV3EUtpj9lmS3FDiuh/++rWUMajtz7P4+W6656uqiZdgiDPmIzh8z23wz6kVzm/AQhpY
	hZipfnuDoAs7Y3dXeNRpjx2UsrFtDD6VAQHS4T9xHLIW8SaDdsCbN2FBblrcANJg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1txjx3-000000077rE-0y2z;
	Thu, 27 Mar 2025 10:55:05 +0100
Message-ID: <3766ead24f99ba9ac7490a2066d99f0ba968df27.camel@sipsolutions.net>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speakers on further Samsung
 Galaxy Book2 Pro
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai	 <tiwai@suse.com>
Date: Thu, 27 Mar 2025 10:55:04 +0100
In-Reply-To: <87jz8a9731.wl-tiwai@suse.de>
References: <20250326201953.131948-1-benjamin@sipsolutions.net>
	 <87jz8a9731.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-03-27 at 10:05 +0100, Takashi Iwai wrote:
> On Wed, 26 Mar 2025 21:19:53 +0100,
> Benjamin Berg wrote:
> > Note that I didn't really manage to test this directly. Trying to
> > do a
> > reconfigure resulted in a hang and I didn't figure out how to use
> > the
> > patch=3D option with a firmware file.
> > However, the machine does work fine when configuring the two
> > speakers
> > from userspace, so I am confident that this patch is correct.
>=20
> FYI, the equivalent can be achieved with model option, too.
> e.g. passing model=3D144d:c870 will apply the same existing quirk as
> SSID 144d:c870.=C2=A0 If your target is the secondary codec, pass like
> "model=3D,144d:c870" instead.

Hmm, it is probably really straight forward, but I didn't grasp the
documentation in Documentation/sound/hd-audio/notes.rst on a quick
read. I am not sure anymore what I did (and I don't have access to the
machine anymore). It might be I tried putting the model=3D line into a
firmware file instead of just passing it on the kernel command line.

How do I even know whether it is the first or second codec? Is that
what the D0 in hwC0D0 is?

>=20
> > ---
> > =C2=A0sound/pci/hda/patch_realtek.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realte=
k.c
> > index c735f630ecb5..e4ea5ea5bb27 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -10758,6 +10758,7 @@ static const struct hda_quirk alc269_fixup_tbl[=
] =3D {
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xca06, "Samsung Galaxy Book3 360 (NP730QF=
G)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XE=
D)", ALC298_FIXUP_SAMSUNG_AMP),
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xc870, "Samsung Galaxy Book2 Pro (NP950XE=
D)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
> > +	SND_PCI_QUIRK(0x144d, 0xc01d, "Samsung Galaxy Book2 Pro (NP950QED)", =
ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XE=
E)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XF=
G)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
> > =C2=A0	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP9=
60QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
>=20
> The table is sorted in PCI SSID order.=C2=A0 Could you try to put at the
> right position?

Sorry, will fix and resend.

Benjamin
