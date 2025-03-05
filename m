Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C61DA617
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161420; cv=none; b=iWG6sE/I5OFkOaKvSBv1NSnSIGhKHldIrDxiJuAgV2HhrAz+5XdI6APbDDlWGGo8eJsu8MNYfS7JEq0b87LjjWzC/m2x2jpMomhHkB0gqWGVJMUm2F7VQaNU9abQHCTjkeUOIesurLyfKupgxaautocP3Sikb0KMvu2TBVq6u0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161420; c=relaxed/simple;
	bh=+mbFw9Ph9X3yqzcwPUFnG0EWQqGmsd8ENbZiOlSx150=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LjcUF/ay8DlHokrAxf6afaA93mrTXelc0DFreqx7XNF2z0o1LKz+EMmK7I+NpegJmK/UDg3p5J3pvT72bg1r3BpVq3zHhG1Gbi5YS6O13QMjNyO/IzMcHOoAkRC64JaDgwlGJBRj5bCl+0M1If2UlDpQc3HQl/j4lKwElvM15ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=fSy3wO5g; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="fSy3wO5g"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5257ugrrF1147908, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741161402; bh=+mbFw9Ph9X3yqzcwPUFnG0EWQqGmsd8ENbZiOlSx150=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fSy3wO5gtlPOAi1hh3jXLfDPL14H7/7I0VkshaR3dGq2jhDdeg/TV08BgDklecv0Z
	 vvQV9eDAYca/txNrIkGWawym7xxUi3e0t9rRFV/QVw6dtOWMfT+e8+uOr9JnMCDSOm
	 +itqerFyEiv5RDwR7aM7ItL1TMmquPmhwp2Ggxv6PywircZz7Eqoz6CpjY7n42g8Em
	 C+qcd6XEQ+7KddZPop/bmfwVJeRluHU5SXiyQa1DfYsFiIu6y0a+a5vYapJS60SXNN
	 krUhAP4Fumdz4pSOxh7v2tHmLbeuuLqZpqzONBsGM/tlHbnKtbnuMaXcQiAJSJTKW8
	 bakdcGdcKyczw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5257ugrrF1147908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 15:56:42 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 15:56:42 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZA=
Date: Wed, 5 Mar 2025 07:56:41 +0000
Message-ID: <f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
 <87zfhzud4s.wl-tiwai@suse.de>
In-Reply-To: <87zfhzud4s.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback


> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, March 5, 2025 3:54 PM
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
> On Wed, 05 Mar 2025 07:32:00 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Update ALC222 depop optimize as attach.
>=20
> Could you give a bit more background info why this change is needed?
> Is it a mandatory change to fix something, or it improves something?
>=20
This codec has two headphone design.
The HP2 was nid 0x14.

>=20
> thanks,
>=20
> Takashi
