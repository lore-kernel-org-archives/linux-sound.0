Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725089;
	b=Kb9VPg0hvE3z+LKj1CSjA76NhiHxlDN2XNTxL1xyLNFPnsl8WzSo+nooRZbahwrV1a64
	 +Knjkii+iIlJSr7TL0KuBu8EpEk29c6uKp+pvh6jo6b7GLNjDL4vc24qeHE6aHmFNzSj6
	 sShDqM0njl5ipFuAEsx2L2FQj4guh8ql9di6z8AY5glM2OUFU93UYqNENKs6n6/iFyWi2
	 It6DE99BiJov0bpwGuXH4lVgVcEqto/eUoqWpxzFAAbdo3Q/W5nmg9N8JVcc5fUvH4CMW
	 6/2S5S2BsFFnMYKBaa0V/FmTGWud31mzyRYT4YcZgQ+pJlh61xxfT2Rq0lwHKo9zMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725089;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=lL4D7R9KxDf+22sv9+j/sxEZCecScCAzSX1cEImABW8=;
	b=v3h6zgaj6btXuffnG+8SlOENMlyNo3SYwoXQ2t+NUvs9G/OqB1GBNbrsl8SPUQlWl9s8
	 FFhTfKxQ4GdBzTArIAln9haiNkfc/bELX2MNG6VBy4atOJIz3fMDIzvFB3nON7SbxHESg
	 RT1WQRTPsoOHTbvzPwXwihVi3gr6y4IXiz7UprBd5QP1ZnNgGR5lIoowm1WpyPkYWfKBS
	 eWIQcJ8mUJmq0FIGTGRkgJBFN/++nCAfNCb3YyZn+KmuWr5s9CJFIOstpeHbgTERMoqdS
	 djSOGtY2RfK87Fl+/7X5r9LgC/GhgwMJ/LvjO/Yp8bO/LsmFNQsiZQeNkmKMNKbpxTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=P+O7Mgq3;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254F606A31C;
	Thu, 26 Nov 2026 20:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F254F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=P+O7Mgq3
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jb7Vb3zTGzMljx;
	Thu, 26 Nov 2026 21:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795725079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lL4D7R9KxDf+22sv9+j/sxEZCecScCAzSX1cEImABW8=;
	b=P+O7Mgq3XY/A52unPjO6kVgrXbL5V40AafZ2SGmfMKZYd1rMJVlmCMQTSLkgNHyeCWOkXG
	XJApf6uNOFSilZ6nuModLLKdjAFH1O8jQsb4rKmh9z/TWiywJTsk4oR+DtktjxD42HRXOd
	AZ8KVP0/dcn9VlIJqrb1yj20euv3vei3min2AutQnT4LnPZNXFY7aGpLUPMbw4Y9DGbply
	oym3hlxcij2OSpsRzb6ygSDIPo7Om2f4dwPKmTamsLsaa8PZQRh94K0UUjyIhzH8Jy4Id2
	WhI+3pRxfanUEtD2qzR9s/LMVUS/C+JdjGfK5VwNMvyAXKWk87J8949LZ0folQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-pcm-rpmsg: fix kernel-doc
Date: Thu, 26 Nov 2026 21:30:39 +0100
Message-ID: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: d782bbe52c75f34ceeb
X-MBO-RS-META: ohjh36gga4w6sbm5enryspnsho44jfi9

Correct typo in kernel-doc, fixing:
  $ ./scripts/kernel-doc --none sound/soc/fsl/imx-pcm-rpmsg.h
  Warning: sound/soc/fsl/imx-pcm-rpmsg.h:419 expecting prototype for struct param_s. Prototype was for struct param_r instead

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 sound/soc/fsl/imx-pcm-rpmsg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.h b/sound/soc/fsl/imx-pcm-rpmsg.h
index 8286b55f00..52f2529724 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.h
+++ b/sound/soc/fsl/imx-pcm-rpmsg.h
@@ -397,7 +397,7 @@ struct param_s {
 } __packed;
 
 /**
- * struct param_s: send rpmsg parameter
+ * struct param_r: send rpmsg parameter
  *
  * @audioindex: audio instance index
  * @resp: response value
-- 
2.56.0

