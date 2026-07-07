Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C31F03DE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413954; cv=none; b=EUrlKVY2Ce7YHounUrN0T2xCCc85lFilJmqakDRyatzppbQmtgmGLZLlD55OIwdaz0+OFPAfFyGn1+Cl7nM08xqm/fa14gnFpbH1ACUv7ByB3V+9B8N/1GCIKARhAys/LLIO88KsFUxJRs0bnJnPdsXj3w2Wn0SdJo02cyLWyl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413954; c=relaxed/simple;
	bh=s79fNyDwwJHeBgNt/8ZFtgU9AEkWY1983W/wfWNr1PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7Qf0RWZSb9rKAwO3Zqfk+vAB5C0ofCaTLY77/nBxFWXVOpPLyIOftNWaK3xGdNdbi3qW69FfPKmlrPySLCF8TWN/vQdVv5pKnab08Xl6omB61d38OH5e4jzr/9zI1dTGBon0EhQWWHhoeQ5oawVBOU3BwRcfYo45rHUUaU+ANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEemQsF/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEemQsF/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381891a9525so3644676a91.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413953; x=1784018753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNzX+CZ5VQZ8kARVOIT//BAtEtOkAFeL+rYHssGJU6U=;
        b=GEemQsF/ue0qbvnk576XYl2CCVbSNhLHHu3oNTkTancU9zySVab8b4lzyNFk5TwgwN
         YNQfymunbbHD9xEec6woObcchRvE0qzCu9g9/2T34ptRNmYys3Kv/sVALYS4tE/d/dH/
         LMDmBMKCxYpI5oISaq5PsRhWrQmMsz2cbwHi48oTqCpnIWfyaR7UFbn2/XDLgpBTSypj
         5nfTSc1vucHLeVLsFTn9960R14zksV0bhbgg9cKrTIm0WvfZcPM5kJw/fWw4vGl+BJGX
         wmwgBqma3KI00xJrwNqUPixvcjRdyqGavl03XdMEGXbOEoiVNc8kcPGS1CsJXH80Ijxq
         38bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413953; x=1784018753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNzX+CZ5VQZ8kARVOIT//BAtEtOkAFeL+rYHssGJU6U=;
        b=SpWK31ETLz3rZzLioKK4cQDBxS7a3tx1oSvdrep+ms6TFpEAA+6HgWQD3XtBxyxYH+
         mGNrlbAj0JnVKG1KekUWFsmTsiK8VDsqyerJ2qZ4GZ/1i07tVU+UKo1JEZB9EhEmRDIz
         L2qmAIBoy0uOd1N0uRcVHgPa6+9l0l/fMiNCmbzRXhoc1U0EoWz3k9OlxghFltmtJRHX
         HQQWpN9Jd/8FrDfiJLgzaD4ZcY7gyv3MnA7WgpzD5PhfvVbTkZXmmIjcpBYQjn5YgJaQ
         CFJeDmRPKVLjEjpPKaVHLea/nKNBb/e2DPhNhpD/wNnDNNJiyYkeCk2Q0/FQfllNvgTf
         Lkrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2L3j/7vNiadJjhOFdZytM3BPHI4jqTHz1EPJq33uZxgUJ7HV8rimMgU2RlVyauBxvkO0XGLQMgOALoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMDMSFA/30dKcdNfBcNUAHd0QGha0ahCnbZKIksjySBUAaemz
	QGdhhRdAlHQ0YN8Am4fNPbVcwzJCmycosx7Ygj3rzXF+4HwrV4UrwpAC
X-Gm-Gg: AfdE7clTZNHfJA3wRKDqxnr8BVCPgKKNCPS0kpCDLeKKSET7z3crSXxaHYbGg/2dlPf
	nHKN51dkGDVSTlaF4RZrYWDH7YBZ5nBpXkXGzsxmuw5gYaTsttL4d9SC7/DtEh/bBJdeyb993PT
	KmSv88VKQ5pw32doGZ+wsX4N0DeEnDiGrSFZYUEf74E5hc3XxKkWRZDS7c4QQqe+sgm8bItOkWt
	gnEZB0aPUV4Lw24HqnWyEXBV4paFhFw2q5p489JQgkcausjbC2N8hd2f08M++bfrKqfvIFSL/+o
	ovb+gOU/zZLjVhZnEwlfI+yqlmTKQZsw3lCh2NRlyRz7JJQISSkJnjMNsNDaiSukyTj9zsTBEce
	D1lPms84cWB3l/a7gX/VU12KKI3w7cEb3H8/84adi/BoErrow9VL9EpImVYA4KFqz/tyWXY+6QG
	7LxP57yMdm8PUNCGz8GPidcDA3rpYd0UZyfTsTLq/ioaS0/go=
X-Received: by 2002:a17:90b:554b:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38755a5606bmr4357510a91.8.1783413952628;
        Tue, 07 Jul 2026 01:45:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:52 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ALSA: pcm: oss: Return -ENODEV instead of -EFAULT in snd_pcm_oss_open()
Date: Tue,  7 Jul 2026 15:45:05 +0700
Message-ID: <20260707084506.718583-6-phucduc.bui@gmail.com>
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

When try_module_get() fails in snd_pcm_oss_open(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other unavailable-device
paths in this function(the NULL pcm check and the card->shutdown check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/pcm_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 0d7818eb3e14..8ae43755fb9b 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2507,7 +2507,7 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 	if (err < 0)
 		goto __error1;
 	if (!try_module_get(pcm->card->module)) {
-		err = -EFAULT;
+		err = -ENODEV;
 		goto __error2;
 	}
 	if (snd_task_name(current, task_name, sizeof(task_name)) < 0) {
-- 
2.43.0

