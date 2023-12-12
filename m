Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9jnxxnR"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C15ABE
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 23:43:39 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bee606265so5608917e87.2
        for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 23:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367017; x=1702971817; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR68bREbcFUtVa6+/LHr8eofLYLebgCurmyF7HcbNMA=;
        b=S9jnxxnRjw5Br/BuQn4NAa9dR3O1sw3qtFpSEOPI84NLqEZZTzfZ/r3gzYQ4zzGUhY
         Sp/kji1o3U37gwtOqgdXLU9znODdbHODjIHGd/x7cvTZK+EtSqNtN2fHYumsU/AL6jdj
         BoCUIE0Ov5n9RLjzWQtFbqej6iVabOtdBh178jQPrijsM2SdNcikkGtbD+mQidiqFxoG
         G5JVZf7vxREJ4yYhaHgv+dnpz5lqhUyTvr04rreAaTuD5fJZUp8PHmtkPHPBOeEO/KT5
         YZfe2JhvSJ0j65Ve5/9RNdgHOccXj2jQBFiacjCNMD0VC2d0XqmMuN8OtUWFclteXWCZ
         q1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367017; x=1702971817;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NR68bREbcFUtVa6+/LHr8eofLYLebgCurmyF7HcbNMA=;
        b=WSTpmepjM7qtVVt9UwEamPSCGcIJdOt0vaj+LuuiPLhDmhOgpn5fWbc+NwwMN77RGk
         XcvFXQJMMgKtGTezFBMYfSpG7ZW2F6j3cfr0ehvXINOCFgOWYuezVtRCw3ucT9juv3w7
         +72Pbg1runB14vWwW6TupKty5lR630l1tV9G16isd+DXRbbaFBMYLYjU+qjfxD4Rhuvx
         t0BKYAmt/Au5z121MFdKDhwBunDOuf85TjvWNP9fuABeG4fYFi83jQXWdrNaOUGfnsCA
         gybJ1bH+79Xsu6mKaaTlRt9rq5uRtJnVAIjmjBZ8UaIDLZlZmpHWeauiNGcul/pIj2J/
         LLWg==
X-Gm-Message-State: AOJu0YxlWcK7IHg2xQ8tsYg/L+qEN12rxWGkpGiGwM92JEThaqTkDKUO
	hOI50C00T5USk0YzDYgKovcXZXaQoNVuTnKx2pM=
X-Google-Smtp-Source: AGHT+IEISDGGRGkImQupwC8vJdDy0vqIatFb2tXdamwD5uA4BC7lyGBXNOmumKNuCL4bQgWdv+Vu/Q==
X-Received: by 2002:a05:6512:3b96:b0:50c:c5f:e301 with SMTP id g22-20020a0565123b9600b0050c0c5fe301mr3410511lfv.58.1702367017033;
        Mon, 11 Dec 2023 23:43:37 -0800 (PST)
Received: from [192.168.32.6] (host-78-79-232-116.mobileonline.telia.com. [78.79.232.116])
        by smtp.gmail.com with ESMTPSA id i30-20020a0565123e1e00b0050dfe864d8dsm502144lfv.95.2023.12.11.23.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 23:43:36 -0800 (PST)
Message-ID: <3cad5ffd-22dd-4bd5-8c08-1a5530489923@gmail.com>
Date: Tue, 12 Dec 2023 08:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com
From: =?UTF-8?Q?Cl=C3=A9ment_Villeret?= <clement.villeret@gmail.com>
Subject: ALSA: hda/realtek: Add quirk for ASUS ROG GV302XA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Commit message :
Asus ROG Flowx13 (GV302XA) seems require same patch as others asus product (UM3402YAR, UM3406HA...). This permit to load the correct firmware and don't loose audio after waking up from sleep or hibernate.

---
  sound/pci/hda/patch_realtek.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..acbb88d777a2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9954,6 +9954,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
  	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
+	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA", ALC287_FIXUP_CS35L41_I2C_2),
  	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
  	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
-- 
2.43.0

