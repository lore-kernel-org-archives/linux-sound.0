Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DD212542
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074159; cv=none; b=Dd2aUdMXsMn/yoMT6UsrM5KXOUZYka4WLlghJLZsCulZGuIPZTGslg9y/FtXW/YcOJXe35de7qqwoAmXOOU9vQjbfv6h7kXHCvWoC+IZTSNmjhy+WJCzaK1ohxc/BrSLLkNXVJ+XG3OfBqBXpGZllN9XpD1FapdyBMsrHtMslmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074159; c=relaxed/simple;
	bh=ysS1APXaa+23442sNN9d6+LhKf1eEOge14pfXg39Bdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcdFQETKbZ8rpWJfDrQebQ1UvH6V86pDOOHN2CW4oVC24ja/FxbyayoLszREa8mrKBhPuacxWJ+WesrGnbrtzRKfa8tVWbqYh14xIi6iRW8buV+EJ5+2MjepJH0BQbqkq/HcubBRGheRAH5RDQfn8iP3VmbruMEM6AP+f4tIbww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa3JSARZ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa3JSARZ"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-484cf882ce5so585049b6e.1
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 20:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779074157; x=1779678957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCUha6JsqRMrRQFbLuV2KnnkObNJNumSbcS2nrlCKIg=;
        b=aa3JSARZTRf6YkJ+2z8aHk2+cZO5ZrkuBo50LNSpGDmoxUyTi6zeyomksZ+7qI2Qal
         ulN/UFmvkITm4vKOSx4ZBRomt2euN7URmVEdbNHMr8Au2sQRisn1IVLJtmhlHvO2Cbqx
         pUFlo+zCNasZ65fgLUsWBnnOPu2ymy7sHDJzX8yYGA84LrxQx0Aczy5QUwnkEWU+S7cO
         FGwJYlEU4jm9s/iErMF4r6mJwWT9E9zz2WxrrvH7Md93UO0hgspBYwW1OvGrwChtNb+f
         fZeDVV/Qb4Vdf9/5oSAnNTtR+37wav70rNbpvp2lOxW79ss5tjw+2C8C9YpCWuAoWSns
         h7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779074157; x=1779678957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCUha6JsqRMrRQFbLuV2KnnkObNJNumSbcS2nrlCKIg=;
        b=bdOgWp5ro0jCMR8s1lafIhK52TJsSmDz0AgIVbGshdBAzn/7tz5UL6WX5uY2evhRiW
         oOuiKwd703UoFOJyRtG7wUW0XkE9r/weVHSZZ1ok9k8kwTDYUWY92ypb5+lBCCPh7Fv7
         mNdKct7y4XOqsdoua5AaCRoZgnwKV33k7KjUtoz2BXwxTDKb2cgJ19HaBrO+4Ielro2o
         ZJknXcc+zuYuhqyUf8y/MxmFo2Ewm6omsu/+3eFMhN0TQl63z8CYUC3A9aUsWnUhqkhA
         M7h/lcD6FHt0wUKgv1ZGBkqA+EhXVf0CPA5N0XlTQtteCjLe0ncx5ma20QwPLY7IrbCq
         Jjgw==
X-Gm-Message-State: AOJu0YycUqCvlopV0zbLeiYRkInwmgJKY2fvo0/jXwWxbQAX2IfB2SRQ
	AUzT2+So5btDbyyUALJrN/ubWtCWbDgh8/VJKPN7ZY83eUWPkeLRo5od
X-Gm-Gg: Acq92OFjxLcZaUlxcme5LQnW0NfWCbJtr7xEfPhvasGY9DC8dGBnfvJ6LDvCeqzpJX/
	4CszHvlvJUP2cU3NO4SgaPaXDb60uzV7Ihizn41Y1UO5yQRwTlT4TY2oMsgerPOMl+QrUfAmQzI
	wXfPEZcnlv2Xij+YFllzSzgFYz5ot9cEDMOdzxSNtfYs9lNf31BFqLpk2rnNUhX4f1ztyMReQLG
	fwN5BwKWhvwcCthOd+/hd7raUqc5Amw5QgBFRAcSTWBYofZ2wQwENFcnb6PQfWPHhhKIkx8aRkZ
	pQBESN5PmVXeHBNYXuKC7LJcXkNJKn9iqefukmMXse0nXIugJ/ozR7kIm+aMgJnBW97Yzv01/iz
	Z+FZgHxKecyBOYoxrepmPy15XAAj6+riMfGD7cAHjtFWx0v9jR/kpCJBDt4FulX91xpsancWBFK
	Lyf3hnqGhqmvB0cOfKr7ed5KJLkw==
X-Received: by 2002:a05:6808:c162:b0:482:86c5:3e9d with SMTP id 5614622812f47-482e5771df1mr8879716b6e.38.1779074157456;
        Sun, 17 May 2026 20:15:57 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b507cbesm6784310a34.0.2026.05.17.20.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:15:57 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Z66 G6 14 laptop
Date: Mon, 18 May 2026 11:15:42 +0800
Message-ID: <20260518031542.2899188-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Z66 G6 14 inch laptop uses the ALC236 codec with subsystem ID
0x103c:8df7. Without a quirk entry, the PCI SSID falls back to the
generic 0x103c:0000 fixup, which does not configure the mute/micmute
LED GPIOs correctly.

Add the SND_PCI_QUIRK entry for this model using
ALC236_FIXUP_HP_GPIO_LED, matching the surrounding HP EliteBook G12
entries (0x8dec-0x8dfe) which share the same ALC236 codec and GPIO LED
layout.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6d4e8446f..0939ee341 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7260,6 +7260,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-- 
2.53.0

