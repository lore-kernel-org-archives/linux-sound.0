Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC2430CE5
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580161; cv=none; b=twP5TXyZFAk2oy4J5Wp7Ph3egcmb12kSblH5BkS01m/0S3zEOGG4c/8Vr2U7e2KWUw1Nfpz+TcAA+JMNgZKEf5JmRaL/ybBg2/enNhPfs4xcsPurFTHLv9UCxsIYGg+vS1YEF6TYoutu+5thc7KYHMEME/k3uL9bWieLQCJldhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580161; c=relaxed/simple;
	bh=WZih380QWS3yy4TNP3jgKidUGIFatTqh4aTa3U5fqk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHqg9G9lyu3Q+nhAepJgbtj4u9WGACAlNZBc3crNPF0UyK1KfgSRoQv4ml+1kKCTw5LYQt+HUKj/hK0DL84KQ3AACio89AcTJw9WGIlXngVwLXr2O1AV0wrx6aNaqHZG5pML7v/iTnLzDZpXWisQsL+6zvvzJ9xuWH9St5PSPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=hPcxYzwa; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="hPcxYzwa"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4583b1703d3so1886437fac.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 07:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787580158; x=1788184958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8EwYYLS09GIhm6U1PJjcViid6oXS1cSdnZ7YM7NQqE=;
        b=hPcxYzwagC7eraBoNltWQHcsU7QdGrowkODq8p4KHYr1DmzuamUaKPHdaMI4ibunz1
         m1wncU85gERkb+//L0ty/aINMPEGOPdNjE6+Y1AcxLCtxdOztysMNAkw5AT3mfM/8a+5
         wRFm6ouIQqTy7sU6c2yLPh6HEzuKzy9Wrn98RSIuwizUAftl4QiIYJOxzfd0P3UurIBD
         3INi+6pJWvsV6hKrEwctZMI6J6adT6pI9ibpMmjgHyNvK0hufyWsJ403TxrnQyVTuGP9
         LyZ3DbUXTYbwUU8MpJCgtIR8iZgHpCMlG1yvhPhXda8TieF6bmtSbrILDhQfovDF65X0
         2h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580158; x=1788184958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8EwYYLS09GIhm6U1PJjcViid6oXS1cSdnZ7YM7NQqE=;
        b=BL0cX7H1OVD9xJwdEEucFgjEiw2MQFEa+WUI5YhW04QoHkGKcI+KFXmEvPgv4ECFMg
         sLHeI+nDdUz5I9aUUjs7VdwILwK8giEVgCRNsSCdmslJG+Gh0OXOIdqq5DLGMfmpn9nk
         bDSg2Ih931MWorsquLhvPNIpyRMAqQpiHS3Kz0tVQqNUbLZGO99ACjwDDGXKbUSyYzqR
         fgubHQeuygzNxPdy6OhVXyLVRJitwLz4rssIggOEYBt2IbzHOB6auwPQhp81tcdT3/8Q
         aRcihdfnELtF9LYMLxLNZ2mhvMCUousHrhKFoRkS4ofw9g8zf2+6lCPAVGMwE89DxHkl
         4JOg==
X-Gm-Message-State: AFuF++mx9s79rCI/s0TnORsMh3Em3ImAkbOWjPJ0uLE8lizuO1jGgprf
	QF+6nkx+cZ6xFdlMo7VHXmfgJMoVnEt1n2yldNfF/GdSB+1dRkvNQZa3fQ3a3kKoQlv7L/HeZn7
	HcSaNrEhorA==
X-Gm-Gg: AR+sD12jvJGrJJA0e0qopx8rT8Z0dXV+F7ALN02SKDpQhsUbn8Q4+dpNvVRde5HXTMD
	ohwSOeViNNiOHW2+iTy+XY+XjFaiky5cxQjxYLstUkQP5VQYhBak7T9KBOyyJlPBjcPe78+07xI
	Pg8UmwdaSifJteIawTf2FndY3wPxLwdDauVKe9RLeQHpGlUSnxs3TqTVi+W6nILz7z0UG+Vg71s
	2vnoKTtRrlraMUbjRx/xjc31YzsF0hg4fMLYDk5SJYNm803W2i5OkJ9b/S42XAutmDcCr+Fx6Uf
	X5dAqB4xVLw4ommkqn+hY8NgNpoHqFtSVOA2bGnKseA6g6Fl/EDLTqh/h4SBhT23NjrmYYxaCg8
	JnO9+8Iaf1jr9xcYpLsZNyBNbVg9TshN7HK6pb5pwRaMkkknUzV2zEiB0LbXcR4WEdZDNx8pbLN
	+piFidOQ7nEdfsCKTAksigCg8LRLrV+XK7I1O0Tn5V1csZLhEFlKOdUW6HE6FPFKXpymQ3x+UuF
	tvnasHYm8TkK99ZRdqGytufDmMy0hbjKZGC
X-Received: by 2002:a05:6820:e027:b0:6b1:4e37:41c0 with SMTP id 006d021491bc7-6b16b399d5dmr10406307eaf.19.1787580156448;
        Mon, 24 Aug 2026 07:02:36 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f8e2a730sm28383095eec.0.2026.08.24.07.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:02:36 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH v3 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
Date: Mon, 24 Aug 2026 11:02:10 -0300
Message-ID: <20260824140211.17003-2-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
References: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The M-Audio Venom (0763:2084) is an USB Audio Class 1 compliant
synth with an integrated audio interface, it does not implement
GET_CUR on SAMPLING_FREQ_CONTROL, hanging up if requested on
endpoint 0.

The first class request issued by the driver after enumeration is
a GET_CUR on endpoint 0x02, freezing the device's USB microcontroller.
Timing out on every transfer afterwards with -ETIMEDOUT, such as
SET_INTERFACE, so neither the mixer nor any streaming interface is set up.

Analyzing a USBPcap capture of the Windows driver I found it never
requests the sampling frequency, as the synth exposes a single
discrete of 44100Hz on both streaming interfaces, thus asking for it
is unnecessary.

So I applied get_sample_rate to avoid this check, and
disable_autosuspend because the synth doesn't come back from being
suspended.

Signed-off-by: Federico Valentín Andrade <fandrade@frba.utn.edu.ar>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index f4e1eac639..64c802bef0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2334,6 +2334,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
 		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0763, 0x2084, /* M-Audio Venom */
+		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
-- 
2.55.0

