Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D10402442
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836994; cv=pass; b=VNO+nzmsvO8VGkd504Q9v9b934ybBslSxY2FrmMLY3L/xqS/yM9jzzhR3IfJdYSigJkRD0cTbfzp+T6MR4keqsHZtDZedewSHzMZzJGjwwYb9Xy4H31Ijuj2tSxorAyy27AJrQRsPby13J5LZxcYWIMIB9tm7TWHKe3EUSEsSdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836994; c=relaxed/simple;
	bh=NLOB01J2P+tJh2zGNksufU8kfz9sJQbN22gHLtNfhBA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=f1/otP/r+paAgdFrUFANOHNJ66NiGnszzErcn3cF7d/uaTFZCmyt/yDlAAe1WiYaMQAPHCcxyBfDluICsHbLxbr10YgFQLSLi+OYVx6qJA8ZUefOcN8FU6D1LeSYdn3PMi6Wi477EncnWklRjAakJ13WzitQJhVX1vqR7jC7q/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnT+wpXO; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnT+wpXO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo2006405a12.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 02:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778836989; cv=none;
        d=google.com; s=arc-20240605;
        b=B9K8/mcdJd2pwtDTAQeUq6a8HB5v1fiptVioLX6s4yosU+LU90JYi8i3vcUM0+9/aL
         ydYbrSms7dOApEByOXvdPNtvUh9aExKnUIyCNgezCaEGrMqV8hKp6V2moGVJXB8FEjje
         NIfdoB/eqxm5utTLqsghMchhVKwu63GoaJXalxCWxSi9JPcf+f8tmNzfYx7vX6xBMaZZ
         6+t+K4lnM+IHppxh4OMQzuETgzrOwwsEx6Y6OJFPq+F0h2J03zpaITutvqmoxijyQSyH
         Ro2UDUzaN65kdFeyBujErx5ASHMVJ47zUI8TqUhS0g4Cs+Y3QRv8X8FDTocNZMdaSc+o
         BulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vTumW7tDTvojiTtK7WL+AwD0e4A8pWUZwgfNVXpq1z0=;
        fh=7WPlIrxphixNBvDynsEH83Qa6/sBG+/tmVe3CPtkOK4=;
        b=G0Jna/xGXf3BrBshbKy0/wk6kLXWj8oW1xOPAQGe4B7bHr2ZXecSlU6xWMNNNvSCOl
         y3M9yiiwvrENR9Yuw19pYeetbOwbxqk2QfmhnZDRXzErahw3aLs+HO5+k6k1DfONtZ41
         8eaJCzK0r+rv/coX5nR3kJV/M1tMxfkdSUXHJZBFG1GKXV/fj6y0HX5Ds0GFxFrjI59r
         OP8QlKokPzsloO6lPZ9z6Vwoha+YTjD4lnFyEJyg/uODssSswMoG66pWGiNv91ZlFENl
         zyeOTpf3EL8qxFv4LHRFyKBeDGAxaJWVJwDC2GMnszg8wNSJNMh+XU4qWWix1TuNb0IJ
         lHpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778836989; x=1779441789; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vTumW7tDTvojiTtK7WL+AwD0e4A8pWUZwgfNVXpq1z0=;
        b=bnT+wpXOiLPQdl7ekAs3F1Bx9GPtX7z8ma36Ui54rzV/2Vk7DsHLYBn8128eMFfxNr
         qjpQdYGcbcu6SlDjdeKYJCneGBFGpG3tOiUlE5ArEQf5Gl7Bh3mHm4Npo3cwlRc+Rv9L
         YV7XIcjwYANSes5H4pKrPdVJRuEbQ3NMzhbEuIozfwE0F7xTB1WPR+ywIVh/e7931wiE
         9e9MqtP+GhRWB7n1EDes9Cn2VgLH8UvhNiREsg7Mc8Zz17iHtt44qEhSpLB5PCGG259w
         KIpYQ1ckH993iWvXyMhiFBF5ipScgI3berl93NuqSEoSL9Dc1qphl1t2bOTpELasQz+x
         6lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836989; x=1779441789;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTumW7tDTvojiTtK7WL+AwD0e4A8pWUZwgfNVXpq1z0=;
        b=SXDAzDYiop9PrC7jQzuExsB66Yx/ixUJk2MS/rvAtUBrHod1ts3lgjlPpUoeRlV0YU
         fmkJOwGjtfoLLGa8gtHR+fGqf6ifJPJSTLGWfxTRFlVa30bgydTAI1PmVZiDxiqQ24To
         8WKVWZXhnlbj+wWLXKPTHG83ggrT8ktcWbT2n2mBXj1lALZKC0cW/E7stTrCVBX8RwTL
         d0bofcyzUnArgHwV4Us0IWBWyc+y9Atg0O3s1YUgtxwd6QwneMvYH1A3qCvqG2DI4Gks
         y75e4TTdogqPGv3j8SsqJGdxGDtIZ3gkDeDhdYfDML1uBxXkuOzXcF4fEwQLNYlRJMwR
         1uYw==
X-Forwarded-Encrypted: i=1; AFNElJ8hWc4ZDK9BtUNxez0CyXApxle5SJc7DXtiXHeBlWnBE1N2KnJYsTg7qX4fhnAfucWwZ75GWyaJR5ATdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIJrl9qH6sVLi39AeFoVoHwhdB07w3Xzuqe2dwVVr0t8sti+Q
	A2cFbh1KzeOulDZMOH84ZEhOGoWBSOl54Um6evq3ClD8SGkeCd91NN59xqnCCLT2reQb568AU/9
	5OYV+2aKjkkyoSvoAsdf7Xc1aY0vfVrY=
X-Gm-Gg: Acq92OFkjWRSHWslxiscRGeDoEqiCE2/PPQjZWI1QrF23yfiidq90nKX6wbLjJOeRgX
	T1aQ/Goro2HLkyaTUqzZfYunQgG4t+x42ly2CGo42/Rl9+y9TmR2g38pDWAUo9tmiP5+MTL29vg
	8z+tLfsKb0HwGKAD5z/pBsmniQexwBYqsYAn0LXMX4ihAKJZ3RHK0TnHciJLxEkLvpNpgh8qwgL
	/P4G+UB5s3nCoxHfBXeWW4tahUuT27hyeXltjAmZgGuLssBnZQpOovrekMVNWR8GqFgwKRJ3vP9
	DRHGvjiJxiJ4qWVqGH2JAsnA9ZAWyeSZz+kbUGFtDNQF1EGhJlPvFhPxp1XogBz0gEwIv79UFFw
	FV7sDO/asDnjaOoXOtYQAvvD/P+OQRNb9efd6yJclAj0GzhPxemMvGm9/kQ==
X-Received: by 2002:a05:6402:249e:b0:684:95a:4d05 with SMTP id
 4fb4d7f45d1cf-684095a5202mr638145a12.8.1778836988711; Fri, 15 May 2026
 02:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Date: Fri, 15 May 2026 14:52:57 +0530
X-Gm-Features: AVHnY4KB65AyMWEW60QqE5RaqPq6peaOd3xuinWEzgpJrD1nA3yPW0Ac94IiZ9E
Message-ID: <CAFUwA8W30uCAS+K9UaMQ=jaUB0J+6tR0tdwZk=N90Kg8uiy3dg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Date: Sun, 10 Apr 2026 15:36:22 +0530
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14

The HP Pavilion Plus 14-eh0xxx with subsystem ID 103c:8a36 needs the
ALC245 COEF bit mute LED quirk for the mute LED to follow the audio mute
state.

Add the missing quirk entry.

Signed-off-by: Aryan Kushwaha <aryankushwaha3101@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7018,6 +7018,7 @@
  SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop
14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+ SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)",
ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
  SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
--
2.54.0
