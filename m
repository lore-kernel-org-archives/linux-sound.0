Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3691C86F8
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725657300; cv=none; b=PPOnnRpAKkab171gAK5dTJbhtzdMhh3iPYReW3oD8Y7k7acbK4D5qPdGUk+cnnAMdFdukD8LgL0QWykK1wB+/08oHIvHtgwzUyp4H/JpfKir2RHh5WnYBJiysMpb0/nY5Y9QHUv/hhmhPn3K2VGzNGa4i7hvt03mGqHkqpnWjSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725657300; c=relaxed/simple;
	bh=ZEvUEorOsia9rQcPYFPa22tCoLVCyg1slnig8NMKf50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+eBSkxm2i0S6EI68uBBZxEVUDd9qTm73VrqFwDa++Zhjzv23Se7Kav3joXtgasXBySvhw6ivnn621sltiFDDo8LYIfvGaChOic5ZRZKBB7WLPkdTQg8uUBdbWudOYZcLJii5gpKTfIPRhsw1Ey8Khh2ARhzEL3tFytFz7iMQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KfW152WU; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KfW152WU"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-846d414ea6bso613088241.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Sep 2024 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725657297; x=1726262097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9aVK4sfy3gpXBpKGUO42369WUFZ09m2WcyDCsX/ac=;
        b=KfW152WUvRKNpsfg7492fsYSrqcNXTAYHl9X65e2wLEhY9Z1nAGcS8aq78q3VCzWrG
         lFVPmi1FSHyJLpFIBACn2ZDjopYjrmEMxRZX1YcNu94YA7MrahtCrSdmukh5RYIZPFIh
         zyEkkttilsx96epy224zXFEnoO2cRWWIRM4mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725657297; x=1726262097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs9aVK4sfy3gpXBpKGUO42369WUFZ09m2WcyDCsX/ac=;
        b=N4WjKh7TTyPIHODEbNgLRJG/XB0Ym0voSaCLJ57FyoAL90gyGpG/5L755xquDfesIq
         f+TmtF2P/dV6CAxdGc9feJWr2Bw91FkxPPfn55uNwEVT4AP+tAQQzU8RCxGae5Omg8S4
         s+TnCAS9aNW0BHW8TGxoxjl4mvBbJnW0ZxkOzN+usUf6kM+y2wqtEmmZEHjgZ+rntAbp
         qCLWKIrdkPlKNkYG8NA15/q96hnVvvYXYJBJjW+hls2gDQ0OE6iOoNNup6jcYbUQS+0x
         KRABMM4mpc1CRadVvyEkNxyNLwUdlytyOILhH6e+3/57ScuLaElp5YOmXeDwUc44WVjh
         2SoA==
X-Forwarded-Encrypted: i=1; AJvYcCVPTP2U5JXjTsqddHlv34etKglMYSKQzbisszdwbxdCtG/+ZJnTTS89Tgv/QWBy9QYaH8q9pTNwsuTbWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLldGh6S481JFrsvF8eZTQy5EVCvX4VNObX9o6NwP2G6Z1QrY
	nLt0vZ622SCSOVKnVJdDrTFkstGtgTMUm+qdWO8rRT+oZxuUCpitPCSZ8gZNgQ==
X-Google-Smtp-Source: AGHT+IGu1gSdn+TAhuXyZYC0Jo1w5AWPPH8ZYSvd0b/4lADstyEw4lDaVQ72agnawfprbU0iJrsTYg==
X-Received: by 2002:a05:6102:38d0:b0:48f:dfb3:f26a with SMTP id ada2fe7eead31-49bde1c74f5mr4625071137.15.1725657296870;
        Fri, 06 Sep 2024 14:14:56 -0700 (PDT)
Received: from localhost (112.49.199.35.bc.googleusercontent.com. [35.199.49.112])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7a99dc0f8b0sm63299985a.23.2024.09.06.14.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 14:14:56 -0700 (PDT)
From: Joshua Pius <joshuapius@chromium.org>
X-Google-Original-From: Joshua Pius <joshuapius@google.com>
To: alsa-devel@alsa-project.org
Cc: Joshua Pius <joshuapius@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	Karol Kosik <k.kosik@outlook.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
Date: Fri,  6 Sep 2024 21:14:38 +0000
Message-ID: <20240906211445.3924724-1-joshuapius@google.com>
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

Signed-off-by: Joshua Pius <joshuapius@google.com>
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

