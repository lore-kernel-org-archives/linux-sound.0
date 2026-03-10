Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205CE399352
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.186.235.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156977; cv=none; b=Dzug0D7FcjmVl5hCnC49cITJTwwfifPUGIpsZmC1B7jYsjxtqiYxzOfUTG3zQScT4Yluc3GvmFOZfxnLs9hnCw/ZW3Fq2epy3EoCOGLPtZA92nbmyi855EypOB96EJhaj59cVbtzBbq6XrERSAUpUBvc4YNOmjBxFKczhMTA4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156977; c=relaxed/simple;
	bh=jJ/zbNfg7xdJZ+GvM9/RTegwXSzWbhUAhpiNQshrTO4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OWcE6V3uMuDQL1plvTnNUcWILwI9AGqRGCI27JD7g0cJBdEwXmLTwAFTNv0POkWJqkg2uvxv+vT5vbiEmuhLwlgT2ooYyIBYOPLq/T/203UzwvXi8g1E3/HkeOILOVviAo42cgzaaPp6bzEUHN12oagJUANFHCKFT+Q0l6j96Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net; spf=pass smtp.mailfrom=sonarnerd.net; dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b=fl0R345j; arc=none smtp.client-ip=213.186.235.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b="fl0R345j"
Received: from smtpclient.apple (87-196-82-49.net.novis.pt [87.196.82.49])
	by mail.sonarnerd.net (Postfix) with ESMTPSA id 94C1D231133;
	Tue, 10 Mar 2026 17:36:12 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.sonarnerd.net 94C1D231133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonarnerd.net;
	s=dkim; t=1773156973;
	bh=2XxK8nr+BzJ5SV4wkJRfow/PF97VXnQtzCMWLxf9P6M=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=fl0R345jJDuBecvnpjZxqkrpAXostchBuWFtVFcm/2FOVe2YCIGH6jaPZY5wfQG1J
	 lt+oLEPGQ25uP/pA3z0pvvvy59J8y0Hs7cjf+HHOJqSobEczGjrG5s6xrLujqoTu4V
	 eUFzRjxO6bTfOoCjhkoeLYdGPSeKeyZIc/ZkM8QD9aU3cHuBoXcZcP1FJa0tABO9sw
	 Y8ZOrqN4colmuSor1p6vkWj0AhjkkQ/q8AWCug99Lp0LY8B0lEf5AGnRE8BZFLAgtX
	 vo1AgS8HUCy5ZueO310jr0tpoHOsVMuKPi6dNaDdVltzkgT6UbBGYN3xCXlQfsnbKT
	 SDabbIb8wSEMA==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
From: Jussi Laako <jussi@sonarnerd.net>
In-Reply-To: <PUZPR06MB6224D136C28892091FD97EEAD246A@PUZPR06MB6224.apcprd06.prod.outlook.com>
Date: Tue, 10 Mar 2026 15:35:59 +0000
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A25EA184-130F-4A21-98C2-5B96244812FD@sonarnerd.net>
References: <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <9A67CE55-CD09-4574-85B4-2C4F770497BB@sonarnerd.net>
 <PUZPR06MB6224D136C28892091FD97EEAD246A@PUZPR06MB6224.apcprd06.prod.outlook.com>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
X-Mailer: Apple Mail (2.3864.400.21)

Hi,

Yes, that is better. It should be clear from the description comment =
which device it is really about.


Best regards,

	- Jussi


> On 10. Mar 2026, at 14.12, =E8=83=A1=E8=BF=9E=E5=8B=A4 =
<hulianqin@vivo.com> wrote:
>=20
> Hi Jussi:
>=20
>> I would suggest to include information about the actual hardware =
device in the comment. =E2=80=9CUSB Audio=E2=80=9D doesn=E2=80=99t =
really tell anything
>> here=E2=80=A6
>>=20
> OK, Modified as follows, Is it feasible?
>=20
> + DEVICE_FLG(0x0666, 0x0880, /* SPACETOUCH  USB Audio */
> +   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
>=20
> The specific hardware name is not visible in the enumeration =
information of this device.
>=20
>>=20
>>>=20
>>> Setting up the interface when suspended/resumeing fail on this card.
>>> Adding a reset and delay quirk will eliminate this problem.
>>>=20
>>> usb 1-1: New USB device found, idVendor=3D0666, idProduct=3D0880
>>> usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D3
>>> usb 1-1: Product: USB Audio
>>> usb 1-1: Manufacturer: SPACETOUCH
>>> usb 1-1: SerialNumber: 000000000
>>>=20
>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>>> ---
>>> sound/usb/quirks.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>=20
>>> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
>>> index c6a78efbcaa3..3352e3538a19 100644
>>> --- a/sound/usb/quirks.c
>>> +++ b/sound/usb/quirks.c
>>> @@ -2241,6 +2241,8 @@ static const struct =
usb_audio_quirk_flags_table quirk_flags_table[] =3D {
>>>  QUIRK_FLAG_IFACE_DELAY | QUIRK_FLAG_FORCE_IFACE_RESET),
>>> DEVICE_FLG(0x0661, 0x0883, /* iBasso DC04 Ultra */
>>>  QUIRK_FLAG_DSD_RAW),
>>> + DEVICE_FLG(0x0666, 0x0880, /* USB Audio */
>>> +   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
>>> DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) =
*/
>>>  QUIRK_FLAG_IGNORE_CTL_ERROR),
>>> DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh =
Edition) */
>>> --
>>> 2.39.0
>>>=20
>=20
> Thanks
>=20

