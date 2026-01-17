Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5322D7B6;
	Sat, 17 Jan 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660124; cv=none; b=eOYITgJU0R4+9MdOEZmjXHCoX04GkD0MoRjQ5sCmolbg8pJZH8LzjMyIE/zbgY34JKiP+TXjMMfGdvLm9TCDwHmkbLXsO0fQsrVIm8jB979tJd+jc8pFpo5Kn2633CQvdfYiAdD+IhGNjrNDApQy7afv3iAaBRz5y3xOSQPd4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660124; c=relaxed/simple;
	bh=2fpSded8DV2zo3EcRCIuAv40PL286xZPQpAgxmWoBNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJX+jCD+zXSxom3ykVaLECfnwpV/gIdQyeP1221c6X7CAmCzxiprwqplH8SFSgNP1Sg6McunJ0EQvBvU0L5XWT+h1EWBU+AUCipE43Kb44eE6llFXYklmhKgOwP51rHMhaWewBBhqtnC+qJP41KRPiYR+LpfVvagUXQuh7BUSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=DxN/I+Ku; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g6PQOzyW; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="DxN/I+Ku";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g6PQOzyW"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 861717A0322;
	Sat, 17 Jan 2026 09:28:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 17 Jan 2026 09:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660118; x=
	1768746518; bh=sXsLq3IZoGvB6vceJiH6t/T7rkt89IB3p1KmJSv+MW8=; b=D
	xN/I+KuhHoq/GU4pOPOwzT4YYP4r9+hxzbkEk2JU/mhwIZ+JId1ZQON1vSD7DWu0
	UXLUqxHpfVKTu1jwl2QCPoAgDkjA/5600LS5x8v5R5m8NdJ9gs5K6RMw/voMiGYz
	JE6dCHSI3L+Urwc2SbP59AJ44zTPbyjO65R4RWQb3eP1Mkcwx6EtOTBv7Wp+Gxyn
	f7Dz89egbYlvcMH6Hotcp1ZqXlC8XZF1u6c51RGby1R0S+YqOGttrrvLKxgeVZSt
	XMThyvxWIJHtjBoN5rthbzB9yjT/TVUUQ18RAMQgJtYmLtH6vgP2tEjb0WrJHoTG
	kGD9KY/YVCWCjELtN8K0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660118; x=1768746518; bh=s
	XsLq3IZoGvB6vceJiH6t/T7rkt89IB3p1KmJSv+MW8=; b=g6PQOzyWc+kbNinuu
	N4SLuf6iPgyt77DoYvAuZVRMxGnVxp86iY6ApA8QiV250xYwcmoXjGyXy2+Gdfc8
	WU48CoSQ0RCCcarH/OC5WgTiP2ZUUPWDFZRc6XkF5snar2q62Qt0Z/2MMFX9N9O+
	1eprt48vsBGJ/UsTJHIl79wRbz5CxmBS0wZDo85z1ktAdnJ41tQSDyUPvI7WX66E
	ZFp1MVjnMFVvFeGnrvXamWWIZ0+qewqPOezg7ux+V07Ei8X4eC/dTemC+JdLp7Tj
	XX/S9FdCxF7gQFZhhORKVENBz3uZ2/Z75MEAIjw9C8YSY4B7se0fnxFwpM5ZiuEm
	P0Heg==
X-ME-Sender: <xms:lpxraRo3rhYXStUCJsvni4CUw7ckVXhBGk4sH-ORR4QSjjWVk0SHhw>
    <xme:lpxraTxTOJA3tMmjseoJD9LDMUdP75Q1inMO1wLjXT_OBhP6kBWZNzhjgf2FmAj2O
    _XDBn5hSdkVLCiNmrLulUFjl6-r891_bbcx9I7-Lxzrx-NiYt2oww>
X-ME-Received: <xmr:lpxraWJi5jNawPpTwpVQ6vyGcVfUvxayqwZ4wcj86VgQ1xNntO-KWX3suM6q_BKJ8Ga5DowelmfC6fxqQb8cPT1j6Pf-WUgrp8ToCFjqK_42Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvd
    fguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lpxraVKwAieu3aMLAyFHwfVV-1x77ylDaLbXXSitCWNbxD8d59WKqg>
    <xmx:lpxrabvMEByKhZuexSKTzNzqcv6k0THh_Xo97qE9c_NWKHb5-2A0uA>
    <xmx:lpxraaQ7m8psQT_NYlkqNPmBT0M9EGYxyGxVQapn-pPDIOxm207ang>
    <xmx:lpxraZPyHpwpdJdV_CkJwrriSrFKvQtsDR5QczYZ5LjuVkQ9LZlStA>
    <xmx:lpxrabv9dF6_xNFVMYweAM_gXzrdlBLvAsQNuU1n5j-kOaZv3YRnGsQD>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:37 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 7/9] firewire: core: provide isoc header buffer size outside card driver
Date: Sat, 17 Jan 2026 23:28:20 +0900
Message-ID: <20260117142823.440811-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117142823.440811-1-o-takashi@sakamocchi.jp>
References: <20260117142823.440811-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For single-channel isochronous contexts, the header storage size is
hard-coded to PAGE_SIZE. which is inconvenient for protocol
implementations requiring more space.

This commit refactors the code to obtain the header storage size outside
the 1394 OHCI driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c |  4 ++--
 drivers/firewire/core-iso.c  |  8 +++++---
 drivers/firewire/core.h      |  6 +++---
 drivers/firewire/ohci.c      | 10 +++++-----
 include/linux/firewire.h     |  7 +++++--
 5 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 0462d7b9e547..a754c6366b97 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -704,8 +704,8 @@ static int dummy_enable_phys_dma(struct fw_card *card,
 	return -ENODEV;
 }
 
-static struct fw_iso_context *dummy_allocate_iso_context(struct fw_card *card,
-				int type, int channel, size_t header_size)
+static struct fw_iso_context *dummy_allocate_iso_context(struct fw_card *card, int type,
+		int channel, size_t header_size, size_t header_storage_size)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index fbbd14d21ca4..3190b2ca1298 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -138,12 +138,13 @@ size_t fw_iso_buffer_lookup(struct fw_iso_buffer *buffer, dma_addr_t completed)
 }
 
 struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, int channel,
-		int speed, size_t header_size, union fw_iso_callback callback, void *callback_data)
+		int speed, size_t header_size, size_t header_storage_size,
+		union fw_iso_callback callback, void *callback_data)
 {
 	struct fw_iso_context *ctx;
 
-	ctx = card->driver->allocate_iso_context(card,
-						 type, channel, header_size);
+	ctx = card->driver->allocate_iso_context(card, type, channel, header_size,
+						 header_storage_size);
 	if (IS_ERR(ctx))
 		return ctx;
 
@@ -153,6 +154,7 @@ struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, i
 	ctx->speed = speed;
 	ctx->flags = 0;
 	ctx->header_size = header_size;
+	ctx->header_storage_size = header_storage_size;
 	ctx->callback = callback;
 	ctx->callback_data = callback_data;
 
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index e0ae948605e1..8b49d7480c37 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -100,8 +100,8 @@ struct fw_card_driver {
 	void (*write_csr)(struct fw_card *card, int csr_offset, u32 value);
 
 	struct fw_iso_context *
-	(*allocate_iso_context)(struct fw_card *card,
-				int type, int channel, size_t header_size);
+	(*allocate_iso_context)(struct fw_card *card, int type, int channel, size_t header_size,
+				size_t header_storage_size);
 	void (*free_iso_context)(struct fw_iso_context *ctx);
 
 	int (*start_iso)(struct fw_iso_context *ctx,
@@ -178,7 +178,7 @@ static inline struct fw_iso_context *fw_iso_mc_context_create(struct fw_card *ca
 {
 	union fw_iso_callback cb = { .mc = callback };
 
-	return __fw_iso_context_create(card, FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL, 0, 0, 0, cb,
+	return __fw_iso_context_create(card, FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL, 0, 0, 0, 0, cb,
 				       callback_data);
 }
 
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 888c43940999..1c868c1e4a49 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2755,7 +2755,7 @@ static void copy_iso_headers(struct iso_context *ctx, const u32 *dma_hdr)
 {
 	u32 *ctx_hdr;
 
-	if (ctx->sc.header_length + ctx->base.header_size > PAGE_SIZE) {
+	if (ctx->sc.header_length + ctx->base.header_size > ctx->base.header_storage_size) {
 		if (ctx->base.flags & FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS)
 			return;
 		flush_iso_completions(ctx, FW_ISO_CONTEXT_COMPLETIONS_CAUSE_HEADER_OVERFLOW);
@@ -2924,7 +2924,7 @@ static int handle_it_packet(struct context *context,
 
 	sync_it_packet_for_cpu(context, d);
 
-	if (ctx->sc.header_length + 4 > PAGE_SIZE) {
+	if (ctx->sc.header_length + 4 > ctx->base.header_storage_size) {
 		if (ctx->base.flags & FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS)
 			return 1;
 		flush_iso_completions(ctx, FW_ISO_CONTEXT_COMPLETIONS_CAUSE_HEADER_OVERFLOW);
@@ -2954,8 +2954,8 @@ static void set_multichannel_mask(struct fw_ohci *ohci, u64 channels)
 	ohci->mc_channels = channels;
 }
 
-static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
-				int type, int channel, size_t header_size)
+static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card, int type, int channel,
+		size_t header_size, size_t header_storage_size)
 {
 	struct fw_ohci *ohci = fw_ohci(card);
 	void *header __free(kvfree) = NULL;
@@ -3016,7 +3016,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 	if (type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		ctx->sc.header_length = 0;
-		header = kvmalloc(PAGE_SIZE, GFP_KERNEL);
+		header = kvmalloc(header_storage_size, GFP_KERNEL);
 		if (!header) {
 			ret = -ENOMEM;
 			goto out;
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 71d5cc8f28ce..8bf568471588 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -558,12 +558,14 @@ struct fw_iso_context {
 	int speed;
 	int flags;
 	size_t header_size;
+	size_t header_storage_size;
 	union fw_iso_callback callback;
 	void *callback_data;
 };
 
 struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, int channel,
-		int speed, size_t header_size, union fw_iso_callback callback, void *callback_data);
+		int speed, size_t header_size, size_t header_storage_size,
+		union fw_iso_callback callback, void *callback_data);
 int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels);
 int fw_iso_context_queue(struct fw_iso_context *ctx,
 			 struct fw_iso_packet *packet,
@@ -578,7 +580,8 @@ static inline struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 {
 	union fw_iso_callback cb = { .sc = callback };
 
-	return __fw_iso_context_create(card, type, channel, speed, header_size, cb, callback_data);
+	return __fw_iso_context_create(card, type, channel, speed, header_size, PAGE_SIZE, cb,
+				       callback_data);
 }
 
 /**
-- 
2.51.0

