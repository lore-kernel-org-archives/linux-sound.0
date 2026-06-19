Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844C31E842
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857587; cv=pass; b=BAu8EIaEIiGM04XXl7LM0BSUKbZC75uzsnp0c5cM/McFXQCP/3Amav3zOaEgMR1xpbWcOsOVvBbuQQyiMOPmueTe0dBolKEPh9gwmySRG0jMvLT1u0JWX7fyA8RGzYf4n+7sjKLuOkKDPJrZCbnQ+BD4PgTdFVW6Ld7HTYmaI3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857587; c=relaxed/simple;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ow3Z3TIXv6e7Avv7+e21YSPTJWfTMmCoiY0/IcRKp0IWAA+7bVOB210N6eyKY+LM6NCxsE7sdzzHj7K8Csh/iNjDjEug8E/nFvhNywizhLS6g3e82QPCLodLCjonASvWYbmN4jHLeqWczFAXb7ZXDSFsClfCtqv+Rzm309/xPvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu2EGv2Y; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu2EGv2Y"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37c8e7c8137so979171a91.1
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=NC1i99dXJ7/enTApliz9uVOkuKu4c5PGQ+CO+4AGaS78R544IiB13f9hGnusC0S9xr
         v/ohSU90YhXsy/LJeiwQNLGkHhzvxTLxunE5K+jIuhRaqt244FCDqm1OdPwZRA1h8I90
         Da23FctueGz6EMOHDHSGe+4LS+XEsb4Tx1kd7/397T4mxeltf0vj3GOY5CGzHPBNgdmm
         ipu76vheySjw9DJFxsbaUX3HvNLbGv7KSf05THTDhJ+VmZJeDHfkkcpWQNWpG1vmt8Et
         Ji1Sgmy8H/ClEQsCJpem5JOE/OCOERPZwdhdb5HPtd3W2iKgyNg3s7DlraxYQYtNzWQq
         Yy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=pUzFM0PMIcD3/YWJgfj+QnHbb9nUt1wwW75fzIHJvmc=;
        b=Hjfj1GushT9ffN8yRoow7ydudvSVrvE8gM4RCb2auQRSbsfijx/QFyZMSjkZ1g0Jf+
         46RI1FkdrksBg3DLdLiuIUKM7oH8Fiu+HPQpm0WqCBSCM7zi7KwZrdCcwNAkkXvslmcL
         77Dz5ncqhZbkX0SzuTEwHu2nFaSdjQI+JCWpj/oAaUwodbRA5M7dpxYhBr21mzH9+vqh
         Cf/niTB5eUu15+Vvy6lXiKSopSsrorPUE5DupCHV+caZZbt6iIR0ZotfNrMGVT1aL6On
         1RL4hDCUvUyMtZRiyf/coo/eVA74pMVgwFAj5Q10tNV+mGoAzd58Z8p7fnvaJny+v9Ic
         V/rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=Xu2EGv2YSGIjOWLNQEqKLgDFhM5g5rNy6TiQC1Z7Vn/8+DF3lLGaTeYdVPshX23EN/
         XwET/iqHrZBs+4kNw1rfO8vWkK0pIJNf5Ua3wwsdg4Ys6ThW5VUfml9ARu8s1ISXeX9K
         9nlZJxtihXj4LjuTKaJMadvJLJ7Q6Z1HxC+jMLpBykwZShBvWDRYV9FREnBcOo6BGMyH
         mWVwsPjcIxjhRvLrJFITMmsGpoaCRIl8e9STI0z6ya8y4ERrKFUns6IQmlWHU9HXm8lX
         wxoFJFLMXDqAODhAwk9aQQcerYug6OLZx8ruA3zJ8BgFKQejXj07xVETn9BChsHJ06OW
         e6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=kMuVAGulxM28OJBWi62UcwrqhDTKtrFR+CRsNcS/aZg/YRK9o0QG3hwdwe267JIW7C
         /bi/87j8cmcmMchVBRldckkU0FvViHap6jAmnfORX+dmwx6NRK4yyAiav5sdmiubAJwT
         7TCc75lGMEOx1I2YbTPHFe9om08kTKL0OFKex6/JXnoOUwNdELp+RhoG4p1cExKGwTFp
         yCp+ehmkL47chrLet+AIEX55AZCzjRr6jdrIw/lxnj6RqNOAgql0JwueGC0GyOfSjz2q
         FX8AL8humN60oR7JpHlOdEXHI1Ymf3YK5Q24XhP6X9+zjYjf/RjEK+gTTYN2PounN2qv
         0usg==
X-Forwarded-Encrypted: i=1; AFNElJ+v/J+h8iPLkI7huwEoa1zDmcXuPKhlUQercve+lfsiw0LU16N/UPVirXr+3ozvkDoCgSSAn/BHK/1ZGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XxAOOxX4AAfcVIYZtbH1d3VO6/QWwnJTucVJOkufGlLj6Mv0
	c3qVbGGhou/Rm+ncPLFdsALKQgQtOSF2S54+l/lfdhSnRgrZmuszMh5sqJIo7bIlttyvS8JJz0P
	cYzctnsmWFOkF499rdLd21BtxaMxWQps=
X-Gm-Gg: AfdE7ckp+WicD3eFejiB3B5DgJRV59fSsB/klzsf+ngH890FjdtSyKFDSddwU2npjvS
	haKCE8Na6xBSR/55XADpO7njDlF4Rpvkd17cfc4gTw7HmrrBEBusIhheMcioEMMOjqrjz0L6+tQ
	eju0ylZuEBl99GNR3NAh9cKfwHe4FakHgnTCExYn9d2jcicagKXqb7H5Sk5B/XMXjT/ShjYw5ZU
	we6nUIiaVvIqKkViiAyf0Dhw7YTnNydMAy7JJht2qfutEtj6zby3IKmx2w0iwBRcnb/Xo6Lb2zg
	PRMcmsn0JB4HcaXnQhIkd4kh+Fo=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc
