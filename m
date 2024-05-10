Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB420309
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326648; cv=none; b=l4iCIsyi8iaday0YDb50dNDUdz/duzwHTtsLEapKdmwSsdJolt+8xWlUVIvTCHMQ011lhP0rV/Mowb/4w1/GhgeehOFjJ779pDALi2YGXsv1NhlyHqisrX7Tuf+CktNMdpkE9+iBs7Imy4zjK99NQY2RRHbipZahk55YdKohFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326648; c=relaxed/simple;
	bh=9zbjEElQyS/p5v1YKKhgjr51kfcxQxQhOtbSU7ppc5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jP+WJ+kMyKapcI+BkST2WTLO70drlNqyenCPJwP1+9sa3Nhfqz8gtA6RqmI+B+pUNAQttyaMOvCfH4ssxfWXuRQ3EYdQ4I35KMzs4Af8gpmkOukBXLyvWf+/o6XTySx2JQ28qQ0sR3TIr1AKikg/8q0giZcuccFg+kYnnQYci+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=weDOOOoZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C48Vf16R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=weDOOOoZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C48Vf16R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="weDOOOoZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C48Vf16R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="weDOOOoZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C48Vf16R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6AA115FC8A;
	Fri, 10 May 2024 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715326645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jpS9Bgx8mpke35+ypDMZcWooIYu+5QvKUU2EsAFaUaA=;
	b=weDOOOoZcNaq53XWCuEMNsT7cKdrxkQxp/vcYSFkZ8O91paTryxxHXzhN2hJK3v1REfU2D
	RxEsDZ6XEzw0otlh0q19Y5IWxp1EiPK9hFCeKnS7DnLf3FNGyufSVPGYeDKEDPi7H07WIc
	gH0vms1OYZRG2iufDa7XwCVFy+jSDCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715326645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jpS9Bgx8mpke35+ypDMZcWooIYu+5QvKUU2EsAFaUaA=;
	b=C48Vf16RbAp42i0o06yw7YPCbB9ve7lB5slsaZXUoWvzA/fTBp/hUCeJ/2bCsqcCu2Y5wL
	n6XC78jFIidSy4Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=weDOOOoZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C48Vf16R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715326645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jpS9Bgx8mpke35+ypDMZcWooIYu+5QvKUU2EsAFaUaA=;
	b=weDOOOoZcNaq53XWCuEMNsT7cKdrxkQxp/vcYSFkZ8O91paTryxxHXzhN2hJK3v1REfU2D
	RxEsDZ6XEzw0otlh0q19Y5IWxp1EiPK9hFCeKnS7DnLf3FNGyufSVPGYeDKEDPi7H07WIc
	gH0vms1OYZRG2iufDa7XwCVFy+jSDCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715326645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jpS9Bgx8mpke35+ypDMZcWooIYu+5QvKUU2EsAFaUaA=;
	b=C48Vf16RbAp42i0o06yw7YPCbB9ve7lB5slsaZXUoWvzA/fTBp/hUCeJ/2bCsqcCu2Y5wL
	n6XC78jFIidSy4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C5E3139AA;
	Fri, 10 May 2024 07:37:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9lpsEbXOPWZ8FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 07:37:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: Correct spaces in Makefile
Date: Fri, 10 May 2024 09:37:37 +0200
Message-ID: <20240510073739.23541-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6AA115FC8A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.01

A space should be put around "+=" in each line.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/amd/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index d1424c09172d..63fe0d55fd0e 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -12,7 +12,7 @@ snd-sof-amd-vangogh-y := pci-vangogh.o vangogh.o
 snd-sof-amd-acp63-y := pci-acp63.o acp63.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
-obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) +=snd-sof-amd-renoir.o
-obj-$(CONFIG_SND_SOC_SOF_AMD_REMBRANDT) +=snd-sof-amd-rembrandt.o
-obj-$(CONFIG_SND_SOC_SOF_AMD_VANGOGH) +=snd-sof-amd-vangogh.o
-obj-$(CONFIG_SND_SOC_SOF_AMD_ACP63) +=snd-sof-amd-acp63.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) += snd-sof-amd-renoir.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_REMBRANDT) += snd-sof-amd-rembrandt.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_VANGOGH) += snd-sof-amd-vangogh.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_ACP63) += snd-sof-amd-acp63.o
-- 
2.43.0

