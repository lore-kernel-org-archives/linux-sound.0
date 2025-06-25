Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802C1D63EF
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750820768; cv=none; b=tv3GOATc+wDk5GeZ2bqaWybdwEniDhfJZrhGom1E2DpiFA3rqZWWkdRnExiHg6b0V479Bo9s+gTC6YOYcaKrgpduC3nStXxX6ShqBhrit7Za8RpE5WaKO6Sjz4t9CgmP19z5mMgARyqwYUr+45GFRCkXLVyAWZesmBYUMYWjA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750820768; c=relaxed/simple;
	bh=YSljDAFJhHgL0yus4IZ/owBXUZkTjv5p21Wt4MkNPac=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iNwJYkbSB4ImKNA8XF59Nn4L2Z9JZrvYIzRrHHmCP5noGgp1vBJ9TGdMdM8Q5FJjW0AkcrJL+2RXE9V5pEfA9VVuiKYeesndu7snblfMJPzvjSQmjP87nP6UndKYy4ed+BNW35stClDUDCOFv5bJjwStvU6n1xS+kdaBtVImHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=raoRLB+x; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="raoRLB+x"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55P35OhrC644709, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1750820725; bh=gJfPdiwOaeUFbnZe7iKutivahqDj6YMeb2pgyBM8ADg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version;
	b=raoRLB+xZiy4DIH81x9ZbSqJ2Sx2KGxIVv16Ghm91j0o4hxHMtQM8XnSYW/d6aMnn
	 8y0WqtJaZM/k2R5jM410XY+dXo5hhC64alf8izl71xO3ADRhQT6q5+LuUrXV42pXnV
	 Bjp2dRdJYJv/3HZ71oeQGU3M4ikrpmHdIDygjR0NmvR9NlKEH2qjBhI+U/S8sp/qvX
	 /URiuCW4WaIVoy9VeJJ89UjabgMeT+89BGvZIVBQipAsdgBqI54C0x8onBqsh0yR0A
	 iCUCce2t5DmczpoCJYgHhTj4VIWDWtIn6vz1whPg/K8d2OtgfRIybBdlhUexMQyy6F
	 zf1gL8wQTbZXQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55P35OhrC644709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 11:05:25 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Jun 2025 11:05:38 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 25 Jun 2025 11:05:36 +0800
Received: from RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466]) by
 RTEXDAG01.realtek.com.tw ([fe80::504c:148e:f72c:7466%5]) with mapi id
 15.01.2507.035; Wed, 25 Jun 2025 11:05:36 +0800
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
Thread-Index: AQHb4L8xB01VN1cvK0+4lsxOtof+qrQLccSAgAYrnZD//4w9gIAAsHPwgADASoCAAJ2KgA==
Date: Wed, 25 Jun 2025 03:05:32 +0000
Message-ID: <5f2431ca8ef2453daa9da2034798e682@realtek.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
 <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_5f2431ca8ef2453daa9da2034798e682realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_5f2431ca8ef2453daa9da2034798e682realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Maybe your platform need to set spec->en_3kpull_low to false.
If spec->en_3kpull_low =3D false will help you to get MIC JD.


> -----Original Message-----
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> Sent: Wednesday, June 25, 2025 9:32 AM
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
> > Sent: Tuesday, June 24, 2025 2:18 PM
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
> > > > +             if (codec->core.vendor_id =3D=3D 0x10ec0256)
> > > > +                     spec->en_3kpull_low =3D false;
> >
> > This usage will affect all ALC256.
> >
> > Codec: Realtek ALC256
> > Address: 0
> > AFG Function Id: 0x1 (unsol 1)
> > Vendor Id: 0x10ec0256
> > Subsystem Id: 0x10ec0256   =3D=3D>  Could you assign this to 0x10EC129E=
 ?
> This
> > codec SSID was provide from our AE. It's verb table.
> > Revision Id: 0x100002
> > No Modem Function Group found
> > Default PCM:
> >
> > We can check Subsystem Id to let spec->en_3kpull_low =3D false.
>=20
> Did you find anything from the log? Is it a potential issue?
No, there were many platform need this setting.

>=20
> You mean re-generate the verb table with SSID equal 0x10EC129E? But from
> the patch_realtek.c have not found any hook to fixup this SSID.
This SSID need add menually. Like attach patch.

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

--_002_5f2431ca8ef2453daa9da2034798e682realtekcom_
Content-Type: application/octet-stream; name="0000-dis-3kpull-low.patch"
Content-Description: 0000-dis-3kpull-low.patch
Content-Disposition: attachment; filename="0000-dis-3kpull-low.patch";
	size=1838; creation-date="Wed, 25 Jun 2025 02:59:37 GMT";
	modification-date="Wed, 25 Jun 2025 02:54:40 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggOTEwOGM3MTJkYjAzLi4wNjY3MDM4MzgzODAgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC03NzM0LDYgKzc3MzQsMTUgQEAgc3RhdGljIHZvaWQgYWxjMjgz
X2ZpeHVwX2RlbGxfaHBfcmVzdW1lKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQlhbGNfd3Jp
dGVfY29lZl9pZHgoY29kZWMsIDB4ZCwgMHgyODAwKTsKIH0KIAorc3RhdGljIHZvaWQgYWxjX2Zp
eHVwXzNrcHVsbF9sb3coc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJICBjb25zdCBzdHJ1
Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCit7CisJc3RydWN0IGFsY19zcGVjICpzcGVj
ID0gY29kZWMtPnNwZWM7CisKKwlpZiAoYWN0aW9uID09IEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JF
KQorCQlzcGVjLT5lbl8za3B1bGxfbG93ID0gZmFsc2U7Cit9CisKIGVudW0gewogCUFMQzI2OV9G
SVhVUF9HUElPMiwKIAlBTEMyNjlfRklYVVBfU09OWV9WQUlPLApAQCAtODA0OSw2ICs4MDU4LDcg
QEAgZW51bSB7CiAJQUxDMjg1X0ZJWFVQX0FTVVNfR0E2MDVLX0hFQURTRVRfTUlDLAogCUFMQzI4
NV9GSVhVUF9BU1VTX0dBNjA1S19JMkNfU1BFQUtFUjJfVE9fREFDMSwKIAlBTEMyNjlfRklYVVBf
UE9TSVRJVk9fUDE1WF9IRUFEU0VUX01JQywKKwlBTEMyNTZfRklYVVBfRElTXzNLUFVMTF9MT1cs
CiB9OwogCiAvKiBBIHNwZWNpYWwgZml4dXAgZm9yIExlbm92byBDOTQwIGFuZCBZb2dhIER1ZXQg
NzsKQEAgLTEwNDYzLDYgKzEwNDczLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVw
IGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNoYWluZWQgPSB0cnVlLAogCQkuY2hhaW5faWQgPSBB
TEMyNjlWQ19GSVhVUF9BQ0VSX01JQ19OT19QUkVTRU5DRSwKIAl9LAorCVtBTEMyNTZfRklYVVBf
RElTXzNLUFVMTF9MT1ddID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5j
ID0gYWxjX2ZpeHVwXzNrcHVsbF9sb3csCisJfSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAgLTExMTI4LDYgKzExMTQyLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNO
RF9QQ0lfUVVJUksoMHgxMGVjLCAweDEyNGMsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEMy
OTVfRklYVVBfQ0hST01FX0JPT0spLAogCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDEyNTIsICJJ
bnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEMyOTVfRklYVVBfQ0hST01FX0JPT0spLAogCVNORF9Q
Q0lfUVVJUksoMHgxMGVjLCAweDEyNTQsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEMyOTVf
RklYVVBfQ0hST01FX0JPT0spLAorCVNORF9QQ0lfUVVJUksoMHgxMGVjLCAweDEyOWUsICJDSVgg
UGhlY2RhIEJvYXJkIiwgQUxDMjU2X0ZJWFVQX0RJU18zS1BVTExfTE9XKSwKIAlTTkRfUENJX1FV
SVJLKDB4MTBlYywgMHgxMmNjLCAiSW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQ
X0NIUk9NRV9CT09LKSwKIAlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMmY2LCAiSW50ZWwgUmVm
ZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTBmNywgMHg4MzM4LCAiUGFuYXNvbmljIENGLVNaNiIsIEFMQzI2OV9GSVhVUF9BU1BJUkVf
SEVBRFNFVF9NSUMpLAo=

--_002_5f2431ca8ef2453daa9da2034798e682realtekcom_--
