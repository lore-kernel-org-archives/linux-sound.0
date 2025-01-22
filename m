Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F181C3C0B
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530306; cv=none; b=cBTViOQHkMn+369kECSnZUxeQyyNCLX659Ngfa89JSj/cOUh7UjpszoMD5BwHrCkxUS03yZFu2KW7YvEs+hntbi5OCg2BZ5KRwx5R4/xiXI6s5TxpjivwAWYJM5EGaRehxwbArxo5uXiDMoPm3e8Rn9YWGUU+PpVaHhm2cIVj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530306; c=relaxed/simple;
	bh=C7yLn9wmLYa6MNBHLQElQWwf14nTWYSZ3JDo51FkLqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+COzSOx10FkXvtmTLew//YiZKOOAnJ0qGZTk5qCBBgznFcuRqAwlCwh/oGP+rT7UlZhhcmnpz9SWRQFxjilP8H8MmIykHe5iUkL5w83UG/kIkfJz72Q6qRvBn2I0E5GGv071R6WIernhtkeJ//i8bo0FzWozEuB3jqY3DrLlZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hg+yR3bN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hg+yR3bN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so47422375e9.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 23:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737530302; x=1738135102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZHWWlJ7YF1iaeXHOnx4VlnIczYN3QFj1IHnYuWVAp0=;
        b=hg+yR3bNxw1oSZPN9A5fQApTxXWBxogL7FygmDlFo8TDjSzsUjs0yYinKDN+EV2oyd
         C+fCh5sgrAc+PsTSrtRFoC+7d8gC0RbKtMT19evcFfAwtmSYYSJxGd5DHwaOAiIhpsr2
         WVKirw5HQhNe6bXJ4pXCCinduAifg9fGUUal+qBSKVKF2wKfkHoG2+41UA9f2sKRm1RV
         dOHRKL9GZOeuooEbm+C09ij7WnV/8H6WA76EgOV10Pbevv3j1USIfapU3DLcRegbrQkM
         WigybvVsPJxOJ+qs1ZAwu22Sa925ACqLrbtm2dJZ9XU071dAGdBL4cqbaTYxZ5At3nzU
         DKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737530302; x=1738135102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZHWWlJ7YF1iaeXHOnx4VlnIczYN3QFj1IHnYuWVAp0=;
        b=rsoJF6fCBxCm3P++oEtFmpDl8JFAVA6TZcmwkQyYJyxyQiLJ3AGisBv5JOPglNHx8O
         d1kfedQf66JjpFm02sx7HbAUQ5pqsMCq9xO34vAGClynHmGi8KDGmFEMtCT504OEGUZ9
         fvOl+Ot1hxUNroH9ehqNhuRhepdDZR/xIbBu0JKEMFo+zPaNRYOBM3nW2rAXZ/IbSEcv
         FFZbogC9fA9VFP/EftUyNLF3YI5Anv83Ej6Ircgyhk3v75EUenu9XdbXlD+fZV1zRoLo
         qvPjFtu1sfVlU8r6fd/JECdS+4+BpinHGSwk9YdTpwgwoiBc4eJCymXMSar975jXJr6d
         0aKA==
X-Forwarded-Encrypted: i=1; AJvYcCXV09kckFUittmENQbkviUA7OiXR+44ZqsKv0QFfUj2PQBeTEGsz7KFucHgg0MdUxQ76Uz15SFjQbhQqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWA+VKfORbiRY3fbo8bRv6LpMb2AjUK536Rhfho8dOP3oILwbN
	Jbo3PwdaEfgYJH9nbBkFRcDBYI+aliIAHZlU1ji/l8fSmaV6Uw4dYLOMvfWcamM=
X-Gm-Gg: ASbGncs3ul4Jqh1h3w0exBLjivKPQB/JQm7pU4nH0rwoZIB68Yc7T4qE1ddEC+tFSAo
	5UIIXiO+smZ9Bo3iuhBefegKDt4Uu5Y2DDg2j40nP0cvfwE2nohpQAmHRipH/0tFu9On6MmLRcJ
	2hopkygg8PXTp6B1mprZlSt7YbjH4hchs1n55uybpQqtDRbuo7ZWeuniGTunrzwOjNLBZIJfCx7
	nV8W1Ok0rkcJuagruFL04Wtjy8nhX1bDHxaxgd12xbYrD002YVB5kfD7+/ZtDREJZMRwWuuvYs=
X-Google-Smtp-Source: AGHT+IHV0Im413NnK9j4Rv1bPwrEAwzM4I+VpQhnifh4EDggNcrGtQejJ3/93F7/BEivIbWCx93eHA==
X-Received: by 2002:a05:6000:1a85:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38bf57a69b4mr19738929f8f.35.1737530301991;
        Tue, 21 Jan 2025 23:18:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b4ecsm15620249f8f.58.2025.01.21.23.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:18:21 -0800 (PST)
Date: Wed, 22 Jan 2025 10:18:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: tas2781-spi: Fix error code in
 tas2781_read_acpi()
Message-ID: <6103e81a-13bf-4eab-89af-f6830c14e14c@stanley.mountain>
References: <cover.1737530177.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737530177.git.dan.carpenter@linaro.org>

Propagate the error code from devm_gpiod_get_index_optional().  The
current code returns success.

Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/tas2781_hda_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 02794fd6003d..eba9c3a3b944 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -447,6 +447,7 @@ static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
 		p->reset = devm_gpiod_get_index_optional(physdev, "reset",
 			p->index, GPIOD_OUT_LOW);
 		if (IS_ERR(p->reset)) {
+			ret = PTR_ERR(p->reset);
 			dev_err_probe(p->dev, ret, "Failed on reset GPIO\n");
 			goto err;
 		}
-- 
2.45.2

