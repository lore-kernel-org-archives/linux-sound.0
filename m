Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449B1D86F6
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162956; cv=none; b=XfScWlCP9Xtvn9/4b77O3vFvEN9cOz3tIveV+d8ONPQ9bgGnJrl0GRqjVF8c2vBH/RPXZzsG6mjeyBLHpyZvIbCwvi2iw62SBvTwDiiK1D56rRahNRPL/ktu5W8QpbUhadKtrfn2tGKR7jNeGu7SVu5vZvWjhMNWX1tNU+YB7QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162956; c=relaxed/simple;
	bh=hrRbjSlJreKepA+VuqjygtT3jlFK9HCQWhZjEr7LQHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jJ8NCxg9D9HTCOjxZ4o9/snrlPYcBOOXLQvCggxXtzmL1utUjajbmAbxX7vv9ajHkhSRJZLtEznXVPRZLvVEj/KfJetc8PBP8FGOFO8HppxIbm+GeLSy1n4NCqpMNWffK0ipeX/tjv8ZiNvY/O5M8VKUDbZkXvd0tdP9iTFnBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=wk2tTDZo; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="wk2tTDZo"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5258ML7501173756, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741162941; bh=hrRbjSlJreKepA+VuqjygtT3jlFK9HCQWhZjEr7LQHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=wk2tTDZo20Wq8vEOkHt40bmqRtIXFNWCloXZExz2BNikRX3oI0m22fMo8/M1sjH3t
	 Hv88fsvCRfkfsyvvvCgGzFXpYWFVjE7djqd9gBOmDk06pJhz+VqugJ4G32AjSE2RSn
	 nwYUoHGiAye6U6K9InJRfy+sM/ULvaUQQcbfm+M4KOJIIQHRcupzvoPdK3emaR6DxX
	 RrP0IzpJE22DiSw7Drr5evXbUxp4Pv9tMb1+hRxSt7CWhTQJSv0k4Td0upT4gzG1q4
	 qKRxBZmzBkCoQApB3g7hDQFWz1Ze5AmHUmu8AV7gjrOyeaA2lAH9l0MW421NYZyslt
	 nuz5cvZaG/Fzg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5258ML7501173756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 16:22:21 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZCAAIztgP//eTeQ
Date: Wed, 5 Mar 2025 08:22:20 +0000
Message-ID: <494a665481e043a38b94d844654fa81f@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
 <87wmd3uc28.wl-tiwai@suse.de>
In-Reply-To: <87wmd3uc28.wl-tiwai@suse.de>
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
> Sent: Wednesday, March 5, 2025 4:17 PM
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
> On Wed, 05 Mar 2025 08:56:41 +0100,
> Kailang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, March 5, 2025 3:54 PM
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
> > > On Wed, 05 Mar 2025 07:32:00 +0100,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Update ALC222 depop optimize as attach.
> > >
> > > Could you give a bit more background info why this change is needed?
> > > Is it a mandatory change to fix something, or it improves something?
> > >
> > This codec has two headphone design.
> > The HP2 was nid 0x14.
>=20
> Sorry not clear enough: do you mean the patch is to fix the depop problem=
s on
> the models with two headphone pins with ALC222?

Yes, the original depop was only supported one headphone.

>=20
>=20
> thanks,
>=20
> Takashi
