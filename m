Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1jnJkAU"
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD582D5
	for <linux-sound@vger.kernel.org>; Sun,  3 Dec 2023 15:30:09 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ca0288ebc5so4818901fa.0
        for <linux-sound@vger.kernel.org>; Sun, 03 Dec 2023 15:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701646208; x=1702251008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yeC8MKfInb1ck9+dTaSY7GS1OKnc5NIC26GZlu9xK0=;
        b=m1jnJkAUV2+Tgv98MqFJ7NMikMcVVyrJTu/bHAC0itC7AOOS0NAWWstSf/GKKpxFbU
         p0dqDT7xvlsjTbZ+EHSCrEDDfIxKdA7DmhZxrTHC/izYqI4hziJ4r3MhhWRU+nacGu3G
         kpGfl7bs+LsGhe1zmad/EHvErmkBDjlE+lMAN3HEYiEjVejIPIINshlkX133i7HqJqyi
         fRrShpTL6qHpZp//R7X4hQnjBeWTC+tsYl03BBnSP6etkWZSAvrJbH3ihQSU7BHshFNm
         tGnLu8nifvRR2JqCqkGuVKRBheFd91wFNcS2rysBNDkbnh3+LzrOOcVCEP2Iz0EvdzLS
         LwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701646208; x=1702251008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yeC8MKfInb1ck9+dTaSY7GS1OKnc5NIC26GZlu9xK0=;
        b=joJuFVZtz0A6hTi908PBWEOVV32ig+s/IbYLoG2mW29+W56yLLJLFCw8jhpgu6dz8b
         Aaqjubnmec8HEXfbXavwLQROhDXhyOne0NP94iMUfNdZKn1aYt69QyXG2r7awgPcEY3+
         xRNbSBlu8j7aFwEdMIFNs9A0/aGjaV6BuWtV61xs8o5i7PWCfPGXmqKauZxuyG7h7ZGx
         gsLDlW6Q5w22QYmsYuVw5EfK8R3SIk/Ydmmtpp+RsX6HHQY1llRHoHEK7GsTquOVST+n
         OuoT99BenV3uzPn8GuwrL/1k+5EcyvihDmzaE+JxDCVKHzdhUZnDu5u1hRHjS1RuSnJO
         Vn7Q==
X-Gm-Message-State: AOJu0Yylf4uquKgxr2KaioyBiJlW7itR9WUFs4FfRiCxiKaAIHGjXeyL
	awviewGG20JLxFwJhW/DHA==
X-Google-Smtp-Source: AGHT+IFtfATQFXqIBV70aXRts1jvcZEMvrdcrDKR2hkfp7hVMig8XxGS94OZ4sOGZZbKBzNFfHozdg==
X-Received: by 2002:a2e:b282:0:b0:2c9:d863:2c24 with SMTP id 2-20020a2eb282000000b002c9d8632c24mr1979856ljx.77.1701646207677;
        Sun, 03 Dec 2023 15:30:07 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-146-226.cgn.dynamic.upc.ch. [31.10.146.226])
        by smtp.gmail.com with ESMTPSA id e19-20020a17090681d300b009fcb5fcfbe6sm4597526ejx.220.2023.12.03.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 15:30:07 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	vitalyr@opensource.cirrus.com,
	kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix speakers on XPS 9530 (2023)
Date: Mon,  4 Dec 2023 00:30:06 +0100
Message-Id: <20231203233006.100558-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XPS 9530 has 2 tweeters and 2 subwoofers powered by CS35L41 amplifier, SPI
connected. For subwoofers to work, it requires both to enable amplifier
support, and to enable output to subwoofers via 0x17 quirk (similalry to
XPS 9510/9520).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..44ffcf8bf7c5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9705,6 +9705,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
-- 
2.40.1

