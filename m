Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D132E121
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395386; cv=none; b=MQ809zGqtN/dAa7pAFFe/vnq0/aw5Jjdr8KqXPWVtMpBvA+RqtkaOTmXBpMBHeN+4hIQ/wlPUcVkERTyOYId68FsAC+D0aFuhAf+fCVrhOoHvAB8uzTwl1Xq9Cm32ZFEjmzV9jVxuAn4YPtPK/6s6YZv8O5Ia+nO+2Y2cKWcZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395386; c=relaxed/simple;
	bh=0j10HpgS7g5Mv8FnqnJHchW/TDiJpokSZ0cwx3BiuqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPhfcWrQFXXkuHIUgd/IkYYdXu24wqJTHr0nCxVjsPGxABQzFrNbnRWyR6VsX8mUkt2HKRs25PEq6UjzmiQoCUZEWDDLs2cUS+/KlnMl+S7Qvpvy6USMqx2N1PN2mVI6VYG9N9WB02zxt7urWgfbsD/VQNW+fXt54ikddxmz7Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRXn9b1X; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRXn9b1X"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8584e80d59so969708a12.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782395384; x=1783000184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpk5mEcSHW0k3CQKLZOt1G55CYbzQ3Yr6RfffLmInkM=;
        b=eRXn9b1XRBqaLaLez4Hv7R/PkWvjoqGEnvJr+LiKgWmjRvo4Oh3miOn+N+gG/quXSc
         7ZtGC0VIPpf36WBIS1jrAsRMjF0Ko89UHO488wxM39v0EwbBqM+waCj0cXH6gp58F7FW
         jNXug8i+NsjdT0YUKbq/8f/nwoE/t4ytLXe5xnAgRMgUSY4ycIuztm1zSqoEfkA6DeoC
         JGhYzw/exKyh2TOmMjGste0XyoZWmuAVHp5ix2zxx9MDSxsqXchMzeRDlkxONy4qje/D
         n+ivIB9jtH8/6IZxTqukswLZ5jdYTXNBqCjeKTayFUs8TwbP26S2xjzQbX7KLLqKaj55
         UZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395384; x=1783000184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gpk5mEcSHW0k3CQKLZOt1G55CYbzQ3Yr6RfffLmInkM=;
        b=S8ry4ppOJzeK4jUhxrH4VMyNl/omtxhnzFMlCYtE4BA9BSMd6fbkdu78nCZ/mcZTnX
         S2VwqcLkASAx91uD19vxaR6injoYW6SoilJKQRA6X2wDrqLPgUMi+zw2XaNaMZAPfaIb
         p7PxP8IVuBMJjQLpsbMX5OCIkPZ5idzCL+s/s1WYKf9hc6tdImFqBwwXhHIVuGAg+YtF
         GdKId81RQ09pOl9erHIWXsTwhS0d+JqsUlnTUBQsz3/HrUq27+PVPOt6CUy3tvcLO2Hp
         9hYzlTWdp1XT3gzfpGXOyxURSpr3dVXVwF2XDMCZiBvYEGsiHHqyKz868qbTvK2a9LHv
         l7vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQQRiIaWwFB7n9QMXdKRFgj0kQhIQ/Vmz4Zq3HidkXYYu+MnIk7hXL6iK/+ijujy5cJAsThMztls+i+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVtHV6a2FgQGxwxoqeVYywHczxxVmwqrBex9PtZv7JjNGXPHb
	CA8AGZXqCC4IFvgCpV4KKp0Jug4lEtK1ByoNX6cUfMZ57ZWsSmlq/p4f
X-Gm-Gg: AfdE7cmEt+F+kaEjw8PQc8ml+uo8LVUeU8212L6N3qOWiChFbGEDVc0GVmu0s5qZy1Y
	kETM63frHB5UuZbI42cf4T9IFzI6n/V+q+cV2ygUEQ6412CKduB4j+1lfIHHnLg1OiH7pkAdya2
	dr8F/b6W0oBrWjTdjkHzJWvZjPhAMLEMNzFhXOyTqKUV9oqAMkJ8rcfnbb70dkR7IrztkRlNqNW
	wcWCTPHMZTqR9JBpnUh/dfmQStYDRF2scytJwehgSYEgCQTs26SOi9whkKCvvVpILE7EzITrP4+
	H0f1mTtLqa5N6eGCVubTFs0y2Ep/7yZSc1uKFA33HdGb3iWT/9/5HXhJQnDITgqupZY6xGGGK3w
	sXhkfwXhlmS+lvp+mfCkuriTDnVw39UTKBgDoC5GSu7zfdQdaSMBwYkTG3G2irXxJMBat5t9Xau
	l8eOf30wyy0ZNKCo8lPItzl/Z0
X-Received: by 2002:a17:902:e78e:b0:2c4:608:167c with SMTP id d9443c01a7336-2c7fc663951mr27342185ad.6.1782395383335;
        Thu, 25 Jun 2026 06:49:43 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([123.124.147.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f6509ca0sm20329075ad.81.2026.06.25.06.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:49:42 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: tiwai@suse.de
Cc: g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	r772577952@gmail.com,
	syzkaller@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH] ALSA: FCP: Fix NULL pointer dereference in interface lookup
Date: Thu, 25 Jun 2026 21:49:33 +0800
Message-ID: <20260625134933.425785-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87echuvo7x.wl-tiwai@suse.de>
References: <87echuvo7x.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malformed USB device can provide a vendor-specific interface without
any endpoint descriptors. fcp_find_fc_interface() currently selects the
first vendor-specific interface and reads endpoint 0 from it, without
checking whether the interface actually has any endpoints.

When bNumEndpoints is zero, no endpoint array is allocated for the parsed
alternate setting, so get_endpoint(..., 0) yields an invalid endpoint
descriptor pointer. Dereferencing it through usb_endpoint_num() then
triggers a NULL pointer dereference.

Skip vendor-specific interfaces that do not have any endpoints.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Reported-by: Jiaming Zhang <r772577952@gmail.com>
Closes: https://lore.kernel.org/lkml/CANypQFb1EHj0xX8bA1WxSOSK-5xca6ZNKzOQcp12=s=puY7VFw@mail.gmail.com/
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 sound/usb/fcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index ea746bdb36ff..6f5dcd35e1d4 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -1083,6 +1083,8 @@ static int fcp_find_fc_interface(struct usb_mixer_interface *mixer)
 
 		if (desc->bInterfaceClass != 255)
 			continue;
+		if (desc->bNumEndpoints < 1)
+			continue;
 
 		epd = get_endpoint(intf->altsetting, 0);
 		private->bInterfaceNumber = desc->bInterfaceNumber;

base-commit: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
-- 
2.43.0

