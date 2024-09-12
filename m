Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DE1BA87B
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154804; cv=none; b=Pm22RFfxyRppxDTEyXFdLzg4E9R96eLsXRaJSxqRw1XHVSzttmuEy+W8XwlcoPVyx4Z2zZMPDT9RzCl/gX2LOwUwduR2+Lp1cLE57HjQXUXhBo7QPDVn+Vq9SjEI8yCABarj1bThTu/bEPZMOy1dVNCZgRDbN98amyQNAdapzpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154804; c=relaxed/simple;
	bh=NKleTICc0uMNXV+uSqzUKeNAhOpKOaLVEKAQqBNY/Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5ytbzCjnvhCsamBPjWMwblo5GGSmwkbSDKZtZSNCfk745LFA1Pf3T8UfqchcMQLsqlaUEdkNfxhHUDAmNEcTgWJOsupwMNbE4Y9c/P7Rlo6pkGJm1dCQomCy1l8XCQeM0f5e/8zEzT85qil44W06j5G78rm0Uf1rFgNRgBNln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n0pCXTZ9; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n0pCXTZ9"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6c3551ce5c9so18730986d6.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726154801; x=1726759601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7mKFNRTjjADvwf1aB253Jo1v/0MMVkR0nsmT+lRjwc=;
        b=n0pCXTZ9R5rixccQ0sYLNyFAkA/F8gAFh84j6NRrPDV+w0ToFBZ0uAkERuvCWRdP6K
         DPjj0oc8YvThDFxM/SqBDJGJm5kEm0dzLx4RTrAWRoXAFoZm2400X7m1CfCSKN1PfrK3
         cLq41qBKciBwYx/y+qdT4OlLBcLKUrffwW9wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154801; x=1726759601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7mKFNRTjjADvwf1aB253Jo1v/0MMVkR0nsmT+lRjwc=;
        b=ZKyRFHzXSs4G99BRGeEr978A+TW/vkYHNwRHDHgQ3BzR1Z7aVgA4DTHxij3iIPCZAo
         D+BiRP7syp48ARegx2tLjPfMC+w8hmd/pfn2I8YZp+p060xOdt8oNjbIMku8GKNHvZkP
         Y9Wcmys4xonON4AD+F9R53H6gR3s0rPDNAXLqo1ttSnd/6f5zhHGMIwQo0n2PJtoMjQt
         BSAdTId6mnHfKAcXYHLPVDiJ/bU3/0sgDV1BCQjco1te14Dq0m51WRnCnWG1EpZwFX++
         0KRZki4BKobesmrACZaDvVBPFnjeWMQ1NiufYC+8EyV0x0RLO4lME4cHodB0skGWt4mG
         3JwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGBEMqP/EsR5nZAXVb4+RuVt2MwfQQF2BM7GCobLmg0sCV9tQrY0yFBwFR5DxGhIKMdM84Qb3LZ1gXTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFCZw7K6dWl5URikFZ43U1sPSfP9A5SoqQCdQtZOwB6GsU9Sd
	ROkcLdm/HUzLnAo/+bsYyhxIVdDUQ8sTStkNawcDviWNmVtiG6uWs58ME2lFZw==
X-Google-Smtp-Source: AGHT+IGchvvlGNJOgyNzd+nGz4P624xph6cEj7rU2+N8kSWMwUA5os9jZO8OZ32oNgHPjsbZb/wcFw==
X-Received: by 2002:a05:6214:5d05:b0:6c5:50c1:befc with SMTP id 6a1803df08f44-6c573b21fd7mr45928266d6.20.1726154800674;
        Thu, 12 Sep 2024 08:26:40 -0700 (PDT)
Received: from localhost (112.49.199.35.bc.googleusercontent.com. [35.199.49.112])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6c53474d749sm55476786d6.92.2024.09.12.08.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 08:26:39 -0700 (PDT)
From: Joshua Pius <joshuapius@chromium.org>
X-Google-Original-From: Joshua Pius <joshuapius@google.com>
To: alsa-devel@alsa-project.org
Cc: Joshua Pius <joshuapius@google.com>,
	Joshua Pius <joshuapius@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Karol Kosik <k.kosik@outlook.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
Date: Thu, 12 Sep 2024 15:26:28 +0000
Message-ID: <20240912152635.1859737-1-joshuapius@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify shortnames for the following Logitech Devices: Rally bar, Rally
bar mini, Tap, MeetUp and Huddle.

Signed-off-by: Joshua Pius <joshuapius@chromium.org>
---
 sound/usb/card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 778de9244f1e..9c411b82a218 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 	/* Creative/Toshiba Multimedia Center SB-0500 */
 	DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
 
+	/* Logitech Audio Devices */
+	DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
+	DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio"),
+	DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
+	DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
+	DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
 	DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
 
 	DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
-- 
2.46.0.598.g6f2099f65c-goog

