Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB239FCAE
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959190; cv=none; b=KT3UTtPBUxPpIwGz/mztPpywO/CixbXiswy5YNnxiv3T/xajaQd4N+3vxO/YTT+7aY2bjGC7tjbbcSYSYCTLXpy9ZtRM7DH/h4bmtnn3m/ldfMhbHIkuKb6AnPGmE9xa42JYVWheK09o5EUIxDntczedLiW/zcc5r9BmEDAZmvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959190; c=relaxed/simple;
	bh=b/z3Eax7flEcKMhu30+CdjXI6/EnnGB6R6lUbIfnI5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxcvf/aYhgOIFvqrTMzrakzMvxKqJ6oFMNTlKmW1UeMJ9PZ0GgAJRmdNASzqTODcGW0ZhV6LSQa884IkeKg6itf8+DfXzZxASE2kU1I0I90jprLjyexCXvWdPjaE96Coaw9NFxyPW3pe+CJgKG4f7Cc9CCz80ryO/Zewss0w57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ihoxLqJA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ihoxLqJA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49050bfe053so31243765e9.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959187; x=1780563987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMN8L0A62rb6DSEviRPf/uH7MHRGiirOO/mGhhk8gTY=;
        b=ihoxLqJAnpNDl7EEQfGRL9oUNRfpl0qzVWdoqB2dHrc8WDCz5zdnAWmAQt6a2p/FmV
         1PIz4My6usy2QaxAOqVAdRv5mIasMRBjVMcU/GzuZtEzjQgQ6o/aokzuQWaVbFj0BjPc
         LNnfr0yUfKnf+UGprBuZHxokxaBKtrg7R+3TsAMA0NVLrfNTMe3qgxo/EnlsaB9PAiUW
         7bv7wjBR4fTFdrXLsD/t5H2L/NW8OHsjvzpY0BkXZfyTAlJgSLSxkHtLdCnyHCK678US
         +LqslBnjp3F3x5vhece2zURyiq/PAdb1ZrMeDK6W+bzVBDri7cHl+jtSKAqk6L2Y/2rb
         3ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959187; x=1780563987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMN8L0A62rb6DSEviRPf/uH7MHRGiirOO/mGhhk8gTY=;
        b=oikRLN6811rosxqRA2L3XPpn9te/VLfMfH6ojFn0wjad1jjg+nsztIo7n4HyXHr7g0
         XmGL3MnKaESq6aZocWHE6XW71iI9T9jR4LaGV37NhBFNcf0zYI5Z5el7qDPYeC+SQQDN
         VOCBy0vAl6vIPBcWkWYuQNgTzQzTMelAqXMzc9zYLcFCoua9ji/Tgo4/zCav6JTIEcYi
         kbsTK2JegkX5VojvuPsY4UwaQUVNfsaJhYTK6HfAEqOZ/s2q4Zy4oevq6yPitMUE9zez
         rYKHyOMCfA/WtfGGfnwwsTey22PD8NaJMI4rNKlhfwYO3sq0l1Dvmd4q78+hZCNU4qi/
         D/7g==
X-Forwarded-Encrypted: i=1; AFNElJ/Y9qZSkMSb8vzUNec0GUoOm+9GliZh7qh0gXrIW0eVxvS4VLdBJGEFaxMXdNiCPxDReKAdnLxEcQqrkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KFSJC7nRkKaXVCE3jCgXA+/e4EwIsn18nzQRDtULG0yW5lgT
	DhL0CxsnTl4RO+SdwCePtwrSzOELFI5ihG5eoZ/+o/iGrMkTkUTf3Aux482zqJHkHm8=
X-Gm-Gg: Acq92OHU90EcBlq6uNTqzWkg4GFZSVR/HLXjMONHEBoE3oRDVBc5l/UdASQnqvPagrr
	MBmfd7YKCqT9dWNzKT+yb3fkuRi8FgCxS1Eqn+wZyskAsen8350UomKx4mntGbtYxQ5vlYDepMJ
	fkgNI7JYkBPsgOGFplfYqqIrnXqAj2WBUUri8okLzfoOXfv3g8DoqcWqWG8fiM6/KyLzXtYzmTZ
	Pvq6pzT52UxJX+Vrs8cA7zPNCqiN/GsltoYj7wiDQk4OgN4MR+8GYq6iS0pm6g1FkEB6JuopOF/
	FUuFo9zdUIrE8MEPnp6Z2WhkLa5CC67VYqcSvhL09K6fz1sHAC6griRf2tfT00WDTOqF/FobFgn
	hGR8CwGOP4rQZOM0teDMfOiRb8PNHjnT3MQRdQhBg6t2rggkHW5AIId53COsXNMqy39d1tG1cEX
	1uxZMrUQB+VC5DH/3tkl8KXr/6cWnFr5hYiCwu31Ek3hxXvkzSYeeNyb0M2QSFl8AjM4fbQtauO
	Ny8OeJdr3bgky93yR7HI8TUOg==
X-Received: by 2002:a05:600c:1553:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-49053b0a086mr372758565e9.1.1779959187017;
        Thu, 28 May 2026 02:06:27 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909295a467sm25395375e9.13.2026.05.28.02.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Li Qiang <liqiang01@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v1 3/4] ASoC: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 11:06:02 +0200
Message-ID:  <c98326bcf4166fc3035d51e03f41b4b35eda52df.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=b/z3Eax7flEcKMhu30+CdjXI6/EnnGB6R6lUbIfnI5E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV/cNAVK5B7Z+t6DLJ4QO/4SgFYFq/fWprNl BoNcy/OVVKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFfwAKCRCPgPtYfRL+ TptaB/9BYr6703JfnTvX91N2f7ROd7L0KyG/+OUoRaTN7VnqsYzWTbcWWudCyAtnb1OPW7cGcED xBx4EwH+v9gGI2mutLZePYPgMsBMuRNOAbcDYLC2iGAD4t5UAaHgSEiQP3DfSO1+p6kbOrTxzk/ 0q/qqk6f4Vba5EetPM237bK9y6yCknbixwdUAikRHV4hD7JEfd7cIwy8QqcPq6Oa4cLQrGKuZQt JDta1Rir/NFXYfEHNSwPihS8RPGmWlCEA9MLKYCRg+MBwcTn/9PX2hQyPkOZXT5SG3w4BJnvfYl AYPGFf7jQADTkpnz03NfywKhARIpMxjEmLZiTf4P/AFrTJJK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 4 ++--
 sound/soc/codecs/cs40l50-codec.c        | 4 ++--
 sound/soc/codecs/cs42l43.c              | 4 ++--
 sound/soc/intel/boards/sof_sdw.c        | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 09b475c83c49..c3a0e0c4e996 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -579,8 +579,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "amd_sdw", },
-	{}
+	{ .name = "amd_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index a0fd8a6f9970..578f24329c04 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -437,8 +437,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "amd_sof_sdw", },
-	{}
+	{ .name = "amd_sof_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
index aa629ef53db4..676367163067 100644
--- a/sound/soc/codecs/cs40l50-codec.c
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -288,8 +288,8 @@ static int cs40l50_codec_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cs40l50_id[] = {
-	{ "cs40l50-codec", },
-	{}
+	{ .name = "cs40l50-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs40l50_id);
 
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..08f94ce18e14 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2942,8 +2942,8 @@ static const struct dev_pm_ops cs42l43_codec_pm_ops = {
 };
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
-	{ "cs42l43-codec", },
-	{}
+	{ .name = "cs42l43-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d43daf9b025d..135c93ce4415 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1539,8 +1539,8 @@ static void mc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mc_id_table[] = {
-	{ "sof_sdw", },
-	{}
+	{ .name = "sof_sdw" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc_id_table);
 
-- 
2.47.3

