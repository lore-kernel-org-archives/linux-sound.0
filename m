Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4581B5EC8
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758986857; cv=none; b=OANrJAiN06hggnK7xJvDYsT/XR1yVC9opK413c1ofli/Kq0HjrLPQxQZp6EuXJE15aEA+/Upftq+u4ACAruNmTzFjYoVhP5GOVv1A/3O6aYTuN4i1H+yfYHqOI/u4119ms1lE4QsuJbaIbC5oUxXYlIzgljpRbJy4saU/SElsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758986857; c=relaxed/simple;
	bh=uCewv5CP04ORxGJiv6vZEEmH17tspkGLz3fMqZmXja0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=je0xgCPB7tJCmhopoDcS7343wFgH+Dx2un4w1qrfABF5o/5dSDVvqndxSnTYM6AwuuY/gudi5SbWY3+TrXReYYOMhJZ+tmKc600pCyNFxi9bU+8YvAI7mvTiBKtnbRiUVjbJt1bYVeU46VkBexkHzHh5h2WI0JyJgqlJ5B2RlR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA5uKhC1; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA5uKhC1"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57a604fecb4so3851858e87.1
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758986853; x=1759591653; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4QbgbAUCXefzHZ1+fTShYExoT16Uf9fR1BGdBXDnYY=;
        b=RA5uKhC1LUQd9zR5nCzh+17xCXKT7os5X0EqJBKruHugeqPhYNN+lB3x6inCJrx8/R
         lmCfz4q/3b8ijn51IrVPnbgu2ZHBKW3J8TPk4b3JjGGfOu83eTx7S7+ChHI164EiGUue
         7F+FDvXSEJSyKG+kdviaIjAyuZnWeLRKUzM5ewXosBPJHrPTcLqBS2VPotxaWGwlaDF2
         7KgXH/4OoKuUIrye4rMDWrIuG3X+/S4fumkbCoc9X/ZLYIgJGRELe9jbRsPdoo/pM/Ar
         zUPa9Q/7f11TCNK+/LY3mt3JUdO2xGNW91TdiORbheXoEoQKtn2jG2LuCfFzcxatSKpw
         9ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758986853; x=1759591653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4QbgbAUCXefzHZ1+fTShYExoT16Uf9fR1BGdBXDnYY=;
        b=rpc+O6lnXMc9a4gJOooNqMP5lVAeoZaGuClKVZ42sA++CfAJdX17xO8eml9oi34Inr
         96eghEyb6Ybt9hGI4IF6Sg7g06aZfEx6BbclKvzCWN8bPs2HwfdjbJJGoqGiZhke0MGC
         eHt873Nh+8H3hsKiZOsafZ+HYKh6bK4I8UAJ/7BEleJ48WycMzdRim892i46WMGn8HO6
         jL4AdF30So+++CHzmR8Dxxjzy+xhDrGuBAIiqUtmcMia3i0qJXxIJ0ab3pfRd+lElSTA
         tuy9BJrwuoCI3H+9ab5xbWB/loh+LFtq0H+WhnWYo0nC9x64c1BedsSkhFs70dICcOYg
         r/Bg==
X-Gm-Message-State: AOJu0YyhO5FTYYl/fzUn6aiQ3ANlO/tp7GmM5gHWXbKA2wDqN6LMEGDy
	9bHTecONINBV6MN14bixHGAL/c3JC8vKqVX+l2bRiBJFjihP5dCCL5hxCGnoag==
X-Gm-Gg: ASbGnctfxUVkUwKvt+lWcYs78LfV77Byv177nmNB9kggOFwWlaL65i58lMpsOqCykUf
	4W3H3wc8eHHYNWLC90lZv7w5YY75GdusI6vBBaBxZf5zL+SJNZGtZ50ds3+z0XOov7h4Oxerdw4
	ksDoHqb+MRPyhPArE02V7kBdQ2hs5q6n0sMok6v5HjK9W0Ccep/9O8xSIjhW6QjBGll5j8UAXRv
	7MgLlFf7ngGbtBYLC4jenYERIlw+JgcodkbI+vZEmAXknScnBasYxAb11NiqNAv1ULoyreJzCph
	NIMIRCsvnf/ZHL1t2MuB2ifL8gTC0y5oeqC3QFyWht31Sn4yvBUBotCv/o1yt4tD8XZrsStGyG5
	JXzD3eY/7lyzBpQNtaLH+mlKeYMmk
X-Google-Smtp-Source: AGHT+IHXBUo1ctMesM/oBilyY+x8mgzJRxpIgYktqIyMd7xCMUe0bKhVUJ8js8hUSeRce7Ne3eNqOw==
X-Received: by 2002:a05:6512:10c9:b0:570:8bc4:9544 with SMTP id 2adb3069b0e04-582d35deed6mr3478080e87.47.1758986853225;
        Sat, 27 Sep 2025 08:27:33 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58619e6c530sm424273e87.93.2025.09.27.08.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 08:27:32 -0700 (PDT)
Date: Sat, 27 Sep 2025 17:27:30 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: add mono main switch to Presonus S1824c
Message-ID: <aNgCYm_b3IFmtbJ2@ark>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The 1824c does not have the A/B switch that the 1810c has,
but instead it has a mono main switch that sums the two
main output channels to mono.

Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/mixer_s1810c.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index bee2a65fd3c9..656f0b4bfdf0 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -93,6 +93,7 @@ struct s1810c_ctl_packet {
 
 #define SC1810C_CTL_LINE_SW	0
 #define SC1810C_CTL_MUTE_SW	1
+#define SC1824C_CTL_MONO_SW	2
 #define SC1810C_CTL_AB_SW	3
 #define SC1810C_CTL_48V_SW	4
 
@@ -123,6 +124,7 @@ struct s1810c_state_packet {
 #define SC1810C_STATE_48V_SW	58
 #define SC1810C_STATE_LINE_SW	59
 #define SC1810C_STATE_MUTE_SW	60
+#define SC1824C_STATE_MONO_SW	61
 #define SC1810C_STATE_AB_SW	62
 
 struct s1810_mixer_state {
@@ -493,6 +495,15 @@ static const struct snd_kcontrol_new snd_s1810c_mute_sw = {
 	.private_value = (SC1810C_STATE_MUTE_SW | SC1810C_CTL_MUTE_SW << 8)
 };
 
+static const struct snd_kcontrol_new snd_s1824c_mono_sw = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Mono Main Out Switch",
+	.info = snd_ctl_boolean_mono_info,
+	.get = snd_s1810c_switch_get,
+	.put = snd_s1810c_switch_set,
+	.private_value = (SC1824C_STATE_MONO_SW | SC1824C_CTL_MONO_SW << 8)
+};
+
 static const struct snd_kcontrol_new snd_s1810c_48v_sw = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "48V Phantom Power On Mic Inputs Switch",
@@ -579,8 +590,17 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	if (ret < 0)
 		return ret;
 
-	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
-	if (ret < 0)
-		return ret;
+	// The 1824c has a Mono Main switch instead of a
+	// A/B select switch.
+	if (mixer->chip->usb_id == USB_ID(0x194f, 0x010d)) {
+		ret = snd_s1810c_switch_init(mixer, &snd_s1824c_mono_sw);
+		if (ret < 0)
+			return ret;
+	} else if (mixer->chip->usb_id == USB_ID(0x194f, 0x010c)) {
+		ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
+		if (ret < 0)
+			return ret;
+	}
+
 	return ret;
 }
-- 
2.51.0

