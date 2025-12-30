Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225621257E;
	Tue, 30 Dec 2025 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101740; cv=none; b=Bw4LHKzRiVpsWqzUz9eA2jepxo3jmAsCND2t28pKuotMmYkt/DG62FILYqjh3K1sDk1kIvkimLfNE4zISyNIEYUAqt/IQXd+b7feTL2/mPaMa2ZTcANpeiZ1MPesEA5iznlwa6pvXsXEwdojJgtM1d+w/NBdMQWOYpfGy8/GH3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101740; c=relaxed/simple;
	bh=MIKfr4MvJxAiv0mzrYj1RznXejWeaVBRDqS6mv6Fjzw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jG3dTdYLsaZ4ugvaCk1w7LfqhbfMCcAf4WR6PslGvDGk5367aJxY/wWSc0KHXyzJZMdF45yeDyaK9+OrACX+RNYk76BA7kQm3d6MKI8Gcpmc94dyJ0PEDWx8NJZLOlCUYF6UaX46ENr5GTZ68K4BofAlvAwuLQ1eAcnWHXufKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=UKwcgefr; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UKwcgefr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Hk3CwRwKBCZeldUPz4TX9+9T0zisZfSStrRjylLKTE=;
  b=UKwcgefrt9CM3kbQPDJx5Wyk6J1bqr0n0WcLrPP0gy3psa13yR3DbF3v
   2nPAHFhK4Jwz6dlxvwjx8M1s6HRzNhkNhQN7Pv+bEJbNipUjRXsjhwCIF
   x6iqtZ0faX3lrX0rrmbPC3cqWi+AsU5W1arK/rJMw/9Rwg1m0HpdBgG1n
   s=;
X-CSE-ConnectionGUID: yEY/cExwQm638UCoIdHMkA==
X-CSE-MsgGUID: 1l6puHu4SgO07D85L44gEw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; 
   d="scan'208";a="134748123"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 14:35:29 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: echoaudio: adjust function name reference
Date: Tue, 30 Dec 2025 14:35:25 +0100
Message-Id: <20251230133525.91837-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code just below the comment sets chip->pipe_alloc_mask to 0 and
then calls restore_dsp_rettings, so it seems that restore_dsp_rettings
is what was intended.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---

The code in restore_dsp_rettings() looks like restore_dsp_settings()
might be a more appropriate name.  If it is preferred to change that,
I would be happy to redo the patch.

 sound/pci/echoaudio/echoaudio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index f2c8602a1ad7..65a73faf2027 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2155,7 +2155,7 @@ static int snd_echo_resume(struct device *dev)
 	}
 
 	/* Temporarily set chip->pipe_alloc_mask=0 otherwise
-	 * restore_dsp_settings() fails.
+	 * restore_dsp_rettings() fails.
 	 */
 	pipe_alloc_mask = chip->pipe_alloc_mask;
 	chip->pipe_alloc_mask = 0;

