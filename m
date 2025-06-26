Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD21991DD
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917145; cv=none; b=C0axU3nx/OPaHbg5RVPHOOK4injRstVw4T1CWi5MB6ZUEJ+gQLEWYKBVztYOVoD5lnVT8y8oyZcZR+FB1XRo7JuJtw1tDeSLYpRu2gB7ijesXjc5NvdFPjLFzhLHSPQFbAvfPzzIVwwEw6XXko/52JClOfgikityivaUGO4vjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917145; c=relaxed/simple;
	bh=wWjrQNkOoaM6bU5uGdIuJWx460JFDQZlZxvb4eBumpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FGnM/2gYMSQv0fdcXvYlsqJ6yUF7QMklz+AoldbwlKUxo89Dwd7d4wp5Z4lS7ib+bf0dZhD6TlMbju7XmY4tS0wBLQXfgpROlbdT5vYy0fqm+wwFGFbzZ5Ch04f84HoY/aDf17AjEOSHmVaT5qvbodljZDvPWmtGgqpFGzzXmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=sXOGPUXO; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="sXOGPUXO"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55Q5piPkB2606228, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1750917104; bh=wWjrQNkOoaM6bU5uGdIuJWx460JFDQZlZxvb4eBumpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=sXOGPUXOsxXuOnQY7cxKjYvcJHed2HdpVWoSCm+6CSUzg/nA/K/mIoTl0/Oic7eg5
	 Ntjvl7zeoi0HNlaWOQvC3fx/W7jTnRgy+GZA/YxzAxbYyfUy2JrCRh5nPgRpIZK43z
	 RetB3D6eUdab/YHr1r5XQtyoqwgNV//XQvAGINC4lOQx9B2DUyPGTm5otuKi/qEnjj
	 VoqsQQYe7sOEfe+UpPZql4V2+jpNZEKHFJUv7Hizv9gbYCu49beQswMdA8hiutvYC8
	 ZoBMvRO0e2nV6vXTvLKzllZNb4ogiLEwm3Md1eB/EvjHIL/2iCOGej6Nw8Lpm2FvqK
	 +Fg4jEs9M1rpQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55Q5piPkB2606228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 13:51:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Jun 2025 13:52:00 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 26 Jun 2025 13:51:59 +0800
Received: from RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466]) by
 RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466%5]) with mapi id
 15.01.2507.035; Thu, 26 Jun 2025 13:51:58 +0800
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
Thread-Index: AQHb4L8xB01VN1cvK0+4lsxOtof+qrQLccSAgAYrnZD//4w9gIAAsHPwgADASoCAAJ2KgIABGdEAgAClalA=
Date: Thu, 26 Jun 2025 05:51:58 +0000
Message-ID: <a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
 <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <5f2431ca8ef2453daa9da2034798e682@realtek.com>
 <SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
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
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> Sent: Thursday, June 26, 2025 11:45 AM
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
> Hello Kailang,
>=20
> > -----Original Message-----
> > From: Kailang <kailang@realtek.com>
> > Sent: Wednesday, June 25, 2025 11:06 AM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>; Takashi Iwai
> > <tiwai@suse.de>
> > Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>; cix-
> > kernel-upstream <cix-kernel-upstream@cixtech.com>
> > Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > failed on
> > alc256
> >
> >
> > Maybe your platform need to set spec->en_3kpull_low to false.
> > If spec->en_3kpull_low =3D false will help you to get MIC JD.
>=20
> Yes, but don't know what exact hardware design makes this difference, do =
you
> know it?

I don't know. But FT(Phytium) platform was disable runtime suspend, it does=
n't have this issue.
FT has not upstream his patch until now.

>=20
> Indeed, it's better to add a board fixup, please ignore this patch, will =
upstream
> later after hda controller upstreamed.
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
