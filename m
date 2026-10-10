Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D79440A21
	for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625308; cv=none; b=edxvTrEzXm8q5CFi9dzHZA33AjsOLyJ//hiMIIiSLxwQxpbuIUuL8OHbX39LwNQig2GEZPjMbmAFaV+N7zFmEzGWN0Mp4fMVvpgw+rXEhi5tR/X0lASjP7jJj5wgoHy/Om8uRXhT1yxp76GhCJ83mNceHXdOOZX8/notOpvz+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625308; c=relaxed/simple;
	bh=xBeqqLT7elWi58n41kulxhhvAG5qnuXRXLnSEyY7YR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWgDfLbOwfl8PN3vtFK0wJ77uUHj0E3qlHvMm+GOe4gGNN+pKdIYpFuA6PHsAX0/43h/tlQtr4ZEhdGcV3EueJHAvSyOOMNsATg0bok0nPW60ETQT0vvn1lfINAgcL+bPYoW8hmtS1Rj5VCxyEkK+Uo4dY0bjWTvmRDRB2b0TNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0VLvsAr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0VLvsAr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so240296f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791625302; x=1792230102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kowwCp3jFUT2VWOfhdrYm2xKuy8ZY6nma+3X6Op/3n0=;
        b=c0VLvsArDMISzvY68D4l+iraNdGQy8fH5/IqGxRnFMtTd7FdvfiGjFOqOm6lt5Fiyy
         EaO2rBFgjRNwEkiziDLavxL1gDjCzvshpxFPVBZNL1VzWNAkvckQH4fN/VweCd2qzjOn
         zZnjYHiHto2eirMNcEfzH6XBD9u8xhJ9gDWJQbteX90z9X27VOGxQ1Mcc9V63yZCYt6d
         fvuiCTlU3rvXkzS3E0eo7ySjMSqbp/GC0M+VF9PBynWnMSP0nAA5ynNX3NLF4vjQWVF/
         GD4WhNeX384loR8U9Dk8o+X6OhY5b8AooEnafeWwVqBbkooqewtyVGxyf0heZrgXrJvU
         GlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625302; x=1792230102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kowwCp3jFUT2VWOfhdrYm2xKuy8ZY6nma+3X6Op/3n0=;
        b=Mt+UKzWXv6pI52kxRD/5YFTlo7XN6hqKXhDhOg4HeV6X8vP+sfggKwvuIevrg220M9
         wBDE9zyZcicGvsg5OY36D42N0IINJrsUxIRiyC6U23KrHfVHwbd/ELVAVfPQP03ZXUTz
         vYlClgyW58Zl9geRSN6XEXsOhher+r1dUZOs5OPTiqHWrNTkfTyQ2lS6LBin4jenvbsN
         tc6Z6HFPVyNLddObTZQ5KqADDSGZ8OhymVKt/Dbo8QbcomzE9g/ejb+0fusEjiWHlLbc
         w2Ldubc1yfwdaBr8zyTaIRrefQwLVyzSm/IEJliJZKyvH5B2sN5Fxj55G8wzwTNU8U1y
         Zp8A==
X-Forwarded-Encrypted: i=1; AKwUvBx/EJf4aZ7IJVBnHvejxKOB9Ng7NNpvgDVJimYg4ln7e6M8Xl+eb5VFztWKUqSQBWJ2FTXQk9ZfOrn+1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGW8tn9+enTW4kdNbc/yWZO/aOzm/FLReofTGQnjAVoP9iNXzs
	vU8KbdTRwbKSruqiEjUi/HReahSyQcnqw2/O/MfAiuS5eHRa0kT3PPcA
X-Gm-Gg: AYBFou3RhpXfFLAANbxJiL9WWLN00T6HGL73+ut7oSSnqhMB9h2kQSZWouvzwF6X70a
	7reUtcN7Cr02hJ0WDNgbsueX0DqzD5pL6UgFCQ+i9iyedoda45URtILgEEshFtt+Z7o72moMVNs
	EHDQz64FE922/wvCRceGXDVMGQo6PmUDFR+D4Am0Jzqa5JgWLG+4q2tykAz5m4Gq0fqNxnC90co
	KSkAwiMd5kQkmsM+XOktPZ6s6BpUtWPxQeAokXPMcMGhVa3xuDokmDXUGBZ9wMCPwnQvsRVzNKE
	9p+tmRLgree+JB01b4OnaxrG/D9Zj6Z80A+N5ERMStrTg5PsnGHLu1zFlagT51ubS/jqYLJjnEk
	sCEAKYvRmZkwciyKZ7Hs0tbTLCHzhjeCMWNzkdp0FrSdmjHHoRIqFg5+0gPwDzv68m9JSHk1alL
	+MwwTg2a8IB+kOeGa4DxsuYxSYtNi4sybS65y+q6wp9xpet+Vt1PHvaVy9EETrp6DdPPcDHjUw8
	7B0jn2EDNOGx990lgZ95wK+mNAGQ3rGe7pQnFIeZoA=
X-Received: by 2002:a05:6000:2285:b0:48b:119e:dc71 with SMTP id ffacd0b85a97d-48dba7816d1mr8309124f8f.5.1791625302084;
        Sat, 10 Oct 2026 02:41:42 -0700 (PDT)
Received: from localhost.localdomain (pd9556620.dip0.t-ipconnect.de. [217.85.102.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm8902358f8f.8.2026.10.10.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:41:41 -0700 (PDT)
From: Yi Tao <taoyi.sh.cn@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Tao <taoyi.sh.cn@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
Date: Sat, 10 Oct 2026 11:40:55 +0200
Message-ID: <20261010094055.49308-1-taoyi.sh.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
References: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MOONDROP DAWN PRO2 (USB ID 35d8:011d) exposes a UAC2 RAW_DATA
playback altsetting, but ALSA reports it as SPECIAL without the
DSD_RAW quirk, preventing native DSD playback.

Add the device to the raw DSD quirk table. With the quirk enabled,
ALSA exposes DSD_U32_BE and MPD 0.24.4 outputs stereo DSD256 through
USB altsetting 4 at 352800 frames/s, instead of converting to PCM.

Tested using snd-usb-audio quirk_flags=35d8:011d:DSD_RAW on
Linux 7.2.6+deb13-amd64 (Debian 13).

Assisted-by: LLM
Signed-off-by: Yi Tao <taoyi.sh.cn@gmail.com>
---
v2:
- Use full real name for author and Signed-off-by, as requested.

 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3afc495..3652765 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2554,6 +2554,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x35d8, 0x011d, /* MOONDROP DAWN PRO2 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x36f9, 0xc009, /* XIBERIA K03S */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x3c20, 0x3d21, /* AB13X USB Audio */
-- 
2.47.3

