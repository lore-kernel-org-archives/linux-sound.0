Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1733A4512
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487422; cv=none; b=F/stgaFLRiwdMimU3WOqF8wxoEEOMEt598xJeHIjC4PWEpgCO1XJ1531J7qv6Ux6GtMm4ezbe3OQvD1SyCca84rm906CcFkaJR7D+nno7XKNnvFBQPXrGjo/x5IhsFDfPZB5LEKUL043+dzHi55dQM7JLEc/EWcxdV74B8mPG1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487422; c=relaxed/simple;
	bh=uwV6PO5DlFDznk+uJv/Pq9Nwi/vMbNemlLYmv9EURcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkCuIeZWOJT3ldJAD38li5LmUOqAmUMuO6WNyKSxevDdoR7u6E0uXG1uRX/86pHXe3P3HZD6TCM7r4/wVHIm+v6V/geTRSjtykFuboR2HxDUito5yrxVimPIWIiApiJtehMAJYq3rFFEkF+7cPUzSSeE6XGAYbG9aXAiwAEVdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSQSBq5O; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSQSBq5O"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso25400665ad.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487420; x=1781092220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihPu9yJ7cbZM2Z9enb1eM3sg+iZi8+aG7UspBvf/VzQ=;
        b=NSQSBq5OXVbkWTbEEbBC5mSfCx8Z4f3jBsj/yYBmEtGmIDY2GOdjulDkdBDy/AU0tj
         BYiQHnw5JdFwNa+Eb8TJz1gv/uxMqyO/OY6CdSRLdXxdsYo1nkgA5qjZQimyKwKyMu38
         EkWCRyusjMVJrYXEI0niA5rkDYbXbCEP52Xz6GW4oIpk0GGBEVW4razDARgmYskabDWr
         qWr7b+eC6IK8W8uHZ55rUWfSblSQSkwJ941w9YvVfvP6gjW35XvmNSQNVW68t82woTEd
         MNIfa/5SOfsf//C621I/M43qfs0yRK4ok/GUr4CMC+HtJ2n+vU4JvH/b8Hh42oa2sSgS
         pFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487420; x=1781092220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihPu9yJ7cbZM2Z9enb1eM3sg+iZi8+aG7UspBvf/VzQ=;
        b=mFeHUqOLVAjPWjJIJf2kGUduZJFwTS/TEmJcTUtLA2kCbSHbZEXL6uTkPqNGhUkEO1
         9m5uqq/aIee5TrAHAy6gixi2wSCJkiaiinUM6ciedkNC0V9Fc3s9anU/h7k3wLKxYwD7
         GAP1gNa9SBFgTlnODriTE319UnuJG43OXA/T98yp7DUyJmp3sglDSPCFckD1FyDLeG3U
         /RcyrYdKdTNrrYuVyH0pMjxs2T7FRDPwL8n5wV6a8LkZwO01X48eiOj8ee+JF/ingM9z
         EwGIQTLRpQ3gJEymdMC+R8FaubT8yuIAgMTm9tE28uSPyOSX/Km7xiggSsM9TrTcdzkt
         +VKg==
X-Forwarded-Encrypted: i=1; AFNElJ+qLy9QAuLUfsQsPmcKcECoT8xE3Y0xFD0iAFpIT7No1p95YemfS/uxKavE8nUxiMuW24i9okHLlFVqpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfiEXmNEE+pAxV1QLxzm7601GTU6bsB2FFrSePArGE2+tJfav
	arVtiSmeXk48dfc73qQKhAnzAl3zks+3EaH1RPRij6bINA+r7iyQF+T1
X-Gm-Gg: Acq92OG7et0SR6DXLqUglWh/QJSXnIyCrLFa2UjIL5DHkqvj0LESc8fgxjvPzlAPXV7
	lJwmFzz/BMkekTe1fJBVIUtYFzOzojB1tmZxhTbUbcn72lCFWfH0PhY8G7NQcD2LEOLW3KSCtrk
	AJYEOn67MAXRZ9s92+pR1M9QY+of/dd0kQytcyOcstC301mEXaus1FAlvF0AyAlc5ZR5/rUBPMj
	gLeN/KNAdDWIX8dNkXifMewbo6EhsYShT4szihDw81dynXy2nuKfEfY1bRtO6DbH9chOxNBLSfB
	PEwRhOvPprFtHg5EY5AEN1OEyLugzmSDq8Vvc6BDUtj1RAicXvSEqIs6JVb0WDKTkfIeEWnuhHh
	oQKuiNnNZsxZ3bS5BOnKBgAIYBokgs03RX4eSPb3hPmKSkWw6yhOKvOAQBF8O2L7nMSsnog19H1
	eLNoVw2mOK1uCYrqlNtOe99lDZi5bQ5dwRupU1te2YLyNoDC96t9JkKhTHLBpY1McZ0n6k
X-Received: by 2002:a17:902:f706:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c163fad884mr31227115ad.21.1780487419974;
        Wed, 03 Jun 2026 04:50:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:19 -0700 (PDT)
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
Subject: [PATCH 2/9] ASoc: qcom: q6adm: Use guard() for mutex & spin locks
Date: Wed,  3 Jun 2026 18:49:42 +0700
Message-ID: <20260603114949.149595-3-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6adm.c | 52 +++++++++++++-----------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index db0ae71f2983..44c268c3e529 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -92,9 +92,8 @@ static struct q6copp *q6adm_find_copp(struct q6adm *adm, int port_idx,
 {
 	struct q6copp *c;
 	struct q6copp *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
+	guard(spinlock_irqsave)(&adm->copps_list_lock);
 	list_for_each_entry(c, &adm->copps_list, node) {
 		if ((port_idx == c->afe_port) && (copp_idx == c->copp_idx)) {
 			ret = c;
@@ -103,8 +102,6 @@ static struct q6copp *q6adm_find_copp(struct q6adm *adm, int port_idx,
 		}
 	}
 
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-
 	return ret;
 
 }
@@ -116,14 +113,13 @@ static int q6adm_apr_send_copp_pkt(struct q6adm *adm, struct q6copp *copp,
 	uint32_t opcode = pkt->hdr.opcode;
 	int ret;
 
-	mutex_lock(&adm->lock);
+	guard(mutex)(&adm->lock);
 	copp->result.opcode = 0;
 	copp->result.status = 0;
 	ret = apr_send_pkt(adm->apr, pkt);
 	if (ret < 0) {
 		dev_err(dev, "Failed to send APR packet\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	/* Wait for the callback with copp id */
@@ -146,8 +142,6 @@ static int q6adm_apr_send_copp_pkt(struct q6adm *adm, struct q6copp *copp,
 		ret = -EINVAL;
 	}
 
-err:
-	mutex_unlock(&adm->lock);
 	return ret;
 }
 
@@ -172,17 +166,16 @@ static void q6adm_free_copp(struct kref *ref)
 {
 	struct q6copp *c = container_of(ref, struct q6copp, refcount);
 	struct q6adm *adm = c->adm;
-	unsigned long flags;
 	int ret;
 
 	ret = q6adm_device_close(adm, c, c->afe_port, c->copp_idx);
 	if (ret < 0)
 		dev_err(adm->dev, "Failed to close copp %d\n", ret);
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
-	clear_bit(c->copp_idx, &adm->copp_bitmap[c->afe_port]);
-	list_del(&c->node);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+	scoped_guard(spinlock_irqsave, &adm->copps_list_lock) {
+		clear_bit(c->copp_idx, &adm->copp_bitmap[c->afe_port]);
+		list_del(&c->node);
+	}
 	kfree(c);
 }
 
@@ -306,9 +299,8 @@ static struct q6copp *q6adm_find_matching_copp(struct q6adm *adm,
 {
 	struct q6copp *c;
 	struct q6copp *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
+	guard(spinlock_irqsave)(&adm->copps_list_lock);
 
 	list_for_each_entry(c, &adm->copps_list, node) {
 		if ((port_id == c->afe_port) && (topology == c->topology) &&
@@ -318,7 +310,6 @@ static struct q6copp *q6adm_find_matching_copp(struct q6adm *adm,
 			kref_get(&c->refcount);
 		}
 	}
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
 
 	return ret;
 }
@@ -384,7 +375,6 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 {
 	struct q6adm *adm = dev_get_drvdata(dev->parent);
 	struct q6copp *copp;
-	unsigned long flags;
 	int ret = 0;
 
 	if (port_id < 0) {
@@ -399,15 +389,13 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 		return copp;
 	}
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
-	copp = q6adm_alloc_copp(adm, port_id);
-	if (IS_ERR(copp)) {
-		spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-		return ERR_CAST(copp);
-	}
+	scoped_guard(spinlock_irqsave, &adm->copps_list_lock) {
+		copp = q6adm_alloc_copp(adm, port_id);
+		if (IS_ERR(copp))
+			return ERR_CAST(copp);
 
-	list_add_tail(&copp->node, &adm->copps_list);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+		list_add_tail(&copp->node, &adm->copps_list);
+	}
 
 	kref_init(&copp->refcount);
 	copp->topology = topology;
@@ -518,7 +506,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 		kref_put(&copp->refcount, q6adm_free_copp);
 	}
 
-	mutex_lock(&adm->lock);
+	guard(mutex)(&adm->lock);
 	adm->result.status = 0;
 	adm->result.opcode = 0;
 
@@ -526,7 +514,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 	if (ret < 0) {
 		dev_err(dev, "routing for stream %d failed ret %d\n",
 		       payload_map.session_id, ret);
-		goto fail_cmd;
+		return ret;
 	}
 	ret = wait_event_timeout(adm->matrix_map_wait,
 				 adm->result.opcode == pkt->hdr.opcode,
@@ -534,17 +522,13 @@ int q6adm_matrix_map(struct device *dev, int path,
 	if (!ret) {
 		dev_err(dev, "routing for stream %d failed\n",
 		       payload_map.session_id);
-		ret = -ETIMEDOUT;
-		goto fail_cmd;
+		return -ETIMEDOUT;
 	} else if (adm->result.status > 0) {
 		dev_err(dev, "DSP returned error[%d]\n",
 			adm->result.status);
-		ret = -EINVAL;
-		goto fail_cmd;
+		return -EINVAL;
 	}
 
-fail_cmd:
-	mutex_unlock(&adm->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.43.0

