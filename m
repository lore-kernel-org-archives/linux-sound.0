Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577E38AC69
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979932; cv=none; b=eDEayB1U9b26rCsgXH+FmGRDM06BdTvnuBEdTlEG9ma9mQZbjHU74CNdNRA8nqyiMVCwKL/2kFVxpT3U2l+VIuYG/DBqdf4Mj3i6g0IJm4sE5tTHjHGVSjzHtAm+3fHKy14VJrF+S4ZW4WifpZi6P8oyzixB+KLVO4dH9w3YnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979932; c=relaxed/simple;
	bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcHOZizclQ9VEjY4RCkpdBh2PeYsZaRX15iqGPtceaXN6fmm6OxxZf6K38xpKvizK/2r/xXvkYgoS6xnNyuMtczcaGX+FzxQqTsct16qTe4cCUZdQeLscFnvynOE4aywi9xpuYUfjFcpWg4z3Clc51syDezSEAkvX3/dQuVRDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rC3oyAgU; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rC3oyAgU"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1305908ae11so1693485c88.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979930; x=1778584730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=rC3oyAgUHIJkr355S3bBR/5MWnGJ5LgxDe2/oxws1oMVSpiH6KFtVO0jDzt+Ae6YDd
         24RjyQj41hWY1aDniruNvqCvR4GZCitMGhKHkKXSrXCpYBAHJFi3xC/v9flEsmrXpsru
         ++eFOP/aabul9/LE0BiRdNHMygLh2+3X/Nh6ymOOLdo7SrYvbv1v9ywD0h4/vqPGTyVR
         udxKRMtyYYOXegmvi2rpvgICYa8dYcqoQb9Ta67i+ImCvPYGijsFehHcoBGKsmSEu19K
         Hm4HVmueku2R6DS0H3tzRmNX07AndA3uRMqb0JYUj6jB38NFj6mnnituZwGMhuzDKAv2
         tQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979930; x=1778584730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=GbABM4hUKMfqdsbbwKL0IGV3m4U0j45wzKcZaO5TCkLXFjY5d33tfrgukYSI61qfX7
         PCt5YhmSPa2lObgalpiPe/7a3MbHONIqgJ2j2rXk56ydGYKXTHVrTEPpyJsbGjHhyn45
         CDh08qN1T4M73bcfwYlTEKI0X0wv5C1xZGrGDfL43h4hPgTMHjlB6obBJctDlTEIL79j
         703Rub2mDxRX6/0dEeLW1BmTJoqGnD1k47LFvB9tM7oKWhF07cvQcnVkJvnAoBWUh5Wl
         cz18RivoQzX8epv21UHElJVYrB3ujXDi3jXWN0Z/J5ZmUUh9m4csMZmddpYEJn+xhNjF
         qIWg==
X-Forwarded-Encrypted: i=1; AFNElJ+2PN07qHPS2kggmc6bCfLTb+WdsY8XQJQR6VvhreOkmfSFXP00pdZ3dwomwrhooyIoQg9WJN+fLueaqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHCGvcB4GVYRME0H08J0KbzHL2UngqKkXlH4WQ6z/AN95JGmml
	shHn4r0gEkFQp/3WTNqrB/1ByZGfhTzjVmFgByWSwFxrvYjDqbGb6MMs
X-Gm-Gg: AeBDievsut4BZnYMpRaQX54mgTU9S3huPiY19KD42083iE+Wh527EWocIuJ/xuTfu/l
	18sCIlFn58ZMQCyyUHT+BpTPVQjGtC8JsGK+W0BDjgBz1q6CMQxC7pSKLjzFyQSjDK/2gkbvrZ6
	tKTHnLF7RB17RXDpnSYh/zNUThE9W8kHVCjLfqkcDwffHtRtA6XHgF7Tz8UMsE8JpoMnw1mPNNA
	i23KOQhPDULad2RyVThh6rba17QyAl9Jb7MYHSjGwqCQFyahg0xqdP0s85ltlaqT5e3eRiXFpmA
	OWtbxIjSutA95bLm1mZ7H1onf2D2ximBW+ymdRPc+x6z0Zph+zpjOcpOzelyX7vRdzCtXsgdMaw
	OUZA6wZM3DayZMpb2ewFV48FSkdbJD0iOrlI6e2Ny9WgFT23HdIq0A3shB9D2SHXkca6//HfF/k
	hepUVZL3gHxKa8SmsqDyqXzqv2dEzGtezCgdxX1m2qCIWEs76hrLjwVFSG+NSQ7CPsbViIid+Dd
	zo00/6d2T8N
X-Received: by 2002:a05:7022:6998:b0:128:dbbf:fd35 with SMTP id a92af1059eb24-130b1b6785emr1279909c88.28.1777979930401;
        Tue, 05 May 2026 04:18:50 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm17247290c88.5.2026.05.05.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:18:49 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 05 May 2026 08:18:17 -0300
Subject: [PATCH v4 2/2] ALSA: hda/tas2781: Cancel async firmware request at
 unbind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-2-e7c4bf930dc8@gmail.com>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
In-Reply-To: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk/L/Fa1/D3LvgQOr/TvCNz0psnhmaM62cdmaLwrrxMX
 yM3IjC7o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACZy6RrDP4OES5/L2+dM+bT3
 HpNKnyHbv7oSpryvepclv2+/N6fZXIqRYftsHvU1UVN+MH+9d7brqpuE5A6vpVcbvrQt2bD1vue
 k/8wA
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
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 3 +++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..dd1b0cc63ad6 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -588,6 +588,9 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_hda->priv->dev, tas_hda->priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..d243baff95a7 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -750,6 +750,9 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_priv->dev, tas_priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);

-- 
2.54.0

