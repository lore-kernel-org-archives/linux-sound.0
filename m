Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09A1AA1C7
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608358; cv=none; b=bqe4HRc8sSHEsdynSc+Bx+SHUVNJmpwTYuiHsmJWT2snNk6b6KgQjZsEw440RW44fsv89uSmrsyRy8qJDJrYBN9B17u3shi0PrY6jbeouAnByZiy5YdU7TNMg7PFugfKWWlfbaYWS9BP+J1lHcukAh6V2/xyM7W3PJl8vk6K1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608358; c=relaxed/simple;
	bh=6jf8nTYlhFbfM8tgJ1WU/jAB0zb7dAR+RwPeGIBacbo=;
	h=From:To:CC:Subject:Date:Message-ID:References:Content-Type:
	 MIME-Version; b=YizQDboFKuMz3uFXBBogabb8uGvmNxogC6xOebLDz3xWJzbPQVtj3kfGzUrbvrF579S0yjUKfFrz1uanzUOeEZO6+4Y0fS+vq23h+s5hCgwPk18Rf0elE/kvYF3EzWt0UlFOu82ERtrp6KOAejg0sfYmJKTNdJH93sdoi4NKMuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=pP5ONFyo; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="pP5ONFyo"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AQ85cxD6737558, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1732608338; bh=6jf8nTYlhFbfM8tgJ1WU/jAB0zb7dAR+RwPeGIBacbo=;
	h=From:To:CC:Subject:Date:Message-ID:References:Content-Type:
	 MIME-Version;
	b=pP5ONFyoGvfhgMWro5kqKCBX4xZaNWeaKY4sMU/xAHxm1iSrMJZGR6klA41avhMGz
	 g9y7bHMAvTwWfCJMCdUWUBnC3oDA57y4mXyKwT7a4AzhKEraPp1GzjWRQwPKKaU7an
	 awqTDL5OByy43M2MC8GA/XCa/rZAR4GMdB7irGw95b8RQrRUIC+TQu9Kxtlz4QG+sm
	 js/xJuaxE3avokNGhA6X/9DiRFE3kvBLSzbJjpge4GWRzlgACHbBoTR/M/tRcnc1Pa
	 TXfsEP5eNTEiJVUKwAHAnMA3b1S9Gp9mZMNOUQD/mye/DmcQLUS+Jxbpu/ometUKq/
	 cfLkITwMDk9Ag==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AQ85cxD6737558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 16:05:38 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 16:05:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Nov 2024 16:05:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Tue, 26 Nov 2024 16:05:38 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: Set pcbeep to default value
Thread-Topic: Set pcbeep to default value
Thread-Index: Ads8sBHNzM+TirlYQ/mnHXgYWQoEn///nRkA//tCZACACctvgP/+tDQA//0LycA=
Date: Tue, 26 Nov 2024 08:05:37 +0000
Message-ID: <2721bb57e20a44c3826c473e933f9105@realtek.com>
References: <a76a10fc88e740f2b157375d44f167c7@realtek.com>
	<87r0731uk1.wl-tiwai@suse.de>	<cb9caa0e01f34e3b881bad24701c741f@realtek.com>
 <87v7wbxti2.wl-tiwai@suse.de> 
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_2721bb57e20a44c3826c473e933f9105realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

--_002_2721bb57e20a44c3826c473e933f9105realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry! Attach again.

Add ALSA: hda/realtek: to Title.

> -----Original Message-----
> From: Kailang
> Sent: Tuesday, November 26, 2024 10:36 AM
> To: 'Takashi Iwai' <tiwai@suse.de>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> 'linux-sound@vger.kernel.org' <linux-sound@vger.kernel.org>
> Subject: RE: Set pcbeep to default value
>=20
> OK.
>=20
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Monday, November 25, 2024 10:45 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: Takashi Iwai <tiwai@suse.de>
> > Subject: Re: Set pcbeep to default value
> >
> >
> > External mail.
> >
> >
> >
> > On Mon, 25 Nov 2024 03:00:26 +0100,
> > Kailang wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Friday, November 22, 2024 5:34 PM
> > > > To: Kailang <kailang@realtek.com>
> > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > > Subject: Re: Set pcbeep to default value
> > > >
> > > >
> > > > External mail.
> > > >
> > > >
> > > >
> > > > On Fri, 22 Nov 2024 08:29:56 +0100, Kailang wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > Attach patch will set pcbeep to default value for ALC274.
> > > >
> > > > Could you resubmit with your Signed-off-by tag?
> > >
> > > Sorry! Attach again.
> >
> > You seem to have dropped Cc to alsa-devel ML.
> > Also, nowadays we use linux-sound@vger.kernel.org for the main ML for
> > kernel patches.  Care to resubmit to there?
> >
> >
> > thanks,
> >
> > Takashi

--_002_2721bb57e20a44c3826c473e933f9105realtekcom_
Content-Type: application/octet-stream;
	name="0000-dell-alc274-beep-default.patch"
Content-Description: 0000-dell-alc274-beep-default.patch
Content-Disposition: attachment;
	filename="0000-dell-alc274-beep-default.patch"; size=831;
	creation-date="Thu, 21 Nov 2024 08:17:27 GMT";
	modification-date="Tue, 26 Nov 2024 08:03:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OTA5ODc4MzZmNWY4ZTU2NWU3ZmVkMzcyNTYxODVmNTUwNGQ2ZGE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjEgTm92IDIwMjQgMTY6MTY6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogU2V0IFBDQmVlcCB0byBkZWZhdWx0IHZhbHVlIGZvciBBTEMyNzQKCkJJ
T1MgRW5hYmxlIFBDIGJlZXAgcGF0aCBjYXVzZSBwb3Agbm9pc2UgdmlhIHNwZWFrZXIgZHVyaW5n
IGJvb3QgdGltZS4KU2V0IHRvIGRlZmF1bHQgdmFsdWUgZnJvbSBkcml2ZXIgd2lsbCBzb2x2ZSB0
aGUgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5j
b20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDU2YTM2MjJjYTJjMS4uNjcwMzZmZTZjNmNjIDEw
MDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNDczLDYgKzQ3Myw4IEBAIHN0YXRpYyB2b2lkIGFsY19m
aWxsX2VhcGRfY29lZihzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJYnJlYWs7CiAJY2FzZSAw
eDEwZWMwMjM0OgogCWNhc2UgMHgxMGVjMDI3NDoKKwkJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVj
LCAweDZlLCAweDBjMjUpOworCQlmYWxsdGhyb3VnaDsKIAljYXNlIDB4MTBlYzAyOTQ6CiAJY2Fz
ZSAweDEwZWMwNzAwOgogCWNhc2UgMHgxMGVjMDcwMToK

--_002_2721bb57e20a44c3826c473e933f9105realtekcom_--
