Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452263;
	b=LiuZ9DeEiPOthvtyYgzTabIKgRFW2SL5zsYZ0DNl+S/fPxZJimC1ycVtqhHJLFiFhuLu
	 K7TWc1CyuvFi1AHRowiYeTLG6WPkdz3fCCNNs1XkVDOqW7HSDsPIG/UgpY9b0RN0CXAuU
	 /7kKfKx86r+u2/G5shlv+5mreSw/Y3YST67dZn9C9rPaQFUropawwKkWUiGCkQ7w9dSWn
	 YpNY1VJaA6xJBhHJRypsjllkGe8KNREf3bIwdT7SJ74lbVlbNu9M5aIcm7LMzWANCqvJv
	 iTW8nJFBwvgqJjbG8L7xYJok5j0pJVtQTWXQbv0vWWTm7hz6bqe5oBoezU11Ct2J26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
	b=UixL1Mu+z8RvPwL0kIK8RgJfEWW2uykKJ0T52tE2hXYKjtPIPwy993+/AmVvjmIl/eom
	 sMZkXqVPi9YG8gJGjRtT2Mlqt1Lt6ItCYmLt62stmugfwXtuh6CRQG+RD66P9AFrBggG7
	 1lJv3vjjr11T0iUPdRf71OxvKyh9BFGh1ojZeDNQXs6OiWN/42QVVZCmYmVS2bNGVgj1f
	 WqdDbg2f3NRIWUT5BSH8TrL3nwPUl0ZLFAFsm2Yro1pBd4DVygMLIF2DQlbSdJemO2KVW
	 htafuzBo+mUdVn8yJYCGYngAAcIoHCGGenD0G1ULLe89e6xwJPL3/hFoL2ObRFvvsqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AZ0qh/2X";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC5606A319
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DC5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AZ0qh/2X
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so18666365e9.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452261; x=1793057061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=AZ0qh/2XqoUGHLX3K8f0Q9BjFen2hJUa85lAbJGI9BCfnIlFwde+MKYuxxqHc0S2D4
         DSy3xR6paSHfp4wgO9YqSuJvc6knkW2ZFRqb7a8TEJxSecJTpkKB7bUsfpmbd4kVHaOu
         qMG9SVG1YDq1D6wOvazUjWUm/d/8AndSy20IMX4/dOfmxVsRgVqk7vtBqbBCS4Lny0QQ
         R1nZRqRSkmL0Qeouq7kpxEzJP/4uBT1dPCAMW5RbGbalKo1GUcvGF06QhG7gc1cNPmpx
         L7eIzhcdCrMKDH24Fspq6dxnBvoOxdxtuuI+sq/n2SldGr7BAe8hXGjlSXkyDOKAOIgl
         RLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452261; x=1793057061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=zuvlO1f1qBCcPFXHLkpMU6icCr+Qs/8wXL6ZuUla+/l1UhhCN7hdBwywObKJucGp+1
         mdGWmQ+g4bjjj4tGXNX6P2/eyLG7CisJj7MHEsAi/KdNd0Yj7yC9ZMV3dopvJjDsonWq
         z0gv4MXPTfOvNhGIHBqg8ME6APllyZ/AG2kN7NXmv0TEzXhiDSYRT5fvjMxMyeE+rFuE
         WJUNDAyDSPZp6O5pOdjDRMQwE/2CTkfLlZPPGbgEY+1qdyIud2IkiMQdaEVE0A/VV91H
         ueUN5Fbu2/t7xceTZqe/egiGqTg5HygoYLiuaMPjNeWkI41XiiIt7pflOrrmy5PL2i0C
         ellA==
X-Forwarded-Encrypted: i=1; AKwUvByGyOZx1H/fbk2Wjhb6o1iW/XW4HltifPCCcuNcoRqEfILIgTA4QglGlhsvDCpUUD1LRiwyILeA5m6eUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9aUftCP03nORLNhxEFb1n8xat+Imv5LSG8ROu0tS4b5zB4ajd
	9DxbwodhK6BuVZ06OplaWqTNoFsRW3Nf8DY0Xh07y+s7oFz/Lnp/4stusBVsIw==
X-Gm-Gg: AYBFou0Rsja5RMiwZTNivCl+NXmz6fbbz8iZI000KaVLiOhvQZQ1RXKK5r+mBZIb9s3
	13dUOqbH7C8GAJ5DuozSHZurVE3sIoBmIb4ho8cfVL0UrmYkU7HPsPRHUcrs+fWvh1Cd7c8ZZVu
	dCVMLOhfpJsDJhYAbH6DCOrOa3RSWrEx1us/VxhVCoYT2hifX4SfJjRaQwy2vqKBKe/aBtdqUa0
	OZj0DqybywX22DzU/XxHtSpkgYBiwkJ1BoUUFMAQWQGJkMrRFMjfxaTvYfVI7gTWPNP2YjzHtHJ
	eJUagQqFThc0OsgXcfsANEdnjeZEOw5h/NADQoKvFWL0D7CX0XFx7gADzn5Faq7u4qfobvHuylu
	ZJfjbdY7GZ89O2Aiv5HFyX/iTEcHKTt6rQOWx1Rzv5zWcOujHP1fsmDMCtGFTxm9kyOx9sjv6x1
	ENU5+4ezlJ1GocoLNN6l41FpGWYUkEsTSV8tKWjG6+GGKid3sLOnWvRNVZjHSN9Te4vykJP6oOm
	7NfpZG3mkNznBlx2koV0JACR/p6iK0EfCJIci5oMDE7HflqNMU0sJ0wzzfRJtww8maahuLBz62q
	klM=
X-Received: by 2002:a05:600c:1c16:b0:4a1:f03f:f1f8 with SMTP id 5b1f17b1804b1-4a1f03ff47emr45105695e9.3.1792452261130;
        Mon, 19 Oct 2026 16:24:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 20 Oct 2026 01:24:09 +0200
Message-ID: <20261019232412.516028-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 906 ++++++++++++++++++
 7 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

