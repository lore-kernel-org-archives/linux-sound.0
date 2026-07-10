Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4644377551
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659967; cv=none; b=uxTwbqWbk2xJ9Aiadl2j8QGpyrDP0TjsPWBpnlSwLKgIjX2Kzg5sRZE4mdKZ1gyeU8drurQmHqvPb7DJ477Dm7lzwk8XzxUi5jgyP3JSKuh4DjBCfpfCtWsR1nagHW/5sX3j53+e/9ruaWPNIV96UlrTif7O5BelEbW8i7pOfXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659967; c=relaxed/simple;
	bh=rqOl5FtEn1x/OgjbEoHPTL+PY+QF4fqa/Y6KQB6PCdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZoTK2RPBWki9PaSAo1ikBOkRf/9SKbKg8LOj36q/U/AXAEqleztzWjrNUeWznQkAKc7Eem+iXQf50xQHUGLaMvXwEQPsMaceDEqxWnxlOTBcWWv2ywrSEracxUgCnCvSaZK6SfYm+oUz3IxGk/FJlZ4RSjxPOEh7g0t9evXPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmZ8Fj0P; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmZ8Fj0P"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84867f07d63so538954b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659965; x=1784264765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=HmZ8Fj0PW62DJHmOkIytBxLMhIXpUqdruGFKO+iopj8wXWUKDTB5vRGyofvbaoxYgK
         njIaK/Ejemn2H/u1Z4f/060e/bQYzVMjZny3LB9EnPLee9IssywtnmeU8f932yhvuBoY
         qFlm+qW1bvtnfNL8u8CYJjpwyXlJyGUnvSTSPCT15SQbvZFxQ79EiJ4EXsHenQQTZw0Y
         qIzHC3+e+RCJAaoOPrhfL0HquCeMBKuZOqXEOAQSTNhcqmp68TMDL8fVjD7dweax9jrn
         iHcBD6wbe9q0fDHtbEwair89uooD4ZD8IhuTPWnQQjA0fhTwx8t+wwCtbceuI3+q7TTn
         a8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659965; x=1784264765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=UDNFxZ4aUXEX8hwQiUJ3mmgnZXj16Ne6zy0IsxC8ntejk2VHabzdYovs1JD2JJp5dl
         +huXIP8vT6XqQaWlzUF8HdumSBxPz/VV8qVfTuSCj+MJqLlnS62gjCHr6iuv83hEMv8T
         NBc/p2c9McCLMByj8TRGuzHzqewbrYl8qsqp0ICVqKJ0zyH5jSmqB92AM70VZYxfbiQX
         ZCJbwmT+e9rpA/aQNLQ35tDurAkkrS/s9YCOmFcy/FbihRBHLuItpc88dGBptdaeKxDu
         OGPMRjqQKfsL6w34LU8m//LOJJAFKrG7iz62JZMSaITES+1DYdeY34Tf/goa2tC2f5f+
         n7FA==
X-Forwarded-Encrypted: i=1; AHgh+RpuetFDpMu4fGZtXoJuJeYN+itKClXixzHIxCwI0kerKIJdD3SOvsGvvDKroPxHYiZQsfRqRZYH/H8XeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYfS/HYiix341BrHxyoyqdP4SF9fNt7hkBLISj7O75Ff7MQeHa
	iVNMarWrcu8fL1qNUJujxhXIcWEcWI9op5gPcECgqZchAyRz+T8E6OKA
X-Gm-Gg: AfdE7ckKk9Txg+vRPFnYXNR+UfjOhv+nqHUuEL5XL7yv+4dDbAQ3fQm96cIu+CaL2dx
	p5wJ0bw4KLkE1DJ7G1l0g7AByB97ptTMQQ0b40P+Xljqmw1LSarNYwPsvTOAw6PxIU7EI1KlODf
	uC7ugaFGkRTjQ27wi6sEDeMM3ezNyOe0DD0SFX3yCCqcDJGb8bF7rRczM2lJ19J6HzftvwD+5wC
	7QBKjqnbdQd3mP4hYLz6IRjWDP3Ct8HdoCYUaydJ2tW6M/53SgFMEYt8iN54vZBNgFXpmxgzdKy
	mQQNAEg/Hy5emuhuLpfJYfVyDiILvTkGizIGsf7ApTfJhOfuPTCEpeeeOxTkUtdbe7F1uJiONrZ
	ZK8JYYMpAp/Jo8HP043xjIn/lA6ZO72rLLlIl6HdxHrknEjrOdrBy0IA/RzVOhB2SAgVM4TLDjQ
	ekOXYxYPNLCkFvfz+sFPFc3cjOJoQsFoPplVsanVGsQUgq6Jk=
X-Received: by 2002:a05:6a00:6f02:b0:848:63fb:fd91 with SMTP id d2e1a72fcca58-84863fbfeb0mr3528323b3a.41.1783659965051;
        Thu, 09 Jul 2026 22:06:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/27] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:51 +0700
Message-ID: <20260710050511.14439-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdac_hdmi.c | 117 +++++++++++++++++------------------
 1 file changed, 57 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 38073a70fa61..d9e6fa6d3e99 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -10,6 +10,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -537,10 +538,11 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+									    port->pin,
+									    port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +642,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
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
@@ -922,7 +924,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +947,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
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
@@ -1274,67 +1274,65 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
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
+					      &port->eld.monitor_present,
+					      port->eld.eld_buffer,
+					      ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
-
-	eld_valid = port->eld.eld_valid;
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		eld_valid = port->eld.eld_valid;
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
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
+					     port->eld.eld_buffer, port->eld.eld_size, false);
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1793,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
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

