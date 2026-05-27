Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681873F39E5
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884681; cv=none; b=tD9/APAq1KVwTg+WazjcC5SIqw4bgZO+eQujCDzyBqbqtfbah4Bqj6+BAsA5wiD6DL5mBevvnxFsPXT5Q/NdXdvA/MfLfgPH7FwdnDjT2xQU1GYeqSXaePj6QLvu8Gh6nM9MQwGwr7v5gb3/Yl4fGqjc6SSFzMdIvt30KXDZFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884681; c=relaxed/simple;
	bh=WmNLABokB3U7r4YTithj2V1LL7b1vuU96MEc5lB7hD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xg8f3NUVqJNcQJPZk0pkn1Rv/NxLmpbUJQFjfD4srz3R/qrFj9fACSqEaKZPL5y/6aECpRAnOaR0rlbcspZwyvfkODi0byYOYwArs1Kr35JNnvpeEF7haScyCCvAF/CjJ7eWeVtI3wDDu6mrznzwN3GzwwTZIVNvBs1t88cVaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7O8wgg8; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7O8wgg8"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1363e78746eso7280002c88.1
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884677; x=1780489477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnLJl2Nz2UhH+yw0FVKpnTR9qS2A3Q99wYvN5nGDrB0=;
        b=R7O8wgg8N+I8K7ylSsdLjoET99Kwtn8kKeA3jSiRymqbt2oGdIPLXOE+qH+UPmd8aJ
         ZFXnkhf4p55YfYg5LmSr552FwtVrwKiQUEPf04CBiskSZ89EKj+W7Y3quvzRpyxR7m6y
         UO2yKLLmK/IdI+iy9EFowoaTFLcLRLmg6hi88oOn1ht3Hh38uGv7o4B0w42AkFuVXE5B
         84FmmuWWyBV0aUxOKOJcVMMnLFM/csLDtQPTVxsiBJZ1N3x4h9RuLwyu7nbkoJn+SB6V
         /IBt/OUaJkP5JvGAVtWawCr6RIZYKBbNRLD7NPv6RLp8UnOfPVBAV+yHMPrzXmamXtiA
         6POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884677; x=1780489477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnLJl2Nz2UhH+yw0FVKpnTR9qS2A3Q99wYvN5nGDrB0=;
        b=iw91Lan7TYN/xVM3eErezOlBLeyUak8SZ9iZl0jEOLHNg/eTbaHTtvfanZnvVtez/1
         h5IqceZ7zT0BjUyOwUP6mJVp+CImN3gTCs1w3FlOm5brSVEHB/OyE66MIoPgBgBZifCJ
         mQORxJLtx6zc0quI3R07DlN5esyMBIyP7Rt57Jiko472ITYzHnrsPqou6Vz6uVcG8piA
         Z5sEweMHrhGysxBzVIQsbmDAlr5CNZec05DmEw7IJSe37tOgzTj1q2p37M8D4CVg+dOH
         wZtTWkscTCDnyUBxOqc7uCVPSAP042sa06x3Z85el+JgquomRYvmXOZBmHlf/czfqj+q
         uPJQ==
X-Gm-Message-State: AOJu0YyAXfwmpARd8vJ1GB7VGpDkBwgBq85j7oF298ezNvxeORNbbhVg
	4U0mnStx4i/4+mc4JiKxd2ndIgRLaQKUvWxDVRcgNVCZX/W6oTPllJDMfVQHxQ==
X-Gm-Gg: Acq92OGip6MYIS2UzemG66jUVQOPQwmjfX4kRkvfzcuG2Z/hHoNq4HOvuVyqRvDMJ+i
	s1RVFtsLGrkPhBcGku5wtfl5BQ2a7rpsBTAkx7TZ6bYWajfLBRxOK8JPZcqeDysOt7dkrXOMO6y
	zoQ8pNewoYvU8gbbF3DDmpCHafkR+lIFWXrWpAtaYZf7LbUa6bvgf9JSKcnGCipWa12m1FebEAV
	iVibBDLsHKtXxP5fSE+NSmUQ0PCdczC33MrcAfoGK6lQYdvBCDQh7D9SkAivis4NOLHZHCulyA6
	09jHJMLeJeCwu7Jq+ZHnCKNuzEfAA+LCByNBQhQ27VPzK/eAknZ3u7fU5wJOoRgJGBBPmeGZLry
	HH8KxqgyEjkgjZYZVtRDogV9BiERwcts/FYs1c1SooNlMtDm7Nv2IQ9TE814GnBkxU9xn9aQNGK
	Ht2RiYmJ0KONOLXz5F+rjXa0BOEYwD5E7spR6oKc4lBJW9b32/S7dVWUKg48zZcfV57K1hY069U
	sRdJaCkAMvo
X-Received: by 2002:a05:7022:60c:b0:12d:b329:987d with SMTP id a92af1059eb24-1365fa3828emr8497059c88.24.1779884677118;
        Wed, 27 May 2026 05:24:37 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm8539711c88.13.2026.05.27.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:24:36 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 09:24:00 -0300
Subject: [PATCH] ASoC: codecs: simple-mux: Fix enum control bounds check
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-simple-mux-enum-bounds-v1-1-3f805b9fc671@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdukTofRXzEeYCtS4zayOkNC+
 HcHHt/lLaCchRVuzQKZv6KSYsXx0IAbu/hkFF8NhkxL1ljsNDlUCdObMZQZOZaAfSrRK55ouJA
 3nuz1DHWYMg8y7/v98beW/sXus5Wwrj96BlASfwAAAA==
X-Change-ID: 20260525-asoc-simple-mux-enum-bounds-30f70d2d0594
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WmNLABokB3U7r4YTithj2V1LL7b1vuU96MEc5lB7hD8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlij5qyGkwZ9rA57H8ZP3PpwoXM5f//M4ad8WQ+cTpS9
 fVXrwmHO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAistsY/inv6WTewqsgfkvF
 7Wtwgnu7c/Uco9Dfh57nrnjrYXxIVpvhn25kXkTit1vnr0yVU95y1+BVj02Dgp3HKd9cg/D+MDU
 2LgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

simple_mux_control_put() rejects values greater than e->items, but
enum control values are zero based. For the two-entry mux used by this
driver, valid values are 0 and 1, so value 2 must be rejected as well.

Accepting e->items can store an invalid mux state, pass it to the GPIO
setter, and pass it on to the DAPM mux update path where it is used as
an index into the enum text array.

Use the same >= e->items check used by the ASoC enum helpers.

Fixes: 342fbb7578d1 ("ASoC: add simple-mux")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/codecs/simple-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index 069555f35f73..c2f906a3f074 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -51,7 +51,7 @@ static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
 
-	if (ucontrol->value.enumerated.item[0] > e->items)
+	if (ucontrol->value.enumerated.item[0] >= e->items)
 		return -EINVAL;
 
 	if (priv->mux == ucontrol->value.enumerated.item[0])

---
base-commit: 53eff7040f06ac4670b5d4f01980f9b2695e0a51
change-id: 20260525-asoc-simple-mux-enum-bounds-30f70d2d0594

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

