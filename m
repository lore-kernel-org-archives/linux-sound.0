Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A144D021
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515192; cv=none; b=OkTebWXzFRP6Spfg6duG+voigVjubxfijPp3j6JP/A2nPLdFQKz/Twzf2ZBxb1BQnJpTNNj6PQXjdXmJkslyugRddrQ1V7O1qBHKFrK9f6KU6LK6HCxVd0UvudgUXCQFrZuMZPFgdihcZ6hPLIvncW6RxIJbKsl5Njr0ofrhpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515192; c=relaxed/simple;
	bh=Le/mCnMQIax2AIs03vo6Mt8p3Vs/8n/EDxeqb34NEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIzmzM8/zs81NjTk2fjEfeMYohdKZiRR0/xmCdDKgLQlRnnWaOBg7yaMQfSXoCLPHaO7ssUH+5aG7PltXJ6INgTk1DMOFvQUFKQXXzk+3iAdFPYZ0X7M2aP3W0I44vgn3Ku1vWzj03Hk06Gh4ursxWJymLYaONXB0MTWCAOOAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLe0Kjqp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLe0Kjqp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso689037a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515190; x=1784119990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=YLe0KjqpWlho/ZJY4flOmoSDah4Y2IpukEyIEwbDL+x2i+HVrBG86CJ02Fg/iaIb4t
         sccsXiAS/GykswRTVxrQHUYmCqB3/qgc49/x23w/Mx5zRiIwTCgYOTH8XtwcsthhPy9P
         KSNBcOah2Nnjw6ArJDnbXeftb2Oo1BfD/YIPzE4P8v2cZjjpmkfAUnxQiDANyqhLh2wL
         c/yIF6bs7Ts82/bskFtxXyfA/5qC48B3tyE30JGO0mERbyNhAzLFpDXdOmDCNp40VR89
         do5fmzZ802lfwxgahY0Rcj48kv4vdwUHOh4uxtM3q2Y4xu2FvLlnGgb5m0JbVQN8sCtJ
         n3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515190; x=1784119990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=ICZWCJ/PA6i+YO0baWINz+4815ICOIPXF2prFTpB06lDigVDi7InZxvMngf5sdpaXi
         MgD1D04oIKPPRPi5GpS9KMF601VXLiB1nlbx/KR9iA8JeAaiw4YiHlszwZlZ68r26C0+
         knwYO1bPgMne15lgc0kUrKD27Yb2R32t41D7Y2PfFPRZwbbq1kTZweIBljmkUjVmqa4a
         2g7hbnfyFQmalRJK1tB/PDKKGbHuMJNWx1oDdPP9sdv3hYaWEgTZKOw0qI/ps4bgUAQ0
         qsaqta2xOam/FfeDelcI9UhlUDi/wceWNLBMTt8vEoIssapti0GF5EOwhbQBfTovSW+z
         L+7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNVzpuRXMMLUvWq9XR9kByw3s3QuAXGOX29lulZy8YZT7+QdowLxyjyFF6GwzAT3JPLluFzH0/TEYwog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhX5kAuK4/SbKB19pnYAXuEUJnFcZRQcrIh4MACFnYoW/LpI+i
	bmOPyz6xfxm6UfodzNEqtQavqtuvtUJj73NdhOOc2lyvbPIzkVwSgGPv
X-Gm-Gg: AfdE7ckJhWH80EUNLr0ddU2HjnA+eAAtfAvkDbPR1rA0jtXPeIXZA9so7t4JULorF+E
	KVrBT8spyXC3JhC8AhzN/KTInVEAgWpK55C46YIphUEJMvIPMJFKYpWqDi/gJombP8/X2hIQnzZ
	iYMgc5yYtFNIVilNTDlLBm8vxwJLlwRWAZDmwTdOdrOwij8VZ/E0M+hTYfldJd/5qVyAckrgFw+
	6Mmbjqq2hRrncWGUyw18uD0cN5+0Je2Kg6WyLCHYKjq2eQZvYiVZZgs4Vs5gA2Ra1aRjZEaTe/V
	HdT2bKgaBCo3KAKLhFW5axi+9ldsmMlc4q/Cdt0PaYqc/gB71ClOK0gEuE6YxNF5lAkUu7yo8KH
	doy6RQ61RlDgoS5Gd2ysXZ/ztUyTQVjtCc4z4PlTBI7rej4sufNC8xWDMLWHipBDn6LAeIcaYox
	Jq6fJhvthPSLKHtz5+KgGPhG9+XDHt3MTX16qsnzCPY935tMk=
X-Received: by 2002:a17:90b:2583:b0:388:cfc4:7e6a with SMTP id 98e67ed59e1d1-38940638ab4mr2388245a91.13.1783515189986;
        Wed, 08 Jul 2026 05:53:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:09 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:58 +0700
Message-ID: <20260708125002.202515-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

