Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF43264E2
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779849338; cv=none; b=rcstG9kMxf8NOuM+MXPbXeY5viwahsqLgkDnGYHIcNlaQoh51vHnuZyumR1YEUbabw+Is5iESOd8HkS8FY0CDlHApYgT3tbGyIju5d0Lqg7skK2Gioslqf3dVX0LWMGSv/cvWVMCNFCyK6RETd9rItAH+5MnXal0KLfN8FimttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779849338; c=relaxed/simple;
	bh=nm62wdyRUsPnh7afpo0oRMnyC1+6DBCTz0thwWzKaMY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PVmMKIcEgLjSVa3wYAxSMCM9/qYYIzj9A6/lkJ8M6PbFlGcGaViU7xwU+y7v/PZrNuGlzZDGMcpjF3rDsaJXPxdsSs1d8tel2ABVxoZfKBDuSWlHNCU+qYHdq7Wfu4Y+hGRGueubD8ea796dziNMD/X34vbgjj8Bgix2ZM/Jjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnylin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMOd/tNQ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnylin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMOd/tNQ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so6612982a91.3
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779849336; x=1780454136; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3P1l4eUt02McJdhyUEG4hjmyRVE1na3oPwo8Mld23s=;
        b=pMOd/tNQrlRRkNNR31dtdShABokgEU8lHwGf7fYHvs9dyvlmmv20j+zrSojJiI+gto
         SfMmzCV6OA/VYWEqs0Z+kph7t1EnkDGjCs2G1KUCk0XKpAeGrfQw731F0HekR6P0wgG4
         0wEH4GQBtDU/Bcr1GfVP57bfPKxZqXSUf7osffZOcNcP9T30qjVb/95buTHzd+ujEPUR
         pdU7gqUSurNv1EpApXWypKy0QhZe7emu7Uyg3/dnKvhm7/UHwV/8PPSA/QGunB8xyd3V
         i2Si/y4KP39mb/k1NSeX3IqNj93XBcCb+JNMSpgUIE77OUWGTlQgjWWcB6K53PaNTMqW
         06tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779849336; x=1780454136;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3P1l4eUt02McJdhyUEG4hjmyRVE1na3oPwo8Mld23s=;
        b=pEhNZ/S51gT9Pqy5BjfGcF683t1YQeZEYJSYPolr8SaWhWr2SGcgyCDCjHXGt/i9IE
         PZb2xOtapKSuXOwmsQQRijlRrOpLhl+pv48drQby0b4lpLaEoT3JWB9vA/bpK9PDxLwZ
         NEFTudwkJSPkX8NZ9PKYiR8LxOTH8cA3vjMIKrn03thzl24RMTgMK4W9Qq2Ox3QjSjEh
         s6iBvGIXTqN/oPMreADO3wwymgvFpHXNTeQD43hfO6QI5PV1mk+acgDQNCQzPlCf+G8G
         EE6f0n35IwEmOwA79rVWpQ3GYbTQLeFZVjXszxa1g9b3RCgYeSV7IJoG8o2uTm2KZh3r
         1xSg==
X-Gm-Message-State: AOJu0YyqW1Ukqlp1+vgmbJwMUsQivS1XrfWoyw8Xa/Izm519OBuSst4i
	6JYaBRh3XdE/QvhcQdz0CqXJMtN0BhCOsuqJLkrZe+/RExJF9pIdGIrm8zhjyRVlNeieFyJdwNO
	UZINJMBt0BmUd9A==
X-Received: from pjyj11.prod.google.com ([2002:a17:90a:e60b:b0:369:624f:9170])
 (user=johnylin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5343:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36a6772e208mr19111184a91.9.1779849335777;
 Tue, 26 May 2026 19:35:35 -0700 (PDT)
Date: Wed, 27 May 2026 04:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527023350.3067547-1-johnylin@google.com>
Subject: [PATCH] ALSA: hda: cs35l41: imply SERIAL_MULTI_INSTANTIATE
From: Johny Lin <johnylin@google.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Tim Bird <tim.bird@sony.com>, Johny Lin <johnylin@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use a weak reverse selection to suggest the config
SERIAL_MULTI_INSTANTIATE just like cs35l56 did.

Signed-off-by: Johny Lin <johnylin@google.com>
---
 sound/hda/codecs/side-codecs/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
index fc5651e555e3..a08b4bdc3779 100644
--- a/sound/hda/codecs/side-codecs/Kconfig
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -28,6 +28,7 @@ config SND_HDA_SCODEC_CS35L41_I2C
 	depends on ACPI
 	depends on EFI
 	depends on SND_SOC
+	imply SERIAL_MULTI_INSTANTIATE
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
 	select SND_SOC_CS_AMP_LIB
@@ -44,6 +45,7 @@ config SND_HDA_SCODEC_CS35L41_SPI
 	depends on ACPI
 	depends on EFI
 	depends on SND_SOC
+	imply SERIAL_MULTI_INSTANTIATE
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
 	select SND_SOC_CS_AMP_LIB
-- 
2.54.0.746.g67dd491aae-goog

