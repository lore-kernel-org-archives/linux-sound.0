Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181A3F0774
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179205; cv=none; b=eOfRbfG4lJohlkm9eCxxalx7IxP4CcrDh5OX9Bg7Lis4FcHSpA6WSFsVccFL17m/zdQ8FF1RDxzCK8pnDO2WV1mQnTqMlV8IEqRQTkbRKxQ8HBZKnBphD6YuVf3GaS8h0MpTzblEKLhTOyDh3yzQe5T1bz6DDSZXffxOr+bH3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179205; c=relaxed/simple;
	bh=0ETHIANzM7orwdnR1bo7fEIpN7EqDp+62HVdyFjaBgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8cYoxrykfIni03cnM+/LbjJCg74w3RMwlXDJBvBvAs82TGDm0WDUI5jCczmCpFPorY/ofmAwkXgGXiIbAfUGyGAIPu3dkl/fXgTpxJgIUpM+FNS055NylyNy0Cve6UEB1n2Se3/PebwfLQ3ghF1ZrGTNCKIf5/PWF0NgFyy+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPJQcckL; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPJQcckL"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so5093908a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179204; x=1781784004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE7Y+dtzawhn0AsT8wTsg9fpSUZbt11BrzLjo+n3pCE=;
        b=FPJQcckLvUfzbm3u9xjb/Mt2/9I73cDo41SMhGIOPd31SFu3fe/oHXiH8UpS7hC8Wl
         2esHyPgzyN9ec90pImSnYIGFfTKdozJzmMdQwnrxNdvPT+dV5tO1JMSw/dwgdCkRZT4r
         nGVz26Z+vIHEiSgH1I4c+KY98cGkk9m0fh7L5qvUiuBZ46dkryB99FCi2fnKwPJxoFsY
         Jw0wwp9L63ivataB7fxoQEK0MtScNpSZ61ejIdhTem7gVbX4AFY885s9uuUcEGRJniKs
         R4cQsEjDCqsBffaArKcok7/zA59UfnrdzUd6Pb8VQlDixxV3hkeWUlobGx6GXRHziSKW
         igYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179204; x=1781784004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OE7Y+dtzawhn0AsT8wTsg9fpSUZbt11BrzLjo+n3pCE=;
        b=BaWtIMWxUNpTlJbnRPy6+nY3qqbYpanGm4ljoUd8sDU7/u3py0AjHgKJQMPbOzyuST
         Qy0GTosoOisgGjDgmb5mBLlO2pSUQ8xQM5isHQ3esv6MVol3XkRjhmSNdHGhVTMbX6ec
         YAERsZFKSZn5UvHNZiJ/4DuprNq3+79IMF8G2iqLTuuWc9N1b/Gh3x6pvX0XoQTyLBkj
         4zTkanAirE+MoNYmngQFxkFirjT8pJDoLw6/oKjfFDqVtYmiihcQTR0PBcHS/7zf5mUS
         AInkX1rubMc6WNl8n23kbMHNgxiuO/Ne/2njIj01Zx3MUdKraSvONoGEM+y/jlZ3DIdo
         gBwA==
X-Forwarded-Encrypted: i=1; AFNElJ/OPHFKzcpOgyzChN2yAGVg2/DigcEpoha5XY6lyFTM7eHrZSLXXjc6Ak/XM8wOsU6BB9ydpv+6VQ9yHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPieCuoziWtkJuUf7OaYknPUtWHLMAbQFB9dnDUSlXKFOAx+Z7
	cldyBi5SU0M3soXWAu5zCivlK46y3mNIRra6T9SowpwLyOrT6G0IAeST
X-Gm-Gg: Acq92OE5c027bFtduwnO5+0CycrhyEu6aoNDuzBcp6Q3r/hNoTOCrsXxx8RDpt/Ibd+
	t+qzzI9nYbbQia4NLadRcGK8oh0JsuvpnS855qOiu8rGWKFAaSfGOL80QU1pm2ipVv0eaHSG7OD
	tmHpXnHPIZR9zle/We3YNHoZVgn3WFqZ6uTosBoQsphelyF27BG5Ju0RMaAxoBNCsovQMTpJeDQ
	JypqFJf3+Jkwmokcc9NtQpFfPwXUxP28jBo77x403RTOzvYePsA/1SWqXUOlZsUDJUjk+ZasD4G
	Vry9vPzjlITTpYsp5SRSwr4aR1g2lFpm40deo1cfKbOF8EPqHdprgBvGlJ1MYr+hsvtgEhx38r6
	Xt7OY3d3GWimZxU99dw9QZXfWU84wcR5TdoL0LquG+DyN2o87fWfKGsyy0Qpe/+MEg20LtO6gx6
	5xPd5ru0ANT/NLIM6kWArGHDoAJhDDNngTUiqzm5k0j91sRn5xXnWuCL9nlRtC56wqCYnK
X-Received: by 2002:a17:90b:510a:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-377a5916a09mr3050028a91.15.1781179204085;
        Thu, 11 Jun 2026 05:00:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:03 -0700 (PDT)
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
Subject: [PATCH 11/20] ASoC: Intel: avs: debug: Use guard() for spin locks
Date: Thu, 11 Jun 2026 18:58:52 +0700
Message-ID: <20260611115901.80438-12-phucduc.bui@gmail.com>
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
 sound/soc/intel/avs/debug.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/debug.h b/sound/soc/intel/avs/debug.h
index 94fe8729a5c1..7c5f97b46f0d 100644
--- a/sound/soc/intel/avs/debug.h
+++ b/sound/soc/intel/avs/debug.h
@@ -26,14 +26,9 @@ struct avs_dev;
 
 static inline int avs_log_buffer_status_locked(struct avs_dev *adev, union avs_notify_msg *msg)
 {
-	unsigned long flags;
-	int ret;
+	guard(spinlock_irqsave)(&adev->trace_lock);
 
-	spin_lock_irqsave(&adev->trace_lock, flags);
-	ret = avs_dsp_op(adev, log_buffer_status, msg);
-	spin_unlock_irqrestore(&adev->trace_lock, flags);
-
-	return ret;
+	return avs_dsp_op(adev, log_buffer_status, msg);
 }
 
 struct avs_apl_log_buffer_layout {
-- 
2.43.0

