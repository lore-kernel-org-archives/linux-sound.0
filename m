Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE81302767
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540446; cv=none; b=rt5tWlSrZZoFMFeKRtKwtmiFwf2Fjv7Bpn10eWmlEITySgH11YlTMR2FFMmdlzo9ukYrylEgsq0CpmdVruXgIUr00iYcJg+qNIFZkLAnwh4+EhJaOQG9WE79C5DnV87m4RQzHMFPSKVaODE1KXMK29/5nVUmUCNQRTCuox0ckrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540446; c=relaxed/simple;
	bh=joz+wms3pUHg/C+Syij+XFMQqoLKDM6bsQGFGoWw5gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gq8yJa2Annne3AApMDQ58cmDBbjaWs/Liw85LIPbCWI0cdODsPgVG8KLChrkF+qIew8edxw79sRek7hosyFBtgSbmBD13b35U3mSp6ULwPJrT1+lLLbAy8N81GIjOyb9C0av9gTlEioVN1K+r/vQMwplJ+9tpblYzhlFAET4UVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nANwgIyS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nANwgIyS"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so2475809b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778540444; x=1779145244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk8VgK0lM+YhCfLjqnvtMsJ32QJ7ln+Af3MRsV8idH0=;
        b=nANwgIySm7RU9FmITCGgcxlcXdGdQj3BhR0pEp5fr/OcpQ557h8dyjLrRBGxFJRQD8
         tm5cLeFPRb+C8vpD0rdZyQpve1ySSSQ1Do3AOkBko5/HZj6Vj11Ctdo64A0X/fGciqZp
         oWImZxDJXqeTfCXaDdGdDuXygAQrYmIfZ5lTTdAxBtIBhIlu3v/VMhtWhQvWfXdSnpGu
         a072bgPNFxau1OoXzij/AazgiA8jc3vDIOBz7wSi+PNATdMQXkN5+cvkfLPiQqboyGoo
         ULAGqBiHgnHWLx4xlcrqkPkjKvawYYc2jeT1EhJ/bjqhiZ4QrsictuEWbWi/1f93P+db
         G8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778540444; x=1779145244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk8VgK0lM+YhCfLjqnvtMsJ32QJ7ln+Af3MRsV8idH0=;
        b=O7z4cJr3YpCOBUeHbt/6q7cVYh8yneHXm4EDPVVw//KrdZLYfI6GCXvjlTUMqogVZg
         nPJkc0tjnivlOAVPcWSHE99wr0lo4nQZhb70O6Ts/dIiKwO/9BHr98K6Zd7OeeL1hCwp
         Hvt6cN+epc8AhGs+IYrPVOPvRFR8hvs0rzEAjL4M+SDD2A5IAnvdw+myhfceL43SKmnl
         5H2t0tOmSxkiJbHSJqDJqCx6TLUMJqz86Xgw3JaWV/CSfajlnkt6moogkjJTnVgFFRXi
         DskFNrMKjXOqoNZIjNG4JH8j5L16jgiWWPEABzhjte7qSRcPdrGVYxRQCODKpVe4FKa1
         zK5g==
X-Gm-Message-State: AOJu0YyQQs/nsOeCHeNsIgEstP944iYDqjIs49nM3VAqzvRWDZPaC0IL
	SDNE/wSfQ7oD8JMxIpgdt+JRRMRbRyg7MenZTMTnGrV6HpT0KJZTxwPK60MeQmXz
X-Gm-Gg: Acq92OFbvd+OR3pB6Jmg1xUM5T1miIG5/3Hup+l0AM2kduCAzheFzu/b68zG5NxkiNM
	BWd9b4aJoVAMmFxAzrHYMD4O60hxyx8UMln8lOcYrHXb78DOcL0HhEqE3KBzhTWFUdvoMqpHE/y
	K3i55HUJU86P0a1T7sNnlcDkP3vQ2QgFURbpqzIspunQc83wOZiSWGZn7YGU7Wf1RTqqQ3VJfV1
	ao9ffg3RzXITkF6tMeKCkv1vpmUUr2fKgi2dn/PIDUpdh2D7kRSweSwPXkNdj5z/TpLleiR30S2
	6xmNLxcH3pqw0+AR4Ez5X73A5jEs0dJJgtQFF5ToEVQzJeGqRqWZNfplqPoEdzGIGr2YrKrmx0O
	bDdNOkKDSVVl6FVZ5jF1+6ThvTSy/zL5HsfNMceAQW1qqXc4ieY8K7zIA8lYs7JBKvTAeVPxQfb
	cpip4VPhnbC8mnGiVXWo4JgwVOLSLsSAL35rmcepS6vqczhsiSAMdWB/r+4Fgi3z52K6+7tjPVc
	H9ex6+PffC/IFKdvr2XlP0ZMIrsWwlQ8xs=
X-Received: by 2002:a05:6a00:3692:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-83ee8321af5mr1040515b3a.11.1778540443897;
        Mon, 11 May 2026 16:00:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm25987831b3a.42.2026.05.11.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 16:00:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: ctxfi: Use flexible array for SRCIMP imappers
Date: Mon, 11 May 2026 16:00:26 -0700
Message-ID: <20260511230026.28488-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the SRCIMP imapper entries in the SRCIMP resource allocation
instead of allocating a separate array.

This keeps the mapper table tied to the SRCIMP lifetime and removes
the extra allocation and cleanup paths.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/pci/ctxfi/ctsrc.c | 15 +--------------
 sound/pci/ctxfi/ctsrc.h |  2 +-
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/sound/pci/ctxfi/ctsrc.c b/sound/pci/ctxfi/ctsrc.c
index 326997bb885d..46dc1f509234 100644
--- a/sound/pci/ctxfi/ctsrc.c
+++ b/sound/pci/ctxfi/ctsrc.c
@@ -668,13 +668,6 @@ static int srcimp_rsc_init(struct srcimp *srcimp,
 	if (err)
 		return err;
 
-	/* Reserve memory for imapper nodes */
-	srcimp->imappers = kzalloc_objs(struct imapper, desc->msr);
-	if (!srcimp->imappers) {
-		err = -ENOMEM;
-		goto error1;
-	}
-
 	/* Set srcimp specific operations */
 	srcimp->rsc.ops = &srcimp_basic_rsc_ops;
 	srcimp->ops = &srcimp_ops;
@@ -683,16 +676,10 @@ static int srcimp_rsc_init(struct srcimp *srcimp,
 	srcimp->rsc.ops->master(&srcimp->rsc);
 
 	return 0;
-
-error1:
-	rsc_uninit(&srcimp->rsc);
-	return err;
 }
 
 static int srcimp_rsc_uninit(struct srcimp *srcimp)
 {
-	kfree(srcimp->imappers);
-	srcimp->imappers = NULL;
 	srcimp->ops = NULL;
 	srcimp->mgr = NULL;
 	rsc_uninit(&srcimp->rsc);
@@ -711,7 +698,7 @@ static int get_srcimp_rsc(struct srcimp_mgr *mgr,
 	*rsrcimp = NULL;
 
 	/* Allocate mem for SRCIMP resource */
-	srcimp = kzalloc(sizeof(*srcimp), GFP_KERNEL);
+	srcimp = kzalloc_flex(*srcimp, imappers, desc->msr);
 	if (!srcimp)
 		return -ENOMEM;
 
diff --git a/sound/pci/ctxfi/ctsrc.h b/sound/pci/ctxfi/ctsrc.h
index e6366cc6a7ae..7ba94adde920 100644
--- a/sound/pci/ctxfi/ctsrc.h
+++ b/sound/pci/ctxfi/ctsrc.h
@@ -103,10 +103,10 @@ struct srcimp_rsc_ops;
 struct srcimp {
 	struct rsc rsc;
 	unsigned char idx[8];
-	struct imapper *imappers;
 	unsigned int mapped; /* A bit-map indicating which conj rsc is mapped */
 	struct srcimp_mgr *mgr;
 	const struct srcimp_rsc_ops *ops;
+	struct imapper imappers[];
 };
 
 struct srcimp_rsc_ops {
-- 
2.54.0

