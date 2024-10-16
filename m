Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AC1D4173
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 21:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729115975; cv=none; b=jK6PrMEpjqECQY7nXzsWXQJP/C8n4ZLGvqHzp1777LJvo13PsjxK2gP9DyRjguRhDWi6IUbwqqDuw1OXhawmfr2jxaA2EoH9McEgTMqc8GRzpOo2166qXUwiQc1pdbJXUGbVW+jSzobxJzvkMHIoh7CpjzxcQcPKDcCuLTC+yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729115975; c=relaxed/simple;
	bh=gZ85YJG7vfi8u4FQ8plCpOZj3X/b0SrmcIPg3BAgSxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvXW15ygyweP/11tq6dhbnbh82FiJmG99alkEk+aHORlkIydrE7lKVKnRIeGjR4nbKb0E7+fkL6yJeItzngEMztgq49pCIajUuYMUGITwNbW7wIrBkPhvd4bnIrrVLa8aXAbmq+jVYBKk3rXB9mRVQbwQb5LzsKJ2sdIQLkhkFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHYxRThH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHYxRThH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so3006785e9.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729115972; x=1729720772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki1tK0lXvAt5fjPsKWDnYQ8CptODlSuCyrJG5QK7fGU=;
        b=hHYxRThHAgoGtSA91y52A02RTY1T6zy7MbeZ74hLr6fiJHHWHsNG522tZU96JksAHa
         uqtvP0qR88MHrXl6CbB4vWar5+bO/VqLkkYJVtM7hd2DwaRHQO4XgutDc51CQUp9JiAb
         aBsosPaek2XT7mOWSg8yTdgKGqOPw7g5T5sKbbCqAzac9PE75fL/qwQbygguMADCdkaH
         AdrBE2/4AeimC9r7PW0eCnIkIeypQaYbxo2DM66WqkLDRQSQJ2HiPt593z7iFvJ10SBp
         mRyw7fVaEV175SBMhQoBvXMWyXinBTOIg5BLY9o1G9hwfJFmRh8LK7e3zFSPgehG1HIP
         oFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729115972; x=1729720772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki1tK0lXvAt5fjPsKWDnYQ8CptODlSuCyrJG5QK7fGU=;
        b=hDXqZJxGOcQS5nuVVY1PaFwn2di4ucEDj4bqEnkl12BNsAb7Xn0iEIQawmCb1C8oVm
         GCieHKKBIjhqKj4FSH3Pbo7M/qrFs4NjAlSRacQUv481s8oVcWGxb+k8YViByrFqRfbn
         W0Br+IExYsOklovW5EppRaXZfnG3NNydmEkjNfl+br4xjaN9/tN0VcdMaFGCZGmrGrIz
         8gKXsUHzN+lHhLu+ji538d9D/gN7RUyMvjv4tfDChsWHf37tsDlUerughmF2+JgUwU2s
         lOjMFLa6VZ3Uo/eRhvmNVxLDG38XnbYyluoxe2TIVZLo2yU6d11UdhlQ8IVAXMCcH7fz
         zVdA==
X-Gm-Message-State: AOJu0Yyutck0Q9AZjN3sS8H8XYHs7aPelxJafAXqrCFKHR+HNdp0ZDhM
	o/AAZpkABZVzuQqOyVgtD1rfwJEG7JKLPmQzXfQ7NrHCTXOr6FwlwhAyXEylXrAgkej+GNSl6bB
	a
X-Google-Smtp-Source: AGHT+IFioaXXZK1Tmi+xpk2KBU077R3Z41+bL9fy1kfiTTA6z5vvkSfT0PCGZlciKZoWGT4OuQ40rA==
X-Received: by 2002:a05:600c:6745:b0:431:40ca:ce6e with SMTP id 5b1f17b1804b1-4314a3acc32mr45668755e9.31.1729115972185;
        Wed, 16 Oct 2024 14:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c3bc75sm5888255e9.12.2024.10.16.14.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 14:59:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: tx-macro: correct tx_macro_component_drv name
Date: Wed, 16 Oct 2024 22:59:30 +0100
Message-ID: <20241016215930.1144527-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It should be actually TX-MACRO rather than RX-MACRO.
Rx_macro_component_drv name is RX-MACRO.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a134584acf90..74e69572796b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2230,7 +2230,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
-	.name = "RX-MACRO",
+	.name = "TX-MACRO",
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
-- 
2.45.2

