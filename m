Received: from h6.fbrelay.privateemail.com (h6.fbrelay.privateemail.com [162.0.218.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE5C2D5412;
	Thu, 16 Jul 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217667; cv=none; b=sCimP4evuG3r0MQb2rslOjzYFE+4HfXlT175hrE7HkwPKWzLCP8qy15XqrdrgtuMrzn9oSaLx5t5Fxv39Zx6SDnl9FvDRWINtSWcd4QpD3aVG7z0W4/81AOrOSWM0K0gvdk+F38aiRpE61kHy9fBpuiTtBBB5svter1hrcYG66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217667; c=relaxed/simple;
	bh=j3xLloUiFKnQ2xhPuFCjH8HLy09+4RFKm8QCqeRZvDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/uKH0one28sityrIcwkHjfcek1B+/L6cSGQLbJN5Ts6425XGdXm1kd4ZUrbD8me6ni4m2TlQDeeIRaxNUq985cvY5Vgmug/rAm4nYWxGyq/kTx39w34sjj1hJz6XeSQi53MsPnv91rW3PxSFPJGg9s5SZjFc3vZg+Dcej4Ywoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-10-3.privateemail.com (mta-10.privateemail.com [198.54.118.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4h1Hny10S6z2xj2;
	Thu, 16 Jul 2026 16:00:54 +0000 (UTC)
Received: from mail.privateemail.com (K8S-PROD-WORKER-08 [87.215.145.39])
	by mta-10.privateemail.com (Postfix) with ESMTPA id 4h1HnS6vpbz3hhTK;
	Thu, 16 Jul 2026 12:00:28 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: codecs: add the Qualcomm WCD9378 audio codec
Date: Thu, 16 Jul 2026 18:00:15 +0200
Message-ID: <20260716160015.165574-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <DJZUFFHFXZBK.3S5A9OPE7XYEZ@fairphone.com>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net> <DJZUFFHFXZBK.3S5A9OPE7XYEZ@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4h1Hny10S6z2xj2

On Thu, 16 Jul 2026 10:13:21 +0200, Luca Weiss wrote:
> Many thanks for all your work on the Fairphone (Gen. 6)!
>
> If possible, can you share also dts patches with me, so I can try out
> your patches, and provide at least Tested-by?

Thanks! Everything is now public on my Forgejo:

  https://forgejo.catcrafts.net/Catcrafts/milos-linux

The default branch, combined-stable, is what I run on the phone minus
experiments: the pure v7.1.2-milos tag plus carries for NFC (reader
mode; card emulation is still open), speakers, microphone and the
magnetometer -- the DTS changes plus mirrors of the driver series, so
one branch has everything needed. Topic branches (nfc, audio, mic,
sensors) exist too, and every DTS change is its own commit.

What the driver carries mirror, status-wise:
- mic: this series (v1), plus "soundwire: qcom: add SCP address paging
  support", which Vinod applied to soundwire.git next for 7.3
  (commit 999f80904763).
- speaker: "ASoC: qcom: sc8280xp: support Senary MI2S" (v2 on the
  list), "ASoC: codecs: aw88261: only check PLL and clock state at
  power-up" (applied to sound.git for-7.3, commit 06b6f1245567) plus a
  backport of the aw88261 format-negotiation work that is already in
  mainline but not in the 7.1.2 base, and the q6apm-lpass-dais
  graph-at-prepare RFC that is still under discussion.
- NFC: the s3fwrn5 S3NRN4V series (v2) on netdev; binding has Conor's
  ack, driver still waiting.
- magnetometer: "iio: magnetometer: add support for QST QMC6308" (v1
  on linux-iio); a v2 with review rework is pending, so binding and
  DTS node may still change.

The board DTS itself I still intend to send to linux-arm-msm properly
once the bindings land, as per the cover letter.

> Also for audio, UCM and AudioReach topology if it differs from
> https://github.com/z3ntu/audioreach-topology/commits/fp6/ or what
> you've used to test the changes.

It differs, yes:

  https://forgejo.catcrafts.net/Catcrafts/audioreach-topology (branch fp6)

That branch is your two WIP commits with one commit on top, so a plain
diff shows the delta. The functional changes:

- The backend is named SEN_MI2S_RX: the tplg backend name has to match
  the DAI name the kernel exposes, which is "SEN_MI2S_RX" in
  q6dsp-lpass-ports.c.
- Playback goes through a device subgraph that inserts an MFC between
  the logger and the I2S endpoint: the frontend stream is S16 while
  the AW88261 boost converter needs 32-bit slots (3.072 MHz BCLK), so
  the DSP has to convert on the way out.
- There is a capture path now (MultiMedia2 -> TX_CODEC_DMA_TX_3) for
  the WCD9378 mics -- that is the part needed to test this series.

One gotcha: the CMake entry emits
qcom/milos/MILOS-Fairphone-Gen6-tplg.bin, but the kernel requests
qcom/<driver_name>/<card_name>-tplg.bin, i.e.
"qcom/milos/Fairphone (Gen. 6)-tplg.bin", so the file has to be
installed under that name.

The UCM is here, speaker + handset mic (AMIC1) so far:

  https://forgejo.catcrafts.net/Catcrafts/alsa-ucm-conf (branch fp6)

laid out upstream-style (ucm2/Qualcomm/milos/Fairphone-Gen6/ plus the
conf.d/milos symlink).

> So for NFC, speaker, microphone and magnetometer would be great.

All four are in combined-stable. One more thing the speakers need: the
amps' ACF firmware, loaded as
qcom/milos/fairphone/fp6/aw88261_acf.bin. I pulled it out of an FP6
vendor image (vendor/firmware/aw882xx_acf.bin, 4328 bytes; the
mainline aw88395 ACF parser reads it as-is). I have deliberately not
put it in the public repos since I don't know its redistribution
status -- something you are in a better position to answer than
anyone: could Fairphone clear this file for redistribution, so it can
eventually go to linux-firmware with a proper WHENCE entry? Happy to
send it your way off-list in the meantime, though you likely have
easier access to it than I do.

Since Srinivas mentioned on the 3/3 thread that he plans to post his
SDCA driver for this codec, the mic carry in the branch is simply this
series' v1; I'll keep the branches refreshed as the series evolve.

Regards,
Jorijn
