Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B23DEAD6
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032679; cv=none; b=lZYAb6HB1821vzuN4YpXpfI5e13FpBtU/u47+O5Wk2bFuNc9F4xkuHCARDkGHdrl7t7qMnUNp5WBh5ivtwUxW1lehxWVxFkycXuHcA1HcDB5dT3ogXr3NI7uGC1C/iwvNUNxTrGr5p8Ocxem/XDSQPhdmk07i6PZftsXHd1tFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032679; c=relaxed/simple;
	bh=e9jjZAPNzrxWW/JlkWDVUF/F8+yzODdFPw7fP/04PhE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DsOJlcyqZYpvLgj5znhtV6+wM2/pu44FVeEil0E/3F+SJPURDRjHfLceXe0yMaDbS1ak3TKIqVftHRdZOBRSgQBbfkrvwRa8mjE5gUL8N+T5hK7ek0PcLZ9y65WDqocjcH27qgu6Mltt+R+mH9B7we1kRFSo+fuTQgHf06+IHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+iX60ZL; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+iX60ZL"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e51d8d400so329565485a.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032674; x=1792637474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s/K9W0bzEgXYrBLh/pWzV43lciN42ZkCpUYTHPiWIc=;
        b=I+iX60ZLBuN4IyG752jzqnBesrQsUlMlgHIXLMMKF+QFn7Rc6oidrxclU9wqawt+NN
         dDXHy5AdGU5m31Ve6gVBLy+eMe4PNMVAK/FUSPouejgHPvVvcFD9Lqz6vAVGiRBwjS1l
         hDQ/6/ngeRuo4mD9fBefVN3Szv64J6kL7yVPEeNAQtahbffEjdoIkpftuWNPNlorUojl
         jllrH4UFfvuDlAI2qTTR5B6w+2oZpYE3zHZxQdi0yXwy66qEkNgt+IQgz5bs9cINNvZE
         vc40KyfCVsEvt+bDmmpnt1WYqCitQGWgQHmgOr+W69Y+XKWnWKdJiiEQ/uy4vf3CLCaT
         Kmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032674; x=1792637474;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3s/K9W0bzEgXYrBLh/pWzV43lciN42ZkCpUYTHPiWIc=;
        b=LMHLvlTdF4HAD2GH6AmzklKLmgF6jXSMJJvsXl1nPsU2J3V7r8Mbw6TgY1juSUuN4O
         s5/OB0qT/k+ag3Bztz5G871NhgDsN+L9UkGxzF6crvRJYmy66uBdbkSTUnqcCxLiftH3
         EdAiBT1nvDvC7GRgkRqN7FFpcfqiw1wrgoHnAOe8rFalbLJllU0EQ0QRgixJ6XcSLn5I
         RAmmxMSFhMV2BpkqgDo4CBI6MhUrM62ltPgtQksH+2bk+2ioqq3sp+6fNrR6skQ5nvJf
         YGPq9e3CYw2tAj92UZFjIsRvS6K1KT38sCVl96BpGIAyFi05jmFDyBYkfFZ+jD4nS+fh
         Xjiw==
X-Gm-Message-State: AFq9FYI4m0+cQO/5yfZiCK9/FLC03aB3Y9ePczjPqWbzmWogtjRbWKir
	ZAAtJdkbHLK6su9+a4EG4RseOyoufDme7DSOukzomMp06Ek3RaDhiUY=
X-Gm-Gg: AYBFou05S+5nQomturhT4xVAPZDJ2MgwJbnl2f8AW/lLHfaLSeSwaQbGFnMeV+/fxpL
	+9DG/A9CVtFTxsWflaIV2kbvgVkfJk5GK8JBXyiGCLOumUhTAMCZnslD1EM8UhO0zxArVOVfsse
	k4Tnnafb5q+z6YGilDiZE4JWsQ1N2l4dIZo7wSysXk2KjaZvd9KnyqrmBurnENuGX/r4ZvpvfRz
	mStkTnvEhIpSwI/7SoeTR+kOQ+z6bTt9+ntbWbT15DwKVq9Q290vFLwz6QLnlxPMRKq6+XleDIo
	XzD/iY/32h0nMSX6P8FQSjzr87YMXkyLnfq1ayH8SXPwT52eT/zBZ1URyRJ10wfrGAajuqWfAGM
	bjZIxP2mGBjEHFWkqlo1usMXmjmkfy+jWYIZGcCZY5yIf2vKkG1SwGm0XR1jr0A0FZRT6M8eIcQ
	81tpANhqY/uDrLHh+M+3ez07pEK3a18rGvWHb9x7HqyCURa296obc7pfO71KcqqbRBCFUaocel3
	KWAlhZ9TOXK/hLXobOveVb338GkoxGwGe7XZ7ybDvBcoFIJKnmcyXZ2TThO25g/LhJBEyxZODwI
	wpGUlDgXompJnx6mjyzAGSSf3SDo
X-Received: by 2002:a05:620a:63c7:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93ebd274840mr2644083185a.56.1792032673996;
        Wed, 14 Oct 2026 19:51:13 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500643bsm654053385a.13.2026.10.14.19.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:51:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: rt5645: Shut down the button timer on removal
Date: Wed, 14 Oct 2026 22:51:10 -0400
Message-ID: <179203261324.2681924.5002100194676410503.rt5645-button-timer@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jack_detect_work can rearm btn_check_timer, and the timer callback can
queue jack_detect_work. Deleting the timer before cancelling the work
does not break this cycle: an already running worker can rearm the timer
after timer_delete_sync() returns. The timer can then outlive removal.

Use timer_shutdown_sync() before cancelling the delayed work so that
subsequent attempts to rearm the timer are ignored. The IRQ producer has
already been removed at this point. Keep the restartable timer deletion
in the suspend path.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 7ff6319e7da5 ("ASoC: rt5645: use polling to support HS button")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 sound/soc/codecs/rt5645.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7313ea7..3c4354d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -19,6 +19,7 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -4292,10 +4293,10 @@ static void rt5645_i2c_remove(struct i2c_client *i2c)
 		free_irq(i2c->irq, rt5645);
 
 	/*
-	 * Since the rt5645_btn_check_callback() can queue jack_detect_work,
-	 * the timer need to be delted first
+	 * The timer and jack_detect_work can rearm each other. Shut down the
+	 * timer before cancelling the work.
 	 */
-	timer_delete_sync(&rt5645->btn_check_timer);
+	timer_shutdown_sync(&rt5645->btn_check_timer);
 
 	cancel_delayed_work_sync(&rt5645->jack_detect_work);
 	cancel_delayed_work_sync(&rt5645->rcclock_work);
