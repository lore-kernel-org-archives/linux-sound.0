Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916081B4236;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750146; cv=none; b=OSGpCIXOUBhxnRTMoEGHxWpu0DmfdgJvx2eyLz0/MWxI3RY+ikZ4og9iuQ4efMl2mOP87HP/3OfXLtIGkptfY9xeYstJ6JvgNAPUc/HyHhQFs7y+0jKS1DKrkAZb2jrSIrFgtThUP6ieiMSN8YA4XS38LtYlvhM6k/iTGqhHNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750146; c=relaxed/simple;
	bh=jTNH048J8/e37rPd6oTYl8kF3JhnEDxWF56FPekHMjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CfNWgDzDtoSLuK6oIqSuJ/zEOcOnBivJ8RA4ZNKCcXf2g09snsQJ3+44CNohU28LGaeiQpiQwtbDHCQkoCfZykbTzT0JNWYA7G5VsbV0+hCXjNOGgquoFks3x/lqnFpxfjSDj1/YnvoH+4jKbMX7nZXNS5SkXYjbjUSwCs8b12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoMkt8YH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoMkt8YH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C714C4CED6;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736750146;
	bh=jTNH048J8/e37rPd6oTYl8kF3JhnEDxWF56FPekHMjE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MoMkt8YHcrwIqGAAUSz8wPAph1rZMXMe0aRXDbRfgSdTp8AZpNqaAK/J/kdEONx23
	 jFUR75ep9xRmy5c1P2UovMT9EdtfLVIy/Gx8zmqD6oLUGkzjFVMZhA9qf4FIdM2YiW
	 W3NMBRtRG/q/J4XG5R6CEpvGQK1Ky8UN9ck9XS0qqGUHVoDcN+hycGI6XvoYmYoWWh
	 QCpwL6e0eIiO4296uoWh/GPkbeuxwc94FXDwE1DSYg8AEx46TTXpSwMCAwTzNNNqZX
	 KBvJpjSlMie/g71hLkAb/eP+GJ6KTcKofb3iUIXY7H/XNBDizueUVHLdWJJrbi/02W
	 +LMkfj52fewIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C4EE7719E;
	Mon, 13 Jan 2025 06:35:45 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add support for S4 audio
Date: Mon, 13 Jan 2025 14:35:12 +0800
Message-Id: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACG0hGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MD3cTSlMz8+JSisszUIl0D80RTYwvDZBNLkyQloJaCotS0zAqwcdG
 xtbUAVy28hV4AAAA=
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736750144; l=1136;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=jTNH048J8/e37rPd6oTYl8kF3JhnEDxWF56FPekHMjE=;
 b=zGklfCbSRH4yBG2RsEX2vhu/9ldv5Wjvg/qtKRhQIJW7IToz0zt7qIztoJwr2Tg7lR98AKjfB
 4eXneib0EVrClzcwjQKfqXlUYUGjcwHG4T4zCfukXL2UQFptj3PvQys
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

Add the tdmout pad control and tocodec control driver. 

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
jiebing chen (3):
      ASoC: dt-bindings: Add Amlogic S4 audio
      ASoC: meson: s4:support for the on-chip audio
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/sound/amlogic,s4-tdmout-pad.yaml      |  36 ++
 .../bindings/sound/amlogic,s4-tocodec.yaml         |  44 +++
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
 sound/soc/meson/Kconfig                            |  16 +
 sound/soc/meson/Makefile                           |   6 +
 sound/soc/meson/s4-pad-out-control.c               | 372 ++++++++++++++++++++
 sound/soc/meson/s4-tocodec-control.c               | 376 ++++++++++++++++++++
 sound/soc/meson/t9015.c                            |   5 +-
 9 files changed, 1461 insertions(+), 5 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>


