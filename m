Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153188;
	b=1dL6dIDogrOqs0M03Vaoxn7Z8V6fKwtQQneuxGRrcuDVFXODPxqIv0TlWF56TbT6296a
	 X/2C9JMPNzrY2NfyW2LhibdRYe6DH5TlUgZ8xVZHgcw/hDZYuPaxV30/MsmGdD4LxYlU8
	 fT9AA3d5RIvzHJZ5NHFecKMHqDhanEl42Jjdo3l5SzbnJ/3k1pI9V3tC4sYIP9Y1CrHD+
	 eIXZlcaaeMXVzZPmb3Jiirfk1rIKFxdDscu+6nRnm+pAz8/88Iw5PCnVAeKtppmCtuNtU
	 fyUWBqZ7gPmSdN8GEriBz2SM9/D/1y3rKw2bl0YqLMr6BUXHpTtCfoGCXwK1dIlGp5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=axShwuYrUaqoZ5SjPijUgtUkgyVfdsKV80VsjOhe5I0=;
	b=MsZWWmMBXnzk2I80SfK4T3dJvTtNgm/nnrRiFqPfioG7aF9gHSB5XZ9F/c0SiUMXlx2d
	 xzgqozLXs4AJ7x5LjD+GYiNZDMztYUObIDjNr+rcoRxlKqNdhWZJt3PwUZ9PDalJRNKAi
	 mNNkSCQM3Qlys3QhZOFIjHttAUaWoVN2xrl3nW0/pTJbSTRwGyApl/es7LABEY0YV9u+I
	 u0Jfs5NzbHjIURbtQd2OUP/fM6YFYuvyx799nu3FThBrfxOvn/aHoFoCnLUMzss+AIb1Y
	 oMFuh+6NQHzeN3amRVvDlrOsk9YH81djFbS24xw3z51DsCHaKj9yY+rqyCJq0p+Qjow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8aPtU4e;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648B606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4648B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8aPtU4e
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84a2bea315dso339419a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153187; x=1793757987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axShwuYrUaqoZ5SjPijUgtUkgyVfdsKV80VsjOhe5I0=;
        b=E8aPtU4eLMUFQ9UGWiF+EmL7VBZJZYGjJiwtTBGXsjls2K/4RMchacIHrK0+7RNgSV
         1Dv4RxtTCMeTbUrUsJUp3ABytdJ0GGqI6CNvLCyUovq08Oz8v0+m33J6660XXhXXItyK
         BI5qUG+eCbwXAfRWBAN11D438brt5xK0QcC1hXhtNYfA/x5QOabJbGZoT/44rkrEHp7k
         P6INZtNaJjIIVZ38Cmmb9O7j6fgftOw4CG4rHbrSUQwDg6JtCpGyef8vv96ghOGWrQUc
         g64SEqSmYDZk0zIQ8qUerO9FZtBJ9IJoN4upxByYhHM1WBvz3U+ThdkprdN1wdCdRf2j
         7nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153187; x=1793757987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axShwuYrUaqoZ5SjPijUgtUkgyVfdsKV80VsjOhe5I0=;
        b=SCwsEe7bJqsrR4BIUlgW6lrxPpruG8fqr7TT3qkIdxYdK4Ba1H+BQz/cW1308yvVKy
         wgRNUzTbF5P5xcpxWFcxr8SkqXcovQkLnonyd5Yl0PEapmNmjNHuwDlTP9465ME9UD9N
         W1X5YM4k2J2f+GVGeu0gm86J/gReJ3SJZTllSBpR8Z5THxTgQ8yqc++y4KzAnkvuslLH
         61wWHGBNSG0HRD409/Ydv1UfIedZbGzP4nA3d/AoW725eyWN2PbMKqPQoRaPfK38G+yZ
         DiYEEGyLEgbzUkb2PXtFUXiYeDpFYs8IBw3X+yjP4jmrbNiJLWOpwYzLpJAC2U70aQvP
         TkQQ==
X-Gm-Message-State: AFq9FYK1Cb5d2OLLYOAY+rfX3/Vr7GV6PZcpT5arWuwknwTuQRJNdngK
	+mx8LsXmD3xh3JenE8ldPC/7Xpp0CTNlpHV8aXxc12SSr7yR3esU0pWx
X-Gm-Gg: AYBFou1fYda6bXMkYuMLkz6Jj7EwnUZ0Jy5e+5R+Y6chtY60yO4RtfyRsJXsf/gzAPR
	W15vJ3XwtR42s/or31lJETEgeW27N5nl1ePzff3oxquJmISixrU9VvAzjcNZnMYsvpYSTGvsuB4
	yMUbpQIJvOO2tXXvOmAZbvnVs/U0ZGemYPWBStJhD1jMn/yH+IxmKYhMDIji+9p32MFTxYVXTRS
	plFNXfguxQDyV9MjrB5QdOWCMR/TJw3Uax6SnIMAvBTQTCEjFNa+zUWStfqDn6WQ8wx5YnoLq3n
	vqWGrrPPDwi80p5S580MmdVkXA28e8c1oLdgiTIW34XwNTVACSYfzkDLh7M4/NxXbyqNySrvvoV
	3wCrBLD+LStyMhA31FKjuhL8CsM3oQHRyj+P6rhnACRRZN5vDHf/eLguQ1n08QJ7KFWCvFxyoR8
	duIUxSoPHbEUNJoonl70+PE7RLKZNC0Nw7QaNPsyXYtC6/F8iIJlzSiCvKnRg/ZWJqTFY8nfwEP
	EyT5hElBrvJ/MTJIIp5msxMM4nwef8ZQvlIK2TpQt1XGWWvT3Re9nI/ZwU3W7L0EQusKgfka3Qi
	qBvxmqmovN0zwd7VbzwbdFbMnCeXVdFokOZZjJN4gEuzx2cfnX4tMybHkml6kD/Ce4PYkXkAHWf
	Zr+zCYRe2bCPozVfmj2Qx6A7AS1DBXeaopOGtfElnR6o=
X-Received: by 2002:a05:6830:82f4:b0:826:b77:adef with SMTP id 46e09a7af769-85ac012d82amr1081616a34.14.1793153187233;
        Tue, 27 Oct 2026 19:06:27 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:26 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 6/11] ASoC: amd: acp-config: route HP Dragonfly Pro ONE through the ACP6x SDW stack
Date: Tue, 27 Oct 2026 22:05:47 -0400
Message-ID: <20261028020552.35278-7-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
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

The HP Dragonfly Pro ONE (DMI board 8A7F) is an AMD Rembrandt (ACP6x)
platform whose speakers are two Realtek RT1316 SoundWire amplifiers.
The default driver for ACP6x is snd_pci_acp6x, which only implements the
PDM/DMIC path, so the speakers never appear.

Add a FLAG_AMD_LEGACY_SDW config flag and a DMI entry selecting it for
this board.  The flag makes snd_pci_acp6x bail out (it refuses any
non-zero flag) so that snd-pci-ps can claim the device instead.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/acp-config.c  | 19 +++++++++++++++++++
 sound/soc/amd/mach-config.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d48bb0..c189078 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -251,6 +251,25 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		/*
+		 * HP Dragonfly Pro ONE (AMD Rembrandt / ACP6x, board 8A7F).
+		 * Speakers are two RT1316 SDCA amplifiers on the ACP SoundWire
+		 * link 0. Use the legacy ACP SoundWire stack rather than the
+		 * DMIC-only snd_pci_acp6x driver.
+		 */
+		.flags = FLAG_AMD_LEGACY_SDW,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+					DMI_MATCH(DMI_BOARD_NAME, "8A7F"),
+				},
+			},
+			{}
+		},
+	},
 };
 
 static int snd_amd_acp_acpi_find_config(struct pci_dev *pci)
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 150bab8..99b5b2c 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -16,6 +16,12 @@
 #define FLAG_AMD_SOF_ONLY_DMIC		BIT(2)
 #define FLAG_AMD_LEGACY			BIT(3)
 #define FLAG_AMD_LEGACY_ONLY_DMIC	BIT(4)
+/*
+ * Route the platform through the legacy ACP SoundWire stack
+ * (snd-pci-ps + snd-ps-sdw-dma + amd_sdw machine driver) instead of
+ * the DMIC-only snd_pci_acp6x driver.
+ */
+#define FLAG_AMD_LEGACY_SDW		BIT(5)
 
 #define ACP_PCI_DEV_ID			0x15E2
 
