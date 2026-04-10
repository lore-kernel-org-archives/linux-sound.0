Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C8F36E46E
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814366; cv=none; b=KJMIchtS9gOkYBVcb+366uNQyT0mxSKiIE8oNVsVo9UCweMoD+lxOkx9ARlOgHHq8iQ9KIWz6BwvR0abAZhGUq8mI1MzFMRlQ1C/KbKr7pLyWMaL0CxkHOeBDqMWZ25rT9LB7o+mSMFKDu1EwS3prrB+yBbRLT4TYiEMWG+uZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814366; c=relaxed/simple;
	bh=XHKhbEJHZJ4f274Fih79mkG5qxSLw7qQ7phkfZqo3U8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjgpITDdcdsOOcJp58Ht2hmeaI9Pb6GPnjrlRSaGouEWiWfZJbVx2FRoG2xbs7gSOqjvd3h1H9AOjiwJmJprjgrcNOno8T2GaTbAIwFo/pTMp+cTiAdP8vXKfxfWWG73uiJFZx5UYUi+6QoykYteh9jPReVY26FhcNYs2LdZzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cD2qC5l1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD2qC5l1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so12163625e9.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775814363; x=1776419163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdEDmlrG/+KH91+a4efVb+tZiZf14dbLKWEMZxSuN8s=;
        b=cD2qC5l1uNTrD1uMo6OrHOuJE1ztEbIrJrcj27BpjihWxgPIxaSkAOHDCeJ3Ej7tJT
         Ct8TnyC9nU9ZoTSw1eUzq0fPVPT4oFH8fjE7FcNjM1J7evBi5TzNT4P1KufagS2IohtF
         RBy0cYm5OitRNLVKmWl50455yVobOmfc1RQY05qum3K1mgrZ4RFQBv5ILu8l6gvTlRW/
         Xy9RavpS+zIhHvEww6+K+upPirkW4plcOxT9sudQPxVTDfx2gocxi4VJJYyfQ/zwr9Ay
         ls1pOqYcPpd9qWTw8Yal8uKd8ekXHBgBst0Xrymbg8cb07fs9IfBgxVQmqYHrwJl4LOL
         R52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814363; x=1776419163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdEDmlrG/+KH91+a4efVb+tZiZf14dbLKWEMZxSuN8s=;
        b=IihYddDiS3zguh8ngzRk4nHz18nzFaCZt+Sik2rFl3jqXiitGXwwp2ooTaE2qHEHna
         Cy9S5UvtSieSmHpWcFcXcpRR/GW6iN3iXkHC2Qq4BkcbBnCmm3Fm0MPaYDqeGDjr+dwL
         ELjPzh67+4ngqdYWosPR2pEmANjx1HpzyfXxNUwzmDkOQ1z6IpfOtuUjH2xCa45G/Svd
         z7sGRXTO3kKQq+djLxHtmEvEPGwHSTZ+vU2OVSZLogJ36jSmHoVgVrhFt+bAPH2QzWcH
         nkhT7lQJhKdujn2CrJolIaMy+Tc0YXb92OYN9OpyzfL6FZVPsqMBtTaDAdpj4PirUVau
         /V3g==
X-Forwarded-Encrypted: i=1; AJvYcCUO1zJ/Qe0Ijqb2dkOiChHO8q7oFylunvg+1U7botGaKtWaWEwigZ7+QcKGHwLlQ73FHki7bE+VaIVxYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GEzq2HJQEhH9kjUvt36tqvgRicui3mHJJYXejkXoSctp+Ui5
	eATsT9mNBHbVkok4qBQUHTm7pyRutIk4EQZ6IHi8y1gbVDZxzJVV1TTv
X-Gm-Gg: AeBDieusVb/NZhJpWVeIBXgesIQNlfyCH8qjuL0WWOkRwX3iQ2UHq6O5e29B8vDGDV3
	/BYUOQuJY82G/ujJBH9Zy2B7ZXhNt/FtsX/NDE2XpWzzQnS56kerOUu+JSqsFLdF1leoosFbyy0
	GuNdUycPO9XOyBKGN6RVdEqbgZGPTrbbYFR6kNZluZAgJsuxy9CwWBoRM2+XjdJlNgmo6U4t9du
	zGNo6pE64UOOe8xPvcNs4CAwda1m1DYiQ5u1Ylwh03lA1uaPytEomf1f4Ut0QYyuAACpGex3Mo2
	P/I88fDsS+EgryQlTPQonjYJJLXbn1w1PH1V8HRJJdk7SMAZC0sLEsmEMbZ8S+iqq1L8VMpPen2
	b6Xqy6bKuijgGc23TGZFAQSBhlXwpxU6o3C6a7aFPpjlXmJJv2FhIuoNgKb9gY9VAV0RN5XQZDl
	m6FtxBQl/BcrIh0DjpcxaIRm7DTIY+4pvll8TH
X-Received: by 2002:a05:600c:a401:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-488d6839be2mr22814775e9.9.1775814362870;
        Fri, 10 Apr 2026 02:46:02 -0700 (PDT)
Received: from Vector-A16.. ([178.237.229.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d68585sm27887555e9.1.2026.04.10.02.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:46:02 -0700 (PDT)
From: Ihor Uzlov <igor.uzlov@gmail.com>
To: Vijendar.Mukunda@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: venkataprasad.potturu@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ihor Uzlov <igor.uzlov@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk table
Date: Fri, 10 Apr 2026 11:45:53 +0200
Message-ID: <20260410094553.24654-1-igor.uzlov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MSI Vector A16 HX A8WHG (board MS-15MM) to the DMI quirk table
to enable DMIC support. This laptop uses an AMD Ryzen 9 7945HX (Dragon
Range) with the ACP6x audio coprocessor (rev 0x62) and a Realtek ALC274
codec. The built-in digital microphone is connected via the ACP PDM
interface and requires this DMI entry to be activated.

Tested on MSI Vector A16 HX A8WHG with kernel 6.8.0-107 (Ubuntu 24.04).
DMIC capture device appears as 'acp6x' and records audio correctly.

Signed-off-by: Ihor Uzlov <igor.uzlov@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 85579c81378f..c5cf45881416 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -500,6 +500,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VF"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vector A16 HX A8WHG"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

