Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C121EEA5F;
	Tue, 30 Dec 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100971; cv=none; b=lhnsNvOPg5hKAZB5CT7inb49zDbkIFEELkshI4Xku4CGxH87CO9cPDikYM82ykyU7s+q+bzrLFJnSaInNrJ96eFawD48xdejLaBMeaiTAqv7E4daHR9X3cTfgsjoxhP7EIOnnZPzMavSaujsLfeZSRelLAHd5CkYwOV9XqUpm+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100971; c=relaxed/simple;
	bh=Wze0NFgpdfS00ZnmObWrak6jbkWCcH3+swvVf2/bpfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H7CHbz5gU4x7Zp2Twt+89MS+YeRJ2edL4v6wbzqukCLrQuzk0TbgZbPhOySBO6jHchSyGx1lT0hB9Q/xv6DIxZNI/dGuVyZ/mDWKppbqALZkU6aTidwfNru5AIOz+yujz4WQnCOEVfczZ2OHlLY4ueqmHPr9dQsqOFcOBmqlD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=H+YkMepq; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="H+YkMepq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3VqAlD/08mwAxFeaLeqivqwc8/RkhMgCfs5Gg8e6XRo=;
  b=H+YkMepqDNbPPKa2M3KWHakp93F81fLCg3yIQ12wRtWCLiqcdmo190Xw
   3JWKoQrUdJkwdqtBRxGOyCsBKCo3Ed41/+FIQGgTSBWe6dvbCNvEBw/jQ
   Z6swy103UDTftY5MyiHBZAPYbYV83Zpu2MpPGf/m0KkN20ul4/U5TyvJb
   k=;
X-CSE-ConnectionGUID: TFa8zwzrRQKj4JnU1XvEfg==
X-CSE-MsgGUID: HfdnC1D4RueiOgDL36YQDw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; 
   d="scan'208";a="256343479"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 14:22:40 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mixart: adjust field name reference
Date: Tue, 30 Dec 2025 14:22:35 +0100
Message-Id: <20251230132235.90687-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

buf_period_pos seems to not have existed in the git history, but the
buf_period_frag field is used with the buf_periods field in the
function snd_mixart_stream_pointer in mixart.c, so it seems that
buf_periods is what was intended.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/pci/mixart/mixart.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/mixart/mixart.h b/sound/pci/mixart/mixart.h
index cbed6d9a9f2e..3fcc5ca757c1 100644
--- a/sound/pci/mixart/mixart.h
+++ b/sound/pci/mixart/mixart.h
@@ -125,7 +125,7 @@ struct mixart_stream {
 
 	u64  abs_period_elapsed;  /* last absolute stream position where period_elapsed was called (multiple of runtime->period_size) */
 	u32  buf_periods;         /* periods counter in the buffer (< runtime->periods) */
-	u32  buf_period_frag;     /* defines with buf_period_pos the exact position in the buffer (< runtime->period_size) */
+	u32  buf_period_frag;     /* defines with buf_periods the exact position in the buffer (< runtime->period_size) */
 
 	int channels;
 };

