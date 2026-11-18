Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028671;
	b=y/dJeterXHCGMihPb+9yT5rJbpTgmSw/b9dO5EwE8vm/5a43zU+ZycVX96HCd3607cVl
	 aNepurN303g1VzMOlSJajECoHVfKGlntEBVE5IheE/PWeuhWdc+p5L+vWMw9Iw7hJy76+
	 mUy/u4ERH1g7PtxB/2HfnjOK90Jag7F7NbUkcLYj0sgsq2qV08wZJ/hkQGKzK0HVAjl+j
	 xmERIrfSUD/15tfO19DjDsM6rok9PvvnYDb+phsfY9EOy1J76hxDYSelI8X6OL5cymAOI
	 9XxYdzOwWeHH3xmoMiSC/7ZBFZjFPBrQ7cdqbWzp3yCSpt3tv6lBAXjzLQIhdfITm3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028671;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NG5QO4QJaQCLFDteAXt2eZnWQYFQwLDqCrAC/SQdXII=;
	b=pR6eL3ukCLonvK7s9WqmKlunfFl9T2LuUhA+w3pCXMVMU23B+oxFY694+PakbOq/jRRA
	 s90r1dqi70BT/Gu49TXy5rGTK2Gv5A2aFplUetvFH4Tn3jL+dcV+Ni9WJAGSxC46On7N4
	 TEgIOwgzdgKgfBNITUuttfTZkjup3YmLiA8MFbnSWIWjgi4pSThEPsdctx8E2T4r3widW
	 G91DgrByLAqCO5ZnmsF3gcNCcKI5KjBa9+RrrCEnmDigcLQzcPAqtVcsQC8lKhutjgM6b
	 eUWCadhAuNjRv4cI/3d/d9qEVAloo2iHTZRG2LHcH/5q/4RGPbM9qL/eE6ajhC3NsWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=QqQRKww1;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0168606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0168606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=QqQRKww1
X-Virus-Scanned: by amavisd-new using ClamAV (11)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028669;
	bh=NG5QO4QJaQCLFDteAXt2eZnWQYFQwLDqCrAC/SQdXII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QqQRKww1Vf15t3PgWjfDPJ/OKCA9sTGrdl6jke5ZwVfI9vzxoKWuUKbJ/YHLEzVUQ
	 dg825MjWTEZTCah53Q7HtdFHTlE9Fo5VHQMcQ4iuqiRcxcsTkHozKyzBo6p0gjH9wc
	 zx9eUGKfNEJDvFAsvoQqDM/SH8SDMtuYOIKMxNZ0yZcNa7NYFFP6cUZJi0nRBiqRLc
	 ONwwUiEy26wiRIEWp40KRz0WU9U/x8npUzz3i1/hqPA7OLNmkQqT+1NuThpwT/GIHM
	 pulWUUeA48+OlVj3lUjm/Vxeo9wN7peJkgOIg/YBYacSwo3IJ1gzid8QPkqfEFlgTB
	 PNshvTKSe2DDw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 1C68D1BE97D;
	Wed, 18 Nov 2026 20:04:29 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 21/22] ASoC: rsnd: Remove orphaned function prototypes from rsnd.h
Date: Wed, 18 Nov 2026 20:02:18 +0100
Message-ID: <20261118190219.316811-22-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
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

rsnd_gen_reg_get() and rsnd_ssiu_attach() were removed in
commit 55e5b6fd5af0 ("ASoC: rsnd: use regmap instead of original
register mapping method") and commit 4e7788fb8018 ("ASoC: rsnd: add SSIU
BUSIF support"), leaving their prototypes behind in rsnd.h. Remove them.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/renesas/rcar/rsnd.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index b480085fb0e7..5494a16542d5 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -613,9 +613,6 @@ int rsnd_dai_connect(struct rsnd_mod *mod,
  *	R-Car Gen1/Gen2
  */
 int rsnd_gen_probe(struct rsnd_priv *priv);
-void __iomem *rsnd_gen_reg_get(struct rsnd_priv *priv,
-			       struct rsnd_mod *mod,
-			       enum rsnd_reg reg);
 phys_addr_t rsnd_gen_get_phy_addr(struct rsnd_priv *priv, int reg_id);
 #ifdef CONFIG_DEBUG_FS
 void __iomem *rsnd_gen_get_base_addr(struct rsnd_priv *priv, int reg_id);
@@ -849,8 +846,6 @@ unsigned int rsnd_ssi_clk_query(struct rsnd_dai *rdai,
 /*
  *	R-Car SSIU
  */
-int rsnd_ssiu_attach(struct rsnd_dai_stream *io,
-		     struct rsnd_mod *mod);
 int rsnd_ssiu_probe(struct rsnd_priv *priv);
 void rsnd_ssiu_remove(struct rsnd_priv *priv);
 void rsnd_ssiu_suspend(struct rsnd_priv *priv);
-- 
2.56.1

