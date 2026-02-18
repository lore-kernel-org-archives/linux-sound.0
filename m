Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912C318BA6
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447040; cv=pass; b=uHKH5xsgC+9y1prT+lzU7oPZuLRvjik0dO9WZWIzhzlYL2tnR/yvgwpMtni3u0FTec4p2jdPYCttNHM1LEEY9DbM/VIedE3ag1rh/SBQ0s9Cb3RtHtzc2zXrgP+edJgU6+TBwjBkgQerP5wTsY3mF9CkvXLpOu48a0HSgWTVPbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447040; c=relaxed/simple;
	bh=aYqvMTjChUosLQj24AHzjkncE2q8062Pm+aQwdld4OA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d11g9Pib8kIZbd7ettG3WNbVAO3fiXdaMB0OpwNhXMn4ME81mgUMT8ism6nai9i3VySc5YpS02MBjndaXqN5lZAj6pQUCpsJjFHq2lCNB2Sw+LTVaOzidE3zpjoFdTaOiiMjsUZutrQ6IQ5/gxlxzhDN6LX6MkYN4vZHz1JnKCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=FS1QK6O9; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="FS1QK6O9"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ad62a294bso191643d50.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 12:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771447037; cv=none;
        d=google.com; s=arc-20240605;
        b=ejTIYd6Q948SrEThQB/azLsvk7IZagUoUeRzxv8DJJtyJdL5tL1VdnEINax39n+NVX
         de1awcSwMXg+9L98h+uzz5/g0/SjL84ZQ6z/entntj7jjVoXclUDDdv2GCiWHo27pHb1
         TbEt6K3dGVBeAu6PGSxXnNJB7eQLOx6/P5NXfm6yY4eDhYebaEfrTZ834RbC2KliVL5c
         RCs+uwwzJvfYrSIib2b6RpARaFCNIljEkzmGdHnVfrTJOXT68C6wJzJ+rTJGDjXEsnq6
         Aj0uO02fhF3oEDlA5vSkVAjPpaRkYXb5MPjZRjkuO0veN4/hbtHU0az1M+du92YF2dXX
         LsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        fh=d1GAtEOmE/lIdc6gOS3jsueGwlv9XEvudBVMytVhjp0=;
        b=QdskEubN/FuW3TdU+Ga3F7VQGCxDk5Y6xygJsxnTcV0HmHBeoOi+Cesqn/FtzKRDPc
         uRpfxgDwYIpXa/oLxa6i2D3F1LkMeFoKOwxXQuF6jMCvHpuY+dGCZKb4K8UM6n15g+lw
         wVtKsLlrsQUDZI9Z5cAB0KagNt57XOYFh/sr/aH87HuRKdXm8vQn9NOCL8OoAKp49P6H
         WcWysducbkpKXM6e0vwIJhFVljtOIqgPMpV+ZkV+pe57pqAiAXoL9PUapdB/aQ4Uq2gV
         iuqrWfZj6VybeH20tpvDgwL2acIWZ/MSfaJgDCWeq6ZIY0IsNoGgfzFrdT20ZPOWNaAN
         NnMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771447037; x=1772051837; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        b=FS1QK6O9kAxU+7ZLI0PK4dTEg/3QoP/2mFMZgG2aIwNvPGJCSWAPEJR7fkHHXyoDd3
         FgQ6Zl5nB5AFoDv1rDWZpdGTy/witas1tmCeE2cwYJisoXTRp64ez5o/bAKEWkLKDNfD
         NbPdzO8s/1nVNmEUyouEVJMB4dcswdMmdHLHeWwleBWbWze3AqZO4bnApjMTxN6E1VWI
         xpmOxZjaxk0g7HOrj4DnFbdDDmzU7EiWCHAEjoYIS27jCgLUoEnWrhfV9h0oW1bsVBjL
         bFpJ/y3nyYyeJLitFWXKZor44Odmq9z/W3MxcGp4Cccf/aA/QAX1Ind/6YpQwk5soKd+
         mBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771447037; x=1772051837;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj4JjrmCwnu2VpA6QRKnw2s/8HTQh7dMLUnqktW/KrE=;
        b=iyoOJ/2xmZ5IF81PxfCCyhdO9CeY993v4fM8S5csQnZHzAbOLtz+u+zVTZayLQSA4a
         KFzuyEcseUg8sZIN8MSBhTyuVcMtxbAlKItGnhyV+A88FA8z9DG/WL3/q4rpHXwQYZqC
         zIWjv4y/nhbvE2xbzsVDrsa4F598Ko9p8/dtHp1lL8PB0Jti50NN74rSdo+4Puy+aD7y
         zGJYpZl8eqbQ6KnGaCWXnXpuzyi5QNcl3kGnuO2GYzHXgGpcsc72EeqQeTQ/XVAyoYex
         ftsCrZW1eS81JZG59lEdrrAjz00wj80AeEy9jekFwAmwF5UynOwwz/4yJdnfqMs0GwzA
         aC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVQVMUWWMUeKI83qYmC17lV6dOMpUH8K+7EML/CWQsX/P1ue+J9vddQM0Zb5iWY/i1Yddal/AYogoz+mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rwd2GP3RMSJ24F6+r3E/xya21/r/uNE87zF6vuPlDKT73OjR
	nZf2iammhx2QQ1CUcQX+PQ1UmWBegG9HgcGliCQ32wlVv0vCSMFgJYq60JsQFSvZ67qXEHzcEgi
	TLCFmUf76iGxp96t3als0oDYsKybPgvMTr+uH/qDYBzwUjbFnZGM=
X-Gm-Gg: AZuq6aI8Nc522bqtwLhOF0/w8JrfD91epOo/wC+C5HWeO1NwkgnMlQ6Y3IYkRp3S9JR
	kWbDKnQmuXeU+M4Ctvg8Hiob2iGZwk87u1HuJR2AwIRTWnzpqfRG3Rq+0Af1uvVJkB8nTTWk5h1
	e1lZogbtOzH9rmcUDb0St1/hLUoQU6SGnBJly6+j9BUSYijIQqMxMirlrJGtyKLGcewsNKE0/ZB
	a2hca1kzkGubXOxk3bqXh8fPXJGFisZeYd+7lG/ZbZRVF4UCyW9GqMTYe8AwHyQBAaYLmnnl265
	qWQhAWN9VQIWGxxW3UBmkwy5iKeSrUqAlKJk8g==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:690e:4189:b0:649:e440:26a5 with SMTP id
 956f58d0204a3-64c21a43d2dmr12653986d50.15.1771447036778; Wed, 18 Feb 2026
 12:37:16 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 15:37:16 -0500
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Feb 2026 15:37:16 -0500
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 18 Feb 2026 15:37:16 -0500
X-Gm-Features: AaiRm53zywLMN3CBfTRrjyxmHfDOVBTd6CQmdI9w3iNFjHcPtb0hS3sD_1fhtPE
Message-ID: <CABtds-0DS24GY7e_ST9uRLYoVNvJRwNE7XLz2tLFqibe9SFifA@mail.gmail.com>
Subject: [PATCH v4] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
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
