Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413719DF4F
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272694; cv=none; b=iXmARll9UeoaUx1YW2VpgtrEdqpa6RhrNsCJr/6r0B7Gf9B3KH56AaChQDTkwTyct742z5bb6VbVj7Sm2T1wg1V8hI7xsF2qG/+7bFGi1mlC3Qw6GZeuqeuZxnlcXgQAGsGLUK0dziA00u2rvtdF81O/voRxtSeydLl2b+KzfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272694; c=relaxed/simple;
	bh=L2NXhYYRLt8OIp+LSK83T3wVNVp3FYPqt22R7zQ43L0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gTvs+iGF/WUZZRDUOkzJZ8bM20u6W1jx4LWoOB7P+DqZnEKY8ryQfDP8tYKJvnKZ05LTqvhVyO/L0T1pXkZST4+gFJN2eHIyXnmHh2MLIxT/2qLc0oIlAlCV+uHaVKCtl3nZNg+FyQpuCnoZfzzx/tOFyjNfzMJtvXAvOnNZ2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duSD+Kz2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duSD+Kz2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so2601406a12.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272691; x=1765877491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=duSD+Kz2X3Ha9zOWpS+WcwkgwLbBTLBjF+ZmogaMhUz7DNuZBwayVPFlMx+XN0KeJq
         Ih7eX9Ua00bTh72Q7T8pJ6gXsJrRgqBLdys4JuSs2r5nTyi7pstOiswh2LUyv8aJ/9os
         VMATXXt7MCfs7yIP6dD5WDKxNm2/NKzdgxGgcQwuTxJkW6BI3gHapnxn6PrZfk4Ly08v
         dd9A+xtYViuyVt8/d5yz2a7uq0nvLmyFMzS4Y2Q7HYq0O09+wil0ye4nQxYlI5B+ezBP
         OpF8ZfC4w1OFllNR18JFEt4K07OAwc54amTZkBDpW+hXtR3RYzQEPK7d2lmwQSPSZrDH
         +NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272691; x=1765877491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=uP9mxnjtZyF44TPSUiwYW6Rjg4fKiKOSCd4sfy+EvrLo3Kc+fer+79ed0iSTzCDUuo
         N12R85Z5haF3o2ly9w7AqwX/rSpmJe07I4KdYkK9NDy93f1YRIlx8zxyg2BY2n7sRoeq
         heYQAGWYH1lp6RnA2dWAPPUrXKtz/QgndCqvIlcj4oYewD840DURK5ykRVfjVeaArasL
         HytZJiz0vzwyS8SgYTQ20hxr5MzbSJnDQb59LsnSxPeEJkie/fhbmceDIn60MQ32Sxl9
         +kbquPvKnhWwcHtGxF3PBXURjHGJZVzBY0NJH5nBsAya26D8KKl+uS7hJrOzDDWW+Txf
         tXjQ==
X-Gm-Message-State: AOJu0YyjQ32P6elHNHov40iiGSu8aUxVeF2CCNP3cJLL/cH+JDVAZg2M
	9NazbWdFPWhjT2WDTau3BLxuss50eMRCT4ztkBCh3/JDJQUVAqJdM+av
X-Gm-Gg: AY/fxX6VXVF7Wsb9FMjBTOdBb/EfYP1FM5gNKT6VJA1ma3pDfTLDuFIAXaft8SkIDDl
	rg+5ot7yd9f1WNeW5haCZ0E17hucH7e/Sc2ScOLmpsQd6PdpJxni3W0cftAlGkJU10C/Q8o1JLX
	As2C6uR5EZsRYnWu7DsFY5Vd6w14UCJNAiwRMHakdY4saiwpIFrKv3igFW/ryR593BufgLSt++y
	wOQKM8jWGHIj/vboyf88oFbVx6/EqpUIKtW5qEQWGWPT35KGlRTtvxGVfaDVDptFkjwpywIApzm
	YV2C4qdTeZsxXQeqn11MRTYpHi5zQZYAIxtuxb9tnX28i+yf2wU/wux3OaOMrR8qBQrHLtkl62i
	lPPsGbQrG1WMpCU57mKf038AnJ1GeWr+IzUn4ihzcJ/EAAQiUZZaRx6Yil6wwA+kCIKa0rCqPCK
	eoUJ9O2hImRTm5KpSz9Y7hpOt8dsaoq27HaVkSPPAFum4TvaLxa4OOoeKstSk/QUhjCbY6wL7PZ
	BjA7vUspvz3tntdW2jouwbSPqobI1rI7dsnutTVRwUThMW7fBzVINC0VvQZrrELz4d82qxXUucO
	Uz0pnCTtT4jIMz6A1zxJOSogKb/VqZGBc4WNkYWSDJnE/xtcT6Q=
X-Google-Smtp-Source: AGHT+IFL+1r/PaRqVVNGXNwojrxl0XaiTGaLLglD0VKcZyQgQAl1LXB5j5aWz2pOa2uC61OCwPtJew==
X-Received: by 2002:a17:90b:3fcc:b0:343:72d5:2c18 with SMTP id 98e67ed59e1d1-34a4f89b3d4mr722746a91.12.1765272691298;
        Tue, 09 Dec 2025 01:31:31 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:30 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/7] ASoC: basic support for configuring bus keepers
Date: Tue, 09 Dec 2025 19:31:13 +1000
Message-Id: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHsN2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwND3ZKUXKBQTqpucU5+SbGuoUFSoiVQyiwl0UQJqKmgKDUtswJsYHR
 sbS0AIqk2u2AAAAA=
X-Change-ID: 20251201-tdm-idle-slots-10ba92516da4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=L2NXhYYRLt8OIp+LSK83T3wVNVp3FYPqt22R7zQ43L0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Lqeleti/sfK8JcZtv+e7XCRM0YuTVffT1bNnhu3
 WXgcK2gYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUJpxkZTjp4J+y6LttmvjF4Za7M3z0nFh2bcb7x6n3jb5a5zd3vfBn+Z2utDpe
 3nlC34vKxrdN+SP6WfPOB9UO38/QY/t3v+3lfsAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces some infrastructure to allow platform drivers
to specify what a DAI should be doing when it is not active on the
bus. The primary use case for this is configuring bus keepers which
may be integrated into various codecs.

Consider a device with two codecs that report voice coil voltage and
current data back to the host via I2S. Codec A is configured to transmit
its V/ISENSE data on TDM slots 1 and 3, while Codec B is configured to
do so on slots 2 and 4. The receiving end sums the two together.
If Codec A transmits anything on slots 2 or 4 (and vice versa), the
result is a bus conflict.

Some codecs include configurable bus keepers to ameliorate this issue.
Notable examples are the TI TAS2764 and TAS2770. By default, these
codecs keep their SDOUT pin floating during unconfigured TDM slots,
however this can result in garbage data on the bus. TAS2764 can be
set up to fill specific TDM slots with zeroes, TAS2770 can hold its
SDOUT pin to ground.

This feature is necessary to properly drive the speaker systems found
on most Apple Silicon laptops. All but three models include six codecs
in two groups of three driving two woofers and a tweeter on both the left
and right channels. Each codec group has a single line for SDOUT, to
which all codecs are connected. The two groups are then summed on to
one I2S port. Each group must ensure that it is silent on the bus while
the other is supposed to be active.

In the downstream Asahi Linux kernel[1], we set up one codec in each
group to zero-fill or pull down its group's side of the bus for the
opposite group's transmit slots. This is done entirely in the codec
driver, however this approach is perhaps over-fit for our use case.
Following previous mailing list discussions[2], I have tried to
expose the functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[3].

Regards,
James

[1] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[2] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[3] https://github.com/chadmed/tree/tdm-revised2

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define TDM idle behaviour modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   |  4 +-
 .../bindings/sound/simple-card.yaml      |  4 +-
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 66 +++++++++++++++++
 include/sound/soc-dai.h                  | 20 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 323 insertions(+), 33 deletions(-)
---
base-commit: e4deadb3e562aadf2825f28be3dcbbf01cf2ef17
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

