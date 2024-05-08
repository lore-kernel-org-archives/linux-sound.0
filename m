Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0F131725
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 22:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715207371; cv=none; b=uqQRHmJ5vUY2NlzMrp6mgWVBUoIAfF+tjpd52cxKKczXux52Thybj8hAwojkxxvV9cTwGZy2KXQ8JJo8WhQI59M7jfa/VuKKoed6il08tlWgXOP/6Xqo+CXRD5l7HK1MYy2h4tk3SkxchO8/B3pXi9j5UKcxc1Vx3Hi28kCpSyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715207371; c=relaxed/simple;
	bh=8B9U/Jq1YW4M/1V/dd2FLPL91hKSUgdh2KH3CarfTVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pZkoZhvrlR2SaEJ0cFfDn15HOl/5A0kOqQ467w5qvUfzP2n5MF3xvL8EaaqAR4tUBkJoPrVACYO7Id9jpjnoQg+XlUy2tDmPkYor+zKdTKZPjrlmJbttzwk5UDqLCJPkb9pU2d0bV9oZyqN+nsyUGg5FSaGkBbNmVXoBcGulF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IoptlRlN; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IoptlRlN"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4349685c845so1451911cf.0
        for <linux-sound@vger.kernel.org>; Wed, 08 May 2024 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715207368; x=1715812168; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtYXFaRMkuNbSKWGsrMMLWmq/9Bm3mRH0FfZ3hEbB6k=;
        b=IoptlRlNNYHLQMbi8gvoIjgfcIdgtLHNUFx64Wmy8q6Hj8AtLqoZBNcLVOyxPVipXr
         +SnxNKNwJObHuKMsaagRrNVFxrhUY/pz2oga5Ow8KvhDpIYMrEkEoyjH4LaNEZhwUPVd
         mP5W7unquv0MCfWgJ7kpuE8sMrrNiGxoL2ctA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715207368; x=1715812168;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtYXFaRMkuNbSKWGsrMMLWmq/9Bm3mRH0FfZ3hEbB6k=;
        b=opQbmEWpJUWjv6e0vwKhvZ8x1Y1qz2ddk6C/knaZS27pULPGu/8qZ0YAMzfa02z9V6
         S6Q8dvUgNU27r0rJ7CKWPRe90zC+A1O5vUNR1mrVOr1YoVO+KsYwDFGXwaZoM0t+ub+K
         4oOq97SmTbmJ3gN+C0Ye4ibkSoHA0LgAJ6Xp1Yjf/jbsG6jUtShzZ3baexQOIr2UjAOu
         CpY6KBw2CVo1JhRUj/mBbCcXzmxH8/G8u2oWV+mKd0g7/UYVcOAN/0tve1RqnGImfgVT
         EfzAc2+bufYKRsgWz9FJ5j9h+ysN7/T5Pz9iBFIJ9+FtzVsVNav6G9OvB8/jQWo4BxLH
         NOhg==
X-Gm-Message-State: AOJu0YyVczaKLSqa0CJFOTDzhAHZp1m8lK7ksrg2thmVgdHZBlGVDRDj
	m4y5Df+JXoFevvoncljmjXzFNe2SCMWSMl6Oy8c7k2S9vnSlVm09a+5bh5kenA==
X-Google-Smtp-Source: AGHT+IF522O8v28imST8TxoifwAGm3r3WEAHh5gz2AFejF7YlVXd5l2jd/arFQNSy/japXHab8qAfg==
X-Received: by 2002:a05:622a:199e:b0:43a:89c1:6b76 with SMTP id d75a77b69052e-43dbf754902mr31637171cf.65.1715207367851;
        Wed, 08 May 2024 15:29:27 -0700 (PDT)
Received: from wilburliny.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54b58b5sm272411cf.7.2024.05.08.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 15:29:27 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Wed, 08 May 2024 22:29:25 +0000
Subject: [PATCH] ALSA: usb-audio: Add name for HP Engage Go dock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-usb-audio-hp-engage-go-dock-v1-1-9e2984d49e63@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMT8O2YC/x3MQQqAIBBA0avErBuYxKK6SrTQnGwINJQiiO6et
 Hzw+Q9kTsIZxuqBxJdkiaGgqStYNhM8o7hiUKQ0tdTjmS2a00nE7UAO3pTER3Rx2bEl26lB92Q
 GC+VwJF7l/u/T/L4fLFhvam0AAAA=
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.12.4

This dock previously presented as 'generic USB Audio'.
UCM may now be applied specific to this dock.

Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
 sound/usb/card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1b2edc0fd2e9..bdb04fa37a71 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -425,6 +425,10 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 
 	DEVICE_NAME(0x0fd9, 0x0008, "Hauppauge", "HVR-950Q"),
 
+	/* Dock/Stand for HP Engage Go */
+	PROFILE_NAME(0x103c, 0x830a, "HP", "HP Engage Go Dock",
+		     "HP-Engage-Go-Dock"),
+
 	/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
 	DEVICE_NAME(0x103d, 0x0100, "Stanton", "ScratchAmp"),
 	DEVICE_NAME(0x103d, 0x0101, "Stanton", "ScratchAmp"),

---
base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
change-id: 20240508-usb-audio-hp-engage-go-dock-50b629480a9b

Best regards,
-- 
Steven 'Steve' Kendall <skend@chromium.org>

