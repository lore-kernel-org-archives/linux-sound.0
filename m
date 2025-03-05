Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6227F1FF7D0
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166545; cv=none; b=rnDSYy68eCCnEPsDK/VjT6+9nq8/vRKxmxi0aD9gTBx7ilgJT99cnHdpy0at86tuSdyptW2CQ/OKeh/nRfemOEaR0Xd5ImIPlZN+WnDDIf/2W/7RDalcamASfD+cRIsB4BFUiU2JV1OBa1xkhnpsh1m3+Ls8ZydYoqtgdWAOmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166545; c=relaxed/simple;
	bh=uk07UyqbzdHdjNBKglOEaqbiEWbQK9HSF+BWZCcsdpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bzkJCgQ5Xi3FD3Q5GSo2xnIewSLMOJTNZ7IvODAWMm7gPcERQ5YGe0D8ysgm2jYJe/Yj1Jn7FlU1Si3jVlY8PzSp1bMU21W/tBY7uzPlHxWiCcbAXsy9N7Y4kidBU3cE3rFXdeVwx5S2PTE/LlOccKmr4FnDTUV4531Q2eQYpos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=OA0qGRtf; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="OA0qGRtf"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5259M4Mx81243822, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741166524; bh=uk07UyqbzdHdjNBKglOEaqbiEWbQK9HSF+BWZCcsdpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OA0qGRtf0ny9zGYxCD70qvDFhN2UtHjEv/p9yLh5h3iBcoV4+uiZ1q8WphMC85hl6
	 PnLcnCH+qEkHuVPUY5UHJj/OHpDxo7hs3kkZe5eFp6oTjoyn6XKo3Zyky+BW5cnCcB
	 eXa+XqJ5aPw8GQA9vcXRUBPcp77qbpeGAoCfb55X7EGvl9U+uaLIa+fCi3VxyvJdvv
	 oLKn7o4wGg5vYPBvcJMjkT8NSrPMXZ6rOWQaakcISh63Q6V2SZBeBuwh0oe3/s64WY
	 dA5pV/EmPXUNTCRWti9KYPS7w1/gQMG4AAOIMfezhh5uPArTZoikEq+Sf7tuOXUfI9
	 9bj/pnzdulbNA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5259M4Mx81243822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 17:22:04 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 17:22:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 17:22:04 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 17:22:04 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZCAAIztgP//eTeQgACQHQD//3QI8A==
Date: Wed, 5 Mar 2025 09:22:04 +0000
Message-ID: <ec41e956050e4ea594daaf8042fd6d1c@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
	<87wmd3uc28.wl-tiwai@suse.de>	<494a665481e043a38b94d844654fa81f@realtek.com>
 <87tt87uail.wl-tiwai@suse.de>
In-Reply-To: <87tt87uail.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, March 5, 2025 4:50 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> linux-sound@vger.kernel.org
> Subject: Re: update ALC222 depop optimize
>=20
>=20
> External mail : This email originated from outside the organization. Do n=
ot
> reply, click links, or open attachments unless you recognize the sender a=
nd
> know the content is safe.
>=20
>=20
>=20
> On Wed, 05 Mar 2025 09:22:20 +0100,
> Kailang wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, March 5, 2025 4:17 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > linux-sound@vger.kernel.org
> > > Subject: Re: update ALC222 depop optimize
> > >
> > >
> > > External mail : This email originated from outside the organization.
> > > Do not reply, click links, or open attachments unless you recognize
> > > the sender and know the content is safe.
> > >
> > >
> > >
> > > On Wed, 05 Mar 2025 08:56:41 +0100,
> > > Kailang wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Sent: Wednesday, March 5, 2025 3:54 PM
> > > > > To: Kailang <kailang@realtek.com>
> > > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > > > linux-sound@vger.kernel.org
> > > > > Subject: Re: update ALC222 depop optimize
> > > > >
> > > > >
> > > > > External mail : This email originated from outside the organizati=
on.
> > > > > Do not reply, click links, or open attachments unless you
> > > > > recognize the sender and know the content is safe.
> > > > >
> > > > >
> > > > >
> > > > > On Wed, 05 Mar 2025 07:32:00 +0100, Kailang wrote:
> > > > > >
> > > > > > Hi Takashi,
> > > > > >
> > > > > > Update ALC222 depop optimize as attach.
> > > > >
> > > > > Could you give a bit more background info why this change is need=
ed?
> > > > > Is it a mandatory change to fix something, or it improves somethi=
ng?
> > > > >
> > > > This codec has two headphone design.
> > > > The HP2 was nid 0x14.
> > >
> > > Sorry not clear enough: do you mean the patch is to fix the depop
> > > problems on the models with two headphone pins with ALC222?
> >
> > Yes, the original depop was only supported one headphone.
>=20
> OK, and then would it be a bit risky to blindly assume the second headpho=
ne
> pin 0x14?  Isn't it set up via pin config?
>=20
It doesn't have risk to set this pin as headphone or line out.
This pin (0x14) can be a line out or headphone. It has JD which driver will=
 get it.
Line out and Headhpone were need to do depop procedure.
If pin 0x14 set to speaker, it wouldn't have JD.

hp2_pin_sense =3D snd_hda_jack_detect(codec, 0x14);

This just got JD to do depop.

>=20
> thanks,
>=20
> Takashi
