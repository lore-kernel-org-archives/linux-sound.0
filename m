Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB10384232
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981942; cv=none; b=Jy+reR0oKDmtNJ2mzQHJll0JpXyIJs3kAVEHv1WPkDvZte6G/0OAQ49dDdiSazd4Xt4QznqZlGIo7kOfqZH0Zn4dA0PDVoA2SuExirgzNpHqiiIB1QaS2sCF5A7xO6BaqLhYL0HzQAHpmhrlxrNYamDy/lHyOR1mjS4QoCvjJkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981942; c=relaxed/simple;
	bh=pQdclITCrFKrWuBhPVXavBjH7L6W21nfFdNXAS7DhUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVpyIRjfDhXIMcEXx1GbsloCIArXlqLpdMzVLdz3yGr3m7D8G/k7JOuC9FCWq8gRctZM++l7YLukGPY7NKliRes70VvW38rhfkcHVXWhnEj+bSRTYUu8tZqJZi064F2rjL6SJfHF0VmfEftDETzULviEs3K8NUWuKfg4bnzg+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC3WIvBn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC3WIvBn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3804fd3cf71so946519a91.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981939; x=1783586739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk2/IDVF4TVSmwCeh17TD0ZGHM6fkDDuMvEwZIMryaQ=;
        b=SC3WIvBnZhgNLkQSY86+Wed4VXvkcXRBkkLm3iJQhmZ10dQiUfR8td9pguH2sSFOyd
         KRTTmJjSYZM4owGiNF2EzIwHRDBeqYyGuatTicHeAlMmDuXChRe/a1AwfKCdmgufjRg7
         ZSEPPVSR7P5+2xVW8Lomqmlu4V+hgO/vqblmwa9P8A0RGbB+v/VtjGmrztO30lqCaQZt
         KZmbS0VKR116qbavjKf//NYLD0qU9CkWSh82d9woGTKIDA6EU0D7EhrB1byfrBokXzMo
         tLGE1N8EJZvaeAKvCdX7CR/8x3uQa2Q+eVKtYcO9L60t+KQYgK38rPbHWd7YOLll/heN
         KU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981939; x=1783586739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vk2/IDVF4TVSmwCeh17TD0ZGHM6fkDDuMvEwZIMryaQ=;
        b=LF2s0XMey29by/aIiCd43MZ38w29EcP2u0RchmdveD09Ctp8h9ZwDh68F6ihFP2TK/
         Ph69P+6JJoBfULm6xH21U2FzEeCUyabXXUNvyKhRbd19nD+4/OHOmg5t0t/XFd/eERQG
         WpcvlKGrkS9R1SLDN2r/L5K4hDAwh1IopsUT1t5Q6XiDdjgEmTLozimkynD6A4rwYs/z
         +SNd+v+rbolUtFELYjaKdjpie3bLnZybNKna5eqqQX3XIcK2kKp4k+2foHVfLBNJH9Ta
         34Efz/PvBOzALnqreeKG2zkfqQ13eN+w3Qk9dpD4gL3Aj8Z41FE+DdrKwrxzp6X4SrUJ
         bVLg==
X-Forwarded-Encrypted: i=1; AHgh+RperBizGAQz1YNnmn+XUYPFs7v+LZiK4RLNzRoR/YUjbZrg6n+S5Dh1cjn81xWdoiky0Od8cFJrZ6FFHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6PCcLkoBMu1yCs1BTmh1oW3GmEXh+Rm2nzcuuUgTthd2PFWh
	vRzh+vMNBQND5xNGZapLRiHIPuPRmvK3vGnp56jb04xbGJSxPcwV6//h
X-Gm-Gg: AfdE7cloH2uijoulKmw1yTLOqIZd3tPS9j0P5Ce0iPW/fYYJleRAcTZnXcGorPdFUde
	oDhk2JUE4I+eAdrwQO7cmaXgnPXi6u/7Vp4cfP8GfA8QUfN9UUXfy2b0NfYCGoZ/kXNGCat/Ltx
	frj1DMOP0hgw/lujuJ8MrdZt9C3Uway37LilJVGC8lAgtjA8wKXrbIcBcAdqnaNAzzcv0TDaFUz
	+f+YI56SIj/P0S1YfQnvg7vZGhmNAWgoJyTHwnxykgcU+3IIHVzdBtRzbUShon6BSpbbEjRxG2M
	blKgg7CoZJhvo0PC/BNOPzRK2DNA1KonRrcsVRXX7I9v8u7FzPo3/OSaRlHtHgM/09e3lxirXWE
	zY7ktHlDN0Yl9cBykKQxQE9lKcw2QgPDjTNwhu2QaKrRywM4iIwUkoOB18/Gd5e9rzwuo+ZsXTL
	nYDkqHQEYLQSHxVrrddXkCPzr+6Dym8bfucpKHsEF8K+Viz+w=
X-Received: by 2002:a17:90b:388e:b0:37f:9ce0:af34 with SMTP id 98e67ed59e1d1-380aa222e0amr4901508a91.31.1782981939066;
        Thu, 02 Jul 2026 01:45:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/7] ALSA: rawmidi: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 15:44:42 +0700
Message-ID: <20260702084445.519669-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The previous conversion from nonseekable_open() to stream_open() retained
the existing error check.
Since stream_open() always returns 0, remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/rawmidi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 4dfd9d53e6d3..789254a88e53 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -441,9 +441,7 @@ static int snd_rawmidi_open(struct inode *inode, struct file *file)
 	if ((file->f_flags & O_APPEND) && !(file->f_flags & O_NONBLOCK))
 		return -EINVAL;		/* invalid combination */
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	if (maj == snd_major) {
 		rmidi = snd_lookup_minor_data(iminor(inode),
-- 
2.43.0

