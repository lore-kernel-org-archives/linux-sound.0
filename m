Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664863;
	b=xWlm6nJuGgKD+KHE3UMCJ+RP5WV1KDDXam4Fj9Ou+yBCOJtKsYl3RqrHdRRvYyNpY3Ey
	 3Lro6/hrh+nn0f0esu3W6sdiTXbfsL1yKmx4FmhRAQ/1UKFkPYpFE1K9g93agOUxrO4oQ
	 GSpTJYVxh2Rbdzz6fkDHM486QxK7QtIEdAg98N5DnHwOmNk2VtbVfgNWhzxKW1koloRAR
	 yjn1hiZuKV2jteLMLXbvZthb05Wd7shZUdBuP0buYVQZt727hq6LhyNwdlKTIZtJbALL3
	 S8DpZQFrbetE0NGzcU8+wX6rbXz3UzhG5zncBFsN1IcgPrDxUxKApVos3DvaJadHuCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
	b=YqgSsjgpwPr1DHOcyGskRRzaNrzfXsbwkwF6wrj87TQNwxa8L9K004K7cUQd28WdYE6D
	 IO4fn81EWRyfh3coWQu230pcOZ0gFxAEki6DkCf7wDFawhmUxxnLAgQxvUxGoMNOd3dFL
	 l6F67SQfY8+wbOnj9b+HCrWKyTh+8WcbNXSdEBLeIY1trRguLJ5BUIil4MC7D0uVhUJjN
	 TNqTFkzAeYbs6qUqn/eNQGG37qiRZiYp0eaBWV7XosAU2R19muvmXga4Ve6sRJnhzVyQO
	 z+jkA5E3nGoY4f3ZmDTL6IWbvycOh44vjTH4cWDtpNmLGzZeDHdQH0Al7JHa2/ot3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="P/FmqH7d";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF34606A33F
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF34606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P/FmqH7d
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1720014a91.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664862; x=1793269662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
        b=P/FmqH7dflDIVdHdK3bz8NzpvG7c0lGqndu/uBhyb0zlWiPZK+whRtLLFG/MHojFiA
         YMGpEZsJRsJymmftWFBc7xCcziIKb3z0k1l4VOJWaVVHcmvaw+icYbwK5HFk5miBQG0H
         G9nu8I7OQBFqhw7ZN4WbHfd4FTDQCMKbv+Agje73ddezTiQiGGG1DvFRU8pgR89UmSN6
         +w1SwM22qqnsopnkayudZNdDF935w25Knrn6xK7Dsg62v+IE/iEnHieFBSS03uXfUb7a
         vbTD4CA620QeivRHj5KXMChNM4oNysD73b8jewnZe/6c1ec9V3x3RRbU50M188gJ+1kP
         hJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664862; x=1793269662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/St7nz9trNJLzodDEvl9jP1VNCe7LII2kl/X5vpWFI=;
        b=0FbQ+rZz05urPyKwgMR2JiCl7LM+d4rCnYcjMAo0YsvhgsarBDRIcrb7H2NnpOAWgB
         v0cMP+m/cS2JSL3NjdHBWJ5msiYXAMFjYHSXJkS2NHnflfj/BkpK9jCWJ1CTB3hB9WjW
         ilBVhmlxCpvAsyTSt9xWM7XofeHCTps2CaiSKbYuPFVG7G4jKiduBCc4dIZNxp2T1ZX7
         /HBp6PtttIL7jzNRa79zRijU8nUj3UqWr4UljWMKu2i75PECqJW44hFG8P2gWNaSIe7I
         q0g47NstJNjAIslFNtGcfnltFBoCGWCjH6kKEznrfZWTBmbxV7yJ6RcG7F6W23O4eEGb
         iG4A==
X-Forwarded-Encrypted: i=1; AKwUvBzKpjnAzCd0LqmjZW688UP2Cj0CanFU8L89M8yNlkUNWqQbYtu1wcbBcK2IPOGuBparc32Fakj8bCCg7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0GM+bkks2UwpkTViAkrCY+TgRRsQ5ib6sr6x/Ya97pKZvm9Ij
	3oQ5HXQqKBCIRyAd7Oboy7cqj9OpOCa63WBun+Ifw0vbkPRq2Sp3JiNV
X-Gm-Gg: AYBFou1Fl6zaTEEO7gq+mpO/S/pxX85DPVY1wqzVufBLHKVl1kj9YNgbO3IFQtlcMS0
	sLF0I/+KjHnHlFPvsEAJm2nMVKP4utyGl0X13TQAgTpy0QOYZfEH0uzk8mlGhSp6es/Sw5XKR31
	ivQpW3hXv6y90gf1390ueafD72PlFz4kRqPeiUVlYYNK8s6dQRqic5HJ20cEP1Q+9OBM0bZ0OhG
	nzhOvH4VPTtrFWYxWOtACSGjpaBdWQb0cBTnMDTSxPhz46IDLxG6JJ23chCKH4jBlXMRZQ9J2lv
	JWNjbFNzEtaC1aFlSThkcIIrsVNY22jTB4j+gLJmDLAR2R05oykjfVhamrnOcibBh5LSQmUL/bN
	pOEc3MqmCqod6MXy9SLkn+FuGbxBqekXAKYiduVRg08QGODrt2+p2mrGcmSTaLvD2iSIyZx+cDz
	b7MBrkNd4WqmIQ2ECGFUme2DcYaXaqJx+l+Vzd3hRA+gnL8XolbMXO/7Y9eOt9G0YrE84KS1yp/
	PiM+KTEs0s27m4o+CsDT4UhpV77ZTZFoYwCUegA5tf93zloBkaGPIuSRVUFRrC7zqkzjT4/GPka
	JEmnOqZ7BOyD6ImoKmsOKSbbbejBVz9w5Xut9eadPIW1ZFhjXu9T8ex5p3/3xLM7a93B+P2RdwG
	ht14DvYtLgUtip0mY
X-Received: by 2002:a17:90b:1b0e:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3ad86afc038mr4253866a91.6.1792664862134;
        Thu, 22 Oct 2026 03:27:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm3702279a91.9.2026.10.22.03.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:27:41 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: codecs: ntp8835: Fix hw_params return values
Date: Thu, 22 Oct 2026 17:26:38 +0700
Message-ID: <20261022102638.38606-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022102638.38606-1-phucduc.bui@gmail.com>
References: <20261022102638.38606-1-phucduc.bui@gmail.com>
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
ntp8835_hw_params() to return early with a positive value, skipping
the remaining configuration.

ASoC expects .hw_params() to return 0 on success to mark the
operation as completed.

Check for negative errors and return 0 on success.

Fixes: dc9004ea273a ("ASoC: codecs: Add NeoFidelity NTP8835 codec")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ntp8835.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 39620b84e214..2be713e99eab 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -321,7 +321,7 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 
 	ret = snd_soc_component_update_bits(component, NTP8835_MCLK_FREQ_CTRL,
 					    NTP8835_MCLK_FREQ_MCF, mcf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (ntp8835->format) {
@@ -341,8 +341,10 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 					    NTP8835_INPUT_FMT_GSA_MODE,
 					    input_fmt);
 
-	if (!(input_fmt & NTP8835_INPUT_FMT_GSA_MODE) || ret < 0)
+	if (ret < 0)
 		return ret;
+	if (!(input_fmt & NTP8835_INPUT_FMT_GSA_MODE))
+		return 0;
 
 	switch (params_width(params)) {
 	case 24:
@@ -364,8 +366,17 @@ static int ntp8835_hw_params(struct snd_pcm_substream *substream,
 	gsa_fmt_mask = NTP8835_GSA_BS_MASK |
 		       NTP8835_GSA_RIGHT_J |
 		       NTP8835_GSA_LSB;
-	return snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
-					     gsa_fmt_mask, gsa_fmt);
+	ret = snd_soc_component_update_bits(component, NTP8835_GSA_FMT,
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
 
 static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.43.0

