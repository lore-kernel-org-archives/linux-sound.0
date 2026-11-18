Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012063;
	b=daxA+UHGzXzQExs7gVyBH5mk4q8Y/XJ0arOE5JYDRHwxhsM8Itwst7SSy/xo0vr+2idd
	 X3T0bUSj/45bQE29kwDA9Q7j9VtvoGVi2U6WSAR59ep3Kcg5ca2sZsW2NEsLmXv/FLUbT
	 S96dRqetNymQ8lYlSKGP2x+f4h3AQHRNN244tiL1xmCe8/xc2n7e42fj9uJ/W79JeLHNY
	 RGjdAbkntgAveOGsOe2Pxe9DHNudaI6R3z/ksqA2Yi9/kNVyhWBfFKc0a5TCdcOPe75Ea
	 +rpMTfXrVa+q9ohs2t3R/1jOno6Fma8bIkmmjG0N3s9+Xwd4jgKqa9hye0gE2vLz4MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
	b=5SEZCy3AhBGl2O119hXX8CbOXHtfgLYDwVTScS6stPTVazlZsFo1aCZBBZakkPd1tUiB
	 7dNfQ6sRrjXY4A2WVBezMU3wPH3NEB9ZZuvH52gWcZejB1v8FQv74HV3RJ+EcxLlohWa7
	 v4qHy+ScroBVM6bYfNpWP6xSmjt9/lSVEBGLacPF7nac2M3FDDupUSWfIhcwiIWdp4yik
	 PHw4x9gbC+dSu+f0G39EzCMhvVC+8SfU8zetq+jeqRfgYZgOoszywWiSJd96AdTYMZwOk
	 SdHfGz3CULFLjHsY/RhSoqcT7f+X8C3s2td9yR/gzDiOfBJ88Uc3auXxv9XGJEdahOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=asseily.com;
	spf=pass smtp.mailfrom=asseily.com;
	dkim=pass header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=C4YetAr+;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A160A2617
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451A160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=C4YetAr+
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so1488754a12.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1795012059; x=1795616859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
        b=C4YetAr+YHIjc2/kUvXelgtBNjt9sT0Y/7cMGhiuYIvjD9INfpG2dZNd/caXXtl0zg
         De/7JuA+pjifP5SvGgt0gnK+XDTSsg/2bXp5Vdn3mSQzeZ3ZqlOAxcI/1mp1B6FrQq/+
         F9dDkmjUrNo9jEw//kbBgzIsPcXnBtYLWjG0z7/OXjFbWyAjLvCuHwQ6s+5W6FuO7jc/
         iA8nTtqh31En3/anLweP3q88d773l8bClzZKTmGuWbZq3hD098dR6sSEoO7ja0KKvLO0
         QpOQQQYWLTYm57+OZkylLuNJ6cdEq4mTL0dl/Yz8t+VtpGZFqu/NcV6HWpQ25fo2Yj9p
         /cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012059; x=1795616859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzCtrb4I1oeIw2u+c9ts0iXdAzyI2eH808CNGZDafBc=;
        b=LLLuo60azowC0DfuEvRBGRvVExGCbk+6MBb6Yb+A8v16TMTY0swt05y+xoheXCgfcB
         ET7iETf0NRRj8bejXkTg50qxDZV0f0WtbZCM9dy2DEvs0DnUZRr+9nm6Tha1hK9OoVC+
         UNQNzeKSNWwMCISg8kULHG6LnNxYJxjE/2pvhFma/tmyDqyFi/BxmCGK3SLumYiDtIHM
         jEh5SvjJVQtwWqG2IGexapceNYyXomwVMIIDk0zmmMqREh1o79XXISt/Yfn/AGWCXm6u
         ccqJVGeaPlQ/HS+iMqpPNhWl9glW7nszZCG0tJYPusdf9fxt9wi4xR/aBJ3lFipMbbd4
         G8BA==
X-Gm-Message-State: APuU4Z8x7X8SdyXTxVe0IK5Bd9Er829VbDhrtO3qUOc2+15AkEgnVbzx
	o7MuplF4hdNtT5WScriU170ZgS6W/iYvsglNrLau+Jwe6+moctkOLl305xu8HuJlFMln0snvX9D
	LC79wacc/mz89
X-Gm-Gg: AYBFou20l0gjzN/VMnC1Ztnp7xjxQ1JQfwLNsepCLnbB5NbDq73+ufjSUUQcLb3nS9H
	UBQ5u1JPCZryu6QA3xsJBIdf7B8tDju4BvLwEdeJFMnI709BXkLADKEZgzGOBONdLjdViHHUa4b
	WHsx1z9UHj0Ir806ZHYI37kyGmM/h0end+Oh0d0ATKxdeVoQLuusiH0RovEqM7Dg64MjwvTIGmJ
	lYJHmh+rFFbdYsnljzUn/IOX8IuYTEXRg5d8qhsF54bte7jeVS0TViMWnMkf7wkD12sWQhQZcld
	nPWYS4yZ8KMPkPpmAt+EBAKi98gMXCRdVg5vEV/IBs4sAbPUir1YQbMLso8/8lwvO7P2m0QXAIH
	X8oEZaegXvWqQvDU4g1oCEiGw/+L46GQgTNOkLi0+5mlMwq/BP5qMA4+apJd52OXYDZJYjTGJ6n
	S9bpNzlZjdY1CbThUq5/zvbQQjV2V/91dBA6TI6Y4zEA6iwma3VZVWjrquyjRNvmW3ERLXVLXCq
	wUGqfyeMHa2a/VIJLpzQKxFZh57gogJfZIY1eKQOwUqcvk3nS7DmMIFNnKpAhFIJHOpKXnuNcdh
	LudKcVTZFHXa9FON61zUgszr/An6I/LGnARQkXBnbC0=
X-Received: by 2002:a17:907:6d07:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c510e275424mr242780866b.10.1795012059362;
        Wed, 18 Nov 2026 06:27:39 -0800 (PST)
Received: from localhost.localdomain ([178.135.21.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e76bsm1100538a12.12.2026.11.18.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:27:38 -0800 (PST)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] ASoC: es9039q2m: Enable the DAC clock at component probe
Date: Wed, 18 Nov 2026 16:27:27 +0200
Message-ID: <20261118142728.101180-1-karl@asseily.com>
X-Mailer: git-send-email 2.47.3
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

es9039q2m_suspend() gates the part's internal clock tree by clearing
ENABLE_DAC_CLK in register 1, bypassing the cache so that
regcache_sync() sets it again on resume. The part keeps its registers
through a warm reset - only removing power clears them - so a reset
while the system is suspended skips the resume and leaves the bit clear
for the next boot.

Nothing in the driver sets it again. The register cache has no
defaults, so the first access to register 1 at probe reads the gated
value from the part and caches it, and every later suspend/resume cycle
restores that same value. A stream then runs as far as ALSA can tell,
but the part automutes both channels and the analogue output stays
silent until power is removed. Boards that remove the supplies in
suspend reset the part and are not affected.

Set ENABLE_DAC_CLK at component probe, after the mute and before the
datapath is enabled. Of the two writes the driver makes behind the
cache, this is the one probe did not already repeat; the other is the
mute at resume. On a part that came up from power the bit is already
set and the write changes nothing.

Tested on an RK3588 board whose ES9039Q2M is clocked by a fixed
24.576 MHz oscillator: suspend, reset while asleep, then play a 1 kHz
tone. Without this patch register 1 reads 0x35 where 0xb5 is expected,
both Automute Active controls read 1, and nothing is heard; setting
ENABLE_DAC_CLK by hand mid-stream clears both at once and the tone
comes back. With this patch the same sequence reads 0 on both controls
and the tone is heard, and a part left gated before the fix was
installed recovers on the next warm boot without power being removed.

Fixes: 004e260a5475 ("ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver")
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    Tool use (Documentation/process/generated-content.rst): the cause was
    traced, and this patch and its changelog written, with an LLM - Claude
    Opus 5.5, in Claude Code. The fault was found, reproduced and the fix
    tested on my board, as described above.

 sound/soc/codecs/es9039q2m.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
index 2a451dfcc..e3f963909 100644
--- a/sound/soc/codecs/es9039q2m.c
+++ b/sound/soc/codecs/es9039q2m.c
@@ -1634,6 +1634,18 @@ static int es9039q2m_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
+	/*
+	 * Turn the DAC clock on. It is set at power-up, but suspend clears it
+	 * and only resume sets it again, and a reset while asleep skips the
+	 * resume without resetting this part. It then comes back gated: the
+	 * stream runs, the part automutes, and the analogue output is silent
+	 * until power is removed.
+	 */
+	ret = regmap_update_bits(priv->regmap, ES9039_SYS_MODE,
+				 ES9039_ENABLE_DAC_CLK, ES9039_ENABLE_DAC_CLK);
+	if (ret)
+		return ret;
+
 	/*
 	 * Enable the datapath. SYSTEM_CONFIG[1] is clear at reset, so in
 	 * software mode nothing turns the DAC on at power-up: the analogue
-- 
2.47.3

