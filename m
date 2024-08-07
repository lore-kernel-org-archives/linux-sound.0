Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E612F588
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723050138; cv=none; b=u3HnJFY4PpdC9N244R6sNtQTW47HQBhWpVhcIYwg5vOCz7Pi2/QUeh3Y1FDO50i3wxht0FMjqm1hUM4Ye0y7sBM1JMvPu1KatxUL+e1OiBrBC17HtOhxs/enDjsp22BAFKS3nGDqWJYwJiizE/Hy0b5D5mS+YWh80aOLvn2qzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723050138; c=relaxed/simple;
	bh=JLnNGu+C10GwVXDJ1t50Y7ZTCXZz/87bp9/oDKvgxGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkSr6u3As+IdhMJGz595EogNN8EPST1qzXL0OGP3wmig2gIMdh0n5kvgxNj03cp8VYc12D16wa9MPX4RzuiTDfWzr/OFjVpNRNXtFB2lJl/YeEp0qz6nZMWAzFdlS9z6LIZxkof9DdyDUW2bwbrs2vnSdsV0tqjQcw2HZ5RsdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tmiRaclQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GuDm58dn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tmiRaclQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GuDm58dn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tmiRaclQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GuDm58dn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tmiRaclQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GuDm58dn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23CD91FB93;
	Wed,  7 Aug 2024 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723050135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T6vhuaxXYMMUxOrErNNlgnqYv5MQ78w34tq4fMc0VCQ=;
	b=tmiRaclQ8vaX7EBiNuatSy/DZKDdr3TMDQpe4zrY0EExveCZLHM+JWBr+xu5+wCF3zbveO
	Z41SIu68IRswMHkw/CdHHfIXW0szlsFhuIMglHTisZb3OhMdVkI6Wgee8bCXshm1xAWCl6
	Yb+l18L/qyMxCjK7WR7/ZmJs7XoO/d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723050135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T6vhuaxXYMMUxOrErNNlgnqYv5MQ78w34tq4fMc0VCQ=;
	b=GuDm58dnDW+U2InbGn+SeONNqAjigev2iZh8BV5yDPw/BHQqsQIpPX2T7Fwl8Wa2SkuVRG
	bIpwANMosbcE4CCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723050135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T6vhuaxXYMMUxOrErNNlgnqYv5MQ78w34tq4fMc0VCQ=;
	b=tmiRaclQ8vaX7EBiNuatSy/DZKDdr3TMDQpe4zrY0EExveCZLHM+JWBr+xu5+wCF3zbveO
	Z41SIu68IRswMHkw/CdHHfIXW0szlsFhuIMglHTisZb3OhMdVkI6Wgee8bCXshm1xAWCl6
	Yb+l18L/qyMxCjK7WR7/ZmJs7XoO/d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723050135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=T6vhuaxXYMMUxOrErNNlgnqYv5MQ78w34tq4fMc0VCQ=;
	b=GuDm58dnDW+U2InbGn+SeONNqAjigev2iZh8BV5yDPw/BHQqsQIpPX2T7Fwl8Wa2SkuVRG
	bIpwANMosbcE4CCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F37B413297;
	Wed,  7 Aug 2024 17:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YhY+Opaos2ZSGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 17:02:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming Laptop 16-n0xxx
Date: Wed,  7 Aug 2024 19:02:27 +0200
Message-ID: <20240807170249.16490-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.17)[-0.873];
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
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.77
X-Spam-Flag: NO
X-Spam-Level: 

Fix the missing mic on OMEN by HP Gaming Laptop 16-n0xxx by adding the
quirk entry with the board ID 8A44.

Cc: stable@vger.kernel.org
Link: https://bugzilla.suse.com/show_bug.cgi?id=1227182
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1769e07e83dc..2895962ecb8d 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -409,6 +409,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A44"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

