Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875424;
	b=d7+hcbNqEA5vcK/0Jc9eQNiRhZgZo2cASHDK96UpsBii9DvNjJu2k7JyoL0McYsBxzfa
	 jTudUxpQklZ0+k+24VQ9wx+nYnAOQnPKJEh5NxLbJbkZHazJu+nndLLUPYZCo33W3V3BG
	 cNAVDA2wOx0vUgt25HDTXjsrRILiB1jTw7rkbmWybk4+xK+3Bl0rOL42z2r4jNplQdq4O
	 xUyB4tE0oFiT3HW9rSRu+v0PPN55vJExcSCjDhln9gtTQ/0lnbcwMjN2xfOlFIs82db5D
	 jYMHsbHwfUhRlKYruvxVb1ENG6T4fB9K6sUbl7OrH6clN1XHT7CmEQWrLqUd2CW4SsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
	b=RC8OydrHLtuJFz0mHR0mRFMMdG49UITPuzWD8/dGZNEBWMX9WJuy7MBRW//lDmKEEXw/
	 kh124JK/fx8fcChYs8xeWFXq6h+lMbh6JUB6AaH7fRRP1mYqCme5d6N+AzL29Q3FviJ7e
	 ITfSBEZJTIRIbPnBAT1TDbHJz7SB+YOw/3JszxZe0AyUJfzegsNVHz6GgcOyOk3+/PYkk
	 ou0MFR2aXD3njEMJrNcs/RfixwMYHg5GlJDKNp8I5l+hUEbaT8FkfMnQgokTdLLDKwGON
	 ++BaMfLyJZQqEdyYQmDZbfwh97JDEyU4FI72s8/cwtKr02S1o4HUXTEkbZVP17Yq88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdrL6Nc7;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E183606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E183606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdrL6Nc7
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1990001c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875423; x=1794480223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
        b=ZdrL6Nc7UuMPZ8WbsJf8eI1EYtxNQn8a0B9DBM1fmnXDl2neue25X14OdQYqZGqMs4
         3mMOy9SedUY0oHqTuE6vEhDiSjsk1vZStte+4IsjbVNkAGMthfckeTjoL8AlTy+YFk7w
         uh4rXnPZ3F+kUPs4JnoO2FkMbMCxKm6dEkGOiyAWJt00N6D5acu9giGBiI4t4GmPdZfJ
         9+hWs05EjWEN9e/75mesjqSMtxE2CYUJ1eVAd/Dj1F+heg1G7d1bNQIaoV6nkoJC/5/1
         PuuUA9YCJ2MTfdnP8NTxQ+nsOOHNUzJ2vw7UqB6fvWmt7XO61E6+mmVYfUCpEkOwvT9o
         YqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875423; x=1794480223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXICPYwChrk17gf+gSy2co454kHftdzrJdqzDelhNpI=;
        b=MNJ7ku8sg74ZDvog/vWiEx6vXc9wpEh+BLHBljX41B09bfhFV12gVic4XYThc9iEhE
         x++p9xNrg9n5uewqdokDNNP5iI1b49tajmy2qI9VGGLCCqxltEr2PBzA4Ojq16G8XBES
         YfUPusVr+/tP7cNjA5d2zxCbI+geeibjxY2pd7YQ2OcbTLnZZfXcjyE1+C1EqizQATsm
         aPGWrajT5pEPSIFX+wvFzfl+8iNbWiju6OSHshDRiinRikR5UEbGdCsLGRP+a7yBA+i0
         pbDlDb8ECLmzG87Ujw+b6Hseb4uiYe0uJYIWQ5eyOY0Thy4X8yGY8fyU67ygRm3r9HXv
         7EOA==
X-Forwarded-Encrypted: i=1; AKwUvBwZp1Wl+ykbxtQyvk2FchmSoAW7DeAogv4FEz/4J+KFEsa27jAjqI7CQPkn5QVMf8mNyAPEq0CUa2fJuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7NoM/L3GtnQ0C1ksGKgwt9cys+775R2xCMOgPjKsyA5cxsKdH
	C7G64SK9AMqR+yc7ksqUzCk7zONe2u7ZkIqQTjMbFtb6Ama5/SQGcz92
X-Gm-Gg: AYBFou1EqJg4QWAqDyn78sJrnCKlpjg1KB6Lq1iVfvyIMH+wJl0hPRZiMMNlaBuI3mw
	8QRoEpTfqLG2m4A1LiL9yjZViCNfQBSNY99SKh1aw0Zy1je5AwI74BcMwGpSVo5WTUhVAvnzY/X
	qgV0zsjXuyzu4CJ1wmOM5b5N1nF8qsAxbDNEqm47PnGygRveei/0MQchjq+7+zT9mBAccuTLi+9
	Ko7ErEALJWo8XPdf5r61dX2lQgBXnufR1rYfDtveMj6Tz+ac0LRUT1HvDxBtmxoqvr8hpX3sTuG
	ZL23ckYIQ+mAyvqGABrbgKuwpGuWexYrHG1c0g0zTAkCZ558JMDkP5GSrcwbuNmK7pBSwUSp9Jd
	JuYFsJoGWtJAcWQltBLnc9RVs9JBj/5SW6efjtsccULE/0rR0vg3TnTfHfOVEax003cMIFAlsiK
	ANdhoZ2ejZ5m/K7iiGgI84mbcdpy3eRjphN/L3mqOudoVxvl7rAV25/scfP+wi1SnVIZgz5dWhg
	wATxklU2//omZiANXAjWiQBDOajezif04aB6T/5oWH9Hp+jx2r0qbxhLxES4IPRSQvQPnRB31cR
	3FNB3Sl3/UK1SQ2KlR3hjpxW+yXXaojthxu3cDO/AF5OGmVeDl1LuCuac5V/wufLksma2PCwklF
	hug5J0ZaAKnKDfgnf11EbA7IjAPCm8bEQQbwXjhalNYkH
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr26533948c88.18.1793875422948;
        Thu, 05 Nov 2026 02:43:42 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:42 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/10] ASoC: fsl_sai: Warn if TE/RE does not clear on disable
Date: Thu,  5 Nov 2026 17:42:33 +0700
Message-ID: <20261105104237.38542-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

fsl_sai_config_disable() polls TE/RE with an open-coded loop and
continues silently if the bit does not clear within 1ms. Also, if
regmap_read() fails, the loop condition evaluates xcsr uninitialized.

Use regmap_read_poll_timeout_atomic() and warn on timeout.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8315a0d8893b..f75a1d61d7b7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -849,7 +849,8 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = dir == TX;
-	u32 xcsr, count = 100, mask;
+	u32 xcsr, mask;
+	int ret;
 
 	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
 		mask = FSL_SAI_CSR_TERE;
@@ -860,10 +861,15 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 			   mask, 0);
 
 	/* TERE will remain set till the end of current frame */
-	do {
-		udelay(10);
-		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
-	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+	ret = regmap_read_poll_timeout_atomic(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+					      xcsr, !(xcsr & FSL_SAI_CSR_TERE),
+					      10, 1000);
+	if (ret == -ETIMEDOUT)
+		dev_warn(&sai->pdev->dev, "%cx not disabled at frame end\n",
+			 tx ? 'T' : 'R');
+	else if (ret)
+		dev_err(&sai->pdev->dev, "failed to read %cSCR : %d\n",
+			tx ? 'T' : 'R', ret);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-- 
2.43.0

