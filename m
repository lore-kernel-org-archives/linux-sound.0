Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E31428462
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692673; cv=none; b=ZOCQFlQGT587zAEOMTaTH8YC3jbEK2m4yTz3YJfG5vtV8iFnETe8meAeqo/pHFg/RpWPdlcTcs/blQv6pfv2Og0LYScZxCAwetNYwNW0Gacc4SraZYi8LmlBjKBQTofoJL40Ygf8Wdy+h+GPIW689JSAfJCKBKd0tY8O5KX0L7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692673; c=relaxed/simple;
	bh=oQeHnMFhh85OozxsBb/3vNeYhtivziKLK3HDPzCNFW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXkU2DqLHw4JTQM49YlENyxSdENuNWoknBjiSHA3Kn6zZPTQtDotnFRcdC+hlEGMWmwPF6xn0aTT6v5Xo/SKfPAS8bNfgy+vSrbBUCc48nxG1ScmQteRJ4l7q4ln2hVKPurUZ+mZE2pjSzZowSEdfdcQw9lHp/dkwdcKPiUb9HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/+iFyKN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/+iFyKN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b9e755555so4897751eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692666; x=1782297466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=H/+iFyKNZ3M4fbf0MbL/0BOOSfH0C1ROMOV0gtqtqv5LJJ2bAAGsy5Mvl7YlekDIES
         9LczlYvVx01dS+HvXalcD4yxmMNZlk/lhMHFCGKZ5sen5TjOaNLngJlTbNbL2tceFamX
         6nFjjnj5gndTwqEpa/2km8L2eC/sKw8ChOoHd7AGcyFc4VuLN97GSVUywYQcriApVBP3
         gxvSNvIjBftSQiYtlokBlEjmwBPJ/5FYRij785Iw8cNC0vsW51QHJfOJ3nzvd0tf9glq
         dzmPBM9Ye2i6qCqrj0cEMklSLxIzRkFfoas19Kw1Gpjp+0LYTjDToLgc7cXlgGLqBkJn
         QAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692666; x=1782297466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=HCRMyTyseErw6mmGymKJTlHHxvVpcN9a2Jbkp4iWOQx3DiR6HhUAO0yWAczviu2W92
         3DjoORgK+Ng6/9MVFcfuWLY75FKpTKbvqPCONQdExhyHMow6FYkcN7wRnFWj3L4tItEb
         aApqmpBCqBNKrKFklHqjUsINwwsfTGQPrPkUpLQnkqVdHJAsgl17Enf5rOq4y05Ydhuk
         HEFKkSE0z9Fq4G/rGb5qpBY0cBOomtE1PsNHKhuf0K66+pm/+03oE4txfOzFxRogNx5k
         EWQvDv9O39gq2/pWEoyZPhWNisokZZWtBjkF4q0s38BCBI4tbhK+hdOkjdodWST5Rsd8
         +IJg==
X-Forwarded-Encrypted: i=1; AFNElJ87rcqweWGHWg8K3nRQBxd6qkkTmxWIHHVizvDY3RPZlyQoicdGTAnY4ueT/JEF0rNeBEZt9iBqvnJreQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKrqLGz6M7hQMvSj88VyLrXj9kGiJohM3szjeExYAiFhVWpW2
	ktThhwGQ2DJbBZqrld1v8xY19uORsH+MhznQyUIt8op4i8miC9+YJOxqRBUCyg==
X-Gm-Gg: AfdE7ckoxbAL+Kic1KQ+Alg9TBFHelZq/3Vq2IpiWrNUdfRoXHXO2+YrnlkYPEvg9ex
	5AIxcZu2qsIxfOxy6EYC62cuA8bvSmvRzY+KOnLJU9nF3nsvNMY+vB7/gbmJJKK0o4bIOx6O6y4
	wXA2xvN9ijxgDsd+1IqnH4dGiiLQqyn2yCF79qQtcgSNqFC3WXQJdqghS9w4vFxkyOM29mBLTnk
	kYZl9bWS9mQ+jNMnKYEaXAVUvuiLzVz+7i/OwGB4eNYOLri88mpQwpYk7Oo5mkSLnIIY9FS8NFr
	xOrNCpwt9LQFE7pS2ef+H5ZeD07igN1fvWpxgp+ORORXZCYDToP+pOGvazHr88iO2JWg3OK8yrz
	lHj42oI4qdQJJjGMG94dm/T4CstaG6YhJR7vJJ0todAUVx3dC8qI/lp6h+pB+FEm4xLmdYjHFJF
	9GjAFut2kJ3lMAHY8kVYQTaH1o15buDWeQVwRvDTsSyl1KGzI=
X-Received: by 2002:a05:7300:a945:b0:307:91f9:c1c1 with SMTP id 5a478bee46e88-30bca08cc96mr1666554eec.25.1781692665702;
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 31/78] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:48 +0700
Message-ID: <20260617103235.449609-32-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdac_hdmi.c | 116 +++++++++++++++++------------------
 1 file changed, 56 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3220f9226e0b..eeca901aea74 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -537,10 +537,10 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+								port->pin, port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +640,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm) {
-		mutex_lock(&pcm->lock);
-		pcm->chmap_set = false;
-		memset(pcm->chmap, 0, sizeof(pcm->chmap));
-		pcm->channels = 0;
-		mutex_unlock(&pcm->lock);
+		scoped_guard(mutex, &pcm->lock) {
+			pcm->chmap_set = false;
+			memset(pcm->chmap, 0, sizeof(pcm->chmap));
+			pcm->channels = 0;
+		}
 	}
 
 	if (dai_map->port)
@@ -922,7 +922,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +945,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
 				hdac_hdmi_jack_report_sync(pcm, port, true);
-				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
 		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	return ret;
 }
@@ -1274,67 +1272,66 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	 * In case of non MST pin, get_eld info API expectes port
 	 * to be -1.
 	 */
-	mutex_lock(&hdmi->pin_mutex);
-	port->eld.monitor_present = false;
+	scoped_guard(mutex, &hdmi->pin_mutex) {
+		port->eld.monitor_present = false;
 
-	if (pin->mst_capable)
-		port_id = port->id;
+		if (pin->mst_capable)
+			port_id = port->id;
 
-	size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
-				&port->eld.monitor_present,
-				port->eld.eld_buffer,
-				ELD_MAX_SIZE);
+		size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
+					&port->eld.monitor_present,
+					port->eld.eld_buffer,
+					ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	eld_valid = port->eld.eld_valid;
+		eld_valid = port->eld.eld_valid;
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
-
-		mutex_unlock(&hdmi->pin_mutex);
-		return;
-	}
+			/*
+			 * PCMs are not registered during device probe, so don't
+			 * report jack here. It will be done in usermode mux
+			 * control select.
+			 */
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, false);
+				schedule_work(&port->dapm_work);
+			}
 
-	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, true);
-			schedule_work(&port->dapm_work);
+			return;
 		}
 
-		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
-			  port->eld.eld_buffer, port->eld.eld_size, false);
+		if (port->eld.monitor_present && port->eld.eld_valid) {
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, true);
+				schedule_work(&port->dapm_work);
+			}
 
+			print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
+				  port->eld.eld_buffer, port->eld.eld_size, false);
+
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1792,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
 	if (list_empty(&pcm->port_list))
 		return;
 
-	mutex_lock(&pcm->lock);
+	guard(mutex)(&pcm->lock);
 	pcm->chmap_set = true;
 	memcpy(pcm->chmap, chmap, ARRAY_SIZE(pcm->chmap));
 	list_for_each_entry(port, &pcm->port_list, head)
 		if (prepared)
 			hdac_hdmi_setup_audio_infoframe(hdev, pcm, port);
-	mutex_unlock(&pcm->lock);
 }
 
 static bool is_hdac_hdmi_pcm_attached(struct hdac_device *hdev, int pcm_idx)
-- 
2.43.0

