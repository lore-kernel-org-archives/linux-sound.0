Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1443E274C
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176001; cv=none; b=c/enoXAXqTn7dI055Ex9bpd2zzMFHvzUVX4lWkKQbOJ0RRbNPCmK0Wz5PY1VkiYUlcOtspnR+ps5oG2RCoLDb/A/zHDbq3OA5avKhIY8h3ELf/EazaF1/7dh9J8kMSufrnSmY0Hs1n9QmqgfSW+97hyAROyqNVs/5aARYNECKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176001; c=relaxed/simple;
	bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvR8p5y7jn14z8U0C58D6wx8pVlv/k3TyKRaPpe+Otu9A5wH2OtoufGKXpGKNqSACeQDJd7+ouSE9yB+KXfX+osvCFuzKuS5oSBZ0GEK9d3kPJJAHNuVumpBK0ST7GpdmK3himl2gLS1SML1A8/4ZAtgsOUtdo245MuVhM3VRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTlILffn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTlILffn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2713706a91.2
        for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175999; x=1788780799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=NTlILffnbDpnLMidxobJVvhLBrH23duW6ACu4RY5FeECbf8FLsT37CL0dx9AUABgWt
         WspEQYv8a0QFw/csU22QUbB/0EofD0mOemBl8SFF93fQin539wfQBEWJzw3CcCUVJCwU
         8kedMcMIGK8TmejIIaZa83D/YRm5QPTee0sFJYCYR9yk6FF7xbxunlqfpC6J6Iecv3pp
         3De8UnTysPUbiblAxW/k862Ez1g1y1c89+msKdGmg2QJOH9sU6pDTQTIbO0+NuDSLgOy
         WDvusx2ubM9GgLmUaWEEsW20Xjl2Og9I8430SaON5gz2g2oey83bmdy54n0p8Zdgu0me
         P1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175999; x=1788780799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=Bj2hiTbImXFNgIppgxi7L34xpJWCy2jjXFIeiiKO8XRBuLPd1XRNQNG7PbcsItKhC2
         mSdMJUm7IaJ0F2yg/tBiWs7wB1MVCmSbW2mxesqB1dPdxNPSt5VABJQmrn+bCW7rnUuk
         ApB2RpRcYMTM+9/kAZ/5ImXMa9s4/YmSweMMBpC6UYp4Bo/k+FxNG20SsntIGyhGo+X+
         kqynOtrR8B7upAuADLvfMJf/DDUykMnOHQNOIrK566H0KQHoZPt73tJ3juOC06F7cobh
         J2QE4/csHwNUuIV4jpFFptH495Bpf5giqh271ouB/StRlxmyAYaknmy+cbNuBhBzk5+R
         IvCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBJHHAlubH6UhTT21rjGvjs/59EuA9NS/xSijL31dbWxvNBmUFKKJo/+7h5B0vLixxSvx7yujWe5Pf6g==@vger.kernel.org
X-Gm-Message-State: AFuF++nqQU2ErP1QQqwdC4eGEyPNpdJAnsVLRN4TxYmuAwaibVtnIWB/
	zWOAfXx92FeC393Y6bCYIOkF26oDaUFJyyDIPmknTyFgmQwhYqVg18wG
X-Gm-Gg: AYBFou0zFCIpDI3rmmVavwzojC/JKAe+AST+JRGu7mSlyCKxmxyOJ0Rt5sr0Q05WqCG
	0tVKnwTq05KwYuS6mr+P4AFD/3AkTl38+JSzrHzOiZrk80/Xb6Oa3kdYF7Ajfrk8H5kEADa4vng
	NJHH+8J4BleALaSQws+Pvs6xkGH1W3VITziIJH57oyRTTeJgZFdhNL1KrHv4k7wAUO5iWHzf3aY
	BFlsgAJ6YW2AluZmDcfmCcPIUNjmPGl+Hif0BxoGgD1abrJhXiK3/FQJA760/9IUxkN56r+VmhC
	NOD9wtxpHY2afrGsMqPuYD5vWyB6z1Toopi8bLrW4Iq0xi1keGiqqV4bI4IiJabiHLyq79jqj6z
	d8+Szy5BH8vcQRhCc822rgCx+1ckaqoZGYLMHWBliPRzsEv3YGy2fdZfkMpk4D2GsnadA4vmdWQ
	dMckFx2NnTwRXi8SjbNfBr6/Ub8RQGbe2pekcN+chHNWA7ci9lbRAW9mhBvw/4nXspKVVUiPUM5
	YprOxRQKEck/gEjU7j/bzmrk2EhvEhRO5z/Ml3XfctSPYvrFhEJPLlMQEFHP4MIR4nY5pKHpfwN
	1zVZuKPPFfto/t7StYtvkqnpJ2MRinGqtFwYEVdJCym5OOY=
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr36676598a91.6.1788175998887;
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:39 +1000
Subject: [PATCH 1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple
 Silicon
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-1-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oMJE42LXo8Wb8t2cF478qDHBbL2O8eXvXK6sppi
 xrf9ea7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc/IsO+wxZql0dWHOg3v3+Zhf1SSpPpFdL3D47ja+qai5Xnyzxn+Fzp47bW
 +9UfwAfv7oB+f6lvnPa1f715rdE43Q2VuygRdFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon Macs use a shared GPIO line for all speaker codec
shutdown pins.

Select HAVE_SHARED_GPIOS for ARCH_APPLE so that we can use the
shared GPIO proxy infrastructure for this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..76a6a0e6ae4f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,6 +37,7 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.55.0

