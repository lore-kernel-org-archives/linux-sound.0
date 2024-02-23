Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067018C38
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708677780; cv=none; b=po1YlDHeUVEOS5kp87sBEZg3y/8/Y0ZcvTNIqAZqerYUAu84DKsamPnH4Ai75C4VACAIqCp5VQcVwEGTkC+vKtCb6rfYtp3Jqe5Z3I8UF12vQF9i95kgZ7YUKdJpS923rHhZF/zkNeUHutqnJYYIFaxRs7G7FFal8475lLJHywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708677780; c=relaxed/simple;
	bh=cSoFf778q+A34BWVKcXpC15cj5nZVT9vGcg2+yMHjqY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B65lHPfmRKkPTaw0NxlnHKA2wsTrxrd+5U2tNDKT8qZbjD/LVIZar28BBXD3uGk38Yr1ZZfZq7hRAu7wuw/4Q+kG6BHzXU1SlAAsCPjqDzUKcwIWxF96MBuhHP0e4Dn85JR3ps3lRgKq2ZBUpJ1vnMbKo07uZwwdMxpbRyPqKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IyYJKe39; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K8LvuSI5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IyYJKe39; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K8LvuSI5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IyYJKe39";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K8LvuSI5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IyYJKe39";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K8LvuSI5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A26DE1F802;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kV+aUqBZy3gI4t9PCP6+S3GRAKdo3R5Kv7MOm4aiDa0=;
	b=IyYJKe39CPdagpY3yW8Uu6JazOY5uw4nuUuWizqZc+Mfi6Y77Jz2VjVltsaVOcda8GMOyc
	0ybhoOpC+RkGJeifBJ6eZnnbk6FeV0aPmQBkEQldmGlSE9H92l9Q/7lf9yUgLHxmiAWqof
	xIaCk6L1rHr0kxY0PY9ppbo1wi0GlvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kV+aUqBZy3gI4t9PCP6+S3GRAKdo3R5Kv7MOm4aiDa0=;
	b=K8LvuSI5DWBO9dfBMlm2cpKLvGYApwWbP4XUVZ6z6H6H6cc9f/pfJUOPfs7RnC82M0rj1y
	ikkFj9cOrjL580BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708677770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kV+aUqBZy3gI4t9PCP6+S3GRAKdo3R5Kv7MOm4aiDa0=;
	b=IyYJKe39CPdagpY3yW8Uu6JazOY5uw4nuUuWizqZc+Mfi6Y77Jz2VjVltsaVOcda8GMOyc
	0ybhoOpC+RkGJeifBJ6eZnnbk6FeV0aPmQBkEQldmGlSE9H92l9Q/7lf9yUgLHxmiAWqof
	xIaCk6L1rHr0kxY0PY9ppbo1wi0GlvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708677770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kV+aUqBZy3gI4t9PCP6+S3GRAKdo3R5Kv7MOm4aiDa0=;
	b=K8LvuSI5DWBO9dfBMlm2cpKLvGYApwWbP4XUVZ6z6H6H6cc9f/pfJUOPfs7RnC82M0rj1y
	ikkFj9cOrjL580BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82EDE13AB6;
	Fri, 23 Feb 2024 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8M6aHopa2GVDOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: pcm: Use CLASS() for fdget()/fdput()
Date: Fri, 23 Feb 2024 09:42:38 +0100
Message-Id: <20240223084241.3361-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223084241.3361-1-tiwai@suse.de>
References: <20240223084241.3361-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **
X-Spamd-Bar: ++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IyYJKe39;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=K8LvuSI5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.88 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.61)[81.97%]
X-Spam-Score: 2.88
X-Rspamd-Queue-Id: A26DE1F802
X-Spam-Flag: NO

Now we have a nice definition of CLASS(fd) that can be applied as a
clean up for the fdget/fdput pairs in snd_pcm_link().

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index beee5249dae1..0e84de4b484d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2265,28 +2265,22 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	struct snd_pcm_group *group __free(kfree) = NULL;
 	struct snd_pcm_group *target_group;
 	bool nonatomic = substream->pcm->nonatomic;
-	struct fd f = fdget(fd);
+	CLASS(fd, f)(fd);
 
 	if (!f.file)
 		return -EBADFD;
-	if (!is_pcm_file(f.file)) {
-		res = -EBADFD;
-		goto _badf;
-	}
+	if (!is_pcm_file(f.file))
+		return -EBADFD;
 
 	pcm_file = f.file->private_data;
 	substream1 = pcm_file->substream;
 
-	if (substream == substream1) {
-		res = -EINVAL;
-		goto _badf;
-	}
+	if (substream == substream1)
+		return -EINVAL;
 
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
-	if (!group) {
-		res = -ENOMEM;
-		goto _badf;
-	}
+	if (!group)
+		return -ENOMEM;
 
 	snd_pcm_group_init(group);
 
@@ -2318,8 +2312,6 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	snd_pcm_group_unlock_irq(target_group, nonatomic);
  _end:
 	up_write(&snd_pcm_link_rwsem);
- _badf:
-	fdput(f);
 	return res;
 }
 
-- 
2.35.3

