Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8523B95E9
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684010; cv=none; b=Nb7AI74OL0PItAKPT0JzyVcAVVpO6ffvULSQSTKTUmD8czLXydc72Cw/YULx8hG5O/sqaa4/8hP3/31fApejQTRrjekeZHBAprASHsBhFvxRFeuOzTwYZGumqRZ6nw5G5H0HUm0CWZWsAQI7NTw/gZIQaNsVEGb2bqC3w88nnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684010; c=relaxed/simple;
	bh=AD46UvG+cE/hidpXKMwCXaiQp2bIAndYSgK9FhFFvPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvmsksGqCBWXMYrf/P7H+i1OvwuPVtdZzjV8WTBQls//hqahhi8nrEs0XU0Wj9XsxSNWsD7n+rWHZphux2JHyLKXlz4GB+x8B7N4OYg6Lr+x4A4DaPBGsu4KOMi6GB5I+oLOA/SuN6BA9bHDYR6vU1lsM2S1dBXRWNB8q4CpR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Nqz08eYg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Nqz08eYg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493a623d3e7so3063315e9.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684008; x=1783288808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG13ABbELEOX1NZRmZrOy/aBHQYf19ZqD+z3zJcT5Y0=;
        b=Nqz08eYgDy8FzIaR4JPel4Tv6z6dMEahwth3EhjKPR+Ss38S99QLo8X5Y5aO5zzbS8
         1+iOb2hRYpcoKLrrKMkm+DIVSy7Xnfl8YoPLRRAZsCgQZVUmzipPRoyHTJ26CvLpIThn
         3LTZ6FYgeh/RBQLE5GfuhhdBdSpppNloA3HpAI7sFGATtBUgqfIZd1bga6O1wyfOnErF
         RHqVyyxG/dWZFPln+1kOvudjmyPpLgf5KsdO2t70BOhZkn8l527Qm7NYFMyl7wqh8SU3
         boiXfF18K8bBqFffGLLJF64s1KyVefwsB35agQZyx29RUwzgFHClccrDufmSmsIcOAjE
         2vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684008; x=1783288808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kG13ABbELEOX1NZRmZrOy/aBHQYf19ZqD+z3zJcT5Y0=;
        b=LJkwrD/pesCQ54bmDOrWj7TekB+4fkZ3rbvomZC5t2qZjhLOHQGkISEt6NuhVWnzVH
         lW56PVLrczW4skN38Sy7QrO3jmwcJ69roQ9c8Fg6gGMW3Q3me1zq7UIMsGn6P+tPDh3U
         TayJt7C6134Z7FynYjVgz5S5o0SLPsSovn45VzCbxPA6dp0jBe8ppYUDL8sqWMq4U25A
         VVOJC7sAyYF9X30KzYns8/DB+XQqCZtAey/XvqwJGZK1s7MIozOtRpRMzpoDbXdsl9HK
         wXWpkbwpf/2g/30ptsxJtitmNANutxeM1oDx3Zfr6EbDh34gGrRx43Z8rhBqkdjd628e
         2yQw==
X-Forwarded-Encrypted: i=1; AHgh+RoMlVWNmK643SOO3O9g3StrmN2fUdRwOLcUCQX0t5OyLpSNMFeC+KvOhl9TKUqYJnzS9BBBjBUB2NkYFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+iwx6K5KLxB55885VmxkPxNBmpFF+IlxPTgsT3pIDCjmBhwO
	6CGZrPqfBTLrVj3O3YEmvYKA5jLnBREEPCtTSjzS8steCp1PI7cMteyz2DPlTBbAY1w=
X-Gm-Gg: AfdE7ckcfJOG/aChclwmD2C2eRJgoYVJdkg0yThsqrOxAaGjpK0JboUILOzUxynjkJ6
	V/79uAw8NSoKKUU1LmWwW0rn1PGF+peUE83PmMrLB45a5sZ+JEaTwLIlMYuVqrsQzLHydmr+7KM
	2bA8z4V/2QnHVf3GxL1LEbp0agD6KCkgfEqxluBs2t0w7XtDKxHX34Bx0cmeAvUK3m7RIKK7Dfd
	JHStU0MBItBHmQ6zTvTBb1EFG9mCEiJEc4Q6et9dp4FrgnMuIE/b5i23kolltRXVi7Zfv1U/pat
	3pMy0s5IdxkqVmh/DBGZgyoMuiaD55qDoHgJQob8ldG/dMlaSBSYuP8SrhG60SmzI55jk3MzN5d
	ZameFKCOLJ4O8jCA3FlkVAQrErAUJ7Tmrb3aP1X3nwx8zK9KhRa7/upVuo7kLq8sp5N/DxM8T5v
	MDAmvdIpHUPK7xUdQRWw==
X-Received: by 2002:a05:6000:27c3:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-46b70ea637fmr20231012f8f.0.1782684008132;
        Sun, 28 Jun 2026 15:00:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46fe25429d5sm23561839f8f.7.2026.06.28.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 12/16] ALSA: hda/core: Add include defining struct hda_device_id
Date: Sun, 28 Jun 2026 23:58:47 +0200
Message-ID:  <2e365146b67ced2a1897785fcc0c222c382f14fb.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AD46UvG+cE/hidpXKMwCXaiQp2bIAndYSgK9FhFFvPQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkwq6FgfS7nKxwwpKcgYXrELarkL00BUN4Pz vg2nw/6H6+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZMAAKCRCPgPtYfRL+ TvTeB/sHf6p7VzkXYLsBSPwxMgwK/WafkggSPutNN+xsf6szfYRqFnGRCR8GoH/ifydvpW8prwF 7w2jCyIikL57aLYbLW8JQGs19RAuAvnRDPzmdHbFP/TEvO1EsihKmjazSvORK5IT4w7lbOBKgDT 24GGD1mSm93+Z3i6uPPVEgIONCZG3Op6VoiUEiurmdfty/A4ucO+J9nvHhQ3wvjvS2mL3nGqB6A M02rN8ZiaGNUy+yWkpKiG2yWpVzcJesqw5RRN6ZnKuENCiuZMQ7hXCfXKlDJ+gnMJ7BL7hxFiwp D6ljob+G3jNUkAJKA58s+62B3kY8IbXPlBdSAgIH+YMhI+ij
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

