Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69A1DE3B8
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732649100; cv=none; b=UzxH5Z9dMr9BhS80N7mWrvljRBwwdnyRu7bM/e7lfK/D616JW++w1Zc8naG2Br2T9udBuaDqCoD3L7XLRyEeuVylcAoy+qzeqBFB5OrQuBgtNQcRvA76EL4QU3H1FHPLYi9s2B+RKRnVqQ0IYTBumQozWpNIb0weNz3WAlU2KQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732649100; c=relaxed/simple;
	bh=k3fobman9RCUJ8q+NxNaBx5ExbA8tqMHhg/CMDorQeM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o4nDQDAPH2uxKQSYxuwnHCgdE/y4uZpx/afNiGLB3vIB7KStSuerJoZvAhNR/X5HG6fdNAcMjfQraFg+tccNf8bmpSFuFkyBZ12hNQAz5J4D7eFX13ThggE2G+EW5bn5nfyzK66hQ9fe1zAS8Do2XPQB3z5qmU/qbvlHTY3+NpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk9fMKKG; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk9fMKKG"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-6eeffdff41dso26428007b3.3
        for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732649098; x=1733253898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXJ2T12ycNGogx+9pEU4WVH8OafXH0tiAXc8PkauIY0=;
        b=Dk9fMKKGtGXzLNsUzh3VEblEYWCQVin9YvxMJcNZ7iPXdr4lzntBUqp3cga/EqPk1R
         5u0sJ4fvk9VoSMhP/SY08TKey2K6CgMeOfYsNpKNKUN0Kcf1UokMHNS8iumkhtqrwh5N
         dG2iQaDUTUMBEdTvdHOTrMKuqmchtvs5owhgJSBl1OpSJGRFylaPTWMk9m3iyTl2/G8s
         KHlNerg3KDjZ58d/EystQX5uUdTRj5H5t2RB2LpZw7Q13Yu6wzZNAwKvB/CmBmgfMBiE
         PSDbUJrc6gQ1iA4lV/72oIIemJ2SDWKJNpvrdazfKlc+Er9A/2SQW0/5VersL8A+BUPZ
         iiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732649098; x=1733253898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXJ2T12ycNGogx+9pEU4WVH8OafXH0tiAXc8PkauIY0=;
        b=kUQjk3ubtxyJ6UxGTHxA4RMnO2KxchK2eRPA3NmZ3ucbtP+Aa0ndPlCUP2uXwsZFZC
         nVLQyUKNSwNYJ33GnN9ZG05ePN5zQfHmxYTrPXE7u3FwgyN3fkd5FeSXKyrpq1F2M+WM
         Ovu10R9YigHKnuP7gEAR1m0Xzt9qf4jMF5pwXA8mE5SIruNdOb7PwZ/YD1YvbCJIeurc
         eD0xEwDzYnvtEeWsbs7o5WH0/W62tUDK66gWymqZHQcGsKZKR37C6+bBXHBZTIXXP/CJ
         OI0xxfFuyhD4p4fmbPa44W4JXdxw4DYAOoHkweb7yG+OJ+oOaqvF8EhMav+CPJndE2tw
         vTyg==
X-Gm-Message-State: AOJu0YzKwa0Iyj1g7HwPKJcd3wJeYHNEnxt0TWDa2FVFRzlYqOapth3G
	N4IOaIqIXFbVXOW0tdin3dWR5/G6LYThuhWQ2SNzDRT1p0Y3q7nFJ/wFxJsl
X-Gm-Gg: ASbGnctk4rJc3FTWYeEZJ4qb1hyGKq85qo9FfiX2ApIlRNXIMkG/yOMdTBIZTXdbv9c
	pEsHJbNY+ufXVYBMuqVCZsUwB82HcM2ItO5FcXvBSh7bfXO6y0GYanfvp1naF53dfJgoh544FR9
	Ip4TkicQG2/D8UI20QDk6ZE+jM/HNrSjjB83+Quiau38TvrP0ihVnrYcTxupB8FhNdL80O+CXsW
	A5o8k2suUGJiEa46+7XqLoDm9I9PwLNjegj+WoWpIzVeMfPhFj5TldwnvU+dfgMWucnEXLWgXVC
	OghInqqWbsXRE+OfZ0Om/FHY5stiIdJHDqr1
X-Google-Smtp-Source: AGHT+IEShgF5O+pkYOpCoRhbipEx/TUwZ3MEuufTSsEbccTVEBVfJaHm3+RyygwPapRecAcZIJU2Mw==
X-Received: by 2002:a05:690c:61c1:b0:6ec:b74d:a013 with SMTP id 00721157ae682-6ef372337d7mr4488087b3.19.1732649097988;
        Tue, 26 Nov 2024 11:24:57 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b23e9asm59144906d6.73.2024.11.26.11.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 11:24:57 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] ALSA: core: Fix possible NULL dereference caused by kunit_kzalloc()
Date: Tue, 26 Nov 2024 13:24:49 -0600
Message-Id: <20241126192448.12645-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

kunit_kzalloc() may return a NULL pointer, dereferencing it without
NULL check may lead to NULL dereference.
Add NULL checks for all the kunit_kzalloc() in sound_kunit.c

Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 sound/core/sound_kunit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index bfed1a25fc8f..84e337ecbddd 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -172,6 +172,7 @@ static void test_format_fill_silence(struct kunit *test)
 	u32 i, j;
 
 	buffer = kunit_kzalloc(test, SILENCE_BUFFER_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buffer);
 
 	for (i = 0; i < ARRAY_SIZE(buf_samples); i++) {
 		for (j = 0; j < ARRAY_SIZE(valid_fmt); j++)
@@ -208,8 +209,12 @@ static void test_playback_avail(struct kunit *test)
 	struct snd_pcm_runtime *r = kunit_kzalloc(test, sizeof(*r), GFP_KERNEL);
 	u32 i;
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r);
+
 	r->status = kunit_kzalloc(test, sizeof(*r->status), GFP_KERNEL);
 	r->control = kunit_kzalloc(test, sizeof(*r->control), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r->status);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r->control);
 
 	for (i = 0; i < ARRAY_SIZE(p_avail_data); i++) {
 		r->buffer_size = p_avail_data[i].buffer_size;
@@ -232,8 +237,12 @@ static void test_capture_avail(struct kunit *test)
 	struct snd_pcm_runtime *r = kunit_kzalloc(test, sizeof(*r), GFP_KERNEL);
 	u32 i;
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r);
+
 	r->status = kunit_kzalloc(test, sizeof(*r->status), GFP_KERNEL);
 	r->control = kunit_kzalloc(test, sizeof(*r->control), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r->status);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, r->control);
 
 	for (i = 0; i < ARRAY_SIZE(c_avail_data); i++) {
 		r->buffer_size = c_avail_data[i].buffer_size;
@@ -247,6 +256,7 @@ static void test_capture_avail(struct kunit *test)
 static void test_card_set_id(struct kunit *test)
 {
 	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
 
 	snd_card_set_id(card, VALID_NAME);
 	KUNIT_EXPECT_STREQ(test, card->id, VALID_NAME);
@@ -280,6 +290,7 @@ static void test_pcm_format_name(struct kunit *test)
 static void test_card_add_component(struct kunit *test)
 {
 	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
 
 	snd_component_add(card, TEST_FIRST_COMPONENT);
 	KUNIT_ASSERT_STREQ(test, card->components, TEST_FIRST_COMPONENT);
-- 
2.34.1

