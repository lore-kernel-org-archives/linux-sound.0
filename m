Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509B1FA1
	for <linux-sound@vger.kernel.org>; Sat, 13 Jan 2024 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBEBfRzo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e636fd3d2so18729835e9.1
        for <linux-sound@vger.kernel.org>; Sat, 13 Jan 2024 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705162136; x=1705766936; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szZjXKQj8dGIeXtp4y/zqgr+AwlvnIMbFW+maAz1LPM=;
        b=gBEBfRzoBYr8sHZEIjgVMad4a9WFoJhmsGaxvhRdx+ML6g1Co5Q360GAhHrVLqXSWJ
         pDqj0FSigrHGoANHP4ouUZIUX4mrGMhlbBNuGea62bq0O+/+rHr/hz+q2au0kIdyzxxM
         JDixxpYzpOgqu+k0V3r+frboIHNmuaZQAiIq3WVGG6z9Db8jkW2pw0lzU2zPMHvo2J01
         E3HnIZ7/HcImmAOKRdXKq68xdrinMmOEDIY6o9CVYuxLqaJRXxNAEcQv7Lk8zpE/rZ3F
         konX4YiKhGQs8MI9Zs1YzWdboxPctJcqb2Dl4FKmv2nfmjXprt/wQwkMp2WOXG+OB1Yf
         UAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705162136; x=1705766936;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szZjXKQj8dGIeXtp4y/zqgr+AwlvnIMbFW+maAz1LPM=;
        b=r7y5j5L+BKgg4C84RQ73MfpWkByunQctyNNey02r+Sdr3bCZ9LwXn4Z09S0uwJnLQn
         DIfVye/c49uXoPFNJW7nt22lWP+ff5nE0Yg2Nnz0s2t1HL9dHogL3tcsiar9mX7z/DjK
         VQ9xPPwEAmvsby0pqKjJbrn6tzNiCtAOsKBucuRr9PiYJCqQVaTj1rzJZP7YOT3u0ToG
         Yb7wyLw0045FiS9DSnrzo7uSSfVDILd8T7JnG++6K9lbfyb2xiaLlih2Lc/QgLpiV6+n
         fhsevikMRdFDViUY2835rOmJ3uRh8n8jKOb2YxTmyJV5EYROFpjdzgTY9+bp5/b+hsyS
         18Mg==
X-Gm-Message-State: AOJu0YyTownc4/yoPh9ahBc5mkb1KBPC4twhFx0+vj+z95br/4TJyz5s
	3kzIe72TaiGqY8pk575kuuRT6uBIBwE=
X-Google-Smtp-Source: AGHT+IHM68gwcYQqAQ0Yr2+FJ2XYeypoNEXuvK8kQwuZZiJExnBX4rcAGogXvWf/ovWx2pYBFWXLRQ==
X-Received: by 2002:a05:600c:a03:b0:40e:5aa7:769d with SMTP id z3-20020a05600c0a0300b0040e5aa7769dmr1764741wmp.143.1705162135483;
        Sat, 13 Jan 2024 08:08:55 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:f940:1690:80f6:61b6? (dynamic-2a01-0c22-6f53-1400-f940-1690-80f6-61b6.c22.pool.telefonica.de. [2a01:c22:6f53:1400:f940:1690:80f6:61b6])
        by smtp.googlemail.com with ESMTPSA id v21-20020a50a455000000b005527c02c1d6sm3207177edb.50.2024.01.13.08.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 08:08:55 -0800 (PST)
Message-ID: <3dc9167d-fb33-43a6-baa6-dbef8b5da7b9@gmail.com>
Date: Sat, 13 Jan 2024 17:08:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ALSA: hda: generic: Remove obsolete call to ledtrig_audio_get
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
ensure the initial brightness is set") the audio triggers have an
activate callback which sets the LED brightness as soon as the
(default) trigger is bound to the LED device. So we can remove the
call to ledtrig_audio_get.

Positive side effect: We have no code dependency to ledtrig-audio any
longer, therefore, if built as module, it's no longer loaded if not
needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/pci/hda/hda_generic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index bf685d012..de2a3d08c 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3946,7 +3946,6 @@ static int create_mute_led_cdev(struct hda_codec *codec,
 	cdev->max_brightness = 1;
 	cdev->default_trigger = micmute ? "audio-micmute" : "audio-mute";
 	cdev->brightness_set_blocking = callback;
-	cdev->brightness = ledtrig_audio_get(idx);
 	cdev->flags = LED_CORE_SUSPENDRESUME;
 
 	err = led_classdev_register(&codec->core.dev, cdev);
-- 
2.43.0

