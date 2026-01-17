Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDC22FF22;
	Sat, 17 Jan 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660125; cv=none; b=aYmgER7Il9zun/dOjKcqzV25mMXSS1kyuINFAAJW4PwpirLmG88DXefEAEQGwFHLeVgcd7AWXY7eTTcD9p6U9VdrVFbu0OEMIznBMSkUMSm97wB7505DsYhHcby8R8MYSDsO0IMMF543W9X1JlFLRss//iQTD/nL8l9afHRgupE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660125; c=relaxed/simple;
	bh=6wYB4JF4q7CukRJnoats1fi+4EH3G8wMtpb8UBFZlcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEsKb5fhweHglXs9Gxa6ys6fHsD2GREULcw9gs5fUYiRHuphJS/T5Z87NM7EZZHHQoLw/kTUxXgn6nThe7r4H4VePY7LH0SSiDyNzFIPeUKeJzy8CF/6/SRMrZ5V3f+Sv14Ljo7QxmfNR8Ncd0X3ns5/Pkx8ZUh09w/pSdw2g0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=d5FnrnQw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YQF4BhNt; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="d5FnrnQw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YQF4BhNt"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 58BC97A0333;
	Sat, 17 Jan 2026 09:28:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 17 Jan 2026 09:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660115; x=
	1768746515; bh=0o98L6X7Ww81vUo8K0bKIgUHwJe62JrsMwr69W87+Ws=; b=d
	5FnrnQwCbfIu2IKsAbOzm0N65IIEjnYjSQlx7BEFWrry1vveaB0DlQRmLPhZ5S+6
	JzJ2/WTsoZnyIM4dLn8OznI5s3NloK1V/o8ltEEZLkiyEoLyld0NlHU2Y/S39vw3
	QHYFvKhhkDuSJlIGw7mJg5mUBl0+Fn0bB9ib2yMXU+lCghIamAvIB2m1oxOZPkpo
	dz/jqNKd2V4EnSs3UKCRKj25hWIk3N/jsQpoohWtqkWUaR0q/ggtWSvZy/soM3SN
	CAuzmucrYjRXICOqJgsAehGgfo0e6094oDxtuM+pO+l+iC4SpBW8kP9AgwXQiqBs
	ta4Q4SUhVFHg/bYuoBNvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660115; x=1768746515; bh=0
	o98L6X7Ww81vUo8K0bKIgUHwJe62JrsMwr69W87+Ws=; b=YQF4BhNt/vzyJC7Hb
	GQGfb6gkBAmUCRnkCmnjGiNBonFCkSeta/fmmrfS9hO1Se8dSspi9DOR18FncD+J
	95RIoSkncTK37n4VHyY+wGxm4BLVbEFFFbCGT3MnmHS2mXw5rOgDbAOfX2xDQDq9
	g3EKC18KhzcDDHDCdPdpqXuf07F98ykm3t4gu88aYJHEqLCpGZNaeEafCdXma38e
	Iajyz8Di+YqKOqie72My0UKussGei1nRbxsOWcyBq4yKdjso94nsAcWjGaxwLQ3+
	0d4Y3ARys1kj/EScX+J6SYCK9RKTq7aQX4mYEXCQ0aB7zSWyYT+9Cr8ZtYy9v11X
	WY+Bw==
X-ME-Sender: <xms:k5xradd7crDU-P4Xw2_LpZBX0Mst7-99HwdWf4hpBCHXvsmEYI8z1Q>
    <xme:k5xrabVlx6LL6QPNn1SwLHBDuhlwh8ElG8e3MxQ8x8ExvPk-5kjQRyY3avSjpFCtx
    -AilxgCyayOlIIMbYVY8xY3Uw8HLcLRsoiY6gYZ8H1NtWlRUhf4kA>
X-ME-Received: <xmr:k5xraef19ZocEcFuqXRxNg9y0KxFgksX5_ojUPD-NNyuTOPMpUQpdlQXufNm7EfEzxUGsONeHr-GIuJiEYxrMpWbbT3Dk6W3P-A1BIGMxs7ehw>
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
X-ME-Proxy: <xmx:k5xrafP9yVv5dUOS6Ov4PAaZ9AlZ3S8Ee8k_HHM0DFlYbVj6cOP2-Q>
    <xmx:k5xraUiAF9PUwoIC57Q8h4-pXBGFeDTsK-8ZZrSknEbDbyTCn375Tw>
    <xmx:k5xraa1cwokvpVoEBqDmV1GleQiRquKehwpmPoonzLIf9HnYrNxP9A>
    <xmx:k5xraWgZwmn9cEnt5m_o1e4iOZOLBU2-IIvDYy3ZtL-zc_cjZKiIiA>
    <xmx:k5xrabywV8mrummUGq-8zBrAnHKqhFXEkwmNkcS6t0-K39Nz2IoTdQeH>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:34 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 5/9] firewire: core: add flags member for isochronous context structure
Date: Sat, 17 Jan 2026 23:28:18 +0900
Message-ID: <20260117142823.440811-6-o-takashi@sakamocchi.jp>
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

This is minor code refactoring to add a flag member to the isochronous
context structure. At present, it is used only for the option to drop
packets when the context header overflows.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 2 +-
 drivers/firewire/core-iso.c  | 1 +
 drivers/firewire/ohci.c      | 4 ++--
 include/linux/firewire.h     | 6 +++++-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index c26bea253208..9e964fdd175c 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1064,7 +1064,7 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 	if (IS_ERR(context))
 		return PTR_ERR(context);
 	if (client->version < FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW)
-		context->drop_overflow_headers = true;
+		context->flags |= FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS;
 
 	// We only support one context at this time.
 	scoped_guard(mutex, &client->iso_context_mutex) {
diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index d9b8896c8ce1..fbbd14d21ca4 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -151,6 +151,7 @@ struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, i
 	ctx->type = type;
 	ctx->channel = channel;
 	ctx->speed = speed;
+	ctx->flags = 0;
 	ctx->header_size = header_size;
 	ctx->callback = callback;
 	ctx->callback_data = callback_data;
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 6760c8d12637..8bba70b65ad7 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2756,7 +2756,7 @@ static void copy_iso_headers(struct iso_context *ctx, const u32 *dma_hdr)
 	u32 *ctx_hdr;
 
 	if (ctx->sc.header_length + ctx->base.header_size > PAGE_SIZE) {
-		if (ctx->base.drop_overflow_headers)
+		if (ctx->base.flags & FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS)
 			return;
 		flush_iso_completions(ctx, FW_ISO_CONTEXT_COMPLETIONS_CAUSE_HEADER_OVERFLOW);
 	}
@@ -2925,7 +2925,7 @@ static int handle_it_packet(struct context *context,
 	sync_it_packet_for_cpu(context, d);
 
 	if (ctx->sc.header_length + 4 > PAGE_SIZE) {
-		if (ctx->base.drop_overflow_headers)
+		if (ctx->base.flags & FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS)
 			return 1;
 		flush_iso_completions(ctx, FW_ISO_CONTEXT_COMPLETIONS_CAUSE_HEADER_OVERFLOW);
 	}
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 68161b8a8a58..71d5cc8f28ce 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -546,13 +546,17 @@ union fw_iso_callback {
 	fw_iso_mc_callback_t mc;
 };
 
+enum fw_iso_context_flag {
+	FW_ISO_CONTEXT_FLAG_DROP_OVERFLOW_HEADERS = BIT(0),
+};
+
 struct fw_iso_context {
 	struct fw_card *card;
 	struct work_struct work;
 	int type;
 	int channel;
 	int speed;
-	bool drop_overflow_headers;
+	int flags;
 	size_t header_size;
 	union fw_iso_callback callback;
 	void *callback_data;
-- 
2.51.0

