Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF844BC87
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981917; cv=none; b=dkJ351dVPVKlM4XAkD//f09+5NngU6tRw437+veveQlvATHorRLbliQ4Ug0e1eWfFQSnZqCjLVrjJJoDrUG4597wr7yvIdd1MSRCVBnH47jnjo2xgaex+qNrxNVJFAV1vUWHqa/2jwh6FoJRJ5LHAcUy9NmHnJcVSSvJb0aOyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981917; c=relaxed/simple;
	bh=S8Bw2UpqjmESQAg1b4cAic3zh6MyKya1KWb6+8hi1FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEAFB8H7y8u7vs8wMIMyS0lvoUkMaGpwUyqVxvW2+lv7N4icjqomHgkZ9MIitHuzNoRFUJNJ1IenztVI300D4gtXuPy+aMgjot5OoEgxx4F3D9yuAPfyYJHLMdvTlmCjnEkq0adDzxG3CZESs7Fn6FAdLWk6qgLooJLeEDnEcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6DhZrBw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6DhZrBw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381018b9375so44729a91.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981916; x=1783586716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBKe+awfJXYJGj77Gs3iq/FzziO6L0/JBuBw9UKg+bs=;
        b=R6DhZrBw1v4k/91D28D9C0Jm2EYRyEpfpVlCNlIYP4rRGbvUtzI7tJHyq3wJx8QrIb
         YZR54lV0I94ja5EtsJpmF6JKLBjUGunPs1BGkTFa5+guIs8oURM02SA42N9Ygj3ldVbK
         QRB2Dv0RzjXckSxNMtr4J784jEK3XtH1m7vpccSyPkN4OixE58GJFU9cURX9wi2zBMgJ
         z/diw4DUCVvueze/HU4ZTXNgMf0EqiOIVLDsO6V3e5omtVRvGHMu5FsShK3ENS7Zutka
         CAsh+S57Rbi+gPRgq8XwaZwpJmtO9RqMUuU5TswGwxKTA23AWg1ChMUF7ULN4BiaF7dT
         AK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981916; x=1783586716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBKe+awfJXYJGj77Gs3iq/FzziO6L0/JBuBw9UKg+bs=;
        b=iNS1Fv8JtXrUmzmw+XVu9fEGI6G5/4Yn1JuZch2eK27Oma5ZDqcozipFO7/knGHowp
         jhAIqIHcN8GY4FK5+xMeZcwG/X5iP9ukcOtJqUZr63s147r4lqtRFp5EZ36/a+MAOX29
         5GZ5Bvp+qSHIZgeP95jDzVgpnGTGe8Hdwml23QtA/OoqGnT6oQBinXb5HjgY/wJD/fst
         FEbTo+hrhzMYoxHRwC0DJK8uKuyi+VF3la37BZkJeFePWujMfYT276ZD+DBY3nwiYoiw
         qqba3ne3vU831t7RDq1PmG/D6FNxILv2QSAr6YPO/KjvBEool/YIXD0rKV0eo5Tj3kSC
         X2iw==
X-Forwarded-Encrypted: i=1; AHgh+Rr03yTUtSJxUnUnZ09OeQSWDCnhuRaUo2H+zEWScnY2HLz7V1vY3tEYyp4bTjx7uXF0EAq2wowQiMXRDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZMuCiwPFyiBLhnUn8eDcl3rcno9F8IwPA7BfgJuaMXdgTQud
	wg8fMdfrFfWXbEJ0a1f4zB6eBvK3OCyDSxsdThj4EpRESY7MQEZmz6HR
X-Gm-Gg: AfdE7cnNxlFrpywspb9mxulVpox5Uc6Uy9gCRMNee5e9HyFIfo1GsRftJyr5l/d0hz3
	rjfRskMatq+0SnW5PjstnrXkXixnbbwALKvIc+YBtXCliRsvcXGD/HLFkiT+PDrh+h+9bEN6z+2
	s5H5r3THeXTeN/mD/keXK6bbfQZU/76HWvrdG3p4IKAdEl227D1tfle+qksI+0biJiIjMxasRzj
	V8Gw0Sf3wGGT9VOG5G1xzvdNw0atUBjTc8ivLwXVZ747Mh0sQyL5xhx6IGmITvDa6PsVJv1t2Sn
	8MBrMJiCv/LY23E2jkDJ3I1YRSb1f4kmfaX/fI9vaiIu8tcJ8alaesuNzAd8JUpSk0XUJEsXRga
	59LLe2aeLCczXRBXWgytyXA75Uhh4EzM/1YFPgURRXWaC8NzEyEtkFhaG/nS9QBEdfXsx9JgCAA
	/JwOLVpxvIsoWe4XWyPWW9qG/VvyGauv6VIDsVpDA7kct6FWpmUOSmD9HuXA==
X-Received: by 2002:a17:90b:2e45:b0:37e:9e9:6ff0 with SMTP id 98e67ed59e1d1-380aa0bd330mr5314739a91.13.1782981915864;
        Thu, 02 Jul 2026 01:45:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:15 -0700 (PDT)
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
Subject: [PATCH v2 1/7] ALSA: control: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 15:44:38 +0700
Message-ID: <20260702084445.519669-2-phucduc.bui@gmail.com>
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
 sound/core/control.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 7a8dc506221e..037e455bb11b 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -55,9 +55,7 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 	struct snd_ctl_file *ctl;
 	int i, err;
 
-	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
+	stream_open(inode, file);
 
 	card = snd_lookup_minor_data(iminor(inode), SNDRV_DEVICE_TYPE_CONTROL);
 	if (!card) {
-- 
2.43.0

