Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474C1D88AC;
	Sat, 17 Jan 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660124; cv=none; b=bJfB0j2uBnATgUIbgIEeYTbr+TQwlXeI9zaIteAcb3YIKASD9p1xVy/dPGFakjwfX35kjRJBZTZCto7zNf9jYwN/BmNELs66T7INlpBnIJ5k7ZXx0/NGbX2aTmBSs5deEoPPUEs14aDhUEJl/umsHBBvlov1pKWuNN+US7H63U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660124; c=relaxed/simple;
	bh=FXDzsTyEDrOCDoe1FuBGPqltI1yoo6g4v8q8GdA+zi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NumlhBF6/kUs48RfecVHyi3BLhOugpVZe9LWhBxughelqHehoPf2p6HSdTwY1vLkzT5XchnWLrGTF84YtfYS4U3Y6nDZX4N6/0iaklELJOVmXjWCNFms6/rRPyWUEHDpEHtBHpnXyDMwf1xcFwAX9tP1FjPB605UDLt69XpcqA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LYJ+Kf2C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zcW3RvX+; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LYJ+Kf2C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zcW3RvX+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AF16B1D002EB;
	Sat, 17 Jan 2026 09:28:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 17 Jan 2026 09:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660121; x=
	1768746521; bh=EpU7s6MYPGtj7LZ20r796f5THbt7CSmvMGny3xKCmVQ=; b=L
	YJ+Kf2CFW42n3qvT5ItPotE/Rm1ae1ymqS8yXwATdJNTrmCTGmxNUy9CZwe0frgm
	UhCKOamq8hBSe00V0BWG+Ui29XfV3krb3szzKW6jES8yxsd8dDwFqiQFywU2hL7u
	ELovGAYdUuJtE4rOgLRsXdGUYUpOeORqHxnGbN6idW9uf6XbEwc98dL6cHyfg/0q
	J4Spr2HjihvWC/r9kDUmM4jhi+Lhmeaj12VaEq7hLQEKsDB0YP88DUPdiZdjBfce
	lveB1qNv3vFerEcjBVyVGuuvNaEnrEajVxqmIM+olSVY1DSeffLggLWGvCiBPt7h
	HSreNGBHxaLEwMynAAU0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660121; x=1768746521; bh=E
	pU7s6MYPGtj7LZ20r796f5THbt7CSmvMGny3xKCmVQ=; b=zcW3RvX+fJg9w1fdQ
	d/DiNY7ROkEi23J2Q1iS50dIenLUfcrF8jbqUEUAWOJCn4TI+5XcbWYDTwmM1DWB
	R0Vb2PCu1/RdLhaiUYZQjnxm6Keylss7WbdahGUDOtO7Vc/SWq0+g9eZ9Za1FOup
	85MnFqj2b8hLnbKc1qS1i8fI6pAGYqd2rxRZsvRj0PMbiNEn3jq8cYF8vNBxaZFD
	PZFscUrhIEt4B09fNmUZY1/zt0w98+deUU48sOG004dt+paX8qWshfEESIW2icCo
	Cee2zqeVDk5xxEs1nk9npNLs/7wrLWwI8Y3aAwB8HfAnMUJMP60yy2OmKG7qcZW/
	EcLdw==
X-ME-Sender: <xms:mZxrafo1DD4escYfgiBwb-jOCoHgU82qnK2N-Qr1YD6SZ-zEra60PA>
    <xme:mZxraZwYu_z2-7oVlWwp1Mro-pTW4R9Z74sltaooNTxRvulWYz3hzOkQs9bB7Fhq3
    aj61VZmzwqKyw8yq2Dqq0nONGZ-lvOzcQbT1yZ3NTDl-hGiMGU4Nzc>
X-ME-Received: <xmr:mZxraUKsaBlkOvVM00At2CMjDdM2usnfzEa0Ms177IGmxMR-B4CFu-KOArjNi0XIqZz5odXY01ij4hbdooy3UNUFTrSwOKU0mKvIG9zD6TBiDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvd
    fguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushhtvghr
    ufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mZxrabJkW0hfNXZWuiG2ND1JsW3JY8lAcJaB-lumpn9OlJEnTJnUUw>
    <xmx:mZxraZvZY4nZNaj5Cc0AUvAsloqx9IDCzKrYFhJ2h4Znb_ENqD9ZpA>
    <xmx:mZxraQT3CBPu6Dx0huNuZPSbcMBb7jYhze_Aa-oTlf6WvGp-bP1XmQ>
    <xmx:mZxraXP6rwWmXuzKGS-gZhzHXFAzdbhiSAz8yQDi0Un7nmhfypOmjg>
    <xmx:mZxraRu2xGPeZYiVa9MgbNqiHUcr15Q6176tKkPJmXQgzLvcmBd8Y26U>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:40 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: firewire: remove PCM buffer size constraint from isoc context header
Date: Sat, 17 Jan 2026 23:28:22 +0900
Message-ID: <20260117142823.440811-10-o-takashi@sakamocchi.jp>
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

In the IEC 61883-1/6 packet streaming engine, the isochronous context
header stores CIP headers. Previously, the header storage was limited to
PAGE_SIZE, which constrained the maximum PCM buffer size.

There is a function with configurable header size. Now the limitation is
removed.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 5cdc34877fc1..223c880af802 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -191,8 +191,6 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 					struct snd_pcm_runtime *runtime)
 {
 	struct snd_pcm_hardware *hw = &runtime->hw;
-	unsigned int ctx_header_size;
-	unsigned int maximum_usec_per_period;
 	int err;
 
 	hw->info = SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -212,21 +210,6 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	hw->period_bytes_max = hw->period_bytes_min * 2048;
 	hw->buffer_bytes_max = hw->period_bytes_max * hw->periods_min;
 
-	// Linux driver for 1394 OHCI controller voluntarily flushes isoc
-	// context when total size of accumulated context header reaches
-	// PAGE_SIZE. This kicks work for the isoc context and brings
-	// callback in the middle of scheduled interrupts.
-	// Although AMDTP streams in the same domain use the same events per
-	// IRQ, use the largest size of context header between IT/IR contexts.
-	// Here, use the value of context header in IR context is for both
-	// contexts.
-	if (!(s->flags & CIP_NO_HEADER))
-		ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
-	else
-		ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
-	maximum_usec_per_period = USEC_PER_SEC * PAGE_SIZE /
-				  CYCLES_PER_SECOND / ctx_header_size;
-
 	// In IEC 61883-6, one isoc packet can transfer events up to the value
 	// of syt interval. This comes from the interval of isoc cycle. As 1394
 	// OHCI controller can generate hardware IRQ per isoc packet, the
@@ -239,9 +222,10 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	// Due to the above protocol design, the minimum PCM frames per
 	// interrupt should be double of the value of syt interval, thus it is
 	// 250 usec.
+	// There is no reason, but up to 250 msec to avoid consuming resources so much.
 	err = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_TIME,
-					   250, maximum_usec_per_period);
+					   250, USEC_PER_SEC / 4);
 	if (err < 0)
 		goto end;
 
@@ -261,6 +245,7 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 				  SNDRV_PCM_HW_PARAM_RATE, -1);
 	if (err < 0)
 		goto end;
+
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 				  apply_constraint_to_size, NULL,
 				  SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
@@ -1715,7 +1700,9 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	} else {
 		dir = DMA_TO_DEVICE;
 		type = FW_ISO_CONTEXT_TRANSMIT;
-		ctx_header_size = 0;	// No effect for IT context.
+		// Although no effect for IT context, this value is required to compute the size
+		// of header storage correctly.
+		ctx_header_size = sizeof(__be32);
 	}
 	max_ctx_payload_size = amdtp_stream_get_max_ctx_payload_size(s);
 
@@ -1724,9 +1711,9 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		return err;
 	s->queue_size = queue_size;
 
-	s->context = fw_iso_context_create(fw_parent_device(s->unit)->card,
-					  type, channel, speed, ctx_header_size,
-					  amdtp_stream_first_callback, s);
+	s->context = fw_iso_context_create_with_header_storage_size(
+			fw_parent_device(s->unit)->card, type, channel, speed, ctx_header_size,
+			ctx_header_size * queue_size, amdtp_stream_first_callback, s);
 	if (IS_ERR(s->context)) {
 		err = PTR_ERR(s->context);
 		if (err == -EBUSY)
-- 
2.51.0

