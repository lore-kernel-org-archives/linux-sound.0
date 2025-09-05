Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACE21CFF7
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063431; cv=none; b=e9xrg/0wgngAE1wUmBF2AcA7MGS6gXpMqNujDks9N1IryNlOFBLmXsjUWjN0qtE8xRVsfSPwuK1GwAoIRPwMB0MQt0Tn9asZqszVAnNgRJ2cdEJGF7PdnFYWYaIod2Px4uZ5cm9EtYbPqHfOmyG44YiB4N/DQCD/sJSjf+Unbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063431; c=relaxed/simple;
	bh=H8tlBxo/I4QKoAzzAETioGThO/7phy21jo5gPXQ6OIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrRSnFJ96sUJc0LdUvXCMjPImZ+j06PgP1sEky9Y0EGQ9ahKkAci81yGZfxs289Sj/VyxwiyRLp8U5ekgT0eAwZa93SCW7+3bSIBToqzSRUe96tt/EJuHLaB/Tc+QTly4OPN3JT0wbXnZxFDNxMnP7sG6aKR9kDAR2nB9CJMwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dPbjTzMR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dPbjTzMR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo331319f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757063428; x=1757668228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTbLiixSPe1l4QCB72UnekC/gzC3UfcTOHYnl7T9UCY=;
        b=dPbjTzMR+xzQihcYtBxCIO0bX+frgXReHFLTc8mCewTsSKfineCir2IkEntwjiSg/B
         ZA1rGnUvNwNJS2lTw3SR+TZedyazSY6+UzLm04+/MkwBuOv83wxzYYsuKqpQUPLaMBnw
         byTssY+ig3QYMpO7hODJNSDi63ld+mwaConagKtJhwQVAukDTyqHTc8iDESBdBvdhXlK
         paNK+vZ+4dM+S8UwCdc6NlMuRf1KAF+1q/+09A/1h+BPsR2NnawMyeU6Y95YTN674POm
         HLJXnFjpi5nLD5BM0RSK2TT7SGOmCi0yvv/aR5pHxhWc3JgKlyyemFyaYQwbj/jvm4L4
         +8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063428; x=1757668228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTbLiixSPe1l4QCB72UnekC/gzC3UfcTOHYnl7T9UCY=;
        b=NlE4BJ8cHdHBQo1unPtTAPc2pQ47Ut+NHCeyzzEi7PUrcCNc9klNrHvjK0NxwE7X4B
         hyptppWi2F+fJnT1tIUnDPW1uschCbiCqMPsetn5TSz8Lh6wgEuFU6gdbyIOWV6ZWnQU
         g9CVJOGCeFtsJ4icBipdgvusF5cb7Rzw9cGXcaMDBMWWqmLtWxGG4GOKlJ+XXCokJAhq
         Fuj4RaiQzma+LkXdHhT1Pn1mOSxLo+FYRx41XqnKkv+O6goZ2JaN+pOsNu9hbGCK2Ubv
         +1G9ky2R7S8l9LlV9R/85UcHeFnHq5P5XAHNI2vFNPqSXRDR7hvAyCx26uTBxaPLL6Xn
         b+mg==
X-Forwarded-Encrypted: i=1; AJvYcCXVLtmmxQ8wvIZ/+8JMEsIaOR1ePmt5vzQ/jLUpLiWzj+M+9CXQdbLrcYsoc/A+QTFyysrVqH2WN5W/0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mVlj6DukuIhujcZGkULz1d71A2QKdYnsoVCTxJu4elLBm/SI
	f/C/1b5p5jpm5j1DGpeDx8w6jhmMM8cuUB+60gVp4Gj3lOU3drrELHQlsMoZcs6uCHI=
X-Gm-Gg: ASbGncubmJ3gQYDMP7/HiQEDLn6mhpbaburV2BUcTqQ07VxrdWjgAXAj8yslEm/peJd
	6vozoOENVhT33T1TvkvWu2RmM8BB44ZpQQZ51RJ536jZpAVld7Gf3UFqiiNyFA9M4RpqsPQ78pR
	eed7T3nJPcRi6zRt7b0hqdVT8xYH3E32Goblo9p3JIdHU1hWQIjMTTiUcsBv3W/q34JB5dtPP5l
	gUd950/1iW2yaqjXWrX9tsXHHvlXa7qwCSzs/s0hdasHmO78iaFIRPCNeXVXA5bjSgTlGlP8VIF
	wzZ6J2/yHjodQwHmup1g7hzUpzEbld/osN64qMmecCoOCZoV4GB8EbuT/MD8HPidXvnqzpXVoJC
	bi8cvIQccGwexhv4lRGy17kFCFsMOhgl5as32Ge+pQxccpeE=
X-Google-Smtp-Source: AGHT+IH70qfE1sbG5B6EhOVJFRp2gPCSNeuRweaStAWJqdo0xRxChgSl7UjLXO4wPAWOfEVCXvXh3A==
X-Received: by 2002:a05:6000:4403:b0:3d4:15a2:11e9 with SMTP id ffacd0b85a97d-3d415a21498mr9589221f8f.61.1757063428151;
        Fri, 05 Sep 2025 02:10:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd4affb6bsm39726915e9.1.2025.09.05.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:10:27 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: replace use of system_unbound_wq with system_dfl_wq
Date: Fri,  5 Sep 2025 11:10:15 +0200
Message-ID: <20250905091016.109428-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905091016.109428-1-marco.crivellari@suse.com>
References: <20250905091016.109428-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

queue_work() / queue_delayed_work() / mod_delayed_work() will now use the
new unbound wq: whether the user still use the old wq a warn will be
printed along with a wq redirect to the new one.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 91c8697c29c3..c8fff8496ede 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1044,7 +1044,7 @@ int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		queue_work(system_unbound_wq, &dsp->boot_work);
+		queue_work(system_dfl_wq, &dsp->boot_work);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		wm_adsp_power_down(dsp);
-- 
2.51.0

