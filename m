Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A53B8958
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496909; cv=none; b=RTMRndUa54vDMCTGoCeOCXwo652wtJYnmxSbsIIhMFpULZ0ReXSk++QsGQqfPlwc1MOo0L+2FWtTbiQmlcKpQmQGQ2bVDLCOOpQ0/yfvg5Fk4/1dGL/q5D33D23CElup0eNP1hEXhZot/5SXXWT4hVQXugOmpzzk1GaHp59FH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496909; c=relaxed/simple;
	bh=d8YODbCvgqd9DpZ0ecZ06EmJBcn2u57NaW/aAWCJkAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUzsd06EzDagE4PXnlLUtYbLkoJxCGxCNJMN9CDiQJxxN76ZJaNmXaR+nnpShuU5WMTvYqFC+UNYZdY0hjvR2KK4eJDCpf75LskeUGQ1c7fIPNfQJrkROMBz1fpNA3k0sihFefZaCGwP56zm3cUzNvMhwk1/IEctIsRxWeNbL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CFqVrvJc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CFqVrvJc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b7866869so10668015e9.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496906; x=1783101706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiJAmhfquD6jyQxcOXFdCz+GOW+y/H/SPTSBINVuP4U=;
        b=CFqVrvJcdpS25s2bAowG2zhxhRzsx5rPBTK6ZPfz6oxOlBx7Kmy/WMhstx6T4LCkqu
         qbfL7FojfKF4tkF4gXTzlBzzM1iOPGfOKRs2M1W+Ok/WQP84+pQSd5Acq3Bm9xZ/KDS6
         iaeIsantVX2oh53vPRRsDUcSfurF3wD0Qo0X/7ghrmX4M78dyEOhRXVMF/9lHuoMsiiM
         bdgY4pApN4XJ3ECkTGX2m86NVHqcQ2yRyoW25Nv1/DtYFaVwGoShqQeBDjvTiRqXZI4D
         raTzTLNhDkf9TPnyz7XnK0t+XgdkPs1w8nzzN8Qxo/FAyUYpAsDohTt7iG4wjjZ8znBz
         l0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496906; x=1783101706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiJAmhfquD6jyQxcOXFdCz+GOW+y/H/SPTSBINVuP4U=;
        b=X5hXv8TCQahgNEFvJrxwzoxoi4BfsolPlEoeKsrRQtCIZFggLvN2hRP3kVxcTfTJ80
         S760tp7TTxD1zF5Kp9HOgfbWEyorgEUoEP1CW/5h3b8pTAHPECKYjV9jLZURccg2IR7F
         sa4oA6O+JZHPlmUcK4H9tkbLUJL0GK0F0WCeOX6lEIYJyISvyQwBXNTXeq0o/PGvf2lf
         OtZ4F69fxX+EA2UjVlBKsdxcE6F6AVmnDIE7QQR5AbwMZLFTVe3tQZpLk7d4b2kJKoz0
         j6It5U/dfaiG0A/aAltVlTcpjKd9h4LDGlWShCQ96scsiB5GWP5gmp854n90g3zvanxY
         zkEA==
X-Forwarded-Encrypted: i=1; AFNElJ8OPYMX6L+yGv/14CbfW09butnmAFP9YAxLnUPY/gEdYSJH/H3zxhdpLXlIqXrIEeq5cd/EoPJVdgEEbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEHvhGWbVmF52khtwkWkHOLNUQzlRrwiywEsQ2vCOU8cVMWIw
	geJ1D07+DlN/yz/ccFfiGsXW8MvZdInZ/Q82m58fsmsf9p8/ADOMforeBVWxUtFOkbo=
X-Gm-Gg: AfdE7ckfzmCGJ7CI5JY41NMWez/LgNd/Mu0X0hNcXfHeJgOt8wdWwXBbR8sSy3o5B8Z
	NgXlt1OlMndjcx+JcBSKHgC34uikIrHEyL8ccNneget9NAoI+8TxbZH+Octl41QvQ8qk9kkVELi
	GxZYDF0IW3S5IPX5ZDfp8efNa4hoe2MFCoarrtg/cjv5evhI7B0DPGt7tFK6DiSEalHQT/xOVwI
	cRI5bhuX192W1Yu2vYbUmE4UX6mcBHqz2LhBfX6kmG2W05+FeyNapQgPGFlJXIB7keJVhrz2xx3
	G79fb2Ednhp4nWQ4DPKyRP7I1G/ao9rcMK4OIHFOYfA4hM6AMirJB7Jgks5Ml0/L+e7rEH5Twwv
	T5Wa/Kz3uUUbqCu6hd/53sY1nmZrKD6aFyG7ocQwoYUZjysxdt3VMjkq0vsKj/HH+5/PfX2j89K
	847MMge04FBMGQqZkZOJGGpKDivcUxfk1UyHl4+jWMFp9LX9kMVeV9A1yW0Y2ABTW1ekZM+fa4X
	blg
X-Received: by 2002:a05:600c:c0c3:10b0:492:69f9:1314 with SMTP id 5b1f17b1804b1-4926a713d2amr50569045e9.23.1782496906238;
        Fri, 26 Jun 2026 11:01:46 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49269009163sm104324875e9.11.2026.06.26.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/17] ALSA: hda/core: Add include defining struct hda_device_id
Date: Fri, 26 Jun 2026 20:00:32 +0200
Message-ID:  <1da60e376d9ef64b79d898c54fa58fef53d8168e.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=d8YODbCvgqd9DpZ0ecZ06EmJBcn2u57NaW/aAWCJkAI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5WJOWNS3FeteGuEoXQOJAfxYTA9nnbP9/rV sACq+0vrTiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+VgAKCRCPgPtYfRL+ TkWRB/9Ua8Aq6NfyVOj0S+/4W+W8VyQiK+4HD7gZQiqTqkE9kILftKIKD2dMhgvNtYKvK3pjbsx qSVUFkfegVwGXl99e1hjn+/jIsUuNjX/4O0krX7BVpiqZ/Kgrh1sdmvYJ9a1ouQ/RC8TiTdroj3 vIVXI/mIUrVZwrlQz8+gsGjQ8iiIBNCrHW56cSa4MlHaSeUqWpXl/DuX2OX7N65Dv9GkmmeIiWp X1YYLxpvNysc83/ZmjyInpfstEyWeFIkpebA0KROMh8HzS0fFusakW9iIiLGAJJ618DUblYZ5ea 2XyCLmgNfHRgWwPQa7Gh++/VWxekiIIZvH2eJzIIq/JhEeEW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Traditionally all *_device_id were defined in a single header
<linux/mod_devicetable.h>. This was split now with the objective that
only the relevant bits are included. So including <linux/pci.h> won't be
enough to get a definition of (the unrelated to pci) struct
hda_device_id.

Add an explicit include for the header defining struct hda_device_id to
keep working when <linux/pci.h> stops providing this defintion.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/sound/hdaudio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index f11bfc6b9f42..e268ff9e9aa0 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
+#include <linux/mod_device_id/hda.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
-- 
2.47.3

