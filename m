Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E16339A8
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 00:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566539; cv=none; b=IGGUFAEx/UruRnWBF32d1ru5duoVAKptlBX6Dw9/DheHXwT3OUo8rn6Xxm9ntDUDyaWS+Wb+4rqKHylzOHrz1AloKVANI0qKPdAgtqOiuvaN+liTVzNGztur42dTzJMOVgCLZcGVX0mEj1K5Z43Djo8Md4saxg8ySCDDlqqOfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566539; c=relaxed/simple;
	bh=4mGUeibckp/9Lam8HqYkqN5Q1dFJz4zN20Gjmi4devo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx/WyqWLSu2GMFr0/VXQIsAzW6+GW7fA01Iz7fK2XiLUnd23ndYSsag+AONv6d8gEicXDKUa6GXpSjuKE5aXsybiox1QOA1Hhj8NE5UMPSW6EKXKKdi3DCmNdC2hz+VcLWAYy16o3tHA5zXtYGik5B+8NorOWPB+Gq3rnShagWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxo/xUVR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxo/xUVR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso11667155e9.2
        for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 17:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748566535; x=1749171335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AirVpZjhooagqDOn25zbbZIb05rXDODFJUlbSWd9V8k=;
        b=Cxo/xUVRV3AOBCYB7ZJEmYti26avAa6xEqDI20XqesnaNmwVb85E1nq8vlwrVvcfwe
         0f7R6ZNGRtvNVKxGYgcuKfG5lQYdASM9Y1YT2DpByN7CHpPMqCmgx1nR9rL5LpQuN1TZ
         yQsuXigqXYrWFx0F7MAQ5m2oU9Dudo7T4kiPzmcbaplAwEL1mGYFNQV7XicoJcj2QGGu
         7+ngEjNheW1c+OxkgN+cOrPu/kBfoJi8AR8T+haa/obd+2Vgd+WjWKHeGo6djMBP5Nlo
         cX/+ceXxnXeexcfYgaXhDS9idWbGu01oxTiBoGRAkaqZ48+9WxEjj41LJ34+vTsoEsp3
         AauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748566535; x=1749171335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AirVpZjhooagqDOn25zbbZIb05rXDODFJUlbSWd9V8k=;
        b=Twaook60xR8J/yeia+H9ceyqurpp38jYSSraCuQbcPhc0hegvgZau77DX5Q6QiCQWc
         61q7AJEYbbJCBvbGrrlrIAz9WipXiKfYLmngb2a4rT+v32mxn+2RMpHkY5P5l+Gr7tqz
         Hx3j3sPRgAeh07gKAO/Uo2kLPIaEG46t/1ZjY9poheaNj9RObOG7SmBG8eW8PNnkKAK9
         PtPOMrffCJxFnCyBIxnYoFHt352vnmAa0qjOxaWLaKdAC7eB1sAQTd5ecQXVWwsWCPxy
         uql/JY9N/YA1Woe3x4Gle5uFLG76vv8AC9naNU34Us+3CL14Eq0RHR2nV6T38jV1E1ZS
         zywQ==
X-Gm-Message-State: AOJu0Yz5iFKk7f4V7aB6w/Bo4CTaoXG3NOyfsbq7eOSCESUEGOKn1gFA
	VILiBBMhEUVew3qWVFCVH4Z18WN9rt8g8nbaK3qsJIT+roV+dVf3EwZnciLcddYS
X-Gm-Gg: ASbGnctlIInKC/XgP6y1duBrSDplAga8xwfUQvu4kGWw5QmqI6B9LS0CiYGpbz5SDRM
	BOYPPDiCwnq38I6rEodXanREXvvZpAiI7rfCLOWWoqhvizxTW6Tme3wUqKoNXK1h6b3sHVLW50N
	0RvKgzUteOs5sG5FLlE5JH2fxOFQoJdI26ji/MsLF3kB/XLcYdZ4Oru7+P2k4YHtsITwVQbg1VE
	5IUtw/zjzvVAfNgeez6q3Zsp0krdGqd0hdo/k/Tb+do8fjuw8bNnCBVgJnjrvaaMeksoFhFOKh7
	svAUi4TPr28UVusXyuyOJzYzIL3DFbl79wMg6PBGUEjk5v78rxG/xiU09Ad3
X-Google-Smtp-Source: AGHT+IEleyGD+i28SUitzaJ4QkMitQR1wjae3koXjFc8eHIfM2W8j+lYoh+6/U+gIbV58fNZpqhSLg==
X-Received: by 2002:a05:600c:5116:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-450d64f5c42mr14735825e9.18.1748566535269;
        Thu, 29 May 2025 17:55:35 -0700 (PDT)
Received: from archlinux.lan ([2001:b07:2eb:e808:4809:a7e0:3d2b:a46e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1basm3200955e9.6.2025.05.29.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 17:55:34 -0700 (PDT)
From: Gabriel Santese <santesegabriel@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Gabriel Santese <santesegabriel@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic
Date: Fri, 30 May 2025 02:52:32 +0200
Message-ID: <20250530005444.23398-1-santesegabriel@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2bca9eea-d75e-4e2b-a32c-25b2e7fcaa2e@sirena.org.uk>
References: <2bca9eea-d75e-4e2b-a32c-25b2e7fcaa2e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI Bravo 17 (D7VF), like other laptops from the family,
has broken ACPI tables and needs a quirk for internal mic
to work properly.

Signed-off-by: Gabriel Santese <santesegabriel@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3d9da93d22ee..fed150002041 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -444,6 +444,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VEK"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VF"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.49.0

