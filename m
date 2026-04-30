Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D439A7E5
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 21:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583734; cv=none; b=YP8xW6Py0dfLmZgmId/anJx+UgewsKdZ+/qPjzrBTNL9/JHHzGeI07mRv8KyPrva+CRYycYie+Wf5a1TMyoG5miqjwMJcUWzchu95+HA7jA0ekvRfhUO3HLwkRql4IOvbaD8ZHS/hRGf1siXOZwGDieIa7DNYiqeDcdvJzhVK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583734; c=relaxed/simple;
	bh=a2/4NZb1cq6S5TUZgGQmvZJsMsttNjgFGxtg5rSSmVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkvIwnvbg5BSeNXtBH1+DySeNI4JV0/MBjdrKQqFZzfvj/Tz4CQ8oNJSIWYLLTeXAXLP1jOChsoShIz+fPD2DodnAEWA0JuQhxrzvdyO1jgG3YgLzXoCMtrLfm+4DokkKXZ/H1qF4c0CvmMJmyRmzP4QyTTpB4ID4zz5coRtAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKxwnJEG; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKxwnJEG"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2098780eec.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583732; x=1778188532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5HU0juTrz/+bwfhVRVrLsU2IXIIJwo9lCW9lyuPHrs=;
        b=kKxwnJEGCtsHTgv4VoUkOt1Th28Qyo02lxw30BFbeDfYQyLew/K+5otDe21Ogss4eG
         6BJitBwQfeU0jaKi6qb3nEfmaQXS5oO04PLigJyVNMpGG2SN0AHpgb+BxCQdkReRZUzo
         ukgcnAC/z8M7FBNJy4SI2IDxqJap0IWqkXShs2ou3A6DOclsLEGzE/m+Q9dLyTmQA0zn
         9OCtZfQa3myC9btptJeW2wh5JqNDZtMagARtDC9vrKiOSub6QqcuoBu8dzcbPaGebBkG
         hxtvXpTfE992B+mz1ZeGfh4QIe/WCIP2ylM3oCg+ym1IbmHd9Y8MGcz/WEoWkdHonTTO
         3muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583732; x=1778188532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5HU0juTrz/+bwfhVRVrLsU2IXIIJwo9lCW9lyuPHrs=;
        b=fkIvQLRYofwGsJl1pUMsrZuG4i93g+Uvx0bdr125fb8xUe25l0oOWw0qmNDMRPgFkJ
         l/iN/6QC1LhU4FfAepx6HlVnlFOUisCLysg5YZUReErsMMuC2A0SY1PUSkB2DcsxbqKO
         HXW3u3Gl2kAGlNVT4+MR2uUIe7OAPkj12R0TBgGsPQ1JZCG6aK1UoDyQzk4gg+Fj8+zU
         9pVe9GGOI3noYUzagRpoRmxBDFVuqx5eZaj8vOlPMjF4abZV/DbNFcD2fsYalmZHDZx4
         fMB4uhZEZwztqnqckKqNs81XSY4OTN/yNUyR84AlFIRDUXTQaCeWSmDb4csjJiqQ7R2G
         qikg==
X-Forwarded-Encrypted: i=1; AFNElJ/e1deJ1lEcZkVfo5ZRaqR1/SVDffvtAKp1J2gi7E9S70ErC4bi7xIFEZJxwjaCRLXoQsjv7MI0gV75Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0mrE/ksMJT3O75Q6mWVbALPST4huWjsINl6GPbjhmgDC1xIM
	hIF0X5jk2ZVmDz7OLZiutkPjeG6xlL2Pp9jHO2fA880dfJmB0KkJ68Rh
X-Gm-Gg: AeBDievyUb2HbKv8ySsCAvji2EfS3ku5NExLb2z3vw/JpGJl0X7bzHI6mVK5AT4dtHR
	1d3AgN4/WX1TQxLLtHQxeZ2tklXSYnbQUuMLjZ8sNqqoz3ow1Yk1Y8pwx9CaVAyhhzXu0/SduUT
	1q6tvFsns7f2RbncFTNU6KzAwmuK2tAfA4vKNxffnBW6cH6g8OuJrJt7DXtK84Aa5gdcA/rbRje
	GbiKazRetg4nJz6sRoILw8tNExze+fAFttH2UzXU1Lui+os0hiBV+JsLh5TOuYCf/tUBnTTqW6C
	7DXWqg9HyPor7tWvaUTsxek2/uUzh/1wTwb9Vjxnze4tUB0sFW0b0q/J/M6S2viE5Ap3iRfkgQZ
	Y9lEF8QyU6r1+VjlJExDSH+bW5mLtheDKLV/xcSAUKdnno02ew5cDKGGtdhg/W2WDKNMaLa2w7u
	alBLwug/vkGHrNCVKShmGIMy44OcMUiv4YOZAAEbZBokKwiUd44c+PjF+ekoOsDQ6qWxMStpLcO
	91G9c7dGYi8
X-Received: by 2002:a05:7300:cac8:b0:2ce:25be:c8e8 with SMTP id 5a478bee46e88-2ed3f15d4e0mr2351042eec.17.1777583731421;
        Thu, 30 Apr 2026 14:15:31 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm1581959eec.22.2026.04.30.14.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:15:31 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 30 Apr 2026 18:15:11 -0300
Subject: [PATCH v2 2/2] ALSA: hda/tas2781: Cancel async firmware request at
 unbind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-2-2c7d89cb3175@gmail.com>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
In-Reply-To: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=a2/4NZb1cq6S5TUZgGQmvZJsMsttNjgFGxtg5rSSmVY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfj6W+ZUkUXdEW9+/VnoZpvg5rn7+9absxJKC+v2dqp
 7FQ6bGDHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRL3EM/1S+9qy722QU1d+t
 lBwu6vzwg32OG3/QW6Pp0zpMxRWZvzIyLHQPWvF4+95dJxoMtv6+VurxX0XFy3vVFMfrmtktnYk
 feAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading from component
bind with request_firmware_nowait(). The firmware loader keeps the
callback module pinned and holds a device reference, but the callback
still uses driver-private HDA state.

Component unbind removes controls and DSP state immediately. Later
device removal tears down the TAS2781 private data, including
codec_lock. If the async firmware callback runs after unbind has
started, it can operate on state that is being torn down.

Cancel or synchronize the async firmware request before removing
controls and DSP state. A queued callback is cancelled, and an
already-running callback is allowed to finish before unbind continues.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 ++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..34c6940f3521 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -588,6 +588,8 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_hda->priv->dev, tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..6b0d6c764009 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -750,6 +750,8 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_priv->dev, tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);

-- 
2.54.0

