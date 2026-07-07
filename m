Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1FD19D065
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413950; cv=none; b=EL7bAdGXKWtIZUJlvG5kxpqU/QMnvLq3x07IZFlkLFTCsyo5IzWQILD4NQ2jJgjXPcQU6J1ZXAE5zEekqS8LHvnNZwxT8kg2EfI3djx0EIORoSvVbsh5wH8chsdJLAfgv1LVi1Tr0ufIuEJJ0GTGHzsKIDm+Ftv5m8M2n4Qji3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413950; c=relaxed/simple;
	bh=ENhMp/0z4K+KPk5wY1qhXxOXME7jnjqS6L7CXvLQ/xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MH1WwilM5/QRo8RP25gNxc5AZWub2XhqMSYTDT+MrShS4GH1nwSKlQd3m8i7DO2dZfn2ZgLe6uBZxyecUZ0wtmnYubveXxBEOfjaxaPqBZwt9L7gACp70O9xDUEMm3KJ3QeZu4KX/BlPrd7YGKr1p9KzugcKMgoy5s6w22mv7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEMZVi40; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEMZVi40"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so839348a91.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413948; x=1784018748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbJwjEcYiJxFPsHxxXYWr10WIjJN4DhZ+T0K4JfIccg=;
        b=pEMZVi40WE1TCvBhp3azM/phXzrjHhgtmBshjyHquPjsPADH/4kIAXUBgkW234GotL
         jJztehrdHr8XJY1atouSy2bwbmp2aDppIDsD8JhNd607ebV9CVgFowlSppIXSfK+2xc6
         muebjO6Ltnpi2YuJHzsiZiJcMvF8EEUj5hCSMQ4NG0c/O5cbiLzXTJyOknsyCT5e/UbS
         ZReIso0tQtTa7KxW4kQvPiHyO5yIxwdbNfV5qQoBnEVR8455/7NTjYjFvNytvdX0zJIc
         QMfS/8UKifUUFRHccNRpTtas5R9M/YHn51GoPcdq/WPbV42ofU9u+7plgVMZ3zqO1fks
         FxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413948; x=1784018748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbJwjEcYiJxFPsHxxXYWr10WIjJN4DhZ+T0K4JfIccg=;
        b=dv+E1tHzNJFhMJp5m/AKgjkp6sYy1lSd9Z26I7eyQdsAqoNRTvwYSP4FcGdSUMgnQ9
         reNf7IfjDTaCK3iojP/TNN8F9wldHh0fNk7bUItk1XAUJO6gleWhaCwzE53RiO4dD9Lo
         xmyNlKKxwUVlPk5BlTevsK1+/vYvR34+NeniGKdCHuItDq6pJYbV/VaueyumCHQFVQPo
         qLFimugfIY6yAFMKntxZPdud1zmRe+oNJ8/SwP0ZtF13QYK1nMjLgAuAqGvqdBg9C1UD
         HBJv4DWpgjofgRWI71ZMpDSfqnM5pbO7RolHdpCpqXLKLyiSS7skJismwlrcRiUDcD0Q
         8ymA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+sFgowCjt9DdzmElJBXpMZWgOjpNDBLfVDnmjeEGlEF8lpCQPpSvR1dU/2poLL/DwqmMbh1WgwISDwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SsuVMgOeOUfK7DhAWCYohBubrTycIz+RvYGhijTR0UQAObSj
	2TddgAxGFCYHq5FXGBPGHq710siy3FNXoHWVKZqM7e+0AGUeIy8kZTfw
X-Gm-Gg: AfdE7cmG1IsuGHr1V2ENmxMRb14faDzWfmhuSYNFqMmGJnpUuE2EQbR85DMbNZ1Hur6
	RR8N1DXkKRyHdvx87MDfWtQcFYv+PGaLYDXuO0h2IHoD1ZwgpSdwcMPVpkJ/LckIlWXRlGjtrF6
	O3WOc4LkUtHUjAp7b54eF4BG5UB9xl9LW8+pTljHrTCEn6YNsoZZNzQRqqHKtDJ3tRNT2aKCPfc
	3ijtdmRJkMV/v7CN/ZuCwYX5uOdv3SJ4Bt5lohpPpVHdW9taSfJ14MfpAQewLKA1ZIqXpXOytl0
	FLmitevPOftOopMFOeoXKlcdDZqWF+zaQF9jF+UhNyC9DZy0fU9sc+xOAAgAgEpsg05SGSIngea
	Qif7rc/bBvNw2lPM9V5yqMeoz6gVneX6E6MDc08qmCO8J3KwxbQDxV6dpEKJwRk3CKQbCuhdCOc
	shhHk97eaVqkBZA6cGHrbOtvBtDF5ycegDePSuZ6LrfOoDG0Q=
X-Received: by 2002:a17:90b:2551:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38754ea756dmr4313000a91.3.1783413948485;
        Tue, 07 Jul 2026 01:45:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ALSA: mixer: oss: Return -ENODEV instead of -EFAULT in snd_mixer_oss_open()
Date: Tue,  7 Jul 2026 15:45:04 +0700
Message-ID: <20260707084506.718583-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707084506.718583-1-phucduc.bui@gmail.com>
References: <20260707084506.718583-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in snd_mixer_oss_open(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other unavailable-device
paths in this function(the NULL card check and the NULL mixer_oss check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/mixer_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f5bcc7896542..3a1dd1edd26d 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -58,7 +58,7 @@ static int snd_mixer_oss_open(struct inode *inode, struct file *file)
 		kfree(fmixer);
 		snd_card_file_remove(card, file);
 		snd_card_unref(card);
-		return -EFAULT;
+		return -ENODEV;
 	}
 	snd_card_unref(card);
 	return 0;
-- 
2.43.0

