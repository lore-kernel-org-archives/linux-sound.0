Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09CA3B14C2;
	Wed,  1 Jul 2026 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888630; cv=none; b=Yau3ZqCTrrxgzu97Rtwtq7uMWgsh0IbvzWVX2HBSS3/E29pXWhRlTOuxRgx2qMY5Tl7WDklaiFJzTBcEtburRmxgjWUk8NpYGA1+xUNl5abJDZn4fstSsQQF75u0++pkaYjIx6AQKqgkCvQOMJpbTSQgZnAi/0Nb/5zRqlmcYUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888630; c=relaxed/simple;
	bh=WQsj77sA00kMMB8KzcrHNHKEzcIF7TI951KTwkBUa4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qlnf0WskmZK9NqW7J4i9WzaHqQvjN08ObhE+pBlZpjwwF1cpOosz2T1tm69h4m5Lu85HBLh4uTc3pCY6GPJVIe+PCmJTOpbnrePCwoQNVy/RB7y2cszzwNefW6Rs3P9BTV5r04eGmAc1wyFnMHTg1KvAyjHBRaZswnOmynmBfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NGSushZp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NGSushZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ca
	mAH4FnBLtcoCWhMMIUDnTd1T5XZt/+ScwvhqCLz8o=; b=NGSushZpbHkFFYUIGY
	BfxaU1f94t3x+r5zXZQtudf0QMIJFtfbaqIm3yxWZvdOAeKN7lsKbSsJ/Fq4BCSl
	LgoTKbnBogG11UWk392SuC3E3wdZoHnXMXvlJvooLcOsf7NmLduAcotYYsqg6jgY
	uSrYVGqvm46LYXItLoV74Q2yY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHDveKuERqvbJQGw--.29951S2;
	Wed, 01 Jul 2026 14:49:47 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdicheng@163.com
Cc: david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 0/3] ALSA: hda: Use scoped_guard() for remaining manual mutex handling
Date: Wed,  1 Jul 2026 14:49:22 +0800
Message-Id: <20260701064925.593372-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHDveKuERqvbJQGw--.29951S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rtFWrZFWrtw47tw1DKFg_yoW3CFb_WF
	WI9FWUJF1jkasxAa40gF1ftaySvrWkA34rCwn8tr9rXas3Xrn8tr9FvFW8Xwn8ZFs7Jr15
	tw15XrW2yw1jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8CksDUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6Az8TGpEuIydVwAA3E

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

