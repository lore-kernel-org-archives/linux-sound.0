Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BD303C83
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094380; cv=none; b=YJD7OvdpN4Gm/Cr5LrTKB9NbZEdPEfN0eOI7hHckAu1qSiB2Q+GtFy5g+dE1CMf5cI6O51NivdpXnBBflhZaYaH3wtKDrZ6GkJdSold0NHIEj/OOimeTm6DzROeR8/yFpklfOmrtrDeqiIkW0XbEDcI+/dyEG+Xi61OLJXHVRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094380; c=relaxed/simple;
	bh=rsdgxahP+TzcBBR6hkRLm1WyGt8Uyj+zEas1EFWfRPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1TJ/izsVX7jRuTkbchFas3KLYlv1L93Kb76uwabLdlRvbJpT0G/0/V+R8e17Jq7OeNcddG9xjZkngFtFuNhaHCksNRoHGbaRTtGzk3SBrq5vD8vE67rmxm8C9yJrQiCwETKk2mrIpAe7V61MElja3m/L/K4AAVPi1Xoi5k1244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lc0K1P3E; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lc0K1P3E"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so39073105e9.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758094375; x=1758699175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bU0kGu02NgCF+W246kGqwLalHsa+RZrJ5/QffDvGcLs=;
        b=lc0K1P3Ei/31SGbdaiD6FDcQCt/vNNZyiSgvZs8PNEap6/18kerLtqH98cSaOCarRE
         E80HfWyaMWqjrigt4c4qUr+Mf85/UVzEynyi25q5OfRrF8n9BRt5rDeoNyQhvfVIMhk6
         Uo9+r8zpQKQYfyJVmU7G4Pdz31SyGujEyOgVNg8meGzKg/GOE6gBc/G/2xvRUc3XiMRL
         OFRmjCJxusermmWqV6YWBTrdSfmGYZrgmyVDYDGyUKNndDYU4eFry9sOYCNpCKu4h365
         Z6FBs2I38yLNFtMNdfH+Q71zF1HQaUzi3eK0Vi2FMiafzcAIyuRczyu8/TGslpMUhe1p
         Tvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758094375; x=1758699175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU0kGu02NgCF+W246kGqwLalHsa+RZrJ5/QffDvGcLs=;
        b=AZMqX+IYVOkx0xphr++q2ullvuYj3xlTo6vv1g21e3oUIKuQkAc3ps2KzFX4dnuPF7
         U3PgjzdF5/etoFUgNfAfhsyrvTuUYKFhW4nLzHF5HuY10Q/EqFTFCifWJ/edI0+qeSLQ
         cbG3TzWcgo8WxsVs0J94uWiGpFwpp9f506Xz2WlHjCeHx9af16jy/BUlAcBfxV0nqD+f
         0KIDAA/MgBZ+w4NIpO/izeEXLz61kCqtISvOMoZlSutS/CF/erU+oJ16M+xPZ/Hg1RAz
         ZjhP9gMQARbr2U2fNeLdXtVzuifRyFup4Tsv48SxHvhXDSZRIp1NL3t8bevfl32gt+zC
         lCGA==
X-Forwarded-Encrypted: i=1; AJvYcCXiF8foFDhsQGVwJh6wwEFbSAGKWs/ayN6G+EtczEGQxnm+Qwr30Ts64OAiQwNIBYgZVjs6qAKfuw8gTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Q+Td1OU7VTMxPBh1huuTsWwOOKdA7M95g+eFpObx/OdtasD1
	eMImNS9U5/UIOR8bXAqSZFGkE/iVfvwX3ouE3xa4QbCPTJEytB3as6iwwYzi6V3HOYemxCL4k9W
	1DPNP
X-Gm-Gg: ASbGncuLLupYmwbRoOox0xzzoFIRUI+dJmNUqzrRRamaB2XcvP2q1BvmBp85r5v3Nq2
	fov+msfkyFEK8Cwg5DnQIz5YudcGgCPOKdVKuHu6Jtx/s2qwM28efygYyHjX6neHyGY8Jro1ggP
	8rgtcekBwL+kAmTxI4xCPLlOTI52FvXkxBQhTWdf2eLPHhNicHUSZD3YjfUFYwi6Xp1M6R5HJlJ
	IwfZwmZ52EyqRdT4S0MpP671sqdeX3GBHItKxJQ1BQpq6zOn1VdOmfk9AOfqyRNMvsZ3Hrrt72a
	aK6HzxU2PVEFkKyVt0gathmDrwKPmYufD2leao6C3aIsJiQZN/78DVTzdnnLnGLrEU9gDNeI4cj
	UJUvfF0aA2TZ3Jz1p+eNjcQ17PFU6tbznvtfNf9U=
X-Google-Smtp-Source: AGHT+IF0ZgU/Evjex+NzjIeYwN6zsjojKuXG/AxCYo2v92UV+NmTsIKkfmnfInDMfDxScv1zXXuNGw==
X-Received: by 2002:a05:600c:c4b8:b0:45b:8477:de1a with SMTP id 5b1f17b1804b1-46201f8a98fmr8140855e9.7.1758094374553;
        Wed, 17 Sep 2025 00:32:54 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:75ac:2ea2:dfdc:89c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm25442035e9.23.2025.09.17.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:32:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 17 Sep 2025 08:32:51 +0100
Subject: [PATCH v3 2/3] ALSA: compress_offload: increase
 SNDRV_COMPRESS_VERSION minor version by 1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-opus_codec_rfc_v1-v3-2-7737ad40132e@linaro.org>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Since addition of raw opus codec support we need to update
compress API minor version by one.
Bump the SNDRV_COMPRESS_VERSION to 0.4.1.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/uapi/sound/compress_offload.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 26f756cc2e6215fe99bbac4f4a32ceb475068ec4..b610683fd8dbe4cb60489874fe94aca167ac7abb 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -13,7 +13,7 @@
 #include <sound/asound.h>
 #include <sound/compress_params.h>
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 1)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes

-- 
2.47.3

