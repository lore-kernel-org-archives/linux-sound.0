Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C52913B584
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105283; cv=none; b=F2ZPQoObpIdiJt8cv1lBTBtqkPb6wkWJ17HcbRp/tVW52K8oa/6Ph5p+Su1jbHh9jv3hLjU4Gd5JWXegOEwHcah9DEhAfpackOh1im/9MCcRr7HWXulkF7mB6azdcQGOLBFSTJ0upv7XxXHI8hy21VwHtv596+YS0WztWRzyBks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105283; c=relaxed/simple;
	bh=KoYLwHneht1PiDc3ZMeV8jsaEkp3iNQJynkzP0bKtzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFhYZ9Fs3+VmQ8jWBmCZcRuokYpj/Z/k+1tZxB/CjvULkEdW8rLbtdu/7ZcSI36VaVq5xIeyIJHocZ0a36RXZRgCzuzxhi+byOsWU6c/jYJAkJHjZEOulnJjP/BzSDcEDqlzYlcHFe4hUsogVwdmhm0B8wf61OmJr6w+rB3yJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IB5xAREA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IB5xAREA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1549926f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 06:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767105279; x=1767710079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdN/9k6EsRbfhtuyrjMNEuOVTDLjPmM9gCITSIDuBIc=;
        b=IB5xAREAZ1khE0ULQ9OFNWQTUbyhfig5iOwtWSajY5Sq09rlUR5dNLAqJkIqhULH1Z
         DxsfAG577ge++Uhkgj3ktTV/otmFQIbCVXOfGH4RKoimetpNrl7LM7szhMOzse2tpyHZ
         9Fvzsa1om30thUNACUEB5sTXpbx0E34wwUfJV4y1EDCisZjMyPnowKfx25dpH0GLAWJd
         0QUhn7lRJB3cb4dgCic8BYxvIpkmWNxJvL/ZCIYElAMXi8Rbd51cGkCB9AdE0s45vTG4
         PCxP9U6shyp3r833nWm2kpSE3zT1xbsXisca0SOqOBv3OSOs1pjEFz3+ug3CaQHPmaJX
         WRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105279; x=1767710079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdN/9k6EsRbfhtuyrjMNEuOVTDLjPmM9gCITSIDuBIc=;
        b=h9PQGjgAhK/Is43IO90RNzAmjIB5VfpZbiGyP4kQ5RZYLGwUyAcjUTmm5L8iyTvnzX
         in9oh4uSLG5NMNzeXC0pLzDoB4Tiu3IIoDzSkzrhDhrA+BpWjq1JvvkcK/Dtyucf9se5
         EbSQJRmBYVUQcUBZj5hBiHMVVCAwUybKPzTq6TPMaLDatYIxaoQ3W7GpD1I523HA31N9
         wwPnmxkwTPLZfUZjZE0c6P/9GL2mB89l8qy8Yyo2uL886F6YlXvIk04kDpQPAv2vpDK9
         EqulZpwafuSGU+sGDemJqKnZndVLijvUs4IWdK0EsvQ93+giuS0qlisEpzTyfknGCyVZ
         qkfA==
X-Forwarded-Encrypted: i=1; AJvYcCVcbF1XUVeDfSsIxu/GBg8D2+J1gt6YWiSXpSKVxf49KlLiL++V/wW/xfzdq5unvkZsrU6SE4cHeDSzXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47QoQohkigomLaJXy8i+HXMYuOvnl1LyFe41UNu2h6iPr/ZnJ
	ozI1nGals+JNJEmRMZX8akm/yvRvXZVkGL7tf3Gz4R2O3iDAHh9IxHjZevk5CusON50=
X-Gm-Gg: AY/fxX5QoFldFz3ujFGX1igG6HimnWdGrLh+VwSlGtc5G/ZiCBPaVRqNoFMZrHCEeEM
	CvUj3vY20IR3FWqeF6+qVL0gpguqa3w3oGFunWSqrSVtCw8YYyyUdZOn2bzAexwBA6wK5nuV/tA
	HQSnsvPW7zVhPEEgwFzaqp+vEf2Yv92VAUGNXRIHRrmetpOjoj0wvGwUv/CIH+8TGNpUpkusp7K
	7KbtuufdQhgK7asYIgSyPkP8ntxGJXtc6wyzInCbDevHacpP3c7k/flX9RYfyVGw1LmdHauC7h1
	Ko8qjLqZ4hhulyeUpszA9yGyk6LLrTHZXx0Njy7mK5lpUPBYs6KYU774qyoqovZSI2GMEdIxgN2
	f/5zfJETpgziW6j73BfCSvp6bzKcC4s+yH7QcJ6jIKSeIIkvYJ5bvBhs+dYqHB/POH8KUAwO4Gx
	Rd4cOFt1/rPfM/Gn0wZKOtw6GGsA==
X-Google-Smtp-Source: AGHT+IEjE9Uo0j0DxPcH6y2QbUU75EjGUcWU0gw8zzeZp5kqlhNVFXs0AuUBVHTwm3DxKo/tsQJClA==
X-Received: by 2002:a05:6000:2c06:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-4324e4bf93bmr37309699f8f.3.1767105279446;
        Tue, 30 Dec 2025 06:34:39 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm35621387f8f.25.2025.12.30.06.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:34:39 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: SDCA: Replace use of system_wq with system_dfl_wq
Date: Tue, 30 Dec 2025 15:34:29 +0100
Message-ID: <20251230143429.179643-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This specific workload has no benefits being per-cpu, so system_wq
has been replaced with system_dfl_wq (the unbound workqueue).

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v2:
- use system_dfl_wq instead of system_percpu_wq because this workload has no
  benefits being per-cpu.

- rebase on v6.19-rc3.

 sound/soc/sdca/sdca_ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index 8aba3ff16872..a86bb28c6d0a 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -257,6 +257,6 @@ void sdca_ump_schedule_timeout(struct delayed_work *work, unsigned int timeout_u
 	if (!timeout_us)
 		return;
 
-	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
+	queue_delayed_work(system_dfl_wq, work, usecs_to_jiffies(timeout_us));
 }
 EXPORT_SYMBOL_NS_GPL(sdca_ump_schedule_timeout, "SND_SOC_SDCA");
-- 
2.52.0

