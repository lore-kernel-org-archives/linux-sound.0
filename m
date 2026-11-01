Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520578;
	b=CqaZIcInQKYEjGjVTdvPgoxy0x8BWVWjBeWwz4rN9ZEY7+34ED26SMxE0NUKsZ6l0hZU
	 HXW/JKqKeZ/b54vJkvEknYQW9H6ci5VCK5PKY236Yi9qQ/Wb5QrPkjFbz5qjM3Ndy8AX+
	 MjDnKytPtnLwEg9Kfx4kivaKIpV1UwLByKnlyVmwi/YGCJZMUJ2qUT7hwHveTA478BrdZ
	 EH+4M/f1cjRI66igJXGlPzc17ABXzFfXxg7JM3cBKCKV6EO+b/hXTV/PQ2LYLe2fXU4EY
	 tDF43NKkv84QXcA4yKwXlfr+Zr06QEAO3clb0RpQuN5KWBasieke2pXXk0Wg2rTl6nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
	b=GF3WNym8Z2ysxbIo85lmJ28u0T/Bv7Y582oXvqOTNPNLRHsehrSXdXJWrKY9CIwWQ0zt
	 EpWC09MuO4HwCUilyfRhHz/VHNdQ7ru9QbtxFAUQf70meb02sD1PPgYi05jljdRadp1uA
	 4VnOvajMH06Jmf3fNQQcZJsZv2ig9cFXqM/c+mmL3h+7RF/PMWJaSuxHystiTXPESThx8
	 YSXqt/fIcYhOXAdOvMrNEAgBILBuMEkyfkOmRIhCqxeV9TlclW2I9bl2O6dKAnhhXwnZC
	 K+TpMWjQgnYONLEkWTMR8SsBxPOtb+slfPIazRhZxcfwqB356uGswhxRTMc5NLxTeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C924606A326
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 08:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C924606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso3516265eec.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520576; x=1794125376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=rP23xyf0arPyjxxhA0OpvCazKXpj/6elzvriPCYljf4aeeqTiu/VmGC/6e8LMJlm3S
         APmcQqI8eYuDlAR+lHMGiPG63ZirJ7KoXkMTBmDmRBQjXr4lkA0bYN4CylbyAyr8cMug
         oH6t98/g3WUnMwiNYGa86xW6+7syOqhkXv4/LxKfuMqyayWy8Nj6i23YmbavCB6N/VMO
         Kuc+ZOLXdcWNCE5/zPyN3C65/jH4rQ9lZJyWeTsPzIKZawXZpfuZmKZVFQ4jJwqc8XOt
         ZUS3NCuGknSCXUH3YQ+E+NZOvH+ttJXYoSFAdJqIDmqNl+FSPekxUKEIEg+hIci3lRhy
         xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520576; x=1794125376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=mynAj2AEkI/uFU4NpXJxIybiU/VGcVJq2cTSCVKHaDrWu607QfUSAjZ1o4f0F2s6Am
         5RuS7whR4yIUGSHtstJ6aXtclqyajHv0j0vRVbR29J+SULAN9X+EYtJhn7zkvhRJ+/bc
         +pMgfh+pG+O86newDRlLWSLDIFsiE5GtCo8ulkM6XvPecR6PWIBawwFWcuJ+rHLaUHYd
         ukkNkovs933v7NuZq59VnTAXIF85gg6TxkNLkJWg4tvNg1LAikduBbgm/XKF6kDCcRuF
         9TPCfDXEebt9ySHrJkLPOBKIJOhkfcbNuZiBU1xZbbOxYdQDxLEAbfEd0mYRVYrIz3vz
         a0ag==
X-Gm-Message-State: APuU4Z8ULYSFW1N4u4+SAmPKCwMm5qRCJEZroj7tVfNQRp/lFHxKTZ5E
	bleEmr6TD+eWMO7jzimKX5DLtWwPNDiMHAF3X0cz+ABy5PFGagARy2h4
X-Gm-Gg: AYBFou0/6gv1z/ilFD9OQYlgTQ/MqOQUAVHhX3OwA4Bzy7CzJy0YY25tz5WN5sRrqqO
	iORsvKjYYpmzIKVCL4FL/R28F4CJBHCMmF7Wgrt2FIdFtqZo6/djw4ZuO61K/sd9OYdrRUueCfJ
	6szZwuebJ/VVDeFJgSZbQsn86uOTgoyY1309kiee0ylHH0CL8+OQzvYpQsrYY++63PXUznjHHZj
	ig7M7Yzp8/38TMTxYmAOgFnjT4p0sQ30TZpMeuVAWhnhIBtymNvOSXJhL6O+Q7O3BtjrPmzZHu9
	zSYHJifeYPHaFCLa0ilFyBlnVqXfsErpuBz1H6uT3DxKaa62CzHvCap5OrFhWKnE7RNxueWBg5E
	1z0uhGI4IQZdtvJ4JBy2Tg5Yk5budb36WZ+0yO/1cCCvd7kf0jKGdw5+oThJyhsNkwbx9iSkFUZ
	u8oZ2egBiy4rEenWNnM0YUCh01yEh9HVU6sRHlD1m9mwjhTTpNzgP2mTTaBm2CM1QqiI6cmN/Jw
	igAYEbCohu1ul+8aVcWfDAlmOkCMrMwBxtFclQTnpqN/o/D3tsloukbUGRbWDqQ8nGbaTzeXbrl
	AYIlwjQHNt12qM0WlsUeCKfUoIYltaqi7ha3257n
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr9966452eec.30.1793520576167;
        Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:35 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Sun,  1 Nov 2026 16:09:24 +0800
Message-ID: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v3:
- Add SND_SOC_ES7202 to SND_SOC_ALL_CODECS, convert the copyright block
  to C++ comments and drop two unneeded includes.
- Turn the volatile check into a switch: the ID registers are now cached
  after the first read and marked read-only via writeable_reg, so a
  regcache sync never writes them back; ES7202_RESET stays volatile.
- Set use_single_read/use_single_write so a regcache sync cannot become a
  multi-register write.
- Use devm_regulator_get() instead of devm_regulator_get_optional().

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v2: https://lore.kernel.org/linux-sound/20261021124552.767218-1-jerrysteve1101@gmail.com
Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 373 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 ++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

