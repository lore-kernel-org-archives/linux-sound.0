Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC03CD8BB
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022329; cv=none; b=OCduN2TZDJgHAKV5Ujxg56R0VBN69IwIvSXFnqevIp/CF22ZWFtVaYm6ZE4PQx7LNPaqg7mlkN0z3QNj+YW+7YVNyczmFDBcsOlHQUY658z3AONbqlTC6zW8BoEdEGFZpCRuFGum5brkUXtWXvgTHU7lB7suXnKUw4Nta8HHazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022329; c=relaxed/simple;
	bh=Q29q4qb/3dG3kWuQoO3NQvEsVlqgtoxwytqtwPxl8k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBbo4LC2Jjee/VuEhu1SpMSEW8IhmV2QM3PGwvDza6UcQ/2m9DslcZBzRCVngfQ3EmV19w5Xp7rx1VrpN2mOGTFnfiT7UAptbaLioEBohuZYQoVR7KFRYwCIAJqgxo7EtX7EtNm4g5BDqv0v4T+HDqTintI2vhiWi4+g3Ofg0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgY6SsVu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgY6SsVu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so7036665e9.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774022326; x=1774627126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PctDEUXKMufTE1vDUhMMgOT8ZcWW48msvLcxSWpyGkc=;
        b=MgY6SsVum5SCkpW82xPDdf3uFbh8TKxBSsWRgVUc/qtkA+0dLPizsae3Xl4FCi/pYg
         empl/TVpaXRJrEQYmprFwYO0PadQt96yjB6TWsu75g4rnlg1zShYOb01ygjv51PastYI
         cQ4BECoKdrWIV+/CgfixUFw/FK+rZgCpehvBUUvEIFVQZu/3FQ6VFaS/YrSXoRRpMQyK
         vRtQE4vPM6M7ZQLKHx9h1HDREc6/cQvfBEwrmCbHoyzXeUmWskuX4HzwJEL0bKXxVTQJ
         MmKwoCs6VqZ4x6ElmbMqPToMHGAmexTSysPXgg3yTf0rqN/44sGwnHHa5T9ccAFbNaEn
         2krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022326; x=1774627126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PctDEUXKMufTE1vDUhMMgOT8ZcWW48msvLcxSWpyGkc=;
        b=HKnVLZbEXz87eg6nhA4Vvqea8tygmHALKmRnQZi4FpRWhBvee8CK8NUfd8RfIbzMJ0
         2IGtZNA3FvpU/Ph8NkZzTsZ/hWZneS6dJ3akscv3lqPxH9U0hctoR3FzRlJuHLPAZobn
         vtWCaehis6GgQ9HFiiivBaGAWtOgY9o1VXf/SWYkSMbEMaqhKQq0subvf94PViQjoYP1
         jMbsiSXgbF+07aHnYeJrXlsI7TiQt6opEdnPqnj8CsJ8MYjniKpYsZl1CoICER+1bMzO
         d2Q+W9ypDMzPwxliQ8dB251HliXmE3QM/MwYLYA1dgZ2Jy9XbzY8S6gYAn44InhXcszl
         AgQw==
X-Forwarded-Encrypted: i=1; AJvYcCWJh9yPCVo8GC9855MRYJjzqxkXTKVhtZqyzoRnwExJapQRaRJHurkoHyt7CSB/tWbysajax8vXc2DYLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+zv0w55dDZroSxxzkKjUbe3lKNhyJ/q1IA4t7Su3yWihijj67
	uwWQlkd8CLx8BTId94dajo4nNZUY8RUH8eAabWbl7BCSVCQqviq2ktt7
X-Gm-Gg: ATEYQzzTkwz3Omx4IhTVgklU3l+rYW9TQUpx+A8trqSPw+TPjXosbkJfxQDewM0k3Xk
	gbmBd3yLO6OS76nIyeySsDBuz+AqlhRFkFA66fwSPz8xG1dLEVxYVwdzBR42ox2sjnYA5khhhpw
	Ynis2BfBNBm2yGcZvkDy46AhxDWtpvdAbgbqB0ZKOdyAmk6OXm05Tynq/qeyp8dXMN2tEOzVIGB
	FmmP71FQN/WIqZYZauzeCqOxwz2WGLnGPzUj1dcG4RFemKaSvogT60kjEJneH3LMOCffM9AlqEL
	ZNcgmUgB2gYIR70Amf51SLotqMHuwDlOE9H9iyEJ6QQIsroKRz4tL5S5ZQxNuWTOjH1qdLBEv4N
	Z0i4GERpRjTNna42DKr/TqVBg1nIx8VNgxlQwKy4wGMzH88CxhUsz3HRnCKuXtzdAUMgyN9Eyv1
	gcnEu2ZoRzSC9QkQFZVo96NXbIGnntsCKPeC/e7YcaK1KKObd107Ud+w3fUUjWZZxN1VRoXSVRd
	QqNybk2ZIPMEpT6WS0GlMmoLWGGc/YVolk=
X-Received: by 2002:a05:600c:4fc8:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-486fedbf2d4mr56008945e9.9.1774022326206;
        Fri, 20 Mar 2026 08:58:46 -0700 (PDT)
Received: from pop-os.fritz.box ([37.101.238.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm215348785e9.13.2026.03.20.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:58:45 -0700 (PDT)
From: DanielePioGenovese <delitedaniele@gmail.com>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DanielePioGenovese <delitedaniele@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add MSI Thin A15 B7VF to quirk table
Date: Fri, 20 Mar 2026 16:58:42 +0100
Message-ID: <20260320155842.55304-1-delitedaniele@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MSI Thin A15 B7VF to the quirk table to enable the internal
microphone, which otherwise does not work out of the box.

Signed-off-by: DanielePioGenovese <delitedaniele@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1324543b42d7..352a07728d78 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -717,6 +717,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "PM1503CDA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Thin A15 B7VF"),
+		}
+	},
 	{}
 };
 
-- 
2.43.0

