Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780381922DE
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200122; cv=none; b=Yor6MnvV/1yoqaYA0x8VxHZ3UZaoxKzM12WvHH6qKtkhe5oQ+1ZWsPqHJ24R72+uMRu3dnyattFiZs6saDd/ymBiE4KHOSn4S0hUhChFMZy14Ka68NIRh9t8ptaFDz6wMgzMCsuIfcql38eXmOdWI7uGX0b+tinpfCRuhL4BbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200122; c=relaxed/simple;
	bh=FILX9zwK1JJiuVX7N+QIlyPld/dBnp4PadFF98r8HMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyLyLzjgB6ywwWA5T6edngiDBGKtLPITAtxNHLb9TYsQHkwTHhtO+hZzyFoSdAbliKUdCPUtk9lK2+o7ROnBPRlfkwffXfgkZkckrHaregTznbt89NfkHddx+w4Cdli+YSk3VE3QtIo6XBzGdUXeEEjnpYffU+6AdYSbVrERJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nONr3+kH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vXf7ZGia; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nONr3+kH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vXf7ZGia; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nONr3+kH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vXf7ZGia";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nONr3+kH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vXf7ZGia"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B133B1FF44;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTFJtlOHnQMvYib/h01i3nModf+tshUV+fVIhuqQzn8=;
	b=nONr3+kHRIwNpxwYHfAypglLwHhIvqxyVNfxvUWzlBP+ryc6i4fdRZQT3lxANi4gElogQP
	pj7beTi3wMdewOI8I3THn9/BWSfLNo4qYQEvWjf9Qsaz6LBeVvhMzm/LjfddQrB5BaJLVu
	O/UuEmd7PjOHj3efR625+V5zLM4tFYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTFJtlOHnQMvYib/h01i3nModf+tshUV+fVIhuqQzn8=;
	b=vXf7ZGiaxlS95yHq+lhhgqkhUtN+XONknnp+V7BdI1M35u/f5ApDslRmThCMF/38KZz/0P
	wejmy9JmixEtueDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nONr3+kH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vXf7ZGia
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTFJtlOHnQMvYib/h01i3nModf+tshUV+fVIhuqQzn8=;
	b=nONr3+kHRIwNpxwYHfAypglLwHhIvqxyVNfxvUWzlBP+ryc6i4fdRZQT3lxANi4gElogQP
	pj7beTi3wMdewOI8I3THn9/BWSfLNo4qYQEvWjf9Qsaz6LBeVvhMzm/LjfddQrB5BaJLVu
	O/UuEmd7PjOHj3efR625+V5zLM4tFYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTFJtlOHnQMvYib/h01i3nModf+tshUV+fVIhuqQzn8=;
	b=vXf7ZGiaxlS95yHq+lhhgqkhUtN+XONknnp+V7BdI1M35u/f5ApDslRmThCMF/38KZz/0P
	wejmy9JmixEtueDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9231913A7D;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8MA3IXbytWaqTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 10:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: Drop snd_soc_*_get_kcontrol_locked()
Date: Fri,  9 Aug 2024 12:42:31 +0200
Message-ID: <20240809104234.8488-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809104234.8488-1-tiwai@suse.de>
References: <20240809104234.8488-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: B133B1FF44
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO

The recent cleanup in ALSA control core made no difference between
snd_ctl_find_id_mixer() and snd_ctl_find_id_mixer_locked(), and the
latter is to be dropped.  The only user of the left API was ASoC, and
that's snd_soc_card_get_kcontrol_locked() and
snd_soc_component_get_kcontrol_locked().

This patch drops those functions and rewrites those users to call the
variant without locked instead.  The test of the API became
superfluous, hence dropped as well.

As all callers of snd_ctl_find_id_mixer_locked() are gone,
snd_ctl_find_id_mixer_locked() is finally dropped, too.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h       |  7 -----
 include/sound/soc-card.h      |  2 --
 include/sound/soc-component.h |  3 --
 sound/soc/codecs/cs35l45.c    |  2 +-
 sound/soc/fsl/fsl_xcvr.c      |  2 +-
 sound/soc/soc-card-test.c     | 57 -----------------------------------
 sound/soc/soc-card.c          | 10 ------
 sound/soc/soc-component.c     | 12 --------
 8 files changed, 2 insertions(+), 93 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 4851a86c72ef..e31bd8e36bfa 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -165,13 +165,6 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 	return snd_ctl_find_id(card, &id);
 }
 
-/* to be removed */
-static inline struct snd_kcontrol *
-snd_ctl_find_id_mixer_locked(struct snd_card *card, const char *name)
-{
-	return snd_ctl_find_id_mixer(card, name);
-}
-
 int snd_ctl_create(struct snd_card *card);
 
 int snd_ctl_register_ioctl(snd_kctl_ioctl_func_t fcn);
diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f4c39922d82..ecc02e955279 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -30,8 +30,6 @@ static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
-struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
-						      const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
 			  struct snd_soc_jack *jack);
 int snd_soc_card_jack_new_pins(struct snd_soc_card *card, const char *id,
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index bf2e381cd124..61534ac0edd1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -464,9 +464,6 @@ int snd_soc_component_force_enable_pin_unlocked(
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
 						    const char * const ctl);
-struct snd_kcontrol *
-snd_soc_component_get_kcontrol_locked(struct snd_soc_component *component,
-				      const char * const ctl);
 int snd_soc_component_notify_control(struct snd_soc_component *component,
 				     const char * const ctl);
 
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 1e9d73bee3b4..fa1d9d9151f9 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -177,7 +177,7 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	struct snd_kcontrol_volatile *vd;
 	unsigned int index_offset;
 
-	kcontrol = snd_soc_component_get_kcontrol_locked(component, ctl_name);
+	kcontrol = snd_soc_component_get_kcontrol(component, ctl_name);
 	if (!kcontrol) {
 		dev_err(component->dev, "Can't find kcontrol %s\n", ctl_name);
 		return -EINVAL;
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index bf9a4e90978e..c98e3db74fe7 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -186,7 +186,7 @@ static int fsl_xcvr_activate_ctl(struct snd_soc_dai *dai, const char *name,
 
 	lockdep_assert_held(&card->snd_card->controls_rwsem);
 
-	kctl = snd_soc_card_get_kcontrol_locked(card, name);
+	kctl = snd_soc_card_get_kcontrol(card, name);
 	if (kctl == NULL)
 		return -ENOENT;
 
diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index e4a4b101d743..47dfd8b1babc 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -67,62 +67,6 @@ static void test_snd_soc_card_get_kcontrol(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, kc);
 }
 
-static void test_snd_soc_card_get_kcontrol_locked(struct kunit *test)
-{
-	struct soc_card_test_priv *priv = test->priv;
-	struct snd_soc_card *card = priv->card;
-	struct snd_kcontrol *kc, *kcw;
-	struct soc_mixer_control *mc;
-	int i, ret;
-
-	ret = snd_soc_add_card_controls(card, test_card_controls, ARRAY_SIZE(test_card_controls));
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	/* Look up every control */
-	for (i = 0; i < ARRAY_SIZE(test_card_controls); ++i) {
-		down_read(&card->snd_card->controls_rwsem);
-		kc = snd_soc_card_get_kcontrol_locked(card, test_card_controls[i].name);
-		up_read(&card->snd_card->controls_rwsem);
-		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kc, "Failed to find '%s'\n",
-						 test_card_controls[i].name);
-		if (!kc)
-			continue;
-
-		/* Test that it is the correct control */
-		mc = (struct soc_mixer_control *)kc->private_value;
-		KUNIT_EXPECT_EQ_MSG(test, mc->shift, i, "For '%s'\n", test_card_controls[i].name);
-
-		down_write(&card->snd_card->controls_rwsem);
-		kcw = snd_soc_card_get_kcontrol_locked(card, test_card_controls[i].name);
-		up_write(&card->snd_card->controls_rwsem);
-		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kcw, "Failed to find '%s'\n",
-						 test_card_controls[i].name);
-
-		KUNIT_EXPECT_PTR_EQ(test, kc, kcw);
-	}
-
-	/* Test some names that should not be found */
-	down_read(&card->snd_card->controls_rwsem);
-	kc = snd_soc_card_get_kcontrol_locked(card, "None");
-	up_read(&card->snd_card->controls_rwsem);
-	KUNIT_EXPECT_NULL(test, kc);
-
-	down_read(&card->snd_card->controls_rwsem);
-	kc = snd_soc_card_get_kcontrol_locked(card, "Left None");
-	up_read(&card->snd_card->controls_rwsem);
-	KUNIT_EXPECT_NULL(test, kc);
-
-	down_read(&card->snd_card->controls_rwsem);
-	kc = snd_soc_card_get_kcontrol_locked(card, "Left");
-	up_read(&card->snd_card->controls_rwsem);
-	KUNIT_EXPECT_NULL(test, kc);
-
-	down_read(&card->snd_card->controls_rwsem);
-	kc = snd_soc_card_get_kcontrol_locked(card, NULL);
-	up_read(&card->snd_card->controls_rwsem);
-	KUNIT_EXPECT_NULL(test, kc);
-}
-
 static int soc_card_test_case_init(struct kunit *test)
 {
 	struct soc_card_test_priv *priv;
@@ -169,7 +113,6 @@ static void soc_card_test_case_exit(struct kunit *test)
 
 static struct kunit_case soc_card_test_cases[] = {
 	KUNIT_CASE(test_snd_soc_card_get_kcontrol),
-	KUNIT_CASE(test_snd_soc_card_get_kcontrol_locked),
 	{}
 };
 
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 0a3104d4ad23..8e9546fe7428 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -29,16 +29,6 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 	return ret;
 }
 
-struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
-						      const char *name)
-{
-	if (unlikely(!name))
-		return NULL;
-
-	return snd_ctl_find_id_mixer_locked(soc_card->snd_card, name);
-}
-EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol_locked);
-
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 42f481321919..b3d7bb91e294 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -257,18 +257,6 @@ struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *co
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_get_kcontrol);
 
-struct snd_kcontrol *
-snd_soc_component_get_kcontrol_locked(struct snd_soc_component *component,
-				      const char * const ctl)
-{
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-
-	soc_get_kcontrol_name(component, name, ARRAY_SIZE(name), ctl);
-
-	return snd_soc_card_get_kcontrol_locked(component->card, name);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_get_kcontrol_locked);
-
 int snd_soc_component_notify_control(struct snd_soc_component *component,
 				     const char * const ctl)
 {
-- 
2.43.0

