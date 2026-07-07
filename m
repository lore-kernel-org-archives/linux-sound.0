Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CACD3822A2
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401259; cv=none; b=IkjgSC08Mky/MNDyDwFtJ+9ixo+whkBOeBZ1ZBjm5NCZ0PGhpKgNQQMhUB+apHD/NH/NWr0E6YOVtDy7q+SENO8wL1j+UnaBtONNbavXnmcjXISkMWDhNbGOsfkMiP8gNl2SXmWSni7JEujzC2IOC11E2wPt4LAGVQwYota+Ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401259; c=relaxed/simple;
	bh=g5J6VJsuQEDSKj38JRXT3/2Sio6DcgOG5vApByn829c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YW4DZxSHOzQ4JdG+2YoH7L06MhWFbYZW2LDTT02X8shUYdJXste3TzSx2347Oix5WhQAzjRdLi0CJ5bnp8G31fJ0MxpHUivz5ZjrfAsVIBrIOL3ZWOfWoZjWvrzWnnT7Me1jQEvakLmjMvK/OmarhxBkO/RFNhw+RX+f/CEwo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGQ5ftF+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGQ5ftF+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so2424218b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401258; x=1784006058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=OGQ5ftF++kyUFfgoQYsVHl2bnZ1360VAktfNI9Ee+nv7UPCsOfiW7gGhncIJVuOU4O
         l3Sf4cmkyGSOHliZVc/RzobSzW5tPa+b69cVueZ8S7MHafYwY+9nlRTDQsU7aSwtOj2h
         fj5YiRdhb2Hsr/tnahB0NXwtknu803+dzZ4JErggc3EH3D05p98SOrj0dcak79EPWt0s
         wmm9Fn+IdY4Yvwck2yvEhyIuzCkpuk+Xsvwtx0Kw70Fh7dZpHTh51gkiLamec41YvwD7
         KiwiDr4FYI3GhnYjFz89y//d6sQAMV9IkhFJqEr0zcxoo+68i4yaq+SiXZl+pkG/yQPh
         eHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401258; x=1784006058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=GTAZveJ7uag1iaBg5huCL+SOjqkzmzOntwqlW9kR7reMFa3ZHQPjEY3WFOKfCUgzSr
         ePuUSalMTcprQPGu3dhADLc2FtVd0sgFw5KsJC0YFlUI0qUP+JgUUFVHcnt2wG/vJKtk
         tun0o1kFIlHGjULavmQEWvIL/0fhvlDPVr/KX1n5qmOZUeSekzsb5Z6HHOqC7nNFQkvs
         eg7ASto+ZqgsQGAs+LARsftPtlQRDmoZYjQp0X3rNw5zQ2Lvjpx5hF2U7VeagFFRepdc
         Ply9QngwVL9sBxveEnwUtylxlh8YWIQ/YuBdk9dY9+Dl7r6CQyo1YkKpn7mx1SXoRXlS
         4XzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfjKSQqqEZweMCMDMm92NYvRJzgez2zEfFghLBVdEeNPTkXnB9Tt++O1KQ+wq2/w9H/zZvuE/hy7x1wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPHcT5qUYt4fM3RAa4GI2XXwMVHvWAfU/lkIPGrxFYiEP9dtp
	zH09RDWS4uOfDYZSilkX29VVm/KLirL38HUgqw130rQNGYCecYgFhiqI
X-Gm-Gg: AfdE7cmVRgJunr5o3OdTrVie7TRYahDYa7yPr745tukL9w5RUfb5nfEMP2HxUbUE3Dz
	KNFQYRDSB/UWoKgbSaUG1whM+xqP7Tc9TQe4gVnEY9St3QVOvMAOTy+ybXNl1nihQh9HVuoitB/
	x9yhHEU2RD+6CJGaJyPqRWtFvS1mfvfsuXRnrKa6qM2KbjxpbCwzM0vx7bBoIfLrM2OqsDK+/Iu
	K5ac6RDrupPWScxDPeXfJv9n8YTV3kF7RfPy/5a/X7gNoL+WBw8AU8KEio15pTrSLnTDlCjtLcQ
	4UJDKVXbTMjHwuIPGZ09bJLY+ddGvyffTZcXNkJmNeeGQTFeHrygXwdXCihNuaHBhMn/rYFRnpY
	wAYatC1Os18hs7GJuVw5abmcUc8dflf5sR1NaYHdCbaV8eMs+2zGQsRPUGa0wGR211uYI8xosUf
	OX0NOVHKv6s6G7fN1RD85NhxZaBj6kKAYoAYDLGYeprcSKwhI=
X-Received: by 2002:a05:6a00:91cb:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-8482c5e30d6mr1620431b3a.6.1783401257954;
        Mon, 06 Jul 2026 22:14:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:17 -0700 (PDT)
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
Subject: [PATCH v3 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:04 +0700
Message-ID: <20260707051006.20058-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

