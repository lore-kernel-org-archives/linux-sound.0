Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF503ADBAC
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544966; cv=none; b=tsgO2UsRx+/iFq8Zp0L+RAababB+Y8pAmTIAceE4jCfoOavn7coJIEhAsbjLDTbArRtZ20Z3TcP6fQ1rM27MtIlw2qXOqXKOv/A6wTRseanxbBK94hrcd+ZOUJ849p4Pw2VIDkHmfDP9VCyOySXvlXR2QRJJwIUANQUFx2DX44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544966; c=relaxed/simple;
	bh=boIn8KgK5PRI6J0HhSMz6lPxr3UKsW1nRa3yznbaAQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPbAFGkS1+NkR6aE2wEHXCh3W8VrKioqOKaekMSqvXadSgwqPxgMeyhK78BYKpriw84cWbYLfYb/Mue5BHQUOR960WWo5hQXkGOLFsNbgr0uYXRMCZIxfsSEVLtN55Ec/0ydFvWWHYoUF7mWCuHS5sU20LD09G2gq4P0bzNKZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXtoV3dj; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXtoV3dj"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e6279a1d7so4955619eec.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544950; x=1792149750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CyIZVoXOz6gOWywHaJMWqzxz+SCTg9brEP9p+6ifWQ=;
        b=fXtoV3dj1Mpf43vps6ofr94MnQlTbg6/HxFJTQqfFAtt1nsBrQwwlkzHAiG/6HWGep
         DOkx3V8numV/4l2Gf2bIq4n8UmfIh/sSAX0F5x5k4PPNeNe7QMeUjMVkjLGcVyExdZY3
         2+gzkXCeuV1BDKUnHhR0jIc9fpUyT8eOhRgUOZlYjETZVVeU/iMbH89rGqnUiIV2N+9J
         WK3Zg5ezc/NOi3ntqKVCXtMISDSKJFpOyyrF6Vgw5ojIJ1SGcTBBDi9poP6KGUfjY7n0
         V0TNuafqH4HhsAGxuN7qHybqYt6otroeW4jz0DPdv34hI7CxkNK12nG3pHELh5ssy23x
         uNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544950; x=1792149750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CyIZVoXOz6gOWywHaJMWqzxz+SCTg9brEP9p+6ifWQ=;
        b=iMulRfkiore/T0NfYWIWzPtLe+ZXwktp2cEJEjmg1kWd5PFApyoUR8CE/aT1uOa71K
         t2naR4R5Wot08wJqcBVXwEO3zu8ELmygB7mmfSR7s0jyGOQNh+D64/mIzg0RpWde0/pX
         YTcVp0IVQARtBFO6nLdUqEhEehLpl6c5iU37C0KCTgwxT3vhzhShECgZhbNtMbTAMwZx
         sqMGsag06mUcZ1/uFxV1MJeuHE8h+5hAMwl9hl3q2vWjPraot8WWcvNeaZk/oSuMh/vz
         NLD9z9+T9uzqgQEv1Tzmlpm//lQpfZ+jdHkkG/nC/sIaKmTeo2W6F/fuRUTcqyChEryB
         1kJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0dGVc9tXT3JlqVitlpJ47XKFUQgIv6Z6r++m4R3pBQmRe8++2PU5FNWeNrflR7oHMYkaHKVxfrtcdbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lcCj5JaiONEmbzG0dmqrr01L21iPnkBCjaOp3eGKc+57waeK4O
	kZSHwEU0Qsjbvkaa6OzqfXU8Q8GLSRFwN3qD2N0lDH3DIbyzHPMQ7N4o
X-Gm-Gg: AYBFou1F6KPSunL9j19uVZ3QSayF76ZSksLkxekhSfrodwwGox/NdaVl2DPPm1lVgSB
	Wp5PfY4Ai9xjpx3dpeFNvFR6HJ9T2FJf8Bpnif7I6zARTdylHTEbckUqwZlqcSPwSsXnVlDbEC1
	OVhh65/CGmhZ0R3pV8uw4Nexew8O6QwLA5v/qLy1u9m49eYQgxk7vYmrzrLSfwzusInem79iptY
	CpSop/IjY4IYS7TOfc2Hj5AW5ZGedxKldoy+MsI7r+AA3qVK5QEmE5D9PcehzVE1us51F8MNquV
	aJabbnCdgvIlFfkIYzuciBbWACSALr689N4Q8Vi5HEOzBzcny3g2aVW9sWo8FzrrhV+lhN1JlNX
	4KvS6KVaRbzgq8HQpdZ0VhqGBe8NSjzqxCLUk+kuf+D8dTjFp2noWiPXqb2cvGA4BPdaJrKa35x
	a/4y6foCI4hebhwn6i9ig8qbrllDhG9faOUY+N5ZeE49ey21tcymOtkP5Pl59uhlVBd67oPW2vG
	zuW86yACGF9USqF0ri76dKNaW5CrwpOPHwpUQkf/qwEm8zjye1f74RamEBXHu+AAJZDg1OLNLUO
	AWPPBRWk5VFCQw==
X-Received: by 2002:a05:7300:e5c2:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-355cd687760mr515014eec.33.1791544949795;
        Fri, 09 Oct 2026 04:22:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm7258752eec.20.2026.10.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:22:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: codecs: rt5659: propagate GPIO errors
Date: Fri,  9 Oct 2026 18:22:04 +0700
Message-ID: <20261009112204.33199-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009112204.33199-1-phucduc.bui@gmail.com>
References: <20261009112204.33199-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return an error pointer, including
-EPROBE_DEFER, but rt5659_i2c_probe() does not handle these errors
for the ldo1-en GPIO and does not check for errors for the reset GPIO.

Check the return values and propagate GPIO lookup errors.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5659.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89..b40dc9c50139 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4113,10 +4113,14 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	rt5659->gpiod_ldo1_en = devm_gpiod_get_optional(&i2c->dev, "ldo1-en",
 							GPIOD_OUT_HIGH);
 	if (IS_ERR(rt5659->gpiod_ldo1_en))
-		dev_warn(&i2c->dev, "Request ldo1-en GPIO failed\n");
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5659->gpiod_ldo1_en),
+				     "failed to get ldo1-en GPIO\n");
 
 	rt5659->gpiod_reset = devm_gpiod_get_optional(&i2c->dev, "reset",
 							GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5659->gpiod_reset))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5659->gpiod_reset),
+				     "failed to get reset GPIO\n");
 
 	/* Sleep for 300 ms minimum */
 	msleep(300);
-- 
2.43.0

