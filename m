Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F49C3FB7DD
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252624; cv=none; b=Jo1KJGtnjl3PWRGSKTk7B5uHgvjqB2pvuUOG3r0uzHAfHAnkHx8x6zKFMsJuHkOktbEV/1QUUsLT1BhOiaiNXckUDw/KLaiWfEPCwvN2mcbtHXUES328Ds7I/qNrp5adsFQpJETEqsZyDyFTF5yGF0guUFRkrLXzZ2DbLngoTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252624; c=relaxed/simple;
	bh=dEFEWz3grYsJ3xFfPv2w0LqS/B3a113eXpTHuU1Bfow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UfrEuoZQtoeKMw0I3lYw6AoRF+WON9o+AVmOfFefkg9dL5xKDtyTwI02pcsOAkPvNQkAWmXiDgvb5L3oCTzOvRoe59vuSCZyuO4BmDDpIP32hfYllmVu48MMszl2SnKmx7/fRX5siAqMAyRAWGhgqyUr1xGhBGuPvEI+Lh6Fdto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NVwdU1qQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NVwdU1qQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso23383215e9.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 08:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778252621; x=1778857421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1nwqrFtqGULq78/Os8+Xaynrz1dC0zWHqq0+EOjT34=;
        b=NVwdU1qQDwvhRjbVAQOxOq9NWbBJdSE6hoSKzmHC3zYc5MPloLUXZTfcSPq1YirXwh
         banFrouyoYJ2IJfDlJCOwkQ9tZTcFgz+hfNm3tqiuvixavb8yf+X61QxGGVn2VGSOSiQ
         A2UyT57iKU77l0bY+auErPxj6K4r21GJ77UMF7ORvB6SeyovoBWF7OLdHd64wzfLy3H0
         hgMaPKF+GWFm98RNALbuj1IdafyHMh5DKGnLQKLvIY9QNRimxYeZf4rMiWwoZPVvml3B
         aHuFMkb+w0DODbjqgMeogCfwsjoEn61HKWrY5F5typWUtCUTeIS8Wp5c0gVMEcUXPuPr
         fCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252621; x=1778857421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1nwqrFtqGULq78/Os8+Xaynrz1dC0zWHqq0+EOjT34=;
        b=eWsXCg8QuaGbiV5mOismhxmONdQPuONRIbSalQprfmvJAcR+htev+Sv30MWSm6eVqx
         0EgviPfJ//L4XF3UcGRpj2tXoR3XE75KztPywUywREs+loGsuJw5jVtFIUzsf/AYwRrw
         bwHk5j825U8tcDJwrKic1EmIBLxqqeL5GtlDv8xBxtop7+REFEit/Cdx5yT12IxT7y14
         rVLbA0GeTJ4I8Y7dwKTUQEzTW32w1mlJPMauMV/AIhji7RXoyvanKem80hKufklbasLi
         BSoNW9oFVP3gu6C1ceS0lJYyKztPja0ESAMYxRh8UZ3KoUuucvzJDEVxQn7qUatuV1jC
         hSHg==
X-Forwarded-Encrypted: i=1; AFNElJ/r9B8FEK2F1QuRGRFA1Ag26h3AsjqEfzA/sOE2AT+zLlXmNHWO4rpbnUCDUqyFCz2Zk9qj89blaQZcCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+O441QWFBNtU+bYQ76HVVEgPZqWilJouB3JFaoFSWHpEOn5Vr
	O++ML/iqpdX2mCQvEeuKKElZlNXyEavW0RbNDpEqsinf/YGZLXJ6uC+SATS0tZ1G6mk=
X-Gm-Gg: AeBDieuVI70Sc3veRpFJrHokFdRW/ae+u/ZjJbZJgZLIniRTEcAgjVVUKB7sKDIc+eo
	uYFh9C6q9G344RTfKV/pK8TflkGRDinEAs2DyVvIc9A+1o7p2O4U5GYkyQfio4ekrDg5BvxN6GX
	7CM+fuSUezYOMZctWN2LzAM9T/QBkEMlec9WXO+k4bOWK9S+ruzCn/NoQbm/TLKUWDu3rUATpAC
	l6U/ylhi9O90DIyXMzXDJ1qdt1xdcAZuOSmo+zFrXV7GcJoxarZhi9mOB/aAbDeLdcOtGBawqF9
	GxFRxoEF+QDirZM4GVLWzpf0A7ftOoqR0Jysa+ZhTphURzouoT8j+jaFKlQzsoDKoPuIK+pJXia
	po61+ZzxaaErj476VWh9Upc3coAMObNpKu1Dvp4FDZFoMrUPgvz9wZqc6BBm9nz69gbMg06n9Jx
	mc9SfFMMK4M+VRnc+s+D2iV0Mn7nMNS7j9+eJuJ2cnujoHckc=
X-Received: by 2002:a05:600c:3151:b0:48a:7605:751e with SMTP id 5b1f17b1804b1-48e51e0837amr199168805e9.4.1778252621369;
        Fri, 08 May 2026 08:03:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm5262918f8f.30.2026.05.08.08.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:03:40 -0700 (PDT)
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
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com
Subject: [RFC PATCH 1/2] ASoC: cs42l43: Move long delayed work on system_dfl_long_wq
Date: Fri,  8 May 2026 17:03:18 +0200
Message-ID: <20260508150327.351779-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508150327.351779-1-marco.crivellari@suse.com>
References: <20260508150327.351779-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move long delayed work on system_dfl_long_wq

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: David Rhodes <david.rhodes@cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <patches@opensource.cirrus.com>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 sound/soc/codecs/cs42l43-jack.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 3e04e6897b14..934666295ee3 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -805,7 +805,7 @@ irqreturn_t cs42l43_tip_sense(int irq, void *data)
 	if (priv->suspend_jack_debounce)
 		db_delay += priv->tip_fall_db_ms + priv->tip_rise_db_ms;
 
-	queue_delayed_work(system_long_wq, &priv->tip_sense_work,
+	queue_delayed_work(system_dfl_long_wq, &priv->tip_sense_work,
 			   msecs_to_jiffies(db_delay));
 
 	return IRQ_HANDLED;
@@ -932,7 +932,8 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	snd_soc_jack_report(priv->jack_hp, 0, 0xFFFF);
 
 	if (!override) {
-		queue_delayed_work(system_long_wq, &priv->tip_sense_work, 0);
+		queue_delayed_work(system_dfl_long_wq, &priv->tip_sense_work,
+				   0);
 	} else {
 		override--;
 
-- 
2.53.0

