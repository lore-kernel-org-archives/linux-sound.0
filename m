Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8725B0A3
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465224; cv=none; b=rflxRpjDt7dDy4+jlRV5bxfJCImn/aJCZjfqDxL5ajQG2Q6C0gSPP3UJFU4CrzLnk7vtCb4fmzPeG/kP7s4Dh25x5C44wDpNYm1MJrZzM130kVdmOuVKPPyWPEUto7fZ3pGJqhCSCp7pQWEU4fxH2jaqabACjR5zpNvotEO0zjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465224; c=relaxed/simple;
	bh=7Z2GEnnawKZYxIFs3zFhkh42b0aAZapO9ecZWQohvvc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SJz7pLOjxqhC4NpQaTvf0JsIiqQFsexbIPDnuoPm6iIeQ8gSXoEj5vVqVLDksNkcFUu3DzbFdNGRheRc/Xr2rpCcYEcH5Tduy8pZz0N90UVeW8VADfaV8r2BLtgbHSSjr1JVPM7XGwbd4OA9v+PZu79270X67QH0DgMX53dhrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=icKz5P1h; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="icKz5P1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785465217; x=1785724417;
	bh=L7/jYe59NXPzACSBEsE53x2q2qa8qaj2G11iRT3CbYA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=icKz5P1h7nW9H+inDxaV0soP7UyZAQNL5OnxJUI72YGTaMAAMWI72+hqtPMphIkhj
	 1DH8m2C2FP8btzkFOP90or13EL2BL9VEO3SyJkldBK3lP1/zf7pj12wv5VqsNxdva0
	 aiEnuFhApHJYiYo2H/2MlbsF/5TWw97egwoPkU0fqzWDe/FW1LuitHJsm48n5Vw+Sq
	 XsTW8qTkhpS8ptwAsj3uJFhpARZylPBYeD8weIEae6pGFOWbBG1f75ELCQhiNL3Fzc
	 INYzBq6A3aw8v3jm0CbWAOKDimyuGFxzIubc6th8dwHlWtDn4D4U3FH3S28xEyJwI+
	 zXUzDY7S3lFHQ==
Date: Fri, 31 Jul 2026 02:33:32 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Brian van den Berg <faxuser@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>, Brian van den Berg <faxuser@proton.me>
Subject: [PATCH v1] ALSA: usb-audio: Add quirk for Logitech PRO X 2 LIGHTSPEED
Message-ID: <20260731023307.28510-1-faxuser@proton.me>
Feedback-ID: 57639451:user:proton
X-Pm-Message-ID: 3bcda2a556bd1191bb8a04469979b80c5f867dbb
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

Compiled and tested on

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
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 31cbe383ae65..ff8adcf76a7b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2249,6 +2249,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
 =09DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 =09=09   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+=09DEVICE_FLG(0x046d, 0x0af7 /* Logitech PRO X 2 LIGHTSPEED */
+=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 =09DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 =09=09   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 =09DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */

base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
--=20
2.55.0


