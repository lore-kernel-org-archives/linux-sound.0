Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA659230BDB;
	Sat, 17 Jan 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768660124; cv=none; b=jDbp/837pZNxXz99Ll9bnW0ovngXeEQY/GOugZUz9qiDT0DwVH42EDfsYSBst64lMfihTaLMijS9JZ7Srae4n0UbC8r5rnTlwQXIt2ulEGyfFrrinLB3OI0eSkDiYOI5SCNtrMxL5uX/TLRb3odxJWrl7H4VvsofAoVAidHEZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768660124; c=relaxed/simple;
	bh=fjZR6yargD3nDj94X9AMbJXU3XBRW4omxn7yGhrIu9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OreWOAso1KYTqqK3FQuWXwww3W9DRRofrg6UuGTsdDwfdA/oyGnb5Tl80ng4enQGD8BWxfQ9ypjqks2ttE4zbluX4opckEWwm43+s8FHJpcEEZC+QhhlnfsJptqgKg+NDOIN1nq7ZpQgyYUek64VURA4SZnwxsobPfnKwcXbrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ilY/IKmE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QGhzMXmn; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ilY/IKmE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QGhzMXmn"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1FB1E7A0340;
	Sat, 17 Jan 2026 09:28:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 17 Jan 2026 09:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1768660119; x=
	1768746519; bh=bmtKD0BMvRMurgFJtQDY2EADTGUqOWOcdT7XHkmQz0k=; b=i
	lY/IKmEmS03Z2SbgAKMtCmKtxea9Qn3jTpxkq0WZwZovOHuMtJTujwIkK3G7PWnw
	gsusw1kvoZQyCt9bErZQeYm7/fr1e/E+OgMzGJDD5NA0KpFph78emRVQKYnU5r/9
	WXvwuIgeJYUW5t1D67KwH3MfZbOJvGo7G7IczBTIGJeNZLRb3GbgHwwdrjxMShb6
	hXdLn5FZLyL8FwazpGu8WIMl6+aaB8MBbfy1+BjHa5l+4J9bYZZGXmSarTYxTjrG
	zwWz3P5FQt0u0h3xtUQdDEAi1FGAMI+lGzg/SHjPTmb398t096J8+fhaFWY/y/1Z
	hi8oUdrcTRXUDQEyPOxzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1768660119; x=1768746519; bh=b
	mtKD0BMvRMurgFJtQDY2EADTGUqOWOcdT7XHkmQz0k=; b=QGhzMXmndiYNzdtQX
	3JNrKoHuSi8enxctRFiYA9lOtjmNyS8C5rOR3B6g9tAtLsQbJGWRsDa3ZELe19MF
	O2vBsZTGAWnsV/hoRzrdwUH1ozZb7m4tSY+mEng0vzqpcGeCOhdw2zXO0O3dNCyz
	QlaiRX0gx0kUEc8W4tlhhSF1dmVeYk6j0U5zMmmgk15qiazkILzcc3zetE6/lHiD
	kpW3iBXf1R002f3sOJ8Nmq9niyl8W0gJg8yiMHc7vYh8VOCX90Pfxk5bTFNMWD5X
	ptbK6kqSuEZThWQUAbfi7wC1fybD37l6vxIjFt4KoqRixlp92YbogOMY8JAZ/pNq
	ozNnA==
X-ME-Sender: <xms:l5xraQw8yRPNSIHdouC7o2vC8huXuWR2OH4hn_GAwG1EHoGOT8n9EA>
    <xme:l5xraUbaQgat3WF3xoOe6r9yajbxawEMQIvkWl6SmRRpjaYplYdJ_as-mzklB_U1I
    bx3I6EyDQcyRr9ZA0azXcRfx2fLBZRtiegTTrsO-Y5Pj_hHCrFTzQ>
X-ME-Received: <xmr:l5xraaTd7BS1uZbLUQ-1Muz1eICtzH104mGvKhtVzVz9G90QygN9UXU5Fik8vYqw-qjZnSP3w4NBKoWTnYU0cudjhjjivDkyph8sTW-ajXrSuQ>
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
X-ME-Proxy: <xmx:l5xraWx3WqaOhpbf9Gvoo3S6tgjLWwJRlEJ4wPFcZmlfS9nsAxOCKg>
    <xmx:l5xrac3uSUnLB1gdxaPTptTupmK1DnUNBLXJAgemTptepOQQcYl_Gw>
    <xmx:l5xraU7pImXF2WmF080aQwmu0sjuZAXVC8RqUfbRTeYm-AwsZmauAA>
    <xmx:l5xrafWfotI1pA5OGTnvDmI30L1bvjjAnn7Vzk07QhpuBSIA-oqExw>
    <xmx:l5xraZWYjckacjvFI7w_cSFLse6Sfu_dA9WPIzF5DNuxxGVsr8BhQIun>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 09:28:38 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 8/9] firewire: core: add fw_iso_context_create() variant with header storage size
Date: Sat, 17 Jan 2026 23:28:21 +0900
Message-ID: <20260117142823.440811-9-o-takashi@sakamocchi.jp>
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

This commit adds a new variant of fw_iso_context_create() that allows
specifying the size of the isochronous context header storage at
allocation time.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/linux/firewire.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 8bf568471588..986d712e4d94 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -584,6 +584,16 @@ static inline struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 				       callback_data);
 }
 
+static inline struct fw_iso_context *fw_iso_context_create_with_header_storage_size(
+		struct fw_card *card, int type, int channel, int speed, size_t header_size,
+		size_t header_storage_size, fw_iso_callback_t callback, void *callback_data)
+{
+	union fw_iso_callback cb = { .sc = callback };
+
+	return __fw_iso_context_create(card, type, channel, speed, header_size, header_storage_size,
+				       cb, callback_data);
+}
+
 /**
  * fw_iso_context_schedule_flush_completions() - schedule work item to process isochronous context.
  * @ctx: the isochronous context
-- 
2.51.0

