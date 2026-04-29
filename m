Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03D3A7839
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454196; cv=none; b=btSOm/OsixFoFzioOWlUaIVDp3/RKWhsnaGIBAkQW7LUz+0oV3aglkHgICZFrVsqNnZkHWJ1zWkXx9YpJa1UYkjsSXu149JtX57CRFWEy/qYDB2Uy6D/xHYcmbJWXHP8bGFB/6w4x4+Agm1nFaFd+bEmlwv67ikZSDhDBqQ8mSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454196; c=relaxed/simple;
	bh=xBDt8msP8huNYfMxxrIQZL5xnH0dWef8P3ZpdpQ6n1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0FhRboNLq5hURiSzivNc3KvslzH7oGxI7RXSDXvmGz+NfPpKIA5jj9JEdiC67XBCxrlVqcatBkTCXoWT+lg9XHc8XESbTte3KH3g4Wbsn0ODrrZnhe51PisQsc5zYvfXSfB8Xx3Gtq0rtQ6+wcg/AChfET3tlAxa73ie08HeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSdHi+ls; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSdHi+ls"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8296dabef74so10284928b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454194; x=1778058994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SATdzDMyTuOhzxtlpYGXWtCzK5ku+exSSCqgROaZE+w=;
        b=cSdHi+lsEqPPORGpjtguSwk35T+HaRSLGzJuYepSOgCWy9JXrE7t4xJ7Ut8sDhYvx5
         5Qm8DV72oxdKplJ4AwVi8idhVytdK11bzdxxWdsTdwJaEEv7rYSir0hHgkxU0qgvL3Re
         bjsoyPe0pWVQReNmvsVzVBmA0iUUKa0JOVrm6exXH8Edde6Zok67F4yBde9lacQcEkt5
         0DwWgrU6pW/sMz2cMoJk75R93eApASkkZ9glvbLRyLkIPL80LtldppiPXiMxoMXa9Uld
         foGssv2qbfnkMsvbm5T3hSscZApH8+u9QAjV689uppFdCI4yWQfLHmzlZ5PiTUPSyLeQ
         uhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454194; x=1778058994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SATdzDMyTuOhzxtlpYGXWtCzK5ku+exSSCqgROaZE+w=;
        b=VFNh88GGAf1A8h4P3vs2q/i+VIrM/4K1vsKgRlQs18knzSvNmzS+TNU0aJRMCOiFHR
         BerdvmYfg6fwnS8jI9eXKPXS6FycVKkIDwx5FfkVYS8yn0h0sYwV6x1zW53bV5RBIAje
         /1YmSZSfjOtyc5upSHygBsUYFH0+EABVjmSwE0LEERTeX9ZfXEnbdtrHKGyQPCzR6Zns
         cPFcV7TEbJvkuqyQKDbVwR4dlnrYKyBRz3UBBfhbQ++8v3ed/9wUYwjT79eUNXQ5lIRV
         8SugHL2XXzvP4EOND1bfPt3S+mTF6+3dOoFdilSRqF3wL1ydg6igYd9NW5/TAIJAUish
         pILA==
X-Forwarded-Encrypted: i=1; AFNElJ/GrkciwNfXILIvHGqEPy8cCGtb2Ag3zqeTEAxWvQxiMGH60dgis1WChrqsDQOjKHsE8rf76UXXfYIj0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Zu49/oShpOVGCLr4l7O9x4CSD8drCODJuf8GMvrQPh13eAoT
	CjYsVYzIwoF6aZBdcokzBwFCvfsc7Np0jdD75kYVbiU1C0+yPSUoKbmt
X-Gm-Gg: AeBDies4rQ/G3cAWKRp04xB/H3Pc7Xlji3poQMen+s0kfFF7Qc+hplRysvGuXp/uFh2
	jtPxF/Yrt70v84xqtL4JhE+XeINhs9fqI8wsXUPw3ORF3WDHtrhvACeM11PyHdYN1WFld6CCv0n
	nff0tCPtRYqejrVKd0iqarElGVAq520R8/MWmr5tseERfZbfuf6Jvblq492fGDKg0ch6WYXW1EU
	GEh13cT9INHa8OfmLlAMOZHxZ7pi+x/hmCQfLvvyQI+l15XIKZRC7dImsJ3zkRhwN363Dl8ywNg
	mm21pNr51+1pOgQChfWhEfyAIjMXOrDASKmLUeCRG00oyio+EpsqBGzCMVL2zT8ePqwqk7AIOTF
	we04VKRz1lb5s761GFrRvUqx/sDIxkj7nDIQgArQuqF0ofLp/0tBV4pVGKajeHIVsTYtcLKLrSl
	5zI7/bxBiutT7DqIjt/VLRbg4JLGqi1yLXM0N2Xt1Jn8iLoO6XutS8+/jJyfGy7P+wgcpe
X-Received: by 2002:a05:6a00:4487:b0:82f:77c9:a89f with SMTP id d2e1a72fcca58-834ddc57adfmr7234747b3a.37.1777454194159;
        Wed, 29 Apr 2026 02:16:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: uniphier: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:12 +0700
Message-ID: <20260429091614.96667-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts spin lock handling in UniPhier AIO drivers
to use guard() helpers.
The changes are purely code cleanups with no functional impact.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: uniphier: aio-compress: Use guard() for spin locks
  ASoC: uniphier: aio-dma: Use guard() for spin locks

 sound/soc/uniphier/aio-compress.c | 24 +++++---------
 sound/soc/uniphier/aio-dma.c      | 52 ++++++++++++++-----------------
 2 files changed, 30 insertions(+), 46 deletions(-)

-- 
2.43.0

