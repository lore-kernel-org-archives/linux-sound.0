Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C078F3A
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759836804; cv=none; b=Qdea9KGa8YluM1Q85UaDYt7KiIqdfIEc34ql0zEkErvepG7i9AI2Rv9ghnJYkaA5oczXZS/JsADDwFsPEBVhHGmhF/0SA9zYZbjkerR8cS5lwtAGibOdSRka5zZC+OTdKf7oN+ojhqmiSZO8y/pn0Nf7Vae1Xw9Yt4G9lxt+w7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759836804; c=relaxed/simple;
	bh=BQ6TpPNckvkGMLa8nCgEZ4uvHpMY2rXRo9al5sRYSZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMBc0EFEzRBk3NUf3Ss/11iU5ge8px7gzco/gjbo7yy1GnhmxrAmC/NDTEJ2KoEK/+4yXgCTvmDzUmLZv3biKp9Uw0q99nsn0ulEUEaEEn/Ki7SxZHHZua2wqIepZtnoKuPoSIjHT20wuE2H4bv8ro3x7R/icNxyTOTtaA1E/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAX1jHpK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAX1jHpK"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so5534456a91.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759836802; x=1760441602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3w4aXsrWjnUKMZk9fA+/Y2yLLmb0WxYC/X8uHWERpA=;
        b=OAX1jHpKRJtWyhez2a7SDUMwu2IA+ag7Ico2bq3v0rMbKvVFDZbLIzTcFKRwIjz5+y
         Mglx201O6LVA54WpXzCIi+GgTJQ0ov46GNTrOGBzzB3pFOjf5rafDYZgRtL0CtyDMpLH
         zY/GjD93yfLr5wU75SJJpKbIc9eqJlFRVpNS+VboI5wHrV+L3+53yoHt2DDlC7Xa1JF+
         BGuf1jxBES3SSb39q29Dkd6Am/eAmQNA/gkWy/gNIZHNU6luQYtf6J5q7fDyI9vqubCB
         JjcRfEkFNo7XoseAfFu/Gtey+VNHrAUh4g3v+2PD9C7bA2YhOAR9uFkri/eYwxvxSy9F
         YXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759836802; x=1760441602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3w4aXsrWjnUKMZk9fA+/Y2yLLmb0WxYC/X8uHWERpA=;
        b=RlOHM4LrED8fPnRGiesOiRiFsh3eJMDKtdZKsh3saV3tgJ5CHX88BCCekwXM5pSBLZ
         w+2ieNQfFDI1dchfcCt3a/x/JUd9vJEPt3hxQyKtciCqjzie1iqJqKO94ZQT37bomJtZ
         Pzba6stm20bWZf9gu4CqacMyMgfqiNgdkli1jqjXHTVB39B7JKrtynC4u0HtpgQSfTK/
         sRsGBZ2cRaoCSMVUcLx9W4inm6gyN2LGmhA/XapVhwnzGmXUyMk516Yr7iA52v8pLlcK
         opn6BLfJLU6346oKOm+gUCNLTAJV84DVQVzewHn6jXUA0P1/Z0AWFnQhYZNuv0VSOkgp
         uqgw==
X-Gm-Message-State: AOJu0Yz+ZkuFQp98VdFe8DrLU2N1tfklNAxJM5CJXiH1nGiYMLQve2HP
	lqqr7ZXSUt7PxIbxTL3p3pmjRoTnQKuaI0kbTyC/c1JP7Wvp08P+JodiTimGFoLFMT0=
X-Gm-Gg: ASbGncucNO6pNTPPGyAKo6U54eM3NlKdjnQZCDSaeArVoTiY5li7uSrNXR0iDJM1hN7
	Z//hK1bLchPjUbIttNoTKiNkCLYkkdnLfL7OgovgkkDZTAvvxqLRLgmbdVHgg2aT7XjcHM1e9FZ
	x3FS4K9nfTHdEf9f3rzIQdpIU/yHtaHRW+A9YNBlAexwjZpyr7z/prhBxg6dGoUtTrib0W0uw4k
	xSH4MOttT0yTrrTDUXAV60jynytoY6kqD/VOigvyFuZ9bHWBYDhMX6kkTlYJWnyWDegtJ+tec+3
	mtvwiVLCOlE96sbt+KkUbnFaSDv1JAXcZtAfewvA41rff2eC2SvL+AuuFFwm1G/sIYIxQ47HdO4
	2/Cae9zwevbJgJz9RiNjcfMRZHDzmvxOXoTlnZUPL1Oog7CUxwextza7PRPMQ/R7udiNzJeq0
X-Google-Smtp-Source: AGHT+IE+UL1cP6d0S3MAkIVPTU/P8U3/4fJmyYEMKvYq9EHReB2W/wuHXQ/5+2e2rXcosyIhmY5g/w==
X-Received: by 2002:a17:90b:38c6:b0:32e:936f:ad7 with SMTP id 98e67ed59e1d1-339c27aeeeemr17456767a91.27.1759836801861;
        Tue, 07 Oct 2025 04:33:21 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a32212sm14086209a91.14.2025.10.07.04.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:33:21 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8978: add missing BCLK divider setup
Date: Tue,  7 Oct 2025 19:33:05 +0800
Message-ID: <20251007113305.1337-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
In-Reply-To: <20251003091304.3686-1-briansune@gmail.com>
References: <20251003091304.3686-1-briansune@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original WM8978 codec driver did not set the BCLK (bit clock)
divider, which can cause audio clocks to be incorrect or unstable
depending on the sample rate and word length.

This patch adds proper calculation and configuration of the BCLK
divider based on the sample rate and word width, ensuring the
codec generates the correct bit clock for all supported rates.

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..2109c84f33df 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -717,6 +717,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
+	unsigned int bclk, bclkdiv = 0, min_diff = UINT_MAX;
+	unsigned int target_bclk = params_rate(params) * params_width(params) * 2;
+	/* WM8978 supports divisors */
+	static const int bclk_divs[] = {1, 2, 4, 8, 16, 32};
+
 	struct snd_soc_component *component = dai->component;
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	/* Word length mask = 0x60 */
@@ -820,6 +825,21 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+		bclk = wm8978->f_256fs / bclk_divs[i];
+		if (abs(bclk - target_bclk) < min_diff) {
+			min_diff = abs(bclk - target_bclk);
+			bclkdiv = i;
+		}
+	}
+
+	dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+		__func__, params_rate(params), params_width(params), target_bclk,
+		bclk_divs[bclkdiv]);
+
+	/* BCLKDIV divisor mask = 0x1c */
+	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

