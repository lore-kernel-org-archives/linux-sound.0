Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C530C36D
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402727; cv=pass; b=LESmYoOom6BRHY+qk8P35a3UsQ570bT9k/tS0o7886lMTz/6w2SxVpn8BsKfmZFfGrENHO7FmLkUbbD4p5uE87Ja7LsVhBIQ7WahivKtKW0MV0wHTH4J0x2lzAaM2yjr/lRlBQ9riqneO50FKHruEexNpyXJGh/vS0OfEku2vy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402727; c=relaxed/simple;
	bh=l0jahKjEQ5Y1A+QkEFrxkFj8tLhquDkwi9jGVtnSlMQ=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZPHdWbvJteQfRwQOK/xNw/2es5vqW4YTRZOAX40ss8sFuqWcQmivFjekYzZWGIPqloK05N+mhg6sgsZgO96YPg4OVyJXmo28lG9bKKpAu3RMaBUf2i02qQMatddp+q4gAsahBcCPLLP/7X2nug7H2/dZ+9pPwt3ho36luwZx77E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=1MdFkhHc; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="1MdFkhHc"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79273a294edso43200557b3.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 00:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771402723; cv=none;
        d=google.com; s=arc-20240605;
        b=GEmullFJ2kW6IESGaX94YAjt16DKm5GwVCvvETLtD+dq3REk60MkzkYO3mLmkhpbUj
         4n1MhphV8EtY1n1Dn2iKTYGTVD8v7zifhqpz0ykKfhiFhjA5/d6SqVag/E0lWR57qkef
         oYNHrkAD28rYjZhY3GNyjYP4eY8vFSXwxRiZgS/8GFeUKZBKQdpPpyhOFpyDhru5W6y7
         +pw0SGXHmFpldmmQsswIA/2/qVoQK9WSn88m7hI1nh6k1miPDt6Z4wAmoc+ziKA9WnZl
         46QoVXxQby2YUKmniw3XIS9yw1ww7b4DshfYX2sd7AQPktQEPma9GKSMUHyzoJLq5u30
         X6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GFlg9XZqeuqWtNr094xxelkb9AaE5Nk2q5ML898v3WM=;
        fh=7/7xazYjls9qZWQq9fh3eoM4ukf7vHO9KMeOeaSsuh0=;
        b=afKtejVLZ2KM67ipz4/4qMKAOOGxrlPyDF9i1o9KvC8FodvG4rNvS/LTz1GdvmJW/L
         Rqh03IrOkDzW6nc57ctPtZiIklvlt7IQS9o+EvkBIFcEKiMmKiK/Eb21TyvLi3HarSNx
         NeI5yf9nDj8+jcR4s5ubt/mgzkWeOmcA55s/o5MWFngEoix4BQzqbLy8jxFYJM427KnB
         r7+mmiCSNFtyxnp6Px+ZpjFsL0MBF8qN4RfiYBbRsxkUnrDPPd4CdSKQjnplBSbzbf3Q
         E63GdH/sK1/+6tmko3m6JttbXAKp9hrTjAglSXLCbWwtS88RKlQkFTtpZSv5XpKdoN3W
         4ZXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771402723; x=1772007523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GFlg9XZqeuqWtNr094xxelkb9AaE5Nk2q5ML898v3WM=;
        b=1MdFkhHc0AuNhs/6NSpmStyIBMSvLka+5QPdNkgoA0J7KKNCFJ7lNog35mWPiQ3oMU
         Ct0u8AZqeu+yLnILK8gfn5H8Th4IQRNncDNrVhUVOJKSux4zkHQZmLytNgpxLMSly9x/
         fs+KHJ/xKO35TjiVkfeulYn/xswPCZXhX1x3llmzZPZ2XpJK8G4WmNN5um56uf77ksSw
         872WZ89/1FNmGTbqy7enicfp8Ymv1OAQNP4jb89J4Q/+I0M71I4tBT93szuL5sxzxJ3x
         7XblThy8pZQqBR4yJUmO+A+1+LNqndlvrHWAW9+Wxj5IUjJmNcRX/GdwamHpNIU8eTaf
         G5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402723; x=1772007523;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFlg9XZqeuqWtNr094xxelkb9AaE5Nk2q5ML898v3WM=;
        b=bjdrwAdH04LrG8Oq+I21pPcmToHKlOf+ahMa05c+xTqn4lwtkVWfeXUsB/006legGz
         iQh4M3Mb1oVseIdrk8RCxcL+6DJbsvs8bOwR5Ol093h5tpRG2gNzape/A43csu5GWAu2
         g0yk/2ANadnuLpEa1QGlIM4DFVWC5Q+vQpaKAwrhQGbblsuJZ+Zv1Azm5NVKSOVSsYwn
         2tjM92+mSTMdv6vRxm32PusQRzbGVFQu8yRd6poPACbia0Hh5b59uCHZ+w6OM88DQpPq
         v4Gy6LQ7NRD8SsPE0b80ukyO34baRqqcrucbsuh5NlJlzz+7gJlRxSLD8QoX1dmSMhxk
         unHw==
X-Forwarded-Encrypted: i=1; AJvYcCUOFXHmhRaPUbYPFp9Csuv64O5sn439/VHInqyf63Z8LZTw+O7uet8O0GEHQrj2G9Ona2G2KLS+TUk25Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjGNZhVKwzuHHoFTAp5LmvaHp+KiS8/dwaBMEKXfyXyPUeUv/
	BvjMOresKMOEABNBStbUDxg+1ywJhrwTGfDRo8Zfs9NXQRux1OOYZ2PVEpdFYpBy8jGDAjxza3Q
	kpFTmQL+HpZ/KSXB6w3iJRVSG3yHgeEuBKk07tLtA
X-Gm-Gg: AZuq6aKyW6N/l2gIXoV4BPnQnBWIv/9pH2OpRVULJrUqO9KvLsORsd+ocLIS+Lhc1o8
	MZZI7M91c7CspFeQkAsb1m3qDCRK/ipZPmKVS8JD1zpLAAwHYiOc0IRulggCCbA2AwB61GKlBHg
	4dbAvsCjrlSE+b0T14W/uMuebqCpvs2PuIidWqycxhWHblYK66e+fRoalJ2ZxBy3e5MQEJy/dvJ
	Xk8CuhaHARgAV0B+AGC+rOHlY8X0I1M7fcu5tmD7psXWZLe12rgMgDRS7gjdzKGw6kYr3p/sO/3
	bi2La7h6FHFvMv4h8WAhUw1cF7hpauffqiiUWE64
X-Received: by 2002:a05:690c:298:b0:78f:f32e:8b5b with SMTP id
 00721157ae682-797f6f020a3mr8090127b3.0.1771402723541; Wed, 18 Feb 2026
 00:18:43 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 03:18:42 -0500
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 03:18:42 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 18 Feb 2026 03:18:42 -0500
X-Gm-Features: AaiRm50g6RQyT8oyqWPYdEz0H6FC-kYp1-DFZzN8h1Y1ga_u6UoaGVQ-j0FmVJ4
Message-ID: <CABtds-3QpFkofJydHXindqvABH8uT=t0p-vdMyfQDH04B4=cPQ@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs
To: linux-kernel@vger.kernel.org
Cc: tiwai@suse.com, david.henningsson@canonical.com, perex@perex.cz, 
	kailang@realtek.com, linux-sound@vger.kernel.org, edip@medip.dev, 
	sbinding@opensource.cirrus.com, chris.chiu@canonical.com
Content-Type: text/plain; charset="UTF-8"

From a673e45b345d494b7ec7143a8ace72faf6aa85f1 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 17 Feb 2026 11:53:41 +0000
Subject: [PATCH v2] ALSA: hda/realtek: Fix speaker pop on Star Labs
 StarFighter
To: linux-kernel@vger.kernel.org
Cc: tiwai@suse.com,
    perex@perex.cz,
    sbinding@opensource.cirrus.com,
    kailang@realtek.com,
    chris.chiu@canonical.com,
    edip@medip.dev,
    david.henningsson@canonical.com,
    linux-sound@vger.kernel.org

On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
emit an audible pop when entering or leaving runtime suspend.

The default Realtek shutup path powers down the codec by toggling EAPD and
adjusting pin widget control. When the speaker path is still unmuted, this
can lead to a pop.

Mute the speaker output paths via snd_hda_gen_shutup_speakers() before
running the normal Realtek shutup path.

Test results: fixes the runtime PM suspend/resume speaker pop.
Pops that can occur on cold boot (G3 exit) and around display manager
start/shutdown are not addressed.

Suggested-by: Takashi Iwai <tiwai@suse.com>
Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..fe74cc550322 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,6 +1017,26 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }

+#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
+
+static void starlabs_starfighter_shutup(struct hda_codec *codec)
+{
+	if (snd_hda_gen_shutup_speakers(codec))
+		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
+
+	alc_default_shutup(codec);
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
@@ -3802,6 +3822,7 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
+	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
@@ -6238,6 +6259,10 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -7370,6 +7395,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter",
ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged",
ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7466,6 +7492,7 @@ static const struct hda_model_fixup
alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC233_FIXUP_STARLABS_STARFIGHTER, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
-- 
2.51.0
