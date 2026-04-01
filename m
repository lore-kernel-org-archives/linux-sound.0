Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDB1A9F87
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 22:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081137; cv=none; b=oIhtdgNLE7QSCY016V+2H7ZQkpSWog71r06JbzEN1WuFoTYDHA0RN5b6Q04ZTd+oN6KIxwHI+smgtW18jj9m1egaWkpq1dW6R6UjWA75kUpvcRL5fAGbrcU85YmQmAJisEzskm5r9dZC4vao/Qf8OERaZQJfJfVA1/eCMVrWayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081137; c=relaxed/simple;
	bh=ivLuBMj3afuxcWbJ4kR7GVNuMbDpAlA6WCS8sfy7YNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGyssyyjcLjg355RK/RgMgGF8t+C2VCBjsu9+1uieugq3EB4qLb1tH+ynyxf/qhpf14ys6R5R9xSvG8DLgabDCRWBSJYr/AyWCHYG4roKshOHCr9T+phXrY2qjex9CH7YDlWpJNQfwg8WCTe1t1aMk6Yx2hQgcQkM8Uj9qb0W2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsZniCGq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsZniCGq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a871daa98fso1400255ad.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081136; x=1775685936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+INgdF2y4zYdV9C/6oA6fBsIPWiGFzxJTAQLj9wY3M=;
        b=DsZniCGqrCLIxNCvtrc5J5ZZVHcCfWhP03PWd0W/DoC/mFKROv9+ehsNwLzW18YfCS
         UGdC7fYch3YIuWafpHV6cHc4iRIgWudB64k3g1AqINmEUbfdpx+FERhDPf4Rt5h6Wp0L
         e8jB6mE4IMu5BhvaZuNKw1HniumZCQArtq4NoYZmbX8KbWKo5jMmBcN2NMETd6ek28zH
         Xhstl3zmH9KO5ORuUoxS8zwX3sLB0d64q9XoBtl2vuEKUfIlij95XktlncIg5GbGGUt1
         JtHn+X8nrxq1U85RduFOvxwkz0zwmWA7LxSneRzjhmgRpMZ80bkoGNndWyqoTwihgtQQ
         x5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081136; x=1775685936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C+INgdF2y4zYdV9C/6oA6fBsIPWiGFzxJTAQLj9wY3M=;
        b=n51GY2Ywt/jFW1shJhkYeqKm21xJxeM50NueFWTuo1ri/YQBL45RRJR/bkUFRQYGv5
         +2AxS2pKMt+apk44bO875AI5nBPYDpq/lVx9VVL8Rfnm7rGv4CPZTrdYQYReN2JY1pHK
         3EBLYc8tTNIWxFnPw3W/Kb2fTZYWyp+U3ev2cashhO6g9XReg6KVsjyXZcBBL6AYZbbn
         cP0LZ3Vpa3ErWRCF4q16SJyk9I5kj8cGppEVfsPsuX7IB8JKWi+S8vPxFDI6osJKJiV8
         PMK5VGeL4jB+PUQmRO6DE/T9Z69Hjl7syICCRQQcAtAIVkHxZ16al0cu7ENhQX29fMx6
         FUdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPxnh3Gl0bzkmgBNVjSWIf4JKd2P1O5nteEP2yL6L/DDcec4NGBXjYAblevfPlWhBzfXDmWFv/CPvgpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxomC3zF03NnEQUNjcAH2M3R/9E0RYrrj8nhmI+THVakK5BWV5c
	eDvuVMC/DcTzCJ3xLXZhO4Dsh+qpXpUa4mB2DIjekAB653HE04+UPV7F
X-Gm-Gg: ATEYQzwQP5jzbTWp6HBxogkQPLya9piWqjA5nt6FxjBuccrp1CnYerNHR+xOYyaSrtV
	66XufUb4sxy1lc2PX/p81ZG7ePgv0l7wY3yy/6CV6ripBeOduiKU0qiZotTfUvjvSjh3OCVfHFF
	Yt51/FwKBC6aHzfiS/UQar4RIQk7JIpqXDYFXoj0WatBNpe3Tk2z0AzzgDOECfagWiQAEIz/Vmc
	C9OzTCtpEqmSE7oIa26CqIEGYmGa5kGU/uyXzl678NWl4fz4/rW8zGf/ITEXnVmmgjjTnALk3cW
	2dN0pDz/DfLAN25EItG6mGI3BW8sqgL7+rHZfkUJ2HE11F9fr5kClaan+tNK6I/ghP50Y+Y7MEa
	QfPBNVxv+k5jX/yJka3Kv5OWDdwucY39wgoCLWpwKe91jOqTYKSTBM7KL/N8fSu1H0+vyWnbzxt
	NNYKpHWOOwfj8BgL0LqF4SiviphjeFu4M8ewmeebcuij+S
X-Received: by 2002:a17:903:1b67:b0:2b0:c90f:44b2 with SMTP id d9443c01a7336-2b269aa757cmr55917515ad.12.1775081135656;
        Wed, 01 Apr 2026 15:05:35 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm9050815ad.42.2026.04.01.15.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:05:35 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: cezary.rojewski@intel.com,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v6 1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Wed,  1 Apr 2026 18:05:04 -0400
Message-ID: <20260401220507.23557-2-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If byt_rt5640_prepare_and_enable_pll1() fails, the function returns
without calling clk_disable_unprepare() on priv->mclk, which was
already enabled earlier in the same code path. Add the missing
cleanup call to prevent the clock from leaking.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..e4c21c9c5b38 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -289,6 +289,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
+		if (ret < 0)
+			clk_disable_unprepare(priv->mclk);
 	} else {
 		/*
 		 * Set codec clock source to internal clock before
-- 
2.47.3

