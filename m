Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A65189BB0;
	Tue, 30 Dec 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103272; cv=none; b=psYS0Cay+Ldu2emQigY2Stu+MVdceJ7zWvh1qgHlPxfJFt2kwgT4XhDFHl4zW9h4fQ44Q1myvEtSLoS1cZDexdMcUnIggMe5vDv/Mv4DaLGf+ppN2+fCSUhzqmnoTvhozFMBko+xm99b4nTcjIm9BlbCETdWic+jgYb9bXpCcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103272; c=relaxed/simple;
	bh=Uhe3v5VxP0obHUwBEDyeZyyb+g3um4jQGxkS7cAhbDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bhbJAI3eQ0NuUzA9LCsqSM6cScGxITVWpL0nx9+zl0gzKCTglcFP36djH+BU060sNSwcaAgJoTv8J6qc8CqFWM10CtjJs521HTi65apRGNApDo2NddmhI/HDOQSCgpy8JoXHk6hMCwFniDQo2Qfrhg2TkqotN/OH04jHMjfKPmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=eAkXYBdr; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="eAkXYBdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+4b0Z5k81DPiMUUmHGWNTwdrCvZgTTO9eSk8AF/+ydk=;
  b=eAkXYBdr85cQ2Alc8qm0V4Ch0mSei6XO6emZlzmgmTBT98/xt74aa3rD
   qB2KFll8Aj2RlG1fIoJkgxUtkqn0gdmN5J5Oj3OHCEsFdrhBWSPIQ0Ane
   0h/xsNebCHPswosZDmfw6/+9HK2sVmR0qBqa+leO9HgeaqHOFykb6Uabw
   w=;
X-CSE-ConnectionGUID: dt+6xYZcSeuU/R1H/ZDsvQ==
X-CSE-MsgGUID: hG3nCkyZSM+0vyJCRxVe9g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; 
   d="scan'208";a="134749270"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:01:08 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ice1724: adjust function name reference
Date: Tue, 30 Dec 2025 15:01:03 +0100
Message-Id: <20251230140103.93134-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code just below the comment is_pro_rate_locked(), so it seems
like that was what was intended for the comment.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/pci/ice1712/ice1724.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index e2dbbbfbca9f..65bf48647d08 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -973,7 +973,7 @@ static int set_rate_constraints(struct snd_ice1712 *ice,
 					  ice->hw_rates);
 }
 
-/* if the card has the internal rate locked (is_pro_locked), limit runtime
+/* if the card has the internal rate locked (is_pro_rate_locked), limit runtime
    hw rates to the current internal rate only.
 */
 static void constrain_rate_if_locked(struct snd_pcm_substream *substream)

