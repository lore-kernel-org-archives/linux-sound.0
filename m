Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44E46AF0A
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487416; cv=none; b=CgjYgZC1G4ezMRj/p2oiCkieHYw1k4K37e8d+53BZ1O+os/spGunP+n9hWi4vUC/PkKDqccGrkiuK+vbq1GhBFE4AYCjwV3kTGlQowOZjEizdjjeGkrdCKZRAwzcZ0Fx5qA6Y36cwr7BUzkFiBUfZYciFg4rzlQddMZFnCe6ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487416; c=relaxed/simple;
	bh=9geJzNgf+WThNkg/OcdRMOvKScGM8OBuCVL+aiam9IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbaP+1R9dTDwwpUNbMFsvNImVpyd99RggVXAOr4P75gUdB3h/Ul2I6B2YpnOWVBW5Vtfyp8P7MChbl2BSaRetEb74SQ6WJr1AAoS+tnnL8It0HdJ00Rc2+BoLBZj+VDBM4WCO331/o2D5ddWBrIuKN3cq3GBKYvfqd2FSJduHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRx9x5wz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRx9x5wz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf30d530bdso51858405ad.3
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487414; x=1781092214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pqU/kQ2HBq/qGDKu6bV8BUK3iXPtSyo8YwmhrKH15Y=;
        b=bRx9x5wzr5SVaeGqC02tnz3gOVViL4iKUMO6Qf10T5p8CA7XIx4vn84s8fCRS9qMCu
         UTGyWjnGate6VI9QrRqzZlHC2o+bFFdiYiSgN8Y+IlOcTcXHAX6YdLlGyb2gdCgqRlmQ
         6HD3WbyNhJO9tPMcADWWTL3Q0QYCkLsnrhJiC+c29hnAqv0GmQHVP8D5aJJzPi0Rhfq5
         cQ3rHpujGvlhQVeV05qnZYyPLZ75XjeA/uAW2bW/mKTN/Ec0fRFsgivJe3jBsCM6Gcw4
         in4zVQelXx7TvZ0Np8g/ugl7wblRJvlNC1QKm0SWVbCKFCpa+bSFmMgh6ZUx/qikK3BG
         lQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487414; x=1781092214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pqU/kQ2HBq/qGDKu6bV8BUK3iXPtSyo8YwmhrKH15Y=;
        b=VC8pI/aNfTOFBp+csE8Oz/6H374Hjlf9QEphGfstgsDl+X81XrmLqjv0bC89eKZv0i
         1U+HUOhl0OSFkaekR5oSsKflZmtUr4ZuCZvW20BWqvoH5cOgzTb/SOmrMYHSZQtZk9co
         i8Puy8E0je/BND66RhppaGCqZIOrN9jRfNyqsaxfBOLYlXDIJER2y7N9mHTRk1bwwdeY
         xjk2eOYp+q9lqiED64yRWSEhXXhw8a8Tct6BddjLc5ExSpX4UBrVdETFPruOcNbxzGuj
         f89v2UqzkzsvMUIOh4LS83863LMe5W4P5agYj9YgKSG/TQxAT9SYt/xeY/GknuWd3mOr
         yuuw==
X-Forwarded-Encrypted: i=1; AFNElJ82MqHisW1VL7+X0I05L5vtvLzj2oUDuY8EQlZgi+2oPGuRE4DpVh9FukapIqhk0jvcuI4kWrBYRyWPhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8DOft0il6KHbetrtth2X3u98VCSdvPp2JlBX4qf12R8XX+gtk
	t9iL3tiB8HsAV7zkMboCwXM0F+q4qGRuFrbG5zpi7Y4DMhih5vkXFQBK
X-Gm-Gg: Acq92OFliA2j/1Nw3uOKK3huz+xiRFISa0SGvhgDXMXTmdmkPVb1qKB8XzZTVA2oZkH
	sLhg0GeSzAARgOUIfAqa51QzoGakhpUvJgwFgp3rn5FfkTEkDQLcEL1V09tmhYwv8c3C/KmPHgM
	/XX7kA5GAajcHxKHfwdfytcLpbcnqKNUMBDatKmljjvrfDVknpZhgVFEeQtaYyu6qjnZzwK4oSD
	4IEmKr2CSz76qJ+rMCC6BDqXe98GVNV/0d/xG+Xerdc5GSAtw6sDgooHXIh4tnaL70UbVlWTf8H
	tgyKJvq53bReagYh4NDS7iOPHtLVwGKajKJ+IWJysLSlaChOMrpWKnS75JV9+LLd0NQwHr0PQi+
	78ea+HLD3n8OGaHaqDJk2edOR5hjpOfG4y8XRyNx0GdB2jqlkO3g+wSJBT4VhsdQC6yAgFb2JMz
	Jr05wdthzsjt/gRlr3F1pP0tyja5+Og9L/hDecW2ykUwV+nb9VRwzrOsnjWtaFTDk7cMWW
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr33614925ad.37.1780487414015;
        Wed, 03 Jun 2026 04:50:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:13 -0700 (PDT)
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
Subject: [PATCH 1/9] ASoC: qcom: audioreach: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:41 +0700
Message-ID: <20260603114949.149595-2-phucduc.bui@gmail.com>
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

 sound/soc/qcom/qdsp6/audioreach.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..8b3d1410c788 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -585,7 +585,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
-	mutex_lock(cmd_lock);
+	guard(mutex)(cmd_lock);
 	result->opcode = 0;
 	result->status = 0;
 
@@ -597,7 +597,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 		rc = -EINVAL;
 
 	if (rc < 0)
-		goto err;
+		return rc;
 
 	if (rsp_opcode)
 		rc = wait_event_timeout(*cmd_wait, (result->opcode == hdr->opcode) ||
@@ -616,8 +616,6 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 		rc = 0;
 	}
 
-err:
-	mutex_unlock(cmd_lock);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
@@ -1387,7 +1385,7 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 {
 	struct audioreach_graph_data *port;
 
-	mutex_lock(&graph->lock);
+	guard(mutex)(&graph->lock);
 	port = &graph->rx_data;
 	port->num_periods = 0;
 	kfree(port->buf);
@@ -1397,7 +1395,6 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 	port->num_periods = 0;
 	kfree(port->buf);
 	port->buf = NULL;
-	mutex_unlock(&graph->lock);
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 
-- 
2.43.0

