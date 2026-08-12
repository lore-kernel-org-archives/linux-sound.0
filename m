Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AF3264C3
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514791; cv=none; b=ZK8kmM7ceuDdK9OttGQASCNkyJQIVKDX2AW8PQNqEa0BaRQ8MZK99S7nXFcGBUA48cCn+b8vqssYtt9uUSxZ3HFG9syQqMz2JvnN5V4ShHBajfTIIJxIzB2Tux5p0w+Pq14wJZoOTQOCz4y63Tdr7aggA24pBKVsQhCgmBeRYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514791; c=relaxed/simple;
	bh=32+R3iMXppNxMVZO+3BK8Bq+fLo5e8ffNlcExIHUaZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMGup5IPixXjUZvI8jR3h+Cc22XMI3KUCWMHXoJjvLMjICTDn5gbKDi9+5ZxXAFk7oFVbBA9OnfyizfVxxWsNLazcKL/Q4sEah1yYiy9qqZIgneCIzft4YTDgUZA6Qh96oCqUMkjHHPixoLkngHBhPE/Rk6ai/xm7BBfiaxzWRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dbGTSh4m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CDjKXfQy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FjipAiYS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UdL0N0Q2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dbGTSh4m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDjKXfQy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FjipAiYS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UdL0N0Q2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66B50820EA;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=il2DIiU7dJkol4bFFQmahObK4pF5TqUthZhdFrbYhEQ=;
	b=dbGTSh4m5SngVLbUNEXXHN9TZuwK2coa78OGHmQAonFCvQOjbV70pESvChq3rNW8P+VHWq
	c/3TdrgZYgVOb9gKrUnyrGOVPD+X+4nFCsU0FwHoani3SuMhl3RUhkHLA2eJG9EJWQ/a+C
	528Qf8448wLHaSrA4PUrouTG9PGwC/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=il2DIiU7dJkol4bFFQmahObK4pF5TqUthZhdFrbYhEQ=;
	b=CDjKXfQy/d84Df75Lt8NWc1h2cTsncse1u/MIkCETWLSMueZjBfQV9GXeLLjQAci3o2Qcy
	VX4YXYNvmigk2XCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=il2DIiU7dJkol4bFFQmahObK4pF5TqUthZhdFrbYhEQ=;
	b=FjipAiYSOb3TpbIEDChrERZcgAGshaTaJvnkKcQ5PQ1EXYNPPSZKU/xKFfq6iYkUuMyisV
	U5uUuKFoHipoC/fX5aDpiwbBh3OYsTc0TIJdEmtd12+vYwYujJpr2v2+B61tUIxhwiUtXl
	bp5CJlTw6gubdXvxYm0DDD3mv/hhdKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=il2DIiU7dJkol4bFFQmahObK4pF5TqUthZhdFrbYhEQ=;
	b=UdL0N0Q2PX4c4pF79+mo4zG+McEOyYMQp0Wx/xGa4/QjhePV6JHJz4qIJhDP1ouoZXmlTc
	N4Ddntj9YwOoZtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6768F779D1;
	Wed, 12 Aug 2026 06:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UG4QGFUNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 12/14] ASoC: Intel: avs: Drop __force cast
Date: Wed, 12 Aug 2026 08:04:44 +0200
Message-ID: <20260812060557.80445-13-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop a superfluous cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/avs/probes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3..74096236984a 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -144,7 +144,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
 	if (ret < 0)
 		return ret;
-	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);
+	bps = snd_pcm_format_physical_width(params->codec.format);
 	if (bps < 0)
 		return bps;
 	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
-- 
2.55.0

