Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B93D3482
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454436; cv=none; b=H/gHAXyRq/jW0MUzoRV0lYG9x+26wbMyjx4oKKwblmKoyVWzru6eUZy0OO0kVBt4XMAmaQyqfx2/SPL6dEoGOVoRuOdlUQC3ALXk8y2J1hvTHBBkkA2GysC/e9XQ/5ebflO/cJIasPW7JA1SdZpgEROKoDwg7li4mlHm2NHHNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454436; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh0iR75/25AirDDX3niNfbu/Yt4zQXTKFtAJTGbrAsc7SOw1IsQ36VFzGhL4SFu3O1yYvaXYTi9uLIniQ4pCS2EPRQGJKhODNEMPUAdxUAByWbSm+2sLRWCgHlCa8lxf5lRNN41RkO9Va8PVRM/3d0768pJ5OMXls1bJOIYNDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCln5B7F; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCln5B7F"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37defb2f231so336011a91.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454434; x=1783059234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=fCln5B7FdmU3m2Rl0GF+7UE0Kf8+mw8lZhS6lS+D8HoO0PrXLSsQoWpbixQ0OSXKfz
         bIB+V1YMiBNwLpwXowuWfzODzMx1bJUPsz5smsW2e++J82bxub+1jQehH5nfAr5XH+pQ
         ayS5GQwBH/QM0MhJuCyws1dsHb8g1zZEiDVAWKFmZBqFo9Je42IKPmumz3qzYyXQg33R
         p6vXrss97QyvntR8hC9af/XJzoBKQUrYENaaAKcw3MW1rmt9gHOCq7eP7t4Ba6BHWRF4
         M3Yy2aHUefHC7p3XxE1thW95SC6/4KZGo23xnp+Lx68g216qnMC1xwOYSbXrcVxKYPTK
         +LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454434; x=1783059234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=KZa9AgVYW77QJcpwV3hY3biJPydmFRsxNFBeVogcJzD4C4b+Sprj0AwYnRd35X5pfp
         x8nduBnffVap9dzg6UnMWx0mhlpbAG+EHCo8s7pgyPu9KOwsSMI9NJHdmsrRrRDT735k
         GAeIR+6nY18J+Py+eTvMMC+3ZJjnzG9yW576LbHqL9DIHcgfJQeNo7CNIdF5nDQ9ELGF
         XL2fymVczeIhlhXTdC7jR85hBtNDLmUb7wjiZH74bEqQUz+gwf4o8CDN1oFRAMe4U3f6
         7NDXO0NgtWq469yOxWhbvjHPM8UcmkJIbhMSCnCTg/p0xqntBjAiu0DANQXEXBLHVEqM
         ts8A==
X-Forwarded-Encrypted: i=1; AHgh+RqCgRbZMcW1yT66YOEjf1CBlA3hlrqf7B27UciN+tXHpU4EQ/skbISMXFflhmnMDn95n2VGFnZbNX92tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVb9KDtyq8Emx7hX4E3/5jDQZdNdfYLfzZnWlzSNsbkkL7jDH1
	Q10yO4kQNqbq3U+ZCp3/R6t4vUPTtlC0WmJw6FfLaXWkWi4ed7wmB8yK
X-Gm-Gg: AfdE7ckdCJpTAS0ThDAKaV7E/BYBBs0R3HtP19HB8wpNPxl01/lwnv055rW66U8YTnu
	OYrFB7/wybhQo0QiFdSJC9WzzD3lbYZE3wBupomDejhWoYRhSXp5I6eZZ3Nvx6ovpTkxaOeVI7e
	rDF+ORKBm9iAfxiTKdi/qG1D/kID6nHk9+/P+vfHlpvBAVy8Mg6I2qDfm7uV1K0dLH5FR9gHsOa
	g1Z/mbuPfAUdT0Dx8gFB0CTmuGQKYh3GWSyoL4grHvOOOCy/FPDmMlbq8Z1ug4Y7V7A0X7uXd4p
	zw7rrf3lLEpvf2/EsuS5BV4ZSTFMl/OBkDWNPKPdSEc3zhpkQMX8JQN8dKpnkshbyXt+yWfXgd7
	MDAkihZNeVqNYuWGE6Faid8BhjRPxDGpM8zaEudkCHflAo1UlmmMXGdf+h11eKcGaSXg/JEzhzQ
	oD1g/EaLXfSg1+5QyKtM5lSBUu+9i08ZgGqe2ciexKp8xEzzA=
X-Received: by 2002:a17:90b:2707:b0:37d:f5e2:dff4 with SMTP id 98e67ed59e1d1-37dfa1ded31mr5302285a91.11.1782454434182;
        Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:06 +0700
Message-ID: <20260626061329.23264-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

