Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB815625ED
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092901; cv=none; b=WK8VO83RIeT0UzectHsFksYkFnoR9Htt1AAS/Eih9F/A8o3whQVDBBvW4sy5slZl9hsUhBOJJZFRMypjU/r98S/C5DV7a+qau6pZ8J7zjGxOadvQW+PRkqvN88Zc4Kcd1d+hUhzRuO9jRmbNospNnCXCoTDBEUrQBJdNm4tCZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092901; c=relaxed/simple;
	bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P31k+VRerOa53i/2mBDFBkq3GLoXBdnXgM3QiqDd9qaFl8i3xDmO/kO2CysoJr2PSI1XQnaY9djPa/QvphPDos80EpI4ilLfmWeQU8DIavSyFtosvpIkX5u7Kk2VxEjiD9m7qYTwYI3DkG4ucn2lzdTOJ3V3HnfBd1Di9rH4+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YrqyvQFq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YrqyvQFq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so86832f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092897; x=1790697697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=YrqyvQFqX+CXerrr3Qj5RMzqfJqWqQyomll9sA8w6/GNZaXdEoQzyi7jqiyO5fO9a8
         s1tVbOxpBH933YjUrneWc8WNgyMo5oEkyViq3B9dKBR+cxXLhhifzVczM5Dn8VKm8dcy
         8o8Nq3Wf3z1AHK35FwJuFIUtDR2yqxW1By4TV0Fwj5iZr3WH5K7SChSACKyvE+d50cgy
         0wNq5xVplAt2UQuWjKCelSz96HEA5AJ1a6pqE9XJKCog0CYRF0WNdDyHSFojHuere25t
         0BokCsKOfdh7gBTROj9DZty/d39h3yaqreTBP3B4gE1N7JdFoVcF5C3nJAIXTdfgFtAr
         AbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092897; x=1790697697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=oYGQPuA4SB/GWQcQVFBBp3Cg+WPppUx8hl9/zAFoNNnS5ueJgsAnxMbB9KAK5pt/VI
         t5AdHGC+pWhjuGdHjyhYWxS+7D6I4r7HcDrHOyrxKPIZ50tF+EzA+zqBPdBvgkiD1yb0
         qLhPpLcZCJN792B+xTM9KcHeFxODmcS1IT1CFn6tSk8fsRsdPoTlt/on/fJp6dQm0NRx
         dycVWY8Mf+9t5YXbvsP3A63d1R5dlYztuHDHFr+AG0IswOsS8VdIWtluRD11Jop9GaXa
         Tpn8P5XQfdNr9yVVhGCpxHEvIiW3vbNA1g/mf2KXwGyXYYGwsGsPIOYeA1MHMxKgWMMy
         IKJA==
X-Gm-Message-State: AFuF++n8KaiDwWlkLEggarXL0PZQROuFHmBJa3aOPAdh2a9knl2jq5tx
	jW+wlkdrQtCalhPcamX8H6362g86QoyJltUXhrUuR4dnkA5YRncmeLSi4PT50RPnG8c=
X-Gm-Gg: AYBFou2TcMycDvP2Aj2kTlajTVZ0sLNcuJkeZg3DGLRBXOIqiHuLgD1pXoejPRhZ/ow
	kzyl5/Kb3JWE6vet6/aZpDzbJecne+BC0SHBMwvGDS3CTXE6rEDskXzAvuTRvdT8dip++Aluaht
	CM2sdWQXBbiU1Aco7OOZd3o7ZH1S9Jwb4QfsN/EXHCJXSQCBxydY9fiSYm9zYQgGU55vHi4/IOo
	G96+jwRbE5NhE1drciOE2SyhpDJ63HGjanNIxge0T63Kb6GPZjKhf3citqVJbZ4ENeJZcTv4FpG
	PVW423HzYJZcq8gazXV9+xjju0bXewr4+zP7jqWSnH6Q2P/ySlnsN61GTTBsQQr1zRk5Ho7OrFX
	Cwh3jd5FAs4sMM9IcjkDhNc7r1AvpLCJW/vQqW/xN1SrJ2OEAb46gTPpSw9wNw1f1ELiby8HYFu
	NA4AWAXUEi8FwElJOnEmC5bo0umpK58l9Exb2J+SqNpTOlDZadz7pk34ENsHUk9J0fjA==
X-Received: by 2002:a05:6000:400c:b0:487:951:20 with SMTP id ffacd0b85a97d-4886709c990mr52052f8f.46.1790092897354;
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Subject: [PATCH v3 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-6-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkV9nDbpoPCsi3wfGe85eb//3veLqzqv8vL9f77H5
 Bb1XNC36ShlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnh5jZJh8PLx+x5Kkf4En
 tx3hcQq7ZN6dfHP+huW255scDDPPzZrM8M/y5f8Fz2ObGJ+5Zcr1de14Pev+GRfHepXq9HTff82
 2HxgB
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..35bc47254752 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

