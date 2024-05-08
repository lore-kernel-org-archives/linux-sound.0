Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022207441A
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159945; cv=none; b=QL8TzUgbVPcpOqU65MlolrwxNuJqj5Eh+F2hRkdMIQnQv61OkbbuRtaMeaTvY6Mfs1JsI1WEMqSrOE9IaOANC4TQDdOmyA8+H0avBZGPCnA0ysV++2YGN04i4YoQAZqxcIECIHDHbItMdWQDTTIW9wrOGAlJ98zy3H+t53LmZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159945; c=relaxed/simple;
	bh=uN7eSoA9J4Nslef00KvQqz/5Cz1QsVRq1ITXt7DL8Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Av7Q0Ur+4pUWq8cwXtZNYVnSkEE9fiLlC2j+z7FIQ3ff7bLz/c0oqYGq7XjHCv1A5xwHsbyzDUGuyxNvTkXw9iEFQXWQNKpwpVHpzySIJ8ptdc09ehtsYBOXBOwgPTlddQ0p2rJPcM/hhT2l9DRVOLlWz5qCpcwh0H5Qy/JsO2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ulKDxoLf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FJ0JaOna; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ulKDxoLf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FJ0JaOna; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ulKDxoLf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FJ0JaOna";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ulKDxoLf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FJ0JaOna"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 48BD634EA1;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdx+gpib0c7DxK2eLyiTVYHOuHnSIZ0mTNFq9+aWTpQ=;
	b=ulKDxoLfslor6HMC3xQviwpLwSJmxuHCR8dNzQPSzpK5Epw6zFlfax2Iw94n30fxDX2KBo
	qwqAeByZRxl8YjgWrR1HFs9yHqx4hSHU2LjxkYbBuWLVMajg0zaJmzIMmw2UyP2KeDRxz1
	FlJyZqenQDp68a9/sI3n5Wdy0dbh9Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdx+gpib0c7DxK2eLyiTVYHOuHnSIZ0mTNFq9+aWTpQ=;
	b=FJ0JaOnaZx6I5m0FQ9UBauA21ORgZkO5yTTcRaWUVtwr484mVzHKiTcH9Nj808AAJGWx9R
	+L+OfeMthdCb2vCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdx+gpib0c7DxK2eLyiTVYHOuHnSIZ0mTNFq9+aWTpQ=;
	b=ulKDxoLfslor6HMC3xQviwpLwSJmxuHCR8dNzQPSzpK5Epw6zFlfax2Iw94n30fxDX2KBo
	qwqAeByZRxl8YjgWrR1HFs9yHqx4hSHU2LjxkYbBuWLVMajg0zaJmzIMmw2UyP2KeDRxz1
	FlJyZqenQDp68a9/sI3n5Wdy0dbh9Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdx+gpib0c7DxK2eLyiTVYHOuHnSIZ0mTNFq9+aWTpQ=;
	b=FJ0JaOnaZx6I5m0FQ9UBauA21ORgZkO5yTTcRaWUVtwr484mVzHKiTcH9Nj808AAJGWx9R
	+L+OfeMthdCb2vCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1909813A3D;
	Wed,  8 May 2024 09:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AO/PBIVDO2bFGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:19:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 5/7] ASoC: topology-test: Add missing module description
Date: Wed,  8 May 2024 11:19:04 +0200
Message-ID: <20240508091909.27062-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091909.27062-1-tiwai@suse.de>
References: <20240508091909.27062-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-topology-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..40147788f22a 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -819,4 +819,5 @@ static struct kunit_suite snd_soc_tplg_test_suite = {
 
 kunit_test_suites(&snd_soc_tplg_test_suite);
 
+MODULE_DESCRIPTION("ASoC Topology Kernel Unit Tests");
 MODULE_LICENSE("GPL");
-- 
2.43.0

