Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833342248BE;
	Sat, 17 Jan 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660119; cv=none; b=OXZYaDot9kSGGufWZpmWK0ECLxko6idVaHmOMRaC9lkvDG9Iu/0JP+0Y62gjPtS6bWh+BC92X/7JWrsTxt/mZZS2CQzzNYp+fDjOSv6st9W8HfXmyjZ47lkTk2LvOg2+S6BWFA0EpfPlIErDIn3+z5etbaoVZK6VDkl1X1P/zag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660119; c=relaxed/simple;
	bh=YuX+M6FPXemZou4h9sfOmMbgSVEb9zcLaqNyTn0KwmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElMLlHRU4TROPgEja39oA6b7UE3woGVQps4ClvCLjwrmo7n0iSrBxLqH88gjsi9vxT9Cc3aQGwumIMOPkjKHab8jIGLSf4kkJhHOSZqDz3hj/tWT1Br7kmZVkKIYWD8yXyyPimxR/SesRNFFjaQ5RbiPugorFc68V3gtlj1xA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=abHEFIUY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TocXxC8A; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="abHEFIUY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TocXxC8A"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id EBA221D002D0;
	Sat, 17 Jan 2026 09:28:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 17 Jan 2026 09:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660116; x=
	1768746516; bh=NVzj8Ql53jQtPGC8rxKPSYOxdrumrOkAudNJ+7K/T/0=; b=a
	bHEFIUYLcp2VMn6JSp7Z0UuVHRSTZBktaHwCk+OVK7DKlLQvwl+kCCcsA7F14Awa
	gMCNODz/9z1US9uXzrauppSGaPAn5PsDicmfibaP0krZPytffQzy5wtJkXK4dp2a
	ySGu9wyHbgEN64hUq9uyWJYO/Qd/HOSHODTIiMAVmHnwzQp4ESs0goB1JKASpp9O
	k2vjQls+HRkhnLNy2H6K4ohSjcODRleNc4UdKryOW+jxQOZZhqfwicAyZyMs04KN
	hxy+Bu56FmbtJSnqV6cig2jqsszDKIEnAchLJn+DHKSKL0AmTmyUEjQCREMKJMH+
	3c9FryHNDxDYXRSN/wMiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660116; x=1768746516; bh=N
	Vzj8Ql53jQtPGC8rxKPSYOxdrumrOkAudNJ+7K/T/0=; b=TocXxC8AfnK0WoD11
	QFr6ucbbAG1qZ2QzlAt2aXq6QSZieE58iN4cCQYIzpfe+NiGs3kY7+AUq5Mg7O6d
	h8NXdc0MQ2SQgY0UHcszMfF/MVpBVKxXwkm1jHw0xW4WKo5bZ9bBsQS4bFtiBuX7
	2/KGf48fx6UR52nG8k6NBeDZDGnKKxJ7Sx+CRVXEdL2OUwM0Ox+VgH/Vb47mYeMW
	JuMg2oPSLZVWz0U9hln/i119JruG6zgp/B+Uuz2GAx0m4BYigf9gjoI27xa0peRm
	0XpL9HlTow96b8mpsJ/npuSthy8DCf86Kjv8rJbygyV6e+1g98Dhz1ePTeEoL36k
	5YJYQ==
X-ME-Sender: <xms:lJxraV_vN3tOIje0REC4lSPn-kVMbhHRcm3gT55p-qSB7zwDqPkw1Q>
    <xme:lJxraZ3GBdCgCgfDFQaWFyjKRBfKXUzi1wtOlc-Qany1WWq3IZz4fLV2is0TLjqz4
    ijjDwO50emtn0tU61HuVd-rqKVoha-pziJC8o-FLB1XD3gBRi1JwA>
X-ME-Received: <xmr:lJxraa-odW92_WaqzDbWuD_IJ76wN3nmI8Bf-st3OyQR-OptzK2TLrw6y1vHMqhJd_huZ8r3koVhntfaMgDu1Tl_sBZuVH2mPCJBh5wkW5--uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvd
    fguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lJxraRvNKNFIpMBpUBE6NRr5CC0J7nDU0DVvKqDmJH-G_JV231W82A>
    <xmx:lJxraVCkc6NN87xlb2bqz5bDBmAEID47SRy8oT4iDJPpa8p54PSBfQ>
    <xmx:lJxraRXkvDAU_AMEYK0LyiP91B-NgsuDfMqjJU4fPWdtABnqKGsHaw>
    <xmx:lJxrabAw9Zv-QJRooY1gvnbxE9N1g0Sy_pw3qP6qFwn6i8tXQBnNdQ>
    <xmx:lJxraeSW3ZcGcv6C09pSAlOffDO8x87tfURxy7-5om6vuHhZjd-SHzPu>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 6/9] firewire: ohci: allocate isoc context header by kvmalloc()
Date: Sat, 17 Jan 2026 23:28:19 +0900
Message-ID: <20260117142823.440811-7-o-takashi@sakamocchi.jp>
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

Isochronous packet handling now runs in a workqueue context, where page
faults is acceptable.

This commit replaces __get_free_page() with kvmalloc() when allocating the
isochronous context header buffer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 8bba70b65ad7..888c43940999 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2958,7 +2958,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 				int type, int channel, size_t header_size)
 {
 	struct fw_ohci *ohci = fw_ohci(card);
-	void *header __free(free_page) = NULL;
+	void *header __free(kvfree) = NULL;
 	struct iso_context *ctx;
 	descriptor_callback_t callback;
 	u64 *channels;
@@ -3016,7 +3016,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 	if (type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		ctx->sc.header_length = 0;
-		header = (void *) __get_free_page(GFP_KERNEL);
+		header = kvmalloc(PAGE_SIZE, GFP_KERNEL);
 		if (!header) {
 			ret = -ENOMEM;
 			goto out;
@@ -3137,7 +3137,7 @@ static void ohci_free_iso_context(struct fw_iso_context *base)
 	context_release(&ctx->context);
 
 	if (base->type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
-		free_page((unsigned long)ctx->sc.header);
+		kvfree(ctx->sc.header);
 		ctx->sc.header = NULL;
 	}
 
-- 
2.51.0

