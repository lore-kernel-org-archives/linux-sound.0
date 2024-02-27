Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459851384A9
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709030960; cv=none; b=nhCS1vK0oumHTSyr83RJ5cHN3rflFQNTWiW2Ke4MnBEKffSrzg6gvwl/s/G6YVBA8HZtj+d7CLM9LXCPI61q5bziyafwFoxeMDxFiKiPAzmXk83TmGq485DOa5YCOXhjyp33NJ44FbhcJg4ytuEgu8XolXMCyDNi46qfSDVdykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709030960; c=relaxed/simple;
	bh=RoSAgznzILdWz7eBgKtZymTw5XFqvbcVj9vGy5i2zic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T6JPcspfZKx40hKh7yfof5gK9l/3QPi+f0eUnTRWcNTjVe7EidbK2Y+tLsot61scz+AZKnYKoIsPK8kzeow3Yb8hBdQj7XILdz+jVGCoi2fZ8BwVu+Qo5Uu7srriYPYi3ZKmdA93cvnYHK918eTw5hlqgMVoJokRyxR48wMKYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LxaUMD2o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zo+eq+lw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LxaUMD2o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zo+eq+lw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LxaUMD2o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zo+eq+lw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LxaUMD2o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zo+eq+lw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CDBC1F44F;
	Tue, 27 Feb 2024 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709030954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tsCcre0+Et8yZsuBCJCbh5lUN/tEu/eLZQ87wPqDmq8=;
	b=LxaUMD2oRF/OXF4r35iet9YqzKsqXTYgjVXfWWEUA+1n6U3e2k5MyXCqrW87sRT8ClGJWU
	pnk9sb9dHdmmQMCvhy3AIWNUF8T61Ojrxfj1su5d+HuT4oDh9uuG2sVXlQ8bs0ube/aLNt
	+PXCQyy0libKWYL9pe62Nl3lXls7qyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709030954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tsCcre0+Et8yZsuBCJCbh5lUN/tEu/eLZQ87wPqDmq8=;
	b=Zo+eq+lwsB9VQX62+qWSJ+VjhfLFZ5zCeaBXQi3sRkTkhpPh25RSP9II9cVO6+7d/Vk9Is
	vQZteIhB5uZsx/Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709030954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tsCcre0+Et8yZsuBCJCbh5lUN/tEu/eLZQ87wPqDmq8=;
	b=LxaUMD2oRF/OXF4r35iet9YqzKsqXTYgjVXfWWEUA+1n6U3e2k5MyXCqrW87sRT8ClGJWU
	pnk9sb9dHdmmQMCvhy3AIWNUF8T61Ojrxfj1su5d+HuT4oDh9uuG2sVXlQ8bs0ube/aLNt
	+PXCQyy0libKWYL9pe62Nl3lXls7qyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709030954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tsCcre0+Et8yZsuBCJCbh5lUN/tEu/eLZQ87wPqDmq8=;
	b=Zo+eq+lwsB9VQX62+qWSJ+VjhfLFZ5zCeaBXQi3sRkTkhpPh25RSP9II9cVO6+7d/Vk9Is
	vQZteIhB5uZsx/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B33713A65;
	Tue, 27 Feb 2024 10:49:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EJXfDSq+3WUNBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 10:49:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: [PATCH] ALSA: kunit: Fix sparse warnings
Date: Tue, 27 Feb 2024 11:49:12 +0100
Message-Id: <20240227104912.18921-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

There were a few sparse warnings about the cast of strong-typed
snd_pcm_format_t.  Fix them with cast with __force.

For spreading the ugly mess, put them in the definitions
WRONG_FORMAT_1 and WRONG_FORMAT_2 and use them in the callers.

Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202402270303.PmvmQrJV-lkp@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/sound_kunit.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index 4212c4a20697..eb90f62228c0 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -17,7 +17,8 @@
 	.name = #fmt,								\
 }
 
-#define WRONG_FORMAT (SNDRV_PCM_FORMAT_LAST + 1)
+#define WRONG_FORMAT_1 (__force snd_pcm_format_t)((__force int)SNDRV_PCM_FORMAT_LAST + 1)
+#define WRONG_FORMAT_2 (__force snd_pcm_format_t)-1
 
 #define VALID_NAME "ValidName"
 #define NAME_W_SPEC_CHARS "In%v@1id name"
@@ -104,8 +105,8 @@ static void test_phys_format_size(struct kunit *test)
 				valid_fmt[i].physical_bits);
 	}
 
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(-1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT_1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT_2), -EINVAL);
 }
 
 static void test_format_width(struct kunit *test)
@@ -117,8 +118,8 @@ static void test_format_width(struct kunit *test)
 				valid_fmt[i].width);
 	}
 
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(-1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_2), -EINVAL);
 }
 
 static void test_format_signed(struct kunit *test)
@@ -132,8 +133,8 @@ static void test_format_signed(struct kunit *test)
 				valid_fmt[i].sd < 0 ? -EINVAL : 1 - valid_fmt[i].sd);
 	}
 
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(-1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_2), -EINVAL);
 }
 
 static void test_format_endianness(struct kunit *test)
@@ -147,10 +148,10 @@ static void test_format_endianness(struct kunit *test)
 				valid_fmt[i].le < 0 ? -EINVAL : 1 - valid_fmt[i].le);
 	}
 
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(-1), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT), -EINVAL);
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(-1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT_1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT_2), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_1), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_2), -EINVAL);
 }
 
 static void _test_fill_silence(struct kunit *test, struct snd_format_test_data *data,
@@ -177,7 +178,7 @@ static void test_format_fill_silence(struct kunit *test)
 			_test_fill_silence(test, &valid_fmt[j], buffer, buf_samples[i]);
 	}
 
-	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(WRONG_FORMAT, buffer, 20), -EINVAL);
+	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(WRONG_FORMAT_1, buffer, 20), -EINVAL);
 	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(SNDRV_PCM_FORMAT_LAST, buffer, 0), 0);
 }
 
@@ -272,8 +273,8 @@ static void test_pcm_format_name(struct kunit *test)
 		KUNIT_EXPECT_STREQ(test, name, valid_fmt[i].name);
 	}
 
-	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT), "Unknown");
-	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(-1), "Unknown");
+	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT_1), "Unknown");
+	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT_2), "Unknown");
 }
 
 static void test_card_add_component(struct kunit *test)
-- 
2.35.3

