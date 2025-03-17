Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5A22ACD3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205450; cv=none; b=HkhLKUk1xedO5JT53KZHtDERhcuXg8kreizo1s1g7xuzJ5i1XIaRN+8I4gVd5Am5gl5PlGJ4tW7ZlR9b1EwRMZKCNeqFzw6QLAU4wAb+7USdX2CqR7WYYu4XHMRXGnN6Jcp9GDYZJRWPsvarSfrUaUfJ9TlkuIumMStvE3Bf8mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205450; c=relaxed/simple;
	bh=sYObX8orx7AtBLi1lBbyHlWeK8WKC9JreqOeBl/e48g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpS0doJhICmx9HTkyrVUOBVzGs11CRNDIjLXBzclSNFIdyMNvx/CrEIPgLCuuTZeLJsUmyjex4JM6eQOzOlLvkBCVUn2zbgJioKEH0kY1PzM6B13Tkr3BDL5JsMdrUnszmxdj7JXmNqcoCVwPzDWJYxQdBz8FnXFCu/GrkZ8SEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdgPTL/6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MztMrNdo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdgPTL/6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MztMrNdo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdgPTL/6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MztMrNdo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdgPTL/6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MztMrNdo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A557201A4;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x69nQ/Jk3RsOSLCYnD1wLTz8dOKgPGP4k9Fbu/os+1Q=;
	b=BdgPTL/67S7DxQTZjJl0xOB+7eFmQHSWCwgoRyStcB3FDyjo/rqfVyxFg1CEdSQT1Hi85o
	s7B4D4swQPTWMpse5qPBiOoYMa4smwcoQjT1MDVsFF7ztVtDrDmhmKIrdrfMdSaW10DCft
	ZgnU6jKrmxIlAGhmct66L7O76Vyl8d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x69nQ/Jk3RsOSLCYnD1wLTz8dOKgPGP4k9Fbu/os+1Q=;
	b=MztMrNdoTAhrblhGG50vjEk7ukMOmFbx61OJjb2QZ1DTgKYsTrQXRuMHylDWxYDF53TIjD
	iHA3aGd+7b+FFyBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x69nQ/Jk3RsOSLCYnD1wLTz8dOKgPGP4k9Fbu/os+1Q=;
	b=BdgPTL/67S7DxQTZjJl0xOB+7eFmQHSWCwgoRyStcB3FDyjo/rqfVyxFg1CEdSQT1Hi85o
	s7B4D4swQPTWMpse5qPBiOoYMa4smwcoQjT1MDVsFF7ztVtDrDmhmKIrdrfMdSaW10DCft
	ZgnU6jKrmxIlAGhmct66L7O76Vyl8d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x69nQ/Jk3RsOSLCYnD1wLTz8dOKgPGP4k9Fbu/os+1Q=;
	b=MztMrNdoTAhrblhGG50vjEk7ukMOmFbx61OJjb2QZ1DTgKYsTrQXRuMHylDWxYDF53TIjD
	iHA3aGd+7b+FFyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BC22132CF;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SFddDcDx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 18/88] ASoC: hdac_hdmi: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:40 +0100
Message-ID: <20250317095603.20073-19-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/hdac_hdmi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3bea5d09219a..1139a2754ca3 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2032,7 +2032,6 @@ static void hdmi_codec_remove(struct snd_soc_component *component)
 	pm_runtime_disable(&hdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hdmi_codec_resume(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
@@ -2055,9 +2054,6 @@ static int hdmi_codec_resume(struct device *dev)
 	hdac_hdmi_present_sense_all_pins(hdev, hdmi, false);
 	return 0;
 }
-#else
-#define hdmi_codec_resume NULL
-#endif
 
 static const struct snd_soc_component_driver hdmi_hda_codec = {
 	.probe			= hdmi_codec_probe,
@@ -2227,7 +2223,6 @@ static int hdac_hdmi_dev_remove(struct hdac_device *hdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int hdac_hdmi_runtime_suspend(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
@@ -2296,14 +2291,10 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#else
-#define hdac_hdmi_runtime_suspend NULL
-#define hdac_hdmi_runtime_resume NULL
-#endif
 
 static const struct dev_pm_ops hdac_hdmi_pm = {
-	SET_RUNTIME_PM_OPS(hdac_hdmi_runtime_suspend, hdac_hdmi_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, hdmi_codec_resume)
+	RUNTIME_PM_OPS(hdac_hdmi_runtime_suspend, hdac_hdmi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, hdmi_codec_resume)
 };
 
 static const struct hda_device_id hdmi_list[] = {
@@ -2322,7 +2313,7 @@ MODULE_DEVICE_TABLE(hdaudio, hdmi_list);
 static struct hdac_driver hdmi_driver = {
 	.driver = {
 		.name   = "HDMI HDA Codec",
-		.pm = &hdac_hdmi_pm,
+		.pm = pm_ptr(&hdac_hdmi_pm),
 	},
 	.id_table       = hdmi_list,
 	.probe          = hdac_hdmi_dev_probe,
-- 
2.43.0

