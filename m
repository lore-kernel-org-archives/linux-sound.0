Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712738B7DD
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207200; cv=none; b=oPobM/lBBgXN/Jw7Xo4Row0+STy6YivRxQZ9eSAD37THXBUYzr0C1ugJ+McynabhUmZllPu1DD0Fp5L/t4T+Bo1SVlKdd1DQAPd360eABJLrxelTcM/u1e5EcZErtw1+EENN93l/n6TdEspIDFo6jeKBZWyESw/kUPOtGnvzU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207200; c=relaxed/simple;
	bh=c4Zi6ltrQ+IBdJXq15zuCVA7w7MPudA2PTXVoYz4SWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MaOQBqwXa8wTfXlBl/5HGd+A73uasKSfehj8LO5LpV068jYQh8gF+jHytgwW9hJTolZMvK871eAlNlrsBaUvahO9cHEgXh9GZ8Fu13Rv/sYJJL6B4PkRaCSkt6perZ+DTdbNJQxLJZCo7YyIGwsfJC0+4wrEHgBuzym2yIAslnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=bBn62jGJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="bBn62jGJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4813ea321cdso401205f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207196; x=1787811996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/WL/Evlk6Q4jCM2DetE7l0dros1woCfma76X++TRb4=;
        b=bBn62jGJPemg3tDvF1WF9v+g6D4+RwMa7Cg1ocqJN8A0TBUrelPQhm0QpQsJYAlp0n
         aQdLx4nY1+F3NurusBEr4zN/wsjPrK3aikFhRUE2AX+5kDYMG8seNCyLL4ZnNKbMUvxZ
         skLofLu3EPnwA8S5nXT01Sm8byqiP6IFld+bX8RUe4x+e8XQAp8RyKVGVjZkkkOCdGnS
         bSZ/seunOFTFmwh1k2p1KEhd6u1vKbbfbqbu9nWJwDjYy2GBh73wptRelIDc7VvWkOAq
         Tvv1m99/H3x9YopigMz6eeoXrUn1vIYxOOoohpNSkhOaBC1OPKhn3AMg1Mxq5DsHZ3Ck
         +SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207196; x=1787811996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/WL/Evlk6Q4jCM2DetE7l0dros1woCfma76X++TRb4=;
        b=J+3tbbt9trmIkEUOrCp5msO8OyV16R6ZWUNbOjyHdnNYQHNKj15hGaLBkH9RYl++Lu
         GX20q+6lLoSWkGCT6fdFTP/jL0YHS+BWoedA9RhMLfO2FrYNZ+ua+kgF6Ps+GsHewvso
         g0KExlKhMH7hMSngb0y3hRiZgwhoXMjfp8pKgEJm9HsVwz6aOuY/Yje24ZJTE+hhg2G4
         d4pSg+887FBo5HBRR7+S1D+iSGZrMQlrk/BTKrmlRA8d7N8j/TO/GG4TvSMVN+n41YDa
         4leekS6ZL9t09ol/YqLjW3CEC88zSl34R4od+dybm4YEYGvNBbEckiY95sdomsNAym9u
         3Mgg==
X-Gm-Message-State: AFuF++l1pinmpBNZ6m5PT/QmtQRaL1YhIBOCgXH+/vwQt4/2Kpv+lFQw
	Hlzza7k1fJKU8h09BxEpoJAxN1lpLc2SZ/s81AuqBMVZtSeXKlpfrFfih9Bb0ig4uHs=
X-Gm-Gg: AR+sD13xuZ++ae69IIrW/CxcPL+zQIogo/KiY8+HFmp+i4FXmlvQmH4ja3H1YhzdqEg
	xdBVsoiFazaloLX1JwQlQB6RUwAXNLtQDSDg4biD/IPn+lmVE2kFBh1BPJQ43sPOlgJnEYN2Edx
	xbYe0aDsFiGdfXbxpOHnoUsFFrK3+TguEsPbDn/mBK0IJGSNg9UCUo82du6D9b4uaGLKnb3rHlb
	5mzl5/3jV0YWo4EUrRQm22q7DtfJxAOhtJdh+Me9XEBdYnAjiQvxePmdUQdCL+X9Yva+NLSsXQN
	BiKNBkjpLfGqU6vJM2umhrt/LU6adpcof4M32K9uXxrYzXHkXrPjI/9BDqXvw3xqU92ll5+Ty2p
	jfO/cU672iXOPVOzl7ROPrJAbTfNsxmMY4b37LXG8D3rn46kz0YkiAPd4uJBftXovVtwZueucio
	buL71I9L4+WEX3wCgJC5/9KvLXItE3WPkcUbFVUPItTz8Khv7vdHNmWf+AcrsOgZVUlKi2UdtS6
	I8=
X-Received: by 2002:a5d:6f01:0:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-482b74dc7a7mr6325494f8f.0.1787207196081;
        Wed, 19 Aug 2026 23:26:36 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:35 -0700 (PDT)
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
Subject: [PATCH 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Date: Thu, 20 Aug 2026 09:26:22 +0300
Message-Id: <20260820062626.39218-1-karl@asseily.com>
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
controlled over I2C.

The part has two control personalities selected by its MODE pin: hardware
mode, strapped by HW0/HW1/HW2 with no bus at all, and software mode over
I2C or SPI. This driver implements software mode over I2C, which MODE = GND
selects.

Three properties of the part shape the driver:

 - The ASRC in front of the DAC means MCLK need not be synchronous with
   BCLK or LRCK. A board can feed it a fixed oscillator and never touch the
   clock again. In that asynchronous mode the part requires MCLK >= 130 x
   Fs, so the driver installs a startup constraint deriving the maximum
   rate from the MCLK it was given rather than advertising rates the
   hardware cannot honour.

 - Selecting an input format is two registers, not one. Register 57
   INPUT_SEL chooses which port to listen to; register 1 SYS MODE CONFIG
   enables the corresponding decoder, and at reset only ENABLE_TDM_DECODE
   is set. Selecting DoP without also enabling ENABLE_DOP_DECODE leaves the
   part hunting for a marker with the marker decoder switched off; it finds
   no valid DoP and mutes. The driver sets both.

 - Several registers have non-zero reserved defaults - register 88 reads
   0xb8 at reset - so every write is read-modify-write.

Everything the driver exposes has been verified against the silicon on
hardware rather than against the driver's own read-back: each control is
written through ALSA and the chip's register is then read over raw I2C.
That covers the eight filter shapes, the modulator bandwidth, the IIR
bandwidth, the four signed 16-bit THD compensation coefficients at both
extremes of their range, and the automute enable, time, level and off-level
fields including the neighbouring MUTE_RAMP_TO_GND bit that shares a
register with the 11-bit time field.

Two limitations are deliberate and worth stating up front, because both
look like omissions:

 - The programmable FIR coefficient controls are write-only. The part has a
   PROG_COEFF_OUT register described as "Programmable FIR coefficient
   readback", but it is not a RAM read port: it returns the last
   coefficient written, whatever address is selected in PROG_COEFF_ADDR.
   Measured by writing two different coefficients to addresses 0 and 1 and
   reading them back with five different sequences - plain, with a settle
   delay, with PROG_COEFF_EN set, with the address written twice, and with
   a write-enable pulse after the address. All ten reads returned the value
   written to address 1. A get() built on that register would return
   something with the shape of data and none of its meaning, so there is
   none.

 - Coefficient uploads pulse PROG_COEFF_WE per coefficient, as the
   datasheet's sequence specifies. Holding it high across the whole upload
   also works on this silicon, but that is not what the documentation says.

DSD, DoP and S/PDIF input are all implemented. DoP is detected by the part
rather than announced by the host: AUTO_INPUT_SEL is enabled and both the
TDM and DoP decoders run, so a player can simply send DoP-encoded PCM, which
is the only way DoP works in practice. An earlier revision of this driver
required userspace to select DoP through a kcontrol first; no player can do
that, and the result was that DoP-encoded material rendered as the near-
silent hiss the DoP marker design deliberately degrades to. The datasheet
attaches a "data must be provided on the DATA2 pin" condition to automatic
detection; that applies to identifying DSD, whose channels arrive on separate
data lines, and DoP detects correctly on a two-channel I2S link without it.

DoP was verified end to end by generating a DSD64 test tone, carrying it as
32-bit PCM at 176400 Hz with nothing selected by hand, and confirming the
part's own DOP_VALID flag and INPUT_SELECT_OVERRIDE readback while it played.

ESS Technology has no bindings in the tree today, so the series also
introduces the vendor prefix.

Karl Asseily (4):
  dt-bindings: vendor-prefixes: add ESS Technology
  ASoC: dt-bindings: add ESS Technology ES9039Q2M
  ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
  MAINTAINERS: add entry for the ES9039Q2M codec driver

 .../bindings/sound/ess,es9039q2m.yaml         |   61 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9039q2m.c                  | 1259 +++++++++++++++++
 6 files changed, 1345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ess,es9039q2m.yaml
 create mode 100644 sound/soc/codecs/es9039q2m.c

-- 
2.34.1

