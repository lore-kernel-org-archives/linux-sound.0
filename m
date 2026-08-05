Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F1476065
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938008; cv=none; b=g2jR80WcZ8GzSCVQ8bQ/L1lDgCicvKe9FrNSE3WcfjY9ONrIwvyv+LrgV0NYfxhTunvstB9v0rOYWBmi/nHs/WLuD/nrqq8oF3I1Q4wfazWSdzydfwNAuYZJzHrCn4dS4TYwmpZdVeU73/8YNLKuplMoNE+dKSR1eAbwflt6WfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938008; c=relaxed/simple;
	bh=1xHkeiljXW7ZhtUUtExQgorKTFG0T2j6+qs/k/6d8eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMsnuYSxshF3GJeKBBcJ+enKllT7sCNV3DjTH1X2S/ug5XzoxJ2qx2xQ0ngE3BunNmJ7hpG1q44aA/RCe9Qtc3NFZNwnbW8sPwpFFmrZvRu+apDQzeDp0S3/XdxsCdAvzbx9Sx1GdOoPRMF7z1y31+Pa0ZMicI2YYB8ulyE55QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Husp9qeU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1OjvfIYF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WVKDn03Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Lv4N+ByW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Husp9qeU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1OjvfIYF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WVKDn03Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Lv4N+ByW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BDC87F10E;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQLqpEKsw3yvtXFK1OQBSrdxN5VqSLi6xz8MdJH7h5E=;
	b=Husp9qeUevHPFQsGghb5ykfxuZSqdQr0hFGl6q3DKu5e78L7oOboki5/3O8EpMA8Iy51BK
	zEb2w5TgapNyGWobh7UsWOlcnDxmWu+mycIcAHzP44ZcXMPjRaq8GkirJJguSiHc+a5m12
	EIAk9gUqf6Z6mUJuD0zGfdBA+irUfmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQLqpEKsw3yvtXFK1OQBSrdxN5VqSLi6xz8MdJH7h5E=;
	b=1OjvfIYFiMKxOIATc6fmlgTdGZQmk02Sw7uZJ9ocmizaZQGqaS5nh73HdiR7kMOGyLvpzx
	Y7k9v0/KkMLS5JDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WVKDn03Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Lv4N+ByW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQLqpEKsw3yvtXFK1OQBSrdxN5VqSLi6xz8MdJH7h5E=;
	b=WVKDn03QkzY16nSo/X3MIbmurNLChiv34aXu2AtmXqo06NqvwIjcsT6vUJOYiPaFToLjTm
	fxFJjexvW3VGoNIJMQcGxTucrsTEAWv/OLO85iRsgdiPHDxkUx82IwddUh9DotyUCoswaD
	v3MDWsgBWrFAjCmKZhGb6nyuz412OqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQLqpEKsw3yvtXFK1OQBSrdxN5VqSLi6xz8MdJH7h5E=;
	b=Lv4N+ByWIaGnU38Fo6jjY8CLM2VHpjQWOQ6xTsb8Y0kf+XvgDBYZJg2sWvkpYb00MZLxHl
	BhXkSd+UG5b79PAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65E4677A07;
	Wed,  5 Aug 2026 13:53:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wI+7FzxAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:53:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH 30/31] ASoC: SDCA: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:31 +0200
Message-ID: <20260805135247.670693-31-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,cirrus.com:email,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 9BDC87F10E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sdca/sdca_fdl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index dbe572336f8c..150e36ed24bc 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -195,7 +195,6 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
-	const struct firmware *firmware = NULL;
 	struct acpi_sw_file *swf = NULL, *tmp;
 	struct sdca_fdl_file *fdl_file;
 	char *disk_filename;
@@ -230,6 +229,7 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 
 	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
 
+	const struct firmware *firmware __free(firmware) = NULL;
 	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
 	kfree(disk_filename);
 	if (ret) {
@@ -258,8 +258,7 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 
 	if (!swf) {
 		dev_err(dev, "failed to locate SWF\n");
-		ret = -ENOENT;
-		goto error;
+		return -ENOENT;
 	}
 
 	dev_info(dev, "loading SWF: %x-%x-%x\n",
@@ -271,9 +270,6 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
 				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
 				     swf->file_length - offsetof(struct acpi_sw_file, data));
-
-error:
-	release_firmware(firmware);
 	return ret;
 }
 
-- 
2.55.0

