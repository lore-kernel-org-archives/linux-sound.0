Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB91E5B73
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713953; cv=none; b=UaG0SHNdI5Naej+hUn2JVK/Sw+XszaWRRTuK1eNpb8bvNd5W2xeX8S2MXyuE/QuAJjzFLe/0h3To0vqcSJEjp5hHawa6a/i705W2y+lqXv2UcDrq4Zkpgu/JeT21SCRfLP8zoJ7Ho77pZ4pyrjpQv9jeNBGq+AKWLgisHcb/eI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713953; c=relaxed/simple;
	bh=MkCBu/XB5S4UUYAmw3Gyngrhm/WGqXfyy/Hj2WV/rQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mljIzbYWj7s05bK6Crr8VHYyDn5d86dNNGjg/mifG48c8jkk+V4mpyaCG7T2Ow52rNjkLfhZzMovgLzNFPdFP8yIVkDDhXU+XRXi0fjF2ffegLEfWh8KDVFA8UtfxLmQjC8alC5lwSZCsIuG0RDlC+xwV+oNicuVaBMDq9HL9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InTuCRu+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InTuCRu+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so36454335e9.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713948; x=1745318748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=InTuCRu+3SX/lQAxKFv0mXZDuqoOH2r1OVTXc7UJn/DTOPEuFlDT28J9+hpgHOhYDv
         qcbI1LW7C6rtPWPqQGtaKMn2vlRSyLlmsIZFjUDI3uw/v6G6J5IQ3fCYyFyUfVAM6wOa
         QPYw4bCyMKkUySYLRISRq/9vPP1mqzYmvTR/k6kS4Uyt7LRuBuh7HxX4LIjbrolcAJCI
         VkHJKoRlxR49QYtNa/c38Zyk8szu7030Q1UgMmv0Mwn2n0axiXoV2DJo1KCN/ytQ/sO9
         KMYChaIObe2IArzW8/Cm2hYlZPqzLMeHYR/2suDXVzPPrq+wy/4EZPH2BFldhkbTJJp6
         vl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713948; x=1745318748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=NmY8I7k+SKh2MjZRWatHoaZ+2C0TDnekHuaGIf5au6Quk/j6AQPyufNMP2xBFezmAw
         fuDLwW5rIE0JGBqmBqHcgbVAG1UoCHbh43J6JSPKJQnddKp9sQhUWRmOwuE68a+3C3mH
         KeGfRpfuyhEDgE6J7CWzhvtWp6wj7xVWmZWQ7oadVHTYApAF68zzkKEyc1d6cwD9SGTj
         A1OWbPvJ8tE4xg1ESmLWN6zYJd48DFrbcAaQHetdmcjnvLkyvnZGReqkCL5nv5rj1Yf6
         9gJo43U6RTE669QTjUsP8KgQZ+MuqZUWchXQuZvSc4kuaovQDeEagO19WfB1LNt+j3J7
         VfIA==
X-Forwarded-Encrypted: i=1; AJvYcCXR5HbCWuLZIlg52xUXCk2v1/7NZmynJJiODTghKx4MhPqNQikKpQ59p5oQ+v0i6BS3vaQFO5Rqb4CcBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLrM/s35gQ6Q3L7n8tF87odPyEJqNp4oXvYVI/i7s7utpcsRM
	05PulG7CfGVJJRaCtIqXDRdsGzlvYu+crCxmpt9XUkB5ZKnNqyGC0dKbOqGROfI=
X-Gm-Gg: ASbGncsIVKjX6syEmvNiNdf8xMZJIDDbOPd7TvfAXGwaoFinjiOXOCxrSa8fLD9qxlt
	FH7G3p7TKy93k5cfFsIIz8V8mUjS3oNnRNJXJNgyzOrsB7s4td0L1e2xT6AhuUESMVdiu56W5Tr
	WzeYL8vbY5cwp7kkaSjg9Wtnyj3iti4wp62EWq/8QoDT5TA7Vkgjg0XG27kay405Pof3Ma/yFE6
	mT1UiZ9mE9gyCGvJf5vlFkcxGdUA0u2GvUinOpfW8wvPCxhLEsnQvzz5QGXw50lna1L8I8AMxRs
	qTkoy0URQbjbtvdKtZwxCcIf7XKdmqyMKSnNtAj3P62GrA==
X-Google-Smtp-Source: AGHT+IGCbFvyMPpLY+0TGJvec6wuV9t2NMPKNxUjFnVVx7rsRSV6GaToQxyKYgw2SV0wouSpipDAuw==
X-Received: by 2002:a05:6000:210b:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-39ecbc8a256mr7695306f8f.25.1744713948166;
        Tue, 15 Apr 2025 03:45:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf447777sm13613520f8f.100.2025.04.15.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: qcom: qdsp6: Set error code in q6usb_hw_params()
Message-ID: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if q6afe_port_get_from_id() fails.  Don't
return success.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 274c251e84dd..adba0446f301 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -74,8 +74,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
-	if (IS_ERR(q6usb_afe))
+	if (IS_ERR(q6usb_afe)) {
+		ret = PTR_ERR(q6usb_afe);
 		goto out;
+	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
-- 
2.47.2

