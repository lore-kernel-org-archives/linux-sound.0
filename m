Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E4D1FF5FE
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068967; cv=none; b=qD2Lm04vONwmHmS5RSlMqpdNIrEp5OP6+7n49RjoAL5wIKg5X2p9CkO49UDx+czZEjFnNG1Rje7aivdju3/hu+j1e8+6y/FxNmiMGHLNcubH1AKxd0/H1Ox4wQymH67LSURApUoJonz8Vt6zHxLKGa3TNezgsCKPkUFZvqgLTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068967; c=relaxed/simple;
	bh=jtgmyAUl97OttcegIr//hFBjAziiMMMYiBD7pE3sZEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PMB7a0feiIF5YBgc2RUoisNHxQ0+GnXzfqRUm3nfiYjgaBZ0NQsMQwUyK3UJxc+84Ar1UBKGstcwqcMqwQfbCLOZjtfZgjnSlRFqoveorAY8peAqgkXgkkJV03luAYP6fZuNSK99iwGtxfjEwXArGWRz7PXUEKkTFqNx0N24V1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMVOe6X+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMVOe6X+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f5fc33602so671128f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068963; x=1740673763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMzT+jdHxkf1ujL8A9tZIPDjBjm8GU3C3qT78yn8Ois=;
        b=GMVOe6X+ksfb2KYw3ulfKjCkKKED2gn/IKcnwOz228HCTzUSw0kU9an9K76kl3UD8Q
         pva4IsqFLhIahIgFBi2wvBWy9L38D6CT+jLH+Jfyb3cZ96Wu+H2vgZYn0/hYtkAdzvPy
         zj7vMolV2mYQJdEhremHjCgUgtmBgX7nO7KxAjIldqMDw5vDvdLYB6mbbs192tTQYvQv
         fr6k90811m8dPN21Lzce46Hj5t8T8oWNjotBNHwQrCnceLmqSNLiTEIx+4qfr1NIuONI
         L8amp1/tyfHQSjNMAe+zQU1pcUU4Nd0dJHPKRGwLF/gzJ9vVrLaq87G0pGhFsnkTaHBR
         iM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068963; x=1740673763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMzT+jdHxkf1ujL8A9tZIPDjBjm8GU3C3qT78yn8Ois=;
        b=RxHTRmkeZDbZhLH5ndbVjkiieNW10JrH7BXnkle8f+Th06knBTB7PUDDA11Sa35Efx
         5mNeiGAZM1jmT4Ke7pPX2L/h+4xe5qdeh9fSRiMsOCKYVQ4NZsmCtJ+NSbPFlpLP4fMK
         RyTaFIERBpIAvWqUeC82+fg0qHP+UuUFrnc8g4AbKYpkxUOYGYv1hhKtwoaHuamBmatf
         VrzyLkPkcPkABDJlP995ZSRzwqJn1lE5MzkT1QRVXNf5/4pGqic9O835vj6yRDdFtXf7
         0LhzwDr1b5+HxmqKg4llLr7XJC8TcLw+u6YjkjALg4nnDfNmkOFS9KompXBuBh/73/fr
         r+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUJvq6+I3WcQCM/fSoDr1nJUHbD7we8EKCP1Ey9Di0W4/CI5AVYRbqUPbWHRCZTWudHxFgt1cFBj+/vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7oMWuM7bd880vj1MPJwdVDLf2cIKupgj/OnAtNwZhJ7ykWiR
	fj/lsYlJusIsS599XYiaXp1nIGKAjjxRrJGpvP/u+i1lIcfsRV/CP6oieL6wwOA=
X-Gm-Gg: ASbGncuOYNc6Y5w3JIGaLe46ezcSe7u1UTl8/sPpCiiFp2eRzmP+xeCnklB1IxCfDI6
	IRT3GbVyy4CAbLH1mpdX+wlsF+M9b2feAPvKkEYGLd6paB5whMsgo0RFrkrlcAcXk4XZB1ul2Gm
	Z71dt60jx50DfWUoKABT5LEEifbph8Dx/l1uy86c+hG+pPeT7zEQ/Nq0r92rENSFw8WU9yolOGo
	tEWNngchisxzW74oXrg+LZw2RfKjYr4bMXchVcIw98R6td2E0ZSCaeJN/xB1srG3rrO6wV6FoOC
	PIsBAOJGYCDKDsWroFX6m/nOC0ehl7RADRekwe/3
X-Google-Smtp-Source: AGHT+IFEwnzc4gMpLn2JhX4tSeUOi2UNl4o8mWNSCnBzMlPANfjpmZejT80sXvTiQRWgRNzSUA2rHg==
X-Received: by 2002:a5d:4f0d:0:b0:38d:fede:54f8 with SMTP id ffacd0b85a97d-38f615d2048mr3025832f8f.16.1740068963497;
        Thu, 20 Feb 2025 08:29:23 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:22 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Date: Thu, 20 Feb 2025 16:28:44 +0000
Message-Id: <20250220162847.11994-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Implement an helper function in q6apm to be able to read the current
hardware pointer for both read and write buffers.

This should help q6apm-dai to get the hardware pointer consistently
without it doing manual calculation, which could go wrong in some race
conditions.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm.c | 18 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2a2a5bd98110..ca57413cb784 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -494,6 +494,19 @@ int q6apm_read(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
 
+int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
+{
+	struct audioreach_graph_data *data;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	return (int)atomic_read(&data->hw_ptr);
+}
+EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
+
 static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -520,7 +533,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		done = data->payload;
 		phys = graph->rx_data.buf[token].phys;
 		mutex_unlock(&graph->lock);
-
+		/* token numbering starts at 0 */
+		atomic_set(&graph->rx_data.hw_ptr, token + 1);
 		if (lower_32_bits(phys) == done->buf_addr_lsw &&
 		    upper_32_bits(phys) == done->buf_addr_msw) {
 			graph->result.opcode = hdr->opcode;
@@ -553,6 +567,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 		rd_done = data->payload;
 		phys = graph->tx_data.buf[hdr->token].phys;
 		mutex_unlock(&graph->lock);
+		/* token numbering starts at 0 */
+		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
 
 		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
 		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index c248c8d2b1ab..7ce08b401e31 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -2,6 +2,7 @@
 #ifndef __Q6APM_H__
 #define __Q6APM_H__
 #include <linux/types.h>
+#include <linux/atomic.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 #include <linux/kernel.h>
@@ -77,6 +78,7 @@ struct audioreach_graph_data {
 	uint32_t num_periods;
 	uint32_t dsp_buf;
 	uint32_t mem_map_handle;
+	atomic_t hw_ptr;
 };
 
 struct audioreach_graph {
@@ -150,4 +152,5 @@ int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph,
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph, uint32_t codec_id);
+int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir);
 #endif /* __APM_GRAPH_ */
-- 
2.39.5

