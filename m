Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800221;
	b=zlASALt2nPVwP5A4tSJm/uaU+Li0eV3xUsZmUaRjt3YQe4Z9kH9HX4mqtoKv1wTLwQBj
	 zuO2FfeQW5VeAyabzxRj9zdJYxNb2gmYGjCeMQR4bcfLlpmLPBEnWfo8eCInXs6tDKdaY
	 c460wantP5cZhym1Fyo6aoS9N3OnvxO3951PB/uH4bYLv6x9OydIUxNziGmvl3vRVsR53
	 VPwfWMVgHZWusNWXL1mdaMeeqBto4hGtQFIyqkKzp3T0ukOkQRJWm6lzQnafz8LIvAIKR
	 4mmUk/CBWVu7lX934gLR1gcnXJfWFZcCGW3RBTK+WSf5YQTt5Q6gZvKSu5ERnVymCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
	b=LrhI0s27vDlKx3kwYfex9v0iIe09f5lVTyvhg75HA3M8wb512PfzUdJLSl0t1hl5wN+G
	 1UH6QI2POCCA3a0qDDps5o4l5Qc5pHoBP3LeZT40G+wuYfcarlzIurfcm0a/X5H5Hf5Xx
	 7/O23UAXHcZYcqKyNORaLnNi74aSvw3mG1AfhJtTZduVLa4Kmzzad7b1c8LmAfzf9s2uR
	 pyZPq1Gts7ZVx9nLITgI3WmCdM1ynYSNK1/AO1rfJFuF0syKETO1ydPEFquC+GQSWTpXO
	 hV9iPVbX/1lY8fGcE+fqpF1ueQSbRWe95P10UMUhLy8Qa3OLLG4y5svsywKAE2hnwKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/EaPKGg";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB259606A338
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB259606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/EaPKGg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso647009f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800219; x=1794405019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
        b=U/EaPKGgDSFFWIjaKsIEE3ocleQN7aWXgwXnFU6y+v5ciyA1kfSxGmHuAO3EIo/ugo
         0pVg7mCngiPlLcSnVJXrIsNvro/W5FbOlv0h/dxJIRbrDhxqOioxeEwZLahz7nUVQWNA
         tBfuP4xRJXRF3rEY4RrWbNNNzj4VR3dBQlnsKFd3QykUsrBsuYNYRc4oDZE6sYoX5Igi
         izEYesgESzDMvbNLdOdHn1D79Ts75OS3ZehoM2D/KGaKxKdlbzMj+8B5Xz5AkURb7Bwo
         KHL/IAHLsalPadJ4/KTcFJmE3+c+PlQmrjlfGlYjPI3F526v4PVLFgK+eRrvWrhBpvKX
         DBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800219; x=1794405019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
        b=u/CWk8CJ5rIovXDqDJ1hVrAFJI8Nw0pobhMNltY1CttycRhRSvhv5mAl5Ljs046xPT
         AtXhdb0s+F4/iwBEl1shhR5l0UVBu8HMjQ8FvD3WjB3rM83TVbFy/qwm11t3DV5DdlCA
         UoIrZPgQYHtZAQG69jnyoDFAX96NMPMcHWSi1L2gGlfDfWV9TxAP23vBgQhdm4cX6gc/
         HZbpJ/sqURykwdaVyNMg8VLYzSf6crp98rT2w8Rsr63xMAfiiiGWuwTEvis0MwFDzFUI
         ZaRUFlAi3lHArFps+ni8rlWyFDpPYVDsykiMItiJ9/dep3Kf1Ir9kgXEm7QHTsBci2/1
         bzow==
X-Forwarded-Encrypted: i=1; AKwUvBxG8GKaL+G54oGqo8BarsyXdqbyQwYbUAwc3eamsieA0srRmNb22Fu0P95KmtmgRwiKhm+GotrufTXJHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4tFDXm6tbsmCNDgOJap4sCHTSfZ+SjdyKACdHRt3DMYKhCcVL
	RdTS7Iz/fSG5t2+WJ5WOGvukdqQHovLUIuC5DAEC6PqaU6j4bnTcFLNg
X-Gm-Gg: AYBFou2CJQf5omgY3/7a8oZTfHE+TKS3D8F1u3WirKbGmD7aaaFaKo+Ho2uCb1lFp3J
	bjMw3aHs4MDOb8tYNtEDA4mDYLZkaTkQhpQ1STd9kyoQ432t+6pOW5BBcnTUIM6d5Pfs7qw+l8U
	ovLTO2Ykt+cNykrlHx+LNSCmFj4Wg4DFhaS9R+xr0WYNGwJYda8XP5UUcnoMZgMp0PkW+95afyG
	6CEgQ29lfbvN8l+KXjW7AyrfnmBmor3CyIcfKmOHOYKRUfOIDN9YwR9P7amMr1za5mbDXYyhYsA
	NPUsx7/qhYnN6QiXuOb+ztb+P/XpmZtCP7Vrqet0/5U4TVIje/zoNit7RqyyXWF7lRZecbOSZzj
	TV3Zvl5rIyXK9wuV4lc2nyaKF++1O5t6MCC5wRItAm3hU3kKbadxnqUwG6PlUjn13meIM3F8VUf
	YSzv8hNF+u+9TmSBQGeX+BYZ/FKSWJHpG+wtMBWgdDi0wStX8cRdxhSpBAZeIZM7/0/QCX+w14i
	cgUd7fQXEPRhLrP1TkItk1pndnqOoMg/T9KTGr8iebjBkvGBBCtwUZMiy4yTk8XO4GaTPW2UCCa
	xPpULNBbMyWerLZQzk2AOBFDf40RFP+E3TsDvQmedVd4fxCs93VZlKaW3Qlc0xGdYMh15XPe2cT
	x2w==
X-Received: by 2002:a05:6000:2488:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e6e5366b6mr33871219f8f.57.1793800218828;
        Wed, 04 Nov 2026 05:50:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 2/3] ASoC: fsl: lpc3xxx-i2s: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:49:59 +0100
Message-ID: <20261104135000.3723017-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

lpc3xxx-i2s calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  lpc3xxx-i2s.c:320:(.text+0x13b8f6): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_LPC3XXX unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_LPC3XXX=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index e8924ed652ba..2f58a1a51afd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -140,6 +140,7 @@ config SND_SOC_FSL_RPMSG
 config SND_SOC_FSL_LPC3XXX
 	tristate "SoC Audio for NXP LPC32XX CPUs"
 	depends on ARCH_LPC32XX || COMPILE_TEST
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the LPC3XXX I2S interface.
-- 
2.43.0

