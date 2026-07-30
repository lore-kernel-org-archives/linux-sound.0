Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBA476CC5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453625; cv=none; b=KEH97VrzZooYuPaEj7usp7XIBQD757vkyFbLZIVzgdSu0ecWiHjIxerjE7HFYHC/yPEfEVejHS38BLN+cvHXbkF7jq6S3uWp3gA3CK4YJh4EJ0hrmTwPiWxWVVFRmrp9pKmVHdduqigfpgIkW0wEc3rdJTrZk39MytTtJpT1OQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453625; c=relaxed/simple;
	bh=M7r9iI53WOX0RirZhlmU1q1N/v/Q7QzhDoiQlwifbXU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WUAQtrSzywgopQl1OUtXRK3cFvvUMVxkxH0Sro2YM6msVz/jDu0BID+jl8HO6o/eQ+gRFwnWeQUIHGNH6xnuper5gBGzMbWkzjPsG9PxDdAFNJDdZUef/pX2E5cGUdkvID006I8Yj3F0wl5dEnYsNQpW8Kr/uI5Bb5opZlxvdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=m9VrkBRg; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="m9VrkBRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=tvthxlqjdfatnm5au2chsm2vvy.protonmail; t=1785453617; x=1785712817;
	bh=0IUQw9c8BjMDmJ4nI9qfeCYwNk2NfESJyUz19Pg8vVo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=m9VrkBRgneMunu7C74JfP6f9BbbWSd1ST9EhfRroDT6TJ74NO6rzXxIsEX4eo+trA
	 T89H6yMfzfdQsVq5Sbsp5TRdxu9dx+PJilNxzF1TWifHIP9dI/XXDaI1jJs+ak3/tu
	 V72AFLuc9joXtW/DPo66PKalfPd8lxuPF7jwGhe0JxrT4twG5o5bmpU3tHt5+7wUD9
	 vfcCNVnSKXpdqQMWdOWHmgtefp63TJsclG7kVBG6T8QsAKiAmtHeNIoihBeUAt8iHf
	 EN1A22b0YFQktsgwOpam1laiEVZV+qS45e68Du7Kd3byaC6v0Lo4YZE2/mR4bdfxB2
	 7/K8TRWwBOkDA==
Date: Thu, 30 Jul 2026 23:20:11 +0000
To: Rong Zhang <i@rong.moe>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
From: Brian <faxuser@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] ALSA: usb-audio: Add quirk flag for Edifier MF200
Message-ID: <370007e6-b73b-4bfc-8410-a860781c7ad7@proton.me>
Feedback-ID: 57639451:user:proton
X-Pm-Message-ID: 860b798dac634ae029058e15eaa891891f0c9416
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The UAC mixer of the Logitech PRO X 2 LIGHTSPEED works fine too. It also=20
has broken mixer GET_CUR behavior.

Please add a quirk table entry matching VID/PID=3D0x046d/0x0af7 and apply=
=20
QUIRK_FLAG_MIXER_GET_CUR_BROKEN flag to make the mixer usable again.

Tested on kernel 7.1-rc5 with modprobe.d conf:
options snd_usb_audio quirk_flags=3D"046d:0af7:mixer_get_cur_broken"

Test output:

usb 3-2.1: New USB device found, idVendor=3D046d, idProduct=3D0af7,=20
bcdDevice=3D 1.00
usb 3-2.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-2.1: Product: PRO X 2 LIGHTSPEED
usb 3-2.1: Manufacturer: Logitech
usb 3-2.1: SerialNumber: 0000000000000000
usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 =3D> -2662)
usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 =3D> 0)

Tested the quirk and it makes the mixer work properly again.

Cheers,
Brian van den Berg

On 5/31/26 5:45 PM, Rong Zhang wrote:
> The UAC mixer of Edifier MF200 works fine except that its volume GET_CUR
> method is somehow stubbed and returns a constant value. Since commit
> 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers"), the
> sticky check considers the mixer to be sticky and unnecessarily disables
> the mixer.
>
> Add a quirk table entry matching VID/PID=3D0x2d99/0xa024 and applying
> the MIXER_SKIP_GET_CUR_VOL quirk flag, so that the mixer is usable
> again.
>
> Quirky device sample:
>
>    usb 1-3.2: new full-speed USB device number 7 using xhci_hcd
>    usb 1-3.2: New USB device found, idVendor=3D2d99, idProduct=3Da024, bc=
dDevice=3D 0.00
>    usb 1-3.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=
=3D3
>    usb 1-3.2: Product: EDIFIER MF200
>    usb 1-3.2: Manufacturer: EDIFIER
>    usb 1-3.2: SerialNumber: EDI00000X06
>    input: EDIFIER EDIFIER MF200 Consumer Control as /devices/pci0000:00/0=
000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0=
/0003:2D99:A024.0003/input/input8
>    input: EDIFIER EDIFIER MF200 Mouse as /devices/pci0000:00/0000:00:02.1=
/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:=
A024.0003/input/input9
>    input: EDIFIER EDIFIER MF200 Keyboard as /devices/pci0000:00/0000:00:0=
2.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D=
99:A024.0003/input/input10
>    input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:=
05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0=
003/input/input11
>    input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:=
05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.0=
003/input/input12
>    hid-generic 0003:2D99:A024.0003: input,hiddev1,hidraw2: USB HID v1.10 =
Mouse [EDIFIER EDIFIER MF200] on usb-0000:0e:00.0-3.2/input0
>    usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 =3D> -32702), dis=
abling
>
> Reported-by: Steve Smith <tarkasteve@gmail.com>
> Closes: https://lore.kernel.org/r/CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76=
T7vT0zGPPC1g@mail.gmail.com
> Tested-by: Steve Smith <tarkasteve@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>   sound/usb/quirks.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 3adfda40d7cb..27fd8621e8f5 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2477,6 +2477,8 @@ static const struct usb_audio_quirk_flags_table qui=
rk_flags_table[] =3D {
>   =09=09   QUIRK_FLAG_CTL_MSG_DELAY_1M),
>   =09DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
>   =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +=09DEVICE_FLG(0x2d99, 0xa024, /* Edifier MF200 */
> +=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
>   =09DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
>   =09=09   QUIRK_FLAG_CTL_MSG_DELAY),
>   =09DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */
>

