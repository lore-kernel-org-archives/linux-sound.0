Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638428;
	b=apy32OgCoGomFy5zZbQyPVbbX4U+OS5n2tGdtCNsFWsWh2DzPjSeO+u21GYPUs7Af9Pq
	 pvHq76ADOPvJWdUqjxO7DQdcy0PutH+dXQeC3HUkTkNUIZYetzChKJOjLpAg+ek0Nbl4d
	 O5I/siTTSZR52HhCFJdcBHdNqt+V76KzjSHEcpaT7xitLASkap0aY5TbXINVwnf74XM1T
	 mWFUHapvEzIyuqItWEb7AsrLL6gXGi+0S7W9uwv/R+69+tz0+YYpdz/Eh4MjrEz1jfG7r
	 QyecJa3WrNYl9zGTPhhf8cJIJ/b5ICC2/1uEniXdNeNvrOH8pDT0FsK33SS2KiWXxwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
	b=CLyykNXjPMJI3hSiY4f8fQbiHCvc5/PVErA2ppIPpJg0CsuxKxBNntNoHrgI5QMkRpwa
	 SkjdOE61E/jeTy0R5qiUsGJ1rbv7TG09Qj0qL0r5ETRkGKwC+2UdPj2y5eFuxKMizwrD1
	 zeUcsDiZJbo9ozBy0ZiA8fpOL5aLLhQ7L0/9jVDpPy65AHf4FJvADf5XxYdAIMcyFdQ7t
	 FtYuBn6OnqGfwlDi+YNTr4+PeD7TuHH9P5ta/Aite0sC2DRLFb0QgEz+5RPpTd0+JugYt
	 Lmd9+Yg3aohKWgKTZqXIQqzbepVRwQUWJ16bCscPm69TUa6of9b0Y+yJ5zS3Cvb3JkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrct8IJt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867E606A586
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6867E606A586
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrct8IJt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3118465f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638426; x=1794243226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
        b=Mrct8IJtpCBAs8emeLa9gEOzLlPTC7ZbFWCaC4tZWeWvvw76PJTEj9hlsgEdvnc6Oh
         s2vUCBogGKkeslv+vcwtSCY8Ic0yjOykp7/j34zxJKsUXtFZtSoBhT2go7Q58IEcWKgp
         VN1AgmPogpMkxjLGDEWdCAnT0EG8mFxBbUMOpvnzwVnEZhA9pXYnJkV89tgPGxXgpCxp
         z3lEj4XEOH9h+NqB0HccWMQeRyljm6r6BKqsQFjtu9niERFQ+lKg22LukdPuoMmK2Dl6
         1ATyFrk90MhyY0xD3zU/oi3rNwNygeai099u4eKQ72YsDDwh/qgCJut7ka9QfwwUmuhi
         2aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638426; x=1794243226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SI2PUcddBfYVKVC/aRECHCKeHfS2EJHFz816z3+gq4=;
        b=Y0YxHegDTiSp4WhCVor5IsoVkFDOvOGvGKz99cKJTx5Ts7efxyTlVehOfGmdLxZNuZ
         23yX5UDH2IFaNSx3LV/xZk5LBMh8bWyWXgPbvOlMJG32x0PGP2sQD18fUoC5E7Ca5KSG
         JiZup4AmTc6EAFq9Jz7jNRyHBfHWICpY2XqvwNw9RZEzGrpuIfA7X1vltkIXRn5yqog6
         okvNWWr1rL5FDsmB3b698cGbWc1c5tF4oYG5sq3jxQfixs65xQXEN09lrbD0vvj6/m1a
         DsLKZ62cwBFFj0esj/x8Jsbl2LSE5lphI6PpjkDD7Jtym4D/n+kWCNg/1PvRFCHeW5qd
         OwZA==
X-Forwarded-Encrypted: i=1; AKwUvBzRL7VYG+WdxJcYCZ9d/kb8v+Kqem8EGfNiOWrPUNfA1smGbmDacepGeeSLIhInXtuSmAL4vbeVUZ8AEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rI12Eb0HaLrz8nHPnCKdX73uDASeYw5ai+hByYQXj+S6t13Y0
	wNGz51tBcqvJDQibmm3z/c1+wgfiTR/WugiH+iREylSLStRt6h/+1lI=
X-Gm-Gg: AYBFou0t7FAiwkkdBy9POYeYylZoPec+8fXzrELoSCP9Zis5ktW+FXF3enoW6oB0qZ6
	PGtwMI1uLNBTiITrgeuJNxoO29mYMbrGRTo5ek218cL1LkukkUNtEzg4LJdM7JB2jC5y+W37lwB
	0cz8/mYjoZMpo6hv3il9hA0quYIf3aa9FWvpHX/phNKPoiEGLDdEa73QF91FhNCAlRtwOuYC4j6
	SSya9jGfcWpjlIBkjAuZyCdv/d8c+ivjWZLMujXx3H0GVqF+moeMIVBCbmFFKMvCMEh6J/rrz30
	JuQ6zrSN66uEa9eGoqeLNZ/2zLEVDxQOvFEOFMs++jEinqwVwUgSrVwUyTxDNganJgNz7bKJuDf
	1PTF9PwCi3mk2IDZ5DsmTtwXPJRaiw9krSeOz6wsclvKTd3VazbBL9cuO7F9aQ75Txna5/6xArO
	5UiZv8rasDH6U0m/7gDFOrk+ONqdwEHt/qUPs4kfDSVoewScA5jXh7CjyVcEQeTZAr5GKkVSfkw
	7AJn/o6rfAGYDa7o8dhTYnvNlo3yrpVwtolM2blE5/XSk4VF9Wjm5Kx32BXjuLao8CNNdh/e8NT
	JXzx3MInDrOyosC7S90=
X-Received: by 2002:a05:6000:2892:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-48e6e5183c9mr24881547f8f.57.1793638425647;
        Mon, 02 Nov 2026 08:53:45 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:42 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 0/4] ASoC: cancel pending delayed works on codec removal
Date: Mon,  2 Nov 2026 16:53:36 +0000
Message-ID: <20261102165340.1558853-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

Several ASoC codec drivers schedule delayed works for jack detection
and microphone polling but do not cancel them on component removal,
leaving handlers that can run against freed memory.

This series adds proper teardown ordering in four codec drivers:
rt5668, rt5659, twl6040, and wm8994.

Changes since v5:
  - Patch 4/4 (wm8994): add comments clarifying why mic_work is
    cancelled twice (before and after jackdet_bootstrap), per
    Charles Keepax review.  No functional change.
  - Patches 1-3/4: no changes.

Changes since v4:
  - Patch 1/4 (rt5668): correct Fixes tag from nonexistent
    e13da14e8543 to d59fb2856223.  No code changes.
  - Patches 2-4/4: no changes.

Changes since v3:
  - rt5668 (1/4): track IRQ acquisition with irq_acquired flag.
  - Patches 2-4/4: no code changes.

Changes since v2:
  - rt5668 (1/4): also cancel jd_check_work, disable IRQ first.
  - twl6040 (3/4): swap ordering -- free_irq() first.
  - rt5659/wm8994: no code changes.

Changes since v1:
  - Unified series per Mark Brown request.
  - rt5659: guard cancel with jack_detect_work_inited flag.
  - wm8994: cancel mic_work before and after jackdet_bootstrap.

Tristan Madani (4):
  ASoC: rt5668: cancel delayed works on component removal
  ASoC: rt5659: cancel jack_detect_work on component removal
  ASoC: twl6040: cancel headset jack work on component removal
  ASoC: wm8994: drain delayed works on remove and probe error

 sound/soc/codecs/rt5659.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  3 +++
 sound/soc/codecs/rt5668.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  | 16 ++++++++++++++++
 5 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.47.3

