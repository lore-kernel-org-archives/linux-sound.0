Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC520468B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974518; cv=none; b=FHEBlec+2k1rivAGPyR2GntEjL0u0XxkozI4ilA2zoUUAiYFbNKKYSNXx7+X5iVeTS8BQQOelfQ/UNCDTTiAvwmvL1nejaqdefGo9LiWdjDyrCfC7ayIcynjS5iEH89YtDdtLeAvh44vGqXox1n+6OOC8P69hP3Bizy/daMHk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974518; c=relaxed/simple;
	bh=kR7vQIpKuKVU6uOBjHBa7C2tnbKEH2GpwQgL9Z6Aaqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEew03GSAVB7fyCErr0lhLN5ltgRTEMPjXdC5Ui0h+cOrdnxcMgWUuYiZsQCBpTXM77rIvcimtKKyVprawYSftB/R6t7qPGgS6XHJAt83dJGOVBnGeSl4LNpFULv94BVC++q5+DQrfJ2y6wWry6Tiv/fwcAl88F7cjdOOroNYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJKBzx7e; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJKBzx7e"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39130ee05b0so2342018f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741974515; x=1742579315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekNUjvV0aZinr/Wdt5BX9JoNO1SKBq/J2zFS3VBUJfM=;
        b=qJKBzx7erXlBrDrOHAxlrJqYfMV9V8SU6mm2rQhgVH48uzIePmZkitHrlcravbY+wL
         8bkDKqEKUnRYEDlBcBjAIQ97SQ6Jtcgrb0BKIL3kp5I3DICUqAW5dJatztvqa53FNyuX
         FKq5dNZNBm0CdPXkp0j+IrVYebOlQZ5iqH2CLpSmmnSAmO9CEl0RWlgHOOA+kaUn/0Cn
         oYHeLS7SZVvH5Z8fr0fajwwGlN0SIeKd55tLKA3IY7RqKT5eEQFbv76kthPjp6D2vPst
         IQrbvkKGLmTtnLWrJhNjUL+BZUNbSMwAasIRNX5J74NykSlRe6ycdrMucCwc0acpPeIM
         OT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974515; x=1742579315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekNUjvV0aZinr/Wdt5BX9JoNO1SKBq/J2zFS3VBUJfM=;
        b=B8p/EHwtqS+vAQGuV9rRPpaZb+Op1/NPGAW6XtSolAxaqgqGQFyj9vkk5VCfBu1JR7
         PxkERI/M+jlaIaIya0LPpaYlxqkxCVI2FOW+ybnq1m9VYGRpSJaffbhN+IpHqAEw6BvL
         VZL/UxDbXIch8yLJ+6Pl6NZ58eMFuN51WaVkR55v7oT1v8AcVWZ2986um5OAstmr32uH
         ojmxOSrhBu/xu++6X+KkmrJ7bVNw93JoTW1CDetMES5PeXn3UmvNwkiqxwvMJ9xt7nw6
         eXeTGNaYoMR4ruZ/RB8aPq7+jjmo1YzJMgtQk2mnHayrx7NlBi4TdII0TiYBs+4PrZ7q
         y/vg==
X-Forwarded-Encrypted: i=1; AJvYcCWu5jeRzKfvUVP+kLa87rpSlRD7YmqUsy/ecgjBjU0mqOi8lqet8/cp/VHrYYbskHSSvGCBHB8110Wrhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt52aJhF4FbUUCWCWH7jd/w0zIgA7O3SomfCx1hA2Kn7G5PDra
	y2yjM/SlnRSc/BkxlbEyl2HCzJfpE+4+pvIqxabgn4jNj0yBhBicEeC9Du7Bey0=
X-Gm-Gg: ASbGnctd6D+LjE6sLCk4rEihQ0nRyyxpUkQ6hyhCFwdU0mEkcayWdTvJ8LF3axDCs6B
	ChVHiNAR9vF/Mnao0RZi88hSykT4WU6ga0//6UB1dBttVITJ8EfA5FI8mdDDNmT+hgaI8wopAit
	8XgLW9EdT4XrKT+y88FtvqTROrF3ELqps77YE6+RusgKhK8A/TzUqJDYoJKq7owujM4s8jPCoEa
	rXZBwUAO4Y9ZKDudoKV55hbkS35VDHmNkfe61EBWEVk8KPt67o7DGEcBl2SVcRzwLp3vTHbNZj6
	oj7lyBX3iJ6MxhPZ2UFS+TV9nrK6LPYXXpqIZENbOQ4dPNvDrTmvlt3NvpqbjI499YiNaev4Xf5
	rin1z
X-Google-Smtp-Source: AGHT+IENJZZgGY1aoIK7LKxCJxD7lsJhw1CEecwJGhMThtbgrKvCf51QCn31YGELReUPaDMQwLikmw==
X-Received: by 2002:a05:6000:1f8b:b0:391:1458:2233 with SMTP id ffacd0b85a97d-3971d235022mr5382107f8f.11.1741974514979;
        Fri, 14 Mar 2025 10:48:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975afesm6117243f8f.47.2025.03.14.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:48:33 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Date: Fri, 14 Mar 2025 17:47:57 +0000
Message-Id: <20250314174800.10142-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
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

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
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

