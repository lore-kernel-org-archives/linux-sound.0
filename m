Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC11E32CF
	for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567257; cv=none; b=tSf1ff+MaHhUtKrWkGAC6yDZpu8vX8QuoKLNeES5z2yb1OzdSXHayXmL6q3B+EbijW18+ZEmdU3GeJL40rSa6hip12XEnRMXQWQx5nqEWIrfIgKFdWV/9JALgFMDgnxRgqW8pLqYQhCX+ogjhieMrPzqIQPZUTMMkobk/C2jvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567257; c=relaxed/simple;
	bh=i3MgwC2WP8pjFvD1hoaJNnaEsDgwv2hb5ohz3bEhDZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCDJ03aqQnckbmYk4R1qr2KGnhgfB7kyC8OBylWBorIgOoAc++eIOyPSIAEcOvZf3w0z+yukHNsl73+9LTF0mQJZ62jxaurQOZLtjhLd8nTd0gcd71n1xbFJ3MlsqCXBo+Dh0ngZ7l2383gtf0tCjEEwp82KUj++MefUT2DEze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pe9Gppu8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pe9Gppu8"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57a59124323so222314e87.2
        for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758567253; x=1759172053; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNsPNhJ/5p805wMjwooOErgxMh7Ia7eiB6NH+SY7Q3s=;
        b=Pe9Gppu8dPUJu1gPTFmm1RAe77RFetIxDpD4RHdLf0Rf4tP7If4TBIGKSXFxqWscqg
         T6avmri6bd6ZDvLhqNmxiLH/XdYox92XqMjcZ7HWUuX1TJdNU5bV2OtxpqF1P7OnteNB
         xQFhfbjHYJWlY12Upbk5ZXZpumGm1HyLapn03ErNw43bgLLSQqhOIGsH/1aQy26C3mjC
         9ufhTJej/cLFpWlHQyQFYlcEYGzv8voNnL8EvhWGDwhHeLgxKGSSlEPo6rB13hw3N11y
         oy1yr72Fgd9BBkK6V9kbB2dY8CzjMerLSSwVqX0QtOshiaw6wqTGe3kF41yp+LrSQ84k
         x2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758567253; x=1759172053;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNsPNhJ/5p805wMjwooOErgxMh7Ia7eiB6NH+SY7Q3s=;
        b=vAfwp6LMG/KM+7K4wCrZ6+b5nZxPbunwj3OHbFuKM+TX+3c3Pfo6nrA+VUjNd7uQ0M
         xR0nOqpjMz30aM+rCfrfJroivltJxD6k2O5v4dRTGVNoXdiwyLrMVcwAZB7ZznBheK/s
         CtRYbnfGZlm6slx5DFXsFlyaLBZyGIBcw9ppVoIG0ADegcpsMLsYca0NF6pQAI78WZbA
         KIsVze9NHDcdfFTLKbkzGLdtlt3IGcs786WNGQLRvNUEpztrl/RcQ4ec3KlWfAZ/smcA
         vFo4gsd5iZbDha90lwyn4FCRTh0Zdidv3JNvzScvWXeo9jSHH2Wd/4IxiilfD2pkXTG7
         Cktw==
X-Gm-Message-State: AOJu0YzEmkbFV09G1P6tttQ+Wr1kECOxw0T9EQ54ho5IN3kUHKdHpwve
	bLcfOjOwOwAYdEa5RyT6wE5oEy0zbEi/iipZpjPaNplO76z5+SbYGiDpw6Tyd3ZO
X-Gm-Gg: ASbGncuL+7MMpmJg1J+Aopbo1ftDhuPdA36Ybtp+Gh9Z/S7H1kjRHerKHEVyWgn0n1Q
	76bPSG5VXnsIFmPPAA3EhYNOd4SiAT4GPYYd9iAl0HqESY880kNS/MHGoVfK2GaRY6ExtJeJlVz
	/nr7d6PRAS8su8rmf/Wn3Frsfi2+kwvvCN+UI7p2X6YcdpPGMttu/s6VJZfZLhoTLncIN0l3FpL
	XEenK13pk97O8KiWRzRNpXOm4Ql5zypkwDBYasTqkrzLz4I36mS8Ala9y7qAF2EZXPpSIuGy+Hu
	nz8uwGaneDdT0tozqJkgFgyPQ+HGdGl2eEpKerCIgKXNNzfeBMoEM6wQGS+iy8YMuYohHDn+6SO
	pGBg45tlvajiMqiNKEw==
X-Google-Smtp-Source: AGHT+IGt7eG6Tvl/LT0S0TEKnnExyHamLOjiLYAKmfpDgCmCLbjN6v4U51esfUX18YiRdDS928aQDg==
X-Received: by 2002:a05:6512:6185:b0:57a:903:579d with SMTP id 2adb3069b0e04-57a090357bamr4467830e87.56.1758567252965;
        Mon, 22 Sep 2025 11:54:12 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44693sm3514530e87.25.2025.09.22.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 11:54:12 -0700 (PDT)
Date: Mon, 22 Sep 2025 20:54:10 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Amin Dandache <amin.dandache@gmail.com>
Subject: [PATCH] ALSA: usb-audio: don't apply interface quirk to Presonus
 S1824c
Message-ID: <aNGbUkO8n6M8kggv@ark>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Testing with a Presonus STUDIO 1824c together with
a Behringer ultragain digital ADAT device shows that
using all 3 altno settings works fine.

When selecting sample rate, the driver sets the interface
to the correct altno setting and the correct number of
channels is set.

Selecting the correct altno setting via Ardour, Reaper or
whatever other way to set the sample rate is more convenient
than re-loading the driver module with device_setup to
set altno.

Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/quirks.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d736a4750356..7e8609ac6822 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1599,9 +1599,6 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 	/* presonus studio 1810c: skip altsets incompatible with device_setup */
 	if (chip->usb_id == USB_ID(0x194f, 0x010c))
 		return s1810c_skip_setting_quirk(chip, iface, altno);
-	/* presonus studio 1824c: skip altsets incompatible with device_setup */
-	if (chip->usb_id == USB_ID(0x194f, 0x010d))
-		return s1810c_skip_setting_quirk(chip, iface, altno);
 
 	return 0;
 }
-- 
2.51.0

