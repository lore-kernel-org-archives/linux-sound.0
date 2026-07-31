Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C333F591
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466133; cv=none; b=SitEN48pAd8jPomAhshkg8fef+bXj2bH3360AVnngbeOZVmyX4ddh0/YRyhyo5s5jj7oe462CN3p4rR6dFLA9BiHhTZAoLUqxRk6Q0w4JqyeN/VuCMIu/23e+fvx/+U4pPRvcsjXt+54O703e9/B4/4JJlzxEd3UeaPwKhSDfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466133; c=relaxed/simple;
	bh=cWIqsDI6ItM40PgQivUkwXWzgGzdaRgv2L3O+XStlrg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fMRLqV+1s4y9ZTytBkme/sXuL2FsAwZZsoz3GyzaEes40D/dnozk8q0oyaQYZMTbDFYTZ2O02X+yxeMH0H7zaIwO5dnUOby7+nWAYaY1ityxoi4Lm6OmfiTqGJjpKXVUhmuij12Ll35jTAaVa08ZVTykp2vWcB9PDPbNQWg27yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RzSHrJ7S; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RzSHrJ7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785466128; x=1785725328;
	bh=FSK6Y4nEDOteYNwI4g8zDLQzMh/+mLKzkzIsc9a7TLI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RzSHrJ7Ss7Mik7aFedFjamzvGeL8IqNTXaPEEJuKxgyQhP9kgP4Ntv0nPNohwkl2K
	 Ib9kInEUmmb4LyQ2N/D0kGPQYuOHf116rB3jQ6DYmMurDg1OaDEGvzULt6CH1fpA3D
	 6EochFPcC/YjP53K9+Iwx5MHGkQN116Bm58q8XcpPoRubMOHQif2/UIVAwJ0CXk+AA
	 9JyzddwMdcqSBarlaj8nNmLQlSm87bdYIM0w3OtySW1OBfHMJsSHOdqL928yq7tgzO
	 a0z/Z8/7OqSv93+M+G/B+gI8KakD4R+BrYIJ7yzf8PXgnGy1RpDReLdaqPzWFqOLTb
	 XorDZtY7tm3Tw==
Date: Fri, 31 Jul 2026 02:48:44 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Brian van den Berg <faxuser@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>, Brian van den Berg <faxuser@proton.me>
Subject: [PATCH v2] ALSA: usb-audio: Add quirk for Logitech PRO X 2 LIGHTSPEED
Message-ID: <20260731024831.31966-1-faxuser@proton.me>
Feedback-ID: 57639451:user:proton
X-Pm-Message-ID: 29f5d96fdebc2cdcb1222171fbcb0eafd926fb04
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
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0de7c9d94259..e038b5ccbcba 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2251,6 +2251,8 @@ static const struct usb_audio_quirk_flags_table quirk=
_flags_table[] =3D {
 =09DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
 =09=09   QUIRK_FLAG_CTL_MSG_DELAY_1M |
 =09=09   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+=09DEVICE_FLG(0x046d, 0x0af7 /* Logitech PRO X 2 LIGHTSPEED */
+=09=09   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 =09DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
 =09=09   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 =09DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
--=20
2.55.0


