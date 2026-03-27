Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28EB39901C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645480; cv=none; b=YmLWT77HIuOGfGphoki42OfDDBFCPhXlSLs2echX2q1i9Co96idasf15hHvnW4g6cLo0sL1Bm1V+t0XOXQSgsi5XS+7+x4yz6Ww76ms6EAxUWEoAZTueCU0HwsCCfZuOBG7iIohN8nMwGS0x7yure5l6Ga3l83Vjr5zcry6G8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645480; c=relaxed/simple;
	bh=92+MxE9SEiqswIswB1QejRLUIDn30JoIRpdlHoppd08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlqoHuWvq+FiT86FUAxBGU2kWSs0Uf66+zDhSQ6SYxjJ4ngYCUsL5RM6ER9eC6Kbe6lZs6PwFRZHvoCQL9h61BeT+cuHPjkJ4Az5cEgG0wiqGyYpJUT5IQPFYN7LYY83dLtAbx4IOVABYo8dfNxic4xeOuY3n8xFpW7obRvUmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Faxj7K/B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Faxj7K/B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a8fba3f769so10882635ad.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774645478; x=1775250278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=Faxj7K/BMFQi9OF57Y9x2fedcTDa907an2IvkDswltm9JW/kKOx1uFdDSB7TjHqNmP
         D1PPgwH0s4Z2Tfzd6wZ3p3TDwQA/Nektq2i2onLtqpnerRew7d5h2wkSD5DOcz5Nc0Yw
         hOy5ldhFcVdOXYj+JMB+IiHfAuRuhhHb295Uh64PK6ia97b2aycr0TytY6jkUPSR5454
         RjPgUhOYhoAvAnnxNn7EkLvHZlHZ6KsO/52FzPc2/pi/4jb8cCC4PZOspYbgLfG/c/Ca
         DT98dBuaBiz2HA6r1IIOG+1mbhT3ACeGFAASzax8XrvdVjEL8NZLA5qKzk3R6wv1ikiw
         kb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645478; x=1775250278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=buv+eQU3M6mCOb7GOInYv+33WjXcffDkYio0oWUmahaS0yTBqq1euyjM2UQsaf0GPy
         XA2XGQHpdmWbMtEml24jKFKQMWWG97nYT+ndrsDllf93bA2jzm4JUa3YHln8jW+k2Dii
         KEQFqQGGCy+3zzeNdMvQUlWii9m/mC+wM9xPN7ZVk8DtDRT9h8LG/yKEDdahGRAyZUjW
         V9JVTdJbFV0quKe7Sf+OUrBkNTpanUxw6LGzmXEt4LubfnCxV1XzDcxHicEWrAM1jzeE
         6o/FOchK+z0TV2dwSSOnqkgwM+s1WcgzM1emIAZEVlGdqDVxadcBZ+NKO634ALQxbfnI
         9A9A==
X-Forwarded-Encrypted: i=1; AJvYcCV6fXBCmmm/giHnV5UQR3mh7b1lJXfI16aEabEB0DTe6j6a6Tb9o92mcUVNLo9UzoVDMaNqzX1SV5fZ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86p26kRPlY8lU7D4p0JHdkn3mURKzNg7fjta4rODqjQurHRTx
	nTmmhLGQaLMI31uy1g5Av9KpLOoxEOcQQ1Y2msEmVfP+7MGQ2Q4IZmELfI3RLy4v
X-Gm-Gg: ATEYQzyQPXNVDfjISnEtkanUwseBFKu03Mo3ykpKQ3/PsUd3K1opOOubKdKcP0J0ALy
	MoqTJ+h6QjBodnT7jRl2qsgxGRRMb3bGT9KtMNxPeBsUlfoc5mcUw+KqpeDvNu8kt5JrqjA0nNY
	iloR7C6Bw9VqVexEZZmniFfokyKsNAmZhy7+rVrQhUEvjgdHwYvXv1L6vlV6HrX80RRnCMJukLs
	7jxkZb+iQ0IyMGW34+cuLgR8EBFR9e5T/YMoUooxSTSU+hY1tnc1Oru4k5rwMIwJkIbssDIauC8
	wPqhyh8pkv2AZJTraktT92GWfFK3Vscrrp/xYtw+Ftc205fJjr8SAKlDJaA2O4/88i19wdUaE9j
	PJRTK4UFbmynyaHLeZdJ6cyXZxwxo794bowQ7o2CJm9xm0Vj29MOzB8qBAFv4R2YvolC376+EwI
	GeDH3RkrOqVH6EV2E9td2Wf2ZpFJmcR6BzLRSy2kqgHg==
X-Received: by 2002:a17:902:f54d:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b0cdc215ddmr39829125ad.13.1774645478266;
        Fri, 27 Mar 2026 14:04:38 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24250b15bsm2358125ad.0.2026.03.27.14.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:04:37 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v3 3/3] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
Date: Fri, 27 Mar 2026 17:04:08 -0400
Message-ID: <20260327210408.430908-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327210408.430908-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327210408.430908-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
EVENT_ON path, the function returns without calling
clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
in the same code path. Add the missing clk_disable_unprepare() calls
before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..e5806dc16ff9 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state");
+					"could not configure MCLK state\n");
 				return ret;
 			}
 		}
@@ -77,6 +77,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				CHT_PLAT_CLK_3_HZ, 48000 * 512);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec pll: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 
@@ -85,6 +86,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 	} else {
-- 
2.47.3

