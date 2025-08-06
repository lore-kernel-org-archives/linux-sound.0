Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A128C5CC
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488835; cv=none; b=DFxmbc0As31kRY1MKJZIOxR/LRV7JfGV3snv3zOj0NCub9EvIneM7zMC3L+AilC62IYXQy+l0nOQ5n10dvxNmV3aJ8fceCAU6EoaXROsgYxcF7U89qmKZhxsT0qzhkIc//z9XMGxtNh9IfcuGjWeEkC6Fnki6kFNhT/rv5rJWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488835; c=relaxed/simple;
	bh=1e0Vl0DLzBwJ1AEPVtS966+I1J911xIBcPy784b2oeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kn89zpOGxN2SA9F2DG3ahc+Mm7Lm0witQy9WDg6Zi5erb8jjbuc0kmpZFVEslZQoajMIwz0gllsVS3L+ZedKkwyyowZEGR91YZaHdUx2Rn0W0eI8Cp4jKgjGZzE6rt6IaxkL150kLU0mc5TmQd9vwXNIWzPcZkv3ak1Ht07zI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXRsvFVf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXRsvFVf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78a034f17so4897105f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 06 Aug 2025 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754488832; x=1755093632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S02Ags7WvqYe7LIFO8GxG705rWR0j/aMg3rhghXyds8=;
        b=TXRsvFVfVY220CPqMlInmShETRQpmZej6tRQe3dMved5lK2YaOpiXmUaooYIoIMsbI
         7ODb5DsWIMV5skC9U1xsuLoZN5mGkmaVHxsHYjYKm5+TlQbdN0FKXZPUJbRSSg0wpPXR
         YQ6VOC3jLyQllnaOnPWXfLQJEcM6kNb4rvobZe0k/I/DCE5iIvOkgHjhGCV0L4ORCcQZ
         u4WrQbMB5g4mojXDZMhtXQ6KFCBauzYGp9kwjwu0rD5K8MhPMjZdcfpybkpmEMduMwuo
         JVECkspqS8ODh+xCaV6HPCO1O6QblxoEshYp8l3PuJINi4HXKoDrULuB3iSlhhgdFWse
         Ojxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488832; x=1755093632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S02Ags7WvqYe7LIFO8GxG705rWR0j/aMg3rhghXyds8=;
        b=F/pZmIBVFHoTd+H2v9noamu4O5xAjLnLBpaWIQt9EuzEPgL6NxjyEl52w8N+pYLgP+
         qktcn+631xYE1ppzwmYj022+HkGyj3ZXvb7JaKpNagnCH243K9wJU3AIoS2mBEOe25nI
         J3iwhb+i2/bS7VNpM79xahYMEH7t9Vww2LJrFZrUOAB6j+eltCtkEiwqL8cP63PnWHlY
         tYJq8V6F4SnOOL3gN7EohevrSIstpasyWeM50AjEnuZZS/CCuX3Ini8xy1WegQH5yzxS
         qTOGd2nG0KuSOtPm8Jgr/U74Le2N5bzsUCYxB9ZhyG6h9JkkLRxfp1cYiOgu9+0rM0FU
         eHPg==
X-Gm-Message-State: AOJu0YyTqClToEIopvylmJMRriG5zPlTWwpLAWMcRIDTMD6uWjz1dkVD
	iGexw5wUf3xfiX9AOW2Kn7SLbpKQ8h8RMsdke98RPnituKYw1UJo3Am8tEBinYGTGZyFLASBuRp
	+ndwN
X-Gm-Gg: ASbGncsdHka8S21YXuq/eEwYzkHdZjgqdizSU/q1RgHN+WGbChhu1rkuVF3A01dJw1k
	um/fUQhi5fceSIt48Z7Oebjbi2+32noV57kCDs1NGowdFlludWpbWmPxq6hqD/v7RMGiLGRZX73
	beYu6rS2FzZXKE0fcOGf6qmEcO/76Z/8DditBMHXjgyy48N/NmamYgve94tId/1ovXpuDRawYoN
	5zt56gxjBUIItG+JQzHSB+JECF9Xr8e1ohPvJN31+yKHNJ3eAQIEEiJ6Fiwsqc3uCxUDgOocHP0
	mOyMumaniZrx//LnTqXVsWmfzfStLvxuYBsKa/8S/a6zINJgxy3O0xBJUjRFiXAc8/SAuoxouW+
	2eNQJi1yfb4QQ2Z+wKWfZepnNGSRXIDqy2NXNZVZNklo=
X-Google-Smtp-Source: AGHT+IETmAlWMwJ2qjfxtHRSSLJlNaDSRStt3AyM41fvjsH5fd9IH28npg8xRcL+NtabnZE8k9FKKw==
X-Received: by 2002:a05:6000:22c7:b0:3b5:f0af:4bb0 with SMTP id ffacd0b85a97d-3b8f48e046emr2027583f8f.23.1754488831620;
        Wed, 06 Aug 2025 07:00:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed07fsm147276365e9.22.2025.08.06.07.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:00:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
Date: Wed,  6 Aug 2025 15:00:30 +0100
Message-ID: <20250806140030.691477-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We already have a component driver named "RX-MACRO", which is
lpass-rx-macro.c. The tx macro component driver's name should
be "TX-MACRO" accordingly. Fix it.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

v2:
  - added tag from Neil, corrected Srini's email;
  - changed commit description (reworded).

First version: https://lore.kernel.org/linux-sound/20241016215930.1144527-1-alexey.klimov@linaro.org/

 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 40d79bee4584..1da34cb3505f 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2229,7 +2229,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
-	.name = "RX-MACRO",
+	.name = "TX-MACRO",
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
-- 
2.47.2

