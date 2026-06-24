Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7262E736B
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290238; cv=none; b=qXkeKBRg2ZK82wrJMHSXFaJw9YIfbYCbkqHFnFCh/VMa9SeY08vu0/GZXLIdoESyTy9ge+eiR1WxCyk/tMzP2wA9rXpwPU/nQb+pgQwNztQF9Krw2ePP9ILEHu0Hql45PbeazvkO9anWcEUkj1EcqFdgIfZmdB5IQRKO2iM9dZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290238; c=relaxed/simple;
	bh=he88gpG0jTK870kX2aaFn6iF/21ycx8BCce5aacPgz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rTVP60mKXqKsgvAfXNKQr0bM4VRWmChi/2IBIZaosztpIuJt1lKKYdnbVmp6g0UtINib15ouKPYiMH+TO7cY3tYULoUEWRPCvmzT6TV0Z9zp/zwqXq0+svRLXlsovmK7T4vh6kBlVSLA/yjiz+lXI5ZTD5d5MXRQADYjNWedtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=beGsjMum; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="beGsjMum"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso5012035e9.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782290235; x=1782895035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jD0yBLMi1WgsXurx9iE/PVJkQmjsO7Pghg9IxUVMHWk=;
        b=beGsjMumCmSDURJInT8jLDJ8eUFzJdNEpTIaEmZYqXMxnnfcvZAYsfk2CH1JgjuC8+
         8cp5XRiihx/JmF7zHD6ro8TEv53RraVq3CljguEmci7LeJZ3vTuBSxXTaiipzW2ItoPf
         cYpjx081QcxXL6cDvyAGXkMNdvmF781qoGqVvdtuPtRWqGlrByXWIUwI8BI54ZGPzMEb
         5V+Q9A12Xo7SRqstXeUL3yoW+Chq6/h3Oj8y+NeGBmdtOpwQK7W+k9usKMzY2uG8jwO6
         kAZUlLQaKhP951plrucVyF0shUmIJlt37pFpcSXHY0TwF4MLSN+p3l4D7IKQy0O2gTqK
         d1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290235; x=1782895035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD0yBLMi1WgsXurx9iE/PVJkQmjsO7Pghg9IxUVMHWk=;
        b=sTFsUH2PwOZf8SYLr7T9SvPIruZvLhFvhQUwJsLapHTB/3GSukUdg/yNixXrMreB4m
         wBfln14cjN86Ve5Ns1UoW8MFkPgR0nKMPJCRHVttRKprR/2NW0iaqkr46mZ1vLiOanI2
         iWytFxJL25JpEjAsfo/QCxFW9Ozrw8qKOBIiLLuBNcBbmsATAJtQT8pvGgPenU7U3f5p
         vIfvCqa4YuJuaH1pog4iU1l+o+qoHQj8l/g7crMHK4mWEjdf9hFMOyDa0oEP9Re2hZqs
         CjPCTXIy7tOS2oKGHfCUin7fA9sfCbK71ssdYgRlruRNDcDo12yGX/JOctw0T7Ll2K3a
         28Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8mCcy0k5QyBsjpXakiyXKfTkg3tgr02QCGc6TkuBK71WV8pYn918Ihlxlnt1mZHkOK6SNTeUtWzFztQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxm03tRteSv/T6KLeSW2MTMSAgtkWHwB8FYsuA9CQ7041Ur0Tv
	2KFCD2lt1NVCNHRCd1Rqz0xP4eNrWN+8u54ROoUFYrx5BhfoyL34b+nZS3KyhW0AG2E=
X-Gm-Gg: AfdE7cmke0q6ZkriaamuS4o2dcq61K+B2TpmnNQ7So3Ec62P8uW1IJM+lfFYmOF0GwP
	R2IZOQOOalwtjQu8eVdblnHZm4cSWf088rPu3hsSmy5uWVbLkZvxIRn+MMoaoj9haMtHP2l6evp
	vKGH62X51vEbLCWE15JT7HHclf2noin5I54EZmyN7HzfIQoGrA4H0uZL2bvnFXJ8CPKPlaNsrRp
	zQAIgWWOA0KcthG8XF1Fs9TXhem9bM1gfgvGI9wUbN+A1CejYARDclQpOhdKx++b6e5he2zymwC
	Z+sJdvUsk7D5a4NS6BR7RURE+CAMEGXH3515TyMl0+LXKDwciEwUdHyj7n/3p/+P5hk1nhCGmY8
	+XX20ic2GRPHdF3OYCZXWBZkzGoqa2MrxSN9xk9qh0FAfTOoCGkeDMq+c8Viz86bwB+P9fjsUjm
	wibukeQKIpaQsZlUWVVfk+chPAoe9O8jRTa5KXoxNz5ALi6JJ/CIvNxjG7FhPddEtdGgO7f/SeB
	2AA
X-Received: by 2002:a05:600c:c0c3:10b0:490:c2a3:23cf with SMTP id 5b1f17b1804b1-4926087abbbmr24473415e9.34.1782290235329;
        Wed, 24 Jun 2026 01:37:15 -0700 (PDT)
Received: from localhost (p200300f65f47db0497adf84f78eebbb3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:97ad:f84f:78ee:bbb3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fe7b359sm418072505e9.9.2026.06.24.01.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:37:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
Date: Wed, 24 Jun 2026 10:37:07 +0200
Message-ID: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=he88gpG0jTK870kX2aaFn6iF/21ycx8BCce5aacPgz4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqO5c0zoOeNHjkiDlCr6YRt/k1lUxk5W/gh5rpG ETdWZDOavWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajuXNAAKCRCPgPtYfRL+ TpUTB/wN9y9wbKmFUlmeGAAX4C1nm5ZQ+AOiPMpZ2YHfyme60wMYfbTK/a7sd8abF+2NFyZiKsL 57cZjmkizh8C8rWzvpHY9CuNx0FTNOGtGpJ056qNZv4y4ObzZ57QFCRq7H9QntvYsneOu1l4dVa nnxCVGVLdveudambxzH+kSghZF3uK2x2LMW3jhK9YpCbRfhuys4HaqUNtsp5Z5LsIojkApAN7Sm AK9/bCDmZFJjIAB3RwY6vEan74lgpUcqWaxLOfMuNMGUeWgRNeZPHFJBl2fTrqwOiLHlBtH32sM LecLWggGNYYP0jwTI3wd/q5qxfh+5IWikLgq4vFy0Yr4sGyx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently that header is only included via:

	<sound/dmaengine_pcm.h> ->
	<sound/soc.h> ->
	<linux/platform_device.h>

which doesn't look reliable, still more in the presence of the comment:

	/* For the current users of sound/soc.h to avoid build issues */

in <sound/soc.h>.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/rockchip/rockchip_sai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index a195e96fed0a..37e81d56bc16 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
-- 
2.47.3

