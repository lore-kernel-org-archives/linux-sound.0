Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B233C0A1A
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781081; cv=none; b=Wr8y9B6OAqipXDeIIZ7QpYSh4MuGgAp6IqUbXzV3DqWJUQrsxJ9gp6kT0xxv5YrF7/V/eO78VnI337Orz7XCSBZ4BzB3rriu0AZ55Yz9GEpxwMGDJlY+6LkOlZAguV+i3ExCBN4kogmuLVR7ixgCpwKw8PVK8gMVaG6euKHFjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781081; c=relaxed/simple;
	bh=cWUAkEKedyEvWcXqXWHihLQEc3eXm0hRijmvJp5Fa/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHbwlaeqBAMYjqiAJFZJuXF/ONruvRO++IKO3xJL7fTY5C8NtIaWfrc02lBjVvaCP7MzkqenxTqSzDDYojcdX/k1tfZacdYkTJ+yJUQqkFUFJ9W00PHcuXjMh9h1431yPmRFAxfuRcefxntoVBhpnkhODXwLKRLCh+z2rIVMTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJmpEXvY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJmpEXvY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so386131a91.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781080; x=1782385880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=RJmpEXvYAFo+uLWWX1U3n+jUqqvJeZYwxn3A3VCs78q5XxZgnP44fyeqLFEMm160Ao
         NoELxG4rwIqoiS+NFGr80KvjpQQ8apvfToZHDx153hBrYyx8AGrVTLNu/jeORTQBlJKq
         79Gl6ADLY9TmtXCosmvLVWfnF24z0fOoFIREf+owLCFKwynzgN5ZDU09D86szgunrT5X
         Cd8/QIO/LAXER+PtxhYMC2g9vUQtnW1Gf4ShZVFKhhIv3IRLynQYLQ8heEZ/HudnfMaq
         SbN5FDHLlXUfET1tYqfL2w8w5EnI0oN8x89eT7uEj4lYjaslhZ64mLn05R3WMeViFx1z
         q7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781080; x=1782385880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=lT7P0zx1gjTYVS8yOibxbN6/SYXwbUN1TgZvef1Aa8W+KYpflViy5nRL0npB8CEHnf
         ewCVZGGOeEvKW6beg4SQu0RJC+HbZR5M0NQMQ3cKst8N5z0miuPN0gx73JqfgCHTMASc
         FdWBr/JToaMt6UMiBX9ca04nVon7Zync58D3EohFwo6/52g8SmrWdURqYvc4qwiSN1s8
         pOYYGMI+S7MiazIsmZjrT5M9Dn5zhnH0/0PWSAEh0MAaQTTprFf2KRXyFnSwHiQcgWM+
         GkS3F9U6B9cKtmnmC2MsOqPVATuZnKolQ6u6RvsC9DHbQtqYtcaKUmEdqEp69QNM7n3V
         MEbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TdV/L4cCEG4Z4xT5sR4dkHVjRCYTxGUFhfhDZiQBNvkqroLFI7G4iM3nlWa/v1uC8MRwflVW9KXwKVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoa2m1iFF0IeAj24GT1Zz1DxuZqj88fhauJ+dGnmyZXDbWMaG
	f6HHDxxJqsIZgkO0U71WkAkefMlUzrL03Hac9XwPTN+HDZw4y+xa2ASm
X-Gm-Gg: AfdE7ck2zsr70CjzZflgbDuswGnpzrRdLeNQmltocxbwNfIPRoDgNbUw1WNBy1l+ZPT
	k0/UwSY12+NAw349PldGm755HNE4D6Sgv3t+bGAdZJdadW3e6RyYjLSUn85CZk+x2Z3HckhOpqM
	HdsSljtWf4kHNeIsYDloFS/NKWU8j6wjmlnM9H5nT8rnoFTVDAO/eqPGQtIZe09EWCaIyWTrWj5
	S//kfsa8pBJMlPGBm2+o23PgT2dxPjjugrSxFW6k6hEMEF566EiXfO4VGf85GAprC4ldQFK6RHE
	AYVj9qdZvnjS1Yn9QyfVYCPAyyIQE7yUHlrXkRsQxNDOHNywtMpZawvT8Xqcp0spfFRhjzgQqfN
	9Vu2i0Fhrp86T3pBdpY3SDHYOZPKJ3c0IjOTHXXln6kyjuiyMbAC8+VmA+IiN+DfGOD22am4z6T
	3avnwxjhmMq3kIWtHBvibqiqoXVkMG54Q4xb6yKVcDb0U4f7I=
X-Received: by 2002:a17:902:d4d1:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6bbf99280mr82302315ad.7.1781781079841;
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 74/78] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:23 +0700
Message-ID: <20260618110827.232983-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8962.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..6389990944ed 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1568,7 +1568,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,7 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
+		return ret;
 
 	ret = 1;
 
@@ -1587,9 +1587,6 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
 	return ret;
 }
 
-- 
2.43.0

