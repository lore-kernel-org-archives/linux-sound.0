Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA92010EE
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962808; cv=none; b=coXDV4WcDVgSXQsEXoRr5/dy5ROEu38HS+VF7tqE/IhLNmXX9jSbyO6bri5WXGvXiWqGfTwvhs8L3+Zk+5zrYYpUHmvmlFVHrARHhGDuNeuY1u2zrMUz1Vf+rsUZmOpxJ3WxAt41pFqKITdVaVv4l3fZBlaAh+U7ny4HeNGBju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962808; c=relaxed/simple;
	bh=/LrrjZsf1j7u5P5XbpBRADHJ1z3hQDnG5asCYJAEi6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RoBMIc9r4KegrSYA/n/6u+hw4e+OUDwplliETcKt5DbIrfPDvei5QmVwGs8oqG/B+MCtSCC7e/KsgOALS4Fyy6wPGnTaTbbgyE7MrDnodRWe93mxmBVqGvX5TmJYfbJPPcq/8BQdypifGHBXcV7BCrkkBYgy5OGoYTBcxTdPiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtR/nbu4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtR/nbu4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3914a5def6bso1210105f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962805; x=1742567605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFTzpqhJXhYVh1FwE3WUgch0eP/UhlF6Ae6PLQps0b8=;
        b=LtR/nbu4hwNy8hFvF3CRpJFtL+tFExuaBN0e2cQBkgVeAe276ZkhluQIVo8z3kBW2w
         aOr9kpANZa6lgbgMndUqiFRz/cE6Xtn8naP26oJoErxLr4iVvUPwFW3EHjyRqIAriSWg
         xUx6M5YGwoZxbLBNoBsPGqwBTambFdd9Vl9txE3X9WlygRIDpN4eyhRTCOCt1ysU5lgv
         LB/13OsHZP9Mdw4ak9M5aypIEJwbMqd8Fq/IEVPMf/DE+W8F7lcDLUGnC+uViYJK/8Vw
         RbpqJR8C0IM3281Nu7yKUYSDmLuUxhx43RjJCzVQLXq+xSUrzlIq8jDP2lqRdkZniybc
         HD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962805; x=1742567605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFTzpqhJXhYVh1FwE3WUgch0eP/UhlF6Ae6PLQps0b8=;
        b=Q28ieQJIXZKDrSI6Qjh/PSgNmQCY+OGSeqklTnq7BCkMlzLAODs71vq0PWwbjWCYFt
         aqnZy/U4Tv8oKXNl1T4iQA6KGr7rltn/Kek6N9WQ6kcbCT2jIFYEKmXDtaNDSWQHj3cL
         4WyHUR7j21f4kV71OThBsHSgZEnpbFtHKYILjtXROcom9dQNiu1bxFA07qBtglN8jt9T
         8ih2kWCeWK98e1fJb/L12Q2t+uY4968HSGiQE44fZzAd7VPzThFGRdBdDmQskPKuLR6x
         eUTI+oASMhn0rzrtpJa+wYtKFDQ6U9n3UwWQRgtLdBLGe0PyB97OZkJpmq0EUBQQDDJA
         FoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fP6doPa6H6Pf2Sg64sEWdumZtaqjtLZpVKJHvHnq1jYRco810oCEDm2aGKmoECon0wqN3DSNtisWHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUW8YIhPUUC9uSrMUoVRfxfhdnh6mhqBThwOk2Jl33Hd3MaWp
	auBTwoVl1mBNTJhsEH4fQ8DNLaBwqBjouR0TOLJX9MQC/rA8+0T99fp+z65khVsAVNXmuj2N/yY
	h
X-Gm-Gg: ASbGncu+iZ4+nl/bVpf/IdmPix1i30dAt7A7ipZ+ZuhFoTniBOu3Jw5Fup5ys8KYF1i
	Qe9rHdpalwaLlawxLpnbg/hWNmRv35g4MAycCDlJRZmL+XOsPUnC4iXQuwTAVZQkztw+Hm8ubr0
	Y9mfI1bUuJ3a4uQUE1EQryAR7VfapJmP2G1ra8MIosmB5GLq4ZrLNDLt5UWUUufSIlrTaJma0wo
	8EJEpQeUxF6E//GsIrngkKXKfGshNvZIawbC99kBcRz4ia3xw690d2RcTrp0Otnf41Oz8iDMxCn
	q8bWUA7L6ShgQMXMWhpk9CwMoS59fHyUsAjVVlimI8BVadnOi/a8HUib1P5aTg/TgyHhHw==
X-Google-Smtp-Source: AGHT+IHeVYGxOJDDlfj6XFCcAFIk+y7PwJ4y20IgMQAQHLR/ud0eLQcjKFi54dZxDg4z7NiRfEtE2g==
X-Received: by 2002:a05:6000:2ac:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3971ffb22c0mr3946467f8f.48.1741962804718;
        Fri, 14 Mar 2025 07:33:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:23 -0700 (PDT)
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
Subject: [PATCH v4 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Date: Fri, 14 Mar 2025 14:32:17 +0000
Message-Id: <20250314143220.6215-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
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
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.39.2

