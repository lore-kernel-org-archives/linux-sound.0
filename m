Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E242123A
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870808; cv=none; b=Iob8keY73g1ydbeb0NKeCNkwaLC4DpdmIzhZfiMwsjJCR2qDKRxLGj9JTS2aGpcZ/Rh9go2OSUhxAWqUASkLYzVhQJjkd9xPStRf/rOaLcjIGfuqoCNFBxL0+If77MxHcEStGIygp0p0zSnrVdNuJ/skd57WVmamozG4iwqc6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870808; c=relaxed/simple;
	bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvF4WyLvqXpMZVKkWd6cFiCcT0t2W5YS0H1zfhzi6aX7upqHMW5hbuovnz67fwCgy4FD7/KpKQcXNS+rKiLC49IZllcXT8wmg4D+fr4eOlfG2sE+aj2tnSVKSr8pKbciRDMoDOyj4R+0kle/aw3Yu585L5tWANy8C0109eCzRRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fYo0fA+q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fYo0fA+q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso20401535e9.2
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870803; x=1791475603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=fYo0fA+qSazOkWwSzMLYvirpyPYVLYI23VcZQE1umnXcjw/yZT1iVtPsojIHdB9pX1
         /tSVyYsVigyzpa3zm0Lu8mQnvcfZD5Min0wDeA4L7hyL2lpqZ9WjVEOCHiYyunsgO/Wg
         6WYqVS4vg69SpLScH8RxhejI1gsCRXHFlsBRI2AjbSWj16OX+hegGCJKGXL8h4Z6A5nR
         9KN02YX+I857YHRaLmRzo4GZ9hkDQ+zUhN2qBXNZtwP3owwZXGLjnum3XpVueXqb4g7J
         jLRbLEDdiDn0iCqzdFiSmQdltqCgQPk6zCfiJrZFa0+zwdLfKahxKY+S7Yi1vu3RuwnI
         h8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870803; x=1791475603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=nolei03qR+7vK2iBjkXCZHuTr6h6vLUbkCcQLDzAbfIGOvoamA8PFAPJueyjCzAJW0
         hNFMHB41nUph4jC868lu00d6e36vooJuJV6C54zE5Vjat+JceanRW6m1T8B7JxHbhd2D
         Rbz3boezrhFnQ9ZA1DWw6KS6mijJUU3HJYGZzDO4aSSAP1h+ZLzbWQtlbJmBQntyI+XK
         4S97HjRi+4AD3+SAn2K6rHZrPPh4A1NPrdC3TzYOcfhj1Ql+hK8QHQIwrpGIYIG+cYAJ
         QXVwyz2OmMHlbzaD5mx4o6BcPE3Ftu2I2qi9p8TD85OCw+o+EeRPGVUwX15bNuwcybsQ
         8X8Q==
X-Gm-Message-State: AFuF++lsi7mQJQOkRLsvke+OiV+9sHjuJDb7bgsDY4JEuBxr6f1niusU
	PYBpZXQMtD9G91XIYuSftCzo+1jDTXKyzZMK8dfJ1IpHruOLOTMZ19CUm6wZf9nYh2Y=
X-Gm-Gg: AYBFou0vUkb2eiBUDXExdC0lo0yi0EX+Ja3E9eo7ckFfGHpzgs0h1u1dt9iSf0wWsJ1
	o0puAmxvURBFUK2z+jCMtOjmWkU9yYiuBO7ymML+JPNGhMjqszmlaRV4eDovT1MMyecxAMiGv5k
	r0JEJc3nHRlKu1ELNEHeB5adQUEk62hzVuBmZm5/sM7xpJl9EpkXUsnsABiJXjPvg9GvnSXmNZU
	ZyN2NDX12HT1QH5YYjYF5UEPJhuKPEWUTIxsqjS1lXLxI42J9clQ5U/MYrbXCi5fPCHG3DorRh0
	bMseaBV7A10js1dmxs98QdQyW62dIvhvdOmyH6n5L9SLASKxkoCDlMuqvce01Q06EXduPvyYfEF
	atBcwKgurLJCi1dZ0u5vmuXm1UkD4BRjeMNCFj+66Edv2YPTevPeqBf/SM+bEhG+YnOf+tY3lfh
	lWzlwZvmCVO63vavPePVX9kiS2c22IHBWZsZknS5EAZ9qBOPi0Es6mDiEy04LspBjY
X-Received: by 2002:a05:600d:8495:20b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a0276bca29mr1048545e9.16.1790870803622;
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:31 +0200
Subject: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrlFLqls2D3/ss7M453XpCf1M03b9P/4rsqyRY+NO
 hw63bIndZSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiHkcZGZZvr9qQ0HIlw70k
 /1mL9g6rXafOB7HPynRvX8jW8df1hDnD/8TDQby3bNlksp+s/d1+ve+JJMuF5XksSoEOIrs3edR
 VMAMA
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
index 932be0a09306..7e9b34e02275 100644
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
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
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

