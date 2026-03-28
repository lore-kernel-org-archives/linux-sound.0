Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC82652AF
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 05:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774675597; cv=none; b=pJjRGx6oqLvVt2JYsnmOxOSgi3b6a1FpMfpNCEHlKyH4Ahx0vQge6O4cyw99jrcIiMNGAy/567X2BNxOV9zXnGvkCpznh5KzUNN0NxJW6RjDnfYzUAsj6SCr6IGhfjd737fWO/Szd1PrfiR0jubdiYyey84g4Ky3/fcYXZJhIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774675597; c=relaxed/simple;
	bh=hV0PSRnR/bl4CdLuH0CGuwoqFy9Ab3KJAJrnQZux0Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kN0CnxAvGVxQzCxcdlILNIPniQkZsYzFxUEI85HXwyRM6Bhpd0zb2xTMHZOyk8U3YcQsWqpdM7u/Kx+qiKc8agu41jX2bYGukkPwGpo8VFWkyaStaWAPBTfwMTP2PGbqkeJJbr3UrB7bfX5dGtG2B1t9qWtubvqimciuGHKK4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuqNlO69; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuqNlO69"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1992487b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675594; x=1775280394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=cuqNlO69zldCyE9N1IbWg33iBxDlvneU3zx0RnwO5rr26tEnZ3+f5i5mjIM3JfIQFD
         TnDRadImNYiKdGSdX5FmOFnalqeNBCwct3gkzTKeOVQ+bBMzaQDiWtxs40RQ9Z/lMokH
         0ORcMiJPnDX+7Zdm+22Z/gosJeCyTdHsLua9dBv7Z7EYYeFJhHee5HYZbhV/mlHL643Z
         inB/cm79SEHOHBWg5kguYpvnv1C3He5uh2JTu8XcOIvBF1dvkJutLh1wRJpF7VG2pZPV
         amQ1Sl/VV2e4H6+KrOCEH3sbSmrA/7N4gXnFDM1nr1dxmszuW+k/iPsoqdRLTIVB3sid
         Xc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675594; x=1775280394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N06TUEQJrWZFxO33UjJmD1NIhQS6pZplfv0sDwxN4UU=;
        b=iKvIMrSPh9SGKJAEP+VwQAzHMiAKtVdbR1pWyRYHU9kIMykLgBmTp1EDSV1SoXD3Wz
         vWXmEL2VaKGh1NXQcVm1MuFVRTFd2JaV422VAMLpr/jQAqn0hCtGxCopkTDxSrTU133F
         izeGSOYtmLMj4G0+axI7010Sh00iECEY9fC0rVdmxE9LZiMZ5e1RHy6rLV471/+vhSzy
         cRydxhCx7ZM2fnjkk04uYsrD0ur/VkIOn9e4I+v+oVfIRScLizvVCoyzcYKYBvP9wTGl
         U1uCcDUu9Cq4DKnQZGn7NA4wsoG/xU+xRcrVykb1cfkhalghYXSF7pBsihSEe38/DZ5y
         lqrg==
X-Forwarded-Encrypted: i=1; AJvYcCXP3nZC+EYbFyZPOehLreaevHGa2jXHQs2hNHhIO1RRxY6nj9bNynk54PLNIK235vaZR8wO+U4YaERrag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr5r4/ROPqkEMPjuL1d2Z4DnhWwnvOyHMZFwkGhtoBucVLfsMO
	7PPUEbv1g7tO3tcvmhtRbbWS5QtGXoSuzijFwhf3uFP7DM8Hq/7RHVdU
X-Gm-Gg: ATEYQzzF0STVaX6Y3bp1UJr51PN4yXZzP5J657wS5hQfDvIJ6ghjhgs/eiFhSDs5IwJ
	oqpp0vlHWNcRIPH5ZIEAdVSGXX9vSWUvIOMOaJbjdJSjbARYbVKE812BXwhnrocjL62SHd66S3+
	olzhZ1++zAl20xsXD3wgTob6eGumb7m5wpjKFcyym3zycKsuiBqEgipau9VTl2HHlPuA8rjxcpl
	TbxBT6Nsbf/+uychz3FpFHUBBHDVfrYs7HpWdJ+utZb46c6ipCsDiiRms77j39yHSUj4NzTswgf
	1GCHmYptj/rbqJ1g+PIOl2quE8ypT6w56a+YuJXQ6Wan4rn7NTV3ngY30isSfMQvsFmFqlQtzEz
	U47bh3CdtkA6sioVCjEv3ZvTYk37mEDhrE/N4uU7a+RA54vefhLsX8GS98X5kjV/y0Kp9dTbIjQ
	19ZF//FZLCoP/5zdBVcEBxQGCCzqjC3qfBRFfGSN3D2IcJECco
X-Received: by 2002:a05:6a00:1da4:b0:81a:857b:f944 with SMTP id d2e1a72fcca58-82c95e4f7c9mr5057522b3a.26.1774675593923;
        Fri, 27 Mar 2026 22:26:33 -0700 (PDT)
Received: from debian.killsync.com ([152.58.216.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86307a5sm923739b3a.60.2026.03.27.22.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:26:33 -0700 (PDT)
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
Subject: [PATCH v4 1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
Date: Sat, 28 Mar 2026 01:25:52 -0400
Message-ID: <20260328052556.434191-2-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
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
clk_disable_unprepare() call before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 103e0b445603..fce726a9c8c0 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -304,6 +304,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+		if (SND_SOC_DAPM_EVENT_ON(event))
+			clk_disable_unprepare(priv->mclk);
 		return ret;
 	}
 
-- 
2.47.3

