Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7546AF32
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487426; cv=none; b=PyAQ7LHcykbiq7YUZcMustjG1x65sXgHRjvfgSxjl/h6oytvjWt16GnCT3hs89wMsFKpL7hhuzslpo03z8E/QtnIr/1+dfF/nNFSUlVttiIGICNSDyS7p+sLZIpz2RODjeyPyWWL4ImsGRqCVxZuGJnR9jA4qVND8r1PTpOwk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487426; c=relaxed/simple;
	bh=iRqMG9DN/p0d7WwrGgFPpJSCy0qf0D8Q2xI7Rv5LrNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpsX9nCHytxEZ6rd2pe0Tj/mvsgEdIWHB701BF58yFxoGEWgJCjg+h5n2QaOu8N1go8u3h+/A5crp/OexiMSnGkjdd26TBr0VCkwBITgc8zQo5aoBDQE3wBx4K1RzKD3fc4fc0u2rs6XXK/mMQQ6k6/eYWotH3T5Nu9CeKisn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyJXfKWt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyJXfKWt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso33859475ad.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487424; x=1781092224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEQCBEsoTa7MTlBM/uxhWN3Fk4N0THbIr2xqO/n6O0=;
        b=ZyJXfKWtBp2WSReas1Z8Nunop+OgkCNxXlO5eBvjJgIjNHwKJMqAyMc2ykSaIlxAX+
         ehQph48+Cxyc45kO9GWblw76vWHfAw+w5ayAz+i7EfUYxhynVC3rEwh6v08M2M5aXWnV
         Pjffx1T7gl/ea41nTZ1yTcokJTvKopxScF6zNygsdTGjfELkH3gvY18TFu5cQxzBNU72
         nVfcm5LFHZAM2cYo7eTRuOsSNr8uhL9P2iRSzIBhDQn0LqktPRAFr8tDJ+lTjArkFrgl
         wfiN4B+ZvTXQw1RTR1FcS3tq76KQx1WzR9ABx1HkWOf+PUdDViSWN2+pIZ0V7gTCcVpo
         3pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487424; x=1781092224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsEQCBEsoTa7MTlBM/uxhWN3Fk4N0THbIr2xqO/n6O0=;
        b=WG2eC27VYXmk+pXwi0m4EMXMaXQZc0C93IF1iI6bzatsPJKAdunk0NWnqU81vzlaJR
         wyeLwHwMecYt40+Lam5MOCtOk9EW87hzWAJBpgt5FsGyhODNee0OyAiD7IrgHmWAt+Fk
         ojsTZ7itD7QFDQcq3UasVM2lY8fVoJcGeweSXOhqi9qnf4NYMWbqcNsCG16dv2RLcO7N
         zS4tuEqVNeTMZ/B2e6doeCPfvMbmzVQ0BhwoHeeWhVCEVHYInKref1Txbxjt8TtcZ/b7
         HOf47zq9emT+CUo8y2hx9wOgkviqxVNoEVDMjJ8fpbNAI16jtvu1rOUpC4ejLh+DxhtV
         DtyA==
X-Forwarded-Encrypted: i=1; AFNElJ/AnJlcsypZIjHi1/SzFjZJwtEVNZDDh8HULilXDij624NMPgbnlwCxu+s2N9Y67mcAHnZm71HcPAUhRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hcWUy+h8JDMD0XrjC6+4TvfcH4DsQfkrC3d8FnVpkgVi0Iiy
	5dzQ1K3unv/3h6OwBMX9vEm5bmA7ztD9r3lKD1m4JH4xmH45AZzxyfyC
X-Gm-Gg: Acq92OHmHpiu3ZBj8SeCRTJX394d7f8dJ5ZaZ191/cKtcPPIAKR3IfiSVRzQVSwf35/
	1q6gOByWaC6mBwCTVPfJIwf/XNHUCtb8Rh5ZM/Qz6XZlz1CBo7BuWql3ZGxRYw8x58bvoyfWahi
	Phdp7YINDGUscabIbXxmmWsmRYzAgJ1ajb9d+6yTWwM4XB/q/bbTSYG1OOKmuGcq3hSy367vFvr
	i5yVnUjGqnSet6+jVBj45IeQoENiBwjzkKQcXH1Ig5i3RBFwp+Oiu/BgJHmTq0ZndLl/3hoQ/Ox
	nzwe9+RptuDJnu5+tezxMKMdg6MRQuffYq3hMIPLGf763BLgYpYZryWTp7dKshMuY/mY97z5KFo
	0zs5T09vbT2b67L86vIZ2Kg3gLQVcb1gcwJBnrVStnHrkEzX8VJumKDN8+VovedSpURpzSLobwq
	A2sQh1bEFAjmb4/OorD+7T/CC/yGV90NmGz7Yx69or8uWtlRRG1MfqTLzwNpbzjFfhaHlT
X-Received: by 2002:a17:903:2b03:b0:2c0:b319:fb43 with SMTP id d9443c01a7336-2c163d92b07mr31337955ad.21.1780487423940;
        Wed, 03 Jun 2026 04:50:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:23 -0700 (PDT)
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
Subject: [PATCH 3/9] ASoc: qcom: q6afe: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:43 +0700
Message-ID: <20260603114949.149595-4-phucduc.bui@gmail.com>
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

 sound/soc/qcom/qdsp6/q6afe.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..81a93b6f7e4c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1035,7 +1035,7 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 	struct aprv2_ibasic_rsp_result_t *result;
 	int ret;
 
-	mutex_lock(&afe->lock);
+	guard(mutex)(&afe->lock);
 	if (port) {
 		wait = &port->wait;
 		result = &port->result;
@@ -1050,8 +1050,7 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 	ret = apr_send_pkt(afe->apr, pkt);
 	if (ret < 0) {
 		dev_err(afe->dev, "packet not transmitted (%d)\n", ret);
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	ret = wait_event_timeout(*wait, (result->opcode == rsp_opcode),
@@ -1066,9 +1065,6 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 		ret = 0;
 	}
 
-err:
-	mutex_unlock(&afe->lock);
-
 	return ret;
 }
 
-- 
2.43.0

