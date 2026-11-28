Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857807;
	b=VC4G0n7A5ea6/8TIkrrRequyu4PpJP4G8wOIT5XsPDpOx64aFYn9I2nVDe2AdOcFejQU
	 v0QEAS86Qt1Xc4CaWHTQJyYjaQMKauOiM84fGKiYTmnHtER9kaHQlTJr+z6wTAj+Pdkk1
	 J5LolunXNA2Yeunhm4kDYv46gAsShK/UJTaNhSlqhWIFZsJb//U656/otlcGkBuTBwxst
	 KzkpRBYk2mCepiq+sEEQH5NPwXwWTr/2zQi/WlP9zlColFjQAJ/TesQIc11ura33lUu6v
	 Ie6QN8QvYeDTmOAvuUVBWyysxAlu7b7VuAAAGnMP19OSLkJB6zvqk7wObucUQRBN6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857807;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=Coknq0zq3pZl0N7pu23DhT3zXKEPz+FWbXgWI9L6h9k=;
	b=VMjZaVE/RCTxCfDwUZZQYwJqKkaWQ9Cu3llBuB/VmWKt1zpUJikYAjDuWOtlT//3fhWz
	 vxudqqiWjRm83U7/j3kaxmmSnpWGMXcFIdebUeFbjY46YS9AKmAdlQ5cjsJtMlWbAIwmP
	 ZLRKJa+o4tVH0GPed8QtmTyLAnoEjahswsl6PUMU1IsweEUT6A2I4FDEx0q1gtf/UZ+KE
	 J0Sw7pdlT1nuTj1pqWwL9cQTNMTLOQAgqof/BWc0gIXG7CsXddNKcY3cuV81KYCl8DNAC
	 Ar6ebek6VtzG3AATcZLqeMrukoLYjVvBM1J6mX39DeJ4G1KlXXHtjxpqkFX/DQwNfgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=La1sNGVa;
	arc=none smtp.remote-ip=198.252.153.6
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0B606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=La1sNGVa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795857806; bh=Coknq0zq3pZl0N7pu23DhT3zXKEPz+FWbXgWI9L6h9k=;
	h=From:To:Cc:Subject:Date:From;
	b=La1sNGVaH9p0s3PekseujWnUf1Q7tR/YuVNqurGc1ARarEddtdBO2k4IAsY2z1cOn
	 sTv+KxaKKEMzLcHiOSI1vH94QqeggUVQCpuAEXV4G4hlGZFnsC998AiiVqng68Ran4
	 Sj1yesU2MAOZuAQjTv5wsRQOkArSFBl5w5aF5wzs=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4jc4Zq1k2nz9sLv;
	Sat, 28 Nov 2026 09:23:15 +0000 (UTC)
X-Riseup-User-ID: 32209FB1B4CB79A017EB95EFCCC3855C2715BC1C1D8AB65BE2B1E9AE2FF34B6C
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4jc4Zn2xd1z1xsC;
	Sat, 28 Nov 2026 09:23:13 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: wm8731: interface activation order
Date: Sat, 28 Nov 2026 09:23:03 +0000
Message-ID: <20261128092306.1566199-1-rafael@riseup.net>
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

On a WM8731 that provides the clocks (96 kHz from a 12 MHz crystal, as
on the AudioInjector stereo card for the Raspberry Pi), about one
capture start in five came up deaf: DC offset and noise at their usual
levels, no signal, until the interface was deactivated and activated
again.  The trigger is the ADC powering up under an active interface,
which the driver's ACTIVE supply widget does on every capture start.

Patch 1 powers the ADC and DAC from one supply that sets ACTIVE once
they are up and clears it before they go down, so ACTIVE also comes
before OUTPD is cleared, as the datasheet asks.  Patch 2 makes both
directions use one sample width, as they already use one rate.

Changes in v3:
- Split in two patches (Charles).
- ACTIVE is set and cleared by the converters' supply itself (POST_PMU
  and PRE_PMD) instead of a DAPM post widget: it now comes before the
  output mixer clears OUTPD (Mark), and it also runs on power changes
  that are not stream events, such as a mixer switch (also raised by
  the AI review).
- Dropped the -EBUSY check in hw_params.  symmetric_rate already keeps
  the rate, and patch 2 sets symmetric_sample_bits for the width
  (Charles).  This also drops the false -EBUSY within pmdown_time that
  the AI review found.
- The supply powers the ADC and DAC only; the line input keeps its own
  widget.  In v2 it was on the supply too, and as the AudioInjector
  card's machine driver keeps the line input powered, the converters and
  the interface then never went down on that card: v2's hardware result
  came from that, not from the new order.  v3's result is with the
  converters and ACTIVE switching on every start.

v2: https://lore.kernel.org/linux-sound/20261120080825.2078162-1-rafael@riseup.net/

Rafael Diniz (2):
  ASoC: wm8731: activate the interface after the converters, before the
    outputs
  ASoC: wm8731: use one sample width for both directions

 sound/soc/codecs/wm8731.c | 60 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8731.h |  7 +++++
 2 files changed, 62 insertions(+), 5 deletions(-)


base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.47.3

