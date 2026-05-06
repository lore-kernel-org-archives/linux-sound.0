Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A726B2CE
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 03:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037554; cv=none; b=islqJaXzvbA0gumdQwLig0kfqG4zSpt/8gT6rv3QiLQyEtGwcPrg9kCrMZFpC6ojTSsOfNbBqxz2AC82H15ieS/72qNaD2Dwi88/+4JTL8mNHUUhmrFSfMhYstQBCN7+G+iKnGEL7KKA9DTqVnFs4ngftwJdY9uPQ+Ge9uL9jgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037554; c=relaxed/simple;
	bh=9qDqGR4m5yeG8Gl/vxPRPi5pPgLsV+Tp/ixHQRoJZtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gk7R7HCHLBCUGe0oC6fBLsSWblgxGFBTWLkmJPCdmQQEF1Qu8v1Y36+eSvEneY0NtxjqW+tORJ9nPKoIt3eNWoVvj8kVLEoqv0u/1lneDfBhj3XVYOf6rHwCwiL4oZ7VEv1sK3VzA5OLyOVUJkz04Rm7fum5J/dw2wvnbecqmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEOjdlgH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEOjdlgH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3654ebfd57cso2065928a91.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 20:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778037553; x=1778642353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQyP7Q/zLqZihvC4HiKl/1u0pyGkhP2/Tbg9LUSwr50=;
        b=AEOjdlgH5K2AwmTvVubyCIcur1iSIVbGl5mA/CahlpCgo44dta3Bh3HSdaqR9QxxjH
         es6W/QP16Ry3Tg16T8ZpzmrG3XQj+uWNWkbq6kN5xE30uZqvL5iVHyZb4BXI5NNCo00h
         /ip0NpaVtKIPBNYYJOJuDUGyBpX4Xnxm5Mv4hLWHgK4bABOK3HoVoqTYxJBAUPi0WqrJ
         0+ew+a9AcxVbsEeIGZpJklE60i3Wm9YHizhXolWNPaS7GeacSNokeeB/VctkgeDzVz8k
         cLK4DUNwF9J8sGBT4oMNQleKrEJhR/DW4AqUsnRKhyozn3JV4QQUO7asCWIY+h18d/Xq
         8gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778037553; x=1778642353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQyP7Q/zLqZihvC4HiKl/1u0pyGkhP2/Tbg9LUSwr50=;
        b=iPJYF5TxKURmBwYgC19Dy4kgpMqk15JBaOYa05umG0hOdGvfDlwMBSMOzY/ojKQBBH
         njZ0bRQ29dIGr6zOZUZtzSTwRUGKu844kwPCoXGMZ4NPwm378hxXo3Ol09zOjenpxy1L
         4rg6RHYomYyk9Ifhf/71oqYelawhEpv6nrTtgnRynAyCOMTiWHswN/ljWnxF2wOTSYPq
         ZXHbi85ouDMIoJwTEEroj4GmXvisljEiic32GbsB59c35zCB2eTbmbZ4ZJ+uixYvHzUa
         NJ2IZTxBeGbnZb1DK3PZe8N7s5yDepi9DagFJkperjJrQRKrGjwhIeZVrEHQaa2UeBHZ
         Vxfw==
X-Gm-Message-State: AOJu0YxHHo2vSImhHQfIeDOt95Y58gem544b4VaJAMcR5TR+Db6sNu2V
	93Ap9z0KzXQ52i/v0sJ8Fre5AfnjbW05bnl/SyfIM/zR2qhkY1IIRg865eNIoqAN
X-Gm-Gg: AeBDievv0Sg9sAk3r+XBqMG694VPRBUNu4hbB5htpLR8P8BvvykxjNTD42A7nITLg+K
	jIDsWx6n7HxC38q3NW6Fsmh7skOLIIbeUI9+ol52D9urgJsocpdQgzctPkaJ41GFrCBaofpCyoF
	IBXPpRaI+QMvVomkFkHeHy2Iy+gR9taqZzulLAz/yVf2ucvcyMHHjH4CNvFCcT9s05AoRx7W9Sb
	2IbmEVqMmyK+6ClyAzD/8tdg3rwC27g6oXbJ4HWnR1Kp37yoW33nW3P/+b8Nq8uQZmRhBKWmJaU
	5AoN9+Qmb+vrxFXXYe6kiRJpevrnkQdc9WkLZ2lDUyQHBfkP0yOMiQgZg2Mnw5oQVnRgH2bt5bl
	u/z/gw8MxVWirxxC+IpqtZng7KyuH322zZ63aia0p/eBckT/KzwZI8QBACt9XGvNmqol6XSpLn0
	mD3R6I7Ty14uEo6GOOpKpsSy0N/Vr7LJRDy7S0jAIeqDxiViOOzIht+rD7ahibgDfZ9w8melG2G
	cpapRBA26iNNjmKoIChoMYD/gLiO/m7OwF7RqtsODVctw==
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr1414703a91.14.1778037552704;
        Tue, 05 May 2026 20:19:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c2f5fcsm583836a91.7.2026.05.05.20.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:19:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: sparc/dbri: add missing fallthrough
Date: Tue,  5 May 2026 20:18:54 -0700
Message-ID: <20260506031854.780411-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes compiler error with probably newer compilers:

sound/sparc/dbri.c:595:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
  595 |         case 1:
      |         ^
sound/sparc/dbri.c:595:2: note: insert 'break;' to avoid fall-through
  595 |         case 1:
      |         ^
      |         break;

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/sparc/dbri.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 75f82a92ff44..2f5f62079fa4 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -592,6 +592,7 @@ static __u32 reverse_bytes(__u32 b, int len)
 		fallthrough;
 	case 2:
 		b = ((b & 0xaaaaaaaa) >> 1) | ((b & 0x55555555) << 1);
+		fallthrough;
 	case 1:
 	case 0:
 		break;
-- 
2.54.0

