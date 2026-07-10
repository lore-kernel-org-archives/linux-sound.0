Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B83F1AB4;
	Fri, 10 Jul 2026 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672850; cv=none; b=dSVZGaLOzDlDRjG63r0kM5Jh4qQZnUqyDMuH2AYUODME5dCnDUxm8F0sBiFamVv5gy+4zu75C/OzHk0J0L+XaKzrseALA9byZCh5NNIxMm2yCLHasM+Z0vWvxn0UcPQ/NUcqujyCtNLyNtScaKXZcLoiQi6v652HB9JCTlJpoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672850; c=relaxed/simple;
	bh=vxyBomfcHtWD/9gCs1gGdj2PTa7tHf3TctAYIwZW2J4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=je3UUYrT/Uqsk+kC5aDlhYkSpvYpNE8xafskUMjG1IatTN6y1RHx6pZUGANcvRGOjpi6wugr7P4CmVT6aXFDHyheTR85Asl3ggWSroZIcM/vwJRXFJnYQuqF0e/F9etIxUVvh+cQBSdFLDGq++nKHcszvw7zo9mYhTkujPmYzBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BIseX7DK; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BIseX7DK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Mo
	IKQERBODIf0dQu2WgNs3sEja007q9i9C0G5DKlSRQ=; b=BIseX7DKKNY/9zrfq9
	3J83/yGScHGWcnhvmEtvk1XVZrj8hqu3DGDO845CKAmgdg42AiYJJQO8qLPLAMVP
	73OEJxBDcC4gBd8crlCl9E+ZnYfr0uI6tvq3JRjlcUa6kufMKJsPg5s+dvvbx7Da
	vqGs78lo9tA6a932EK1jc3ZZ4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAn6Ozsr1BqBwqkHg--.166S2;
	Fri, 10 Jul 2026 16:40:16 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	david.rhodes@cirrus.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2 0/3] ALSA: hda: Use scoped_guard() for remaining manual mutex handling
Date: Fri, 10 Jul 2026 16:40:06 +0800
Message-Id: <20260710084009.665814-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6Ozsr1BqBwqkHg--.166S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1UKw48Ww4kZF17Ar4DCFg_yoW8ZFyUpr
	WfKa93JrsrJF93XFnxKay8uwn5XFyxWw15CFZ0y340vF9Ikry2gr1rKa4fWFyqqr92kFyj
	qw1jq3s3J3ZrJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEmiinUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xDWJmpQr-CpXQAA3W

From: wangdicheng <wangdicheng@kylinos.cn>

This is a cleanup that lets the compiler guarantee the mutex is
released on all exit paths, reducing the risk of accidental lock
leaks in future changes.  The same pattern is already used in
these files: azx_pcm_close() uses scoped_guard() for open_mutex,
and the rest of cs35l41 and cs35l56 drivers already use
guard()/scoped_guard() for their respective mutexes.

Most of the diff is indentation change from wrapping the code
inside scoped_guard() {}; the logical changes are minimal and
can be reviewed with git diff/show -w.

Verified with clang-17 W=1 build, no warnings.

In v1, some goto statements jumped out of the
scoped_guard() block, which is problematic because scoped_guard()
is implemented as a for-loop and such gotos change the control
flow in non-obvious ways.  This has caused real bugs before; see
commit a5c627d90809 ("gpio: adnp: fix flow control regression caused by scoped_guard()").
In v2, all goto targets are within the scoped_guard() block,
or replaced with break where the original label only served
to reach mutex_unlock.

No functional changes in any patch.

Changes in v2:
  - Patch 2: replaced 'goto err' (jumped out of scoped_guard to
    mutex_unlock) with 'goto err_powered_up' (stays within block),
    removed the 'err' label.
  - Patch 3: replaced 'goto unlock' (jumped out of scoped_guard)
    with 'break' (exits the scoped_guard for-loop naturally), and
    removed the now-unused 'unlock' label.

wangdicheng (3):
  ALSA: hda/cs35l41: Use scoped_guard() for fw_mutex in
    cs35l41_hda_bind()
  ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in
    cs35l56_hda_fw_load()
  ALSA: hda: Use scoped_guard() for open_mutex in azx_pcm_open()

 sound/hda/codecs/side-codecs/cs35l41_hda.c |  57 ++++----
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 +++++++-------
 sound/hda/common/controller.c              | 158 +++++++++++----------
 3 files changed, 160 insertions(+), 159 deletions(-)

-- 
2.25.1

