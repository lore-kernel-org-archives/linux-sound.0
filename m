Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC143515CA
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782508; cv=none; b=EhwzhyyRPFRCEpsHVHZZdIh7/mhbJFhgwfb8oCDY77QNXife1S1e+4VAf9/qBYEnyjHkckfbWszEPOR30GHSwGIlH5+6hwqtI/Yz08C/ADUMJ7NOFNNtHxSIWYdqlyGR+TRtueDurunuP84n19K2s/iVY49iX9GvA9QoCEreAPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782508; c=relaxed/simple;
	bh=NTv0dA4h7p0NtOycmpwSiKJMd8uSAN1UAwPHu17+jvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXlgPynsQWOVT0Hpl90mgsVsfVv039nkWqgYeenHJEx1kRghmtojUpoCKVPEJXVUGaQbSWkgewlW9odX2J7VOYuCwLqk5t6qNJinmt/tVQxVUNKZB9BqFPMLVjQnyfkTK2n8Gt6hWHjCIwBjPItLjTLyq2Ry74ytly12lD8ziws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFcLHaZd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFcLHaZd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so2178865ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782497; x=1785387297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=kFcLHaZdR0ne2qKvy+TrDj0vmXVLoGXnP3l8oQIKcUGqpbF0RN1S4GnA9ktfrWPUER
         P47Qc14VuN/oKey306LnkMMcJko3uJEi4WPnNhb2D52B7Dd3NaGReduWSVcttSD+jE9G
         /oE2L2k3yJO1vtgWZfLMHaJP59N2+Fp3vQ7MFaEr55ARDEo8zDBh/pQIw5hfAEm04jqw
         Nn9Nb9qGFZU5eOv//Vek46aSVRmiN9e/i6M2XTlp8RdHCcFCAN0s345PhZvEVJwt1ere
         AT3/4KQvkE9RRdGd91Z4N4wmN3h3YOF928tpZcuq8fD/oYfOyL2iR1TZsrM0l6QY+iNb
         Z+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782497; x=1785387297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=BIdB++ExmAyweKabG09Zs8BXa6xGxtv5r6rhuPYbBpnvY+5KSfvOl/xxcKVRKTb1NX
         TxgsYV/uFYxOYwU2EXjPQUGivYG8U06ZAaydspP6AAyq14wYlKwoiLYbZV/LiWgTRn5R
         a66W5jUrf+AIriclxKec5T2ISPW8LMoCO5aWUtsQKLfNSDizmE7oWRhmbEUMcqMTvibQ
         DI0sfIMTi9D+Y6uzkIDOidMLs6AJZ+pe0V6wFPV3fIw0zhbLoLsku+xXTJrjNRvfptVb
         /gbFdJi4xaa6j+2xbrVxsyKNjKWEiK2HGhd6/RcQ6Y88TOcgqYUtnxKdVXao3vRsPEoy
         wAfA==
X-Forwarded-Encrypted: i=1; AHgh+RoKRCMqmqhP99hZLbSSG4Ec4rcZnf2RvKkGNBmKXJmdnmp9WghcVFNEJzKntVZvxsmIv229pgg+9D1RfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqza7urWBKOmM1SE34scsei9cP7e6mLaQ6FR8dnZ37BmeepcrO
	e+N6febcJGp5ReWZKLoc0kVnwRiOad6Pr/WNFTcm8K8DfFQAB9eSV7CE
X-Gm-Gg: AR+sD12Qhvd0hLt47wguiUWsmxafxnM+1XhVQakOXjiyPCvlexYtD9MqiOqP8CSo3kz
	5VHi83GB+iCnI7CTRQfy7NhSKqpBhrCU2lqpO6mp8V7Aeu4h6gv6pS65cs5hO2byIr7oF2n2ATf
	7ckwhbzAltRCX5Pw5kTGjVhZIYlfKxpIEw941MoF4btvTf02edu11r+p2b8/BTiHX9sAo9J34l0
	dQKlrflb9Ig0LIPYS417Q9yUdbvwV+dP553SHBI61AZ6ZzISEM68neDLvjBrxs2d64vpmk/Dp4I
	D+/1mmPJK5XXHlH/lZ7ih/dGPZLlTnLfc+pk8xYSjDv6+Lpb+SfO1pkOkc/gqwtLCSwdXFYa35W
	c3c0UuOLxSbEdBwgna9X9sT//q8/lMGhD/eViVQcOPc9UmhnumKfC8VPCvUA5ddk6Hn7M72IfzW
	Ol3z8Jq7gyncTJTjovms0USTs0Dhae4ykEMTDi
X-Received: by 2002:a17:902:fda4:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2cfa6b999e6mr19255985ad.20.1784782496893;
        Wed, 22 Jul 2026 21:54:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
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
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/26] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:11 +0700
Message-ID: <20260723045327.28260-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/twl6040.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..650836f9615f 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
@@ -273,7 +274,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +282,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

