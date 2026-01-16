Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE63FEF
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768592789; cv=none; b=FgFiNqVwlHCzx//9VEHdOP3/eeUdAq35B18xEB6Mku3I41PVl0uaAffNZDBLYlMwORumCtteq2Z670bUHnscnn3oMgGuyP2xYi2DOeaVqt6qMU7CxT81veoC8bpQUEzkk/Z8Op+kXam25mk1Tj9fTjMXCJwCORkyeueBhoNcu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768592789; c=relaxed/simple;
	bh=+3+9+qRqbGNSZ4pG9u0yN3/d22iLd0/JPUx28owwajU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBbMDYH8/XQg411nnm1Nn3+hAW3CVqgoAF9SVoFS+SjbLZtAtFghCjZFh6Okx67spQ9Pwn7tWa5RglDwPKxnpQfWvWwHWb0LRsaCouTXQRDpWrOMvlPI20T+oeriGwbiQxHXuapIDS4iU7lF3pfyKgesccPwahL1Zw3GqeyTCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=mGJjj658; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mGJjj658"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso4852650a12.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 11:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768592786; x=1769197586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkFvSAMSQc6d4H3mgr4LzydlXkiQ6nVNfuytLXPQy5s=;
        b=mGJjj658i5uXrL3UUKmtmSw6P9wJGCkJCn3hswpTS0r+XRb3AqBW+hjDYe3JlbTp0C
         rSd6O0gpp8Z1Z+Pnpno8iKPCko8WgT6j2kB/DqucX/AP1F8gkmq07XbD+Hr7edEtkyap
         5z2/wIs2ull8/KN7OOzW9x9TU/5vSRtwiB5earHZciZAEYIWWuxww3P8I5FouI+9pC5Y
         LsNRB63USA6UycCUnkzzb2xVE4MZHR5uVh9wjY6wU9RPOR2THzdhVhaEHA2BE6Dlh/zY
         wrVO3swk+eJYlVEDe7YCoUqpN62T5VxPXZgBsZTgiWITJiNDTIBm0YyvE03ALq0XF7B0
         BEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768592786; x=1769197586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pkFvSAMSQc6d4H3mgr4LzydlXkiQ6nVNfuytLXPQy5s=;
        b=vxY+U7jNoQIoah7RI51CPSwKQ5CK3mRZl72holdko/39A+wiXChcezBzACzCACrT3E
         SCDst+SwYEfUiEFK96CdJviavvJYJmRBnUv2zSNYVHN4cJr6RAfnti0xb76jDOpuLSS4
         LxaNXt1lnip1ul34Ul5x6MaKdADViWuG3IoxBIX+yZJP0PMrMkecIlU/2Z5I2XzWcy7v
         Yi0UPpBLmjperkex8luGfVh676PGnTsQMTesvLpuufAcm8JRCaYw8BpnxO1shCizxIm0
         zLKG8Q+gK0xYPZDfPxWMVladwdJc+Q3kiZZv3H0vPX/NBb+9K5Vgb5Ul/QkszdZOk7g0
         gr8Q==
X-Gm-Message-State: AOJu0YxWzpHEkpC+4GJ/qkKsh0H3Oh78Vw/m6a5upSUI5OL4qTdAgSdz
	uGOqvUSuLZsBMw8ZEDwmLpTVkO5DB5tk+/JvWeDhWj7yYg31c1325c/INa3n4g==
X-Gm-Gg: AY/fxX54Q2lu7tr7HpIueJ8URCc/DoDUPehYn6XLOQsfGqGJ7rpaQkHArc2THqHsqyM
	RvVqgn/N2xJ1vNix9AII7fdqrWsQu2H1Gw9Y/ynYZ24CgvVzPggCv3CcgYNkRNHYL3QfPko59EZ
	F1nlCQqLgyjGNjGIJDVY3qRjrhqhlFP4l/Ld9jKfab/aByaojQC3zhhH2ZzXl1PPOjt39EWvMP/
	EVuTTi07usioXYi/PFd1yIbVcRR2Tlz9rGlA2GtARJ6RhXUeROkrR4PwM4CJFwJfg0dX2fdWWfP
	eMp2yqLJKhiNHp5ILAQ6NUzzwGRckeY/1PGB6jv4IsSQwIfCU/cYrGk6okbxo5KCo53Ar9Wc6Mz
	QWqYtsk79CzeHx1/TNPJoNLfuEExQH/TQd6qcMhGwPbvpsHvNLkvGef8ax9ozcMSn6iVMIjef6t
	Imp/nR9Z1AlVnsk/+8m7EMfNnzi5074beHUdHc6FrVtYWnuYvCXFZ2LI1/O5a5hWdr64LLSrCku
	wtGj2WhxxQnkjrDooHOILEe
X-Received: by 2002:a17:907:930b:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b879327f46fmr316376966b.50.1768592786133;
        Fri, 16 Jan 2026 11:46:26 -0800 (PST)
Received: from alien18.fritz.box ([2a00:6020:9cc0:fb00:4ed9:817d:d682:2599])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c7bsm343782366b.20.2026.01.16.11.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:46:25 -0800 (PST)
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	Oliver Freyermuth <o.freyermuth@googlemail.com>
Subject: [PATCH v2] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU
Date: Fri, 16 Jan 2026 20:46:04 +0100
Message-ID: <20260116194604.21099-1-o.freyermuth@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
References: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the necessary quirk for the Alienware 18 Area 51 (2025).
Complements 1b03391d073dad748636a1ad9668b837cce58265, which added
support for the Alienware 16 Area 51 (2025).
---
v2:
 - Resend using git-send-email to fix whitespace/tab corruption.

 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c013e31d0..f486bd74b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,6 +749,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CCD")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* Pantherlake devices*/
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.52.0

