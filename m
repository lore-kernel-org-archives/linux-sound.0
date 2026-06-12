Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090037EFEF
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270820; cv=none; b=Gb05EyLeexNE9I2I3airV+bXDrUiWW/aOCym68gtoVX/EwhzQzGah3vMjhLe7/rC3hE4wyGl+mNnXDnzx598vqW2nsBrM5iNlfdnnsL6mO/Y79y6fcWMRsgkK1XcFhP3d5xbwXZxXD4gnupbTQedolFAhnrEDfTC3dm0F3aVzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270820; c=relaxed/simple;
	bh=SKzLAqQcxFKBzRQoVih2LKJhZnhNvUtw7I9jZ5DBlmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5+y+mVrYwKKOqkJeG72qGeZ2G00yejgiESLkYSMMY56ttDVnVgMTA3Me/c3Q67niNgaPid+2T2OKC5ZcE345+u7w6vBkZDF0XDkUqHlsa71PhPMsozZ//Lv/1Acj3akI7DEwgDitAdA6ZW9OTPkayVH2Uf7oX35wqrFAOzmJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyrpF5El; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyrpF5El"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso2071052eec.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270817; x=1781875617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=QyrpF5ElX9YTJxU0/ipn7FZjAIKdTlbfd8ne9b90rlcK9KzWwjV4TeKU+RXzJTrMfp
         SQzuaiIUDeLm45eI/Yn5hIaHlqf6hA5pXJpUZFK10qq/l8J4PW38U3hiscZgUs2T0dRc
         yUIuIoe9Qk6BOSv82BPXzZySq3CFhSB64ktjUvk46yaqK/ZCbLV6mcUHg7LACGmFL8IW
         hIGmRG2Jn5oZlD7+SnmvoEtOlZ9jr7EY/9kYy0ASKu7YseVQSpITpgCmBe8uo511Tpxi
         ixj7MQXAqjgh6uVg1UoMFV9JqCkE9BxCCUzmIIM4nyEphzZ3zJRpbCvEEe8w/XkVrI5I
         fYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270817; x=1781875617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=JalXkiE2VbAZSG5k8qoUBMoCDJq84rui+uMPTy7i8wvjxeO3w/LnmbYrkAux9uCtBy
         2IVPfCW83gJCoGYMxqkZiaJ7MVqkeN5ZWz/9bkT67FZmyRNXi9AHc5dtCSmodrtdb5Ju
         l6NcDUL149iRLOF4pvgn8kGg6z7XVbjUjQfU+ha4ER9oBlIjycCozMl5DVafddI4d8iE
         nM/hUmoKPVyZc9edYGtNs267eyIoBva1ToJW5fxtS91VdbPo/fC9nPN5tDqeaOsMrZ3B
         UWrG5gbIkiBmEqF+MxTBCilzhA2nPbTvIBdr7qTRJ4t1cMVUbpDfuW2cHtVhyw4bNoPH
         aS6g==
X-Forwarded-Encrypted: i=1; AFNElJ+Qe8kOsnkJUJ7eo4e0chDdMNbKz+BEsLcnOa+vpFgR7gjOBnWxZWyPWJXgn0+TeXbF1cvUm08rqRxAWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PdH12a3w1bS+OUkN22W6xUArlL4dGy91q86ESOKpAHX5Ays5
	u2j6YeIpZze+QbGEk6qbcDVS84WMSTxpQduWxyWI3ABsgYGXYj/0zLCA
X-Gm-Gg: Acq92OHxJ6/IKXvmXTUxrU7e7a2vrbu26GsKfsSacrn+vskKcNbAEKQIn2l83RST4lJ
	KGMRStefWJBdE7i+aTwn6Nx2GGncBb5KKYiVqfaMvy18SbhVA9IvYANsh0fv94bGIg9WdS9AKko
	w+89xNvQ9gFd9bFYQ5iqkOeDuSVp/eTCbpujxgSrzdf5Qv5rYmyaFCKHcA3JkDu+VePqc2QUw+G
	ft4NXx1RJ6rhqnDFJ2yn+5PUqa4xrqReordM0ikb9Pn7Rs7ezaoZDVkSywbm1Ki2IzpWuClSQm0
	qfZCQDRYOx/fs+lSSu6f5Qto/+LQiWYv8svYwmv70NuaryG7n1py0ma4eiUe6ksQsHSjqhBzExS
	/V4Cr1CRJYqnSZpoEXgeFUybHJfAl/kzxuXq3kJP3H18Yw5hdz+VbtCwROCCqclV4uWYUQ32v/M
	J9l1Jf3x3MrhBS373fOsHWTKwVL5FkTJdpJS/abAw0JUv65If8WxiuzEq6dg==
X-Received: by 2002:a05:7300:8b84:b0:2d9:ad46:4a92 with SMTP id 5a478bee46e88-3081ff8525bmr1726924eec.13.1781270817309;
        Fri, 12 Jun 2026 06:26:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:26:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Fri, 12 Jun 2026 20:26:28 +0700
Message-ID: <20260612132639.78086-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex & spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

I have compile-tested all affected files except `mpc5200_dma` and 
`mpc5200_psc_ac97`, as I have not yet found the correct configuration 
needed to enable those drivers.

Best regards,
Phuc

bui duc phuc (11):
  ASoC: fsl_asrc: Use guard() for spin locks
  ASoC: fsl_audmix: Use guard() for spin locks
  ASoC: fsl_easrc: Use guard() for spin locks
  ASoC: fsl_esai: Use guard() for spin locks
  ASoC: fsl_spdif: Use guard() for spin locks
  ASoC: fsl_ssi: Use guard() for mutex locks
  ASoC: fsl_xcvr: Use guard() for spin locks
  ASoC: imx-audio-rpmsg: Use guard() for spin locks
  ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
  ASoC: fsl: mpc5200_dma: Use guard() for spin locks
  ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

 sound/soc/fsl/fsl_asrc.c         | 10 +----
 sound/soc/fsl/fsl_audmix.c       | 11 ++---
 sound/soc/fsl/fsl_easrc.c        | 36 +++++------------
 sound/soc/fsl/fsl_esai.c         | 16 +++-----
 sound/soc/fsl/fsl_spdif.c        |  8 +---
 sound/soc/fsl/fsl_ssi.c          | 13 ++----
 sound/soc/fsl/fsl_xcvr.c         | 29 ++++++--------
 sound/soc/fsl/imx-audio-rpmsg.c  | 25 ++++++------
 sound/soc/fsl/imx-pcm-rpmsg.c    | 69 ++++++++++++++------------------
 sound/soc/fsl/mpc5200_dma.c      | 56 +++++++++++++-------------
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 ++++++----------
 11 files changed, 121 insertions(+), 186 deletions(-)

-- 
2.43.0

