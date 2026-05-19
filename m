Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9752EC0B0
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201987; cv=none; b=OCEbB0rrZwN3vZvEjhp4GLOJbAeESNEHEMZBpJOxTr7kaRiwwQZBxCpi9eBIFB51Bij5qfdGzgW7ETKwXIlmMa1LKNFz/fae8g5fm7y02bilRp/Hiv6DXDt8A6157fb+mWvrxhbzwYp2LxaIILFr8KpHW2ubb46LKULmGF3sads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201987; c=relaxed/simple;
	bh=DnpFjzLBf0jW7wEnEpei/oKl5zYUrdA8NFbmjkgUKtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pV9lIBIL7NJQYq4y9kicwJEG6UZp/g7WXagzz64/FCOVsR5c0SDW4vPL+JjnHERH7QR2X/TuIpaGER4p+R66eaLIqNkbeEmCJksOZi4oyET8pfkNsPOc7kmsoJLZXGCQKSzFUnCKX45baOJKEiKlyXbWUGik5j8dbj4515QjOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTMiW/7v; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTMiW/7v"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so3506542eec.0
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201985; x=1779806785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLMlW/U+mAE6qh9Fg2eWb4MjQCTjnxY74Wi6IiUhl0Y=;
        b=lTMiW/7veW4wxXHEshD7xB/MnKXFmxVotswUSIfR4DYR/fEIQi51gXbCkdmhbAQGp8
         C1liajt2JFCKvWP+VmYWCzePOl3CSQb9uyI41d1o5yNOpS5pxCodM/Y6ce0exD5sFiC8
         Sm1TnsqFkxsDLX85/L73Fy1P4Y8vH7kwj5WGB+JSq8Mg4JF2p28rgLgFe9sp8u3zCJ1G
         DqoFz3kH3xDpHYk5/MUs1sKfGatbaiP3gXafz94A3a4SrKejfNniFETIYkmwrpWE5yG+
         L8Ngv7T0UAoTOoWU+stMbvEqydqVfZMk3HU8j3+wPZN/+3lKx/VueXQLHl40V2C6/RPR
         KoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201985; x=1779806785;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLMlW/U+mAE6qh9Fg2eWb4MjQCTjnxY74Wi6IiUhl0Y=;
        b=IV/WroMcwQ+IjaKd6sCWcpyDTNW2/MyTU6SnjfXoiK7/I95HexUwzDlFH9LUmI66MW
         NxkO85swF4rMm8qoNqUoU1adQp8r5PMiIS/8zBClemdqqNvqlXEd5W4XF4F/xTB7T6Zf
         kjs363GeJ/TeN0njkWJDhJMQCOjTa6SECZloUyxHhiDYdl5tHV7aTspX2yolB1jCH/rk
         cbbHubvpsBMEjn4UXsCkqo4TZ3BestOMHGQclwUtd8Par+0RhtZsQOvIK6LIo8FCEF5y
         W2WApxEU/AQavHJlPNRcf8qo7jvj3mrlpPOFTHgJPeMYiwxshJ5608PKSPtJrXdgrtky
         8vCQ==
X-Gm-Message-State: AOJu0YxujN4vKbJNZZy7vKq5/RcGeLEOX+jzFlGacAa9yUmlBpRE7Bs1
	b+mCriA0kO/LesVSuYxKvCcgYhLhqLz39QtQsAl1gBHUKSQMvHaJxnaJ
X-Gm-Gg: Acq92OG238kP/Fi+BoGv1HzzgnzdNWomnxzCBmH4xjxmBUFPjWpyIs62f/0clsziBry
	EVZSs4iW0jqmdfXj2Q4VGwEFDMtHIaJz8fEeC5A/WeQz5FmuzATwglYwZMVubjjKqErkdhSnMuv
	QJbSpuZkZ8r8h82RygEVkxfNpEJGcDqYDoZS9ZX6TcN+b5wJEiEP30KiXmLBwfFvqbhBGv3jPY4
	QKICq+oQgV2cL316U960CJ3zumAYfyvzKJ63UhkiNVb9A+4vkx8iYhrHZeO1jm3DAeqHEZI5qi9
	Jsbl2GpkiohMfltRr5xWVUMmlojiyIh6vv6c8kugdwAaMgOnmjiPEQqlxIaoFYNBplSXAdbqX5B
	ezViE87lP0FtSfWolQXHCLWGGDuGgFDC3AXx9yEH5TixX0A26gM5eXkjWbSI4vDHxXE+Nx/MOI2
	hqPISMqWEBxI9osmOc1v0hLRZK8u+t/U0TUo0g7KU07Ar7ZZkShf5VwRzObtMJRTeNCxeBx97Cs
	scx6o7JGkTE
X-Received: by 2002:a05:7300:7490:b0:2f5:5907:3a48 with SMTP id 5a478bee46e88-30398285d3bmr9086564eec.1.1779201984612;
        Tue, 19 May 2026 07:46:24 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm16098423eec.20.2026.05.19.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:46:24 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 19 May 2026 11:46:19 -0300
Subject: [PATCH] ALSA: scarlett2: Allow flash writes ending at segment
 boundary
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-alsa-scarlett2-flash-write-boundary-v1-1-b550480e92da@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJbQqmXsW4GMogNU0xMwU1h
 Ltbdfk2/2+gLJEVzs0GwmvUOOeK46GBMFG+McahGqyxnXHWIyUl1ECSuBSLYyKd8CmxMPbzkge
 SN9Lo2pP3xvmuhVp6CI/x9btcrn/r0t85lG8a9v0DzsId9ocAAAA=
X-Change-ID: 20260429-alsa-scarlett2-flash-write-boundary-af4579904965
To: Takashi Iwai <tiwai@suse.com>, "Geoffrey D. Bennett" <g@b4.vu>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=DnpFjzLBf0jW7wEnEpei/oKl5zYUrdA8NFbmjkgUKtM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFk85XtN74s5NzQE51d21O6c0J29vEGs5FneT5MvUy8kB
 +3a+6elo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACby7Dgjw9Luz0ynD8+N/KOn
 /XEJu/HDvx/qK+oevq7MurfhJBP3x2MM/ywObJrqUC3AtUrizrzz3+o9OGZv4eBWKpisedXy9aF
 DIfwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

scarlett2_hwdep_write() rejects writes when offset + count is greater than
or equal to the selected flash segment size. That incorrectly treats a
write ending exactly at the end of the segment as out of space, although
the last byte written is still within the segment.

Split invalid argument checks from the segment-space check, keep
zero-length writes as no-ops, and compare count against the remaining
segment size. This permits exact-end writes and avoids relying on
offset + count before deciding whether the request is in bounds.

Fixes: 1abfbd3c9527 ("ALSA: scarlett2: Add support for uploading new firmware")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_scarlett2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 7c43ca51938e..78fb72e626ca 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -9634,12 +9634,15 @@ static long scarlett2_hwdep_write(struct snd_hwdep *hw,
 	flash_size = private->flash_segment_blocks[segment_id] *
 		     SCARLETT2_FLASH_BLOCK_SIZE;
 
-	if (count < 0 || *offset < 0 || *offset + count >= flash_size)
-		return -ENOSPC;
+	if (count < 0 || *offset < 0)
+		return -EINVAL;
 
 	if (!count)
 		return 0;
 
+	if (*offset >= flash_size || count > flash_size - *offset)
+		return -ENOSPC;
+
 	/* Limit the *req size to SCARLETT2_FLASH_RW_MAX */
 	if (count > max_data_size)
 		count = max_data_size;

---
base-commit: 9b14f636834630e5473ee5020c8289823a481a7c
change-id: 20260429-alsa-scarlett2-flash-write-boundary-af4579904965

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

