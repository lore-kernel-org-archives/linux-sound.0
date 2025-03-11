Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7A325E83B;
	Tue, 11 Mar 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710861; cv=none; b=Inc/0v6lOumPXJRpvMzkfLvPELukTycOtS1TEvm5hXM7Tvc95gZS8zxhX7KwpcL/lzPBclGZFFrWEJ6D1lgWvoKhvDIaYYHFj0qNJ7wYwvyrx6aX+dQ8BSA6joNB+5xDF+Xtj+eDDKmRKRzDf7txef3uUvxAjfZjrXo6Wyg4RDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710861; c=relaxed/simple;
	bh=XpWGcgDN8sRh4sREnYbb6i78j2YmB02D/7tcOiVP59k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aGAWjbv8XFqOsR+dnWOkSlvrshJ1uDSF6Hbs3cjxoRVTHh+lUoWMPkRtEq7BPdQ7jikARqUgHIvqpfJ7G90OAaM+vu03WLkwGXtGKxSVF3yVy5/rG9JiG19HwzV9mIocHbTZ/nO2bu9XSfrJKy4kq6e4BAQUqI3okoF9z2ehSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h32y3aZ6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h32y3aZ6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43948021a45so49061205e9.1;
        Tue, 11 Mar 2025 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710858; x=1742315658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=h32y3aZ6mg/gEuXUpojQvQGuOuPux1pdPCYcshbv7Y3+Cz5lYfV/Qsfx0Qlfc91LM4
         qrQfYvAYH5mRJR4FbEiOsLDBRmDXBmovomQukI/uKX+KmAAceP+YpG94hGF6rBguoYoz
         BH2fVR/YkcMmQJGVJhBJRmQu/Ihp/peuz5WBrYfQ22pRXkZkEhRV2cub0GTWpGtJfeG5
         RjSP0gJRchJQjaSGo5JDFvwNs9eRKfHQlBosejGeDexeUGsv8Tr5wfXV+O20/1+Cd4zv
         kFjWV0IUxm21G7kYD4FgBjUTrIwEwEapKPuPPVYbKaOR+59EF7PfShQAda5B4kT61BH7
         VNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710858; x=1742315658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIDBs7DD8htZivMkrDKOWUTb71/7yaXdmxjJ1UItOWw=;
        b=pa0ZhRqQGw2vmltdqykIINwWAnhsKAJUgKbExbUpuH4FMGGWSiqq0tD0Lyggm3cpdD
         21LD5aoeFLCodo+J8CGOQA8yBtkAYA9RJtHIvApY6mZbTI6vqrydX9dXyueYokGHmahz
         /EuneuwoRWlpPTvIpAOcWNfySdQ8IXbpLmenWSCsx/k3g/m1/KqC8X2XrpStwBBMmSZQ
         6yEcdVBKYb7sU8OqLbMeZcPExniwrzPLn+3xJ3siLzywWceIKpOw2vBPL1vdphc8j8kM
         E98TPt7SZMGfICAgdCr0jMtkZb0dVGX30ng8gr5xqUnH7DgKENcW1RJDvCkIDRnbqDJJ
         H8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXO2Qqy2m7BeC2eCkOZ0RZNKiWwIXacefhzXa3WdIDKH1+zv1gldWVYTuqzOmisdY66w3/2owyCEwId@vger.kernel.org, AJvYcCXrT9Y0VJFNgqrqpMJR2B2YARgcCihuYLSVb9M2CxElc7crlzuV9H7/PiJFnV98VzVlH752DKPMPWV3NM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQCelAUnoMCmKK55S8p31WTcflVLxauXaknHJimmf2GNB7wHO
	HjHsz/TjOVh5MpITkLZd1dJPuXgGsjveh7Y7oyhaDkdeuUBqZgop
X-Gm-Gg: ASbGnctg60fYwmW8MI6E9Yqmux01KBEgOIR188PDZ4J7wB30JDg+DJxo12yGojazEXA
	6yWA28RONN8K8r1tnVltLU6X0dl9UEaijEo0Ksh8UdajjyW4P9CjnP2EH2Cv+IUAl6Zg3e/Ko35
	cszXD6iJPX7SLuD7ftUHn7U5U869xhU8487FaH9vsXvW39o9zG48IKp9oBYljSAOc6p9m5SxV25
	YzO4mY4YwnN603IjDyNoQbFP/PxpGAkktN12bAVCt21oqOs58Nzu8RKIg0Aisjay5sROYrvjHTZ
	vwRycwf9n33GRSHvKj/rmKqIJYYqeu0NjsG/lROJ77/nMmch0jSlZBWY2AmF0YOWrzLSXn/2uTo
	H6uS9ltg=
X-Google-Smtp-Source: AGHT+IHdsDUwn7BuB7/yHC+hyJsD9u0HfbePtL8M8V5c5UicG8UQVf8a0J+pTxBUDdadzKyEwrdEnA==
X-Received: by 2002:a05:600c:4ecb:b0:43c:eeee:b6e8 with SMTP id 5b1f17b1804b1-43ceeeeb9fbmr90756515e9.21.1741710858030;
        Tue, 11 Mar 2025 09:34:18 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] add sof support on imx95
Date: Tue, 11 Mar 2025 12:32:52 -0400
Message-Id: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

---
Changes in v5:
- added comment in the DTS regarding the reserved DMA channels.
- addressed Frank's comment regarding the widgets/routing properties.
- changed codec and CPU EP names to include SAI3/WM8962 in their naming.
Previous naming was too generic.
- picked up some more R-b's
- change soundcard DT node name to the more generic "sof-sound" as the
soundcard might support additional DAI-CODEC links in the future.
- change the soundcard label to "audio". Same rationale as above. The
SOF core will append to it the "sof-" prefix, thus the resulting name will
be "sof-audio".
- Link to v4: https://lore.kernel.org/lkml/20250211225808.3050-1-laurentiumihalcea111@gmail.com/

Changes in v4:
- addressed Frank's comments regarding the DTS.
- squashed commits for common and imx95 bindings.
- dropped patch introducing driver. This was already handled via
https://lore.kernel.org/all/20250207162246.3104-1-laurentiumihalcea111@gmail.com/
- introduced two new properties: 'reg-names' and 'memory-region-names',
which are now needed by the driver to work properly. Because of this, 'reg'
and 'memory-region' properties had to be moved from the common binding as
'reg-names' and 'memory-region-names' depend on them (you'd get a failure
when running the binding check otherwise).
- added missing 'bitclock-master' and 'frame-master' properties to codec EP.
- addressed Krzysztof's comments regarding the imx95 binding
- added Krzysztof's Acked-by
- Link to v3: https://lore.kernel.org/lkml/20241216145039.3074-1-laurentiumihalcea111@gmail.com/

Changes in v3:
- Ordered DT nodes alphabetically
- Removed 'cpu' and 'cpu_ep' labels from binding example
- Some small changes to the binding commit messages/titles.
- Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
- "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
- Removed extra empty spaces from DTS as suggested by Frank
- Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
placed inside / is kept the same for readability
- Ordered driver header files includes alphabetically as suggested by Frank
- Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
driver as an offset to the start of the SRAM region.
- Added new binding with properties required by all NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).
- Various driver adjustments made to accomodate the DT changes + some bug fixing related
to the mboxes not being requested/free'd on resume/suspend.
- Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
other way around.
- Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (3):
  ASoC: dt-bindings: support imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |  4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 ++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 5 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

-- 
2.34.1

