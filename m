Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8DD419310
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009218; cv=none; b=BbtNx/dbPTR55aSi1Www0uarrp6aAo+gc/ZDXFV/JO7KHDT8wUoi/UZe5ufi23IF+l5/8L4dmerPJPfJ8uziDfyCjabfaU1tTOSzfe+fxStDlvf1lkH4N08JQU3HuEk3mKctcqMpXaXFm33RhY2GN7ewo7Oz4y3yy7CCqpSxzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009218; c=relaxed/simple;
	bh=LGdH7SQSWJPZ/qtGT8hyfndTly/ySuClfSPo1vU0LNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukZnLL4qAwOY4z6bH8cHUdAXS1ZHsdbJAGd+WPHWFCbMN5sKT13Y5I75LxoNGX/PlnMI9+6IFxy1jiiYG48W3QiSupz/WYDSI1t4QmPMC09H37x75DQ9DzJ5BY7j7zVqIhnMnHX/9A7hxVY2VMbvGKzwbbMkmIWTJnTdjEO6JCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fouk6iBU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fouk6iBU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c168baac83so25294665ad.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009217; x=1781614017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/afz4nvXIRfi2Pj8KLVrX3BWxOHZHkPj8mzuPbQSFU=;
        b=fouk6iBUUTdFxF/OmMB4XP0pvPvPoKMTA3iEzD4mH8DvKWJZjyEnz5uvy9s4YNk8Ar
         MRO9XvonE2tDwN3F3sj7SPA0NnnB4bIK0t700q+DA+PCK8alfBZ3thyTslSF76f6i5c3
         H1gE7FvH1KhdgP0HcATWmN0jZPfgNwsUx3ulLLjmY6WrQRWVp1r+a4H/DGmC3xRGjrws
         su8DpyUovOt5HyfdsauZYKR99Ni6qwjRKAHILkEA2QHEEw9Spu6CcJcTwhTCvE5cs43N
         4Q/NdE1TMIt6/+A9XitXfyugPj4fy2ILOe3rc+7rEnXA7yabm2GgwC7bFRqP0nBRykk8
         rthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009217; x=1781614017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/afz4nvXIRfi2Pj8KLVrX3BWxOHZHkPj8mzuPbQSFU=;
        b=L2KBXRxFjpej/MmUDcZiN855EYmqIGlaOSzwcoxY7TXp5+l+T3iPOr2DQuKYisFDwT
         V4wQGPeM2xcBPI4FtjechDv+C6PyDe6QQ6Lix7QRL5hzuvFUoArnx9FuKG1XSg6+scdL
         R6ThjSkalaQYIuigAgcDEcfQjGgUYoAf+oHmV3bO/duptFTZnKTG0Fqqru7s4mqUTwbX
         4TvvAFjpWl1LcpOjCLMFTd6bou43QNe89GHF//4BApqn54eDyKMU/iYI0GE0ROQ1MHDp
         s3O7ZUmD4IH7uUZ0MlTsxCqTB6l4STqdcDKFC/mU6yEYgrSfUCr9xpeWubLfKoYAwArQ
         Eccw==
X-Forwarded-Encrypted: i=1; AFNElJ83r8EGzw0f/LeP3ZpzF3mZAl8QjaQQeOZZFcKW0XIh4RbayrQ1sOQBW1ejpvvhnWEKYiPqM0YiCGk+pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVG+J01e/Z8HT5tkqxBiBRhln9HEHrrpv7y5xqxlv2aW/4pyj
	Le2CxwSQMWb4KNFOWLFRRFMSPyugm9aQ1cTummea4MpPqzfBRkEGCRZf
X-Gm-Gg: Acq92OGr+dBt3x7G0BRtdTfQFm8c6IyTwr/t+Ns94tIF1UMK9aYm5ByebM2qRJnOLPg
	44iv6844qKqrfejoB1zbrOKuqGMia/gPjLK09TJpsb2+slxdSP5rm2ik2ulG2tePV8Cjx3PI3eF
	V+nN0jLGPOeiFIQe7b3F61QwgSfcQ0jJ02+gYjEjEbcDZay5eIHNHLnFfp663jxT5/0sfd3ZEXg
	QlK4sx2LViBVln9pZ8eJbVC2hNxjODMtCInwBm8J5CcLJM2uLYcUfrSWnOMHRRqlBUHvMRxnhJG
	CwCGEn9ZXBs0qjtCYhSIPe1y9ZTRr7LZOzWGViVfvdoN42vnCTH84mvTi5GvGXIcfcacH5ZUrWR
	ppTsjK0/5BhYZF+0a6Olw/1kjLgrgQB39PKaIBAI5lJ1n7TOK7hub7pkXsHD8/Cd3MBmolYaF8k
	iLPeVq75lFlB0t5LA6vOQs11JKgFDNlK9qDCY8v2qDq6hzc245zNIONe5lOVNfTcIZTqttvvPhw
	p9Rlwz3d5Ja6cXdt8B+xd7Dy7g=
X-Received: by 2002:a17:903:17c4:b0:2c2:b6c2:9daf with SMTP id d9443c01a7336-2c2b6c29e60mr3304995ad.37.1781009216876;
        Tue, 09 Jun 2026 05:46:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:46:56 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jeeja KP <jeeja.kp@intel.com>,
	"Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/4] ASoC: codecs: hdac_hdmi: Validate written enum value
Date: Tue,  9 Jun 2026 21:43:13 +0900
Message-ID: <20260609124317.38046-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdac_hdmi_set_pin_port_mux() uses the written enum value to index the
texts array before calling snd_soc_dapm_put_enum_double(), which validates
that the value is within the enum item range.

An out-of-range value can therefore make the driver read past the texts
array before the helper rejects the write. Move the lookup after the helper
has accepted the value.

Fixes: 4a3478debf36 ("ASoC: hdac_hdmi: Add jack reporting")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/hdac_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 2652fcf2a3a3..3220f9226e0b 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -911,12 +911,14 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
 	struct hdac_hdmi_pcm *pcm;
-	const char *cvt_name =  e->texts[ucontrol->value.enumerated.item[0]];
+	const char *cvt_name;
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 	if (ret < 0)
 		return ret;
 
+	cvt_name = e->texts[ucontrol->value.enumerated.item[0]];
+
 	if (port == NULL)
 		return -EINVAL;
 
-- 
2.43.0

