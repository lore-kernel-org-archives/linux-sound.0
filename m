Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492E4AA571
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596311; cv=none; b=msTdd2M5LFgBoScPuQgPDXFEIb6HVzNlimt1xArh5NyER/sEUnhJh6Tdm47QYyQi3PZgiiHPn9JIenAWBl+hzfiyIBY26/zvoTaDseP0F4U/c0i2bXczD0g1jMEnO2KpbYJxtZXq+paZ6ddwK9u67sNGF6X05qoRCGoNIBwd3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596311; c=relaxed/simple;
	bh=oWGJOZ2G4tADTboIasDpDVyxx8AGf0dDnPTDstePwmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdTh1Ne5eijIVsnLBjcD37MjrOlnDGJkm/aR2EZEc39DA6b+qLPidX4QKvRuGeBKM4/FRPn2wx5ok4+sZT9U79eQQRTDUZOaTybZN5RN5TVBe6RygKm7XZnqbYl9bmwGvUS/9sAL3bCfCaaMd+VN2gmgPgb2MWCw9onpkPsXk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovoI0s/r; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovoI0s/r"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso139605a91.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789596295; x=1790201095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHGYq0HcUs1U/I5vcPPQ+kFGt8+MwpGMEs9XhWd0UmE=;
        b=ovoI0s/r94bNqxc3cU3VYWPUMVr2zOI5BjebUA6etiHsXg3y6uMDLpvGQXgmamsKxx
         ZTKCFqzOcWn9fcPM9OaOyVVeELTa5WJeWcCJjhaFtoYTvuvRzQCTfsLj9p8LIDP/H5N4
         5OvUmjjAlLsLsRY9RW7sCdmFTS8gKsma1ly7I7zMcovpxeC+la9OU4Qxq4xTNj8P3E/x
         vqM5V+V3FSLZ9fncJPtPf7qyZSPA6xMNmNqkWf+mUSynuSP91I/a3U1vybdJ6ig1sDzz
         tXyh6WeH+c9tbHSsiaK6sOFAMASQpBbS6nFYtzmyzVT+HvcOb9lJc55cSS0aKDd3UcP7
         YScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596295; x=1790201095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHGYq0HcUs1U/I5vcPPQ+kFGt8+MwpGMEs9XhWd0UmE=;
        b=Icaidbk2MD9iwf1tbA7uhpaKVuoCVJMbtdclHozwtg6WJIlfcZCWw0+kXUCC/fDIYY
         zUNqyGg5gHDkhQfVIgaNabCRY2+xFFpFCgef2n303W+r8xYFEn3JOmldhiLkwxRg43y6
         +bOIWoC48oG5LordnUcms+vZMxIFV6lhfhu1Q+1ekoaiLGEXpJQ1ERqFs+5RY8CSIFwM
         1kLVJ4ylN4vpCM00oQciyTbzlmohlIyCDeJyYDqNTfqVqzsecrwt8ZMka0syksRA4CJD
         kV+ol/hwyXx7/Qujva7QsTFEdmiLSNNjMnEqDkMK0gselMzAuNOlEu8oYECmWUhom4o7
         pqmw==
X-Gm-Message-State: AFuF++lAU14l++9x9j6smCYmyAnYxBoHh4kAyRNa6azfecJ4v8bjIbVs
	Uq7248P1zLOyXpH0Fr01Cy0GFqFHPxvzZuBy1+rXgL+Yf32GjA/Am4GqK0iCvA==
X-Gm-Gg: AYBFou3FGm3FLAk7QGl1aVVS43WQNi1MBS9oGS2SiIRBwFnx77cHBXzR3JEh9uJTGHP
	c8hytGqUqHP2ostQFpHiplEvU6Gv6woEXzjV4tJl1RElBrgG4ABT/bhwh0gWqN4DeJxfScKd/nd
	XX6f/6hN30Lo3o50KrM/aOh5Yy/oZjX72xlnq1N9nVPxCofKgTszPvZWXoWNbMM0jT2OcBNwus/
	2N2iqLYPSgwYzxoxxAP0CEcGDQeZUTiUAPXSvZNfKXNtxhFAw3NpZMxj9Ibxf3GuH1qw0GaFQXb
	bewZmlojk11x+IgBJMzDx6kfW88U8ddlEdWgpjFjm5SYoWHPM/mVsrOgIfy2+Wq0UxuL1+jtbOs
	O+VvbzDfIdcU70y4xasqdeKiHmaN6WeFNz0MyoZ3yrJowMe0/nKu9TtYEISWYEadV0XjsrJ56q2
	tFQg5tSsBbNZGSNoHINBfc7ENIl561tcNFottVs7mqqp0RTmrYn5wIpUPlBpB0yoyaO6+qNwGW7
	jd9GhaFprlgSbfmRwa9PKJ1xe+Kwl3QFicE602ckIlJtxGPUvbV1OTf5djXoVuCjJNqp2s6G8jK
	akNY9rPdQ/YPzMcRbItOnwf2lTjLa36nlbjYXSeVXQ4wC9IMNsmhZ4tb/Ws=
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39e1e4aa012mr10556740a91.19.1789596295444;
        Wed, 16 Sep 2026 15:04:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm11704823eec.14.2026.09.16.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:04:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx
Date: Wed, 16 Sep 2026 15:04:53 -0700
Message-ID: <20260916220453.260472-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPC5200 PSC AC97 driver only applies to the MPC52xx family of
SoCs, but only depended on PPC_BESTCOMM. Restrict the driver to
MPC52xx platforms so it is not offered (and does not fail to build)
on other bestcomm-based machines.

Fixes the following linking error:

ERROR: modpost: sound/soc/fsl/mpc5200_psc_ac97.ko: symbol 'mpc5200_psc_ac97_gpio_reset' undefined!

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..101bc952aa14 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
 
 config SND_SOC_MPC5200_AC97
 	tristate "Freescale MPC5200 PSC in AC97 mode driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select SND_SOC_AC97_BUS
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
-- 
2.55.0

