Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4513C695
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471804; cv=none; b=fWHKAVsNr8HugwViP7XSp2fWeN6BdTUDozUKThNtG3SCs1rFKvGi2zptBih2f+UtU5AAXWwEmfIKy3gi6hjGqRJqEhEcMQcbEexWAYf0zpSBcpl3BkPeeXYYrobmVLaol+V7o/cX31GZ3G1THB4e4V8fHNN8s1sLA91VC2yb+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471804; c=relaxed/simple;
	bh=BMShRTcWJEQSaIviUcz1ALmaZ6O0uj4o+VfvJ359y5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fyj/h+4WmJ735AjgoiLRmZQUjhyxs08JiOVNj1c2d+zR4I7LOLx4DS8q52CJ4JlJQyuJfy2bHp4mT6aX/P5qZvOqjTDulkhG4uCmC4qNN/p/ythfs2X+7Ye//oU12AYS90mpJtYTSMrBZo3u0hM/d8GjCxwcNxlLJDfZ4ExPSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qdxths+v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qdxths+v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso3084335e9.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471800; x=1743076600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BX8azcuPUPcGmYXdX3K49oOlARId2JPIzgFIvQ9dQ4g=;
        b=Qdxths+vOfIaseJUEsulczxWszpVXnki9fEhPVxKbaTIn84YNKsgTCXEKx7xkIgs8M
         k28IWfLxjLeTRf0SOcTGf08a2AAkb6LdI+6WYWZxkTrekAP57Bsn1qV22PeNscObkjAk
         qZXVfNdMOMASggAZD7FcHcIl40E4bhW9XyT4lbpEC6F+c6+HSI2/nKLoRP/ZURFAVJDA
         +7ZCi9y/hrbqVc5Jc/Fn9hKIBF19eJcoXafVOv1degNtNiwp7+w3qML1p7wkylTgwQa4
         RHx1KHWVZ2QPFaGGpk664pUObT8zcXkAh5f6O1+iQEl5hbqgs/W5w26iy/IDPMK3Q+3F
         ExWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471800; x=1743076600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX8azcuPUPcGmYXdX3K49oOlARId2JPIzgFIvQ9dQ4g=;
        b=RMJlIpXw5iGIyQbUcLRCTDYi07ZaicJt1l9lbZ21DEf421AfTpDEoiG0pJjwMAYdjq
         3fElczTu2hQTqD7lZM8Md2D3ZpvYB8zyA1lLm4LQx979qN02973DMdYCzuaOluONL0ps
         pSCb+Ez3ZghPAwx57EzxqoegwMsQKIAbSTJbuWdLB0OMEaRBa3O9W7cYs8bAxerC4hyy
         Uqnvyc0tcb3q0aySB0ozuEjgEw08RixzM2qGfqVCAgkHSg3UbHpPtamjyuD4LSLVRRLW
         fWhvF3zrSciS6GHSZTKAPKpggISp2WCSPv5n6DeLs8n0fu700pWjcO9rOQBjmjRn+uCy
         g7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVKNvwjTcM1vPoqxVxboEyhbtsMv0nQe5OE/mTf4/qUe1fewCNkjJQ3BeR/mjZB+uzN00g+80qC2HuFbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxN/wRHd3kWPwDny1cMtoRnvDNKLEkM3j+ZwKa3UpedjTZmcI+
	XSMEulfngUng7c6RMm57gQETzZ6iJ5YFeIS61VgcHo2ythcIm3kyeau1sHNKfbU=
X-Gm-Gg: ASbGncsQioh0cbGdJNS2xj1wp/+g41sswJAdqOBIZFDuiU5jt14rjRJjQcn9xwddAtL
	Z7icX5Lq9A2YXWvvM+fepciz7tkSLhsW6X3Wff6pb1HwtPODzdXOY1TzLqQ0JYjxE53Vuxyh4sU
	cPtu/6zAbszEoChvjHoukswbvI3ADO77JyPl1O1l8yZml7EoHdOm2bvLAD5/q/aqOS0WGe4E09r
	O/Vdwcwnv3llbgvBQw4RXFYIZu8t0qVF6BwUfRoDBdCPtoiXMQWGr32SiSk6rBgKGWG/4CrrBiR
	P85byAU0p+rE79pM9OltdNGpMdTnLbP8JZG7k8ZMn/t+Fg/Kx4ZJ2pPErixC6PLp7O8wLQ==
X-Google-Smtp-Source: AGHT+IFuA3/VMVKcDf3fFvwvPD1gU5PkZBOsrXrba5zDC7lgg5k/5Q4hY20InWuM7OSFEj3sUpm5YQ==
X-Received: by 2002:a05:6000:2cd:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-399739bc8c0mr6784071f8f.14.1742471800069;
        Thu, 20 Mar 2025 04:56:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:39 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/5] ASoC: wcd938x: enable t14s audio headset
Date: Thu, 20 Mar 2025 11:56:28 +0000
Message-Id: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

This patchset adds required bindings and changes to codec and dts to   
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.
   

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.

Srinivas Kandagatla (5):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  7 +++-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 25 ++++++++++++
 drivers/mux/gpio.c                            |  8 ++++
 sound/soc/codecs/Kconfig                      |  2 +
 sound/soc/codecs/wcd938x.c                    | 38 +++++++++++++++----
 6 files changed, 75 insertions(+), 9 deletions(-)

-- 
2.39.5

