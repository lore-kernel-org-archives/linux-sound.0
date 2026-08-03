Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4183955CF
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765422; cv=none; b=SRYvDNBmAVg7fS9q685sqAdTE6kOiuxDEEtRRhZM9Jr1FG9B4voqbdELzYTZNjOUY3f5dg4+JAnNpisL4TBQAuoBYO6P0tolLbHHsJWpHaMRC3paFBKHNuHAmXsIefZmh3fwvblmBDKZ2+0NpvBDa8FDHsbu9Y26fst3xTe+JoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765422; c=relaxed/simple;
	bh=JEnj9YEDwUELc9ckUJABg6tErAKXACY3kWLjY9xrkIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=flIwYHKslGAQvfKZaBPdpKiJbd8nF/uXrB3BKFN6vRmA/CHD8v6qmlAafJh8/ack+qRM8KmJ9lk3md7zqeH7LdiG8wP1X2x6Cs1ONnUt5Z3vKKahpw9ipNig2jr3zcQyeUi2Rrx1nRoo7CqgQo+2AvD6p/nc4mcobe2Uz8/+Hlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XC57oX8Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/pOnVIDd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ETxcsZ4b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VWN9xz1A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XC57oX8Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/pOnVIDd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ETxcsZ4b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VWN9xz1A"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA0ED3E08;
	Mon,  3 Aug 2026 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Re1tKK9V99KqbrP+BIEzaOuo1P0UqZbTKJqmY+TCX5U=;
	b=XC57oX8Z8dVsYkeXI3xnRW4bZAAELNcPAblh+HY7xL3S8pmjgSxm83c3AGURfDaS+ajx0A
	yxKo/RQRV+ImZ8jobDqHQkRzcJDhuTVwvRqIqsSSHIbsKZTybQwZHs3Z0JkQ+TvF04r4rw
	P00Ubk2QaDeQ7efA5PYTUWBn9jHFVLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Re1tKK9V99KqbrP+BIEzaOuo1P0UqZbTKJqmY+TCX5U=;
	b=/pOnVIDdWjYHzSoJUc9B8VIoI055WWf0+rtsLqLL4wCPJIGDxbIUHP3PUZH+R2sWs4fwuh
	YpP7uqpaSh5NT2BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ETxcsZ4b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VWN9xz1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Re1tKK9V99KqbrP+BIEzaOuo1P0UqZbTKJqmY+TCX5U=;
	b=ETxcsZ4bD7CL0OjHglYygdhp+hW/zku6Ua/25zq0LTUs1kFsYWEXKT19O7TqSoMkaLwvSt
	mQLM/+0YbfTcTGkCVaZI4Mld3LOW+m/zSYJ6p6uuSbM9SZtOnI+KWw8Ra50On3Y1m8VF6i
	daOtz/pc0BR8HfGAuGKFRDP0VnFj1O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Re1tKK9V99KqbrP+BIEzaOuo1P0UqZbTKJqmY+TCX5U=;
	b=VWN9xz1AWyq0LskplyE38XCtYApd6BG8pSY/QdmreZWlHP57QzqNUotGFUnQYqEOEGzWLd
	5EBY04kyiUQZEkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7399F779A1;
	Mon,  3 Aug 2026 13:56:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ufTxGiKecGriIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 13:56:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sdw_utils: Use auto-cleanup for put_device()
Date: Mon,  3 Aug 2026 15:56:12 +0200
Message-ID: <20260803135648.917760-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: AA0ED3E08
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

A temporary refcount management of a struct device can be done
gracefully with __clean(put_device) for avoiding potential leaks.

No functional change but just a code cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 36 ++++++++++-------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d4074309fa81..8a07ba2a29e5 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1818,9 +1818,7 @@ static int is_sdca_aux_dev_present(struct device *dev,
 				   int adr_index)
 {
 	struct sdw_slave *slave;
-	struct device *sdw_dev;
 	const char *sdw_codec_name;
-	int ret = 0;
 	int i;
 
 	if (!aux_codec_name)
@@ -1830,7 +1828,8 @@ static int is_sdca_aux_dev_present(struct device *dev,
 	if (!sdw_codec_name)
 		return -ENOMEM;
 
-	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
+	struct device *sdw_dev __free(put_device) =
+		bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
 	if (!sdw_dev) {
 		dev_err(dev, "codec %s not found\n", sdw_codec_name);
 		return -EINVAL;
@@ -1840,24 +1839,19 @@ static int is_sdca_aux_dev_present(struct device *dev,
 
 	if (!slave->sdca_data.interface_revision) {
 		dev_warn(dev, "No SDCA properties, assuming aux '%s' present\n", aux_codec_name);
-		ret = 1;
-		goto put_dev;
+		return 1;
 	}
 
 	for (i = 0; i < slave->sdca_data.num_functions; i++) {
 		const char *fname = slave->sdca_data.function[i].name;
 
-		if (fname && strstr(aux_codec_name, fname)) {
-			ret = 1;
-			goto put_dev;
-		}
+		if (fname && strstr(aux_codec_name, fname))
+			return 1;
 	}
 
 	dev_dbg(dev, "SDCA function for aux '%s' NOT FOUND on slave, skipping\n", aux_codec_name);
 
-put_dev:
-	put_device(sdw_dev);
-	return ret;
+	return 0;
 }
 
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
@@ -1957,9 +1951,8 @@ static int is_sdca_endpoint_present(struct device *dev,
 	const struct snd_soc_acpi_endpoint *adr_end;
 	const struct asoc_sdw_dai_info *dai_info;
 	struct sdw_slave *slave;
-	struct device *sdw_dev;
 	const char *sdw_codec_name;
-	int ret, i;
+	int i;
 
 	adr_end = &adr_dev->endpoints[end_index];
 	dai_info = &codec_info->dais[adr_end->num];
@@ -1968,7 +1961,8 @@ static int is_sdca_endpoint_present(struct device *dev,
 	if (!sdw_codec_name)
 		return -ENOMEM;
 
-	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
+	struct device *sdw_dev __free(put_device) =
+		bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
 	if (!sdw_dev) {
 		dev_err(dev, "codec %s not found\n", sdw_codec_name);
 		return -EINVAL;
@@ -1979,8 +1973,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 	/* Make sure BIOS provides SDCA properties */
 	if (!slave->sdca_data.interface_revision) {
 		dev_warn(&slave->dev, "SDCA properties not found in the BIOS\n");
-		ret = 1;
-		goto put_device;
+		return 1;
 	}
 
 	for (i = 0; i < slave->sdca_data.num_functions; i++) {
@@ -1989,8 +1982,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 		if (dai_type == dai_info->dai_type) {
 			dev_dbg(&slave->dev, "DAI type %d sdca function %s found\n",
 				dai_type, slave->sdca_data.function[i].name);
-			ret = 1;
-			goto put_device;
+			return 1;
 		}
 	}
 
@@ -1998,11 +1990,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 		"SDCA device function for DAI type %d not supported, skip endpoint\n",
 		dai_info->dai_type);
 
-	ret = 0;
-
-put_device:
-	put_device(sdw_dev);
-	return ret;
+	return 0;
 }
 
 int asoc_sdw_parse_sdw_endpoints(struct device *dev,
-- 
2.55.0

