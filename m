Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E833081D6
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961846; cv=none; b=KhG3LopAOJTtNiUAcCVHruKrHnoGo3Ooe7VV6Ml8hv9owGyquLIAnhX2lSGHsm3GiwcmE+H8wzPYAE70aNkYnAATGPKVIdZAA8b4pEQZ4PlkB3/sh+g+2wAZPY8uw9Nesk9VjYQTKN5qVF4en3ZMKxnjXYQ1z6rXt+zuJPLxqmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961846; c=relaxed/simple;
	bh=qQbJ55cocVqt+p624JTQYlwCG/B0S72HEDj3XPuyVoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXcEc9PAEilEfi2fkeey1/TD6TTE5x36kew4WQUTG6IelapDBklsY4liEq2KwsPeLMxAGgDPAozInKTgU1PpXI1i70GShva9Jg1+j+1uBbeG1Z/za4WII1v17tAEecUupxTqxthHlLJ3NfwJ8BjuduDkOsxwOtXsJF1056ybawg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPXXDRXs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPXXDRXs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso749385e9.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 09:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783961843; x=1784566643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zbicOBEv2JJEkNJBlseOuhOTf2ml5Q7FiIqWwSuWgA=;
        b=WPXXDRXsyONDEqEHMXowlBp9tBil01ZfUUOhcFMiBYEoyckiJ26WSATbH5NeBmvP7B
         D5NWYAnF35/sipnTC1QcvYo/SVbrV/Erq02YK5fz1xeHyB5E9Vze8Ucksxk128+Pe+HD
         wBKHXqhFwOVC+e+V6aKdQi9ywuSWFwB9wQTPlDwhAau30kXnIoCcKZuhmrWDHR4kV5uc
         u4Phvx0qfu4BylO1QPhHoSliBYTeGCt5DdcbbnLYgSfOc2v4Oj529RWlP2ALvjGzz3qF
         C+eSqxtNoN1DZREZoFL6HgzQUOxgp0T34QJOxbadvvCV8uY1mhGQovhQa7WTSliADUxe
         oKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961843; x=1784566643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zbicOBEv2JJEkNJBlseOuhOTf2ml5Q7FiIqWwSuWgA=;
        b=mE48tZNltjqsoR9aQ+FVfyaWx9DmaxQvQp1PP9zpi9sdm0QnjEgJt7k+VxeG2qkalU
         AHfjM01sB+5SKm/uWUcsCHltGjSSacfHKZVKwX8t2Os/tbu8L7JJhUs7mO4LYlfVbSY+
         5bZs7AymPwMppCq+fgQvPwN1mtnj5H2+wlRncxvORw+GJcVI4YfRgEvqp9o978NgAEcW
         SDI72W89JuLX3r9Vl3EWbEJNspxDQ4pZU1AB+ZLHEHpKRhH6V26qc4XuKIpOkzGuCQOu
         O+PtEP0dClAKeukcZlbuxBpwyre+wIgbkIvT6/uU5Owdo64ldrIj3O61bbmONEzeryr/
         STzw==
X-Forwarded-Encrypted: i=1; AHgh+RrFQc3ZRUwRYBanwx6Eja/HcNiLoQNrMb05Ntu/GOz/fSDniYOklcHlV+ZTlMnmtQqaOMZ3Jf7uTyU/EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkqjymjmNmmGkoxOTVrjmxiNBKS28XC70sYWN21krJlvPDI1L
	95BkYvkTSeSdCRS3hf7FbT7o5evtPL3cZuSlEfLo71G3S0QAT9zYi1L2
X-Gm-Gg: AfdE7cn0wi3mIx5X7r9xHyzWJr1KrIjr00Psxjsrsm7S5qBE3Dw6e7JE9b6LTSqX8d8
	iZxRfmw1SJqn7PkaTvHo+P+qmU5glLUZ49E6jQlX+YrWQ3YogslH/mDrtG2k7YSjMe87EDqMG/G
	3C+C0Lk/nlM8d/BX9NsHlF6WtpGxw3M0JzgsxUHuTJUo91tkqUC60UM7EIuenDJxHa2cwhif0dQ
	T2VZ1I2GJHSolI112J6lvLW4d5n+YicHxaAe4E5CjxOVg2M0GCRJ86tVnalV4IKLenCVt4gCzev
	hoZT6pNplRaR2Ljwk8clYQIVRt1CGKZUuENeAieHBUQ9VhgGL/u0i45nnsKUUoqEl/9u+dtCHx6
	kYYuguzbhp+VqaGBmRVnf9tFnOY8XeDfKlrSJTE5W9hq5BfyX5H7LV1saJ4e4BpP3IuJ+5YhbwW
	72ODktqCMqUuI2Tn39dEDqgyMhF0HTgWt3wGoQ8izlf3rE+oBYVCs=
X-Received: by 2002:a05:600c:6387:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493f87d8583mr113049345e9.2.1783961843151;
        Mon, 13 Jul 2026 09:57:23 -0700 (PDT)
Received: from aicampos-laptop ([66.81.177.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm307629355e9.0.2026.07.13.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:57:22 -0700 (PDT)
From: Antonio Ignacio Campos Ruiz <acamposruiz@gmail.com>
To: Vijendar.Mukunda@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: venkataprasad.potturu@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX A8WIG
Date: Mon, 13 Jul 2026 18:57:09 +0200
Message-ID: <20260713165709.19489-1-acamposruiz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal digital microphone on the MSI Vector A16 HX A8WIG is not
detected: the ACP platform devices are created, but snd_soc_acp6x_mach
never binds because the machine is missing from the DMI quirk table, so
no capture device shows up at all.

This is the same board as the already supported "Vector A16 HX A8WHG",
differing only in the trailing model code. Add the corresponding entry.

Signed-off-by: Antonio Ignacio Campos Ruiz <acamposruiz@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index d6df7de70..af1dce9c9 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -521,6 +521,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WIG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

