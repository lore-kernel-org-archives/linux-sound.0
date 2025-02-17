Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8051974FE
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777560; cv=none; b=Ikkgz+W7DImJj4wLxveuqNb70nPkvf5VmFQLVkawn/kyP1zem0ASplQN7jSW2ByMxCkFal9EkUZQ/icUfBkRtcz13/lU5G8ahbYDgdSk7vwn12s1/DLjM5Mr9E2wnlcf8PccDeeOZH5u4ThHdsC7PdlF+yU+3Jf4vXq83FLS4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777560; c=relaxed/simple;
	bh=iOSp9K3fulh0VbLRdj1Bcq7Vd9vXiDQNcOEL0h9MGOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNn5DRj0Mq176i6Nh+KsFYRpdcvLbRQLcC5Nm7MLOAV8wkdgDdT6qzLyD291pn+LlU4Lv8z3lh2UU5Ms6JuvQK0i0fNVrhFdgeImxxN40rKp4ksYBVhSbtA+vdnmSWMEPtaTZHlZ4ndgOgb/Wz5edYDfU3jbW92ZcNenkZpXIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOXVVFPE; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOXVVFPE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb7f539c35so301389366b.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Feb 2025 23:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777557; x=1740382357; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=TOXVVFPEBlAEA9l8JpUN1RYaoM/lQdXa+8Onu6qpDJANJ5bCR9EYtjkd0Ui+1AyEJQ
         X3uPImLr7wSgVFPjkWX7vK/zKhGYntLM3PEtcK+xYVqP3TERdHUYQjH4kXYq+ng2LTCs
         tutY9q7umGpv2XH2Jx/sRNvsAfiDsqrI+vNT0i3YmKbZhWS5OJ93AdDTWPCBuw4q5tJY
         +1L1rcOLjY6kH67ne1xuvQQpzYd1CXcCQ6K/WTrU5fh6P2OATL+I6DUXi+qN5COkyjUT
         EuISwzf4qHjJ0Wfa6Zf7t4hJ+bYxCKg4uwk7hnsU/0v64LGAsMvknTyj/66fjTOUn3g/
         zLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777557; x=1740382357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=OCdJOXopcf77ct9f/3jk4feEO2bzad2MftwPtcvZdLreorcVCG2N3g9dC4Ln16m8to
         SBTcJVj+035AEgb+Gf+b/1/zYfD9UpBko103VrQ0S8S072JBg8dFgTN2utcxIj7GQjSm
         dRQJ8HAivpTRqu8uSGdaYx5jPRJAfVfHzNEk3/VeMQFtlIWZh3+6t0lC7eia8j62Z/Gw
         5GnOvVuh89mJhOxQKDG29f4Pk3WaeSj4nfDM1t4PgM8KiQTFq9EEAQcp6GK4g8zvvhsf
         g7jRXvnZOebZIjxA187AHs9mUQ04IHny2OyeoSClEvAv8SKlruPVL22aS3j/HEjoBeJm
         JNzw==
X-Forwarded-Encrypted: i=1; AJvYcCUzu3KXO24c6UUnWbnzGyhdclR82qERZBFhq80YrLPLsLVnVcrky5ERro9bpnHADT3EZ4teU7XQshosFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3hCe5siwsq32Ga0iEmVaby8UTcv/xyHNEXMlaQt/SHq+Tk5m
	6TgdgLUwcSUnLOo0AcqivwUR90TpXSb10Tg9KVNvSyg8Zp6WZvtOvn/Tx4iDE3s=
X-Gm-Gg: ASbGnct+EK++PBU7uL4liksdih6TXgFFfWq6gZaWwlPrLu/3eD6C+3Wm7Rd9ZwDaPYC
	UbAPEIhnFvAsXfB8TyNwH8JekB7jrWxFjrxTPHVEVWQXU41AiX612H3y1IaDPqEbFcdE3GCdaaK
	nDJLHonm8yhvPx2BBQS1sxEF7BM7UbcbqUUZ5Wf0GOdyx7rtyvr3Q72qpIm/Jra1mavr79wk8QG
	zaceNSn3bvCI9WVybduM1Wm9D/uHvgy+ImUccatbJyXQYglLAXiAe4XkUCziQwToEm/u8aBKZu9
	G7PMTh7cuzVEDBwxfNb3
X-Google-Smtp-Source: AGHT+IEcdCzKmfW6zdCdnOroccwgNmmDLOlJUJcE91OJUWqcSxVf6IhB+cxML7fRc8rv7wfAKU/7HA==
X-Received: by 2002:a17:907:1b23:b0:aab:c35e:509b with SMTP id a640c23a62f3a-abb70e435abmr973427866b.55.1739777556866;
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb916db37bsm238238266b.165.2025.02.16.23.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ASoC: SOF: imx: fix a couple Smatch bugs
Message-ID: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a couple of bugs which were detected using Smatch.
(https://github.com/error27/smatch)

Dan Carpenter (2):
  ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
    imx_parse_ioremap_memory()
  ASoC: SOF: imx: Fix error code in probe()

 sound/soc/sof/imx/imx-common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.47.2

