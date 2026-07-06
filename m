Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC393D9540
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327840; cv=none; b=ayZp66u+NrbbXivtLGD5eWI6GnZ2v6mpXgTBVHE1bGhYvTI8QyAKrfBp4N3ALO9vkd7ytSLIKnaSbcAWSyLkK0fFwFU8CEk/3PMigbJCKgFjFSLGGqrGx084ACmAEoYcC+r606TC06Fy8qyYfGruURvnPN9jo8+GNE6lWffiTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327840; c=relaxed/simple;
	bh=s79fNyDwwJHeBgNt/8ZFtgU9AEkWY1983W/wfWNr1PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtqXpfeUG0dpNgU8YNBcrxkU/2/66I0ermRJaMH6ANCZVejXBMFi0a6iavQq6aZrA3WS4RMGK1Y7Mm0byvjx7P2PukT1WkwiAQkyMM8dvWO2qfvm7AczVngalnuBmWhQsUePkGtIxUoGHGaVX/8QZfnM6AQYRooAMOKXQxwD+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlp3srjD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlp3srjD"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2765906b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327828; x=1783932628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNzX+CZ5VQZ8kARVOIT//BAtEtOkAFeL+rYHssGJU6U=;
        b=mlp3srjDN/IoSSRjUSSsClc5+pNfGEjzyn0jw+1eiHOdQ9FEVp0b2D0+s14MpxnWe+
         oqGhWNyFe43Ko+xupyJKnR9fh55Rd/1ak9A7VExolzMioI2AWesypZQ1YpTX3sygJDlL
         V/bZtKvyngIR7g52irFfhsiru9GSbaQl50/x/gyYB6BBfCV7iIkxswxT6ShMHZnKkKor
         RYbwKTwFa7/Kb0rxDPsOxRMquydINQYhswALyHZm2IFJO9Vjmmm875pa9/u1pUCuu6hu
         XHU+fOQmS5UbUf3DbHf6bDxM9eCxTkKBlZ2OCGa3SJTxCbrZhK2ZXO8Kc5kVG/rnKc04
         FlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327828; x=1783932628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNzX+CZ5VQZ8kARVOIT//BAtEtOkAFeL+rYHssGJU6U=;
        b=bzM/WJ9MDlBKCk3YU5xpgVJqgrtOH5g3Jvl7Td5PSn9Ag3Cy1zbRD2vuDrJdx5OpnO
         nagViVDzLNf3S13kAOhJrsIJsAGwWVyZg95+WFb/LKzIZnD0QJW7qiMrUOL78/AG1i7j
         xc3VoO+6Fyta2zEy5cE41CGkYmMp/xBlKhE1AIIoTzu1its+WinKn2G5CVPeG6CMdZAk
         JU0w+gk4Uu1EAk7p2hLpQz/kJt45oyc5hTfxaN1FH7sTcJpcIkqjBxR+Zeut54d2Dg+D
         rgPUsDoZ1p2hyiUgQF/ksnOYGXxpR3sBAErEWqZN/ZD5qbazk489Y5C4hNxA6iAQk6lD
         rQMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOJS1cvktTbZs2b5m8SDHIqyqxT1AvoRvwx/J1/pPyO2qmz+NmL8KN0sF9kI5dyKM9294lTQ3EdBB7mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3q4u5zExnD6reRR+sle1w/I4z+/DJ7MhFZCzpupwkhn8xzZe
	zy6JyefqrmY3O9h92FX55cQeEU0b137XdRiZgseZ1/6AVm3cKli/IPpF
X-Gm-Gg: AfdE7cnuMRhldlfYHS2MPPOEO9I24QG7RS5S2pfFXxTKLSzAL8i8GAtbAIUuCKhmHEV
	T70uPYkbnoXVAg8AvUs5EEQZtZlUuZgw7nk7+gaLKc6KDVz8UrgHoT8KUDazizJzRPzhQFZN9AM
	JiPAuEjXSTwrIUEg8KkFWIow2BhYdZOa9CGAWFAnWbnKEOhRhV/qZ5HLKB2AIvx/dfA/8RHuqdY
	3N3PynODBHbPssD6QRfkwMTBXJamaqqrtOfriQL/d3V2oLDkCZf1P93yaTULga4Dsr30AlD70fg
	JtGjcE4IpNkXCacebv/1t6eUcazxfH8E0e0baprH1W5T3C0K8pEnufL9joqDKF0MwqJ49Tc3cGq
	71JssOEHFgzKWi9RwyVYT2RfERq9HtUgZv09S29RP35OVoU29LgjEj1b3kD1vXyTZox4HipOb08
	3amNZIHM5njYf6HxsUZXlKXf7T3t7ToBy5tL8buIJnEP9RMfk=
X-Received: by 2002:a05:6a00:3d44:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-847f6dd4a73mr8241153b3a.19.1783327827844;
        Mon, 06 Jul 2026 01:50:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:27 -0700 (PDT)
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
Subject: [PATCH 5/6] ALSA: pcm: oss: Return -ENODEV instead of -EFAULT in snd_pcm_oss_open()
Date: Mon,  6 Jul 2026 15:49:49 +0700
Message-ID: <20260706084950.49331-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
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

