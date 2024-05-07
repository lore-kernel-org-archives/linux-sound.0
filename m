Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951C516E890
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=OF2LbMckij6e4levGCtfKJiLLGVgns66NGAuFa84kjr0c04bLA3+C7tbWt5rIHX1F88cwZZHuDFOKoZ3U6oEva62WW4vZcSpTYfbJTD+y6fq8DnO2i5RQvdHWgpGXQAlCAVA3FG3mY9YKLDmSTN4cZnlwfgMw7jjbv30jY2Yjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=QKEN6Vk+XHbgPxni0GwKGrr5ZkbzOZbQNzduQWbOFJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJoWuo0ZyoHHeX34QCoo6KbGC3U6ZMmRpTe58hpXYYKLIjtnBQ1Eyrw1LP/d89pQnOJLtIfFzyxWODkXMMVgir/xk3rv9NuNzu0YTutMfNseIJftASKm+avUKPEHTDjrpb9YCTBnACcoW+dfSFQf8PbekZ91qbyKHXhn7QwXuVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lXpvehhR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SYeMFgVj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lXpvehhR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SYeMFgVj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lXpvehhR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SYeMFgVj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lXpvehhR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SYeMFgVj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E778520C93;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR6HuNPevSszEG5+HL9fiX62yQ7l2Rf6SHPIA2jSJfs=;
	b=lXpvehhRv/Bvgd+P2HzA8QIXYqOpXx+6jOi1kkLLkf7I4WzUDlMMeF5aSWU3PP+MIvISkx
	AkTobecHQJUp558+TqIQOsZ7S8n3lDATMqBTPQCJa9WLTtn2qmpQqsEQ4ouhHLEMcjgfgb
	Wj0AqkGriTMRfoOljFehjo+SuJKYGbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR6HuNPevSszEG5+HL9fiX62yQ7l2Rf6SHPIA2jSJfs=;
	b=SYeMFgVj0li0pCmd6bDJTA5Er0Rf6Y8XBALfTVXutPBzE9Z9Ng95ED8IWffU2NdrLHiDYC
	kbDNuJT9PoL8wDCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR6HuNPevSszEG5+HL9fiX62yQ7l2Rf6SHPIA2jSJfs=;
	b=lXpvehhRv/Bvgd+P2HzA8QIXYqOpXx+6jOi1kkLLkf7I4WzUDlMMeF5aSWU3PP+MIvISkx
	AkTobecHQJUp558+TqIQOsZ7S8n3lDATMqBTPQCJa9WLTtn2qmpQqsEQ4ouhHLEMcjgfgb
	Wj0AqkGriTMRfoOljFehjo+SuJKYGbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eR6HuNPevSszEG5+HL9fiX62yQ7l2Rf6SHPIA2jSJfs=;
	b=SYeMFgVj0li0pCmd6bDJTA5Er0Rf6Y8XBALfTVXutPBzE9Z9Ng95ED8IWffU2NdrLHiDYC
	kbDNuJT9PoL8wDCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF80E13A3A;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YBiMLfZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 27/34] ASoC: sti: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:31 +0200
Message-ID: <20240507155540.24815-28-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
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
 sound/soc/sti/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/Makefile b/sound/soc/sti/Makefile
index 787ccb521298..dfd4f4dd36fc 100644
--- a/sound/soc/sti/Makefile
+++ b/sound/soc/sti/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # STI platform support
-snd-soc-sti-objs := sti_uniperif.o uniperif_player.o uniperif_reader.o
+snd-soc-sti-y := sti_uniperif.o uniperif_player.o uniperif_reader.o
 
 obj-$(CONFIG_SND_SOC_STI) += snd-soc-sti.o
-- 
2.43.0

