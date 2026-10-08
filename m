Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100735DA61
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486079; cv=none; b=GmmjJ7aAnxUOBrYHoiOzyDkuKpri5lgorqhjImF82DAmTyp63hFMjqguZnD8vIC77OF08WL++HAs16vHavCTI0tMcFiSurlCClbsLD9nCM5eBAoEkjvcP0apI+KMOLOqZ31LaZ+kh0Kkh7fHtIZYjeXPoiRDOks9X0Ze12IPjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486079; c=relaxed/simple;
	bh=NV297hPhL0HERbs2IyoZwWWLUO44XQvPJKokBPrQwBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Az3jErfmVqYIexTtwCw0W85vDZ2nhvHjamngNVc8S1I/pJehm1CN2BDaY9gBLVAw0UUEFC56e9xQMoWupCMbK3kUXjOLXNLf7jcLR5QJLipnfvVMm3nuvlrG1YKnsNFr72LV2sBQlEmcW/PivtNe5UER01og76rwleaZlI2A8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=coIvsxtw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="coIvsxtw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3516c82e96cso3588404eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486078; x=1792090878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZaD67jW1zaHMwLOSmvc/1aeKMLwK1RpzPD9+yhLQ1do=;
        b=coIvsxtwe3OV7tt8S6kRysvfsC6BEQ5PNXTuAfGjE10y3+yzM9qrK6TfsNRJPlFUuv
         kzXxy5bAk0dr3SGYjVqYYNjKutuHvkNM2sUPCwzNlMzbIWYZ5e8llppSiCArViX4plSH
         4hhwChUs/5C2iQrbdIt5cMkxSz+5ecD5EopWGVEvgFkNkgkRCFZ0xweOu+109/5ueu+I
         52OXT1LQEEhTkyoceFCJfvE6dV1dVy0UhnA/TQvttVUlcb35t3G2shtx8RVyBgPsv4Ho
         CZeDQbiiPCp1f/K18KsLQiQ6aAMWtlZEHYrGBEqmCkMBZ+xgdmJDAkqtFUfIrsoXYb72
         e3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486078; x=1792090878;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZaD67jW1zaHMwLOSmvc/1aeKMLwK1RpzPD9+yhLQ1do=;
        b=yUaXsj3vtqEtSe6PiIs5oyO6esa2z17Umz1WMLulPzqYN9lDFEZwEIW8Tge2BE9ZMz
         uE48zkrmaJUqTEosCrzOkCwtdAxiCZ2QFuQtpnwF/GC/GRyclHzeS6bmx838P4PnsXUm
         uspZOzT7h/DooAFdA6ABf1AwRLnkrGLuS2d/zcDC73WwNaPoLB8ZznOq0+2u1QZcIXrf
         42ryT2FmAGCqult66ZkDeAc7jeESakh8kD6Udd5vX0zzKDQUAfJBLoTg7tSL9Dts2y99
         wJ14jPF3sMYxrC95tTIR/MxB/DfnPe0AfQioGO0sEbYQjL7ew6gMEgPurxcqQi7zT0ee
         4AeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiA0G5Bht9zlJQ10iOez9yaQDD0BH4Ltcct0KxLcc1IX6WNOU0EUXg4UQCgqicoZ33PdMPOHigwP9iOw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYKBdC9JIwXxjAySnckqsZ0NXtc3KJ+ZJyEaD85C3absI5Fz/2
	3AcxMOtMN8gHJrAGPQQw0t3fpFwSuWbdJDx+8bBi/Jvp47rbcWCeMPTttSEWcGzN5ip1l4uRtix
	vz/hiA2VMwA==
X-Gm-Gg: AYBFou0XcChzOYzjYUOik2iGq30wp4bwwie9U4NghXMw19E2lc4i96N+TOkJWQMss2B
	ge5L4P0BV7H+kXZ4GrlZWSnGYSox9vRAXEpPMBwkA5mveC7bq6GBVk66J+PHdfPFP4wzKveK7Xg
	ndwvn7oIY2Wl+v9uYllPLr2M09ba6+jbcjbHpvdySIbNKIvtBE4l9D3W2pca7J3nE+aUptY8mS/
	PPlJUc0HNkEb7m3qrxWYAercNIU2RkU5mmkZXbKYemEtDy3h0yZxs+3B0CvCySJomKBTfKcNIo3
	KhNpMMzd6iUSvuTJyska89J6nmNQ8AzyqJlNpxEtTXnKKVxtbSvk8ULSIQDs1roimMfJj/sHB/L
	O6bNSwoMnbHSduayv0ZPt04mMiew4C16v4JVzB6P1O00iCekXr+H4I8obBz4gGQpXV3Elkn2A/c
	fUSpVaUPPYDe6aDXkD1D/OP0Q/W33D/t7WleIcN0qudCIePlE5RP1x9nBEdbBfb+/0Tzo2AGM0m
	U/RPgbrZ/NDUb88NTWdvN1mfuXmgXh4vfgekdxRlXMVEpHv8T9kHxOhYOJh/mNxwGJC3Dw=
X-Received: by 2002:a05:7301:7305:b0:351:31c7:ab1d with SMTP id 5a478bee46e88-3515dda8789mr6908917eec.16.1791486076904;
        Thu, 08 Oct 2026 12:01:16 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b3eccebsm405691eec.12.2026.10.08.12.01.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:01:15 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 6.6.y 1/2] ASoC: SOF: topology: Parse DAI type token for dspless mode
Date: Thu,  8 Oct 2026 15:01:03 -0400
Message-ID: <20261008190108.96660-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008190108.96660-1-artem@trailofbits.com>
References: <20261008190108.96660-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

[ Upstream commit f9618ff105a0f6f5a6beed3edc557ea6a7d26df6 ]

Starting with LunarLake, the dspless mode can handle SoundWire/ALH,
DMIC and SSPs, so we need to identify the dai type from topology.

[ Backport to 6.6.y: 6.6.y still uses a stack-allocated snd_sof_dai in
  the dspless topology path; parse the DAI type into that existing object
  before connecting it. ]

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://msgid.link/r/20240213101247.28887-12-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This is the prerequisite needed for the CVE-2025-21870 backport. Stores and
populates each SOF DAI type so the following ALH hardening can distinguish
ALH DAI widgets from same-name non-DAI or non-ALH widgets.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 sound/soc/sof/ipc4-topology.c |  1 +
 sound/soc/sof/sof-audio.h     |  1 +
 sound/soc/sof/topology.c      | 11 +++++++++++
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 39e4f0fdd5e4..18096aefce13 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -534,6 +534,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	dev_dbg(scomp->dev, "dai %s node_type %u dai_type %u dai_index %d\n", swidget->widget->name,
 		node_type, ipc4_copier->dai_type, ipc4_copier->dai_index);
 
+	dai->type = ipc4_copier->dai_type;
 	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
 
 	pipe_widget = swidget->spipe->pipe_widget;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7620596ead07..13b9026ffd4d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -514,6 +514,7 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
+	u32 type;
 
 	int number_configs;
 	int current_config;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 7eb8eb35b137..011095722a80 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2364,7 +2364,10 @@ static int sof_dspless_widget_ready(struct snd_soc_component *scomp, int index,
 				    struct snd_soc_tplg_dapm_widget *tw)
 {
 	if (WIDGET_IS_DAI(w->id)) {
+		static const struct sof_topology_token dai_tokens[] = {
+			{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type, 0}};
 		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+		struct snd_soc_tplg_private *priv = &tw->priv;
 		struct snd_sof_widget *swidget;
 		struct snd_sof_dai dai;
 		int ret;
@@ -2375,6 +2378,14 @@ static int sof_dspless_widget_ready(struct snd_soc_component *scomp, int index,
 
 		memset(&dai, 0, sizeof(dai));
 
+		ret = sof_parse_tokens(scomp, &dai.type, dai_tokens, ARRAY_SIZE(dai_tokens),
+				       priv->array, le32_to_cpu(priv->size));
+		if (ret < 0) {
+			dev_err(scomp->dev, "Failed to parse DAI tokens for %s\n", tw->name);
+			kfree(swidget);
+			return ret;
+		}
+
 		ret = sof_connect_dai_widget(scomp, w, tw, &dai);
 		if (ret) {
 			kfree(swidget);
-- 
2.39.5

