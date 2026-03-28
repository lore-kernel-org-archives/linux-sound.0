Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591582066DE
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 05:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675613; cv=none; b=LbUATl+XBAhLHgFJM4PpMUfyTPhAWr+ZwB1Hot6nNta8GM7Q/DxLXRUDkek8Kdb9bisk9HWYPh6ua7md8RE7U4ew3um2nabcBWzQntMJmtEvRwq6YlIUmuWRAG9ZtycD1V5QskqEWq8V4XS7r7Cl5g/1m5zycfDC+hOWyVsHnro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675613; c=relaxed/simple;
	bh=fGkfc3UCRgoAi+qYnvnEhXgi07+BZm74HyQNwG9IeEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+eaQlF3fB6juvzRvdwnFBEmCTeiR7VxELE5Rm3/UUd1nqK4XjWMY5ysuo7E2ju1Y2Q6nqNOk6l3iYeM4FeHukZxXfuu0YIyazWfPlEjPgkUm5m3HeX0ZPmSFwvIKOTa7AQCZtWurPMJSHttX9s+mHvWyvCOlGCfIcSIlLeg3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaIJ864l; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaIJ864l"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82c20b9f989so1366566b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675611; x=1775280411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjT4f4n1BM6i4Zp48h42mUkpuWaNiLyW5S65Zt/5VyE=;
        b=BaIJ864lm+Tl/6P91195OD2ts2ywFoJQ/nuQr66HDNAwiUv6ui2zvd/igrbBCEjdSC
         3+hs8O7rXbxPzqUHkdvxIRxuhgzSd/A3qULfN41aX9Gf/dxvjPgK+IIAXD3z05pUenYO
         CA1/Dq+cjGVLWQklWximkHqFo206wgm55sKHAaFWwIXSW3iW3kmjZvf0GBnCzNlgwdoO
         8rRLCXW5YyeqVKT6snSPCn/06kw23Rj1KMviyEoFmKIACyApswdxFYX1Gxy5UqpOHfNP
         QVn1tMRMO0obyWV3bfUq2+RCGs7vY1An7u8vImqukBDLOtZoHT8ca2RRcFISWpnW7U8f
         sIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675611; x=1775280411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjT4f4n1BM6i4Zp48h42mUkpuWaNiLyW5S65Zt/5VyE=;
        b=gaQ5n58YKFhr97k7xcqjxAZQaPNDwnjMRi5nivvvnq4QH+RLsjTUm0kyy94iik+DBH
         NZE8Sc8T6WyIsC2HNGNvQNBapqkOAwsL5ppUpJNNkVhtF31TJ3JK/1yadJvmUbEapTVx
         GJDNt5nQI3g3IXS6CWoYmGz5XSJr4MIxzwEnwNa/OkUdAAB+5YqfTFzU0JwabAouJH+P
         Jz7Fc5zOMv/A7tVRwKeZSpdyQPtWE0lvJSiHLHQFM07D5//Dpcut0nBEZxNbWku8nNUT
         ywLX3tiTllq9VEaURjV5+yeG87iiamFp3Hn0MQh0Fg9NMomzQVRIsYnikF+tMomqmpjD
         wSHA==
X-Forwarded-Encrypted: i=1; AJvYcCXvIbB3GyyT/tB5xk+P5BgBKmEn9BecKQ0lDxOjxfGopmzzqLGnEaTTX7+u+A66a7FoG0fGDOGc0VTABA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2u6TrKbf6c5Ex40ctrqXA7Ze59U55Kq1+Bck/l8YmfLdbVYc
	mdPCICVfJslbOcY9u9dorZqZ7hdN3HrTscuZt1BalLPDyASgzGjNMzyC
X-Gm-Gg: ATEYQzzIhW5Ufng2CWdkFSm74Vt0J3qTY/z/5e0MjSQvs3PXGZRGcH35zCNPTzC2XHU
	gNLa5bGosSigqYktQIXQRhEw3pAIfsr9S8vrKRQWb5yRomGh5q6nJ+2eGpcpPb6w0qGHnRZSfSF
	fLhyjZpOnUfch6CHhulcuVVsJ9RptJ0AFhyPkpLRTJZLobO+yz0bzu1mPKJ+yTCyVNsHDunEaF7
	H2Kpn3EttMztPeVaGQ/qLYbQ2rc06Tb2Y+C/VNvZ1dBxHRRz7fWr+WmASLBlZifK3Ugdnj7TCXc
	yZhH4Bw2oY3YNHVzZvcvkO9RRdRQWPn1C3dW9uNUrrdugCGbXB38uoHEQFvlNvZRPvpBYDG3dZ9
	llcWD8jvQRwjc6Yt1805HoArCzeN40bPoMsun7e8LQqVX0kyOlMga4g0yXL1MNQoKN/s30F4stq
	Gnvl02kbLYvT8pOA33TQPzvBnzVbeYmAwkKwPFh+XNHXimt7Av
X-Received: by 2002:a05:6a00:8593:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82c9fe1abe8mr2838521b3a.13.1774675611543;
        Fri, 27 Mar 2026 22:26:51 -0700 (PDT)
Received: from debian.killsync.com ([152.58.216.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm923739b3a.60.2026.03.27.22.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:26:51 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v4 4/4] ASoC: Intel: boards: Log error code in MCLK configuration failure
Date: Sat, 28 Mar 2026 01:25:55 -0400
Message-ID: <20260328052556.434191-5-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

The dev_err() calls in platform_clock_control() for the three Intel ASoC
board drivers do not log the return code when clk_prepare_enable()
fails, making it harder to diagonse failures. Add the error code to the
log message.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fce726a9c8c0..19d9e87df6c9 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -285,7 +285,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state\n");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 65944eb4be16..6d886684fb51 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state\n");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index e5806dc16ff9..248ad3fd495d 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state\n");
+					"could not configure MCLK state: %d\n", ret);
 				return ret;
 			}
 		}
-- 
2.47.3

