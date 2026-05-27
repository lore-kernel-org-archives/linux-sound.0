Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E63ACEFB
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866021; cv=pass; b=hJ7oaR1hE32fwD6BVMH2qPtMd8E8GxtOVfalhdC8cf2P8XeQ4YYhETbf/cwczTohJJMrGuCBCweTq47lXEx2QgW4AYqcNSknkuuLrnu3YSoy4cNmqSGUbZN6Kn5JUi1GxjBb1qIlLNiYjoKghQMWtSy5Gi1WbYPYQpVieI2gnTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866021; c=relaxed/simple;
	bh=TidELZ202z8VEX557DyBLbabOjBpspQL3YcKMb2p7d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQxc+/Gs+VkFzVJ6J6IVZD7V4dsJIbN5Cvf+ErRkOGz+bLoD78lRlSOIqlIMk7i9c5umiyp2KEDhLPdA+iaG8HOiAQhqsOY7ZvZyZECBe5IzgahXXl4j3E9Uhf27NyqUbz79DoreeJ6raY9ghP596H5Go65dz8EglWCn4784bWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=on/8rGqI; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="on/8rGqI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so3866364b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 00:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866019; cv=none;
        d=google.com; s=arc-20240605;
        b=NbnYq7vSkX/JpuskW2rDgPenbxQuMRcNUMyR2KSES5exMVVoHKfsxPpcNizU5dZpZX
         sW7xWx5eYavzoabYuNUql8pMeqFlKKsUjJR1iXJFdk+fOcwz8ybfsyCFxP+K9Tm+zwkm
         b2BrW39sOwIScvIJHV5A5sW5PZ5kwxVhytWM0wIYj3Y0BLkKX+HQW9j7pvrNx/8e3U3i
         pmwyfYrII4k5uQ0OtSloyo7UVpsqSt3tVWz3Ncgnr9O+vpbFqHgaAfhT1dkio0F7p13V
         GtFcaW9L4N8TGeO2fgHV4Q3AC1zzQ1uSjvWehA+yCe6lZSrwenXl+0hck5GXbpoQSQsi
         TjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        fh=W89k4+CWP6KHUCgsQVWpNYMFCg/mwcYbbNxZ9hlN/MU=;
        b=BlatmSF3zvojdx9+Ixr5tTHtHawetQBV+MbMzXRqXKH7ySc74vN+GLuPkJRndULFse
         8LojKtYz8/bKa15vRPE4YShc47Z7Swp2pZa6oC9miSc4NYY/aW34ja+kYyZG6IHtuBwt
         919oaUD4a9LGO/9IeGieejpgorvqtaYqwtOPvNmFjN7QLbbqyF2RbKZDSvLM/IVlQ/PB
         hYF1H+KByHStCq99W61/t7EZZBs7ltsD1rYgL8dwYcChI7/o2MGzolym9oyJUL8gZ8mz
         3BRBN3Kjbs0/MKiAPB8W5OvT6iFAAnvJLN5S5yDoI88fC9l7kF9AqRjc9ypG1K2axuOh
         THUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779866019; x=1780470819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=on/8rGqInKqdUndgB+A2DT/IxFpakrpUGjo5vps1HeUuJRTaPiHVATN7Bs1o8bN5xv
         XDNRytr1qG5K8GHuPQyE00Qi7u14RNg37b2871fBUm8bZbxwkTi1fDo7jV37MVdDmWXx
         xO/tWfIFPcM/wbrjtrdz+gIenpHaD9u9vInbDbIyImIinnhuGBd9/PjVG6ctwq4jCX5a
         n2cqeC7257B9+q+jF7GADBfpdhL/XnFAVMmzyckkIF0PgPDTR544imoQPEi8CgjuBR0K
         TPHvosGXoSoO8hCsIcDM5HERAQo3EXiNOQSjXzJXIk0wbS1iuQLfSYXHv5nbiXvzd8s3
         QFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866019; x=1780470819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=pKpxPowk5dCYLirUolza0FNUcGC3xSocqiak/q1HFG/lEgZfOBsVP8yTEVZTdMQLBk
         jjA51AwErs7Dkju0wOv31CHnFriZ2TlQKdSgbqroaSnLF1Z5ZDXxrDaXwSF55QwUGVoC
         lcJVEU83XrIfgBIy79egTh4ieL65BcnwJabIgeJjQ11Nm7QgUk08amtW+V6A1TAw1z7v
         ejMXDrb+zDcPqlSNV4gtL5E3kK6NgkdKLSZrMMvIi5fJMlVhlu446J+RS3rWoyVoYrYT
         qunY7uZNdGMiNzsCvIsy+sB5sMtiSxD8c8MzW+xs4dnr0kMUibWqTxVqB6zTJO19D8pW
         yirw==
X-Forwarded-Encrypted: i=1; AFNElJ/l+oQ55QwtVBGFMO3Kd+sIkiBw9+T6cd/ioVeJh+ZENnn0KEU2IJaoVtLY34CGQ9kPfS1YZU+ZSmZRNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1zIe3QG738po5+tikRJtcpYF8vcPE+Jb+O5WLgJ50iulKHXa
	bEbSOUeOZKM6jCjoyNWzvepUfarDdAA1IAuutKbwKd9WVRlFyPwSsNu90W3Wa0jrTkMhPxiNPQv
	yYcrkHeSt0TqQGQ3h9yVtEvHXQhbf/X0=
X-Gm-Gg: Acq92OHHq1FJNHIRa4BwBP9IVfZsFJHa3CZMQa4Q55Oy6fGcu2D4fxoLkOGxhmYGsh/
	NqngsuG+EB2ZVT3ei1T20ZGw3npGLhL6O8O7VwgIP0d8LDUVDLfEpcOiirQoGfSQYqxtzFwawZj
	UCeWM8aP/sFhbg3MiiI8h2Wcye9d9x7B25zkXAxVsg+/GMz3u7j3ZIXmz0xqq1CWGA9pxq6RIGq
	DFnUEp84vuqHs03zhdpovjA5yJ5r9zu84Dd4+BYweYEbyu1ky3gdlbvq+Cx76g6jiL48bnsIYhm
	kU4/+hUKNQ4+Xq7avBU5fQpydJcLphk5UIwtow==
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id
 d2e1a72fcca58-8415f580e40mr19675360b3a.8.1779866018607; Wed, 27 May 2026
 00:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
 <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com> <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
In-Reply-To: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 27 May 2026 14:13:27 +0700
X-Gm-Features: AVHnY4KYe_20mrf-YgFfeTtowuhQHlFA44ow40h-fRG4arohRfrD4-uu8diiShU
Message-ID: <CAABR9nFdvh9nfa03oxFLgD2WUj4LyHP8T77xKno9wjiQZ48h+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi ,

I did some additional investigation into the regmap core functions
currently used by this driver, such as _regmap_update_bits():

https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L3249

and _regmap_read():
https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L2822

as well as the current sun4i_spdif_regmap_config definition:
https://elixir.bootlin.com/linux/v7.1-rc5/source/sound/soc/sunxi/sun4i-spdif.c#L526

Based on the current regmap core implementation, I think it might be
cleaner to leverage the existing regmap suspend protection mechanism:

if (map->cache_only)
return -EBUSY;

This would inherently prevent direct hardware register access and help
avoid potential crashes during suspend. To support this properly, we would
likely also need to enable a basic cache type (e.g. REGCACHE_FLAT) in
sun4i_spdif_regmap_config, since the driver currently
does not define a .cache_type.

A patch in this direction would look roughly like this:

static int sun4i_spdif_runtime_suspend(struct device *dev)
{
  struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

  clk_disable_unprepare(host->spdif_clk);
+regcache_cache_only(host->regmap, true);
 clk_disable_unprepare(host->apb_clk);

}

static int sun4i_spdif_runtime_resume(struct device *dev)
{
   struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

   clk_prepare_enable(host->apb_clk);
+ regcache_cache_only(host->regmap, false);

   clk_prepare_enable(host->spdif_clk);
}

This approach would not only address the current kcontrol-related issue,
but could also provide a more generic safeguard against other runtime
suspend race conditions that we may not have considered yet.

However, one downside is that this solution depends on the current internal
behavior of the regmap core. In addition, if this driver starts using
.volatile_reg in the future, the current regmap implementation may no
longer provide sufficient protection during suspend.

For example, in the first branch of _regmap_update_bits(),
volatile register accesses bypass the cache_only check entirely and can
still hit the hardware bus directly, which could still lead to system crashes.

Because of that, the explicit pm_runtime resume handling proposed
in the current patch may still be the more robust solution in the long term.

Given our previous discussion about making the pm_runtime handling
more consistent between I2S and SPDIF:

https://lore.kernel.org/all/CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com/

What are your thoughts on this direction?
Or would it be safer and simpler to keep the current patch as-is?

Best Regards,
Phuc
