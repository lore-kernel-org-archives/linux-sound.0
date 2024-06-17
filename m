Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DC197A76
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629420; cv=none; b=UfszEtZABY/0oeif5uh+pmNxbzuRrwq8n0ZLOJjbr/RsnzItJ/Y/5SJ5gMcQuj0pktYGSo9wkf+HRdbxbszgt9aDRqlJQHPcTY1PU54BeF06py4uRjyVIDxVi33Drf7phBUUal8oYO/lRELvYrtRRfhbPXb6o6YAcqvv1Ynokso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629420; c=relaxed/simple;
	bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWdNp46jI6ZGsan8i2MgcvE6djdBTCcGYXo03OmPZ+xvBcC+t27b4TxTNqE3wGX3VR+EdanF6mwV93EUr1qy3PJ1VYG6rjUnoR99CQtdzDJqpv50/Y9PQNsmbPZ0aAdDUKe1HpeKNsUqTNuK7D9xtgdQ+9UkJR1OkqlJMIu0yiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKWu3JFM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKWu3JFM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c6011d75dso5302103a12.3
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629416; x=1719234216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=BKWu3JFMdM9c/HOoXbLZ1Rq90XMRZveQ3WAw4CNaPnT8EFm0pSEq3fxsr79ts26rGk
         lxSIVn3pWRCuvO/6B/Cbf5AFmnANPPPBxgYI5V6vpwl5qs3dLKJtBEsz2gVx6BmFNH6t
         12LCkP5V3gwUzTiZZc2v3C3x9bv1rrZwg1//Xo+RrdSaJXI03mvsm5B5HK2swc8PMMKs
         bBAZ845DMReeRLtrT1+CWZ0NFqZOjafSHVx/U5DgCS/ZLpl4UYTo+rccCXNiR1qmcA+N
         sUH6JISrr5vZKhJEqKtBnKx9zPaw7YC/PqBKGqbrQbLMA85zHYwldr8ywOq2ah2tOOj0
         H3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629416; x=1719234216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=mlI2jrx722qJ/gM4J0u9ep9zcKfRA8oKzPFXPM0918+abTbvcgBajgtNCjgH2F4UpS
         r58cotTLswcwn7XLAzIDfhWQMgNCfbfFPxPSwN1BPmECbGuG1Ffw3W7i2HAdpNzy/UKb
         qWxvl1g225pkJWpuMXSitKPRiiMMlzLPp9aXe14zZzD7axfwddQ78HkQ9/ACL4O6NkZH
         qFI1GAFy2Mqcdc+zRNfF9ecWr8cfBVbqZdp+WvNFO4+6pX+OE80+YLOElH3G0MkUUgdO
         ZRYE7CWZwObrAA5XIhuYpxGAhoEWb/8ULY/QeodnKFJQ2co0hzC1t2Bq4gPy2DpfkD1i
         zF/w==
X-Gm-Message-State: AOJu0YzAczch0KZB+dKnqAOb+14eUuKDvDAh15nn3Wvyvahvqmq7icor
	ublNArj3ndnLb6smeLU1SN3c5D9Sy43kFkx7J1dJZEptFjrA+9BypPgUALcQDnQ=
X-Google-Smtp-Source: AGHT+IEI2XIgoT75h7Br+R9UPixD8KUgoWs/OqjcRXJjfTldGZCA0rliZmucMT0rRgFW1nfE8SfbEA==
X-Received: by 2002:a50:8752:0:b0:57a:2309:c1e1 with SMTP id 4fb4d7f45d1cf-57cbd68ef64mr6670421a12.23.1718629416521;
        Mon, 17 Jun 2024 06:03:36 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:20 +0200
Subject: [PATCH 2/6] ASoC: Constify of_phandle_args in
 snd_soc_dai_link_component
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-n-asoc-const-auto-selectable-formats-v1-2-8004f346ee38@linaro.org>
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQgtgcSzA+EJVFaCjgKa6XsvslogGH3FKDhC
 x0BhuH7NruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IAAKCRDBN2bmhouD
 1yXWD/4q/WLTFuKY8TnmWYhhWz7Agk+LgxO8M5bKRbWEfAq/vHP3RXcfUJqf/1pGw2mzaI0ma3A
 2SeA460FgsXpYCe8mtzVXyK7qom2vGauqQf6cr647nVRyswwjvmBvFJvbLG7gYIVqd7MR2LcaiD
 fT9Ij/FWEkgg/wx+dbkdfe3RBnUDBUovKVdmm0bCkaVVEcJ2xKEKHfgahiJsl5QfUKEZba8Py4m
 yq5h6sUqp0B9nHEeI3nqiXqrxfpEVwtLa36sLIaTiKxJr8fZD6IbJzdj0RLpfc5KjCUHUS10Gps
 W1DFDdVBgs4+cjPSFOFuWpdsjEqJPVUvdqUtfFVMN/BCKhAQh9tlzyfA1LEqUwMuoWbG2LtIb27
 nHBiek2zflKpj6HmIE/IUMiL+PU2mV84nXhC/na2XHsKBdgf4mw4H4jCIa6BgXhQRlF0S4Y7Itf
 A5G4krXG5u5oRiclhtF82cAVhHTfHWC/HIzxq/dSsEvTCxInYYJVNGbN/JUdCmZhP1M7k80k8j1
 d2+YBSxO6/Y91bX32KnysxmN+w3oWFByAMrZZt+SxY/e8yHeTNVouW9alwbGN/xXNQ+LS8bte9i
 23lUwC64C1+NkpIvn1+gzUGYGt5BWR9OoJZTiO1jqXU6r5B7c9qtxsLXCKgqL1Fok2Yg82EyV36
 ljUJn0yU1qclZiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ASoC core code does not modify contents of 'of_phandle_args' in 'struct
snd_soc_dai_link_component', so the pointer can be made as a pointer to
const.  This makes code safer, serves as clear annotation of core's
intentions and allows putting pointed structures in rodata (if ever
applicable).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee89..f02a51694ab4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -675,7 +675,7 @@ struct snd_soc_dai_link_component {
 	const char *name;
 	struct device_node *of_node;
 	const char *dai_name;
-	struct of_phandle_args *dai_args;
+	const struct of_phandle_args *dai_args;
 };
 
 /*

-- 
2.43.0

