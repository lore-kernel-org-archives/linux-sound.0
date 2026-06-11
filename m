Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5493E5EFF
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179214; cv=none; b=LHFEqpz0lpWjHloO5q0gISCaEXpFxwf2EyPQgwggvJTmlXxM3xAKctrxJUt9i1tWFwkD3D03jaHSdtVBJjJnCVdlqjjruhM/IQLPQWl3P2AsXBX/F2HK2b3OYa22oDhqZIEq9QjafJo4DhnHLLtfU2gEd77U5hM8TlysjuoHZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179214; c=relaxed/simple;
	bh=zYyKKa73KKF8xCOLFXblRk0t84XuS6KhxtcPfYA5teY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ex2J2IvdjdbzK5Wzx45Ord/RNKXo7N3jqq9cXHoDmN5Gt5kKOiKi5NTW9tb1uJlGFo83yPulXFsdt2Vkf/EUkzqWqvNoHkEQXpg7NDWg5SC0AT2co3zwjxDtALVAsdRX6L9J4SnNPNiKJ0fWh51t3K5HB+C+jYK9kNYH42vrd0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcEfuJMP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcEfuJMP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso4666799a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179212; x=1781784012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqjLRRgUbJ6agBsQpVAexnxF8KvCXw1CMp1PWuoIyWw=;
        b=ZcEfuJMPUg2dl9u1/ReCDHJxqZC1fXSzXtxLUKFKNJmK2EOUJAguECG95cH69UAPOr
         IW6ztGCi3T3jxSsgrlhEP65Ajp4iHnk7lG33R3C0RM+aRzvIz9v6gFa31Ljcla5atbLb
         UBeWAaClgIg7iv1y21JsglIplZd30C0xlntRcZ6b5A7WUZWXQgPNr988O9vxdUybCSM+
         VAw/yp5Vxpju56CC7MxD0EyIxko7kXT4TgOj9si5uPrIT1gKaAdGldf6qdm3O8nlqZ8S
         R6QfViS+y7iq8yI+P4wkp011l8inP5JFZ8O//7W5S3n8/M7CijyCWAYgjHAbm4CthOan
         drVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179212; x=1781784012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqjLRRgUbJ6agBsQpVAexnxF8KvCXw1CMp1PWuoIyWw=;
        b=meeI8OxGMRu0tl8LXf9U+vujZqiagfnwLP1O1qLsPu9TBb5nc2cAKBJ3NMKFkTB4kM
         xkmvzc7+MpylvjZ14pilvSj6RVXak0UBGZIJy/SwK1s0dzUw/xXdn000qWuKtW029YES
         STlrN2iXgGS5prJr1ivg+o4ODIDK+Ikg2LfXOETVLmLQoff3Ew5U4ShuDS6+6rOEO1mC
         8GFY3gA8x85mpL3+T0T3h28RNFYW1gXmDixZLc7g3VPf9o55O3jUefXybq6I2jnLCMDq
         tGwd1W2rlfF3CfrmspYxZ6JOQfhAnKOKcyiV6fNsJzMCzknysmOX3vn4MjOjhSXiqhyj
         lX5w==
X-Forwarded-Encrypted: i=1; AFNElJ/LPt8DZiDnhJFJNOX7DDA5nmDrgraW5BM+xe4WJJuuqp14LcHaw+YYpb3ozCtZnWJCxragVIULpQuKsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuyETZXb5j9o2CBanSLY+UOIbfxoBmaTHXRw4luUWUqSWFbijg
	ea8KzzqMjMfytmkNFwPMv/ex0K0uyWGMMfub4kGwJL1R7LjhH1Ik1u8Q
X-Gm-Gg: Acq92OG4mapcRRHPoXypmB19faf6zi6H/fudPropzHVuHyj3ar+vLjbqEZsgDgRi7g1
	yxtP4JvdZHhqSscjhLOwzozc44GfF6Xj7isoCaTkyU3fM1gIFMU0qjn7weHDOAIxc1Va0bX9pEJ
	UqeZ7La3aiEHxDfSpM2+jFOtw3IABo7o3d7axK0NDfak0edIjJviJude1yn+UWnc4GatFF3+/VC
	PvfOjBRMbDEGkMCoKgQq3SRMWroxhttQXVkU1F5WcZ6H2naGg06UYW6TxhLqcDgr6ko93B2w3Z7
	ojGGMJPANyLScm3+pUlUJHtWHA723+xXm5VO/jzng403GB+/C6cV0KgvVJYum/yvi528dobpe81
	B1q2qcPUxi2N3nfJfgob6NnQWPsqbBCc1Rt0H/Qn8h/eoOQntTifEXpTBazSEVJalMpF17IMXtu
	IGwaT3S0n3vqO4o6TI4v+uydxC+IC7IdAACJolvjsUeN38YMQt0lGnQVu/ak3aUhbJlsVT
X-Received: by 2002:a17:90b:2d92:b0:36d:8f51:fe29 with SMTP id 98e67ed59e1d1-377a5ce84camr3134814a91.17.1781179212028;
        Thu, 11 Jun 2026 05:00:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:11 -0700 (PDT)
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
Subject: [PATCH 13/20] ASoC: Intel: avs: control: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:54 +0700
Message-ID: <20260611115901.80438-14-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/control.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index a8f05de338e0..370069247a7d 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -27,7 +27,7 @@ static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 i
 	struct avs_path_pipeline *ppl;
 	struct avs_path_module *mod;
 
-	spin_lock(&adev->path_list_lock);
+	guard(spinlock)(&adev->path_list_lock);
 	list_for_each_entry(path, &adev->path_list, node) {
 		list_for_each_entry(ppl, &path->ppl_list, node) {
 			list_for_each_entry(mod, &ppl->mod_list, node) {
@@ -35,14 +35,11 @@ static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 i
 
 				if ((guid_equal(type, &AVS_PEAKVOL_MOD_UUID) ||
 				     guid_equal(type, &AVS_GAIN_MOD_UUID)) &&
-				    mod->template->ctl_id == id) {
-					spin_unlock(&adev->path_list_lock);
+				    mod->template->ctl_id == id)
 					return mod;
-				}
 			}
 		}
 	}
-	spin_unlock(&adev->path_list_lock);
 
 	return NULL;
 }
-- 
2.43.0

