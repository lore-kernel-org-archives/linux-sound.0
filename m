Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5537F8BA
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287203; cv=none; b=ZuIuQPsoWqxinJwSczcH6A8mQ4lUKfZAaQTnFmCe8cWua7EbhXjcST7ZglwRePiwg79csD60gCS8DXvk0dfSlF3jc1U8BgBfUZH42Rj1Pk3KOtBEbqAGUuXIn0MKCFWF1mydEQW4JlJX67srldMmpRiQ9FDJ7W7ePKJQFGXaITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287203; c=relaxed/simple;
	bh=qRHSC5phIZPW5Ca8Ib2JUQTlHTEXOPJIKe1HckYWaEw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BE9paul04MZ3w4IFRYdScMmdnqG/7e3XNDNdO9NWXNmww4SgNMlkA/0VWG7lw2UvYfT7OetKgfmLRuodDPttsCQbQzHB1SB84Q/dQTXtr9zQUu7CfuZkDj86Xn2v71HE0lBpd9gIkO7X59Z+jtUoMSpxQt+bx3G3QhliJPy2jTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=hs1WvdIn; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="hs1WvdIn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c169ae1cb26so343997266b.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 21:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287198; x=1787891998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65OzRDOw6tie8Aix12tqjxniJ5oDLhGIyjGq0d/QKfs=;
        b=hs1WvdInSxlG3LlFJFS6MbvNoiGh41xPdrBKK6KsVIUxG/tCUXQzyJrsH/fz5kVYLH
         3rCa8CzkZLDcoi+LXZptdusYWtDbE2j2XAqHcMCEI4aZp1jRIx9qTFGomAGwslfUuex1
         FgSNkDvgWc/3SkvqVVgIBHtfecXZX7j3u4beijKWpGSmW3+QK8NaKXqzor9jNO8yQRh5
         RHMMaLBABIskqcpftYK00vsSvi1raGgQtDznF/ofXrw4Cl82cR5CNdkNJEl9/eDJVWRu
         KXBrMWiV9pu190/NciPkRINIRiK1VlY/Lpr9wrk0AMmw7JQEwgEmOHwuk+eQ6UXHbobB
         UtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287198; x=1787891998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65OzRDOw6tie8Aix12tqjxniJ5oDLhGIyjGq0d/QKfs=;
        b=XZqCh6c3i8p7FUlPJCnvaDFVhnblsM6M/HvmsIYpxhTOCsKOcC/Tp9jxkbWW1Hjywi
         mRKBmsuqbNv9c0M1I4W96poKsP81ujsFRdWS1K17+Lsz/5OBLfzKjfgmLxJqASWpGdb0
         QzBiGWoFddKW/DdHUPx78RywaIYhjj0g7PYeFJ8lX3rUfV1CpUh8MOhim/vPf6O3yEmO
         6k25boXAqlwMxDWXTcQVB7BOSTRctOe79N3CjGATxEMiTeaghp5ZzpDtYRUQf7EpFFrW
         C5rgXewJTe67Gq5W+tMWb94GPO/5VM2uWB38s08z0+mCOZ/Ce9IpqvNp1kArEwxpTw9N
         vTxQ==
X-Gm-Message-State: AOJu0YymtGm+hKVRg0uSq5l59CtYDoNU6tZAhIgc5WlWaGZ5pP7kWSN+
	NydU7vagC4esbM5a9wvEFTtK/KX38ewd6rTNRMzDSRTry32mfcSc8BzjfnPIy7fA9Dw=
X-Gm-Gg: AR+sD10oC7cOO1bQmWZPdrSjh5Hr+jmb05JiP576EYA/MzZSLH7qc9r2CAz6gkuTE34
	Q1fXSDn+dzqFlKnXyvd3LZ4/ruFg69jy82GM/77VaunQBUJ77uULzta9G4O0MGdOuj1g3N7nxeO
	XYei0toolORgUoq7ZEONUE4c1tINZY+pAOpHpsSX82obolxFkXQN+u5dG6FMpvfuvE5W1C5g/Tf
	3RWdngFjCA8XrhD7xAKfhhRzgYvcRbjyITCAw/hZhvUoyUKvhVOJ0OYZ2uu5LrykMFizsWVHTgx
	tQXWWCBsI3awCvn1Ub/jFrCL04pYR9LCNi2GEqkMuif8VpcAfsCEtFoPO4eGzBroy8q6Fk1rpGB
	Ku4o3cm/yZqIzxKwbC/GGZh34uaEVeeGIM26sUOnzW6M55/R7zz+e3EFAPBraDS1gK55oZFSuCI
	GRZ3sAEuUKve6XgJwlhBQrBw5qc8wBhTg/nczL4+v/76T0+TSbDIenFnPWIxTlN6vGxXQOGejUT
	gk=
X-Received: by 2002:a17:907:9345:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c246d633d8amr246738866b.5.1787287197824;
        Thu, 20 Aug 2026 21:39:57 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:39:57 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v2 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Date: Fri, 21 Aug 2026 07:38:55 +0300
Message-Id: <20260821043859.171871-1-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the ESS Technology ES9039Q2M, a 32-bit
two-channel audio DAC with an asynchronous sample rate converter,
controlled over I2C. The part also has a hardware mode strapped by
HW0/HW1/HW2 with no control bus at all; this driver implements the
software mode that MODE = GND selects.

Two things about the part shape the driver:

 - Selecting an input format takes two registers, not one. INPUT_SEL
   chooses the port; SYS MODE CONFIG enables the matching decoder, and at
   reset only ENABLE_TDM_DECODE is set. Selecting DoP without also
   enabling ENABLE_DOP_DECODE leaves the part hunting for a marker with
   the marker decoder switched off, so it finds nothing and mutes. The
   driver writes both.

 - Several registers have non-zero reserved defaults - register 88 reads
   0xb8 at reset - so every write is read-modify-write.

The programmable FIR coefficient controls are write-only by design.
PROG_COEFF_OUT is documented as a coefficient readback but is not a RAM
read port: it returns the last coefficient written, whatever address is
selected in PROG_COEFF_ADDR. Measured with the driver out of the path,
five sequences, ten reads, all returning the same value. A get() built on
that register would return something with the shape of data and none of
its meaning, so there is none.

Every control has been verified against the silicon rather than against
the driver's own read-back - written through ALSA, then read over raw I2C
- and DSD, DoP and S/PDIF input are all implemented and tested on
hardware.

ESS Technology has no bindings in the tree today, so the series also adds
the vendor prefix, taken from the company's domain esstech.com.

Link to v1: https://lore.kernel.org/r/20260820062626.39218-1-karl@asseily.com

Changes in v2:

 - Accept SND_SOC_DAIFMT_CBP_CFP rather than requiring CBC_CFC. v1
   rejected every provider mode but consumer, which was one board's choice
   written into the driver. CBP_CFP now programs PCM_MASTER_MODE,
   hw_params() calls clk_set_rate() to pull MCLK to a multiple of the
   sample rate where the clock allows it, and the datasheet's two MCLK
   floors are applied separately - 128 x Fs synchronous, 130 x Fs
   asynchronous - instead of 130 x Fs unconditionally, which had been
   refusing 192 kHz on synchronous boards that can carry it.

 - ES9039_DECODE_MASK did not cover ENABLE_SPDIF_DECODE. hw_params() uses
   that mask to enable one decoder and clear the rest, so the S/PDIF
   decoder stayed enabled alongside whichever decoder was selected.

 - mute_stream() and the "Master Playback Switch" control both wrote
   ES9039_DAC_MUTE and overwrote each other. Each now records its own
   intent and the register is written from the union of the two.

 - The DoP control returns -EBUSY while a stream is open rather than
   half-applying a change hw_params() will not re-run, and both halves of
   automatic DoP detection go through one helper under a mutex, so
   AUTO_INPUT_SEL and ENABLE_DOP_DECODE can no longer disagree.

 - Status controls use the symbolic source-bit names rather than bare
   BIT() values. Doing so found a bug: "Clock Fault" read bit 7 of
   register 235, which is reserved, rather than BCK_WS_FAIL_SOURCE in
   register 234, and could never have reported a fault.

 - The volume put() raises VOLUME_HOLD around the pair of channel writes
   and drops it afterwards, which is what the bit is for. A stereo change
   previously left the channels briefly at different levels.

 - Rename the vendor prefix from "ess" to "esstech", after Krzysztof
   Kozlowski pointed out that ESS Technology's domain is esstech.com. The
   binding file, its $id and the compatible string follow.

 - The harmonic correction controls keep their names rather than gaining a
   "Volume" suffix. The justification in the comment was wrong - TLV data
   is not what decides - but they cancel distortion rather than set a
   level, so the name stands and the comment now says why.

 - Style: the header block is one C++ comment, and the "return ret ? ret :
   1" ternaries are plain conditionals.

 - Add the Assisted-by tag that
   Documentation/process/coding-assistants.rst asks for, which v1 omitted.
   This driver was developed with AI assistance. The board it was written
   against, the register-level measurements quoted above, and the
   responsibility for what is in it, are mine.

v2 has had a run on the board the driver was written for.

Karl Asseily (4):
  dt-bindings: vendor-prefixes: add ESS Technology
  ASoC: dt-bindings: add ESS Technology ES9039Q2M
  ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
  MAINTAINERS: add entry for the ES9039Q2M codec driver

 .../bindings/sound/esstech,es9039q2m.yaml     |   61 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9039q2m.c                  | 1621 +++++++++++++++++
 6 files changed, 1707 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
 create mode 100644 sound/soc/codecs/es9039q2m.c

-- 
2.34.1

