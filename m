Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C83195FA
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779554226; cv=none; b=agJCGFcc7QJwESmb8ja0anpFOwfLe05UY3zQcF51K0HHVEw5bwA3wCYryWxbpSNdh7GNXAkhAnf6IwUr+CRFfZ3DWtX4kJMZjuEXJAoHRDxXA3QyVBiU64XTNsaerAHYeTiWfup1RoANwcpfKnIDmLO7UzP/5MdlnBA6bQJ2Nk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779554226; c=relaxed/simple;
	bh=okkyOXF4a8RjgOUA8PQCQ2GiBj+BIMC42Zv76UjtEcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LGsyqaBz3o/yAfyKSIlELDAHHYtQt2NBgz4moL0r9imiWOBd7h5eODLA/jXyvFYGBNnJWypblFn4/OzSxe8M5mD9M4NLk4VcOX/RC+BT8r+RwBNWhNQ3sGleDpDdHzKBMbZtnCH6ykIlJQuXQDSo0osS+yj+SCKbpqLKLN3mxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJhR6pOm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJhR6pOm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso7401775e9.2
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779554223; x=1780159023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8I0wfEgf6M9ALaEduDiT9+DQW6EsZnPU3ZXbwt+Sm00=;
        b=ZJhR6pOmiEQDcgPP/h6kkFZDzOgJkdHUEzrudg6b9asi5VwFU/SIBSoP3MbRTl6ule
         /6k7SRMv0HHS585hpxWv9GHkisaG1jIGcGtIUge4Zs+R/eXYRYeYe7SryqVgilQlJt5Q
         g7S2Sldsg6y3yc6dGrD6eQJOoBR9CNWgDecq7g0jE/uVqEOatVvMSf7Nw9pNuVHwde9x
         T4bXoqHwhU07R+ZwMAx+fNSLge7/kGZzdhiOFNJAo/7g0iKwjFVH2ztPuNHGRWLebHpD
         WFJDmJKTmxcGBsaq4Lc+xql23jL86en+uWbI93wMnAUX7/nu+i0G/EhUEn/IRHOAvVqR
         RXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779554223; x=1780159023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I0wfEgf6M9ALaEduDiT9+DQW6EsZnPU3ZXbwt+Sm00=;
        b=mX/gVK/PvKOw2hd6Ci7QL0No4CBagf659+oyCKXDUTgktjkaIY9GIBwinT0iiws+rT
         VJWeU3ukM9nqV5QpFlWBbCsV2vHUv8G848F6UKe8FuvmWdTUi2vjqdLfMSupUaQUsxG6
         V+d+VKDjFPPxV8ZaSSeluY/NRWHP1Cwf5NJCpJzUC7TcsGYjglOSeRplcAi4Y15L5xnP
         d83heQjzppQX0yROuSjlKHpNrEHHXyOw361QjgKCh17HOY1SWjeEgvZrRMenaR1MLsS+
         Ar2V8fChCZoDQPZjla5XaimMf5sYxKEeGM3pT+xfKOmi0xnUxySOxW9pz7mfkk5M0O7E
         hviQ==
X-Gm-Message-State: AOJu0YzOPrntuHWsFTR/UFRY3OI+w1KS5idjtEI3FMg2UgIu7Jisrm2F
	qCPANG4BikgrdHcpe5LdIUbcX0uLJjOAvr7r8OuWbwbCWKEocsZsYwKK
X-Gm-Gg: Acq92OEuEKgkyT7PjydxXtlhZ318pecAe951yuqlGie4VA1fNdMfruhIdqUUjb815u6
	+3lFVS5r1hdXNz/+dQ3A2EKEcpmjahREH13LLhvzLzqjpZZ4lIeLDT4ZQPF1e45HNWRcSRifyTj
	x0H5AUTRyJvfihq6q8OQidZWFNXQcQktMwuKaV/TO6fIvkAXfVYDIXyRfg0trRAr01PGY7n+ntg
	oJTCD/TMzPQkvtuEO3wlsAWr+HgkgBXUVYNxSD/tpkA+kwbNIVXeVRwIPJpLo+GrpCmNpqe1Myz
	SsCIFWPzMjBdRwGRu/SBe+c0h57ZKe/6TGfkLNWuCxa889A66QzIVOk09qM69Q15DJlfyIYT00P
	X2UbfBBsdUMax7SS2zL4SP2Pm0dQWa5bgQAClQTR0gJlIzFv94h+eJaskGd9Btj5GHvtwqvDpQM
	eWceVOJ2yWnVqWYBFQF1fmOtdvq6mZlbcSxPQljqwHJJJyinIKjZceVs4eCuD3
X-Received: by 2002:a05:600c:35cf:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-490426bc737mr141865515e9.19.1779554222778;
        Sat, 23 May 2026 09:37:02 -0700 (PDT)
Received: from joaom-cachyos ([2a01:b340:67:ff46:c6ec:ada0:af4a:a7a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm121826695e9.11.2026.05.23.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:37:02 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Miguel?= <jmiguel.ghp@gmail.com>
To: Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Jo=C3=A3o=20Miguel?= <joaomiguel.sapientia@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
Date: Sat, 23 May 2026 17:36:52 +0100
Message-ID: <20260523163652.18499-1-jmiguel.ghp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Miguel <joaomiguel.sapientia@gmail.com>

the board's internal DMIC is on the ACP6x and isn't detected without a DMI quirk entry; this adds it.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7a637d6b5..a93a7fd48 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
+		}
+	},
 	{}
 };
 
-- 
2.54.0

