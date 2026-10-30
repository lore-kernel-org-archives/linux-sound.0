Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379866;
	b=dKTY1XTpSuNlYUT0qhv5aklUkkboqbA6YxarvVBVojjDeyZQRXM2+nW2PmKnm4CwKYaL
	 BV/l+EGlOlAQGu4FjOqkdOshd6c3r+fX2SrhFiDqdi0XyHgF16iq4nt8FimpXOWaLbhT6
	 gm9c4p07KJ/7/2eCi0SiJBgjA1iC87uaYxrIRkurmpxOMiml+WMz3Z01cv572XRAJ+BmX
	 eSPhtgGwGN6N9WDEYwryZ68J8v+bS9m8ASHJjW3dEnbxwcIcLfRyNizuPp06oiA6wSgaL
	 PceXwrx6PjuGcbJK/XLtEBcJLVi9umtsuaE95xANrkiP88LjM+Qj3s/6aem30wAmxzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
	b=IcbQ3uHqnrr+VT467dx6o38uVmt3fYJjUtaqIGkCXXTujNyggZVTAXPkfIYffyYtFXBF
	 KWaAc5qNjC3AJx1nr8iu5m6rqN+kROUBYO2pkAaKvUBtV7bEbuAEHvv/M4OMUPLwDs0HL
	 rzsuww8yjFwj1j4bhvBLz8LAqEWWgz04apG3A4QmEoltFLWiYuH2l6XrCKl/uBddoWU3h
	 9TyJFP5edIhL19p8jqOvSOZmSXpWQpn7CapzUoLKdcMs8ebYu7QrM/GQHk00ALYXzPESL
	 CPkA2KWvhtYyc/bkQLI9yt0tUwXCXzrC1k9aDqHoD+KvMGSiOeIh3QVb0CQDtDXhSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmFpJkl7;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49794606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49794606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmFpJkl7
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aa9606ddadso737340eaf.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379864; x=1793984664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
        b=vmFpJkl7EBNCYxDVYDJYKFjF4bIhiWR6Y9qfGSDu2HtVycSWM/UJQ7qwbN3W+6RrMy
         UiiN72XyOoTobOprNNaufTysF8RjSXj2Qp0ywU2Y5YG5YctI8Rb1PpKqQ8bLatBK7Nv9
         yN5CT03COYYOORcEy9hW8ii6N6gVvPp1btreb06r06BqE9bGdSHv+Idh0RVHJB64FHmq
         fYmAKFxjkmxxMpIg9pKDJM7FQKIrGbOnFGgVqgbPeXLexNcL7thz0V8GJkDlkpFv2vQT
         M1dvfVvh7RUlO20ykEWU/ftkF1erTjruOyL6KjaBqYneP8xxK5tzS6BNqAItE5MD+Rw7
         evAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379864; x=1793984664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
        b=NM0wTEqwFfbg1igJYRtR71dR7QKUj+DqRx/bLGUW/FtAZ8HMJXabQ+QAAc6DmRw5Ks
         uRWlpHwqDaZJuLNPWUlL4SDh/xBHldGWCswEldh1lDTjU1RneLTdyVZzAG01uxJilBkb
         GUcchWDfgzl2Oa3dnV1gDvBJmYckeRHsF0q7uLjlRYos6msPmQ2Y05wEZ9t5le3iud4h
         066YMyHaNeukE2NaziB+BzOkQ3rIk8oj+8h84TVBCJOiXzcx+RBds8glRZy2fR6j5pzC
         0YLQfmWZ2CgDVVIps04XPG7wbPNvNrAHxuWIoMZo3HMLVt+WOHq29gtzvThhjP9z3MG/
         4OdA==
X-Forwarded-Encrypted: i=1; AKwUvBy6JSN1Ay85hXHo3XospWlUoClPutD9I/6LFP5PWXnsSYxskRrfSIsUUkoywTJwz/LUkV9WM2V0M0nIQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlA9xkv6Srkn/R3hXrLDg6IHEAh+6YRXTnWvEMKZidfK6ljigv
	ax26FT8Qb9v1GorxaZ3ahnm39hSlL8WjUEHVYdPbst3fsoTHO3nqUNIL
X-Gm-Gg: AYBFou1do6Dr0gv6Zyau+6K7Lf3xBgYb+882LMENX8E/uzxxzNmGt7UqWZkRmzxaJDt
	hHZyoKZdicUE1FM/P4KybKAxZRJz7GTMceUSvNd8nVYp5vZlH5rFAneb06/TQd2tvcRlPhxJTzG
	2VfvRC14WBCKg8AGlMBVGl72bKCv5UaoSFihCqVIFGBqnQDcbQNzSOEu6kxm8IOnBq4hI3gfqMj
	k7wnOjswa3DZnnxsQkKcQzLWgn1INTFbMa+11HXJHkx9otJrwVDrB/BC5JiGPvWB/j/CzcUAEKX
	/6tG1ElucaYCM6mtiqBzE//AeKcW3RM/Kyyr0HyFd/huDsBDzs+YKmTve/HFUDCZc4UaZY3179h
	OIeiq32cOtGKgiZkl1RJvghzKCPLrgT7ANT4mGUOUgBtz7v/EPqivBD+fTe/WDM6sdzXthukwEZ
	+Lc6Vw07bVwMtsRlI8/j2KcoEMdNBW1sRDYsx8kUsU5dGCd3oC6GMPyosZZPGxkzliIciJrGuG4
	7RXkLD74Ofck8p430X67IxUDNn3r79+2cZY6Og4UFgnnooNRLeIndR5bP83A6KA34SQ39/jDqid
	ez4l70xBbUDwMpGv5NffQHvgiy/fA5uo8Fu2rp8=
X-Received: by 2002:a05:6820:8598:20b0:70b:638d:4b9f with SMTP id 006d021491bc7-714f29eed98mr1265557eaf.47.1793379864124;
        Fri, 30 Oct 2026 10:04:24 -0700 (PDT)
Received: from cachyos-UX582Z ([47.185.113.166])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2419780eaf.1.2026.10.30.10.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:23 -0700 (PDT)
From: Slaton Christie <slatonchristie@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Slaton Christie <slatonchristie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: Add DSD properties for ASUS UX582Z (1043:1a8f)
Date: Fri, 30 Oct 2026 12:03:54 -0500
Message-ID: <20261030170354.7427-1-slatonchristie@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Zenbook Pro Duo 15 UX582Z with PCI SSID 1043:1a8f has two
CS35L41 amplifiers on SPI (CSC3551), but its BIOS provides no _DSD
properties for them, so the amps fail to probe and the internal
speakers are silent:

  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Failed property cirrus,dev-index: -22
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform not supported

The Realtek codec quirk for this SSID already exists
(ALC245_FIXUP_CS35L41_SPI_2), and linux-firmware already ships the
tuned cs35l41-dsp1-spk-prot-10431a8f-* files. Only the property table
entry is missing.

Add an entry using the same configuration as the sibling UX582ZS
(1043:12af): internal boost, CS/reset/speaker-ID GPIOs at indices
0/1/2, 1000nH inductor, 4500mA peak, 24uF capacitor.

Tested on a UX582Z running 7.3.0 (CachyOS) with the change built as a
DKMS module: both amps probe, load the spk-prot firmware, apply the
EFI calibration (R0=10611 / 10708) and the speakers play audio.

  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 10431A8F, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 10431A8F, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0

The boost values are copied from the 1043:12af entry, not taken from
ASUS or Cirrus documentation; confirmation of the boost parameters by
Cirrus would be appreciated.

The diagnosis and the patch were prepared with the help of an AI
assistant (Claude, Anthropic), from the dmesg output above and the
existing 1043:12af table entry; testing was done on real hardware by
the submitter.

Cc: stable@vger.kernel.org
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index c50c7e6..d5a9e1d 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -107,6 +107,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431A8F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431B93", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -566,6 +567,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "104318D3", generic_dsd_config },
 	{ "CSC3551", "10431A63", missing_speaker_id_gpio2 },
 	{ "CSC3551", "10431A83", generic_dsd_config },
+	{ "CSC3551", "10431A8F", generic_dsd_config },
 	{ "CSC3551", "10431B93", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
 	{ "CSC3551", "10431CAF", generic_dsd_config },
-- 
2.43.0

