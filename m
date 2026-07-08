Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49A44CF29
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520402; cv=none; b=b39rR+Ht7BGfiyWwLxot4vx091bUHHn/ReArCcOGxakxDMwNBSkolNJdrwiUXiVBWWpPI9EDY6UZ2skyh8hispZ5oTfqUVJdjttmK0UGUaCcnlpHOGH0ibsOX+QW/W6bji5/OmGY6Rj6RnNQY4XYOANK34S48cUz23/ynYMk5Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520402; c=relaxed/simple;
	bh=2fsOJty5OOOm/76wyCtsSzJ05LY+lSj4/MmAoJithiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQbP9yHXYrE5IRqpr30T/p82DNpoLCNWBDcIhpUShtfPB6oL3qYcaLbEzVwfpK3H/KdKtjm44BqWWXIGrHk9DeehqgIhU7VTYID6Nta/dkDd+7RwPOVdjNf89Z7+N2Obailfn+dVtHMrcDlRsqHKqQu01zSGryuvEu3BYT+EyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZR/x00M; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZR/x00M"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so8609475ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520400; x=1784125200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nOU0FRM/CVb4ITNAIwXG/xESH05yUYICHxJJfHCnxk=;
        b=TZR/x00MF6s+/HlM0Y3cH/VNstdn80xpTnq7SWnJPfU7yarnXFK050R6utshijXVZf
         zYGZ4aBekUVz3b1Voqwbmz1PbzTmwAuTPGasEaigQfYoHRt+fyLwpLTbH3Q11NJS1Y/9
         GnHkbjv3ljDxLxCY2t936h2u+EmNdxlR56UG/tR6F0B+hncuz3Z9gAT0i1l0cUrE62Iu
         cOIE3KvUKOL64lLJXSVXpU2/kaa7RfuvlDhHY93OhZFVnxwuX8d0dV/1s3/4OEcfIgkr
         KzPhn0gBb74clO1yiTVP37jq+njZMMUZG+509FZ4Y6vrYhYl+5Tw0q067gIprNjB1469
         XV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520400; x=1784125200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nOU0FRM/CVb4ITNAIwXG/xESH05yUYICHxJJfHCnxk=;
        b=jLMcqmTFz/HNtzPtKkxazOHQBLnAgpVe2q9QjTJhNiiJk5ozjz693U2rTt/x5MqjQI
         GEiCJ0W1oFYxPs1eKzSbnmRV2zXd7oVcF7k5iABBPrG9fxsG+UfrA26jACuve0NLpWcK
         niCYOT/PuNZIHW0zQtUkgYvdHWpWoQCVE4dOlL1/7xcPFQbFi9R//LGiY0aJE9PjGzPD
         k2DDsUwfyj9nVzOzf1gcDXYBTBnhC6Yc5pwV2YIGaBnmajOoGMeTWyM5v0kOh04fh+xT
         g14NNyGt8YDVPS35uMRdPFKaQIq6ZAyFmjJqXWyED2airQLhEHgjUn1+1p0tdDmIvILv
         3HYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTqThPeSffHe3ikZcRIqLfKsmPPIqUS7ucvu06aNIQpuwPCmPttmowXuyMnxvH4kfSCmOo0NcY6UNf/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDF+eFtzCJ0Y845J3U3o+AGcyL7TkIrrBLmYw4AwFhrMwFl4oV
	wtRezo/ZqDUOwuboJgB5HAfvSPaNmiDo360RHR4IXszv0Y8nAl/mYhR1
X-Gm-Gg: AfdE7cmWMnBbuvPD8b9Qk/SduUTcxVqM+CzLhsZjYDjCyvDJCcvY7cN7Y1PvY2JV6Pf
	ONJsDKM8QS4Fi9G8d4wpxKw6O/PTXT51mbnTPqJQ12heNIguKVKfg4m3f+t92uvCdR2PX6FhK7Z
	NVRXaymBhzareKta2y0mh1ET7S/O9l/dnANImit8AKtpjysTzxUln9gHII6FOJOTjjtgg4oDzHG
	71+o7EYXbzeIoj2eYiuOXhaWULQyu5bdXaePBzqZMxPR2PnBUwErI/68qwKU9NEV48xxQzDO/Qr
	KLJC5NkR0PyrauSRfAUV5VQ4RB4KEKCdQ7RYqTNC2ZKtQOhRuLDkaNmLuxMoDI4DAjvqNhujP8d
	TePPaato9rrMtCJCJnJVKy8WdeUhJDfdyWG9JpbRtec0FHT98qBa49I8Mi57P/feoSMwL9GR7QX
	cU10UHguD4zXPIMii1v+TebXs9Xz1CI2HEcG7wTmOCE+41kxU=
X-Received: by 2002:a17:902:e751:b0:2cc:eb5d:2b1 with SMTP id d9443c01a7336-2cceb5d02fcmr24409945ad.15.1783520400090;
        Wed, 08 Jul 2026 07:20:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:59 -0700 (PDT)
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
Subject: [PATCH v2 07/27] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:14 +0700
Message-ID: <20260708141734.578926-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
index 3220f9226e0b..387fa22438a0 100644
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

