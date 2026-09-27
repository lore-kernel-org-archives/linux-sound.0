Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9D29AB1A
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469414; cv=none; b=lOV63zQP0hMnwsFtWCHnj+n3eoRx2CWlAU0l6nLz65Za0l2ji8ZJvCQAxP7Sd4TCdrLsbxkQSRz0whyg46tPPWc+ojrpOXsAfqiOkjh3LV8GusZxUMZlIVUD1izKfOizdedAwHUpoa2f3EHiSfowyvKijHI2jkkTNjWnDpK5Xnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469414; c=relaxed/simple;
	bh=ILq303uOQFApqHpSwLqgfAGel0sWx3G4WA50cRfJoXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gi85mJQLazu7KAsXrafol8zv7lyxCImsjejWElpZqLuzGcPbqnVjgxi07YQNs9V+9KAKKOcro4txc32iQl+2W1bkfIrcsQXcVvI0RH5pp9MHRWtMA6XRxkwNDZPmMom0UFn7XFQilYG49rZ1sfsMHlz4h0VgPJg9ezw/roBqSLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYTCUd+Z; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYTCUd+Z"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so1829219e87.2
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 17:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469410; x=1791074210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfImzflZZLyN3OyiIswXsjMHX+tP0A2H1jilGnkUCwI=;
        b=JYTCUd+ZRoFluiY+Rtz+o6HncgmsTusl0F8Vy0QvWDAReQFkc5gC18pXGpRBd4J+E/
         V+HPT2N6w8wSzfdJfG8MyCB/NvnOVYK6wuIksCF+UHqlAqVYi/1nJ5XaZg59K7e60z7T
         VKfEYmcpbCQZ/AYL+gKkW3lghoFiXA5fPjr/Y6DowO63HVq4Hh2YxBZQJN2nV8ucpTF6
         pVYxT9hVT8BeobvVqqWpydRBT22P2WCaWleNMNN7wJzRDlB7XLF08kTfqV+zWJb2Dnnc
         LvkzLpLbDBdN03EeACAfar5LKZS5TQl3MtpuL5w5um+BzDNiN2YmC1NCht+67VDwCPQ5
         HWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469410; x=1791074210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfImzflZZLyN3OyiIswXsjMHX+tP0A2H1jilGnkUCwI=;
        b=owoXIn/KpYSq+4McoX/jHYpSkbZOmi10qj8UUo6k1A1aZxPr+1qDUbFo1wcobmAnr6
         KfeqHkpPN2oNeWrVzDxMG3aiZvAQv6qZiHDjf2Rn5/0bRsA4KXY779dOwCHpC5zAL62P
         5/Lj73PGPyulXR9Bg+O5Q3MDLq2sqZemyBWcv9PTqqt/o8nMX3ol0PBH9R2ShxV8LQSC
         nvJko6vGq75WXwoNLmSNTMweMPN0Jh4v8JI6S5kUDeoXLtFNiCJK/XX3rq5e1f2Fo8j8
         hgJ/wHZIj40cDCFicACLgrJkAEz1Jm3RGq+mslPNkdzUnvqrxuZz1ndDvOJBR641RLos
         8CYg==
X-Gm-Message-State: AFq9FYLiezsvahSoijLjR8W/qHECqmu8bvErORIfOF9yZYg1vcKtdj7U
	6RuEIFGoG/LLCRxtGigU86gXCMv0hDfliBV0j6zYufkY4KtGMeHZZCfl
X-Gm-Gg: AYBFou32efdGIOPsjcxgY0ZP3Iurh6LYHy9Zx81YSunOPfRBqWO5eNqbjSAMjZBmfbJ
	gE8j86f4RvmmKZacBJWj+8yimwiX/Hg48iMOdPkmG5SZyLgEaGmxEux8bmyuARb04VsOl8rjhAW
	Y1zbg0Tksb8q2bnW0UwA1IaOtm1KAdCvxIMdFA9SJ3wcAQGd6CRLOTJgQMgUfPTTWrUVvV6rh8i
	oS41EZG2i9QYGTehtfLWjpMNL4wrO6hyqG1/PqEEwOXyFm4YMM6WjFa2MWodUnwG0WXxOXWuIh8
	zxnYqf+ao/mn3yjbhdHSs1jYa1tQHpCJhojXmwadRtV/+I2KazpIj9Q/kFxZiHzw2uARMCCccV6
	7J0IT2kY+zBrB1/LbpTs5Tz/6nG3wA1EIsuBB1m62GHRq7OuSWAwm1KSceLGw7y2I8VLv13QXiZ
	iDNXHtZbLo3oWH6bSBt42OMpfR7qzAJKhBbuu/Y6HkVYifh+cPAqsXE/bcsBjX2O3Rl1JTVhUW+
	IgGt6ACNje9m/V/19UI7zBnKEvRNP2QmaJwMwG4MuE=
X-Received: by 2002:a05:6512:628d:b0:5b6:6b8:1fc1 with SMTP id 2adb3069b0e04-5b8df040f22mr2889145e87.11.1790469409691;
        Sat, 26 Sep 2026 17:36:49 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:49 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 3/4] ALSA: uapi: Add hwdep interface ID for caiaq devices
Date: Sun, 27 Sep 2026 03:35:31 +0300
Message-ID: <20260927003532.289468-4-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SNDRV_HWDEP_IFACE_CAIAQ for the hwdep device that snd-usb-caiaq
creates for the LCD of the Native Instruments Kore controllers, added
by the next patch.

Assisted-by: LLM
Signed-off-by: Niko Huuskonen <niko.huuskonen.00@gmail.com>
---
 include/uapi/sound/asound.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index c11da9656e38..767c96273245 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -99,9 +99,10 @@ enum {
 	SNDRV_HWDEP_IFACE_LINE6,	/* Line6 USB processors */
 	SNDRV_HWDEP_IFACE_FW_MOTU,	/* MOTU FireWire series */
 	SNDRV_HWDEP_IFACE_FW_FIREFACE,	/* RME Fireface series */
+	SNDRV_HWDEP_IFACE_CAIAQ,	/* Native Instruments caiaq USB devices */
 
 	/* Don't forget to change the following: */
-	SNDRV_HWDEP_IFACE_LAST = SNDRV_HWDEP_IFACE_FW_FIREFACE
+	SNDRV_HWDEP_IFACE_LAST = SNDRV_HWDEP_IFACE_CAIAQ
 };
 
 struct snd_hwdep_info {
-- 
2.55.0

