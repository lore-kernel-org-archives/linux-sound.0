Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984337F01E
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236764; cv=none; b=MJs/dn1680OHkB7/M/7vmvn87E8s+A4PziwgW8MPR2gfg8NR3JCaGAvm/x61feBf38L1h1w1OOe2jluYF+TEs+CrYlTTEzthbt8finnK91lOXljCOb9aEhIab2/iwHWcEQJzav+SBmd6P/vvKW80XQ2M5K7zSUQU0EMOm9WBKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236764; c=relaxed/simple;
	bh=X8FuvP/99gyNUMmHvPuFXmMMvK2n28I6GDJoLygfXIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/2rcDfGFpp1QZKeHpebJouzl/RmnrlCxk3su54FJ43gixW5Cf97W0PDigxDMhperA3raSFllw3tx1tYncuUhL+noonGkrBbR1pXSEJGX1F4+CwTWQOAwdHJ04Wo5cjjX1EjBcfAtqOew8oNciXeLxW5GQU1dmkNTlKGTIDCQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLu3fxGn; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLu3fxGn"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80167f5716so742239a12.2
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236763; x=1778841563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7TyisERyCLhAIeiN1+m/zKrVKHagMvjPp9LlZU4W08=;
        b=rLu3fxGn+Fj+3HwvzCP3KAd1YotEsTpF9GtKQ3KXKw0L3GN8yBXti4vZPtfGxqW4Gj
         87pWMyjruW9LAObvvJDhTqTmb55sdZg+aM80YvLGdCD4ANm1M/IMu6N/gaRriiQIwmib
         5j2pH2oE3IqqXDngueuPKceQOhkNkI9FuqDinaYByQ8rEmkgiIZLXUUcEAaMLGHhyU2Y
         Jg7mdsPzFNxe9ssgYWqz55yeE5r5ITdkqqQmXZSj0AAxLgUBGT99vE5euoqg4NqNzccz
         0aYSs9MJ5VuJrKxMAVMI062/zMjbX4yJWZbp6N5ZCVG+7eiTvOFuhuhrkmsHywD/6GwD
         BOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236763; x=1778841563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7TyisERyCLhAIeiN1+m/zKrVKHagMvjPp9LlZU4W08=;
        b=i8eCyZxUc/TRD3DQ2lGoKEDykR6OuPCJrQBVwlSt/Y8PXYgQ3MFoCqO4GoJpnjrB+M
         aoR3LVr/VLI9f+LFwnnJIgyZocstSoM6UMa9S4ZD1Z/qYoIzCjfgb89bzO+oEDuieXJD
         j359W1eYzpzH/RSWB9ZpKcGhs0ZqkO2VPSeMnzS6d1wZu0I9GLBpNPTE1c1zpwZ3SPev
         8ENxi2t95dvhHOrPR1n9TEDkEh1UaeCf7JjlCknj1qHUS44YQiGuoEn0woZHfGLhSHjb
         ZwOju3NS/y5yJFFKTgYeqgOcpPCcjM0Aak0o99NlAIbyNHYwQ3leEdGhLLHJ3Esxy9pH
         F7Xw==
X-Forwarded-Encrypted: i=1; AFNElJ9qLq5DOdlIlcsulPMMRKbNNHfe9TW2et91pmjvjSd0wwv7CmAKSqyfFqpSTu7Xd2ZCak+wV2a1rJMnvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Q8rGrUkPsEEyPbInMP/ejwHLphwH3FyFtxBBld29HOCAP7Ja
	EEpO+/GGUBYiX0OnX/QR6oLixhIEIFvdEim8MJFqsg1cBmWfTkyI3J4m
X-Gm-Gg: Acq92OEqZS8RB6sxvD0WxBrq+Dff3wcxpZMFGNkX44RFhYbzRJInvQXe4eORK9IDpG8
	xHR5GEKZuGhzHD1nh6+dKVeQjuFFdwOLM+ud9bD/9UkVuGXxzg5exAarWuLERe5LplO5+K1wPQy
	RthoX1bpkPy+IA9wVstY7VC7tEsFKGfwGWUDr3ig6E71XTK7EnvbYjEVVGeAJRR+vUkFLWMrrWX
	/Kp0yCyKs8LBTDSkMnF/adIfotpWbjpWisi5e3IsEnO/Ta6tqsFJc31aHZj7G0S4l21ybsw0SWL
	goSlkDTYyxnFYQMnmZJ6SXy1sP6Q1iAKU8iY9cZOky6E32LZrnN7wyX6wXzSnSHuRkW3+PM7yrd
	A37d5aXatLtIYHjkhxqRDpBNAyDKYMPSSqwEJOBqM4RKLOOT3g3gmLcs0bij+XYJ/dI9uTnngyF
	BxMwEMZCQPW8A2RWPCHpssrOrxsiU/0x9+T7LDo1PDapAb18UwVYxekOv0l2rIWtCKfGSe
X-Received: by 2002:a17:90a:e7c2:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-3661babc819mr5812280a91.10.1778236762673;
        Fri, 08 May 2026 03:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:39:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 6/7] ASoC: ti: omap-mcbsp-st: Use guard() for spin locks
Date: Fri,  8 May 2026 17:38:36 +0700
Message-ID: <20260508103837.138142-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508103837.138142-1-phucduc.bui@gmail.com>
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
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
 sound/soc/ti/omap-mcbsp-st.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 901578896ef3..b762d5d3e33b 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -156,7 +156,7 @@ static int omap_mcbsp_st_set_chgain(struct omap_mcbsp *mcbsp, int channel,
 	if (!st_data)
 		return -ENOENT;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	if (channel == 0)
 		st_data->ch0gain = chgain;
 	else if (channel == 1)
@@ -166,7 +166,6 @@ static int omap_mcbsp_st_set_chgain(struct omap_mcbsp *mcbsp, int channel,
 
 	if (st_data->enabled)
 		omap_mcbsp_st_chgain(mcbsp);
-	spin_unlock_irq(&mcbsp->lock);
 
 	return ret;
 }
@@ -180,14 +179,13 @@ static int omap_mcbsp_st_get_chgain(struct omap_mcbsp *mcbsp, int channel,
 	if (!st_data)
 		return -ENOENT;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	if (channel == 0)
 		*chgain = st_data->ch0gain;
 	else if (channel == 1)
 		*chgain = st_data->ch1gain;
 	else
 		ret = -EINVAL;
-	spin_unlock_irq(&mcbsp->lock);
 
 	return ret;
 }
@@ -199,10 +197,9 @@ static int omap_mcbsp_st_enable(struct omap_mcbsp *mcbsp)
 	if (!st_data)
 		return -ENODEV;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	st_data->enabled = 1;
 	omap_mcbsp_st_start(mcbsp);
-	spin_unlock_irq(&mcbsp->lock);
 
 	return 0;
 }
@@ -215,10 +212,9 @@ static int omap_mcbsp_st_disable(struct omap_mcbsp *mcbsp)
 	if (!st_data)
 		return -ENODEV;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	omap_mcbsp_st_stop(mcbsp);
 	st_data->enabled = 0;
-	spin_unlock_irq(&mcbsp->lock);
 
 	return ret;
 }
@@ -241,13 +237,12 @@ static ssize_t st_taps_show(struct device *dev,
 	ssize_t status = 0;
 	int i;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	for (i = 0; i < st_data->nr_taps; i++)
 		status += sysfs_emit_at(buf, status, (i ? ", %d" : "%d"),
 					st_data->taps[i]);
 	if (i)
 		status += sysfs_emit_at(buf, status, "\n");
-	spin_unlock_irq(&mcbsp->lock);
 
 	return status;
 }
@@ -260,19 +255,17 @@ static ssize_t st_taps_store(struct device *dev,
 	struct omap_mcbsp_st_data *st_data = mcbsp->st_data;
 	int val, tmp, status, i = 0;
 
-	spin_lock_irq(&mcbsp->lock);
+	guard(spinlock_irq)(&mcbsp->lock);
 	memset(st_data->taps, 0, sizeof(st_data->taps));
 	st_data->nr_taps = 0;
 
 	do {
 		status = sscanf(buf, "%d%n", &val, &tmp);
 		if (status < 0 || status == 0) {
-			size = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 		if (val < -32768 || val > 32767) {
-			size = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 		st_data->taps[i++] = val;
 		buf += tmp;
@@ -283,9 +276,6 @@ static ssize_t st_taps_store(struct device *dev,
 
 	st_data->nr_taps = i;
 
-out:
-	spin_unlock_irq(&mcbsp->lock);
-
 	return size;
 }
 
-- 
2.43.0

