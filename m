Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550250;
	b=j+5/EVVsfvFHez6ndas/AS4u7imLZAw2nS9d1jAfNGZqLlgheyEq+a0OVpgxWS8TPsvw
	 aN6Ek72xswFEyDFYOBKIPqxcg6QE1LdeBNXNeGDF7Ou5OBTuvuWpTGYqWV+L13D948FWZ
	 Qd5s1gXloPZL4nd92x8A5O6zvfCGF6ouZjUfD3uI9gruTi3b3PnD5gbddHkf5F7xbwYhe
	 wbwp74L8SZKOQFw6A9lzOtrywCbPod616tJy/z3TGBBj3+9GLr9gYhJ7pGFesfZ2NWO/C
	 /O2hhsk2YW8D4tB4NPmIOrr0Q/9xvq6zNUPPSixTbr2d+gfiwHB5jRU8Lf1jLlc7d3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550250;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pBYUuxLjBfZcL8RjneO1U2oxtmZrMnobO/7OnxMwSow=;
	b=dF2pjfdFJCXCNyg+pgia2+7rQXeVrTns/Z7KeoE6tiJ4gACvSBlj3DrF3CG0TW7MJS4q
	 kpqXUbPte543s8vUqGRgB9QptTrI0qJxRzRoj9aKjyNdDoZQKbHJ6Y0GOnHxF1Rn30M5V
	 cBl6bs+viNg3zZnqGcw5ddh+lIojCzUrj/el4h8ctphccsTf56Nscdv9SeOwJ975gSM5L
	 QBfUG0giMEcc+w+tn0+62cQuEgK2PkWHbkpcaqF99k7ymxT5Q13mT/HWhns0xfujGGO9Z
	 OZ/fApdxtjVY2Tss/vtCPcWieJSYzhb5u7v5LTTr1Emh2tiVgVdNE07F/+07GvLz/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=fam5NTaR;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C9606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=fam5NTaR
X-Virus-Scanned: by amavisd-new using ClamAV (6)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550248;
	bh=pBYUuxLjBfZcL8RjneO1U2oxtmZrMnobO/7OnxMwSow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fam5NTaResMZxqFFZ9XsYR1dN7qOiqHOKJ1BORchUv5stCVyd5z67Qx95VunaV6/L
	 pSEZWzoV3MOhXMlVisiZ2Cq5yJeSOIrXiAhyGLxfaoYUpg6X3DfNg2mXs94VVsLo0w
	 aGavSpGNuxk3HQ8uYt+V3n2qE9UaolFwT+PlUiBw6ihmQEzykHXE/ak64BfET4tiPn
	 hGey0MwysfPWMIsTB9aWdiPCmQch/r0jVyq6DqejF4Bf5I+RZroObAOZrg2kkoXGll
	 eHBmI7Thg93MC+lynP5pEKT3YwwQSt/OZLrtFIkulMzRj5CAZXz8JL3hwKX0AFjbBn
	 g+iu5x/OXjFag==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 041301BDB08;
	Tue, 24 Nov 2026 20:57:27 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 3/5] ALSA: gus: Remove orphaned snd_gf1_mem_free_owner() prototype
Date: Tue, 24 Nov 2026 20:57:02 +0100
Message-ID: <20261124195704.41649-4-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124195704.41649-1-amade@asmblr.net>
References: <20261124195704.41649-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_gf1_mem_free_owner() has no implementation in the tree. Remove its
orphaned function prototype from include/sound/gus.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 include/sound/gus.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index 3feb42627de1..f00ab15f6cd4 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -520,7 +520,6 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 				       char *name, int size, int w_16,
 				       int align, unsigned int *share_id);
 int snd_gf1_mem_free(struct snd_gf1_mem * alloc, unsigned int address);
-int snd_gf1_mem_free_owner(struct snd_gf1_mem * alloc, int owner);
 int snd_gf1_mem_init(struct snd_gus_card * gus);
 int snd_gf1_mem_done(struct snd_gus_card * gus);
 
-- 
2.56.1

