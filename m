Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE7470437
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683161; cv=none; b=TQOnH6lTGXv7/M9bW60x886Ixqtx7MoJ/Ho52y9DwQU6kzY0Lb4PvHmDgYEslRJSA6Laz+jIVqct+S1gAhNM8HMIuToEh+mqiR5x2zEYCP5l9rmFbSPbi+zRb3gLQ38dFhKQYrAxww2y4HmZ7UlKyiy9JgDgH4U0uLhykRc6F+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683161; c=relaxed/simple;
	bh=vVvDrY//xdBNbp6iPJngokdTuFS+NhXaql31Vv+iJbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3q36egdOwYKreQxa8556NvX92Li5IfBtjGtgWvbm/3rAaHK447ZIUWvn6kyNRzDSyS9rQ2rhE6PBU60iCKsWomTsO9jwgDww/v93ocmW2PxKqIQTGLX5IHlgLBef6vaQqH/OmihHGPWU1hulzVmvnBp1g7UfKQXc8HYpxwaWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=NTTemChe; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="NTTemChe"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332bdd8296so51881441cf.2
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 04:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790683157; x=1791287957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlgScPHdiLebmGaCvP48bU4gXKNbLya/+el4EaXYdkE=;
        b=NTTemChe7dfixuN74dxTKB7C8sNyxI9FeiN4dmeX7yCelWMUCBnUXZsYugKVVqI3Y3
         iEbDYAUv/zaedKY1NP7/LqRq7ZGgL1Xx3gSjHRpLtJpLu6tklL199d2NpJs9WUY8zH7y
         i/sMcoWAd6YmZFgN+dGNhZjO88/fFCbfOcglRLF75QK7njpqt78m8Gc6RtLewLTI5Y/G
         Y9pqSIMliKGpuxEzTlHnCci50tE+tIA1Jw+LRJDEisuJJzAMCFlhzH9KiZLS6hWOfibd
         i1X4PBYO7v0EOfKOYWaPV3EBqCIKwvb4CjCM2MZhZTvEe4iSLzKu9sgs8uyYW5dHjwUq
         nRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683157; x=1791287957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlgScPHdiLebmGaCvP48bU4gXKNbLya/+el4EaXYdkE=;
        b=Mu/LBmRG78cQoCRUSw320Z/FSB2uY9wuCApWK9rwm+rKDiHxMcvdjAAd4Cnt72fcK1
         2FJObM9zKqC0n34DUDVMILy584lolILK/tYNiEhVrKdsOS0V4AxSFxqxATrwvoymrXTY
         RruLsZjODIhkVzzud+Rpol86MgB0jigpewjS9hN//3MC/ICFitPNCNNB39VS1A1pY2gh
         CCDr33y21rPf19gYBcu7+EFH0qcucdjeYSySRPaQ7LmEbDs30GFx+CZPJ3ShQkF9j5rG
         Fg+ecTx1j6zKwC1ULI819LMumo5Cbu+HiFgU5huIFf03DIHTywBVNkW/8vH6QcUUC1wG
         WPrQ==
X-Forwarded-Encrypted: i=1; AKwUvBySgEzAg4lu+2MWvTa7FzfQP5nhYVnnbQDUFFO4UDt2a2m20y7a5ayGXvukiml1gEzM55Qj36qewKCsrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mReaEcYVBV4DcbC5saSzN1JK293uWF0QaaIyLKDWi0M8WrWtSh
	qhxMi4W69b81z4Rp4m3Ae/zLP9dPlUsJ7RBITDowUOjrQbpBAInrD0kSiylxqeBeF+4=
X-Gm-Gg: AYBFou1MfLUDoFDzshOVIjaUcfZbTV8W2nCQZtwrTZDEtiSLZWLgcTv7dw5jUbHTGYZ
	0aYxwq5LNCqIf9Ghavc5OvtKAooVfXL05dRDHIPaKNrsUdRA7sEYft0/i5AiTPDd1ZQxyRptd+a
	ly3p+Tc4X9VOQlYecj+jIcW7hF2CQy4y9GgvqwpFnq3AfiQiV7K1P3JLJIZhSAmKQUzmsOknSlG
	qjFmsthSKQkYVG8/AmZNZIjPS7s1iqameChiULYgFScgb/Yng9bRw6q3nYEgDjRjuPnHoqfaqTL
	xgQzWkGSIkapRrQvtj7Jpf8ZiVOu+SWQi3Xg/j3YfOeSW2d4pJpNbc5q6WL8MKdT6XSgMSQWJ5+
	EY6RWrAv1p3LzlsjExEz+TjlYDfbtEGf9DgHH+GZMdlzdL7z87oMoVhbuuQxRE2MJiUe1V70lUs
	d4DM2GMPPQ6FXWM8oijD3hiZnmCw6fl83EKT/euxkvotvV0Ro=
X-Received: by 2002:a05:622a:130a:b0:533:4b39:4e28 with SMTP id d75a77b69052e-5334b395abcmr86308001cf.33.1790683156815;
        Tue, 29 Sep 2026 04:59:16 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225a696sm84460381cf.14.2026.09.29.04.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:59:16 -0700 (PDT)
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
	Liviu Nicoara <lnicoara@thinkoid.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks
Date: Tue, 29 Sep 2026 07:57:55 -0400
Message-ID: <20260929115755.6096-1-lnicoara@thinkoid.org>
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

The register already holds the new value when this happens. Without the
rewrite, after an idle change from 69 to 81, playback stayed at the old
level while the register, read from the hardware through /dev/mem, held
the new one (0xfd). Writing that same value back through /dev/mem
brought the level up at once.

This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
lpass-wsa-macro: fix compander volume hack"): "the volume registers
still need to be written after enabling clocks in order for any prior
updates to take effect." The value read comes from the register cache,
so the write pushes the last requested volume to the hardware once its
clock runs.

Restore the rewrite in the interpolator's POST_PMU event only. The mix
path event removed later in the same series is not brought back.

Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---

Notes:
    Changes in v2:
    - Cc stable (Johan Hovold).
    - Add the /dev/mem read and rewrite from the v1 review.
    - Link to v1: https://lore.kernel.org/all/20260924125940.22665-1-lnicoara@thinkoid.org/
    
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

base-commit: 1f9b1774f65c6670a37000390e6c43309248a345
-- 
2.55.0

