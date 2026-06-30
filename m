Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7223F4DC6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811546; cv=none; b=pgFPrvisQoFF3TyRo/8V4gOpITcUvqCdlv5JY0dLuJyeDpwZH7EUnhhrsYe2ziDqpYehXA083YxwqczQv0Du2XprPbIJBSB3ZVpkybxWLQ831YSfXx0XIVNK0ABPUj+Ygvu8ZM4DXnXCAVQZfZxIHVhrfx+PVlja/xwAAIw3768=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811546; c=relaxed/simple;
	bh=eZiIYoauFR0S5Pv5ozC7tjSH+NQaTcvMyl6TtdKObdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLyA9UL8YyU9+WyfnpyuM8slyK9cFHgGlMA+qWPLUDUDqmGL+lzho/hdcdtL22F1b9IdQE62hbVzJ9nj+wkmQXx1loA8jszDuzsdKn0NAKbcGaYR5iwfeVj1QtJF7jPd4NloGEvKZlrP22eb6Syth/xU0MWEhGpgUC5CqqSjJuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pAVGmS2K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pAVGmS2K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493ba701891so3366865e9.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 02:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811543; x=1783416343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAjhS/COqLtvcZj1Fqx19sywI+eIhpJuSH2R68/3Jjs=;
        b=pAVGmS2KIFhyx2yFtaIqewqRbeQ22hVoShwkMdGA0ZIFDfBXMlXDUOeQXgtpsbUMzX
         JGHQn9HOR/HmkhFb8z1EAtG5GkFDDZFtKgqhHzmT7WvY6fgZ/4ZBnWj+nBD5Zky3ed5y
         b08fTRbUWJWGaijqAnE3dISW3IRFiLVmI+gs3W59C3rYrCWl9CEAyxs5iQExNfuF5bJW
         Fd9OUafK2pwk6O6GACSbKjolVAExVb2bgN43pAJgSN4KkxgS8dAc7Pxbc/9q7k26vMke
         qI9ZHN1mU1mNhZPeUN+bqWA4rhkuhHtTiG5qtDcKGCQmXhB20LnYagB38scFS0CCRZuJ
         KpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811543; x=1783416343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAjhS/COqLtvcZj1Fqx19sywI+eIhpJuSH2R68/3Jjs=;
        b=d1cdTY/3/MevsgfvWYNJt9REI8xauuSNV1So7iLqzQEGhfaDGkzucuykVpfssu2x2G
         Q35SGZQy/nCR8IVjoVhxWJSyvFZkEYFpezF0/tf86OBG+gAW72k0w+e1fufOV6DmRo0p
         OLoU+V3gvlnpAZX0kh32Q+BUP4djiQhxQfzzQqxaXA5eLZxPdut4unLZiBelXvt72fn0
         uW1QB7pu8JfFHGRQxRpfUrKMWYKYbOx2t4pHAl//p8FvMMW/c3OHicPTh4LorJBCk341
         y+WDOCdDzNRL8bKaYOsH49x+Nbz6ajy1RJqYZ5ga812FSZ8hsgEAWdN7wdjCZbfJndsb
         UtLg==
X-Forwarded-Encrypted: i=1; AFNElJ+f2rw/ouw9nR9Xqkxf4gwUaR40J5MZOlnKxQFGsd+IL+dSnbxWiouTSsUDSt2SMGqBwhowscO6DT5vGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE7MHS65WEvnkwQ8/Ad8pkX17/XBARCS9C2WyC8QY3fIIf48v4
	+OhK04xzabVrN6QxqvzYCI18riNuFoxIVxsNqOYvwSK+vur/f82+joTInQY8aauAHMc=
X-Gm-Gg: AfdE7cmjeFBBeYpJXCCgLPQw5rKjvwB8wceY6ewEWQCr7F+LOWE83yZiRvqM15LjzuJ
	KuA+gOOmIGBLgsm4lJAzYh9lvpWTh9DNc8EahrceGjZo5uM/TvCrOYoIdfs5aGBhssXtLOM0sEg
	11+aQ5uc1lc01vNuMH6LmlgZRb1vGWsCMg8r8ihBwxM8aOFKittz7ArlyGUv2JA8OynnHiWMUI9
	fYwZGtOrh5z1Whd75Cy6Z9Hv6B4gc//zo6fcUUL3P8dNLeu11dyviP7VvbORUhnEn/A8dlrbRty
	5QWbZclBFYP/0STIqvypsdXRi1su1RfDkHr2Q2seliu5ZmZft8PTN9dIsvjKLPV+/VWtFLvS+v3
	2g5hDxXbs1rNJSswXalKHO3nzTj07/XqZwt4tqH9nusPS4hDar0jDJqXmrjdLF1XLiy/EpG/DC7
	0hB5Tn4RfanGtIYpA7exgtfma8DHt9P+x3LW0lCBHdyT2Uex9MfBNSnfYyyIlnNwt8ESFU3rSLK
	DFC
X-Received: by 2002:a05:600c:3f19:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-493b8289bc8mr43558695e9.9.1782811543338;
        Tue, 30 Jun 2026 02:25:43 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bc19f4b0sm26282905e9.1.2026.06.30.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 12/17] ALSA: hda/core: Add include defining struct hda_device_id
Date: Tue, 30 Jun 2026 11:24:31 +0200
Message-ID: <376883bc5889d5cca01efb6f8d4e07a20158f2b8.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=eZiIYoauFR0S5Pv5ozC7tjSH+NQaTcvMyl6TtdKObdg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tncN0VLB6L8UsP4kKGB8hQsZaca83eopfGE mCx+As6ddyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLZwAKCRCPgPtYfRL+ TlwlB/98dBnvNEzsn6EzESeSrJO7d4R677qthIVfvm/5ObxixtPhhZrtroTRXJYm3Z/jo6YaL+Q rpcgkrNSCWLoormPSEjrsMj3K9Pkk9wHyZlDNu1tIddTTtWQl1INtfng2QaQs6nREkmc2sxNeYa guMBSoOD5pn9TyOXvFoQCxBor/xzbpBSLBMrAe7UJKqJ5lOV0zW20gIEoRPP2DpcSicei95L9V1 YHW3gtHA3jna2DsLCiUZjs2EJzk3r/Fmx3rb5/tK4AEhJrZIapKYBFwkqnBm956s4qXkC/NxT/g lKpLCjWDihpHiUQaDWJ7owTlrnKRVvbuUOAzdL3WLcOF0mDo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Traditionally all *_device_id were defined in a single header
<linux/mod_devicetable.h>. This was split now with the objective that
only the relevant bits are included. So including <linux/pci.h> won't be
enough to get a definition of (the unrelated to pci) struct
hda_device_id.

Add an explicit include for the header defining struct hda_device_id to
keep working when <linux/pci.h> stops providing this defintion.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/2e365146b67ced2a1897785fcc0c222c382f14fb.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/sound/hdaudio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index f11bfc6b9f42..aa994d6e6d35 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
+#include <linux/device-id/hda.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
-- 
2.47.3

