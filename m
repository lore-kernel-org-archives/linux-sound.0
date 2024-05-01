Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBB745D6
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563303; cv=none; b=WxrK8rO7cYc0M0irPIc79aMA/DadwMG0BpkLxWIkJEsmSUk812DQYRdajGFVXhrdr/JcgYikG9ceOJeVI7b6z5jgQfrgSn5bfSzCDsg+6TFGS2ajOCK0oX86k/Dk/jUejIs+4Ytz7TZSTzVbClFQpSjpZT2EGZKYXpBC3lBg69c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563303; c=relaxed/simple;
	bh=gruLy3m1RCmrSeQJdfsgrPJfl2yRT+6R7h09atzpoMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQQhNq6Nld54vzc1dsWdl00vPWNk7h07o648mkrFB/qZz1lmX3zQbu/0vjzOnMUzzeTeBK41QoLGf6yeliXXKP2Syh8ndgs5kPuWkZ+HahdH85yfSCl597wNuHtGlUiKdZSS94jKYA1VhiN4dqzztGGBnJcci3iPNoj/rHx3rQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=myy2R+02; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TKcdjyiw; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="myy2R+02";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TKcdjyiw"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 0A2ED1800137;
	Wed,  1 May 2024 07:35:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 01 May 2024 07:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714563300; x=
	1714649700; bh=+T0qESd22wfjemce9MboOByzb50Sme4gctTshXpGbQY=; b=m
	yy2R+02lS4jDhaW93ftgQBFDB1OWfobZqbZ9TpkRQT3HWOirFaSS9UR4dTwVRWO1
	4vD4JbDcwjZ3U/xPVMWkUXQQt1rPJ/8uVDSG3cF29XoejRU9wKxJfQRkRDo5E6Kr
	/6iL9Wqv50ZTdM75WLdRQ5Ya+9omOEmQ5fakj0UrIpXYAuZ51+KOzffWQr6TejlR
	Jmj/j0RzBj9RG1iBh9bBhDAvBfa+RffsmE/5tJrKgwO6vQDJNNTJLy2LQRUWXNLi
	pZzw4a/r4IAeQlGmaRjgmXic9kDkTyptIx1xVbIhPtH8bWUqPnWsrGLEkzTafERC
	w9mvGcXbCXJuVqtfc6Npw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714563300; x=
	1714649700; bh=+T0qESd22wfjemce9MboOByzb50Sme4gctTshXpGbQY=; b=T
	Kcdjyiwuy23cjdbFU648Dw0XVFVIs/JyxcLFuny8u8cLpSM8XiHP4PmZPX24U6XS
	PtUy37Xg9Ev5qpJ1H4A0Q3XOArtaNEFqeT0xfC+z4oCGrOLAXhz5tfVwzRG68M3I
	H1CSSNiO/vIvoB8NVbU4HSIqVUTwQG/9YK9008zrwhNFHWuLhWyDXTvjsvR31z3l
	/Oxxp/jSiEPN3nW96uX0pYJJ7AAP2XStuaw+GAaN2nFyVLQacBqUPGx4TB2806vN
	0YhylUclWPlGVwHkiWg3EMo/Vu446IBVgDP1k/2E/iFBxsGP6xWzqhk+1VM+dA8n
	3Ha1R/CVk+tyOtyIMzeng==
X-ME-Sender: <xms:5CgyZoMJXRaKYl2UUZAmlsUDTVbbCfqSCpUv1_bW5hRiFLxy2jO2wg>
    <xme:5CgyZu_a4sIN4L25VHZxIGXsyQr5L-ykSl35YQo-5CoSsVi9n8wYnGff9jRxRGmQ1
    jJIvWn9jsUznwDQfg8>
X-ME-Received: <xmr:5CgyZvRJ_tgxUviVHl2uIMFyicqXBOs6OIbVxWfe4EyRJH9B8Ub7ZZaph1twvnsc40ZkxbSbiKeJi2L_gXrP_ylfBT4As4MQT_UlHKCsbX4Hhys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:5CgyZgshiuShhJHJwjLZNohbekF6Buhx4CWwopxxDuRwTsizk3qemg>
    <xmx:5CgyZge456TpxspaebPysWhBIMl5mDkpTVuSKizd8sfgLdvrYvkOWg>
    <xmx:5CgyZk1BWp-pMqECl85viL4BHJLAKgPghlH6oIeCjTicE69uiZ6Wog>
    <xmx:5CgyZk-NslukQ7gJgchF0LmWoA9p0nf2MYNu37dhO8td5AiW3KktnQ>
    <xmx:5CgyZo6j-sFs2uw3zUdumJd5QYmdBeuhpY0CVDMcD8CqBJzwYLubprhd>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:34:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ALSA: pcm: add notes to deprecate snd_pcm_sync_id in PCM interface for user space
Date: Wed,  1 May 2024 20:34:45 +0900
Message-ID: <20240501113445.100817-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
References: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In PCM core function, the snd_pcm_sync_id union is not used anymore.

This commit adds some notes about it in UAPI header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 628d46a0da92..8252c7ac6896 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -330,6 +330,7 @@ enum {
 #endif
 };
 
+/* This union is not used anymore since PCM interface version 2.18. */
 union snd_pcm_sync_id {
 	unsigned char id[16];
 	unsigned short id16[8];
@@ -348,7 +349,7 @@ struct snd_pcm_info {
 	int dev_subclass;		/* SNDRV_PCM_SUBCLASS_* */
 	unsigned int subdevices_count;
 	unsigned int subdevices_avail;
-	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
+	union snd_pcm_sync_id sync;	/* Deprecated since PCM interface version 2.18. */
 	unsigned char reserved[64];	/* reserved for future... */
 };
 
-- 
2.43.0

