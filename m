Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D25560AD4
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092898; cv=none; b=c1ClLk7ABMAUKoS1M5VPoh4nBI0/779AVhdj4jggwdv3r0K+zfXNoWyZm+3Gpnm6IXogPbqBLonPOpLtvjdVaD327bLBDCB8sKrJAVSce8lVMTp62pgXmCXht7jYPH8yoQ+GdBjdMPZ1IEtjp6BzFqn56ZyucCcWvoX/rlCq2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092898; c=relaxed/simple;
	bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltmlMStM0Wtrne25b3873xqLiRWPkszVG1lAwGa6s0LZB+61iSnzlrigZjIxUPpPYH5Ie0O1+OpzqWNrUk+KTUTsjIePF0zDdkT9VKoL+5QG8rUHD71s5Dy9cnyu30L3XBpqWFhNWqczLHNB7SstBUblKlfg5v7EKo5xM6kiwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOiDVEfd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOiDVEfd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so75369f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092895; x=1790697695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=NOiDVEfdUQZTEqAvvq9zsRXRJEIYCjjIc3xqpW3h2FZp8PdiLvMK9bWEwOzLUshliR
         +rPuQTJQcGwlxNu/s/1aVSwqsZQKNu83AdcoGWGVDxK8Xa0DTSNxC3UvNWXEv3I1X3KY
         QcHnNO5eftVfMSmcr9IY7iBNmnBO+3XQcc8ZIvQ9gcyNNGU4e0vQ5P2r6rRLqfAqDS9U
         Y+11fkXxJQxUaGL1AHK7pYE70we0Fk1NSckiZjMK/Y6pghwBZcTZ4laLZzD/pte6xaAB
         0xgbzADmGhYTk9krLPTMAs9t+pwEnkHZl9H1XWE+jeWUuE8U67tmWNQ1HAUArW7bZHNJ
         NMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092895; x=1790697695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=TrHCywYBfcJwAw1xwazu1Y/tz2fP+KcxyMR8II17ZYISnMsElt6PPUSBZn0E6/eyYr
         MTl3qSAfekPG95nA/5rG8AE9/ku6vSsiznv+r7Akzoy9upAH/ZV9QmD0B8mj++bP1vKN
         RJ4cUG/VVZioc25LEBbsWYZx29at9eKCuJCOJ4UgD88Oc7YH9vlAmNPz+8YKb7YO3Aq7
         HeoOmqnjbLULCp1is3BhhIzmmRmp+wFTKxZHcEgHmfxgy5+8+vU58zoMKgVi/UcgiyL8
         GMV8CQ92ZnHfMJqblVMNK6zq9MwmypgL7nkHEP0mr655lhoAmh4Y5lxm0z8E1HPI70Rk
         z8bA==
X-Gm-Message-State: AFuF++kVoICgAuYwaqlYjE22cfX7cdlb8XCZkNyBq0aG3MM3ehr2Fn7z
	5VoMN6yF2C1IoyQ8e2EclpSdToPMnV5PCu9dwwdhzD0xxgKvadxcycBo3syldNxIxjM=
X-Gm-Gg: AYBFou2uVh5Y6zqjAGPwD7I/A/PJ1mo4cqX8ZNrAhnzsfPH6bKp5G9nDWrnL7Tffo8C
	uGjX+SUKnSJZmi3GRO0qBIznQSD+0o0v5pv8G8wBpoTS5uWeg8axM0rqw0Xe0wRtie4/rFtn7wU
	uPuW4cexWhilfVnpn8UJMaP28Xpit3cqp2CUXprCzH7NRYUvAleYfAVGS26SlMT/8RWMvpn9QyW
	2Sz6Hmy4yeKVSg9c0nyes+XeZBZDbSHGVRS2NvgzmINfvqQpy+Epq7sbKY0xP0C0l0ib5W0qHx2
	uh3LYoC61E3Rzs4BWanuLJ6/p79XGkxPsey0QEbA09vYnaQL5HAoWpxyVVTGAx/sgOOmqnCEYO8
	wZHjTRx9Llcc86zxYxypOXszd/V0JrAq/xRyGJb62I97eTh6mtppKWn4UMkRFzAYYZRQbdx2/CX
	LOcY4pmS4BzCYicRSbMZFmBnczN7BQxpKibSMM2aFU8Nvig9Nj0oqguHvrsdr0jDe6zw==
X-Received: by 2002:a05:600c:4712:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fdd103ccfmr22007895e9.11.1790092894693;
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:48 +0200
Subject: [PATCH v3 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-3-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkWdmnXxyuvtO2XuTbfN/OPOpc69WvCaZKdG3trCh
 X+fBTvN7ihlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnvgzMnxcnvHv4du5jDnP
 fC67L/cK+Dm3Y5n1XwnnU2u1VnLGMakyMty8rJ5w66gVU3VHIuuk3+mXLvuFbFboLfCUYa9tWNz
 TzQAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3

