Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED53DBD43
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784995449; cv=none; b=Ta/JzP+wpGIHQGGWLlp843GrMYA4/GBnITSh8Fd/lpc3DoQb+1fpsbZwTAX+qp6jh+zFJdCgmlZJUMzlJf6Yj+UJERTVPYeux+P25R2UOl6RB0R+WMzF1MPyGnV5rgFZC1DC41WHspXLnjR40qE/3AU6204nQQ85pBQIRL5es9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784995449; c=relaxed/simple;
	bh=2FuTX/d19TKBFddtMgCvsbwtcT0uyCaHMNTpgCyCmpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0aopiltg5Ayi/kX06ld+ga+tOY054Fs7OcHFzH23Lkzkxuk7ftTbecvouszrax/8GgIjdg7Yq75vSxP2RSg5VagqQjM3Aid/g5A3/HYEIGOFKPDDfKg50vS5JG5oMT5e7opzCSn9nnqwceBJXfBPT26kV5sz6Yi71WxG9+Vzeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEGCc61p; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEGCc61p"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1027828b3a.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784995443; x=1785600243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r78mhFBGUd0CMeuzJ4viaMHTSw97uIw+L2QWJ2JRylA=;
        b=CEGCc61pOHZ+aSKxsYNceLyclFLb5vn5R+OATz2qfOfQ9UnJoG89YSppkIJcUnei1I
         KnGnUUppQMd94VYeD22xpPWIQO8mLPnFchfZFzPtcbREtKULnWEcscTwzXIndZ66tluM
         UyQxctvwd/ZvV/iJbPy5gcJUZOjXO99zTF9RpDbxlKFaHXxa6n17JjppehTwNi/dAcmz
         dPxiYoSsFkMb3wG7aIJgjaHYDx6Sxw1+Fg4iHlad5jjY/EKUtmiAiPLXu7e/EBsDp9f/
         2lHQdNTtpGN3R2ZiDTi0rE76GDW2o8Ky4kw5xg2kuZU9YDqUXh4rfIUL/xftS1ZL46Cj
         QQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784995443; x=1785600243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r78mhFBGUd0CMeuzJ4viaMHTSw97uIw+L2QWJ2JRylA=;
        b=X/hs7cDE+G6pEgj7j9N633HGUvG1X/GK1CJpEcxKaVfws9fS5HF+1VAP9Gk8SWSU5H
         zryLPglJI0YBnPe8n1N9sqckHLl+GoMaRpgswQWKxjG/wrnCD30LtYdHTtEnAAE+GETg
         c8Z3E4PLIfbUok2u65n9AtCujf23Tc38RoMDO05ihO0FFLsM8e4kkQJlrjysaSm74ak4
         XRP/NfswF2RBZ1dqk/gMiMSPV7uzxxKJOp3gimgK6xOK2W2nImwLGlxeUS8knATQR3lT
         iQUCojtSMSn6wbXTQYu3B3uRcaQOf5iKKTL/hGXWdkqRhaUmOuJ+wyCGRvI4Dp7U+XhY
         h41Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro+N6X6TGUS5TZpYuGRJ/LopTFNgTPvi13HJ/UD6zAlUgh/Lf3PCCX5JuG8OjrfRaPgamIKMUilORgrFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAxYx1of7r/iDHO9OPy9hovl9lvvL/V/lUPixkqQEQrA0lf1z
	yjWqBD+NagE1yth/RSQ+u2bvJHBxZzy6i/FqUJTXEMZnwpRmLJIIX428
X-Gm-Gg: AR+sD12yXnaBPyyZlZSH0Pz6JOC9PjFGGHrEpWo1NYvdt7rpXAvZ+LzyehFY/hogX5r
	GuWyY7Ifw9ow7Cy+k4yePKjaP9RiTOzSxIgYZfKBsUUzLjgCj/6ZtGGzgrTdQce6tqtqDh2lmZo
	mvLWaisDCPqqqcc6tcq0YfPsuQAv67Hg05zXis5HUdqBqdZ3SLs430gA/Hb7IIOffS5YpHX2Mg/
	NfFF34eEU2nPgTlvjNycyx2QF70jVHLBtsFKnp37fjXz4LpNHU5bfR7SrCqx4nCeTWpEWS8MIh7
	0qkCz17kh/DXb/oqFylxqAXOzWkMTVHVx4IeEfmI/XxbBkX5xxcao1zsPPBTdB4UUepPrEh8DA1
	fNTXzlDr/bha/LEQGWiQ5m40SsvGtDI0FOQp0pqDUy/FjJFJF64F52jUimtMnSgQ7cpAD05+e
X-Received: by 2002:a05:6a00:2906:b0:848:2f7a:2e52 with SMTP id d2e1a72fcca58-84e595726bfmr2087334b3a.65.1784995443275;
        Sat, 25 Jul 2026 09:04:03 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm1171554b3a.44.2026.07.25.09.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:04:02 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH v2 2/4] ASoC: Intel: atom: remove conditional return with no effect
Date: Sun, 26 Jul 2026 01:03:41 +0900
Message-ID: <20260725160344.916838-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725160344.916838-1-ekffu200098@gmail.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 9ee4d9926e06..a4c8cbfba096 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -236,12 +236,7 @@ static int sst_platform_alloc_stream(struct snd_pcm_substream *substream,
 
 	stream->stream_info.str_id = str_params.stream_id;
 
-	ret_val = stream->ops->open(sst->dev, &str_params);
-	if (ret_val <= 0)
-		return ret_val;
-
-
-	return ret_val;
+	return stream->ops->open(sst->dev, &str_params);
 }
 
 static void sst_period_elapsed(void *arg)
-- 
2.43.0

