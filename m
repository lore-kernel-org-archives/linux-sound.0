Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667143254BD
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467115; cv=none; b=hmj8tZBa9f5fr17jYpQIinikQ66LB1yXMJEXnQnwJD/uMI1yg4+7vEvDSBsYXYZLSz1MU6YFDA6ClB5jUzgmOHTTpwpm4zaDkq9JaeAZ4iHXlAPnQocmmqgR+toTceaKYpt06gaQd9RPaBZ/b7/wLd4lHo1oLk8Fu+IRFdICQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467115; c=relaxed/simple;
	bh=QDIVMbJDPrczWed3fDYojJstEX2BLZkSSwrSyzgwhhs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Opfn+6hdxPpkm6pBHeWt1FZbbkLkW7DfZgllka9BfntJlwYy0AI6p+ah2jF2ifHRcZ0tNWZ9nWLxafYYEbMeQhqgHgC8uVvKJHXn4CZGtlmM98K2Zkk8mMDE5UWneNjymg0LrwnUS+SmigyvXESv/FciE6ddzEnqW4Bkysxn7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=M8vS93Z7; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="M8vS93Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785467104; x=1785726304;
	bh=pX0qMZmiz/VS00YS+zsFDAwswv893ltPETfnnqrDHbQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=M8vS93Z7m1x32qe8tBsYfw3JHO/u53TSDwM47Q4mPWotChFK8dE2q5l90Ag8Vn/Ea
	 k9+JbNnXfm1THDNDtfNGtLuHacE02IPPHPRwLb5RmrS/TX6gFz8idrox4s5fp05IlK
	 s1l/zmktpGUzK/B0CY9F/2sxEzMe/MF/BzhZCXNrtWoQO2sxaVM6uKb9eKEBLBTvdj
	 +rAD4tig8usi7SGhCw9FX5rtJjsRJULjNorCr4lEhkzmKz4/F1Q9vR1psQ8ySlCfnZ
	 5vuHxraihYvEL6mrUlJBj51/Pft1mr08+DfJIoU05vJfBeFQog20S+oX1CqHUKA/Wr
	 sE7n/rotn3C+w==
Date: Fri, 31 Jul 2026 03:04:58 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Brian van den Berg <faxuser@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>, Brian van den Berg <faxuser@proton.me>
Subject: [PATCH v3] ALSA: usb-audio: Add quirk for Logitech PRO X 2 LIGHTSPEED
Message-ID: <20260731030447.36012-1-faxuser@proton.me>
Feedback-ID: 57639451:user:proton
X-Pm-Message-ID: 8fe686912a290c3406e7dd14bc0059e76da61046
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The UAC mixer of Logitech PRO X 2 LIGHTSPEED works fine except that its
volume GET_CUR method returns sticky values.

Since commit 86aa1ea1f15c
("ALSA: usb-audio: Do not expose sticky mixers"), the sticky check
considers the mixer to be sticky and unnecessarily disables the mixer.

Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Logitech PRO X 2 LIGHTSPEED
(046d:0af7) to address this.

Compiled and tested on 7.2-rc5

Signed-off-by: Brian van den Berg <faxuser@proton.me>
---
Output with quirk enabled:

  usb 3-2.1: New USB device found, idVendor=3D046d, idProduct=3D0af7, bcdDe=
vice=3D 1.00
  usb 3-2.1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
  usb 3-2.1: Product: PRO X 2 LIGHTSPEED
  usb 3-2.1: Manufacturer: Logitech
  usb 3-2.1: SerialNumber: 0000000000000000
  input: Logitech PRO X 2 LIGHTSPEED Consumer Control as /devices/pci0000:0=
0/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/in=
put/input6
  input: Logitech PRO X 2 LIGHTSPEED as /devices/pci0000:00/0000:00:08.1/00=
00:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/input/input7
  input: Logitech PRO X 2 LIGHTSPEED as /devices/pci0000:00/0000:00:08.1/00=
00:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/input/input8
  usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 =3D> -2662)
  usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 =3D> 0)

Changes in v2:
- Commmit message missed the version I compiled and tested it on.
- I forgot to add v2 to the patch.
---
 .clippy.toml       | 21 ---------------------
 sound/usb/quirks.c |  2 ++
 2 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 .clippy.toml

diff --git a/.clippy.toml b/.clippy.toml
deleted file mode 100644
index b0a78cc8be20..000000000000
--- a/.clippy.toml
+++ /dev/null
@@ -1,21 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-msrv =3D "1.85.0"
-
-check-private-items =3D true
-
-disallowed-macros =3D [
-    # The `clippy::dbg_macro` lint only works with `std::dbg!`, thus we si=
mulate
-    # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
-    { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intended as =
a debugging tool", allow-invalid =3D true },
-]
-
-[[disallowed-methods]]
-path =3D "core::ffi::CStr::as_ptr"
-replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
-reason =3D "kernel's `char` is always unsigned, use `as_char_ptr` instead"
-
-[[disallowed-methods]]
-path =3D "core::ffi::CStr::from_ptr"
-replacement =3D "kernel::prelude::CStrExt::from_char_ptr"
-reason =3D "kernel's `char` is always unsigned, use `from_char_ptr` instea=
d"
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0de7c9d94259..3bd66094863d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2251,6 +2251,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
 =09DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 =09=09   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+=09DEVICE_FLG(0x046d, 0x0af7, /* Logitech PRO X 2 LIGHTSPEED */
+=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 =09DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 =09=09   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 =09DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
--=20
2.55.0


