Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636A50261
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563822; cv=none; b=n8Cvwzw/DPM3+ZTPvIdhfXlEK4C1r0TDY3T1n3VuzsiYsmwiBZcmDPwcB8+AFNPiVzz3FivRPfHyhthQK7ZvG6eO14F8y7y8bTk0p7wcq8LVEMD9GbURdU1yAaUdWQLMapGLryHekcyKDAmI2v3wuJnMfxzLoRZzt5wMH9lbB48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563822; c=relaxed/simple;
	bh=RRyqPnteX9svo/FeqH7qejShvl+Wu9J6rtShURC1Bwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvwxsYZC4Nz7Pqhtk74MfaulvI7N3krKbJiQ5SL0h/u71hZqES5enw8eAsYF6vHakTB9Q1xJSmYA4V4D+6Ax2aQ0F/tnjXShDGRnuyZUtLrZUgCCRnO3KiSW6RWY9FX0EayNisDxAz4DXTdkoV8Lej8Ks4V47kjCJ89ixcQ6ktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECaDEgO5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECaDEgO5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a519ef3054bso335319066b.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563818; x=1713168618; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrHqjLybF7CJnuNHXKR+lEoGvKA0pqz74L9RRTV+fT8=;
        b=ECaDEgO5bVhvHkPP0coFC3v9GyoLAfoYLjWAQ90iQBKh9meLoBGsM2+DeO0ebiE9PB
         zc8BxPE61FnUzDa/XQE16HfiFPJXCcn33EuCD4GXc0P2NTWmRl3S5CtHhRGf8xsS2Udf
         jsFI/cybYV0cI1gowI7LfP7NuPkrZBJOPqvsKfIEeYqfpm/3x0jZkYSno8QbP6mUtALw
         SIn7wodoAD1gpXjrRWl2qoZ93TCygzssTy/F0V/qbCiyJ8stk+xslLI0Pk9BMIG69AWv
         D/rjxkSW+2KYBjaD4qaBTAMZ0cJnQ9V+uUWKoU0hymHSbMP7hjJdU3yseyf2nNSpDgyQ
         gp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563818; x=1713168618;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrHqjLybF7CJnuNHXKR+lEoGvKA0pqz74L9RRTV+fT8=;
        b=hhlHCNax5px9qgaasfF+ty6S9PjsRYf1GgyWssjkaSMNV5Nj57oH/2Q4Z3PsjKXbbp
         cb8lSc+Ryz3Al8RoDlu9QkkRNjI5fmbjHyGzztOhfcFcqu2PpsSVIcnd4RrbYU180dhI
         hmkoyP9LTUlbx1ko2TNlkb17zQXsjsZmckICncCW30ImErwHPapqqirLtSU0/h57L5AF
         3AJ92E7SOglNWt4XP073KUVu8+ZMgNa7cT9nsA37rJeVnr+VVDGuGw108+pUmOwy+uiq
         r1OEyJbKkzypnFNVVKgvPPWoFb9nNECKQyjPuXgqv9MttoR7d00JoPuPV76ih12KWn/Q
         CxUw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Jy34UR5pKaONL/XdDn513SJH1bI0uxbWSyiRvn71B2+g2KL2l2Gi7UIMNOyUpoXharqz3E4xHeElUJjgWFMZSZvp9EmJ+4JulvU=
X-Gm-Message-State: AOJu0Yx+/MEW+xfZ2FEvOT3LBo0LZhZwihFEjszQRpyfPDlWHGtxEReH
	hcHDI4ns35Uk+iDLGqQk/AemP5SlU30ygX75+wayRBi6EgkTPk/ASnPjPuQFTHY=
X-Google-Smtp-Source: AGHT+IFaWJ0ko+880OE4+Ydorjjhc+EVFX8MZM5sS9kOSFgetr0n6d6xvsAp8RTPVZNNLK44nNU7nQ==
X-Received: by 2002:a17:906:fcab:b0:a51:8a78:d2ff with SMTP id qw11-20020a170906fcab00b00a518a78d2ffmr5620413ejb.34.1712563818217;
        Mon, 08 Apr 2024 01:10:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id my46-20020a1709065a6e00b00a4735e440e1sm4149587ejc.97.2024.04.08.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:17 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:35:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brent Lu <brent.lu@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mac Chiang <mac.chiang@intel.com>, apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Fix uninitialized variable in probe
Message-ID: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Initialize "is_legacy_cpu" to false to prevent an uninitialized variable
bug.

Fixes: 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index aadd341a202c..966bcd3e8bdc 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -606,7 +606,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
-	bool is_legacy_cpu;
+	bool is_legacy_cpu = false;
 	int ret;
 
 	if (pdev->id_entry && pdev->id_entry->driver_data)
-- 
2.43.0

