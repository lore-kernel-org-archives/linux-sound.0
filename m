Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C0472769
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487436; cv=none; b=buKyIEhiMZFMf7Vf8eDwYWSdQSGaHcoupbPxX8jMQO8fnVhvTyBBQDBtEUTh1Wif8Sfq66M9qvFc+13QLYBOrdnnVGcCUIiWAscSawS4szgx1s+cJNzDISYCWNLPlpumKe/i7u3KbAPUkY1+txPAB8v+V4XjVqiHgfNSNWDuIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487436; c=relaxed/simple;
	bh=7vnU2lZPmEEMRduMSMleJemI++ozaYm06y7NJ1dlEEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG4PRZvbxIuHT8VjOmrzfQOaY2ih7HyDyUX7+e8z6o5pegJQQ/FObXXHaK0A5Zcs5KIWxQ0gX6Bmfew+a9jmeMdO7UpBgDXcyWBdDlCsT3eJ6dQ3aVPGJEJnmqVtQhX66xvGoTTvn75LXXrokq6Eq5+jLYCLpZa1xT20s03uR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7OQnVIe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7OQnVIe"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c858961a8efso1587607a12.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487435; x=1781092235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0+OuvvQkl90TmM41S9YQoe97Z4NvBQ5dxCyjSxljyU=;
        b=Y7OQnVIeQ4P4ksLaktt1cMVG78hDlR6Fog9+JLxYhj3WWygUEAEv3LpCVEKaX8DxQE
         WK/7/Rh+u0ny9eAn/GIPyljwy3ozsHLrzurc+zBEVk1SeS/ShykBLNklSezEADet33UH
         l4u5Iwf90OgtBdXc9OjDlf/oaJI6gBrIGn5N6U8EuHK1NxnC+2ph2Qke45Cj/zhK5dS+
         j5ag/ko/axn2wh0kD6AofQeHPDAGZsxpULTdrqXUhvRcv10vyusyg0Nml099bt/P9AWW
         nfZ68S9MlkeRqcoUxff+fRLufl+qgQYVPH2jzpkSMkBid6vprWtgcMY/B9giWglLue5F
         JBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487435; x=1781092235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0+OuvvQkl90TmM41S9YQoe97Z4NvBQ5dxCyjSxljyU=;
        b=qiX1qHfMxZNJ8QAuxR4ltKkPr0y42DuRY/2mm+/IXFKwJj475en0wzhiDyhODfXgZl
         ert9ALc5OF21LmtTPRD7d3H0donw2HOLWtrmHUescCx+u8ZP2cLWeIAOJjlah7gaRNym
         Ou8myw36AkZmCyiJtBVftN/LGopuegppHHHHKkqu38/qygoRoWE1UQ0MfnEpkCEMevhl
         G+DQn++1t8PGj4oQVnqC29XGUFoAO2Pzz4CvDfkU+gbolyiPCMa0KtUPhB29rjAnIFpc
         PUzo9PjnjnRj3uMf5oNCPLBA/IvGnUmli89Y9k9uzXiG2QKOWFw93mH9Vt8XTnhahO2P
         h5bg==
X-Forwarded-Encrypted: i=1; AFNElJ9bsh4O+av1RnGmXEzzeJ7rTtsJgL+R65d4kUCBK7o7nZq00r1pgpNi/pEeLxsTPI9UhU7jDEljP2hB3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhDwz3szdu35CBWzlCPVfNDaPiOZVdiX4JlHe2GNLON5kFeMQ
	pjqFG+FMgKWyAP4hpZ+ZVx/CmW5wOOGEx82ewKJP8rz5s05tgMolJ6zp
X-Gm-Gg: Acq92OH+UclSfIX+Ybs4VTUKQ8xcdOWjMEtDEpfE6gWyAA9+vgA5jngCp6/YLEoAZtS
	KNbaU1kRqhdJaqkrZdzoypWwN9tNQOwKQTXsXoLYXZvikQIlP6APbS17qdLC1YmvGUXxNrDsdkx
	7CRBAICoeUl/tMJglFsWm/VLDnIs2Qzc+pKKPrIbdiJIjoGILZaeAYELED/Gg8Y+mqDYEE3Cu3g
	XkeBuPnRzjA7uZGx4fQxitq4CeBy1oiyD96gwlQH9sjhG8sJjrV/a6B44AbbLfJpHtLv45GRVfz
	U+VRG0yZWUOTINbCdipjs93VQMkC0Tt+/4ILuaiBrg+MGfAHq1dtf+TkjXqbRvWCXzNIS64zyXT
	Y58a/Tuo+Llnx7E4PzpKmWRUQVIkoWHbgr1mC+NAzLnxJZJpCE1it+38jIL/dxXFP5MYHYLgL9D
	+6k0SMUBePXyxRmw1xw3uUAm+Fm/nHCuMeg9qcFHk4HHU7PfSeLz277YtDJFGAa8XYPXgB
X-Received: by 2002:a17:903:acd:b0:2c0:bd76:cf18 with SMTP id d9443c01a7336-2c1646df446mr31681185ad.38.1780487434906;
        Wed, 03 Jun 2026 04:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/9] ASoC: qdsp6: q6core: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:46 +0700
Message-ID: <20260603114949.149595-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
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

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 48825756a7ab..99cd4ea821a5 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -252,7 +252,7 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 	if (!g_core || !ainfo)
 		return 0;
 
-	mutex_lock(&g_core->lock);
+	guard(mutex)(&g_core->lock);
 	if (!g_core->is_version_requested) {
 		if (q6core_get_fwk_versions(g_core) == -ENOTSUPP)
 			q6core_get_svc_versions(g_core);
@@ -287,8 +287,6 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 		}
 	}
 
-	mutex_unlock(&g_core->lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6core_get_svc_api_info);
@@ -306,7 +304,7 @@ bool q6core_is_adsp_ready(void)
 	if (!g_core)
 		return false;
 
-	mutex_lock(&g_core->lock);
+	guard(mutex)(&g_core->lock);
 	timeout = jiffies + msecs_to_jiffies(ADSP_STATE_READY_TIMEOUT_MS);
 	for (;;) {
 		if (__q6core_is_adsp_ready(g_core)) {
@@ -320,7 +318,6 @@ bool q6core_is_adsp_ready(void)
 		}
 	}
 
-	mutex_unlock(&g_core->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6core_is_adsp_ready);
-- 
2.43.0

