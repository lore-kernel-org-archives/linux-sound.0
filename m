Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6B3F0756;
	Wed, 27 May 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877451; cv=none; b=kwobRdvDIdBAaEDxhAgSiHX4/iSCothgStcQRArqr4nmbESUopoOhDOCCSR3DyRM4Ot/DfRpIFAqjM+HVOA1sSshbX589eXhAfBedkY4wNs+u377rwGp6Q8qOlBduWTVI7jDss6Vawha+NZNuk4O90yXs11tKFrSWAKoDIFYsN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877451; c=relaxed/simple;
	bh=FpG5l2cvk8IMT7XzySU95EKP6jqmiec9N/ylJhDdPTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpEtnAyE+y1o4otg/KbhqXZdJP5G0o5cMxVOJPSX0JibGo76O0p5968xRdmaa/M9EwxAPPBDR+e6/hjj0oW0HFqM4qLkEdj1I/kBQwOOvcyuV08Hsn4IYhnjjCVfwTf2Q1lvDOT1SVq+L1QZ+MebS9oJJQPOSxTXIF8LtZAOPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=VVT/4pu7; arc=none smtp.client-ip=120.232.169.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="VVT/4pu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VVT/4pu7uCDk14uH0EQhBzbmCQTjhNZBrygmIBM8W/wdnxrISWdfGw1yLM07zzvBoOFyXFhznMmwh
	 4ZdUxxYqS/jAwbmb+55y1z151oLs+/lX2Un5Z4b09GM2CMCX7kFG+YAhbxugjG0PqsDOk0YTuAzBbp
	 cjjqA/1IQCaufEmc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from jackie-ThinkPad-X13-Gen-2a.. (unknown[240E:404:1921:11EF:2C85:75C6:E357:18D3])
	by rmsmtp-lg-appmail-30-12044 (RichMail) with SMTP id 2f0c6a16c56fd6c-05dd9;
	Wed, 27 May 2026 18:20:43 +0800 (CST)
X-RM-TRANSID:2f0c6a16c56fd6c-05dd9
From: Jackie Dong <xy-jackie@139.com>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH] ASoC:amd:acp:Add DMI quirk for Lenovo Yoga Pro 7 15ASH11
Date: Wed, 27 May 2026 18:20:05 +0800
Message-ID: <20260527102005.58528-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Pro 7 15ASH11 with AMD RYZEN AI MAX+ 388 (Strix Halo, ACP
7.0) uses Realtek ALC287 series codec and no any DMIC connected by ACP.
All DMICs directly connet with ALC codec.

Without this quirk, Input Device of Gnome Sound settings shows Internal
Stereo Microphone and Digital Microphone by default. In fact, Digital
Microphone of ACP doesn't work due to no connecting with ALC287 codec, 
the Internal Stereo Microphone as analog device based on snd_hda_intel 
driver can work well.

Add a DMI quirk to override the flag to 0, consistent with the existing
entry for the HN7306EA.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 309dc9ed6e0d..0d977f4f758d 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -37,6 +37,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S16 UM5606GA"),
 		},
 	},
+	{
+		/* Lenovo Yoga Pro 7 15ASH11 (Strix Halo, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83W5"),
+		},
+	},
 	{}
 };
 
-- 
2.43.0


