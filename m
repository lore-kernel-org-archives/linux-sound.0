Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A01C235045
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528673; cv=none; b=A+MH50RWofCKHHG8sQIgpjoXFKouSD+ZesIoT7U/VCjbLHwPkgHcnOdQhNA9Nu8rmNzl8/VbfcCyyFJDBUmnsTK1IsUrVk/m9f/irR0K7Fz50nrOHCRtcllM+H8mW2nQEvl4tcPIJBLQKLXFa/anP58KqJz//5D6c95LibzsxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528673; c=relaxed/simple;
	bh=iR1LqIFM5kpqU9FhK7AKXR85Ty5byfvUM0BITDHvv+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDOzAXgzLL07IVCADwILAdZpoa3NduOvxsXtyr38HM9EVpt81yXkTbvpSr1WiHg+/uAqvN4p/anKUNhAdy1XjIuPuWL5K5htI76wWC0TedJf7OcfrUBiuY082tP6hI0C5X8NOE3S5f+e+nZOJboRFi0U4wMV5Dbu5gTYp+zWjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JJ1tm0Mp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JJ1tm0Mp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954dff6536so14128185e9.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528663; x=1785133463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YeGYNprjO9RozTDm6r0Dm+rCthz+7k4Z0dmrZWw1tp8=;
        b=JJ1tm0MpNinuTAtW5HoxTLW4VQ7a/LrlKeKoDC9PInARYYHCho5Zy58hBLWupiCifQ
         yZ/WBZ5vXRNUooyJdgVCT4Nc0eCwte11rcapznouy3obCUiCO8XylDGmYa5KE22OO5EQ
         bN20Rx+nrg3ivYJVmacMpQ6QXhN9q2JUmLl24tlOC+VEKOjM8EeBJxIZh0y0Mdljjoja
         gy7fXqZUDbaChabHJ7OPMJ2t3tZF1u0mNG5PGFrN/MEhPkuZis8REAen2glX6/71B1Wh
         uPOgLdeDygHqnpua4FmUvFeYQGb2D2IHBZ68l0NeR+rADiPLqbA6WFQOCSrwp1fgSZ3f
         C8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528663; x=1785133463;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeGYNprjO9RozTDm6r0Dm+rCthz+7k4Z0dmrZWw1tp8=;
        b=sxkGDSPs4KdRmjVmhQyT5G3UNNOKtgfYNxAfQGo4rKnQ3JKICQ7iq4T3qj/BhJRzDq
         OWsiRb9Z2S7VmtAN7BKgJ3ysQ3EizgA6xc14LmDGbZkS6rw5b9TYnCagH5AbLgF6NhI/
         EXIwcm0ieyqX0CyMIGuDzcfsssD9aqYtp8tEnIUv6JXfCY7phHi0WQHGKCilG5FRyMEq
         XFe+iQNyV7FozjjeGG/GFm4mNbCuXMYgu+nmZ3gMnaneuNDaylwiEMWCAAYBzzx81zA5
         vOnkgw+UUFj+0iH9tsRSD2hQd8rZxoLCorhc2omGmNzuDD1hV6NZp49l7XN0c8RJJ8Ch
         a8bw==
X-Forwarded-Encrypted: i=1; AHgh+RpT908a8Al1vohFd1FTa5nhJYq41K1PMLfrB8nwFUy/FCGSBP+0fdD0nzyBR10fzuvMHZihkM9FNrg+Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+oa/195KqDWsxyHGTBQ7ngE59eOFUipfCMLYvm8prUKkOhjX
	2TKZVjB8Y5aMI/1b71okOeZTWAI/3xb0hi6HBDa7+ovOToCoulnFZ73TVdOUq0qHx0Y=
X-Gm-Gg: AfdE7clhkMYP0Vebhimv1d2Qhs1fKPPvhq6tRo0v+iIeWDL3cVPFNfC6CNAKvihhwqm
	3dG4k3W5bbEwcUktOw3Kx2FzLgSpd0P4VKkhBAjdYi4gSdx6BgWHqfEkpD6i0ZtWtCK9YlAfLP5
	+zU3UbpjwEnIL4dU/RocCkUS/hxMx7XjF2wqR/buBDt5rCsYK2rHJvHrtddgYmC+KwnxKhsuRZJ
	/TfpcSlvF2vZflhpWiD1mLBVJmfdfjeXV4vLXeqIBn4pALX9OkG65gCImiKZ153EpWLcs1J3cM9
	VgHRIFqCgwYVvohqVM5FMEHf5LTcbnUJT4PDavH5ybZqn30qL/Ye7Wdtisv0VG9DFjnjDe675kp
	+YdTK6XgkVKxsJT3tOxUJ+p3h+YNVngGbA7ECW2q/6vcviVDNW9mCPNtxBjedxAdslMt98vi049
	lhGRhhLdFQ0JaRunbeNw==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr131890425e9.15.1784528663074;
        Sun, 19 Jul 2026 23:24:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2b87c6sm455259245e9.7.2026.07.19.23.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:50 +0200
Message-ID:  <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13598; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iR1LqIFM5kpqU9FhK7AKXR85Ty5byfvUM0BITDHvv+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7/ZjkV1xENnv57f8GUMRLZBCpZ1LZrci46v TNMnyy6QuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+/wAKCRCPgPtYfRL+ Tk+/B/4zvL3PZkVE/LvqrCiNOp093/fSaf+JA33aGPRnYdd3KE4PbdhEyLN92lv8dUj8MS+5U/C nd/3Jw3tR64O4+HgjFbfwaFuQnkUnsAkl1y3vrsscJpaV5FfRy/q3Fe/rMxYj3rEB5B2S+eR9f9 9eqlrwN6uNkJfN+cCAjdjKOVgZflj7GY5J4tXcqRR9KG0dr2h186sG/16b6M7ocumP8SmSnlkor MIMG/xs6Yj+5RLaWHP4wsA3g6iAcmK4nA66jB3h44Eneonrp/xOpjrN+JJBxEmJOolDyTgsUgP3 bzcA38YgoukL02WmEgrd6mYHAhsOsBbKUz+ap5KbL2kWMmwU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

 - Add a trailing comma for initializers unless the closing brace is on
   the same line and for the list terminator;
 - Use a single space in the list terminator;
 - Use compact one-line style for small entries;
 - s/\t=/ =/ were the tab is only one char wide anyhow;

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/au1x/db1200.c                |  2 +-
 sound/soc/codecs/adau7118-hw.c         |  2 +-
 sound/soc/codecs/bt-sco.c              | 10 +++-------
 sound/soc/codecs/wcd934x.c             |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c          |  6 +++---
 sound/soc/intel/avs/boards/da7219.c    |  6 ++----
 sound/soc/intel/avs/boards/dmic.c      |  6 ++----
 sound/soc/intel/avs/boards/es8336.c    |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c   |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c  |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c |  6 ++----
 sound/soc/intel/avs/boards/max98373.c  |  6 ++----
 sound/soc/intel/avs/boards/max98927.c  |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c   |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c  |  6 ++----
 sound/soc/intel/avs/boards/probe.c     |  2 +-
 sound/soc/intel/avs/boards/rt274.c     |  2 +-
 sound/soc/intel/avs/boards/rt286.c     |  2 +-
 sound/soc/intel/avs/boards/rt298.c     |  2 +-
 sound/soc/intel/avs/boards/rt5514.c    |  2 +-
 sound/soc/intel/avs/boards/rt5640.c    |  2 +-
 sound/soc/intel/avs/boards/rt5663.c    |  2 +-
 sound/soc/intel/avs/boards/rt5682.c    |  2 +-
 sound/soc/intel/avs/boards/ssm4567.c   |  2 +-
 sound/soc/samsung/i2s.c                |  2 +-
 25 files changed, 40 insertions(+), 66 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 81abe2e18402..78346cd7959c 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -42,7 +42,7 @@ static const struct platform_device_id db1200_pids[] = {
 		.name		= "db1550-i2s",
 		.driver_data	= 5,
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, db1200_pids);
 
diff --git a/sound/soc/codecs/adau7118-hw.c b/sound/soc/codecs/adau7118-hw.c
index 92b226b8b4bb..4342eb7dd9e5 100644
--- a/sound/soc/codecs/adau7118-hw.c
+++ b/sound/soc/codecs/adau7118-hw.c
@@ -22,7 +22,7 @@ static const struct of_device_id adau7118_of_match[] = {
 MODULE_DEVICE_TABLE(of, adau7118_of_match);
 
 static const struct platform_device_id adau7118_id[] = {
-	{ .name	= "adau7118" },
+	{ .name = "adau7118" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, adau7118_id);
diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index c0bf45b76cb8..b085885e3f18 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -85,13 +85,9 @@ static int bt_sco_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bt_sco_driver_ids[] = {
-	{
-		.name		= "dfbmcs320",
-	},
-	{
-		.name		= "bt-sco",
-	},
-	{},
+	{ .name = "dfbmcs320" },
+	{ .name = "bt-sco" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bt_sco_driver_ids);
 
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..a9e6f2923099 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5899,10 +5899,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id wcd934x_driver_id[] = {
-	{
-		.name = "wcd934x-codec",
-	},
-	{},
+	{ .name = "wcd934x-codec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, wcd934x_driver_id);
 
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index ee741f3d79bd..7086fb7fc1eb 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -810,9 +810,9 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 };
 
 static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
-	{ .name	= "rpmsg-audio-channel" },
-	{ .name	= "rpmsg-micfil-channel" },
-	{ },
+	{ .name = "rpmsg-audio-channel" },
+	{ .name = "rpmsg-micfil-channel" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
 
diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 2b17abcbd2bc..163d9982d797 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -259,10 +259,8 @@ static int avs_da7219_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_da7219_driver_ids[] = {
-	{
-		.name = "avs_da7219",
-	},
-	{},
+	{ .name = "avs_da7219" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_da7219_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index bf6f580a5164..8d36bc7ddf16 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -104,10 +104,8 @@ static int avs_dmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_dmic_driver_ids[] = {
-	{
-		.name = "avs_dmic",
-	},
-	{},
+	{ .name = "avs_dmic" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_dmic_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 301cfb3cf15b..36c13db3a272 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -309,10 +309,8 @@ static int avs_es8336_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_es8336_driver_ids[] = {
-	{
-		.name = "avs_es8336",
-	},
-	{},
+	{ .name = "avs_es8336" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_es8336_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index aec769e2396c..03cfd91202d3 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -231,10 +231,8 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_hdaudio_driver_ids[] = {
-	{
-		.name = "avs_hdaudio",
-	},
-	{},
+	{ .name = "avs_hdaudio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_hdaudio_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 9a6b89ffdf14..787d781ba1d9 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -107,10 +107,8 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_i2s_test_driver_ids[] = {
-	{
-		.name = "avs_i2s_test",
-	},
-	{},
+	{ .name = "avs_i2s_test" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_i2s_test_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index e9a87804f918..389a50923d3b 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -136,10 +136,8 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98357a_driver_ids[] = {
-	{
-		.name = "avs_max98357a",
-	},
-	{},
+	{ .name = "avs_max98357a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98357a_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8b45b643ca29..b8231f71d3d6 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -191,10 +191,8 @@ static int avs_max98373_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98373_driver_ids[] = {
-	{
-		.name = "avs_max98373",
-	},
-	{},
+	{ .name = "avs_max98373" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98373_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index db073125fa4d..d657e7da1cc0 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -188,10 +188,8 @@ static int avs_max98927_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_max98927_driver_ids[] = {
-	{
-		.name = "avs_max98927",
-	},
-	{},
+	{ .name = "avs_max98927" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_max98927_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index d44edacbfc9a..d7ea08bb27cd 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -293,10 +293,8 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_nau8825_driver_ids[] = {
-	{
-		.name = "avs_nau8825",
-	},
-	{},
+	{ .name = "avs_nau8825" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_nau8825_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
index b5bebadbbcb2..9d415fd0499a 100644
--- a/sound/soc/intel/avs/boards/pcm3168a.c
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -132,10 +132,8 @@ static int avs_pcm3168a_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id avs_pcm3168a_driver_ids[] = {
-	{
-		.name = "avs_pcm3168a",
-	},
-	{},
+	{ .name = "avs_pcm3168a" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_pcm3168a_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 73884f8a535c..4053d14289b9 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -64,7 +64,7 @@ static const struct platform_device_id avs_probe_mb_driver_ids[] = {
 	{
 		.name = "avs_probe_mb",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_probe_mb_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index a689f4c80867..289f1230851f 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -261,7 +261,7 @@ static const struct platform_device_id avs_rt274_driver_ids[] = {
 	{
 		.name = "avs_rt274",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 4c9ac545555a..9364d60cfcc7 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -231,7 +231,7 @@ static const struct platform_device_id avs_rt286_driver_ids[] = {
 	{
 		.name = "avs_rt286",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt286_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 2d7a7748d577..5d3b3cdc9564 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -250,7 +250,7 @@ static const struct platform_device_id avs_rt298_driver_ids[] = {
 	{
 		.name = "avs_rt298",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt298_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 22139eaad83a..e448bc9fa5ad 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -178,7 +178,7 @@ static const struct platform_device_id avs_rt5514_driver_ids[] = {
 	{
 		.name = "avs_rt5514",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5514_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 2990d32f2301..c4e33d71e82f 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -252,7 +252,7 @@ static const struct platform_device_id avs_rt5640_driver_ids[] = {
 	{
 		.name = "avs_rt5640",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5640_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 68fea325376a..aadbd3f2a1b2 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -249,7 +249,7 @@ static const struct platform_device_id avs_rt5663_driver_ids[] = {
 	{
 		.name = "avs_rt5663",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5663_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 81863728da1d..d33699cca595 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -325,7 +325,7 @@ static const struct platform_device_id avs_rt5682_driver_ids[] = {
 	{
 		.name = "avs_rt5682",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_rt5682_driver_ids);
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index ae0e6e27a8b8..d7c9bff37556 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -180,7 +180,7 @@ static const struct platform_device_id avs_ssm4567_driver_ids[] = {
 	{
 		.name = "avs_ssm4567",
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, avs_ssm4567_driver_ids);
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 56d11741dabd..81d5dd36a246 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1675,7 +1675,7 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
 		.name           = "samsung-i2s",
 		.driver_data	= (kernel_ulong_t)&i2sv3_dai_type,
 	},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, samsung_i2s_driver_ids);
 
-- 
2.55.0.11.g153666a7d9bb

