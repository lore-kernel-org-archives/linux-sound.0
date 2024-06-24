Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B820330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719209584; cv=none; b=k7JQIn+/r3+2hXBO7Y32GnajQtYFkpoZ5BRLFP8fyshVUDX6aXrtlUdYAK0RVwfK3uQqgdEwCb8GUXeeeFGMiZjKDXGUdn/47hLzn37PL2Hbm1plyMC4F++s6IGzqEp1xMIobTG3lIugn6y5x72jApc4bXPF010MBH5G2gj9p88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719209584; c=relaxed/simple;
	bh=aVHsVqa3Mw1s5TW5A0aHgn6rbR2d5USDh5nbiQUnUzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5Lw4CNM6w3FZavD5NPrlK1GZmnifILUbRJrh1wXZVUl2YzJP7K5AqLalgnlY+W3sczuxLCNY5xYeSQn5HsB/t/M/kFi0xC/bfvRWTZQ60CwChULZD8yuGnbIf2nPHVJYu6Z+G5GtJi8gdLk4r1BEcgtgVha67FTYIXMn+liEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fNTGICP7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fNTGICP7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70671ecd334so899574b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Jun 2024 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719209582; x=1719814382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4N2wMnACbjcCz14LY0USvKoVXrjwARwQKVYyLGYLpXg=;
        b=fNTGICP7L4PPagNQGZZYQ93XSI5ql0aHiM6yphO2C3o/0uIywNvjd/tyBJMRtWcPL4
         5mkafq7FG7jWM9y1LLOekaWfg8JlOD1gOL9HoiqLa9KFnGM4ULhXfpJIEvy3CJeEsXK0
         vEgnV6kWPetAd4uOnEACDPSdXOnP+mZHMds9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719209582; x=1719814382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N2wMnACbjcCz14LY0USvKoVXrjwARwQKVYyLGYLpXg=;
        b=BnKQ5pLFHIT9mfdDtz3t1WRu1/iOC3BMzy6m/dYjr8e4v1bAOArcpTVaCalnezEiNa
         XmE1+M8YxGr8GbYFQWu7FihIgT91o/iIksB+DJY3ap1Cnig/YiAtm9PBcVCxXgz9Gk1i
         vyXu8z65U1yyeF1CClFAMCE5mpppbpV1DUB9SQ3P7YmV0bYauICWTZ/QJtTjapG6lU0C
         1HW+ZnaNO6Kq/0l4EEIARrykSJh716IT0bKMqTj5NV0c6zNc4eL5uKecmadMH3wZZs3h
         Ve4+CubPvm8nP9qYhHSDDfErBrA9vMauN0SZEfGkUblBMHGefjV/fpY0fNECm7jBaWpV
         2edw==
X-Forwarded-Encrypted: i=1; AJvYcCWvkw/iaWKDSccsnK9A+Cw2XNazZrCDTDnlVg/mpjf53LnW/x4a6CPU9/6JV1ecllqjLsNMZD4/U5t/bUnDVAZVXQeoxzBeVx90EA4=
X-Gm-Message-State: AOJu0Yy5X3FqyoUpSG1D/tGj8IL4ZBs8CItTR5ge+nYL3yC+zahNwxc0
	ZVfOqb0KZJTmSQcKuVgKpsLGSnACA1bSdHh5q4DmXV2mrAHUTYQq5fD6OlE8Kw==
X-Google-Smtp-Source: AGHT+IH+UlRR3GoF9E4C1DBHIOVlzoOCBHgWIsZ6epuQKT65Zpk0Nz9eUaoHFwng5u7QIXrd2vEFwg==
X-Received: by 2002:a05:6a20:c120:b0:1b6:cd8e:4a5 with SMTP id adf61e73a8af0-1bcf4479e51mr4136921637.19.1719209581937;
        Sun, 23 Jun 2024 23:13:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:62a6:1858:61eb:37a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb5e5629sm54687965ad.220.2024.06.23.23.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 23:13:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: mediatek: mt8195: Add platform entry for ETDM1_OUT_BE dai link
Date: Mon, 24 Jun 2024 14:12:56 +0800
Message-ID: <20240624061257.3115467-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component
and rework codec link") removed the codec entry for the ETDM1_OUT_BE
dai link entirely instead of replacing it with COMP_EMPTY(). This worked
by accident as the remaining COMP_EMPTY() platform entry became the codec
entry, and the platform entry became completely empty, effectively the
same as COMP_DUMMY() since snd_soc_fill_dummy_dai() doesn't do anything
for platform entries.

This causes a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
in sound/soc/mediatek/common/mtk-soundcard-driver.c:

	for_each_card_prelinks(card, i, dai_link) {
		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
			dai_link->platforms->of_node = adsp_node;
		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
			dai_link->platforms->of_node = platform_node;
	}

where the code expects the platforms array to have space for at least one entry.

Add an COMP_EMPTY() entry so that dai_link->platforms has space.

Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Reword commit message with more details on how the original commit
  got things wrong, and what this commit adds and fixes
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ca8751190520..2832ef78eaed 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
-- 
2.45.2.741.gdbec12cfda-goog

