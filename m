Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F232572F
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679563; cv=none; b=PeM75RS7ZkOlFyVkNCsIUIHMFHsPdHQVs/ge0WPPSLiFuaeVqe36RWJ6n+wwwnNLuheKvnpoxpLppwJUaS/3wFE+5+vEVRIwWiFBUX3Uiybu8TQlO09hz2c7KKCahAyvpqss3GjChmwv4lj84MmtuGvIr6DGMZFqg3bTIL8eFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679563; c=relaxed/simple;
	bh=LWbW3HufahL+UvZ84gWhXCfMcijZHYR8H/7I2w8iQHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9zYKQ4OHKZljuC2Knx8sohL0sGHwvXrI+pmLuT1NJrzPTQduBoF45jL4AYsloQ1dkOEkWEE7pNLnj6t/QUKZzvUlbljPwWBYCsF6G/pO6Kj78MBl6+FnOM9bnNCS0Fu5y8o/I3sVOMnin+StYQ7Pb83HfbLRZbLeRgTNYpjJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=iavyG2ER; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="iavyG2ER"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a74032ff8so5104989f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 06:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1778679561; x=1779284361; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQGZiVxQs6R3BA0eKr6GtmSaVHEIlg8PpjkL+LUQnGo=;
        b=iavyG2ERlEIfZ2tWaQZl34uVtLeYcCtn/zm2zY0gHmxxIakhhwF1nqxCt+9MY19gFx
         lunbI4kqNJpZlCMWryBZmrVxI6SYb133nSJFyuPAMUe2OJsN6+cp9u2Ehg9vdvToUlKk
         iePpppQFcUdO9tZ8S7YqY649xEuRHLmsz6FVgCLhJXNxjZyJL5YCMx7xrs1igBL3uJZp
         O9lT7qMXJSLGrEmZI4IO5sRG4uAwVUfmOEe2jbk7ldIT8T0Ul9SXQS5299/mn+qGol+u
         mRhZLEMHTQrc+CTy1eGvm7ghYXQUvhsUw3Qj0X2+wbJmkswdGMTNd9T2tJH1csn/Dgdb
         k35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679561; x=1779284361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQGZiVxQs6R3BA0eKr6GtmSaVHEIlg8PpjkL+LUQnGo=;
        b=NQYGktp7C9cRbe2+4R3Kk81ozMnXKvO3e7H7M5k1qZi2lcgCT7xLQpGy1GJ7UC24Kp
         MWMWEQil8DV1aoCr9+L+k4yQ5lMowh0sE33/z+c8xIfSk6f8iQBHikjF438ib6SkoZKA
         FBWBq6AhNpksL7O2SAh8BkNz1My5cI337fdRqz6C8L3mE/nm4AenDXsl05/hueuvrIQl
         xIj7wDFjtnvFCoyD3fREawzBZBiQXUDBfQ1Vv4q0iYTX/uD1yItJNRkpLoYU+D+ZItEl
         N8qnrNBZj6rMbvnMe5SgoCvIvQLL6Lg9yE91aTO38S1O93ZmLjADooYdZs9r/88u10T+
         AyyA==
X-Gm-Message-State: AOJu0YyTLyeHgp2CgqkphJJGEJvOv8XvLk+ckSjn77IDUxDHaprcWKaQ
	FQKO2rRUMCo+J5j2+FjMhEvdgtCqdnIW6ahy7Z8+YSvnB9O1HHAPDYPRhB0flw8Vuhs=
X-Gm-Gg: Acq92OH7GsfKNYfv4sUSiHKW5l1SacKG6544tJT9D3k/SQ2UZ5zds4ypMSsEML2x7D9
	EHU6AB3zKJ23OqqvhXKRFMaKTaWBEv/fCeUqKQMf5gy6/Uq2XdFK3VEj9scqDbO0j0bPAhTlsEs
	oeHVX1dHiyLl5ZKKcdePjQxGHaEzmGpH2SUqQcIKb4NHB31ZPP9VFaIW+OJVcy/wF424BsEsQs8
	/HCNhF6Xd+STf4RjDEaXWw6IcfsnSwNIeL1yrdWfAuayCpZh0t9rqJUvwHGmNJ7vn+H+B3qsJcE
	W8rNhhZ06yxt9jJE8CBqjLgnWcLKBwRRuPtmF9PGkAr8u03eOkvrxKfQWVnUXmBVwpItObrxy07
	nHVpte2jPJZN/JqLdrx25da3Pj10ULfPhcLBk/4Vc+hoUyHMI7+PqlRXicuByfkGLL15MFWvJnC
	t8qGq3+PXW30xsELxzxKdVKNjv3IYzYRWzvqF8cDmhR2odrJt0fW4IOV1W1/pdaHvGf6/LcYFJr
	VZcM88S
X-Received: by 2002:a05:6000:2306:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-45c7b568bc0mr4827156f8f.34.1778679560776;
        Wed, 13 May 2026 06:39:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-83-110-135-253.alshamil.net.ae. [83.110.135.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca383asm39627560f8f.28.2026.05.13.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:39:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] ASoC: nau8822: add support for supply regulators
Date: Wed, 13 May 2026 17:39:09 +0400
Message-Id: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1+BGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Nj3bzEUgsLIyPdotR03aTU5DTTJHMzsxQLAyWgjoKi1LTMCrBp0bG
 1tQAUSh9aXQAAAA==
X-Change-ID: 20260513-nau8822-reg-becf5b766d80
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=alchark@flipper.net;
 h=from:subject:message-id; bh=LWbW3HufahL+UvZ84gWhXCfMcijZHYR8H/7I2w8iQHU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSx1LMe7X5ZUb6d48i6jUumzs019nqXq3ewjnHDV1uel
 e+aLibe7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqba8xMjyTLH1UtrWw/92m+rVr24xanwe2/SoV+C26OzotsiJlew7D/8APUt4
 TbvUH5dzP2pDb9/mP+FTZnYKc4TyM+zwcN8Rb8QIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The Nuvoton NAU8822 codec has four power supply pins: VDDA, VDDB, VDDC
and VDDSPK, which must be online and stable before the device can be
accessed over I2C. On boards where these rails are software-controlled,
probing the codec before the regulators are up results in -ENXIO errors
during register access.

This short series adds optional regulator support to both the device
tree binding and the driver, so platforms that need explicit power
sequencing can describe and enforce it:

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      ASoC: dt-bindings: nau8822: Add supply regulators
      ASoC: codecs: nau8822: add support for supply regulators

 .../devicetree/bindings/sound/nuvoton,nau8822.yaml         | 14 ++++++++++++++
 sound/soc/codecs/nau8822.c                                 | 11 ++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nau8822-reg-becf5b766d80

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

