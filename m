Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354BE1F3D2D
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503580; cv=none; b=R/2FlbcWkaXNwrf+WqQbarmP4t4cZna3DPEsJXgynv+jYpzVqNoG5Bl70Tmm67ve0x/VhOkicQlP6YK9hZH7cJSRqq8MbuFKDCGTHDFjXmkRGVB/fJlr8tJJOFjHk5GyxKPyzRRR0feCgvs9SI3eS5yGk8b8kZJtiRQxFl4BEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503580; c=relaxed/simple;
	bh=ZK5a4FVY/CFjU9OB0zks1RHIFGTLqjPA9cx97FsFi28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHLLIRBGJe0Qrqx07RmZOkxOWqzlM/dmRaylzI5GEo5zL0fbIaWH6KC88xIRqowwY71U+Y3uoOAyCk3C7xuWOFw3Jyscjb8xViiTIAfcbCONAbCJTW8HpZg+68DiBWA/aw8MubhZoAvc/3BnOY/m6qycOS8SZ1slEPU8EeesXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS75cJ55; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS75cJ55"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so22419271fa.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Dec 2024 08:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733503577; x=1734108377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol2yKbkMPN+HC8dU4rXIBYY4RipgoOn6OkqD37L6yoU=;
        b=TS75cJ55lAYpNpdzzE26WTZN8OK/fTQxaardYLKtmgBad2XnWZh0XBg/MLwsWkXnwh
         ewYMUrI2EIUqz8VuUejPPGoQymS4EzPYuvYjHyg3c9xQovUkV3kk+bvk3vnfmx1eSUbV
         qzwysqLR4kNXlrXzFwmB8QGpVKaBYvQL+wTycFMDgnqQvYs0zfSiZGidKbu9POmocDVo
         aOXCmP01UUt6vn5EqpVH2dTM2g7l6MkxowkmR5lLlxQHek+wl3pxa0tQWXSYJDiD7lhs
         563nMrkBadbNMXF5gbs/R88TGKeRL4lglDWJydVLcO6+ZA6cHiKwNbWsn+iJBL+OQpaD
         DW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733503577; x=1734108377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol2yKbkMPN+HC8dU4rXIBYY4RipgoOn6OkqD37L6yoU=;
        b=b1W33+d94x3DKJdehUnjpQDPdmLL+6j64xGU91Hfn4DONL3neav4KNZBCsGnAq5Atz
         DJ68FTLPtToqbUnfMcGQ+kfeqxO5t54KTaAbwH0FjmMYVlDhF+W+EXgaopPfZAnlTBuz
         59V6vV4/C2B2D4vS6ThWhy271Wip9drUIoeIfCr2q4WFSbQyUVfyMNglWXQDMnWBdR3q
         5rMoZy+dJh8uV3eKM8GGTdmER4dbBlK/VElaHy+FgLHk9zRfeZjnSOsludy4CDp0WLDo
         7c+cvZkdS0rprJO3fXCckZUwrvpi/dI6l0sfeClpbSHBh8M/qhWKIyA/ZwlDfyZIw3Ni
         NlEA==
X-Gm-Message-State: AOJu0Yz3d0D29f5jZS8zXaOFfn9WE+n5wfurrFZslGqTLJs1qm+12+ZN
	Q5v0eHsvU78byKdy+Bk8NrascG2e1vKi/jlL7ZfF9HlFEGvCpls2oMHqIjSuGMs=
X-Gm-Gg: ASbGnctRrJjy1GBI3sfIxTg+V/l0FpVjWNEfjn4jXjBWvY1IhxgrA2Ix0S+LT6Mk3wi
	C2lf10sRM86ZpNLA00KnF7uUJ6i1icO2wQnOpj8cmt6f8ScSj2H1JjIZ2+3RT8dPSAD2mghzWSh
	cfKh0hIHWRMqi2QN5Zuj9WR+PUJXFc8tko9lrT5+UCI6F+pLd0FsDIe0cvyZaID0MIix8jE9iEz
	ddarlDJfpBpd0f8E4O25PR4XKlZEqJ6zZcaZSGJ/LqMd1VHbwRDMT9TSmFzSZQEDSpZECWyHwbv
	i/81WOLJ
X-Google-Smtp-Source: AGHT+IFzciOKfyx4GI9fJD0KY49r407LYZsv2/+b/qcheqid5qZYupSaiPHJuPvhXBKh+RLbL2MF0g==
X-Received: by 2002:a2e:bcc1:0:b0:300:38ff:f8cd with SMTP id 38308e7fff4ca-30038fffa34mr7366341fa.9.1733503576789;
        Fri, 06 Dec 2024 08:46:16 -0800 (PST)
Received: from nomad.sjv.fi (88-112-63-228.elisa-laajakaista.fi. [88.112.63.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020da0729sm5179071fa.28.2024.12.06.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:46:16 -0800 (PST)
From: Jaakko Salo <jaakkos@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Jaakko Salo <jaakkos@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for Yamaha THR5
Date: Fri,  6 Dec 2024 18:44:48 +0200
Message-ID: <20241206164448.8136-1-jaakkos@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use implicit feedback from the capture endpoint to fix popping
sounds during playback.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219567
Signed-off-by: Jaakko Salo <jaakkos@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 00101875d9a8..a0767de7f1b7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2179,6 +2179,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIC_RES_384),
 	DEVICE_FLG(0x046d, 0x09a4, /* Logitech QuickCam E 3500 */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
-- 
2.43.0

