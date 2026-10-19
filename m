Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448941;
	b=28SVQH1DQxMI9/HwsyBFlF0dsMQhalfGFXugH27+WphPGVlCaWX9ZPvDnABWXTdjQjjD
	 irgNIWPpWIoZWZeh5Rk9ErLyDm2zwwnBXL0/IL3/ySNOU1emqKstzWeQwf0Y6nW05v24e
	 RnNz8Ud8QjtGOGGtlO1YPG0h4i1y/9MXhEvd3pc7so5+ZKpzo/ufymX4WCKviJFZrnpNw
	 Jc0Kw3kFRUHqpZ4KdINsBO5er4kCUtvqWStT6kc73EI/3nfJpoEhbcKSxh5D7iWtKRWiH
	 9gszhjFpJagYnToMZb8BXcFbi7RNNtN4i3YcXW1y1T1PfQdhJEYdVWn2iEsALtemXRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GjFeR+rw68+W2eIdvH6fzeLs8Vg4s/YI173M9KVa4TA=;
	b=iqYpp4UfZ47RMoiAP3pHljf/yOPPlofQ8NX652HC1MshoB0hCIWymqkmGKZToJtV1D7C
	 O9llvAhTLsX/Me6lMU1TtmPx9jdvjcJt6m+FkCqqWTN1P34Yxd6fw0kHHt/TSGXAU9oXl
	 WhCvOpP+1yqYX4uig0wGJOGbDdhRFUCTIkYBzWgnLT82TkTo40DTzWWvp/hK0Mq2xuypt
	 xWC37BsofE8aIoRm9sSbTEvwbxH+Xzc8dJxS9rMfdF1bYG6919Zk80YE2L2F9nM5a9M4u
	 V6aLVMLhamKSvZZLfcdTU/yOyqRi+/e4+PmpZ5yQbn7YvfX+ownlGEhoH7sQeXUMPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aGrBuXaN;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1C606A31A
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 22:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aGrBuXaN
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-78fb1fb9508so93999137.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 15:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448940; x=1793053740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjFeR+rw68+W2eIdvH6fzeLs8Vg4s/YI173M9KVa4TA=;
        b=aGrBuXaNJPNdxhCzJh1cflkFkrzKGYyWANIpaI/igiGJAsAptJ3PFrfa9R49tzqdHD
         3+0365aJcmELc8qCp7j0G2Np3L72dcZcilDvo7v5Q6sEjhmAvLzK1ZEQHEeAvnF4yUk8
         6wdZfMVCpDVbRFXMs8/I5GWtAyPGRjzcGGJ/EVDNgOyWPih/aj25LpmBVL5TqK398NSL
         8NNWxueIQluoMfWV1MLxxudHRxTSwFUURujyPxu4kZk4I1q9KsaJpxq/eplmoucnB4fK
         7B72X9WJ8n1JqquTBSyjz4QtHDfJukHGHKxT6C5HLLZj1iCgvL6H123cCWfW7Y4VQS6X
         qxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448940; x=1793053740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjFeR+rw68+W2eIdvH6fzeLs8Vg4s/YI173M9KVa4TA=;
        b=KZ2hlRBs3Sd5dLUXd8AijjFF1hYiTdXKDMPaRns9qN/am6l3PI3ONcjoP7bKNyniAD
         q7SBK/dMlNxWoVzTleYhaF7ezih3Qq44VI03lcODXqhstgqU7Hg/5NE3Xz/4QBN92nW8
         dwKvz8EkZEcii8BPdf8YPS/GZkaFDMgv8UHAC3TJz66GCds4NlePAYXbYIai/iSCPAqs
         aU+wRIkVusLsVFPb4OMLp7dvsdnV90E19DBr0NJIs7EqpunV37aKsaL3jVDyEDwisndO
         tiw1+66oZFo33BIcTctgvhxrArhtWsof2K2VQFLtLiQkY/Z+VLvCB4DTfcEaqhqEgzDw
         5nSA==
X-Forwarded-Encrypted: i=1; AKwUvBwmX7Gs4HFHHEl3I/e2pjiubwMGmijMpglATVbP8CHlr4tBcux0vGh9/1YSpdnROmMHuOimxiFXYFee8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIukAndfhl9Oj40wTgC4VfJHBnPJb4ksz65pS9+BNE8i0saPbB8
	xQLqONuGv+B/jI3LB2A2nscl/t/kF87zaMLlwyIBHTTzcoqfjZpIfPsY
X-Gm-Gg: AYBFou1J/QZJev++9bQ+PUbbeCsuoJq1H6eZMWrIIKs16b84BmUU2JbEe9MvST8RhVq
	fbhYNR0h2WMtfoCtxPKN6+2mwONTHgm8xFfqUduh2heORQMWJ8HrZBlMhFWYqrIYx+tXaHM15W+
	+H7uCJo2OulZmzc5tSmGDK4LntoqrGtawG/7ReSm1pNMhLyOyE/7oR2uWa3a5R3MLdRxxdvSs0y
	Q4PI9xazF9W8Ch6o5IKs99l/FhJwgxbaX7Psw47kIPXoJfZcLQDFHj/A5FUmjzY4Rp0TgmSFeiL
	RiCcAFi4syiKcNmoFOhAh+dnBbgXzfvTopsglujzmFAd/Ta6wscI1JZtEtMr0atW2xSaUOVkHDd
	OZ3yeTuK7CpPjS5k1BO5+uI/ZtNKltJBYOVeVMbUfdppkbCqu9XG0WlgxEppcX5EXP9XDVmQDrA
	nKPSmzHgrUPhyWvHUimNU7tSJAWlEUqk5X0BO9BCeYfE16oIKpLmsN0xVarE0FcIS5VDI6wkE40
	xhVKoAwwDwgliVbMuOXx/m1MIJ8BpBvTqQVfg+sLLFdoVgrmWkg8A54mNhcx8EACgPJ3ALJqEQD
	m1k=
X-Received: by 2002:a67:f688:0:b0:7ca:8f2d:5c29 with SMTP id ada2fe7eead31-7cc7bc928aemr83331137.27.1792448940166;
        Mon, 19 Oct 2026 15:29:00 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:c1b3:7470:124f:adf9:af22])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc7722e6fasm1303685137.7.2026.10.19.15.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:28:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] ASoC: fsl_sai: Stop BCLK after the last stream is freed
Date: Mon, 19 Oct 2026 19:28:26 -0300
Message-ID: <20261019222827.131120-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019222827.131120-1-festevam@gmail.com>
References: <20261019222827.131120-1-festevam@gmail.com>
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

On i.MX8MP, trigger stop leaves BCE set so MCLK remains available to
a codec. When the final stream is freed, hw_free disables MCLK, but
TERE and BCE can keep BCLK running from the newly selected clock
source, including an unconfigured bus clock.

Clear TERE and BCE once no configured or active stream needs the
clock. This preserves MCLK between trigger stop and hw_free.

The premature clock output was reproduced on a custom i.MX8MP board.

Fixes: 197c53c8ecb3 ("ASoC: fsl_sai: Don't disable bitclock for i.MX8MP")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 51779d7f8bf8..a135b3da37cf 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -851,6 +851,16 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 		}
 	}
 
+	/*
+	 * Keep MCLK available until the last stream is freed, as it may be
+	 * needed by a codec. Once no stream uses it, stop TERE and BCE too;
+	 * otherwise BCLK can continue from the clock source selected later.
+	 */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    !sai->mclk_streams && snd_soc_dai_active(cpu_dai) <= 1)
+		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+				   FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);
+
 	return 0;
 }
 
-- 
2.43.0

