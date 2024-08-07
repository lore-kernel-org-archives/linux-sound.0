Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AE78B4C
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042961; cv=none; b=NYEN7oB/UypOE0sQ4EFHQLHOwwofTydwQpM3Ym5nAQnTxdcfsEJpbXLf6Xi/litqh/ZPLKPACoNaeFJi4V72RHiUX2ezzGaWth2qswE6eOLKhRsw24pOZaH8YuJcEuJoHDinGvs3ukB8x+1EC2Npo+WZ7vEXRNOmCvjsizu41lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042961; c=relaxed/simple;
	bh=+wyWa9keKYvJvojA0lUFTGTwanpx4GNfWBttcW1dW/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h9wRNa55n5d0wO+8I/78BO3qJPh7bnjqCSJ2vBqowSc4xoqGEw2CH/XefrxxyrBlVVbgQ50Yz+rOS24zJUa8sk01nGHw82FG1Xw3RMPZFTVjo+Kj6L0sDo6JgTjw3Z1WEo3Hkax5ijjlWU+hvvmMVxtuTIePivNTt5zFQha71U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNkVNiRI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNkVNiRI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so2122457a12.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Aug 2024 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042958; x=1723647758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gboyXAEeXuINog3pkYnMpOO7y/D6nwWKyvX/1H9FuXk=;
        b=vNkVNiRIiEuYNWAb3JQc5NGoBRI1GKEAAKxzG8F9vh8fvkjcxpIE0zYjSKRxkYHCdJ
         zAS+0OETGMew8Qpru4eA2vSckG1O3PQ2qwH2aSQF3W43MZ7vtIdYMf7V8rQ8oeh5rIYZ
         Z4OlBn+qib7TyhUaWJlVvPLnOcGDb3OUyeCWIbvG0Uz3RISC9OI69n9VgwpBOK3fkZMr
         NSQDXe9p82hxZ7pJ5btnOQxM1k1fdE3iudfMWQX+xBfwgY4XHl9p4NCiu0WpS9N/VSLt
         siLzr4viGuSZKGFCPeb0Cjlxn1UCsUOz8krvuxcld18sME9dc5HmMNWyE32qP9i+qffK
         oHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042958; x=1723647758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gboyXAEeXuINog3pkYnMpOO7y/D6nwWKyvX/1H9FuXk=;
        b=Cj/J5ymsGX9OussKKLOp29PENw8Cj2erNiouVPAHTOj7YJ4cB7uW4OrlazT5E40f5a
         Vkw3YimgNHFDF3WB+8rTYVtt9pZ2Q7k7BBgzAt4FyiB819C2ZucFZQRoCSucPkE5uz8g
         z5nXiisSmhYM14tFTOMFE2hQz1q/eTSqXVxWCrmfx7FrJ3s7LAHDRE72XSEOFNAv+Vz9
         Ic6agTyWmOjXma1diO1YzA9Ptu7SHyWrTsFrDF9udsYOUqctXwjnJDpL/BMgoGYN6snn
         LC3S4+ojVZXGHHeMrqLJtVo2a69gcgFb93tf/Ts7fHp0Kf5WpsWCKfDaOUBVrArTdjqD
         dWfg==
X-Gm-Message-State: AOJu0YxOYuDsXLZEQFT9mNLUKfGrpsP8lKo16xog9GJ6Q4BWXub6+h6y
	uEpLIjfuFQ2hvL0bQCWQGX0YPz1cqpoM/nTMN2QIW5IO5m/iHe3U7VDNxVUU2hQ=
X-Google-Smtp-Source: AGHT+IFAVMAyBYgyjB17PgBIAsqIPvYIgbKexhMjycc9NMyI226M25xxGJarXKv+Tma4MwJ18ohlaQ==
X-Received: by 2002:aa7:dcd9:0:b0:5a1:40d9:6a46 with SMTP id 4fb4d7f45d1cf-5b7f5dc5d68mr12204944a12.36.1723042957750;
        Wed, 07 Aug 2024 08:02:37 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] ASoC: tas*: Fix up GPIO usage
Date: Wed, 07 Aug 2024 17:02:31 +0200
Message-Id: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIeMs2YC/3XMywrCMBCF4Vcps3YkifYSV76HdBGS2A5IU2ZKU
 Ere3di9y//A+XaQyBQFbs0OHDMJpaWGOTXgZ7dMESnUBqPMVfVKo5PkcXOC00pJsPWq1WFQoe8
 GqKeV45PeB/gYa88kW+LP4Wf9W/9SWaPC0Nno29Bbe7H3Fy2O0znxBGMp5QsYLWOsrQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The TI TAS drivers use some legacy GPIO code and headers,
this series fixes it up.

The TAS2781 is a special case since it adds a handful of
lines of deviating code to reconfigure a GPIO line for
IRQ mode and then never actually use the IRQ obtained in
the code. Is the line used by autonomous hardware? I'm
puzzled by this.

Anyways the patch suggest how to solve this properly by
fixing the parent irqchip and I'm happy to help.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased onto v6.11-rc1
- Link to v1: https://lore.kernel.org/r/20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org

---
Linus Walleij (3):
      ASoC: tas2781-i2c: Drop weird GPIO code
      ASoC: tas2781-i2c: Get the right GPIO line
      ASoC: tas*: Drop unused GPIO includes

 include/sound/tas2781.h           |  7 +------
 sound/pci/hda/tas2781_hda_i2c.c   |  2 +-
 sound/soc/codecs/tas2552.c        |  1 -
 sound/soc/codecs/tas2764.c        |  1 -
 sound/soc/codecs/tas2770.c        |  1 -
 sound/soc/codecs/tas2780.c        |  1 -
 sound/soc/codecs/tas2781-comlib.c |  3 ---
 sound/soc/codecs/tas2781-fmwlib.c |  1 -
 sound/soc/codecs/tas2781-i2c.c    | 26 ++++----------------------
 9 files changed, 6 insertions(+), 37 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240701-asoc-tas-gpios-5c051d80d768

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

