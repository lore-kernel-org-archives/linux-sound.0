Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F74C30F523;
	Mon, 27 Jul 2026 04:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785125934; cv=none; b=E6sklC1eIn6mvyA2a/Z4cvvmEDiQgcfGyQ0qIeJkZAhB2t5xo19O2cv1Z0fm83nNq8+ue6/yChMh9fx6x8ZxVEpiCQOnR7nXXBOZkhUSx5iUDGnXKJBF9mQ4YYL7JfvbDmMGukG1GXmggZNTV3FwCUBNdzZSbg/9Nqf/3ESOr+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785125934; c=relaxed/simple;
	bh=mE9Abe4d6CHuiuTXvVynu2DkVuaMQYrA8FW83jTLCuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fk3X6kz1LdP5H6+62LWz9oik0B4cpAm244Xyirx7wNVW/qkrT90yhKt5rEQ++kpYSuz+CQaRU6Fe/GdqkFkENbGwDXR8Wk6R0ddNXbJpTJDnPX3dfmcAIlWwZZ/Q9ii+sOejQc/I1VBRLqOW7o9Rd+RCEaeyTdQY7DTkUGtz+Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=2/jLCq/N; arc=none smtp.client-ip=120.232.169.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="2/jLCq/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=2/jLCq/NbXOuamipgf5iLFkuMuwg1aNdPILT7VXYt9iUiHPUQ50rE6NS6+mjQJKyU8xvsbhjEOsuG
	 t3MkJ3x6mDFvE3OkWBryLzXp4zGNq2vJsL1HtcGBW9cjCb4wpeuYmi+5rEyK9KPEnyv8sW9ZVvdalP
	 uLZ7UtcIK6ZmTRwY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from ud26-Legion-7-15ASH11 (unknown[240E:404:1910:7BB7:C485:28A5:878F:AC41])
	by rmsmtp-lg-appmail-44-12058 (RichMail) with SMTP id 2f1a6a66db579d2-03a20;
	Mon, 27 Jul 2026 12:15:30 +0800 (CST)
X-RM-TRANSID:2f1a6a66db579d2-03a20
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
Subject: [PATCH] ASoC: amd: acp: Add DMI quirk for Lenovo Legion 7 15ASH11
Date: Mon, 27 Jul 2026 12:14:51 +0800
Message-ID: <20260727041452.16701-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Legion 7 15ASH11 with AMD RYZEN AI MAX+ 392 (Strix Halo, ACP
7.0) uses Realtek ALC287 series codec and no any DMIC connected by ACP.
All DMICs directly connet with ALC codec.

Without this quirk, Input Device of Gnome Sound settings shows Internal
Stereo Microphone and Digital Microphone by default. In fact, Digital
Microphone of ACP doesn't work due to no connecting with ALC287 codec, 
the Internal Stereo Microphone as analog device based on snd_hda_intel 
driver can work well.

Add a DMI quirk to override the flag to 0, consistent with the existing
entry for the Lenovo Yoga Pro 7 15ASH11.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 051946562725..88e4230d66c3 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -44,6 +44,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83W5"),
 		},
 	},
+	{
+		/* Lenovo Legion 7 15ASH11 (Strix Halo, ACP 7.0) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83V9"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
-- 
2.53.0


