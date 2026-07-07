Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750025CC57
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413936; cv=none; b=YwoSIFOsWL1acfXc65AXsSrXIVKSqP8uocPjtcz8QvMZ+OQy+nHl1XjRDrAg2N2HP7aOsjiCnn5k43oqtVHMz34HXhwV8u+tIB+ROplbrmMsxBeHH+gxFr/3x0IIbXAEZzX58FI1MqYOE/iop165z3HZ7mYV//n1MFBNrB+7wmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413936; c=relaxed/simple;
	bh=MdkBD6v8XcsqReN0xDUyxe8ofCB1NZqAjkKfMxYTS6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ql4GTNC8qq7kZrAyIvATQY3PkSUJoCyCs9Cgwz72DPxIKnxVa48kh7A3UD1nYI0Tjt5F+Bzi3g+zvOjjduGLjlHuAtQnU8zPcEh3Zdy9sdQF4uGoJiuVb65zbu7oRkizcklKF9Xok+mGuW92gXUCExMjDg2Cx8vQ5DpSC6ayjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9Y1Mujw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9Y1Mujw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2130301a91.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413934; x=1784018734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AT5Sm+6NZiPfBKJbxwFN5NPfcTc+eskfuOxKChI27A=;
        b=B9Y1MujwPjWLEq7KMJEenq02fEcexPuzSHvcJMMyDu3bHVVVlzNIv9pKk4pQ8s5Mfb
         752476UxYjz+ICSsZnQHWfR8RFjNR69gCVzTX6a1mvzgOHRQw68QHfG2uIzqAq8JiEdn
         6Ck2ojvoKhJF5CAv+F/3twtT9SunARIQ0cKEeVUf7Aw566WVuUK2Hk5byrjnEJoppkuO
         Kb2PUUGGJ91eD85Cu/IuikIBw+7BjqXRZO23IOZbNOYcmu0q+unxmXUW40vQ2exOFaVZ
         nGO4VruJGeAfbDzmw/EsTtZxRnBMcoqmPue30t3+2wuuPGmk9rMgMN1qvTkPG2Cz4FGr
         wJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413934; x=1784018734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AT5Sm+6NZiPfBKJbxwFN5NPfcTc+eskfuOxKChI27A=;
        b=bCZxWmYBDxi6EClznChaioPB5H5Jup7xuD4Wp8f2zdwKd21rZoAcaxkG4gAgTaufTL
         aRTzU9ma2TqHexMS0mKpLeOlGjzuVamJgYaNN1+2DypHEibZzyBg0t//UJ0YEfMQopdL
         A/FwuZIgmDqytcjsof5kPDK2wpN2JnDAfFs/MoBywKT6OyAolIwmWs1kV9t6aBZFgNwQ
         u1C0b6TgwKu8b3ThPcCjx5E5j//XSpXFqo3vD62yOMjUB75Jk8EmfaBpHl05zvUAQmLu
         zNYgxXtHtbDVWPR7xrRjEHc0T5EcFRV/qVTIv3v/75/zwFmFtOaEtcfgzH+LNefzW4AE
         RWMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqwn31Nim8q55FXQnBXIsnDxcJkY4vbeKEIevNlFffmSbGOdldBkK+X5fC8i1johuMAJMpSGh0/KbJJVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNHZKZ9bQGxleQoGLwVWRlUMdm+l64/bmmcqOYdPYfNsoCKgt
	i43GYG7xq03q0kFQS91Y8FtAOKa2tXi7+c2K/jEC/5E5LSJfPp9R+TA2
X-Gm-Gg: AfdE7cmMw9p3dk89MCwDxG6tf4kQoFeKoWj16biSAFMpOowmnChsFeVqvOHb4qM3CG8
	G+rW+tcHEnJNZ+JWmfs7+W3gNHOxzpfE91KWWINpjDf4zT8K4yXQNTt+dGEiwLiCLsYb3Jecz9j
	4bmyWEFZHweJbpX2l7fEufqe05M2CQwtOUQxxyIa6XvvL3tyYTm9Y42Pfud+2k2jbgD5N9BF8BV
	P+L4iQxJq8aaH+sjM1VQIDkMZPW5+q+DUDHZj4ZswoR/OBdlbu/uh0oSlH1WwjZ7z+1C5HfqhPQ
	SWJ+utPyT9fPPOhKPjZlMzrSvxV487aqCzqzJloyQkMPMoKOfAcq64zXjGGtrhKqBjRHkkp8JEl
	+9d9+RYeEyv0Vs1LhHajTnQrHtrncY2BHqeYA1Z9PDpL3uW0FNQ4JXT9pMO47nvqQ4yoJP2wr3b
	sErK6E+yb+gwqbm6a3XrY5rW/MAK58Whk24JNpmK6EoZAQrcs3hgzNdrDzlw==
X-Received: by 2002:a17:90b:1e48:b0:387:e0db:bc27 with SMTP id 98e67ed59e1d1-387e0dbbe18mr1817042a91.39.1783413934398;
        Tue, 07 Jul 2026 01:45:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm717546a91.6.2026.07.07.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:45:34 -0700 (PDT)
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
Subject: [PATCH v2 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
Date: Tue,  7 Jul 2026 15:45:01 +0700
Message-ID: <20260707084506.718583-2-phucduc.bui@gmail.com>
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

When try_module_get() fails in snd_ctl_open(), the owning module is going
away and the device is no longer usable, so -EFAULT ("bad address") is the
wrong error. Return -ENODEV, matching the other unavailable-device paths
in this function(the NULL card check and the snd_card_file_add() failure).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Drop the unrelated change from this series.

 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 037e455bb11b..0ca9fff56e51 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -68,7 +68,7 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 		goto __error1;
 	}
 	if (!try_module_get(card->module)) {
-		err = -EFAULT;
+		err = -ENODEV;
 		goto __error2;
 	}
 	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
-- 
2.43.0

