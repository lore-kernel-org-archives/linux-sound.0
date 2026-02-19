Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44039345753
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518366; cv=pass; b=bhqj/uAsVSgozStSdZxZNPzHSUQkdN6fhfOSJOBj5ZdK4FTm1/9PXqn9nxsFHY//LKpzHes23Smdx0rvWaU6zpJs6lrNJat92M+APuWA3zqeDtHxq9Iuxk/eB3Yu6Ns/wRqUxEdmOm6p+K32am2Dao9oxTbWK9qgxZDozI3MaMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518366; c=relaxed/simple;
	bh=aYqvMTjChUosLQj24AHzjkncE2q8062Pm+aQwdld4OA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gXqtlkmn2rz+Y9x+EyQbjq/pxn+ahXzfvyl26P92OaJHOfjQCrkkS88gdNZdVgpkGG+nDpACMkNyNYQ7NS/qhRIL+yD7OpKeMX6Lnnn6XlRDBUYSkq5p11ExSQ1EMwZTc+FE5w/ylluFzVCqwwdkwLT44bc9byBPMTXfMNJw79o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=wlSILah7; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="wlSILah7"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7946a1f2430so10608487b3.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 08:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771518362; cv=none;
        d=google.com; s=arc-20240605;
        b=XTvpmwcezJ2rH8B1p5rRydMYEDnfX+pw9EuBTsQskswi22Z5XWhcYrFknzeuC6UIjt
         Um8PkQ4hSpo5DjEuogZ8sa6wCFMQOmVixa3EeMUMXbAw+4qN6zo7+gCviPUNBn0qq7vU
         f8LcPcErxMEK3K+zZ2VynVq725xoqFF9eisiDZM+6gLNObp5Zs7JdIiVJN/wFoZHYLKl
         o81Jg8awoqWcrbxb/Vv32ICNzZ2KQgidUJWO58hNnwjnWt66p+y08XC5AX2EdN9dw1Fu
         itIBJr1JswRq8eaZ8mNXnSJ71IGBuF29WqKnhTJWPSO0QyEG3hVNL9sIeaHN0uZDRiIb
         q5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        fh=2cB0bbtTGW1bPV/6zQm+ljzWQonfGVre+2Xl3XIemCY=;
        b=TH+CVIf5OODu7i3GXZoekmDVv313jPYv4Tl5pHDz/3RtiMDnB+Qc7quV4yKKRY1G0S
         wGkzr2+w10yTM9V5ZBfFtK3vV8XbxXST7hLYc3qCU/RhpaMm+KwX8vKMwSHLsg8c7PmP
         ilbjQxhFdKrmLPJdD0vt59j0Z09AQ2gJBE9HuGRJ7d7peUv1cLcoQwzKrpJw9XRHoXbB
         nB18b5LBic/b4stOThH07nKh/aq0hQ7zS77BaUEMg4L9qmTkJI8wvXogQkNbuF/DBqqe
         Psfj+je29ujdalKfyyTgoQ4/2ywLvQoxeaIoDsQMEklZm6qskZ6EgkkpirdPir4D6iKp
         RWKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771518362; x=1772123162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        b=wlSILah7CNMiu3fwlL5mLPc5XFq61AQsfZZYrXTnpLicgfI1Agmbc0HpjKrEZGPB9T
         Hzr9fTqCRAdbfk9Ow+JP8X4NBYSHRCdPosIO/ihvRyAn8SV7kmdqbiE57gmCEYpJq+Uf
         aZgu4XCnAgZusv8CjP8FleAFxOBc43frmE9g6gFxmi4vAraCLKjtkDsNnuNth2KGU9sP
         IpFC5poEo1ybIF/UpQAl52gfkghNiCKyT7qMzqlvGzJM+lTKC89XtGZgpCTADmM8jZTV
         0gA+ovcrGiiNlnBcJRryASoFVB99XKU2oYYGzpq3g73Xk207eRcgCHgJUfEA2cbxazT/
         1ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518362; x=1772123162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        b=AuDLyxMWDB0H/ijbXCZaqKn06JuAnoCX7n8zKeI9MBtT5szeP7J1TUwlDCld5Yx8u6
         On1pYIH1hdiGgqcB1EuXClJrO6UulbWxchBJxvZprTcsehBMDqfnQeoCL8IXyE+2lvf6
         Y4pBVwwRb1hldODD3OPLWgOFBN5NoKwBYzu1LaNhOCWXfkZtSMOgQqgdwiZGt5AcTslS
         R191sU67CLkDBCi9hi8IU2nclmBH0j8bIH8yNtyRTbyZcaCI+QUlEkXh/dXOIOb/x0OJ
         F+1SvGUHVsqS9C4KMIF/nIGufHqxlygi0+nMvDmRoFaMhDMSqEXJ18WChwhpAB9790u3
         QEOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+PcT1JEyVnK7ddgajhbusD4LVHIzMjVuKZGPvpNHthyuqEfrqYVg0rmtTtlmAOPASDkKfL2Wohqpq1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwYjf7FcUproMzRK5ixDPr0h/8VZZBKwxyQAL0JhYL8sqqQZb
	aOFapZeHBbGSFAcxIEtnXQN0WCjMxVKp+7KhXqa4XtUJEvOL/W4BjyTA2vlqAPGgtR7HybqmEm3
	37A6sKg8zzGm1FR4JUqBaAiWV/+7kWkacfMDnxGaE
X-Gm-Gg: AZuq6aJ2l1+mwopCf272rnlAJejWjHhCw9lfrYzCposvgmuhaedHUa328Z5NA+2F7Y6
	Fb2hPnxEYNUxXu7KcSj+N77QMEDiBit2nfeBcI2H58NmX2ZifHNil9RjScGY0mBHdTN7rPzJGDw
	RX97rGK+8BLId3fIBbOvx7lQcysbGGF/WM4DF30YQOc/pV1RaaHs5PIMrtRCTSYeKCb5LWiuMYI
	8F7ki4YRMA4sU9He3au5irnrbAiIbjAN4bYKVL8GKTGUZ9M4YZWBmwy5sh+dqf4ndCCqXBD/IN1
	hO7xXSEQXmiaKRUuGMIpxXWqop3aN/cXWKMGrQ+7
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:690c:e3e2:b0:786:5712:46af with SMTP id
 00721157ae682-797ac4e1d84mr142901807b3.9.1771518361938; Thu, 19 Feb 2026
 08:26:01 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 11:26:00 -0500
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 11:26:00 -0500
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 19 Feb 2026 11:26:00 -0500
X-Gm-Features: AaiRm531OIutHJX6LrGCp7CXJFwx95josEN9BAsxJCrpBcTcO9-bAWLTQ8MrvZY
Message-ID: <CABtds-1+xFQJUT8FB7EkUVfm9arnL4to4V7rrKV5Pn5rDF2J6g@mail.gmail.com>
Subject: [PATCH v5] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Stefan Binding <sbinding@opensource.cirrus.com>, Kailang Yang <kailang@realtek.com>, 
	Chris Chiu <chris.chiu@canonical.com>, Edip Hazuri <edip@medip.dev>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
emit an audible pop when entering or leaving runtime suspend.

Mute the speaker output paths via snd_hda_gen_shutup_speakers() in the
Realtek shutup callback before the codec is powered down.

This is enough to avoid the pop without special EAPD handling.

Test results:
- runtime PM pop fixed
- still reaches D3 (PCI 0000:00:1f.3 power_state=D3hot)
- does not address pops on cold boot (G3 exit) or around display manager
  start/shutdown

journalctl -k (boot):
- snd_hda_codec_alc269 hdaudioC0D0: ALC233: picked fixup for PCI SSID
  7017:2014
- snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC233: line_outs=1
  (0x1b/0x0/0x0/0x0/0x0) type:speaker

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: Edip Hazuri <edip@medip.dev>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Takashi Iwai <tiwai@suse.com>
Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..00a92da0ba05 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,6 +1017,24 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }

+#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
+
+static void starlabs_starfighter_shutup(struct hda_codec *codec)
+{
+	if (snd_hda_gen_shutup_speakers(codec))
+		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
+}
+
+static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->shutup = starlabs_starfighter_shutup;
+}
+
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
 {
@@ -3802,6 +3820,7 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
+	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
@@ -6238,6 +6257,10 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
+	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_starlabs_starfighter,
+	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
@@ -7370,6 +7393,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter",
ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged",
ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7466,6 +7490,7 @@ static const struct hda_model_fixup
alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC233_FIXUP_STARLABS_STARFIGHTER, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
