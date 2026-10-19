Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448944;
	b=bWTiUV8CBiHuOX+ddIlQj/PL0bdEHeVCmUaz0kEtpsGe+ZAOLi2ZoNM/Nf+wS1j/qUdS
	 PbQ5UrqAiLrX/PM2hJd/WeYGGkewK81L8JuSOFatW59dadQNtRMgUhSbD7oSwUq6si2W6
	 iFYIE1b13S5P7S4wO3r1llhFS2vxkyxl+Vdvt3WQPrwV6d9zmRrfQvAPMhwiuYIuWGHsM
	 4xUUQCj0vXRQjgFhnQkFdBZ90OPcCfPUiuPntfXBu4pduxbhxAwV2YEoRWbojcobhdnhG
	 MwAUwJcI/trWfcC92y3o2GzcWl6fwp0uWyWouC6c8i6J7om1gIPIJOB+ujT297coEug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/zPiFm+MYMeCXgR+R/3vOGfzWd58mbFgCChmMHZyljo=;
	b=ueId0G0U96UcjtcdRkoKFRppff8PXj4vUUWe0tZnTTj2AFZk1pn/fNGRP87xuY8uSbPO
	 f9hCEcgITXnZPOaszjnugItubRvFbaEThcuisP7WoSoY6E8g9OgOGMBqdOpX7WPanQy90
	 MKQ/t/7Ol1bXwbKxfXjC14p/QHxYi0IUuN4pM4Dtpu1297mH7tkJuW7wHwowPofL2SPBz
	 x0rjjnv6J3lpXJLYQBrk6EzWcOLh+xhpI+v0qba80AX3gTA3ME8upR+GGTpjChi1SX+rl
	 J9dFpc/p0GFWMCEFVcg5zLbxIBFOxKzTe9AN0ggSPHbW64/5v+Juqgap28F6U5o7gkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g7zaCE7c;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4827606A31D
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 22:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4827606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g7zaCE7c
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9905d61449cso669818241.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448943; x=1793053743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zPiFm+MYMeCXgR+R/3vOGfzWd58mbFgCChmMHZyljo=;
        b=g7zaCE7cgE/sJZEj84Df7U/vHOEiW7JSp+odv8yP0AIHxM3oJIsrd9/X0MdI0bBbYN
         7TGoDzQK5V73ubVsozi/qWqxCq2Bbqp+lWKlBH0+xvZdDOI0edyzU+G1eyDhtqcOwtp+
         6EAL8WZ2t3y0Qz+41bHrH9ymmTscRWhGf7Nc+IpCWUBC9YLFESXxH2I2rG3znWS0BgEC
         aT9KmgcaT9Rh69b0aJUp77BX57d5Vi5tp9tE3LJsUU99gyIwoPEH9n6cDdR1NoO3tRCF
         OJV/wLa2aDOvQ2Vl10u+tkKodZXojut5iEUeeKB1//6VyEKVuFkX+vV/1P10M/cJsPrd
         uzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448943; x=1793053743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zPiFm+MYMeCXgR+R/3vOGfzWd58mbFgCChmMHZyljo=;
        b=2aaXiwefefYVEtfxyAHH6OEUki0Hj27W/DOZzy2cZv4OZVU6NsMCdqxN6eFvnRWUxs
         1ECi9HhFcB2V/mp/iqcr3SjXBfYZxuH/KkEKMOQ4nqzCxpU9WzNXQjVwnRFyN2LENHxJ
         DGRoUlHradW3oeuC06CKSvEFk8FsxvCpAgmG9xKWf2mRCxSFfyJWWsJYTY9amc2OJTwJ
         J6b50Yfn76+DNNpc0nmXaanLDlditAmBM0m/OU3y8STL14Sg31nEelW+YztaZ4fzKmYF
         2LPkop5TiIi+MIE/863ymvYNc6gpidf91bjRpy6DRVZ5R+8Rv0o9JeZUBz5NWHDzXxhG
         oycg==
X-Forwarded-Encrypted: i=1; AKwUvBxshmMoIuWDDwG9EYg4bXvJMH6SSOgXSYBRRpx+2cb/+ljgqh1zrjVv2b20PX3L5Ns/10tTJqTXBQ0Log==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4sgqlBkmq9lnHgj+Vql+itT/lOkDS/1ajQyAehz7IR3vyr+dM
	u+mQmTOOoztI3j5X9AwnVOXKjyrXreWEdms5rxh1yxM6zlF8ezE8qYvK
X-Gm-Gg: AYBFou0+zgMrIH9kNKHF/utNkWEgEAt0UgNKOlKyu/yDP4Zi6JxFaz0kDHAUI10m5OE
	wxfyjW0mSvov+XwD144THWPiYrLDCP2aYa2ZngvLL0iQtWZKxNCGLJK3qEEer89fQNn/jNAKwQ6
	kJFOHxaWdnEqyh8DKjI+VwZMe7S0kZHKgsucB53iTBa9Q8mraoGloGH4OonKyjSQaN0A91kl9SK
	+sfxhyuFfx9WTvhJIXCMZrCfrZ6UdeBC/6vwgPiRZc4ILATBW7/xhme4WgPxJ+MOwhqqkwByT5k
	R4dZg2fsK7uWVIoYO0kkfgLfuVZCumghKCrk3gRJPsb5fFxWaeVViStyaNQ72Phri5rT6KyBq6z
	ns1LavoI9Fmenzxy98zsAzv9FoiNtBPJhENjcptlwgmI1dpnmZtSfIFpdBr4vZZGnWnuWS64VtS
	LqnCI4A6EfYShoKwbIwSOobALeZK4TgKkXeSIVG03NNpbM4bgWLtgkcE3F+ohbFQPHanh8XysuK
	jicPYVVn+wxEY2EvrMFNa7rhixqhOZKC4KaLuwnep0HJ1f3Q5aDNwrVJXGwI3BcRn2F
X-Received: by 2002:a05:6102:509f:b0:7b5:4f3e:70ac with SMTP id ada2fe7eead31-7cc36a29421mr1740205137.24.1792448942615;
        Mon, 19 Oct 2026 15:29:02 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:c1b3:7470:124f:adf9:af22])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc7722e6fasm1303685137.7.2026.10.19.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:29:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] ASoC: fsl_sai: Select sleep pinctrl state during runtime suspend
Date: Mon, 19 Oct 2026 19:28:27 -0300
Message-ID: <20261019222827.131120-3-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019222827.131120-1-festevam@gmail.com>
References: <20261019222827.131120-1-festevam@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When runtime suspended, the SAI can leave its outputs at their last
levels. If a connected device is unpowered, those signals can source
current through its input protection circuitry.

Select the sleep pinctrl state after gating the clocks, and restore the
default state before enabling them on runtime resume. Devices without
a sleep state continue to use their existing pin configuration.

The pin-state issue was reproduced on a custom i.MX8MP board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a135b3da37cf..ad21bd3b8a5d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1959,6 +1959,7 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 		cpu_latency_qos_remove_request(&sai->pm_qos_req);
 
 	regcache_cache_only(sai->regmap, true);
+	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
 }
@@ -1969,6 +1970,8 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	unsigned int ofs = sai->soc_data->reg_offset;
 	int ret;
 
+	pinctrl_pm_select_default_state(dev);
+
 	ret = clk_prepare_enable(sai->bus_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable bus clock: %d\n", ret);
-- 
2.43.0

