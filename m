Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F134AB14
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467558; cv=none; b=rEagj6NeqXSzLfrA9QNmTKA1sNU5wOU+hx1eMptlOhR8nyp1VDJz3NEepKqV7AGLzfxl4aONkEBNSF858UVT8o5UtmYFh2O2EQLthXl82o00hN+WriNFuJ51LVHkkWwFyastVIX628zawHx4aI3OtVdeX2HtgZ/T3F2qCVYXZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467558; c=relaxed/simple;
	bh=iRXXCZxrE/NfaVCW0B9rAvlZiNnFDl2G4nevY9sv9JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U64K9sr1MB1jifirvaFFpNeHj57wv6uxKmsxkQwXwX8wFzylMZj5Xsm5ssqDVM0vor5nsnpIvsDAwqqIuzIg1l+L7/DQWt21AV7lRWe51NcboUcHJxUqr7k0wxjRiMEpgWdFWpx1dIAdCWvBVk/momCqDvZpwMzROsVYl5IcW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruTDHO7w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruTDHO7w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceab75934dso5362465ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467556; x=1786072356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcxaRvc2VCXz2/SODLczo6EC2fQ4JjRfnm42T/RdtZs=;
        b=ruTDHO7wLPlt86Df6myuYEoLdmeqtscazohUzZPZgBqdn1yq7bKZ9hP5nqTTR+WwKE
         0UhNkLO315lJp3j1raSH2wA0KiRP6UeaHWq6GdNi0kkCoADNE1OhUBwh29Mo+vXIAElV
         365hg/u9/JQ/kHK8Y2qoR2OAT/Y69Nrq+5MIQFREUFirivnHKx8ZyM8fjAgUkopgeFZG
         WpiJBQ2l0qEHiWGlQHaZ+W7ys4JztCYNlG4YpiDZdbJy5Ytqx/zpsrSFylxml+XeVMQh
         hIF6Nw1+2Eh7R5uZKkt0vOOR2qopDaj1WUbHHF71sHtJX4tJopp52SneP2wGLbuLHlsF
         Ehtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467556; x=1786072356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcxaRvc2VCXz2/SODLczo6EC2fQ4JjRfnm42T/RdtZs=;
        b=REDqrhcqafUPU+hOGpHgbbaKtPaZ+ZO8MbuK6m97wfm2ahsfZwqVY2qqg+agNlHXL7
         3jvEL6rhqgBjms7x+PvisR+H5IulYjaC1bZ5TneVPh5C7hflF/oQQlkOx92v1sqlnFPg
         jTiM5fRZv9g3N8zHVH8cgZg3wGXj0VRrY6YoTmu50Q3GQBevlIrQJyAIiwcwK62MgNgN
         ac9T78145ib3LJeb03/ylhmCJghAz4AUDvEgs44z+G1g/GvOMSsEDYYuzALUTWm+CAdG
         lFYrvkdUpwy/nFm4WRFvDjt60X2WMxQo9gr9phxUH81rLdWSlng64nwF8IkL4Uvraoqb
         oNag==
X-Forwarded-Encrypted: i=1; AHgh+RovGOhSdVLvTT7x+WoX+GgKpGZE1nyMQ+CbU9hb6qYCwlhLOKCPZ7JBJRhGZHo0BEL44QjWg6cT8XDLLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54DqaRAXmrRwqAOa8liZdv+a3Safk+57oKRMzA/73rMBXgaQ1
	FoHPpSCUopU2QfZ3SJZWh/swBwXHgwln5P+nXYx7CUam9qyLNFZ/9Ta5
X-Gm-Gg: AR+sD12epbLk2TViRTKQ9x4p/rPQFyafi2rP1+E7gZdmYllmiHEyg7Xx7I4Y14qFKXu
	J5gbKOD08qqoKbJ1Bxt2jp6/AtLI5U7E527rC/mZIeEB2WwkHFWh5tSCze5To9Sqb6riejhtg8r
	YoRy6+Gq0wXgq7+y/cCyXucCpgDR1HW7KVNL+VfvJ9xFB6Up9uTv09jyIBzmXhb4y1sK1rjK/st
	MhNYy6VAnq3KQaRg/e00qH6gF5juzbZuDkrz6oriiIJCeuyhPGPlkXvdNJzI9lDLpAIwunvg4o6
	bPZVCSQRhbRYrB3XbYXaibYbVlf7Kmdr3ohhFEmNcBL+YtvwZf5UAFbvR1D7nboelI9OnjfcjQs
	/V/C21/dweDkfOtH9n/5ReSTZ17ilBq6UnHqiOIlVZeY6dE0xhQCE//+XCdZ3hwSS9EPd76aGnj
	SPlmMio5EVYmuLA+vqL0qLPvxtcttP3b4QW+xhZy6k97iZ/2KqGknd0xqkG0tj436ttQgE6bNXq
	OQUJKuMfvKcA9OrpZJ0yZ06TZw6EV8NHCvdwuvUgkbilG8Q5ozuMQGRkwE4hoS7O//XhLTzvqa/
	549d
X-Received: by 2002:a17:903:38d0:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d046e7de3bmr4701915ad.23.1785467556364;
        Thu, 30 Jul 2026 20:12:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 19/26] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:41 +0700
Message-ID: <20260731030648.8706-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8731.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ce87280d590d 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -10,6 +10,7 @@
  * Based on wm8753.c by Liam Girdwood
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -110,22 +111,20 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
 		wm8731_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
-	return ret;
+	return 0;
 }
 
 static const DECLARE_TLV_DB_SCALE(in_tlv, -3450, 150, 0);
-- 
2.43.0

