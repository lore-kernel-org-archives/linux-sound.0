Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA737F749
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639844; cv=none; b=MWmzKC3cujA+1WJ1nlngF4xgqyep8m3R20WGmlXP1j/YWPl3N2OyocnzNB4Y6NupB5Z8P0YNuzLtOOkfjRWn+d9BppW3GX0bDHqMhJId6roNT3PRdkw7KmZcHXfeGGWktC642Cy3blZHb+0LsFjG1TEPyAaeiAHk/Pfpy6bOhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639844; c=relaxed/simple;
	bh=cMuVH60s0jC7glK4UAYNyd5esKa6O1q7zTzEgaJ2VTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoYxB3vJu/IABbugA1AAesNfBlOsI9/Dq9728OxfZQSkZrtxNsAc9UCPdCg28HMQ6IoEWpXwgI6FeoIQPKf+5O5P2PosW7rCuZxFs0JqQGFZmceOF+4zGG1BU1M+l50QHLBdYB7BzB3C4OH51Ykcf7CFAlLASe+oyu64JIVxW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Pm2kkW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Pm2kkW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1783627b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774639841; x=1775244641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7gFwspXAi/ZI+xh5ATLhwwUGscd+mp4HFWUIdYWFYk=;
        b=E9Pm2kkWRnyCmUN8CYybjYasj3edkQQZKnGjAPqBjkeqJcp5Z21CLJWQN0IkwDHaBT
         tL9MD/uj8QTiK+6r15LKtxb3VEQRFFf7RVHV5/9iK388I8lUxrRkDjg85wjbEiWTOtKQ
         w1zCwlsBEdDDrWESOs3sdAhMybTFc434OhulveUfrJD9VmYFLGfgTLaQuHyJPnKxO5zC
         LkKgyidbGQajTFTA4wX1VpoAAh/dPtdAKUb0Sua8TpASzczcYuqVBZKQz/ObGK8e96V4
         dV4ZW7G0pHfVopwftorWA2iJnF/Yt62DHmdKfE5LwRDtDNxDKxbIAbTDhUdqvegPCqiX
         ShCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639841; x=1775244641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7gFwspXAi/ZI+xh5ATLhwwUGscd+mp4HFWUIdYWFYk=;
        b=kUOXY5rxSLmzAPBdGV+LH6Wxlsyt3JL+8Y92V2JgO8i+dvLzu551xPedXmIwQiHBYT
         F0q6wLgF6ktEJOXlO5JM3ry9k6IyCCVDndT9+p/IZECcqOKaySlTPx0d/HYDmwV4SeiI
         ndClsfq72i6MU9ICsfTAFbxczNJMWIqkR+KX0zuqq/++OuiB6z6xF8qKWuUdSwADX4+y
         JH/cR8LlRxTGDBW9uXwpqCB2sI23rPLCsQtLGHNAUlSbFijuarrrZsq9br42g2kPlZe5
         wuZg+z+RwOydCDRWeKU/1UHJAOYZkZidivooLHeGdcLbEQWs52TH0c8YW0CtIQkaPCy+
         FXTw==
X-Forwarded-Encrypted: i=1; AJvYcCW+PDGaM82FxGMlNibOoaqboI7bf7G7oQXSTP5N1UgZ7kG8+5/PTfNN4i24GpC3h98fdJhk8qJlpTkgEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt+rBOqoS4AIVCsiOlwxfMHwpXlGrQ9frV7lOn3GnBHIIvDPzR
	FT+BUBmeLEXcc6cD2cJ8EzVy1XlKdi+hWv9d4wc0T7c3AKlh6mfff6aV
X-Gm-Gg: ATEYQzzQN8QcmHEZBrXQ3b6KHdbGpJOzl4szsi6oXseQw++4AHPlJAixWT4GLCdRPxB
	epX1xf24Qh34XVXEK/o0rYf0b2FGB/jo+zwZsxvgvR0jGWuUFA/o+htv/wJ/jJYo1QkbTToH4OP
	zJ4HgB90AUc5UKB+j7MMbFTAaAeIAU3nBeQTtSH4dq8gieIJ0QelOJ0bEIPVhs4qTmgj1znxe6n
	mPaxmdoPiEDKh+YqdCCXR0fDugWpafBrbIzdNXQEhriUTkU824vRjveXp2FBIuPZXmpS+kMTW90
	3MqKSB5dHqQguqSbgWPf/q5wr9yiN6KML2d1XWEgesWevZpsP2cFPHiMb+P8m6BTZlpvF8aJXoq
	aAdJdHJ2t/La3zP2w6A3nyqAUaodL201rJeik9vuEL/PEeQB1s03oIVsSqHaJygjKc+hsh+CQYs
	kaQ+VDM60sLhvxkFBqEOKLUZqmRvPQ0VyD6Sigk+yXfg==
X-Received: by 2002:a05:6a00:1398:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82c96001522mr3672771b3a.43.1774639840906;
        Fri, 27 Mar 2026 12:30:40 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466e01sm25136b3a.20.2026.03.27.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:30:40 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Fri, 27 Mar 2026 15:30:00 -0400
Message-ID: <20260327193002.423897-2-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was already
enabled earlier in the same code path. Add the missing
clk_disable_unprepare() call before returning the error

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..3ecfba161e56 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -304,6 +304,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

