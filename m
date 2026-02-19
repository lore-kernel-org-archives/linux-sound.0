Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6202C11C6
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771532072; cv=none; b=bWo03EDZ6LsdPQxtGmvirlAR1oWZokNWVRdlp35oxE8LG3iDRtyjE054nfwdEBkNZ4fWh9XtPwcy9qiKKGV5AgOpPmWzSHxJv+2mPu3rSG4EAjCoyqXykPQH/0ZqcF2cThMkNNA4ZzQy4XWWmvPVW/fU7xHp0C5qenD4Jf2Wpz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771532072; c=relaxed/simple;
	bh=jDyL0qh/dpJye64qSsHuwF4DVOZLRQOXsUwwOv00TO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYl7Fm0oeQ6iCiFIKmmYnQTkk7+3IDh5BB+ft0JikTcwvtDSahw7j/tncm5nP6oe4F7MaMVqracIIoWliGChCfUWCN1w+ww91IYDmltUMHwejWiEW9JqyBZgpIJP69D0M+29h0e2Ijdqr8DaZMgnQjAU7eZx9x+lG+hOSs5d4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=Y9CHsTap; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="Y9CHsTap"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso10683455e9.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 12:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771532068; x=1772136868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xKXhp4Fjqh4vlJBlQb5Cv14X7D63Yn5e1MBMaZJXKw=;
        b=Y9CHsTapMvATqr6i4iAeuhE5Wsb5BE6jtLIxgcqREofKaT9lmduLbg6gIWoYCdAR4A
         8gRW3GiFr/1PXaFir9r19oqe3aU2aPDzvLg/kx8z1yTmO9XHGOlkQKkfIMUgC+xc/ahq
         m8kR61zIGwf6y/Di3Iot1Zm8Y2E19Df1cUtOvXlPvdA7iQ86WKraZ650sPHOtJy9CFIn
         DrMnv5DMXrhRmp6dv+sWPsQli/kvS3W1aVDnVOiNtv6qtVnnqCLpk1hQpbolO2nxysN5
         XTzDJRqARasOd3WAhlnDp2XYolkgcQnpL1lW0MQVsF4HLY+7nsXJifZ3PgRhnDjaAaob
         LcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771532068; x=1772136868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xKXhp4Fjqh4vlJBlQb5Cv14X7D63Yn5e1MBMaZJXKw=;
        b=ZbFJZ1/87we8wghDNDiiwpQbkNZYoYjSGh0hV+YmWFBWO1i8DOb+drmCwDMU02IBKG
         VlLZT39HI6RGOxsZE5lWzu5hGtj04H/k4nVEWz6sKbvl5/X0wjx9NsaVIefakrHhFY+5
         Telwk/CRHNqnxRCtBIU66dywe62VvZqSEMdLvgIHzOzoWnaBzZrI5DiW+vc7bUJmLhxD
         3L+8i9IfBbelwC7iGFIFhEDS5m8acXzNZPUdfXmKr3rnx5AcmDe/B7Mx2hoZr3fBJfxK
         mcDemx64Io7Yz4VzMX4ZkhcpvYEc+7oGPG3QHhH5admEvUTKL8ojzq5hLpt0hcez4JcZ
         Yeyw==
X-Forwarded-Encrypted: i=1; AJvYcCW87C3jCJzgY49Mo1ogoDr/r2XmxH/YUIbzT6+QbbAJn/bEK7APfU+ekZM5hZq8ndr5nSye8IjWXeXwYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZZ8RreVGM9jv4eYR5lZPS7fTPQTffcbyr/Pd/Ie4y0RFhiRG
	q5jnM/mgzsmSGkFxL1KPfMt2FH9UD3Hk6pcRtdiVgbzhVlPAv8iVqwmFJAI0qnRSQA==
X-Gm-Gg: AZuq6aI3mSGfuG84qJE+FJv5sAKhwHlIBMJ/wFct71//Rccw7exnWO7mNvimsgUXTbk
	ogSFkJ4arff3UndOqiRTF91gnpAEbmQbeTKonkv3hClZe2MFTZppsotPYvMDNVAg+l53A2/QxoF
	a8wy7bN/gEHRnMjjMsryav2vPthH8jyjFhBqEdB5fIejBwMf5STzM6F4byj4GN7hCuYh8hwO7qr
	CMCgNBhT5unM7L/5qC+ffX72ZV/IuPMRoWDblsT/PV2QiP26HKoSYFrEyVwBQAI75gjGiIev1Kc
	+FpqHP2yCU02uZCkCziOPZLC1o4aghdwf2WibMG7Lv0o80AEvBRm8feMYR+h/nFAWdTGqdSwXCi
	Jxb8uhryDCCavKu5TVtKSL9IKn1e6Y7vc7JaRJXDWt9wknSCicVP2egz25L2FzV6cmkzcbKzqZ1
	ZTPSmJKYZOaP6hseTu0uT+trjOdyfJgq5KGBxs2S903hNCI/3Kzxg=
X-Received: by 2002:a05:600c:3110:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48398af0206mr142458725e9.35.1771532067676;
        Thu, 19 Feb 2026 12:14:27 -0800 (PST)
Received: from starbook ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bfef4sm37975515e9.7.2026.02.19.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:14:27 -0800 (PST)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH v6] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
Date: Thu, 19 Feb 2026 20:14:26 +0000
Message-ID: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
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
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7466,6 +7490,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC233_FIXUP_STARLABS_STARFIGHTER, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
