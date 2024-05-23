Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845113F453
	for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716468496; cv=none; b=TIaYL1SfHw8imZtDBNFSLyH4ZN9PG7YorlYO92wMcslRwTnmEjsncHtCNWlS9UDB9srkQPHknxF/KZWqKg+7AcNjLtw3qTPHnHAvyWvrrHIj5U7n6BSQtTVJxJd/dj2L+TMGypcCxUy9+YxmE2aC6MzaGeMG/UglM6UDVVsV6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716468496; c=relaxed/simple;
	bh=7H+i1fptu+/6Y+LOC9QHsTZy3fxGXIz/oEFy/KEXe1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcruGt2MGzI/3mHxd6RG8MV1zILjneLM7ZIBXnHcoDiWAOhnZVLFWwQr5GePuSJvvxy3zoix2FAyIIqzDYHC6a/VHpJnmqAKCT422OpSHOpNUKRCFT8EAvnr/YUgHxSCfD1oy9lOfmcA49egwuz2nVYzhXfxHkOxO0dWYN7D4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSl1ITqO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSl1ITqO"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e52181c228so74744771fa.0
        for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716468493; x=1717073293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9x7Vo9vvu6p2oA0ahpRMi8dtMiJqaBytkcFXFhGqro=;
        b=tSl1ITqOeIxlXeUt6P5UHsVxcjkXYlpQlLqeeLH7uR2VoGiIvSylVlfuFZ8h++Lzw5
         swieuFVWzzBOdU2pjxCH9kOW3cZsjxaIPI9EDmsDm5V+i8kwyAig0FDkhn8NG3vsx3wc
         XVIGSoTsR93wjgEVTnlqAfoNmGrKRpqAB/8HFgqSEaxH/8foEzVOOzG1gQkauXNugoJA
         5x42g8tpoUMwF0NyeMty2Qu0fAeHuNb8KjSij7jWFAOM75SOgNUX4ppWtovCZzbWFLAn
         cG0B/OdvsILjp4scEd+9awy17v5zekTSp8Dy8q7eHWUdxnE65muR4dzhtMVD29ZmqV0q
         iImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468493; x=1717073293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9x7Vo9vvu6p2oA0ahpRMi8dtMiJqaBytkcFXFhGqro=;
        b=IR4LZ08iZ8mGTSqEJGSo3XfuozMTK22Kur0UFHzgkW8Tvoab92OZUm/hzWwojbWJh3
         j9pSVKOBPl4SSQzqzDUVoxMfhShzJ/6uGs4rrzdteye5TMmERkTznXBcCio2o3Xoasf2
         uwUuCIZgw64dbYLOhonZijhgXcrjR/8cvNXKpomDLrtiEqMEoAk05vQgTY9VoAvXDCQR
         V+IjRe/0O2EGBNQ/j5L3RX1WGnJ3BfeVOsZtAeFONDNWJo8k5eY8XNcmVFr7aUofS0fQ
         qha538+khMAfMciZoQGeu+su1vHbcZA6DoQWfsr8Uo7dGlCLdpEIi0wRlvjzBxYPPHAu
         AGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo+9jea4QWGQuzFAVB+kw1TVHxWZ7ZdQdwuVSQVxE8URltzgxz2cMJBrCseEx6LAMSNoxwEeyfmyxDfayCuYM2xSKQooygP8PXqKs=
X-Gm-Message-State: AOJu0YzfXEC9qHnb7W4qZyy7gNAHa0pa9KudyFG8dGU5yUCHYWS9vtDb
	ydbuGkydLKta0ESE5HsQ+1JKs19JO870IFjOELP8talyOQFlUoEeP8g95iiNjbc=
X-Google-Smtp-Source: AGHT+IHVrcU5GJOVwh3WzZ4bOBvGIcYyS9n60HryD8j0shddZfNZ79T+iSUvTkXyJ5Fbh3kQEMvcdg==
X-Received: by 2002:a2e:2e0e:0:b0:2e5:61f8:db58 with SMTP id 38308e7fff4ca-2e949465c21mr31089701fa.11.1716468493033;
        Thu, 23 May 2024 05:48:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e706ee0a65sm19730031fa.112.2024.05.23.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:48:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd938x: Drop no-op ADC2_BCS Disable Switch
Date: Thu, 23 May 2024 14:48:08 +0200
Message-ID: <20240523124808.42923-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ADC2_BCS Disable Switch" control does basically nothing: sets field
in driver's private data structure which is never read again to
configure hardware.  Drop the control as it has no effect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 9e2070356b84..73387152ce02 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -206,7 +206,6 @@ struct wcd938x_priv {
 	bool comp1_enable;
 	bool comp2_enable;
 	bool ldoh;
-	bool bcs_dis;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
@@ -1650,31 +1649,6 @@ static int wcd938x_ldoh_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int wcd938x_bcs_get(struct snd_kcontrol *kcontrol,
-			   struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] = wcd938x->bcs_dis;
-
-	return 0;
-}
-
-static int wcd938x_bcs_put(struct snd_kcontrol *kcontrol,
-			   struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
-	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-
-	if (wcd938x->bcs_dis == ucontrol->value.integer.value[0])
-		return 0;
-
-	wcd938x->bcs_dis = ucontrol->value.integer.value[0];
-
-	return 1;
-}
-
 static const char * const tx_mode_mux_text_wcd9380[] = {
 	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
 };
@@ -2695,8 +2669,6 @@ static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
 		       wcd938x_get_swr_port, wcd938x_set_swr_port),
 	SOC_SINGLE_EXT("LDOH Enable Switch", SND_SOC_NOPM, 0, 1, 0,
 		       wcd938x_ldoh_get, wcd938x_ldoh_put),
-	SOC_SINGLE_EXT("ADC2_BCS Disable Switch", SND_SOC_NOPM, 0, 1, 0,
-		       wcd938x_bcs_get, wcd938x_bcs_put),
 
 	SOC_SINGLE_TLV("ADC1 Volume", WCD938X_ANA_TX_CH1, 0, 20, 0, analog_gain),
 	SOC_SINGLE_TLV("ADC2 Volume", WCD938X_ANA_TX_CH2, 0, 20, 0, analog_gain),
-- 
2.43.0

