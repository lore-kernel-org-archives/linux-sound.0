Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C61D6187
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743155; cv=none; b=qnMqv7LQpFYVir6ztgrsn71zfb85Oq/VL+GvXv/GRcVxDJhyMtYF6RIQfE43qXWSDFwlgg58ct8uLQuWq3TbrMjQD3HC6DHE8HVXDV62+Cr/PY3suHJAUwVm8QVMpxXk1kOXR36OOhwDjd5cQMCRFmZltGD0lh7UJq0MV50zW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743155; c=relaxed/simple;
	bh=bGnSfFwHOMHNSrwLnLMNIAOUgz0jSocJcxLJ/Hsmq6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJGRQylsbN8QRexEN7PJq73JjtBywrGUns4BHrQn6mgsB2HNcJ2G8LXSR2DYcc/EEUnOaiymOv46MNvlmLsHcMVClfipObJ3lNgHlH+j1uZa/ZY1m4u2C9+s2pTj6zuLjtVgyVECFAMZ0f+fZNJpud56PzZcrfhwBAGKbzkHWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjXS26KO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjXS26KO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c632ca0c317so298427a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773743154; x=1774347954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuAkLdHchhPU/fWxytmoEh03yHFUZiM13LcnXQExKB0=;
        b=cjXS26KORNP+HlfqGijpPWf3ExxJ3VOHPCYSW1SLJCBMzXplYIs7LFaebK5QyzC0hg
         T8NOO5eaNJFHXPjF+b7LriYfeBiGMDt96gGflykEqTYizFGgaN1PT8nmdi408QcbbNfV
         TShSypQyve+Erd3wwfM6R59j0jMccYSl7Mhkc2Y0WOKkadWCxDzKQSNLLpGxmqkpJIoY
         C7P6OcCWnSuuooZciWpJF4RUy6xnuH/aBsQ6uspONf6sA6Mp2/ESLGdtVEpSn/rHwczF
         leLV/3IohlmwsMvG46oQl1YHsyW4IY3fEhgwIglFOj8J3F2gqJUFbdhw2NilB+Qh+gwC
         EjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743154; x=1774347954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuAkLdHchhPU/fWxytmoEh03yHFUZiM13LcnXQExKB0=;
        b=mkLe2nlq+OQykiMVQZcj1lvR47czb0dw5PoIuEjCcPHg33cwxOGyQnhSbq1YavLRUL
         rfAeSao0vA2eztiywJal7aRH/5esLzDecXR+k8p09PeWl1FwrgAa154U891b3cpPBjm/
         uTokF3nlj31jT/OzKX1mf+xbbDf9OhfvDsMae5ZMd8kDAMbqbYM4WOXfYbfhASE21iC6
         UqZByEzSQ6HET9G6gYT39KISPatODNc1GWcO3RE+swtpm40SwLb3lPY0NPQzOJPL3bWP
         Gq2TINiiSdjAqDYT1vlfXP+JwjuAeF93kBEcQ6ox21UCjCbsVgAayuxfYRkO079jWx+A
         x/lA==
X-Forwarded-Encrypted: i=1; AJvYcCWzs68xyVFgtpvYlDa7tEJdH8cIIoN1toNdSuFC3R9uJrHIiJHqK7ZG5IYaq3iEDgKym5BPGyb9YG/1mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5jtPqBT9TYkH4NiHUnRVjft3N1/1hyHoKYazllQIsTylycoS
	2vjfwSfCvazNeMmts01odfqgyzJb28eApwf7D6UZx7kmN627vcihtOZy
X-Gm-Gg: ATEYQzwa9ewmOr29JgKeFdGniu5KiyDEfdehbmmHbnsED7TU3hTNi3uMbrOHI5cZW87
	rwK8+xqm1bHJCh8NH6aZcc15mfMPqAjcZAQ3f+JGKbIHBibje0ljhoAJ8mZ0Tigk2aqJ8MD9082
	I261srDv0ywxtGFVpMOeBzeFTa/+wYUVmlP0xHNESHNuMnwV4Lq+vXTrXya5h0SF7j+M9/TRP3z
	eE4pqMyiRMknXMmAGDiG+nFOgPar5Kw8C4F17c7mTDNFDXykrFWbQLmgfwSwAO18Qo1pB6nJ/Be
	PhzoQxzTcvIeM9nytCsv0LehfH43HmDyqd0eXzITxrGs6s4GLGZbP6oNwgOBHScho6fc+EuuYUH
	an6Gk3/yl/zYZmDgiAplq1E+2ISHhvo5bIZCPBfydrMpRX0OAIq6mknkMPcUxaxYaZYl39cz59m
	nqS74uBgPPiNjctO/dBSWTmWWHFI7f/rmSKWYZgQUsmPWVuarX0wg=
X-Received: by 2002:a05:6a20:a109:b0:343:3000:ff13 with SMTP id adf61e73a8af0-398ecc8b614mr11606823637.3.1773743153625;
        Tue, 17 Mar 2026 03:25:53 -0700 (PDT)
Received: from fedora.izzigo.tv (45.62.127.193.16clouds.com. [45.62.127.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb7f270sm11592930a12.28.2026.03.17.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:25:52 -0700 (PDT)
From: Frank Zhang <rmxpzlb@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: quic_wcheng@quicinc.com,
	arnd@arndb.de,
	linux-sound@vger.kernel.org,
	Frank Zhang <rmxpzlb@gmail.com>
Subject: [PATCH] ALSA:usb:qcom: add AUXILIARY_BUS to Kconfig dependencies
Date: Tue, 17 Mar 2026 18:25:27 +0800
Message-ID: <20260317102527.556248-1-rmxpzlb@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build can fail with:

ERROR: modpost: "__auxiliary_driver_register"
[sound/usb/qcom/snd-usb-audio-qmi.ko] undefined!
ERROR: modpost: "auxiliary_driver_unregister"
[sound/usb/qcom/snd-usb-audio-qmi.ko] undefined!

Select AUXILIARY_BUS when SND_USB_AUDIO_QMI is enabled.

Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>
---
 sound/usb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 9b890abd96d3..b4588915efa1 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -192,6 +192,7 @@ config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
 	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && SND_SOC_USB
 	depends on USB_XHCI_HCD && USB_XHCI_SIDEBAND
+	select AUXILIARY_BUS
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
-- 
2.53.0

