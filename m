Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361216;
	b=xEmDlMxjCDGyNReNGBwvlM4dMzOrbWDAvgd2VE3FkHGmU1wfikmaXPwPqCvNerFrSBHk
	 0G5fsn15J6pL0wjH5ml/aLl5xptaT56YwQs6gQlRIVE2Fa2GTHkTCXmeIaL4F1/rbDszx
	 4KVvxA+APM5wcBU11zFDYXRsxYC9Pv4ndbgutHQZMQ+D2NjAPhiJWUjhbUzNDCFCk9EMv
	 TSExsG6V75P8dlZkg7idKOWHNGECUu486FOmnyXv9qxE0/fUayS1wbnkahBtIAJExlJg6
	 +eACdyaHsbwgYDCak/0h84pZikQjQKMedl63UVM8CQSxSUcmynsHUB+OJfx/bM7Q/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
	b=J1PSKngWeyPXWCrgKp9b/jkg0yBjkMT96C+9FnN2+y2lsKE4N+6wozTVCj6hQRx+nAo8
	 jpRTu6zV5pSWk+1Fk/fPPUrh4PBB45pDbJJmcdjv9Bao8rgStFwzx69s1EvX7jYpcFyEP
	 JMOEc3A7NEs6gpHb8p50PJED/NUSePDKkIz6l0rkFg/jedqG2PXuxe5DAw9QFNiWHUcGe
	 g2WQyOpnTU6Xbq8lpmtsvyy6bTF09EE1I85O4zLsGkDBS2L3Mqo+FRZmJcGSp4f9M1/0W
	 8cX9Hcp223H7AkWFdZ3c4IZ2Q+ccn2vOsIdA2w7oJyxNJnlGDQDqvGe1U0Fh5i30/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRO3c0;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE26606A335
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE26606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WLkRO3c0
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2076685b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794361215; x=1794966015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
        b=WLkRO3c0YqXv25uSyL6aAZJ6yrawkjxBU6b68X1ydWWn6203PJK0/UVBjxdIV2Vrh+
         j7E2BAX10mERQH2zUm6/l6ZwPECkqipZj2BGSOMykmO4xhNhKOiVfaz8iAjbfWzvTOJ7
         Du5wez8wObK5QWtrK7wMgrtOD15F8xAiohC6u73CtLIYw4X8sMhtVC7BrzPxOJZXlz2T
         esxofHExaj5jjaiwq3MxcbPakejAHh/GdUSrcFyA0zjrgGXPYFYf0GSxzYQudlD795CW
         y7nYJFH/ushOHmH83mLuV/yOynlwrRtigWb10dzUGZ/dzES3j93fzjMmltR3/4jhEmHL
         RSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361215; x=1794966015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ykFGH6gPM0SkWbKXPmtRjujCSZJ5+PpFSuGK9oR+Dno=;
        b=xrThoyfICDeJMQd8Pr6rIOpYuDdywGphvlZPgLrUrSYCaHCujqjTWCCOuWSY7lgF3A
         dfh/06bMd7q6ijEHW0aL7MwAX5awUKSTN/QQ6Js8e63XoII9bW0ag72gX9p6amlxrILh
         3DYC4gjZPwU98ezlL76f+JqBjZGKyorXte7/zL1nnpKOMEu3mVH5AXvH5QAAFXdkZv3C
         Y/ingOVZC+27c7tPNFKwBuumSt8+SEdDG7GOHb8vpRBoU0jhBMDI1cWKKeUAgR6RQUNx
         LWnOZ3ygGzitdepa4LVPasrocCg5nQPPFVoDjjcpo5aHtrpphqRoKQnpIDGeVD3iz0Pw
         Z+lg==
X-Gm-Message-State: APuU4Z/Jg/rXsLDyjcDxISorBU1V0DMj89+ZaFuTX5pQh5NVjmz0s5tT
	luyyZkgGPyZvbgysxS5XlvaTprSX86SfxAlfsMJBqCEhlGqLX/eAH6cIpcdEeEF0Jaw=
X-Gm-Gg: AYBFou3M0erNZaMvdPBDOen6EvCoYa32XPdvkn4UNL81xy+Kc1ZADigMChZgZvDJTG4
	JBcVyHTwKQuTxwh93pNkJx6P4Be2RiPiNqY+NBKKTw5Q0QXXYA5FVqWPECr4Y80XE9bFeODIQ8G
	yTc3xlyIT2aMr766mXBW7cY4fHzeG+i8Lm/qAJtUANqoK8nQfpdPbU4jQuORm/SXBOXormUNRCQ
	Zp37agjG0VkfhmxLYQ58TPzWXmOQkvyzh5dFW1hsD/54ghsI5Y5qanshoFvqcicN3W0YowppOLS
	ASUI4Wa3TF7qFNjBM1vyyUmyCOJDGlJSK0Gne1KUgO/dKb4JHIRpJ7fjxDxHIfS3BmgJw1UdCWW
	h+glV2fmHec1IUk4ySVZFqwzYBMauGvh9WbTIukne5RVwWyd8UyccALtFAWw2wIDrLsS43G89sa
	j7UmG5wSFB4R4UxNmWcNGY0l0IxFzGglFXaX3FT79ueCAkyBue+2ZZuikit2hZ9EK5f1IqKZjxe
	4mzghji78Ddi0n1WooZnLjYw6gb8eDJRS0v+JZ3hsyw97z7Cc+Y2CQh5CX7VD4I86RSajLLzcMs
	l+cuJ/2Zjl1K8M/ke5uJxg==
X-Received: by 2002:a17:90a:c888:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b182e94153mr836619a91.11.1794361215104;
        Tue, 10 Nov 2026 17:40:15 -0800 (PST)
Received: from myarch ([61.254.29.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm1912111a91.15.2026.11.10.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:40:14 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Kim <jaehoon1744@dankook.ac.kr>,
	"Claude Opus 5.5" <noreply@anthropic.com>
Subject: [PATCH RFC v2 1/2] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
Date: Wed, 11 Nov 2026 10:39:09 +0900
Message-ID: <20261111013953.4011-2-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaehoon Kim  <jaehoon1744@dankook.ac.kr>

The LG gram 16 (16Z95U, AMD Ryzen AI 400 series, ACP rev 0x72) BIOS
sets "acp-audio-config-flag" to 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC), but
the machine has no ACP PDM microphone. All audio endpoints are
SoundWire peripherals declared under the ACP SoundWire controller:

  link 0: RT713 (UAJ + SmartMic functions), _ADR 0x000030025D071301
  link 1: RT1320 (SmartAmp function),      _ADR 0x000131025D132001

With the flag honoured, snd_pci_ps bails out with -ENODEV, the legacy
snd_acp_pci driver binds instead and fails with:

  platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found

so no sound card is created at all.

Add the machine to acp70_acpi_flag_override_table so that the
SoundWire path is used.

Tested on LG gram 16Z95U-GS59K (PCI SSID 1854:056c): with this change
snd_pci_ps binds and both peripherals enumerate
(sdw:0:0:025d:0713:01, sdw:0:1:025d:1320:01).

Signed-off-by: Jaehoon Kim <jaehoon1744@dankook.ac.kr>
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
---
v2: rebased onto broonie/sound for-next (v1 did not apply).
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d4c852..febf559 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -140,6 +140,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* LG gram 16 16Z95U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
+		},
+	},
 	{}
 };
 
-- 
2.43.0

