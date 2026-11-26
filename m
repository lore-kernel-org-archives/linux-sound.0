Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724596;
	b=k/svDF5At2Ovszkt1KQzhzG0tDY0rXyuIvV0Ja0BJvTJBaHFv4VFqkcXVkmUtq8DGd4b
	 hMg3dVRnfKin1iQbWOhC3I0DFdN4Z3kZEuBIZJWhGOBShFuhkZpZRt5RSRQ+IqGA4+dMC
	 Vu5Luf1Ueln3SGAa8tpaK3pGfUhWMk9QTri8fA70MtdWApMg8z87CZo/0nkTyg0NlqLuE
	 8jsmOqGddhMVfvkhqDoQ8nJCrzCjqB5uWOp5Lq3rZCfbA/UfI8KNJye2sdaaEHToQnusC
	 gtbFewJEGPutsX5gGbMlqr46R72JSOjbTihEKzfZeHALfXYOyNcLkj/92C5uXuTkV2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724596;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=chwPbWyV/3dniQ0D2ybP4CEEyDkfX7hi6zR4HVMIJeU=;
	b=fV7fyjHI8gRUHoFDqTZXKosXfb1Z6zLsBmpOHv9WWVojAofqpjThGK42oKqqltLOLo+D
	 dERjVT6uynNBVf9Spd4eh3tdeUtMg29Hmtbtnm8O5LW9inJ0rVz6ttd/vHW+lNla/OQjv
	 B95LDTMVKtxDwrJmAs7/ATBQYSiayxD1PMkiUSjTVbmSRLtkeQ1ih5X1MRrsVctrCY8+o
	 Az2SawvTmvG+WAgdkoOLGJMf3Uyi4eRMigzqhnXV7bqHpYsLYw7oJsrE4y2VW+1C02h8S
	 SE0WsH0h4v5hR3LFGYBrWqEX53s/ckXheTRNfn/2Pk3+o+NtvUXZ64xBnvE1uKNy2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=sUChQFoI;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98434606A321;
	Thu, 26 Nov 2026 20:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98434606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=sUChQFoI
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jb7K62xwWzKmSv;
	Thu, 26 Nov 2026 21:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795724586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=chwPbWyV/3dniQ0D2ybP4CEEyDkfX7hi6zR4HVMIJeU=;
	b=sUChQFoI7LpHGmv6qupX6IW+Mo5ENr926n5SH/iYJ1qqOi1SRTgAj4htSTabS5bKRcGGHf
	CCCLe5Lj4bUexTGiGglAXiABs4gms89YBeFab06it2G14rDcTH1PNS5uNjIM9k08ZAF5jB
	V86kqhnR19tw7OqshPL1OeKmQ9pQzkxjXhTJ5TJNlAwIKajA39eXwxqJxc4jn1ySNZp/Gz
	+pPBNqfy8k85JoMxJB+HFJpFCBeLEYLKZGaYU2yjwcD7hPsEHroVLFQnKe8u+28WRVTx65
	8u6VxXSJJP3qi0UnfIwC65XshinneS6SLg7WzwDjmDpH6qD0Z5s9XSkfItPAzQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt5514-spi: fix comment notation
Date: Thu, 26 Nov 2026 21:21:07 +0100
Message-ID: <20261126202107.1776233-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ebdd3m1kwtneigwm9sisijay1murohx9
X-MBO-RS-ID: f86c900311ea0c15c44

Turn kernel-doc into multi-line comment, fixing:
  $ ./scripts/kernel-doc --none sound/soc/codecs/rt5514-spi.h
  Warning: sound/soc/codecs/rt5514-spi.h:12 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * RT5514_SPI_BUF_LEN is the buffer size of SPI master controller.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 sound/soc/codecs/rt5514-spi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.h b/sound/soc/codecs/rt5514-spi.h
index cedb19709c..fce9fba1fc 100644
--- a/sound/soc/codecs/rt5514-spi.h
+++ b/sound/soc/codecs/rt5514-spi.h
@@ -9,9 +9,9 @@
 #ifndef __RT5514_SPI_H__
 #define __RT5514_SPI_H__
 
-/**
+/*
  * RT5514_SPI_BUF_LEN is the buffer size of SPI master controller.
-*/
+ */
 #define RT5514_SPI_BUF_LEN		240
 
 #define RT5514_BUFFER_VOICE_BASE	0x18000200
-- 
2.56.0

