Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CA37A825
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371725; cv=none; b=VmFBMENCu/sALIfnNgKHsd9Dd4jPOXLsZVd4y2R5uifF+BdrYpjtB1lwAmRFuxQstci3oTFYZvZQGI7yLCD8xA3NvmvE/yfbll+758hmOrtEPlSib1Co/evf7J9JjWEa7KWmt3EU/ixwFij+2HbMW30iN6ZhBgKgRRlaNLteQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371725; c=relaxed/simple;
	bh=lxYajqr4+u9bb/bxk5jn26nvm6QJFX3vsnrk3DRP0b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ncc9OLVigfpikxZ25LzQdf1PnPcUVTvCwNRSbM3pU3fTjJozg384FlB6qzD5N6IrebeVcxArpD7wBiqpaWzwS5ehQMUdP9jwwQtyd2TbgvaBHZBEhMSbwbvrS0rWwnDkd9jGgQ2e3sFwyWK1RvVVoz5Tqg+DpbdLMcA6nSjbEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkETxNhX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkETxNhX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso14262615e9.1
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371721; x=1788976521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFRI8+rNhkKH03jGhsaVXbeguN5xAlvbHG9GZ36jhpg=;
        b=rkETxNhXjVCI539Q9hSsjXfJGGMnG1HoAMijdlSt5nNSJfcz3S7kRnBvw4xnlH/lQ/
         E2+q83AZLgkd+CVJxs3ePwp6vsItJMPKBw/KGTdlP/kYbbpezxG65V+A5Fe4AqmN9Lop
         FWWBNSU6BdYdRYHoLrXlyiqsFtCGDQH8HsHp0TR1ziiKfux/piuMJR41NAHr9cespL2O
         tyJxQcGyxQ1U2lfmEsh6gumk5xlecfPfX620PX6niKsAhMv5ZeS5/S8PWsh8SsZ2R5el
         8UusA5Mp91mAk5TV2ZTpQNXy2p+dnJywtGHLGsL4i7A69zNkF2h+qioLyI5JwHUaClUd
         RbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371721; x=1788976521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFRI8+rNhkKH03jGhsaVXbeguN5xAlvbHG9GZ36jhpg=;
        b=d+yVchoA5vRI4mFvHDRC/iYudoHdheQXXOsVlpzlOBuXbboGmhKWQlEE+Rrn4V+54u
         QUFtXME1qfOhyAU5L7lmRDmrr+4lNWJQFtYQvdNBHTXDxyVSOXPDLwv5FRZ1k9NrPacg
         7APZIyGUQKMI1oqdnwT+MYAWjeE21A6UNUTLpgnsxl47/3qytcfdQtU6TnRkBGTQLiRV
         eTgO2AaSnvny9sPCiYdPUSn3/G0VwUs9trHeE1OmJpI9HgU4jFX2WLH66bL1dEa+UXb3
         +I4JFbI7zNPPYoCbfD2GJpc9gRcQB0mMZw/Qd9mTdsTfu6c8x8vfJ30CpwEbNMeukesR
         bkBg==
X-Forwarded-Encrypted: i=1; AHgh+RpVAmyIyI19IqYNZTKkdTHNUgMRcwvmSIhl1ckQiGEhVpWL2pBLrF2r31h4TO5kksQzpffwKU1ah5ShXA==@vger.kernel.org
X-Gm-Message-State: AFuF++lgtoNnJsZqKuYGhD4KIVciiH/KVKZHoCE1Ld4LkLKrL15UrZ5C
	cvVlh2Bwk7IYZQ/Hfl3ixIR85cI2pyFkrYW7CoWagy3JoYYKKZgFGwma
X-Gm-Gg: AR+sD13u9u6XvENKVyY4m6R7TnMgIfZ0wjszV6qea7FpXthV3haQ67FSXK3gFQS5pZh
	f4yf48ao0aZn9HJhhXQu5sa+O1Il2Uc+i74AL7at4ZE1aWKz98wilDKP7STwgQA/eyNCd8jIcYS
	ZccEJRWJiaBtl6Z8MauM/vuEfwM9IJIjfcFay+JjwfoFSfP12bdpSeMaJ1im9jiE7x7PYXJlKzh
	jQBU/aZ9wUyrhYwtV2EB2cKRcMpiYu6hbm4l2qYFa9ioI4MUoieZn/gnsuYqSsol/bjwCs9R7rE
	J9emFxYb7V0OtIsDC4GPrKunWUCZdD4INZConBBVFYlsrvhbRdDBE6M5Po716vDcMrOtXUy4LJN
	vFvuhhnKBm7JllDTApONWK6DRib2y0sP4F/jfwdXsAksLE5+Yc+ylO/SBij+9Z0Ns6F086axotK
	m0ZBiRFeoJTTnX2KXWqjIbRK7yUh0qigVsn6Wcbk/zg/izLcoLSZG2tHt7zCcv06w8gYJmAJKYD
	U6L+eHy11chZQepJ8RIvxTkG3TAUG7iDSJLjyRlOjEUSZUkzAqFVZOpecRR2Dhkeao0z6ZUaqC2
	DCNQUn33jxVllAVWwb3IhlXPyDO0lhZl6MD9H3A81OxeMU0EoHPOo12L0m9NGj4HO+isf0u9uLC
	F/xYKUyYkFO+D1W8I
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr137492565e9.14.1788371721009;
        Wed, 02 Sep 2026 10:55:21 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm9693665e9.3.2026.09.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:55:20 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return value
Date: Wed,  2 Sep 2026 20:55:17 +0300
Message-ID: <20260902175517.209406-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

imx8_run(), imx8x_run() and imx8_shutdown() check the return value of
every imx_sc_misc_set_control() call but ignore the one from
imx_sc_pm_cpu_start(), which propagates errors from imx_scu_call_rpc()
and can fail with -ETIMEDOUT, -EINVAL or -EPERM.

Reporting success after a failed start leaves the caller loading
firmware onto a core that is not running, and a failed shutdown is
similarly hidden from imx_chip_core_shutdown() callers, which do act on
the return value.

Propagate the error, matching imx95_core_shutdown() in imx9.c.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index c2b4d379a3a3a..0820724dbb349 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,13 +41,18 @@ struct imx8m_chip_data {
 
 static int imx8_shutdown(struct snd_sof_dev *sdev)
 {
+	int ret;
 	/*
 	 * Force the DSP to stall. After the firmware image is loaded,
 	 * the stall will be removed during run() by a matching
 	 * imx_sc_pm_cpu_start() call.
 	 */
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error stalling DSP core %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
@@ -88,8 +93,12 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error starting DSP %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
@@ -105,8 +114,12 @@ static int imx8_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error starting DSP %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.53.0

