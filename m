Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC1233149
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568457; cv=none; b=swRnypXK7MZg92AfUvrTbRgZ1U3Jy+BpAAPIOjBLYsBt5CSK/noCgK+CYPRNn0nD2vYD0X7pfrE/F9SVFWasYbS26L6D94qP2v3OROvFFGGcYWZsDQ5rRtqK59hOkdQ4uyP1zT1IBI6LDCObgLEOITf7nCPuRRGALT55kuZnQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568457; c=relaxed/simple;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiyZakbEuPydhyc+9zz1EeD9cxuYG/HjZMrzJ0gvprieaNcOh57SKB63VaUT0pviYWKldgZvcb+j3xqxzLhE7ah2YyUfrRh/+2CUft0TkqxXF1XmW5xD3pXJiUx6f59Xwd/Krr4moaYPxCNhhRYeq521L1s3sb8p7EBolvTPiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAmJjKIo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAmJjKIo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c1389so1328683f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568453; x=1746173253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=hAmJjKIo6hrty6Ia4dd+Hx12AtnoAWlBrMlJN4qqI/6fFypkKSN2pfcNP1xOumrSaO
         CLnQQKr6hZcPLEvbGtjTFrqKmVmDq7Xo8Cv+VOkyeV21csFzxu8BiH/ug0r7+TO2Qcyc
         DFKR6fUnVKKubyYnpB8nd21I9/sjdYRacLhulEOXlmZJ0pdeLcyFAAwm9iL6l8CWPRH7
         F85qFr1U44FNEJSlnatmW/1EN9ZWij1j+fjCvgXc5YnFZPku2wumRbKPV5htn2aBke9E
         Gg1wIEYj34s6jsQPwFy2gi++Zx/Yr7bjPvJZk5oe7NjrsOF/02lpbXZ2V6GukGC2m/Ps
         lSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568453; x=1746173253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=E6zQIbqRaa2XIYDqNiRqI113H60XACTOlkYhXE269+A7semqr+4M3phnskbaf1z3iV
         TMJe5myJTslr1jZh7EnkygZp5SSifqcQHvWr/f9nSPi+LwEBNmESuZbRKnMfZ4Qs6ajz
         uvE3n/yNvAeO7tUkd5ZOh4X1jBJvIVHc1Ugz0tp8M1Ch1ggytq145CT2DplQIRqzJCHw
         +NQftU0u9sU31k//MjNpwGyhyuC461CtORMQLn4nH84cvtPakvGmtLlyPEbsghyss1+R
         e/DFQnh+EnDgHtzKmnwsDJ11hfPU7ZgjgpXb9J6yNjpzpeoZebjWIm4oq0g9aUrQuUEY
         Y9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCULqoIRnWOqa2Zyx5DbC66FY66Ro2KoUtimAzQoR/WRC/DWvy2mtk1JnJzVx8FBJWEOB/D0YoFwV13O2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8LhoKrCS5tZjFk/I4C2duHj4NTajq/XWVOV3vfOlMZJDNFzMQ
	xr9lzLlzkdXIljbz5EgCsMvNl+VjwwsNZz1fV9Hpk7sdebBZoFm+GJfBtuzztYc=
X-Gm-Gg: ASbGncvYJSP3TAFluylmYRvcn/A5CxbaUfBFulzj5r++RToERxbaSv1jZg0zZbbWS7R
	JJ8tjL2bvhM6MNQkgfVv1SwMqsdUgngNNjWAkNgP9F9kfHFHcMsZkvH5iWK2VBFl8kUV+KUWwj1
	XA4V7I3YlNOtARBZWB4+54B9lxBx9zNAFjrPvbODNlf9AfsUFlY/JpsFOif5uJAces6cmR7kcbq
	ZR/K4ljJlJw//5TZa5yRfLBnR9sihj3PKr0JN1crZuGHAQqPraDJedydfpNBI3P1W9K2KT94tnb
	LK3BKBZevvC6THRi1tV2XwtobOIDxddrCzs4dibS4999IgUsEUsB7WkdERsmrtyf4Jtb5ymYZ0n
	ucldyAbwU9GA54HmusU338u3II+SaTfToDy8I4kSQJT8nv1UP3/COmE83
X-Google-Smtp-Source: AGHT+IESPkwoSXL9H158Zipa+9IfMAIxHeKuyCQjlKcULNXaCkr05UQj4rmsW9F9V/zyF5XpgSj7jg==
X-Received: by 2002:a05:6000:2485:b0:39e:e588:672a with SMTP id ffacd0b85a97d-3a074e0f0c0mr971220f8f.7.1745568452582;
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:25 +0200
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-1-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0

