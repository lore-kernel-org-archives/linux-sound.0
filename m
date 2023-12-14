Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22B6A001
	for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHA30RtH"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cc259392a6so63291931fa.2
        for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 12:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702586195; x=1703190995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll9GUAK2eB5ufTDz/DvkLl/wim4A4ZTx3g/PIUJ5c60=;
        b=dHA30RtHBncK9Zkf2judKYmhzD5my2jFK+/EIXpOjt2XY2N4CFxUP6ADSVvQGkI+FW
         FPNXggILE/1WB0c5JhI1bFPzzInULT6mAP3CULujlVi/VF+WGXB7Z12DTNgbLGRJv1dB
         DO9uN00/29N/gpan8zfTX3YJwDDDShZ+240EBS3jGO9r/Q7w5DJkO3qj4wdN96RxBXsD
         ACVLka5O4VX/6S/TqBSdvikEgMTOzrdpbHMsIkUaDt6wNgLSfiTvhIaN+5sGUtaDH4R6
         QuoZHIuXyYW65IB47alMEwcidcCn7mSba2DiV/Qqdtx79AE7JgFBO/qPr/0R8kKPKcOA
         btpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702586195; x=1703190995;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ll9GUAK2eB5ufTDz/DvkLl/wim4A4ZTx3g/PIUJ5c60=;
        b=GLHIeKzL+HOx6RYGeVZTmsZQDBf1ahsHLzu3uljkta38Ru6eN7b6nw9AxKBILVFMdm
         Jzdi67S9sdHALuYRtYev3PUiU+ycfutxvDiXxZr+hWGFOhYbhoZUzAhNvY3d73/KuBmH
         VKd/dIfNDA72wq2opKED14z8yN1OiPVovVVEumjyVBHTREp2EVQE9qf7x+cUJaOS8M5a
         LNv4UluGtz6PMRxIzgl9mSkdqBLXwu091kBIUamCfOx6XXPE80wzw3ChmSaThaIgB0St
         +B2ScGLfx0wgOLJknDyZdRuCridRcs1hFKjfPXydHfMCUotGXKshoSxo4KY/Gg/M4DPV
         QywQ==
X-Gm-Message-State: AOJu0Yy9+gh0BuUOeykgSr92ARJy66yoguosBtAahmWncZtv5sSTD8er
	JL4XLRB+yLTFHpf9SAifLOtYNKjaFlH9UbwH
X-Google-Smtp-Source: AGHT+IGPhqbnnIOK80834F/YhCZx2maWFKvdBDiFFAGr2kbIjw+OTDjgepvRdOaMoig7Uw7UIo443g==
X-Received: by 2002:a2e:b8cc:0:b0:2cc:3666:46ff with SMTP id s12-20020a2eb8cc000000b002cc366646ffmr1812519ljp.96.1702586194454;
        Thu, 14 Dec 2023 12:36:34 -0800 (PST)
Received: from [192.168.32.6] (host-78-79-226-84.mobileonline.telia.com. [78.79.226.84])
        by smtp.gmail.com with ESMTPSA id k11-20020a2e920b000000b002ca080d26bbsm2226321ljg.35.2023.12.14.12.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 12:36:33 -0800 (PST)
Message-ID: <0a27bf4b-3056-49ac-9651-ebd7f3e36328@gmail.com>
Date: Thu, 14 Dec 2023 21:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Villeret?= <clement.villeret@gmail.com>
Subject: ALSA: hda/realtek: Add quirk for ASUS ROG GV302XA
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Asus ROG Flowx13 (GV302XA) seems require same patch as others asus products

Signed-off-by: Clément Villeret<clement.villeret@gmail.com>

---
   sound/pci/hda/patch_realtek.c | 1 +
   1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0377912e9264..eb9f617b6273 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9953,6 +9953,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
   	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
   	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
   	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
+	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA", ALC287_FIXUP_CS35L41_I2C_2),
   	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
   	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
   	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.43.0

