Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226753F0761
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780979; cv=none; b=Jp/5w2E4u0goginHPfDIsMo7JkDQbB35Ibir6N+vq8mUJ2Pm1IfRgy7yFjKSMVAxFlHsQiPv34mSg7K0xnZDDPF0g++v45YJJEtsc9OB+OS67q4jaPKVeWXZlNDM7Gz+ctq7c/dF6NOZcpC+e4SNeMJ0ksBWnvuaES2FH1jvXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780979; c=relaxed/simple;
	bh=VveqHJbkYEX4uhQvFM0c21ksOyeuRsbn28lpWqPOOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN6S3ojwSD5jjjWOCudgspQtDcHsyQEopOxvk1866vo2ilolTfKb3khCuoARAQOhIMWe9TnJApJYb+HVW0sQwqmGSUksYtBBFEe97Zh/oSExOtNcUHr6WR9g0QSundc/zrRY4AjxVfEBFkeVbOUjl9lsrJiOVVnLN3GCkQw9eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN/IXmhW; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN/IXmhW"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88b7c92577so371633a12.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=AN/IXmhW6jD4HamXqatDLn6Z/vgDzY4A6iOwMeLuy7i35S4o2AiZKkZU4SkPN2aBLH
         AAWbc9gG2qY2w80IqpVsdrQoLRtmUviQdvp3/sMyAQKhC8AlH95Qx+D6Mr51b8KoeP+6
         lpWv4rd1gab1hOdwHuYJhrd+5GtbukMH7WsyXway/jmxuYZZ7Eh9pk5zGqJdWfHSiHw4
         setGVTVwaT6LfQJ4Xr+Qmcp/3nq6qn/Ru61GTR5szikaZnIpfYCP7Dsis5g0m9zLUFnB
         JhgtLvrQSGJxmtBmhzmaWQIQwbJi9tkmJqixBS6RCucfboSrrxcPqCeH2XszeqnlRtYx
         mqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=oaKp2DRnT/JoOwQ/Tuc3xvMeQgGERxbImua/Eq2OrGIoL28Qv2z/rWFB6i4m0GiahM
         khBYl+mRp1wvNqdvJvKioUiI/CirQeV4Ub2ak7EYwhfPEpPka4CgWXxtjRhLtfKMc5CP
         +dTfQR8eyYjeeSGv30m+2yQJ0Z3cjwYYWreUyPpvbfuXFyGqyIARcYkgb2E8sLqDXk9O
         QHNE0YqZ3lkMOYG/a2RivqJBhgpC4c/J3qgBXwhMw9UPVQGr1GJJsI1spLT2uM3jMNWc
         jc1KcNf2ZYlDDaM3+T5ErcZPMlL82hZcgT0grv6fVP+y63LvrG1ndJp4lr5Mc61FVgBK
         BX3A==
X-Forwarded-Encrypted: i=1; AFNElJ/zS6biLqLdPGzjT6zXiSMMGpWMo4qKTrBmEZ9yDFkQx9d3UsRD0CIdH3tegh3Qd/fp59u8G7smGReJvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Y1b3tac/nf5tYxkBGfN0v/cbdWxwIRWEfNT/OhWq7kMBai4P
	Qxe35GgIvEphMVu7jspCUao7UmoUvPrdh78HwJOxLgVuGKQYyYZZpNC/
X-Gm-Gg: AfdE7clsTwS6jrYTpXz0dCwhXlb0+ervR2KnieVkMOgv1MOuSwhkNdOvlJIxyt1iKv+
	LWGhv21svESENNWLd3ooBiV2fVWM+vLf8V3OmFrsU6Ybe0wcyq9PRXctTO7IZAYX+6OLwC0WqDH
	/gswQQVmrRbR+1xxdgspyvY9s+CIC1ifoNAoz8jYW23KhFLlC2ajnckOEi1niR5SgG0AWDkxzgm
	ox2itmyZkAH3Rzy+/sZTzeFQ+yAjI2gbCNqXtZ5GKZb/iOkFWyLZLSBWlFEpme8X1pgDq/qgOJV
	OXZbdorC+l1W1LZSlVxS0Rf8UesqLRWblFEZGAXjCMkaaSivtTS5PiulYGlZWgSCpoXsf2rLhCY
	Bp6J4T7VwYZ/lZgXQo7bUlFQNno57oNZtLmSDicQctRh0lsAVU5L70pvdtAt74/fwTtGNJPLFMk
	/DcCg+0/ubBSzHSQXBpm2InakGJ/upVy25iWuK6rKpDFCfrC63vN2qmysSpg==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
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
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

