Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC54BA42
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003068; cv=none; b=iVoY1yxwC/Nw3U/qozLRHAucKVK23X6dla/E/Cfo/VuDxgFanX0u9S4KtsvprTjsFiS9YB8jXW7oeIN3Uh5sVQTzidtIQNnE40LyT+TD6JiUu3GgkwoCxEoNEJdHAsJk/fboFprJgHmCZjce0+YqoRIzoOnKIK82snLkOw8DifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003068; c=relaxed/simple;
	bh=vYWYuVN4lK3XkrzlF4N+aA8raJCbc8inqKOksPmsXIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/FbwQ/oN9pmDD0x/Qszrh3Ij1o7W3g4uasKekYeld3Xg06/dwT2KWMMiPUwF1az/Wf1m6Ps568rS2Xn8/cE5Phyhjx8DyxDK/JUB2ccaHCccnBFHu1QRjruHxWHlUO7nfnAjHmcLmddYpjvs3fuR4FCz4x8VVaCcMP6du4I8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXFfClDl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXFfClDl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280c55e488so3955235e9.0
        for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003065; x=1722607865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm4i9m/ncQZPuov6nCVEVOfcxXDmdJCtPoFsZxzq7VE=;
        b=BXFfClDlHaDjbaV+jhg+EztBMz3iP926ns3sAeX1qJFGouN5CjlY9NBUqJ2QSkWtAA
         KQ+KFbDbr2uUtmxvyC7SBE9kSZ6GuWXgRFFmQnv5e0XD3NViQlxDqRmwYIy21NkieHLa
         Xf+7IGH6ltgqgHPZrTQhZ5HNIkaL7JYdMG6knwZjsXjtCd6d7tJArZ5D5Ilt0/LKGNO6
         SLuM7b3RspAxGEYbL6NL2gyUrxXUWR64sO3BGCgc55iGj1tGhKZHv1/yIUQpUE2forB4
         sxKbdg/3WRQe9pJt/I2kCdkasyqYu2E7uuWsWVGQBGCv5rDkbrgQjEaOk7CpV3ywqBpB
         0cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003065; x=1722607865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zm4i9m/ncQZPuov6nCVEVOfcxXDmdJCtPoFsZxzq7VE=;
        b=aSzzvC9bO6LAWrvuvY3CujhR3u4mOR1SJfRZAPC2DBkfcRaMR4bPPuyM9lZP9q63Zj
         lOoBdA64vpncjHRbN8imZvUUCggjtyyxh+XraZMDz5FD41lKYnH5g8lXmdZaGTgUrlU6
         BvQxQvGt1GLIbuK18Bc+BPeYUklUD2Nyd3Td98WghaqXWf3fl+JFCQeMqD9y2wzu+cnQ
         Ktzur03//7LlBf3S4nEhged3ZE6GOviu5QVkvnpUGRRMo2G9WOA0E1PUwwtChAUWHSv9
         LETrYCWP51FfSnSGA9fI5+9aGsang5QAlBbTklloek0ChX/X4moGMP8bxR3OZArUomCG
         +4Iw==
X-Gm-Message-State: AOJu0Yxv9GiaTdjFmyyZLQl+eHFyIBf3fE7cKGGEXy2xNV3J0gQDA6BP
	NBlC4qXzhBlEgJnrvJ5pmc3dK2TTzc+vEnko6hlvIk85vJdpJ5mnpDpUHBdbu8E=
X-Google-Smtp-Source: AGHT+IHwl9iv5umoPhExYwiCZKYi87nvMtqxmxK8Rx49dM71Q/xYQD0kJO7Hzb+m82Le5VpchJQRlA==
X-Received: by 2002:a05:600c:5247:b0:426:526f:4a1f with SMTP id 5b1f17b1804b1-42803b5b181mr45562735e9.16.1722003065313;
        Fri, 26 Jul 2024 07:11:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:46 +0200
Subject: [PATCH 6/6] ASoC: codecs: wsa884x: Correct Soundwire ports mask
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-6-d4d7a8b56f05@linaro.org>
References: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vYWYuVN4lK3XkrzlF4N+aA8raJCbc8inqKOksPmsXIE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65te5MyhCVdZRhQoHqqUXph8EfgHYbDMktc+
 pR/3JMeV2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOubQAKCRDBN2bmhouD
 17QID/9o+ExG1syoZx5GLY0VzNCNteL6E5cuNOrA+OdQ1Nwtug1RHqQ17IoqY4nYjtU1xZuKl2i
 eU7iEHYb5Ak2H9DHF0jbUsWP7ymH9YOY1WsPCQ5Pe2bNj7iJpru18vvrFABFVrqP1bMjZt37vUb
 Okr+pWTx0kPweMewQCs8jwl2uzQh1dYoh+mutI3sZ1bZLXDD0RM+db37/KQU2Ptrqn28XU+pVIR
 i0svhkxEOoSQUgLAGwQXviUnOLHFB57YjBlwIh6bZ9B26xMEWDKsWVrIvwoxny5crwDJHPxskUS
 KGe6PlEErlhXGeDYueBPkTgNsAb5JGWGeL16VpeqVXKBu1N/xZKT7lHHk1cT7bQuYlC6GoDu77d
 sQzT/MM0h6aWxFF46cKn71HA5/7+Mf9v3Y6X5Oifc0lj6G87IAHxTIFmA0xaFXvMMOubh8HYDVW
 Q/PvTuMQKp6Pn0OD5Q182HtBc5VJYmmS2+SNAxqbPX57XKCjrzNaFOrVe+4QZp1do9y+ztGF1fJ
 ymixiwT3tNPclmBqOXqGvaik23plgrnrOde+GRei6PivJtCkBo+a1dnOoEWOkOVI7RzjdxVWi0q
 AUaQ3YXZuTLyzGaS4vALPi2g8flrO3ev5qKxZ4nLyJlXxUPqEXO6bssiPuO8RkfBf5yrbyfY/1B
 3fDQ1WwNDYRRw2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device has up to WSA884X_MAX_SWR_PORTS number of ports and the array
assigned to prop.sink_dpn_prop has 0..WSA884X_MAX_SWR_PORTS-1 elements.
On the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WSA884X_MAX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: aa21a7d4f68a ("ASoC: codecs: wsa884x: Add WSA884x family of speakers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index d17ae17b2938..89eb5e03a617 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1895,7 +1895,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;

-- 
2.43.0

