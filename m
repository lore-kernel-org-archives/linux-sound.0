Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351694;
	b=Wr4aIdDPVaisSxjuSthjG4CUG57AkahyLCgw8Edy79MYc4WG7+OEZjwhdTXUGHbdMRhx
	 6S4ygmLFtfxBwce8IQIUXX3mAHlQdaYhh7lVmXHFO/ZCQto9ql6lo5ewEG11UaZPz4pl/
	 KHcUScEQ9X0W7nu6/e/0JWzPEvNlbcrCiYK79RKIwDYNdm3ceAeq0QMZ7aerfYyJjMYmm
	 BgJ/shnlHxJ22TPl3Ky6rD6BX50m8MaIxgrenZG764ESqQDJWs3KXwv1c7M1Q7Q/AO5dP
	 /1W7TX+HySUfKREd+0BU5CoUD7NqXQJFQ4LHHbPLrjb65qZGCcwc2+jktYZIT9hNwlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
	b=msqoljz1kJbu5A9lzMDJmAfjJxS4+JnbEdpS1KG7VJmEJvQw5L9NeKbpdYHPoGAnCBXN
	 LOPp+svZYjdw3x1hpRKIWT5ZYLMAglcOqMlAIaxIYDg9Jk3asmS+NxDv7Ci0DOxGgpA7V
	 BXf+2a7ksYHi2Vj6H470AlWIdciEJy2+vtQziagp/C02UN/q+JTJb4BnEifBuRf+FFk68
	 K9U4R6jSO6SrMQeUPSPx5ovYFIBTNHDl2/R3SPFbJbR9GBywr1ysNa0wZYgBXCFC6DLsJ
	 ClMZGYJenGHVridaE8kF6kH8/OpP4e2bGSiOO1CaTHAg+c8SPPICCC38anvJbzFgSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3JMIwS;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2851606A320
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2851606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3JMIwS
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8b20a899fso3493925ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351693; x=1793956493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=gZ3JMIwStBM0KMwHxGH/IriLhO6//9sJiOxUaVBB2dHP73oy7rda/qMMrUfoqGYb4C
         f0rS73uIYXk59te7wIvSfCjqFlTAsYI432IYQZkRC/3tPpB3HXkRAOU4SpBzWNBEpsI3
         KY7gQnJSFwmPew+Cs/cDIMMaYwhGvJ33gIHYx9Gwk5PEnYQdS+oiE2AeNfrpu+htrQcF
         Mna6tDX/H/1mNu8hfAbnDIQCMUKfNYxZnA2pJ7G6c9hDc+Yxa66eEBYyHC7AD6u7+iS0
         A/Rap1usdLB598S0LRqKhjO0GkUCmVxCM1MvR8NMrvbOjW98489dxxIf/AOVLQgsAJoW
         MVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351693; x=1793956493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=GCX5lfFdchFV/dlNk7fddL4ZSnYCvyUNEWZ2Fws8cjn5vQGleWagZtB3CNh7ALHCVx
         I9qzN2Lujpk2CDel1g91ZUSdiorzpcV+vWEqQ7KS3Js6gnyaUlfIi9s/1es1P0iVYFNf
         kf+1rB37KFo5mwm429+Z57OF9BZ5sQzSROn1iiIC8Lfm/dYKvsKMa2cSPPHOlUaZyjqX
         p6nKVDzwlS7BTZVs5cA5u3zipO1Mq9uLGLU4baQ3CoGviAt+ApMRb+nLHWwWZl9oad+I
         RpmRAY6d2p1StuR4ardEomb3v6rVBCS+J6d9HvhOQUip7ljglOzS2TpcT5qLSbiVaG8h
         7M5w==
X-Forwarded-Encrypted: i=1; AKwUvBxjNWa+xxZPKXEs6YH+gIeTfAQhZ5xJeakvNCD4sHOGj3cnEOUSY4evuV0ux+O8L+Ylp88WeZP4WDddSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLXw/FsEtSfipSsJ67oHYtOPUY1B5hsReENTh82+2NZ0ghyr9bQ
	ywR86s93qpT76cKFrAU5wL/uFfd8quIYgm4ps4Gl8eNjMxJGssszdphE
X-Gm-Gg: AYBFou29D2CXFsfmDh8XLcVMutbSWtVj9fr+r92wWMSRDUkO4kow06SKRJzFbLyby7t
	i9118zl+r4/J0FlJr2Kcwxob/qXMQ32zTHbNmh1Qxn++xpNnRYBljFrH15ERqPAZpsANhuClDKI
	VxVnVRNC/dmO7xodCAFrX+gLOpkFyB8YSeXheVDSqaQIQYVw5lcGsXmDhswxiYB49Y9QPNBl3qk
	veFlJ05kSDPXF76UzUYxZLOl+Npwp3OSk4TSOwfMX3MG+OVf/FkPeayOoP/xRMNxlTrQREuZiVl
	Fj3l1DARfsoOKyFkXglqggjQBaOJq+kaV3C7L/epoyghixE0rgXfB6wqxhZ7WHiPhztM4mKVZxr
	XGILGRTCbB2ugo/+EiG+QBjsEUIcXahBiOj1d1P0oKHDg+Q0OTc1aLRNZdHiP7dis2EIPcI5vSl
	UOQ5+AvlTsZy1+Fc9efee/WxmGhAOqcsvrwcXuebbczCgZO0oN8PLnMB5c3T4i1zkFu5X0CAZcX
	gaXX3AFVEA+f74hdwHnHLILhYQBWr3Hvc5O1RhUE2uoN1rkaHRmCHtdH4zEqpMHsd9fp21WK/bK
	ImFxOP16H++Hqol7wsS04CgtdLCTLHWdZzYt5FCz56IvHuaqTKBpQGquUx7aemtITy8/FZX04/4
	c2k04fUF+ygtrE88eV1lq7YgvaKba9zhjUePL83cbtCaOcA==
X-Received: by 2002:a17:903:1ace:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2eb364005fcmr20273635ad.2.1793351692941;
        Fri, 30 Oct 2026 02:14:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: fsl_sai: Use optional clock getter for MCLKs
Date: Fri, 30 Oct 2026 16:14:01 +0700
Message-ID: <20261030091404.18757-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The current code uses devm_clk_get() and sets the clock pointer
to NULL when it returns an error. However, this silently ignores
errors such as -EPROBE_DEFER, allowing the driver to continue
probing without the requested clock.

Use devm_clk_get_optional() to handle missing optional clocks
automatically, and dev_err_probe() to properly propagate other
errors, including -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 042885ba415e..44a34f48a0cf 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1589,12 +1589,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
-		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
-		if (IS_ERR(sai->mclk_clk[i])) {
-			dev_err(dev, "failed to get mclk%d clock: %ld\n",
-					i, PTR_ERR(sai->mclk_clk[i]));
-			sai->mclk_clk[i] = NULL;
-		}
+		sai->mclk_clk[i] = devm_clk_get_optional(dev, tmp);
+		if (IS_ERR(sai->mclk_clk[i]))
+			return dev_err_probe(dev, PTR_ERR(sai->mclk_clk[i]),
+					     "failed to get mclk%d clock\n", i);
 	}
 
 	if (sai->soc_data->mclk0_is_mclk1)
-- 
2.43.0

