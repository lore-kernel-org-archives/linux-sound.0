Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C02609E3
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413943; cv=none; b=LorizCANnRtowC+JzdByEXof9tFUPfFWTFlXsqyTPtBtZ5c4fh9xDIE8UWoZoOeEB3FKhD5ZKD6yR2WpPd9uePIQ1Zf50t7KsiqWGTzVhUmyqLWntsCSlJc4HGqYQm/+ryTSlFRDF8hxfOZP9C1NLT1vtn7V9oYUjY0T6A+MVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413943; c=relaxed/simple;
	bh=w24kCOhd0coL7UOZzJIQAkRBP5LzvS4+x/myXHiLLnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtZpyxocyA60tUBjri6sh8npWTkFr25eAN/Q1lpsi9wxrlu7lKSX8Hs5kiKDIbc3JJFdfFgwY/OGbvag7+r1RbBfnK1nvkuBgYRO0V3nRh3bL4a6YPf+Dqu4REFnIAZPIAIHkRXCZyyEo4RICloI9ODAdgwcUHIEO8nMme5SyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO7Q16kP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO7Q16kP"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso2018566a91.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413940; x=1784018740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg/TjGf717Hj/OrWbBMOEQ2vxvsdop73pQNz4dt05yY=;
        b=hO7Q16kPZYXJMhp1Fi21gJ8kRujZhDgULCL9UI/35EXzQ6M0p7PdLEXKhPW4m/CRGG
         +53qwlcsRr6zZYrbnVOZJmnenOFiTpRSOFyc5OwulHH3XS420Yq8jl+5T9jeoVe4ZCVL
         1FJKtjRI0Hxy+snLNURh2J+DZ1o93YOYlC3aC5T47vUhWUAmtOY6Q3Y0WV09yPZMjvzc
         KjIisLP26cpyRMknY9h1qKwd/sruaX82kdGJavXZWeso1dJFpsrOKgERH/3Yro7Ibwzh
         GwcEHSBu1tGZ5poDUQwAFITRSBzV7fNc+dZ8GNh1L+2BBc/rU7KXk/qfa/3WsrrSq0TN
         n36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413940; x=1784018740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sg/TjGf717Hj/OrWbBMOEQ2vxvsdop73pQNz4dt05yY=;
        b=N6hKSh2lIHWrSiqZdB2XzwVVtmBKk3PWCbC87ab/61k2JQwg8vnPdP8gVCaNqiYaUx
         eg0MQCV3W0bPGeKxj/0+9E5To9t5mJyn+vqA5LV6JQJsOz/ArS2QHEkXv4Nm2/vDjb2N
         XO63eQ+XvxkpN76oVuYU3gZWgQT+wvAYQ21l9NyUbHbGjWPHdHCdE0jCanSlnSfnwK7T
         2yMFeBECpNLCSGMf1OXuT1CUseYPoWHVkaDaWFKetrXm3NDkT9gi5PlWJ8wfSDbtXS96
         xQNTdtYPLXCP3Xr5lggSdpMndaG5vbYkjad0NJVs91Derjk2gO8iCYjGis6W35iLjW8f
         PtZw==
X-Forwarded-Encrypted: i=1; AHgh+RqHgFO7wb5Fjm/2xJjNCvY1fWy7bPF8wrRUp/6IBP5EEivynnsGhOpyUec0lw7EW9+aBfC789XVwzHE1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSt9v6BZfUXJUFb99o3e8q7Mv0P/zNY8C3PbQu/bARF3kSW7XU
	EaoablThmLz4HO0JAZKv1CF2SSvccojtm9dV1EtNIM0LYVMJj38fXatoFORNVA==
X-Gm-Gg: AfdE7clgPcMSrw98gVhfiRqA87QFRSmXUZwrbiJpw6om5A/VCVir/V92ADUV1O9A8Qb
	CzKZXrS5MxynoRoOgHQz9427czsTVd8XqwpoDKOiZkCwu2bYqcNagmVnysObYPgLWyCmA7j79LV
	NdAsTB5rUUJ1uukmfBuDQfBJVb6bfbZBI8+sbngx5JkHx7ab7tdcmG7ZbvrgS+KhfXlcOU+tXHv
	I2ajCvbLsTknwgB44nOlCcXKFVMoVh3PhyIdNg4FuOKw2HDGEeeIuu6sht1RwVZWCW4VsT13GaB
	WfbTm+YnIE/xkYfMtuV7KeC7A7jAp9IWaCHsuO5SGqY4D7dxDxlXB3z37Ro9wMeIF2tSYYDuzDF
	/ocnzB74rE7btBpTwOfKBQTfhnXZW/u9pSFs0rT1q2qcs1+goZnc9bC+gA7yfADn+c3QFWlkMsY
	FYyWrsKNk9TGabKQ1taF82c6SWQqkl+c83lhGdJsobN9c2pq4=
X-Received: by 2002:a17:90b:184b:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-387e0cb0926mr1921441a91.39.1783413940160;
        Tue, 07 Jul 2026 01:45:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:39 -0700 (PDT)
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
Subject: [PATCH v2 2/6] ALSA: hwdep: Return -ENODEV instead of -EFAULT in snd_hwdep_open()
Date: Tue,  7 Jul 2026 15:45:02 +0700
Message-ID: <20260707084506.718583-3-phucduc.bui@gmail.com>
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

When try_module_get() fails in snd_hwdep_open(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other unavailable-device
paths in this function(the NULL hw check and the card->shutdown check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 973d11732bfd..352047e0b33e 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -87,7 +87,7 @@ static int snd_hwdep_open(struct inode *inode, struct file * file)
 
 	if (!try_module_get(hw->card->module)) {
 		snd_card_unref(hw->card);
-		return -EFAULT;
+		return -ENODEV;
 	}
 
 	init_waitqueue_entry(&wait, current);
-- 
2.43.0

