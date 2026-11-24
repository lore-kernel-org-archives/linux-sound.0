Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550262;
	b=xbyL3K9I5RfiPuS5M6DoQdd2uCboOyeMzVTyaBszH8RtvKtobETZoK2K5SvvHBMc/L6a
	 WqRO8g/+p/IHNmnbsokRrfYQUIupU2haHb4j/2oH17v76r3BXuvHk10H0YEfN/T3pcpeo
	 fVgmZ+yrPmPQQT2Ha/3qTsOkAGjx68hLsjWzTQeLM6MVrbtbrTqgRMpgo4GTvXe2p6L0Y
	 OKuoVpUmSjqv3jXiHk/9uOZKp0q1jM77riNzTDbNth9WwqYFJwIL4VkLEc09WVr92McK7
	 XapYVa8VaPjg/RrJ2CVrapZsocpHsPSl4bGQ2Dzzhv1qlvcs1nPBFt4cveR6l0h4f5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550262;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dKAbHBeJWiamrD35dRdeYlsFJvX9ipADc6jzjaIEGEc=;
	b=hTvmeXK0Y0f0MYdxGXkCYT9Z33IwlGljsvH3q6htwqEo3xmQF/dWMtPLcbExMMiVQlcy
	 dJeOHpyQHTilxbmkycJsmulOqW8Vxn9QHRREgq+bgQDrPzm1IMo3z4rGpduOpC5dwo8tY
	 gBehrX1c+5pzMIz9+h3JBE7EnxIMrlCM/0wZMTG9mFC3NpOuY5ytew76FwveUnDCzrLso
	 W7l4TCyCmXemO/Pw96EljiJIA6rNV+xb/yxt004HHZZ2ZlOPMIcxT2kjk+I6h3aWRVObY
	 3dXdgePgj1fqRP0QZKr5lZuHerihGwNw/Mo2L7rPoUPPzT3ostuqE7CBLTEfbI/DqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=OO7a3dZO;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82AB606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=OO7a3dZO
X-Virus-Scanned: by amavisd-new using ClamAV (22)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550259;
	bh=dKAbHBeJWiamrD35dRdeYlsFJvX9ipADc6jzjaIEGEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OO7a3dZO4LnLuKFr9Q5GmtWYvX3s0643HA7UVei3WnnwFxsvkkWsCYJXxshLp8Txi
	 yU2l3dPsRHtsBS/JYKmKaCuMU/axO+CiLq/QtxwEOVqgeDtUlseUI3n+PdYJH3w4vg
	 Zpw/QDgIQ/KDvJ2eicpOKmcJZbOxSOW/FwKbFrO4DypPtzPIz2uPCqd+KDhKR/0KUv
	 h8QT6Z0SK56IItRdDD1ky5+NgTG4+bHq/gKLhSiOEPAmJMdJWacot5+5xNK21ttfon
	 fCP3g0uufHnqLBuHWoOMhD0Pu312CQDmBiK5t7UNDh7LB9emecRdGRWY6AFrvf1Mqp
	 mq2Cb/r9oy9UA==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 0AEC31BE6F7;
	Tue, 24 Nov 2026 20:57:39 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 5/5] ALSA: emu10k1: Remove orphaned snd_emu10k1_memhdr_init() prototype
Date: Tue, 24 Nov 2026 20:57:04 +0100
Message-ID: <20261124195704.41649-6-amade@asmblr.net>
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

snd_emu10k1_memhdr_init() has no implementation in the tree. Remove its
orphaned function prototype from emu10k1_synth_local.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/pci/emu10k1/emu10k1_synth_local.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_synth_local.h b/sound/pci/emu10k1/emu10k1_synth_local.h
index 11373695344b..36b37e7c1a5c 100644
--- a/sound/pci/emu10k1/emu10k1_synth_local.h
+++ b/sound/pci/emu10k1/emu10k1_synth_local.h
@@ -19,7 +19,6 @@ int snd_emu10k1_sample_new(struct snd_emux *private_data,
 int snd_emu10k1_sample_free(struct snd_emux *private_data,
 			    struct snd_sf_sample *sp,
 			    struct snd_util_memhdr *hdr);
-int snd_emu10k1_memhdr_init(struct snd_emux *emu);
 
 /* emu10k1_callback.c */
 void snd_emu10k1_ops_setup(struct snd_emux *emu);
-- 
2.56.1

