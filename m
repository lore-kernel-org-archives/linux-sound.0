Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C447CA78
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934597; cv=none; b=DCwH51WXnFSnYrbr0md43KEgoei4WTdEvAGFY32cAP8mrXJ6QOHFD2UYtHt+WCmMbIgFcrN4Sal6U6piS5nvCETTCHfjHlFDC1/XuoIHOyuN0+xnCCJNr8dwG7MC/9pnXsdhzYN4Ujv94IjdczaZHZGgAJeU7aL5MCR95c8efv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934597; c=relaxed/simple;
	bh=7XIis/SaxCP7BZheKEH5EfAiCshL6qRfSl6dsIbmL4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljTU1uAOX9yAB6xeRTQ0M3zIoNPaaEAqLpd8mRLQEuMu6awI6d4v3pC2LQxdCavgIEbLNT92V7NlZI5fg4dd2qol9KaVelYCPtwPr9QOwUxb9a4X5OMF3gs6aIHh6A+y34eLb4hssQ0GoJxI+mQ/Y54N5wIv4ELjumiPFTdlumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=n2B7hROx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="n2B7hROx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso5767322f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934589; x=1791539389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=n2B7hROxQtQbKGz18ks1AH3gbEfILIH7PM/7q0+AyxNTos2sgtjQn7nwQB/6ZWoph4
         8UWSULx1+zAPSeYbp5T8apJmjG0rDwkN7bI/ws7JJkOz/mNX18g+aNiF+A6JNGzOXrDR
         ao9gYz0aT5lsRd29VsnTJnK/yjAjorW/phwFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934589; x=1791539389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=zUnAemkzKMY2QtxpQS5XimC7nhqOMFCB8zUqZlODdw0Be95Opi6aTbv0a+NXprbFwG
         GsyCwjqRH+B6YxrkdfKXQoDZo3g+dWOFuIB3M/E1478aUh99YVIb51HbsFgizqMk5olD
         4dBXlAuGAQF7IGOTPmB28aZ2x9q4XeRY20BUxW3AjDSilSatn+Uwy4fJfAVL6ppVOaEX
         wv9c2tDudsHl41FKxJ5bN7B8J6tnAz2gSxw+d19f6udrp4a4Vr8BtEOhCMfdJ6+SK39G
         X7SsXpl8JcaVZKhDxiM2fk6Y3LcUswB1W73ayas+i/bjIXOC3gzp+6av9WjP9RDMZEBv
         jg5w==
X-Forwarded-Encrypted: i=1; AKwUvByHnBet3QlsdlDeMkqlKUwXZ5WhJf3bJROazwPCnKVXBWIbHEduofjddTtOuPEgeU6/0nJ6VW3bVYCNnw==@vger.kernel.org
X-Gm-Message-State: AFuF++ldkjr3m6pXIcbw2fI2c6HOEfbDvofcf/7JDJs/axS/IKOSRdvt
	zQmX/WFcmxL2RBr+2iLLdhkeIO6NZ3DAOaNeXuigVz428OEhFTX5ZmKGHfw1gZzt5kFq+0Jrw8H
	GE1ziPZ395A==
X-Gm-Gg: AYBFou0UpVSgtNLI7UfPwIlfU/ROPV0Qccd9S1TyqvFIWGjob+OiffJcW/e//eCnY8D
	9wkaUvcQInGljdhOEt+G1kkO302F6hrD6twXpB2nI5EwV4AiE3MsUjhUWlWIyxSsqL76mJ70mmD
	4jMEE6rIiI8oWTxrc40dLTaBFcP3cbkmw9satuW2JisE2viaKGTfmirrmvWHoVr9DkP2W/TIjKu
	8ZL86DN3+m9qS2H6YiyE/rmtebYMGtSVzSo03c2nG6vQSkjDS6WUYjBaxZBRxnv2rNinLVDcFF7
	/8HeI5HXJJKlfoSSKjclg9RQ7f0RiEgTg5B6jpGSSW8gfVrV0CKhLg80n8+B3+CsVUNbEmAiTNI
	dh4mrVcCA1c2z1iOTJLnadI6A9Z3HFZgkVosn9aBxhz2DFcVYdaAjUUE7ONksMWvzxwaOwS7iqg
	ivMy4vqmMjCpj94MIOY+vhUJZtSJ8rdG94ppgLvpTo2SXP8Ag0koyy5LVhn98SKdTAk+nJPwz3L
	vw=
X-Received: by 2002:a05:600c:c3ce:10b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a02769f2a5mr27989155e9.27.1790934589559;
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm4572200f8f.41.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:33 +0200
Subject: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..e5e4b942acfc 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);

-- 
2.55.0

