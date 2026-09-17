Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F284DF4A9
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647119; cv=none; b=KH19Q/QGMBmzEgLWCD2zJu+l67klyCZo9pBlAufDOkRZ6HTww/uCYZNxXNjIgPdgEOY/O475KMD1Oj5JQEaBDxPoLZZQ+Gy45F+NAS/SeYNS2ubYDISev7Hd75BmbOz3kb7Q/TEBPMEkWUzQx3O92F/R0/oaWxlYUrIoH0BCgDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647119; c=relaxed/simple;
	bh=fgZUHsjC2iQqVx1aidjdwZUHIcyExmr2eJm26WWTVec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrpJwKhLUYdm8Vbp8zKWAcjVLvDPkCrtIUHIImoxYi9yVZb2AVJLUmLc82FM4SOlunzr10sfRjfVw72Z7WvCtGmj38UjGETzW36QEamxa00Q/fzJ2JPF1c95PUWUG/oCitrHxOPBZChBEfHA4HchDtw6pMJGj9LG9ZZN/YrALT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4JtS5Az; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4JtS5Az"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so537686a12.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647107; x=1790251907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3s7WaKRRlkRIaU7v5QcdZYP2vnYlxGT/Y2lUD7nlyq4=;
        b=g4JtS5AzYzBAAUYxUrgxf2xx95X2f+9qvHAekeOKqLx8QwYvqQGcvtuA6lXZnPoIqJ
         gdYpZxUaMTkt83FodoEMNrCzEDmm1+dlmZf1ii3DBL3UEc74CKrXqpkOqu84eH51Zbp6
         FF+snR0SKbAW33pf2olYU5DjunAqBkysDlO8N5zZ479EhqgqYPjPR7n4mHXx39DRo6yQ
         D4AHbga6HEmN0l07d8/jeitUF1mdXSDsJJGKV/hr0avGiS6MlYZmdDeEyvNxq83wNUTO
         6cHXZ1PlHPjpGcyrHT9g4uvQ7nEYE2Mwu9TF0sphjcrD2N0mRVX3EPKt7Dm3ABh97t6N
         SrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647107; x=1790251907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3s7WaKRRlkRIaU7v5QcdZYP2vnYlxGT/Y2lUD7nlyq4=;
        b=1gA5RR2ow4DVBUDbj4ZezkwTgPYl56myJ2vbarqgYVG6V+w36kfZXSv8/hWYP0yEKw
         6mfgG3sms6sJioYD+9zISyQ78BHRA6VZytMVEEJqb0PkfX1hHX82nmAohbj5KfsMUMdl
         d9tOgoRqNvTw6GxCfkvUfw85IbD6j6oTkcjK8FPf+G8NrlYAlakbyzz2+b1YMrRLuu8k
         Lo45yNMHZo/iLXeGLYjKnc+gsqo4xXXHSsCkNkVyBxsGwhzPP4EBnIZj1qGRAAhdUYHQ
         hjAMs48clQMzNZxZ0k2baUZNPUtp56mQz2hGbyTRtcXHhp1Xd1HjkbmtivHHK1+vDGUw
         FzTA==
X-Forwarded-Encrypted: i=1; AKwUvBwrFm4lql5tqEwmpTMFL46jucE6etZ6nByKwjxq+CFVRFb08Ird57N9f8CZ+AMaKy1ottVn7D5g9GbFkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nD8uokrhnqQP22OtYmGIz3LwfgGTS5haBfgWpFmye9BFRfrd9P
	CoF7EM3PHZX/bS245eO7SsEDi7p+61s6Qq5JqCEo9rGzdnTMXE5C+TMV
X-Gm-Gg: AYBFou1WSLswFnTDB5ZE1gAY1LJBkTw3zlE6YM1fuIQW5dK5Ldxe+PjbQGGpmFMNXX6
	+9d54e2FYUlzbi0lPjfQwTSbGewb06Q6eG2Jo4vRYvMOb/6w5nGG08622yo4L3EnuzxG5WpblS8
	hS9fz02tqu3XV9rVE++OgxF3Y040ZJES79zow54J9JS/8I6ypDQwee+ECrzBfnE29+cUBO7G+bv
	XbSpxmaoHJUAoIriAH3ZQdLmnV0tMA7wP04+A7uyd/7pShwR8NkLYpDv4gSqbLvfSFBtlJr6dPO
	Jk3DOjqAAZHkB73jfC9xsvwyVSTrOR+SZ3GlGCrJ2T29eq8FV97Ob3QeuKU6mTQcDFSY7ml21Is
	XAjWW4uLbRV6Os0vhUanF15ir2iFm4jAghMNS4jBRh95XNzpspc3941ok4jCrkF75a+lzzDLvGV
	vNz8n6Vpfww94URHKbxKHTubTS0yc80ZQryNlo8SVybop+2CImpiVjEZpAJDCYRDGGgfEUj5pQ9
	50XvwziDHGiTuLAoSzwO7Z1EsCtSxn95QNdBd3VHpkVXfe01pGKFzPLlrG0Xv21P657F/Ux5x/+
	WfqOsBbn47j1dRQ=
X-Received: by 2002:a17:90b:1f84:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39e1e45e49amr14658875a91.15.1789647106769;
        Thu, 17 Sep 2026 05:11:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3987cdeesm1219657a91.1.2026.09.17.05.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:11:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak on error
Date: Thu, 17 Sep 2026 19:11:36 +0700
Message-ID: <20260917121136.32527-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in fsl_asrc_m2m_comp_open() does not
call pm_runtime_put_noidle() to balance it, leaking a reference each
time resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4bc40f328f58..8bd2a144dbf9 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -320,7 +320,7 @@ static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
 	if (ret)
 		goto error_alloc_out_buf;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to power up asrc\n");
 		goto err_pm_runtime;
-- 
2.43.0

