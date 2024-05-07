Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839116E89E
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097340; cv=none; b=B1uLInbqOi4YuQFpI/ktzto5NufHHvzNgbwt4pjbbXEqJ6sSQ27skITohRi6HBiNh5OdOeJAKZhPE5AtPa8CoQXMf2cqOkDN4C+jYA1O8GyKDf2T3YSm1q2zYWdTJEcdbKydFHbrps4dLlv9fHDyrrlLryoTZDE5vHmbUo7/H7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097340; c=relaxed/simple;
	bh=Pv3HZNJ4CnCSRGZk/Kj8hWahNwTciWHjbgsAIDqWErU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIwtrAXnhmqMVE5VDZKHdJ6eqOOqIF5iredO58INKjo6yQdpnGWC5oJn/8pPOsNwEjZD+eLiw2utxzLgx+qaDAjBN+430Fs2gp++NSpKmNXV1kJx+frbnQDTKRQBdv5N1IoSzALM00xE/tlWESdjPb75ZnPY+b/WUFWkjqQTOcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CHu5ZTZD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FeLOOBH5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CHu5ZTZD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FeLOOBH5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHu5ZTZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FeLOOBH5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHu5ZTZD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FeLOOBH5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 117A520C9D;
	Tue,  7 May 2024 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lc39SmmfDhNVsp5u5DlM6gU52ZOOMzfUJqbOggqQ1Vo=;
	b=CHu5ZTZD8vRt7kPFEHMu168KCMV9YjLi0defGgKEROsigRY3J/vKQ/41I098K8DD9Gt01u
	+Vm4904BFM1d6pvbsQYm83IJjcYF7Osa3zH8YlOuuLaZqKfkBREk6wmkPvVoXN1RqYKoaw
	9rk63IL1CDjS5oiUvJXyjTvfVUCVsQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lc39SmmfDhNVsp5u5DlM6gU52ZOOMzfUJqbOggqQ1Vo=;
	b=FeLOOBH58K4bOVP2gvpN0UJY5AOoJe6igS/uRFXd5fnXhTTv6UhzPvlLCdHxibxxCZ/24F
	Bgl6V4ll2khCu6Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lc39SmmfDhNVsp5u5DlM6gU52ZOOMzfUJqbOggqQ1Vo=;
	b=CHu5ZTZD8vRt7kPFEHMu168KCMV9YjLi0defGgKEROsigRY3J/vKQ/41I098K8DD9Gt01u
	+Vm4904BFM1d6pvbsQYm83IJjcYF7Osa3zH8YlOuuLaZqKfkBREk6wmkPvVoXN1RqYKoaw
	9rk63IL1CDjS5oiUvJXyjTvfVUCVsQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lc39SmmfDhNVsp5u5DlM6gU52ZOOMzfUJqbOggqQ1Vo=;
	b=FeLOOBH58K4bOVP2gvpN0UJY5AOoJe6igS/uRFXd5fnXhTTv6UhzPvlLCdHxibxxCZ/24F
	Bgl6V4ll2khCu6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBE0F13A2D;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CDEGNPdOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 34/34] ASoC: xtensa: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:38 +0200
Message-ID: <20240507155540.24815-35-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xtensa/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xtensa/Makefile b/sound/soc/xtensa/Makefile
index b8707f63c4ae..be4e847d1b20 100644
--- a/sound/soc/xtensa/Makefile
+++ b/sound/soc/xtensa/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-xtfpga-i2s-objs := xtfpga-i2s.o
+snd-soc-xtfpga-i2s-y := xtfpga-i2s.o
 
 obj-$(CONFIG_SND_SOC_XTFPGA_I2S) += snd-soc-xtfpga-i2s.o
-- 
2.43.0

