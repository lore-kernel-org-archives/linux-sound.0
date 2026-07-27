Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC83BFE26
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130705; cv=none; b=mD8cSH8kN2P+zCKuFvxaoIVA6a9JsVoPn2FQr7VccDICxPZssETki5TkNvWkbhc1yNogGM8l4vixEErMbWo92LYQtYjRj5ep5CzdEN6noLkB2a5NMCnXpx+jOGfiPg6rm+HG1mo6ambbyieRw1hV5nJF+Vd9xMng22GavluuS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130705; c=relaxed/simple;
	bh=+vBXGL5Qmm1AuGKfOAsWPt3FJ0ZCDsiGjZ/nwsxEjgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6xLA+EQhG68CkWKvYjd4UWx+mqF0yiDs8iTWolVuDhC8H+FJr7jaIfYk+98Lpqdei8giBPQ+VQqNZgWquXdxSx0E1ZuZJPGMYuADsTke3RuEUfmF9Imin0VeHiXO8aNPEYRyBKHgkQEgNM+u1NEFkbBILc/E0tP4MpVWEBUdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG99ACrW; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG99ACrW"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2243412a12.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785130703; x=1785735503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpWXph0J8fUQSdlw06rECtrYKyk7NejeUstbb2WBrtE=;
        b=nG99ACrWqFiiYj7gumsVo6HlRJ6Bg/6Cco2CDALZsjak7bX3BRV6xFyz5eIgEuk0xP
         dZPBZ5it0Wwk02c6gtA90sWTWTmVxv5pCnXXp/t2YYMJ3r2jJ4bnJlr0Hewo06yeEzvi
         xLS+q7x4C9nejecaTk9ROHFM0n0KMQXJE5Jr/50nUqS7uSM7S4MNhlCXSbU3k0DuuON/
         jv6+jgmeSDd2kDdcldi/feg12VRwJurVaeD3epmhK2DXSEDKwlfeD/OKfOIRv/hBb6c5
         ipXiaxnBKZjw+kZjomJy5K24eJX+kTkmNpjQejCRkhLhY1zm4/BB3/n4qivJfAnJ7RBN
         LLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785130703; x=1785735503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpWXph0J8fUQSdlw06rECtrYKyk7NejeUstbb2WBrtE=;
        b=YbLjXAOFu/sAjUSNa31PpzJYqaVT/kZKZyD+9QZR2i87qAu62/W34zHBcMeOJBxHGX
         lVBsrbOa+1MfT7liwnYniYB4n7HlrV5Sx5RLsDuFWxnj6DnN/hyYHnRxKJasmXj5/k82
         S0liPdTSX6wbqh50VyT/LAvlTttMPmU3EEOC7BskGur0/5NqJbSw/NYr4Y9IjrQq8HXx
         OwoRL/bB+m7+AC/gl2wSsHmObAiLN58YQDJgSEDJZgB+ko3H1CJPJbSr5n50zKVoSdJf
         7ok/aocLGAs0gkH3uycQAzMZpdRj/WApJgHAgaHLZ8syzYKn2WQ+43oITyt8ZUJPtMWX
         91SA==
X-Forwarded-Encrypted: i=1; AHgh+RrmEi1k1mNvZNZWmTO/hr/zum+N6pjoDK+w5UsCpou/GiHKp/IB009wyR197aEsBhWqq30B7iL/Q6Pj6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11Z+VHr/WWn2c1QeonnBhYPMBoD6UyNAutkasnpsEKpw5Paj2
	qire9erylnKOfDhAZivBuRl020L0WcstyIV7didToy6cvJAfLkXZb+84QdMvENs=
X-Gm-Gg: AR+sD13JgxdrEwbDy4EtzIQT+tAramzDna5LAR2KYR5ztIEqke1aH2WBa3K8cS/WcAg
	1ujqv/at/+rfaC0sryWBcaJan9BZhoLlsRQCTQvJA8Rcg7KicnmEMVLqZBY87ThLEV8jklf+UlC
	o6xN3dFkryuflecgrh+LkStjr01nshMPqEmX70ELBgd35+MRru+oWfOMmTQtmKoTFO34NWSx/n/
	rFin56u0mPkkYpI4Srik9K6/V+R0uuYr1rHlw5QQuaKpHtDsPXdsfRvzlaaqLwWoqDsERT7MKeG
	buX3hoYOUNAm0ti98kNvf7uBY29ChIB7odCcj6k6k0DSOnDc0K3M2Z3Oa1PQMSapbEutacvUnaC
	skhzF2pr6w8g2hkIjkgIBB7NP8JnrhgWpvYJkOEUXOyjLTNuxPi+hamzCNZiKwi0Natd08buVSM
	Q+X8WNrXEww0debwmew1wcD1jEl8A=
X-Received: by 2002:a05:6a21:99a6:b0:3c6:3c5b:f32f with SMTP id adf61e73a8af0-3c67e0b93b9mr6666205637.51.1785130703323;
        Sun, 26 Jul 2026 22:38:23 -0700 (PDT)
Received: from t-rex ([2401:4900:adb6:bf0f:a138:df81:8865:91b0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm27967430eec.15.2026.07.26.22.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:38:22 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: stavinsky@gmail.com,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()
Date: Mon, 27 Jul 2026 11:08:04 +0530
Message-ID: <20260727053804.25599-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

cv1800b_adc_volume_set() serves as the .put callback for the "Internal
I2S Capture Volume" control.

ALSA mixer control callbacks must return 1 when the register value is
modified, 0 if unchanged, or a negative error code on failure. Returning
0 unconditionally causes ALSA core to assume the value was unchanged,
suppressing SNDRV_CTL_EVENT_MASK_VALUE change notifications to userspace
sound servers (e.g. PipeWire/PulseAudio).

Fix this by comparing the new register value with the existing register
value. If unchanged, return 0; otherwise, write the updated value and
return 1.

Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 sound/soc/sophgo/cv1800b-sound-adc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
index b66761156b99..bd93e261bdd1 100644
--- a/sound/soc/sophgo/cv1800b-sound-adc.c
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -251,16 +251,22 @@ static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
 
 	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
 	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
-	u32 val;
+	u32 val, old_val;
 
 	val = readl(priv->regs + CV1800B_RXADC_ANA0);
+	old_val = val;
+
 	val = u32_replace_bits(val, cv1800b_gains[v_left],
 			       REG_COMB_LEFT_VOLUME);
 	val = u32_replace_bits(val, cv1800b_gains[v_right],
 			       REG_COMB_RIGHT_VOLUME);
+
+	if (val == old_val)
+		return 0;
+
 	writel(val, priv->regs + CV1800B_RXADC_ANA0);
 
-	return 0;
+	return 1;
 }
 
 static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
-- 
2.55.0

