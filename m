Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D4078C86
	for <linux-sound@vger.kernel.org>; Thu, 25 Apr 2024 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714088221; cv=none; b=dpcRqvSkn20KO0H2Q0IxzDJCIiM5hs7wFNhkq/+RePRlaKLyknFjHGg39mhudB4eMN6l9LnDMgzLNfRfBs4NmP20F+l9/7qukgOfvP4K/NYMIBfzWAxt9OMxBaZM1TvhL1N8hg/z/m51jKuAEfG3n6w0PVMieFKPkowwYH4P/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714088221; c=relaxed/simple;
	bh=gQy5iACbjcX5O7jsgDQ3FVGylm0q2hukUdZr74jVA1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/X5LEWSk35mEfpuRu7j313ziTMJSiF11UkBJlavIwuYH1LTorZhSxi53ejjZPNBUF/gu4tXRmz4rHKEbR5GoN3AiV+msx68a0FAfUFCGlCkXHLS89ldiBAqF9LRUrz208hviEiUfN1tl02svscdFB9YeGphxSltY4+tEznWou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=QSe0BXHx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=enpYAzQn; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="QSe0BXHx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="enpYAzQn"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 6DA15180010A;
	Thu, 25 Apr 2024 19:36:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 25 Apr 2024 19:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1714088217; x=1714174617; bh=Dncjll9djb
	uohPp5iWgAZ3YlHNvTzU4+/xquUwe6VMI=; b=QSe0BXHxkTmQlmQs5gVw4QLYlc
	xe0aQF92K+ag+6JENWHbTSwXEftREubY3XdwJXRrnvN1GEXzYLAu1lhMZ+d2gc33
	BRP5qSom1QauxrRkL2zgvMXsEXX3m++mWuTdhLxKOF2IGp5LcRI1gynAl+7M53Zi
	IGgb8/la7saDdIWBH3VCkdN0FDBRygVloN6+fSytGBAr/wVIx1Hi/wrveDuxKuya
	0NB4s6/s7JVDzdlmmeG945rR2JxSKETAhqfN/WhP7Y8a9Hagv1b189UvsYasxRL0
	Oj6v35YW8JvZ2UDlEOnbNcw9I2fPrvW2kpcoRTGbQjHKD9WmzdpNtXPjnzLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714088217; x=1714174617; bh=Dncjll9djbuohPp5iWgAZ3YlHNvT
	zU4+/xquUwe6VMI=; b=enpYAzQndf4PXoDHfY4Ze8mUev6iitfaAv7O4iNwlgTS
	8BPz9xghlpsKCOIMUQw9B+Ah90dHxWEAmC6NvvJHJHJIcNwuHwtpBYOEaJy8mRYZ
	XqrgO6G8zOHlhDd1VcLd12q+Tr8gATzoEpJHN+Vk2/F+ptGZKC03dN8EYI0DDaKS
	Q8gZfVGzEIn2Ejv9C/9Hbq/zsE8G3iKzWluEtz0PC/yhr0kF2XmLE7tFb64mgLjk
	BQG0ZJm+auUObCijSzQLQjyfBfr+llX7+CmCHIICCkmBvQSdtujvabddmmWOFsuP
	UWf6vv999RSjEc+VrsrA+ci7jNAqh8/zNiMls+Yz8g==
X-ME-Sender: <xms:GekqZuZNnX6uDsGDg19Gp62LT5SrR-XdBr5LKhONasyrjlAAygCyFw>
    <xme:GekqZhbr9Mhb2iBnR9y1lqI8WgdId-WUqa5YXyiJQuih9iM4_35kvMOjT1z9UoZ44
    I3vGHSlbL0qnT354TY>
X-ME-Received: <xmr:GekqZo80Jl8GkGoHJdb28YTnXiAI1PudPoi2gLZT3WKVxl-YWlLX4tLzcUnC6yWsA8T8rSxiDbovs8VuZVkpHYy2uErKluRnn-2y3W9-eQRknQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
    ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:GekqZgpHNJFMVC434Cj5M8hX5g-y6Sx1YIY7VnPrX7Znqi8xhs7bCw>
    <xmx:GekqZpr_kDAvz8fEDFt3kMPpytn7ped23XNDB87STP8QiEtipZ0pvA>
    <xmx:GekqZuTMP6JuMEEbsLq0vCrbY8o8VOtbhydK6Trxd_k4OYRVACNuwQ>
    <xmx:GekqZpqmDHTMxdNtsrjJpNDXAt_l3Z1wxcZ2K2sLBoEY2Fg6NHqMdw>
    <xmx:GekqZgVrF6m4Dxs0Gb10QJgh9Tb6bkcUTHBOEnPcsj2u4CtmKiuzhsJk>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Apr 2024 19:36:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	colin.i.king@gmail.com
Subject: [PATCH] ALSA: kunit: use const qualifier for immutable data
Date: Fri, 26 Apr 2024 08:36:53 +0900
Message-ID: <20240425233653.218434-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some data for testing is immutable. In the case, the const qualifier is
available for any loader to place it to read-only segment.

Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/sound_kunit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index e34c4317f5eb..165bd0f5338a 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -45,7 +45,7 @@ struct avail_test_data {
 	snd_pcm_uframes_t expected_avail;
 };
 
-static struct snd_format_test_data valid_fmt[] = {
+static const struct snd_format_test_data valid_fmt[] = {
 	DEFINE_FORMAT(S8, 8, 8, -1, 1, SILENCE()),
 	DEFINE_FORMAT(U8, 8, 8, -1, 0, SILENCE(0x80)),
 	DEFINE_FORMAT(S16_LE, 16, 16, 1, 1, SILENCE()),
@@ -154,7 +154,7 @@ static void test_format_endianness(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_2), -EINVAL);
 }
 
-static void _test_fill_silence(struct kunit *test, struct snd_format_test_data *data,
+static void _test_fill_silence(struct kunit *test, const struct snd_format_test_data *data,
 			       u8 *buffer, size_t samples_count)
 {
 	size_t sample_bytes = data->physical_bits >> 3;
@@ -191,7 +191,7 @@ static snd_pcm_uframes_t calculate_boundary(snd_pcm_uframes_t buffer_size)
 	return boundary;
 }
 
-static struct avail_test_data p_avail_data[] = {
+static const struct avail_test_data p_avail_data[] = {
 	/* buf_size + hw_ptr < appl_ptr => avail = buf_size + hw_ptr - appl_ptr + boundary */
 	{ 128, 1000, 1129, 1073741824UL - 1 },
 	/*
@@ -220,7 +220,7 @@ static void test_playback_avail(struct kunit *test)
 	}
 }
 
-static struct avail_test_data c_avail_data[] = {
+static const struct avail_test_data c_avail_data[] = {
 	/* hw_ptr - appl_ptr < 0 => avail = hw_ptr - appl_ptr + boundary */
 	{ 128, 1000, 1001, 1073741824UL - 1 },
 	/* standard case: avail = hw_ptr - appl_ptr */
-- 
2.43.0

