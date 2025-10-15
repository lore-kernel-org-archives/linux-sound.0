Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A52C21EC
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540571; cv=none; b=Ag7siVubbfEmvy/e8rzXi65rNvz6h95c/AA5+z9Ig0tot67+Q0eArVqyVDWBMcOKqs3mX5jk2chWIYvkEqUcJDKMcHNEgSzCv7kqEcYBxW/s84Jc6cdDEyBsz2HPJQkcn8WJcaMDbJyLygh3Oza3whX/1TWFaZekLiLbHd+tK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540571; c=relaxed/simple;
	bh=q+FSpGhO46Wdm4E1xu8JKsgaETCDKFJOa1krZ4FdTC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8FHfItJlOLKSYD6D4NLcNxC9Q5pUaOzgnRG9CJ1OfFiJk+ll5NON0R7Ncwyq7mgOr+mxiUbbzaJgH2eIpVDhQJyVewOsBPNOraCGTG1VPhqAT39vkisjyDfWL6dq9Jes+jrWfabTMnc6Yp3VkwOpygIvU3V+yvtUbRCfiGd/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot/lVOFo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot/lVOFo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e29d65728so40348625e9.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540568; x=1761145368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggq7M6Lrzp3o1qgmvHWFIuwQRJcN1Z0KczFO1vDxzUc=;
        b=Ot/lVOFo+S6xYBVQTo0U8uU1VdM5alDr9pRtCrsKJntNukviQtZ8JwB7LWecBSPKhn
         i9kX7t5mCmA4F+UT1lzJczza14GzoPVNoDt+/RkiIIa/uJ2XM1SdMi3tsM3VM2NRygGw
         HhUKPfqSMX243MCQOOZpybgGmmFUb8m97tx8Bc3jFGlkCRTYiBSR1LuXD8X+J5S+hjWr
         1RPQeJnbKbiFXAjHaTNnc6J3RC8rrPVOuqmoQNokS7De3pSr1BtrGiYA8oeCVOZXmGhz
         RvVPeo3aCNGNy2g//WJTUqBt0OmOq4pXtjAJuY36wxljjiA5YVL0hIFgxOeaS/JthgMl
         CMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540568; x=1761145368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggq7M6Lrzp3o1qgmvHWFIuwQRJcN1Z0KczFO1vDxzUc=;
        b=XKp/z6jtOu8V+ZhTyFCKmdz+rGpGUPy1CfZ2HPCN1AxN2n+IFOK2/ranrcJXdRHHKV
         AP4iW1EqKQBnDTdKpUiHjtJzaUjI+bDoqHFWZmVr44ZPcgv0FROZMlUnoevFHobDQh7y
         ftMWHb9XaX4Y90bo0WoMs+G1y3jAkJpk+wQqVC782CGYuSW1J+uyv9zk7uZtb2Oz7hWl
         U8tvTEIXtV8dqBg47geNfzkiEPXAcCPGsMuSJOr4WL9uTmD0D4vMS/vQr7RMczFZ0bRw
         MfsTzir97aOP7TUVxXEXYW/rUfy2xMMS5vzbUmrrvoLoZD37hS+pFuRC6Ynl0Bx5hwak
         xwwA==
X-Forwarded-Encrypted: i=1; AJvYcCVVGuTP5bTonATCUFeqOLkcET1aDdvxoX89pIbwTop8K3ML3id6kB9cqhDHz530FKKKkjNcudPoGbEc9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhnXa7hPZrvcSuKja6Ggk84aFrcV58xDUK49tGidLf6PcYReq
	Nf6jICjUyxGd5uwEzl5vgHtAS0zTmx1V0Cq95oIlobpJ+kkJzS5lY+wN
X-Gm-Gg: ASbGncuz3K/3XWZpw0ITNhj7W988VPkryPUISqh8403QIDDPnuK+VqlLM3JptNVuEpn
	MBcmx1awF6jRR+G0gmsNpTyObMa0GObjF343YoCYNeC9mscXRCANlngfDfepGCZuJvnBCP0Kzf7
	S/qPG6EFtCCcFM/7FErrua4gI62FD6f6WLyheDhTo/I5RkXFKHItxFaQt6BnW6fzeUOg/hHZuzZ
	2DVhNDvoAXL3pPgYY2CKZIv84+Q1tkf1HOvmMFDiIheDZKIbcsAKxJK/9tw+1Gr6ba4EQjcYT0+
	0bXxSOGaCN7OZhciG8t8z8ZdPabaqBRRtfMNzaeKMPUF3Z5jS/FSvGCn7phxLimuxPkYAsErdmJ
	6HFaQ52+7ROxaFCieGHEqoWmr/ivTqFG+D8RiY9bSiwNMlXfrHzUwQQ==
X-Google-Smtp-Source: AGHT+IGS/QVW0HLNq8PhnL/BhZ4rPHH074sLFq6l9QJq3QBiekvGfWw+WGrsFIdkvUG57uPITbSjMQ==
X-Received: by 2002:a05:600c:1f84:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-46fa9aef45fmr203722495e9.18.1760540567884;
        Wed, 15 Oct 2025 08:02:47 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb55ac08dsm296159645e9.13.2025.10.15.08.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:02:47 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 15 Oct 2025 18:02:43 +0300
Message-ID: <20251015150243.2682-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87o6q8l68r.wl-tiwai@suse.de>
References: <87o6q8l68r.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi Iwai <tiwai@suse.de>:
> If that's the case, try to choose HDA-Intel driver by passing
> snd_intel_dspcfg.dsp_driver=1 boot option.  Or disabling
> CONFIG_SND_SOC_INTEL_AVS could help, too.

Disabling CONFIG_SND_SOC_INTEL_AVS didn't help.

-- 
Askar Safin
