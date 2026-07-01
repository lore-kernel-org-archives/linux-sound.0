Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30B3B14C1;
	Wed,  1 Jul 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888703; cv=none; b=VEi1NorPCJm3g/vcJLbWi9enQ4A44s5wpZCr62GGO61YQLd5/9L/esEPzaNuI6WspFn8VJYD3mzmInj3h9doulOuE7pdWbN30B/+uX4lBqJK8cO9uLKocX723eGnI9prmkSA3GE0af1GqHGi+r7dC6Ic2NhIQQgDLMVGA/MEEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888703; c=relaxed/simple;
	bh=WQsj77sA00kMMB8KzcrHNHKEzcIF7TI951KTwkBUa4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AkeT6se5B8JohcLcNHh7et2lt4BEJ/0tP1JoCKQ/Tppsru+/GP9x4clo656A/fR6McmDlHF582SXw7YMXVt364Wv7xXMR61nJv/XerHF0H/bB2WaRdZb7HRwPZsp6WTXJSKXga8tTuZlpyLsknWfCi172xseMEw2l+35pttcNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HZNGs2Fo; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HZNGs2Fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ca
	mAH4FnBLtcoCWhMMIUDnTd1T5XZt/+ScwvhqCLz8o=; b=HZNGs2FomQ9XO7O2dq
	+ZbDBogXMgXrb7E2QNWJ7ShXi+ZOZY7lyxR4fXIgznvbjKYrPAvFXHvHcM8EBGDo
	1nr5rG3I8K2ZV3vOy84QjDMUShppYdAu2Vps3sz6XWKGDRF4TS2y1WXfQvOAYuOG
	4nwsQlWBpGRHJJCm2iHO9C/Vw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn6YbeuERqQXGfGg--.31791S2;
	Wed, 01 Jul 2026 14:51:11 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com,
	wangdicheng@kylinos.cn
Cc: david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ALSA: hda: Use scoped_guard() for remaining manual mutex handling
Date: Wed,  1 Jul 2026 14:51:05 +0800
Message-Id: <20260701065108.596046-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6YbeuERqQXGfGg--.31791S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rtFWrZFWrtw47tw1DKFg_yoW3CFb_WF
	WI9FWUJF1jkasxAa40gF1ftaySvrWkA34rCwn8tr9rXas3Xrn8tr9FvFW8Xwn8ZFs7Jr15
	tw15XrW2yw1jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJgArUUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6B8RYGpEuN+ldQAA3f

From: wangdicheng <wangdicheng@kylinos.cn>

Replace the remaining manual mutex_lock/mutex_unlock pairs in the
HD-Audio subsystem with scoped_guard(), which provides automatic
lock release through RAII-style scope management.

No functional changes in any patch.

wangdicheng (3):
  ALSA: hda/cs35l41: Use scoped_guard() for fw_mutex in
    cs35l41_hda_bind()
  ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in
    cs35l56_hda_fw_load()
  ALSA: hda: Use scoped_guard() for open_mutex in azx_pcm_open()

 sound/hda/codecs/side-codecs/cs35l41_hda.c |  57 ++++----
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 +++++++-------
 sound/hda/common/controller.c              | 159 +++++++++++----------
 3 files changed, 161 insertions(+), 159 deletions(-)

-- 
2.25.1

