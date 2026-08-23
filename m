Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE71368D4D
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498866; cv=none; b=OsqsviINSYs4c86uT7EDU3ZnOnH2IEAjPVRgtAi4DK9iuvyCbk2FE9XNxcAelV0eR5sepZfMZVnL1XkslK5dwV2/jl3XPB3Zc4IJEk0NHGJ5jdI27d9JUNqGCZLCbQMRyR3jQUWOCKGd5I+iEzQv0iEbgsvoFZh7oYH99Bu83PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498866; c=relaxed/simple;
	bh=LMl9wAqm8Z57R+Yo47/E993TV9DWpI9dPdn4287LYUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pnSIHswveLzNxi6oprNuugRNCyfMQB71Iwz3w6FfflpwBPYgo7MC+oR2Q8B5pAy1vgGklAxbMrIAwCtLOdCjPghqQOB00AOK/6PsccVPAxg0tpUQikzDmCkhd97pUrGbzRi5mE3agqG313u9ivrU+g8VDCwkMltZtOa6hHQo6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=CmT48oJT; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="CmT48oJT"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1250576e0c.1
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787498862; x=1788103662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/ZXeh29AkcbxuiaNwGUL/zJsE+k5HftY2aBpQNKoEA=;
        b=CmT48oJT5W8obU0z4GZ79k2FcxBHsIbouj5jVqySQWvDD5rIIv0SKuQq32/LJ4r39r
         zVZhky+/cGaKgLR21Va4tqsrKGomlsekRmzrltmjNcpKfCOG71nFtPd9AxZkHoUAeOru
         IcwqdND3aB0UZbm+scz7qVwCqIE+IPqgzZVJ/w2xp3ZrP3esqg/J327wfTbb5qfebKtQ
         BsPHJGOgNH+AEQC7tCagYhq53F86kqINNnjaTEjAlHTxxFWpUAyQBfJGxZ0FlAKc8rZi
         F6mdjhEWLZbr+2M5ZHXP3XWssoZMc5SEiRgy63ApeJlt1kJ6xG55kF3Etf8pLjtr4ccV
         6eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498862; x=1788103662;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/ZXeh29AkcbxuiaNwGUL/zJsE+k5HftY2aBpQNKoEA=;
        b=QewjMZRCb5Qd950Z66RhvxDFokMmvcHTdjKSZdrDTafLuKo5bIibcZ7FBXPJ0/3RGo
         qtM3fuZmv1VSbN8MytSisfYjmn4G1yemV4IbB8TMgDgtV2WPgMNOfTa87ifNHaFhxv+j
         VqUfccjSIKqKkgxnF2XKhHdYQ5jVDPWs/C61891/DhZDLOLQrrVeRakgIZOhVnfMFeuN
         IYUJZRuzngkOth9Doy/7OCLOeP83QvYQUnUOspaYczte5YMSyGKJhFV+OHj9qHw8GUQt
         Nju4bB995mt8CKvqH3vlN66r99CqIaBRxX1+BScP3kf0xwwMc+97etowzRyPFhpCaRkF
         rEAw==
X-Gm-Message-State: AFuF++k/eT8ixBmUm2dUimXRxS/Xc1xND/U6Giyl4egyIJUEFU2bmTUI
	nTw3Q2U0n8J7FlToHv0wNL60edKtLf/MialgcLAy1PMszawtO2zOBmiK5u0i0Tpl+M1GA4udqly
	KkVwZ9LehPw==
X-Gm-Gg: AR+sD12621zpriu7n6bk3qP/yWk3czb8Kq1ii2au4JAytTEF0KxX4uVEq3qL1VpvL4C
	10DN9aI79yKdCcFbzcvrHEfL8DVh2dlWX5rA+DCltATRswH03VWUAxD0j6xazx/NbvbUXsqHYP4
	RFd5Ppfxsb+Ha6LzPDizsq/vmHnNT8HJCcW7gUWiXOM2+rczxefRgrnd/zYOI5yEuEjIG9DkZdB
	LyxhkdzFT/lsj7HhZiDrmRWXhJrFGXLgyBW9QeJS/Q+BXugEqiTyaQRUY9W4x7Ls6AA50WTMyrT
	Of4E4W0Thl7K6eXQEDoDmPfTwg6ejUc3Iw7lvfoyEsdPFNc2y+bCaTVdvZ9znwjSy5DxPMftP3j
	82/EdMqgmM5WTX42nOsHUFqsDymkS0hLNMYiUE05go4tsjXAf7UC+teEiDbKqoYZoQe/oTM+Isz
	owKj4U0ByjsOvnmOpb+sVr46Aljr48N2tnAHYfQde/dwIDu2UXmWnD+haqZw0vZ4XTinFVq4fwr
	4GsumU9w3PretQDqWUmYL0oSQ==
X-Received: by 2002:a05:6122:8c2:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c5ff7a081fmr9375243e0c.3.1787498862157;
        Sun, 23 Aug 2026 08:27:42 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d30a93sm1447159e0c.7.2026.08.23.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:27:41 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <ristarfede@gmail.com>
Subject: [PATCH v2 1/2] ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
Date: Sun, 23 Aug 2026 12:27:32 -0300
Message-ID: <20260823152733.740731-2-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
References: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
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
Signed-off-by: Federico Valentín Andrade <ristarfede@gmail.com>
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

