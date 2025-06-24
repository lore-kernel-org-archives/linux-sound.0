Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783519AD48
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745877; cv=none; b=JbGjIopLZrAA0qpeUwdHwhUz7CkiDrwGIgmjzNmgf/X463CepB51VgFJkRsAHBv6YzopQF1JBoOCd3tcDu4TUQFrfsfxxG5DHP142gTve+j+E2wnHNaAOzXoJMjBIaMP/SfiT+KIjILwJcIYrXA33hqOtbJ6IR8jP1L8A9/PS/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745877; c=relaxed/simple;
	bh=15ZZ8X73PKv1rwIdJxta3c/mgJYupJdmQs7EKLvvAes=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YWxPRhdVNjErzjTmLuc87GTXiUcKxpVX9609yg5NGri6vwjFRN2k1eVWXqt6ZS/aE5/Hb8bZ+4PyAmSMIS0qEA10CxwpoM49M/3VClAI+n7lS7YzuFycAV+DEDS0rkIjwdPDRua123cUVUeqUr0Z/M102wVneCR1xRBdzCzFyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=FGpYbdxm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="FGpYbdxm"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55O6HSDs83154471, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1750745848; bh=25uQGpu7+UVqiDa0s6df+jxna3qkv4hWlAjtKpCRlrM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FGpYbdxm5ehPWvWbYiT/Qvd4FQOBFlPOxdGbkaO+orKlWVeSbU+hl803ae7AHSlri
	 idsTtoLIq/KToQ7OrW7c9fv6xH1/jtbyOZyZaXBpLbHfcmmf8CDxFZzElFi43i606j
	 yQlJsDI8H6VvufsoVptbznZalwaTZEIsDgN7d4WH0pvX7msK35gBKnH8OCoAnz7sil
	 5RiFHJ+0pYEP7b6tk5UJLqncp0ZBc9nlGNVYZ6MWDveOrN+Zhw8t3XMCbJlyHCw21F
	 mWMAA3SdwZeSzYZ6jANvZGLwtv7BB4EPCSgbsJY2+AZI3aiWilUMg6k+ofb/uNaNLh
	 aRJqvOBgHxvZw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55O6HSDs83154471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 14:17:28 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Jun 2025 14:17:42 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 24 Jun 2025 14:17:41 +0800
Received: from RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466]) by
 RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466%5]) with mapi id
 15.01.2507.035; Tue, 24 Jun 2025 14:17:41 +0800
From: Kailang <kailang@realtek.com>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>, Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "chris.chiu@canonical.com" <chris.chiu@canonical.com>,
        Geans_chen
	<geans_chen@realsil.com.cn>,
        cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index: AQHb4L8xB01VN1cvK0+4lsxOtof+qrQLccSAgAYrnZD//4w9gIAAsHPw
Date: Tue, 24 Jun 2025 06:17:41 +0000
Message-ID: <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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


> > +             if (codec->core.vendor_id =3D=3D 0x10ec0256)
> > +                     spec->en_3kpull_low =3D false;

This usage will affect all ALC256.

Codec: Realtek ALC256
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0256
Subsystem Id: 0x10ec0256   =3D=3D>  Could you assign this to 0x10EC129E ?  =
This codec SSID was provide from our AE. It's verb table.
Revision Id: 0x100002
No Modem Function Group found
Default PCM:

We can check Subsystem Id to let spec->en_3kpull_low =3D false.

> -----Original Message-----
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> Sent: Tuesday, June 24, 2025 11:32 AM
> To: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
> Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>;
> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed=
 on
> alc256
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
> Hello Kailang
>=20
> > -----Original Message-----
> > From: Kailang <kailang@realtek.com>
> > Sent: Tuesday, June 24, 2025 10:31 AM
> > To: Takashi Iwai <tiwai@suse.de>; Joakim Zhang
> > <joakim.zhang@cixtech.com>
> > Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>; cix-
> > kernel-upstream <cix-kernel-upstream@cixtech.com>
> > Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > failed on
> > alc256
> >
> > EXTERNAL EMAIL
> >
> > Hi Joakim,
> >
> > Could you use alsa-info.sh to dump codec info to us?
> > Your platform was ARM Architecture. So, it's no PCI device. Right?
>=20
> Yes, our HDA controller under AXI bus based on ARM arch, so I'm a little
> worried whether some known fixup for pci not applied.
>=20
> Attached log is dumped after the system boot with headset plugin, but the=
 mic
> cannot be detected.
>=20
> numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
>   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
>   : values=3Don
> numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
>   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
>   : values=3Don
> numid=3D13,iface=3DCARD,name=3D'Mic Jack'
>   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
>   : values=3Doff
> numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
>   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
>   : values=3Don
>=20
> thanks,
>=20
> Joakim
>=20
>=20
> This email (including its attachments) is intended only for the person or=
 entity
> to which it is addressed and may contain information that is privileged,
> confidential or otherwise protected from disclosure. Unauthorized use,
> dissemination, distribution or copying of this email or the information h=
erein
> or taking any action in reliance on the contents of this email or the
> information herein, by anyone other than the intended recipient, or an
> employee or agent responsible for delivering the message to the intended
> recipient, is strictly prohibited. If you are not the intended recipient,=
 please do
> not read, copy, use or disclose any part of this e-mail to others. Please=
 notify
> the sender immediately and permanently delete this e-mail and any
> attachments if you received it in error. Internet communications cannot b=
e
> guaranteed to be timely, secure, error-free or virus-free. The sender doe=
s not
> accept liability for any errors or omissions.
