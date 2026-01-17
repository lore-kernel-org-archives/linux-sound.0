Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419F221FC6;
	Sat, 17 Jan 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660119; cv=none; b=o8dfVSWIoOKE5qKpFBevX6kgZwI/+QsKnU7ZrhhuwCvhVjQPeVoo71sZ+eF+aD11m1YbkcUKm6741in132Xit+NN0rlqIiWEgkCXu1nxEakEBrFs5/8UAza0kL36EVGQxPfjVKHtcxJDcnP8TR+qyrgcc0lBbsAcsvW+5S/REIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660119; c=relaxed/simple;
	bh=0+o2VUJZCtz+1vW5MXV3p0A2ZklLTq8sPKz4FULbB3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQQlkfeahj3JH8kbXH2Fp5nadWa5LgYz2hSUwNVBni5DtEttxcsX8IL85meZUB/cknZbPgVrnRTcYk31R4RQkoXGkniqlVpZqcHBGCMjo7a+XLReaawGfOtwMd7Sbg0HyFMRMwi1KnQM+5OBpX//6AipMGd8uOBbAUEHNAHMoSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Fe3DTnyw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uWQoWBsU; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Fe3DTnyw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uWQoWBsU"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B7F6C7A0325;
	Sat, 17 Jan 2026 09:28:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 17 Jan 2026 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660113; x=
	1768746513; bh=IbJBZ5DJy42Pr9Dh1QiqdxTjMOBG5eXgGleQ0l9+Tew=; b=F
	e3DTnyw9a5IeQEngaBqLMwIwiSzFSmfmPJDdl+pDPmj4igv6lQwrB02bDTOlEHHq
	JKl4GsTLKz3VkHtSNGYb0UF3JmCnZwOIL6zRgGCOOkc1YIWGysGHDhTo3+FS8aCh
	VoVQdU+UTd1f7gqSSsjtH6Hc3o8b71AaX6uPEeGybBOWwdC40R0/ssvSAgwh+P0W
	7K7PZXGMm7VaJ9+RHNn7cZnRGIUUiQe50n8sYwAuBmUMsJZzG6QSb8bKlA4k5iyI
	8f5fCSM0q1Sp15ZzYW3G/BYkXDeegBlRGQMosko74Vv9f/U8BMCB8GRuDZmfHpP9
	UCqx6oZ8CY71ydGAbfdqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660113; x=1768746513; bh=I
	bJBZ5DJy42Pr9Dh1QiqdxTjMOBG5eXgGleQ0l9+Tew=; b=uWQoWBsU4Xsuvt+tV
	HGelxHPO6snXd8CVeoay3pLGwALGQ/sZaWNhcZilaEzJ3Zt/3OVrUCNanTr6WBXS
	rSEjx6F8y+hXVIrk7HArCz7h8TTuze4kQknpv+kH+Qo1lEo0Hnw4eVfCDyJLdZmm
	1xK4FKe3XxEHdTlnp1+y8A/O/7a1Vvfa62hg5AfxLZ/vLYVF8LhXy9O/q5l4Hug5
	/7zN/LNRqCQ7vcZo1GXCANMBYivGfelK00tSy6RMsFDNQ5Lnhyz3y7PdDculcT63
	3g5kpbkLIgSF8Ydo8fAw9yvkCKKdisXVmyz/fsthM8HHq1Zxpah/ckwwztDWgTnD
	ZHVIQ==
X-ME-Sender: <xms:kZxraU9U70cHEgyTJbWKqEGiBNOsFFlOw9e7OIpfoeD_pD0LJXduJw>
    <xme:kZxrac1gC-wQ6R3R0bsWFBKm5jNGL5OkO92HZNX1SHSojEQdXsLq5489pFt56ZN4Y
    UZ5Bkz-AmJ5PUOu8FVx5m3T5w_furzFDDg0rbWgypyogjrQiLXV5jc>
X-ME-Received: <xmr:kZxraR9vnyotZLFbiZckH5msyM8BGzPX7KmuwJWeUezoNxYi719KPEEDepTxkqk2bYPoaCviOfcHcREZQYPi3niVPJ84ToRLfr0QaME-NHWvdA>
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
X-ME-Proxy: <xmx:kZxracvqehkTDMS3iJi8GdtFzXpAkJsGBrQYaKW_GqZ5aPsTlP6soQ>
    <xmx:kZxraUBoVjME88a8i9jNdkrocmybZF51wtDTVFrH2TjxxxywGyi0Gg>
    <xmx:kZxraUXxk_ER-gw6UrfmrKa9feCsTbo9_PY0SFMTF7qn6p_6t7Aq6A>
    <xmx:kZxraSDunrUYImPFDbyrbDNiPhq_e-o6MHgGiFfhvPmSL_Jf-pSd8A>
    <xmx:kZxraZQG5PpoXfDwBQBMNAzfAJ1-aE12dNPce3vopieot0F8ql80lJeX>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:32 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/9] firewire: ohci: use cleanup helper for isoc context header allocation
Date: Sat, 17 Jan 2026 23:28:17 +0900
Message-ID: <20260117142823.440811-5-o-takashi@sakamocchi.jp>
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

Some cleanup helpers are useful in error path after memory allocation for
header storage.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 5d9857cbbd24..6760c8d12637 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2958,6 +2958,7 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 				int type, int channel, size_t header_size)
 {
 	struct fw_ohci *ohci = fw_ohci(card);
+	void *header __free(free_page) = NULL;
 	struct iso_context *ctx;
 	descriptor_callback_t callback;
 	u64 *channels;
@@ -3015,8 +3016,8 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 	if (type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
 		ctx->sc.header_length = 0;
-		ctx->sc.header = (void *) __get_free_page(GFP_KERNEL);
-		if (!ctx->sc.header) {
+		header = (void *) __get_free_page(GFP_KERNEL);
+		if (!header) {
 			ret = -ENOMEM;
 			goto out;
 		}
@@ -3024,21 +3025,17 @@ static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
 
 	ret = context_init(&ctx->context, ohci, regs, callback);
 	if (ret < 0)
-		goto out_with_header;
+		goto out;
 	fw_iso_context_init_work(&ctx->base, ohci_isoc_context_work);
 
-	if (type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
+	if (type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
+		ctx->sc.header = no_free_ptr(header);
+	} else {
 		set_multichannel_mask(ohci, 0);
 		ctx->mc.completed = 0;
 	}
 
 	return &ctx->base;
-
- out_with_header:
-	if (type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
-		free_page((unsigned long)ctx->sc.header);
-		ctx->sc.header = NULL;
-	}
  out:
 	scoped_guard(spinlock_irq, &ohci->lock) {
 		switch (type) {
-- 
2.51.0

