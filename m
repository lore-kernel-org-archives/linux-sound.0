Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288FE72617
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956656; cv=pass; b=dcAdxsThR4FR8Gk1zlQtQ8Gj//D771O5A2soLxMgUXIQxHWmYTiIe7yb8kdgK3YmH5EdvkGh/+v6/IJ4bAWV/oiyiPT8bI02P6Q7KlEDjPl9FI+mCyd2sIuQxwSMkOC3B+d5+ppx7g2Nguy1s1xSekgj1XpCQ57YwOxwuweK3BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956656; c=relaxed/simple;
	bh=vm2BzJ3tZy5A+gQLg5nVGm65Kp+1e1DUG3Lg8MM8FdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iohog+K38cC5QPl0XJI98z1ljNd9iCP9Qa7zBRRndOHRKywmDPkSt/ylrqupC2WVk+2uHfhThZqi/9VErIeUjwJUQcnng1lFFs6JLAiY7ucNJokSg3aVwmqF40h50lKI5ZGP2XAwFeMZ5zGD3SChsnjUwQXZ5I89Nul6SozVMDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de; spf=none smtp.mailfrom=digital-rabbithole.de; dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=bviUpynU; dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b=PUF71roI; arc=pass smtp.client-ip=81.169.146.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=digital-rabbithole.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="bviUpynU";
	dkim=permerror (0-bit key) header.d=digital-rabbithole.de header.i=@digital-rabbithole.de header.b="PUF71roI"
ARC-Seal: i=1; a=rsa-sha256; t=1748955210; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YHthNz2Jx/IUmBgdjnQ03qFbPvMLAIYXdrkJIU0LMXTs0lWq+rb9fPdCnO5QiHBC7o
    6M8Vje1KtjEOxT3S/Bb26kSa9dIX+Bgcgklkf6CtX0Bh5yEyOTszwANIskCyxaCm72Wl
    /TjK8fxDoKHAkztTCUdcX8ZdrPe4MsQanr4ZHhae1H+yo049oO/StNlwbm6RpNHKB6QN
    N7BOMObbi3sEmdZncBphdRGK7i2qL1dAL3Q0hVyPysaCA0SkAxUakCBMwypdew6W6fPh
    hrMQ9Y2mzRqcn7rjlIk+IXRpOIdIsxXClfymiI74cHc6LiZ7rw21EEOie7V6cYbXGqdT
    26LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1748955210;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8DLkALNVVNGCDjsNZQvDF2xlcPLbLlplHTRvbkHVPhM=;
    b=KfyM0zDXj34q7lkgnM/3tRpgHNCrAsERXPjOgkThC75nKaldKvKlBOn21Ne0iDNkrT
    Jjic4NB220i1rWyzv0jurkX67+bzn9TWe61fX4gRlvDAjSzjTjmjswMWdAcZLVcrO/Q6
    AJ1BCNo7U5RH2kRUAmgRjDRcU2vvVByf6arZnhbaBIVfm766RO7Aj2p5VaHVOVC1bf4D
    CbA2tG8tiw4kZDmKyG2wKkzSniG9XEBn0rLzj/Q2Bu1bk6Lwjb57WIkZyi7eu0ceeGPK
    pGibDn4Bbc3pREfV3/lB4Tq+n/t8FLOxMYBrPhn5s5EQyDrMGZWzt3nOOvj9uPbGG9Qj
    9+gg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1748955210;
    s=strato-dkim-0002; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8DLkALNVVNGCDjsNZQvDF2xlcPLbLlplHTRvbkHVPhM=;
    b=bviUpynUfXZhVMUPKhQ2Gr8IVZ+wXFkJ67OtF8k2DIJ2G3M9moARJe923KbThYRuFD
    RoUCdHkAZJZLo4Mg8Dck782jY5F4KT3eu0UEC8N5+fRKI0dhOKimvnyMpQmIZI7KKiWC
    RTNjtTuDJBt4gcRgx6J+eZDI4/6LUZG2RbxfYGwaAf79Nf48kiHLBRkEdcY5vb9pHsr4
    kRlckvQzgfAx6a5z/xVpk62kCNKdlOppWWdF8vdbQInWyDIVdZBeqJEAR/LDPQud87EF
    LZv+l7nzruRBxj6XQ6NETr6n9wZdGrakJpppDr4evaCwY8GKrluhQnKGcuQeNRTB+Jmx
    f/Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1748955210;
    s=strato-dkim-0003; d=digital-rabbithole.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=8DLkALNVVNGCDjsNZQvDF2xlcPLbLlplHTRvbkHVPhM=;
    b=PUF71roIkk8BM0rHVP0Ly40Jf7R0X/FVBZXGsApoB1A0ri6rH2NM5KnosAGrywW5YY
    1mdAXtlIxQk1tcZX+IBA==
X-RZG-AUTH: ":IHkHbA68c+1zn2gb8+6dxsBP09h2Do/Zi4V+rbxtNBl2hCipBO6GPyNXZ6xAUEuHlZnKbp4UbhpDgteKRlbc5LNXEUWjm6XAjG/+UEuO37hjqZBjMh6STg=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id Y1c6d8153CrTfK2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Jun 2025 14:53:29 +0200 (CEST)
From: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Subject: [PATCH] ALSA: hda/ca0132: Enable hardware band EQ for Sound Blaster Core3D
Date: Tue,  3 Jun 2025 14:53:04 +0200
Message-ID: <20250603125304.507-1-lucy.thrun@digital-rabbithole.de>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

This patch enables the Hardware DSP-based 10-band hardware equalizer on
Sound Blaster Core3D (CA0132) based cards for example the soundblaster z and soundblaster x-ae5,
allowing fine-grained audio tuning via hardware registers.

Tested on Sound Blaster X-AE5. No regressions observed.

Signed-off-by: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index d40197fb5fbd..cfe422a79703 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -28,7 +28,7 @@
 #include "ca0132_regs.h"
 
 /* Enable this to see controls for tuning purpose. */
-/*#define ENABLE_TUNING_CONTROLS*/
+#define ENABLE_TUNING_CONTROLS
 
 #ifdef ENABLE_TUNING_CONTROLS
 #include <sound/tlv.h>
-- 
2.45.1.windows.1

