Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59617BB34
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231777; cv=none; b=VOMwKjtARJDkF5cYZ5EiIpazhSo+yrkJ2IoYgCUSJgiRLR3BypbUZ+mBEx1DPiYbwo6fcFeENWTqbai7xy8g2e6eMI5qvkAP/fFlYC4Mtmdk363c/6/BJdPwIIJ7pGIcT0DY5uJuhlVlX6o8psS5hjcgXW+HCh8IXKiPtmbINRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231777; c=relaxed/simple;
	bh=EKcaj1zBxZxv0K7v8DN2eYg5WnyI9Q6wCEZw60CpIJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n0eb3BlkMziagXZN0QkAStOfu1KMMafC+uFoGlhEPzCluQM+jS3A1yM/n2IgBLbjOsYCLJbRjzf1X2bNx0au28zFhhD9yqjGpGXR5LhCrSyWiKYFKoojOH1FOPjhRh9mFxZYLE2GjWygTqv6olTL0i2UkppvNHqtytb574ZMJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=YPzrQdfD; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="YPzrQdfD"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 964FF1C19E1
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 09:00:34 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1729231229; x=
	1730095230; bh=EKcaj1zBxZxv0K7v8DN2eYg5WnyI9Q6wCEZw60CpIJg=; b=Y
	PzrQdfDlC7rDRijX7w1tZ9Z6tx3GcaRCx+fiNtxNEleWZc2T13eQFRAqcyFFn7WV
	FDWD4RqV18T03x09LDqRrOUtRxl4LRgar8dA6jh0aWFA27WGdKEZ9zir111rjdVq
	QQ2yM9EZC1k0Xnsx8znKOTkilCJl57vVh6a9swflnc=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UqYQ_UXZcXZb for <linux-sound@vger.kernel.org>;
	Fri, 18 Oct 2024 09:00:29 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru [185.130.227.204])
	by mail.nppct.ru (Postfix) with ESMTPSA id AE2181C0904;
	Fri, 18 Oct 2024 09:00:22 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Andrey Shumilin <shum.sdl@nppct.ru>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	lvc-patches@linuxtesting.org,
	khoroshilov@ispras.ru,
	ykarpov@ispras.ru,
	vmerzlyakov@ispras.ru,
	vefanov@ispras.ru
Subject: [PATCH] ALSA: firewire-lib: Avoid division by zero in apply_constraint_to_size()
Date: Fri, 18 Oct 2024 09:00:18 +0300
Message-Id: <20241018060018.1189537-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The step variable is initialized to zero. It is changed in the loop,
but if it's not changed it will remain zero. Add a variable check
before the division.

The observed behavior was introduced by commit 826b5de90c0b
("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size"),
and it is difficult to show that any of the interval parameters will
satisfy the snd_interval_test() condition with data from the
amdtp_rate_table[] table.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 826b5de90c0b ("ALSA: firewire-lib: fix insufficient PCM rule for period/buffer size")
Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 sound/firewire/amdtp-stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 4e2f2bb7879f..6c45ee3545f9 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -163,6 +163,9 @@ static int apply_constraint_to_size(struct snd_pcm_hw_params *params,
 			step = max(step, amdtp_syt_intervals[i]);
 	}
 
+	if (step == 0)
+		return -EINVAL;
+
 	t.min = roundup(s->min, step);
 	t.max = rounddown(s->max, step);
 	t.integer = 1;
-- 
2.30.2

