Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664858;
	b=dI280sakEKD19F5MblUS7beTl5BsKb3KiiaBrDR3sSL8woELX4xkPxRAzMzpkpaqoAcu
	 zoKopipfnvTpffoBxyGlbVnIzYWtste4L/egqYPusLUY1PqDw02OWVAazgqCGjhwAVa5W
	 /mcUrjomr2SY8NaJN8PDzUVl5idSKgNYOkbHKwjTDoqFWLSoR5o7+Km9aDH9NSDzb/ChF
	 nwMLXhU+l8WXO6WiiqhEGOEh1RjHxmCzEmco2v3ZQHicVoerc4eLHvnQ0D3Ui0Ni9588b
	 uw8NLFWpYpPucwyVlnGcz/PdrqSejVw9/RIZ1756/EoT+UCMBLi7WOZcuGej84CLt0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
	b=xMSkhKDSsvJcMQjTc4SCCsIVFHszIAtbmi/Y2WRFvkO16rLnqIs4mc7hkxYLbfvE+ezH
	 c/Bo5WHTwr6gw53kMzaxoJMuy9+Ezoqmdh0u56DxSdRjigghCESdGQSfIO87+sKKrodIm
	 RCmqwrpWoUh0lP/nkzkJVLDXD+lNRP4nlklLTsllTsRQB7iM8gFEd50IfHqcEALlZ3miL
	 1thvI8UyLO/9KKObhMR/e6ybhmcViS1XHpLArekbn421fCbGpEISPXeIsnDiwxiH7fbN9
	 gCEDqEChLLE1fks/F3pRUq0OKvse1syBzw+6ypRfBHoMyRwwwifMxtQyeiat0eAzP2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDW6pcJD;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96503606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96503606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDW6pcJD
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso901174a12.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664857; x=1793269657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
        b=WDW6pcJDDHpd1Ud5g2jY19tH+L2agMvBcqN/bsO3W4WNT3gkvy4SW6F/70MpMSpta+
         4LrnPEarR7pS92CmyLL6UKhWisBpd5ARCYGqATB34qLuQ08FnRT0mlXOuhiJmZJvMTE1
         GD3+RtXdi4LSk+OMbbCdVG6AFPdcD78wAgClzDgNaATzSJ+wj6lhxYqG9bZfrgWMo0ny
         e9FC0ZXOyeADHQjjugzwj4nj00qJ4W8XneBFBzkiYYiC8pruZgPfz97hOJkcHEALFtAK
         b3vvDBIsznqihGslDVymJaGvrCrUd9p74NFM/WTxMVAwjbsLfWW5hhmoCPZetSAnmojx
         6t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664857; x=1793269657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzAaW5HTBn7UZ4VY2eLl2rr4tjq37RvvwdDzMoAn5+M=;
        b=qRELPSFYPhimvRad9DVzU4CEYHRswmGZkNBCZSRa1io7hnUlV5JYdttnIVYfetLBL4
         GtzO9K1B0SPFfNJbiKh6en+jagFCySmusUAbbTaFD7kOtd5dSIMiUpw0mP9Gr5BGEQ0L
         z45qXR+Xzf/v8lSHbwEOY6L39HlcP4/XnuDlsX6dv1mg9zfqAEWFghnM3uK4o5GutC1I
         bNVe0168sNqlgJ3HqM49ACsWhBn0hY/y+G6hBQZ2HtyPxla7hxMto+Qfg/3Wl+yCs99P
         b/NCMPca60jh+RNg0r/NFJcoXP4ZiWtyDafVJhKE9CBCymnE34cKKCcyi9wnR/fAgSXt
         2jMA==
X-Forwarded-Encrypted: i=1; AKwUvByRhq2FWujPeodJGvr4C2tFs7nhoB1zr2yr1stfxEA00yousoRfMxRlaKEChRnx8bQy6kSWiXDa2TKLqw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJadC0p5SLsgvgzUbXbLPrZXOSSXBEB483+t/0K+bNs817HD++7
	qpEg2AmR7ru1GgU1zsEGX4pxHPL1PPXGx/+8XMYExo9KKfcfI1J4SDF9
X-Gm-Gg: AYBFou2RVHJCjkNLlpiLymalWhrXkeoeGCDtEPho5MxYFms+PzdP62BhhUPu0Ad8Wyc
	OD9/2h6AvbpORNuFaR6VoCaFezX2lPPsXniY1wNsrLxhwY78eV8S7Ozg21VJDa42q76gdZn0FVH
	qABtOdfeiO3A23bOgOREqMTEvrMyMw8PaTg3+BFjevxs0VZooWs3wrsmihmXH743191DZvvy/U0
	ukb4zOQ1xxQSPsV82VuZVRMc2c6woND4UpnPc7BkBXhKjTN5z4UAfsTl/vdS3Yr7oqHKJnKKQYT
	enm/7ZdNg1gjDbeD4K7alzpEQua3L6ULLXz26vqiGflwc4LAMUF9eOKwSwgZ1EGGiAZr+4SGD1Z
	nUVAIZezX9uR2jDsvTN60pch+mP1tG5yvJXpfeCvHOp9j1U38YBdjCe57iOGj7RnjOn2b5coiYF
	KhUubfOCt+grxJ4fPdEs6kq5TXGQbTn+rE6xVAY4zBpSRWEUs+SIFN67oRhtjjuMKNAD02TcV9C
	7+UlNLmnEbvDb6BZHw9mdX6SIJWUfrBknq4KdCe9SE+M5/ReXbA6FabkKEDyMlYCMT7tvufyAZT
	Y7WHJ6AOWhbYHko4+JpvNoVUQAFCKM8yzLXFZ4s80NaTVx1FLOzqHXF9ko6sYIQ6ACaT/xM=
X-Received: by 2002:a17:90b:5870:b0:3ab:5758:3766 with SMTP id 98e67ed59e1d1-3ad8707700dmr4023148a91.51.1792664856940;
        Thu, 22 Oct 2026 03:27:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm3702279a91.9.2026.10.22.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:27:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	u.kleine-koenig@baylibre.com,
	Igor Prusov <ivprusov@salutedevices.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: codecs: ntp8918: Fix hw_params return values
Date: Thu, 22 Oct 2026 17:26:37 +0700
Message-ID: <20261022102638.38606-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_soc_component_update_bits() returns 1 when the register is
updated successfully. Treating this as an error causes
ntp8918_hw_params() to return early with a positive value, skipping
the remaining configuration.

ASoC expects .hw_params() to return 0 on success to mark the
operation as completed.

Check for negative errors and return 0 on success.

Fixes: 2bd61fff3e93 ("ASoC: codecs: Add NeoFidelity NTP8918 codec")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ntp8918.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index eca34fafc4e6..e851cfcca7c0 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -233,7 +233,7 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8918_MCLK_FREQ_CTRL,
 					     NTP8918_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8918->format) {
@@ -253,8 +253,10 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 					    NTP8918_INPUT_FMT_GSA_MODE,
 					    input_fmt);
 
-	if (!(input_fmt & NTP8918_INPUT_FMT_GSA_MODE) || ret < 0)
+	if (ret < 0)
 		return ret;
+	if (!(input_fmt & NTP8918_INPUT_FMT_GSA_MODE))
+		return 0;
 
 	switch (params_width(params)) {
 	case 24:
@@ -276,8 +278,17 @@ static int ntp8918_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8918_GSA_BS_MASK |
 		       NTP8918_GSA_RIGHT_J |
 		       NTP8918_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+	ret = snd_soc_component_update_bits(component, NTP8918_GSA_FMT,
+					    gsa_fmt_mask, gsa_fmt);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static int ntp8918_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.43.0

