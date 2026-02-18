Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A633CE87
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407924; cv=pass; b=kv8hOujNPYDFO8gerAhr5IYvO6+z9JoRgkljaHjj+8UIb+2w8VNiclZgUuDZT8zQAgEEyXNLfK9YfGOazP9YyJPM5PDE+FIp9ymP9XlxINpItY/eyEo1Mkn8SeT3P6Wiu7dW1IWtn+R3gHzvIitZ/saakikWTC+RyAsdnI3F6xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407924; c=relaxed/simple;
	bh=vZYaHq8XIaGCe3yL01xxAzr4U7wZPV5HIrm0Ssppl+k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JXOXkmHSclp6I5b53uTK72XJCF4E63MRF7YlJNchVfXexkWDybWGdGlDzFguNk6vX7T+qE+MuGnlsN98a/9DBk0hONDWlb/L09BMXMSPV7GHo4Nwn+HHK8ISGiPvfN3YAASsJu5qn7bVcE1iH9o1YkXCzK7sR84CHs7ZxyHTTv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=GXHRnj7Q; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="GXHRnj7Q"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649e456e8a2so4434095d50.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 01:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771407922; cv=none;
        d=google.com; s=arc-20240605;
        b=W8q/1FaqtTUIHqeqckqAhhDqIgUX3viZWCzjLkkk/2SRevbe1uMpBmHVELzPxX+Wci
         1YzA0TrMfN+WKoKMQjuCVloYnZ4B7Gc2nirAbDXhsK4L0zdtWlUH2H4pVLYegl2qm6+2
         LkdTgV1jBCNYetzh2cZdWpfxHINsd4DuROeYXIEz6RyNw0z4QCDw1dl3LmuZ2VWQSgA8
         PCaUDSVAupREv/nyivgWuOFjKzqY5gKLfzY9Cga+Igm+i2Aux27Fz2BTFI9B1sZrkwZs
         it6DNAm0mnn/KnLU2n3xKAfIXOQIY/99ofI2CjYEwAKkwryQCUE7DXJs9E+XVVBPOPQr
         fhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zh2XBD//+tf+dYXF4FzuNwerEvQ8DxJonv37jHw22p8=;
        fh=uUNk+lNqRxUqFlpxcdJLASD2Ljk21wHO/iM18albeXs=;
        b=kPTx9Wsy2UA8GgYTSse0sYn4PB9rx1gPvZNDU4a/QlB21uXxOlPruk3yXkNILOmmDX
         Kx91gNitoWJ+8btN5NQ3113GdL0dIPeqxxKLZ/rACvubvovFbDlMwG24vHXdLOOMqSBx
         L9oA34zwqX35TMp9K3BqbJShmOO5DkRDa7jNvxMoSssmf4d2Is7AWbsfe+jXplaYIRM+
         f1Gi9tdU555bcuLwVNTxihKd80azB9sEBVrhcaQTnMrsMJw/I3620aTgLrre/no7ymsV
         9XudTzQxGK3sBElo5jBLFI7eBAdMMDhh0iURNnWo9Nlij/i8t/njaW66eL+iTmKaxmla
         wo2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771407922; x=1772012722; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zh2XBD//+tf+dYXF4FzuNwerEvQ8DxJonv37jHw22p8=;
        b=GXHRnj7QnqIfBNgt8HdLd/mjnDPw+mvyPLA7PtDnT8h7puCxiHnaRKEBmVAXW8M39+
         vcja/bXGvJPeMOHvWRMErLnqKm6xVnUbkN8ch6W1tBNVaSjSNBLmyH5ifmMdV7xuvjoT
         YASPMEn7myLV/sfL5NkJQgLipMjGPCoV1kJ6BVzQGcCliiP6yEEwoZSOXgnzUINyaGvT
         1YLL0JDrPyJYS2C002WzoTVsRXUUWiwEsztYyunKVC4NsU4CUj5IybNx9gvOemYRaVTy
         Sp0uz0xY1oMJFc2cCTwqtB9du6FlmPZ3YeLQr10VgKzpL3k0B8NzuMuIR1pl826tVxbn
         yI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407922; x=1772012722;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zh2XBD//+tf+dYXF4FzuNwerEvQ8DxJonv37jHw22p8=;
        b=jVrXH65PUiqxocMQWEBL9w4dhsxkqCMU9re3JEhCywugr9tI8iwmdsNgYWOIJ+QdC+
         iTBzyxjusD3mkssJXis/bg7Tpm44Okju7U8mp/5iW7o2jmI5S0gN0lqQH3PcMssthPsL
         GVEmcnRMkgVpDBKqCJePN7KoC/AbQa5wyTCxfdte0BD4zJf1fEfeIWXKYtlVKHTr20Xq
         Ifwig4VkIG3FslYacysTcVHQu6Ics6LmZQ8ozLzE6X+tma+GAwCBZomZB/uDEV0cgxRB
         +upIszphWtIJl5qzsR2zm8yt69xJNCGl2ALciNnmtndq4dZ78bCcPLOGKavV72+/wQJq
         u/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXituuiwdTSrul9XHzH/tsVuSz0nb2tT/IIHZMHQSAGEWMYn1SubkatDVc8gKSwgUoZFdV/WpdU0G+uJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBpebtH7SIOZFUZe0HlLCr2bgyHUyMaoaPMt3mu6yQGZOEq0v
	QtPM1xebZDAKEBYN/vAlePxRQ2iGNS7jKgHuFFB5giLksHm/2ZlZv7dMRQnYCEHmyfI6mKin7at
	NWv0tdKrMdLJ2RHHsos4rn5B/9k8uGsCD8ef8O6B0
X-Gm-Gg: AZuq6aLl+Z5RUUf1TmPmnIOkm7N5J8Yf8fhUmb9mrImWD6NWtTGRPu2PzOYOoAQGfU1
	mqQHoaYUx/Snh4pqKEUcy/RrefV/BKOmEec6AtwkM7rl3NsDLrP/vktoeeKNUJ6JXlrh5jkfHAb
	Mo8CjVyBNs4tA7OD9T+7VMeRcQ47HvKbToMmOUmc8nU1PQSOUjtRhFF1V9vTLd6N0VhyW6Yk1we
	R/Pb2nrWNI+jGT247La8V/TH+0wPRv8yxx/KipQ4xqUhawn8X4qq2qCMLf9sqyzOrtSmyAFkol4
	UmJKKkizESYr2rIFniM7yTjQ9Zi7bTCeKWcYxQ5B
X-Received: by 2002:a05:690e:d4f:b0:64c:2a4b:72e with SMTP id
 956f58d0204a3-64c556b2d57mr490842d50.54.1771407922021; Wed, 18 Feb 2026
 01:45:22 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 01:45:21 -0800
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 01:45:21 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 18 Feb 2026 01:45:21 -0800
X-Gm-Features: AaiRm52gX5a_5aeMBm4HuSK2B8Pxrx0P8MGCuYuCFyrk9bOEay2WTmkJcrLLTns
Message-ID: <CABtds-3xYN0OEOGfyaBL-N4KBjXZuMnKT+E3FsfoMwt8aReYsg@mail.gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
To: linux-kernel@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, sbinding@opensource.cirrus.com, 
	kailang@realtek.com, chris.chiu@canonical.com, edip@medip.dev, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 4929cc45c32e30361c7e35f0581c83a08fd29b88 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 17 Feb 2026 11:53:41 +0000
Subject: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter

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
-- 
2.51.0
