Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A6473C83
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938008; cv=none; b=JnArJt3/ZEIhDLUor45DmbR1WfSwUTmhkl9g80owMlpG/q+vJhLZ8nxEuFyjtRp0/sP1WgSRSKJkPYgN/QvFk8FI7vOyIrftTHhf+j3WFe68KCcWv4/UQu9SThFhn7a2qnFQ/o6izB89yCa85u80Q457Zqdz5U/JXTvXWQ8Iqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938008; c=relaxed/simple;
	bh=UvaE/P1H0e1QIbXjQina9c8PvTRl0kHeeudR8fBrSh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFAXJ5wjYjHuG5LnRbmWf7wdpGYkUWWYDvN1ZaZ4WagyqNDn7vNP19T8yOSMPfhxQTWx4iAgF0BmkvUKoDxi50G7AryyONHnNyOdfr7PK7oZNRX6m8S0tw9zDRy+iDnuWWqhui0wuB/zcMIN7iCEv9HCWvr5sYgb5YWoE0pX/LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KDc+1S5a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r5+cEd+0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z09rfLWB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BrqP88GR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KDc+1S5a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r5+cEd+0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z09rfLWB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BrqP88GR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F9F97F10F;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1I7S0sgcUk5MHyDTC+nGjZPmuRmJpRmNfRG3gDRyNE=;
	b=KDc+1S5awpat58E4aNtz2Cg8U19mpv0PNglELtnKmOsYIU+tWifAE8rrI7Mh7OOtDBp41B
	ZE6HW4uZoZa/rYr4GK/PlDCYMQ04ftrz5QZlU+7LRpkmwJMIN6ObyLyy3JzGbZJPlMleog
	TBfxZls4w4iT76NXQ0lcVaduZW4Bl4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1I7S0sgcUk5MHyDTC+nGjZPmuRmJpRmNfRG3gDRyNE=;
	b=r5+cEd+0J6lUw/J6wecVYOb2G42iiEw8nPejS0EjHUpu2/q+kz2UaaV0loV7rQrGq5chJG
	jNQ+oUXqKVCPpfBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1I7S0sgcUk5MHyDTC+nGjZPmuRmJpRmNfRG3gDRyNE=;
	b=Z09rfLWBO8k7IUwOYgXuliDopqjNUvtcFr6OKVyNAWu9Wyy4RBvFdUd8MuHzN1r6iVTala
	3Pqv6xP3gKTBGONmKk4DU59/fLmX0TAzLgt2EtwaF80UBN9p6p9Sr1ESjbvdMhVS23C3Oo
	UoSbkGzGsA7/Fx9xf+ZFE2dNHImplCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1I7S0sgcUk5MHyDTC+nGjZPmuRmJpRmNfRG3gDRyNE=;
	b=BrqP88GRK0Fw1IXq2OzEwripkKMGGUFDo5XYNllD/UurskieLEFE36eei+g0XBvBoxKuAj
	nXY5DTZxhp4gUrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F12F77A08;
	Wed,  5 Aug 2026 13:53:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oMGlJTxAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:53:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 31/31] ASoC: SOF: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:32 +0200
Message-ID: <20260805135247.670693-32-tiwai@suse.de>
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
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com,nxp.com,linux.dev,amd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,intel.com:email,linux.dev:email,nxp.com:email,imap1.dmz-prg2.suse.org:helo,amd.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

Simplify the code to manage the firmware loading with __free(firmware)
and __free(kfree) auto-cleanups for the firmware data and the temporary
string or array.

Only the code refactoring, no functional changes.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/fw-file-profile.c | 19 +++++++------------
 sound/soc/sof/topology.c        | 20 ++++++--------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 76bde2e0be1d..fcd57f04ca36 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -16,20 +16,19 @@ static int sof_test_firmware_file(struct device *dev,
 				  enum sof_ipc_type *ipc_type_to_adjust)
 {
 	enum sof_ipc_type fw_ipc_type;
-	const struct firmware *fw;
-	const char *fw_filename;
 	const u32 *magic;
 	int ret;
 
-	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
-				profile->fw_name);
+	const char *fw_filename __free(kfree) =
+		kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
+			  profile->fw_name);
 	if (!fw_filename)
 		return -ENOMEM;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	ret = firmware_request_nowarn(&fw, fw_filename, dev);
 	if (ret < 0) {
 		dev_dbg(dev, "Failed to open firmware file: %s\n", fw_filename);
-		kfree(fw_filename);
 		return ret;
 	}
 
@@ -44,8 +43,7 @@ static int sof_test_firmware_file(struct device *dev,
 		break;
 	default:
 		dev_err(dev, "Invalid firmware magic: %#x\n", *magic);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (ipc_type_to_adjust) {
@@ -54,13 +52,10 @@ static int sof_test_firmware_file(struct device *dev,
 		dev_err(dev,
 			"ipc type mismatch between %s and expected: %d vs %d\n",
 			fw_filename, fw_ipc_type, profile->ipc_type);
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-out:
-	release_firmware(fw);
-	kfree(fw_filename);
 
-	return ret;
+	return 0;
 }
 
 static int sof_test_topology_file(struct device *dev,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 6fd69ba11c41..820513bb2577 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2506,13 +2506,12 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const char *tplg_filename_prefix = sof_pdata->tplg_filename_prefix;
-	const struct firmware *fw;
-	const char **tplg_files;
 	int tplg_cnt = 0;
 	int ret;
 	int i;
 
-	tplg_files = kcalloc(scomp->card->num_links, sizeof(char *), GFP_KERNEL);
+	const char **tplg_files __free(kfree) =
+		kcalloc(scomp->card->num_links, sizeof(char *), GFP_KERNEL);
 	if (!tplg_files)
 		return -ENOMEM;
 
@@ -2538,10 +2537,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 								       tplg_filename_prefix,
 								       &tplg_files,
 								       no_fallback);
-		if (tplg_cnt < 0) {
-			kfree(tplg_files);
+		if (tplg_cnt < 0)
 			return tplg_cnt;
-		}
 	}
 
 	/*
@@ -2552,8 +2549,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		if (strstr(file, "dummy")) {
 			dev_err(scomp->dev,
 				"Function topology is required, please upgrade sof-firmware\n");
-
-			kfree(tplg_files);
 			return -EINVAL;
 		}
 		tplg_files[0] = file;
@@ -2568,6 +2563,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		if (tplg_files[0] != file)
 			dev_info(scomp->dev, "loading topology %d: %s\n", i, tplg_files[i]);
 
+		const struct firmware *fw __free(firmware) = NULL;
 		ret = request_firmware(&fw, tplg_files[i], scomp->dev);
 		if (ret < 0) {
 			/*
@@ -2586,8 +2582,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		else
 			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
 
-		release_firmware(fw);
-
 		if (ret < 0) {
 			dev_err(scomp->dev, "tplg %s component load failed %d\n",
 				tplg_files[i], ret);
@@ -2606,6 +2600,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 			goto out;
 		}
 		dev_info(scomp->dev, "loading feature topology %d: %s\n", i, feature_topology);
+
+		const struct firmware *fw __free(firmware) = NULL;
 		ret = request_firmware(&fw, feature_topology, scomp->dev);
 		if (ret < 0) {
 			/*
@@ -2630,8 +2626,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		else
 			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
 
-		release_firmware(fw);
-
 		if (ret < 0) {
 			dev_err(scomp->dev, "feature tplg %s component load failed %d\n",
 				feature_topologies[i], ret);
@@ -2650,8 +2644,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (ret >= 0 && sdev->led_present)
 		ret = snd_ctl_led_request();
 
-	kfree(tplg_files);
-
 	return ret;
 }
 EXPORT_SYMBOL(snd_sof_load_topology);
-- 
2.55.0

