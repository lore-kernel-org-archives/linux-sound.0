Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744833;
	b=v9NamAJSs3qerMmsVrPRnRuauIrn2ODhcRCp/HlTC8J4UyxbUDau8x/AwSD0rX+K3Rfc
	 8Dp9W9zgJ2ql4l4SsIhtlYUcf82St7aPdVh7mGnEeleXLZEAW+9ZcWfBteE8P76uP1RKM
	 HJ/iSnSEIC4r9BC6S+qBxOUedb/+wsqxFxe6HsgNp+TIEBPo2etEUkq7+u4V+9In7ccEK
	 izoyIP67Vp9Z7KeXOU5oeH0+iBMv1aNvw5pyTGw/GpWEGCpV3JuWmMhWxYdVv6POatghy
	 4xXuWj+SNePqdgCIJS5C868pd+YkDuuTsA4kgegd6pLpif1jAmx4WLPdLz3HS7OnIvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
	b=RprpBYfuOnkhXwd1QBDgLzo5gd6qKNeioSVNe3Y1H6QcM5zk/mJM5d7Q4266TpAuNE4X
	 ld5TJWrx+mRQ+aag3HJKIwKKj43fjntZe4GHIN/mPLl5YxlK+YwSXy6jURJ8TGKDVGTPs
	 aX0KvQ1BbA8pOj4b/HE8KZi4Rbv7cGaeYb8Fv8ysZrOS5gNGgg+9NBmg9tveFxjihjTob
	 VGF2wYB4K4mTpGnB8Dwzs3rRIAIUuDGyAUXEbnRvbN5BenU8I7XOLT2rcXvVyXayfqK7z
	 Cl8+1JdTDCtD5Dc3WBy+Cr5YVtlDpAZkdDuQa0xjtfCMYCWwi/o8QFkVzP6TyfRL4jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGQ8AG3B;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5641606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 02:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5641606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGQ8AG3B
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso70488175e9.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744831; x=1796349631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=FGQ8AG3Bwe5SLxyjZUmexfaZ7Sb2KCjYg2hfnIZaeV8Ge7wjeArPLSX1XYayjktdJE
         GNycb9ZOyoq/aeFeny2NBiVXmIN7tcOY02hfy13RbPKpdeVwme3Wxy5zn0jqWcNqHSri
         r0TnNIRmCjlJd2C3WPlS2E4ScczqYtmOxpufBGNjfPxDXNHWFF8IPC77Utn8Sr3UhuWp
         /78x3tyVHM3nFrVHV6lT2XqgxGgLoypVXgsc6rmyKwKTknYketvEEpTK4h5LK+YYznen
         HpawO2EtByX1uxWcXRyeDhAmCVO1VD4GFPTYNv7hnCFGH04/OOm97w3Lo2OrQm3yGmyo
         jk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744831; x=1796349631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=gbWmMtC07YqZxM86w9oFav7jGCnEuxATff6wiIJdWvXEaW3yXYfiRlGIxlhAH28LaF
         AxpM2P+yQysHPm0wtJkJOhgSEUYlUBxPmaHs6Md9Q7YbgVfb0DTJ+GXbLNtJmkW4GtdV
         OOBIonlqV7HJzbYZMWmWcXNK9eNYcAIYWCAp1ANWRoJdqYxnBqorlwytfyipTZgkU5a6
         R4ClWSspLZ/uQu0F8ClZEVIIib+C/AyYJBmZwu6Ni5SAuyRichdR2CdNwRGwQVSWaEeg
         LnI5Lf1bsWKaAvLyq+LVkLNWrCsOMJUxegXff7nnMuNazJqoGXs4M/KrNwT3fkePN8N7
         CcYQ==
X-Forwarded-Encrypted: i=1; AL+hErHj340G/iDFToB+qocbvmYe/zyFSxVV7swV4Jb4hY5tyZDsj+Qoiuu9YhAJarj1KIrLrSWuovpK4nEdzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9AcPaQMKybAv9gf5BqKxU1KQFtDeAOfWQSdRhKUOlUdCSfO6
	ZowEmPFeamdeSIxyBdma4W3G20oewkg9fIt7QVyHv6Pd+fNXCYP7yoy84pRpUMr9l5c=
X-Gm-Gg: AZFdTZfyRlcvxX5f2QfgXhNnE43/k7rYp+GPLJQq6VlwBUsy/UCjUNb7dggGZYRzJR/
	anU02cbK9FRvzYG8XplKlX2olG7gsymSNnAc6ZTMpWNSVskwNpHGS0ywZyVWSGrCeJ2LV/z+fTf
	Z3fXWL30NBRIx7rKEJVtSczf4gPGfMHq8WM5AFSq0LcmY6E3lmlLVW0fe8ub74EtP60DHIZ7TnF
	VQTcUpJB1tapeh2IQdEoLHsZeeHx0LJvtdLq2Js4RfPM9q6F9I2fevWVrCnMxqzkin8DFTQIJYc
	kpg9WYsM9jW4foKX3N48oz8s8nu0vy0PTYSJufofqBtc0Zq0poS4P5c8aXyH06BFjb7vBvhyLpO
	Eacx2CydrSFT8xwk3b4h7PvIv3kHVaAAoKXbBMFGX/NYcJYJqughRJf2E7GFyu5EV/BDwfej8Vz
	MkfXvzKmlzdZF+3p3o/ip/TnHXcUwE2OzUn4h1aDkbZHnEmbzRAgzxXC6hjdQKhoGwSARm/9rr5
	OtqNj6BB68es99QBtENwHsv+kkQr8WkJ1dw60qKroHkgekj1PFItT0k03SBg5J9mUdlB3T63MD/
	tWt9rKQqGPv2LPRbrPBwu6TUctLE4UpokZq7xXBdNgHxAwIuy806od1m28uM/fMGAXLFqI427wB
	Bsh9nbH41ibqzQpAoYlDieMe+8kfjB+kkjJD9zwuqxafqJQ==
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr468130625e9.16.1795744831000;
        Thu, 26 Nov 2026 18:00:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm44994364f8f.2.2026.11.26.18.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:00:30 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone inversion switches
Date: Fri, 27 Nov 2026 03:00:29 +0100
Message-ID: <20261127020029.1618525-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
are "Left HPOUT Negative To Right HPOUT Mute" and "Right HPOUT Negative
To Left HPOUT Mute" in the A23 and A33 user manuals and the V3s
datasheet (0 = mute, the reset value). The driver defines them, but
nothing can set them.

The PocketGo S30 (A33) has a mono speaker amplifier bridged across HPL
and HPR. With the same signal on both outputs it gets very little;
setting bit 1 makes it clearly louder, which is what the board needs.

Expose each bit as its own switch, "Headphone L to R Inversion Playback
Switch" and "Headphone R to L Inversion Playback Switch". Both default
to off (the reset value), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Changes in v2:
- Two independent switches instead of one enum that kept both bits from
  being set together (Mark Brown). With both bits set the S30 speaker
  goes silent (results below), which does no harm, so there is no reason
  to forbid it in the driver.
- Commit message: describe the bits by their manual names and what the
  S30 needs, without a signal model I cannot back up.
- Link to v1: https://lore.kernel.org/r/20261103133935.2892210-1-romain.tisserand@gmail.com

Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, and =y in the A33 kernel
  below, no warnings. On a PocketGo S30 (A33, mono speaker amplifier bridged
  across HPL and HPR) on 7.3.1, stereo path (AIF1 DA0 "Stereo", headphone
  source DAC), 440 Hz tone on both channels, listening to the speaker:
  both switches off (PAEN_HP_CTRL 0xf4): quiet; "L to R" on (0xf6):
  clearly louder; both on (0xf7): silent apart from a few clicks. (The
  test kernel had longer control names, which ALSA truncated; this
  version only shortens them.)
  Before this version, the same bits written by hand while playing, with
  a second tone on the left channel only:

    bits 1:0     both channels    left channel only
    00           normal           normal
    10           louder           silent
    01           loud             loud
    11           silent           silent

- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..e24fd7bd0613 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -323,6 +323,13 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	/* inverted left to the right output, and the reverse */
+	SOC_SINGLE("Headphone L to R Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE, 1, 0),
+	SOC_SINGLE("Headphone R to L Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE, 1, 0),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: 9f961caa18fc4678067232f8f021a23cb1588de4
-- 
2.43.0

