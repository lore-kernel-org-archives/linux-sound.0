Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302872EAB71
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407920; cv=pass; b=s22J3nTiTh08L/cV65sTCvwaOTVtgERduURUbejIADVmc+0+h56+xbJik4uJTwUlaD1KdS8yD4WU+rLFuNlc5Ly2hnq9I+YOa3lHPRANX61LRiqGzvhg4ivUerQ6+fd4f74is8NQ9untQZA8WrjDypJa40Sx3hsJflCuCxn6mlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407920; c=relaxed/simple;
	bh=E19+ToorRxaDsMlevRO1o66igwvNZTwDx7nCEzb9mpM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=le09Z9lNZjLPc6/JxVK+zvm6ZPaZRRag4XRO0SW1DGwquQSUSCsisRZlzKYexaOUZTUvTD/T7eFvOF0pQ4/Pf+LJHmBI4LPgIvJYj9hcFuyiTW+UdGSHM+Yi72FNnyQtj9svW0TxNpGJlnEdTKBsrM0Q91MTWvzKTS0IHSGpAS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=UWO1qq1r; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="UWO1qq1r"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-797de0727a4so18885697b3.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 01:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771407916; cv=none;
        d=google.com; s=arc-20240605;
        b=D62zZRqriTP5lIaEdiDDy/+oK9ZgquqYBDJL7WlwRQNDV7DHtKZ36tAO1uEB0SfJIk
         ymNKDDlYTruVMzC/O9faACwkeVAG1puYAs+OnTz4aZ75t44zxkNdDUhc+HkRXtxQrOel
         VnITcenmrjUDAE/T/epVI6uPHZxsPI2s9W/ypOqBJkEbkzjJ88uTh3kUaNMIMtYW5xKF
         NZNTzX1Rlu7xjnYZbpJfIqkMyvVi3GQLavUPfueGxQXFndaDdZ+vPtExD8aZHE722/EV
         lhVlMmiapDZ1Wvj6YKs7q7Wu5gSIL0hfXcXJHoYL4bmvRlSVEwUOtHE14hCvUipMSvOK
         6R5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IT51WJyaCcatx1dqA8OfeeJe8+GbWb120BHsdoQgm8s=;
        fh=J6542bCp4aYg7k17keXpbbKzWQ9ZriijAa5hgG7Kz+o=;
        b=B4ynSRVY5CkkAKWZSNlq/6r+2MofXOi2OyS379FP8SZisAjL5u6tmRFS34JgtDuUBj
         x92RiseHpYg6PY3Wd++tSkekXiass23S17VDCj6uQChnaS7Yim3B6Uay33g21JVE1Ckn
         GRp1Rhoc1dmxpjX2uI04s0UTmcnERBB1/1inDvcJ0Qfs+9mc94QXmmW/Z39wEugKlHp4
         ArTaMyBFAhkME4iqZ7I+KVXkRND4R/zxXETMfs8hiZM6wBx2l8zTScob0w0iWxFECpDc
         rL2cpg1qN4unJBG0YZnnuLGhg/PTx/1QL+f/fFmTAm4L2M8FNDwFQivRvf3Kj0oskNRq
         X8Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771407916; x=1772012716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IT51WJyaCcatx1dqA8OfeeJe8+GbWb120BHsdoQgm8s=;
        b=UWO1qq1ryZES53OKJc0AqaHkDtVsRwI5nofp4PSHoDNVuV+JvVgmRePSxtjpLoU7BD
         yJ4buAE4K8BJJ2QG7kXM+hiI96mExnQbKqPwOTrOFPklmllq1WuUH+Cr23Omr8I2iVgx
         0gg2c7qS7FbqM/HwqL6EB5mav+ZjDIYQ+rVaBEDRi3yazCKGdjNKHj1bbG8w9BFqnD+Q
         CfbmhaUzq/dwbhuaS6QKNmZPaln82JowTqBNaPtJgsaxjMT0PPy9cHBKuCM+0WVyfU5B
         t8EUOlpiBDwLyl2b8IBZz9XgoZ5NWu0Q2FC9tZ74y6VLiGhP/0ha+CfeSzNrG1fInD+g
         6DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407916; x=1772012716;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IT51WJyaCcatx1dqA8OfeeJe8+GbWb120BHsdoQgm8s=;
        b=sT6RMbZvJcYTII4Ur/4yqQhGXRN4EVmyvdrwwOzDDkk7etDafA27Zwy87JwWv1uS7C
         CoyuqH4qDJkz6GUHM379zQrDPAG5xQ3nGjysdm8stuHsjrkk8OCoZxWER765QMx6eAIU
         B1JVIXj3s8NanXm7Qcck9cu8Yh0Ezeh1EGZfymCiLNxnQfUw7Kv5Zkg0CgKrn14cMeU5
         K03iq/0HOLJAmk7Ymb6Wnf2umdWFlSK3y1zb4DntGRFHftPF9QMogtOKLMSWHziLTIjm
         W9vBamXiAzRVxYEDjeFBhkzt8qdubZA+MQg/Pa7rqJogdzY+FQasaESZ+1isgVEZC/6t
         26Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX5gru9DpALXJs0vi1Hv9XeuzigVAlEJkyXOY8N3SWuvvmugVNzEqmtgESMTJSFFazooV94KmOAiUliUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWJqjorLts5jfSKZr8zKIYvukz71E3boWFEhFDkOmV3y7mQQx
	JzQwVGffYY9LSLtewAjwpm0qC+p1e6bVtiCQ++jYfukAd7fcdTI5Dhph9RiPYelif3fBVWuIgAP
	7alpSWqTXoDz/6Zj7q+aEl25bYBmG4OkG3nRLr1SS
X-Gm-Gg: AZuq6aLosI5fgUi4H+7XkTkBzbBQHq67tfcq2puD3BHPwjp69Fd93KYbaAbH4c9aLvy
	bgKdLJkbqBbISzAQtMtEVHloMCOzEVjnFS3LxyDTmtxtxQ995XLUmjmKyl2mn6tX46vAg3KhfHD
	P3TRSECgjYGXrHNQBzvk/A6MXIQ+GsaTB8SgRESh7cIIkbSV06rF1y4QHcWnsaQtF13tW6zYpMq
	Di6hJbIpu57gq9rTwoLTAv8pqT8HL9zz/qYRuRQjlkFXxO+0+sWsZypaDdANBANR1NVnhEFXwx5
	91DOr0+nt2cqdbyjnIsgUa0MS1q8NH/VbGnD3OEsYXi2Ymg+nUo=
X-Received: by 2002:a05:690c:e3e8:b0:796:4235:ea0d with SMTP id
 00721157ae682-797f73525d3mr12443267b3.37.1771407915946; Wed, 18 Feb 2026
 01:45:15 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 01:45:15 -0800
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 01:45:15 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 18 Feb 2026 01:45:15 -0800
X-Gm-Features: AaiRm50__4O_tjTmy2kk4l4FZuyhnBO_h99w7tVDNYchd53O_aU9LFL4TMi12ZU
Message-ID: <CABtds-2kJzvqDN3Afcrrx1Hg8QBLSzXRzxj6QeYU61pT_XKDVQ@mail.gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
To: linux-kernel@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, sbinding@opensource.cirrus.com, 
	kailang@realtek.com, chris.chiu@canonical.com, edip@medip.dev, 
	linux-sound@vger.kernel.org
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
