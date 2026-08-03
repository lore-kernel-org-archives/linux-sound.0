Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991F0416869
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765680; cv=none; b=elul2LHDAvHC6/bs5+GqiG6/YxTC8fTdjB0angkuK7fv64pbsWl4I+A/o6cmkqoNHPCcvY7P9KGdAUHwFtHzSP8NGLwY8sK5WywRz/X3YL1A0ffpdfDFaTV7RbdWWxyoYCBRc2UuDAenq4Z0MB6HN9RFM5eIjT0n70BJOrG96jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765680; c=relaxed/simple;
	bh=1ExWyJ+dZZi4S3kQPgaJ68Ye+A1DvgbJ7HL4EvkMcAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPLrhP/rfODFdRkrfbU3R1TbHYJRIIee5O3OwITqVpTvt0bR/G9i158HVIfMwnomc9Y8lw+1KGKAF0DmFcmZxNh9T/8u5/6vidSaB8LbQzF73dbGsnJw7MMqDsBawwvrN61yrxS/Wbwylz6XM21fRi34B6P80wWK2T6078jffXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TZN+kiPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=21k0cSln; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iAu6BhgN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vluhJR2d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TZN+kiPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="21k0cSln";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iAu6BhgN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vluhJR2d"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B1C57F150;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC0nH62z09fJaip0k33gin2pp7w0b3RxzpvXFtei7Ug=;
	b=TZN+kiPqCyNcHvAmiKcGZEC83SIUA+LFw8NJdT//hUzJk0K6I+mYZkbU8AJGaekP3PC/bI
	2EzujOeTKbYnVIBNZ5sr5yQ+5GhPVs7KZe8BzM2b3cQEypsMm/UX4vPK5yhYUFA9IRYzGN
	3D5I4aY3899RUxrKXIYT5LoGvvUaTjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC0nH62z09fJaip0k33gin2pp7w0b3RxzpvXFtei7Ug=;
	b=21k0cSlntsvC96P/zRgjPg2ES4tseCqSI/xM0UJ5axPM8Qm5cBUvR13bTmzXnAda48bk64
	Rp1R/WkhZVZlKXCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC0nH62z09fJaip0k33gin2pp7w0b3RxzpvXFtei7Ug=;
	b=iAu6BhgNaV9R+hRdeKLsoS+I54/2uvt3axSBca2psPe/4wk8rnhH8X3JGVpYQv9o5TRLLf
	aWLbTpGutgYZK4ZlXTRNy17s1q1dqS5r+nIKlkJQ8WhMhcjKdRus0vMtIubKFghouoa7T8
	mlZpAQDfOPYBbT24/c+K8KIh63hskTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uC0nH62z09fJaip0k33gin2pp7w0b3RxzpvXFtei7Ug=;
	b=vluhJR2dvGsrVHZrV+ETf4LWRjnWhgQvb6LVI0zUBSgF5UZaj5YMh/UNLVyJhttw9c2OmU
	4EABdLQqk8gnYkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 395BD779C1;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFDNDB+fcGpJKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 14:01:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 2/3] ALSA: hda: tas2781: Use auto-cleanup for put_device()
Date: Mon,  3 Aug 2026 16:00:52 +0200
Message-ID: <20260803140100.919071-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803140100.919071-1-tiwai@suse.de>
References: <20260803140100.919071-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

A temporary refcount management of a struct device can be done
gracefully with __clean(put_device) for avoiding potential leaks.

No functional change but just a code cleanup.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Sen Wang <sen@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 6 ++----
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 9 ++++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 624db967f17b..6c502c34e015 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -88,7 +88,6 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 {
 	struct gpio_desc *speaker_id;
 	struct acpi_device *adev;
-	struct device *physdev;
 	LIST_HEAD(resources);
 	const char *sub;
 	uint32_t subid;
@@ -101,7 +100,8 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 		return -ENODEV;
 	}
 
-	physdev = get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) =
+		get_device(acpi_get_first_physical_node(adev));
 	ret = acpi_dev_get_resources(adev, &resources, tas2781_get_i2c_res, p);
 	if (ret < 0) {
 		dev_err(p->dev, "Failed to get ACPI resource.\n");
@@ -151,14 +151,12 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 end_2563:
 	acpi_dev_free_resource_list(&resources);
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
-	put_device(physdev);
 	acpi_dev_put(adev);
 
 	return 0;
 
 err:
 	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
-	put_device(physdev);
 	acpi_dev_put(adev);
 
 	return ret;
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 271c56a79c32..d3b2a746e1a7 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -328,7 +328,6 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 {
 	struct tasdevice_priv *p = tas_hda->priv;
 	struct acpi_device *adev;
-	struct device *physdev;
 	u32 values[HDA_MAX_COMPONENTS];
 	const char *property;
 	size_t nval;
@@ -341,7 +340,9 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 	}
 
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
-	physdev = get_device(acpi_get_first_physical_node(adev));
+
+	struct device *physdev __free(put_device) =
+		get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 	if (!physdev)
 		return -ENODEV;
@@ -381,13 +382,11 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 			goto err;
 		}
 	}
-	put_device(physdev);
 
 	return 0;
+
 err:
 	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
-	put_device(physdev);
-
 	return ret;
 }
 
-- 
2.55.0

