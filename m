Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF32556E;
	Tue, 21 Jan 2025 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442146; cv=none; b=mf/0qBX/MlKsY6rbtJg77qEWIDT3/E1eDyjedxmgPHpueuqCFo/NaQdkQBgEm8k+HUeDaNxEiHMEn1WwxvupmX9HssgeaisLdoi4kovjun2Jqf/tBJaIxnmN+ku09u2kFwXfwn3PilDl5z13sFJMTbQeGmNWsMzBiKOWIK8dAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442146; c=relaxed/simple;
	bh=NFbrSiGUKDwjhGxRopH8/yo5yAxUTjnIPxgx9rJhJ7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jZZL5Wh6p/GQutBE8XnsPPHFCSKu40DNhpqHIGBfZ+HaIcw437JuwS9qi3cHKkFb/62sLViiCsD1KvGYEj0oBEkLnJEKrBbDK8C7JVJEC6AE+wEX9tkyC6AWUfQz/uOlY7580i0K9hdP2uzVFanVSrTMar3kY9hPthtUpQ4BwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0jyjdd+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0jyjdd+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436281c8a38so37375435e9.3;
        Mon, 20 Jan 2025 22:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737442142; x=1738046942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N89rIvI591Xen9J9meQJ3ikPdjIXcCT7V1qoHkgc8oI=;
        b=f0jyjdd+F5ljG1kHrDYYDddHhQGdGqlp5wZYpsO9lpbKt2SeauKRiNgj5c1mZdlW6L
         lyzAbgRrXX1FXs5ly6MsZcrolAu65uMIM2FhYnZMv2vSoCRZyQRUMqgAla2BxFZ6sKa2
         hilNzfqff4PF5I1k0cRCFofTB+8dwq8XnSLdJGxq3odRBFJ3TPigyStjlzMaZw+/9mWs
         uoy1x3ug2l9MXo1ncRwZpXVHhUhBNkhSWLbqKgXLrvs7i4l9Ndr41iB+yGCs3LVm1ObD
         ZYCBxEsfYnX1cbZ5815vimhn0VYPRL2ABHA4CLvXHuJqPZOyYpxPcGUrXjjlFUnOVVAI
         DSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737442142; x=1738046942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N89rIvI591Xen9J9meQJ3ikPdjIXcCT7V1qoHkgc8oI=;
        b=dcdcvohZj8ulLu22aaOI9esmqPf0LVtRRN8jbniUFKviVpA6Z1EYv7WlG8h3qd3Gjn
         1Z+3VzrVRspWysG8HPehbPXNXfqWR2fGuxSyh6VdULqKZw4O/NNrVQE9bvdW8dJLUsD6
         2XUbPUlMqaMvmIrYLJ/QFlFltXCGnaypsGGBohNXYZ8NoLxqiOx5ww+nbwqUr1xhrYQD
         Yxces3wglyorunuUboJv6b4RYklGRnUlhZ8o/xWvDrPQ/+hufkNMScb+7BGJTQyvB5zo
         SLt3hLmUnLmgjU2x60izGttSfvjsu9EojDqPOMV1S64hPZyoZfMSIA0NnkV9AtvZXjJb
         73PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSV2bbppJtXjKmqFdnV7okT6fYwCM+hj78G1njMNld89pLvVgcpYEg/cMUrG1KK2F9dqxSG2u1L8szdxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtDxGTV84yAr/fm27/iWYWNI5jiLTEwcRuLhu3hyZ+45T0CHW
	O4n05dg1CHQchYtwcyyK+sGg30e1cGpYs18O79X5bsG5jmspOFnN
X-Gm-Gg: ASbGnctwYceqDv9CwRabDHw0HJBoSv1gNhEPgUFiYwPFurN4/tQ726C46xbMWC/s1i5
	cHYqhPTZG14Kc1da24gtA0v8DpjVs4GPXzXxRZVHhsuVAbUW0K/wwhpJ5AewnTHCASQvXOA4yAa
	9W8qAHNuivZR7cLYwm3cBKUtM8z+5YChsXhKCcKeQADhLb5hTKajldpnKK/YkeE+sC8ajBzjyG7
	oSjvM5owJU7hCvPs/lW9eSLpUHW/lDd4wt2NcmTvRdOU0kCT64+UJD1FkqBusSI/YexXhAyTuJh
	KZ8riAEseX/JDyTU
X-Google-Smtp-Source: AGHT+IFdBYy5pgoOHlM0WgcJ9THITpPy0fS6zHgeAWoKCDSf6/8LeSCRhFsQOT99BBnpIttr7enOOA==
X-Received: by 2002:a05:600c:6a93:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-438a9130aa4mr65441855e9.31.1737442142013;
        Mon, 20 Jan 2025 22:49:02 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753c617sm227777975e9.37.2025.01.20.22.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:49:01 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2] ASoC: audio-graph-card2: use correct endpoint when getting link parameters
Date: Tue, 21 Jan 2025 08:48:15 +0200
Message-Id: <20250121064815.741820-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
References: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
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
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 62 +++++++++++++--------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c36b1a2ac949..ee94b256b770 100644
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
 
@@ -833,7 +832,7 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 {
 	struct device_node *cpu_port = lnk;
 	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
-	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
+	struct device_node *codec_ep	__free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
 	int ret;
 
 	/*
@@ -841,18 +840,18 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
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
@@ -864,15 +863,15 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
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
@@ -901,12 +900,12 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
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
@@ -937,18 +936,15 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
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
@@ -1013,26 +1009,26 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
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
2.25.1

