Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7238947D
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 05:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081451; cv=none; b=d3jGnn7zQD7WfWvBIasvTwwSO9SlJ1XcQgFDxViPx+6KMJCOXPi+2BrTSrBeVHUEUOvdeOICzxGWePk6M2MpWBT5yPlqo/q5SfhfReDsvpHrkgPfViZ6QWjV74KcbiwCpxSozQfYRWlDX1hmXk5er9hLNMr6sSDEQ2E1Y+q6Avo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081451; c=relaxed/simple;
	bh=n82PU5SZcNT1/DcPUR5OiVh5/cP7L5oMB82xVCdpLF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iKfZIFeUL8bBnwc3mAC8WU/FOkY3SFNgMuddOk8clW4WRbLupe+MnsxmypOJsSwg7svGO4Yn94I22hWBw1YDSA7f0u3ABlFiXwRPv6oo45Z4glCTOJHrzddIkJUxVOYMojuVWdj6jhQUjXrAQ17Tcs7ochRwAW97U4bh8HJUfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVvgfDlM; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVvgfDlM"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-911449d9d03so238663485a.1
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081446; x=1779686246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCdqGYm1PuK8LVmDiOhY2SbE7T6sMcRFoTv9yLJUAss=;
        b=IVvgfDlMpApXBXLKD/UjSEPTo1skHZZkdMIPlJ0UG/+7JthsBIhm3A82nVGNWzOeL/
         o6CA/XzYdqbsMoTDCQDFfFysuoaV32QWrkHf1PocIE6MHoQEr+TLv+uPpbLo9c3M07dE
         EQwkF1IdaEmyEs2oyoSo+pl2skXPEXSlJXDJzdApWK1vi+lzV6CeZWEiqbPdyj7fDET+
         I9cxb/Gzw2JK4041SvldUolfdv9Bf1cR4O1AAops9fO+i1T1CBugWHAusP8AiX3JY+jr
         RPfNBBECoUi71MJVVtt/it9ER+jRHplPWDEHu6hdZA+YUWov36/vDOfGjtAeE5jjCXI1
         pCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081446; x=1779686246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCdqGYm1PuK8LVmDiOhY2SbE7T6sMcRFoTv9yLJUAss=;
        b=eAsKkVbkbB0clOrQCoP/zscM1bPY6UeRpsXtExk/bMjZXr1xoCi0vSEdZs46frDIA+
         jqmTC3V/TIKNDsELBoFfQii4oG1nbor1PWYFpAi1RM1Nk/kkTSehMS+CfD31CwEJ3MBT
         0CnbIToxdaY4tw6uGDYDxkdwOo5A5RiyGcnx562VB3DtwPlYym1L8KwQPPrEH9sJBXif
         cNJuf6rTaPqJrOW6tYBEIyVszTB++FEoBYDtiIObWAjFEOEeq/O8+sUKsNfrryBNGDzk
         JtI8kncpkG057bJrzOJeNJA1R0ys65DlxaQbPh6N16QSrJ+nyTKkXDJeQLxdB9poukt6
         RarA==
X-Gm-Message-State: AOJu0YzIQn4nmzFxqKHlv64bFmIBrvhKcwekuC5jjKcNDS3ty2iH4r1/
	/E1RJgDxbYleEjVOecybgLT5Vt0mtPZVnaeV9zLTS1IG7CnC+qXyUoCzlPjbFPJO
X-Gm-Gg: Acq92OGIXIhm61/3Dor6fG3ILfdARdv95KWaMbKb9LeBJ8QT2JFCl9inwsyI/ZRjK27
	Hz9g9YgdV5kUMyMpJajVBVbT8hBW3IgblhPa4eJDpTpfgyeMr/eYi2VsfYFwLbWqORFFyXtuVpn
	+5OBUBgX8J1klBICfSJVs7k8/76JzUgXICtVPkFNJ3H47FblRXHTRIwvqFB3eRxVdGT57h6D1PE
	Il1YD2Qz7DVucu9Na5Yz5NdvRvAuPFbch2DaZoxlxrX/ciOHht8og4F4ZSJXiiEXi7nRuKj60vz
	83mP1GHcLCvq4a7XO2hD2cXfnK9dmFMvCZYCBHU0ijNQXWBq+mfgmVtkUsQftLbjh5ZkcRcveLx
	jx6TAT9/38mVZdvKxjRS86QUcBgpL+TumNsO9QnvJTCCbzm/3rmtTy5UYmQJJSqnanXBQMcpxdz
	EPXmLoYQZd1p3USFiDboxpZEUlUVXMH3nAJrKoT/bUCrLIeK98iD1CL79PmCs1n360peVUfbTMA
	LxaP+gP7R+Uqs/9jXI5LhnotFWGfEaKqvX2ruNFVatz7g==
X-Received: by 2002:a05:620a:4090:b0:8f8:82a8:a31e with SMTP id af79cd13be357-911d0f4c1a6mr2100915585a.60.1779081445661;
        Sun, 17 May 2026 22:17:25 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba943761sm1394532185a.11.2026.05.17.22.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:17:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: fsl: Allow MPC5200 PSC audio compile testing
Date: Sun, 17 May 2026 22:17:06 -0700
Message-ID: <20260518051706.1027500-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They require a PPC platform to compile but that's it.

Allow the Freescale PowerPC ASoC menu in PowerPC compile-test builds
and let the MPC5200 PSC I2S and AC97 drivers depend on PPC_BESTCOMM
directly.  This keeps native platform builds unchanged while extending
compile-test coverage.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 828524c90f17..ae8774e11873 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -165,7 +165,7 @@ config SND_SOC_IMX_AUDMUX
 
 config SND_POWERPC_SOC
 	tristate "SoC Audio for Freescale PowerPC CPUs"
-	depends on FSL_SOC || PPC_MPC52xx
+	depends on FSL_SOC || PPC_MPC52xx || (PPC && COMPILE_TEST)
 	help
 	  Say Y or M if you want to add support for codecs attached to
 	  the PowerPC CPUs.
@@ -226,7 +226,7 @@ config SND_SOC_P1022_RDK
 
 config SND_SOC_MPC5200_I2S
 	tristate "Freescale MPC5200 PSC in I2S mode driver"
-	depends on PPC_MPC52xx && PPC_BESTCOMM
+	depends on PPC_BESTCOMM
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
 	help
@@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
 
 config SND_SOC_MPC5200_AC97
 	tristate "Freescale MPC5200 PSC in AC97 mode driver"
-	depends on PPC_MPC52xx && PPC_BESTCOMM
+	depends on PPC_BESTCOMM
 	select SND_SOC_AC97_BUS
 	select SND_MPC52xx_DMA
 	select PPC_BESTCOMM_GEN_BD
-- 
2.54.0

