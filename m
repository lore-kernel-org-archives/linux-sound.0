Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627C19BA6;
	Mon, 20 Jan 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737390479; cv=none; b=FbAoOFYOOTcRUJnr4SEPpmAu3EvM1tA/6dJkEcYdSC1C/NkuO1NJ+TG6U8v0dQdxhSC2eYk/Cucy3yHjXTWJ7EDhMN1BCaoUI9kPePGXzJK6g0KhhAx/61273+dBqYomCoDHq9PDFX6ehOcvrVzJGaIR7joPuJp3hgroBpmFDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737390479; c=relaxed/simple;
	bh=9cmjpeSs0PGSt4YgvRhLTU+rdnxbmD4mhuiLkIktHyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D0bRxCKd38426qs4Gr26zXxRsWP4VPz12htHWN9JDZ3QQ7z+sZf/oWgrYSlnNbUsedq8jwz0EcVo2XBE8y58XB/VPli2pTG/8o3DdGGe5cPILtB5UtPzyCt78oZ6DUNd11Ck+fkfseVfWJ1G5vvwqOjmGrNQ6r0uAd+M5iT1Jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2l99DNc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2l99DNc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso32389405e9.3;
        Mon, 20 Jan 2025 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737390476; x=1737995276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bZfBw8OXzA2CV5e2EseMk3Aai7hDDXPtKaTgXn1VG8=;
        b=J2l99DNcl/d3luAaAF2h2lix2dGrNrbEAjt46ufdXYmng6d/Iwvb0+CqjLbI3eYDSN
         6kkVjNR5A+fvM/nPKsaaHbzHzDI+geGJ0cSO5AygXqS0AyToUQ7rpf+DaJOVYT6Ut0ah
         1KmZGumjywltyXVNqU9DOWj3hbCHNefjiQqItNt7pCLZgW10/l6rJfQr2ZoWryUYAj4o
         zWrwwhYw0jj5PqiIwjGQwN2VdsPfLi6wsGTHgJtRDjY/dg7UCXk/zd+dWRhX8LOHLK5z
         I9YQTE+P/XcRM8cXBVcNzk1m7xq1I0LR5ycfaT/nrqrRAYzAmhegD+O+C53oBfh5F/ZI
         y1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390476; x=1737995276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bZfBw8OXzA2CV5e2EseMk3Aai7hDDXPtKaTgXn1VG8=;
        b=oVw1qe68+Yc0y9UzoyaFH7zwcVPZ1eqpJBDN9CZI2U19Gp0PhzeZu46vyYWGzdI3fB
         Sw/Ew5grsRp7c0TFCMZaovI0P63/tffVcOMgIg2jopEZMmV2HvLMN0BaTvwY5LN+D1ix
         kV7GVE9F5CxvqToth7VG7pdr+aK/3S32uAxw9NrM2mKDY54JRqyq6D/2QIqBpylB2uxv
         2h3YpgQE6+LzDOjZVzUcuoXRQDpaWkzFDSe1hZoVleBTmQlrA+eJl/onKqiz2dx5bt9n
         bo7BIFkQTtlSQaAjTiBG11J5g1OkKLlRn6kVjOGdn0e9Y0nNmx6NdTu1e5+C5OkkdyqO
         d6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPjlZbLDqV2/vVPFy0IWAx43NSRT9GLbG+QxcIZVVYZIrSAcGRjQfDcICNoSD7ZHCZYAITF3QuccFQaaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwznstPuLFc6aZwLt97cwd5RDwYqXRsArwGKE3cRMSZT4e67Knt
	4kXKQoYZngs5ph106NAxPTjqZHXdYA+g2nPtLbrzNrM8PaOvmpNY
X-Gm-Gg: ASbGnctspIjcFD0vrk0jVbiES1L+2/+/4cjKWKGbW3CT8Y4ynN55FpznMru87h0rjDb
	enTL16mABgMyEgW+jJrzXGx4qDLoRk416dOhd9klOzfHWZKLiGMEzFknyNUcKij8RXJ5WxE82TQ
	ygkgbGN6NfQnDEhvJltFFpOzkA3knCcICtacc9aI4p4+tJIZDEr97E7pOx8f2/xxJKEklr52+wy
	obI8gsiQwjlMcP4VUaI7G0AKX3JE+6W6ytj8QRiIADOw8cG3aDLI/ub16uTypLFDBIE/yulQUaZ
	+KXhs30OQd+i0c7A
X-Google-Smtp-Source: AGHT+IHOsJqNumg2Er+4smgtp5cTZ1jMv6Oz+wbnGXEFvhrXQ8vngnDXqprHB+DNR0lP34ctKsNE7w==
X-Received: by 2002:a05:600c:1987:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-438913e2fa9mr135507975e9.17.1737390475367;
        Mon, 20 Jan 2025 08:27:55 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm214599255e9.3.2025.01.20.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:27:55 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] ASoC: audio-graph-card2: use correct endpoint when getting link parameters
Date: Mon, 20 Jan 2025 18:27:23 +0200
Message-Id: <20250120162723.702701-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
References: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When link DT nodes are parsed, most functions get port as a parameter,
which results in port endpoint@0 always being used. However, each endpoint
might have different settings, but those are currently ignored.

Fix that by passing endpoint instead of port when parsing link parameters.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/generic/audio-graph-card2.c | 65 +++++++++++++--------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c36b1a2ac949..ea2da1b78b41 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -648,23 +648,23 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 
 static int graph_parse_node_single(struct simple_util_priv *priv,
 				   enum graph_type gtype,
-				   struct device_node *port,
+				   struct device_node *ep,
 				   struct link_info *li, int is_cpu)
 {
-	struct device_node *ep __free(device_node) = of_graph_get_next_port_endpoint(port, NULL);
-
 	return __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
 }
 
 static int graph_parse_node(struct simple_util_priv *priv,
 			    enum graph_type gtype,
-			    struct device_node *port,
+			    struct device_node *ep,
 			    struct link_info *li, int is_cpu)
 {
+	struct device_node *port __free(device_node) = ep_to_port(ep);
+
 	if (graph_lnk_is_multi(port))
 		return graph_parse_node_multi(priv, gtype, port, li, is_cpu);
 	else
-		return graph_parse_node_single(priv, gtype, port, li, is_cpu);
+		return graph_parse_node_single(priv, gtype, ep, li, is_cpu);
 }
 
 static void graph_parse_daifmt(struct device_node *node, unsigned int *daifmt)
@@ -722,14 +722,15 @@ static unsigned int graph_parse_bitframe(struct device_node *ep)
 
 static void graph_link_init(struct simple_util_priv *priv,
 			    struct device_node *lnk,
-			    struct device_node *port_cpu,
-			    struct device_node *port_codec,
+			    struct device_node *ep_cpu,
+			    struct device_node *ep_codec,
 			    struct link_info *li,
 			    int is_cpu_node)
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct device_node *ep_cpu, *ep_codec;
+	struct device_node *port_cpu = ep_to_port(ep_cpu);
+	struct device_node *port_codec = ep_to_port(ep_codec);
 	struct device_node *multi_cpu_port = NULL, *multi_codec_port = NULL;
 	struct snd_soc_dai_link_component *dlc;
 	unsigned int daifmt = 0;
@@ -739,25 +740,23 @@ static void graph_link_init(struct simple_util_priv *priv,
 	int multi_cpu_port_idx = 1, multi_codec_port_idx = 1;
 	int i;
 
-	of_node_get(port_cpu);
 	if (graph_lnk_is_multi(port_cpu)) {
 		multi_cpu_port = port_cpu;
 		ep_cpu = graph_get_next_multi_ep(&multi_cpu_port, multi_cpu_port_idx++);
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
-		ep_cpu = of_graph_get_next_port_endpoint(port_cpu, NULL);
+		of_node_get(ep_cpu);
 	}
 	struct device_node *ports_cpu __free(device_node) = port_to_ports(port_cpu);
 
-	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
 		multi_codec_port = port_codec;
 		ep_codec = graph_get_next_multi_ep(&multi_codec_port, multi_codec_port_idx++);
 		of_node_put(port_codec);
 		port_codec = ep_to_port(ep_codec);
 	} else {
-		ep_codec = of_graph_get_next_port_endpoint(port_codec, NULL);
+		of_node_get(ep_codec);
 	}
 	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 
@@ -831,9 +830,8 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct device_node *lnk,
 			     struct link_info *li)
 {
-	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
-	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
+	struct device_node *cpu_ep __free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
+	struct device_node *codec_ep __free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
 	int ret;
 
 	/*
@@ -841,18 +839,18 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 	 * see
 	 *	__graph_parse_node() :: DAI Naming
 	 */
-	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_port, li, 0);
+	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_ep, li, 0);
 	if (ret < 0)
 		return ret;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
-	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_port, li, 1);
+	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_ep, li, 1);
 	if (ret < 0)
 		return ret;
 
-	graph_link_init(priv, lnk, cpu_port, codec_port, li, 1);
+	graph_link_init(priv, lnk, cpu_ep, codec_ep, li, 1);
 
 	return ret;
 }
@@ -864,15 +862,15 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 {
 	struct device_node *ep	__free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rep	__free(device_node) = of_graph_get_remote_endpoint(ep);
-	struct device_node *cpu_port = NULL;
-	struct device_node *codec_port = NULL;
+	struct device_node *cpu_ep = NULL;
+	struct device_node *codec_ep = NULL;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	int is_cpu = graph_util_is_ports0(lnk);
 	int ret;
 
 	if (is_cpu) {
-		cpu_port = of_graph_get_remote_port(ep); /* rport */
+		cpu_ep = rep;
 
 		/*
 		 * dpcm {
@@ -901,12 +899,12 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 		dai_link->dynamic		= 1;
 		dai_link->dpcm_merged_format	= 1;
 
-		ret = graph_parse_node(priv, GRAPH_DPCM, cpu_port, li, 1);
+		ret = graph_parse_node(priv, GRAPH_DPCM, cpu_ep, li, 1);
 		if (ret)
-			goto err;
+			return ret;
 
 	} else {
-		codec_port = of_graph_get_remote_port(ep); /* rport */
+		codec_ep = rep;
 
 		/*
 		 * dpcm {
@@ -937,18 +935,15 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 		dai_link->no_pcm		= 1;
 		dai_link->be_hw_params_fixup	= simple_util_be_hw_params_fixup;
 
-		ret = graph_parse_node(priv, GRAPH_DPCM, codec_port, li, 0);
+		ret = graph_parse_node(priv, GRAPH_DPCM, codec_ep, li, 0);
 		if (ret < 0)
-			goto err;
+			return ret;
 	}
 
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
-err:
-	of_node_put(cpu_port);
-	of_node_put(codec_port);
+	graph_link_init(priv, lnk, cpu_ep, codec_ep, li, is_cpu);
 
 	return ret;
 }
@@ -1013,26 +1008,26 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	struct device_node *ep0 __free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
 	struct device_node *ep1 __free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
 
-	struct device_node *codec0_port __free(device_node) = of_graph_get_remote_port(ep0);
-	struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
+	struct device_node *codec0_ep __free(device_node) = of_graph_get_remote_endpoint(ep0);
+	struct device_node *codec1_ep __free(device_node) = of_graph_get_remote_endpoint(ep1);
 
 	/*
 	 * call Codec first.
 	 * see
 	 *	__graph_parse_node() :: DAI Naming
 	 */
-	ret = graph_parse_node(priv, GRAPH_C2C, codec1_port, li, 0);
+	ret = graph_parse_node(priv, GRAPH_C2C, codec1_ep, li, 0);
 	if (ret < 0)
 		return ret;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
-	ret = graph_parse_node(priv, GRAPH_C2C, codec0_port, li, 1);
+	ret = graph_parse_node(priv, GRAPH_C2C, codec0_ep, li, 1);
 	if (ret < 0)
 		return ret;
 
-	graph_link_init(priv, lnk, codec0_port, codec1_port, li, 1);
+	graph_link_init(priv, lnk, codec0_ep, codec1_ep, li, 1);
 
 	return ret;
 }
-- 
2.30.2

