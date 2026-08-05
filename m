Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353447987C
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943295; cv=none; b=Fbw7IQUq/vs0LG0MhR1O37sghUmUmR2zRMKniYkv0NzBc0DBue4VuDw61eAvS/15VoekmhnEPMtkyzmO3GZkab1Z1AzY1z+hTkbfpA4Kjbml08RTOTZfw/DnJN4S2MbIXRRcZdmFdHc5d7VZ39B8ZjxD1BSulAi1s6nuV/QFUQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943295; c=relaxed/simple;
	bh=NfV0SlVaPidlAGxZmEk5LEpzJk2oH6CGZRZrGI95h50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JW8tash32TT4Ffa9oobnqrMypXxUqwU8xZnDL4QctQeOfRMOZg29WSYxMUZkAA8h+40sgAC6ysMPIyXdoKu//+LBchf4KJOV0cJzRYYWOdKuL/SSzHbrauonILlTcj0AaZTAF2GM+cxGSAfCiDo6RANl0TNYm4xrNtJ/lawhuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXCxKl4Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXCxKl4Q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe377a217so775478f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785943292; x=1786548092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tHs/lOwiC51EDTGm3DKHRbCU7WZ3b5D/5yvhxX37k4=;
        b=nXCxKl4Q3QmrY7rfO132VcitvDq8jEbb7+/zfx1/3ZuTtvJeNqIsoxMI6wJLZ+4UD4
         lS7o+LFHfOFrWXAjDe6BSc4nI7CiS+EFMqsYoNHXQb9CA2W3DiD9XZlMW7sbumtwDOIt
         VtTRDE5fl+iJtXwGMGIB+bxy9srDQb/+uS4zpJQIZr6Kv9BmRgT1UxQb0rubpeLvEKEi
         2PKGa8Br9dT+ZrFEdAcIhIpe1S2k5qhZX0dbBU6jl/KDWZLOhb9VKsj3hPwZp3kDGEO6
         RAVuGw7/03cJhrnuVYjBo5FIhHoqEs1qzQmyKIybkgZwDnSCzbsEMnCME2stWdBR2IKM
         /vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943292; x=1786548092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tHs/lOwiC51EDTGm3DKHRbCU7WZ3b5D/5yvhxX37k4=;
        b=KRIE7doppQPVQK/QawcS6Y9cY0dpXHWaNySoJFQUzSUJ8O/0cNXSvTFHOqQ80yqpBD
         FQDzRC3V2aPUi15e2e8ddrdvdUU7dfFsU8cv/euhStRG/TpI6RtC/9J1th4LSZIAxMAX
         sjQ4KvxO79/mUPEXiuummabfBGvaG86yfiWgOeV4JwYeSYMXImIhlm/VwlR5m47jeda1
         /sJAx6wg3Pd0g3DvhtjFmI7NUuq7Q/9xMueDldgiAlF19FpnShjqSGDMdt22knfYu8cj
         Dtn7rM9Vfpcmdw0xEgpkBFaeUR3yClxDbuqiXagqnLmUHsrfdrv809Em9MbaLcapUqZc
         Nh1g==
X-Forwarded-Encrypted: i=1; AHgh+Row3WCxxEblcIktD2987U4EZnjIQMD0liHwQMZQ1AHE3Hyjt9UygVtNKpYcwx3raLrPyXolP0sgqAt37A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XxUY0WgnjRHCBAxpZj6n+F21sCDZ6v4qttj27ykdARRFVU69
	e97oMoWRoBfJSW4G4/GJBEQmrOVnSqtnNdNERRc0Gkl7k0onXmkJASSQTFnOG158
X-Gm-Gg: AR+sD12ukRa5kNj9bNRifx0JJWOm/K3Qtppw5uDqpc5C6vrzaX1cMfn2HB6raCIlh++
	d9V8q6JDZxTWfOMNrDK5698jFhSbMiiN61a299oxqBK+Kc/g8QxuKF/M0LjwiWHwSzIUfgrbZyH
	F3tyexeKJAfAOKPsv/efVcSvzHBrM6fqK1epmAFbfqIEGi04EarJcLarqfGgJaDhB8415X2xNKW
	4+uQRUkPZOaf7VYZ1ReAqKPHPyxyKmOTzCZLdwz+TyVrRVyiSq1VIEfVqbRZHjBstBkk8YZZUTQ
	RIBpiljRzDUlgNHfhz1jG0voPQY30J0dNDNJ73QN7KxmyZDZzsEejQ/Ll8yxIfIv/P2yqPKhS15
	61KBstj2KOAgXB/+w46T1E7epDisEwjqWL+3y/v3ggQoSAr6zpzAOTcmNkAMVtby0dOCAEeW4/k
	uQoPuAMp/zycPX4zBC2R46qHsfEp3qL1Wzs9W00zCF7ALvVpujxmHTBi+1q4iT+ZXssqEg7uJ48
	Z8b+daWBRv915TTEB8B
X-Received: by 2002:a05:6000:4305:b0:47f:93b9:d071 with SMTP id ffacd0b85a97d-47fec62b7b2mr12850186f8f.19.1785943291837;
        Wed, 05 Aug 2026 08:21:31 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec24a23asm9884573f8f.37.2026.08.05.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:21:31 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] drm/omap: Report HDMI hotplug events to the ASoC HDMI codec
Date: Wed,  5 Aug 2026 18:20:57 +0300
Message-Id: <20260805152057.1291659-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OMAP HDMI audio driver currently has no way of reporting HDMI cable
hotplug events to ASoC. As a result, user space cannot detect HDMI audio
availability through the standard jack mechanism and audio policy managers
cannot automatically route audio to or from the HDMI output.

Add an optional HPD callback to `omap_hdmi_audio_pdata` and invoke it from
the DRM HDMI bridge whenever the connector status changes. The HDMI audio
driver registers an ASoC jack and reports `SND_JACK_AVOUT` state changes in
response to these notifications.

Also fix the disconnect path by taking a runtime PM reference before
updating the CEC physical address.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 12 ++++++++++-
 include/sound/omap-hdmi-audio.h     |  1 +
 sound/soc/ti/omap-hdmi.c            | 33 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e306247ed8a0..b466bbdae5cc 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -432,9 +432,19 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+	struct device *dev = &hdmi->audio_pdev->dev;
+	struct omap_hdmi_audio_pdata *ha = dev_get_platdata(dev);
+
+	if (ha->audio_hpd)
+		ha->audio_hpd(dev, status == connector_status_connected);
+
+	if (status == connector_status_disconnected) {
+		if (hdmi_runtime_get(hdmi))
+			return;
 
-	if (status == connector_status_disconnected)
 		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
+		hdmi_runtime_put(hdmi);
+	}
 }
 
 static const struct drm_edid *hdmi4_bridge_edid_read(struct drm_bridge *bridge,
diff --git a/include/sound/omap-hdmi-audio.h b/include/sound/omap-hdmi-audio.h
index e5f82044a404..8dca92360ee0 100644
--- a/include/sound/omap-hdmi-audio.h
+++ b/include/sound/omap-hdmi-audio.h
@@ -34,6 +34,7 @@ struct omap_hdmi_audio_pdata {
 	phys_addr_t audio_dma_addr;
 
 	const struct omap_hdmi_audio_ops *ops;
+	void (*audio_hpd)(struct device *dev, bool connected);
 };
 
 #endif /* __OMAP_HDMI_AUDIO_H__ */
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index e60f5b483fc5..333aa308979e 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -17,6 +17,7 @@
 #include <sound/dmaengine_pcm.h>
 #include <uapi/sound/asound.h>
 #include <sound/asoundef.h>
+#include <sound/jack.h>
 #include <sound/omap-hdmi-audio.h>
 
 #include "sdma-pcm.h"
@@ -35,6 +36,8 @@ struct hdmi_audio_data {
 
 	struct mutex current_stream_lock;
 	struct snd_pcm_substream *current_stream;
+	struct snd_soc_jack jack;
+	atomic_t jack_state;
 };
 
 static
@@ -262,6 +265,18 @@ static void hdmi_dai_shutdown(struct snd_pcm_substream *substream,
 		ad->current_stream = NULL;
 }
 
+static void hdmi_audio_hpd(struct device *dev, bool connected)
+{
+	struct hdmi_audio_data *ad = dev_get_drvdata(dev);
+
+	if (atomic_xchg(&ad->jack_state, connected) == connected)
+		return;
+
+	snd_soc_jack_report(&ad->jack,
+			    connected ? SND_JACK_AVOUT : 0, SND_JACK_AVOUT);
+	dev_dbg(dev, "HDMI %s\n", connected ? "CONNECTED" : "DISCONNECTED");
+}
+
 static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup	= hdmi_dai_startup,
 	.hw_params	= hdmi_dai_hw_params,
@@ -380,19 +395,37 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	atomic_set(&ad->jack_state, -1);
 	ad->card = card;
 	snd_soc_card_set_drvdata(card, ad);
 
 	dev_set_drvdata(dev, ad);
 
+	ret = snd_soc_card_jack_new(
+		      card, "HDMI", SND_JACK_AVOUT, &ad->jack);
+	if (ret < 0) {
+		dev_err(dev, "Cannot create HDMI jack: %i\n", ret);
+		return ret;
+	}
+
+	ha->audio_hpd = hdmi_audio_hpd;
+
 	return 0;
 }
 
+static void omap_hdmi_audio_remove(struct platform_device *pdev)
+{
+	struct omap_hdmi_audio_pdata *ha = pdev->dev.platform_data;
+
+	ha->audio_hpd = NULL;
+}
+
 static struct platform_driver hdmi_audio_driver = {
 	.driver = {
 		.name = DRV_NAME,
 	},
 	.probe = omap_hdmi_audio_probe,
+	.remove = omap_hdmi_audio_remove,
 };
 
 module_platform_driver(hdmi_audio_driver);
-- 
2.39.5

