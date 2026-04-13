Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9C3B6C01
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074856; cv=none; b=Z7/1o/KAF7Ux9zA+9egMMz0IhcNvhEGw31d1f79y0rekixbFrMg0pfLNudX4cPniSEd24b7dR6WGJKETkyl68obMC572bqFqbJCcAaBZgcAiR3bcECzaiy1PRDDITyFnuz2JhVaLZl/4eRx7hPNs4VkU2D++Bmfzak/GiPxI+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074856; c=relaxed/simple;
	bh=Mwmud0ptvuHV+QGGbUoP8Aq9HWXBoreRMpco68h7Q1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW47AB7MiBKkMaBXYKbJkXVFJM3YjGmb9Ktj2EqIk0fHBjdJdaAGg13PY0uM7LUopUNQkIrbTEQhuctITro2OX6wBeo9P9O4dvrWwDJYOBzDwjEafDNV+/G2cYi7Z9nqySOYijRefjWSr4y5RCkHBGhL7yX7slgsbO9vK0H3NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nacJeyKy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nacJeyKy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82cf636dac8so1889779b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074855; x=1776679655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=nacJeyKyUF3e0dvnpIk23EmlEC+zDeld6l9s+WMfw6PMURANCex9cS0tF42flYHvwJ
         nBAVbx3UJHUKtnT5FIT26J7rJXuUefpxO0f0OEtN5Of9zNSGjmNXjc7Yhx+5aGSRu9fa
         Q7LFmJ5ggrGCBzJEAKv75CJ1VUdPwSGDl0QozQ4+We/lZLQ//5Y4QJ0Q0JEcUl2rdftS
         q/oCsaJ/oUlta0XfgUREQyi7bXaItqfOGTkP/7WRfShpqUAzcXHyTIZ229cOWgb4w1s9
         6f1296plzbPH1Uve6ysm5M5H6RRmYWydQsYSxav6PS73+6LqQA7wOA8mYjC9U/J/2ZlB
         Goug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074855; x=1776679655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ee0L/AD5HlNBkYL/vdO0qzIztqPcV8bZs1PfoNLBo+U=;
        b=kfUK0vpLhK29UXfsPJ6LSV/R7XIhQbwbEOXHBzdRHBfVk0V+4H7b+fozUkUblzV4jB
         0tmk7aH14EJmZh2doOWfn4/rSHWKtqCAoF8sdC1j3nvB0KBnqxYwAbxSG9mXstBiLSH8
         pxIjIxMSW1yFvkfAhoZ8ZRy4Y1l2cwPoySqtcP5rd+fnWWvBk4PIdfYs3QZQ1vQozl4e
         g9GQFwo0lZGSq+BZCvzu0uhfNziKbNB22a3gBOPhYt5+Wzq1YzFabyb2n/z+yfE2AsT2
         HliAKxx4f2E4xp/jeAKxMNwdkY5YniBmojh2gHnzvRA5SINeSvUaWpxDt24/z+hGqdIX
         bOxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9S2slSuQMnhA98ckkx7H1IU4AqoniPgI3SF1zvUpzvzg8vyA1wrXzAiboutEX2LumD93tu9HwPP1fxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqOBAyWd4Yit9Q0Fi6YzkCazPwaWovEijga6Xs/g592XlmcPK
	xu6HY26TRKavCv1dgBHjQG5dcpcUx0bRJ6rGeWafCoRlx0iFQ7/aaPOb
X-Gm-Gg: AeBDiesdhM4XACEX2YVTQZxpgff6RPtkwhFrOPJKCVU0l2hdJkVJFhyYgyjBvLf3BcZ
	VPb/CXzDejWLvRFXtwP0Cu7gf4t3Nqp3Ig7t3fUb7v2tQjv3zUn1akTtsfU7rd6fxz5Zwprv9L4
	nWICtSq+8zpsTmrD2fSOZnzChkcNkP0p0sfBlH0N9f+Q5M79tKLb9Kb/ouwOqUPubpCb2xF3tvp
	N/gH0tWebFtyVEIWkSH9PXIo/tLCZlwvRaOakLlvubyO/LfKI2Cuq55ZNHLczg6ykDLfrtNkTuH
	M7yLvHwexXcEI+5w+UyxiTjHNdgs7uiaAnc96vCixea5T+5UPTY89JXI/PehNRkJqa4zE+qOBT7
	lgbMAsoiMVnXRnItXoVraShaMh2lmd/mYRr/Po7UVLbJo4iO1N0c5xTbuvcIuzKyzwn2w+LqzlR
	vqzrABAfv7oKDOSXVfTgB5ljqdPrfIyxCZmXSEv9PrE2zMANuGVBuk8x+XLA==
X-Received: by 2002:a05:6a00:1785:b0:82f:24e:6a3d with SMTP id d2e1a72fcca58-82f0c26b5e1mr14138598b3a.3.1776074854673;
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Date: Mon, 13 Apr 2026 17:06:56 +0700
Message-ID: <20260413100700.30995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable/disable the shared SPU clock in hw startup/shutdown. Without this,
accessing FSI registers may hang the system.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move SPU clock enable/disable handling from fsi_dai_startup/shutdown 
   to fsi_hw_startup/shutdown

 sound/soc/renesas/fsi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 196ec7bac33d..109e06b5f32d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1492,6 +1492,18 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret = 0;
+	/* enable spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && fsi->master->spu_count++ == 0) {
+		ret = clk_prepare_enable(fsi->master->clk_spu);
+		if (ret < 0) {
+			fsi->master->spu_count--;
+			mutex_unlock(&fsi->master->clk_lock);
+			return ret;
+		}
+	}
+	mutex_unlock(&fsi->master->clk_lock);
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1549,6 +1561,11 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	/* stop spu clock */
+	mutex_lock(&fsi->master->clk_lock);
+	if (fsi->master->clk_spu && --fsi->master->spu_count == 0)
+		clk_disable_unprepare(fsi->master->clk_spu);
+	mutex_unlock(&fsi->master->clk_lock);
 
 	return 0;
 }
-- 
2.43.0

