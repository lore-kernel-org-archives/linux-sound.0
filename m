Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150F3D16F6
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236734; cv=none; b=MOl29BXMqXcvTMNRpGiOdeIIyw8LFlcEcGKB680+BrS0E0PzfX5pug3Enbc6xYi/KSU2GbBth0E9YeLDg0+JjkziuhbVXQJgrPVW0/uzW8tiRLl4+S6iFWRspZZ/BVEkNsMi+e7Jd67XyVPEvaPfMGPEV62Z/tMyOIezgY0BTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236734; c=relaxed/simple;
	bh=6OqTH0hYqu74jsj3Hyhqf0/kStXynlWfF9E7YDa08mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K6J6nKl0rB0DLKdlJ4ilgcWvtj4a1GrozdNNn2E9WZshdhcKy0z3QG7nc4Blmsn/oJUYWGM/BVhLDCDxXVRKz38itF/nFaeey7d+PUmclpPvJ0tPqvDqKGNCQaB7CAovPuDBS+wV+EVzxA/h2F3GTf3vIY8ij9PLrrGyZe66REI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuaSxrIR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuaSxrIR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bab2548e8bso8862095ad.0
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236733; x=1778841533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6m/SKf2PyFWZeQKqRQhBbnBBScw1UjxM2ZPFwBwR5Y8=;
        b=NuaSxrIRN9i/pVsjWES0egal3fVIHzug6rNh0Qa5OMl++CWDuwOEBO7t60K2n05ii9
         eslsiRC9Tl4eXd1Q8YYLrgZlKh/zY0I1KRubLqGsUIAtaM0J6L7LqY2667Y0wvALa/eG
         Sut132d3X9VVGcPQ02mM4ouHTnAIXuSrnGGIlOzxzC2/fL31UHOMkBsqN9oDc3NboYs+
         2tLrhJOEX2M8WDAIujyxeQkXwY73qMVRE/2NmZ4PaLymn8Lu6Ayn35+FFpEOonq1iWvn
         iI156vd+U7CH94Zg4H78Ubor+EvJSetPYqJiv0EJcDYtBcUaRaVsDkl5rQDGdWKxjHt0
         fD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236733; x=1778841533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m/SKf2PyFWZeQKqRQhBbnBBScw1UjxM2ZPFwBwR5Y8=;
        b=GYmD+4a++fSL3p8c9XYTN8+utw+WK9pSqxwMNy9VJtZ+Fk/Zvye/rduBxSHNWV6Dhi
         79aeq/d1TOD3yuFHV5X2uIfzpfyFat9KhL4Yw2hqH+lZaBpM2TEYeeAS70MXzZF7pz3m
         V6zPc7q3W0V8+ygFdmTsKv7t9In9i1vSYFgVczxluYG4sfjT9n/R1kzRGT6XJdXLaD9r
         TdeKpTsyM3tdM0fAzZQcO1ydMeFpZfX/B6mabKAqGzDceTRQ4WeH8zEqwqgK9NMZMs/2
         o0gDaKXJIUaaU/ui0/iN2wWBQaWl62yn4DvYLyZCB+LTcRLf1mDnWRSWiEGOuUbXf4xF
         IrUA==
X-Forwarded-Encrypted: i=1; AFNElJ/9ZXEcNhWikVi0nWo3Ot0sY9ykCenlqfTt8GpLiMTf22fd8vq0OqA/Hp39O/ZH8DqokVL6DwznYbx0XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFh9raoQ6LK4XnlH8oAborgvUiEgBggatLUr14HuBxaf27CCI
	2/f1gFZfIpjQB7IDLeAcfun3V/gFCnAyc5MngyQ1zvvUT9LKjXFRD+Qx/2LXow==
X-Gm-Gg: Acq92OFlTKG0TsuDlH691pIQaTwBG0q44UpAnQbMINGlNOTQbQjToVMsxe/PTB9O59i
	82n0y7ZWV2b9Lnow/gW+pxald+hXtJnXcwLL2SbKxZx26tbDWkDrANSEJii+rDZvmgu64OpODEe
	ZxHmMS5NRRKuspdjDsfSbWEViTZ6ON0iOOLQQSeDPMIEVpP5uRPJfHRmPKBcGZwcKzBWyqe3EkP
	H7uc3nh9jtRPsz2dahCXujT0839Ho2jfqSIow2uCwp0ODxQJbPK1UZhdEciDrdM5e2CrrC2hwcY
	8LjNNp0YgtvtHpjxUH4VZiMyBRyHVvxR3/Hasbej9BLf4FvwicWio8/KpYLXw9y/iwdGToHTk+8
	THnUpGelYkbGAwZWCde8zvw33L3Dpy5xO6RF75lHNUAnegPXyyV3MKrWzpUSNXd71/wxJSWs4jd
	rq8g1JsRtWrDZTMBEW3zMrt/jP9xf0gUQozDmQbfnxFYSM+sfM5kpUEjw3fw==
X-Received: by 2002:a17:902:ca85:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2ba798d564cmr82193185ad.36.1778236732792;
        Fri, 08 May 2026 03:38:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:38:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/7] ASoC: ti: Cleanup locking code using guard() helpers
Date: Fri,  8 May 2026 17:38:30 +0700
Message-ID: <20260508103837.138142-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in TI ASoC drivers
to use guard() helpers.

Most patches are straightforward conversions to guard() helpers.
Two patches include minor cleanup changes in the process:

omap-dmic: Simplified omap_dmic_dai_startup() by removing the
temporary return variable and using a direct return path on error.

omap-mcbsp: Modernized omap_mcbsp_request() by using __free(kfree) 
for memory management. This ensures that memory is always freed on 
error paths after the spinlock is released, without needing manual 
goto labels.

No behavior change intended.

Best regards,
Phuc

bui duc phuc (7):
  ASoC: ti: j721e-evm: Use guard() for mutex locks
  ASoC: ti: omap-dmic: Use guard() for mutex locks
  ASoC: ti: omap-hdmi: Use guard() for mutex locks
  ASoC: ti: omap-mcpdm: Use guard() for mutex locks
  ASoC: ti: ams-delta: Use guard() for spin locks
  ASoC: ti: omap-mcbsp-st: Use guard() for spin locks
  ASoC: ti: omap-mcbsp: Simplify lock and resource handling

 sound/soc/ti/ams-delta.c     | 26 ++++++++---------
 sound/soc/ti/j721e-evm.c     | 25 ++++++-----------
 sound/soc/ti/omap-dmic.c     | 44 ++++++++++++-----------------
 sound/soc/ti/omap-hdmi.c     | 18 +++++-------
 sound/soc/ti/omap-mcbsp-st.c | 26 ++++++-----------
 sound/soc/ti/omap-mcbsp.c    | 54 ++++++++++++++++--------------------
 sound/soc/ti/omap-mcpdm.c    |  8 ++----
 7 files changed, 81 insertions(+), 120 deletions(-)

-- 
2.43.0

