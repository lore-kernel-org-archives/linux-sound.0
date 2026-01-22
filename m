Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07A35B639
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097334; cv=none; b=IfIoOo59nOvnEMqLHAIGX7Q/hnYw8JWIcYaLHFeDqhLdT1Wg8cBDdek8RZb/cZjdPcenm3qx8XFsM5/4/W4yUcyPuwLCWGMTjyyMTdgacpA2pIMK2f3SQ15nvJ23zfGIBG3jZHaQUA00MnB/PGdoL8uM+YRmKTEugapNqnU395w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097334; c=relaxed/simple;
	bh=V5b8HegB8GRX/lAVl+vWtZpAiWhKdfd1I/+Cxli1x/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUvhtUEnMykS4J0fR6Oxaxn+sbPbR+OqtOFxum3linCX26eGJqVQghtPNP2AX4gwIgCVIidgwUiMTKP65BPWApUpgRpoMNSlMGtq/0UnlzzrfVA4PybJSnBBxergUobHTUWfB5A7CZZs9YigXJ6TImVq2S8SXd+fmQAzk6NC9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br7FI+Z/; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br7FI+Z/"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1520353eec.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097323; x=1769702123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT7sxUlCTKBw+bxvJar1XKrjKbpL37hYJb8bo9j5S5g=;
        b=Br7FI+Z/RvxaX4t2XCZthxCvicYRTqC8KliAR2khFB9LAapxggZUTiyREzzFL3AHOh
         n9TCgAnr0VSLmZoJJkstjmjkB2/ZoMlwP2v4z7z8ib1v2w1EsuQKCuB7d2EAtsUTJMgQ
         h8uxgitbSqb28MuhMdyXIaB7whECT/EFDvws0cyqN6UvWCR8LzE2abIgBDpKuLtLp/0s
         lfE2hSCzpVTMBzM8LK7jFSLpoT5EA1FmOxxO9P6aYrAAlzo5IGV+j6CsvWSLM3pjNOj1
         zjf4h3uEC16heozXI8hq945rXIxaasheBVIUgg9AXfCKRPfp8AVyxV5krlqcxt/tkHxD
         SGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097323; x=1769702123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sT7sxUlCTKBw+bxvJar1XKrjKbpL37hYJb8bo9j5S5g=;
        b=DaS2LLK4yvlyyNzn7iuyBIi63JPRQnZvKA69HZcMM71c7xXLWW5qN5Do5m8tKTk7uh
         IOYTGDbTAHRMQaCpernm0dyc/5rXfezWu9RQ7L0MBWIHZ318+jBAd5sav4J70V4mNo/o
         a8EDFgPPtrG+Y0zlWv+KI41qS9EbqQmsd0We/i14gySVviMs555FzRfOVe9VEUcxFL9s
         Qxh7OSEUX+/Ld51EE9eTmagY/PobpLjxoVsNhTHpHhSIJmwHMWrwA3Ku/IEarLyRcfdH
         azXLk6d8VWwci6S4hZhvL2lOz5spbTITdV0iUNfVDq4qPZ+Mdn+QJ/DUHFydjM9eUpDb
         BFsA==
X-Forwarded-Encrypted: i=1; AJvYcCXijcaNTSYXPn0ayPx54zqgd5tuMdPAmT3NMaFBYCghFsSEp1OXm8vZ1CgIwN7Yg3W8C35+witGuPT/UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6vWCi2WhXXq5vRkLizAxIDX+WJK7iKwuoEsYUdIGUiOKzJog8
	t4Wq3y9iYS0Zavp4ub+sMZEfKt1p4nGYLB9WY1ZXgeqTzC3v6LU/nzkU
X-Gm-Gg: AZuq6aLaB0oknOwW6sN/fV85AHeFYsZZNnygUOf95cgcIO82QFv2b3PCJ/K88c3pG/s
	/TOMSRxE2SJYiSch4qERa5jwy293BSdD5+fB+mrx04Z7HPWhDJK9yY3aCWLhAzm4idbLr15poBJ
	0Cci0QgN56MfdjzeBKSUY2RNF4ii1BPbyAmUlseCKe4jbrOxKJ1LDV5DAGIukCqzPH/6pPDMsK4
	X2CxgaULDfnklbBopgnK/dHuVJEBRXNjCQXdlxJy5LubzZrW86olLTb21gqBwZ4EtxPatFWghA1
	UX8Yj9eaH8R6/B4ItU+pi8vlff9OrT+yvUDJwNZP7/V+tXX4xkiI/1RBPfjfMWMddQqSVa9S9L9
	xQ0gfg/sUWEK8sAbnyb8bQ7F3eEzb/rX0Eli8MPDR75UulTPenkGmPpZhxaQYdg/anH+BUl6idr
	NrbyMMmoJa3vKborjhzsdLtQNWtRBhXqt04Ycl+P23QW1jmnSSsRl+
X-Received: by 2002:a05:7300:e88e:b0:2ae:5a9f:d98c with SMTP id 5a478bee46e88-2b6b410b210mr13103401eec.33.1769097323537;
        Thu, 22 Jan 2026 07:55:23 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:23 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 3/4] platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:55:00 +0800
Message-ID: <20260122155501.376199-4-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MECHREVO Wujie 15X Pro suffers from spurious IRQ issues related to
the AMD PMC. Add it to the quirk list to use the spurious_8042 fix.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 404e62ad293a9..ed285afaf9b0d 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -302,6 +302,13 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		}
 	},
+	{
+		.ident = "MECHREVO Wujie 15X Pro",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		}
+	},
 	{}
 };
 
-- 
2.43.0

