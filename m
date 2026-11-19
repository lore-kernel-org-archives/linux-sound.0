Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073844;
	b=YXvOIWdDlCIsmBmpZjPGn1cV+kb3woQEu1fmoGMcijnj55fdXp296zmEvH3hOjRJ2gt2
	 FjlGLMcw4SmhIhhloXKwqHmsvXhLel3Ciqfkp5txpUXM7dmJCVe6T8l2muP3aRzCpqZ2N
	 7iVyxy/FG6QdcfacUlPxcStV8GZ/1/yEHyaBq+SLvgDtesU/SWrRfRHTmxrmfSiLn7HXv
	 diLQriIXWg93lLep0UYQuF7L4YkQDi0IQHJ1XVhfpTnzpt+Rag96D2VcH3bSJje88DcRl
	 ICBz5xiz4xqmsVv45RaGBN2z+4JkSF/2F9IHaYXfLi/n5omrTNyBqwmWsUt4jmIEzjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
	b=cz45DhxatndJHuIQjvDNb3+osqajfLbhqJ88FywhTE1ES/FS7mkspLhoXnDwb4hpFgK2
	 HAiDYq5RfE6KODSFB61IU5AzE3eZIDFThh+g7VISeoH9++il0j7y2FAcv96h+jZ7OSTxq
	 KYKNaCIjWQzZBEhIZVN/Wo4XOkPxCX5dtDkpheD83YVF6WQOXUUyZAiUij4GyofHQEJpF
	 Wx51s+swcFifpxCJ8LfxfE+AcTBmAdEGBDCMr8HX+lpOZ67q8diGplne+GJzVEETrdIEb
	 3wCcjrronJ9Ec3BW+RXXJa6ZfIJiFKsBi56eZPR61OL0zADft4ZPlCYOa+9ZeWjxH7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asJKNSmf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87A606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA87A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asJKNSmf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-381d542bc29so3568445eec.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073843; x=1795678643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
        b=asJKNSmfC/rYASbeVtVcrb9AOR6+tw96/vwikRFL8m9+s/0CWE9k/1sgC9/nTB8P/3
         D7q/IQrHMOp30NSEWkPaYIEs4nYYLv0bnGT4hwhMIvLx9afMTb6MPBWoWQNr09nG6Bjg
         REHIJv9TA3Q0yYaC/HEa303Hdyq3HODXQx58/j8h8LshxwbZfchVnbw4psExPrAA9AXc
         2lW1f4oGPpJdRBoUuhJAf8n2JQjKq9pGMb9IIZD3yYjQPwyujKINSH/CvY5XxVM/37IY
         5DXEWht6jPlqSxGHPEDiXXqANKIw0vx+nyZIsc7yaa++67mhZdZDd6gN7JHlZcvPrZfh
         JiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073843; x=1795678643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
        b=iLMhXa2FldYkFGMN1LJGnN3DZLYD1j1/6HTc/WquZPhMmRhVrJNZodGz8jhPPxWDCO
         BbH5sCAith2ozhN26docCOSoNG5XkvyozfKnINGWud+9whfpZPnqP4mVfvtgQap8Wik8
         vF6w+JEMrS4+JptmGJjyJImkaU1Q+Iwgp7WM0HomFoBZlKvtciO8As9pNK4w3fhWdyeA
         MGWcNpiPJOBE/lc3LyWOVWZ/QreVUYAeUfVO4Nzv5sSHELrvxkS4LWSjz6lX9rOEsm/i
         YW4MY7wbCL33rrZPUv71netfk/U1p9w8vljFr7Lgk+PNYYRs0AZealIWD+W2khhbaRc1
         ON+Q==
X-Forwarded-Encrypted: i=1; AL+hErHBYmJ0Jq7q33inIws0lVkJoaUxQ1AwHAUppyG51u867NyjoRy5v+nvNZZUJhyPBsVThXdZt0W+zN9f9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PoNKxwrJAgHJyfz5AWz98duvnlF3i8u+hQjsZCqJ9plrCfzZ7
	jNclbETYGbgT+zaHSw6p8fQ86rtecn6gaV5lXMd+JqA1JuFRi5frV4Jt
X-Gm-Gg: AZFdTZfZeUFiErBDPYbm7IPQsQN5xii9T1R+h216/Aauo8nC8ZCFh4chxv4F2/FhrsR
	UUW7uuCIHof8v0yl7Gorp7qbgnRw1v+Hmb4FeKGa9Z1n2Zyy3W6rjXJDhBiYwRAKh+K/065UbnL
	EcmtaNhvdili9e9jkUvPTVGM7Fl3hX3VyPtSzkTWnAUDzCDB0wmEsiapbzvSG+fvETM1UcOZSxG
	jIEVqxW315Jc2rMFa3ujqR2juPnnFjRXn/Fq9fJGbxYZshFhnmSrlqZyakM3GWmXOqH/fDYBnzU
	LM3rnBonOCoA+gHjKOR5GQtZnawNRV+Zb/Ju9SKwfW52xrZunSS+hOycRAjZYmyXDJcp+B4dp7L
	MDP9LbWJRzSyHGjgjy2IALmaj4a/8qkDjYjS6lHnOE3OwLbKNCj72G9Sa0R3QGOX8Mg4/AqWu5r
	zGJFN1R/sAmpVRMWOV7twgd0vWIRwFtA+5cI68tWmPyqFSXzve+9VBnEjO0aFZCxT6bvcBLCyJ1
	X9dTV5RO+fzww7Lx3OKs7ECEMD9d2T16HKcsUjtWuxd77Z4PdD2xC5KqHtPyq+h9/K3D1ErtoTd
	hsgrDFVHy/NiiZIUmoKU9mYdklWTmJSirmr66wcH4kIaU/kLl2/+0g==
X-Received: by 2002:a05:693c:83dc:10b0:384:a0cb:a6b3 with SMTP id 5a478bee46e88-384a0cbaa15mr467087eec.13.1795073842990;
        Wed, 18 Nov 2026 23:37:22 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm2663207eec.23.2026.11.18.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:37:22 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 07:36:53 +0000
Message-ID: <20261119073653.2632-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
References: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
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

The dmaengine_pcm_prepare_and_submit() function does not check
the return value of dmaengine_submit().

dmaengine_submit() can return a negative DMA cookie if the
submission fails. However, the function currently returns
success unconditionally.

This makes the PCM trigger path believe that DMA has been
successfully submitted, even when the submission has failed.

Use dma_submit_error() to check the returned DMA cookie and
propagate the error to the caller.

This ensures that DMA submission failures are properly
reported instead of allowing the PCM stream to continue
as if the DMA transfer had started successfully.

Fixes: e7f73a161356 ("ASoC: Add dmaengine PCM helper functions")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/pcm_dmaengine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..5b9fdad4d9a4 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -154,6 +154,7 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	struct dma_async_tx_descriptor *desc;
 	enum dma_transfer_direction direction;
 	unsigned long flags = DMA_CTRL_ACK;
+	int ret;
 
 	direction = snd_pcm_substream_to_dma_direction(substream);
 
@@ -172,6 +173,9 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	desc->callback = dmaengine_pcm_dma_complete;
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(prtd->cookie);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.55.0

