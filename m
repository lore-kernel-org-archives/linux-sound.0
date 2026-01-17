Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9271D88AC;
	Sat, 17 Jan 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660111; cv=none; b=ADE1A95I+VKe9SGzat51rxN+L0pTbjJ2p/29HEaQ1TOCf5lIb7Z/KiZ+9j3/aHofQQhTMjgib940n7MpKiKjEawHcrThtApmifRBC6jzM31rYzJ8Dq9AV9Ptn2BzVlPpw6KRMniq6Fu74ciMQS17fT6W6Sk1FevUjBkh3NuGWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660111; c=relaxed/simple;
	bh=BjX8tShMFcgljL7k3pwerBXxrX4O530tKJ8Pyh2bj38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVmi9pd9XDgDdHGawT3WBkX29vOrKUjslUGYvGaeBpulXQ34i8l3iZEYMmf8bReb89pKOojnweEuXePHwNeSIHG7LUiPSMCgYvcvEv4nVNDM5fp0M59l9Cz9EHfJ8OG+8v3H7zEPM/pve/kJ+fm1DPSZK1c4AClkmu2+6jhZiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=pat3ZSGW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KYCU2dw4; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="pat3ZSGW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KYCU2dw4"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D66AA7A0322;
	Sat, 17 Jan 2026 09:28:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 17 Jan 2026 09:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660108; x=
	1768746508; bh=lvRfBrlvRRPoHNtRWkEdJUuLKtA3LQo+I81Hje9C4Ek=; b=p
	at3ZSGWYJoqfjj+8HLBCJcqZbtaXosidI4p7eUG9d6qBn91nuSjPgov2Io3gXcMe
	CRSZek8jhAG+nk6NjZMplIegfHDwQ4lI9WoCZEiYjUoMH+gPm4lEY56GjKa9sTXQ
	dumjoB8VCubvEslnbzo0qv6AXoSsOUiPF+1XtTIs6O+shmXqt+7p29NlfSlxtZUm
	b+sBZ1bb654xn9hKU/ki2x9TONsyGzVz1vaD+WIfxnwlbtHOD2JGDSZcVs+JHB38
	U0XONvF8YyqjOkKaXn6nZB7E8Pv1JoUEUlHr2oC9j4tBRVp95/hOc3TCcGxzwVG2
	Mov2+ruqNdERhnwADKS/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660108; x=1768746508; bh=l
	vRfBrlvRRPoHNtRWkEdJUuLKtA3LQo+I81Hje9C4Ek=; b=KYCU2dw4epwJHCeiP
	PXAQ1qehluCjiAg+TfUPOr/L1ys9ghAzn8BpQB/42IyAQvbPAkemFN0ZanyGNDYK
	0z7975gr46Jqo6Tso9ipvBQlJ+MmGlVHeVCthYnEWV4166TIquA/m9doGyqwN+RX
	pyTF3jJOqxbN37YLfrQ2DscB3R3SpJtCDry/3vKvjcbZbqO/WGrKN58y1SNr8NPN
	Zd96RQwhJhqvekTC/0LxgKWzd7ddHY3YXtK74X9L+pJmH/RAWw+nnRoUpCO3uZrh
	RYr7bjvH7NlWe/fiy9SUwwxYvgOTR2NzMsitwLp6nMT5w5f9t9aHqooEkAVxI9Jj
	EvDcw==
X-ME-Sender: <xms:jJxraR3ANTfBwL4vzVQJi_kuiIMscitMDeewbkCZU4ZiHp3CMDSJKg>
    <xme:jJxraYNbyhdinTQZMDrfO_ma3WmKzvDTWzLZe0scJe6tvQnidopRaEFIuizsz95kk
    PBCLL9wP5qSN-HgA8ya-5P67FdHpHxLSp_Aafv_XxASGgbzYV4bBw>
X-ME-Received: <xmr:jJxraZ2y91MWISqKeGnHkp6VgVup6Tio1mGx08QePT0_vfSctUxJv-wBpuds9vI3iqqCFpEOu3FN8iLAFWmr5Uwou3qdYscO6ePvjgPZ5YN70A>
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
X-ME-Proxy: <xmx:jJxraXHb2nzqrHKT3oDvcaTOXKqV-jbpFfgjYjlhHtJy_RWfGvwrlg>
    <xmx:jJxrae4CbYLrvSL9tJuP2Klmz6J5ohXH39KVnId_CqYctsr5VSMs_Q>
    <xmx:jJxraVshlGn3-WSIopUmpkxfMXk6A3lGWlt-5Zzm-uXyrKnRYSr_7g>
    <xmx:jJxraX4rL2GBEYKbQ1BnsnejQO4h9wx-s__vJhY-B5vv5cCvjYYLuQ>
    <xmx:jJxraXrL9Vebh2BYZv2a2MHLbipfvmD_bG56rChqPqbhOZa_IHuea8GH>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:27 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/9] firewire: core: add function variants for isochronous context creation
Date: Sat, 17 Jan 2026 23:28:14 +0900
Message-ID: <20260117142823.440811-2-o-takashi@sakamocchi.jp>
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

The fw_iso_callback union was added by a commit ebe4560ed5c ("firewire:
Remove function callback casts") to remove function pointer cast.

That change affected the cdev layer of the core code, but it is more
convenient for fw_iso_context_create() to accept the union directly.

This commit renames and changes the existing function to take the union
argument, and add static inline wrapper functions as variants.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 28 +++-------------------------
 drivers/firewire/core-iso.c  |  9 ++++-----
 drivers/firewire/core.h      |  9 +++++++++
 include/linux/firewire.h     | 14 +++++++++++---
 4 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index bb4d0f938f5b..c26bea253208 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1026,25 +1026,10 @@ static enum dma_data_direction iso_dma_direction(struct fw_iso_context *context)
 			return DMA_FROM_DEVICE;
 }
 
-static struct fw_iso_context *fw_iso_mc_context_create(struct fw_card *card,
-						fw_iso_mc_callback_t callback,
-						void *callback_data)
-{
-	struct fw_iso_context *ctx;
-
-	ctx = fw_iso_context_create(card, FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL,
-				    0, 0, 0, NULL, callback_data);
-	if (!IS_ERR(ctx))
-		ctx->callback.mc = callback;
-
-	return ctx;
-}
-
 static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_create_iso_context *a = &arg->create_iso_context;
 	struct fw_iso_context *context;
-	union fw_iso_callback cb;
 	int ret;
 
 	BUILD_BUG_ON(FW_CDEV_ISO_CONTEXT_TRANSMIT != FW_ISO_CONTEXT_TRANSMIT ||
@@ -1056,20 +1041,15 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 	case FW_ISO_CONTEXT_TRANSMIT:
 		if (a->speed > SCODE_3200 || a->channel > 63)
 			return -EINVAL;
-
-		cb.sc = iso_callback;
 		break;
 
 	case FW_ISO_CONTEXT_RECEIVE:
 		if (a->header_size < 4 || (a->header_size & 3) ||
 		    a->channel > 63)
 			return -EINVAL;
-
-		cb.sc = iso_callback;
 		break;
 
 	case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
-		cb.mc = iso_mc_callback;
 		break;
 
 	default:
@@ -1077,12 +1057,10 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 	}
 
 	if (a->type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL)
-		context = fw_iso_mc_context_create(client->device->card, cb.mc,
-						   client);
+		context = fw_iso_mc_context_create(client->device->card, iso_mc_callback, client);
 	else
-		context = fw_iso_context_create(client->device->card, a->type,
-						a->channel, a->speed,
-						a->header_size, cb.sc, client);
+		context = fw_iso_context_create(client->device->card, a->type, a->channel, a->speed,
+						a->header_size, iso_callback, client);
 	if (IS_ERR(context))
 		return PTR_ERR(context);
 	if (client->version < FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW)
diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index 3f36243ec0c1..d9b8896c8ce1 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -137,9 +137,8 @@ size_t fw_iso_buffer_lookup(struct fw_iso_buffer *buffer, dma_addr_t completed)
 	return 0;
 }
 
-struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
-		int type, int channel, int speed, size_t header_size,
-		fw_iso_callback_t callback, void *callback_data)
+struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, int channel,
+		int speed, size_t header_size, union fw_iso_callback callback, void *callback_data)
 {
 	struct fw_iso_context *ctx;
 
@@ -153,7 +152,7 @@ struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 	ctx->channel = channel;
 	ctx->speed = speed;
 	ctx->header_size = header_size;
-	ctx->callback.sc = callback;
+	ctx->callback = callback;
 	ctx->callback_data = callback_data;
 
 	trace_isoc_outbound_allocate(ctx, channel, speed);
@@ -162,7 +161,7 @@ struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 
 	return ctx;
 }
-EXPORT_SYMBOL(fw_iso_context_create);
+EXPORT_SYMBOL(__fw_iso_context_create);
 
 void fw_iso_context_destroy(struct fw_iso_context *ctx)
 {
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 26868f007131..e0ae948605e1 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -173,6 +173,15 @@ static inline void fw_iso_context_init_work(struct fw_iso_context *ctx, work_fun
 	INIT_WORK(&ctx->work, func);
 }
 
+static inline struct fw_iso_context *fw_iso_mc_context_create(struct fw_card *card,
+		fw_iso_mc_callback_t callback, void *callback_data)
+{
+	union fw_iso_callback cb = { .mc = callback };
+
+	return __fw_iso_context_create(card, FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL, 0, 0, 0, cb,
+				       callback_data);
+}
+
 
 /* -topology */
 
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 09c8484f7430..68161b8a8a58 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -558,9 +558,8 @@ struct fw_iso_context {
 	void *callback_data;
 };
 
-struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
-		int type, int channel, int speed, size_t header_size,
-		fw_iso_callback_t callback, void *callback_data);
+struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, int channel,
+		int speed, size_t header_size, union fw_iso_callback callback, void *callback_data);
 int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels);
 int fw_iso_context_queue(struct fw_iso_context *ctx,
 			 struct fw_iso_packet *packet,
@@ -569,6 +568,15 @@ int fw_iso_context_queue(struct fw_iso_context *ctx,
 void fw_iso_context_queue_flush(struct fw_iso_context *ctx);
 int fw_iso_context_flush_completions(struct fw_iso_context *ctx);
 
+static inline struct fw_iso_context *fw_iso_context_create(struct fw_card *card, int type,
+		int channel, int speed, size_t header_size, fw_iso_callback_t callback,
+		void *callback_data)
+{
+	union fw_iso_callback cb = { .sc = callback };
+
+	return __fw_iso_context_create(card, type, channel, speed, header_size, cb, callback_data);
+}
+
 /**
  * fw_iso_context_schedule_flush_completions() - schedule work item to process isochronous context.
  * @ctx: the isochronous context
-- 
2.51.0

