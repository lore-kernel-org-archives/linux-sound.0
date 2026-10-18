Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257CA418361
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306084; cv=none; b=fQuB9A72nkn65Z+3G3I/bYNfjrpKL3Sd2ktqRaLGn5WJn6BvbG/jTJerjNcHV7LKb4Aqaam+9MFJ4/1/uWxGeR/+8vnaxVXASLvgYFRMD0j6o6Ny/gUlrUip/CD580jIk9oECs1TYa4o4gxmhW8zNuOGdh/8ZfVs7APL60oiLfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306084; c=relaxed/simple;
	bh=iAQVZOMW0+bhS/cf91WaZ04ecjIibbvlCOaHvWxii6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxeLDwracJZqlmeHEAohqv8nTsr9oTpvJH9fBIrvXKeGOr+hqB+TtO8YbwbZL7fr6hQJ1mf76a190Gof6GpCRc78ZXT+uOi6Qh8c2rINTc8lfm+T4Ekk3hcqmLh/MVQlESs9aLaJ3yUx6ShzkDg8pkOaIfbVG0m/p6Uz+ViIoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1C4OxIn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1C4OxIn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8b20a899fso4836325ad.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 23:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306082; x=1792910882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Q1hldRStoWiBDf2EXexTgdIyIEGJ6QyfYQsG5TRVsk=;
        b=O1C4OxIntsBRRma1DspwdgZsTGU7k4GWX/jNt7eOFUUG8gyv0iQm0RughEyXb3aPJ2
         GeOOWo+QiXDmh5bVU0IkwEWSMW6N5wC4a32ZpVgdNgU7OZX77SK3X3VZU5RKA0vFg3Rs
         qtbMLH2cZYjqiBprrm+AuIOjEXlwotGupxLMr3+ctPEyW/WCp+ddpRECHIRjIjGvQY89
         KYbg65W6xnDca+uuo7YTMSzYbNvnezzAWXL+B5j6FWdDVqBTqSZlUptITYjElGkcSTj2
         JIP6u+GbyO+iVeZrzVLGBrAgNFslPlPdPCkorVlXWw/FaWB5qjxJTvgxJGf3iqtu5auW
         GvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306082; x=1792910882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Q1hldRStoWiBDf2EXexTgdIyIEGJ6QyfYQsG5TRVsk=;
        b=p54u+lOAiE2YIIQslk4XOO6lp6oE9ViUIvR0x7gEgVzWXDYX7XOCYxXAKW4VEEfH20
         ES+TLhGy2PqbYq4kc5VG3TjEztUXVGwHrjeOxPcfpIIBX5Jnr/orrQJwd9E/PbxeMnmy
         OHetJlgGlr1M67WLXZtaLq37lxw/IiueL5H6JkVuObxbQtvDGb3aRrUHqxbzdpY3h0sU
         GrSv9+w0kpEikiUfcq88qPxfXi2S++5ww/XWoH79CV0mkOZjQ9Nrqj1WWkZHF3SqArNE
         1dlMZbSTzpDvwSDHTQSboKV36P73FnJShw7pKQ0GDRHjSenEzsqE0ZYM5nQEOJVQiWY+
         4oOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG6NfDK7LyjiDywz3/SMduDgKf7FN31YBw/wx6/VD43X67fj7AkGDASbNN+d2Gb54IUnVwmWrX9nwe3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2hTN2PeaWl6ba3CwvFS23OTHV3wzzL7/j0PbrWh4UQHlcxbFG
	E1iKuGFcMe06gbUVtyMooYtM3/cg+CwwByjat+8AJol+4AW2HqZ6RnAE
X-Gm-Gg: AYBFou0NhhMjBJCKW/jjoO70Qa1Bh+DQ/lqJlkorOkIkndQSAThDMAY1WkgF9QnIhk7
	w/RqqY30S4VcXam+Te/42yQnWr7miuFfgIVSKuxuIQ7noQpW8FhVnAkpPwLtpLsimbzmT8GyN8T
	jXuMt5rPDNUHp1O/k78NPgWE9wPDK3JJq4yUx5CPNZluUi6lxUWy9t9VSKKtTu4WIUawuxf1pYQ
	UuuLf1xTECXxgMmgAcqvVqjCqblLorGaAJq+jD8/Z+c6BMtaPSUb9AkE1oTl6KMQUglffDINyw9
	mX3h2wiaoSS53clI0D1A3/BI/wereJSY8YIggbWGVDWrVs8sYmNVcRTRnZ4qc44p9beUAPkLec9
	v/29njk5ZWXKEMrgPwz5sW5e0eE7Am6QxDVlzNWSGTz0K3hJyrVzHXtY/Gg7fqTdBi1Kdq4oGD0
	zkoZwiaG8pI3v6L11Azd8nPStAfXMUdxjllMjx555hqlBCC6IpF1frd9RlDdyHjGFDYVMPX4CRV
	WnuYNLTaCsXLnO4lWOjuXr+MtFXMzZ/gWBbK4u1tHsPSfXQXY5oyeWwg8mCCk4v2o/UOj0r6Lk=
X-Received: by 2002:a17:903:1251:b0:2e9:66c4:1711 with SMTP id d9443c01a7336-2e9a6d40eecmr36944135ad.52.1792306082373;
        Sat, 17 Oct 2026 23:48:02 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:48:01 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume control
Date: Sun, 18 Oct 2026 15:47:46 +0900
Message-ID: <e50b88689e8efd353ee597a6692ab4db30aa63e7.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TAS2505 HP volume is bits 6:0 of page 1 register 22, not of
register 16, which holds the HP driver mute (bit 6) and gain
(bits 5:0).

Fixes: 2169d6a0f072 ("ASoC: tlv320aic32x4: Fix TAS2505 volume controls")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 sound/soc/codecs/tlv320aic32x4.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 7fec94768afb..2ee4a9d2abf2 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1057,7 +1057,7 @@ static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
 	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
 
 	SOC_SINGLE_TLV("HP Driver Gain Volume",
-		       AIC32X4_HPLGAIN, 0, 0x74, 1, tlv_tas_driver_gain),
+		       TAS2505_HPVOL, 0, 0x74, 1, tlv_tas_driver_gain),
 	SOC_SINGLE("HP DAC Playback Switch", AIC32X4_HPLGAIN, 6, 1, 1),
 
 	SOC_SINGLE_TLV("Speaker Driver Playback Volume",
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index cfab6f8ce5ac..d0c2e1002e99 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -94,6 +94,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define	AIC32X4_LOLGAIN		AIC32X4_REG(1, 18)
 #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
 #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
+#define TAS2505_HPVOL		AIC32X4_REG(1, 22)
 #define TAS2505_SPK		AIC32X4_REG(1, 45)
 #define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
 #define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
-- 
2.43.0

