Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6530FC04
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820987; cv=none; b=o7SECsHQawZWjWD9fTPVCmyOuT/dSwJ4L8ps838mbjcQl8kF9MQHbU8bqb/4cVHfZmj+NbVBvThjVoSxzeX2w+T6M2u0xyefkaqceh78FgSZJfyf4yVGwOlkNzOdfFA2/z0ItkeH/C4NPXaFe7ofR6MhDN7FbMZHOypWYOty5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820987; c=relaxed/simple;
	bh=QyDWADORNYKORrVMC7jUd+GbiU+tM4r6UWBGyc5XDZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AHq8zIkXyO06O6NikLyLkXDPS1DKrQjyFT21rX3HcZycJyror+pzOQ8SdK700ySaOGCjySmzfDSlHLIQ1fpqvYcy30fDoi5SNryuevr1CGKWAPXsI3oaUr1MQ90BN6X6XrjbnGDdB1SNjl2yCTaB9ei5zlZRxiUvkTwNJhXcEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OB4B/Nvo; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OB4B/Nvo"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1969589a12.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765820982; x=1766425782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZucEkZaBb5UWoW4XDQ7TAurxAie8iypd69KJvqU6wgo=;
        b=OB4B/Nvo1CWdr7Etep7qHwGGu5nkIcMalBTzATqh8KyXQcGi10CRE2pZgl19Qis2s5
         UcxilFDD7T3atcn3Y+BiLCrFMG35eK+rRXTpGXv9JMP4k3mbLBu/Y6+Glu5A81MIMWE2
         95iUpdrMdevSmZ2UMZ2IfWbZxNQw0q+RJcMDErf6iJUKWUsTJa8OmulDtdCla5toByrj
         I2b6/SEjNQzQiRudntq8uX3VaG1dxx4YmqVa2TwZsTn3MsMEYebckAELdjwcp12L3Fkc
         hRQ+tnXjgwqYKtlJ1EGNWVXBayRq4GNMhnyXTNDoTITNbzK77LRJu7kMS7TCBqs2Cmo4
         T9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820982; x=1766425782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZucEkZaBb5UWoW4XDQ7TAurxAie8iypd69KJvqU6wgo=;
        b=MoVX7QUiojfkap2KP2CeT7pvytaNJ/+34gvdUgYG+eHDVzo81ey+2XsDsqYw+pgOwt
         PXmRvWRxqLXFhTAzcBpAhMoji6XnzKfsWGMBeXCpe2DOEF5YGxj2zn95cizsgJHXpZ7+
         6rkJA6q46qC5gY/5zYcyTpyeUm3KsGofTLLTy0lcKoWHTr42ivszyiNiWp5sSUFL4+ac
         KRxLxzl2DbLw+gpvBMV2ChzDbzuY3w44rNHaMJZILqjDPiQdz/pQWhP3TB8FfZh2hNfT
         kAwBkTXWkrwdxx0xOvwIPFQVwLQxDVV+VlfAWBYKik7cA1GozIAmEitgWOtIuAJyNlK4
         ziww==
X-Forwarded-Encrypted: i=1; AJvYcCV+ePiKm7yorKi9Apbg/Uh9+mzmAw3BI4gBH8nGG/fHrKko6Y4UlIw7wZ5p3es5gmZ6EUS1ikA3Tp5/2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ChrpGjaItkBzgUltehmEJ6lTzk4cJqpKZFKvl8zLGU00YegM
	1aSACjyPEdScKE4UMtu0HEAclqUuXcCZCsNythkW22owC7tid6ecW3tbcisbhmGMUGA=
X-Gm-Gg: AY/fxX7XfS5JLIrPq5AXLs66TE/tz1uxuW9xYloB8L8sjCgObQQL6l0FI8qXpwW98Ee
	i0cjJWBsusKQu6FI5pFQvdsN0TAFnfsSKKV/f2d0eLP8J7z7PkuR+GQcSUwxNF+YU1uKONcgwMU
	YcZpNW+M8aP4LGRZsEG/P8rq4iEdZ8aQmYhWsLOkwCkNAl000ILjbGhYdPVnqUji6mCsW63gke3
	C9WxRzvmbjliHMk/pnU/Ym6WsJ061rkZ1q6SceurYcP0f6ql0W5PSd74LD6GqpcCj1QJPsHGP19
	+SPeTZhnDLu0pmN55C7J9L/TlSe9FMtfQc8r5XS4MxcdG7+CiIAB7FXoqegKQxwVj6opvgKxaAs
	s03rSEoSv2pQAyMt3NS9zUVkc9BdvQI26jkceH9hSGuL5dlCIPANO9D79q+mxMuxUgAvCUrd6n1
	DMfSfEJbLNBZZ8+NeN30CJZYDYXfcv1++TzF6zfbA1Ok84w3nPcXMySCe7PFA5lYqQh4iPklLQH
	a4=
X-Google-Smtp-Source: AGHT+IFIL2oJBYYxguK2TfwFTWQQ95SV7ENoxtKNAV61vyXYZVruNXNTIXMwx1hEUVgTymX0sRZmaw==
X-Received: by 2002:a05:6402:2112:b0:649:21d1:9c76 with SMTP id 4fb4d7f45d1cf-6499ad3ce92mr12627603a12.4.1765820982200;
        Mon, 15 Dec 2025 09:49:42 -0800 (PST)
Received: from localhost (p200300f65f006608e858c1c813bae2c0.dip0.t-ipconnect.de. [2003:f6:5f00:6608:e858:c1c8:13ba:e2c0])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6498213171fsm14014473a12.30.2025.12.15.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:49:41 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] soundwire: Use bus methods for .probe(), .remove() and .shutdown()
Date: Mon, 15 Dec 2025 18:49:24 +0100
Message-ID: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=QyDWADORNYKORrVMC7jUd+GbiU+tM4r6UWBGyc5XDZI=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBpQEomjkq1O2GlSqZbLXSPjh77L4En9NosycNU/ qZqm+xAVb+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUBKJgAKCRCPgPtYfRL+ TsuoB/de+LzSQuxS8GMQUX5hZyOR4L0re9ciGB2dTW85Zq7K8LIKS3KrBZ/xYIVI2pwPQb2+uyD xXPE/6cfD1IywGu6BhgsSUM08C2sDWJcZsG2l1aXlNwk2QjjDbkALIeEwdZwF6I001pTBrhmK5L D6rk0mGG0/HSfBzr0wZl5F22oEVbzM1NVhL041KSrRCVCgT4TSPMCib9U4wv1ZWc02QAmOTRnWo mPf4VhbKM35gOzP+f3pSNxuxhh/UzNCXiGAVR5lxVLDAWoWVREZj6ycqWSHCjvwYDPjmxaESKXN y8ncuhijD3tWvCZEcr3ySneAlWHOv9bHKIAA1yO4Gf5m0m0=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this patch set converts the soundwire bus to use bus callbacks instead
of driver callbacks.

Both have the same purpose. Bus methods are a bit more powerful (because
.shutdown is also called for unbound drivers). This series is part of
the quest to remove the driver callbacks.

The first patch is a preparation coping for the remove callbacks in
struct device_driver returning an int (which however is ignored) and the
bus remove callback returning void.

Note this series builds on top of
https://patch.msgid.link/20251212073555.1065284-2-u.kleine-koenig@baylibre.com
which is commit 81acbdc51bbb ("ASoC: sdw-mockup: Drop dummy remove
function") in Mark Brown's sound.git. The series applies fine without
this patch but then results in build issues.

Best regards
Uwe

Uwe Kleine-König (2):
  soundwire: Make remove function return no value
  soundwire: Use bus methods for .probe(), .remove() and .shutdown()

 drivers/soundwire/bus_type.c       | 31 ++++++++++++++----------------
 include/linux/soundwire/sdw.h      |  2 +-
 sound/soc/codecs/cs35l56-sdw.c     |  4 +---
 sound/soc/codecs/cs42l42-sdw.c     |  4 +---
 sound/soc/codecs/max98373-sdw.c    |  4 +---
 sound/soc/codecs/pm4125-sdw.c      |  4 +---
 sound/soc/codecs/rt1017-sdca-sdw.c |  4 +---
 sound/soc/codecs/rt1308-sdw.c      |  4 +---
 sound/soc/codecs/rt1316-sdw.c      |  4 +---
 sound/soc/codecs/rt1318-sdw.c      |  4 +---
 sound/soc/codecs/rt1320-sdw.c      |  4 +---
 sound/soc/codecs/rt5682-sdw.c      |  4 +---
 sound/soc/codecs/rt700-sdw.c       |  4 +---
 sound/soc/codecs/rt711-sdca-sdw.c  |  4 +---
 sound/soc/codecs/rt711-sdw.c       |  4 +---
 sound/soc/codecs/rt712-sdca-dmic.c |  4 +---
 sound/soc/codecs/rt712-sdca-sdw.c  |  4 +---
 sound/soc/codecs/rt715-sdca-sdw.c  |  4 +---
 sound/soc/codecs/rt715-sdw.c       |  4 +---
 sound/soc/codecs/rt721-sdca-sdw.c  |  4 +---
 sound/soc/codecs/rt722-sdca-sdw.c  |  4 +---
 sound/soc/codecs/tas2783-sdw.c     |  4 +---
 sound/soc/codecs/wcd937x-sdw.c     |  4 +---
 sound/soc/codecs/wcd938x-sdw.c     |  4 +---
 sound/soc/codecs/wcd939x-sdw.c     |  4 +---
 25 files changed, 38 insertions(+), 87 deletions(-)


base-commit: 81acbdc51bbbec822a1525481f2f70677c47aee0
-- 
2.47.3

