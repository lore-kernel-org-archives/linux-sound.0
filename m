Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=HRdZE4rU/SRWNOK03vyh/lRPyxrRb5bwRmX4XZzKHDtYkaK9nouGi9pXdQzfaqCAyieD
	 UrA+9Y4n2gjqtjFAayVc6NLblWs8MqLAO2Pq5rqPJh18QL7MTb9nTMu0LMGDMgm3urYl4
	 6fiN3CBX/XY7GZ4/YL1apTYcYHq3aePEdMzML9FsH4B56PbEiOHZMxvG7RxS8UAAt+YvQ
	 XVxwx72JkPtzF/0PL7ETLWLHhANjrIv0dQm1BldxI+3LJIOkumUH9ikYtjRqx5mgc/tgh
	 2WzvDeVzUC6SjfFzF82tV3yORA4lCMcsffp++E9PWEtsh2bDV4a3zwsXA6jMIUisjLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
	b=y4cb9O8uVpxsccnHdcmvL37ukfzfWFSWBqBNq48ifhTG7+sEBney7Uu9+hLnEk85EvxU
	 xuEJZLv+qW11w0AJmBE5deCBnvhH6xSDx+Muym2wfM5T/RZFyCJktVPmlY3hmJs08YUjU
	 5fzWe+51kuB+8x4wjFt+LTR10KkyIRXJ0EmernpMQeSjejJl9KdfDNx817RWowOgky7mi
	 RlEy8x6hWIzqKLx5QbacfyMpmm8XGtHHmO8tnmt6H20UjOvjYZxE5OTmsq3ZWIMRyezG3
	 6Owdq55GY180Ys0jN6E7cJbvQdTjX/sOEcEPInVAiN4PHwrxjtTkgwCbAa41W9pTwuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="axrKvV5/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02804606A329
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02804606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axrKvV5/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so19838495e9.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543437; x=1794148237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=axrKvV5/sycBk82+6Nt8gbseFSxoBPJM35iGjjREg3AlOkRUPtjV0bkauhgc3l76Ns
         uvwYudrYsSijF7O4AvU63k6xhpZobOwKxE2/qguQofve7K6aFBYk0HsX7zBnIzSgs1KQ
         u+BPOJbCj3E46YyqH7mTr2yCLdwZe6mazzmvWbHxnIjDJDcEiLasYasbX6a5Af+9Pkfg
         r8dufV8lZA2m888lkjrjpTnzodE0g+gQAnD6mamUiFsLXnZBobWTPKF14OPjd11ixwjJ
         xqwiFyDn3nitgx7zggVDT6fH9ZiNhBU/q8cLwysv7LPCLfI/7eHLdNS9c/FRC8FUxTzv
         EVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543437; x=1794148237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=e0e+Y/HmglihuykfOhwERTffI7x257Wo9mzMydS56a0F2EhgzG5FuL95hUBX/4yULl
         Me4PptBDfkfAK9T2AT36nck0uwhnQbkfdhQF/K863zV1y5+E/zhZzSVEa6T1XgE64Y6U
         M81pzVSsV7V8Fo0jgN1KlTE+u4NWOGmKaO2AQ3hVpVDDgOSBKny+TV5QGvy/VjIqd7Dc
         q8pJXaNwb3FpQgtsR8iWFbD8FO6uMLxDqQJ5osYOBWMXRBNvJExmJuVgKEx25BdfaNMf
         nG1VPQ6NrzC2JCYgb9fOwkocBpjBp/7z/hjux8FXvhhhm0DDlzGRfx+ojmMN0ahNDjXP
         dwBQ==
X-Forwarded-Encrypted: i=1; AKwUvByHMlvO1uGTQErzhManiFmtFeTaC6+dygfNH4+dGsf1zYLO0i697W3w8N/JLrvxrpLRE2+f5Kr12SWBUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7L/Vs/ffaA25DY7tv6LvLuAVAtfTo2fdYCrTAu7cta1S2NRIp
	nnC5IpfHUeYpdIsS3tXMrH7xcg+8aqkqgdlWUcSl0E87tVCXao6hEEE5
X-Gm-Gg: AYBFou16RpmFPXHKYGzKRgtyZ0vWzW57vJ22JuRAytevLt5xVqIxaheMCxhkzKQzGt3
	UPcwprqmb9ab9UzBtxF5i3X29YoU9MrXhh/ZaBYW20gaIZUC+pUkLhvHieqQWJVQmiulH9lAkFR
	m83fARN/wl1HlXT7ppXSwFVdron4w0zW1Lkll7k2X17Zr9LmJPJ8jQvPTav443Nq54eEhlCsk8S
	Z0aqeDSm3bbZ5MUj0cMOsQW17Ca16ImmdGL6+5uXUgNvax/avRDw8rd7GCACPnw5UqtonO0FLmC
	agBF7d/tAU+h1G4NFTxLJQ5piJXUsMoUE9+F+eEhJHgh5CY+hCEdUbDpJHXaNlxygYSKnELvKqV
	xJuyxFsV1NMl7c/svbOvNZeYwk1sH3NQGbqABUk0zuGqVCaOB1NyxyCjIOw026J03NazoEj5yBO
	6aWns+6qT9tvZGB9Tdh609UIRRy3XA9hAPkxJI1EwmCJPM5VRj4YAqduPDmWzsz7I6d3zxmA5pw
	XBk+fiS/TyuC6DNSwZ9kKQMro8osObT3+ob8WDBMh7EkIsOzXUv9n0g9MP0ZRDAtTTBHHDugfHr
	tp6EiGVaNcaBeu5Rbr15RVGPTVGLrYSxYJIsiu//adEYbypkBS/6bxI2FQ0dTiqsmUXD6sX+xkD
	50sxYGbNNftHUv3iN6ZfXCqVEmTK9zdq4kL7fOVnYVKTIGw==
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr152423265e9.28.1793543437168;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun,  1 Nov 2026 15:30:33 +0100
Message-ID: <20261101143035.880469-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Changes in v2:
- Patch 2: get the clock in the I2C probe, as rt5616 does since
  b5c9df40ca56: from the component probe a deferral was lost and a rebind
  leaked the clock (reported by Sashiko).
- Patch 1: unchanged; picked up Krzysztof's Reviewed-by.
- v1: https://lore.kernel.org/all/20261025145354.3476371-1-romain.tisserand@gmail.com/

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card,
mclk-fs 256) on 6.18.54 with this change backported (the bias level read
uses snd_soc_component_get_bias_level() there): i2s0_clkout stays on the
I2S clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and
both play at the right pitch; v2 tested the same way, with the clock
taken in the I2C probe. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages; v2 follows the Sashiko review. I
reviewed and understand them, and tested them on the GPD XD as described
above.

Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml         |  8 ++++++++
 sound/soc/codecs/rt5631.c                      | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0

