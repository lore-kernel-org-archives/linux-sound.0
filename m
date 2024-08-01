Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9290B16DC30
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498351; cv=none; b=JiQWkHnPKnIAVyt9X1rQnV17IiK/6M/mKs5u1V5XNQ9P3iLNnlLqrjAlVqqkjJ0FvmXFGTKiVtgTeooKVHZniSt8PouTwndi9DFMCS3WNjlemFCLgfSMd0Q0X31zHZiktXZ5yjrIa5aqF9E0SNdMJ/0s2gq+iaEk7AQj0dQh/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498351; c=relaxed/simple;
	bh=sJrm82/3eroqmeqYR2M+kAZ9APKEHhvUhVfSJVrmc7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBKIaL5/KsAi6uWTbm36ZufWNPzJNVNecl91m4uHxhIXzjaD2WnqTcgYOY5KSVNZb8XhqKO+YjoLbgeuf+oqFnusI5LRZSTbNchVhYvbiBho5k3EbHuY4kw4mmEhjB5RBFq/bZpsLW1mysUUeJOGhYE3dsLPYBUQNBIjx2aR4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ovTadocJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GDSoZThR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ovTadocJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GDSoZThR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ovTadocJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GDSoZThR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ovTadocJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GDSoZThR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D86BA21AA8;
	Thu,  1 Aug 2024 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGaEma7CgvQM/VjxVvTXr+lcp4ijHpOt/RMHUxgMuhg=;
	b=ovTadocJDCMDfVl8glYc4bN5jye1UwIdTyUsKuNafp3hPeK+kVYQtlk5Qj9zsvEip+7YB6
	D3F+5bSRcZ47t63fN7wWBkdBrat+wVhaMNbu4dDM9nx9q+gzZdqFGzvpMzpMYFyz3XV9eO
	MDAD/UCxMat4JqYwqrKsyL9dT96Myek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGaEma7CgvQM/VjxVvTXr+lcp4ijHpOt/RMHUxgMuhg=;
	b=GDSoZThR41z29Qhg852pEbsXNwAF1hM8oO1e1orrhybJK2Fph6W2lQXlaBvVIiH4nD1CLH
	87GkXwL7NJDkt2CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGaEma7CgvQM/VjxVvTXr+lcp4ijHpOt/RMHUxgMuhg=;
	b=ovTadocJDCMDfVl8glYc4bN5jye1UwIdTyUsKuNafp3hPeK+kVYQtlk5Qj9zsvEip+7YB6
	D3F+5bSRcZ47t63fN7wWBkdBrat+wVhaMNbu4dDM9nx9q+gzZdqFGzvpMzpMYFyz3XV9eO
	MDAD/UCxMat4JqYwqrKsyL9dT96Myek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGaEma7CgvQM/VjxVvTXr+lcp4ijHpOt/RMHUxgMuhg=;
	b=GDSoZThR41z29Qhg852pEbsXNwAF1hM8oO1e1orrhybJK2Fph6W2lQXlaBvVIiH4nD1CLH
	87GkXwL7NJDkt2CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAC4F13946;
	Thu,  1 Aug 2024 07:45:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KKxtLCs9q2YLBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 07:45:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: Drop snd_soc_card_get_kcontrol_locked()
Date: Thu,  1 Aug 2024 09:46:09 +0200
Message-ID: <20240801074617.4997-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801074617.4997-1-tiwai@suse.de>
References: <20240801074617.4997-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.60

The recent cleanup in ALSA control core made no difference between
snd_ctl_find_id_mixer() and snd_ctl_find_id_mixer_locked(), and the
latter is to be dropped.  The only user of the left API was ASoC, and
that's snd_soc_card_get_kcontrol_locked().

This patch drops snd_soc_card_get_kcontrol_locked() and rewrites its
users to call snd_soc_card_get_kcontrol() instead.  The test of the
API became superfluous, hence dropped as well.

As all callers of snd_ctl_find_id_mixer_locked() are gone,
snd_ctl_find_id_mixer_locked() is finally dropped, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h    |  7 -----
 include/sound/soc-card.h   |  2 --
 sound/soc/codecs/cs35l45.c |  2 +-
 sound/soc/fsl/fsl_xcvr.c   |  2 +-
 sound/soc/soc-card-test.c  | 57 --------------------------------------
 sound/soc/soc-card.c       | 10 -------
 6 files changed, 2 insertions(+), 78 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index 6f9d3b8350ce..e07f6b960641 100644
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
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 2392c6effed8..44c221745c3b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -184,7 +184,7 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	else
 		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", ctl_name);
 
-	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
+	kcontrol = snd_soc_card_get_kcontrol(component->card, name);
 	if (!kcontrol) {
 		dev_err(component->dev, "Can't find kcontrol %s\n", name);
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
-- 
2.43.0

