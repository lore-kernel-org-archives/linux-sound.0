Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752207;
	b=CD7ZOIZIIdajj1ytkYFlKeARxSh/aQU9qEMXBl7LLu+1tnOf6NQvoAn8+7d8EtEOuKaw
	 AG0PbOF17C59m8DFJEAmq/tNU03WLcC/Gynw5+YkwzyudMEqyqPgIZ8sB+55PJkBX3s+y
	 QbTHZ+i44ILgwh6yaOcQwRn3+kDD9y7jx8IHg7FpUefs+XWhj+IsQWKgu0jMNNsjv5t1u
	 0gvW2AUrhGjKVDubfLscHDoEIyDcBVfDMkyzgqgdx5ITw1KSG6syvjkxf53NGXNydzg0N
	 fkPTofGw7yyNGiOjyE+nmYVNMjiaqrPia5BySv50PRySlF5CzLq1FdOAKXgkZkA8J2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752207;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=L/m7oJyhFTGqB4Viq7ESs4c6x4/iAJeiP9E3QqgTO4Y=;
	b=ghesfaeGJs4ei/kfrCAjCU87mtEmn6oDDlFlQd2rvBrKsjiMIKFlwRTU38k4O37CqMj6
	 6gir24iMaIDN5KD2uk9aqJHa4IHwCX6yGrCBrSmGKWXZtTNRyIsBq7+LmWpx+/WNA3tlo
	 XJ8oR1vRMt58I7AbiWhh//ktxk3qg6EmxOjQA0ePdSI/n1DCJwFkMoIYq6Kp5UnUrW8lT
	 4z6Bjtg8Wm9nSuRwKJ3V6/DgpTezeO1OEJwP00i5SxaYixQwXN1SQ/R+tbBIM4QnLp2MJ
	 OrfRiaan2qbJGHnhBIpcDRm2q5193uPY00ywxcIaln3IgIPOA8anccgfXiP8+qrFCgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=FHUFlbwo;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88D606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 00:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE88D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=FHUFlbwo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793752203; x=1794011403;
	bh=L/m7oJyhFTGqB4Viq7ESs4c6x4/iAJeiP9E3QqgTO4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FHUFlbwotUnf8wyn+Xv06vx1YY99P/bxxyOmN9iilyeMuDf3w+A9OjNcCHBFecW/d
	 Gij4zet0I2yI8BT6RRLwM/2ptz6B3xgFIKtTZptFQDariEgdOe3+0urGfWXdfULXNp
	 Zxc5es1wTs4V82Cfewc4Cj2q4oti88uhPoHlfymFFXZv6bg4Ro8uLV2lMtjg+6CQb+
	 i8yGLrbx+026DwmENOSP7qTDwZVVOIcM1pxBEmsIB5hqu5k6fjbdQLGlfQrrdIyyN6
	 yP0vnvqMmkwqdxE8EPw2yxPNhSiWyiBZ0Vo0JO1ttkSA+ZQT/+/mHufG8frcRy2hNS
	 gM4C8rJocJnwA==
Date: Wed, 04 Nov 2026 00:29:58 +0000
To: Charles Keepax <ckeepax@opensource.cirrus.com>
From: Ned Blake <ned.blake@protonmail.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Lenovo Yoga Pro 7 15ASH11 (83W5): constant hiss from speakers during playback, headphones clean
Message-ID: <kKlCkdjqp0g4tLyK_ty5jkmh8G5IhXcDE_y5v6pUlFr0thaI2HH-m33k0X54z8JSkSX594dh9nYEEw6bAJfNn8OaEiMyAFnIl7V92NBp0Oo=@protonmail.com>
In-Reply-To: <auhqRXI16ubRPCo8@opensource.cirrus.com>
References: <j42YdZOPMn1UBkfj2HTDC9cUW9vO0S1GjRdS8xTrWu35DTCOKAoa6gR7N0ZZF_JX_6_HOjF1Pj0PFqrmMsSlSYTEVNa6IW88dq8caB07pRw=@protonmail.com> <auhqRXI16ubRPCo8@opensource.cirrus.com>
Feedback-ID: 42001000:user:proton
X-Pm-Message-ID: 9273cd9350269589857e9d5f144ed3c0a9da1c97
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, 2 November 2026 at 10:47, Charles Keepax <ckeepax@opensource.cir=
rus.com> wrote:

> On Fri, Oct 30, 2026 at 11:44:02PM +0000, Ned Blake wrote:
> > Hardware
> > - Lenovo Yoga Pro 7 15ASH11, DMI product 83W5
> > - Codec: Realtek ALC287 (codec SSID 17aa:3960), PCI SSID 17aa:38fc
> > - Two Cirrus CS35L56 amps (cs35l56-hda, firmware ...spkid1.wmfw)
> > - Kernel: 7.2.11-ogc4.1.fc44.x86_64 (Bazzite, Fedora 44 based), PipeWir=
e 1.6.10
> >
> > Problem
> > Constant hiss from the internal speakers while audio is playing.
> > - It stops when playback is paused.
> > - Its level does not change with the volume slider (tested at very low
> >   volume, e.g. 5%).
> > - Headphones on the 3.5 mm jack are clean; the speakers still hiss.
> > - Persists across reboots.
> >
> > Observations
> > - dmesg: "ALC287: picked fixup for PCI SSID 17aa:38fc", both CS35L56 am=
ps
> >   bind and load firmware normally. No audio errors.
> > - Muting either the "Speaker" or the "Bass Speaker" switch silences all
> >   speaker output, so they cannot be used to isolate the noise.
> > - Auto-Mute Mode is Disabled: speakers keep playing with headphones plu=
gged in.
> > - Pin routing (/proc/asound/card1/codec#0):
> >   0x14 (Speaker) -> DAC 0x02
> >   0x17 (Bass Speaker) -> DAC 0x03 (same DAC as headphone pin 0x21)
> >
> > Not tested: other kernel versions, changing AMP1/AMP2 gain.
> >
> > Happy to test patches and provide more output (alsa-info, full codec du=
mp).
>=20
> Could you create a bugzilla on: https://bugzilla.kernel.org/
>=20
> Attach an alsa-info and make sure to add patches@opensource.cirrus.com
> to the ticket.
>=20
> Could you check adjusting the "... Speaker Playback Volume" controls
> manually, would be curious to see if that helps? My gut feeling
> says this is the I2S setup being slightly off and some quirks
> are needed on the Realtek side. But that doesn't quite gel with
> the volume not affecting things.
>=20
> Thanks,
> Charles
>=20

Hi Charles,

Thanks. I filed a bugzilla with alsa-info attached and added
patches@opensource.cirrus.com:
https://bugzilla.kernel.org/show_bug.cgi?id=3D222235

I tried the amp volumes: "AMP1 Speaker" and "AMP2 Speaker" lowered from
448 (+12 dB) to 224 (-44 dB), playing at low desktop volume. The audio
became inaudible but the hiss stayed at the same level, so it does not
seem to come from before the amps. Restoring both to 448 brought the
audio back, hiss unchanged.
