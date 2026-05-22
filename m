Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63253ED5DC;
	Fri, 22 May 2026 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456962; cv=none; b=YDcg6r5AKT9hg/Kjs/mPDVgL//77nmeFuRMqjrcjbOkeGYllYSOUfkuQpF7reehkyjSMli61eNX0Kvi9YHiYql3YLhD4NDQlMonr4Rv67uj5j+Rb60GEJt0RTpZ74Ll/mZcJQRMP1JsYZaJMl0AOpLoo+dcUmsLmsY3phGHrYFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456962; c=relaxed/simple;
	bh=4E68yMd3eSt5QcCRQ/X6OQqgriJicM8enmFAo74DqRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b62E5Bwq88QwPXx5mjjxe7d6ue4DPGEQD2Sk8U8irUg1Zorsy4T82XMuxe+ubvutn0RRk+0l/b6YgQ5PlZw+OHp7HAjSS2JgUMQ9ebY1QEFy8x8KQ67eMyLZVMvyTaKLI/+NMqqDWitLroxNQeTXsFswylISZDtJn7MiS6LM7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tKnDNVJ7; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tKnDNVJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779456854;
	bh=IPfPFi70Qm+zWzKp1zbmboEkHwR9Rb5JOffwqU6/ztA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tKnDNVJ7zEhiKF66o7yt/onzdqS/shpqCn5DvSK+K2tNMixRWaWl/8/xOpDJj7/tX
	 Q1mTp1MIfWad+Vb2qDZlkcoGtRwxbdGlyZkPetZ5pLQ+LgZsxFGTrB4Qlwe0Y/mPXK
	 rezaYOZVUOOmM/7gffUQTmnKa0aGe5ptZ+FUL2aY=
X-QQ-mid: zesmtpgz5t1779456847tc2efd188
X-QQ-Originating-IP: ZC/rMsBumSkgZ+kt8SH8TmvM2M5XUU6pwGD4yaQ75XU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:34:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10530091963664582811
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:33:58 +0800
Subject: [PATCH v4 2/3] ASoC: soc-pcm: add DEFINE_GUARD for
 snd_soc_card_mutex
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-i2s-same-blk-v4-2-a71a86faaa20@linux.spacemit.com>
References: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
In-Reply-To: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779456837; l=887;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=4E68yMd3eSt5QcCRQ/X6OQqgriJicM8enmFAo74DqRk=;
 b=W138CBf31i6kdfNrlYIBg2W3QfM5Y52U4DJE0KvkIRyjXVR+gg7RlXoY5XOJ61Uwx6AJq4PrI
 RY1Buee0KFcDpY3EO/RKglrKmW0Tboh2jCVvnI3kwLFOFlvvYavC1ng
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NZu/AFmKGNRJQKOBYz618w5cy4ScexV6qZ2aboG33Hu8guIapLOb5UzR
	UkOu1+aa6wv4/Zvb5fSIxQUcCDoYHziNZjTlUqUd6gjnj+dBQ0j9yYh3GzjCyyyXVarxwEl
	Ow029fy2OofnpVd7Xw+r+ZFmSOxpZd9haKYXGE2Ddc09xTUBla4zV08Ov7fW264QEyyGOhy
	LLFsdPVzYM1tP81yvfmxcHI69IWm/Y/1KbOzfzrMI6sAsMb4fEATHaAW4PGIQToeuNktm/K
	S+1pYSO4SnZF67TXDRCEQuQaL8hsnia036vzE9kAhsJuk04qYUeFBIcgwNYI/jLHAXGw1OQ
	fMWrNNLEB9XJRgCiB+QIeKSjiiRqYdX/KCHBbk4JXXuz+0xnE3o1JKuGuexxRqPODQ2AaEP
	RiU9qyEGQf/BlA5I8Yqw1OKzOFNwbaDGCjC/KzxJt8kE+xp4B4HDWX2QKQpdw5tTvubcUrt
	ZNRMjNv6mZBJ3wv7hlMsBExU2VKA3OAo2VDTb/otdvgFN0onyeG25T0ztH3OaDC9N6m2QQp
	dpPwdF9KfnrA1ZuMzxgqHRmgfC8JwOVf+cMs6lvwgbh3wfS/g5wbSuD4xgPAF8gU5XBWzUd
	X9Ots9j2ilCJxmVu2+Pcv6ax6fXF+EE1h3AYcc/LxzhnpZRv8ZsD+wEle5x21fUQBF2esoY
	LLJAoIS0HuVKWNfeIumOgUurPNg9I/bpN1F6/+Dr6XZ646Fbcd4S2H9csYgnuqBpM0hb29k
	iJGut4VG+DG3oLo7lx6XRqeouQXJd5VhMRUwk2/xLovIwovKPoDRYN+g4UZFUgZzYJVZahO
	IiJb1YaH4epTtvrfijXWrqP0VRroZXF8k3bUA+bPEwsPWcfF4VUEx0Dlt8PmYxoQIgqjBep
	ql/FdCQyLcreXyOy/MrUhZk6Y93McHitwRdhvE91YAQUFTxJDcDWk/om8dM0ud/toMYr7IS
	GKaDlNab5bYfirLGhoEUrsPRZY1dRLGHmQNPwBstPQKaj+Z1huV/P8IW37OJJP+xjQ/L+Uc
	Zn0/iJNGzUC8vXDieCCiP74WvAa70WuaQ5K60HR0wzw+ttbXOC6lQdPgIk52h0bMVsHSx6O
	epAdGjstuS3kjA0hQAdPyHZZcEScrEkEi02INg6+TO8OAjwUb5ta99gMy04MVDkL4X7fl0w
	kNBHy3Ktv10iv20=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Define a guard class wrapping snd_soc_card_mutex_lock() and
snd_soc_card_mutex_unlock() so that scope-based locking can be used
while still picking up the SND_SOC_CARD_CLASS_RUNTIME lockdep subclass.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/soc-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9b12eedb77c3..25e494c4ed81 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -26,6 +26,9 @@
 #include <sound/soc-link.h>
 #include <sound/initval.h>
 
+
+DEFINE_GUARD(snd_soc_card_mutex, struct snd_soc_card *,
+	     snd_soc_card_mutex_lock(_T), snd_soc_card_mutex_unlock(_T))
 #define soc_pcm_ret(rtd, ret) _soc_pcm_ret(rtd, __func__, ret)
 static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 			       const char *func, int ret)

-- 
2.54.0

