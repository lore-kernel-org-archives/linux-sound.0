Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69C4766BB
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254826; cv=none; b=gXwkhrAU1jWC4+IhQbctXPgGaUUfhXD31zvxReUmQAKG4C+hyq+dJQlGNkcWlpTZqS/dzh8h78tZngOQ96dVsAdSMqQ9i4sa38uNbGw4rnyutH6rhGihMtl8TkHXu0IcPoJ+inuAOTHN55JYqUvrYjpCi/mq/w/IzKBNrGplo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254826; c=relaxed/simple;
	bh=U1jq7mqCQyHs6vQpqHJXpW79DmjSSLoLTMuyETHeyIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mk1apQTMEhqt338nE8JsWHBbWaKoknJb/oik5uhql40SD4HGaGaCF3b4qdljj4Mil5dgZOrm381JKera/hfldACS0b51bxElr2dAdwLa3Ox7nB1vUgtAd+VZnF3GS7f3VM3hzef/554BVnuUUN4vzAaAXZ5qV3Gp8tKLQPmTlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=Awp0pORd; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="Awp0pORd"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd7so153991785a.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790254823; x=1790859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=Awp0pORdEf0GMafvqz5hvj8jw4WWGo8AJ2gUrXsoRSbE94gIrPNbgfm1Bv0MuA9cdN
         dauA9lKTWI/0MhS1MD+L2SitarySJpBqC8kbi1ihmmYwurNBjikPPEiYk3dYN1024yNk
         U8v+bsaUaNYAKN0TMoLjQcRC2ZmlccukOajW8d3SfWiH4GL8Dm8KaCNMLlF6b8ZiN8gG
         AnApko7BhEcyNHdpdXm/A2mjgJURpEWDpof3WEisbD2uCRGJjp6ttET6fX4nM6Gg3jq+
         ospOw1cAJP80/3A78VJEofbQcwYFSauHTLYf5fr5e91h/D8xoMnWj76bHmVw6RXEJV2m
         MAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254823; x=1790859623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ocwU8cQk2ldFSEuc+V+JE9BeEEvSRHBC5G3LMkq6bI=;
        b=jFP3whnDRoaF2+pkeIwu6TlxvXpSCZNscJOgw7QyjFT3ZMWmaLjw3VlDAyELYlw5hW
         RMniUvRXm7i7WxSlH9Zx3t7SZRVud2eTQhOo8d3RVdcMZKXqxaS6+fMnEQ/iUamD1kwU
         hl8/IwhU3xdAMvk2/YAg64/ousR1qBLqUFnk0q0UmYHm4FcVSKWa2f9bV8U+pEplvys6
         sJaMZqh8itThRKc7bB6gwct0tJGoLWrkILh7DH5+8M8AwhpBiJvv4+RgqoK3znRME/84
         og4zwRDBu/BgpEZYGx+t5tNnrqZXR9fg9wmsdC6LUZLFHxLW9/SXgkh5mtVOSIwuDYIa
         A9tA==
X-Forwarded-Encrypted: i=1; AKwUvBxCnHA7dfPbnNyoswixJMKiAcHnsYNt1UhID2iNCGcraHExkY2HueJRbv3zPpJnVmojqUxF401uk6aYjA==@vger.kernel.org
X-Gm-Message-State: AFuF++nxp41AkbXVg8/PsJaUXhQN3vReSPgKHr2YzXZbUnflxY84VlDc
	vpfR3k1GBD0cVlVkkUzRwCISwS0wpn22rd3wApjQkQ2CjT1oMxJRNo+jb294uj7J6qI=
X-Gm-Gg: AYBFou26+l9h6iC6X4ZWGE8oyVo1kL9wQ6H3ZHAEiAq2gZ7omQxFXSAKGrHGAVStnK4
	4XQu7b5yPIO2H6ikigfp7gu/bSxHq8mYPYrYlzlimD4Ea7PbWpRURqAf/YgoGHH1LbvdsecFRPC
	tPglKM596g++T8AZfBpWxpMg2e93uxgYf3nAuV4CnYZK8E3hnVJZRMJBnqOntgwiinx0sRCgJY7
	p+u2SFSniIWgUPZBY38cIDI0a4e6IXkIHCeg2QE2RDd8+me39E3XXKU4FgI25A6fOXxVltTj60J
	qgoNE69+NJG4aadCNXx82FbWuSv0gvzQtvlOCzNQNF4C+LbpzbHbycjZnKNF52Phd+EpXGzU6JH
	jSdeFxzXGYHrIBd8e0Zl7YYLtfuAkh1XZr7scpgds/6tt+Gd/JPS3A8UgwCY2X8M5apQhaQfuJZ
	a7alnk84lehMWdFziyzKxnb7wqpAWf87uh9VO43yIh3rkEtnyR
X-Received: by 2002:a05:620a:700f:b0:939:a9d4:50b7 with SMTP id af79cd13be357-93c362d1a82mr302707785a.26.1790254822482;
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2f3c6fdfsm285000185a.45.2026.09.24.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:00:22 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Johan Hovold <johan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liviu Nicoara <lnicoara@thinkoid.org>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks
Date: Thu, 24 Sep 2026 08:59:40 -0400
Message-ID: <20260924125940.22665-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
gain read/write sequence") removed the read and write of the digital
volume register in wsa_macro_enable_interpolator(), on the grounds that
writing back the value just read does nothing. The comment above it,
"apply gain after int clk is enabled", was left in place.

On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
macros) the write does something: a volume change made while the path
is idle does not take effect when playback starts. Lowering the digital
volume from 81 to 63 with nothing playing, then playing a test tone,
gave about the same level as before the change. With the rewrite
restored, lowering it from 81 to 69 while idle played audibly quieter,
and restoring 81 while idle brought the level back. Changes made during
playback take effect with or without the rewrite.

This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
lpass-wsa-macro: fix compander volume hack"): "the volume registers
still need to be written after enabling clocks in order for any prior
updates to take effect." The value read comes from the register cache,
so the write pushes the last requested volume to the hardware once its
clock runs.

Restore the rewrite in the interpolator's POST_PMU event only. The mix
path event removed later in the same series is not brought back.

Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---

Notes:
    Tested on v7.2.6 on the machine above, by listening. This function is
    unchanged between v7.2 and for-next; the driver's clocks moved to the
    PM clock framework in cd054a6e272c after v7.2, which was not tested
    here. Build-tested on broonie/for-next (arm64 defconfig).

 sound/soc/codecs/lpass-wsa-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..899c8bee4645 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1849,6 +1849,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					 int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	unsigned int gain;
 	u16 gain_reg;
 	u16 reg;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
@@ -1890,6 +1891,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
 		}
+		gain = snd_soc_component_read(component, gain_reg);
+		snd_soc_component_write(component, gain_reg, gain);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
 		break;
-- 
2.55.0

