Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ECE46AF08
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487429; cv=none; b=BlYd90JsG2L98MugeIjZQ8DLjkcJoYG/qUuCx6GTlqpYTG1hdEtHZY9EsdZyCv5zmUhX/LE/dfLJZcHby83RjVqJPSeHM8ALytP6PEmu6LKBUJZU32z91dE0L8WklcU7NFnSArXMoNl8pXhCCBAXOjRGN+bHTnC9L3ihCeIDykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487429; c=relaxed/simple;
	bh=he35cP/gvA5xSZMWrFOaF04BmRJcyzkN8tKIS3U8k/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLH62+bxppZMjgY5cJnfiILBegH4Ri/CAU+dOwJkgYXxg1lKYrzqAivgCCiW7uHHc3QKjfxSDVCsAog+/l7rtFmwgmLdiobz1e81OvtR5Sp6YrKH14wy/pk8iHZ6EL6L6Mr06GiqpFYmcK6fAsk6WWQ1TP0/k4vamZiquM5ZKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcui2KWM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcui2KWM"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b8d414666so4022370a91.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487428; x=1781092228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cxTSMgNqZwdOR4PrDlBQXp8DTW1iK+QB/aZTwgHd9A=;
        b=lcui2KWM+W7k3FGtUD2BlL15BckvNeHwmrakJQ9XApwJx+Bew0FSNpyLkU6FArwJlQ
         GQ6E98UyCyzRv9+dDIDY9PKZZewc/yqiFvOHlk3+5Nm5GlxCXzzL7EYU75vsRu1ceTFM
         oceD8kZgutOUncKSzL1BAfVTCFVLfzvjrg4RMitJeC7G+tMefI/MFV4tpLvuZ2iWmAhw
         WxZxz+TG3+50fl7dxdZcXrV+4MWZ2vMU89mat4WKyWphZkKdLRIn9rrlZIsaJadDPsTz
         opnpXh/YMACuSb3610PI9a0ok48wr/RO0K2Vtke0auk2GOLPY7VYFztJex97BH8K6082
         O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487428; x=1781092228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cxTSMgNqZwdOR4PrDlBQXp8DTW1iK+QB/aZTwgHd9A=;
        b=f8ruIyPhT+4+FCi8oYkNyMsbJngXVtAY8e+4STjYiDtMlbrMHzL8wH2xicuj/7xOJ3
         4+VkE1ZKqffeeGrOVkdMVWtr/xt2mT9D8u8te8D9nMOz1q+wuEyArec+4Hr8mQPyBlBJ
         rgPF0sTUyvJdnHLyEDl0o5tHWzygLdsr1PdkcZbk4w9vOuFE2VcpT0JLQ9/AMKoX9+91
         N4N2k7p43u0YIeZegID7VU85FKSkRq1oWt1hNYb5UToNYMPjSCTyZv4qFoGrh71Mpg9l
         t3Wcys2xkt0c3LGitofAGjoQ3/paPvAQjOUiOIO7B9VJ2R6r3cItDrTnC2MmD3wPuxer
         xBow==
X-Forwarded-Encrypted: i=1; AFNElJ/K4cvQpHU2cJwDIx/J9OYhpg66uJXz0Z3ejaV1260fcFaNIP81SvBVc8T9G7PWgc+unRVuSvrhh3CkxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZqzvYKY8zNJnv32oJSOt74YZAm9ouhzXUWHCdlD37unjSYY4
	8E+hu4SW2cJNYsX7TV70l7MGK7bjTKtsaG2Lr+B992UIItNKs4bhyPgs
X-Gm-Gg: Acq92OE0ByBKXIpeJ3jw48/IIbATPyOMVuU64TW5o/DPgzRUofFh307CWr+SBNpiYQK
	alrJi1ZCIatCkEnARovo+4rDqLP3H5vWzcsPfKRWOuniITgkeKOTqhg5Bkdz6uzjUGFOhNXeXcI
	mh6XTZr/UTQ8Oi8viIPdc6cnTDk5uvCY2w1sdPV2COH8lTzyqhdh8TcyBGPqbQZMoVT729J2TyR
	TDnbeAP3M9aChew/hYt+cdWJDaU8H4xfNYq6e08TQNYeqBK4SiBQgb1iS5Fsg3ivpnZORGn7Mfa
	GmvtWH8FzrH8Qsi10gx9AfBeMS/aoFkZMqO62K5+cNJCQ9HwAYF8xBLR/E2MAT17BKIhuPE9EK4
	GYt7HY5jiKjHT5RpFyJHAa0ZxbxArj+GggHcaJnCiNC0HjbrzeyQ7GUb+ndl612DcrMn0A9bf+2
	0nMDrlBZjlXvCgVESox1kR2XTYpQXs8FrlPqUq3x8rDYv2F0yix+Sc1CxSORdf+g5/zr3B
X-Received: by 2002:a17:902:e14c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2c1644dbfd2mr18979195ad.38.1780487427507;
        Wed, 03 Jun 2026 04:50:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/9] ASoC: qcom: q6apm: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:44 +0700
Message-ID: <20260603114949.149595-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6apm.c | 107 ++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 59 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2ab378fb5032..17c44587b084 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -44,9 +44,8 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	struct audioreach_graph *graph;
 	int id;
 
-	mutex_lock(&apm->lock);
-	graph = idr_find(&apm->graph_idr, graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		graph = idr_find(&apm->graph_idr, graph_id);
 
 	if (graph) {
 		kref_get(&graph->refcount);
@@ -74,16 +73,15 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 		return ERR_CAST(err);
 	}
 
-	mutex_lock(&apm->lock);
-	id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
-	if (id < 0) {
-		dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
-		kfree(graph->graph);
-		kfree(graph);
-		mutex_unlock(&apm->lock);
-		return ERR_PTR(id);
+	scoped_guard(mutex, &apm->lock) {
+		id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
+		if (id < 0) {
+			dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
+			kfree(graph->graph);
+			kfree(graph);
+			return ERR_PTR(id);
+		}
 	}
-	mutex_unlock(&apm->lock);
 
 	kref_init(&graph->refcount);
 
@@ -131,9 +129,8 @@ static void q6apm_put_audioreach_graph(struct kref *ref)
 
 	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
 
-	mutex_lock(&apm->lock);
-	graph = idr_remove(&apm->graph_idr, graph->id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		graph = idr_remove(&apm->graph_idr, graph->id);
 
 	kfree(graph->graph);
 	kfree(graph);
@@ -254,20 +251,16 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 	else
 		data = &graph->tx_data;
 
-	mutex_lock(&graph->lock);
+	guard(mutex)(&graph->lock);
 
 	data->dsp_buf = 0;
 
-	if (data->buf) {
-		mutex_unlock(&graph->lock);
+	if (data->buf)
 		return 0;
-	}
 
 	buf = kzalloc_objs(struct audio_buffer, periods);
-	if (!buf) {
-		mutex_unlock(&graph->lock);
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -287,8 +280,6 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 	}
 	data->num_periods = periods;
 
-	mutex_unlock(&graph->lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
@@ -457,23 +448,22 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	write_buffer = (void *)pkt + GPR_HDR_SIZE;
 
-	mutex_lock(&graph->lock);
-	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
-
-	write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
-	write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	write_buffer->buf_size = len;
-	write_buffer->timestamp_lsw = lsw_ts;
-	write_buffer->timestamp_msw = msw_ts;
-	write_buffer->mem_map_handle = graph->info->mem_map_handle;
-	write_buffer->flags = wflags;
+	scoped_guard(mutex, &graph->lock) {
+		ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
 
-	graph->rx_data.dsp_buf++;
+		write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+		write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+		write_buffer->buf_size = len;
+		write_buffer->timestamp_lsw = lsw_ts;
+		write_buffer->timestamp_msw = msw_ts;
+		write_buffer->mem_map_handle = graph->info->mem_map_handle;
+		write_buffer->flags = wflags;
 
-	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
-		graph->rx_data.dsp_buf = 0;
+		graph->rx_data.dsp_buf++;
 
-	mutex_unlock(&graph->lock);
+		if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
+			graph->rx_data.dsp_buf = 0;
+	}
 
 	return gpr_send_port_pkt(graph->port, pkt);
 }
@@ -493,21 +483,20 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	read_buffer = (void *)pkt + GPR_HDR_SIZE;
 
-	mutex_lock(&graph->lock);
-	port = &graph->tx_data;
-	ab = &port->buf[port->dsp_buf];
-
-	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
-	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	read_buffer->mem_map_handle = graph->info->mem_map_handle;
-	read_buffer->buf_size = ab->size;
+	scoped_guard(mutex, &graph->lock) {
+		port = &graph->tx_data;
+		ab = &port->buf[port->dsp_buf];
 
-	port->dsp_buf++;
+		read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+		read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+		read_buffer->mem_map_handle = graph->info->mem_map_handle;
+		read_buffer->buf_size = ab->size;
 
-	if (port->dsp_buf >= port->num_periods)
-		port->dsp_buf = 0;
+		port->dsp_buf++;
 
-	mutex_unlock(&graph->lock);
+		if (port->dsp_buf >= port->num_periods)
+			port->dsp_buf = 0;
+	}
 
 	return gpr_send_port_pkt(graph->port, pkt);
 }
@@ -545,12 +534,12 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		if (!graph->ar_graph)
 			break;
 		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
-		mutex_lock(&graph->lock);
-		token = hdr->token & APM_WRITE_TOKEN_MASK;
+		scoped_guard(mutex, &graph->lock) {
+			token = hdr->token & APM_WRITE_TOKEN_MASK;
 
-		done = data->payload;
-		phys = graph->rx_data.buf[token].phys;
-		mutex_unlock(&graph->lock);
+			done = data->payload;
+			phys = graph->rx_data.buf[token].phys;
+		}
 		/* token numbering starts at 0 */
 		atomic_set(&graph->rx_data.hw_ptr, token + 1);
 		if (lower_32_bits(phys) == done->buf_addr_lsw &&
@@ -569,10 +558,10 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		if (!graph->ar_graph)
 			break;
 		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
-		mutex_lock(&graph->lock);
-		rd_done = data->payload;
-		phys = graph->tx_data.buf[hdr->token].phys;
-		mutex_unlock(&graph->lock);
+		scoped_guard(mutex, &graph->lock) {
+			rd_done = data->payload;
+			phys = graph->tx_data.buf[hdr->token].phys;
+		}
 		/* token numbering starts at 0 */
 		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
 
-- 
2.43.0

