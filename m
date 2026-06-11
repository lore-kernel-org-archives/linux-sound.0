Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6533F1AD5
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179209; cv=none; b=iZN/k0d8vBG3GeD7ahE41LJmBKnlu5jAau1hnpk70gaF8UTpXEEqopds2YNILd0zjBjFRAVbUKuqIr1N3MMwNzXydNGfSqEfdu22vYO9TtmuDNc1gTYpoMB5feEnp7wuDa7CcuZ0ZfPKXSsPg50JWXNdIkklxngEMdpJfAaFU6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179209; c=relaxed/simple;
	bh=/pMsozAw5t64IhZvPeSu9+knelGnYn9X8f8LJEWcYXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAFFxBuv37GeHTt62nSa3VzceJhek+1rYBCS9/nEOEV39EtQz4SVD6y5IQfMeYFv8ty3lbpfiEN+yTdgRD/xNnyV9+78b5p/p0WRkJjAVSDFMcwlCQoz9iVAkvNaRpy/q83oyTMHFRXLSD6OosFfE20Q7WZBiHn9FJULrgvy3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBRAPKTF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBRAPKTF"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso4763265a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179208; x=1781784008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkbxoNn4WNxkjS5/r1uXoZrf6ghpdxnhO13yVBKjavw=;
        b=DBRAPKTF+DdKcxiLY/k65S+utSopYH2ZzAQ+PgX+8N2nlIRsDWG5n+c4EiPd2b4anE
         U5pYfoRSfyBebsJzHL26A8nT5gQjfpXEsaAiyZ54QHAOhMKzEJqIK5TJdeuL87tem5Gc
         197cJvD+vsxlYMWPbn7002tRayo4+Y38MACK5DQwxw44pgqlH5VT9d6EU+wLQdhmSq0j
         niYT0oQE2qR7HRe79qQzAW5n8bHxIgEgTY+iXUNYKfPDd2ZHTkr1Wwjk/aoI4tfGeICe
         hZ+sOTmGxmVqCFjUaXQYzgBewHwHsi/u9KGdWMrH1Flxy3VwcPemTAuu+SQdwURiZx0b
         bveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179208; x=1781784008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rkbxoNn4WNxkjS5/r1uXoZrf6ghpdxnhO13yVBKjavw=;
        b=XvBbK3JkoXzwUPxfQrZUb7dW5ykP8cz2ET9CEA+hRlT16DnMo/GbOFahIUXjyrqycx
         EkFWhbMzja7qJgSk+ySjCFYSQgOeNqYP7mF2zrfi15XDj4wnB31ml2QZ7O+kAbzdpel1
         Wm0JCcitAVNUNfU62mT4CHnG6A2yTfE1x4HfX6hknA4FHy6smGTgHDUF9HZGXbWIfcFG
         kdn7LvEUydiK76ccFEjcRWnVPK9aXbUWstFvxxPe5YxggsSiGTKfEeKT766DOjtQ6cVL
         DQ08Bmm8ToaxJWHZz4netzscLXF5cCH0BuIVH54w4Oaak5hjZo3hMGrXMGMCPXNDiyPz
         j0wA==
X-Forwarded-Encrypted: i=1; AFNElJ/iuCF13DZZ0fJbb4x+0fDrLhICIr9QqVYP6nPnMorIllSd6diej/Z4HXzXd3wlywP7CX/tTH1avueYDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5GNfLR0OaXA0JOo9L5KDOlOYgHQhRIeiPUWO1f3no+qRk077
	vkE3IEC0cTIjb7Iq1CqJzBkw18zyi6e+QKHZOutm2hJ0xHGCIF2ruInj
X-Gm-Gg: Acq92OGZjue29OkatjWyGv6boqXzN6m98eNk/RRnaAO5Ia79ER+bikTEC/uRLawJnIq
	11PExFAI170e63PdNgeuCMXGje0BY2X6YXp41cQj9v1SaOJm9MNNbCqz7U+QTXCLRrcp+2/8U63
	hxMotCXSxMWy0Iw3iWhALwpbONOfj2TdbBnVN6/BEflIk6a73mSc0jt+vPFGIsmvBb4oUnHu5wh
	VbRb4oMHHnqShjNLBRfi7Q3/o6rqkTWLsVD8JueAFlGNTKo1jLkn/+UoQm2o1iUQuzATZy/s3AQ
	8TovxI6ulbFmgX/62RlXsEgXn2mfMC+g4r9TzQRmVUXIdV0GwOm9wDt+GfDtDtJZAAJ7RcULIYC
	NZ2aMvtPJ572lxE7AIWewNZK4TCpsyZLs7B9J41stGeoRGMzqY0Z97lI2rhu0uOww/BHWkBrgXQ
	RYlQXQV4V2cY4aciQWvSaMgh1/zQ2lUJkG5p0cY3Vg8YDgb+M/kC8Fum+B2lz5PgCRu/iv
X-Received: by 2002:a17:90b:17c7:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3779c380747mr2924671a91.1.1781179207965;
        Thu, 11 Jun 2026 05:00:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/20] ASoC: Intel: avs: core: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:53 +0700
Message-ID: <20260611115901.80438-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
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
 sound/soc/intel/avs/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 1a53856c2ffb..894981cae94b 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -135,10 +135,10 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	unsigned int res = -1;
 	int ret;
 
-	mutex_lock(&bus->cmd_mutex);
-	snd_hdac_bus_send_cmd(bus, cmd);
-	snd_hdac_bus_get_response(bus, addr, &res);
-	mutex_unlock(&bus->cmd_mutex);
+	scoped_guard(mutex, &bus->cmd_mutex) {
+		snd_hdac_bus_send_cmd(bus, cmd);
+		snd_hdac_bus_get_response(bus, addr, &res);
+	}
 	if (res == -1)
 		return -EIO;
 
@@ -273,7 +273,7 @@ static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
 	if (snd_hdac_bus_handle_stream_irq(bus, status, hdac_update_stream))
 		ret = IRQ_HANDLED;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	/* Clear RIRB interrupt. */
 	status = snd_hdac_chip_readb(bus, RIRBSTS);
 	if (status & RIRB_INT_MASK) {
@@ -283,7 +283,6 @@ static irqreturn_t avs_hda_interrupt(struct hdac_bus *bus)
 		ret = IRQ_HANDLED;
 	}
 
-	spin_unlock_irq(&bus->reg_lock);
 	return ret;
 }
 
-- 
2.43.0

