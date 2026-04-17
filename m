Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DC40DFA0
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776387687; cv=none; b=GKFWkMtQhRWyNZnzODcZ7L/rQMxFdFqmhjmeLoNrbY3akstsBoOPmraAyXtdsRN15MjPt7x5xAwqEAn/zO7CujdA5pbY4mILx3tvNy9Q3j61m8QW7yNz7AFiTwzbMyN0xkC6C2xlc5fa/sSdcWFV7LHRYDbHXI20UmvjUTLFaas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776387687; c=relaxed/simple;
	bh=xwzgu5VIjq84Q2Q8wYJ7NHMMF8fN+hiRQxgun2D/EB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giyxQT4YUnjI5iHQoj7M9Q9O/NSKrQlyOW3igb84MOY5IGtGFCpnEOsvk1Ced/xZ8Anfvtfb9wT1Xf/wZS48tsmYROfrXsHS6rlIKdc5J7voXQJQy88+rX8x5c5ZBEDObNqrcEYxBpjx0qcyqa109oshdk3a+QUP9mqK/yQz/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1HEmjPR; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1HEmjPR"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d96243c91fso208755eec.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776387685; x=1776992485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlKaA8sJSVY4crAZclFUizYHfpJrpl0Z3tuYs+cnL7E=;
        b=F1HEmjPRXWZJ4SExVgUs5LNUK3EOYD1ECZYofmNrLl0/QBwZb4g7HSQRGCpBfdG9Z0
         wii+wDOS8WeU7tSI+d4CuWqC+MjKo+f1KkNvMgsqL47YQEoXqXqpWMuzhAN1XS/VRKyi
         iah7HXFw0oZ8FffMaXed06AajUSA3InCCxOSylOBPS2OrWcuPRbo2guaLcpCZHgWchF1
         axG1d+5L3oS+VcO2hDkcsoxYNwIzOvi90iXDyOYsyGVDmJ1gWhJokLL+1eOK00CuDNXD
         rZEQ64PKeUJnX47fYAHoROP0In7IZgGKpJpwk4jcGfqpY8w7hsK2tHu3s/9PPaDMdbbl
         X3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776387685; x=1776992485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlKaA8sJSVY4crAZclFUizYHfpJrpl0Z3tuYs+cnL7E=;
        b=emG47fgt2npqYd6k3xrn4yY64tUx5IuijwlXgfphrMw/KSj1LolcAWaLn1LC3pN/Ib
         CRjjz7wv4Z0fIQUJCuU8iCGiF+3Vc2/dro14wayhTlLGsUMpabnGIly8YLsAEX12xe65
         kmDKPm4pvDznM+VwKUXDQnHFBF9+frOG6e5JJy1ly6N6tvMYUzAwyJhC5TXR0SPTCA/1
         YKp6pgNIIgfBpjfB3MZSXfpBxTOULeeNeR8qB94N5jznEqPCPKk+KeL6NPFmsjceEerg
         QWFjl72fTBnbG1QMQow+iO0bwidyHJqhp3zC3A+nvAL8yfW5w2EA6IWfN1eiK4w1ttWi
         IIZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lpkzz2e43Kdz7bZN/M0vs3CsICTh2bkzw7jRx+MRrLZ6+gn8+g/rg8NBYTGvs+vZSkZ4cPko+NfzPhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhv/Pc7Do69X9rIGMO+VWjuKblzOJqo2d+FmeOThpHYlJUHw2b
	8qdz9GxK0ODnmOPgktsuc0gf52VJFZpzMJYmegrgiHuS+3GVnvzh3ZZz
X-Gm-Gg: AeBDievctKjKQunJ5cv5bjYlbfjkIHmLlThQjAsH9xXtyX18WVe6zqw8HoTn67f4KL3
	B5eqMdj6FUfq3Jz9tVsdoXs5qjcharCS7xbUX+ChuK24+f0avcF2IUtFGcxc84vXFoTqJga9xS7
	6VLyMIzbsVpLGidiiIyUakSdMP2s5Q6SCmIiDFREolZ/+TpULMljOXfra4Cv1hLc8O3ztuIFsN5
	lwPSg0YG7dnw70QW0Cp6bJV4YcrQjFVXMJcPdTFgei0wLo+C2JSiV4RZZogNQm1jDXupP0aq20r
	No9jK/IHYJ19xeG13xQffXAvohDgD4S+zVGhBENk3fZLeOWhWiwf5YUQoPogftbmukOP8OPuV0r
	Mh1RHd8V2bmLrNRvVu7UoLzpQmt2IJNkMfnWSmDKCvRLNn5JtplhyUyGYNlgTxxGs1ztevs9q1E
	Ajc9SNc3g7AJbEvSkNkXQ4tV0mOYFQoh4y5hYcNDM7iMOocEAxjvGkQ6duPMEaovvNoQ==
X-Received: by 2002:a05:7301:1698:b0:2de:aafb:feed with SMTP id 5a478bee46e88-2e466044d92mr311008eec.6.1776387685072;
        Thu, 16 Apr 2026 18:01:25 -0700 (PDT)
Received: from jp2024-Linux.penfam.local ([208.54.229.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm110417eec.23.2026.04.16.18.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 18:01:24 -0700 (PDT)
From: Johnathan Penberthy <johnathan.penberthy@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnathan Penberthy <johnathan.penberthy@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk entries for NexiGo N930W webcam
Date: Thu, 16 Apr 2026 19:01:23 -0600
Message-ID: <20260417010123.3080904-1-johnathan.penberthy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NexiGo N930W 60fps webcam (USB ID 3443:930d) hits the same
'cannot get freq at ep 0x84' error in snd-usb-audio as its sibling
N930AF (1bcf:2283). Without QUIRK_FLAG_GET_SAMPLE_RATE the ADC clock
is never configured and the microphone streams only zero samples.

Testing on Linux 6.17 with QUIRK_FLAG_GET_SAMPLE_RATE |
QUIRK_FLAG_MIC_RES_16 (via quirk_alias=3443930d:1bcf2283) confirmed
the microphone captures real audio after a cold USB re-enumeration.
Adding a native quirk_flags_table entry avoids the alias workaround.

Signed-off-by: Johnathan Penberthy <johnathan.penberthy@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8fc36d1cf..7b803ad58 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2474,6 +2474,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x339b, 0x3a07, /* Synaptics HONOR USB-C HEADSET */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
-- 
2.43.0

