Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1092192F9;
	Sat, 17 Jan 2026 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660114; cv=none; b=jcWauAsCOz2TQafdwTUmTkboAtu5DDF7/zUSh/weRf3rfHE4tJ/sZwRN8zA7R7JZy3dI1yqp7ogVBcb6UTWozdQqCPZrbPsOef0aGZ4LwM6bdXbHAT3dW9rraHN9bBFzq0w2IW50Cy4+kDYYdD0o37rr0mHUnHo+PEHYzqU3gTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660114; c=relaxed/simple;
	bh=vT4XBFgmn62OWQk+xdLjGTfn790Ix7GElrrHxjZvVxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7Eht8zWkcNuUW2jNEZf3fWzjcgpq4NZcebRpK82bIdliwauzArXE48sZydk18sLOjO/kRfy4eyqU1fac56FYv88AY+e2ks1vw3V8nqipbmWfe4+hm7GQ/+hhPgr6O0wN07gak/YPpDiBd0N+NJkh2lDPOpHCh8AcFkk352vXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KYzR9tej; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lNAyQaWf; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KYzR9tej";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lNAyQaWf"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 284D77A033C;
	Sat, 17 Jan 2026 09:28:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 17 Jan 2026 09:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660112; x=
	1768746512; bh=VMX5ShBHt4OP18/iflgnZCqJDvVfJ7oyQB4KemlPwQg=; b=K
	YzR9tejNMEtFDSptsT9Z6B+DsFbssAM8Mtj5PQU6QRRbc+1X00okPSZTg7doztm4
	SS6x4qUpUzM47+yM1OztB5xvbCgBfy+Nv2kuTcY9IMX2OguYd12Lzu6Pt5rFgImK
	TuZOdZQly6BV8Wh8NG4RDHbTtgw7d8L0lD0nc1Z6eN9RKFhNf9zYwtW1OSFemu2L
	Z7SJ2M9lHUNTCPeigjdOgXzaU5fJM9K6r1koZx5ZJVd6NMHFsOb98OKDv7DuvjCi
	X8DRd6Vp5hamMpawfcxzBa59nizXDh2jPv0ezEEyYqui825yLUkb/NH+1nG8FrmC
	XlIQHolsc6pa8KjmzHuGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660112; x=1768746512; bh=V
	MX5ShBHt4OP18/iflgnZCqJDvVfJ7oyQB4KemlPwQg=; b=lNAyQaWfW8BSEh5yj
	07MIuq4Vf1mut0ZTHm+K6UpDAIM2f2r5Ls9jYsJtuaEOkh63mNd4okjqajsSdWdP
	ugpp1XBObvmWS9WwqKE/frR22KIjJlVr6KKbPsktBE7ufL6dKk4IAbbsvaegg4gS
	k3boZLB/CwAqPijC4Jrs67mwl+YWLVEzc1/tUQu1BPVAFMSV5SurUw0HkufESnT8
	ecIzC+5qkY0ngw4iwJnNA5cb4yU1DFNdkddTMdSnZF72nuN8ZYn39672bXwhOHTL
	2+yau3DnR2Y0FHRG4Y78mBudllO+ShgiAwBSJ1ueVhppCz3j9S/l5ibsmz5JY0ki
	VlthA==
X-ME-Sender: <xms:j5xraXMCeCJIxKCADCWevIf8f84fqnnNVYkUBnVbg6HtoA6WkwpBCw>
    <xme:j5xraSHe4YUPih_2hPlQuc6AydwwD6qOpjpt9dyuMOEzXVaADCL4IAY17_a_TvXts
    tlSKGYlP3oD0hysZh1YsqHKudinuhNG-esUOrwBkXFSOckA9GsIVg>
X-ME-Received: <xmr:j5xraeND_MAIGUDfV8ggYMBq1Fuxc8T0xLtU2wQV0vWggD7B7B3nncq4sT2oVM1RF6UTccI3AWPcCLHqCDwE1o2Kk4OMBCeZ2Qp2EjWiBnQPLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeulefhkefghf
    ekveevvdefgfekhfeftdduhfegheegffdtudeuvdekffduhefgveenucffohhmrghinhep
    tggrlhhlsggrtghkrdhmtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggp
    rhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigud
    efleegqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:j5xraT-a2aKV1eWjH93qXGD7zitpzhe2_GyFqM0CFj9hD4dPWQZIUw>
    <xmx:j5xraaRUORmk4cebC9eI9D_e9n73wnUexuxn82Wcl97rO3ndKB46qA>
    <xmx:j5xradlvxFd53k57w6_JRaR-Skw8kXNMFb_pSEsKVtCrEND-D_yApA>
    <xmx:j5xraSTLbdLJF7O0U3BmrMJtuFqRQ7TjFlb2AY02YbMOJXwJ92SaOg>
    <xmx:kJxraYgVJEmdFb9xStXUAFXUZDuqtxp6Fz3erlFIC202tWtLGdAnfxbj>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:30 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/9] firewire: ohci: code refactoring to use union for isoc multiple channel state
Date: Sat, 17 Jan 2026 23:28:16 +0900
Message-ID: <20260117142823.440811-4-o-takashi@sakamocchi.jp>
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

In 1394 OHCI driver, some members of struct iso_context are only used for
multi-channel isochronous contexts.

This commit uses a union for these members to clearly separate
multi-channel specific state.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index b1dc0c4feb86..5d9857cbbd24 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -169,8 +169,6 @@ struct iso_context {
 	struct fw_iso_context base;
 	struct context context;
 	unsigned long flushing_completions;
-	u32 mc_buffer_bus;
-	u16 mc_completed;
 	u8 sync;
 	u8 tags;
 	union {
@@ -179,6 +177,10 @@ struct iso_context {
 			size_t header_length;
 			void *header;
 		} sc;
+		struct {
+			u32 buffer_bus;
+			u16 completed;
+		} mc;
 	};
 };
 
@@ -2826,8 +2828,8 @@ static int handle_ir_buffer_fill(struct context *context,
 	buffer_dma = le32_to_cpu(last->data_address);
 
 	if (completed > 0) {
-		ctx->mc_buffer_bus = buffer_dma;
-		ctx->mc_completed = completed;
+		ctx->mc.buffer_bus = buffer_dma;
+		ctx->mc.completed = completed;
 	}
 
 	if (res_count != 0)
@@ -2846,7 +2848,7 @@ static int handle_ir_buffer_fill(struct context *context,
 		ctx->base.callback.mc(&ctx->base,
 				      buffer_dma + completed,
 				      ctx->base.callback_data);
-		ctx->mc_completed = 0;
+		ctx->mc.completed = 0;
 	}
 
 	return 1;
@@ -2855,17 +2857,16 @@ static int handle_ir_buffer_fill(struct context *context,
 static void flush_ir_buffer_fill(struct iso_context *ctx)
 {
 	dma_sync_single_range_for_cpu(ctx->context.ohci->card.device,
-				      ctx->mc_buffer_bus & PAGE_MASK,
-				      ctx->mc_buffer_bus & ~PAGE_MASK,
-				      ctx->mc_completed, DMA_FROM_DEVICE);
+				      ctx->mc.buffer_bus & PAGE_MASK,
+				      ctx->mc.buffer_bus & ~PAGE_MASK,
+				      ctx->mc.completed, DMA_FROM_DEVICE);
 
-	trace_isoc_inbound_multiple_completions(&ctx->base, ctx->mc_completed,
+	trace_isoc_inbound_multiple_completions(&ctx->base, ctx->mc.completed,
 						FW_ISO_CONTEXT_COMPLETIONS_CAUSE_FLUSH);
 
-	ctx->base.callback.mc(&ctx->base,
-			      ctx->mc_buffer_bus + ctx->mc_completed,
+	ctx->base.callback.mc(&ctx->base, ctx->mc.buffer_bus + ctx->mc.completed,
 			      ctx->base.callback_data);
-	ctx->mc_completed = 0;
+	ctx->mc.completed = 0;
 }
 
 static inline void sync_it_packet_for_cpu(struct context *context,
@@ -3028,7 +3029,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 	if (type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		set_multichannel_mask(ohci, 0);
-		ctx->mc_completed = 0;
+		ctx->mc.completed = 0;
 	}
 
 	return &ctx->base;
@@ -3493,7 +3494,7 @@ static int ohci_flush_iso_completions(struct fw_iso_context *base)
 				flush_iso_completions(ctx, FW_ISO_CONTEXT_COMPLETIONS_CAUSE_FLUSH);
 			break;
 		case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
-			if (ctx->mc_completed != 0)
+			if (ctx->mc.completed != 0)
 				flush_ir_buffer_fill(ctx);
 			break;
 		default:
-- 
2.51.0

