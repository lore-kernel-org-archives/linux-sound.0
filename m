Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790646EF70
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453007; cv=none; b=VPzQDn66tdEjpkvH163sZP6FgwMAZaFi3XmNYPfXirjESeq3FPzgvnIya8hTPLwnr4AR68TrGSETOBldENOvs4GMqUo7mAeoxwecux6wvH7k4jv/vvvBQcYidm3cFIrLm9AiH2ARlbfx894MJEDwLFAsDxFsdsGAoyYlDef86fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453007; c=relaxed/simple;
	bh=J7vNSeRf/vmMk+LQNQMtrkV0gleDpeoRDvbDPVq06+E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KlL+s05NNkE4msNWlsHfUXIfiO2Zf4KNpiuoEIPJlkHDLT408yKqnAc02Fkw9FBwSiBZmIIYQ5gJXFpHF1WTn010xRm5xtSDC6oC65+0rsv+ssSpsejjIW68SHk/Ww/JcV0TTvg9Qc4kgRDJ0OB07bTVw6aO1F4GSMLyJ8136/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=BT4+PB8f; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="BT4+PB8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=en4dipe4dbgaxpll6zmh2lkt2q.protonmail; t=1785452999; x=1785712199;
	bh=x9VqCGkQrmYMVN0SHNpYoEJmWGWlfyJJSDI3Y0qsAyU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BT4+PB8fhvRA4CruF5jsaNZ/LcfbxuluUKBpL8Ui1m6N9ZQecH3C31PY6nkwWIM5c
	 WH8borQU/Lh6WbLeN55zIDXx71CuEPLWQEpRcmlgsNEvNDR2yrPr0bEodoOosKDxMa
	 GJczhpHATpK+WBzsRJX77l8D4Fq/aKWHwpfWIIRhPZlRPXTmsjgF/LGc9kxMth7J/x
	 0Z6Qz5/YypFm5A62WuknxMmXfyni4LlYBtUPR1pJ5fBkfyWrhGmkLbaheGv+neCbvZ
	 rRH4P88MgNHLmmmL6kt2E6SZDiudcAy2F4qHUHeX16D+csi0lkG3WOSIlEi75/StWG
	 c0KrqaOPuxlcA==
Date: Thu, 30 Jul 2026 23:09:54 +0000
To: Rong Zhang <i@rong.moe>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
From: Brian <faxuser@proton.me>
Cc: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>, linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] ALSA: usb-audio: Add quirk flag for Edifier MF200
Message-ID: <0ab37215-dd23-4b40-a172-f0e57992f34e@proton.me>
Feedback-ID: 57639451:user:proton
X-Pm-Message-ID: 8da1d06a5bc10504e2a49c42b2ea2f4c97a1760c
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The UAC mixer of the Logitech PRO X 2 LIGHTSPEED works fine=C2=A0fine too. =
It=20
also has

Please add a quirk table entry matching VID/PID=3D0x046d/0x0af7 and apply=
=20
QUIRK_FLAG_MIXER_GET_CUR_BROKEN flag to make the mixer usable again.

Tested on kernel 7.1-rc5 with modprobe.d conf: "options snd_usb_audio quirk=
_flags=3D"046d:0af7:mixer_get_cur_broken"


Test output

 =C2=A0 usb 3-2.1: New USB device found, idVendor=3D046d, idProduct=3D0af7,=
=20
bcdDevice=3D 1.00
 =C2=A0 usb 3-2.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D3
 =C2=A0 usb 3-2.1: Product: PRO X 2 LIGHTSPEED
 =C2=A0 usb 3-2.1: Manufacturer: Logitech
 =C2=A0 usb 3-2.1: SerialNumber: 0000000000000000
 =C2=A0 input: Logitech PRO X 2 LIGHTSPEED Consumer Control as=20
/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003=
:046D:0AF7.0003/input/input6
 =C2=A0 input: Logitech PRO X 2 LIGHTSPEED as=20
/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003=
:046D:0AF7.0003/input/input7
 =C2=A0 input: Logitech PRO X 2 LIGHTSPEED as=20
/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003=
:046D:0AF7.0003/input/input8
 =C2=A0 usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 =3D> -2662)
 =C2=A0 usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 =3D> 0)

Tested the quirk and makes the mixer work properly again.

Cheers,

Brian van den Berg

On 5/31/26 5:45 PM, Rong Zhang wrote:

The UAC mixer of Edifier MF200 works fine except that its volume GET_CUR
method is somehow stubbed and returns a constant value. Since commit
86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers"), the
sticky check considers the mixer to be sticky and unnecessarily disables
the mixer.

Add a quirk table entry matching VID/PID=3D0x2d99/0xa024 and applying
the MIXER_SKIP_GET_CUR_VOL quirk flag, so that the mixer is usable
again.

Quirky device sample:

   usb 1-3.2: new full-speed USB device number 7 using xhci_hcd
   usb 1-3.2: New USB device found, idVendor=3D2d99, idProduct=3Da024, bcdD=
evice=3D 0.00
   usb 1-3.2: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D=
3
   usb 1-3.2: Product: EDIFIER MF200
   usb 1-3.2: Manufacturer: EDIFIER
   usb 1-3.2: SerialNumber: EDI00000X06
   input: EDIFIER EDIFIER MF200 Consumer Control as /devices/pci0000:00/000=
0:00:02.1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0=
003:2D99:A024.0003/input/input8
   input: EDIFIER EDIFIER MF200 Mouse as /devices/pci0000:00/0000:00:02.1/0=
000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A0=
24.0003/input/input9
   input: EDIFIER EDIFIER MF200 Keyboard as /devices/pci0000:00/0000:00:02.=
1/0000:05:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99=
:A024.0003/input/input10
   input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:05=
:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.000=
3/input/input11
   input: EDIFIER EDIFIER MF200 as /devices/pci0000:00/0000:00:02.1/0000:05=
:00.0/0000:06:0c.0/0000:0e:00.0/usb1/1-3/1-3.2/1-3.2:1.0/0003:2D99:A024.000=
3/input/input12
   hid-generic 0003:2D99:A024.0003: input,hiddev1,hidraw2: USB HID v1.10 Mo=
use [EDIFIER EDIFIER MF200] on usb-0000:0e:00.0-3.2/input0
   usb 1-3.2: 9:1: sticky mixer values (-32768/-32513/1 =3D> -32702), disab=
ling

Reported-by: Steve Smith <tarkasteve@gmail.com>
Closes: https://lore.kernel.org/r/CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7=
vT0zGPPC1g@mail.gmail.com
Tested-by: Steve Smith <tarkasteve@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
  sound/usb/quirks.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3adfda40d7cb..27fd8621e8f5 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2477,6 +2477,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
  =09=09   QUIRK_FLAG_CTL_MSG_DELAY_1M),
  =09DEVICE_FLG(0x2d99, 0x0026, /* HECATE G2 GAMING HEADSET */
  =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+=09DEVICE_FLG(0x2d99, 0xa024, /* Edifier MF200 */
+=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
  =09DEVICE_FLG(0x2fc6, 0xf06b, /* MOONDROP Moonriver2 Ti */
  =09=09   QUIRK_FLAG_CTL_MSG_DELAY),
  =09DEVICE_FLG(0x2fc6, 0xf0b7, /* iBasso DC07 Pro */


