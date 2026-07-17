Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA43909B5;
	Fri, 17 Jul 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279765; cv=none; b=E9xojBRRyo9Z64OtPD9NAur7s318LDhdb+RZDLnl5JD6VJxQWAvw0efR/6YSzj9lcCH8ggjZWefJooDFTf7z4grm7TKILnpg29dJiPuKahjeuNRO7uKJWfcavIUIKJh/HOutxd1amJ3oRMAsuLHeG0UxST8pQvkKaeVc0GM6COw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279765; c=relaxed/simple;
	bh=FIRI9OP4oNPaSmPWGYfIzU5Dt4NyB63dz/qmvRY7u5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ulRMXiuXgM6/XWpce6ddygSJNmnhQdnbySuWR4jNa5f0wBAnO3R9aJ0t3I67Lc6M6zubtErv0rFP0ueINl6r1npEx9FzCYIZNbgKGPcs7egvUmmSJowQigF7k7dibvgZdYoZggxWRKbadGR8cOA4aUwjFtEuasZFtzxKrIbG9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NMxAbPl3; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NMxAbPl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ng
	xbpgJeDPukXv4+x+vEG0dkbkEZhuzH7wGI/Wnfk9s=; b=NMxAbPl3cFnuLdv7WV
	rmLLrveqSvRoSeQi1yIm0fVqR62rAgKj0N49LSrRq8v7Ov7hS+K46+Ng4mIGaR1N
	nScSGFCwVndxYNyvGZzkzPYPNseowVJ/AkYlsDlNKkHMDBSdzmiyQqgbCj9JFIbG
	e1hNERJNZMW38EjkcWkejy92E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3jTm_8llqT1CgJA--.17062S4;
	Fri, 17 Jul 2026 17:15:48 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.de,
	david.laight.linux@gmail.com,
	wangdich9700@163.com
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ALSA: sparc/dbri: Fix "possible condition with no effect" warning
Date: Fri, 17 Jul 2026 17:15:41 +0800
Message-Id: <20260717091542.721877-3-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717091542.721877-1-wangdich9700@163.com>
References: <20260717091542.721877-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3jTm_8llqT1CgJA--.17062S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr4rGr4UWF1DCrWftr17trb_yoW8Jryfpr
	WkCFWkJFs8Cws8C3s7ta1fAF15Jw1vkrsavFZYkw4rJF98J3y0gFs8G34IkF4fGryF9ay3
	uwsYga4xWay5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRs0edUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wTeLmpZ8sSrBgAA37

From: wangdicheng <wangdicheng@kylinos.cn>

Fix a compiler warning about a condition with no effect:

sound/sparc/dbri.c:1843:1-3: WARNING: possible condition with no effect (if == else)

When DBRI_DEBUG is not defined, dprintk expands to an empty do-while
statement, making both branches of the if-else no-ops. Guard the entire
debug block with #ifdef DBRI_DEBUG to eliminate the warning and keep
the rval reference consistent with its declaration scope.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/sparc/dbri.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 2f5f62079fa4..ccaa36525f8d 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -1840,6 +1840,7 @@ static void dbri_process_one_interrupt(struct snd_dbri *dbri, int x)
 	int rval = D_INTR_GETRVAL(x);
 #endif
 
+#ifdef DBRI_DEBUG
 	if (channel == D_INTR_CMD) {
 		dprintk(D_CMD, "INTR: Command: %-5s  Value:%d\n",
 			cmds[command], val);
@@ -1847,6 +1848,7 @@ static void dbri_process_one_interrupt(struct snd_dbri *dbri, int x)
 		dprintk(D_INT, "INTR: Chan:%d Code:%d Val:%#x\n",
 			channel, code, rval);
 	}
+#endif
 
 	switch (code) {
 	case D_INTR_CMDI:
-- 
2.25.1

