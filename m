Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191C1DF993
	for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737753280; cv=none; b=Uh0Yl4KgFVQifPXa09Oc1exGG3yZwDjPyRRhISeyoRqB7yXF3yEY6TovZVzSoz64qNs0V6qoxEEQhhrGgdOrugBnnK7s4Ffi5xz4fzm53mIVAt0gXTU9VT40jQqW9Mv9URdNps5lkokjGn0dwS9vuOszXkugfFj74L5k6/nkTZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737753280; c=relaxed/simple;
	bh=WWfUL+X+xDfUC8VWydMOuw0T0mQ+werg97Fu44Wi1t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr7LTovw0M7dVPbNR/ci3LYEdVKQ67LMm272WIfP13Blz2v+W+oTzS4BbijbQvL3HMFwucej47FTEET/jzTeCB9NucrbibAQvpA5VTZVCeZkPcKsdmrHm7sC2NuTUHk/L68cxdDsPJ+zB/W9HFQZovdgsLjddmt6ps2j+8BllHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zv5fnCji; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zv5fnCji"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3002c324e7eso22909871fa.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Jan 2025 13:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737753277; x=1738358077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0RmiIQFEJXnF1Y7dvklKFbRCLAmWc8zUUNBT3khPKw=;
        b=Zv5fnCjiuU4ubnspFZihGwIRmmUrcyGipVo2NTnE0D4K28jn4xgQhTDzrIvx8KXBx1
         idjjihXY4PDkgH8tPXhhIvKlFRONwv51xCtvsWMJRBH80YB7rSkuOTPsDVg9cLQiE6J7
         bfWgkzoms97vV9Z0ohlvUPFb5H5Z4eTjlff5+Quv4MwmSDg//S0Q0mKO6DviXI1t1/5h
         wPl+/c+4x1nlynZ+Qeb6LCCeZbawze97AT6c0NroXTl3dLyAzp3lWpT0DkEJHoLlVc8c
         95gaTMrS6c3SDqQNvmtNH20mzXewDOeq9kRisjbKdXQJaC/QB8Nms3xUsD1B4+pCzaWg
         nV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737753277; x=1738358077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0RmiIQFEJXnF1Y7dvklKFbRCLAmWc8zUUNBT3khPKw=;
        b=h2Z30yMBq4B1QTHr2HzuoR91mf2Is+McBjhGiVxyvZX5D0GHMC1+0qVC7bSl1/KjZL
         VLwo5HfxckeSmE+sKgyTsrnxMoFWRdXE9NssSnbXskhoGibHymEAT3MrRwgSFFaHrn03
         wEPpmax2MHtudTDw6VBl4jUa7qqsqjhamoFBPlVDX4FaQeuvOevfYhgCl+l6oJwt8Ju3
         whZP2eB5BMN1IHS/8SE8cl3bP3AMxadRE6bs70NCJYmaTjrR9iLoZ6gt7UDnZk9LO4VE
         12gsUNZ9p5k8bqb733MQbJ9AAcqIRArJI69b2kqs5wTHogUu+OaYzA/hWWWKp9gueG58
         qBmA==
X-Gm-Message-State: AOJu0YxaBun+SXeOgsrLcGpNQ1czQ/6acdBD6wfGKT2PFVGm1GCm++CF
	3GYpSoTeV6vn8LaCO14fHrFZFE3uz2PcYK7N2mq9nOvxjCIgg9bBtXEDAIAyU1E=
X-Gm-Gg: ASbGncscEkwauIeGXybI9go7JQa42Zj0scraIj+jr7aPDREJ93CFgODZA+5ohXKk4DO
	uVgoaV+9dRiJ4n2+TJvdaNFe5jfDF7OS2a0Fgi19odz6gSe4b0gpbb4VJgieMKMYldhGfkWzVUn
	eHW9a4vk3bOl70ESiEfqnebUtWi9Lrd3qA86UZL7p2cO5bNyTHnJSgZ8bHjlZBtzF6y9Ptv0ujV
	GCq68h1PbtqMMosCdt9tVssKdsEiNzkEGJih8mRWTeGuue9ur6VdDk3RIrUTkoLBdN6AuzqlJWz
	1e+Fi4n8rOcX
X-Google-Smtp-Source: AGHT+IEj5yikUKXzOTcVAN4AjvHFx+5KwYX//nKHPfR/cgSFVQPBjPgwEc3aVzyTwh+j/zd4xjJO9w==
X-Received: by 2002:a2e:a44c:0:b0:300:1f2d:97a with SMTP id 38308e7fff4ca-3072ca6a39dmr90861691fa.16.1737753277039;
        Fri, 24 Jan 2025 13:14:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba6b020sm4780781fa.19.2025.01.24.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:14:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:14:31 +0200
Subject: [PATCH 2/2] ASoC: hdmi-codec: dump ELD through procfs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
In-Reply-To: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WWfUL+X+xDfUC8VWydMOuw0T0mQ+werg97Fu44Wi1t0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAK2CB4ZpXnLF+8IHLUIACwsLvYkHMODHm47G
 +BRffCFL3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QCtgAKCRCLPIo+Aiko
 1QNQB/93y80hemb7yaqQO8aazYhMXpIDh/NoExgcm6xJ8vNQhnlzL9XuIYSkIIBtuvNv59LDLSP
 J89bT22WWiz33txAaGcXmWmfXUGLkonTjjuK04YkN8TzHuJyl82RYLIpMS6TlDsAqhHGRE0BzWL
 s3PLqY7IqpgMvu9K6RJ815ltVDUWU79aWYEEKXEUrygNToVSnimekMJBpvMPlvuIuOd64JLYkak
 XbleEN85fYGjSBLKs3G0/HUV+N0zpcrPLhsHRimauMaNexupyrIcjpf4jTWSzG6QCNGAbwCamB8
 SNCufcbaoSEZvyU8SqdGOedHoomsXLOKT7b+CWUKxx/VOMlw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use freshly added API and add eld#n files to procfs for the ASoC cards
utilizing HDMI codec. This simplifies debugging of the possible ASoC /
HDMI / DisplayPort audio issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/codecs/hdmi-codec.c | 68 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 69f98975e14ae367f482862724a358eb138ebf6a..497376bcd3ffc60335ec6a30f7f2e609ce766852 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -281,6 +281,7 @@ static const struct hdmi_codec_cea_spk_alloc hdmi_codec_channel_alloc[] = {
 struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
 	uint8_t eld[MAX_ELD_BYTES];
+	struct snd_parsed_hdmi_eld eld_parsed;
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
 	struct mutex lock;
@@ -288,6 +289,7 @@ struct hdmi_codec_priv {
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
 	u8 iec_status[AES_IEC958_STATUS_SIZE];
+	struct snd_info_entry *proc_entry;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -469,6 +471,9 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (ret)
 			goto err;
 
+		snd_parse_eld(dai->dev, &hcp->eld_parsed,
+			      hcp->eld, sizeof(hcp->eld));
+
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
 			goto err;
@@ -825,8 +830,54 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+#ifdef CONFIG_SND_PROC_FS
+static void print_eld_info(struct snd_info_entry *entry,
+			   struct snd_info_buffer *buffer)
+{
+	struct hdmi_codec_priv *hcp = entry->private_data;
+
+	snd_print_eld_info(&hcp->eld_parsed, buffer);
+}
+
+static int hdmi_dai_proc_new(struct hdmi_codec_priv *hcp,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_info_entry *entry;
+	char name[32];
+	int err;
+
+	snprintf(name, sizeof(name), "eld#%d", dai->id);
+	err = snd_card_proc_new(dai->component->card->snd_card, name, &entry);
+	if (err < 0)
+		return err;
+
+	snd_info_set_text_ops(entry, hcp, print_eld_info);
+	hcp->proc_entry = entry;
+
+	return 0;
+}
+
+static void hdmi_dai_proc_free(struct hdmi_codec_priv *hcp)
+{
+	snd_info_free_entry(hcp->proc_entry);
+	hcp->proc_entry = NULL;
+}
+#else
+static int hdmi_dai_proc_new(struct hdmi_codec_priv *hcp,
+			     struct snd_soc_dai *dai)
+{
+	return 0;
+}
+
+static void hdmi_dai_proc_free(struct hdmi_codec_priv *hcp)
+{
+}
+#endif
+
 static int hdmi_dai_probe(struct snd_soc_dai *dai)
 {
+	struct hdmi_codec_priv *hcp =
+		snd_soc_component_get_drvdata(dai->component);
 	struct snd_soc_dapm_context *dapm;
 	struct hdmi_codec_daifmt *daifmt;
 	struct snd_soc_dapm_route route[] = {
@@ -859,6 +910,15 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 
 	snd_soc_dai_dma_data_set_playback(dai, daifmt);
 
+	return hdmi_dai_proc_new(hcp, dai);
+}
+
+static int hdmi_dai_remove(struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_priv *hcp =
+		snd_soc_component_get_drvdata(dai->component);
+
+	hdmi_dai_proc_free(hcp);
 	return 0;
 }
 
@@ -875,11 +935,18 @@ static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
 static void plugged_cb(struct device *dev, bool plugged)
 {
 	struct hdmi_codec_priv *hcp = dev_get_drvdata(dev);
+	int ret;
 
 	if (plugged) {
 		if (hcp->hcd.ops->get_eld) {
 			hcp->hcd.ops->get_eld(dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
+			ret = snd_parse_eld(dev, &hcp->eld_parsed,
+					    hcp->eld, sizeof(hcp->eld));
+			if (ret < 0)
+				dev_dbg(dev, "Failed to parse ELD: %d\n", ret);
+			else
+				snd_show_eld(dev, &hcp->eld_parsed);
 		}
 		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
 	} else {
@@ -926,6 +993,7 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 
 static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.probe				= hdmi_dai_probe,
+	.remove				= hdmi_dai_remove,
 	.startup			= hdmi_codec_startup,
 	.shutdown			= hdmi_codec_shutdown,
 	.hw_params			= hdmi_codec_hw_params,

-- 
2.39.5

