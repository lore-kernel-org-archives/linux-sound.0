Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076B2080DA;
	Fri, 10 Jan 2025 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543267; cv=none; b=siqqmKDD6CYlUfQb0MhlNWYJuI9fs4XEO3uqTHoQ8P6/oPqtspqGngXQSfYvxeoPYa6a65I9xoheqY9b2JJPXpFoCSUmfAGC9FDEdy86XvwxYbED47yuDVwGbNNEyMA8fmNoPd9zSilglyudbeRfpvWekjwDVqdsfM+XELvKt28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543267; c=relaxed/simple;
	bh=8a0hsGeAFZkvMdj/DChHs2R6Q00YtfjHGRTQARFCZSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbrSXNJCJagAzGXsnPzZUZe83gpoilKUrASr5JlZ6RlKov3VqhJix/gS2K8YJwa0/yD4nYeg/Xuo252EwPaLcjZCk8esZKOamFW0o011+cVlNBqy1fvv5zHrLpp9MEe/A6+5JEI9btlTxh3qZ5HqzXnNxp3PWrg0KQdZaPrRix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Y0z6poJM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Y0z6poJM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so446926466b.2;
        Fri, 10 Jan 2025 13:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736543263; x=1737148063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqM66oq8blRLcCYzJ2r8dGrXeD7gM6fhGOLD4v43C1s=;
        b=Y0z6poJM6kRUZR5IHrTeFMitpik+wnEU0xqg/u41tpFMsXx9yTvCNO4xH9J4Y7DyDP
         FGNByorW8NWlbdRyoHTxkESUddnlDpjoqj5roLUiRVLHbJiBkMswRdcTB9yS88DhIQG8
         0ju8Gx3jo2sHEXhENsOgqM9BM7rzJHg5egzWiRdQQbsVk5KIoV4hHPlEoJHuPRJZuPcS
         r0EVVh7kK003uOu8tzr+LNRdsUb/iydc53XfjQLivrId0iHTj5rglQGHTRcp65tI02wt
         OowJLzAKhKGm6VRDE1itxQBydocQTdNC+PONNJBvT7oZUL4l+zCBwYULMRIJr1EWjGrk
         QWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736543263; x=1737148063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqM66oq8blRLcCYzJ2r8dGrXeD7gM6fhGOLD4v43C1s=;
        b=YtW+1k67DmH8MjP9ZirU/TVF6hWYJnAuvYQPmedmjXFVSFCnoKdSpOj2bm0+KhRL7N
         YQ4R7nEgIxrShZMeRj4TrhhUngVU+VCwq8qABg8sKzQ8GlmqSpVptJYjUX7dEqhbnXAL
         uoxJq2pxYQ8u5DO/5nmAQB2fmct/Xw2N38sJqhQHPQrsgTizTqDs//i7o8C0hstvnTUr
         KWd/22Mh+kJ8E96qbg3kTabnhmJVStR29fnfF9UmtcQE+t8keD8y2o2U1TKkYTFBUEOt
         YRUr1dSmYUU+/+2UW++Idzf8nIeoo+Qau5WeA07HZecsSAME+bEY2qj687yat0+xqn2c
         JYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTnaZfdd8bT5/OO3YTXDekREbkfHURVQK2CfFMJD5QKS2uZx4n30Aa4QJMhMjPxcgOODYikkcTBUt+Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Vx80osKrfP+W5o3vTg/VKXm2FZSeuQVy4UAaF3TMmLqhoHbS
	X0ZCJPIEI18wYIWBcTGa10pqkoCucyNMhtQ4fjyXkmAd7GZ4DluQpbK46EbC
X-Gm-Gg: ASbGncumCLc2fzkWsiHRTi/bPde1Z5j6vGcFfMJEXtblJLEap7MEh1y8O2gLJ9QlfQU
	ycP6C7UXkV2K6qnjNOFMjfAgUvbhM/njzqecvgX3DsJXr9nwHtN07CoPU2h75161de8eaczqif1
	Ed1aSgktCmmcEegqqBEf1iCdbamyqV8oju/dOXQ2h7D+OG6kHF9tJQHCdDRLFfrjh87DXF23bot
	heRgPQ+B+oItkhik4v4NIxlQH27qwuwYVs+R+oZn8XRGhE+YfXIxX2VpeE/W5Zr2DXNiyesZuOO
	5y1K2IfFvzCZ3EY2Vv3HoB7KV1ptt/c10NDPzj3kBT5ZAdeywDA69uuHUMdpk8GwTCiy49LhSk9
	nwpF+IZa7id2XXG41OODk9ggW
X-Google-Smtp-Source: AGHT+IFjPcmaG75UjWdWsZvDbLhl3UcK9XXTRLW8Fl8wf2CyQSnJCCTdS1notr4bnsELUVoeaKGUxg==
X-Received: by 2002:a17:906:3492:b0:ab2:e262:686f with SMTP id a640c23a62f3a-ab2e26269e6mr295678866b.56.1736543263214;
        Fri, 10 Jan 2025 13:07:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a97f-2b00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a97f:2b00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm207172966b.10.2025.01.10.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:07:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC v2 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Fri, 10 Jan 2025 22:07:29 +0100
Message-ID: <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
by soc-dapm.c. Use this new function internally in
snd_soc_pcm_dai_prepare() to avoid duplicating code.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- none


 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aab57c19f62b..a11501752637 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -193,6 +193,9 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
+
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 34ba1a93a4c9..ca0308f6d41c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -360,6 +360,22 @@ int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->prepare)
+		ret = dai->driver->ops->prepare(substream, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_prepare);
+
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
@@ -577,14 +593,9 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 	int i, ret;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (!snd_soc_dai_stream_valid(dai, substream->stream))
-			continue;
-		if (dai->driver->ops &&
-		    dai->driver->ops->prepare) {
-			ret = dai->driver->ops->prepare(substream, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+		ret = snd_soc_dai_prepare(dai, substream);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.47.1

