Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B550357A25
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201994; cv=none; b=vCkOzO91pXqymzxGRG5gj+0IgnogDesJhSH4RQAvhE9qS2bDBY6QbKg5Mi2FMDaE7jeKIDqrMUtJ8Mdt5lVGTSSmABfkFbkaXsAy7dtgQ9AWw7H6rJiOt2dg7TWHoz574U4ZTpLPphByl6d07JGKUTuzaWchnf+tS4e57fDH4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201994; c=relaxed/simple;
	bh=B/9eEE6B2PxEEwz8XP6be4i93RoXNRJ69P6xJrqTv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dkfprj2hc7A7YHz1lwpZmyhGF8duI8PfhUOlyQp2jzpQT3nmggCJEiZKJfgrmKw8BdJIfUw6Oww44jaHLthNgXoZ3fm2egSUrqgc8zVJVR43SVp3chOFN8qmiiOrNZcQYlmDp3kSkFLo9ZbvY6MyqynbBcKEGKAu4X7jwREA4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gom058It; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gom058It"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2aae146b604so62084765ad.3
        for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201992; x=1777806792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9JOiMw/TUHAEKpVZ4imVP6XP0XS06uXgFI4h8oSnkI=;
        b=Gom058ItaKEUp44LK88/QOzEZ3tBt0+pP947dNm0XyjNSKD4T4PM38sMi2CNydiiG9
         jGUNISgx2/veeYZY1FL9g3vEwIt2nuIKj+nWvTTj0/4uXpCmpBrn8Kad2EkbcQAGPJPv
         1zQD9fEaBipUI2+KTxcq0lr6zqkzQLtZi5YnofGcztXEKchiU9vO42O9HCD041yftk6G
         e6PvnN4XW2bJ223YV84CMk/yHP0GCBCf88PJP370h4OdZngMrFvnfJCf+1+rcHV/7HeC
         FL3u7guZl4XHS1h2A9zQsyPMMucWTNNx+r2kAztBOVH/EH4+KkrouqKcaOF6L5eokINq
         VMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201992; x=1777806792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9JOiMw/TUHAEKpVZ4imVP6XP0XS06uXgFI4h8oSnkI=;
        b=Gu805BSlQ0e4UosIYjB2tN4L8KT+vmOJQ5SNRhX2NzqqUcN66Q4Dt3HhCeFxcPmoLB
         YC5nMCizDkJT58TbeDljAJUaLYBavzhTsVWXU+ChyarE6stMFBXfeVoGV1OG1fEaELpa
         3a1IVP3+wQjiNbwVkdoZdqItQYwQ7pHuPhXAOSFxdiwqoQoFG9X3aQGz8nUM/wg1U1xE
         /Aq/7VreeCWy8mu3cAt/3/JP3kbYqhk2YUqPeOHANfUE8Ka21Ewk6xn6Jg42d+rzoUrW
         BZh7K6R4ELlzcaZRbvFTF/Zu3gs8LvveF5/x+NJT2ywILz/eStzq1icAXbNO+NKxJ+Tb
         B7ew==
X-Gm-Message-State: AOJu0Yx5JxmRHLNYoCzZbcsXN3orqEN6Mmu2m+XJjSh2zHyeZOVWMUXs
	0USzb4FEUXE7g5Lj70J19mDrJ8Nm/QpEAwVervi+dEiFZtA1Ia97ljcK
X-Gm-Gg: AeBDietvTpo3+s0D3OMSFKxBz6/U1cBwNPfy6MCDH8ocBSgvVwKD3giocjkDcZ2t+yf
	z6kO4l0nDfKzUFqoeYIsZQ4GwIKuPGynA1zP8knsb7P74Qb1gQrfKZrJNdQDqAnJGXgHSAcMeti
	bIX6Kmep6eIlJUm2GhyXiG6VTbOZ/6SP5/MrJdPeM1aBS2D+9mwh0kVbbONPodRsAjCdbab6gT8
	BOl0Hvy+WHDwKa9Me7y0KYeE1twKv1qtFuPnRKzXKuZD1X3Tnemn+J66gix5HxrBcxlAjrn40oO
	youLLXmx6t1texPAvdmQpRZcU98LJg4MhqT3wFjKkvJHr2ouSzD0czgbab/YziBV+wox1KyueBJ
	Oj7cbVFI4tjNOGN8qpYb2Mkp6QPqhtTCQj49AvFX1Xr6FFXTbt4s08Qm9KJGu9YLWRegmJnodeB
	b8V0HYFzCBcdTDPnwkPVwz+bte+Zq5+YrZfRYJBU9xqBqRR7440hXmxU8oLA==
X-Received: by 2002:a17:903:2654:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2b5f9f4e6damr310434855ad.24.1777201992565;
        Sun, 26 Apr 2026 04:13:12 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab32cfasm351390385ad.69.2026.04.26.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:13:12 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: clemens@ladisch.de,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] sound: ua101: fix division by zero at probe
Date: Sun, 26 Apr 2026 20:12:39 +0900
Message-ID: <20260426111239.103296-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing sanity check for bNrChannels in detect_usb_format()
to prevent a division by zero in playback_urb_complete() and
capture_urb_complete().

USB core does not validate class-specific descriptor fields such
as bNrChannels, so drivers must verify them before use. If a
device provides bNrChannels = 0, frame_bytes becomes zero and is
later used as a divisor in the URB completion handlers, leading
to a kernel crash.

Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
Cc: stable@vger.kernel.org
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:
- dummy_hcd + raw_gadget emulating a UA-101 with bNrChannels=0.

 sound/usb/misc/ua101.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 49b3dd8d827d..d129b42eb979 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -974,6 +974,13 @@ static int detect_usb_format(struct ua101 *ua)
 
 	ua->capture.channels = fmt_capture->bNrChannels;
 	ua->playback.channels = fmt_playback->bNrChannels;
+	if (!ua->capture.channels || !ua->playback.channels) {
+		dev_err(&ua->dev->dev,
+			"invalid channel count: capture %u, playback %u\n",
+			ua->capture.channels, ua->playback.channels);
+		return -EINVAL;
+	}
+
 	ua->capture.frame_bytes =
 		fmt_capture->bSubframeSize * ua->capture.channels;
 	ua->playback.frame_bytes =
-- 
2.52.0

